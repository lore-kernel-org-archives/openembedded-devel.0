Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312E5D5E124
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 03:52:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5374.1731037919155724030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 19:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1042324eef=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A83nEsH019497
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Nov 2024 03:51:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6g5g788-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 03:51:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdQjsn+cxDaU15YT3j4C8Uuy/xuM3p3Mk9kCUb9KoWCXdmngaDv7K2WAmDzX2rtrDirvngnMpoK62gI74/W+nxZER+6zbaTtMbNOhSv+XxTEZkloTB3BNCtpghdYII+sRDvTot2ElxzM4QVq6XhBZFvP4dsYnJkJYuFYBKSfX4X74Qe5xZRwoR2nZGwZcYBJlbl5a0BYCkTm0yNYxk6v5Irhmg3XfrdAAnWAJULIOkLs5oeVNzz2vp4Yy0tfNcpRw9n0zQcVpjxab1f70BmQMZRdG4w5R9J1DvsVs4vxAsGWazdh27g5rXfwqR45/S6We2PgRsAYfQ7iWpDFBujyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZaztWI0lzRnQ3rUUXB0cfq0Vd5LZov8t/cDmaAYlQM=;
 b=WwTjbnMZSbLVGLy2BuTnAzR5EGyr1RXzzid74iEDrAM7zOgqRjwZMaAfb57pq2d3aCQqMib5ygzFACPiKDsggvfY33sudOYGCi4Ap+CzOvgknvzTz1YN5hb1Xp9hTCS04KPXl8D3FCEx/PpsK+UrloZrC0lNaZlkhwp0I/j26K3GspNkIPQCt8ihjJ1qweWmcceFVcSiC+8pxVOm8q8ljfTNtVOBRWBfj305mfFkOmK8bWq8GdpMP5elcgMJ0+8+wk1OZFgilzNIwp8TNwZMT0GSJoy/ATJgGnSCCp/0iWDBvol4NxKPeXF+vdTsZKpAr29GPxtQYxY1eUgYKnFRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 03:51:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 03:51:55 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH 3/4] grilo-plugins: consider opengl distro feature for default PACKAGECONFIG
Date: Thu,  7 Nov 2024 19:51:42 -0800
Message-Id: <20241108035143.2214659-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108035143.2214659-1-Qi.Chen@windriver.com>
References: <20241108035143.2214659-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 622c14e8-152f-440e-2d7b-08dcffa8af61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IV/Vv72a4tuC4MAc5h2V6zewYkBp8ioMUOgrehrMLyrEbALcEHG7JalR4S8u?=
 =?us-ascii?Q?Kz7Ye8YFEXyl9CLENUJ+U+uMN30llhRSCuRvruJ6wDeft0RaP9CW+sydYDac?=
 =?us-ascii?Q?WMdz5bYNYTRAc5zVV22+p5a5AMS2UAn7ByustWyKS6KKJAbi95DwpFVZJYJD?=
 =?us-ascii?Q?1BdT7kQDQ03vhdRAkflTFIbNqxa2Z19EctVm5Wlm+/WNA5o64eWdbChO7yQb?=
 =?us-ascii?Q?bVDw/VB7QkxckJ7/xCM5xkFBtttkbzADxUmMWvrnfnEpCfP/xTv8ehHdauRZ?=
 =?us-ascii?Q?Hj2a4ylFX++lagRxC5/c0d/Zx+1wPTyg4RmoNVsOehSb3AUJmwyCoapaHpx+?=
 =?us-ascii?Q?NoarxWK7MvQ3vOgY6EVxTnbo3NXvAu3+gbSD7ZtpemqZPwS1H1oAV6YBv3rs?=
 =?us-ascii?Q?IPkztiy0N+zCd+2OTs3igg2kOnmVSbNensnZ3ZYny58Ym5AbKycGBBexv+PD?=
 =?us-ascii?Q?YjgLcIkxzkG/vHXzAWKLP/avC5NfPukFm6Y/5k3AJoJIDanntK3fK2mx79KE?=
 =?us-ascii?Q?E+43faYHQXQmlL12wsqYw666Jc6oHYRVRcDm5V0wBpRF0yRqrm48l5p46ciZ?=
 =?us-ascii?Q?2XloQrM45Jkf1e88RdDQ6pTJ1vQ74p34Jpq4E+PRNGTLsVIPU6G6Lm8cJCWV?=
 =?us-ascii?Q?EIZIUPdf+aVj/EV1fBQLnw5z9X5nju0g9w2Fzx5+G37leC9Zczix3O4rHedB?=
 =?us-ascii?Q?aheBS8WlouDFBToaM348hBJUgHPEHpAqu5lQw00bIM1YeIGKxx9A5ZuwNbCM?=
 =?us-ascii?Q?q/y68Jgm0OX/QP50wGs055OTYwwA0MPo8Z6Sqiagbnl+LXqu3Ja053CFGDhS?=
 =?us-ascii?Q?H6Hua6rVgOAnc6TcIDvCLhOokA/yZTsH+k9C9kra1GVvlC0+JTEestLMuRHG?=
 =?us-ascii?Q?38dEvZAmMKeD6W4WvL9h73w7hk5UZw3uSKKGKLD2ZD+P31sOtgnd+kvzsk/k?=
 =?us-ascii?Q?dJZYuhF5q4XBhRptaexeniz7SILxChos4ui1dsQ1Y8Y0yNJ2AAj9X7wUm4Es?=
 =?us-ascii?Q?DqOe8vxYJzFW970xRUmGduYWJYFvz604YkuTwFTEyTvbEJu1Hg6u8DGeZFJb?=
 =?us-ascii?Q?L7/J/HdUYiZ1EeB0tPrPTz7T09KMCtcHFiGRJQDogk4Lh2phQedZPvr5+uNQ?=
 =?us-ascii?Q?SWW6CnLKrf7htpNQMXjy7IMBHHPxnEPgMuUClTlDmLIHE54eAs8+m9fzrCWX?=
 =?us-ascii?Q?1bjvzhV3HIHVebQfvuRS/sicURevktU/Dy9eiLAku+EJ6kcQCoD+yzlHH8Hc?=
 =?us-ascii?Q?ZJBRHvX+ZZcCzZbTC257NrpDyvV2/6emutdsHOdTWfGEevvI/XYy9BHC4FvM?=
 =?us-ascii?Q?7zl6ZHsOHlezOrZwgWwhk5Hb2hDcsh8DkK0R2QDBSB2XIKSgmg1fmBxNv/8G?=
 =?us-ascii?Q?9SDfL1o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rVfUZPzUE7+8KkIRlopWeIpNn1tdN5Qz3X7mgRacu1/hBiA9j5AObIbWj3Hs?=
 =?us-ascii?Q?xTCTLktgocJTZt/00t63x+DitRSYQE1Akn7+qkoz4TXr0hZ9MyARu38d1NTn?=
 =?us-ascii?Q?9XR9TOawrP3jAOp5OhivV31SuBLZqpoawyFjIlULxq/ZN24jbmgYuwNi2oY3?=
 =?us-ascii?Q?sXxqozGNEsc3k914OenRQf0MjfRjAAAXcZj8sDoZA3XRc70Jz9trv6+7ERAL?=
 =?us-ascii?Q?HO+AyW70hF2BqWN3yeHVC/EapMyJQ02wGCR7qTwpbY1kqbjDKq7LrtNcQYZ8?=
 =?us-ascii?Q?KSSjFlwH4iibJdmPM1+TX0lqpo5Z3p4RFUDgyp/E2eG9bdA1azWmmkYhzCLW?=
 =?us-ascii?Q?HmqQfkihAcTb3pdalCB9W6jkMvR2orVe3BF5OY/8wDdd78n/I081yaJQswc+?=
 =?us-ascii?Q?7c7K+Etmk2crqYMxauWpT7kT6DXXjxF7dqlQdic1fb0X6H82QWzn+ORN/yzZ?=
 =?us-ascii?Q?CBLyz7cx8XxlV9BcasXRHW8vI0RaN2hmudGFe47ac8xVeqFTLGxdf65T/fbx?=
 =?us-ascii?Q?m+OlYjoY1KYhIJtyfFrHBAEBzv9zyO6wlV7tUHJ2Xl4mKd7xEXm58XuMPpxj?=
 =?us-ascii?Q?0Cj20eFwzSoQvJCnYVrLRX1Eat31zPFzbJUHNBlxZkazvtWftgYJVLoaG8Rr?=
 =?us-ascii?Q?lBG6QApDgNdHG9QFi2EZ4WmpIXAa8J9vVZH1Z3bRAnlb1hxNV0fJ6HpZFmBW?=
 =?us-ascii?Q?6+asbW4F4Gn71j1em8I9JIdf6lXd7JtrSsg+PuqjwroPbOySNbdxrK1Uk88g?=
 =?us-ascii?Q?IsdzwDUn60EtbToqi6ddPJwO8yd8U0Zx8gc8PLWsW04KCLZbmzC0jRr7Ajio?=
 =?us-ascii?Q?QVdm5JcvxMW3PxcPqEiE61kfeJhTGCwSGcJ3y4aDUQvhhATWScMGJs2luOVp?=
 =?us-ascii?Q?KWL6Kwk8TILQ9G1+NoQg5nqhVRfKYL1wuUFSaDADpS8JMmu2XpEzCM3LfVW+?=
 =?us-ascii?Q?2WVASqBxSVsQ1SuSTun48VSdE74/g1qIgSs2D8ytUeP2vqzO7EzipqCpgVgZ?=
 =?us-ascii?Q?+gV0BCEWjkjbAG6JvjLNxqsPySn/bN6ZqwTgWiHyNJrNw9KLaDGLqe/4pddu?=
 =?us-ascii?Q?9i2jOQhDKxfczHNb/v5OnTZaWLngCXtQdoq0IWMPJZJr7zjFW40J9KBQb0ke?=
 =?us-ascii?Q?qju8/hYPYilPabuvpxl18exklUN/Qrmu8j0D7Qeck4q4RwonzrxWRxG3YP0n?=
 =?us-ascii?Q?HfDoj9VvJPgz8yYtAZyyjVVhI3AOtnwki1OMjj8+wGDePhMn7KtP1QsNxtqJ?=
 =?us-ascii?Q?ZfvNp0inJA0iy7tfb/4I0EeDwQyg1HLNuuCdRjJ0Myru7WuxrUMr/pu0NuP+?=
 =?us-ascii?Q?v914REUHuImD8QVdohF1oNL7tzDKY+BHz2hIpQd+zDCg+wSRcO/5zpb2QYDQ?=
 =?us-ascii?Q?1rNqPQiE+vtRdNxjO64dwB8omRkQQE7k1KJ09dKU39QWjx5BN9LnVD+deUeO?=
 =?us-ascii?Q?0u/GEpTSwH78WBDrU4OR7ODvGqYmniE9+MOgPdyF0nJzIVCEcjVp6dzgDQDH?=
 =?us-ascii?Q?6+vvQzQdFy6VuETG8+9/f66UdxnsfeYH93oVhP6T547TcHihpN/daGtGlTrZ?=
 =?us-ascii?Q?ts0D6m2P99BDDJ++DjQCe3mbSlOSZGumbWTybml+tmI5lJ7WyWy161rLanZg?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622c14e8-152f-440e-2d7b-08dcffa8af61
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 03:51:54.2425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3CXspxLQzz7SNH8VRADJgL97yr58/6mUGO6iurHlklweBprd/7107ra+ZYkkWUaE3OeyeHNM5YuasbMrijazQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
X-Proofpoint-GUID: HPo7mjsvgpy5_XrryXyEwST0iUI8aCAi
X-Authority-Analysis: v=2.4 cv=JoCjr94C c=1 sm=1 tr=0 ts=672d8ade cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=0kH9GZzbElA6t0q07HEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HPo7mjsvgpy5_XrryXyEwST0iUI8aCAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_02,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=595 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080031
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 03:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113762

From: Chen Qi <Qi.Chen@windriver.com>

gnome-online-accounts requires opengl by default, so lua-factory PACKAGECONFIG
should rely on opengl by default.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
index b0516be3d..a1d2262ca 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
@@ -15,7 +15,10 @@ inherit gnomebase gnome-help vala
 SRC_URI += "file://0001-Avoid-running-trackertestutils.patch"
 SRC_URI[archive.sha256sum] = "fe6f4dbe586c6b8ba2406394e202f22d009d642a96eb3a54f32f6a21d084cdcb"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'tracker', '', d)} lua-factory"
+# gnome-online-accounts requires opengl by default, so lua-factory PACKAGECONFIG relies on opengl by default.
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'tracker', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'lua-factory', '', d)} \
+                   "
 PACKAGECONFIG[tracker] = "-Denable-tracker3=yes,-Denable-tracker3=no,tinysparql,localsearch"
 PACKAGECONFIG[lua-factory] = "-Denable-lua-factory=yes,-Denable-lua-factory=no,lua libarchive json-glib gnome-online-accounts"
 
-- 
2.25.1


