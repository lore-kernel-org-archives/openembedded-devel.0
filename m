Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1eH-00067K-7V
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:31:02 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so3100953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ktwhwmqFGHu48fuaKpwr9jP//Hi9GOLVc936ioIuAvQ=;
	b=JHUiZdE3Ctg9tqXSpax9k5MlaQVh+x4cNKLOhcjitT2KOAPEdJDdxJzno5UgYZe7S5
	ICzgv68Liyzj8AtmkgTLa0yB7bBAegaVRSWpDOvh8qp4f/suYU4dev8IDcC0IJjnhOZl
	jIh+mHsT13mR202aXnKepWrE61RSJFh/My/vc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Qj3QcfA18kzILHoeWhHz7O6D8AxpL+sNe/QCoI+vhEq7uD6e2jCByoFUUOr6MDgM+H
	nxhL7kw3otwyXTtGbdvdfh+Y/PbjHUCAtisaC2+ia5RgnwjAfS4UYPXwAwgEcz9IHOmI
	myLMIw1D59Qi3ZTGUY4LIUeIiMsH0GB3DjFZ8=
Received: by 10.223.104.148 with SMTP id p20mr5380263fao.11.1281972638403;
	Mon, 16 Aug 2010 08:30:38 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q17sm2500097faa.21.2010.08.16.08.30.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:20 +0200
Message-Id: <1281972620-7317-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 9/9] xorg-xserver: move older not pinned versions to obsolete dir
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
X-List-Received-Date: Mon, 16 Aug 2010 15:31:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../obsolete/xorg-xserver/xorg-xserver-common.inc  |  113 --------------------
 .../xorg-xserver/xserver-xorg-1.6.1/drmfix.patch   |   15 ---
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 ---
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 ---
 .../obsolete/xorg-xserver/xserver-xorg_1.6.1.bb    |   20 ----
 .../obsolete/xorg-xserver/xserver-xorg_1.7.2.bb    |   22 ----
 .../obsolete/xorg-xserver/xserver-xorg_1.7.3.bb    |   30 -----
 .../xorg/xorg-xserver/files/xcalibrate-xorg.diff   |   11 ++
 .../xorg/xorg-xserver/xorg-xserver-common.inc      |  113 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch |   13 +++
 .../xserver-xorg-1.3.0.0/glyphstr.patch            |   15 +++
 .../xorg-xserver/xserver-xorg-1.4.2/drmfix.patch   |   15 +++
 .../xorg-xserver/xserver-xorg-1.4/drmfix.patch     |   15 +++
 .../xorg-xserver/xserver-xorg-1.5.1/drmfix.patch   |   15 +++
 .../xorg-xserver/xserver-xorg-1.5.3/drmfix.patch   |   15 +++
 .../xorg-server-1.5.3-configure.patch              |   38 +++++++
 ...g-server-1.5.3-glcore-prepare-for-dynamic.patch |  108 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg-1.6.1/drmfix.patch   |   15 +++
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 +++
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 +++
 .../xorg/xorg-xserver/xserver-xorg/dolt-fix.patch  |   22 ++++
 .../xorg/xorg-xserver/xserver-xorg/drmfix.patch    |   15 +++
 .../xorg/xorg-xserver/xserver-xorg/fontfile.patch  |   11 ++
 .../xorg/xorg-xserver/xserver-xorg/freetype.patch  |   22 ++++
 .../hack-fbdev-ignore-return-mode.patch            |   39 +++++++
 .../xserver-xorg/imake-installed.patch             |   11 ++
 .../xserver-xorg/no-screen-blanking.patch          |   15 +++
 .../xserver-xorg/xpconfig-parentdir.patch          |   30 +++++
 .../xorg/xorg-xserver/xserver-xorg_1.2.0.bb        |   15 +++
 .../xorg/xorg-xserver/xserver-xorg_1.3.0.0.bb      |   18 +++
 .../xorg/xorg-xserver/xserver-xorg_1.4.2.bb        |   20 ++++
 .../obsolete/xorg/xorg-xserver/xserver-xorg_1.4.bb |   18 +++
 .../xorg/xorg-xserver/xserver-xorg_1.5.1.bb        |   17 +++
 .../xorg/xorg-xserver/xserver-xorg_1.5.3.bb        |   21 ++++
 .../xorg/xorg-xserver/xserver-xorg_1.6.1.bb        |   20 ++++
 .../xorg/xorg-xserver/xserver-xorg_1.7.2.bb        |   22 ++++
 .../xorg/xorg-xserver/xserver-xorg_1.7.3.bb        |   30 +++++
 .../files/fix-picturestr-include-order.patch       |   15 ---
 recipes/xorg-xserver/files/pkgconfig_fix.patch     |   13 ---
 .../files/report-correct-randr10.patch             |   25 -----
 .../files/report-correct-randr12.patch             |   29 -----
 recipes/xorg-xserver/files/sysroot_fix.patch       |   13 ---
 recipes/xorg-xserver/files/xcalibrate-xorg.diff    |   11 --
 recipes/xorg-xserver/files/xorg-avr32-support.diff |   21 ----
 .../fix-picturestr-include-order.patch             |   15 +++
 .../report-correct-randr12.patch                   |   29 +++++
 .../xserver-kdrive-1.5.3/sysroot_fix.patch         |   13 +++
 .../fix-picturestr-include-order.patch             |   15 +++
 .../report-correct-randr10.patch                   |   25 +++++
 .../fix-picturestr-include-order.patch             |   15 +++
 .../fix-picturestr-include-order.patch             |   15 +++
 .../report-correct-randr10.patch                   |   25 +++++
 .../xserver-kdrive/pkgconfig_fix.patch             |   13 +++
 .../xserver-kdrive/report-correct-randr10.patch    |   25 +++++
 .../xserver-kdrive/xorg-avr32-support.diff         |   21 ++++
 .../xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch |   13 ---
 .../xserver-xorg-1.3.0.0/glyphstr.patch            |   15 ---
 .../xorg-xserver/xserver-xorg-1.4.2/drmfix.patch   |   15 ---
 recipes/xorg-xserver/xserver-xorg-1.4/drmfix.patch |   15 ---
 .../xorg-xserver/xserver-xorg-1.5.1/drmfix.patch   |   15 ---
 .../xorg-xserver/xserver-xorg-1.5.3/drmfix.patch   |   15 ---
 .../xorg-server-1.5.3-configure.patch              |   38 -------
 ...g-server-1.5.3-glcore-prepare-for-dynamic.patch |  108 -------------------
 .../xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch |   22 ++++
 .../xserver-xorg-1.7.1/randr-support.patch         |   96 +++++++++++++++++
 .../xserver-xorg-1.7.1/sysroot_fix.patch           |   13 +++
 .../xorg-xserver/xserver-xorg-1.7.4/dolt-fix.patch |   22 ++++
 .../hack-fbdev-ignore-return-mode.patch            |   39 +++++++
 .../xserver-xorg-1.7.4/randr-support.patch         |   96 +++++++++++++++++
 .../xserver-xorg-1.7.4/sysroot_fix.patch           |   13 +++
 .../xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch |   22 ++++
 .../hack-fbdev-ignore-return-mode.patch            |   39 +++++++
 .../xserver-xorg-1.8.1/randr-support.patch         |   96 +++++++++++++++++
 ...ake-sure-that-DisplayModeRec-name-is-init.patch |   25 -----
 .../xserver-xorg-1.8.99.906/dolt-fix.patch         |   22 ++++
 .../hack-fbdev-ignore-return-mode.patch            |   39 +++++++
 .../xserver-xorg-1.8.99.906/randr-support.patch    |   96 +++++++++++++++++
 .../xorg-xserver/xserver-xorg/dolt-fix-1.7.0.patch |   22 ----
 recipes/xorg-xserver/xserver-xorg/dolt-fix.patch   |   22 ----
 recipes/xorg-xserver/xserver-xorg/drmfix.patch     |   15 ---
 recipes/xorg-xserver/xserver-xorg/fontfile.patch   |   11 --
 recipes/xorg-xserver/xserver-xorg/freetype.patch   |   22 ----
 .../hack-fbdev-ignore-return-mode.patch            |   39 -------
 .../xserver-xorg/imake-installed.patch             |   11 --
 .../xserver-xorg/no-screen-blanking.patch          |   15 ---
 .../xserver-xorg/randr-support-1.7.0.patch         |   96 -----------------
 .../xserver-xorg/xpconfig-parentdir.patch          |   30 -----
 recipes/xorg-xserver/xserver-xorg_1.2.0.bb         |   15 ---
 recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb       |   18 ---
 recipes/xorg-xserver/xserver-xorg_1.4.2.bb         |   20 ----
 recipes/xorg-xserver/xserver-xorg_1.4.bb           |   18 ---
 recipes/xorg-xserver/xserver-xorg_1.5.1.bb         |   17 ---
 recipes/xorg-xserver/xserver-xorg_1.5.3.bb         |   21 ----
 recipes/xorg-xserver/xserver-xorg_1.7.1.bb         |    4 +-
 recipes/xorg-xserver/xserver-xorg_1.7.4.bb         |    4 +-
 recipes/xorg-xserver/xserver-xorg_1.8.1.bb         |    4 +-
 recipes/xorg-xserver/xserver-xorg_1.8.99.906.bb    |    6 +-
 recipes/xorg-xserver/xserver-xorg_git.bb           |   13 ++-
 98 files changed, 1589 insertions(+), 1021 deletions(-)
 delete mode 100644 recipes/obsolete/xorg-xserver/xorg-xserver-common.inc
 delete mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.6.1/drmfix.patch
 delete mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.6.1/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.7.3/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg_1.6.1.bb
 delete mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg_1.7.2.bb
 delete mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg_1.7.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/files/xcalibrate-xorg.diff
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xorg-xserver-common.inc
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.3.0.0/glyphstr.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.4.2/drmfix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.4/drmfix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.1/drmfix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/drmfix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-configure.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-glcore-prepare-for-dynamic.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.6.1/drmfix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.6.1/hack-assume-pixman-supports-overlapped-blt.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.7.3/hack-assume-pixman-supports-overlapped-blt.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg/dolt-fix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg/drmfix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg/fontfile.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg/freetype.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg/hack-fbdev-ignore-return-mode.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg/imake-installed.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg/no-screen-blanking.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg/xpconfig-parentdir.patch
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.3.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.4.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.5.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.5.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.6.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.7.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.7.3.bb
 delete mode 100644 recipes/xorg-xserver/files/fix-picturestr-include-order.patch
 delete mode 100644 recipes/xorg-xserver/files/pkgconfig_fix.patch
 delete mode 100644 recipes/xorg-xserver/files/report-correct-randr10.patch
 delete mode 100644 recipes/xorg-xserver/files/report-correct-randr12.patch
 delete mode 100644 recipes/xorg-xserver/files/sysroot_fix.patch
 delete mode 100644 recipes/xorg-xserver/files/xcalibrate-xorg.diff
 delete mode 100644 recipes/xorg-xserver/files/xorg-avr32-support.diff
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-1.3.0.0/fix-picturestr-include-order.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-1.5.3/sysroot_fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-imageon/fix-picturestr-include-order.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-imageon/report-correct-randr10.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-nomadik/fix-picturestr-include-order.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-xomap/fix-picturestr-include-order.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-xomap/report-correct-randr10.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive/pkgconfig_fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive/report-correct-randr10.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive/xorg-avr32-support.diff
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.3.0.0/glyphstr.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.4.2/drmfix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.4/drmfix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.5.1/drmfix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.5.3/drmfix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-configure.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-glcore-prepare-for-dynamic.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.4/dolt-fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.4/hack-fbdev-ignore-return-mode.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.4/randr-support.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.4/sysroot_fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.99.906/0001-xf86Modes-make-sure-that-DisplayModeRec-name-is-init.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.99.906/dolt-fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.99.906/hack-fbdev-ignore-return-mode.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.99.906/randr-support.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/dolt-fix-1.7.0.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/dolt-fix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/drmfix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/fontfile.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/freetype.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/hack-fbdev-ignore-return-mode.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/imake-installed.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/no-screen-blanking.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/randr-support-1.7.0.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg/xpconfig-parentdir.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.2.0.bb
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.4.2.bb
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.4.bb
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.5.1.bb
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.5.3.bb

diff --git a/recipes/obsolete/xorg-xserver/xorg-xserver-common.inc b/recipes/obsolete/xorg-xserver/xorg-xserver-common.inc
deleted file mode 100644
index 79905d2..0000000
--- a/recipes/obsolete/xorg-xserver/xorg-xserver-common.inc
+++ /dev/null
@@ -1,113 +0,0 @@
-HOMEPAGE = "http://www.x.org"
-SECTION = "x11/base"
-LICENSE = "MIT-X"
-
-INC_PR = "r14"
-
-PROVIDES = "virtual/xserver"
-
-# Config manager for xserver, options are: hal, udev, empty (for configuration in xorg.conf)
-DISTRO_XORG_CONFIG_MANAGER ?= "hal"
-DISTRO_XORG_CONFIG_MANAGER_shr ?= ""
-
-# default none, enabled by DISTRO_XORG_CONFIG_MANAGER setting
-CONFIG_MANAGER_OPTION += "${@['--disable-config-hal','--enable-config-hal',''][bb.data.getVar('DISTRO_XORG_CONFIG_MANAGER',d) in ['hal']]}"
-CONFIG_MANAGER_OPTION += "${@['--disable-config-udev','--enable-config-udev',''][bb.data.getVar('DISTRO_XORG_CONFIG_MANAGER',d) in ['udev']]}"
-
-DEPENDS = "fontconfig freetype flex-native liblbxutil kbproto \ 
-xf86driproto drm glproto randrproto renderproto fixesproto damageproto \
-xcmiscproto xextproto xproto xf86miscproto xf86vidmodeproto xf86bigfontproto \
-scrnsaverproto bigreqsproto resourceproto fontsproto inputproto \
-xf86dgaproto videoproto compositeproto trapproto recordproto dmxproto \
-resourceproto xineramaproto xtrans evieext libxkbfile libxfont libxau \
-libfontenc libxdmcp libxxf86vm libxaw libxmu libxt libxpm libxext libx11 \
-libxkbui libxxf86misc libxi libdmx libxtst libxres virtual/libgl libxcalibrate \
-libxv ${DISTRO_XORG_CONFIG_MANAGER}"
-
-RRECOMMENDS_${PN} = "libpciaccess"
-
-XORG_PN = "xorg-server"
-SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2;name=archive"
-
-S = "${WORKDIR}/${XORG_PN}-${PV}"
-
-inherit autotools pkgconfig glx-use-tls
-
-EXTRA_OECONF += " --enable-xcalibrate \
-                  --enable-kdrive \
-                  --enable-xephyr \
-                  --disable-xfbdev \
-                  --disable-xnest \
-                  --disable-kdrive-vesa \
-                  --with-default-font-path="/usr/share/fonts/X11/misc" \
-                  ac_cv_file__usr_share_sgml_X11_defs_ent=no"
-
-# CONFIG_MANAGER_OPTION is used only in recipes which support those options
-
-EXTRA_OECONF_append_arm = " ac_cv_header_linux_apm_bios_h=no "
-
-PACKAGES =+ "xserver-security-policy"
-FILES_xserver-security-policy += "${libdir}/xserver/SecurityPolicy"
-RRECOMMENDS_${PN} += "xserver-security-policy xkeyboard-config xorg-minimal-fonts rgb xserver-xorg-conf"
-
-PACKAGES =+ "${PN}-sdl ${PN}-fbdev ${PN}-xprint ${PN}-xvfb ${PN}-utils ${PN}-xephyr"
-
-FILES_${PN}-fbdev = "${bindir}/Xfbdev"
-FILES_${PN}-sdl = "${bindir}/Xsdl"
-FILES_${PN}-xprint = "${libdir}/X11/xserver/*/print"
-FILES_${PN}-xvfb = "${bindir}/Xvfb"
-FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
-FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules ${libdir}/xorg/modules /etc/X11 ${libdir}/xorg/protocol.txt"
-FILES_${PN}-doc += "${libdir}/X11/doc /usr/share/X11/xkb/compiled/README.compiled"
-FILES_${PN}-xephyr = "${bindir}/Xephyr"
-
-FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
-                    ${libdir}/xorg/modules/*/.debug \
-		    ${libdir}/xorg/modules/*/*/.debug \
-		    "
-
-# Split out some modules and extensions from the main package
-# These aren't needed for basic operations and only take up space:
-#  32.0k   libdri.so
-#  336.0k  libglx.so
-#  1360k   libint10.so
-#  180.0k  libwfb.so
-#  320.0k  libxaa.so
-#  124.0k  libxf1bpp.so
-#  84.0k   libxf4bpp.so
-
-PACKAGES =+ "${PN}-extension-dri \
-             ${PN}-extension-dri2 \
-             ${PN}-extension-glx \
-             ${PN}-module-libint10 \
-             ${PN}-module-libafb \
-             ${PN}-module-libwfb  \
-             ${PN}-module-libmfb \
-             ${PN}-module-libcfb \
-             ${PN}-module-xaa \
-             ${PN}-module-libxf1bpp \
-             ${PN}-module-libxf4bpp"
-
-FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
-FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
-FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
-FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
-FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
-FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
-FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
-FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
-FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
-FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
-FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
-
-PACKAGES =+ "${PN}-multimedia-modules"
-
-FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
-
-do_stage() {
-	autotools_stage_all
-}
-
-do_install_append () {
-	ln -sf ${datadir}/fonts/X11 ${D}/${libdir}/X11/fonts
-}
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.6.1/drmfix.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.6.1/drmfix.patch
deleted file mode 100644
index 8ebda98..0000000
--- a/recipes/obsolete/xorg-xserver/xserver-xorg-1.6.1/drmfix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
-
-Index: xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am
-===================================================================
---- xorg-server-1.5.1.orig/hw/xfree86/os-support/linux/Makefile.am	2008-09-23 19:24:59.000000000 +0100
-+++ xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am	2008-10-27 13:27:40.000000000 +0000
-@@ -40,7 +40,7 @@
- 
- AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
- 
--INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
-+INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
- 
- # FIXME: These need to be added to the build
- LNX_EXTRA_SRCS = \
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.6.1/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.6.1/hack-assume-pixman-supports-overlapped-blt.patch
deleted file mode 100644
index a947582..0000000
--- a/recipes/obsolete/xorg-xserver/xserver-xorg-1.6.1/hack-assume-pixman-supports-overlapped-blt.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff --git a/fb/fbcopy.c b/fb/fbcopy.c
-index 07eb663..ba394b7 100644
---- a/fb/fbcopy.c
-+++ b/fb/fbcopy.c
-@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
-     while (nbox--)
-     {
- #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
--	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
--	    !upsidedown)
-+	if (pm == FB_ALLONES && alu == GXcopy)
- 	{
- 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
- 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.3/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.3/hack-assume-pixman-supports-overlapped-blt.patch
deleted file mode 100644
index a947582..0000000
--- a/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.3/hack-assume-pixman-supports-overlapped-blt.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff --git a/fb/fbcopy.c b/fb/fbcopy.c
-index 07eb663..ba394b7 100644
---- a/fb/fbcopy.c
-+++ b/fb/fbcopy.c
-@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
-     while (nbox--)
-     {
- #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
--	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
--	    !upsidedown)
-+	if (pm == FB_ALLONES && alu == GXcopy)
- 	{
- 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
- 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg_1.6.1.bb b/recipes/obsolete/xorg-xserver/xserver-xorg_1.6.1.bb
deleted file mode 100644
index 630ec57..0000000
--- a/recipes/obsolete/xorg-xserver/xserver-xorg_1.6.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl xineramaproto libxinerama"
-RDEPENDS_${PN} += "hal"
-PE = "2"
-PR = "${INC_PR}.2"
-
-SRC_URI += "file://sysroot_fix.patch \
-	    file://dolt-fix.patch"
-
-# This requires support in pixman, which the default one doesn't have
-SRC_URI_append_angstrom = " file://hack-assume-pixman-supports-overlapped-blt.patch"
-
-MESA_VER = "7.2"
-
-export LDFLAGS += " -ldl "
-
-SRC_URI[archive.md5sum] = "ed0878bf32a24d4948c3b8a122a39eff"
-SRC_URI[archive.sha256sum] = "0edbaa994797cb7944a4129d33b634ad99164b21ec32355d56996a178d38bfcf"
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg_1.7.2.bb b/recipes/obsolete/xorg-xserver/xserver-xorg_1.7.2.bb
deleted file mode 100644
index efe68d2..0000000
--- a/recipes/obsolete/xorg-xserver/xserver-xorg_1.7.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts"
-PE = "2"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://sysroot_fix.patch \
-            file://dolt-fix-1.7.0.patch \
-            file://randr-support-1.7.0.patch \
-           "
-do_install_prepend() {
-        mkdir -p ${D}/${libdir}/X11/fonts
-}
-
-EXTRA_OECONF += "--disable-xephyr --disable-config-hal --disable-xinerama --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
-EXTRA_OECONF += " --disable-glx-tls --enable-dri2 --disable-unit-tests "
-
-export LDFLAGS += " -ldl "
-
-SRC_URI[archive.md5sum] = "5c087e0f555203065fd90d02ef5f736e"
-SRC_URI[archive.sha256sum] = "f4fb49209a6f3cb1c5b039b1f43870774e2eac1540b4d3235a2f13bc441da159"
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg_1.7.3.bb b/recipes/obsolete/xorg-xserver/xserver-xorg_1.7.3.bb
deleted file mode 100644
index fc8c354..0000000
--- a/recipes/obsolete/xorg-xserver/xserver-xorg_1.7.3.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts"
-PE = "2"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://sysroot_fix.patch \
-            file://dolt-fix-1.7.0.patch \
-            file://randr-support-1.7.0.patch \
-            file://hack-fbdev-ignore-return-mode.patch \
-           "
-
-SRC_URI_append_angstrom = " file://hack-assume-pixman-supports-overlapped-blt.patch"
-SRC_URI_append_shr = " file://hack-assume-pixman-supports-overlapped-blt.patch"
-
-do_install_prepend() {
-        mkdir -p ${D}/${libdir}/X11/fonts
-}
-
-# The NVidia driver requires Xinerama support in the X server. Ion uses it.
-XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
-
-EXTRA_OECONF += " --enable-config-hal ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
-EXTRA_OECONF += " --disable-glx-tls --enable-dri2 --disable-unit-tests "
-
-export LDFLAGS += " -ldl "
-
-SRC_URI[archive.md5sum] = "4c63b22cad9ed8ae8b86561f0f92c327"
-SRC_URI[archive.sha256sum] = "4b644113cd030fc77615c03c7b6529e063dc1d471ec6a990e6f62eb45a9c2db4"
diff --git a/recipes/obsolete/xorg/xorg-xserver/files/xcalibrate-xorg.diff b/recipes/obsolete/xorg/xorg-xserver/files/xcalibrate-xorg.diff
new file mode 100644
index 0000000..65121ef
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/files/xcalibrate-xorg.diff
@@ -0,0 +1,11 @@
+--- /tmp/configure.ac	2008-10-29 18:53:23.000000000 +0100
++++ xorg-server-1.4.2/configure.ac	2008-10-29 18:53:40.000000000 +0100
+@@ -865,7 +865,7 @@
+        FONTPATH="built-ins"
+ fi
+ 
+-if test "x$XCALIBRATE" = xyes && test "$KDRIVE" = yes; then
++if test "x$XCALIBRATE" = xyes ; then
+    AC_DEFINE(XCALIBRATE, 1, [Build XCalibrate extension])
+    REQUIRED_MODULES="$REQUIRED_MODULES xcalibrateproto"
+ else
diff --git a/recipes/obsolete/xorg/xorg-xserver/xorg-xserver-common.inc b/recipes/obsolete/xorg/xorg-xserver/xorg-xserver-common.inc
new file mode 100644
index 0000000..79905d2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xorg-xserver-common.inc
@@ -0,0 +1,113 @@
+HOMEPAGE = "http://www.x.org"
+SECTION = "x11/base"
+LICENSE = "MIT-X"
+
+INC_PR = "r14"
+
+PROVIDES = "virtual/xserver"
+
+# Config manager for xserver, options are: hal, udev, empty (for configuration in xorg.conf)
+DISTRO_XORG_CONFIG_MANAGER ?= "hal"
+DISTRO_XORG_CONFIG_MANAGER_shr ?= ""
+
+# default none, enabled by DISTRO_XORG_CONFIG_MANAGER setting
+CONFIG_MANAGER_OPTION += "${@['--disable-config-hal','--enable-config-hal',''][bb.data.getVar('DISTRO_XORG_CONFIG_MANAGER',d) in ['hal']]}"
+CONFIG_MANAGER_OPTION += "${@['--disable-config-udev','--enable-config-udev',''][bb.data.getVar('DISTRO_XORG_CONFIG_MANAGER',d) in ['udev']]}"
+
+DEPENDS = "fontconfig freetype flex-native liblbxutil kbproto \ 
+xf86driproto drm glproto randrproto renderproto fixesproto damageproto \
+xcmiscproto xextproto xproto xf86miscproto xf86vidmodeproto xf86bigfontproto \
+scrnsaverproto bigreqsproto resourceproto fontsproto inputproto \
+xf86dgaproto videoproto compositeproto trapproto recordproto dmxproto \
+resourceproto xineramaproto xtrans evieext libxkbfile libxfont libxau \
+libfontenc libxdmcp libxxf86vm libxaw libxmu libxt libxpm libxext libx11 \
+libxkbui libxxf86misc libxi libdmx libxtst libxres virtual/libgl libxcalibrate \
+libxv ${DISTRO_XORG_CONFIG_MANAGER}"
+
+RRECOMMENDS_${PN} = "libpciaccess"
+
+XORG_PN = "xorg-server"
+SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2;name=archive"
+
+S = "${WORKDIR}/${XORG_PN}-${PV}"
+
+inherit autotools pkgconfig glx-use-tls
+
+EXTRA_OECONF += " --enable-xcalibrate \
+                  --enable-kdrive \
+                  --enable-xephyr \
+                  --disable-xfbdev \
+                  --disable-xnest \
+                  --disable-kdrive-vesa \
+                  --with-default-font-path="/usr/share/fonts/X11/misc" \
+                  ac_cv_file__usr_share_sgml_X11_defs_ent=no"
+
+# CONFIG_MANAGER_OPTION is used only in recipes which support those options
+
+EXTRA_OECONF_append_arm = " ac_cv_header_linux_apm_bios_h=no "
+
+PACKAGES =+ "xserver-security-policy"
+FILES_xserver-security-policy += "${libdir}/xserver/SecurityPolicy"
+RRECOMMENDS_${PN} += "xserver-security-policy xkeyboard-config xorg-minimal-fonts rgb xserver-xorg-conf"
+
+PACKAGES =+ "${PN}-sdl ${PN}-fbdev ${PN}-xprint ${PN}-xvfb ${PN}-utils ${PN}-xephyr"
+
+FILES_${PN}-fbdev = "${bindir}/Xfbdev"
+FILES_${PN}-sdl = "${bindir}/Xsdl"
+FILES_${PN}-xprint = "${libdir}/X11/xserver/*/print"
+FILES_${PN}-xvfb = "${bindir}/Xvfb"
+FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
+FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules ${libdir}/xorg/modules /etc/X11 ${libdir}/xorg/protocol.txt"
+FILES_${PN}-doc += "${libdir}/X11/doc /usr/share/X11/xkb/compiled/README.compiled"
+FILES_${PN}-xephyr = "${bindir}/Xephyr"
+
+FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
+                    ${libdir}/xorg/modules/*/.debug \
+		    ${libdir}/xorg/modules/*/*/.debug \
+		    "
+
+# Split out some modules and extensions from the main package
+# These aren't needed for basic operations and only take up space:
+#  32.0k   libdri.so
+#  336.0k  libglx.so
+#  1360k   libint10.so
+#  180.0k  libwfb.so
+#  320.0k  libxaa.so
+#  124.0k  libxf1bpp.so
+#  84.0k   libxf4bpp.so
+
+PACKAGES =+ "${PN}-extension-dri \
+             ${PN}-extension-dri2 \
+             ${PN}-extension-glx \
+             ${PN}-module-libint10 \
+             ${PN}-module-libafb \
+             ${PN}-module-libwfb  \
+             ${PN}-module-libmfb \
+             ${PN}-module-libcfb \
+             ${PN}-module-xaa \
+             ${PN}-module-libxf1bpp \
+             ${PN}-module-libxf4bpp"
+
+FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
+FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
+FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
+FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
+FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
+FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
+FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
+FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
+FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
+FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
+FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
+
+PACKAGES =+ "${PN}-multimedia-modules"
+
+FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
+
+do_stage() {
+	autotools_stage_all
+}
+
+do_install_append () {
+	ln -sf ${datadir}/fonts/X11 ${D}/${libdir}/X11/fonts
+}
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch
new file mode 100644
index 0000000..72bdcda
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch
@@ -0,0 +1,13 @@
+upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
+
+--- xorg-server-1.3.0.0.orig/hw/xfree86/os-support/linux/Makefile.am
++++ xorg-server-1.3.0.0/hw/xfree86/os-support/linux/Makefile.am
+@@ -38,7 +38,7 @@
+ 
+ AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(XORG_CFLAGS) $(PLATFORM_DEFINES)
+ 
+-INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
++INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
+ 
+ # FIXME: These need to be added to the build
+ LNX_EXTRA_SOURCES = \
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.3.0.0/glyphstr.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.3.0.0/glyphstr.patch
new file mode 100644
index 0000000..6dfe7ba
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.3.0.0/glyphstr.patch
@@ -0,0 +1,15 @@
+upstream: https://bugs.freedesktop.org/show_bug.cgi?id=22133
+status: Rejected
+comment: It's a bit unclear if this patch was ever needed, but recent versions seem
+ to work fine without it.
+
+--- xorg-server-1.3.0.0/render/glyphstr.h~	2006-09-18 03:04:18.000000000 -0300
++++ xorg-server-1.3.0.0/render/glyphstr.h	2008-02-03 22:14:23.187159732 -0200
+@@ -25,6 +25,7 @@
+ #ifndef _GLYPHSTR_H_
+ #define _GLYPHSTR_H_
+ 
++#include <X11/X.h>
+ #include <X11/extensions/renderproto.h>
+ #include "picture.h"
+ #include "screenint.h"
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.4.2/drmfix.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.4.2/drmfix.patch
new file mode 100644
index 0000000..dde7637
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.4.2/drmfix.patch
@@ -0,0 +1,15 @@
+upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
+
+Index: xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am
+===================================================================
+--- xorg-server-1.4.orig/hw/xfree86/os-support/linux/Makefile.am	2007-08-23 21:04:53.000000000 +0200
++++ xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am	2008-03-13 18:27:23.000000000 +0100
+@@ -41,7 +41,7 @@
+ 
+ AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
+ 
+-INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
++INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
+ 
+ # FIXME: These need to be added to the build
+ LNX_EXTRA_SRCS = \
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.4/drmfix.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.4/drmfix.patch
new file mode 100644
index 0000000..dde7637
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.4/drmfix.patch
@@ -0,0 +1,15 @@
+upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
+
+Index: xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am
+===================================================================
+--- xorg-server-1.4.orig/hw/xfree86/os-support/linux/Makefile.am	2007-08-23 21:04:53.000000000 +0200
++++ xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am	2008-03-13 18:27:23.000000000 +0100
+@@ -41,7 +41,7 @@
+ 
+ AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
+ 
+-INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
++INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
+ 
+ # FIXME: These need to be added to the build
+ LNX_EXTRA_SRCS = \
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.1/drmfix.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.1/drmfix.patch
new file mode 100644
index 0000000..8ebda98
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.1/drmfix.patch
@@ -0,0 +1,15 @@
+upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
+
+Index: xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am
+===================================================================
+--- xorg-server-1.5.1.orig/hw/xfree86/os-support/linux/Makefile.am	2008-09-23 19:24:59.000000000 +0100
++++ xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am	2008-10-27 13:27:40.000000000 +0000
+@@ -40,7 +40,7 @@
+ 
+ AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
+ 
+-INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
++INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
+ 
+ # FIXME: These need to be added to the build
+ LNX_EXTRA_SRCS = \
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/drmfix.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/drmfix.patch
new file mode 100644
index 0000000..8ebda98
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/drmfix.patch
@@ -0,0 +1,15 @@
+upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
+
+Index: xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am
+===================================================================
+--- xorg-server-1.5.1.orig/hw/xfree86/os-support/linux/Makefile.am	2008-09-23 19:24:59.000000000 +0100
++++ xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am	2008-10-27 13:27:40.000000000 +0000
+@@ -40,7 +40,7 @@
+ 
+ AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
+ 
+-INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
++INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
+ 
+ # FIXME: These need to be added to the build
+ LNX_EXTRA_SRCS = \
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-configure.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-configure.patch
new file mode 100644
index 0000000..85db023
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-configure.patch
@@ -0,0 +1,38 @@
+From ddb265e3c5e99065ceeef92ecb9fd94b4c3e169e Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniel@fooishbar.org>
+Date: Thu, 7 May 2009 14:23:25 +0200
+Subject: [PATCH 36/78] configure.ac: Add GLX_SYS_LIBS for Xvfb and Xnest
+
+This fixes the linking for these two when using DRI2, which requires
+DLOPEN_LIBS.
+(cherry picked from commit ae38151ddda9984effca5bb7c582540061201dce)
+
+Conflicts:
+
+	configure.ac
+---
+ configure.ac |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: xorg-server-1.5.3/configure.ac
+===================================================================
+--- xorg-server-1.5.3.orig/configure.ac	2008-11-05 11:46:15.000000000 -0800
++++ xorg-server-1.5.3/configure.ac	2009-09-14 19:48:11.043879237 -0700
+@@ -1215,7 +1215,7 @@
+ 
+ if test "x$XVFB" = xyes; then
+ 	XVFB_LIBS="$FB_LIB $FIXES_LIB $XEXT_LIB $CONFIG_LIB $DBE_LIB $XTRAP_LIB $RECORD_LIB $GLX_LIBS $RENDER_LIB $RANDR_LIB $DAMAGE_LIB $MIEXT_DAMAGE_LIB $MIEXT_SHADOW_LIB $XI_LIB $XKB_LIB $XKB_STUB_LIB $COMPOSITE_LIB $XPSTUBS_LIB"
+-	XVFB_SYS_LIBS="$XVFBMODULES_LIBS"
++	XVFB_SYS_LIBS="$XVFBMODULES_LIBS $GLX_SYS_LIBS"
+ 	AC_SUBST([XVFB_LIBS])
+ 	AC_SUBST([XVFB_SYS_LIBS])
+ fi
+@@ -1233,7 +1233,7 @@
+ 
+ if test "x$XNEST" = xyes; then
+ 	XNEST_LIBS="$FB_LIB $FIXES_LIB $MI_LIB $XEXT_LIB $DBE_LIB $XTRAP_LIB $RECORD_LIB $GLX_LIBS $RENDER_LIB $RANDR_LIB $DAMAGE_LIB $MIEXT_DAMAGE_LIB $MIEXT_SHADOW_LIB $XI_LIB $XKB_LIB $XKB_STUB_LIB $COMPOSITE_LIB $XPSTUBS_LIB $DIX_LIB $OS_LIB $CONFIG_LIB"
+-	XNEST_SYS_LIBS="$XNESTMODULES_LIBS"
++	XNEST_SYS_LIBS="$XNESTMODULES_LIBS $GLX_SYS_LIBS"
+ 	AC_SUBST([XNEST_LIBS])
+ 	AC_SUBST([XNEST_SYS_LIBS])
+ fi
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-glcore-prepare-for-dynamic.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-glcore-prepare-for-dynamic.patch
new file mode 100644
index 0000000..17eb0f5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-glcore-prepare-for-dynamic.patch
@@ -0,0 +1,108 @@
+From 70df9cb2b93ed3d4b7d6e201a58951c9981bbc93 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?R=C3=A9mi=20Cardona?= <remi@gentoo.org>
+Date: Thu, 7 May 2009 14:19:22 +0200
+Subject: [PATCH 35/78] cherry-pick the rest of "glcore: prepare for dynamic loading"
+
+When f2c30a57e3c6169fbecdbb60ac24ad2a5e9aa8a4 was cherry-picked into the
+1.5 branch, some parts were lost. This commit brings the missing bits.
+
+Conflicts:
+
+	configure.ac
+---
+ configure.ac                |    2 +-
+ hw/kdrive/ephyr/Makefile.am |    4 ++++
+ hw/kdrive/fake/Makefile.am  |    4 ++++
+ hw/kdrive/fbdev/Makefile.am |    4 ++++
+ hw/kdrive/sdl/Makefile.am   |    4 ++++
+ hw/kdrive/vesa/Makefile.am  |    4 ++++
+ 6 files changed, 21 insertions(+), 1 deletions(-)
+
+Index: xorg-server-1.5.3/configure.ac
+===================================================================
+--- xorg-server-1.5.3.orig/configure.ac	2009-09-14 19:48:11.043879237 -0700
++++ xorg-server-1.5.3/configure.ac	2009-09-14 19:49:34.903881120 -0700
+@@ -1964,7 +1964,7 @@
+     KDRIVE_LOCAL_LIBS="$TSLIB_LIBS $DIX_LIB $KDRIVE_LIB $KDRIVE_STUB_LIB $CONFIG_LIB"
+     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $FB_LIB $MI_LIB $KDRIVE_PURE_LIBS"
+     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $KDRIVE_OS_LIB $OS_LIB"
+-    KDRIVE_LIBS="$KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS"
++    KDRIVE_LIBS="$KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS $GLX_SYS_LIBS"
+ 
+     # check if we can build Xephyr
+     PKG_CHECK_MODULES(XEPHYR, $XEPHYR_REQUIRED_LIBS, [xephyr="yes"], [xephyr="no"])
+Index: xorg-server-1.5.3/hw/kdrive/ephyr/Makefile.am
+===================================================================
+--- xorg-server-1.5.3.orig/hw/kdrive/ephyr/Makefile.am	2008-11-05 08:52:17.000000000 -0800
++++ xorg-server-1.5.3/hw/kdrive/ephyr/Makefile.am	2009-09-14 19:49:34.903881120 -0700
+@@ -67,6 +67,10 @@
+ Xephyr_SOURCES = \
+ 	ephyrinit.c
+ 
++if GLX
++Xephyr_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
++endif
++
+ Xephyr_LDADD = 						\
+ 	libxephyr.a					\
+ 	libxephyr-hostx.a			        \
+Index: xorg-server-1.5.3/hw/kdrive/fake/Makefile.am
+===================================================================
+--- xorg-server-1.5.3.orig/hw/kdrive/fake/Makefile.am	2008-07-11 08:12:13.000000000 -0700
++++ xorg-server-1.5.3/hw/kdrive/fake/Makefile.am	2009-09-14 19:49:34.903881120 -0700
+@@ -16,6 +16,10 @@
+ Xfake_SOURCES = \
+ 	fakeinit.c
+ 
++if GLX
++Xfake_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
++endif
++
+ Xfake_LDADD = 						\
+ 	libfake.a					\
+ 	@KDRIVE_LIBS@					\
+Index: xorg-server-1.5.3/hw/kdrive/fbdev/Makefile.am
+===================================================================
+--- xorg-server-1.5.3.orig/hw/kdrive/fbdev/Makefile.am	2008-07-11 08:12:13.000000000 -0700
++++ xorg-server-1.5.3/hw/kdrive/fbdev/Makefile.am	2009-09-14 19:49:34.903881120 -0700
+@@ -14,6 +14,10 @@
+ Xfbdev_SOURCES = \
+ 	fbinit.c
+ 
++if GLX
++Xfbdev_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
++endif
++
+ Xfbdev_LDADD = 						\
+ 	libfbdev.a					\
+ 	@KDRIVE_LIBS@
+Index: xorg-server-1.5.3/hw/kdrive/sdl/Makefile.am
+===================================================================
+--- xorg-server-1.5.3.orig/hw/kdrive/sdl/Makefile.am	2008-07-11 08:12:13.000000000 -0700
++++ xorg-server-1.5.3/hw/kdrive/sdl/Makefile.am	2009-09-14 19:49:34.903881120 -0700
+@@ -7,6 +7,10 @@
+ 
+ Xsdl_SOURCES = sdl.c
+ 
++if GLX
++Xsdl_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
++endif
++
+ Xsdl_LDADD = \
+ 	@KDRIVE_LIBS@                                  \
+ 	@XSDL_LIBS@
+Index: xorg-server-1.5.3/hw/kdrive/vesa/Makefile.am
+===================================================================
+--- xorg-server-1.5.3.orig/hw/kdrive/vesa/Makefile.am	2008-11-05 08:52:17.000000000 -0800
++++ xorg-server-1.5.3/hw/kdrive/vesa/Makefile.am	2009-09-14 19:49:34.903881120 -0700
+@@ -19,6 +19,10 @@
+ Xvesa_SOURCES = \
+ 	vesainit.c
+ 
++if GLX
++Xvesa_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
++endif
++
+ Xvesa_LDADD = \
+ 	libvesa.a 				\
+ 	@KDRIVE_LIBS@
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.6.1/drmfix.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.6.1/drmfix.patch
new file mode 100644
index 0000000..8ebda98
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.6.1/drmfix.patch
@@ -0,0 +1,15 @@
+upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
+
+Index: xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am
+===================================================================
+--- xorg-server-1.5.1.orig/hw/xfree86/os-support/linux/Makefile.am	2008-09-23 19:24:59.000000000 +0100
++++ xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am	2008-10-27 13:27:40.000000000 +0000
+@@ -40,7 +40,7 @@
+ 
+ AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
+ 
+-INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
++INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
+ 
+ # FIXME: These need to be added to the build
+ LNX_EXTRA_SRCS = \
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.6.1/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.6.1/hack-assume-pixman-supports-overlapped-blt.patch
new file mode 100644
index 0000000..a947582
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.6.1/hack-assume-pixman-supports-overlapped-blt.patch
@@ -0,0 +1,14 @@
+diff --git a/fb/fbcopy.c b/fb/fbcopy.c
+index 07eb663..ba394b7 100644
+--- a/fb/fbcopy.c
++++ b/fb/fbcopy.c
+@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
+     while (nbox--)
+     {
+ #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
+-	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
+-	    !upsidedown)
++	if (pm == FB_ALLONES && alu == GXcopy)
+ 	{
+ 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
+ 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.7.3/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.7.3/hack-assume-pixman-supports-overlapped-blt.patch
new file mode 100644
index 0000000..a947582
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg-1.7.3/hack-assume-pixman-supports-overlapped-blt.patch
@@ -0,0 +1,14 @@
+diff --git a/fb/fbcopy.c b/fb/fbcopy.c
+index 07eb663..ba394b7 100644
+--- a/fb/fbcopy.c
++++ b/fb/fbcopy.c
+@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
+     while (nbox--)
+     {
+ #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
+-	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
+-	    !upsidedown)
++	if (pm == FB_ALLONES && alu == GXcopy)
+ 	{
+ 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
+ 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/dolt-fix.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/dolt-fix.patch
new file mode 100644
index 0000000..9e15f42
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: xorg-server-1.6.1/acinclude.m4
+===================================================================
+--- xorg-server-1.6.1.orig/acinclude.m4	2009-04-14 21:14:56.000000000 +0400
++++ xorg-server-1.6.1/acinclude.m4	2009-07-15 12:38:33.796848843 +0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/drmfix.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/drmfix.patch
new file mode 100644
index 0000000..fcbeac0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/drmfix.patch
@@ -0,0 +1,15 @@
+upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
+
+Index: xorg-server-X11R7.0-1.0.1/hw/xfree86/os-support/linux/Makefile.am
+===================================================================
+--- xorg-server-X11R7.0-1.0.1.orig/hw/xfree86/os-support/linux/Makefile.am
++++ xorg-server-X11R7.0-1.0.1/hw/xfree86/os-support/linux/Makefile.am
+@@ -24,7 +24,7 @@ liblinux_la_SOURCES = lnx_init.c lnx_vid
+ 
+ AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(XORG_CFLAGS) @SERVER_DEFINES@ @LOADER_DEFINES@
+ 
+-INCLUDES = $(XORG_INCS) -I/usr/include/drm # FIXME this last part is crack
++INCLUDES = $(XORG_INCS) $(LIBDRM_CFLAGS)
+ 
+ # FIXME: These need to be added to the build
+ LNX_EXTRA_SOURCES = \
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/fontfile.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/fontfile.patch
new file mode 100644
index 0000000..ed39bf4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/fontfile.patch
@@ -0,0 +1,11 @@
+--- xc/lib/font/fontfile/Imakefile.old	2005-06-03 20:09:53.000000000 +0100
++++ xc/lib/font/fontfile/Imakefile	2005-06-03 20:09:57.000000000 +0100
+@@ -14,7 +14,7 @@
+ #endif
+ 
+    INCLUDES = -I$(FONTINCSRC) -I../include -I$(SERVERSRC)/include \
+-	      -I$(INCLUDESRC)
++	      -I$(INCLUDESRC) $(CC_STAGING)
+     HEADERS = 
+ #ifdef FontFormatDefines
+ FORMAT_DEFS = FontFormatDefines
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/freetype.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/freetype.patch
new file mode 100644
index 0000000..0ba3dd5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/freetype.patch
@@ -0,0 +1,22 @@
+--- xc/lib/font/FreeType/Imakefile.old	2005-06-03 20:18:51.000000000 +0100
++++ xc/lib/font/FreeType/Imakefile	2005-06-03 20:18:52.000000000 +0100
+@@ -20,7 +20,7 @@
+ 
+ INCLUDES = $(FT2INCS) -I. -I$(FONTINCSRC) -I../include -I$(XINCLUDESRC) \
+            -I$(SERVERSRC)/include $(EXTRAINCLUDES) \
+-           -I$(INCLUDESRC)
++           -I$(INCLUDESRC) $(CC_STAGING)
+ 
+ SRCS = xttcap.c ftfuncs.c ftenc.c fttools.c
+ OBJS = xttcap.o ftfuncs.o ftenc.o fttools.o
+--- xc/config/cf/X11.tmpl.old	2005-06-03 20:40:24.000000000 +0100
++++ xc/config/cf/X11.tmpl	2005-06-03 20:40:40.000000000 +0100
+@@ -3371,7 +3371,7 @@
+ 
+ #if BuildFreetype2Library || HasFreetype2
+ #if Freetype2IncDirStandard
+-FREETYPE2INCLUDES = -I$(FREETYPE2INCDIR)/freetype2 -I$(FREETYPE2INCDIR)/freetype2/config
++FREETYPE2INCLUDES = `pkg-config --cflags freetype2`
+ #else
+ FREETYPE2INCLUDES = -I$(FREETYPE2INCDIR) -I$(FREETYPE2INCDIR)/freetype2 -I$(FREETYPE2INCDIR)/freetype2/config
+ #endif
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/hack-fbdev-ignore-return-mode.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/hack-fbdev-ignore-return-mode.patch
new file mode 100644
index 0000000..d3661cb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/hack-fbdev-ignore-return-mode.patch
@@ -0,0 +1,39 @@
+Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
+(and probably other) while returning from chvt or resume on some
+hardware (e. g. zaurus).
+
+Correct fix would require debugging of fbdev mode during LeaveVT and
+EnterVT.
+
+This patch may cause staying in incorrect or corrupted display mode
+after EnterVT, but on man affected devices it does not cause any visible
+problems.
+
+Hacked code is never called on properly written drivers.
+
+Devices affected and testers involved for future patch removal:
+Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
+
+See also:
+https://bugzilla.redhat.com/show_bug.cgi?id=238451
+
+The bug (first line indicates that your device is affected):
+
+(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
+
+Fatal server error:
+EnterVT failed for screen 0
+
+Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+===================================================================
+--- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
++++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
+ #if DEBUG
+ 		print_fbdev_mode("returned", &set_var);
+ #endif
+-		return FALSE;
++		/* return FALSE; UGLY HACK to allow return from chvt */
+ 	}
+ 
+ 	if (!check)
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/imake-installed.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/imake-installed.patch
new file mode 100644
index 0000000..5782107
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/imake-installed.patch
@@ -0,0 +1,11 @@
+--- xc/config/cf/Imake.tmpl.old	2005-05-05 21:04:45.000000000 +0100
++++ xc/config/cf/Imake.tmpl	2005-05-05 21:04:49.000000000 +0100
+@@ -2058,7 +2058,7 @@
+  * INCLUDES contains client-specific includes set in Imakefile
+  * LOCAL_LDFLAGS contains client-specific ld flags flags set in Imakefile
+  */
+-      ALLINCLUDES = $(INCLUDES) $(EXTRA_INCLUDES) $(TOP_INCLUDES) $(INSTALLED_INCLUDES) $(STD_INCLUDES)
++      ALLINCLUDES = $(INCLUDES) $(EXTRA_INCLUDES) $(TOP_INCLUDES) $(STD_INCLUDES)
+        ALLDEFINES = $(ALLINCLUDES) $(STD_DEFINES) $(PROTO_DEFINES) $(THREADS_DEFINES) $(MODULE_DEFINES) $(DEFINES) $(EXTRA_DEFINES)
+            CFLAGS = $(CDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(MODULE_CFLAGS) $(ALLDEFINES) $(CC_STAGING)
+         LINTFLAGS = $(LINTOPTS) -DLINT $(ALLDEFINES) $(DEPEND_DEFINES)
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/no-screen-blanking.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/no-screen-blanking.patch
new file mode 100644
index 0000000..cd7cbe3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/no-screen-blanking.patch
@@ -0,0 +1,15 @@
+upstream: not applicable to upstream
+
+--- xserver/include/site.h-orig	2006-11-02 10:37:14.000000000 +0000
++++ xserver/include/site.h	2006-11-02 10:37:14.000000000 +0000
+@@ -117,8 +117,8 @@
+ #define DEFAULT_PTR_DENOMINATOR	1
+ #define DEFAULT_PTR_THRESHOLD	4
+ 
+-#define DEFAULT_SCREEN_SAVER_TIME (10 * (60 * 1000))
+-#define DEFAULT_SCREEN_SAVER_INTERVAL (10 * (60 * 1000))
++#define DEFAULT_SCREEN_SAVER_TIME 0
++#define DEFAULT_SCREEN_SAVER_INTERVAL 0
+ #define DEFAULT_SCREEN_SAVER_BLANKING PreferBlanking
+ #define DEFAULT_SCREEN_SAVER_EXPOSURES AllowExposures
+ #ifndef NOLOGOHACK
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/xpconfig-parentdir.patch b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/xpconfig-parentdir.patch
new file mode 100644
index 0000000..17d05d3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg/xpconfig-parentdir.patch
@@ -0,0 +1,30 @@
+--- xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/HPLJ4050-PS/fonts/Makefile.am.orig	2006-06-23 10:20:42.126095128 -0600
++++ xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/HPLJ4050-PS/fonts/Makefile.am	2006-06-23 10:20:50.923757680 -0600
+@@ -1,6 +1,6 @@
+ xpcdir = @xpconfigdir@/C/print/models/HPLJ4050-PS/fonts
+ 
+-parentdir = $(DESTDIR)/@xpconfigdir@/C/print/models/PSdefault/fonts
++parentdir = @xpconfigdir@/C/print/models/PSdefault/fonts
+ 
+ XPFONTS = \
+         AvantGarde-Book.pmf \
+--- xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/CANONC3200-PS/fonts/Makefile.am.orig	2006-06-23 10:21:02.877940368 -0600
++++ xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/CANONC3200-PS/fonts/Makefile.am	2006-06-23 10:21:11.903568264 -0600
+@@ -1,6 +1,6 @@
+ xpcdir = @xpconfigdir@/C/print/models/CANONC3200-PS/fonts
+ 
+-parentdir = $(DESTDIR)/@xpconfigdir@/C/print/models/PSdefault/fonts
++parentdir = @xpconfigdir@/C/print/models/PSdefault/fonts
+ 
+ XPFONTS = \
+         AvantGarde-Book.pmf \
+--- xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/SPSPARC2/fonts/Makefile.am.orig	2006-06-23 10:21:22.893897480 -0600
++++ xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/SPSPARC2/fonts/Makefile.am	2006-06-23 10:21:28.412058592 -0600
+@@ -1,6 +1,6 @@
+ xpcdir = @xpconfigdir@/C/print/models/SPSPARC2/fonts
+ 
+-parentdir = $(DESTDIR)/@xpconfigdir@/C/print/models/PSdefault/fonts
++parentdir = @xpconfigdir@/C/print/models/PSdefault/fonts
+ 
+ XPFONTS = \
+         Courier-Bold.pmf \
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.2.0.bb b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.2.0.bb
new file mode 100644
index 0000000..0b2e399
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.2.0.bb
@@ -0,0 +1,15 @@
+MESA_VER = "6.5.2"
+
+require xorg-xserver-common.inc
+PE = "1"
+PR = "${INC_PR}.1"
+
+export LDFLAGS += " -ldl "
+
+#DESCRIPTION = ""
+
+#DEPENDS += " "
+
+SRC_URI += "file://report-correct-randr10.patch"
+SRC_URI[archive.md5sum] = "ea291c89e68832d570d9d5e007218bd6"
+SRC_URI[archive.sha256sum] = "e3e56b35ee13098f4ee79948beb20bfc9a06d1a7a35fb906405ff1531b92bb85"
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.3.0.0.bb b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.3.0.0.bb
new file mode 100644
index 0000000..c2ec4b1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.3.0.0.bb
@@ -0,0 +1,18 @@
+MESA_VER = "6.5.2"
+
+require xorg-xserver-common.inc
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI += "file://drmfix.patch \
+            file://glyphstr.patch \
+            file://report-correct-randr12.patch"
+
+export LDFLAGS += " -ldl "
+
+#DESCRIPTION = ""
+
+#DEPENDS += " "
+
+SRC_URI[archive.md5sum] = "a51a7d482e3c689394755bb17bda8526"
+SRC_URI[archive.sha256sum] = "93c656f142f37607c15372dd24c5de9eab82cd79c5d60449174a928d345c2975"
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.4.2.bb b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.4.2.bb
new file mode 100644
index 0000000..0f4f8e7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.4.2.bb
@@ -0,0 +1,20 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman"
+RDEPENDS_${PN} += "hal"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI += "file://drmfix.patch \
+            file://pkgconfig_fix.patch \
+            file://sysroot_fix.patch \
+            file://xcalibrate-xorg.diff \
+"
+
+MESA_VER = "7.0.2"
+
+export LDFLAGS += " -ldl "
+
+SRC_URI[archive.md5sum] = "fa2915ae377f61c340a18ebef484b64b"
+SRC_URI[archive.sha256sum] = "829c66ec4c295822700067c87afae796b8e67530cc65a7b83060ea29a4ff316d"
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.4.bb b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.4.bb
new file mode 100644
index 0000000..f153212
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.4.bb
@@ -0,0 +1,18 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman"
+RDEPENDS_${PN} += "hal"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI += "file://drmfix.patch \
+            file://pkgconfig_fix.patch \
+            file://sysroot_fix.patch"
+
+MESA_VER = "7.0.2"
+
+export LDFLAGS += " -ldl "
+
+SRC_URI[archive.md5sum] = "a06d9fe4f9f1d459ae02657f9ce64220"
+SRC_URI[archive.sha256sum] = "51b142df328d427143705371f139a08ff3bcd6efe0eab91f4178ca4017c0ebc2"
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.5.1.bb b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.5.1.bb
new file mode 100644
index 0000000..b1eef4f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.5.1.bb
@@ -0,0 +1,17 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl"
+RDEPENDS_${PN} += "hal"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI += "file://drmfix.patch \
+            file://sysroot_fix.patch"
+
+MESA_VER = "7.2"
+
+export LDFLAGS += " -ldl "
+
+SRC_URI[archive.md5sum] = "d16f5a033f001c9069b4141194614da2"
+SRC_URI[archive.sha256sum] = "2f36880bffaee0a5b2b704376a02b22066b6842445e1d77da698854e5973eb21"
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.5.3.bb b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.5.3.bb
new file mode 100644
index 0000000..776b87f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.5.3.bb
@@ -0,0 +1,21 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl"
+RDEPENDS_${PN} += "hal"
+PE = "2"
+PR = "${INC_PR}.2"
+
+SRC_URI += "file://drmfix.patch \
+            file://sysroot_fix.patch \
+            file://xorg-avr32-support.diff \
+	    file://xorg-server-1.5.3-configure.patch \
+	    file://xorg-server-1.5.3-glcore-prepare-for-dynamic.patch \
+"
+
+MESA_VER = "7.2"
+
+export LDFLAGS += " -ldl "
+
+SRC_URI[archive.md5sum] = "308971036e25250e7fe3cccfd5a120f8"
+SRC_URI[archive.sha256sum] = "a680174f54be7763819e5275c5d5d44fc9e9b6f8e9351dd45c150eb4c182d5bb"
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.6.1.bb b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.6.1.bb
new file mode 100644
index 0000000..630ec57
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.6.1.bb
@@ -0,0 +1,20 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl xineramaproto libxinerama"
+RDEPENDS_${PN} += "hal"
+PE = "2"
+PR = "${INC_PR}.2"
+
+SRC_URI += "file://sysroot_fix.patch \
+	    file://dolt-fix.patch"
+
+# This requires support in pixman, which the default one doesn't have
+SRC_URI_append_angstrom = " file://hack-assume-pixman-supports-overlapped-blt.patch"
+
+MESA_VER = "7.2"
+
+export LDFLAGS += " -ldl "
+
+SRC_URI[archive.md5sum] = "ed0878bf32a24d4948c3b8a122a39eff"
+SRC_URI[archive.sha256sum] = "0edbaa994797cb7944a4129d33b634ad99164b21ec32355d56996a178d38bfcf"
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.7.2.bb b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.7.2.bb
new file mode 100644
index 0000000..efe68d2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.7.2.bb
@@ -0,0 +1,22 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts"
+PE = "2"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://sysroot_fix.patch \
+            file://dolt-fix-1.7.0.patch \
+            file://randr-support-1.7.0.patch \
+           "
+do_install_prepend() {
+        mkdir -p ${D}/${libdir}/X11/fonts
+}
+
+EXTRA_OECONF += "--disable-xephyr --disable-config-hal --disable-xinerama --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " --disable-glx-tls --enable-dri2 --disable-unit-tests "
+
+export LDFLAGS += " -ldl "
+
+SRC_URI[archive.md5sum] = "5c087e0f555203065fd90d02ef5f736e"
+SRC_URI[archive.sha256sum] = "f4fb49209a6f3cb1c5b039b1f43870774e2eac1540b4d3235a2f13bc441da159"
diff --git a/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.7.3.bb b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.7.3.bb
new file mode 100644
index 0000000..fc8c354
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-xserver/xserver-xorg_1.7.3.bb
@@ -0,0 +1,30 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts"
+PE = "2"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://sysroot_fix.patch \
+            file://dolt-fix-1.7.0.patch \
+            file://randr-support-1.7.0.patch \
+            file://hack-fbdev-ignore-return-mode.patch \
+           "
+
+SRC_URI_append_angstrom = " file://hack-assume-pixman-supports-overlapped-blt.patch"
+SRC_URI_append_shr = " file://hack-assume-pixman-supports-overlapped-blt.patch"
+
+do_install_prepend() {
+        mkdir -p ${D}/${libdir}/X11/fonts
+}
+
+# The NVidia driver requires Xinerama support in the X server. Ion uses it.
+XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
+
+EXTRA_OECONF += " --enable-config-hal ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " --disable-glx-tls --enable-dri2 --disable-unit-tests "
+
+export LDFLAGS += " -ldl "
+
+SRC_URI[archive.md5sum] = "4c63b22cad9ed8ae8b86561f0f92c327"
+SRC_URI[archive.sha256sum] = "4b644113cd030fc77615c03c7b6529e063dc1d471ec6a990e6f62eb45a9c2db4"
diff --git a/recipes/xorg-xserver/files/fix-picturestr-include-order.patch b/recipes/xorg-xserver/files/fix-picturestr-include-order.patch
deleted file mode 100644
index 3da235e..0000000
--- a/recipes/xorg-xserver/files/fix-picturestr-include-order.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-# Reverse include order in render/picturestr.h to be able to compile against renderproto >= 0.9.3
-Index: xorg-server-1.2.0/render/picturestr.h
-===================================================================
---- xorg-server-1.2.0.orig/render/picturestr.h	2008-02-09 22:54:46.000000000 +0100
-+++ xorg-server-1.2.0/render/picturestr.h	2008-02-09 22:54:50.000000000 +0100
-@@ -26,8 +26,8 @@
- #ifndef _PICTURESTR_H_
- #define _PICTURESTR_H_
- 
--#include "glyphstr.h"
- #include "scrnintstr.h"
-+#include "glyphstr.h"
- #include "resource.h"
- 
- typedef struct _DirectFormat {
diff --git a/recipes/xorg-xserver/files/pkgconfig_fix.patch b/recipes/xorg-xserver/files/pkgconfig_fix.patch
deleted file mode 100644
index e75e209..0000000
--- a/recipes/xorg-xserver/files/pkgconfig_fix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xorg-server-1.4/xorg-server.pc.in
-===================================================================
---- xorg-server-1.4.orig/xorg-server.pc.in	2008-02-29 12:29:02.000000000 +0000
-+++ xorg-server-1.4/xorg-server.pc.in	2008-02-29 12:27:36.000000000 +0000
-@@ -7,6 +7,7 @@
- 
- Name: xorg-server
- Description: Modular X.Org X Server
-+Requires: pixman-1
- Version: @PACKAGE_VERSION@
--Cflags: -I${sdkdir} @PIXMAN_CFLAGS@
-+Cflags: -I${sdkdir}
- Libs: -L${libdir}
diff --git a/recipes/xorg-xserver/files/report-correct-randr10.patch b/recipes/xorg-xserver/files/report-correct-randr10.patch
deleted file mode 100644
index 540f598..0000000
--- a/recipes/xorg-xserver/files/report-correct-randr10.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: xorg-server-1.1.0/randr/randr.c
-===================================================================
---- xorg-server-1.1.0.orig/randr/randr.c
-+++ xorg-server-1.1.0/randr/randr.c
-@@ -56,6 +56,9 @@
- #define SubPixelUnknown 0
- #endif
- 
-+#define SERVER_RANDR_MAJOR	1
-+#define SERVER_RANDR_MINOR	0
-+
- #define RR_VALIDATE
- int	RRGeneration;
- int	RRNScreens;
-@@ -473,8 +476,8 @@ ProcRRQueryVersion (ClientPtr client)
-     rep.type = X_Reply;
-     rep.length = 0;
-     rep.sequenceNumber = client->sequence;
--    rep.majorVersion = RANDR_MAJOR;
--    rep.minorVersion = RANDR_MINOR;
-+    rep.majorVersion = SERVER_RANDR_MAJOR;
-+    rep.minorVersion = SERVER_RANDR_MINOR;
-     if (client->swapped) {
-     	swaps(&rep.sequenceNumber, n);
-     	swapl(&rep.length, n);
diff --git a/recipes/xorg-xserver/files/report-correct-randr12.patch b/recipes/xorg-xserver/files/report-correct-randr12.patch
deleted file mode 100644
index 72c8a18..0000000
--- a/recipes/xorg-xserver/files/report-correct-randr12.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Server reports XRandR version provided by libxrandr instead of XRandR
-version implemented. It confuses applications that execute XRandR
-version dependent code (e. g. gtk+ >= 2.18.0).
-
-Index: xorg-server-1.3.0.0/randr/rrdispatch.c
-===================================================================
---- xorg-server-1.3.0.0.orig/randr/rrdispatch.c
-+++ xorg-server-1.3.0.0/randr/rrdispatch.c
-@@ -22,6 +22,9 @@
- 
- #include "randrstr.h"
- 
-+#define SERVER_RANDR_MAJOR	1
-+#define SERVER_RANDR_MINOR	2
-+
- Bool
- RRClientKnowsRates (ClientPtr	pClient)
- {
-@@ -49,8 +52,8 @@ ProcRRQueryVersion (ClientPtr client)
-      * Report the current version; the current
-      * spec says they're all compatible after 1.0
-      */
--    rep.majorVersion = RANDR_MAJOR;
--    rep.minorVersion = RANDR_MINOR;
-+    rep.majorVersion = SERVER_RANDR_MAJOR;
-+    rep.minorVersion = SERVER_RANDR_MINOR;
-     if (client->swapped) {
-     	swaps(&rep.sequenceNumber, n);
-     	swapl(&rep.length, n);
diff --git a/recipes/xorg-xserver/files/sysroot_fix.patch b/recipes/xorg-xserver/files/sysroot_fix.patch
deleted file mode 100644
index 59753d5..0000000
--- a/recipes/xorg-xserver/files/sysroot_fix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xorg-server-1.4/xorg-server.m4
-===================================================================
---- xorg-server-1.4.orig/xorg-server.m4	2008-03-15 20:09:36.000000000 +0100
-+++ xorg-server-1.4/xorg-server.m4	2008-03-15 20:09:51.000000000 +0100
-@@ -30,7 +30,7 @@
- 
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`pkg-config --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS `pkg-config --cflags xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
diff --git a/recipes/xorg-xserver/files/xcalibrate-xorg.diff b/recipes/xorg-xserver/files/xcalibrate-xorg.diff
deleted file mode 100644
index 65121ef..0000000
--- a/recipes/xorg-xserver/files/xcalibrate-xorg.diff
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/configure.ac	2008-10-29 18:53:23.000000000 +0100
-+++ xorg-server-1.4.2/configure.ac	2008-10-29 18:53:40.000000000 +0100
-@@ -865,7 +865,7 @@
-        FONTPATH="built-ins"
- fi
- 
--if test "x$XCALIBRATE" = xyes && test "$KDRIVE" = yes; then
-+if test "x$XCALIBRATE" = xyes ; then
-    AC_DEFINE(XCALIBRATE, 1, [Build XCalibrate extension])
-    REQUIRED_MODULES="$REQUIRED_MODULES xcalibrateproto"
- else
diff --git a/recipes/xorg-xserver/files/xorg-avr32-support.diff b/recipes/xorg-xserver/files/xorg-avr32-support.diff
deleted file mode 100644
index 583191e..0000000
--- a/recipes/xorg-xserver/files/xorg-avr32-support.diff
+++ /dev/null
@@ -1,21 +0,0 @@
-upstream: applied in 82b37d35af13a9f402755e167493ab256b664b9c (2008-04-22)
-
---- /tmp/servermd.h	2007-09-30 17:27:22.310911628 +0200
-+++ xorg-server-1.4/include/servermd.h	2007-09-30 17:28:25.297799199 +0200
-@@ -130,6 +130,16 @@
- 
- #endif /* vax */
- 
-+#ifdef __avr32__
-+
-+#define IMAGE_BYTE_ORDER        MSBFirst
-+#define BITMAP_BIT_ORDER        MSBFirst
-+#define GLYPHPADBYTES           4
-+#define GETLEFTBITS_ALIGNMENT   1
-+#define AVOID_MEMORY_READ
-+
-+#endif /* __avr32__ */ 
-+
- #ifdef __arm32__
- 
- #define IMAGE_BYTE_ORDER        LSBFirst
diff --git a/recipes/xorg-xserver/xserver-kdrive-1.3.0.0/fix-picturestr-include-order.patch b/recipes/xorg-xserver/xserver-kdrive-1.3.0.0/fix-picturestr-include-order.patch
new file mode 100644
index 0000000..3da235e
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-1.3.0.0/fix-picturestr-include-order.patch
@@ -0,0 +1,15 @@
+# Reverse include order in render/picturestr.h to be able to compile against renderproto >= 0.9.3
+Index: xorg-server-1.2.0/render/picturestr.h
+===================================================================
+--- xorg-server-1.2.0.orig/render/picturestr.h	2008-02-09 22:54:46.000000000 +0100
++++ xorg-server-1.2.0/render/picturestr.h	2008-02-09 22:54:50.000000000 +0100
+@@ -26,8 +26,8 @@
+ #ifndef _PICTURESTR_H_
+ #define _PICTURESTR_H_
+ 
+-#include "glyphstr.h"
+ #include "scrnintstr.h"
++#include "glyphstr.h"
+ #include "resource.h"
+ 
+ typedef struct _DirectFormat {
diff --git a/recipes/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch b/recipes/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch
new file mode 100644
index 0000000..72c8a18
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch
@@ -0,0 +1,29 @@
+Server reports XRandR version provided by libxrandr instead of XRandR
+version implemented. It confuses applications that execute XRandR
+version dependent code (e. g. gtk+ >= 2.18.0).
+
+Index: xorg-server-1.3.0.0/randr/rrdispatch.c
+===================================================================
+--- xorg-server-1.3.0.0.orig/randr/rrdispatch.c
++++ xorg-server-1.3.0.0/randr/rrdispatch.c
+@@ -22,6 +22,9 @@
+ 
+ #include "randrstr.h"
+ 
++#define SERVER_RANDR_MAJOR	1
++#define SERVER_RANDR_MINOR	2
++
+ Bool
+ RRClientKnowsRates (ClientPtr	pClient)
+ {
+@@ -49,8 +52,8 @@ ProcRRQueryVersion (ClientPtr client)
+      * Report the current version; the current
+      * spec says they're all compatible after 1.0
+      */
+-    rep.majorVersion = RANDR_MAJOR;
+-    rep.minorVersion = RANDR_MINOR;
++    rep.majorVersion = SERVER_RANDR_MAJOR;
++    rep.minorVersion = SERVER_RANDR_MINOR;
+     if (client->swapped) {
+     	swaps(&rep.sequenceNumber, n);
+     	swapl(&rep.length, n);
diff --git a/recipes/xorg-xserver/xserver-kdrive-1.5.3/sysroot_fix.patch b/recipes/xorg-xserver/xserver-kdrive-1.5.3/sysroot_fix.patch
new file mode 100644
index 0000000..59753d5
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-1.5.3/sysroot_fix.patch
@@ -0,0 +1,13 @@
+Index: xorg-server-1.4/xorg-server.m4
+===================================================================
+--- xorg-server-1.4.orig/xorg-server.m4	2008-03-15 20:09:36.000000000 +0100
++++ xorg-server-1.4/xorg-server.m4	2008-03-15 20:09:51.000000000 +0100
+@@ -30,7 +30,7 @@
+ 
+ AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
+ 	SAVE_CFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -I`pkg-config --variable=sdkdir xorg-server`"
++	CFLAGS="$CFLAGS `pkg-config --cflags xorg-server`"
+ 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include "xorg-server.h"
+ #if !defined $1
diff --git a/recipes/xorg-xserver/xserver-kdrive-imageon/fix-picturestr-include-order.patch b/recipes/xorg-xserver/xserver-kdrive-imageon/fix-picturestr-include-order.patch
new file mode 100644
index 0000000..3da235e
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-imageon/fix-picturestr-include-order.patch
@@ -0,0 +1,15 @@
+# Reverse include order in render/picturestr.h to be able to compile against renderproto >= 0.9.3
+Index: xorg-server-1.2.0/render/picturestr.h
+===================================================================
+--- xorg-server-1.2.0.orig/render/picturestr.h	2008-02-09 22:54:46.000000000 +0100
++++ xorg-server-1.2.0/render/picturestr.h	2008-02-09 22:54:50.000000000 +0100
+@@ -26,8 +26,8 @@
+ #ifndef _PICTURESTR_H_
+ #define _PICTURESTR_H_
+ 
+-#include "glyphstr.h"
+ #include "scrnintstr.h"
++#include "glyphstr.h"
+ #include "resource.h"
+ 
+ typedef struct _DirectFormat {
diff --git a/recipes/xorg-xserver/xserver-kdrive-imageon/report-correct-randr10.patch b/recipes/xorg-xserver/xserver-kdrive-imageon/report-correct-randr10.patch
new file mode 100644
index 0000000..540f598
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-imageon/report-correct-randr10.patch
@@ -0,0 +1,25 @@
+Index: xorg-server-1.1.0/randr/randr.c
+===================================================================
+--- xorg-server-1.1.0.orig/randr/randr.c
++++ xorg-server-1.1.0/randr/randr.c
+@@ -56,6 +56,9 @@
+ #define SubPixelUnknown 0
+ #endif
+ 
++#define SERVER_RANDR_MAJOR	1
++#define SERVER_RANDR_MINOR	0
++
+ #define RR_VALIDATE
+ int	RRGeneration;
+ int	RRNScreens;
+@@ -473,8 +476,8 @@ ProcRRQueryVersion (ClientPtr client)
+     rep.type = X_Reply;
+     rep.length = 0;
+     rep.sequenceNumber = client->sequence;
+-    rep.majorVersion = RANDR_MAJOR;
+-    rep.minorVersion = RANDR_MINOR;
++    rep.majorVersion = SERVER_RANDR_MAJOR;
++    rep.minorVersion = SERVER_RANDR_MINOR;
+     if (client->swapped) {
+     	swaps(&rep.sequenceNumber, n);
+     	swapl(&rep.length, n);
diff --git a/recipes/xorg-xserver/xserver-kdrive-nomadik/fix-picturestr-include-order.patch b/recipes/xorg-xserver/xserver-kdrive-nomadik/fix-picturestr-include-order.patch
new file mode 100644
index 0000000..3da235e
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-nomadik/fix-picturestr-include-order.patch
@@ -0,0 +1,15 @@
+# Reverse include order in render/picturestr.h to be able to compile against renderproto >= 0.9.3
+Index: xorg-server-1.2.0/render/picturestr.h
+===================================================================
+--- xorg-server-1.2.0.orig/render/picturestr.h	2008-02-09 22:54:46.000000000 +0100
++++ xorg-server-1.2.0/render/picturestr.h	2008-02-09 22:54:50.000000000 +0100
+@@ -26,8 +26,8 @@
+ #ifndef _PICTURESTR_H_
+ #define _PICTURESTR_H_
+ 
+-#include "glyphstr.h"
+ #include "scrnintstr.h"
++#include "glyphstr.h"
+ #include "resource.h"
+ 
+ typedef struct _DirectFormat {
diff --git a/recipes/xorg-xserver/xserver-kdrive-xomap/fix-picturestr-include-order.patch b/recipes/xorg-xserver/xserver-kdrive-xomap/fix-picturestr-include-order.patch
new file mode 100644
index 0000000..3da235e
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-xomap/fix-picturestr-include-order.patch
@@ -0,0 +1,15 @@
+# Reverse include order in render/picturestr.h to be able to compile against renderproto >= 0.9.3
+Index: xorg-server-1.2.0/render/picturestr.h
+===================================================================
+--- xorg-server-1.2.0.orig/render/picturestr.h	2008-02-09 22:54:46.000000000 +0100
++++ xorg-server-1.2.0/render/picturestr.h	2008-02-09 22:54:50.000000000 +0100
+@@ -26,8 +26,8 @@
+ #ifndef _PICTURESTR_H_
+ #define _PICTURESTR_H_
+ 
+-#include "glyphstr.h"
+ #include "scrnintstr.h"
++#include "glyphstr.h"
+ #include "resource.h"
+ 
+ typedef struct _DirectFormat {
diff --git a/recipes/xorg-xserver/xserver-kdrive-xomap/report-correct-randr10.patch b/recipes/xorg-xserver/xserver-kdrive-xomap/report-correct-randr10.patch
new file mode 100644
index 0000000..540f598
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-xomap/report-correct-randr10.patch
@@ -0,0 +1,25 @@
+Index: xorg-server-1.1.0/randr/randr.c
+===================================================================
+--- xorg-server-1.1.0.orig/randr/randr.c
++++ xorg-server-1.1.0/randr/randr.c
+@@ -56,6 +56,9 @@
+ #define SubPixelUnknown 0
+ #endif
+ 
++#define SERVER_RANDR_MAJOR	1
++#define SERVER_RANDR_MINOR	0
++
+ #define RR_VALIDATE
+ int	RRGeneration;
+ int	RRNScreens;
+@@ -473,8 +476,8 @@ ProcRRQueryVersion (ClientPtr client)
+     rep.type = X_Reply;
+     rep.length = 0;
+     rep.sequenceNumber = client->sequence;
+-    rep.majorVersion = RANDR_MAJOR;
+-    rep.minorVersion = RANDR_MINOR;
++    rep.majorVersion = SERVER_RANDR_MAJOR;
++    rep.minorVersion = SERVER_RANDR_MINOR;
+     if (client->swapped) {
+     	swaps(&rep.sequenceNumber, n);
+     	swapl(&rep.length, n);
diff --git a/recipes/xorg-xserver/xserver-kdrive/pkgconfig_fix.patch b/recipes/xorg-xserver/xserver-kdrive/pkgconfig_fix.patch
new file mode 100644
index 0000000..e75e209
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive/pkgconfig_fix.patch
@@ -0,0 +1,13 @@
+Index: xorg-server-1.4/xorg-server.pc.in
+===================================================================
+--- xorg-server-1.4.orig/xorg-server.pc.in	2008-02-29 12:29:02.000000000 +0000
++++ xorg-server-1.4/xorg-server.pc.in	2008-02-29 12:27:36.000000000 +0000
+@@ -7,6 +7,7 @@
+ 
+ Name: xorg-server
+ Description: Modular X.Org X Server
++Requires: pixman-1
+ Version: @PACKAGE_VERSION@
+-Cflags: -I${sdkdir} @PIXMAN_CFLAGS@
++Cflags: -I${sdkdir}
+ Libs: -L${libdir}
diff --git a/recipes/xorg-xserver/xserver-kdrive/report-correct-randr10.patch b/recipes/xorg-xserver/xserver-kdrive/report-correct-randr10.patch
new file mode 100644
index 0000000..540f598
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive/report-correct-randr10.patch
@@ -0,0 +1,25 @@
+Index: xorg-server-1.1.0/randr/randr.c
+===================================================================
+--- xorg-server-1.1.0.orig/randr/randr.c
++++ xorg-server-1.1.0/randr/randr.c
+@@ -56,6 +56,9 @@
+ #define SubPixelUnknown 0
+ #endif
+ 
++#define SERVER_RANDR_MAJOR	1
++#define SERVER_RANDR_MINOR	0
++
+ #define RR_VALIDATE
+ int	RRGeneration;
+ int	RRNScreens;
+@@ -473,8 +476,8 @@ ProcRRQueryVersion (ClientPtr client)
+     rep.type = X_Reply;
+     rep.length = 0;
+     rep.sequenceNumber = client->sequence;
+-    rep.majorVersion = RANDR_MAJOR;
+-    rep.minorVersion = RANDR_MINOR;
++    rep.majorVersion = SERVER_RANDR_MAJOR;
++    rep.minorVersion = SERVER_RANDR_MINOR;
+     if (client->swapped) {
+     	swaps(&rep.sequenceNumber, n);
+     	swapl(&rep.length, n);
diff --git a/recipes/xorg-xserver/xserver-kdrive/xorg-avr32-support.diff b/recipes/xorg-xserver/xserver-kdrive/xorg-avr32-support.diff
new file mode 100644
index 0000000..583191e
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive/xorg-avr32-support.diff
@@ -0,0 +1,21 @@
+upstream: applied in 82b37d35af13a9f402755e167493ab256b664b9c (2008-04-22)
+
+--- /tmp/servermd.h	2007-09-30 17:27:22.310911628 +0200
++++ xorg-server-1.4/include/servermd.h	2007-09-30 17:28:25.297799199 +0200
+@@ -130,6 +130,16 @@
+ 
+ #endif /* vax */
+ 
++#ifdef __avr32__
++
++#define IMAGE_BYTE_ORDER        MSBFirst
++#define BITMAP_BIT_ORDER        MSBFirst
++#define GLYPHPADBYTES           4
++#define GETLEFTBITS_ALIGNMENT   1
++#define AVOID_MEMORY_READ
++
++#endif /* __avr32__ */ 
++
+ #ifdef __arm32__
+ 
+ #define IMAGE_BYTE_ORDER        LSBFirst
diff --git a/recipes/xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch b/recipes/xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch
deleted file mode 100644
index 72bdcda..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.3.0.0/drmfix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
-
---- xorg-server-1.3.0.0.orig/hw/xfree86/os-support/linux/Makefile.am
-+++ xorg-server-1.3.0.0/hw/xfree86/os-support/linux/Makefile.am
-@@ -38,7 +38,7 @@
- 
- AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(XORG_CFLAGS) $(PLATFORM_DEFINES)
- 
--INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
-+INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
- 
- # FIXME: These need to be added to the build
- LNX_EXTRA_SOURCES = \
diff --git a/recipes/xorg-xserver/xserver-xorg-1.3.0.0/glyphstr.patch b/recipes/xorg-xserver/xserver-xorg-1.3.0.0/glyphstr.patch
deleted file mode 100644
index 6dfe7ba..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.3.0.0/glyphstr.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-upstream: https://bugs.freedesktop.org/show_bug.cgi?id=22133
-status: Rejected
-comment: It's a bit unclear if this patch was ever needed, but recent versions seem
- to work fine without it.
-
---- xorg-server-1.3.0.0/render/glyphstr.h~	2006-09-18 03:04:18.000000000 -0300
-+++ xorg-server-1.3.0.0/render/glyphstr.h	2008-02-03 22:14:23.187159732 -0200
-@@ -25,6 +25,7 @@
- #ifndef _GLYPHSTR_H_
- #define _GLYPHSTR_H_
- 
-+#include <X11/X.h>
- #include <X11/extensions/renderproto.h>
- #include "picture.h"
- #include "screenint.h"
diff --git a/recipes/xorg-xserver/xserver-xorg-1.4.2/drmfix.patch b/recipes/xorg-xserver/xserver-xorg-1.4.2/drmfix.patch
deleted file mode 100644
index dde7637..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.4.2/drmfix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
-
-Index: xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am
-===================================================================
---- xorg-server-1.4.orig/hw/xfree86/os-support/linux/Makefile.am	2007-08-23 21:04:53.000000000 +0200
-+++ xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am	2008-03-13 18:27:23.000000000 +0100
-@@ -41,7 +41,7 @@
- 
- AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
- 
--INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
-+INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
- 
- # FIXME: These need to be added to the build
- LNX_EXTRA_SRCS = \
diff --git a/recipes/xorg-xserver/xserver-xorg-1.4/drmfix.patch b/recipes/xorg-xserver/xserver-xorg-1.4/drmfix.patch
deleted file mode 100644
index dde7637..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.4/drmfix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
-
-Index: xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am
-===================================================================
---- xorg-server-1.4.orig/hw/xfree86/os-support/linux/Makefile.am	2007-08-23 21:04:53.000000000 +0200
-+++ xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am	2008-03-13 18:27:23.000000000 +0100
-@@ -41,7 +41,7 @@
- 
- AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
- 
--INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
-+INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
- 
- # FIXME: These need to be added to the build
- LNX_EXTRA_SRCS = \
diff --git a/recipes/xorg-xserver/xserver-xorg-1.5.1/drmfix.patch b/recipes/xorg-xserver/xserver-xorg-1.5.1/drmfix.patch
deleted file mode 100644
index 8ebda98..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.5.1/drmfix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
-
-Index: xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am
-===================================================================
---- xorg-server-1.5.1.orig/hw/xfree86/os-support/linux/Makefile.am	2008-09-23 19:24:59.000000000 +0100
-+++ xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am	2008-10-27 13:27:40.000000000 +0000
-@@ -40,7 +40,7 @@
- 
- AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
- 
--INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
-+INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
- 
- # FIXME: These need to be added to the build
- LNX_EXTRA_SRCS = \
diff --git a/recipes/xorg-xserver/xserver-xorg-1.5.3/drmfix.patch b/recipes/xorg-xserver/xserver-xorg-1.5.3/drmfix.patch
deleted file mode 100644
index 8ebda98..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.5.3/drmfix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
-
-Index: xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am
-===================================================================
---- xorg-server-1.5.1.orig/hw/xfree86/os-support/linux/Makefile.am	2008-09-23 19:24:59.000000000 +0100
-+++ xorg-server-1.5.1/hw/xfree86/os-support/linux/Makefile.am	2008-10-27 13:27:40.000000000 +0000
-@@ -40,7 +40,7 @@
- 
- AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
- 
--INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
-+INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
- 
- # FIXME: These need to be added to the build
- LNX_EXTRA_SRCS = \
diff --git a/recipes/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-configure.patch b/recipes/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-configure.patch
deleted file mode 100644
index 85db023..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-configure.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ddb265e3c5e99065ceeef92ecb9fd94b4c3e169e Mon Sep 17 00:00:00 2001
-From: Daniel Stone <daniel@fooishbar.org>
-Date: Thu, 7 May 2009 14:23:25 +0200
-Subject: [PATCH 36/78] configure.ac: Add GLX_SYS_LIBS for Xvfb and Xnest
-
-This fixes the linking for these two when using DRI2, which requires
-DLOPEN_LIBS.
-(cherry picked from commit ae38151ddda9984effca5bb7c582540061201dce)
-
-Conflicts:
-
-	configure.ac
----
- configure.ac |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: xorg-server-1.5.3/configure.ac
-===================================================================
---- xorg-server-1.5.3.orig/configure.ac	2008-11-05 11:46:15.000000000 -0800
-+++ xorg-server-1.5.3/configure.ac	2009-09-14 19:48:11.043879237 -0700
-@@ -1215,7 +1215,7 @@
- 
- if test "x$XVFB" = xyes; then
- 	XVFB_LIBS="$FB_LIB $FIXES_LIB $XEXT_LIB $CONFIG_LIB $DBE_LIB $XTRAP_LIB $RECORD_LIB $GLX_LIBS $RENDER_LIB $RANDR_LIB $DAMAGE_LIB $MIEXT_DAMAGE_LIB $MIEXT_SHADOW_LIB $XI_LIB $XKB_LIB $XKB_STUB_LIB $COMPOSITE_LIB $XPSTUBS_LIB"
--	XVFB_SYS_LIBS="$XVFBMODULES_LIBS"
-+	XVFB_SYS_LIBS="$XVFBMODULES_LIBS $GLX_SYS_LIBS"
- 	AC_SUBST([XVFB_LIBS])
- 	AC_SUBST([XVFB_SYS_LIBS])
- fi
-@@ -1233,7 +1233,7 @@
- 
- if test "x$XNEST" = xyes; then
- 	XNEST_LIBS="$FB_LIB $FIXES_LIB $MI_LIB $XEXT_LIB $DBE_LIB $XTRAP_LIB $RECORD_LIB $GLX_LIBS $RENDER_LIB $RANDR_LIB $DAMAGE_LIB $MIEXT_DAMAGE_LIB $MIEXT_SHADOW_LIB $XI_LIB $XKB_LIB $XKB_STUB_LIB $COMPOSITE_LIB $XPSTUBS_LIB $DIX_LIB $OS_LIB $CONFIG_LIB"
--	XNEST_SYS_LIBS="$XNESTMODULES_LIBS"
-+	XNEST_SYS_LIBS="$XNESTMODULES_LIBS $GLX_SYS_LIBS"
- 	AC_SUBST([XNEST_LIBS])
- 	AC_SUBST([XNEST_SYS_LIBS])
- fi
diff --git a/recipes/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-glcore-prepare-for-dynamic.patch b/recipes/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-glcore-prepare-for-dynamic.patch
deleted file mode 100644
index 17eb0f5..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.5.3/xorg-server-1.5.3-glcore-prepare-for-dynamic.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 70df9cb2b93ed3d4b7d6e201a58951c9981bbc93 Mon Sep 17 00:00:00 2001
-From: =?utf-8?q?R=C3=A9mi=20Cardona?= <remi@gentoo.org>
-Date: Thu, 7 May 2009 14:19:22 +0200
-Subject: [PATCH 35/78] cherry-pick the rest of "glcore: prepare for dynamic loading"
-
-When f2c30a57e3c6169fbecdbb60ac24ad2a5e9aa8a4 was cherry-picked into the
-1.5 branch, some parts were lost. This commit brings the missing bits.
-
-Conflicts:
-
-	configure.ac
----
- configure.ac                |    2 +-
- hw/kdrive/ephyr/Makefile.am |    4 ++++
- hw/kdrive/fake/Makefile.am  |    4 ++++
- hw/kdrive/fbdev/Makefile.am |    4 ++++
- hw/kdrive/sdl/Makefile.am   |    4 ++++
- hw/kdrive/vesa/Makefile.am  |    4 ++++
- 6 files changed, 21 insertions(+), 1 deletions(-)
-
-Index: xorg-server-1.5.3/configure.ac
-===================================================================
---- xorg-server-1.5.3.orig/configure.ac	2009-09-14 19:48:11.043879237 -0700
-+++ xorg-server-1.5.3/configure.ac	2009-09-14 19:49:34.903881120 -0700
-@@ -1964,7 +1964,7 @@
-     KDRIVE_LOCAL_LIBS="$TSLIB_LIBS $DIX_LIB $KDRIVE_LIB $KDRIVE_STUB_LIB $CONFIG_LIB"
-     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $FB_LIB $MI_LIB $KDRIVE_PURE_LIBS"
-     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $KDRIVE_OS_LIB $OS_LIB"
--    KDRIVE_LIBS="$KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS"
-+    KDRIVE_LIBS="$KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS $GLX_SYS_LIBS"
- 
-     # check if we can build Xephyr
-     PKG_CHECK_MODULES(XEPHYR, $XEPHYR_REQUIRED_LIBS, [xephyr="yes"], [xephyr="no"])
-Index: xorg-server-1.5.3/hw/kdrive/ephyr/Makefile.am
-===================================================================
---- xorg-server-1.5.3.orig/hw/kdrive/ephyr/Makefile.am	2008-11-05 08:52:17.000000000 -0800
-+++ xorg-server-1.5.3/hw/kdrive/ephyr/Makefile.am	2009-09-14 19:49:34.903881120 -0700
-@@ -67,6 +67,10 @@
- Xephyr_SOURCES = \
- 	ephyrinit.c
- 
-+if GLX
-+Xephyr_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
-+endif
-+
- Xephyr_LDADD = 						\
- 	libxephyr.a					\
- 	libxephyr-hostx.a			        \
-Index: xorg-server-1.5.3/hw/kdrive/fake/Makefile.am
-===================================================================
---- xorg-server-1.5.3.orig/hw/kdrive/fake/Makefile.am	2008-07-11 08:12:13.000000000 -0700
-+++ xorg-server-1.5.3/hw/kdrive/fake/Makefile.am	2009-09-14 19:49:34.903881120 -0700
-@@ -16,6 +16,10 @@
- Xfake_SOURCES = \
- 	fakeinit.c
- 
-+if GLX
-+Xfake_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
-+endif
-+
- Xfake_LDADD = 						\
- 	libfake.a					\
- 	@KDRIVE_LIBS@					\
-Index: xorg-server-1.5.3/hw/kdrive/fbdev/Makefile.am
-===================================================================
---- xorg-server-1.5.3.orig/hw/kdrive/fbdev/Makefile.am	2008-07-11 08:12:13.000000000 -0700
-+++ xorg-server-1.5.3/hw/kdrive/fbdev/Makefile.am	2009-09-14 19:49:34.903881120 -0700
-@@ -14,6 +14,10 @@
- Xfbdev_SOURCES = \
- 	fbinit.c
- 
-+if GLX
-+Xfbdev_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
-+endif
-+
- Xfbdev_LDADD = 						\
- 	libfbdev.a					\
- 	@KDRIVE_LIBS@
-Index: xorg-server-1.5.3/hw/kdrive/sdl/Makefile.am
-===================================================================
---- xorg-server-1.5.3.orig/hw/kdrive/sdl/Makefile.am	2008-07-11 08:12:13.000000000 -0700
-+++ xorg-server-1.5.3/hw/kdrive/sdl/Makefile.am	2009-09-14 19:49:34.903881120 -0700
-@@ -7,6 +7,10 @@
- 
- Xsdl_SOURCES = sdl.c
- 
-+if GLX
-+Xsdl_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
-+endif
-+
- Xsdl_LDADD = \
- 	@KDRIVE_LIBS@                                  \
- 	@XSDL_LIBS@
-Index: xorg-server-1.5.3/hw/kdrive/vesa/Makefile.am
-===================================================================
---- xorg-server-1.5.3.orig/hw/kdrive/vesa/Makefile.am	2008-11-05 08:52:17.000000000 -0800
-+++ xorg-server-1.5.3/hw/kdrive/vesa/Makefile.am	2009-09-14 19:49:34.903881120 -0700
-@@ -19,6 +19,10 @@
- Xvesa_SOURCES = \
- 	vesainit.c
- 
-+if GLX
-+Xvesa_LDFLAGS = $(LD_EXPORT_SYMBOLS_FLAG)
-+endif
-+
- Xvesa_LDADD = \
- 	libvesa.a 				\
- 	@KDRIVE_LIBS@
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch
new file mode 100644
index 0000000..e332ce0
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: xorg-server/m4/dolt.m4
+===================================================================
+--- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
++++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch
new file mode 100644
index 0000000..fb8d381
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch
@@ -0,0 +1,96 @@
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
+--- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
+@@ -95,6 +95,8 @@
+ 
+ #include "os.h"
+ 
++#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
++
+ EventListPtr xf86Events = NULL;
+ 
+ /**
+@@ -1086,4 +1088,67 @@
+     EnableDevice(dev, TRUE);
+ }
+ 
++/* Taken from evdev-properties.h. */
++#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
++#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
++
++/* This is a hack until we get device -> CRTC association. */
++void
++xf86InputRotationNotify(Rotation rotation)
++{
++    DeviceIntPtr dev;
++    LocalDevicePtr local;
++    int ret;
++    int swap_axes = 0;
++    CARD8 invert[2] = { 0, 0 };
++    static Atom prop_swap = 0, prop_invert = 0;
++    static int atom_generation = -1;
++    
++    if (atom_generation != serverGeneration) {
++        prop_swap = 0;
++        prop_invert = 0;
++    }
++
++    switch (rotation & RR_Rotate_All) {
++    case RR_Rotate_0:
++        break;
++    case RR_Rotate_90:
++        swap_axes = 1;
++        invert[0] = 1;
++        break;
++    case RR_Rotate_180:
++        invert[0] = 1;
++        invert[1] = 1;
++        break;
++    case RR_Rotate_270:
++        swap_axes = 1;
++        invert[1] = 1;
++        break;
++    }
++
++    if (!prop_swap)
++        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
++                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
++    if (!prop_invert)
++        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
++                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
++
++    for (dev = inputInfo.devices; dev; dev = dev->next) {
++        local = dev->public.devicePrivate;
++        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
++                                     PropModeReplace, 1, &swap_axes, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
++            continue;
++        }
++        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
++                                     PropModeReplace, 2, invert, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing invert property failed!\n");
++            continue;
++        }
++    }
++}
++
++
+ /* end of xf86Xinput.c */
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
+--- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
+@@ -391,6 +391,12 @@
+     if (didLock)
+ 	crtc->funcs->unlock (crtc);
+ 
++    /*
++     * Rotate Touchscreen
++     */
++    xf86InputRotationNotify(crtc->rotation);
++
++    
+     return ret;
+ }
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch b/recipes/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch
new file mode 100644
index 0000000..59753d5
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch
@@ -0,0 +1,13 @@
+Index: xorg-server-1.4/xorg-server.m4
+===================================================================
+--- xorg-server-1.4.orig/xorg-server.m4	2008-03-15 20:09:36.000000000 +0100
++++ xorg-server-1.4/xorg-server.m4	2008-03-15 20:09:51.000000000 +0100
+@@ -30,7 +30,7 @@
+ 
+ AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
+ 	SAVE_CFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -I`pkg-config --variable=sdkdir xorg-server`"
++	CFLAGS="$CFLAGS `pkg-config --cflags xorg-server`"
+ 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include "xorg-server.h"
+ #if !defined $1
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.4/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.7.4/dolt-fix.patch
new file mode 100644
index 0000000..e332ce0
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.4/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: xorg-server/m4/dolt.m4
+===================================================================
+--- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
++++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.4/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.7.4/hack-fbdev-ignore-return-mode.patch
new file mode 100644
index 0000000..d3661cb
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.4/hack-fbdev-ignore-return-mode.patch
@@ -0,0 +1,39 @@
+Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
+(and probably other) while returning from chvt or resume on some
+hardware (e. g. zaurus).
+
+Correct fix would require debugging of fbdev mode during LeaveVT and
+EnterVT.
+
+This patch may cause staying in incorrect or corrupted display mode
+after EnterVT, but on man affected devices it does not cause any visible
+problems.
+
+Hacked code is never called on properly written drivers.
+
+Devices affected and testers involved for future patch removal:
+Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
+
+See also:
+https://bugzilla.redhat.com/show_bug.cgi?id=238451
+
+The bug (first line indicates that your device is affected):
+
+(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
+
+Fatal server error:
+EnterVT failed for screen 0
+
+Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+===================================================================
+--- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
++++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
+ #if DEBUG
+ 		print_fbdev_mode("returned", &set_var);
+ #endif
+-		return FALSE;
++		/* return FALSE; UGLY HACK to allow return from chvt */
+ 	}
+ 
+ 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.4/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.7.4/randr-support.patch
new file mode 100644
index 0000000..fb8d381
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.4/randr-support.patch
@@ -0,0 +1,96 @@
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
+--- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
+@@ -95,6 +95,8 @@
+ 
+ #include "os.h"
+ 
++#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
++
+ EventListPtr xf86Events = NULL;
+ 
+ /**
+@@ -1086,4 +1088,67 @@
+     EnableDevice(dev, TRUE);
+ }
+ 
++/* Taken from evdev-properties.h. */
++#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
++#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
++
++/* This is a hack until we get device -> CRTC association. */
++void
++xf86InputRotationNotify(Rotation rotation)
++{
++    DeviceIntPtr dev;
++    LocalDevicePtr local;
++    int ret;
++    int swap_axes = 0;
++    CARD8 invert[2] = { 0, 0 };
++    static Atom prop_swap = 0, prop_invert = 0;
++    static int atom_generation = -1;
++    
++    if (atom_generation != serverGeneration) {
++        prop_swap = 0;
++        prop_invert = 0;
++    }
++
++    switch (rotation & RR_Rotate_All) {
++    case RR_Rotate_0:
++        break;
++    case RR_Rotate_90:
++        swap_axes = 1;
++        invert[0] = 1;
++        break;
++    case RR_Rotate_180:
++        invert[0] = 1;
++        invert[1] = 1;
++        break;
++    case RR_Rotate_270:
++        swap_axes = 1;
++        invert[1] = 1;
++        break;
++    }
++
++    if (!prop_swap)
++        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
++                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
++    if (!prop_invert)
++        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
++                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
++
++    for (dev = inputInfo.devices; dev; dev = dev->next) {
++        local = dev->public.devicePrivate;
++        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
++                                     PropModeReplace, 1, &swap_axes, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
++            continue;
++        }
++        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
++                                     PropModeReplace, 2, invert, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing invert property failed!\n");
++            continue;
++        }
++    }
++}
++
++
+ /* end of xf86Xinput.c */
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
+--- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
+@@ -391,6 +391,12 @@
+     if (didLock)
+ 	crtc->funcs->unlock (crtc);
+ 
++    /*
++     * Rotate Touchscreen
++     */
++    xf86InputRotationNotify(crtc->rotation);
++
++    
+     return ret;
+ }
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.4/sysroot_fix.patch b/recipes/xorg-xserver/xserver-xorg-1.7.4/sysroot_fix.patch
new file mode 100644
index 0000000..59753d5
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.4/sysroot_fix.patch
@@ -0,0 +1,13 @@
+Index: xorg-server-1.4/xorg-server.m4
+===================================================================
+--- xorg-server-1.4.orig/xorg-server.m4	2008-03-15 20:09:36.000000000 +0100
++++ xorg-server-1.4/xorg-server.m4	2008-03-15 20:09:51.000000000 +0100
+@@ -30,7 +30,7 @@
+ 
+ AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
+ 	SAVE_CFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -I`pkg-config --variable=sdkdir xorg-server`"
++	CFLAGS="$CFLAGS `pkg-config --cflags xorg-server`"
+ 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include "xorg-server.h"
+ #if !defined $1
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch
new file mode 100644
index 0000000..e332ce0
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: xorg-server/m4/dolt.m4
+===================================================================
+--- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
++++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch
new file mode 100644
index 0000000..d3661cb
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch
@@ -0,0 +1,39 @@
+Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
+(and probably other) while returning from chvt or resume on some
+hardware (e. g. zaurus).
+
+Correct fix would require debugging of fbdev mode during LeaveVT and
+EnterVT.
+
+This patch may cause staying in incorrect or corrupted display mode
+after EnterVT, but on man affected devices it does not cause any visible
+problems.
+
+Hacked code is never called on properly written drivers.
+
+Devices affected and testers involved for future patch removal:
+Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
+
+See also:
+https://bugzilla.redhat.com/show_bug.cgi?id=238451
+
+The bug (first line indicates that your device is affected):
+
+(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
+
+Fatal server error:
+EnterVT failed for screen 0
+
+Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+===================================================================
+--- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
++++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
+ #if DEBUG
+ 		print_fbdev_mode("returned", &set_var);
+ #endif
+-		return FALSE;
++		/* return FALSE; UGLY HACK to allow return from chvt */
+ 	}
+ 
+ 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch
new file mode 100644
index 0000000..fb8d381
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch
@@ -0,0 +1,96 @@
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
+--- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
+@@ -95,6 +95,8 @@
+ 
+ #include "os.h"
+ 
++#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
++
+ EventListPtr xf86Events = NULL;
+ 
+ /**
+@@ -1086,4 +1088,67 @@
+     EnableDevice(dev, TRUE);
+ }
+ 
++/* Taken from evdev-properties.h. */
++#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
++#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
++
++/* This is a hack until we get device -> CRTC association. */
++void
++xf86InputRotationNotify(Rotation rotation)
++{
++    DeviceIntPtr dev;
++    LocalDevicePtr local;
++    int ret;
++    int swap_axes = 0;
++    CARD8 invert[2] = { 0, 0 };
++    static Atom prop_swap = 0, prop_invert = 0;
++    static int atom_generation = -1;
++    
++    if (atom_generation != serverGeneration) {
++        prop_swap = 0;
++        prop_invert = 0;
++    }
++
++    switch (rotation & RR_Rotate_All) {
++    case RR_Rotate_0:
++        break;
++    case RR_Rotate_90:
++        swap_axes = 1;
++        invert[0] = 1;
++        break;
++    case RR_Rotate_180:
++        invert[0] = 1;
++        invert[1] = 1;
++        break;
++    case RR_Rotate_270:
++        swap_axes = 1;
++        invert[1] = 1;
++        break;
++    }
++
++    if (!prop_swap)
++        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
++                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
++    if (!prop_invert)
++        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
++                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
++
++    for (dev = inputInfo.devices; dev; dev = dev->next) {
++        local = dev->public.devicePrivate;
++        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
++                                     PropModeReplace, 1, &swap_axes, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
++            continue;
++        }
++        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
++                                     PropModeReplace, 2, invert, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing invert property failed!\n");
++            continue;
++        }
++    }
++}
++
++
+ /* end of xf86Xinput.c */
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
+--- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
+@@ -391,6 +391,12 @@
+     if (didLock)
+ 	crtc->funcs->unlock (crtc);
+ 
++    /*
++     * Rotate Touchscreen
++     */
++    xf86InputRotationNotify(crtc->rotation);
++
++    
+     return ret;
+ }
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.99.906/0001-xf86Modes-make-sure-that-DisplayModeRec-name-is-init.patch b/recipes/xorg-xserver/xserver-xorg-1.8.99.906/0001-xf86Modes-make-sure-that-DisplayModeRec-name-is-init.patch
deleted file mode 100644
index adbc274..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.8.99.906/0001-xf86Modes-make-sure-that-DisplayModeRec-name-is-init.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 7deb3068ff65ecadf035e8e493d418aca89c9212 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 30 Jun 2010 10:42:36 +0200
-Subject: [PATCH] xf86Modes: make sure that DisplayModeRec name is initialized to NULL and then don't call free() on it in xf86SetModeDefaultName
-
----
- hw/xfree86/modes/xf86Modes.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/hw/xfree86/modes/xf86Modes.c b/hw/xfree86/modes/xf86Modes.c
-index 05f4319..09a9679 100644
---- a/hw/xfree86/modes/xf86Modes.c
-+++ b/hw/xfree86/modes/xf86Modes.c
-@@ -206,7 +206,7 @@ xf86DuplicateMode(const DisplayModeRec *pMode)
- {
-     DisplayModePtr pNew;
- 
--    pNew = xnfalloc(sizeof(DisplayModeRec));
-+    pNew = xnfcalloc(1, sizeof(DisplayModeRec));
-     *pNew = *pMode;
-     pNew->next = NULL;
-     pNew->prev = NULL;
--- 
-1.7.1
-
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.99.906/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.8.99.906/dolt-fix.patch
new file mode 100644
index 0000000..e332ce0
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.8.99.906/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: xorg-server/m4/dolt.m4
+===================================================================
+--- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
++++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.99.906/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.8.99.906/hack-fbdev-ignore-return-mode.patch
new file mode 100644
index 0000000..d3661cb
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.8.99.906/hack-fbdev-ignore-return-mode.patch
@@ -0,0 +1,39 @@
+Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
+(and probably other) while returning from chvt or resume on some
+hardware (e. g. zaurus).
+
+Correct fix would require debugging of fbdev mode during LeaveVT and
+EnterVT.
+
+This patch may cause staying in incorrect or corrupted display mode
+after EnterVT, but on man affected devices it does not cause any visible
+problems.
+
+Hacked code is never called on properly written drivers.
+
+Devices affected and testers involved for future patch removal:
+Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
+
+See also:
+https://bugzilla.redhat.com/show_bug.cgi?id=238451
+
+The bug (first line indicates that your device is affected):
+
+(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
+
+Fatal server error:
+EnterVT failed for screen 0
+
+Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+===================================================================
+--- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
++++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
+ #if DEBUG
+ 		print_fbdev_mode("returned", &set_var);
+ #endif
+-		return FALSE;
++		/* return FALSE; UGLY HACK to allow return from chvt */
+ 	}
+ 
+ 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.99.906/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.8.99.906/randr-support.patch
new file mode 100644
index 0000000..fb8d381
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.8.99.906/randr-support.patch
@@ -0,0 +1,96 @@
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
+--- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
+@@ -95,6 +95,8 @@
+ 
+ #include "os.h"
+ 
++#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
++
+ EventListPtr xf86Events = NULL;
+ 
+ /**
+@@ -1086,4 +1088,67 @@
+     EnableDevice(dev, TRUE);
+ }
+ 
++/* Taken from evdev-properties.h. */
++#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
++#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
++
++/* This is a hack until we get device -> CRTC association. */
++void
++xf86InputRotationNotify(Rotation rotation)
++{
++    DeviceIntPtr dev;
++    LocalDevicePtr local;
++    int ret;
++    int swap_axes = 0;
++    CARD8 invert[2] = { 0, 0 };
++    static Atom prop_swap = 0, prop_invert = 0;
++    static int atom_generation = -1;
++    
++    if (atom_generation != serverGeneration) {
++        prop_swap = 0;
++        prop_invert = 0;
++    }
++
++    switch (rotation & RR_Rotate_All) {
++    case RR_Rotate_0:
++        break;
++    case RR_Rotate_90:
++        swap_axes = 1;
++        invert[0] = 1;
++        break;
++    case RR_Rotate_180:
++        invert[0] = 1;
++        invert[1] = 1;
++        break;
++    case RR_Rotate_270:
++        swap_axes = 1;
++        invert[1] = 1;
++        break;
++    }
++
++    if (!prop_swap)
++        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
++                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
++    if (!prop_invert)
++        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
++                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
++
++    for (dev = inputInfo.devices; dev; dev = dev->next) {
++        local = dev->public.devicePrivate;
++        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
++                                     PropModeReplace, 1, &swap_axes, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
++            continue;
++        }
++        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
++                                     PropModeReplace, 2, invert, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing invert property failed!\n");
++            continue;
++        }
++    }
++}
++
++
+ /* end of xf86Xinput.c */
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
+--- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
+@@ -391,6 +391,12 @@
+     if (didLock)
+ 	crtc->funcs->unlock (crtc);
+ 
++    /*
++     * Rotate Touchscreen
++     */
++    xf86InputRotationNotify(crtc->rotation);
++
++    
+     return ret;
+ }
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg/dolt-fix-1.7.0.patch b/recipes/xorg-xserver/xserver-xorg/dolt-fix-1.7.0.patch
deleted file mode 100644
index e332ce0..0000000
--- a/recipes/xorg-xserver/xserver-xorg/dolt-fix-1.7.0.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: xorg-server/m4/dolt.m4
-===================================================================
---- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
-+++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
-@@ -147,7 +147,7 @@
-     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
- #!$DOLT_BASH
- __DOLTLIBTOOL__EOF__
--    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
-+    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
- top_builddir_slash="${0%%doltlibtool}"
- : ${top_builddir_slash:=./}
- args=()
-@@ -163,7 +163,7 @@
- if $modeok && $tagok ; then
-     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
- else
--    exec ${top_builddir_slash}libtool "$[]@"
-+    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
- fi
- __DOLTLIBTOOL__EOF__
- 
diff --git a/recipes/xorg-xserver/xserver-xorg/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg/dolt-fix.patch
deleted file mode 100644
index 9e15f42..0000000
--- a/recipes/xorg-xserver/xserver-xorg/dolt-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: xorg-server-1.6.1/acinclude.m4
-===================================================================
---- xorg-server-1.6.1.orig/acinclude.m4	2009-04-14 21:14:56.000000000 +0400
-+++ xorg-server-1.6.1/acinclude.m4	2009-07-15 12:38:33.796848843 +0400
-@@ -147,7 +147,7 @@
-     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
- #!$DOLT_BASH
- __DOLTLIBTOOL__EOF__
--    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
-+    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
- top_builddir_slash="${0%%doltlibtool}"
- : ${top_builddir_slash:=./}
- args=()
-@@ -163,7 +163,7 @@
- if $modeok && $tagok ; then
-     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
- else
--    exec ${top_builddir_slash}libtool "$[]@"
-+    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
- fi
- __DOLTLIBTOOL__EOF__
- 
diff --git a/recipes/xorg-xserver/xserver-xorg/drmfix.patch b/recipes/xorg-xserver/xserver-xorg/drmfix.patch
deleted file mode 100644
index fcbeac0..0000000
--- a/recipes/xorg-xserver/xserver-xorg/drmfix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-upstream: applied in b3e981c9d4ff31263a43b47f83cf8db4c2b5aeff (2008-07-28)
-
-Index: xorg-server-X11R7.0-1.0.1/hw/xfree86/os-support/linux/Makefile.am
-===================================================================
---- xorg-server-X11R7.0-1.0.1.orig/hw/xfree86/os-support/linux/Makefile.am
-+++ xorg-server-X11R7.0-1.0.1/hw/xfree86/os-support/linux/Makefile.am
-@@ -24,7 +24,7 @@ liblinux_la_SOURCES = lnx_init.c lnx_vid
- 
- AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(XORG_CFLAGS) @SERVER_DEFINES@ @LOADER_DEFINES@
- 
--INCLUDES = $(XORG_INCS) -I/usr/include/drm # FIXME this last part is crack
-+INCLUDES = $(XORG_INCS) $(LIBDRM_CFLAGS)
- 
- # FIXME: These need to be added to the build
- LNX_EXTRA_SOURCES = \
diff --git a/recipes/xorg-xserver/xserver-xorg/fontfile.patch b/recipes/xorg-xserver/xserver-xorg/fontfile.patch
deleted file mode 100644
index ed39bf4..0000000
--- a/recipes/xorg-xserver/xserver-xorg/fontfile.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- xc/lib/font/fontfile/Imakefile.old	2005-06-03 20:09:53.000000000 +0100
-+++ xc/lib/font/fontfile/Imakefile	2005-06-03 20:09:57.000000000 +0100
-@@ -14,7 +14,7 @@
- #endif
- 
-    INCLUDES = -I$(FONTINCSRC) -I../include -I$(SERVERSRC)/include \
--	      -I$(INCLUDESRC)
-+	      -I$(INCLUDESRC) $(CC_STAGING)
-     HEADERS = 
- #ifdef FontFormatDefines
- FORMAT_DEFS = FontFormatDefines
diff --git a/recipes/xorg-xserver/xserver-xorg/freetype.patch b/recipes/xorg-xserver/xserver-xorg/freetype.patch
deleted file mode 100644
index 0ba3dd5..0000000
--- a/recipes/xorg-xserver/xserver-xorg/freetype.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- xc/lib/font/FreeType/Imakefile.old	2005-06-03 20:18:51.000000000 +0100
-+++ xc/lib/font/FreeType/Imakefile	2005-06-03 20:18:52.000000000 +0100
-@@ -20,7 +20,7 @@
- 
- INCLUDES = $(FT2INCS) -I. -I$(FONTINCSRC) -I../include -I$(XINCLUDESRC) \
-            -I$(SERVERSRC)/include $(EXTRAINCLUDES) \
--           -I$(INCLUDESRC)
-+           -I$(INCLUDESRC) $(CC_STAGING)
- 
- SRCS = xttcap.c ftfuncs.c ftenc.c fttools.c
- OBJS = xttcap.o ftfuncs.o ftenc.o fttools.o
---- xc/config/cf/X11.tmpl.old	2005-06-03 20:40:24.000000000 +0100
-+++ xc/config/cf/X11.tmpl	2005-06-03 20:40:40.000000000 +0100
-@@ -3371,7 +3371,7 @@
- 
- #if BuildFreetype2Library || HasFreetype2
- #if Freetype2IncDirStandard
--FREETYPE2INCLUDES = -I$(FREETYPE2INCDIR)/freetype2 -I$(FREETYPE2INCDIR)/freetype2/config
-+FREETYPE2INCLUDES = `pkg-config --cflags freetype2`
- #else
- FREETYPE2INCLUDES = -I$(FREETYPE2INCDIR) -I$(FREETYPE2INCDIR)/freetype2 -I$(FREETYPE2INCDIR)/freetype2/config
- #endif
diff --git a/recipes/xorg-xserver/xserver-xorg/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg/hack-fbdev-ignore-return-mode.patch
deleted file mode 100644
index d3661cb..0000000
--- a/recipes/xorg-xserver/xserver-xorg/hack-fbdev-ignore-return-mode.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
-(and probably other) while returning from chvt or resume on some
-hardware (e. g. zaurus).
-
-Correct fix would require debugging of fbdev mode during LeaveVT and
-EnterVT.
-
-This patch may cause staying in incorrect or corrupted display mode
-after EnterVT, but on man affected devices it does not cause any visible
-problems.
-
-Hacked code is never called on properly written drivers.
-
-Devices affected and testers involved for future patch removal:
-Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
-
-See also:
-https://bugzilla.redhat.com/show_bug.cgi?id=238451
-
-The bug (first line indicates that your device is affected):
-
-(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
-
-Fatal server error:
-EnterVT failed for screen 0
-
-Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-===================================================================
---- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
-+++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
- #if DEBUG
- 		print_fbdev_mode("returned", &set_var);
- #endif
--		return FALSE;
-+		/* return FALSE; UGLY HACK to allow return from chvt */
- 	}
- 
- 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg/imake-installed.patch b/recipes/xorg-xserver/xserver-xorg/imake-installed.patch
deleted file mode 100644
index 5782107..0000000
--- a/recipes/xorg-xserver/xserver-xorg/imake-installed.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- xc/config/cf/Imake.tmpl.old	2005-05-05 21:04:45.000000000 +0100
-+++ xc/config/cf/Imake.tmpl	2005-05-05 21:04:49.000000000 +0100
-@@ -2058,7 +2058,7 @@
-  * INCLUDES contains client-specific includes set in Imakefile
-  * LOCAL_LDFLAGS contains client-specific ld flags flags set in Imakefile
-  */
--      ALLINCLUDES = $(INCLUDES) $(EXTRA_INCLUDES) $(TOP_INCLUDES) $(INSTALLED_INCLUDES) $(STD_INCLUDES)
-+      ALLINCLUDES = $(INCLUDES) $(EXTRA_INCLUDES) $(TOP_INCLUDES) $(STD_INCLUDES)
-        ALLDEFINES = $(ALLINCLUDES) $(STD_DEFINES) $(PROTO_DEFINES) $(THREADS_DEFINES) $(MODULE_DEFINES) $(DEFINES) $(EXTRA_DEFINES)
-            CFLAGS = $(CDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(MODULE_CFLAGS) $(ALLDEFINES) $(CC_STAGING)
-         LINTFLAGS = $(LINTOPTS) -DLINT $(ALLDEFINES) $(DEPEND_DEFINES)
diff --git a/recipes/xorg-xserver/xserver-xorg/no-screen-blanking.patch b/recipes/xorg-xserver/xserver-xorg/no-screen-blanking.patch
deleted file mode 100644
index cd7cbe3..0000000
--- a/recipes/xorg-xserver/xserver-xorg/no-screen-blanking.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-upstream: not applicable to upstream
-
---- xserver/include/site.h-orig	2006-11-02 10:37:14.000000000 +0000
-+++ xserver/include/site.h	2006-11-02 10:37:14.000000000 +0000
-@@ -117,8 +117,8 @@
- #define DEFAULT_PTR_DENOMINATOR	1
- #define DEFAULT_PTR_THRESHOLD	4
- 
--#define DEFAULT_SCREEN_SAVER_TIME (10 * (60 * 1000))
--#define DEFAULT_SCREEN_SAVER_INTERVAL (10 * (60 * 1000))
-+#define DEFAULT_SCREEN_SAVER_TIME 0
-+#define DEFAULT_SCREEN_SAVER_INTERVAL 0
- #define DEFAULT_SCREEN_SAVER_BLANKING PreferBlanking
- #define DEFAULT_SCREEN_SAVER_EXPOSURES AllowExposures
- #ifndef NOLOGOHACK
diff --git a/recipes/xorg-xserver/xserver-xorg/randr-support-1.7.0.patch b/recipes/xorg-xserver/xserver-xorg/randr-support-1.7.0.patch
deleted file mode 100644
index fb8d381..0000000
--- a/recipes/xorg-xserver/xserver-xorg/randr-support-1.7.0.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
---- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
-+++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
-@@ -95,6 +95,8 @@
- 
- #include "os.h"
- 
-+#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
-+
- EventListPtr xf86Events = NULL;
- 
- /**
-@@ -1086,4 +1088,67 @@
-     EnableDevice(dev, TRUE);
- }
- 
-+/* Taken from evdev-properties.h. */
-+#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
-+#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
-+
-+/* This is a hack until we get device -> CRTC association. */
-+void
-+xf86InputRotationNotify(Rotation rotation)
-+{
-+    DeviceIntPtr dev;
-+    LocalDevicePtr local;
-+    int ret;
-+    int swap_axes = 0;
-+    CARD8 invert[2] = { 0, 0 };
-+    static Atom prop_swap = 0, prop_invert = 0;
-+    static int atom_generation = -1;
-+    
-+    if (atom_generation != serverGeneration) {
-+        prop_swap = 0;
-+        prop_invert = 0;
-+    }
-+
-+    switch (rotation & RR_Rotate_All) {
-+    case RR_Rotate_0:
-+        break;
-+    case RR_Rotate_90:
-+        swap_axes = 1;
-+        invert[0] = 1;
-+        break;
-+    case RR_Rotate_180:
-+        invert[0] = 1;
-+        invert[1] = 1;
-+        break;
-+    case RR_Rotate_270:
-+        swap_axes = 1;
-+        invert[1] = 1;
-+        break;
-+    }
-+
-+    if (!prop_swap)
-+        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
-+                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
-+    if (!prop_invert)
-+        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
-+                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
-+
-+    for (dev = inputInfo.devices; dev; dev = dev->next) {
-+        local = dev->public.devicePrivate;
-+        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
-+                                     PropModeReplace, 1, &swap_axes, FALSE);
-+        if (ret != Success) {
-+            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
-+            continue;
-+        }
-+        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
-+                                     PropModeReplace, 2, invert, FALSE);
-+        if (ret != Success) {
-+            xf86Msg(X_ERROR, "Changing invert property failed!\n");
-+            continue;
-+        }
-+    }
-+}
-+
-+
- /* end of xf86Xinput.c */
-diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
---- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
-+++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
-@@ -391,6 +391,12 @@
-     if (didLock)
- 	crtc->funcs->unlock (crtc);
- 
-+    /*
-+     * Rotate Touchscreen
-+     */
-+    xf86InputRotationNotify(crtc->rotation);
-+
-+    
-     return ret;
- }
- 
diff --git a/recipes/xorg-xserver/xserver-xorg/xpconfig-parentdir.patch b/recipes/xorg-xserver/xserver-xorg/xpconfig-parentdir.patch
deleted file mode 100644
index 17d05d3..0000000
--- a/recipes/xorg-xserver/xserver-xorg/xpconfig-parentdir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
---- xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/HPLJ4050-PS/fonts/Makefile.am.orig	2006-06-23 10:20:42.126095128 -0600
-+++ xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/HPLJ4050-PS/fonts/Makefile.am	2006-06-23 10:20:50.923757680 -0600
-@@ -1,6 +1,6 @@
- xpcdir = @xpconfigdir@/C/print/models/HPLJ4050-PS/fonts
- 
--parentdir = $(DESTDIR)/@xpconfigdir@/C/print/models/PSdefault/fonts
-+parentdir = @xpconfigdir@/C/print/models/PSdefault/fonts
- 
- XPFONTS = \
-         AvantGarde-Book.pmf \
---- xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/CANONC3200-PS/fonts/Makefile.am.orig	2006-06-23 10:21:02.877940368 -0600
-+++ xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/CANONC3200-PS/fonts/Makefile.am	2006-06-23 10:21:11.903568264 -0600
-@@ -1,6 +1,6 @@
- xpcdir = @xpconfigdir@/C/print/models/CANONC3200-PS/fonts
- 
--parentdir = $(DESTDIR)/@xpconfigdir@/C/print/models/PSdefault/fonts
-+parentdir = @xpconfigdir@/C/print/models/PSdefault/fonts
- 
- XPFONTS = \
-         AvantGarde-Book.pmf \
---- xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/SPSPARC2/fonts/Makefile.am.orig	2006-06-23 10:21:22.893897480 -0600
-+++ xorg-server-X11R7.0-1.0.1/XpConfig/C/print/models/SPSPARC2/fonts/Makefile.am	2006-06-23 10:21:28.412058592 -0600
-@@ -1,6 +1,6 @@
- xpcdir = @xpconfigdir@/C/print/models/SPSPARC2/fonts
- 
--parentdir = $(DESTDIR)/@xpconfigdir@/C/print/models/PSdefault/fonts
-+parentdir = @xpconfigdir@/C/print/models/PSdefault/fonts
- 
- XPFONTS = \
-         Courier-Bold.pmf \
diff --git a/recipes/xorg-xserver/xserver-xorg_1.2.0.bb b/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
deleted file mode 100644
index 0b2e399..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-MESA_VER = "6.5.2"
-
-require xorg-xserver-common.inc
-PE = "1"
-PR = "${INC_PR}.1"
-
-export LDFLAGS += " -ldl "
-
-#DESCRIPTION = ""
-
-#DEPENDS += " "
-
-SRC_URI += "file://report-correct-randr10.patch"
-SRC_URI[archive.md5sum] = "ea291c89e68832d570d9d5e007218bd6"
-SRC_URI[archive.sha256sum] = "e3e56b35ee13098f4ee79948beb20bfc9a06d1a7a35fb906405ff1531b92bb85"
diff --git a/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb b/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
deleted file mode 100644
index c2ec4b1..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-MESA_VER = "6.5.2"
-
-require xorg-xserver-common.inc
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://drmfix.patch \
-            file://glyphstr.patch \
-            file://report-correct-randr12.patch"
-
-export LDFLAGS += " -ldl "
-
-#DESCRIPTION = ""
-
-#DEPENDS += " "
-
-SRC_URI[archive.md5sum] = "a51a7d482e3c689394755bb17bda8526"
-SRC_URI[archive.sha256sum] = "93c656f142f37607c15372dd24c5de9eab82cd79c5d60449174a928d345c2975"
diff --git a/recipes/xorg-xserver/xserver-xorg_1.4.2.bb b/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
deleted file mode 100644
index 0f4f8e7..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman"
-RDEPENDS_${PN} += "hal"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://drmfix.patch \
-            file://pkgconfig_fix.patch \
-            file://sysroot_fix.patch \
-            file://xcalibrate-xorg.diff \
-"
-
-MESA_VER = "7.0.2"
-
-export LDFLAGS += " -ldl "
-
-SRC_URI[archive.md5sum] = "fa2915ae377f61c340a18ebef484b64b"
-SRC_URI[archive.sha256sum] = "829c66ec4c295822700067c87afae796b8e67530cc65a7b83060ea29a4ff316d"
diff --git a/recipes/xorg-xserver/xserver-xorg_1.4.bb b/recipes/xorg-xserver/xserver-xorg_1.4.bb
deleted file mode 100644
index f153212..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.4.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman"
-RDEPENDS_${PN} += "hal"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://drmfix.patch \
-            file://pkgconfig_fix.patch \
-            file://sysroot_fix.patch"
-
-MESA_VER = "7.0.2"
-
-export LDFLAGS += " -ldl "
-
-SRC_URI[archive.md5sum] = "a06d9fe4f9f1d459ae02657f9ce64220"
-SRC_URI[archive.sha256sum] = "51b142df328d427143705371f139a08ff3bcd6efe0eab91f4178ca4017c0ebc2"
diff --git a/recipes/xorg-xserver/xserver-xorg_1.5.1.bb b/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
deleted file mode 100644
index b1eef4f..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl"
-RDEPENDS_${PN} += "hal"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://drmfix.patch \
-            file://sysroot_fix.patch"
-
-MESA_VER = "7.2"
-
-export LDFLAGS += " -ldl "
-
-SRC_URI[archive.md5sum] = "d16f5a033f001c9069b4141194614da2"
-SRC_URI[archive.sha256sum] = "2f36880bffaee0a5b2b704376a02b22066b6842445e1d77da698854e5973eb21"
diff --git a/recipes/xorg-xserver/xserver-xorg_1.5.3.bb b/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
deleted file mode 100644
index 776b87f..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl"
-RDEPENDS_${PN} += "hal"
-PE = "2"
-PR = "${INC_PR}.2"
-
-SRC_URI += "file://drmfix.patch \
-            file://sysroot_fix.patch \
-            file://xorg-avr32-support.diff \
-	    file://xorg-server-1.5.3-configure.patch \
-	    file://xorg-server-1.5.3-glcore-prepare-for-dynamic.patch \
-"
-
-MESA_VER = "7.2"
-
-export LDFLAGS += " -ldl "
-
-SRC_URI[archive.md5sum] = "308971036e25250e7fe3cccfd5a120f8"
-SRC_URI[archive.sha256sum] = "a680174f54be7763819e5275c5d5d44fc9e9b6f8e9351dd45c150eb4c182d5bb"
diff --git a/recipes/xorg-xserver/xserver-xorg_1.7.1.bb b/recipes/xorg-xserver/xserver-xorg_1.7.1.bb
index a0bbab4..60d4575 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.7.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.7.1.bb
@@ -6,8 +6,8 @@ PE = "2"
 PR = "${INC_PR}.1"
 
 SRC_URI += "file://sysroot_fix.patch \
-            file://dolt-fix-1.7.0.patch \
-            file://randr-support-1.7.0.patch \
+            file://dolt-fix.patch \
+            file://randr-support.patch \
            "
 do_install_prepend() {
         mkdir -p ${D}/${libdir}/X11/fonts
diff --git a/recipes/xorg-xserver/xserver-xorg_1.7.4.bb b/recipes/xorg-xserver/xserver-xorg_1.7.4.bb
index ef57039..41f0afc 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.7.4.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.7.4.bb
@@ -6,8 +6,8 @@ PE = "2"
 PR = "${INC_PR}.2"
 
 SRC_URI += "file://sysroot_fix.patch \
-            file://dolt-fix-1.7.0.patch \
-            file://randr-support-1.7.0.patch \
+            file://dolt-fix.patch \
+            file://randr-support.patch \
 	    file://hack-fbdev-ignore-return-mode.patch \
            "
 
diff --git a/recipes/xorg-xserver/xserver-xorg_1.8.1.bb b/recipes/xorg-xserver/xserver-xorg_1.8.1.bb
index 06f36cb..31ce24a 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.8.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.8.1.bb
@@ -9,8 +9,8 @@ PE = "2"
 PR = "${INC_PR}.2"
 
 SRC_URI += " \
-            file://dolt-fix-1.7.0.patch \
-            file://randr-support-1.7.0.patch \
+            file://dolt-fix.patch \
+            file://randr-support.patch \
 	    file://hack-fbdev-ignore-return-mode.patch \
            "
 SRC_URI[archive.md5sum] = "7c3b873692f4e93938261d774510e78d"
diff --git a/recipes/xorg-xserver/xserver-xorg_1.8.99.906.bb b/recipes/xorg-xserver/xserver-xorg_1.8.99.906.bb
index fc7530d..6558380 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.8.99.906.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.8.99.906.bb
@@ -8,15 +8,13 @@ DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts fon
 PE = "2"
 PR = "${INC_PR}.3"
 
-# Needs newer mesa-dri, where is D_P = "-1"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_shr = "1"
 
 SRC_URI += " \
-            file://dolt-fix-1.7.0.patch \
-            file://randr-support-1.7.0.patch \
+            file://dolt-fix.patch \
+            file://randr-support.patch \
             file://hack-fbdev-ignore-return-mode.patch \
-            file://0001-xf86Modes-make-sure-that-DisplayModeRec-name-is-init.patch \
            "
 SRC_URI[archive.md5sum] = "d4ab361cacc35e2ed4587019980b7e57"
 SRC_URI[archive.sha256sum] = "7bb5e3d1e36b65e367d11707e7e11285d9eb087d3281c59c8143dfe90cf9977e"
diff --git a/recipes/xorg-xserver/xserver-xorg_git.bb b/recipes/xorg-xserver/xserver-xorg_git.bb
index 46b0e08..9c82174 100644
--- a/recipes/xorg-xserver/xserver-xorg_git.bb
+++ b/recipes/xorg-xserver/xserver-xorg_git.bb
@@ -1,19 +1,21 @@
+# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
+DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
+
 require xorg-xserver-common.inc
 
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
-PV = "1.8.99.905"
+PV = "1.8.99.906"
 PR = "${INC_PR}.4"
 PR_append = "+gitr${SRCPV}"
 PE = "2"
 
 DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_shr = "1"
 
-SRCREV = "6dae7f3792611aace1df0cca63bf50c50d93de43"
+SRCREV = "71af1f71c0492c365707c6b3810f94642ff39352"
 SRC_URI = "git://anongit.freedesktop.org/xorg/xserver;protocol=git;branch=master \
-           file://dolt-fix-1.7.0.patch \
-           file://randr-support-1.7.0.patch \
+           file://dolt-fix.patch \
+           file://randr-support.patch \
 	   file://hack-fbdev-ignore-return-mode.patch \
            "
 
@@ -31,5 +33,6 @@ PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
 XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
 
 EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " --enable-dri2 --disable-unit-tests "
 
 export LDFLAGS += " -ldl "
-- 
1.7.2



