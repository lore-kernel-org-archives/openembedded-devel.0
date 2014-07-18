Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9A9170696
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fi030280; Fri, 18 Jul 2014 09:43:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uwX8e5-slNTn; Fri, 18 Jul 2014 09:43:07 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gwDZ030249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:42:59 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kj-0006j1-JO; Fri, 18 Jul 2014 09:42:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:30 +0100
Message-Id: <1405672966-25729-11-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/27] libsdl-image: Use "foreign" automake strictness
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:19 -0000

---
 .../libsdl-image/libsdl-image/configure.patch      | 43 ++++++++++++++++++++++
 .../libsdl-image/libsdl-image_1.2.12.bb            |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/libsdl-image/libsdl-image/configure.patch

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image/configure.patch b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image/configure.patch
new file mode 100644
index 0000000..5299d37
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image/configure.patch
@@ -0,0 +1,43 @@
+Index: SDL_image-1.2.12/configure.in
+===================================================================
+--- SDL_image-1.2.12.orig/configure.in	2012-01-21 01:51:33.000000000 +0000
++++ SDL_image-1.2.12/configure.in	2014-07-18 06:56:56.853466678 +0000
+@@ -1,5 +1,4 @@
+ dnl Process this file with autoconf to produce a configure script.
+-AC_INIT(README)
+ 
+ dnl Set various version strings - taken gratefully from the GTk sources
+ 
+@@ -11,12 +10,19 @@
+ # if backwards compatibility has been broken,
+ # set BINARY_AGE and INTERFACE_AGE to 0.
+ 
+-MAJOR_VERSION=1
+-MINOR_VERSION=2
+-MICRO_VERSION=12
++m4_define([sdlimage_major_version],[1])
++m4_define([sdlimage_minor_version],[2])
++m4_define([sdlimage_micro_version],[12])
++m4_define([sdlimage_version], [sdlimage_major_version.sdlimage_minor_version.sdlimage_micro_version])
++
++AC_INIT([SDL_image], [sdlimage_version])
++
++MAJOR_VERSION=sdlimage_major_version
++MINOR_VERSION=sdlimage_minor_version
++MICRO_VERSION=sdlimage_micro_version
+ INTERFACE_AGE=4
+ BINARY_AGE=12
+-VERSION=$MAJOR_VERSION.$MINOR_VERSION.$MICRO_VERSION
++VERSION=sdlimage_version
+ 
+ AC_SUBST(MAJOR_VERSION)
+ AC_SUBST(MINOR_VERSION)
+@@ -42,7 +48,7 @@
+ AC_CANONICAL_HOST
+ 
+ dnl Setup for automake
+-AM_INIT_AUTOMAKE(SDL_image, $VERSION)
++AM_INIT_AUTOMAKE([foreign])
+ 
+ dnl Check for tools
+ AC_PROG_LIBTOOL
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index 78f4bf5..ea8e9ea 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=613734b7586e1580ef944961c6d62227"
 
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
 
-SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz"
+SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz \
+           file://configure.patch"
 SRC_URI[md5sum] = "a0f9098ebe5400f0bdc9b62e60797ecb"
 SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699"
 
-- 
2.0.2


