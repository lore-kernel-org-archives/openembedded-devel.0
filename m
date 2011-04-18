Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBlnQ-0007Fg-FC
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:35:08 +0200
Received: by fxm19 with SMTP id 19so3317704fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ZlfrxK8a3IRp5KKMR2cIpYnCDqSeF5DrWQ5+9LE3N10=;
	b=tQq1FJjNWfFTa1K3rcHoFzwyNpaPf9rOkTNMEVyH8wdW5XFwqX9fLsXqiwWKMf1jyB
	mxXdgw/6dHSGf5zly+hNx5endFHxGiZGgLahV/c5lDTgS5qkuw01rIkE/qO4UtakfvIH
	0sVEUA5nJQfQ5s2I/0LaowSCNZC4/UwcxKw8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dknhRGBD5u+9XxCX5oGDGHWI9rWAZVgtyMD5iImN0TvxfUFax/Zmu+5M+sVuVcLdUn
	YsWIo0phvxj4ay9mC+8CG5YwKoeKWBQrtiKJK0/J5zbnqT9zVT/hCug35qsGquo3vUar
	SG7U8PGkG9wtNSor9H5pcnAs1mCt1SorCeszw=
Received: by 10.223.17.140 with SMTP id s12mr2400498faa.49.1303122768508;
	Mon, 18 Apr 2011 03:32:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 21sm1622401fav.41.2011.04.18.03.32.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:32:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:32:47 +0200
Message-Id: <f4b838e27ab427ff4a50aa137c5c0ca255bfe4d8.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/13] xorg-xserver: upgrade to 1.10.1
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
X-List-Received-Date: Mon, 18 Apr 2011 10:35:08 -0000

* only one revert since 1.10.0.902

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ack-assume-pixman-supports-overlapped-blt.patch |    0
 .../hack-fbdev-ignore-return-mode.patch            |    0
 ...r-xorg_1.10.0.902.bb => xserver-xorg_1.10.1.bb} |    4 ++--
 .../xorg-xserver/xserver-xorg_git.bb               |    4 ++--
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.902 => xserver-xorg-1.10.1}/hack-assume-pixman-supports-overlapped-blt.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.902 => xserver-xorg-1.10.1}/hack-fbdev-ignore-return-mode.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg_1.10.0.902.bb => xserver-xorg_1.10.1.bb} (88%)

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.902/hack-assume-pixman-supports-overlapped-blt.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/hack-assume-pixman-supports-overlapped-blt.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.902/hack-assume-pixman-supports-overlapped-blt.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/hack-assume-pixman-supports-overlapped-blt.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.902/hack-fbdev-ignore-return-mode.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/hack-fbdev-ignore-return-mode.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.902/hack-fbdev-ignore-return-mode.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/hack-fbdev-ignore-return-mode.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.902.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
similarity index 88%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.902.bb
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
index 47fd3f8..7cb7339 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.902.bb
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
@@ -13,8 +13,8 @@ SRC_URI += " \
             file://hack-fbdev-ignore-return-mode.patch \
             file://hack-assume-pixman-supports-overlapped-blt.patch \
            "
-SRC_URI[md5sum] = "65e5db9e614cd75e97840247c3754521"
-SRC_URI[sha256sum] = "994ab87bb0cc9b56203e01e3294fddd502a96d074139496ea4ffc03c95b41b42"
+SRC_URI[md5sum] = "75f117c74f2ecaf9dd167f6a66ac98de"
+SRC_URI[sha256sum] = "143c7c3d7d4428352e1153dffa34fd64af391f72d30b2a03e911e54e36f00b5d"
 
 do_install_prepend() {
         mkdir -p ${D}/${libdir}/X11/fonts
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
index d18bdd7..811c2d6 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
-PV = "1.10.0.902"
+PV = "1.10.1"
 PR = "${INC_PR}.0"
 PR_append = "+gitr${SRCPV}"
 PE = "2"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "ec6e1e45627de2bb851f135df0507a360d0d99e6"
+SRCREV = "a73311f8304193f9245fb077f173bf1e1d52e040" 
 SRC_URI = " \
   git://anongit.freedesktop.org/xorg/xserver;protocol=git;branch=server-1.10-branch \
   file://hack-fbdev-ignore-return-mode.patch \
-- 
1.7.5.rc1



