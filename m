Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 288426AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:35:15 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id k71so18863430wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CctkCj/guKCyWnAji5KJrA5z17Wt8b3izk6Pby+qGf8=;
	b=RAh1hXz9I2rf4yK58SvjAHnj7W6qqPoQoIGHxFNBVM6S9BfxNh8of9/bz32JENIzWh
	d0MP+onLlnwxKj/J+RA/LjKO1ZQz0l981htGNTvSyu9yuAFSQrDt6JxtP13d+0fCUSlW
	qh++CewqoyGRe3iD2imqU37z+bvxFBo8NZUB5w70giHwvYRLxV3gqMKH7+YV2j/29CIW
	Qdpl1boEUdAoPjVU9Soy+MlkM4TZ51w3zPsgG5A09gmuucL5PKMnmsduUPqI5iNpC6ld
	y/aE8gLoJS/rRmT9yLDmwp0AU10BIS14s4uzflo722A93zu5nJimoYcum9Ei4tqf45C7
	NdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CctkCj/guKCyWnAji5KJrA5z17Wt8b3izk6Pby+qGf8=;
	b=UQWBbka0t4GnurPKfbs8Mnf8EsL5lyD4hYRkCR4naei6eZPYW8l/bNWUYEDEMJNCs3
	JzbNilgmDROrwlEXAqz8BiPM+IizU8dTumC/KIKy+r+tRz8/yamYvQBhEoFpSuOE11Rb
	ncPURvCsfTJA3hKkapJUBecYydjHUmssNcnX4pNKb0U87CF2LhanqrKF1lmfpF+aqguC
	4oJX/x8sceEN5t/AZ/G48K3k5Xdi/x1axnHbuyXbrhmBubCF77DkuYPY9tlwmfz7Bj5L
	1wm+hFHnxYO/mYUExtyTfLZwMmhvUjPGWikDCx6r2x+igHQN5asS8od/934a/XzmoNOA
	BiUA==
X-Gm-Message-State: AIVw110vj1Y1zVaftZcRfbiScr10H8X+CXjw043h/3oEJu8gu3My5o1G
	GLI0HROGx9wzwUNinvk=
X-Received: by 10.223.169.51 with SMTP id u48mr7507872wrc.109.1500564916553;
	Thu, 20 Jul 2017 08:35:16 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm2853628wmh.36.2017.07.20.08.35.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 08:35:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:35:01 +0100
Message-Id: <20170720153508.23113-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170720153508.23113-1-ross.burton@intel.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
Subject: [PATCH][meta-gnome 2/9] gnome-mplayer: remove (previously blacklisted)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jul 2017 15:35:16 -0000

gnome-mplayer 1.0.5 is very old (2011) and has been blacklisted for some time,
so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-apps/gnome-mplayer/gmtk_1.0.5.bb       | 18 ------------
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb           | 32 ----------------------
 2 files changed, 50 deletions(-)
 delete mode 100644 meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
 delete mode 100644 meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
deleted file mode 100644
index f6d737c81..000000000
--- a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "GTK+ widget and function libraries for gnome-mplayer"
-HOMEPAGE = "http://code.google.com/p/gmtk"
-SECTION = "libs"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-DEPENDS = "gtk+ alsa-lib glib-2.0 virtual/libx11 intltool-native pulseaudio gtk+3"
-
-SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "e06e9ca8d61d74910343bb3ef4348f7f"
-SRC_URI[sha256sum] = "a07130d62719e8c1244f8405dd97445798df5204fc0f3f2f2b669b125114b468"
-
-EXTRA_OECONF = "--disable-gconf --with-gio --with-alsa --enable-keystore"
-
-inherit gettext pkgconfig autotools gconf
-
-PNBLACKLIST[gmtk] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130661/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
deleted file mode 100644
index 629b830dd..000000000
--- a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "A GTK+ interface to MPlayer"
-HOMEPAGE = "http://code.google.com/p/gnome-mplayer"
-SECTION = "multimedia"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-PR = "r2"
-
-DEPENDS = "gmtk gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver"
-
-SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "1d3ab24c5501b5528e357931ca4dc6da"
-SRC_URI[sha256sum] = "ac3c179345baecb4ca5237782aa33e83253a87bf8b42ce6eb3a9207a340f61b2"
-
-EXTRA_OECONF = "--with-gio --with-alsa --with-dbus --with-libnotify"
-
-FILES_${PN} += "${datadir}/gnome-control-center/default-apps/${PN}.xml"
-PACKAGES =+ "${PN}-nautilus-extension"
-FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so \
-                                   ${libdir}/nautilus/extensions-3.0/*.so"
-FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la \
-                    ${libdir}/nautilus/extensions-3.0/*.la"
-FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
-                          ${libdir}/nautilus/extensions-3.0/*.a"
-FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug \
-                    ${libdir}/nautilus/extensions-3.0/.debug"
-
-inherit gettext pkgconfig mime gtk-icon-cache autotools
-
-RDEPENDS_${PN} = "mplayer"
-- 
2.11.0


