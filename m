Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 77AAA6C660
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=FWFCrzC2tgo23rey8J1wbBej2GqpMw4cg/PQiDhT+x0=; 
	b=i7B6mO63/Q2AhhTSJ0D0a+p3twWowjnn071bPjSXUCYsqu4E/ZxjTLTjGuL5IwufRx+UTfvcouzFil6pNfMpgRCGTjD3PDzBA1W7znLF2huOLWGWkNSPrN6tfMiBdbfXUig3lw9Ub8W2dxAvU2g6P7rjFO1JE3WvVwLh3h7hC7Cp4VhCWEZpfJkW2g00M78EqUzXzIbyS/KvO+YhVc2U5l9r0R4l7CfKj/0KdQgnOhl0B05XX4HXzjOdKAQqdujE2M+aoCPd+a/CJE6doFTLUDHnQ425wX+ClTsTvHyM2FCR6x5e4Kump2PvyZdWsBluB5U2myceWOGLbj7BC9jDoQ==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTnb5-0007Lt-UH
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 13:45:11 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2018 13:45:06 +0100
Message-Id: <8b31d1e2ae4c91f272c1793e287e79a5f9deac4b.1543840903.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1543840903.git.psaavedra@igalia.com>
References: <cover.1543840903.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v4 4/7] ibus-anthy: add ibus-anthy recipe
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
X-List-Received-Date: Mon, 03 Dec 2018 12:45:13 -0000

It is a Japanese input engine for IBus.

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 .../ibus/ibus-anthy/fix_anthy_include_in_gir.patch | 19 +++++++++++
 meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb  | 37 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
 create mode 100644 meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb

diff --git a/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch b/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
new file mode 100644
index 000000000..9812be08f
--- /dev/null
+++ b/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
@@ -0,0 +1,19 @@
+Index: ibus-anthy-1.5.10/gir/Makefile.am
+===================================================================
+--- ibus-anthy-1.5.10.orig/gir/Makefile.am
++++ ibus-anthy-1.5.10/gir/Makefile.am
+@@ -68,12 +68,12 @@ Anthy_9000_gir_SCANNERFLAGS = \
+ 	--warn-all \
+ 	$(NULL)
+ Anthy_9000_gir_INCLUDES = GObject-2.0
+-Anthy_9000_gir_LIBS = $(libanthygobject) anthy
++Anthy_9000_gir_LIBS = $(libanthygobject)
+ Anthy_9000_gir_CFLAGS = @ANTHY_CFLAGS@
+ Anthy_9000_gir_FILES = \
+ 	$(libanthygobject_1_0_la_SOURCES) \
+ 	$(anthyinclude_HEADERS) \
+-	$(ANTHY_INCLUDEDIR)/anthy/anthy.h \
++	$(STAGING_DIR_HOST)$(ANTHY_INCLUDEDIR)/anthy/anthy.h \
+ 	$(NULL)
+ INTROSPECTION_GIRS += Anthy-9000.gir
+ 
diff --git a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
new file mode 100644
index 000000000..d42f87ae5
--- /dev/null
+++ b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "It is a Japanese input engine for IBus."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+SECTION = "inputmethods"
+
+SRC_URI = "https://github.com/ibus/${PN}/releases/download/${PV}/${PN}-${PV}.tar.gz \
+    file://fix_anthy_include_in_gir.patch \
+"
+SRC_URI[md5sum] = "d7c2c410619edacfbaca6a9d02ed8982"
+SRC_URI[sha256sum] = "cc33e0d1afe7e4a1f0a092d2a4575269ac21373771e49579c434afb4eef9f84a"
+
+# Needed to find the Anthy included headers (anthy/anthy.h)
+export STAGING_DIR_HOST
+
+inherit autotools pkgconfig gettext gobject-introspection gtk-immodules-cache gtk-icon-cache gsettings qemu
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS = " anthy ibus gobject-introspection adwaita-icon-theme"
+RDEPENDS_${PN} += " ibus takao-fonts anthy libanthy0"
+
+DEPENDS_append_class-target = " intltool-native qemu-native"
+
+do_configure_prepend() {
+    export PYTHON=python2
+}
+
+
+FILES_${PN} += " \
+    ${datadir}/icons/* \
+    ${datadir}/ibus \
+    ${datadir}/appdata \
+    ${datadir}/ibus/component/anthy.xml \
+    ${datadir}/appdata/ibus-anthy.appdata.xml \
+    ${datadir}/gir-1.0/Anthy-9000.gir \
+    ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.engine.anthy.gschema.xml \
+"
-- 
2.11.0


