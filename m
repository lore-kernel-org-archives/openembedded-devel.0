Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C569CCFA1E
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 13:40:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24794.1762695654706010073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 05:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OwoHkrCf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3408a6cb6d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DbMjc300296
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Nov 2025 13:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=MAuP5TAWCIfWvT0+w9fNnANLBhdl92EVUXjR+1WhQAo=; b=OwoHkrCfPOOu
	9uGzh2VP5M70kZhFgBwFknWz1tZuXPhkTgusWyx7gefKDIsQiA9HXjfFCTY5/xNc
	FQGR/5XDtmhmi16pUNhH0POP0gKArVJOgf/wDDu65vXvraS2cm31INllnfkse9SK
	kNv8m0IQw/+7rLbpcQ2pAnXnBVEHJRZ13+AZZKmO/I81q9c4BjcZO1Wi7L+WYrWS
	s5nKRq8jbocJE9mPlp8BQftMkxjKqlaV7fsfAtGXrzuiaMM8lO90KQJAK/8agOxl
	4gZ/9guGwBQBJoS56nm/JgxRJum7pJW/xwbuO65y8GB505JljC5Ox0nwei9f1dea
	BE09rPdviw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu90yy1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:40:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2CzMvFJTwD9FXFh2OsbAv9eJThuUXfI3qnuR2/NYlChfmNcpLN+H8GxpKrs9o2weJMswKKUCOqQks2s3WpZL6maLjeemKT6E9dv3+e0KZf79JSv+buc54O0oeJso3qbEvz0B+TxunIgow/VTVRHKRr0E4/rFZpmBQJ73oRhHa+ZBChpn6zvOzWRcM5bgWUCg9B1RjTRmTrzBk8fJCtbVlGtB2ZUnkEve2aoyVTa5ASfrzlAmLH5bTu6ox1mrhxJ/JOQZ3fs6x7oL9EeNLdE4tMiGK2XpAeTVCIOZo8UpMu3yO5yCslEvwZm1fm3H4C68yGf2EgvM2D3KDDDdhiTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAuP5TAWCIfWvT0+w9fNnANLBhdl92EVUXjR+1WhQAo=;
 b=zCND3sY+A/vKmLpBzjoopD3fpSKC8MZC8xJEdYpwnkK4IwkhHklBwmNhhpdOa57qMXymQ6PdSs7M2fRBBsEtbvUY69irCWS8riDgBffnR+Cn/NCbafaJ52v4DYWzr9Z7MvMxIB9JmSh1Rmx7+gWgb/9m/6GSm/qauR61p91IAkosOB4QlryRm84xorFVF9B3/BGvD7BPfXFu12ORFTcdzNpkkwHbDtzBiSLazUz5gFJ0YTFjJdNwR6S8TId57s91FG6a3tv4HWm1NluhXiM0opgKPBzimJIPRPGIFRWlFpm2l5pS0jY+g1F3XzlJ0HUPXv7EUGYu5d3gKZV++UWFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Sun, 9 Nov 2025 13:40:52 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 13:40:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [[meta-networking]PATCH 2/8] netcat: inherit sourceforge-releases class
Date: Sun,  9 Nov 2025 21:40:29 +0800
Message-Id: <20251109134035.2741548-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251109134035.2741548-1-yi.zhao@windriver.com>
References: <20251109134035.2741548-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abd3592-0a9d-4fea-fec7-08de1f959976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vddCn6VhnmezaEfvtIALFTUvs++pjjf6wC9R0hfUE6R4cbYm/ZSxy+INfFS4?=
 =?us-ascii?Q?DBC+N69/ICnt7EY10Cw98/cgkr0oGFF0qA3tCdvOKJit3Bcr8/P2dfmE5UxZ?=
 =?us-ascii?Q?O4B8/KLjIYjfrmYCWFj2ra+V7cB1LdqRpPstyiOs03ZalJZkKomxiZlNo8Bf?=
 =?us-ascii?Q?pGZQJIcGOtJLpz+RIA+bwe9fbbrIhYzKhqnWPk9gpu4jnnoas3OTF2xm6rz6?=
 =?us-ascii?Q?V+zmHbNC41WNo5AnxJuAXEgUf42ZA1EZcCkATQ2od+slYW3xmjQSPxUmLOIN?=
 =?us-ascii?Q?kQyVcsHFcOXZJQsdh2BgLpq3fDKCihwoSaRsS4FBIi/g9seTmUtM1WDQ0NR6?=
 =?us-ascii?Q?k9iyDWxdncnz4IMqDYJ8jiIhjEd7kWbslBSQyqSdsFyBMJ09V5AV4a9uf867?=
 =?us-ascii?Q?nifjTAcMAJa0VVd8K28cPACuR+9mjX7Gxouxc9fe9TstaiL0nboLyO3aSIhp?=
 =?us-ascii?Q?BkC6Q3lM8dgFNz9pTwdiVegeMH6Y4ivs0u+sXt1acppyR9zC0mUPGpP3VclU?=
 =?us-ascii?Q?x2hcphFuolFQK7F/AJspAUtKyzHsW59bZTwP/xi1gc2gTiXpmbaNolbYOkj2?=
 =?us-ascii?Q?Rw0ATtMEjI2hVLv1MJuyPk8wY5KeOJiGp2+GNrrZ63tG/UdR11ZZX+PDydbq?=
 =?us-ascii?Q?45KxBiWyBwF7BUesGC0wseN8SCcjo7AFTD5OnLtxV6siOJfAZhAchZ25QhCj?=
 =?us-ascii?Q?hdwv/fwhcW0cTJ3j3g7F6UUcmBIfh+wRFKx7DkWv1h30a71iPl2r9oUYNPv4?=
 =?us-ascii?Q?G+b92iS7/rEOT71HblMQNFq8rBlpL4V1fpf7fyTlqDWIsONC92DQYrUo6Z/8?=
 =?us-ascii?Q?z39app01+7aT1vtq9l2U0jCoNg9TgbwJGDM91vpFIYKwJ8T7lbGAbWfYyZ1m?=
 =?us-ascii?Q?/G8kKoajkA5V5j/AEjVn6hb3wng1qflCCE19HXMWwZBtgxMdmxJB0cHkLlxq?=
 =?us-ascii?Q?y8mOsNQHmtN/QLuxWtddf7q34nx3YRVLhKZPbtWl23mlvtGw/MyOPWgR7US5?=
 =?us-ascii?Q?RY194Hkq6PnQg2OWEFnZerY4PE/7IF6foIQAhvW9iiMs6/D6CKQ5TivAQYzM?=
 =?us-ascii?Q?jwv0DuG78o+sXLqT7QYyfle26QQu29NHCsHdrqt3H85KRnKvmyMwygTxy7R/?=
 =?us-ascii?Q?J7F7H8R0OjXl6EoworZBnSVcqulDXefVwj+qu3czBSv9cqEL4veI/jibLOe4?=
 =?us-ascii?Q?sr79xij10HYpyGzB6KfXi+c3yRd2f3EMCHo+cLxnbOPZouLft5kAyy9KnwMI?=
 =?us-ascii?Q?iI3rhujSiaFDaJicUV0X+k1/OLEpbrT4BBMNt974Ft1a6u+KnERMMTzItrww?=
 =?us-ascii?Q?/kNyvf0YNjCHtn1GDitdpcDmvQEhfOjGkhUd9oLil3AgM7GshXcQdC6uXsBI?=
 =?us-ascii?Q?KiyKp8LnPgBRT90XJawIz04Ox/b3sHi8V7XzzVdN6mtxajmcOlhIWq1URl8L?=
 =?us-ascii?Q?5uWZQsjDR6omURXXJsE/eRDxRcOR5VQNx8iLiUaDFXu0oJTVCDyZ40hwuhSd?=
 =?us-ascii?Q?tK7427w6C1gFF8UpIIAlJSJ2wyYzAevx+9cw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?msHjQtO2RaEydDlFmndxODXl/59gizIjRH0GSivK53oB7rqe7znjYCIv8XeB?=
 =?us-ascii?Q?Oe+/haiOud20vYAS4SLd7kgDdI/rlpRbqMF5VRQ3UiVh2eBvu6pV4kXAV0D/?=
 =?us-ascii?Q?DsReXsFbAlavCFKax8SxyM7WHS2JYcv5OlX3ZQ4Gx/xvZR7NW0bokmJH1NnL?=
 =?us-ascii?Q?9+iV8upFZS4eFDVSZTX8rBwSaGdsZXjxoxKQvYkRSsHPwemBP8vfwDM38Oj4?=
 =?us-ascii?Q?NgI9d0RHQAtLspTwxVwGrmIVl91eGNFyXd1FOmWeqdGtDkom6PoQbO5U9HPD?=
 =?us-ascii?Q?yybmwgYykv9sWeyrPvNtUguv8wBj1LrSyyWWrCmw3NCY7YbpZ+Sd+3EcL+oH?=
 =?us-ascii?Q?TD1seb/D6kf4nf2cGBBVz9w0Sh7QiHtoq/DDijGAxwT1HKY3egj5ZcEg7dOL?=
 =?us-ascii?Q?oWG90GASPSslnr/nDXcbYDrxCFaJg0t2ahihKmoBgA2TZ16aiZoBPHmAA8df?=
 =?us-ascii?Q?aW/X72vZLRSVzccAUVusyLk4LL4rljA7u51yLaVRMryRiUKkn/NK0QYXJnAq?=
 =?us-ascii?Q?swEI4vrBDaHLjfEOptlpKQUiganqT7g7HDVXu5tK4FYLmfB08U0J4fK1Gv5x?=
 =?us-ascii?Q?5eWaFLv18sZHNC0mR4sMlO5iU9plraCW2aro/MhA8tcxICFBVPxF9PAi83Cz?=
 =?us-ascii?Q?h5kDmQ4oCI06WEa6+5Hh+tLSCa/AJlWRH8/29PvyaWIJHzKX1q4tKr7eUbUO?=
 =?us-ascii?Q?I2b0KNaez7W3A1f5ggyJKpU4vw3RTLxIrDmhvy7B3i75NhOOPHhiefUexETD?=
 =?us-ascii?Q?r8IhmZixPdUnfA51mtPxzeWFAKhhSTDfTPJfHnEfY+i0ItITwxCcbZwBeLhs?=
 =?us-ascii?Q?MWrjVk8lkwurNDGg4c15ZogUKYMQ3e1LJ62z3lt4VSETJIEohLD6IqKenHRL?=
 =?us-ascii?Q?T+xGgSxUgmndBU0lBORmh8eOK17ivNOOlZSTT/8hC7Yg7Cz/ZpN83ss1oGNG?=
 =?us-ascii?Q?rT+vMLujMG1rEmEpQKK4gmvW/oWo19ZmnGa9EQtSuicnhb19rmtBjSf2P/M9?=
 =?us-ascii?Q?ZFK5h1y0mM4ZoBW6r/izgLuwCPYmCB0bj+Ga+rl/FT5JjOsoPnW6S7MDQaSw?=
 =?us-ascii?Q?kLLIKJbutycSAaTUHcyfjFfLinW6vpj4F2t2bTm3MqlT2QQDpM58ianhv+FF?=
 =?us-ascii?Q?d+wrTx/yZXkV7SM8aoo5r26mrls750p2nmsfMW75qosfWhs3tUWcUNXGBxPp?=
 =?us-ascii?Q?ghAc1LECBWB/t1aVmnP42n5yWH4A4p7DcNIz/kLrQ4+m9TwDZZ3VzSd1qLIw?=
 =?us-ascii?Q?ZMY+DU10bpEdBgdyxo+H5XCVlYSnEif/t2FIbgIflvPsQI8bbnqNfu0GV+Na?=
 =?us-ascii?Q?6BNaszR0O511sTekZR3fLE3iDywlM4p+omNqpzEWRH41WeFy3cUXw9O6MQOn?=
 =?us-ascii?Q?Pi8fQUQ7rHd/b5Uyr84446vf83GPzak8X3dxN7RkXTA3FdaiGNShKjnTuaVJ?=
 =?us-ascii?Q?you/236cyq+x1Yunbw66XTn0QppzfMwukepewVM1VXJspg4nxxNbJZ+xalhs?=
 =?us-ascii?Q?i3zKtq8pro7ggw1kMaygdZ/vD1ZriIJrPpDcCzQfN5rXLs8sbmwmnX1Zoc7X?=
 =?us-ascii?Q?OYvnhKHn8uBKRWuWJJbbyNQovMGJfCjTSHrHKd1u?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abd3592-0a9d-4fea-fec7-08de1f959976
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 13:40:52.1440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONOXsLXsSsUrNHxx4zoo2ZPXXQcM0+1wycDWp23dXlOxSH2bZ8TFKzOtSFF9F10VRu4v2iZLc2VM7A9rPkiogg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyMSBTYWx0ZWRfX+prUrD3uPqmX
 GNS9umMxDWnJi2pEIpKG7PyOV2nQSfUGFaJVDLg9xrooflcfrmEXSPgzpp8zBXsYNI5SWx9thW8
 /a+vl7xq6tSfd3adKEQUYDvwIaI/yS9qpsXGZXHh/iSwofdS7KZ4KQZnVqSp2SaN6sAMcQOaglG
 SxbmwGOm0gLLVNteHIadiasv4Vei1WVQ41wVk8fseTC1MOlz71V4L5KZHt+b+9Exc3i/bK9dv34
 Y6xtOZZmwwc9VS01U53eD9ceXR8ta6STaX9f9hdx2jhZ1p2PlpjacXwKdrS/jtXQyz3V60CkKQV
 6IXCX5TjwFH6yBtZFYwI5GIgSmYxb0a26LDWyGogR9xns4Kp+jez0vWcsO4r4YOFVuuLPOg4lAI
 uBJowP+AtwA6HygF6wKGAIzz4BpxOg==
X-Proofpoint-GUID: lubjxTt9z1X1OosWBFOWXwGLogqaXDRn
X-Proofpoint-ORIG-GUID: lubjxTt9z1X1OosWBFOWXwGLogqaXDRn
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=691099e5 cx=c_pps
 a=eebb4ZtE0r8msBY2xobl+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=8pUNFJrIbE573HoipDkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121408

Inherit sourceforge-releases class to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version netcat
INFO: Current version: 0.7.1
INFO: Latest version:

After the patch:
$ devtool latest-version netcat
INFO: Current version: 0.7.1
INFO: Latest version: 0.7.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/netcat/netcat_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index fd36aadd7e..4e87645406 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
 SRC_URI[sha256sum] = "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb"
 
-inherit autotools
+inherit autotools sourceforge-releases
 
 CVE_PRODUCT = "netcat_project:netcat"
 
-- 
2.34.1


