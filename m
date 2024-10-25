Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6C3D116E5
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 03:32:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4158.1729827169179060575
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 20:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0028c78f07=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P1uIng022576
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 03:32:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c3r77hxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 03:32:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg8BMIJKP3Tm8pbsTIE/KkEe5u/qLKH3Pq1TV8eKSXa30cFagmr2OkNOQ7HXlx3fFdKfZVg30zBa8eRvp7sxTtGzJ6HPMVAxHJ/rtPhVOVTYT7S1yxa22IesbGpKnwzhsMLcC8MCqpWP6pZid4oMOz0k61oI3+hB1uResBOuasSh4Gvxtr+c9m4dMbl4c4l6F1C6+E64M8YeeNCUwvkphNtixWZjIBnCewZscSdX03fsGt+PwP/cwC6ay9IF/PoEFNw5s/d/7yv4zjonWyV8MWo/CFeN/8ARSH1Uk+PlEgRbbqtLNfS4bBpvzed3AsG9qJL3BynHKNg6Ab/7mOE/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R++bBKtLAvtGbBtkgNkfrvBNK77Ips739qhEfynp27M=;
 b=FoUwxFAn8EEXv5rZMXA44gYzNf0uhMYTarkZPAt5CNCCwaa4IFJVqWKOIWs2uxcWZZjq+mmJnpx7CPloPHsVoX/ldvS57JsNPs0PK5+RNsA9aaXy2v8Yp1q6AVmcaK41J1RVDK1+POE1XhvSlDAHR8eHeANdMG3x89+ccrM4yKIBQO9dNVsVP44UU6akDPBEM1NAjzjYQfBs05q8H3cSQafTawd5H4ct62EP9KUoaEL0r9uzW5CInGsjb3FqmyBidlHU4DwV1HiR7AIPqNHA3jHajKjAl769X0RUcqOEN+kVdezzCoV/uXlA46zQk2TOjv2pg3GGT0m7NZCkCC8Oow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 03:32:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 03:32:43 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] graphviz: remove obsolete and problematic patch
Date: Fri, 25 Oct 2024 11:32:27 +0800
Message-Id: <20241025033227.1477618-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7c1c33-e6fe-4f8a-ea07-08dcf4a5afcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VCVj7aVNzKfLZsy9CiMgVSOqQwzQI9FWFjchB8ZM/ManZXrB8sSqB+E0XBN1?=
 =?us-ascii?Q?jET5E9t8eNPcojjf0TGYNMt/UCPHCM4+Z+HukrZS1PFwPdazeBIUE2HT+eAE?=
 =?us-ascii?Q?TrO2LC5/hWF8JH2bpx4fBbWdkf8f/1Llr5bioGc4BjuYXcOQsDtnZOs1R4Ow?=
 =?us-ascii?Q?DQor74ZxGne2TNpst5pAS7TvIuKZ88fd9ScTlTY1bVzJ0NB1iYt75Xhk4XIS?=
 =?us-ascii?Q?22i1yjVsdDoWnHElozA+b8/s+lt4bxJZC/0+Wu0Sfjm/phu000pAi1hk1188?=
 =?us-ascii?Q?Ux53yhPcZ7RVhlJ36fFJM9Jj3PjhHjRHkpcmSFR9B1Mok/abnfR6gM89Cet9?=
 =?us-ascii?Q?l+HWbnShGwIdzoJKwR6lW8mVOU5fUm1A2TKpGdeAW6CCC+jUKbiL6fMAruXt?=
 =?us-ascii?Q?wAv/6wi6ME8sLOn7IsjEGadUE62raUwIn99xSjKNgcnssNmC0WPlzjde3SKp?=
 =?us-ascii?Q?P0vtjWCjcmMDcoQZq6chMKuylRarwEvIz8Lf8aTJTThQLcuV0m7wpnsE3Y14?=
 =?us-ascii?Q?Uy8vWzBLrqGC2YscvORzPa+g6TFB4MrIDD671D1R1gilEcKlzFXkP/oXX3sw?=
 =?us-ascii?Q?caEHyG5zgJ1m5XmG0DGg6XCUXCraJvwj32sBBMGhbNjXY3qbPogxC+1A2ZsR?=
 =?us-ascii?Q?BM8xsyYCaxC5lcDMXByVfExHjYI2ZgLfYKzL9KM9wAmXgkBl0/MG1Xe8DpCO?=
 =?us-ascii?Q?1xfNvE8qsxbICVX+QeqRlERYd6pVtMvV54QlvfE5yq7IS0yZjWALDUmxVSMx?=
 =?us-ascii?Q?T+rWvXnN59oC4NtpH6NYu/+ixVo/mASkTzPOIlwrmhL4ZVKsJk4i/BkrOP6G?=
 =?us-ascii?Q?XYmwesH5MqsprYEUMwLEBKtVceD5++R0c9hj5N98rKxwm/NSN4zv0lyQcK3K?=
 =?us-ascii?Q?uLNLLg/R8+zXt0Gol8mSaSGufgNXm9o8BfQaJ8cvXuzDJb0LPUefr1AEyKyG?=
 =?us-ascii?Q?xIzKcvFrv2uXIeiSFG8h/zh8FYaU20Yos1hffmjRcvmiIxf50rX2824sbSuf?=
 =?us-ascii?Q?5kkBEyVo7R5SgEGOUecQe9XnFguhcloYB8Cz0vilIsbf9FmMjemhi0cTaijO?=
 =?us-ascii?Q?Vrr/2fts7TMtQoAaxFsV381Y9+mKbXeWew0T5MLiP7Xaxwr5h3hPBpOM9jaz?=
 =?us-ascii?Q?eezInx7cXvVacCC4k8PlJTarJlR4HKzsHVKSrPgGVKpB80tjcDPaeR7nsFir?=
 =?us-ascii?Q?xMba+T6PB2fuBAsswPcTCf6KmEHzzTioDse5Hws+hPlfUNv9fFEf44YOn49j?=
 =?us-ascii?Q?5OIeMXOt/Pa4AYvM9y6zztJE3cMYUGqZNLS161uyzsFhToiqLxtX8TJi5EIe?=
 =?us-ascii?Q?GX837GbGAnqzVo6Tg+R2kg0j?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XNy+rJDXgwLn69L9RIOhQ/MIOKay3O/grVCP5Pu3CWh/xZKVD+jFMOq0skXq?=
 =?us-ascii?Q?EV2hCRo8XUBp4pabh2kpyiMOlPjQWcEgkbOys1g13z/BEUqmETSMwNnYZu3Q?=
 =?us-ascii?Q?oky4KH/m3e7qH8alQ3yZc+6B1Y6QY5yONJZkb/k+gzuxigpZ2jhyU18dnDOc?=
 =?us-ascii?Q?N/b+FuUuSGn0KyHxhF7nGhOHkWHWgjk+JRFF4QgVc1IJiEiqeXKUvbZFHU1R?=
 =?us-ascii?Q?RSfa0YjysNf/7GIKELxufTwrq6Xiip/tiGncRtZOHKsEnSLm7hYM9PuTmUqR?=
 =?us-ascii?Q?t8QzYodtU8uiZVcvoAxfJPWqIr9w7I3Q2r1k3PvEsf7HWylPo68XcwiH4rg+?=
 =?us-ascii?Q?ZwQkAJfWJDnBdKhUmz7oW3V7sAGAGYPMCIZZyUDCcNSWBFVgcwQLjCGOwoKg?=
 =?us-ascii?Q?eBOsW/6An3wHtGmucsk4TuCP6iz+F9Ec7j1B3tYnktYL6eyWcVXbi+Wzt/gC?=
 =?us-ascii?Q?4NOZu3q6cZBc71OhbhueCJ05Dj5SUAZRulWs6OtPblsyRR1e9fp3EcTeYui1?=
 =?us-ascii?Q?sW/dodB3EqqJQJ/Mf6whCfSE9drGkDQQodHaEtMgIB/KsGXSYmqDs+C8L0E5?=
 =?us-ascii?Q?0lXWOkt4b7ofhkJDk4jAZCv0dL8tq7qP5w7Oavky12mMW1knX2/P48BbQwWu?=
 =?us-ascii?Q?U4lJyulrtSQm1mRP47oPzWv1cv2iWoXhKcz1oNYzw5I/dqdXuHfOjJzUA2FU?=
 =?us-ascii?Q?FOVQS/43VtfzvjKDJxG70f6Fh039G+472kDtgtMOFdI6D3zaM+Bk0CyuE3s+?=
 =?us-ascii?Q?YRGHZm7V2xIM212Z4A0wyoaekaljeMQ2d2/aUr/qmPjaua3QlFOS3//M3eKj?=
 =?us-ascii?Q?6uXI0gh105UXIf6z/1MrHi+FkG6B0rWFY067x6BL72QUBl/+OWIyqmxFwdha?=
 =?us-ascii?Q?x5o8bbpNZxt0kj6JF+Iy8OEr8w88VrRDRIkd7lzrSIx64htEeWFb9V9bBJvH?=
 =?us-ascii?Q?J//H6bkq1VnfVkGeX3mcnKeA1c+Tka4l1MXavQ05JRWIDa+NsmQEq1vAJebM?=
 =?us-ascii?Q?pL89v2a0rnsztAyQ1TmGkm5nY/7jIYe7A8F29poDkrxYxxtmHmB2rXxcjXs+?=
 =?us-ascii?Q?ygxwDK5KV3ExsiOPkvAh3yYBkICALFq6460eyoMQ06YsH3516Xo9yiigaIeb?=
 =?us-ascii?Q?15b7BKlyqv85Hpb4fxeuOT8o5OjrOQzl+iE4qsoep2gAziBYcLJ0HYjebZ/2?=
 =?us-ascii?Q?WUkJr/RJDOH5Ysx6SQTSRa8SVbj67LA9iH4vAtXx0zNnb1wmUzI+8Hiw7gQy?=
 =?us-ascii?Q?qILfCRDSsZO/XazcmfjlG22yMXjS4Hkrc14uApHE3qrMLfWitEl/9zivf0Bh?=
 =?us-ascii?Q?gwcm0UuNpEQW7UV6GD6H3B4RVMm6GcGYy9W/dI98g48xI09JXhap2yovceSw?=
 =?us-ascii?Q?/pgq2l8Io1pqDF5kXq4a301nVngNwTNMHThgoSEijbZrouiLOC0VkCzRibHw?=
 =?us-ascii?Q?2byfDaWLmnoV99x6j30pidcZYcH1/wyArJUTevqoeP0VImTTSjuOfTwiV5M8?=
 =?us-ascii?Q?pXX1IdINU7Khhu/eBZF8XkAlc57vfMFhpYOD5gMrDEYy1qpw2H8q79z3t8/R?=
 =?us-ascii?Q?uugCV9HG2gU3amyigidueY9hy8J45zXW+AkIhVjO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7c1c33-e6fe-4f8a-ea07-08dcf4a5afcb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 03:32:43.8120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8uxcpXE5VwtwL0pJdoL6ayyWT7b2kgAH078tSFrX6511O/ShWiUNFAxaQXtYjYYRb/fY9VqfKMYcyuxRO75DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
X-Authority-Analysis: v=2.4 cv=b8Tg4cGx c=1 sm=1 tr=0 ts=671b1160 cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=p0WdMEafAAAA:8
 a=UL3kjTV0WGQri7HG2pUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9_SSP-KFMEeSN1VVZagC8nWIW7CTq_zy
X-Proofpoint-ORIG-GUID: 9_SSP-KFMEeSN1VVZagC8nWIW7CTq_zy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410250024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 03:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113222

From: Chen Qi <Qi.Chen@windriver.com>

Remove 0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch.

This patch is obsolete and not needed because the current graphviz
configure.ac has correct logic of checking use_tcl. This use_tcl
variable needs to be set when '--disable-tcl' is set, otherwise,
things will behave as if no option is supplied and the configure
process will check tcl automatically.

This patch is problematic because its logic against the current version
is wrong. The recipe has already explicitly set '--disable-tcl', so
the configure process should not do automatic checking for tcl at do_configure.

This patch fixes do_configure error when host has tcl8.6-dev installed. The
error is like below:

  QA Issue: This autoconf log indicates errors, it looked at host include and/or
  library paths while determining system capabilities.
  Rerun configure task after fixing this. [configure-unsafe]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...o-be-empty-string-if-tcl-is-disabled.patch | 42 -------------------
 .../graphviz/graphviz_12.1.2.bb               |  4 --
 2 files changed, 46 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
deleted file mode 100644
index dda1d4350..000000000
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 62193e52edfc71283b7bbcd6f590d63251290b3e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Aug 2019 17:51:39 -0700
-Subject: [PATCH] Set use_tcl to be empty string if tcl is disabled
-
-Upstream-Status: Inappropriate [Cross-compile specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am  | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index fe373be..5db5cdc 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -11,7 +11,7 @@ pkginclude_HEADERS = $(top_builddir)/graphviz_version.h
- dist_man_MANS = graphviz.7
- 
- # $(subdirs) contains the list from: AC_CONFIG_SUBDIRS
--SUBDIRS = $(subdirs) lib plugin cmd tclpkg doc contrib share graphs tests
-+SUBDIRS = $(subdirs) lib plugin cmd doc contrib share graphs tests
- 
- .PHONY: doxygen
- doxygen:
-diff --git a/configure.ac b/configure.ac
-index 993a3dd..5e4a1ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1086,7 +1086,7 @@ AC_ARG_ENABLE(tcl,
-   [], [enable_tcl=yes])
- 
- if test "$enable_tcl" != "yes"; then
--  use_tcl="No (disabled)"
-+  use_tcl=""
- fi
- 
- if test "$use_tcl" = ""; then
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb b/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
index 1843091aa..50243da34 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
@@ -20,10 +20,6 @@ inherit autotools-brokensep pkgconfig gettext qemu
 
 SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
            "
-# Use native mkdefs
-SRC_URI:append:class-target = "\
-           file://0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch \
-"
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-- 
2.34.1


