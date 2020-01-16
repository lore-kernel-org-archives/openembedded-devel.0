Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C67496BD08
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 02:38:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,323,1574092800"; d="scan'208";a="81932886"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2020 10:38:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AC8F64CE26C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 10:29:00 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 16 Jan 2020 10:38:06 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 16 Jan 2020 10:38:07 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2020 10:39:35 +0800
Message-ID: <20200116023935.27512-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AC8F64CE26C8.AAE5C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] fio: upgrade 3.16 -> 3.17
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
X-List-Received-Date: Thu, 16 Jan 2020 02:38:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-files/0001-arch-arm-Consider-armv7ve-arch-as-well.patch
Removed since this is included in 3.17.

-Refresh the following patch:
files/0001-update-the-interpreter-paths.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ch-arm-Consider-armv7ve-arch-as-well.patch | 28 -------------------
 .../0001-update-the-interpreter-paths.patch   | 13 +--------
 .../fio/{fio_3.16.bb => fio_3.17.bb}          |  3 +-
 3 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/fio/files/0001-arch-arm-Consider-armv7ve-arch-as-well.patch
 rename meta-oe/recipes-benchmark/fio/{fio_3.16.bb => fio_3.17.bb} (92%)

diff --git a/meta-oe/recipes-benchmark/fio/files/0001-arch-arm-Consider-armv7ve-arch-as-well.patch b/meta-oe/recipes-benchmark/fio/files/0001-arch-arm-Consider-armv7ve-arch-as-well.patch
deleted file mode 100644
index 983a76fb6..000000000
--- a/meta-oe/recipes-benchmark/fio/files/0001-arch-arm-Consider-armv7ve-arch-as-well.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2af58909cd9f2862d1dc07836e201361a2cd8d5d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 5 Oct 2019 08:53:22 -0700
-Subject: [PATCH] arch-arm: Consider armv7ve arch as well
-
-Upstream-Status: Submitted []
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- arch/arch-arm.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arch-arm.h b/arch/arch-arm.h
-index 78cb2ebe..4f722967 100644
---- a/arch/arch-arm.h
-+++ b/arch/arch-arm.h
-@@ -11,7 +11,7 @@
- #define nop             __asm__ __volatile__("mov\tr0,r0\t@ nop\n\t")
- #define read_barrier()	__asm__ __volatile__ ("" : : : "memory")
- #define write_barrier()	__asm__ __volatile__ ("" : : : "memory")
--#elif defined(__ARM_ARCH_7A__) || defined(__ARM_ARCH_8A__)
-+#elif defined(__ARM_ARCH_7A__) || defined(__ARM_ARCH_8A__) || defined(__ARM_ARCH_7VE__)
- #define	nop		__asm__ __volatile__ ("nop")
- #define read_barrier()	__sync_synchronize()
- #define write_barrier()	__sync_synchronize()
--- 
-2.23.0
-
diff --git a/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch b/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch
index 327b9f5b7..c9c3a08df 100644
--- a/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch
+++ b/meta-oe/recipes-benchmark/fio/files/0001-update-the-interpreter-paths.patch
@@ -16,8 +16,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  tools/hist/fiologparser_hist.py | 2 +-
  tools/hist/half-bins.py         | 2 +-
  tools/plot/fio2gnuplot          | 2 +-
- t/steadystate_tests.py | 2 +-
- 7 files changed, 7 insertions(+), 7 deletions(-)
+ 6 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/tools/fio_jsonplus_clat2csv b/tools/fio_jsonplus_clat2csv
 index 78a007e5..0524b6e6 100755
@@ -79,16 +78,6 @@ index 4d1815cf..509141af 100755
  # Note: this script is python2 and python3 compatible.
  #
  #  Copyright (C) 2013 eNovance SAS <licensing@enovance.com>
-diff --git a/t/steadystate_tests.py b/t/steadystate_tests.py
-index 50254dcc..95e7dfde 100755
---- a/t/steadystate_tests.py
-+++ b/t/steadystate_tests.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python2.7
-+#!/usr/bin/env python
- # Note: this script is python2 and python 3 compatible.
- #
- # steadystate_tests.py
 -- 
 2.17.1
 
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.16.bb b/meta-oe/recipes-benchmark/fio/fio_3.17.bb
similarity index 92%
rename from meta-oe/recipes-benchmark/fio/fio_3.16.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.17.bb
index adab61878..e41c21d1e 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.16.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.17.bb
@@ -21,10 +21,9 @@ PACKAGECONFIG_NUMA_armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "92f75708b530989fdb13b50be6604f44b80d038d"
+SRCREV = "08ce9dc20b8a4e55db7af6d869ddfa49b4a02d03"
 SRC_URI = "git://git.kernel.dk/fio.git \
           file://0001-update-the-interpreter-paths.patch \
-          file://0001-arch-arm-Consider-armv7ve-arch-as-well.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.20.1




