Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.61])
 by mx.groups.io with SMTP id smtpd.web10.6126.1611900409477350676
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 22:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mVnXJtmE;
 spf=pass (domain: windriver.com, ip: 40.107.220.61, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moNVccS3gmKnl01pyOHbKJ20UMJhGYmqYUpDHJEE0kAxu8F6BZlaOioPhx8Z1Htyezy9a1oMupMlxCEDXuRZuYQ7ooWg4MA5v00MdPVsupGVpIjR2vW4anSGYkm8k/l5SS/IoalhK5QM6wKJvFir3XxNu+kNZw3lU9kpTutE9CE+Q1YMcbXh952kTXRZ9OswAd5rczQ8teipfKI0xHxP+SmCCUOx3oQ2NXzyUmxS+0ZEZCBbZ+xP2i7sK8o+a1LV/d9b1O5mkgagn7dIm/raKKcR56V0E+asC5gjSz1p6zv34d4sW96y/24sVuqBi3PPCgKM0Hi9i91s+kNWtGa4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxTK6Hf3qo3s4n2XyZCRaK9bRXzAKCbToyT74pfm+ls=;
 b=HcTeKhIcdQg0M4iyYrj8VQYufFbK/Dg+lr2fZifQgpywUhYpTbfIdX8iKpplGo3zTT0PS9w8kNgBFYladF+J6RaOy2fdMiZVPM77GJDYpxggoj35R0/HOWxOUhZjPGMR1Rr3Wcv1/IoplM4MS1tf7XoCaffqStSKoCuBT8Z1qLVezr2+6Nwr15hcpYSxCsjDWOJGUwCkpMymc+nMHLClbDNSdbHl/C13IfMDBOjYXAG7zaRe+s/oFKDoEhLAW1BUAj5r3miw8TcMXHU+RjyNDKSBtviJq935FezJx5QOSH0sBdhcLi3dM27Ku6umtqCw15aYAnUTIb0Gbr8GZmIISw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxTK6Hf3qo3s4n2XyZCRaK9bRXzAKCbToyT74pfm+ls=;
 b=mVnXJtmEb1BWoDBITQVEjJajF2sWfh+55hXIVqCWu6kB1TGgVAvMaA5gppmEzVKB6lscdZ0Gsj6muFE15cTJ4iv9ZnVUykzq96d5ZTmHYtet4mqx/0g4SHNeuW7ZFX8/rW5w3J8ch0aAgeqEbyf7V03UvFIJ+n7tfsz+BoISS9I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB0047.namprd11.prod.outlook.com (2603:10b6:301:68::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Fri, 29 Jan
 2021 06:06:47 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3805.019; Fri, 29 Jan 2021
 06:06:47 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] openipmi: upgrade 2.0.30 -> 2.0.31
Date: Fri, 29 Jan 2021 14:06:21 +0800
Message-Id: <20210129060621.40638-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.112]
X-ClientProxiedBy: SG2PR02CA0099.apcprd02.prod.outlook.com
 (2603:1096:4:92::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (147.11.105.112) by SG2PR02CA0099.apcprd02.prod.outlook.com (2603:1096:4:92::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 06:06:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b504b454-25f6-4b18-8004-08d8c41c0fa3
X-MS-TrafficTypeDiagnostic: MWHPR11MB0047:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB0047A58454263515E07761E2F9B99@MWHPR11MB0047.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m5AmyFw+kJsEuC5iF+7tLcUJ9k4mt6n+Ijpprpg/ZyiKuXgzvC+k0ejnzIrz+B3XzJD6VadZr2H8AGR38XVxi3kfIiCE+aF7A5GKnsGCIubenpH6Kmdc9KQ++ezY+vR3d/MMML6vIXfpl2Q7uk1ZVgSk/x/OyAk+l4k993EZjxtmPSoHxUfnTQ+T4WEFR94jyiZFiJ3W8eL6D2lqJwmFS2UW85NT5oZ6Sh/L+l8j7szK1zqoP/+t7dTgU/T+Ukku1KMAvYwObPSLC/LZHBJVKH/PVIw8gVASakMbMGBBbpMk6hID+eRy1AG5KkGpjaiXy4vv3xEUPlxtWmoh1t3dKpHXQlMQGwzKccLLMg/S5DeZqAs0E06u+p+ekjEDX7CFD7h9gGzUcoOZRr7t7k3blP8bOSqf8bQ4ryFXJZu7/FDS8FQpw3fg/Eo3dCXiQnwvX9OIR/KlK2DMlDkb0HHywwSC0TL6XHKO5yYKwf13WG2bwbyh4557gGOcBwnxFOtGN/KI0HzKgG8DZiLmUV4oLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(478600001)(6666004)(6486002)(8936002)(6916009)(83380400001)(66556008)(66946007)(52116002)(6512007)(186003)(8676002)(6506007)(53546011)(2616005)(956004)(36756003)(26005)(86362001)(1076003)(5660300002)(44832011)(2906002)(66476007)(16526019)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?algWWf2hK9OV0QIy/YKvMoa3L90URXem6Qy3iPgavb8HMJ1IXcw/spbPtPk+?=
 =?us-ascii?Q?vFGtTZ4oss0d5oF8wK1u9y94k8NQ/j19KNgKLujjqnltezSrpYytq7SXZt1S?=
 =?us-ascii?Q?2FAuLn9K4XdmEcRV7mzj+Jrl4Ncuws9mSqYjJZGlQCIq/GWHsNEQQKX4FHiE?=
 =?us-ascii?Q?O4p4apc6LNMffgK5eH9lPs7rECR5gWP9RZ6paErraHV1PEOsVY3rRKHRDrtB?=
 =?us-ascii?Q?tIU/2Wy8uJIdXGDF2ziCDAur3jIUN0YFqw/goQuGD6/Yl/8a1Np7ywe4Rl5x?=
 =?us-ascii?Q?7JReF8SXToaRj1M1CdEBxV8ywsuMZc/1/z3bqhv9n7iNS9UP1HuEL1mK0nAW?=
 =?us-ascii?Q?fzlzvs/YJX2DJGSRwPnXVhLEZa+9J0DWrZb50LXHzcsDxDRAmWkDSEqiwyTN?=
 =?us-ascii?Q?DmvHT0cHxpKuD5oNLzHaq4zVEypU1tHCt+ePjR0ylVofc6tficI4aOz0UpuX?=
 =?us-ascii?Q?g7XA2PtHcIMBSpCDz5vBY7h6CfMMKmdmgy1FlCZdB9MwJkJkesid+1ApW18m?=
 =?us-ascii?Q?GDOq4oHC+SDdXyHm8oEBCfen/E0OJvf3kUQA4Siicq9Cvr336MaB7QZcqyqu?=
 =?us-ascii?Q?J7ci4W0apX1CO5cUFtRyRW6tEQG6RWleT7uSz/804q1TBr81aEyqHzi+5K1C?=
 =?us-ascii?Q?hH8cOqFRS5NaP46HLXM3VeEZGO6lvXFfLIlTEzT0KBjVs226wGVvLd5EWb7P?=
 =?us-ascii?Q?8iVaN0+Z7W6nvuiQYEOZEPa45OcDfxh2yN8vROy1uugfw07mUPzoOhTckpOE?=
 =?us-ascii?Q?zwdCKhv+UrOtcaIuHe6ZAsK9epMm89gpedefxp2m3iUqceRBhuLzg84PBS1O?=
 =?us-ascii?Q?qzFJxO7A3Yhbb1pQG0s9aD2Gki3I6+fe8BXGzDb7Ee6tE2Wm8DgrGh69O20k?=
 =?us-ascii?Q?6jmGPdIffPJYS/e3AnsvFqC3fQnxBzOfs4DTOCKW8lDzapDjIx5L1CqXe4Yf?=
 =?us-ascii?Q?LaPMubuA0tqdB0n5qjkG4UnakyQgnh/HyOvSUFqJHfTDzGrCMqpDySRkdaXX?=
 =?us-ascii?Q?N3Aw8ncBb8rufcAlubL4JUZiAS/jeONX2ByQz6BlUuFR2c9d+QAIU4NjEMyR?=
 =?us-ascii?Q?JIbIniXD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b504b454-25f6-4b18-8004-08d8c41c0fa3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 06:06:47.7976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+AjfhbWTC6wCQiQEJVbL6WG6n2gYgslj8ON+szmGkSgrsoPHH1Mqd9qi1RvziOiT0TL4+4XX0/lvSIqmJLspQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0047
Content-Type: text/plain

Refresh openipmi-remove-host-path-from-la_LDFLAGS.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openipmi/files/openipmi-helper            |  0
 ...pmi-remove-host-path-from-la_LDFLAGS.patch | 39 ++++++++++---------
 ...{openipmi_2.0.30.bb => openipmi_2.0.31.bb} |  4 +-
 3 files changed, 22 insertions(+), 21 deletions(-)
 mode change 100755 => 100644 meta-networking/recipes-support/openipmi/files/openipmi-helper
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.30.bb => openipmi_2.0.31.bb} (96%)

diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-helper b/meta-networking/recipes-support/openipmi/files/openipmi-helper
old mode 100755
new mode 100644
diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
index ce37d5eb2..1aea32eae 100644
--- a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
+++ b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
@@ -1,4 +1,4 @@
-From 6395659ca6d64b20bf78bb640c2cc523d6c1d9c2 Mon Sep 17 00:00:00 2001
+From 5a4abf223d79d4e1a58bbad1e4f2f406c7cab748 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Mon, 29 Dec 2014 18:16:04 +0800
 Subject: [PATCH] remove host path from la_LDFLAGS
@@ -7,42 +7,43 @@ Upstream-Status: Inappropriate [ cross compile specific ]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
- cmdlang/Makefile.am | 3 +--
- unix/Makefile.am    | 6 ++----
- 2 files changed, 3 insertions(+), 6 deletions(-)
+ cmdlang/Makefile.am | 2 +-
+ unix/Makefile.am    | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index d9a941f..21b9531 100644
+index 9cf180d..da46ceb 100644
 --- a/cmdlang/Makefile.am
 +++ b/cmdlang/Makefile.am
-@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
- libOpenIPMIcmdlang_la_LIBADD = -lm \
+@@ -18,7 +18,7 @@ libOpenIPMIcmdlang_la_LIBADD = -lm \
  	$(top_builddir)/utils/libOpenIPMIutils.la \
  	$(top_builddir)/lib/libOpenIPMI.la
--libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir)
-+libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
+ libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir) -no-undefined
++	-no-undefined
  
  bin_PROGRAMS = openipmish
  
 diff --git a/unix/Makefile.am b/unix/Makefile.am
-index 5128839..bd0f897 100644
+index baf0815..80c3d5d 100644
 --- a/unix/Makefile.am
 +++ b/unix/Makefile.am
-@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
- libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
+@@ -11,13 +11,13 @@ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
  libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
  	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
--libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir)
-+libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
+ libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir) -no-undefined
++	-no-undefined
  
  libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
  libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
  	$(GDBM_LIB) $(RT_LIB)
--libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir)
-+libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
+ libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir) -no-undefined
++	-no-undefined
  
  noinst_HEADERS = heap.h
  
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.30.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
similarity index 96%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.30.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
index 4929c4f05..d172083bb 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.30.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
@@ -35,8 +35,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[md5sum] = "8d35f68058ca5359973b4121e1544d31"
-SRC_URI[sha256sum] = "237a9be2a30bde85a88c4ec2759b54eb5b21fede554ffabf8fef1ffac2b42ade"
+SRC_URI[md5sum] = "ce8eb27da016dcad7543d0128fcb3b0a"
+SRC_URI[sha256sum] = "7052f37726ff454b0dcac49f35dd030bc12c9570ca0ba5cd2d17774b8e9d9717"
 
 inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
 
-- 
2.17.1

