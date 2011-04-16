Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QB49l-0003Mm-5a
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 13:59:17 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2693953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=b7+ZhrmkuGkuGsrhYw6BQ7U//C3JDzDfe6Zi6Xa0j94=;
	b=Nc47s3qKbId3NaBNFUo+4mGHOeAS23ge/dBTUEb1y4Mc/vmHrfs488QwS1k4ShhO6G
	uFJNzJ//+j1wLvNAx3vx3PufW8chhaYs26hlV4SD1ONJ/PLnb2odxZgkIb5k2BprsbPw
	jIQsswNOXF7TtF/+eh+pYoQp5LRnGxC7atvhI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=duRCstBibU2+fyENtdE2YGcG3Efs5boV0IFAfHUoaMZ4HtFPSpyLszPmh5GXjQrR6A
	FxomvBrPjXZmQ2yUVZF1y2wGziOw6PxwEl9teRmPhEBceEPWnNIEVt8U7sCy3K+B+4KM
	uJT6I/IgAxSUh/POo5rVBM7aJ2nhGB5nGerlc=
Received: by 10.223.27.18 with SMTP id g18mr723051fac.52.1302955020231;
	Sat, 16 Apr 2011 04:57:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x16sm1066302fal.43.2011.04.16.04.56.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Apr 2011 04:56:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Apr 2011 13:56:53 +0200
Message-Id: <6fe4d8981ace4a9210e63ac1c52e2dd60380e0f6.1302954782.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1302954782.git.Martin.Jansa@gmail.com>
References: <cover.1302954782.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] xserver-xorg: upgrade to 1.10.0.902
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
X-List-Received-Date: Sat, 16 Apr 2011 11:59:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ack-assume-pixman-supports-overlapped-blt.patch |    0
 .../hack-fbdev-ignore-return-mode.patch            |    0
 ...rg_1.10.0.901.bb => xserver-xorg_1.10.0.902.bb} |    5 +++--
 .../xorg-xserver/xserver-xorg_git.bb               |    6 +++---
 4 files changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.901 => xserver-xorg-1.10.0.902}/hack-assume-pixman-supports-overlapped-blt.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.901 => xserver-xorg-1.10.0.902}/hack-fbdev-ignore-return-mode.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg_1.10.0.901.bb => xserver-xorg_1.10.0.902.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.901/hack-assume-pixman-supports-overlapped-blt.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.902/hack-assume-pixman-supports-overlapped-blt.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.901/hack-assume-pixman-supports-overlapped-blt.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.902/hack-assume-pixman-supports-overlapped-blt.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.901/hack-fbdev-ignore-return-mode.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.902/hack-fbdev-ignore-return-mode.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.901/hack-fbdev-ignore-return-mode.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.902/hack-fbdev-ignore-return-mode.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.901.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.902.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.901.bb
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.902.bb
index c1d9566..47fd3f8 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.901.bb
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.902.bb
@@ -2,6 +2,7 @@
 DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
 
 require xorg-xserver-common.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
@@ -12,8 +13,8 @@ SRC_URI += " \
             file://hack-fbdev-ignore-return-mode.patch \
             file://hack-assume-pixman-supports-overlapped-blt.patch \
            "
-SRC_URI[md5sum] = "d750cf5f6342b548b7ac2be56e9d1841"
-SRC_URI[sha256sum] = "de18f52c35fc3d3f18c7e905296f9de5ac42dc71e4e01da9ae8e154a78c7771c"
+SRC_URI[md5sum] = "65e5db9e614cd75e97840247c3754521"
+SRC_URI[sha256sum] = "994ab87bb0cc9b56203e01e3294fddd502a96d074139496ea4ffc03c95b41b42"
 
 do_install_prepend() {
         mkdir -p ${D}/${libdir}/X11/fonts
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
index be441a3..d18bdd7 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
-PV = "1.10.0.901"
+PV = "1.10.0.902"
 PR = "${INC_PR}.0"
 PR_append = "+gitr${SRCPV}"
 PE = "2"
 
-#DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "1f51fe4f748b2997e466863d8387bd6791b32931"
+SRCREV = "ec6e1e45627de2bb851f135df0507a360d0d99e6"
 SRC_URI = " \
   git://anongit.freedesktop.org/xorg/xserver;protocol=git;branch=server-1.10-branch \
   file://hack-fbdev-ignore-return-mode.patch \
-- 
1.7.5.rc1



