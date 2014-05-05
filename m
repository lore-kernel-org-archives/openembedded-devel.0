Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 32D4160D8D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 21:48:46 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id w7so1234191lbi.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lAqHJSOesQGlflYkcRNOKVrjdo+19nwKNAN88N4OLDI=;
	b=wo14kbbIebQ20EvcBRyI5zg6Urq3RCDG52CBAKxxM3TRLuH0acMYbWOmQMqU0GthJ3
	49ANmlYTHBNogMZkBTnP0Zfmnet1O5K9EP3giYbf4m/dvXz9Sl4wYBS5cS9S5ALFor8W
	G6veJZvO6AbMOUz99hLXqPxLDpVoDwjbahyMTZA67AZq6nYzIsPHE28q3g/tE154uhzX
	//O+ykqPNmioTBCcXMxR07AdxHjwIId+l+GmDOc2acIM6ut8a+HfOlRi6IZqYDX3bM+8
	AkX/eNxmOui83doOumpF7nnn4JRTmKRyDwTIW3u9EqiDdyBMYYImheYd4FWG5fgUgKa2
	Yk8g==
X-Received: by 10.152.2.2 with SMTP id 2mr7583803laq.26.1399326527407;
	Mon, 05 May 2014 14:48:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jh4sm10884868lbb.26.2014.05.05.14.48.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 14:48:46 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 May 2014 23:49:04 +0200
Message-Id: <1399326544-14297-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [meta-oe][WIP][PATCH] libmusicbrainz: add dependency on neon-native
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
X-List-Received-Date: Mon, 05 May 2014 21:48:48 -0000

* we're building separate native binary make-c-interface which is also checking
  for neon with pkg-config, when it fails it's not fatal and configure continues
  to configure target version (which finds neon correctly) but failed native
  make-c-interface build resultsin this error:

  -- Found PkgConfig: /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
  -- checking for module 'neon'
  --   found neon, version 0.30.0
  CMake Error at /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/FindPackageHandleStandardArgs.cmake:108 (message):
    Could NOT find Neon (missing: NEON_LIBRARIES)
  Call Stack (most recent call first):
    /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/FindPackageHandleStandardArgs.cmake:315 (_FPHSA_FAILURE_MESSAGE)
    cmake/modules/FindNeon.cmake:19 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
    CMakeLists.txt:22 (FIND_PACKAGE)

  -- Configuring incomplete, errors occurred!
  See also "/OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r1/git/build-native/CMakeFiles/CMakeOutput.log".
  make: *** No rule to make target 'make-c-interface'.  Stop.
  ...
  -- Found PkgConfig: /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
  -- checking for module 'neon'
  --   found neon, version 0.30.0
  -- Found Neon: /OE/build/oe-core/tmp-eglibc/sysroots/qemux86/usr/lib/libneon.so
  CMake Error at src/CMakeLists.txt:19 (INCLUDE):
    include could not find load file:
    /OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r1/git/build-native/ImportExecutables.cmake
  -- Configuring incomplete, errors occurred!

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 4cc04b8..a6a4f6a 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The MusicBrainz client is a library which can be built into other
 HOMEPAGE = "http://musicbrainz.org"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "expat neon"
+DEPENDS = "expat neon neon-native"
 
 PV = "5.0.1+git${SRCPV}"
 PR = "r1"
@@ -16,7 +16,6 @@ S = "${WORKDIR}/git"
 
 LDFLAGS_prepend_libc-uclibc = " -lpthread "
 
-
 inherit cmake pkgconfig
 
 do_configure_prepend() {
-- 
1.9.2


