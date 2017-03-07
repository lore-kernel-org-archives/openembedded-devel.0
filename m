Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 636FD774FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:04 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 67so15765339pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0GoV8PnW2L9pitFUNpYBwQPRTA9iCiaLdkrnVPQw0uo=;
	b=LrlTzDVoSvshNW2xhx0R44vZycfHEhYtTKCRylMpZq2FZoBnhIscDfvRZ7B42YXBeK
	aL1ptqnWs8g8Bk949ETOMOJi4RwbAvOzkUV/KcXhNlGTdNOr/30sCTELLdh325dmhKMt
	FSHNnKHXZAvXeHFnDKSFQ+Whuxb/EYsQ7HSwWEMCHDkj6ICc5vJxMyL2qhm6jUTbWeau
	Stl4qYtfHlc6x81ukq2t7N8GgYFMmpC2l2fRpkfRU3JRNJIu99Q0uApbCdf+qlQm2WfF
	ODpIPFl0VG1ntkFO1DDL+q4MaxM0Q/ZMtVk64uDYLjBaewsJdPuGv3xfbPNYpvCcNQX9
	RyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0GoV8PnW2L9pitFUNpYBwQPRTA9iCiaLdkrnVPQw0uo=;
	b=bSny5RUf0GEgbrrLXkcmc5Y3fnXTJv6ronM7MpKm4rxK/6CvPWt+U28QNyfLDsl9Yd
	BZy58AtjW7FIRYl/ZIZKIVZmZ6SJ8zox7gVOCrmQjWMjfKyQ2Zjvzx8uzX+u+H0pHC5z
	NwwjtvIhRx2FDxJD+ieSpHhdCKvNkIcthPeqHs0bFsKC8Hxs9fE4i2jSvYZ+/zg5XQ9C
	0TvvIyMf1lNZTR/qITZK3KKVgMBFDOFwbjP3E5k1J0PU5nlLxYWUVGYD3GDygxWF0to6
	xLlnj6JzpVU/9jBFz1k6fz4HxYmpAKb2wY5yNqdCsNMJcOhlQrHHZ6Ff1+iVHwGikVbx
	7Awg==
X-Gm-Message-State: AMke39nRw36OpxkcyFBhdWbBD/3bBRyqDulzrlC8a3QPopzIhYmFv/F7dpeAv6wRxhi5Zw==
X-Received: by 10.99.206.5 with SMTP id y5mr25568288pgf.212.1488870845998;
	Mon, 06 Mar 2017 23:14:05 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:42 -0800
Message-Id: <20170307071349.16444-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/14] tbb: Update to 2017 release
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:04 -0000

Update license to reflect new Apache 2.0 license
Fix build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/tbb/{tbb_4.1.bb => tbb.bb} | 23 ++++++++---------
 .../tbb/allow-to-build-for-older-arm-cores.patch   | 30 ----------------------
 .../recipes-support/tbb/tbb/cross-compile.patch    | 30 ++++++++++++++++------
 3 files changed, 33 insertions(+), 50 deletions(-)
 rename meta-oe/recipes-support/tbb/{tbb_4.1.bb => tbb.bb} (74%)
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/allow-to-build-for-older-arm-cores.patch

diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-support/tbb/tbb.bb
similarity index 74%
rename from meta-oe/recipes-support/tbb/tbb_4.1.bb
rename to meta-oe/recipes-support/tbb/tbb.bb
index 09ed6ec52..d8eb1c2f3 100644
--- a/meta-oe/recipes-support/tbb/tbb_4.1.bb
+++ b/meta-oe/recipes-support/tbb/tbb.bb
@@ -4,23 +4,22 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
     higher-level, task-based parallelism that abstracts platform details \
     and threading mechanism for performance and scalability."
 HOMEPAGE = "http://threadingbuildingblocks.org/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2c7f2caf277a3933e3acdf7f89d54cc1"
-PRDATE = "20130314"
-PR = "r${PRDATE}"
-
-SRC_URI = "http://threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb41_${PRDATE}oss_src.tgz \
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+PRDATE = "20170118"
+PV = "${PRDATE}"
+SRC_URI = "https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb2017_${PRDATE}oss_src.tgz \
            file://cross-compile.patch \
-           file://allow-to-build-for-older-arm-cores.patch \
            file://tbb.pc"
+SRC_URI[md5sum] = "26baa6fbcc8f03ee45c0641b91d9588a"
+SRC_URI[sha256sum] = "48bb526287fa8b4e7d1e1b2ba9e5fb9c3e372b497772c06ef9ccd7f93f344e74"
 
-S = "${WORKDIR}/tbb41_${PRDATE}oss/"
-
-SRC_URI[md5sum] = "ed4af7ccfa122f16cf9920b241633a3a"
-SRC_URI[sha256sum] = "32fd5979971b772caa96d40646cee585ed0070516ba2dbbcb1f9b6033d08a92d"
+S = "${WORKDIR}/tbb2017_${PRDATE}oss/"
 
+COMPILER ?= "gcc"
+COMPILER_toolchain-clang = "clang"
 do_compile() {
-    oe_runmake compiler=gcc arch=${HOST_ARCH} runtime=cc4
+    oe_runmake compiler=${COMPILER} arch=${HOST_ARCH} runtime=cc4
 }
 
 do_install() {
diff --git a/meta-oe/recipes-support/tbb/tbb/allow-to-build-for-older-arm-cores.patch b/meta-oe/recipes-support/tbb/tbb/allow-to-build-for-older-arm-cores.patch
deleted file mode 100644
index cd2ec9499..000000000
--- a/meta-oe/recipes-support/tbb/tbb/allow-to-build-for-older-arm-cores.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-Description: Allow to build TBB for ARM cores older than ARMv7a
-
-| ../../include/tbb/machine/gcc_armv7.h:39:2: error: #error Threading
-Building Blocks ARM port requires an ARMv7-a architecture.
-| make[1]: *** [concurrent_hash_map.o] Error 1
-
-https://bugs.launchpad.net/linaro-oe/+bug/1167144
-
-Upstream-status: pending
-
----
- include/tbb/tbb_machine.h |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- tbb41_20130314oss.orig/include/tbb/tbb_machine.h
-+++ tbb41_20130314oss/include/tbb/tbb_machine.h
-@@ -237,11 +237,11 @@ template<> struct atomic_selector<8> {
-         #include "machine/linux_intel64.h"
-     #elif __ia64__
-         #include "machine/linux_ia64.h"
-     #elif __powerpc__
-         #include "machine/mac_ppc.h"
--    #elif __arm__
-+    #elif __ARM_ARCH_7A__
-         #include "machine/gcc_armv7.h"
-     #elif __TBB_GCC_BUILTIN_ATOMICS_PRESENT
-         #include "machine/gcc_generic.h"
-     #endif
-     #include "machine/linux_common.h"
diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
index b970a374e..d54b307ee 100644
--- a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
+++ b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
@@ -5,14 +5,14 @@ Upstream-Status: unsuitable
  build/linux.gcc.inc |    5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
---- tbb41_20121003oss.orig/build/linux.gcc.inc
-+++ tbb41_20121003oss/build/linux.gcc.inc
-@@ -40,12 +40,13 @@ DYLIB_KEY = -shared
+Index: tbb2017_20170118oss/build/linux.gcc.inc
+===================================================================
+--- tbb2017_20170118oss.orig/build/linux.gcc.inc
++++ tbb2017_20170118oss/build/linux.gcc.inc
+@@ -32,8 +32,9 @@ DYLIB_KEY = -shared
  EXPORT_KEY = -Wl,--version-script,
  LIBDL = -ldl
  
- TBB_NOSTRICT = 1
- 
 -CPLUS = g++
 -CONLY = gcc
 +CPLUS = $(CXX)
@@ -20,6 +20,20 @@ Upstream-Status: unsuitable
 +CPLUS_FLAGS = $(CXXFLAGS)
  LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
  LIBS += -lpthread -lrt
- LINK_FLAGS = -Wl,-rpath-link=.
- C_FLAGS = $(CPLUS_FLAGS)
- # gcc 4.4 and higher support -std=c++0x
+ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
+Index: tbb2017_20170118oss/build/linux.clang.inc
+===================================================================
+--- tbb2017_20170118oss.orig/build/linux.clang.inc
++++ tbb2017_20170118oss/build/linux.clang.inc
+@@ -31,8 +31,9 @@ DYLIB_KEY = -shared
+ EXPORT_KEY = -Wl,--version-script,
+ LIBDL = -ldl
+ 
+-CPLUS = clang++
+-CONLY = clang
++CPLUS = $(CXX)
++CONLY = $(CC)
++CPLUS_FLAGS = $(CXXFLAGS)
+ LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
+ LIBS += -lpthread -lrt
+ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
-- 
2.12.0


