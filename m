Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TSogn-0003Dy-4O
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 13:43:33 +0100
Received: by mail-gg0-f175.google.com with SMTP id p1so888928ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2012 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=04WloiERooCSafs5saYmNbAK7Ux3js7jJdGd0rg7zHk=;
	b=obcSZJ1t4FcyWwu5+DcRnkXxG0xhakYx1i+vWgAXhUZymt0BWCX7zteQkb+5Tk7AhJ
	rK1eukCoWy4hIeaKeJeAEIRf6QEeZCSOI4GPVlf+EQnIR8XQALNCCj1ybJisuVXzCbwg
	wzW+THlZpAvmxXceP8beVXoq8wqqhcXVfTHKFXyUG4+XCFxML0AU0q8cj1qlbUlZMoXX
	HYueCVdivfHyhwNzza9q0omIs1X9OumlusjXodJmHCuX8bxBmEd5rGVqtsXZiKrd5Icf
	g0ph2V7Xod1NejUi2rgYB/pip6RaDqSz2CsFJkgSPqFBBFgufnNqT/D/+cX6fKqvACJV
	V6jA==
Received: by 10.100.233.37 with SMTP id f37mr7671503anh.48.1351513800025;
	Mon, 29 Oct 2012 05:30:00 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id j8sm8362054ann.3.2012.10.29.05.29.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2012 05:29:57 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2012 10:29:45 -0200
Message-Id: <1351513785-15026-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1351513785-15026-1-git-send-email-otavio@ossystems.com.br>
References: <1351513785-15026-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/3] freerdp: Update to lastest stable (upcoming 1.0.2)
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
X-List-Received-Date: Mon, 29 Oct 2012 12:43:33 -0000

This changes the build system from autotools for cmake so we change
the options to allow it to proper build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp.inc    |   19 +++++++++++--------
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    8 ++++----
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index 673b372..3cb4b25 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -1,22 +1,25 @@
-# Copyright (C) 2010, 2011 O.S. Systems Software Ltda. All Rights Reserved
+# Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license
 
 DESCRIPTION = "FreeRDP RDP client"
 HOMEPAGE = "http://www.freerdp.com"
-DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio pcsc-lite"
+DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio pcsc-lite libxkbfile libxinerama"
 SECTION = "x11/network"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 INC_PR = "r1"
 
-inherit pkgconfig autotools
+inherit pkgconfig cmake
 
-EXTRA_OECONF += "--with-smartcard --with-xvideo"
-
-do_install_append() {
-	rm ${D}${libdir}/freerdp/*.a ${D}${libdir}/freerdp/*.la
-}
+EXTRA_OECMAKE += "-DWITH_PULSEAUDIO=ON \
+                  -DWITH_PCSC=ON \
+                  -DWITH_CUPS=ON \
+                  -DWITH_FFMPEG=OFF \
+                  -DWITH_CUNIT=OFF \
+                  -DWITH_X11=ON \
+                  -DWITH_XKBFILE=ON \
+                  -DWITH_XINERAMA=ON"
 
 PACKAGES =+ "libfreerdp"
 
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 2a3affd..01ab390 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -1,4 +1,4 @@
-# Copyright (C) 2010, 2011, O.S. Systems Software Ltda.
+# Copyright (C) 2010-2012, O.S. Systems Software Ltda.
 # Released under the MIT license
 
 include freerdp.inc
@@ -7,9 +7,9 @@ inherit gitpkgv
 
 PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.0"
 
-SRCREV = "b3eb650c919c4b3b1e5bc12cea6afb05282a7232"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP-old.git;protocol=git"
+SRCREV = "19d4a4276869ec40ee1eef066ac460615734c043"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



