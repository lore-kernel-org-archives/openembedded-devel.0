Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75E6E77188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 07:14:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43528.1737011642587012683
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 23:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3111d49cac=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G6diMC021181
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 07:14:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv15brt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 07:14:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAzkmDt/JIsB02nEt1Ex+KrlNTdTyzvQvYFD7aSAn7qOQo3APBMCNj+hLR/yEGAcWMrJapsFMlBPeMOT5BZ+O4YwU0wMJjS8OA41kun9FaO6c6uBLYcd28V19CBq/vJQGwlaK8jMOZET/ZNLmh4xcp67TtBjIQ4ryD7sRhjvBKWUwSY3XSNPE/yTDfLf7cwC19bSFDdipWAGSFgOCzVkWq6tcXYv+Sxeab68aeV0JyUG9BHIwAU4Xc+tsXG+16MuWFC84aqc9mlGCxD/Q4bwIIs8Cnn5mg876FdPANXg8jo9H5z5hl4Hv3WXHM/CIUVF+v9ng5bIKAT9GmynR12VEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cKoehWHd4MRNyPhLjmzsaERArLmHMWYPb3phQDX+KE=;
 b=bnnpuBGrq/rvZGRAy2IUdtzPT0YGZMZSSnQDD6sfhxBWZPvDTtQHoKFrvdN4YYlYRZoynHUTHSpEG+8kFiN2hujxSWD8Te0NI8+ZoLkT7ACfBDa2VflcH6caIS0QBcht1yakYjzAr4QGf4D6EdXJks/eKf+vqS6ZzyT8hfoxUgzwSF+QzIT9aDvvz0NwsiuRBjxu6m3j1tB4wCL/xJJbr0CPz9p6JFYvX4bTkF3YWl+eJp8ZnUjPhuyyg1d+SD9lSrNFwbSUlSFa7Tga/Fh4CQ2nPE+k51x1Xuvv/sKf7e/cyalT26IqlJTybLUFLOFmgZgU7kBfIcSQF4mmut1Y0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 07:13:57 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 07:13:57 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] glade: fix CVE-2020-36774
Date: Thu, 16 Jan 2025 15:13:47 +0800
Message-Id: <20250116071347.2432583-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0329.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::13) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0c74f6-982d-4be2-64a3-08dd35fd5784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jGARzF/ywUhMg6h88cqHt6NRA3WEqU+vBP8rtrftpWy79/SXjquGiAkiu2Ny?=
 =?us-ascii?Q?XpdVAyj9f5NtPaRqBkyLxXgRQrJN0YynyrwHW0rCIw2KHwVOmvQDKKkFG64Z?=
 =?us-ascii?Q?adzYe4dZeQLA/VUpGLx/L38cC8elAdOJiRKFbaUHLyizwJ6otTYGJUmWlUu4?=
 =?us-ascii?Q?SyQ7PXTALqw2GiVWimwHVDv50uKgTtvQ6VecdBrxCI7asxiTBXCdQUvq8tPw?=
 =?us-ascii?Q?1d17UZVs3rglGn4pV42NudJ/p1uVS2b1grnCK+MY7+Iuk5hE17z0MqqCj15r?=
 =?us-ascii?Q?6wgkfQ+c9PoA5s8pjmTpvZYVvTPXtRoJEHdD4fg+GO9X+jbXcPcqiJyYpFZA?=
 =?us-ascii?Q?FONdDlJtwv85bogbUAfDTZq+jrm4aMf0JbXE7hiNQeDqBEPjta21K1HCYf8o?=
 =?us-ascii?Q?PCBnmNId7V9elau7ivnp/47RCh6jTrRN4L7xnBgHaZvo2KkRNMs4EvoLd8xs?=
 =?us-ascii?Q?OmIS6UTDnDt2ygdaVRpufNzKOhv4CPuTRFJqUS8VXaeN1+TYH/vPjLFb1bBH?=
 =?us-ascii?Q?iNO7Sv7EU7w8mITEdyjU6XdzD0dqmW6bgKbuXArxJ/XTEljOKCKdtILqUADy?=
 =?us-ascii?Q?/VGNv7vfBOpwVNv42xJtdKxxB5xpkHZofI+APqNCAJapzsvOu5yyeFAQScac?=
 =?us-ascii?Q?ZyFjTMqJ4v8mLyh/N6HC4TxbSYe6i47Xf7/EJHph1ZiyZJPKt4qaFJCRKoMX?=
 =?us-ascii?Q?l+K28MAJ0OG0MBqUVjn9jxKW21Y4GInp2t6BC+G/TcRP5a/V0ihtsXPeyvx9?=
 =?us-ascii?Q?gvrR8qLt6PrdjaLKRFDM6joWQ86rbm1UrRWANfFaM2//2nzOXZxCmD0mqB6z?=
 =?us-ascii?Q?dtws19kCfMDhR94RLnwSGYrikE/GrNfj8J2uTVgAqHOOw+2vCKU3L69GBgVG?=
 =?us-ascii?Q?SFEcJUG4Bzj/VQuDFOPx6b2GcVIWT2oadvHlsko7uFm2KlzA1gDa9MZvwmGO?=
 =?us-ascii?Q?pDK65VatpTBx3BASJum3+6axHHcKdO7Z9qz/e+To8d1retERKVqiVKgEZXSj?=
 =?us-ascii?Q?3uiu/WDgNnFTLAtLrkMZL/CzTo+fQRfEWuEcO2VhALcH+V8+7iyPPCwgBYsD?=
 =?us-ascii?Q?AoqOizwWhiMBdbEBinLzM7V95XysBfSTC4u8Av008mO+Z+3cVQPmSjnk7cqc?=
 =?us-ascii?Q?xV/EnLYlKEKgN5qZ/WTzl7lcHwGb6Vs4plOX8n/hCYcsZ7sEqpxuoShqhfpA?=
 =?us-ascii?Q?KqUt1+8EHRGe+q0daz8mnKbo8YwJz5BarhW+ApdXGhdn4NN3lz6JGCvXOGm6?=
 =?us-ascii?Q?DmTMjFN8pVX6Ci34E+4etHWyWjKizqJBr7v2V2w3QOy+oQobek8ktSEVfKUo?=
 =?us-ascii?Q?RHi7OlGeO68zUJi6hnclVJlXjf76GODTfLMPnC9BILDB8K2/7QUy9njS7GJp?=
 =?us-ascii?Q?HSioEQRTFkCyjGsl/mxp83IXv/kQjyjuxgQ0hrowsy3VYLYWPQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M93hXY2Q6ssBDcruUjwMI3zZYtDF0K3je8Py7U8GmFEs7gUFKin0/Gw9tRiY?=
 =?us-ascii?Q?OOdZQsLXGHZ+4xYcAwqJUCJijDh0mFws/aN6QBMKP5i2OACkUwCpEAarFkpw?=
 =?us-ascii?Q?XH+EdMI7ABR+SJdyX6LjqJzL7sBcJdN7M1w4lhzCXHg92tj4KGzDbkojhdet?=
 =?us-ascii?Q?1aybDW7n5lITUP66NUVRdrfxdThhP7XYTuSOwqbG16Her4r+IUvmgzMMRD5h?=
 =?us-ascii?Q?DBBhT8bxxBziwl8u0MiKUI/v+g8AkpSoXcoL9EUo6hBzHJzmJ0yao2LQHSCf?=
 =?us-ascii?Q?d3hv2HYQruLQbGM03AANtA2TNohkzyonErO3nudriZOMWJDvUtjI/6iqq49p?=
 =?us-ascii?Q?FkjWzAvlu8peuKlt10id+7Z2oIMRCxSX802sb4bqvY/IzNIVKSqOeQoCwhJr?=
 =?us-ascii?Q?9+vAq8dQVK4wGO9VnKYGt0F1+aI4y29vB286Quvh3Fgh0D0mbfF7B2oxwWi9?=
 =?us-ascii?Q?AvpLiJFQtHreN9yBbYXsP5ml475uNPOXZdgU7F2ZKecX7opz2R47bi3TM3Pd?=
 =?us-ascii?Q?2Cz603RNEJPEu3hxKwb/DmJX3U3cszOYr9wWyWQbcy7asnz52seolhScARej?=
 =?us-ascii?Q?y6YUUB/iDcnphj+N2JjA+mpOP2ClPWRU1SenWc/fM7RP6pNcY8zXSHmYWlWO?=
 =?us-ascii?Q?B8dRqAtRoSTd2nCz6gyLUbZsmnKI+UFxYbPr2k49c5qf/lIMZZGIJKDZ7tCo?=
 =?us-ascii?Q?gNjnAv7JhCjYMltfo2ppDk6p4zOngr0Qq/fbwA8aNBDbxyE5Z52s0GeSowXb?=
 =?us-ascii?Q?X3RWaGR/c76OGNXoU9UaPljqZBbkOSiy8952MUxIbaKNH6fOapmJzwoKX2Uw?=
 =?us-ascii?Q?XSgm32EIWCH925JwKsn0L7Ef1qLLiAhThw0mTFo4/Y6oxREX7fleTNc79ImZ?=
 =?us-ascii?Q?8gDu3PD9ujNrtvQt4Ia4hoXiy3AlNShNPDmiXIELKWiua24r2qoFx83WibJL?=
 =?us-ascii?Q?bKdTfCM3VbLP8Q4fWSeGacoZuw4XcHJKdIMGk+6Cf0g8DSa8KNgn37hVI5H0?=
 =?us-ascii?Q?2jH7B7aBYge5X2hHUDXVTAvhg+6zt+z4httB8loXJf5B1wAl3CsxND1Xaw/R?=
 =?us-ascii?Q?tmz37aOrWSDy56hErOgeJcHBkTmqJTY1izavOzXzZantuKVBBncBzr4XTLvH?=
 =?us-ascii?Q?4qiAwkCpETUz/m1oOmyhtGIijEIPel4K5o4q7pg9agBun85UpswWeUZ5zANE?=
 =?us-ascii?Q?dWUrapaeFcmc/jyqS8wv3v9RHXkfY1RM5+hf0gjpTQ5pNf0ci+7GNdb+qqku?=
 =?us-ascii?Q?XL1NKUwMWZomQGlp9+9zDPyk/Bfdo/CQ4+mQoe/CVP6+3HfJ4IR8QqfpFPfm?=
 =?us-ascii?Q?mrnepQ9oga4W8VoCiLe4fsTgXrL3bgJ8Zs7o9V3FeaDUcXiBG0DPj7axy9Do?=
 =?us-ascii?Q?uyDxZX0dE+ce/2nKcdWPp5e35UkQIGY7zsTqucszClCFCEBZQ9RI3AQ0LKSq?=
 =?us-ascii?Q?Wjgbxw1pNTBy7y5VroC8IOh+l/ZYpLbNIAvSOEx4HSP/W7zgFUNcQdo0jhy9?=
 =?us-ascii?Q?ZvjhO9/2ianO2IJ38k808OtPQzruTXAJ1TzEVZy8XLDmPvBnEtwiLTWOhOEG?=
 =?us-ascii?Q?h3IbC3IyYWqIr7fASuN+2Bn6KKOnUQ5vwDCpw2ekybJwvDCHlDhLtDCLIH/B?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0c74f6-982d-4be2-64a3-08dd35fd5784
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 07:13:56.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HpOPEtiKCEhA67rMQ+jSOb5kltGff9U1L7hbMragdWOvUaUfWRhOfiBsLKcP97TXLLzjMn3TjeW6OcTmUVsAJSjxV2pjeK7AxLqy4yp/2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
X-Proofpoint-GUID: 642FsIkfZBsidoz415QztXCbkQpCELuq
X-Authority-Analysis: v=2.4 cv=N5zTF39B c=1 sm=1 tr=0 ts=6788b1b9 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=GHR8O2WEAAAA:20 a=n1dRnMMuAAAA:20 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Vw2-W0St5DFLPkctPREA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 642FsIkfZBsidoz415QztXCbkQpCELuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501160051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 07:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114906

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2020-36774:
plugins/gtk+/glade-gtk-box.c in GNOME Glade before 3.38.1 and 3.39.x
before 3.40.0 mishandles widget rebuilding for GladeGtkBox, leading to a
denial of service (application crash).

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2020-36774]

Upstream patches:
[https://gitlab.gnome.org/GNOME/glade/-/commit/7acdd3c6f6934f47b8974ebc2190a59ea5d2ed17]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../glade/glade/CVE-2020-36774.patch          | 54 +++++++++++++++++++
 .../recipes-devtools/glade/glade_3.22.2.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch

diff --git a/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch b/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
new file mode 100644
index 000000000..5049b44e5
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
@@ -0,0 +1,54 @@
+From 7acdd3c6f6934f47b8974ebc2190a59ea5d2ed17 Mon Sep 17 00:00:00 2001
+From: Juan Pablo Ugarte <juanpablougarte@gmail.com>
+Date: Fri, 2 Oct 2020 16:08:23 -0300
+Subject: [PATCH] GladeGtkBox: fix glade_gtk_box_post_create
+
+Some widgets with contruct properties like GtkMessageDialog get
+rebuilt right after they are created on project loading so we need
+to check glade_project_is_loading() intead of GLADE_CREATE_LOAD
+and use the object ad the connect data to make sure it gets disconected
+if it was the object being rebuilt
+
+Fix issue #479 "Glade 3.36.0 segfaults when opening a file"
+
+CVE: CVE-2020-36774
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glade/-/commit/7acdd3c6f6934f47b8974ebc2190a59ea5d2ed17]
+
+Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
+---
+ plugins/gtk+/glade-gtk-box.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/plugins/gtk+/glade-gtk-box.c b/plugins/gtk+/glade-gtk-box.c
+index 0c157a6d..a0252b6a 100644
+--- a/plugins/gtk+/glade-gtk-box.c
++++ b/plugins/gtk+/glade-gtk-box.c
+@@ -58,9 +58,9 @@ glade_gtk_box_create_editable (GladeWidgetAdaptor *adaptor,
+ }
+ 
+ static void
+-glade_gtk_box_parse_finished (GladeProject * project, GladeWidget *gbox)
++glade_gtk_box_parse_finished (GladeProject *project, GObject *box)
+ {
+-  GObject *box = glade_widget_get_object (gbox);
++  GladeWidget *gbox = glade_widget_get_from_gobject (box);
+ 
+   glade_widget_property_set (gbox, "use-center-child",
+                              gtk_box_get_center_widget (GTK_BOX (box)) != NULL);
+@@ -87,11 +87,11 @@ glade_gtk_box_post_create (GladeWidgetAdaptor *adaptor,
+   g_signal_connect (G_OBJECT (gwidget), "configure-end",
+                     G_CALLBACK (glade_gtk_box_configure_end), container);
+ 
+-  if (reason == GLADE_CREATE_LOAD)
++  if (glade_project_is_loading (project))
+     {
+       g_signal_connect_object (project, "parse-finished",
+                                G_CALLBACK (glade_gtk_box_parse_finished),
+-                               gwidget, 0);
++                               container, 0);
+     }
+ }
+ 
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
index c7f98fac9..6da08bd82 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -15,6 +15,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
+           file://CVE-2020-36774.patch \
           "
 SRC_URI[md5sum] = "c074fa378c8f1ad80d20133c4ae6f42d"
 SRC_URI[sha256sum] = "edefa6eb24b4d15bd52589121dc109bc08c286157c41288deb74dd9cc3f26a21"
-- 
2.34.1


