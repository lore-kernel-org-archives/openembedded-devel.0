Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 37FA97E42D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m3so4884316wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=krPE9YmC3luRX8dcRihQqVYuZ5waXmLgMZ8psrE+W5A=;
	b=U2kjMX+G4vLm3yBDQ5oK1pFj1ShSfVmCsyhQj+tDinvscrhh9Exs/5MFn/C9omQYc0
	cscpFT1cbsuXItatNFTt1jp6OcLoIGZnHR3J9H1k5MDJxb/NjYFrfTuCWBkOBZvSHgCQ
	3Z+uKHwPcrWI6U3+t1oXLeB2qzwBvMPWe5mCMF2aHm37fr+Sljt8We/JXzi+AG66k82P
	JN8yTkUKxTD+BYDoUCds1mDwfibXvENyspjU3kfSB671Q/YuDxECtJDXWRGdfUsg4+vr
	aRARP4V1dSnw9MGpHsP9Vrypp7hlavU9i0k+Cfv6BLZWonkdTM4nVbnvE7nidwjJwTCp
	RCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=krPE9YmC3luRX8dcRihQqVYuZ5waXmLgMZ8psrE+W5A=;
	b=exEbL1oe1uNkq5f8G1KW3BqrGrN+zuHOg/nFLXeokKg4B2Hcswuh6xrcUc/Guj14s3
	JajOkxv78gKcY2AZ/LcwnE9rHADgi96VyGFYpB1Pn/qZN1D/b5NvZqF2vNzso4uofwG3
	lspgh9QveTV3X0mpyuztMN1d51SSk+mBdRrdG1M21iLFci1fair1VdWbdcAitsDJrskj
	DyUHIExL6CPQF7/mOqox7Zmr493Xi1xYIOilla6KGHRjaZafOFnpHmyBye4VPtHAV9p4
	NfTmLDZQAkCYCcgE2DM98SVVrZGS5qNa14KuP3DnzIUiLDaZbMvLXNgrK1Ss2iTNVvi5
	lJRg==
X-Gm-Message-State: APjAAAXZiqzBp2FbFO0lic6tmM+M7zM8dX+usZVQpCFPAxP603I6LrBk
	G96Q2Aelc6BhoHDuZm31IQACWgH5KPc=
X-Google-Smtp-Source: APXvYqyNdPPsHwr7KA+ZJeGSGjfZb/jYqqoO9Ci3vD9T1RtzZkG6QrOLSthOVoReyS2tFjcxN+FzIw==
X-Received: by 2002:adf:9794:: with SMTP id s20mr45161392wrb.104.1558594169661;
	Wed, 22 May 2019 23:49:29 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:43 +0200
Message-Id: <20190523064859.24336-26-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 25/41] ibus: initial add 1.5.20
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
X-List-Received-Date: Thu, 23 May 2019 06:49:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a depency for gnome-shell

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/ibus/ibus-native.bb       | 28 +++++++++++++
 meta-gnome/recipes-support/ibus/ibus.bb       | 28 +++++++++++++
 meta-gnome/recipes-support/ibus/ibus.inc      | 33 ++++++++++++++++
 ...start-dbus-we-do-not-have-dbus-lauch.patch | 39 +++++++++++++++++++
 4 files changed, 128 insertions(+)
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
index 000000000..abcc13af2
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -0,0 +1,28 @@
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
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
new file mode 100644
index 000000000..3bc38a58b
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
+PV = "1.5.20"
+SRC_URI = " \
+    git://github.com/ibus/ibus.git \
+    file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
+"
+SRCREV = "407756521617f8514b65ddfa35512183fd22d38d"
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
2.20.1


