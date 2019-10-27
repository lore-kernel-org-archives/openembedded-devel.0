Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7107FAAC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p21so7560018wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MsBaOpBTV5s6HO1SVDnSGvBL9MoAmhcolZkKu2IIJlE=;
	b=GijIyWXrO3Ljq9yV73FK3EqJly81OHp1WKVIZi28EdQEO+Aq0CMAbIFt9idvB7h6f4
	TFKPiR0P+t5JhkARIdJOEdBr/DyG+qDrS+vyxVLagFkWIfFINq2niBxP2A3Md5Mp0m5r
	u+8jfWnQ+Vb8xelQeUbZPksywXVmXmxUN82rB/BJwlYYvxyOv5NCTPIKdP5eWIsp0GPj
	VW3p/geFRpJ5qD50NOrW3VqwxYPbWByP0jcC7f+BmDVA12+F6BoQlyO1gyTeU3n8IPOe
	uqLxZB06l9uJR4jbINH5BOqodN/aavkyKk6wfyCHCLodloZJ4KCgnkJo2t7v2ym23BmA
	SG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MsBaOpBTV5s6HO1SVDnSGvBL9MoAmhcolZkKu2IIJlE=;
	b=Zf3kpAcPckTFn7O7VUI9xNDr3vpWkIQ6JiOeRAQNBGsXoewh06IcqD6x82LCAOMmJU
	m/pk/L4Ph7uWTdu8BnK4uexExfSjdJJQGeE3sHUVw3wQFifjNdueUWpySSNwOtlyywQU
	cFQBLMtL4RieRwLmFqNyoQu1iI2gsQAhqnb6PqhmYLa5NDouqYesHQbS3A4C5sh/BHA5
	elz6U+dpAzfD6/6y6+umcuxrewdeTG+yhuwr5xmGNeytOhu4YHEzOWOltxYq61GiHDdC
	g2Ps51sNG6pCrEfIz7RrIJxy9Xl6M0q9amv+tK8gG7bxwRJfWsSio2M8Rc0wC00JaTlW
	NnxQ==
X-Gm-Message-State: APjAAAXE5wvuyp7zJrepAleMo7yMRwFfyHx9nGY5wNlf8r3KEyiaV2wa
	BzO2B6p82zj/qDZAYj8XJvB0WSfQ
X-Google-Smtp-Source: APXvYqzkLJyfxr5d7vOZxUuM/TtYJag3qnPZG8A95EreN9woQ9VJnuEWGfGXxmGVlWMWZnHd1ub1+w==
X-Received: by 2002:a1c:1f14:: with SMTP id f20mr12123454wmf.147.1572219377659;
	Sun, 27 Oct 2019 16:36:17 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:45 +0100
Message-Id: <20191027233545.4146-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/19] ibus: initial add 1.5.21
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a depency for gnome-shell

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/ibus/ibus-native.bb       | 31 +++++++++++++++
 meta-gnome/recipes-support/ibus/ibus.bb       | 33 ++++++++++++++++
 meta-gnome/recipes-support/ibus/ibus.inc      | 33 ++++++++++++++++
 ...start-dbus-we-do-not-have-dbus-lauch.patch | 39 +++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.inc
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch

diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb b/meta-gnome/recipes-support/ibus/ibus-native.bb
new file mode 100644
index 000000000..c80048044
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus-native.bb
@@ -0,0 +1,31 @@
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
+EXTRA_OECONF += " \
+    --disable-unicode-dict \
+"
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
index 000000000..fc598ef9f
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
+EXTRA_OECONF += " \
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


