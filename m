Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94D4CF649A
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 09:34:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10468.1727516053197433038
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 02:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=900161c346=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S9YBxM002547
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x8s889j8-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAjprxC+8DmOGzXkaDj/pnC+kNCVY8hOxXZc2BWTTuDYZn5Cj/Sp9VZfzUUgWqT4CAofUU+woACHvlvMqwuMfs0BVpKarfgKdhRm9yC6vsgWilWlJKi+umX4HEENJu/F7iPdxILl7kpyIT5kbr09Xc7mnDyVyiidUge1sJkCjeu/9EZPrN9rm5egKtWiETlCZDaIQ+sdkKtsC7YLhlm9wBePYg4PcEWLKswWQYzwrvnuxPQkoanrnjyuZVfaOOoGM57XsVgeatPLLDEKnO/ScGUvzEDuYWW6lSIwdFKYSl+ZDpXIC41t2rX7AvT4r1ikkLPgrXMwJJT+NcFy5tZk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kL1l6Ns8H+x662mz+RYa6PB8POtIJRC47xVww92JhyU=;
 b=AOsmMmO9BAULTKnjb47rh79vSMldXW3WqeY8xUWLO5IdiLQGV8PNRLKemcvVZK8o6g5wDazS5EvvZApFO6QXRmodVfrhbgBkTccuIiX5vu/lBtShEKoesGdjY1rVl96h7MusNvjzvgdHSdhotHy6SNldMzod2FVl1GlECrzRS9jkhvO9HIuKESGS8tY5o/j8hnKGaqPGXHRY5KAoUQ3oFjhYfxw2EZpGCG4HfT3Al+fN7smLpsZDXEKC7OLz2vUAxpoZABsVCcUI8JyF7QMDLOLGbPMlw9lDLg82SYUl3JAbaNTKIv+/eEcuUdJX66NujqEPoy2n8KW+VWORF8TcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.31; Sat, 28 Sep
 2024 09:34:09 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.022; Sat, 28 Sep 2024
 09:34:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/6] fio: upgrade 3.36 -> 3.37
Date: Sat, 28 Sep 2024 17:33:53 +0800
Message-Id: <20240928093356.3992191-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240928093356.3992191-1-yi.zhao@windriver.com>
References: <20240928093356.3992191-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 49becd4f-1324-4a04-9220-08dcdfa0b3fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0arRtqf5B6omESW/ObjtsCtO7pk5ZetRWkWdUcWPbB7ecf0vD43KGscLPss5?=
 =?us-ascii?Q?RBv8w+i6g1o4GhukrGBW557rSq0G1cTFtAiWXvcxGcT/njZwCQCz8tlUZDg2?=
 =?us-ascii?Q?ltV1jAi75RVTaYwyeAgVCW81x5FL9rEa5COF47KKRiYm+nfgAj/cWDRrPe/E?=
 =?us-ascii?Q?hfBAR9XruLDxLVGamIuqHK379+BJZl/pUeoswKeR2ruJdABi6h4IzfWB88q7?=
 =?us-ascii?Q?vpuQhF+SEE8B9DCwO6FSorYN6fngEjwWSei4I5Rq1rfTfKLjf4sY2Sag2Qne?=
 =?us-ascii?Q?ovGNpWf174UWqeyvPeiqly2uhJKCy+I7FeHIYMP4DxOsXK3HYD9MNNJj0GLp?=
 =?us-ascii?Q?HhR6ArtRxtT1DlJqV6Y3qmsFHNv8Zh9rPQXAe+eIELg4YT7sGs0GzIwuAs9s?=
 =?us-ascii?Q?gqOL/5OAbPXiR+uA6Sx9s9j8V4aQIstTE5HYTBZqu3o7cZquzlgPnkXEXH5c?=
 =?us-ascii?Q?H+W8zmWjS4ONSbD+qgCIMLZ2mDchlRyd8pXS/SAwdSj4uIu7ukbB5JwL115H?=
 =?us-ascii?Q?2rlLg5QmnR2BYR5n4C563+HRB9gaOTNhvlqJxSzCSKwcALs9bCx/rbPJ3x7M?=
 =?us-ascii?Q?K1W6/jMf9oyrjo74i2f/1pNSvudQNgBrldPBOISEjAPT3Lx5z9bH/Zo1YRAL?=
 =?us-ascii?Q?j4YMJ5VUYB5A/kEmMcZ1o45qibOgssNXCB9q9AMOvhUkqIz8ydj+Io+iNS//?=
 =?us-ascii?Q?uyQes/aixGpKUVSLtF6uLgp9IXxxp/Hhjv7ssOH1udGd3ils1MZcQiSmzfH3?=
 =?us-ascii?Q?w03utgbtvLjHJjzCPuIvezDV+vVTmbKbWerMRGRimG2PpuPyzMUhe9/khTy8?=
 =?us-ascii?Q?uKRXrMsnuNd0cyk+/q/2y87o2ip81FPtVmAnS52i4GkPJ1K68Dykms4Pwx41?=
 =?us-ascii?Q?4+G/N+iSB0bNcrZrLjDsY9GOB450bFb2D9rYnSk/V10NiIrSf42Y9BK/l5Vs?=
 =?us-ascii?Q?nWVnsw10XULSLfFpUswQbTiR0w8arQFZ8t5bHh3utgA1SvBBZhTaekdVKX/A?=
 =?us-ascii?Q?wltNUd2+wWOpZXiApG+3V1tkRqzBcplQjznPB9PhXXRQmq71E1NdTLQgtuzX?=
 =?us-ascii?Q?zqhGM4VPJ1L+tJU1FPo551igYkikdFp0LKlSpeUX1F7PGKrCmCzCzkWK8rIz?=
 =?us-ascii?Q?R0QvsALheJxRBR1lxjTt0ueEioNDbreQuBlkhe0XYRObDqPjIPVa1uZTWvAF?=
 =?us-ascii?Q?pPcjR1+3LW/bTqOXTrDt3OCAU6+q4x653uQUWl3RUFlq4ldha8R8n6WtKEq/?=
 =?us-ascii?Q?NKp8MIULDCqjqUPdO+tDXuVQ2w45QYDTJZE0lW5U6j9629YFltNEDgBUY0WB?=
 =?us-ascii?Q?1ARcn0iEHeaaWTulY6X4fA/H/vTR3bHLtfH3k2ywaKR9Gw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LZpkhc+uChKFPkcCap1Es0Vju1GwfTe9VR1K6VPximh58JOXPmd5rhDbBfQ1?=
 =?us-ascii?Q?b0+agQzBXeskfMtZ9AWofMeAMNQxDWzGklQeUddrOyKU4YMQalJv5LDfMrYI?=
 =?us-ascii?Q?lGYxClViHCuOYnb0nR341IHR+Ip8th174TVUEWepednKNIR0GXWbwxkK6HRe?=
 =?us-ascii?Q?2O1PbbRTdsr9PCk0D5HevigAEyvH1turTvcPfgRrfOC2lpyp1ykHgthWcWR0?=
 =?us-ascii?Q?KqW2DrX01I2vcce92WscfhCnjamWQHrH42amyZ38tVtrx0RpvnKBmwC/QF6B?=
 =?us-ascii?Q?OiWjJb6cypQCcFnP+LSlK1W1qT+pwsdbhdwtvrl5HzwCiBQ0OF5RTquBX/ut?=
 =?us-ascii?Q?ZNNeuUxVBmBIU7ITafwlw0vHze/EJ50ww6Mm9ry/yIPsPcZT6F5XefHAMlEI?=
 =?us-ascii?Q?TJN64kY/ytT1J1s3+5Q8XrtyUNVwDOQ7Qg2c94v0LrZ5Z8hC9oBBaJPoIEt5?=
 =?us-ascii?Q?b70qKQpJRMIbWaiGo3VIrG9D0yxbKCrfMg6HJSizK4mhcfXNlXDDRrk1rFpe?=
 =?us-ascii?Q?hyLGtzD7z7torraNoh9vN9ZDjkhZaGmF1KFYLeiujhfndJq4InbJCWzkZgVK?=
 =?us-ascii?Q?dAUeCQ7fAjzEmwgAYDN2N0DtCduRXxYOjQdtZHZjFM2G3PeF1kpsNzjJ16Qu?=
 =?us-ascii?Q?Hodt7MrrbnOHVF73jDYNkRGbMoM33Lh1eQxHCS4HhUBo+sXcGHIhElLk4lGR?=
 =?us-ascii?Q?bcjx56AvOFuFKyX6Xd14px7HME/vfcXPBDdfrhFnd2C42ZdPan5J+KFV3v8X?=
 =?us-ascii?Q?CnMVqjGcdHUbW5y+Snnd6ZkjSaxJVEaepDftQGxasQSvUHmTYebfN8Wfdive?=
 =?us-ascii?Q?MaZgdHO9P3JQ3MZxS+4dOjOIk3asu5ECnd9jVGExRurFXoz9dymAwgB/zIF1?=
 =?us-ascii?Q?L1BHu+75AKDBcKGoeqjDAgWgdacaEfdq6Z5kDNIgqwJA8qxBix3bmY5JKiMB?=
 =?us-ascii?Q?vGL7shGhbH4tyxpxeNQeZJq+BjGtYq6Z5ee1Z5AO3dyPIJ9Av819nFQMY4So?=
 =?us-ascii?Q?5/DIwcFHctE92jNPQp7DXA7F1A0PYz64RL2fRSpKWEyZonlg+5vxnoB6ojQc?=
 =?us-ascii?Q?ocUBsZWSHs6ObG/brf9zaVdHAQXNsSEybBGELdGZMuEwDGE8dakK7ZpvhQwQ?=
 =?us-ascii?Q?VUxzfUac8Y8Qyre0tNNLaqALNZCBbM+mkAnB1l8fdTTanB1zHwIfgA6zB17K?=
 =?us-ascii?Q?G5ZFS3NeLf2bwV7Baxz5mtJHp6hCkdjATB29RuySie2Z2LupMcczBf9DUC0x?=
 =?us-ascii?Q?twCECgODhSTEsncatvNWIZCefbC3hHq5QRQ3zQx72pl2Nbo1l8DRciwYI2CN?=
 =?us-ascii?Q?kg5IJooNqzLLgFu+crMmdL0HA4WZIuZidHdJFdl/fQLi3hUbpOxJPI1I7IV0?=
 =?us-ascii?Q?NGzFqXsw4Hy/YfejzbSJq+9vNwd8MnQGN2ApYOxYTTzaSi/FKk7jrgrNJHnf?=
 =?us-ascii?Q?507fESQxvb1VFrzdBq5713IQ84x4gn0GGMwLCBivU7PK/lUFRyNihVZjY4Fq?=
 =?us-ascii?Q?L5jpD9s8goyy1fKAp9WfUUyqNZS5X1ALiPwxhW39fXbgmkG3b2wib01Ps5bU?=
 =?us-ascii?Q?fiYVTR5Z1vFrV5vnAbwONDHA0qE6K3aEECq72Vsi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49becd4f-1324-4a04-9220-08dcdfa0b3fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 09:34:08.9558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCz6hw0124NdmnY6+qAwWb7alDTR7TVk/lYQLpCuxJRUF3YQD+ME8NeKPYOJiUqVVb+LG/bOmp1awLwwBEJSNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-Authority-Analysis: v=2.4 cv=VaulP0p9 c=1 sm=1 tr=0 ts=66f7cd94 cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=5kUejBKRrFmeFv7jZvcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Swk9ez8b0xD0f422Gt-YQWAbuHf8gJ6a
X-Proofpoint-ORIG-GUID: Swk9ez8b0xD0f422Gt-YQWAbuHf8gJ6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=812 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409280070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112536

* Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest stable
  version.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.36.bb => fio_3.37.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.36.bb => fio_3.37.bb} (93%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.36.bb b/meta-oe/recipes-benchmark/fio/fio_3.37.bb
similarity index 93%
rename from meta-oe/recipes-benchmark/fio/fio_3.36.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.37.bb
index a871ed8fe..83c889a8f 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.36.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.37.bb
@@ -22,10 +22,11 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-PV .= "+git"
-SRCREV = "b2403d413ee734e8835539319d8bc3429a0777ac"
+SRCREV = "9213e16d98b0e9d2f8d4f7e760ed0fd45c8960f6"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master"
 
+UPSTREAM_CHECK_GITTAGREGEX = "fio-(?P<pver>\d+(\.\d+)+)"
+
 S = "${WORKDIR}/git"
 
 # avoids build breaks when using no-static-libs.inc
-- 
2.25.1


