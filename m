Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B1DA77063F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:47:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HDkXfW023880 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:47:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fA2FOdoo2mjc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:47:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HDl5Tu023999
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:47:07 +0100
Message-ID: <1405604820.26348.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jul 2014 14:47:00 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libsdl-ttf: Update configure.patch
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
X-List-Received-Date: Thu, 17 Jul 2014 13:47:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Update configure.patch to modernise configure.in, in particular passing the
foreign option to automake. The other changes are other modernisations
that were needed to make that.

Also use rm -f so that do_configure can rerun in the prepend.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/configure.patch b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/configure.patch
index 2069644..de88f0a 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/configure.patch
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/configure.patch
@@ -1,8 +1,38 @@
 Index: SDL_ttf-2.0.10/configure.in
 ===================================================================
---- SDL_ttf-2.0.10.orig/configure.in	2010-10-15 10:54:51.392730531 +0200
-+++ SDL_ttf-2.0.10/configure.in	2010-10-15 10:55:06.382727473 +0200
-@@ -25,6 +25,8 @@
+--- SDL_ttf-2.0.10.orig/configure.in	2009-10-12 23:06:38.000000000 +0000
++++ SDL_ttf-2.0.10/configure.in	2014-07-17 12:33:34.011662505 +0000
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
+-MAJOR_VERSION=2
+-MINOR_VERSION=0
+-MICRO_VERSION=10
++m4_define([sdlttf_major_version],[2])
++m4_define([sdlttf_minor_version],[0])
++m4_define([sdlttf_micro_version],[10])
++m4_define([sdlttf_version], [sdlttf_major_version.sdlttf_minor_version.sdlttf_micro_version])
++
++AC_INIT([SDL_ttf], [sdlttf_version])
++
++MAJOR_VERSION=sdlttf_major_version
++MINOR_VERSION=sdlttf_minor_version
++MICRO_VERSION=sdlttf_micro_version
+ INTERFACE_AGE=0
+ BINARY_AGE=10
+-VERSION=$MAJOR_VERSION.$MINOR_VERSION.$MICRO_VERSION
++VERSION=sdlttf_version
+ 
+ AC_SUBST(MAJOR_VERSION)
+ AC_SUBST(MINOR_VERSION)
+@@ -25,6 +31,8 @@
  AC_SUBST(BINARY_AGE)
  AC_SUBST(VERSION)
  
@@ -11,3 +41,12 @@ Index: SDL_ttf-2.0.10/configure.in
  # libtool versioning
  LT_INIT([win32-dll])
  
+@@ -42,7 +50,7 @@
+ AC_CANONICAL_HOST
+ 
+ dnl Setup for automake
+-AM_INIT_AUTOMAKE(SDL_ttf, $VERSION)
++AM_INIT_AUTOMAKE([foreign])
+ 
+ dnl Check for tools
+ AC_PROG_LIBTOOL
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
index 47026a2..ad3792e 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
@@ -24,7 +24,7 @@ do_configure_prepend() {
     MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
 
     for i in ${MACROS}; do
-      rm ${S}/acinclude/$i
+      rm -f ${S}/acinclude/$i
     done
 
 }



