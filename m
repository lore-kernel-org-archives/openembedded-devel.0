Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061F0C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 07:47:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3384.1740469643710992975
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 23:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41510be863=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P6icU3011902
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 07:47:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8b9jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 07:47:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPAEBp0eyriTQJW3E10c8IgBcI9gAMY9JH0Hoe0sGQne06W2dbcB5yfshzMjVkAVAtbDqQYrM9nS2zXIbwvToK6HNLkN+Y31w1MJhoSGWKtIcPzc47Kloe7H5oQrgBU68Gh48YlLcw/IkUm6Ou9oVdGp54sZwnID+kE+dv5drpg8jIK0YoGiL/L/uOqK0V4SuA+puZq+cuU1EDFdCxrsUWklH0pN/VMJOWcjjkQCr2L3f8StBCLQh6Jw0yyHt4Io2MuAV3pxX2hdn3ro1aCRhQaLj3IJ9AhJ7oLlH9lEc6HvBFmdRTMvIuO/jtP+pmE8TEoysGOr3IM1k0aTKCW2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwK9njc0osWLsMGUY+f0kBVkqsYyYDu7d7Hqpks1W8I=;
 b=WYcpwp4e+qnwlRf/bhvMm8cujLyuYSHDVok7lWDM+/wEYsWXbp6/ScdrfnvAYlUfexo3z+L/N2w8+NETxxL72lulkuqOo0BbavxGdEqe11dOw8OpZJn5RxzeTFTyUVslXJePwGDxDBVcaIJKPYx3/xyqysi4KwbBNuMd8JwIhuQPL/QTDjKdpXt3XkQCP9zsjmJh7h68+ptGsn3UJwjeonIFWMs15MrQX+50Fa1fP+NkqeoNc/EVswBMxMskh4346B9mX7XRt+17qSCwdU0NteTAB+VBBhAx+47Jr9Fd//kR1OxJydTjRqPcQepcDPkdY0Ld8jXz/KljhnROtpVIZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 07:47:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 07:47:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] postfix: upgrade 3.8.9 -> 3.10.1
Date: Tue, 25 Feb 2025 15:47:08 +0800
Message-Id: <20250225074708.1646493-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225074708.1646493-1-yi.zhao@windriver.com>
References: <20250225074708.1646493-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:404:42::25) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 924120e5-f259-4ce5-b166-08dd5570a1fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2nFDLaH1rNEskWVCiuSvK+J748VZxYsa/EGUHwtmlUQ8TYa08RqxmPY91gel?=
 =?us-ascii?Q?jbaKsR3sWXFKuY8Az/6GZvYshDSaep54pEZFVlH+GBTEfWaEqPEpxfdUsC+b?=
 =?us-ascii?Q?W0dcMZKOj2iZQltM7xOrVVZ+xzlBX0Htd1l5Gx4Sb4tSpLAtp5RAcT7M0E8H?=
 =?us-ascii?Q?pJ8Rt27RYlDXLoXVXiixUBRTnn4DIgOL5C5js0e5r2Z/CFYEhtWohBYt5/sf?=
 =?us-ascii?Q?LkeHwvYU/HMvXi9ellEKD0rrMznqZnMYjUYtU5MNV2JIoCgMwME4QgvM5Gym?=
 =?us-ascii?Q?5zLiG9NNvfRNuGPiSfAZvOq/wCLZyQgJrHwbNTmkpeC6JNbctiVqCOd7L6lO?=
 =?us-ascii?Q?mHM2QpbX/O0jn/ZIayIvAfhlY5VR8gZyYXMbsOHgo5BHfzt3LEGk1Uf3A6Os?=
 =?us-ascii?Q?SfVK0AjMCJ+BWvUt8RcQGZE06vsSAcsgbRuYNXQjo+dHEguOspMsy7T6OGiM?=
 =?us-ascii?Q?q23zYaSxd4FOf6z0Bz4ymmWdrWQosxjKNYp6CsXxwbIprjRZjkekm61XpHw7?=
 =?us-ascii?Q?v0/4e8DKK4iniJVH53wBs2Q74rOI9e+RWKtbhHAXtWvwjESyfy2MhvdglJRy?=
 =?us-ascii?Q?aceQWDy4ThZ2KXDGohZ9MHEgFhfDJL8bIswFwCeT1Wo6k1BKL/sWNfgDuonR?=
 =?us-ascii?Q?p42/1yEABGjUHVWK2xjV0CjUSUd04jtR1hBrsSX4NmuBMc+iNvGX1qXJ3NwW?=
 =?us-ascii?Q?yKdazj+SMtTrh/GTFTkGBlnmGrnhAgoE9stf1Ao1n60WG/YSn7c1iBGHHJQZ?=
 =?us-ascii?Q?Ux3naDcxHPpBRRgq30dlwNI98M/gGnAT10uKdtR/mi93QqkZj68FmZ7abSIa?=
 =?us-ascii?Q?i/Ic1PseY3viJmN0LRLdJu7HHlxkp+axJENGlDF9PZLD+/M/jZpcoy4X8nEm?=
 =?us-ascii?Q?5faVtZ05gko8z32KlQEFt9EugOZ1mmLdTmPGIyzjkkeLeHwSUPEBA/jCoxg2?=
 =?us-ascii?Q?TVMzA8pBZ4Nwc4wBr6xtp2D8b65OprYyK//0lFapy4q4H/G4luZHbqNPaya3?=
 =?us-ascii?Q?W+ZAObVWj5Kz/JZQjUCzC1lPxq68vXLxAYMJ+dWccos47ArZYu3bV8/Ya3yg?=
 =?us-ascii?Q?RR2w6dYn3xbBhwCt9WazozkNCGZ5aSEzXTdmiTIo93gEyGmo50qPUjFU2/6W?=
 =?us-ascii?Q?nWU/0hJTOHX9H341rv/yTByAurD8eFsuPtewqn5Q0uSXgNI0uvygWnKUJBL4?=
 =?us-ascii?Q?3ltCFSF5NeOT3rNTmnsyui1/zWsokaKe3WhCXRg/EXgipsE1khHIWMgy8QtO?=
 =?us-ascii?Q?tnWTYHqteJwZ/NFoeN9z0w1+z5EPtzfyJUxPW8yRL86urkOBjT4w0E9u0yDe?=
 =?us-ascii?Q?2IKOnY81bwz/Wol5v4LocRrXOMN19td1AWpBaqzZcBy12BzUiRjGGy/7Q3KI?=
 =?us-ascii?Q?/BgKtObArp5ZmSYIjy0nvUqnwUUPtX2M585NCFBoIEGUzSDRQA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yxJOL1UdjrK6NhsNuRFAlvDjyzqOAjGPBIj4cgBuqNYgHcoePchEszs7t/SQ?=
 =?us-ascii?Q?nqfvGZx5js8Kd/qNSN2b50YouEugd/KoLjERzX6HX54UkeX4hzFK6/g8NtOT?=
 =?us-ascii?Q?6r64sKOsCaEfnp1Dg6DRXc6e5zc3NgdY67Orspk2VEW+sbX/qAoJPOdzghhV?=
 =?us-ascii?Q?RQp7iBDtZUdfnJYcyChQlJGYEWLeWTubunsGoySgO6YXS27yDEr3Y3GPyV9k?=
 =?us-ascii?Q?jJweBzBduXIsDijZZTonOwcpHaX+/EUm4gKmT8Lqsl3l1OIaUU18j6+hz2yr?=
 =?us-ascii?Q?T+/qb7FGIARXjtLX/ow84E04XXxPspcJuucid9xfgHBBat2PFn56sxdzniHM?=
 =?us-ascii?Q?HNdgPhGDGDow7fOrUwEWYyiouPM4hZL5VW1e6JSMAWZ3j97uRMl4MimeoSii?=
 =?us-ascii?Q?jwyA7QccP0UsSchxDI0g2Ju/mlSNzywA8as5wiaQVyzGcvaBrHJKRToddpdk?=
 =?us-ascii?Q?HS0cxUYTPul4a73FeaLyb6QgjwhZdRotOK1afNwVXL2e1px/fwwZy4kHR/S7?=
 =?us-ascii?Q?lSGfGG5fF+N+zsi9l2T5ENLc/6XvD+mkImzjapxmuBQlvfsYSU62Z9pArwae?=
 =?us-ascii?Q?byqXFaGNbfVMxnqxWjdQ8PRxeFpyNmNStHWYRoLnqAFunsQn1LOMSMLRqLhR?=
 =?us-ascii?Q?cV8yUR3GjC+CQlEFRx9bC7yRd+BqxByjZzAOgB9z3IYAuU4+MrVmOWdZvc6Z?=
 =?us-ascii?Q?e8vlKGx1XqETzp5CRYoHh79zd/ifkCK9+lJZeyARV5NVpctWazF5du0lB2E1?=
 =?us-ascii?Q?iLa62haDwYgQjwvassHdZUISvsb7fJrbVNBj+VwvXH29W8uCVoIytrJFK+TG?=
 =?us-ascii?Q?56J+5sNW4v/piDz3ErbsgNAo0Tc75ZvW2Xs53oK8yc54b/5LJl3TNxGitljP?=
 =?us-ascii?Q?ha11VXzJqavP345mXc7LIUUNWupX2BiGmzk2XVOPlB2uLnOLydCbuSOQ7ocP?=
 =?us-ascii?Q?N8mM6xtSz/Jh32e2I3S+owh8fi6T9t0xw2wbfyl3I8ysEQJ96t7HHrkJ+Eqx?=
 =?us-ascii?Q?kE/gw9p49S275mjrf540lYOGC6rZrEBwPYwm2QXxbo3lYRnv5h/V2zRqRw9N?=
 =?us-ascii?Q?Okoxy39+GIjXh29yFU++SzsRShaReTExh7/jJeTsrNxCU7vKRKkkpTPAPyeX?=
 =?us-ascii?Q?ErG/ANSrIW7AnUiB5GAKS1MkNv3bTumB3IoqpcmfLFwppg4xss/ouZhc4+cc?=
 =?us-ascii?Q?FoBnW7zG3PMjKRT3pDPAJP9RQqqv3N7YfUVDcNzIqA6K33m3YJRfHb89RUB4?=
 =?us-ascii?Q?17rn9IlbTVVfIT2xrB3RvHPWs9Ndo8PKxbEc7aoTaSNTFS8G/EIfmd3g9dJR?=
 =?us-ascii?Q?BH3Bdkuc24Rq1iVAekrSJVCOeJG3vVkLsqfydqI+9UMHAMJicjv6tzTuTSfC?=
 =?us-ascii?Q?/7vinTw+nBR45STd4CSAZ7SU/9Ft7GAu/6fWfY2RebPo1nsWFo6gCcBduJbD?=
 =?us-ascii?Q?00bURnr2nolKB4ejVl2ivfM2w+ueip1r8++3vy7kriL67kxeGoXwRVrwQ6qj?=
 =?us-ascii?Q?QuYBwXZXnw56pqAFi028AvttxDE4P1FhLTPfl3sz0z0Q89x2it2Pt460vIC1?=
 =?us-ascii?Q?vErvLdA01/RZULls5kvx24Lv+D66ZtX/74G9WZep?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924120e5-f259-4ce5-b166-08dd5570a1fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 07:47:20.2580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxHM4XgTdWQgqBpepJYewPgnf9DwEzkGOMoaLA6ms/D5+WEMTKlEqZHEisrJE0m+6uDENEnCIGWC9rgBOVWWVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
X-Proofpoint-ORIG-GUID: ldNZ_ebSER7KjmJpSoER7OhQPmciljlr
X-Proofpoint-GUID: ldNZ_ebSER7KjmJpSoER7OhQPmciljlr
X-Authority-Analysis: v=2.4 cv=U+ZoDfru c=1 sm=1 tr=0 ts=67bd758a cx=c_pps a=9T78G36u1E64A7MtQSounQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=gmDo1nssAAAA:8 a=e1GkridNAAAA:8
 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=alEX_NMfVvHkNhAAVuQA:9 a=pRyuB55_OEEA:10 a=XI13B0AtHXQA:10 a=JyCRX03crFIA:10 a=_1svuY_EMdQA:10 a=DmCNEmdWNTAeIjfGWauO:22 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 07:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115563

ChangeLog:
https://www.postfix.org/announcements/postfix-3.10.0.html
https://www.postfix.org/announcements/postfix-3.10.1.html

Refresh local patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postfix/files/0001-Fix-makedefs.patch     | 20 ++++++------
 ...tconf-to-a-variable-for-cross-compil.patch | 32 +++++++++----------
 ...tive-compiler-to-build-makedefs.test.patch | 20 ++++++------
 .../postfix/files/0004-Fix-icu-config.patch   | 12 +++----
 ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 10 +++---
 .../recipes-daemons/postfix/files/main.cf     |  2 +-
 .../{postfix_3.8.9.bb => postfix_3.10.1.bb}   | 23 +++++++------
 7 files changed, 62 insertions(+), 57 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.9.bb => postfix_3.10.1.bb} (91%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index 8c9c13b1c4..785fe87452 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -1,4 +1,4 @@
-From 9000ee4d8bb5c5e0bcc588e9bec86eb56f4285e1 Mon Sep 17 00:00:00 2001
+From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 16:45:54 +0900
 Subject: [PATCH] Fix makedefs
@@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  1 file changed, 11 insertions(+), 16 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 3448c1e..78e0717 100644
+index a740e41..28fb128 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -197,9 +197,6 @@ echo "# pie=$pie"
+@@ -230,9 +230,6 @@ echo "# pie=$pie"
  
  # Defaults for most sane systems
  
@@ -32,7 +32,7 @@ index 3448c1e..78e0717 100644
  ARFL=rv
  
  # Ugly function to make our error message more visible among the
-@@ -492,12 +489,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -48,7 +48,7 @@ index 3448c1e..78e0717 100644
  		    else
  			# No, we're not going to try db1 db2 db3 etc.
  			# On a properly installed system, Postfix builds
-@@ -506,12 +503,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
  			echo "Install the appropriate db*-devel package first." 1>&2
  			exit 1
  		    fi
@@ -63,7 +63,7 @@ index 3448c1e..78e0717 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
-@@ -531,7 +528,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
  		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
  		       then
  			   :
@@ -72,7 +72,7 @@ index 3448c1e..78e0717 100644
  		       then
  			   echo CCARGS="$CCARGS -DNO_EPOLL"
  		       else
-@@ -555,8 +552,6 @@ int     main(int argc, char **argv)
+@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
  }
  EOF
  			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
@@ -81,7 +81,7 @@ index 3448c1e..78e0717 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -572,12 +567,12 @@ EOF
+@@ -644,12 +639,12 @@ EOF
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -97,7 +97,7 @@ index 3448c1e..78e0717 100644
  		    else
  			# On a properly installed system, Postfix builds
  			# by including <db.h> and by linking with -ldb
-@@ -585,12 +580,12 @@ EOF
+@@ -657,12 +652,12 @@ EOF
  			echo "Install the appropriate db*-devel package first." 1>&2
  			exit 1
  		    fi
@@ -113,5 +113,5 @@ index 3448c1e..78e0717 100644
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
index 28199ccdd2..d46efb95cb 100644
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
@@ -1,4 +1,4 @@
-From cb69ffda0c2cbde6acdc8b01c8d5ff78d81a84fc Mon Sep 17 00:00:00 2001
+From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 17:14:58 +0900
 Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
@@ -12,7 +12,7 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  2 files changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 65e7911..40295be 100644
+index a37f89f..17cb64b 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -22,7 +22,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
@@ -25,10 +25,10 @@ index 65e7911..40295be 100644
  default: update
  
 diff --git a/postfix-install b/postfix-install
-index e498cd3..8049f43 100644
+index 563ee27..00d4651 100644
 --- a/postfix-install
 +++ b/postfix-install
-@@ -244,8 +244,8 @@ test -z "$non_interactive" -a ! -t 0 && {
+@@ -249,8 +249,8 @@ test -z "$non_interactive" -a ! -t 0 && {
      exit 1
  }
  
@@ -39,7 +39,7 @@ index e498cd3..8049f43 100644
      exit 1
  }
  
-@@ -266,7 +266,7 @@ do
+@@ -271,7 +271,7 @@ do
      case "$junk" in
      *MAIL_VERSION*) 
  	case "$mail_version" in
@@ -48,7 +48,7 @@ index e498cd3..8049f43 100644
  	esac
  	val=`echo "$junk" | sed 's/MAIL_VERSION$/'"$mail_version/g"` || exit 1
  	case "$val" in
-@@ -454,7 +454,7 @@ template files main.cf.proto and master.cf.proto."
+@@ -459,7 +459,7 @@ template files main.cf.proto and master.cf.proto."
  
  : ${install_root=/}
  : ${tempdir=`pwd`}
@@ -57,16 +57,16 @@ index e498cd3..8049f43 100644
  
  # Find out the location of installed configuration files.
  
-@@ -520,7 +520,7 @@ test -f $CONFIG_DIRECTORY/main.cf && {
+@@ -525,7 +525,7 @@ test -f $CONFIG_DIRECTORY/main.cf && {
  	case "$junk" in
  	"") eval unset $name;;
  	esac
--	eval : \${$name=\`bin/postconf -c $CONFIG_DIRECTORY -hx $name\`} ||
-+	eval : \${$name=\`$POSTCONF -c $CONFIG_DIRECTORY -hx $name\`} ||
+-	eval : \${$name=\`bin/postconf -qc $CONFIG_DIRECTORY -hx $name\`} ||
++	eval : \${$name=\`$POSTCONF -qc $CONFIG_DIRECTORY -hx $name\`} ||
  	    exit 1
      done
  }
-@@ -533,7 +533,7 @@ do
+@@ -538,7 +538,7 @@ do
      case "$junk" in
      "") eval unset $name;;
      esac
@@ -75,7 +75,7 @@ index e498cd3..8049f43 100644
  done
  
  # Override settings manually.
-@@ -670,6 +670,8 @@ README_DIRECTORY=$install_root$readme_directory
+@@ -675,6 +675,8 @@ README_DIRECTORY=$install_root$readme_directory
  SHLIB_DIRECTORY=$install_root$shlib_directory
  META_DIRECTORY=$install_root$meta_directory
  
@@ -84,7 +84,7 @@ index e498cd3..8049f43 100644
  # Avoid repeated tests for existence of these; default permissions suffice.
  
  test -d $DAEMON_DIRECTORY || mkdir -p $DAEMON_DIRECTORY || exit 1
-@@ -841,7 +843,7 @@ IFS="$BACKUP_IFS"
+@@ -846,7 +848,7 @@ IFS="$BACKUP_IFS"
  # the wrong place when Postfix is being upgraded.
  
  case "$mail_version" in
@@ -93,15 +93,15 @@ index e498cd3..8049f43 100644
  esac
  
  # Undo MAIL_VERSION expansion at the end of a parameter value. If
-@@ -861,7 +863,7 @@ do
+@@ -866,7 +868,7 @@ do
      esac
  done
  
--bin/postconf -c $CONFIG_DIRECTORY -e \
-+"$POSTCONF" -c $CONFIG_DIRECTORY -e \
+-bin/postconf -qc $CONFIG_DIRECTORY -e \
++"$POSTCONF" -qc $CONFIG_DIRECTORY -e \
      "daemon_directory = $daemon_directory" \
      "data_directory = $data_directory" \
      "command_directory = $command_directory" \
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
index 1545f21637..6f8e3e84da 100644
--- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
@@ -1,22 +1,22 @@
-From 995bddd9563b1aecca2369f2f9c675f88bdc0053 Mon Sep 17 00:00:00 2001
+From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 26 Aug 2017 10:29:37 -0700
 Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
 
 Its a binary used during build
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  makedefs | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 78e0717..3299eba 100644
+index 28fb128..313b401 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -551,7 +551,7 @@ int     main(int argc, char **argv)
+@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -25,7 +25,7 @@ index 78e0717..3299eba 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -787,7 +787,7 @@ int     main(int argc, char **argv)
+@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -34,7 +34,7 @@ index 78e0717..3299eba 100644
  		   ./makedefs.test 2>/dev/null ||
  			CCARGS="$CCARGS -DNO_SIGSETJMP"
  		   rm -f makedefs.test makedefs.test.[co]
-@@ -823,7 +823,7 @@ int main(int argc, char **argv)
+@@ -903,7 +903,7 @@ int main(int argc, char **argv)
  				  &error) != 14);
  }
  EOF
@@ -43,7 +43,7 @@ index 78e0717..3299eba 100644
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
  			CCARGS="$CCARGS $icu_cppflags"
-@@ -938,7 +938,7 @@ int     main(void)
+@@ -1024,7 +1024,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -52,7 +52,7 @@ index 78e0717..3299eba 100644
      ./makedefs.test || exit 1
      rm -f makedefs.test makedefs.test.[co]
  }
-@@ -1094,7 +1094,7 @@ int     main(void)
+@@ -1180,7 +1180,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -62,5 +62,5 @@ index 78e0717..3299eba 100644
  	rm -f makedefs.test makedefs.test.[co]
  	eval ${parm_name}=\""\$parm_val"\"
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
index a38e783309..0660ee098e 100644
--- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
@@ -1,4 +1,4 @@
-From afef4a9391e6bb1a6c3e73d370f240577ed8b0dd Mon Sep 17 00:00:00 2001
+From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Jan 2022 11:21:54 +0800
 Subject: [PATCH] Fix icu config
@@ -10,18 +10,18 @@ corrupted in any case its just adding -I/usr/include
 to the CCARGS which we loose nothing if its not
 entertained.
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  makedefs | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/makedefs b/makedefs
-index 3299eba..2a76f20 100644
+index 313b401..e5db212 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -826,7 +826,6 @@ EOF
+@@ -906,7 +906,6 @@ EOF
  		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
@@ -30,5 +30,5 @@ index 3299eba..2a76f20 100644
  		    else
  			CCARGS="$CCARGS -DNO_EAI"
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
index b425cf8432..1571aa844d 100644
--- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
@@ -1,4 +1,4 @@
-From 545d4a79b50caa5698622c0c1905ae154197a16f Mon Sep 17 00:00:00 2001
+From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Fri, 12 Oct 2018 12:38:02 +0800
 Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
@@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 20 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 2a76f20..9d5db9f 100644
+index e5db212..b00049b 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -506,16 +506,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -35,7 +35,7 @@ index 2a76f20..9d5db9f 100644
  		# Kernel 2.4 added IPv6
  		case "$RELEASE" in
  		2.[0-3].*) CCARGS="$CCARGS -DNO_IPV6";;
-@@ -583,16 +574,7 @@ EOF
+@@ -655,16 +646,7 @@ EOF
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -54,5 +54,5 @@ index 2a76f20..9d5db9f 100644
  		: ${SHLIB_SUFFIX=.so}
  		: ${SHLIB_CFLAGS=-fPIC}
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf b/meta-networking/recipes-daemons/postfix/files/main.cf
index 22c57485d7..e9f80af15d 100644
--- a/meta-networking/recipes-daemons/postfix/files/main.cf
+++ b/meta-networking/recipes-daemons/postfix/files/main.cf
@@ -1,4 +1,4 @@
-compatibility_level = 3.6
+compatibility_level = 3.10
 smtputf8_enable = no
 
 # Configure your domain and accounts
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
similarity index 91%
rename from meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
index 2c474e4d04..d426b0fe83 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
@@ -28,9 +28,9 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "d0205a11e36d57b640daaa17a7e7166b8abc730d93b1db7e92e32dfb24bbfde1"
+SRC_URI[sha256sum] = "75868db7a8ed252cd3a14c13a3ce383ddd42563160c02027d061202ee36799bf"
 
-UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.8(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.10(\.\d+)+).tar.gz"
 
 S = "${WORKDIR}/postfix-${PV}"
 
@@ -135,20 +135,25 @@ do_install () {
     rm -rf ${D}${localstatedir}/spool/postfix
     mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/${MLPREFIX}sample-main.cf
     install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
-    install -d ${D}${sysconfdir}/init.d
     install -m 644 ${UNPACKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
     sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/main.cf
 
     install -m 755 ${UNPACKDIR}/check_hostname.sh ${D}${sbindir}/
 
-    install -m 755 ${UNPACKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
     install -m 644 ${UNPACKDIR}/internal_recipient ${D}${sysconfdir}/postfix/internal_recipient
 
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${UNPACKDIR}/postfix.service ${D}${systemd_unitdir}/system
-    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/postfix.service
-    sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/postfix.service
-    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/postfix.service
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 755 ${UNPACKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/postfix.service ${D}${systemd_unitdir}/system
+        sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/postfix.service
+        sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/postfix.service
+        sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/postfix.service
+    fi
 
     install -m 0755 ${UNPACKDIR}/aliasesdb ${D}${libexecdir}/postfix
 
-- 
2.25.1


