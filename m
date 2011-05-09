Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QJRnt-00060O-ND
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 16:51:21 +0200
Received: by pzk36 with SMTP id 36so2488702pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=i4yPIsk2/iNXbeqkQLeHXf/kIOvw3AitcXo7VtY0KPg=;
	b=ho4BhMqKkcUiOCpQ2lAg234127hs3xN4X+/J0Spxh8kjQlpP6zpgCs2fS2VcTyc1Rp
	kSQ8NlWXUmUXKxD18xDaDAmeaGpDyUNQyxkrUuJO0MunleD8dUN3dT6xtSrhGGyOwplf
	4adbG8kMI0aBZOz9T4ZgYvlL9r/Ip78KHUkaY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NLRHoDXUteR1zRKyH4PFlWLDd5lTRyrMuoTRVGlxgFVj4Gb5rbhufYsg/zhCxm96QY
	OZw4RBA37POndD1/7ICjb5B/N+sq3nGjs8g5kgPMlYKwQgwEQ+VNXZV0XrKgYmpNQoVh
	TNxQ6M63bmm/jq3uOHCIH6x1dgh6w0G3qifhg=
Received: by 10.68.63.36 with SMTP id d4mr10420061pbs.60.1304952505814;
	Mon, 09 May 2011 07:48:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m4sm4149077pbb.78.2011.05.09.07.48.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 07:48:24 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 07:48:04 -0700
Message-Id: <1304952485-8207-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1304952485-8207-1-git-send-email-raj.khem@gmail.com>
References: <1304952485-8207-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCHv3 2/3] xserver-xorg_1.10.1.bb: Replace use of --variable=sdkdir with --cflags-only-I
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2011 14:51:22 -0000

From: Khem Raj <raj.khem@gmail.com>

This fixes the build failures of xf86-video-fbdev on build systems which
have xorg-xserver development packages installed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../replace-pkgconfig-sdkdir-poking.patch          |   33 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.10.1.bb            |    3 +-
 2 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/replace-pkgconfig-sdkdir-poking.patch

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/replace-pkgconfig-sdkdir-poking.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/replace-pkgconfig-sdkdir-poking.patch
new file mode 100644
index 0000000..3967c4c
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/replace-pkgconfig-sdkdir-poking.patch
@@ -0,0 +1,33 @@
+configury forces pkg-config to poke for sdkdir variable which 
+pkg-config happily returns but does not prepend sysroot to it
+since thats only done for includes and libs. This then gets -I
+prepended and added to CFLAGS. Guess what gcc cross gripes
+about including host includes in cross builds but does not bail
+out the build but it does not escape the wrath of our oe's
+QA checks and rightly so. We replace use of sdkdir with 
+--cflags-only-I which returns the include paths correctly
+pointing inside sysroot and not at the host includes and plus
+includedir if you look inside the .pc file is assigned sdkdir
+anyway so we do not lose anything
+
+This m4 macro is included in other packages e.g. xf86-video-fbdev
+which dont build on hosts which have installation of
+xorg-xserver-dev because it gets this include poisoning
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-status: Pending
+
+Index: xorg-server-1.10.1/xorg-server.m4
+===================================================================
+--- xorg-server-1.10.1.orig/xorg-server.m4
++++ xorg-server-1.10.1/xorg-server.m4
+@@ -31,7 +31,7 @@ dnl
+ AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
+ 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
+ 	SAVE_CFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
++	CFLAGS="$CFLAGS `$PKG_CONFIG --cflags-only-I xorg-server`"
+ 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include "xorg-server.h"
+ #if !defined $1
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
index 7cb7339..91bf476 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
@@ -7,11 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
 PE = "2"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += " \
             file://hack-fbdev-ignore-return-mode.patch \
             file://hack-assume-pixman-supports-overlapped-blt.patch \
+            file://replace-pkgconfig-sdkdir-poking.patch \
            "
 SRC_URI[md5sum] = "75f117c74f2ecaf9dd167f6a66ac98de"
 SRC_URI[sha256sum] = "143c7c3d7d4428352e1153dffa34fd64af391f72d30b2a03e911e54e36f00b5d"
-- 
1.7.4.1



