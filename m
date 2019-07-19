Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E65BC7F18A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 09:16:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J9G9Fq008391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 02:16:09 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 19 Jul 2019 02:16:08 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jul 2019 02:15:39 -0700
Message-ID: <20190719091539.100373-4-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190719091539.100373-1-mingli.yu@windriver.com>
References: <20190719091539.100373-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] iperf3: Upgrade to 3.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jul 2019 09:16:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Licence-Update:
  - Copyright years are updated to 2019
* Remove automake-foreign.patch as the logic included
  in the new version
* Rebase 0002-Remove-pg-from-profile_CFLAGS.patch
  to new version

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0002-Remove-pg-from-profile_CFLAGS.patch    | 15 ++++++++-------
 .../iperf3/iperf3/automake-foreign.patch        | 17 -----------------
 .../iperf3/{iperf3_3.6.bb => iperf3_3.7.bb}     |  5 ++---
 3 files changed, 10 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.6.bb => iperf3_3.7.bb} (84%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
index 06eb41ac0..959e29389 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
@@ -1,31 +1,32 @@
-From 6db0e28f906bc3784019dfb5bb011237a8034fda Mon Sep 17 00:00:00 2001
+From 3ae408402635ea21ad90cd722c99ae3334376c91 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 14 Jul 2017 13:00:16 -0700
-Subject: [PATCH 2/2] Remove -pg from profile_CFLAGS
+Subject: [PATCH] Remove -pg from profile_CFLAGS
 
 musl fails to link with missing gcrt1.o
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  src/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 23b0c72..6268145 100644
+index 5be8562..3881aa6 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -49,9 +49,9 @@ iperf3_LDFLAGS          = -g
+@@ -58,9 +58,9 @@ if ENABLE_PROFILING
  iperf3_profile_SOURCES  = main.c \
- 						  $(libiperf_la_SOURCES)
+                           $(libiperf_la_SOURCES)
  
 -iperf3_profile_CFLAGS   = -pg -g
 +iperf3_profile_CFLAGS   = -g
  iperf3_profile_LDADD    = libiperf.la
 -iperf3_profile_LDFLAGS  = -pg -g
 +iperf3_profile_LDFLAGS  = -g
+ endif
  
  # Specify the sources and various flags for the test cases
- t_timer_SOURCES         = t_timer.c
 -- 
-2.13.3
+2.21.0
 
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
deleted file mode 100644
index 06c394e5c..000000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Pass the 'foreign' option to automake to enable iperf3 to build.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Chunrong Guo <b40290@freescale.com>
-
---- a/configure.ac	2015-10-19 02:49:30.471867352 -0500
-+++ b/configure.ac	2015-10-19 02:46:36.207873572 -0500
-@@ -33,7 +33,7 @@
- 
- 
- # Initialize the automake system
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- AM_MAINTAINER_MODE
- AM_CONFIG_HEADER(src/iperf_config.h)
- 
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.6.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
similarity index 84%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.6.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
index 4e11d8233..6686a814f 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.6.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
@@ -9,16 +9,15 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a9a036136b748453e839c0eb8906ef2e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9088fe7ffdccd042f7645f1012d7f70"
 
 DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/esnet/iperf.git \
-           file://automake-foreign.patch \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            "
 
-SRCREV = "88f3ad87f38762081a6d7127890ff5c3a052b06a"
+SRCREV = "dfcea9f6a09ead01089a3c9d20c7032f2c0af2c1"
 
 S = "${WORKDIR}/git"
 
-- 
2.21.0


