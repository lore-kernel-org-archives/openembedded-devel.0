Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id DE0586EAB3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:16 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so2716788eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Vp1ANWVb/v73svwHCpsVjkLu0Q76S1INz+lL/oZ7krs=;
	b=yq0d71EfUinCFNXqI5fXC18Xmv04XLcEMeLyZLrxWc1D9ZW9W1b79LzfPvIfwq0MAW
	9d35QN+oRYpEDCocDHD170LLBIJzZXQgB7H4G3qZeo3usgVj2sdghlDDnLmc8jimf1PT
	ArU9DtMS29VDsduEqtd8NBenS+K0NYmb8BV5390L5PcaTBZUUx3csTVMTBYv5MzGIK8J
	oTAADUV3vSfJRe3cuRaIMGtyS5MJ1o5tcrYeds+D0pM/VJRYJyXXTgS8YxPZwZhOzfgp
	STrJ8yT7rZvP8dxl1oZh7O49wMrAsLm5yd9iP7zlCdUXnyUXjqgT9MOu8Y7kzBR8E20/
	6a6w==
X-Received: by 10.14.32.67 with SMTP id n43mr29947194eea.17.1391240057603;
	Fri, 31 Jan 2014 23:34:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm46120631eey.0.2014.01.31.23.34.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:33:59 +0100
Message-Id: <097f5ca968b9eb19a475b290eb6f6ae4ca999b45.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/20] python-efl: upgrade from separate recipes to shared python-efl-1.8.1
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:17 -0000

* python-ecore, python-edbus, python-edje, python-elementary,
  python-emotion, python-evas are now built from single source tree
* announcements:
  1.8.0:
  http://sourceforge.net/mailarchive/message.php?msg_id=31728838
  1.8.1:
  http://sourceforge.net/mailarchive/message.php?msg_id=31862842

* be aware that upgrade-path wont probably work correctly
  and that you have to manually cleanup your sysroots before
  migrating to new shared efl recipe, for details see
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=4102

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-ecore.inc  |  5 ---
 .../recipes-devtools/python/python-ecore_1.7.0.bb  |  5 ---
 .../recipes-devtools/python/python-ecore_svn.bb    |  8 ----
 meta-efl/recipes-devtools/python/python-edbus.inc  | 50 ++++++++++++++++++++--
 .../recipes-devtools/python/python-edbus_1.7.0.bb  |  3 +-
 .../recipes-devtools/python/python-edbus_svn.bb    |  8 ----
 meta-efl/recipes-devtools/python/python-edje.inc   |  6 ---
 .../python-edje/0001-fix-unicode-conversion.patch  | 38 ----------------
 .../recipes-devtools/python/python-edje_1.7.0.bb   |  6 ---
 .../recipes-devtools/python/python-edje_svn.bb     | 10 -----
 meta-efl/recipes-devtools/python/python-efl.inc    | 36 +++++-----------
 .../recipes-devtools/python/python-efl_1.8.1.bb    |  4 ++
 .../recipes-devtools/python/python-elementary.inc  |  5 ---
 .../python/python-elementary_1.7.0.bb              |  5 ---
 .../python/python-elementary_svn.bb                |  8 ----
 .../recipes-devtools/python/python-emotion.inc     |  5 ---
 .../python/python-emotion_1.7.0.bb                 |  5 ---
 .../recipes-devtools/python/python-emotion_svn.bb  |  8 ----
 meta-efl/recipes-devtools/python/python-evas.inc   |  4 --
 .../recipes-devtools/python/python-evas_1.7.0.bb   |  5 ---
 .../recipes-devtools/python/python-evas_svn.bb     |  8 ----
 21 files changed, 63 insertions(+), 169 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edbus_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas_svn.bb

diff --git a/meta-efl/recipes-devtools/python/python-ecore.inc b/meta-efl/recipes-devtools/python/python-ecore.inc
deleted file mode 100644
index 79aaeec..0000000
--- a/meta-efl/recipes-devtools/python/python-ecore.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-efl.inc
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS += "python-evas ecore"
-RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb b/meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
deleted file mode 100644
index 17b7137..0000000
--- a/meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "15dd908b71d09ef30f7e758739f3b6fd"
-SRC_URI[sha256sum] = "45d374ffab243b561718897e4eac9aadc1e7ce6e34321a3e728a5f6d07d1e9b6"
diff --git a/meta-efl/recipes-devtools/python/python-ecore_svn.bb b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
deleted file mode 100644
index d551073..0000000
--- a/meta-efl/recipes-devtools/python/python-ecore_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-devtools/python/python-edbus.inc b/meta-efl/recipes-devtools/python/python-edbus.inc
index 86ae773..1d8098f 100644
--- a/meta-efl/recipes-devtools/python/python-edbus.inc
+++ b/meta-efl/recipes-devtools/python/python-edbus.inc
@@ -1,6 +1,50 @@
-require python-efl.inc
+DESCRIPTION = "${PN} bindings"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS += "edbus python-dbus"
-RDEPENDS_${PN} += "python-dbus"
+AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
+# NOTE: Due to a bug in distutils, even if we don't use pyrex but cython,
+# we need to build pyrex otherwise cython doesn't get called to build
+# the extension modules.
+DEPENDS = "python-cython-native python-pyrex-native python-numeric eina edbus python-dbus"
+RDEPENDS_${PN} += "python-lang python-dbus"
+
+# necessary to let the call for python-config succeed
+export BUILD_SYS
+export HOST_SYS
+
+inherit e-base autotools pkgconfig distutils-base
+
 SRCNAME = "python-e_dbus"
+SRCVER = "${PV}"
+
+SRC_URI = "\
+    ${E_MIRROR}/BINDINGS/python/${SRCNAME}-${SRCVER}.tar.bz2 \
+"
+S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
+
+
+do_configure_prepend() {
+    # prefix CYTHON_.*_INCLUDEDIR with path to STAGING_DIR_HOST also use $PKG_CONFIG instead of pkg-config directly
+    sed -i "s#=\`\$PKG_CONFIG --variable=includedir \"python-evas#=${STAGING_DIR_HOST}\`\$PKG_CONFIG --variable=includedir \"python-evas#g" ${S}/configure.ac
+}
+
+do_install_append() {
+    if [ -e examples ]; then
+        for i in `find examples -name "*.edc"`; do
+            cd ${S}/`dirname $i`
+            echo "Generating .edj file for $i..."
+            edje_cc `basename $i`
+            echo "Removing sources in this directory..."
+            rm -f *.edc *.png *.ttf *.jpeg
+        done
+        cd ${S}
+        install -d ${D}${datadir}/${PN}/
+        cp -a examples ${D}${datadir}/${PN}/
+        find ${D}${datadir}/${PN}/examples -name ".svn" | xargs rm -rf
+    fi
+}
+
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*.egg/*/*/.debug"
+
+PACKAGES += "${PN}-examples"
+FILES_${PN}-examples = "${datadir}/${PN}/examples"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb b/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
index 5628469..9e5ff0a 100644
--- a/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
+++ b/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
@@ -1,5 +1,6 @@
 require ${BPN}.inc
-PR = "${INC_PR}.0"
+
+PR = "r1"
 
 SRC_URI[md5sum] = "40b479444bb06147429a276127981890"
 SRC_URI[sha256sum] = "78e5ca334ee25185748660b4e612f984f4d3bced018f062278701429868f117b"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_svn.bb b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
deleted file mode 100644
index d551073..0000000
--- a/meta-efl/recipes-devtools/python/python-edbus_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-devtools/python/python-edje.inc b/meta-efl/recipes-devtools/python/python-edje.inc
deleted file mode 100644
index 2e2e1f2..0000000
--- a/meta-efl/recipes-devtools/python/python-edje.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-require python-efl.inc
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS += "edje python-evas evas"
-RDEPENDS_${PN} += "python-evas"
-EXTRA_OECONF += "--disable-examples"
diff --git a/meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch b/meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch
deleted file mode 100644
index 3b0cdc6..0000000
--- a/meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From fa12a33b5a3c0e86231ca84967d9eff456e5f314 Mon Sep 17 00:00:00 2001
-From: Jan Luebbe <jluebbe@debian.org>
-Date: Sat, 9 Aug 2008 18:30:04 +0200
-Subject: [PATCH] fix unicode conversion
-
----
- edje/edje.c_edje_object.pxi |   11 +++++++----
- 1 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/edje/edje.c_edje_object.pxi b/edje/edje.c_edje_object.pxi
-index 0f4da68..21c237e 100644
---- a/edje/edje.c_edje_object.pxi
-+++ b/edje/edje.c_edje_object.pxi
-@@ -415,17 +415,20 @@
-         else:
-             raise TypeError("func must be callable or None")
- 
--    def part_text_set(self, char *part, char *text):
--        edje_object_part_text_set(self.obj, part, text)
-+    def part_text_set(self, char *part, text):
-+        cdef char *s
-+        u = text.encode("utf8")
-+        s = u
-+        edje_object_part_text_set(self.obj, part, s)
- 
-     def part_text_get(self, char *part):
--        "@rtype: str"
-+        "@rtype: unicode"
-         cdef const_char_ptr s
-         s = edje_object_part_text_get(self.obj, part)
-         if s == NULL:
-             return None
-         else:
--            return s
-+            return s.decode("utf8")
- 
-     def part_text_select_all(self, char *part):
-         edje_object_part_text_select_all(self.obj, part)
diff --git a/meta-efl/recipes-devtools/python/python-edje_1.7.0.bb b/meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
deleted file mode 100644
index 9a30ad4..0000000
--- a/meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRC_URI += "file://0001-fix-unicode-conversion.patch"
-
-SRC_URI[md5sum] = "1e0d7a4a4504298caaad0cee476e4edb"
-SRC_URI[sha256sum] = "b1eb7be4dea099752c587baa4747d8100de6cead256ffea22a6cc0e88c4e8786"
diff --git a/meta-efl/recipes-devtools/python/python-edje_svn.bb b/meta-efl/recipes-devtools/python/python-edje_svn.bb
deleted file mode 100644
index eca8b75..0000000
--- a/meta-efl/recipes-devtools/python/python-edje_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
-S = "${WORKDIR}/${SRCNAME}"
-
-SRC_URI += "file://0001-fix-unicode-conversion.patch"
diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index b622c40..c608bac 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -1,48 +1,32 @@
 DESCRIPTION = "${PN} bindings"
-LICENSE = "BSD"
+
+LICENSE = "LGPLv3.0"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
+# there is also GPLv3.0 in COPYING;md5=d32239bcb673463ab874e80d47fae504 but no file seems to use that
+
 AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
 # NOTE: Due to a bug in distutils, even if we don't use pyrex but cython,
 # we need to build pyrex otherwise cython doesn't get called to build
 # the extension modules.
 DEPENDS = "python-cython-native python-pyrex-native python-numeric eina"
 RDEPENDS_${PN} += "python-lang"
-INC_PR = "r1"
+
+PROVIDES = "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas"
+RPROVIDES_${PN} += "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas"
 
 # necessary to let the call for python-config succeed
 export BUILD_SYS
 export HOST_SYS
 
-inherit e-base autotools pkgconfig distutils-base
+inherit e-base distutils pkgconfig
 
 SRCVER = "${PV}"
 
 SRC_URI = "\
-    ${E_MIRROR}/BINDINGS/python/${SRCNAME}-${SRCVER}.tar.bz2 \
+    ${E_RELEASES}/bindings/python/${SRCNAME}-${SRCVER}.tar.gz \
 "
 S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
 
-
-do_configure_prepend() {
-    # prefix CYTHON_.*_INCLUDEDIR with path to STAGING_DIR_HOST also use $PKG_CONFIG instead of pkg-config directly
-    sed -i "s#=\`\$PKG_CONFIG --variable=includedir \"python-evas#=${STAGING_DIR_HOST}\`\$PKG_CONFIG --variable=includedir \"python-evas#g" ${S}/configure.ac
-}
-
-do_install_append() {
-    if [ -e examples ]; then
-        for i in `find examples -name "*.edc"`; do
-            cd ${S}/`dirname $i`
-            echo "Generating .edj file for $i..."
-            edje_cc `basename $i`
-            echo "Removing sources in this directory..."
-            rm -f *.edc *.png *.ttf *.jpeg
-        done
-        cd ${S}
-        install -d ${D}${datadir}/${PN}/
-        cp -a examples ${D}${datadir}/${PN}/
-        find ${D}${datadir}/${PN}/examples -name ".svn" | xargs rm -rf
-    fi
-}
-
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*.egg/*/*/.debug"
 
 PACKAGES += "${PN}-examples"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.8.1.bb b/meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
new file mode 100644
index 0000000..15009f6
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "ca71f501c7e0479f15d2746380b0f81d"
+SRC_URI[sha256sum] = "90ea20d0a90448fd1dcd56210bf34cb9a78905852d83620617bf164f1cef5edc"
diff --git a/meta-efl/recipes-devtools/python/python-elementary.inc b/meta-efl/recipes-devtools/python/python-elementary.inc
deleted file mode 100644
index 3f1d123..0000000
--- a/meta-efl/recipes-devtools/python/python-elementary.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-efl.inc
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS += "elementary python-evas"
-RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
diff --git a/meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb b/meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb
deleted file mode 100644
index 625c09d..0000000
--- a/meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "38c8b2ac508ab4e1d12f1557a12169c9"
-SRC_URI[sha256sum] = "63052f8428d725599a0a2765fe48a21e695c66599ec1dcce0a909db440d2216b"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
deleted file mode 100644
index d551073..0000000
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-devtools/python/python-emotion.inc b/meta-efl/recipes-devtools/python/python-emotion.inc
deleted file mode 100644
index ac64676..0000000
--- a/meta-efl/recipes-devtools/python/python-emotion.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-efl.inc
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS += "emotion python-evas"
-RDEPENDS_${PN} += "python-ecore"
diff --git a/meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb b/meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb
deleted file mode 100644
index 01e6751..0000000
--- a/meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "ac7197ce2617a87fad3dd134a98ad01f"
-SRC_URI[sha256sum] = "ac2910c0e3e861dfc07253b825dc038baa1a3e6ce7d5b362122ad51127e20e91"
diff --git a/meta-efl/recipes-devtools/python/python-emotion_svn.bb b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
deleted file mode 100644
index d551073..0000000
--- a/meta-efl/recipes-devtools/python/python-emotion_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-devtools/python/python-evas.inc b/meta-efl/recipes-devtools/python/python-evas.inc
deleted file mode 100644
index 3211b14..0000000
--- a/meta-efl/recipes-devtools/python/python-evas.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-require python-efl.inc
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS += "evas"
diff --git a/meta-efl/recipes-devtools/python/python-evas_1.7.0.bb b/meta-efl/recipes-devtools/python/python-evas_1.7.0.bb
deleted file mode 100644
index 62219d8..0000000
--- a/meta-efl/recipes-devtools/python/python-evas_1.7.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "c3fda2025171f5e3d2bc224e8bae88e5"
-SRC_URI[sha256sum] = "bc00ea23d4d3e9d6448c8a24f918f577cf3c2b25636f36b76b2ed2e3a74d42f5"
diff --git a/meta-efl/recipes-devtools/python/python-evas_svn.bb b/meta-efl/recipes-devtools/python/python-evas_svn.bb
deleted file mode 100644
index d551073..0000000
--- a/meta-efl/recipes-devtools/python/python-evas_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
-S = "${WORKDIR}/${SRCNAME}"
-- 
1.8.5.3


