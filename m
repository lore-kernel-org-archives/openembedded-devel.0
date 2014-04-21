Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3E19D65D15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 08:56:03 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so3487294eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 01:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oS5uEkgN4PEabh88pz+FkgccYg3suI9P4twwuDxhsPE=;
	b=FKqFRtf1FmstzJAwJwBn4B5RnPGP4fkvzIrRQDZWDcF9FpU1ctkltL60i3uk+EnSpM
	7kB1C2ez3GsjLVncO2m2xa9Q+IRaIeyHYpsz4Br8iMWNeCJC77EAPfjwhVsnenPd3A4T
	gYl2LVzXGLf47tMKb/D8NsPT7gO5R6OM2h+2pxXy2banKxK82stXWjVoD4z2lBUA2UG3
	Eu63muXnYG8/KS64HZjyIltL8VskiovonjIwOm8S1bGXrHmsxS+/qR2rgOZqL2kmkuLt
	gCXN+7A/KG1KjdywnLVeeINYIPMUCFPw/mpwm39HbXTxwMW3aKkMNB2ltYLVv/Kj9Uzk
	MsKw==
X-Gm-Message-State: ALoCoQkTIzIQRclIguNgWnQCerXJhjw0mXLlOUOvysO13Ppu32HJzGyvrzwytdwMnunwEk+VLPmx
X-Received: by 10.14.115.195 with SMTP id e43mr751110eeh.76.1398070563851;
	Mon, 21 Apr 2014 01:56:03 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	44sm101728923eek.30.2014.04.21.01.56.02 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 21 Apr 2014 01:56:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Apr 2014 10:55:58 +0200
Message-Id: <1398070558-30504-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] fbida: update to latest git and make motif a PACKAGECONFIG option
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
X-List-Received-Date: Mon, 21 Apr 2014 08:56:06 -0000

The x11 dependencies are now deterministic instead of enabling based on
DISTRO_FEATURES without changing DEPENDS.

Disable motif by default as well, since *fb*ida is supposed to be
framebuffer only by default.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-graphics/fbida/fbida_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-graphics/fbida/fbida_git.bb
index 9eea664..f4dd01d 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif curl"
 
 SRC_URI = "git://git.kraxel.org/fbida"
-SRCREV = "cb0ce5fa5f42bfaea4f8f326bcd8914dd14e782d"
+SRCREV = "6aa5563cb3c8864ad15cf83eb6fca3b773da1099"
 PV = "2.09+git${SRCPV}"
 S = "${WORKDIR}/git"
 
@@ -21,15 +21,12 @@ PACKAGECONFIG ??= "gif png"
 PACKAGECONFIG[gif] = ",,libungif"
 PACKAGECONFIG[png] = ",,libpng"
 PACKAGECONFIG[tiff] = ",,tiff"
+PACKAGECONFIG[motif] = ",,libx11 libxext libxpm libxt openmotif"
 
 do_compile() {
     sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
     sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I${STAGING_INCDIR}:' ${S}/GNUmakefile
 
-    if [ -z "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" ]; then
-        sed -i -e '/^HAVE_MOTIF/s/:=.*$/:= no/' ${S}/GNUmakefile
-    fi
-
     # Be sure to respect preferences (force to "no")
     # Also avoid issues when ${BUILD_ARCH} == ${HOST_ARCH}
     if [ -z "${@base_contains('PACKAGECONFIG', 'gif', 'gif', '', d)}" ]; then
@@ -41,6 +38,9 @@ do_compile() {
     if [ -z "${@base_contains('PACKAGECONFIG', 'tiff', 'tiff', '', d)}" ]; then
         sed -i -e '/^HAVE_LIBTIFF/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
+    if [ -z "${@base_contains('PACKAGECONFIG', 'motif', 'motif', '', d)}" ]; then
+        sed -i -e '/^HAVE_MOTIF/s/:=.*$/:= no/' ${S}/GNUmakefile
+    fi
 
     oe_runmake
 }
-- 
1.9.0


