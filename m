Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD287F1BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=HnTtmT4CzVwSPdiLvB8at3u6KcQ3va+9rn3rLOR6GMw=; 
	b=lbf2R/aev4+erwfTSeo6Xw8McbN6JDpdtlJrtMv4YVpOv+F0VkUkONRw+lBrYGLQAMObXiRaeV7UDGvQnhnBO1XQ45rH32NdeiKMUEXIWEaPgZ8XaMpkxxqHfCLpCDoE69aaqcWPL9MJPdLKHxCCg4wstZfgg13SfLgXuy51xcqlLdzGEPR0iB0x4dCZSpYNhwazQpEqUhkLxqqL3W7JBYmIKehV6Kr3fgLJf+jO9C5WfoI+EmunVshRaJm9S8kvrQGfjQDHAwhPM2R52nRSmGfxEQELdBY2GtkcrUMy6rCb37wLrrmELCGzqpy2FZzBkPx/POWW9GINa2L+gm7giw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1hqIbu-0003aA-E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 16:51:18 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2019 16:51:00 +0200
Message-Id: <20190724145100.88293-7-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190724145100.88293-1-psaavedra@igalia.com>
References: <20190724145100.88293-1-psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v5 7/7] ibus: Bumping up to 1.5.20
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
X-List-Received-Date: Wed, 24 Jul 2019 14:59:14 -0000

---
 .../ibus/ibus-anthy/fix_anthy_include_in_gir.patch |  4 ++--
 .../{ibus-anthy_1.5.10.bb => ibus-anthy_1.5.11.bb} |  8 ++++++--
 .../0004-skip-ibus-table-createdb.patch            | 22 ++++++++++++++++++++++
 .../ibus/{ibus_1.5.19.bb => ibus_1.5.20.bb}        |  4 ++--
 4 files changed, 32 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/ibus/{ibus-anthy_1.5.10.bb => ibus-anthy_1.5.11.bb} (78%)
 create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese/0004-skip-ibus-table-createdb.patch
 rename meta-oe/recipes-support/ibus/{ibus_1.5.19.bb => ibus_1.5.20.bb} (96%)

diff --git a/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch b/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
index 9812be08f..0066d285c 100644
--- a/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
+++ b/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
@@ -2,11 +2,11 @@ Index: ibus-anthy-1.5.10/gir/Makefile.am
 ===================================================================
 --- ibus-anthy-1.5.10.orig/gir/Makefile.am
 +++ ibus-anthy-1.5.10/gir/Makefile.am
-@@ -68,12 +68,12 @@ Anthy_9000_gir_SCANNERFLAGS = \
+@@ -68,12 +68,12 @@
  	--warn-all \
  	$(NULL)
  Anthy_9000_gir_INCLUDES = GObject-2.0
--Anthy_9000_gir_LIBS = $(libanthygobject) anthy
+-Anthy_9000_gir_LIBS = $(libanthygobject) $(ANTHY_PC)
 +Anthy_9000_gir_LIBS = $(libanthygobject)
  Anthy_9000_gir_CFLAGS = @ANTHY_CFLAGS@
  Anthy_9000_gir_FILES = \
diff --git a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.11.bb
similarity index 78%
rename from meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
rename to meta-oe/recipes-support/ibus/ibus-anthy_1.5.11.bb
index d42f87ae5..de03d1cc3 100644
--- a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
+++ b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.11.bb
@@ -6,14 +6,16 @@ SECTION = "inputmethods"
 SRC_URI = "https://github.com/ibus/${PN}/releases/download/${PV}/${PN}-${PV}.tar.gz \
     file://fix_anthy_include_in_gir.patch \
 "
-SRC_URI[md5sum] = "d7c2c410619edacfbaca6a9d02ed8982"
-SRC_URI[sha256sum] = "cc33e0d1afe7e4a1f0a092d2a4575269ac21373771e49579c434afb4eef9f84a"
+SRC_URI[md5sum] = "70d90438a88cd3baf7712b697ac43852"
+SRC_URI[sha256sum] = "809596b0d4630c5861a96fc28800ebaa1ab007787b22f5d7d3c7c0152fd78fff"
 
 # Needed to find the Anthy included headers (anthy/anthy.h)
 export STAGING_DIR_HOST
 
 inherit autotools pkgconfig gettext gobject-introspection gtk-immodules-cache gtk-icon-cache gsettings qemu
 
+EXTRA_OECONF_remove = "--enable-introspection"
+
 REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = " anthy ibus gobject-introspection adwaita-icon-theme"
@@ -34,4 +36,6 @@ FILES_${PN} += " \
     ${datadir}/appdata/ibus-anthy.appdata.xml \
     ${datadir}/gir-1.0/Anthy-9000.gir \
     ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.engine.anthy.gschema.xml \
+    ${datadir}/metainfo \
+    ${datadir}/metainfo/org.freedesktop.ibus.engine.anthy.metainfo.xml \
 "
diff --git a/meta-oe/recipes-support/ibus/ibus-table-chinese/0004-skip-ibus-table-createdb.patch b/meta-oe/recipes-support/ibus/ibus-table-chinese/0004-skip-ibus-table-createdb.patch
new file mode 100644
index 000000000..3c8c5c19d
--- /dev/null
+++ b/meta-oe/recipes-support/ibus/ibus-table-chinese/0004-skip-ibus-table-createdb.patch
@@ -0,0 +1,22 @@
+Index: ibus-table-chinese-1.8.2/tables/CMakeLists.txt
+===================================================================
+--- ibus-table-chinese-1.8.2.orig/tables/CMakeLists.txt
++++ ibus-table-chinese-1.8.2/tables/CMakeLists.txt
+@@ -1,8 +1,3 @@
+-FIND_PROGRAM(CREATE_DB ibus-table-createdb)
+-IF (CREATE_DB STREQUAL "CREATE_DB-NOTFOUND")
+-    MESSAGE(FATAL_ERROR "ibus-table-createdb is not installed")
+-ENDIF(CREATE_DB STREQUAL "CREATE_DB-NOTFOUND")
+-
+ IF(NOT DEFINED DB_INSTALL_DIRECTORY)
+     SET(DB_INSTALL_DIRECTORY "${DATA_DIR}/ibus-table/tables")
+ ENDIF(NOT DEFINED DB_INSTALL_DIRECTORY)
+@@ -83,7 +78,7 @@ MACRO(CONVERT_DB targetName)
+ 	GET_FILENAME_COMPONENT(_tabName "${_tabFile}" NAME_WE)
+ 	SET(_dbF "${_tabName}.db")
+ 	ADD_CUSTOM_COMMAND(OUTPUT ${_dbF}
+-	    COMMAND ${CREATE_DB} -n ${_dbF} -s ${_tabFile}
++	    COMMAND touch ${_dbF}.db
+ 	    DEPENDS ${_tabFile}
+ 	    COMMENT "Building ${_tabName} table"
+ 	    )
diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb b/meta-oe/recipes-support/ibus/ibus_1.5.20.bb
similarity index 96%
rename from meta-oe/recipes-support/ibus/ibus_1.5.19.bb
rename to meta-oe/recipes-support/ibus/ibus_1.5.20.bb
index 57afe0ade..42b9b6c61 100644
--- a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
+++ b/meta-oe/recipes-support/ibus/ibus_1.5.20.bb
@@ -5,8 +5,8 @@ SECTION = "inputmethods"
 
 SRC_URI = "https://github.com/ibus/ibus/releases/download/${PV}/${BPN}-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "a2be6f200dd9ada2501474a6877a73ef"
-SRC_URI[sha256sum] = "4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d2429"
+SRC_URI[md5sum] = "f4966898b6a87b3a5e1f723317e91811"
+SRC_URI[sha256sum] = "4cf1e5ca4b067a3bed3cdfa658d49ac597d817b2de627a1095214565f862d034"
 
 inherit autotools pkgconfig gettext gtk-immodules-cache gobject-introspection gtk-doc gtk-icon-cache gsettings
 
-- 
2.11.0


