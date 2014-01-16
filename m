Return-Path: <B40290@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe005.messaging.microsoft.com [213.199.154.208])
	by mail.openembedded.org (Postfix) with ESMTP id 2978F6B2E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 03:57:08 +0000 (UTC)
Received: from mail31-am1-R.bigfish.com (10.3.201.243) by
	AM1EHSOBE008.bigfish.com (10.3.204.28) with Microsoft SMTP Server id
	14.1.225.22; Thu, 16 Jan 2014 03:57:08 +0000
Received: from mail31-am1 (localhost [127.0.0.1])	by mail31-am1-R.bigfish.com
	(Postfix) with ESMTP id 1C60CA022B	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 03:57:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h2487h1155h)
Received: from mail31-am1 (localhost.localdomain [127.0.0.1]) by mail31-am1
	(MessageSwitch) id 1389844626296089_17211;
	Thu, 16 Jan 2014 03:57:06 +0000 (UTC)
Received: from AM1EHSMHS003.bigfish.com (unknown [10.3.201.245])	by
	mail31-am1.bigfish.com (Postfix) with ESMTP id 430D23C004B;
	Thu, 16 Jan 2014 03:57:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS003.bigfish.com
	(10.3.207.103) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 16 Jan 2014 03:57:05 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 16 Jan 2014 03:57:04 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0G3v0cN025459;	Wed, 15 Jan 2014 20:57:02 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2014 11:56:55 +0800
Message-ID: <1389844615-22890-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] waffle : remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jan 2014 03:57:08 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *This recipe is now back in OE-Core.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-graphics/waffle/files/cflags.patch | 27 -----------------
 meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb    | 34 ----------------------
 2 files changed, 61 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/waffle/files/cflags.patch
 delete mode 100644 meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb

diff --git a/meta-oe/recipes-graphics/waffle/files/cflags.patch b/meta-oe/recipes-graphics/waffle/files/cflags.patch
deleted file mode 100644
index 3819756..0000000
--- a/meta-oe/recipes-graphics/waffle/files/cflags.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 2abec1cb3c17fa5ec8d945d79acd74a39c38293a Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 12 Dec 2012 12:57:18 +0000
-Subject: cmake: respect existing CMAKE_C_FLAGS
-
-When cross-compiling it's not unusual to need specific arguments passed to gcc
-such as --sysroot.  Ensure that these are passed on from the toolchain file by
-appending to CMAKE_C_FLAGS instead of overwriting it.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: waffle-1.2.2/CMakeLists.txt
-===================================================================
---- waffle-1.2.2.orig/CMakeLists.txt	2012-11-28 00:43:40.000000000 +0000
-+++ waffle-1.2.2/CMakeLists.txt	2013-02-13 11:34:02.476188233 +0000
-@@ -212,7 +212,7 @@
- # ------------------------------------------------------------------------------
- 
- # FIXME: Only enable c99 if compiler supports it.
--set(CMAKE_C_FLAGS "--std=c99 -Wall -Werror=implicit-function-declaration")
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --std=c99 -Wall -Werror=implicit-function-declaration")
- if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
-     # On MacOS, the SSE2 headers trigger this error.
-     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror=missing-prototypes")
diff --git a/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb b/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb
deleted file mode 100644
index 4f80191..0000000
--- a/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "cross-platform C library to defer selection of GL API and of window system"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
-                    file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
-
-SRC_URI = "http://people.freedesktop.org/~chadversary/waffle/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
-           file://cflags.patch"
-
-SRC_URI[md5sum] = "fdd07cea7709422fbf72418ee63a285d"
-SRC_URI[sha256sum] = "7e342c859b58d4e051b347ef3d7740ed2f3b6c506b93daec272724afe7dd1311"
-
-inherit cmake
-
-# This should be overridden per-machine to reflect the capabilities of the GL
-# stack.
-PACKAGECONFIG ??= "glx"
-
-# I say virtual/libgl, actually wants gl.pc
-PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,,virtual/libgl libx11"
-
-# I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
-# DISTRO_FEATURE.
-PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,,virtual/libgl wayland"
-
-# I say virtual/libgl, actually wants gbm.pc egl.pc
-PACKAGECONFIG[gbm] = "-Dwaffle_has_wayland=1,,virtual/libgl udev"
-
-# I say virtual/libgl, actually wants egl.pc
-PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,,virtual/libgl libxcb"
-
-# Take the flags added by PACKAGECONFIG and pass them to cmake.
-EXTRA_OECMAKE = "${EXTRA_OECONF}"
-
-FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake"
-- 
1.8.3.2



