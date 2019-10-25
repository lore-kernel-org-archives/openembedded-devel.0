Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 894F37FA4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:37 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id a11so1043599wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EyQmDqfm9ejhAQtOhrKvj/DoS/NtzBW1kRCNB1xLOJE=;
	b=YFE3cDCiyWNjOpsdKuumt/VFs03gWvFcCK8izVKTv2/wryxMhXcZxD00fV76Eqtpgl
	J3kVp2UCE25+0ObHN4PJefqXBmJgjZMGF2l4TSOBRLWh35ce7tYd4tZ5970swLI9L65D
	wgMu2OHDxFSzRe5weWuoQMiwbI2JtUN2wnUai/FLJWZcdfwvHmaehsqvlCdXHVipugUY
	CZvoCAgzsxOBzZqgl67sMSyWXoqJn0rBrs02rYGQv5KVf1q02Youoi5jI/CyVTkRXNB4
	MPSdl3gNFA3OqaGA9IWjVFnEl9AmCriUejXrerBaRCGTilbObR/QaxNGA5Zz7PY3BcaH
	257g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EyQmDqfm9ejhAQtOhrKvj/DoS/NtzBW1kRCNB1xLOJE=;
	b=k2pILe+Jx6lZKQ2Ezt+o+CmsyaXFN7husYvnricC1cHXpI/umal9HMiW92lmWNhGfB
	GFFz5MsUQaJ9o5ywN6smrXQOiWcYkdq7uES5Xe5y2jZJoVesi13cOCbIXgdRGpSOwxux
	nWWQ/EBY+sBaHmJQMmIG+ukqD/rb66kmCO/f7bsLfpOWEy4a3Gj7lhCh2h19VEpzyykq
	EC4ySOjySf0eKVoDr1i3L3lQ77S6tw2nXdxKhRqOqa5xAUk1DBiC6ZkJaNMJa79uBAS9
	7XL1SRdI6VIJr2FttdWl2MZmxM3yJyZX8jF/KsffVmwiyY2ypXg+f1RzR/S5Uu5RHUOc
	34tA==
X-Gm-Message-State: APjAAAXGr7G4Ynpu/aEmadhC3R4lgRkHy4WyzJ9ji71IKAwhYI3+HLGP
	e9Zb/oE9M8or+KtOKVMRfVIotikf
X-Google-Smtp-Source: APXvYqyREXdC8mYI0RM2h4OhgIzL1tDRU9O+QJlejVBLfRc54fY/pJKVucC3Lswnto0RRHyg9e1spQ==
X-Received: by 2002:adf:e28f:: with SMTP id v15mr1407879wri.130.1571988097928; 
	Fri, 25 Oct 2019 00:21:37 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:10 +0200
Message-Id: <20191025072113.11172-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/15] ibus: initial add 1.5.21
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a depency for gnome-shell

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/ibus/ibus-native.bb       | 28 +++++++++++++
 meta-gnome/recipes-support/ibus/ibus.bb       | 33 ++++++++++++++++
 meta-gnome/recipes-support/ibus/ibus.inc      | 33 ++++++++++++++++
 ...start-dbus-we-do-not-have-dbus-lauch.patch | 39 +++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.inc
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch

diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb b/meta-gnome/recipes-support/ibus/ibus-native.bb
new file mode 100644
index 000000000..0c095f15e
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus-native.bb
@@ -0,0 +1,28 @@
+require ${BPN}.inc
+
+inherit native
+
+DEPENDS = " \
+    glib-2.0-native \
+    dbus-native \
+    iso-codes \
+"
+
+PACKAGECONFIG = ""
+
+# for allarch iso-codes
+EXTRA_NATIVE_PKGCONFIG_PATH = ":${RECIPE_SYSROOT}${datadir_native}/pkgconfig"
+
+do_compile() {
+    cd src
+    oe_runmake ibusenumtypes.h ibusenumtypes.c
+    oe_runmake unicode-parser
+}
+
+do_install() {
+    install -d ${D}/${libdir}
+    install -m 755 ${S}/src/.libs/libibus-*.so* ${D}/${libdir}
+
+    install -d ${D}/${bindir}
+    install -m 755 ${S}/src/.libs/unicode-parser ${D}/${bindir}
+}
diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes-support/ibus/ibus.bb
new file mode 100644
index 000000000..28f572ee7
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -0,0 +1,33 @@
+require ${BPN}.inc
+
+DEPENDS = " \
+    ${BPN}-native \
+    glib-2.0-native \
+    glib-2.0 \
+    dbus \
+    iso-codes \
+"
+
+inherit gtk-icon-cache bash-completion
+
+PACKAGECONFIG ??= " \
+    dconf gtk3 vala \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
+"
+
+do_configure_prepend() {
+    # run native unicode-parser
+    sed -i 's:$(builddir)/unicode-parser:unicode-parser:g' ${S}/src/Makefile.am
+}
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/GConf \
+    ${datadir}/glib-2.0 \
+    ${libdir}/gtk-3.0 \
+"
+
+FILES_${PN}-dev += " \
+    ${datadir}/gettext \
+"
+
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
new file mode 100644
index 000000000..8b98b892a
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -0,0 +1,33 @@
+SUMMARY = "Intelligent Input Bus for Linux/Unix"
+HOMEPAGE = "https://github.com/ibus/ibus/wiki"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-doc vala
+
+PV = "1.5.21"
+SRC_URI = " \
+    git://github.com/ibus/ibus.git \
+    file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
+"
+SRCREV = "ae0040c73466bb6e78fce5e669a55fcce6ffd16d"
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG[appindicator] = "--enable-appindicator,--disable-appindicator,qtbase"
+PACKAGECONFIG[dconf] = "--enable-dconf,--disable-dconf,dconf"
+PACKAGECONFIG[gtk2] = "--enable-gtk2,--disable-gtk2,gtk+"
+PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
+PACKAGECONFIG[wayland]  = "--enable-wayland,--disable-wayland,wayland"
+PACKAGECONFIG[vala]  = "--enable-vala,--disable-vala"
+PACKAGECONFIG[x11]  = "--enable-xim --enable-ui,--disable-xim --disable-ui,virtual/libx11"
+
+EXTRA_OECONF = " \
+    --disable-tests \
+    --disable-emoji-dict \
+    --disable-python2 \
+"
+
+do_configure_prepend() {
+    touch ${S}/ChangeLog
+    touch ${S}/ABOUT-NLS
+}
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
new file mode 100644
index 000000000..3701d19f5
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
@@ -0,0 +1,39 @@
+From f567bcbc2108d722faa90afeb03d3a3bcdf5f58b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 10 May 2019 14:30:08 +0200
+Subject: [PATCH] Do not try to start dbus - we do not have dbus-lauch
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ data/dconf/make-dconf-override-db.sh | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-dconf-override-db.sh
+index 9c650e97..02fbf059 100755
+--- a/data/dconf/make-dconf-override-db.sh
++++ b/data/dconf/make-dconf-override-db.sh
+@@ -12,10 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
+ export GSETTINGS_SCHEMA_DIR="$TMPDIR/schemas"
+ mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR
+ 
+-eval `dbus-launch --sh-syntax`
+-
+-trap 'rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID' ERR
+-
+ # in case that schema is not installed on the system
+ glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
+ 
+@@ -46,5 +42,3 @@ for schema in $schemas; do
+ done
+ 
+ rm -rf $TMPDIR
+-
+-kill $DBUS_SESSION_BUS_PID
+-- 
+2.20.1
+
-- 
2.21.0


