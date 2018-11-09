Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD6D6C1ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2018 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=feuinU4EAiaUooH2FdsNxF6jO2klc+SyISEEPZkL2T4=; 
	b=NjuKHraZS2qZBMHBobWspDa6uN05dD0h8PFFnj7ZaUO7FhV9vI58TzoNyAsYS87Lr8dqscOTZbPMenb5TCZJo8NX70V5x3lTeDp80hg5C9uVxVImmYFHREQjrDxom4yQNMTcfwFt1wdTbQDrF3prvumF4cDz3JSrVYyHepmsn3rfXX4IZ5ZjqF1zXsRZOygsbRjNf1Loe07YlW0qB28fYyKlfsiaPRCdEO1L7My68YsvQiLdF9GNnhMmoWBMU7wN2nUBPxUWTqR4y4+/oYj7/rwrrkCLTJFFmvQYgyeuLyE0EPetAT5TxVeAr12wN76352IKK+8wvQTPbZus4SsnfA==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gL6NN-0003YN-Mz
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Nov 2018 13:59:05 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Nov 2018 13:58:55 +0100
Message-Id: <564f4bb982369066abe1f4f14a59e48ab9f4efc5.1541767729.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1541767729.git.psaavedra@igalia.com>
References: <cover.1541767729.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH 3/6] ibus-anthy: add ibus-anthy recipe
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
X-List-Received-Date: Fri, 09 Nov 2018 13:14:40 -0000

It is a Japanese input engine for IBus.
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
index 000000000..579773d38
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
+DEPENDS = " anthy ibus gobject-introspection python-pygobject adwaita-icon-theme"
+RDEPENDS_${PN} += " ibus takao-fonts anthy libanthy0"
+
+DEPENDS_append_class-target = " intltool-native python-pygobject-native qemu-native"
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


