Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 15C8E7FC59
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 23:26:34 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id v3so9664771wmh.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 16:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LggVIcbF/Nem1yvn6OMOE8GrWgxHUnHmiUH6fbXNg98=;
	b=t1/cjmu/bthTyeEJOQ382V9qpBG6J75Lnlulei0Ci0NdXAUEZgSbkflef9456JIHeK
	4wat9F3iDwtF72cXQnAnQUg3OFzfJRGWv4GX8BaHvQX9aLW/b5bnPzw7hFUPgzR/pIq5
	L8iIkmMYSUA5FMr+vf3wphdHBIbtWQCIW7p+FUUO/egnMQc4KRcpvHpDw7228sGpPRgB
	t9ElPc6tfOVTqwx2RwlOO1rDIIEoCWgfGpmjeJy5xBvacNUPzVGwZI/FZJlGF+OLJHdu
	1nP1UhrB3hzR2jbqF7h1IgK7R3eJ0wcpJr6V1Cf62FrOwC5wDOu3nNSVxP46LJv0XcBs
	nwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LggVIcbF/Nem1yvn6OMOE8GrWgxHUnHmiUH6fbXNg98=;
	b=SNG7/ygHF0OKBtftopPR2dbec0eu4d+R51Gv03X2DVEuF4WXjAT2GmWWLqDRhPEOiR
	8o/MnyGI3jD/ql+fKuqUtSnJmH3iPopOfXc/lyP/x/I78/RXfOL8HkYcZN/UmYoT8X7A
	nknQX7EfFdQ4qspM3XsRbbhszG+dpfuArNzkmSjGn6DBKDotKXa9bPKE3Lefhgld/g8z
	EjY8lFBGNie7JSvI6Hhy13WJqLS2s7WkdGtPXpZOOnGk+z5qVUGyXeaewmGoayqB26WJ
	5mlovt+5jmdyhiyyxtGy//iaxeW2fweYOvBFcamoPQmaRw2MD3WliRpuqSuffEmlaXAg
	qmqQ==
X-Gm-Message-State: APjAAAV86SiYW/WMuMXBTjSddX9PorKIWrOltfDe2WwoNQ0VaQ2GVuQa
	ZiBP4dlZV022Y4Wpj+RuVIdrK901
X-Google-Smtp-Source: APXvYqyJoA6HnMsk//AeJM3ctdmCqwNgZeWzfRPjq6hbZsiNeHc7ncHpXG4AgcfPsb0r+AUwMoIzCg==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr13207310wma.161.1572650795435; 
	Fri, 01 Nov 2019 16:26:35 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E4B5123CFE8DCB8A4D5FC.dip0.t-ipconnect.de.
	[2003:f0:7f0e:4b51:23cf:e8dc:b8a4:d5fc])
	by smtp.gmail.com with ESMTPSA id m9sm9149926wro.66.2019.11.01.16.26.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 16:26:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Nov 2019 00:26:21 +0100
Message-Id: <20191101232621.8761-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v4] ibus: initial add 1.5.21
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
X-List-Received-Date: Fri, 01 Nov 2019 23:26:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a depency for gnome-shell

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
v1 -> v2: went out too early with breaking configure option
v2 -> v3: avoid using build host's unicode-ucd / slightly rework PACKAGECONFIG
          defaults
v2 -> v4: native: avoid race-conditions

 .../recipes-support/ibus/ibus-native.bb       | 34 ++++++++++++++++
 meta-gnome/recipes-support/ibus/ibus.bb       | 37 ++++++++++++++++++
 meta-gnome/recipes-support/ibus/ibus.inc      | 36 +++++++++++++++++
 ...start-dbus-we-do-not-have-dbus-lauch.patch | 39 +++++++++++++++++++
 4 files changed, 146 insertions(+)
 create mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.inc
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch

diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb b/meta-gnome/recipes-support/ibus/ibus-native.bb
new file mode 100644
index 000000000..ca65114c4
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus-native.bb
@@ -0,0 +1,34 @@
+require ${BPN}.inc
+
+inherit native
+
+DEPENDS += " \
+    glib-2.0-native \
+    dbus-native \
+    iso-codes \
+"
+
+PACKAGECONFIG = ""
+
+# for allarch iso-codes
+EXTRA_NATIVE_PKGCONFIG_PATH = ":${RECIPE_SYSROOT}${datadir_native}/pkgconfig"
+# for allarch unicode-ucd - just to make configure happy
+EXTRA_OECONF += "--with-ucd-dir=${RECIPE_SYSROOT}${datadir_native}/unicode/ucd"
+
+do_compile() {
+    cd src
+    # seems by moving to src we break dependency tracking so build what's
+    # necessary step by step
+    oe_runmake ibusenumtypes.h
+    oe_runmake ibusmarshalers.h
+    oe_runmake ibusenumtypes.c
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
index 000000000..caec455b6
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -0,0 +1,37 @@
+require ${BPN}.inc
+
+DEPENDS += " \
+    ${BPN}-native \
+    glib-2.0-native \
+    glib-2.0 \
+    dbus \
+    iso-codes \
+"
+
+inherit gtk-icon-cache bash-completion
+
+# for unicode-ucd
+EXTRA_OECONF += "--with-ucd-dir=${STAGING_DATADIR}/unicode/ucd"
+
+PACKAGECONFIG ??= " \
+    dconf vala \
+    ${@bb.utils.contains_any('DISTRO_FEATURES', [ 'wayland', 'x11' ], 'gtk3', '', d)} \
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
index 000000000..0f4ae7d04
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -0,0 +1,36 @@
+SUMMARY = "Intelligent Input Bus for Linux/Unix"
+HOMEPAGE = "https://github.com/ibus/ibus/wiki"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-doc vala
+
+PV = "1.5.21"
+
+DEPENDS = "unicode-ucd"
+
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


