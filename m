Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id C00B672664
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:58 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id z10so14641416pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=A+UWuB5a2E2b89/s9E4lYgRiPq78YSLJYjU8MVnIeUI=;
	b=x6hmQqVtKwnvizXMBemcHHaynirh6NBWbSplSrwnijU+K3NcjMfC73DUyDBN2/COlW
	aZAEdy7++4xOLLvSN6rwlundiXB5wCiOgcDIVnFAFvXGaYaUtNrzdqLGcO/PQ5ujsQEA
	BgpiHEhpfIcamkhbWQbCx+3juTQMVeUynZuDOh6Xufh0Tuw4OChTFwIwm9ON8B9v3w8d
	nn1pRRl3T9St8R/aO6Bzk8UnK5JV7uvk6KWSeDXKCLFta5v9Qmi1UwBznMSfpcn6Ox5j
	3aw4XasSiZje/ATEP8r97mEclF8dfaIQsyRG4/88jLO8qIRLNbjIRO3P6W3AQeKxvGPf
	/H0w==
X-Received: by 10.70.128.80 with SMTP id nm16mr77395627pdb.1.1419700979761;
	Sat, 27 Dec 2014 09:22:59 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:11 -0800
Message-Id: <4bf3c443a56749f332913d3435f1850ab8207a8e.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 24/27] PNBLACKLIST: use weak assignments
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:58 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* this makes it easier to unblacklist it from local.conf which
  is parsed before the recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb               | 2 +-
 meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb            | 2 +-
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb                               | 2 +-
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb             | 2 +-
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb              | 2 +-
 meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb                 | 2 +-
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb                        | 2 +-
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb                    | 2 +-
 meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb         | 2 +-
 .../recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb            | 2 +-
 meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb     | 2 +-
 meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb | 2 +-
 meta-oe/recipes-connectivity/soft66/soft66_git.bb                       | 2 +-
 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb               | 2 +-
 meta-oe/recipes-extended/subsurface/subsurface_git.bb                   | 2 +-
 meta-oe/recipes-extended/zsh/zsh.inc                                    | 2 +-
 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb                   | 2 +-
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb                             | 2 +-
 meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb             | 2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb                      | 2 +-
 meta-oe/recipes-navigation/omgps/omgps_svn.bb                           | 2 +-
 meta-oe/recipes-qt/qconnman/qconnman-e_git.bb                           | 2 +-
 meta-oe/recipes-qt/qconnman/qconnman_git.bb                             | 2 +-
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb                       | 2 +-
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb                      | 2 +-
 meta-oe/recipes-support/emacs/emacs_23.4.bb                             | 2 +-
 meta-oe/recipes-support/maliit/maliit-framework_git.bb                  | 2 +-
 meta-oe/recipes-support/maliit/maliit-plugins_git.bb                    | 2 +-
 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb                    | 2 +-
 meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb              | 2 +-
 meta-webserver/recipes-php/modphp/modphp5.inc                           | 2 +-
 meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb                       | 2 +-
 32 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
index 9a26642..42f4c87 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 HOMEPAGE ="http://www.libimobiledevice.org/"
 
-PNBLACKLIST[ifuse] = "depends on blacklisted libimobiledevice"
+PNBLACKLIST[ifuse] ?= "depends on blacklisted libimobiledevice"
 DEPENDS = "fuse libimobiledevice"
 
 SRC_URI = " \
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
index c5ac6e2..ef460f1 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PNBLACKLIST[gnome-mplayer] = "rdepends on blacklisted mplayer"
+PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
 PR = "r2"
 
 DEPENDS = "gmtk gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver"
diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
index 1a70ac0..e9a837b 100644
--- a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
+++ b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt"
 
-PNBLACKLIST[gcr] = "CONFLICT: 4 files conflict with gnome-keyring"
+PNBLACKLIST[gcr] ?= "CONFLICT: 4 files conflict with gnome-keyring"
 # e.g. sysroots/qemux86-64/usr/share/glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
 #      sysroots/qemux86-64/usr/share/GConf/gsettings/org.gnome.crypto.pgp.convert
 
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
index 38ea5e5..611499a 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PNBLACKLIST[gnome-menus3] = "CONFLICT: 24 files are conflicting with gnome-menus"
+PNBLACKLIST[gnome-menus3] ?= "CONFLICT: 24 files are conflicting with gnome-menus"
 # e.g. sysroots/qemux86-64/usr/share/desktop-directories/X-GNOME-Other.directory
 
 DEPENDS = "python libxml2 gconf popt gtk+3"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index f89f3da..972a4d4 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
 BPN = "gnome-panel"
 PR = "r1"
 
-PNBLACKLIST[gnome-panel3] = "CONFLICT: depends on libgweather3 which conflicts with libgweather"
+PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
 
 # conflicts with gnome-panel, because they provide the same package
 # http://patches.openembedded.org/patch/43105/
diff --git a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb b/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
index 69cdd8f..6e1997f 100644
--- a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SECTION = "x11/gnome/libs"
 DEPENDS = "libxml2 gconf libsoup-2.4 gtk+3"
 
-PNBLACKLIST[libgweather3] = "CONFLICT: 876 files are conflicting with libgweather"
+PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather"
 # e.g. sysroots/qemux86-64/usr/share/libgweather/locations.dtd
 #      sysroots/qemux86-64/usr/share/libgweather/Locations.zh_TW.xml
 
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
index 3ea179e..4e01c5c 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 PR = "r2"
 
-PNBLACKLIST[zenity] = "BROKEN: doesn't build with B!=S"
+PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
 
 DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils"
 
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 4b65152..17db7b5 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2d
 SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
 
 # multiple issues
-PNBLACKLIST[xbmc] = "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
+PNBLACKLIST[xbmc] ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
 
 PV = "11.0+gitr${SRCPV}"
 PR = "r14"
diff --git a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
index 81e218f..a9f52ca 100755
--- a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "gtk+ libgnomeui libraw1394 libdc1394 libxv tiff"
 
-PNBLACKLIST[coriander] = "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
+PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/coriander-2/${PV}/${BP}.tar.gz \
            file://cross-compile.patch \
diff --git a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
index f82eae0..68d59fa 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://src/renderer-service-upnp.c;beginline=1;endline=21;md5=c25c3082684eb4ca87474b7528c6dc15"
 
-PNBLACKLIST[renderer-service-upnp] = "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
+PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
 
 DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
 
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
index e2551e1..ded6d08 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae
 #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symbol sctp_connectx has undefined version
 #| collect2: error: ld returned 1 exit status
 #| make[4]: *** [libsctp.la] Error 1
-PNBLACKLIST[lksctp-tools] = "BROKEN: fails to link against sctp_connectx symbol"
+PNBLACKLIST[lksctp-tools] ?= "BROKEN: fails to link against sctp_connectx symbol"
 
 S = "${WORKDIR}/${BP}"
 
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
index 9f2cc49..5256ce0 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "\
 #| configure:17888: checking for native large file support
 #| configure:17891: error: in `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4':
 #| configure:17893: error: cannot run test program while cross compiling
-PNBLACKLIST[libimobiledevice] = "cannot run test program while cross compiling"
+PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross compiling"
 
 HOMEPAGE ="http://www.libimobiledevice.org/"
 
diff --git a/meta-oe/recipes-connectivity/soft66/soft66_git.bb b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
index 050bf98..33ca2b5 100644
--- a/meta-oe/recipes-connectivity/soft66/soft66_git.bb
+++ b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv3 LGPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 "
 
-PNBLACKLIST[soft66] = "BROKEN: depends on broken libftdi"
+PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
 
 DEPENDS = "libftdi"
 
diff --git a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
index e39aa18..2b6f56e 100644
--- a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
+++ b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "989e51194c6adadbd156da3288e37bad847b93b3b876502e83033b7049
 #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note: virtual int Db::set_bt_compare(int (*)(Db*, const Dbt*, const Dbt*, size_t*)) <near match>
 #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note:   no known conversion for argument 1 from 'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, const __db_dbt*)}' to 'int (*)(Db*, const Dbt*, const Dbt*, size_t*) {aka int (*)(Db*, const Dbt*, const Dbt*, long unsigned int*)}'
 #| make[3]: *** [MapDb.o] Error 1
-PNBLACKLIST[zeroc-ice] = "BROKEN: not compatible with default db version"
+PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
 
 S = "${WORKDIR}/Ice-${PV}"
 
diff --git a/meta-oe/recipes-extended/subsurface/subsurface_git.bb b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
index 1edb19e..22b9d2f 100644
--- a/meta-oe/recipes-extended/subsurface/subsurface_git.bb
+++ b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libdivecomputer gtk+ libxml2 glib-2.0 gconf"
 
-PNBLACKLIST[subsurface] = "Needs to be upgraded for compatibility with new libdivecomputer"
+PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
 
 inherit gtk-icon-cache cmake
 
diff --git a/meta-oe/recipes-extended/zsh/zsh.inc b/meta-oe/recipes-extended/zsh/zsh.inc
index 86a546e..6dc40bf 100644
--- a/meta-oe/recipes-extended/zsh/zsh.inc
+++ b/meta-oe/recipes-extended/zsh/zsh.inc
@@ -8,7 +8,7 @@ SECTION = "base/shell"
 LICENSE = "zsh"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b7bc853894664be455a922db9805288e"
 
-PNBLACKLIST[zsh] = "BROKEN: doesn't build with B!=S (gnu-configize executed in ${B})"
+PNBLACKLIST[zsh] ?= "BROKEN: doesn't build with B!=S (gnu-configize executed in ${B})"
 
 DEPENDS = "ncurses bison-native"
 
diff --git a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
index b19110a..194d104 100644
--- a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6
 # 0.12.1+gitAUTOINC+de5452e56b-r1/git/clutter-box2d/clutter-box2d.h:226:47:
 #  fatal error: clutter-box2d/clutter-box2d-child.h: No such file or directory
 # |  #include <clutter-box2d/clutter-box2d-child.h>
-PNBLACKLIST[clutter-box2d] = "BROKEN: doesn't build with B!=S"
+PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
 
 SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
 PV = "0.12.1+git${SRCPV}"
diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
index 1d4e331..90ac702 100644
--- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
+++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.autistici.org/dezperado/fim/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fa01bff138cc98a62b8840a157951c88"
 
-PNBLACKLIST[fim] = "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
+PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
 
 # flex with provide /usr/include/FlexLexer.h
 DEPENDS = "flex-native bison-native flex"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
index a1943be..547ec86 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
 DEPENDS += "pixman"
 
-PNBLACKLIST[xf86-input-mtev] = "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
+PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
 
 SRC_URI = "git://gitorious.org/xorg/xf86-input-mtev.git file://fix-it.patch"
 SRCREV = "1eb469166ffc095c5801475f057f911f97a6e641"
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 65fab1f..aa6c011 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -13,7 +13,7 @@ RCONFLICTS_${PN} = "mplayer"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
-PNBLACKLIST[mplayer2] = "Requires newer libav which has negative D_P"
+PNBLACKLIST[mplayer2] ?= "Requires newer libav which has negative D_P"
 
 SRC_URI = "git://repo.or.cz/mplayer.git \
     file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index 2304b36..aabdd43 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -9,7 +9,7 @@ PV = "0.1+svnr${SRCPV}"
 PR = "r2"
 S = "${WORKDIR}/${PN}"
 
-PNBLACKLIST[omgps] = "BROKEN: sound.c:61:35: error: 'saveptr' may be used uninitialized in this function [-Werror=maybe-uninitialized]"
+PNBLACKLIST[omgps] ?= "BROKEN: sound.c:61:35: error: 'saveptr' may be used uninitialized in this function [-Werror=maybe-uninitialized]"
 
 do_configure_prepend() {
     sed -i "s#PY_VERSION = 2.6#PY_VERSION = ${PYTHON_BASEVERSION}#g" ${S}/Makefile.am
diff --git a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
index baf8027..e307a72 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
+++ b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
@@ -4,7 +4,7 @@ RCONFLICTS_${PN} = "qconnman"
 
 inherit qt4e
 
-PNBLACKLIST[qconnman-e] = "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
+PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
 
 EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
diff --git a/meta-oe/recipes-qt/qconnman/qconnman_git.bb b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
index e2bd2ed..2f8cca2 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman_git.bb
+++ b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
@@ -4,7 +4,7 @@ RCONFLICTS_${PN} = "qconnman-e"
 
 inherit qt4x11
 
-PNBLACKLIST[qconnman] = "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
+PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
 
 EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
index 214ca58..1b010a5 100644
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
 
 PR = "r2"
 
-PNBLACKLIST[sylpheed] = "BROKEN: Doesn't work with B!=S"
+PNBLACKLIST[sylpheed] ?= "BROKEN: Doesn't work with B!=S"
 
 SRC_URI = "http://sylpheed.sraoss.jp/sylpheed/v2.7/sylpheed-${PV}.tar.bz2 \
     file://glib-2.32.patch \
diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
index 4cd3f77..18979d5 100644
--- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
+++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://garr.dl.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3
 SRC_URI[md5sum] = "5928822d855c5cf7ac29655e3e0b8c23"
 SRC_URI[sha256sum] = "0707b5ec9916fbde9e44eb8d18037c8d8f75dfd6aeef51aba5487e189eef2032"
 
-PNBLACKLIST[apcupsd] = "BROKEN: doesn't build with B!=S"
+PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
index 3db5da6..a324828 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -2,7 +2,7 @@ require emacs.inc
 
 PR = "r4"
 
-PNBLACKLIST[emacs] = "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
+PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
 
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
            file://use-qemu.patch \
diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index f387ce2..3eb7f30 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
 inherit autotools qt4x11 gtk-immodules-cache
 
-PNBLACKLIST[maliit-framework] = "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
+PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
 
 DEPENDS = "libxcomposite dbus gtk+3 gtk+"
 
diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
index 0fa8ac2..3c040d8 100644
--- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
 
 inherit autotools qt4x11
 
-PNBLACKLIST[maliit-plugins] = "BROKEN: depends on broken maliit-framework"
+PNBLACKLIST[maliit-plugins] ?= "BROKEN: depends on broken maliit-framework"
 
 DEPENDS = "maliit-framework"
 
diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index ac4d188..2baeda0 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
 
 PR = "r3"
 
-PNBLACKLIST[openmotif] = "BROKEN: doesn't build with B!=S"
+PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
 
 SRC_URI = "http://motif.ics.com/sites/default/files/openmotif-2.3.3.tar.gz \
            file://configure.patch;patch=1"
diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 78af9b6..07ff318 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -8,7 +8,7 @@ PV = "1.3+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
-PNBLACKLIST[vala-terminal] = "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
+PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
 
 inherit autotools perlnative vala
 
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index dcafa4f..f60c7bb 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
 
 inherit autotools pkgconfig
 
-PNBLACKLIST[modphp] = "CONFLICT: 466 header files conflict with php"
+PNBLACKLIST[modphp] ?= "CONFLICT: 466 header files conflict with php"
 # e.g. sysroots/qemux86-64/usr/include/php/main/win95nt.h
 
 CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
index 750b288..66aff5e 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34df3a274aa12b795417c65634c07f16"
 
 DEPENDS = "modphp"
 
-PNBLACKLIST[xdebug] = "CONFLICT: depends on blocked modphp"
+PNBLACKLIST[xdebug] ?= "CONFLICT: depends on blocked modphp"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-- 
1.9.1


