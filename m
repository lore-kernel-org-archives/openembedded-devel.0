Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED5A6E668
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:17 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id k87so45322537ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TO4cZ+igOxAg9o3mzAVGiVufzSYRfLXgLJVqMAiyMn4=;
	b=FenDWRd5yF3f4zrHjOODvPAH0PG3w1h6ssAxKCIMMB7I14JU5UBE6JjBCBYU/0K+Pe
	NHJotBNTiCzFo53Oj2ynC4uoNgXx9UZ14riVjOP3bAjaBIb67MbuxTKfuBOXFeRUuOE7
	R8Tww6+9sBI5is5zXdJLcHOSCHf0T8ij1rTXkXdUfIQ/UimeSUortc6EOl9DM5DHFvZP
	GSHk+nWEGyZZ6abHmfUH5NZudA+GyJcWoX9rJftDbzgtFe/03tEN4AECwJIkspupseGr
	YnVGIXQmXJWXcXeMvIm65f83sij3glaVGDAwepfA79nReFXQ8zkxcPGQaUnX10jUyH+s
	73pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TO4cZ+igOxAg9o3mzAVGiVufzSYRfLXgLJVqMAiyMn4=;
	b=OfUVpJo2G19QpYLDrHjzcHdSUNn6q5C8DCw+ohBoG+NGviseDQ7sMguuw5jjmju/vf
	3/sinGrxqVKikEMJUl0VQYvbz2OmH+ycu46ONW3bYUCbvsI/yIMj2VZ841xFbutK9S5U
	yfhjcaGOZg2QPlz0AOXsu3K6l0c9G7HtUUVZ5Ib3eLOOmey6woaYNhaypJItZpNmmD+I
	vZi3qORYIUunWDAnRg+mmdEArrQya9IUe1hNwYcfuVUfi0xBSm9sdfq2rzZEBom05cyR
	lDsSe0Xlqa0pQUUkN5uLiYtwvicXf0mFS20RicG2DfJCygRZtJhqvsDCdDPrMz42G+vQ
	1nmg==
X-Gm-Message-State: AN3rC/7cP4JrAkqc4Kt85POW4whR6N8RSEh/deXV+WiEWnBhW6cuAMb2
	RpBo8xhLjMLMgg==
X-Received: by 10.98.211.27 with SMTP id q27mr23330853pfg.126.1493011278548;
	Sun, 23 Apr 2017 22:21:18 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:45 -0700
Message-Id: <20170424052058.4952-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/17] fluentbit: Upgrade to 0.11.3 release
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:17 -0000

Fix cross compiling for external modules
Fix build with gcc7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch | 52 ++++++++++++++++++++++
 ...pack-Add-comment-for-intended-fallthrough.patch | 28 ++++++++++++
 .../recipes-extended/fluentbit/fluentbit_0.11.3.bb | 24 ++++++++++
 .../recipes-extended/fluentbit/fluentbit_0.7.2.bb  | 16 -------
 4 files changed, 104 insertions(+), 16 deletions(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch
new file mode 100644
index 000000000..539a42a7d
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch
@@ -0,0 +1,52 @@
+From ceb47f37582a055bb7f253f813c435ad55c5b6eb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Apr 2017 10:02:50 -0700
+Subject: [PATCH 1/2] CMakeLists.txt: Add AUTOCONF_HOST_OPT to help cross
+ compiling
+
+This helps in doing cross compiles for modules which are using
+GNU autoconf for build system
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b093f9a..ebf0cd7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -290,6 +290,12 @@ else()
+   endif()
+ endif()
+ 
++if("${GNU_HOST}" STREQUAL "")
++    set(AUTOCONF_HOST_OPT "")
++else()
++    set(AUTOCONF_HOST_OPT "--host=${GNU_HOST}")
++endif()
++
+ # Memory Allocator
+ # ================
+ if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+@@ -299,7 +305,7 @@ if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+   # Link to Jemalloc as an external dependency
+   ExternalProject_Add(jemalloc
+     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc
+-    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
++    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
+     CFLAGS=-std=gnu99\ -Wall\ -pipe\ -g3\ -O3\ -funroll-loops
+     BUILD_COMMAND ${MAKE}
+     INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/
+@@ -317,7 +323,7 @@ endif()
+ if(FLB_REGEX)
+   ExternalProject_Add(onigmo
+     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/onigmo
+-    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/onigmo/configure --with-pic --disable-shared --enable-static --prefix=<INSTALL_DIR>
++    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/onigmo/configure ${AUTOCONF_HOST_OPT} --with-pic --disable-shared --enable-static --prefix=<INSTALL_DIR>
+     CFLAGS=-std=gnu99\ -Wall\ -pipe\ -g3\ -O3\ -funroll-loops
+     BUILD_COMMAND ${MAKE}
+     INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch
new file mode 100644
index 000000000..35cdb18ad
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch
@@ -0,0 +1,28 @@
+From d95c2977da074be0d3913e94fb8fb5ed1c64404a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Apr 2017 10:04:03 -0700
+Subject: [PATCH 2/2] msgpack: Add comment for intended fallthrough
+
+Helps fixing build with gcc7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h b/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h
+index a6dae6f..651e6c2 100644
+--- a/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h
++++ b/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h
+@@ -248,7 +248,7 @@ msgpack_unpack_func(int, _execute)(msgpack_unpack_struct(_context)* ctx, const c
+ 
+             _fixed_trail_again:
+                 ++p;
+-
++            // fallthrough
+             default:
+                 if((size_t)(pe - p) < trail) { goto _out; }
+                 n = p;  p += trail - 1;
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb
new file mode 100644
index 000000000..8d756e6a4
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Fast data collector for Embedded Linux"
+HOMEPAGE = "http://fluentbit.io"
+BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
+
+SRC_URI = "http://fluentbit.io/releases/0.11/fluent-bit-${PV}.tar.gz \
+           file://0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch \
+           file://0002-msgpack-Add-comment-for-intended-fallthrough.patch \
+           "
+SRC_URI[md5sum] = "9383262339412782b80cc49e7ad15609"
+SRC_URI[sha256sum] = "eb8a85c656fa60682b0bf8dd1ad58d848cd251dab4f35a6777acd552c65b0511"
+
+S = "${WORKDIR}/fluent-bit-${PV}"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+DEPENDS = "zlib"
+INSANE_SKIP_${PN}-dev += "dev-elf"
+
+inherit cmake systemd
+
+EXTRA_OECMAKE = "-DGNU_HOST=${HOST_SYS}"
+
+SYSTEMD_SERVICE_${PN} = "fluent-bit.service"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
deleted file mode 100644
index c75f446e1..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Fast data collector for Embedded Linux"
-HOMEPAGE = "http://fluentbit.io"
-BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
-
-SRC_URI = "http://fluentbit.io/releases/0.7/fluent-bit-${PV}.tar.gz"
-SRC_URI[md5sum] = "6df9d676e1d2d782a243e655e144e8ae"
-SRC_URI[sha256sum] = "695b56ce378f56855c9554f88f5d8e4f7b11ba7691284903870f779912af4ebe"
-S = "${WORKDIR}/fluent-bit-${PV}"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-
-DEPENDS = "zlib"
-INSANE_SKIP_${PN}-dev += "dev-elf"
-
-inherit cmake
-- 
2.12.2


