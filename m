Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC285C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 05:40:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1130.1742449232727330286
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 22:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51749bd76b=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5eUrc009323
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:32 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h95g3x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPpkmvehKXqTIBW55N0//cQnmYn2sgFG0LFgweF1IsJA6Gq4o8zqe0IJWGLpXGt0375TnT4Of393Xem9agn1FouIW/Ycnz2GkwogaVqVmFoALolQdLo2svl+r6SVFxJX4XiVHmGGYBtKmnLtFkJo5zX6QVN+rzEp8SGNu+c755Iw4kys4jmJTXsjIZOjvLgmwoC4xo0X2oeaHEtJ4wXxyyigUAayyXXtMxtMvA2BPpvPh2nm6rc7LI/AMQBdre+snKWmu+k8EAgjb/0E8rttRVWaK+mYNK70r66M4llPGmB2bgGpdUhKrzStvjTWZdd6qxsV2/IXNHVxSxEqTRGAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FguiTGTo/XOIQXxJ8TLi8inwVDHlbAoCU874Q1GsveM=;
 b=ETc6vk7BXQOQDzUsPXfDsY99LF8MJW1XeL3icBMeK0bScYS06aUE9i9Dos1V/ADjtSDpmgUyCab8sRMIgej0tXiRTGQrYPcI7ZRf3w/lm82fcN/LC9rxXek9tI4RER85OSxNdHKOARIHGSFuBMczhTUDpLw2LETqoqDBGf1WLMeoE4b8xdpW8W/3KJ3YBzq2MY7EnuB62Ukn7uaPE2xmsda7Lc1F7QVXMHe9k8a8xqrcHfoYqod7CEUzSTovFtCqtE3bhwKlqCXVzLFWn07Y4Qu6aWqrC9cIuw9SgOYLFMcvfPvqd8W1OH+5+eouErG5e8e/iX+2H77BlO6Qivfu+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 05:40:27 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 05:40:27 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][kirkstone][PATCH 2/4] xfce-dusk-gtk3: fix do_fetch error
Date: Thu, 20 Mar 2025 13:40:07 +0800
Message-Id: <20250320054009.838158-2-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320054009.838158-1-haixiao.yan.cn@eng.windriver.com>
References: <20250320054009.838158-1-haixiao.yan.cn@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d36ba22-7492-4616-61dc-08dd6771b831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FUSX703pfM0f+SuM7VqcTe5yNoqFBEuTcoDn9uAY0gb76eM9b4/frksfZZOD?=
 =?us-ascii?Q?02OnHlQrHIikMcfy3tSGgY7sXWy9rP5g5E3/Sd/EwxcG+TXVyZfzKQsH/B6S?=
 =?us-ascii?Q?SoiisPf8taaRlXfs/IKloCfEhPWJEb8q1janumXJUi4O8nfky+O3N5AU48J4?=
 =?us-ascii?Q?d8TuqA/GFkZo5D83FI68/KQYvNLls7OFHWkMo8ANLKCOqIG3aM2j71xqjdXU?=
 =?us-ascii?Q?l3z3jL1sbSzaZuBJAlRfziNvAChx6IbWrF8Dui/c6/4cG+a7mNnz8hSZCcv7?=
 =?us-ascii?Q?bPK9r6gR02zlCBPe2pboDVjDjCCqvDWUw4sll4olunrkD/LFShSyl7M6Ubre?=
 =?us-ascii?Q?bCpsKSE+ZjJQ1rLJ6fC/M0IlFpFyTApPAPLaKMEST+sbD0AA14jEJq0D1k01?=
 =?us-ascii?Q?jArxgnEyRHiaGh1uW/1VvpBwkM6kG1Tuzqyj6tHBFcRLJkmpAsWQpUj2WOET?=
 =?us-ascii?Q?zcUZxDi5jtb0t+WUxu6a0mlYf2W4C2AAvDyJ4tWyE6c2qdu1SkgNjZnQyjAw?=
 =?us-ascii?Q?TP3bMalXtsZnSDSdfHpJnfGF5BLM8+4x1ikNBKFTb+kvT6c6rY3C+ji+wJBc?=
 =?us-ascii?Q?ygoiFU1yWq5qZjmbB97krOYuN4xDBBplFeS0XA3XuO1DESt+clheWUZ3ocy2?=
 =?us-ascii?Q?ucZ9OOeXrPGUU8sz9tGBgYZuDXHq3AzB3iKvSV98xsmRlscHgBu0n/U+cqiW?=
 =?us-ascii?Q?miBHbpHreTauEiIBfeDhE+MAsGAwTMHPZA4DjX3uSC6Wcg6DXQ7WowGHQirq?=
 =?us-ascii?Q?HNsSrekAo/q7Ko6RIiOtTgylgXocdxLagijZthJSwM59RUTRyFClCTNxVAEH?=
 =?us-ascii?Q?Aj282ti8Q60TYXKwDBiX3O6ZGOqNmGNJ+4O3wsyMlnpv9yHXxLo+BQUvWZ4H?=
 =?us-ascii?Q?Ne0rHYYzWRTzfGMQ+8tTUcTOLLpiss3KDR3IKsogRmOng3Hv9Yy65EsfoQAU?=
 =?us-ascii?Q?mZHTjVNx94mo0V013fnQi91lCXHWEUuKhQvp4FfmrYzpoGBL8SDXD2Gpomjq?=
 =?us-ascii?Q?U5FI5EZRa/TpvQhOFd+ywPw1WNH89iyH+TWChSBHjJFnzGk60+193VF1Y8Wa?=
 =?us-ascii?Q?ZenPeRPGBO3fPnZE4QpDOf0CaeubgEDelpz2Y3CwapzlGMPW3uNCXvW8HqtM?=
 =?us-ascii?Q?8oPNdI8A/8FSP0UT0sopDbyaj10eRo9SRoNA88NabviYyrh8ZLzAgVko9C1o?=
 =?us-ascii?Q?noPpzFGhB8AVZjqC+bklcAJN1kRIJEp/VMFz9B0Hv/QTvWVWrHkaJt81kclj?=
 =?us-ascii?Q?o8pfK/8hiXKEWDNc6DbePMMeR2+L1dHMw0K2wPnsKxUQwmKd3pa87LBEsPXw?=
 =?us-ascii?Q?GxfMssdQkTgvhJgJbRzX/QKVveWNxMVGF++fdrwAN8mnV6ldT+Pl4G28YDNJ?=
 =?us-ascii?Q?BCc/wU7dV7fNuI60LAZeXgpXRqn4KP9k8A20TwgpRw4YE1ppTg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BCOA7EJ0Ll2a2JIqacL/5JJd/vNQ9DPDLk7+YOogbg4xcuTbM+XsHixbdQVd?=
 =?us-ascii?Q?dSe7HQHBqHe9dloTr5jEA9U4TDzK+ZAzwpRlvEx2NO/7O2y1AFSI/ckUliml?=
 =?us-ascii?Q?xVC2YKJmVzL0L4CAdRVTKTR6tS1hLFHFM/mNPg6TXCnZ5De8feAavJv0Lfpp?=
 =?us-ascii?Q?BEow5XfzdAMnI0LYO3QmJHs+onH8VNLnLIMEuqsgN5YEl6sOYNxEmclfx8Vi?=
 =?us-ascii?Q?raWbTDWT4ezrWu09jhRgMwD+LVITrYxwPeBw6nWvq8J4hGDCBl09zbZ/z+PV?=
 =?us-ascii?Q?AN36/l3sbSDpLaFXqAsU2HSQyuh9aJvts1GiGYAKHMoJeJMkpQfTsRTzCrS4?=
 =?us-ascii?Q?EkoPOTYB8j0au16t2wmCcFVaTb9A8XemSM35k9qNHd7NnewjP7nZw2ghD4R6?=
 =?us-ascii?Q?RD0HI54xm3Hu7RauERQixDN4APDBTno1TOupmPwpMJ5ZwSguFiC31grxVT3B?=
 =?us-ascii?Q?pc/lIBpHs/zk5FqkQxnSkwf+oQ2PVsObU4Y6XbmWzC3NhDUti5e53HR/m5gh?=
 =?us-ascii?Q?89I0vJtvw2G3IfMIkdbYXXYz5z3PFPCEdFc/BbgYtAh4HOH5SGfUQ4FQNVa+?=
 =?us-ascii?Q?d4t9Spf7rYveO53vuompnUziotwAXuI+9Hpzhcc/CQ8Nv9n4E8LSW6yQGlNi?=
 =?us-ascii?Q?FrKdQ9JSsUjhuIqkC0FdX9mmcFhlN4nExkRdbOte/xskMbJbCW/Gm4j6qF5U?=
 =?us-ascii?Q?JNxuxFjP/DBuFA/v7tRwIcvititjS7tIRZkoFLSvsfkA0JpyXHe6Wo2ndoyO?=
 =?us-ascii?Q?ZU+MdFdmkEIZwV95xtjDbK2aMQV7byrtySHfR8xZIo66fjvEcQuRz/68YItT?=
 =?us-ascii?Q?rlWu0hMWnE1LJwFhtlzEAFXzkuEQvHvD9hz8WjAgn4hqNssUcM6lbBkpoR+P?=
 =?us-ascii?Q?VkpL0Pz4ZBHVFJPoklYbsV2iO+zKtq2btDLE7sWbqYFG+H7U7gtBIHt+iIdI?=
 =?us-ascii?Q?1GUlnwpZGZqZmLWbG/xP0KqkNRTt8soapJ3/sjBnqfGrh6WiM5+g7Zk3fRBE?=
 =?us-ascii?Q?CMKZxLF868ZZIBNLwaCgoOwZ797fTMHjDJgeqFdwzwno66Z73eC8H7lDeCHH?=
 =?us-ascii?Q?MckxP8ZdkY4vGZhBlDVrbN890S1Iyo8pWsUcHmIyRj3NewMKcOw7+CQmCiZP?=
 =?us-ascii?Q?P64E4AjshP4tjMsplMqHckXkU5R+TW+7dMYPanNCfHi5+x8o6feXb6OXN0dc?=
 =?us-ascii?Q?/p/jba8gueUhHmnjpiC9U/cHuOfFoOy3Z792JQxVIuGzXBru/ysUcm717RYu?=
 =?us-ascii?Q?4NmwTRzEisqsaPCTEtKcXito0Hvkgv6wtk3ATWCjz1DELaahykFb/tkWY3bZ?=
 =?us-ascii?Q?I9rqTVYaJpmR7LYBpx1FsHfT7cVgSiy1OZIH2t6GK53YA5+DKtUEiOr8dBwy?=
 =?us-ascii?Q?b2G1okEDLQ8JGYMaerkiZa7t+aqp+W/GXDyQvbGRrm3puWb8SziRAxZESqVF?=
 =?us-ascii?Q?8yVcDTX38ndYVqyUIYyNQjqt3WBX/PkoCH2LtBe8Xy+uX4GR8E6HDlTan7ms?=
 =?us-ascii?Q?4xI2Xfgdz666+ua2j3nXkj0Hf5p/mM7pIWZlblAxwL58T4bYisoAgZv17Jgq?=
 =?us-ascii?Q?3j2NcrklvxY7fRwPOxV8mTsRpR5jY1b37gxgpZXcqwBqQU0LBpjovkKamJLl?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d36ba22-7492-4616-61dc-08dd6771b831
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 05:40:27.7518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFq+w0Bwa6IwpV9Hq0jnAG+raIbE9pYNYqg7JNd4Z1V6NMGDyHW4yy6IAGXm2mjrqqw17dwk13LtdzK9w8ZnneKoCJwA5eiy6wdDRFr5QKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-Proofpoint-ORIG-GUID: bEaGluDa7du9rM5o4SDRBnAgj8KjAKKP
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67dbaa4f cx=c_pps a=n5+7iF7l5R/EKaY7dbRUPA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2MUAHTJp_KMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=dE58a44NwEgix8Y-8w0A:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: bEaGluDa7du9rM5o4SDRBnAgj8KjAKKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=860 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503200033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116117

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: xfce-dusk-gtk3-1.3-r0 do_fetch: Failed to fetch URL http://sources.openembedded.org/141404-xfce_dusk_gtk3-1_3.tar.gz;subdir=xfce-dusk-gtk3-1.3, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4e8c4736ac361f6d2cf9a59074e4f9bbd748c303)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
index 4cbdb4e0831b..280db752aeab 100644
--- a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
+++ b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 inherit allarch
 
-SRC_URI = "http://sources.openembedded.org/141404-xfce_dusk_gtk3-1_3.tar.gz;subdir=${BPN}-${PV}"
-SRC_URI[md5sum] = "b3ad37ad8173b14ec090e60a80e65d8f"
+SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/141404-xfce_dusk_gtk3-1_3.tar.gz;subdir=${BPN}-${PV}"
 SRC_URI[sha256sum] = "bfa8a88607d1a1da5bd0b9e4e075767c54400a3c5a0fae88b619ed71532f30b4"
 
 do_configure() {
-- 
2.34.1


