Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4976D4F5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=dEgqnLthb+6KJvzFbNjKUpIml5R8OnLGyRT515PNwqw=; 
	b=RCy5I3a6NBNl68wPPfTXIaLI1CRvENnlgIRDMet+guIjyawBrFZsz2Y7vPYfnDKb5rVuisMryoYn1UrILTt2vwKechPmqHGZT4xuI2XjPGdG3PXXWhh1j75RcdxchxI/zpLqOq/vyisB20sM0QGFD08YabPIsX1U9XADMKnESv91aA4qR2B1ipPcks89gLv6WOvZos+GsNOiJ6/GaYdE8oihTlO050Rq+fXgiHe+Ppk4xxHGVDYRrKchmjd8+kRE+kn8A1P/pQRBphxJK2qTmdAxSUKfHDlLx+JlUyehDd9grDSyyRlYsWa2naggjqtr3oF/pJbzmhhHqgnD2evCkA==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTBQB-000699-31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 20:59:23 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 20:59:12 +0100
Message-Id: <4891c85a2b9bea50776b6f90089f41f6e48d4b2c.1543694144.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1543694144.git.psaavedra@igalia.com>
References: <cover.1543694144.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v3 3/7] ibus: add ibus recipe
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
X-List-Received-Date: Sat, 01 Dec 2018 19:59:24 -0000

Intelligent Input Bus for Linux/Unix https://github.com/ibus/ibus/wiki

Collision with: https://patchwork.openembedded.org/patch/155947/

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 meta-oe/recipes-support/ibus/ibus_1.5.19.bb | 97 +++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-support/ibus/ibus_1.5.19.bb

diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
new file mode 100644
index 000000000..505cd108f
--- /dev/null
+++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
@@ -0,0 +1,97 @@
+DESCRIPTION = "A multilingual user input method library"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+SECTION = "inputmethods"
+
+SRC_URI = "https://github.com/ibus/ibus/releases/download/${PV}/${PN}-${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "a2be6f200dd9ada2501474a6877a73ef"
+SRC_URI[sha256sum] = "4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d2429"
+
+inherit autotools pkgconfig gettext gtk-immodules-cache gobject-introspection gtk-doc gtk-icon-cache gsettings
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf libnotify python3-pygobject adwaita-icon-theme librsvg"
+DEPENDS_append_class-target = " intltool-native python-pygobject-native"
+RDEPENDS_${PN} += " iso-codes adwaita-icon-theme librsvg-gtk"
+
+PACKAGECONFIG[gtk+] = ",--disable-gtk2,gtk+,gtk+"
+PACKAGECONFIG[gtk+3] = ",--disable-gtk3,gtk+3,gtk+3"
+PACKAGECONFIG[wayland] = "--enable-wayland,,wayland,wayland"
+
+PACKAGECONFIG ?= "gtk+ gtk+3"
+PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
+
+GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'ibus-gtk2.0', '', d)}"
+GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'gtk+3', 'ibus-gtk3', '', d)}"
+
+EXTRA_OECONF += " \
+    --disable-emoji-dict \
+    --disable-unicode-dict \
+"
+
+BBCLASSEXTEND = "native pythonnative"
+
+FILES_${PN} += " \
+    ${sysconfdir}/dconf/profile \
+    ${sysconfdir}/dconf/db/ibus.d/00-upstream-settings \
+    ${sysconfdir}/dconf/profile/ibus \
+    ${libdir}/libibus-1.0.so.5.0.518 \
+    ${libdir}/libibus-1.0.so.5 \
+    ${libdir}/gtk-?.?/*/immodules/im-ibus.so \
+    ${bindir}/ibus \
+    ${bindir}/ibus-setup \
+    ${bindir}/ibus-daemon \
+    ${datadir}/ibus/engine \
+    ${datadir}/ibus/component \
+    ${datadir}/ibus/setup \
+    ${datadir}/ibus/component/gtkpanel.xml \
+    ${datadir}/ibus/component/simple.xml \
+    ${datadir}/ibus/component/dconf.xml \
+    ${datadir}/ibus/setup/emojilang.py \
+    ${datadir}/ibus/setup/main.py \
+    ${datadir}/ibus/setup/enginecombobox.py \
+    ${datadir}/ibus/setup/setup.ui \
+    ${datadir}/ibus/setup/enginedialog.py \
+    ${datadir}/ibus/setup/i18n.py \
+    ${datadir}/ibus/setup/engineabout.py \
+    ${datadir}/ibus/setup/icon.py \
+    ${datadir}/ibus/setup/keyboardshortcut.py \
+    ${datadir}/ibus/setup/enginetreeview.py \
+    ${datadir}/ibus/keymaps/jp \
+    ${datadir}/ibus/keymaps/kr \
+    ${datadir}/ibus/keymaps/common \
+    ${datadir}/ibus/keymaps/modifiers \
+    ${datadir}/ibus/keymaps/us \
+    ${datadir}/ibus/keymaps/in \
+    ${datadir}/applications/ibus-setup.desktop \
+    ${datadir}/dbus-1/services/org.freedesktop.IBus.service \
+    ${datadir}/dbus-1/services/org.freedesktop.portal.IBus.service \
+    ${datadir}/vala/vapi/ibus-1.0.vapi \
+    ${datadir}/vala/vapi/ibus-1.0.deps \
+    ${libexecdir}/ibus-engine-simple \
+    ${libexecdir}/ibus-portal \
+    ${libexecdir}/ibus-dconf \
+    ${libexecdir}/ibus-x11 \
+    ${libexecdir}/ibus-ui-gtk3 \
+    ${datadir}/GConf/gsettings/ibus.convert \
+    ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.gschema.xml \
+    ${datadir}/bash-completion/* \
+    ${datadir}/icons/* \
+    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py \
+    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py? \
+"
+
+do_configure_prepend() {
+    export PYTHON=python3
+}
+
+do_install_append() {
+  # Fix the installation path of the GObject Inspection overrides for Python3
+  python_version=$(python3 -c 'import sys; print("%s.%s" % (sys.version_info.major, sys.version_info.minor))')
+  mkdir -p ${D}/usr/lib/python${python_version}/site-packages/gi/overrides
+  mv ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-packages/gi/overrides/IBus.py ${D}/usr/lib/python${python_version}/site-packages/gi/overrides/
+  rm -rf ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-packages/gi/overrides
+  find ${D} -type d -empty -delete
+}
-- 
2.11.0


