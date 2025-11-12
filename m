Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999AFCCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13699.1762955074388993236
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D0Q1xKAy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACAnvCT1562238
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=8k87iNkKmbsVyRr0QJ1VgWcNvrdtzJvwGrDIvZrMGWs=; b=D0Q1xKAyH6GO
	cJ0NVVyPetu6jnjZmk0AlIO5K7I5rMUJUcZttW/8WJKIuQNkYzbvhsuKod5BjVPD
	wed1F2NnBIPdSb8lspNvzj/Sxp6yGaowlHsNT/W8yMTVi1dlXtX8SOKT3AupVxBT
	bLKBxgsxeu+k5Bpk60Y5eoxBCD2voITX9fxOSdsv2mrzGSsk4Rztl11xZhuynfuK
	9xaoGmeml11IPjtwXGq8MEQyM81G2UEuxkDG7ZwNw6ob5oR6rW504tJOVVdxI6Bs
	e8FaOfT5cYTM0t30Br4fdAapR+dEwuLklZpEQH8f9Ce1wrocs1UW9hBqm8Eu/vk7
	zp4GJ4wbfw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jmxg6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1qzvwE8w2LhSM9dEoUn+T/5WYgvojxmvhuP5/yxbj271AAi+gy+qjju7P97Cf8M88FFzRkZ2keCbNevjLOveZCSVnwG8uz26C58LaZYlfOiCzdaWybU49YDelAHypMlvi41/5srcZ3B2+A+kYyHpuN+SZ06UJ78eg59Z9mIDi/fghKSwSFbBOdRih6OAnU6dSwntq2Tkx/NFkHVW5uIFSgjvftMayBDXu8RwZu5AxQp82uGX477JcVb5/pdQc4tDftPBVZIEUoXdPW9Z+XOk+OJb6tiKA1woxw98651K6X3S16bS7ufehy2lcGp2JxvN30WVtElsxw/kRtoy8O64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k87iNkKmbsVyRr0QJ1VgWcNvrdtzJvwGrDIvZrMGWs=;
 b=v4J6Y2ks9SGayIsxVjJcIb1D7f4nsqlMFQHSAYjTMOvxjoSZzQG43vxWI85DiNz9tZVHkOxvREHo8Z76IOib9W+nf1IKmnakAMhy6ZAALNEqX2TlhRYtVrZ52VjKK6ksCnst27U1Smb43Dv9oj9vgGHTK6lX8KVljgTjyd5HIFDRUX8/Q6GVYQo0xRSo+D8n9seeHoZ4nA67JlPG5QOO0j63PLQKWYa0qaumKx+BgNnUuTTBclXsRAmav4HowR3iktLyf57oQWYQi5SVUiMnvxkDcZqks1YgFvy90AzcTcXcbRSgPif46lV0i76EHPDW1RNz5fB621Y+OXGkPg2Gow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:32 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:32 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 08/19] jasper: add UPSTREAM_CHECK_URI
Date: Wed, 12 Nov 2025 21:43:54 +0800
Message-Id: <20251112134405.3706508-8-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: d5fe19ba-89d9-459d-1ab3-08de21f19c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qAnVdbNqCPvEbWRTSj8qe+OAj8RVMQ+5gclUNUaypSuJvSiChN7pFpsOf3SO?=
 =?us-ascii?Q?UuPEWw5McEc9aSnCUBTXJkRyHVHTngW07cOT7d6Czrfexmpm6LFkfaOfE4Cu?=
 =?us-ascii?Q?c1Xn2Y2v9tg28ozmk5mq/z3P+uAwQUQF5hU2o9n0+07qLWTroz0oUx0/cgnO?=
 =?us-ascii?Q?/obeCLpitYgWOJ1WsXCvIant4dFbYrtslxQnbqMh3ds3pTEVGxvt2GJuN4+z?=
 =?us-ascii?Q?7Uy8AVr7iqOaPaoiXUc4FKa9PV3pcYYFFBpC/7GElUP+zGrHnvHnCTsGiVAZ?=
 =?us-ascii?Q?ty8nkly50YCAnkKXukyHniTowOD8kyjv3zWV/A7WlPuGGWXZPrbLpKzYhbgA?=
 =?us-ascii?Q?xJ1uQdsQNZQxcgQRxVYRDgd0VlasdVuiA2lrCEscJCLWeWl5B6hP1pMBQE85?=
 =?us-ascii?Q?MP1xbR0oxCNrX8BJU9ifLxpLXe62N0eex2bXjWxqyG/zB4eHxXGJ72+qSIsn?=
 =?us-ascii?Q?kZJ9DMrqsVzgwbaCZem14pdoCbHW0AdtIe2FAaW25q1IHw6MQH6PpLCwc2TO?=
 =?us-ascii?Q?p9VHyQ84/ojz5EEWCOYn34fuacmfqCC7RuxLcJPoOqZVHmcavK7W+ApdzUyi?=
 =?us-ascii?Q?HSam4U3EICFOcaKxQuOYE/sC/h5VBiZmqW8WrP7Doy3q/bG6zmOVKpdmlBQF?=
 =?us-ascii?Q?6YBnSqOzIWiIp9Mt7bqInIgL/PuQel7M9T9zw7s2LUI1kRkZcVFlQHP+obCk?=
 =?us-ascii?Q?Z+cmsrUryFRwR2o7mJb9e6YQlZwGrapnjZGFV1vL/esPV0q9cLzFItrdNven?=
 =?us-ascii?Q?w/1yuxRYleprPD8VTxYUYrPzGK51e4QXbxlkuR6EW592GoxjN9iEHsMTXmXG?=
 =?us-ascii?Q?2LZuCnt1PzmEn1/42AyFE8pLF7iETPuWrjyXxpXNeQRzXyMuTG+j8jpIfVpz?=
 =?us-ascii?Q?aiH+R2oBUx/RlOhB2NTPGg7g+dQTKhk2qa0gbBBJAQqdzlca56+YzDucaePm?=
 =?us-ascii?Q?hNjiBQ1r7xBr2kdFBPLt/eOC6z0S5NQdkVyP6RTwTUKkQikBIX6wl6z/GfEl?=
 =?us-ascii?Q?5GGAF/tXxcRIpw3Gl9LulcZcvpXRL2I9b9EBK6HgY0ZPVeHn1WwixcJ25+7R?=
 =?us-ascii?Q?0ulYKPslfIsTuoShvLwMQ3uCd/Wr9Z/CTfWo0cqcGYhO9gS+xqXvxRbLG0a2?=
 =?us-ascii?Q?efpd1QcgCwct1rBc4p8gWwCrqSc/i2Y4w94HrqEuxReeEycEEO3t+9oy4fzm?=
 =?us-ascii?Q?QokxGp7WdvLAPl3Itb2tutIK6yyDEG6FOaFdn+Azr+PNsWBJyDo+SJbZl/JB?=
 =?us-ascii?Q?lAvK5HMOufg7WZI/IFL69swSXeXxU2j8WuZ07nhfDNoDASCZnq0UVkMNQIno?=
 =?us-ascii?Q?GI+bHzUsPbcQ6OYusHebB0juFf+umIRrvfjn349dZXtenwgwwoV1b+CDfi2f?=
 =?us-ascii?Q?8/WqIC2MKxjqcIaKAQnx4RZ5kh0xGedA7vkksGaawWuRhpAod7Dp9oBZLHpL?=
 =?us-ascii?Q?QjxLf30a49qKcZy5nwiuq5oGuTD4gW0kzEj1gb/Lw82FkcCYgITw5A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1BZJ1Kqtd2mCqNbNImkz4444SZ+c1xp7tICfoWnwqaJNd1q4WZsbVc+VDdHs?=
 =?us-ascii?Q?0eDdtg1/qZ2xG0vhWylRa0bD1vflz233WXzsVSPh+XVQW0vtKpTCh+cn6P+i?=
 =?us-ascii?Q?Jjsg6toWOfqLA5Uvc4GdmZ3CDAB04Laq5d5Oqfgh6alnLc1nB3LOydeGi3Da?=
 =?us-ascii?Q?hoSb1vl9xAVBKDv6bPjdCxJnCOacG9GbU7EXuYKeuTzU4lcjrhH1d1d25Svk?=
 =?us-ascii?Q?7fzNecf2LoGZW6PCX3CdT/hBB4uRvzE3LmcM6f3e5FcKJe/Ttby4lDa0DS8n?=
 =?us-ascii?Q?9Cd2yuoLw9Mwi6n7NLK2cDiiiyj0UjtIkQziTsjgCarR7D/cnzvqBx+QVg+D?=
 =?us-ascii?Q?lEv+lXKAiMfQeM419+7eheBez3PLrc9zOt+MdhWjb0b3UxaemM4somGmk4jT?=
 =?us-ascii?Q?RC9yNFV32nku2cyuZrAnMpFppjnY1N6h2OTKrLXKPYl1/yO2oxrohKWLaJEk?=
 =?us-ascii?Q?lj69zk+Eooo1CrEklYgyOHoTlmDdF54ZI6L2x/SanqJWJZICl67hxDHS56/F?=
 =?us-ascii?Q?2FOVUoFJYi45eSsuIXEqKqTjOfzf04heSS96V29IbRzhKcWNzoHcniu77njb?=
 =?us-ascii?Q?DRw/2duai74c2kUTJ5/bxqp/7nBtBMFlf0HpNlzthy/tff994Xl3iTWD8HNz?=
 =?us-ascii?Q?FZOCetAQUiWumGaf8M6nVWWCqkguXNeCRRa3LP3aoP/meBCIzxSLpC8q4IwH?=
 =?us-ascii?Q?gsMUa+1YT4bgx2tPadeFtGfH1Ob9uvBZKqCPPYS99JriCAAPkmAFDvCfFhBA?=
 =?us-ascii?Q?D7JDGvCSu5pmqs6M+Ul38MgkOs3r+uPrRx/M/cycsBYfyn87rFGsvZxKqM2I?=
 =?us-ascii?Q?SY09fqLrOQz+PjZ/K9+i6RAa8O2/IZYOrX7x+qW+p/OGEFuXrQC7mDgUJJ4K?=
 =?us-ascii?Q?bfyAkP3ccDNgnQ7HcPZFLgYtlO0qCX2taWtkGpDa9TpKjRGcjrzRuTk8Za1i?=
 =?us-ascii?Q?r8avtoaST0zFBMRnKpjJ89vnz3dpFTAZH8ECw5weep/aXTBg0iMSGUBb1h7y?=
 =?us-ascii?Q?rygyN11D3LnOiK05zveWEdpTzLxpgn0G9ZhQkEkd1acbrP5leHG5touBospn?=
 =?us-ascii?Q?1Bx57W/yzEQ9o5gFFvz9K7e4TvpZqxMR1pGfmbG0MD/G7xPOA321aHA+yUAX?=
 =?us-ascii?Q?F4EVyWFyLfoYF1nnmgUYMciyYd9Hhzs39J+Uxua4OKrrIbcUGki7FGEZIZ3c?=
 =?us-ascii?Q?H14xmfGTFaahzN0nFCHJcWLlQ+PAJ/mRitgUdHe3fi+KBAmJr7Bg/y5baOfx?=
 =?us-ascii?Q?9Edrlk1eRiqGItZiEgteUbmFnbbxDsCM7Iuigb+pcQDqjGbY6i305iGWtjYE?=
 =?us-ascii?Q?w/sSKvUW7MfSKbLYphBlxbudaQp2jxhfWuKB370/nh4A6gBkSw3lofe2Ut4N?=
 =?us-ascii?Q?Om44/dGvR4r+/gqxTSzy5dNhEdal6/mRD4949GPwD3PGgAJ1YoGbGvjpnNM4?=
 =?us-ascii?Q?K3xYQMu9HPT9QyoJiiIRYlQY2Gl9Pcs1sg6dqwFcS06jpQwD/p7n3wmjLO9W?=
 =?us-ascii?Q?wn0fKfErk1jmrN2kNapNv/eQ3AO+jMrEKqDU3m92KKVeYd+EFyFXgCfiWVRQ?=
 =?us-ascii?Q?eKx3RzchtM0Zaj7poGbtKHVh50XtW35pwvk/SCYr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fe19ba-89d9-459d-1ab3-08de21f19c13
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:32.7533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzIfDrMSJm3Dt1YjxqKdvQjVLq6P+tgP4GZYNcTdwfJRuued9qMqpXre2tnGPc+I6EaHg5Y/MYHt640ikGSrMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX+nXtldgHsv7I
 Dm2QRnU+bUh5Zu1eLhaXbmEpYel9cmpw+NPyce2fqN4+Rh8O6Vs1vZ4OCHFPG9cy4kfvzKirtyn
 CJx0sDAQndVIX7FLl5EC0YHzr6IOsadmuMGTSmfMv2gmHW3sfnbQ6Klvs1H9Kl7uvfAH9usTviP
 DofGfAMgYSfEM89UiC5ZkC0PCXGuqulH8FyS3eTM2Dqa3ajHHNezkNyJFfMTgrh4n0t1X/SUbxC
 T49avmAVtAPT4Vmzy7p0OjEyj/6YUoP3Qw9L1dlFBDW/CkGPgIxqWsgo/kWouP8mIVAgbxsRsdi
 a0aSj/cat7UGzTV73b8Y1q6LHzDyuH69O1rc3HSe+aZo3JKsZNM3wq1xy00A8mKVTt6ce/ktMi1
 fkNQw4oGORvjZI6Iacep7F9RNjZmig==
X-Proofpoint-GUID: -OGmHfE9LeAw1wfFGpFDRfSCUralWMyp
X-Proofpoint-ORIG-GUID: -OGmHfE9LeAw1wfFGpFDRfSCUralWMyp
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=69148f42 cx=c_pps
 a=cMqFfNUV/FaVxlb8CdtUVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=FbEJrllZh_9rx7jEjwcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121537

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version jasper
INFO: Current version: 4.2.8
INFO: Latest version:

After the patch:
$ devtool latest-version jasper
INFO: Current version: 4.2.8
INFO: Latest version: 4.2.8

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
index dd3cf3fdb6..e00b56ddbf 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae"
 
+UPSTREAM_CHECK_URI = "https://github.com/jasper-software/jasper/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/version-(?P<pver>\d+(\.\d+)+)"
+
 inherit cmake multilib_header
 
 do_configure:prepend() {
-- 
2.34.1


