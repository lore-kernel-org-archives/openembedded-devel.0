Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 944197EDF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 23:22:58 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id u17so8053745pgi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 16:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VsybMGLlpYZdJIWrcpGU/zNEzLpTRaAxqT01gMXRRek=;
	b=BuZGztxDKc6aonGwMizPr/451kZnCmtVJUoPaurFiasSJEkBRWqNHzCFivaK8Buren
	+K+mgyyP2Bdf82pPHkXty3U9dNfcjRkPc7trw4x40L4/MhHHC265nAHuxpb/0FvKX+hh
	3DiM63hy4dxMGGpiVEs6A4kpDXH6GkWs0hu4ohxSD+GL7Vk/NUT0P4KLyk7jOiekL9IO
	dwieRow81t2QcwfIIKv6U0dxlYkW/ZR7Sa6t90zR1gQQuAeN3Y0O8QrHv3Dl8tGSO+ML
	dlpnR10kBGorXCV3ImGxkcs513coh0PuHvS5Q1ofp9QAI2loJhxX1TvrooLNYn5xcuOJ
	Pu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VsybMGLlpYZdJIWrcpGU/zNEzLpTRaAxqT01gMXRRek=;
	b=VXdkvm4ruH8CWgWxurYrP5kZo04nyJ0rWXU7WtiKIZd3i8e5I0DusmGpz0KaIYbsyY
	oVTuy10rQbgyz47Q6gLnQiep/5LBy/Tk8jPU+hj5JgjkhA7BZD2B2/7ApXx3FI24EivH
	IMpZJmeGjT01jfXktOKpFeSRa9oDeITJuhDk/5R4yAeYnJ9tcPIr9npxzoa2x8NbMtGe
	y80bEmpTB6imiUAAhiml4ImdrkTrRlJENdOHB5arUDrveUV6klKv0bbp/ANmv96BOwjm
	fKHCbk9VX452JQZ0a41l19ObFNofBqr+/WgmjfirMrd5y24uS3SjisF7jlt2rpcp8ihA
	2D7Q==
X-Gm-Message-State: APjAAAUVGMKzUrVtwxxLXjDfc/1JdUIrLlDFqr3vzlE11PB/GVgD2lWL
	l+z09GwjRFmtsVICHtuXEGTJezhsNHs=
X-Google-Smtp-Source: APXvYqwmK95k2E1ebpFfDLQ37lN62TukMS7lQMka9alDd8/G3J0KGDuRLOPGo839q/ojDW5BHNJ64w==
X-Received: by 2002:a65:64c6:: with SMTP id t6mr27922328pgv.323.1567466579075; 
	Mon, 02 Sep 2019 16:22:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k5sm8009146pfp.109.2019.09.02.16.22.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 16:22:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Sep 2019 16:22:48 -0700
Message-Id: <20190902232248.27969-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] iperf2: Fix build with latest libc++
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
X-List-Received-Date: Mon, 02 Sep 2019 23:22:58 -0000
Content-Transfer-Encoding: 8bit

Part of this patch was already there for gcc6 fix which was subsequenty
dropped in past iperf2 upgrades therefore
bring it back see 0647b7d6400b1c40fc6cb40596e56b852ceb85c5

Additionally check for stdbool.h being present on system

helps in fixing  build with latest clang/libc++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Check and use stdbool.h if present

 ...nition-considering-stdbool.h-being-p.patch | 58 +++++++++++++++++++
 .../recipes-benchmark/iperf2/iperf2_2.0.13.bb |  4 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
new file mode 100644
index 0000000000..45c69ca067
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
@@ -0,0 +1,58 @@
+From 6df092a4153c6c37cfaddcabf2cd25a910a7f6e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Sep 2019 15:40:52 -0700
+Subject: [PATCH] Detect bool definition considering stdbool.h being present
+
+This helps in defining the value correctly on different platforms e.g.
+clang/libc++ depends on the definition coming from stdbool.h
+current builds fail to compile therefore
+
+TMPDIR/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/iperf2/2.0.13-r0/recipe-sysroot/usr/include/c++/v1/type_traits:742:29: error: redefinition of '__libcpp_is_integral<int>'
+template <>          struct __libcpp_is_integral<int>                : public true_type {};
+                            ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/dast.m4 | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+--- a/m4/dast.m4
++++ b/m4/dast.m4
+@@ -11,7 +11,12 @@ AH_TEMPLATE([false])
+ 
+ AC_DEFUN(DAST_CHECK_BOOL, [
+ 
+-AC_CHECK_SIZEOF(bool)
++if test "$ac_cv_header_stdbool_h" = yes; then
++  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
++else
++  AC_CHECK_SIZEOF(bool)
++fi
++
+ if test "$ac_cv_sizeof_bool" = 0 ; then
+   AC_DEFINE(bool, int)
+ fi
+--- a/configure.ac
++++ b/configure.ac
+@@ -113,7 +113,7 @@ AC_SEARCH_LIBS([socket], [socket], [],
+ 
+ dnl Checks for header files.
+ AC_HEADER_STDC
+-AC_CHECK_HEADERS([arpa/inet.h libintl.h net/ethernet.h net/if.h linux/ip.h linux/udp.h linux/if_packet.h linux/filter.h netdb.h netinet/in.h stdlib.h string.h strings.h sys/socket.h sys/time.h syslog.h unistd.h signal.h ifaddrs.h])
++AC_CHECK_HEADERS([arpa/inet.h libintl.h net/ethernet.h net/if.h linux/ip.h linux/udp.h linux/if_packet.h linux/filter.h netdb.h netinet/in.h stdbool.h stdlib.h string.h strings.h sys/socket.h sys/time.h syslog.h unistd.h signal.h ifaddrs.h])
+ 
+ dnl ===================================================================
+ dnl Checks for typedefs, structures
+--- a/include/util.h
++++ b/include/util.h
+@@ -56,7 +56,9 @@
+ #ifdef HAVE_CONFIG_H
+     #include "config.h"
+ #endif
+-
++#ifdef HAVE_STDBOOL_H
++# include <stdbool.h>
++#endif
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
index 2bd552d1d8..4a520e3be5 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
@@ -4,7 +4,9 @@ SECTION = "console/network"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
 
-SRC_URI = " ${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \
+           file://0001-Detect-bool-definition-considering-stdbool.h-being-p.patch \
+"
 
 SRC_URI[md5sum] = "31ea1c6d5cbf80b16ff3abe4288dad5e"
 SRC_URI[sha256sum] = "c88adec966096a81136dda91b4bd19c27aae06df4d45a7f547a8e50d723778ad"
-- 
2.23.0


