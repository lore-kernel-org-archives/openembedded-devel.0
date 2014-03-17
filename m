Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 20EAB6DC16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 00:05:11 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id hz1so4966222pad.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 17:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wCD0huXBu86tynLjOcDq9be3Bb97OoDePn+9O2QBvIQ=;
	b=lca1flIeXSckzusSoTm2W8ACcQAwMS9t9zBNOU7urpFvv25j5owtXJ/3dfotvEwX6J
	zr9gevQztHiaw0vouCFXztyT2v+LuFN0TgCSZGB2LrcxVGBMD+ZPHXRhnbKzi/mphfHk
	UpNL8JpjDHKJP2AElPP6rGhKIb3y8YdBtnUM26Dd/vlW91QLPcw9+MBmzd1eTpLNmfJX
	VLDNOyPpZfGO7ZRZ8w+YryfojhVEJgW9uEJtFVDPgmHsiQnF+biyCOhy03v4SwhuntSH
	QglCgcCDTGcSn/QyRTCE1JnSnShRzk7e7JYtr1IExs8UbL2ddT6FkLZE135U84BslSb/
	pw8A==
X-Received: by 10.66.227.193 with SMTP id sc1mr22192006pac.102.1395014712683; 
	Sun, 16 Mar 2014 17:05:12 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id x9sm37776977pbu.1.2014.03.16.17.05.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Mar 2014 17:05:11 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Mar 2014 17:04:07 -0700
Message-Id: <1395014647-18396-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-oe][PATCH v2 1/1] recipes-graphics/lxdm: add missing automake file, update build config
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
X-List-Received-Date: Mon, 17 Mar 2014 00:05:12 -0000

From: "Stephen Arnold" <stephen.arnold42@gmail.com>

PATCH recipes-graphics/lxdm:

 - add missing depends and inherit pkgconfig for autogen/configure
 - silence confgure warnings and update configure options
 - provide missing input file for automake

Built and tested on master branches using meta-raspberrypi and meta-alt-destop-extras.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index c12eddf..6ef014f 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -16,18 +16,27 @@ SRCREV = "07fb151a99ef99318b71f3de0afbba977b1e6267"
 PV = "0.5.0+git${SRCPV}"
 PE = "1"
 
-DEPENDS = "cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
+DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes"
 DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
 
 # combine oe-core way with angstrom DISTRO_TYPE
 DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
-inherit autotools gettext systemd
+inherit autotools pkgconfig gettext systemd
 
 S = "${WORKDIR}/git"
 
+CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
+
+EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb"
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)}"
 
+do_patch_extra() {
+    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
+}
+
+addtask do_patch_extra before do_configure after do_patch
+
 do_compile_append() {
     # default background configured not available / no password field available / no default screensaver
     sed -i     -e 's,bg=,# bg=,g' \
-- 
1.8.5.3


