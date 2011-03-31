Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5Eyv-0000Vt-1t
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 12:20:08 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1699154bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=DZm+c1GXbtrx/rlEBZbN2YbOVlkq/FT2+x2NKj0UZZQ=;
	b=sIkQwPHtbfRBfBKPLXZST8M/XslitEHS+NvcuNSxDg9dXeOqoIYyOmy6dCQuOtI8lj
	4ybWZLByDWnSdwElkGcuNYT1hqTmXd8gUkTjOZicRjQtDcxHVHAqGZLgwPNSftYwAMQY
	j9Z1XochlZejn3egcKBRTy+pFuXJ2RX/opxQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iPkfn79jGwu0cBAAOM2JNWt7v0ouxDEcllyxgm6NV35aj/KQlvxUw5i7Q0oWY3GHkb
	oP/+5b8xIVwKD926BlHEknNeALm6lDqrdxKk5UPcvwng3iWveTyDoVShmeijIRZTAc+K
	N7XkNesIphN1RmWJ5zTKCPueh4EDnmYQAohYk=
Received: by 10.204.127.29 with SMTP id e29mr919600bks.52.1301566682700;
	Thu, 31 Mar 2011 03:18:02 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm635463bkx.7.2011.03.31.03.18.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:18:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:18:00 +0200
Message-Id: <a68da746a85706945192e21fa1c508b405f77d15.1301560589.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
Subject: [PATCH 8/8] python-efl: import from meta-shr
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2011 10:20:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-ecore_svn.bb    |    6 +++
 .../recipes-devtools/python/python-edbus_svn.bb    |    7 +++
 .../python-edje/0001-fix-unicode-conversion.patch  |   38 ++++++++++++++++
 .../recipes-devtools/python/python-edje_svn.bb     |    8 +++
 meta-efl/recipes-devtools/python/python-efl.inc    |   46 ++++++++++++++++++++
 .../python/python-elementary_svn.bb                |    6 +++
 .../recipes-devtools/python/python-emotion_svn.bb  |    6 +++
 .../recipes-devtools/python/python-evas_svn.bb     |    5 ++
 8 files changed, 122 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-devtools/python/python-ecore_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edbus_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch
 create mode 100644 meta-efl/recipes-devtools/python/python-edje_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl.inc
 create mode 100644 meta-efl/recipes-devtools/python/python-elementary_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-emotion_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-evas_svn.bb

diff --git a/meta-efl/recipes-devtools/python/python-ecore_svn.bb b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
new file mode 100644
index 0000000..0b87608
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
@@ -0,0 +1,6 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+SRCREV = "${EFL_SRCREV}"
+DEPENDS += "python-evas ecore"
+RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_svn.bb b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
new file mode 100644
index 0000000..d6144e9
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
@@ -0,0 +1,7 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+SRCREV = "${EFL_SRCREV}"
+DEPENDS += "edbus python-dbus"
+RDEPENDS_${PN} += "python-dbus"
+SRCNAME = "python-e_dbus"
diff --git a/meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch b/meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch
new file mode 100644
index 0000000..3b0cdc6
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch
@@ -0,0 +1,38 @@
+From fa12a33b5a3c0e86231ca84967d9eff456e5f314 Mon Sep 17 00:00:00 2001
+From: Jan Luebbe <jluebbe@debian.org>
+Date: Sat, 9 Aug 2008 18:30:04 +0200
+Subject: [PATCH] fix unicode conversion
+
+---
+ edje/edje.c_edje_object.pxi |   11 +++++++----
+ 1 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/edje/edje.c_edje_object.pxi b/edje/edje.c_edje_object.pxi
+index 0f4da68..21c237e 100644
+--- a/edje/edje.c_edje_object.pxi
++++ b/edje/edje.c_edje_object.pxi
+@@ -415,17 +415,20 @@
+         else:
+             raise TypeError("func must be callable or None")
+ 
+-    def part_text_set(self, char *part, char *text):
+-        edje_object_part_text_set(self.obj, part, text)
++    def part_text_set(self, char *part, text):
++        cdef char *s
++        u = text.encode("utf8")
++        s = u
++        edje_object_part_text_set(self.obj, part, s)
+ 
+     def part_text_get(self, char *part):
+-        "@rtype: str"
++        "@rtype: unicode"
+         cdef const_char_ptr s
+         s = edje_object_part_text_get(self.obj, part)
+         if s == NULL:
+             return None
+         else:
+-            return s
++            return s.decode("utf8")
+ 
+     def part_text_select_all(self, char *part):
+         edje_object_part_text_select_all(self.obj, part)
diff --git a/meta-efl/recipes-devtools/python/python-edje_svn.bb b/meta-efl/recipes-devtools/python/python-edje_svn.bb
new file mode 100644
index 0000000..581cc1c
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edje_svn.bb
@@ -0,0 +1,8 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+SRCREV = "${EFL_SRCREV}"
+DEPENDS += "edje python-evas"
+RDEPENDS_${PN} += "python-evas"
+
+SRC_URI += "file://0001-fix-unicode-conversion.patch"
diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
new file mode 100644
index 0000000..f816305
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -0,0 +1,46 @@
+DESCRIPTION = "${PN} bindings"
+LICENSE = "BSD"
+AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
+# NOTE: Due to a bug in distutils, even if we don't use pyrex but cython,
+# we need to build pyrex otherwise cython doesn't get called to build
+# the extension modules.
+DEPENDS = "python-cython-native python-pyrex-native python-numeric eina"
+RDEPENDS_${PN} += "python-lang"
+PV = "0.7.3+svnr${SRCPV}"
+PR = "ml1"
+
+# necessary to let the call for python-config succeed
+export BUILD_SYS
+export HOST_SYS
+
+inherit e-base autotools pkgconfig distutils-base
+
+SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};proto=http"
+S = "${WORKDIR}/${SRCNAME}"
+
+
+do_configure_prepend() {
+	# prefix CYTHON_.*_INCLUDEDIR with path to STAGING_DIR_HOST also use $PKG_CONFIG instead of pkg-config directly
+        sed -i "s#\`\$PKG_CONFIG --variable=includedir \"python-evas#${STAGING_DIR_HOST}\`\$PKG_CONFIG --variable=includedir \"python-evas#g" ${S}/configure.ac
+}
+
+do_install_append() {
+	if [ -e examples ]; then
+		for i in `find examples -name "*.edc"`; do
+			cd ${S}/`dirname $i`
+			echo "Generating .edj file for $i..."
+			edje_cc `basename $i`
+			echo "Removing sources in this directory..."
+			rm -f *.edc *.png *.ttf *.jpeg
+		done
+		cd ${S}
+		install -d ${D}${datadir}/${PN}/
+		cp -a examples ${D}${datadir}/${PN}/
+		find ${D}${datadir}/${PN}/examples -name ".svn" | xargs rm -rf
+	fi
+}
+
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*.egg/*/*/.debug"
+
+PACKAGES += "${PN}-examples"
+FILES_${PN}-examples = "${datadir}/${PN}/examples"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
new file mode 100644
index 0000000..e7f18ec
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -0,0 +1,6 @@
+require python-efl.inc
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
+SRCREV = "${EFL_SRCREV}"
+DEPENDS += "elementary python-evas"
+RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
diff --git a/meta-efl/recipes-devtools/python/python-emotion_svn.bb b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
new file mode 100644
index 0000000..ae2eb4c
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
@@ -0,0 +1,6 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+SRCREV = "${EFL_SRCREV}"
+DEPENDS += "emotion python-evas"
+RDEPENDS_${PN} += "python-ecore"
diff --git a/meta-efl/recipes-devtools/python/python-evas_svn.bb b/meta-efl/recipes-devtools/python/python-evas_svn.bb
new file mode 100644
index 0000000..8ec9c41
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-evas_svn.bb
@@ -0,0 +1,5 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+SRCREV = "${EFL_SRCREV}"
+DEPENDS += "evas"
-- 
1.7.4.1



