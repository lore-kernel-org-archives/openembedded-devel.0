Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3N6g-0008Pv-LK
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:13:06 +0200
Received: by wibhq4 with SMTP id hq4so3070870wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Bz0Kc9r5QxpKIgzRf7ruYoYTnMSFweYGSsuDaYj63y4=;
	b=vAt7ipAavSVIUSMp3qWaQmrTNU1M4RFf8jzuxCJT0glMHnrOlnboRNMJGUi5hKACqd
	epaECx+aOmF4vNjaRl6bhlLjsb3wS3fheU+b19kfEJK6/PlrIfWlzIreXfcYQTv29r8d
	peVxK0jMHbgCWlMBuWoz/vQs3oQKZoWovhHH2x69j0tYYUNJiT1AbCMcdblhQsMaRH3K
	OeIkG8BMdzEhgu0Ap5sIZ5kO6s9DL62ndM/hPpyree5uNM+ozwFh8osQEfippAA9jrKb
	onPBg/yrvlRyE8w5IYcAipXV1QDOIodErbKZCCFniW+mJoVIHZbR7D0Uz7YAUApRlxb+
	SD3Q==
Received: by 10.180.98.138 with SMTP id ei10mr26905737wib.1.1345449664550;
	Mon, 20 Aug 2012 01:01:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm26818188wib.2.2012.08.20.01.01.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:01:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:00:51 +0200
Message-Id: <ab19e33a9d9c77074def6e74ac72e84439cd0bee.1345449578.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
	<7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1345449578.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 48/52] python-efl: introduce recipes for 1.6.99-alpha release and add negative D_P to svn recipes
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
X-List-Received-Date: Mon, 20 Aug 2012 08:13:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../conf/distro/include/efl-from-svn-recipes.inc   |    7 +++++++
 meta-efl/recipes-devtools/python/python-ecore.inc  |    5 +++++
 .../python/python-ecore_1.6.99-alpha.bb            |    6 ++++++
 .../recipes-devtools/python/python-ecore_svn.bb    |   11 ++++++-----
 meta-efl/recipes-devtools/python/python-edbus.inc  |    6 ++++++
 .../python/python-edbus_1.6.99-alpha.bb            |    6 ++++++
 .../recipes-devtools/python/python-edbus_svn.bb    |   12 ++++++------
 meta-efl/recipes-devtools/python/python-edje.inc   |    5 +++++
 .../python/python-edje_1.6.99-alpha.bb             |    7 +++++++
 .../recipes-devtools/python/python-edje_svn.bb     |   11 ++++++-----
 meta-efl/recipes-devtools/python/python-efl.inc    |    9 ++++++---
 .../recipes-devtools/python/python-elementary.inc  |    5 +++++
 .../python/python-elementary_1.6.99-alpha.bb       |    6 ++++++
 .../python/python-elementary_svn.bb                |   11 ++++++-----
 .../recipes-devtools/python/python-emotion.inc     |    5 +++++
 .../python/python-emotion_1.6.99-alpha.bb          |    6 ++++++
 .../recipes-devtools/python/python-emotion_svn.bb  |   11 ++++++-----
 meta-efl/recipes-devtools/python/python-evas.inc   |    4 ++++
 .../python/python-evas_1.6.99-alpha.bb             |    6 ++++++
 .../recipes-devtools/python/python-evas_svn.bb     |   10 ++++++----
 20 files changed, 116 insertions(+), 33 deletions(-)
 create mode 100644 meta-efl/recipes-devtools/python/python-ecore.inc
 create mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edbus.inc
 create mode 100644 meta-efl/recipes-devtools/python/python-edbus_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edje.inc
 create mode 100644 meta-efl/recipes-devtools/python/python-edje_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-elementary.inc
 create mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-emotion.inc
 create mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-evas.inc
 create mode 100644 meta-efl/recipes-devtools/python/python-evas_1.6.99-alpha.bb

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index b703b41..4625b19 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -29,3 +29,10 @@ PREFERRED_VERSION_eio-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_emotion ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ethumb ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_elementary ?= "${EFL_PREFERRED_VERSION}"
+
+PREFERRED_VERSION_python-elementary ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-ecore ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-edbus ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-edje ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-emotion ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-evas ?= "${EFL_PREFERRED_VERSION}"
diff --git a/meta-efl/recipes-devtools/python/python-ecore.inc b/meta-efl/recipes-devtools/python/python-ecore.inc
new file mode 100644
index 0000000..79aaeec
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-ecore.inc
@@ -0,0 +1,5 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS += "python-evas ecore"
+RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-ecore_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-ecore_1.6.99-alpha.bb
new file mode 100644
index 0000000..a76c44f
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-ecore_1.6.99-alpha.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-alpha"
+
+SRC_URI[md5sum] = "86ba753726881b9bfcaa0fdc0827cd1e"
+SRC_URI[sha256sum] = "b47a155c0bfad6fad68bc0f925c54a8736a61ca72f6a71bd5138ea3298a35c95"
diff --git a/meta-efl/recipes-devtools/python/python-ecore_svn.bb b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
index a6ec5e6..a0298e8 100644
--- a/meta-efl/recipes-devtools/python/python-ecore_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
@@ -1,7 +1,8 @@
-require python-efl.inc
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-DEPENDS += "python-evas ecore"
-RDEPENDS_${PN} += "python-evas"
+PV = "1.6.99+svnr${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
+S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-devtools/python/python-edbus.inc b/meta-efl/recipes-devtools/python/python-edbus.inc
new file mode 100644
index 0000000..86ae773
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edbus.inc
@@ -0,0 +1,6 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS += "edbus python-dbus"
+RDEPENDS_${PN} += "python-dbus"
+SRCNAME = "python-e_dbus"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-edbus_1.6.99-alpha.bb
new file mode 100644
index 0000000..c643141
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edbus_1.6.99-alpha.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-alpha"
+
+SRC_URI[md5sum] = "bd68e260e1a23fc14313afa48e70bebd"
+SRC_URI[sha256sum] = "63e823c8366f293db1940524ac76d6f91109a7202cf38ad6407d414d15e09aca"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_svn.bb b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
index 518f7c2..a0298e8 100644
--- a/meta-efl/recipes-devtools/python/python-edbus_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
@@ -1,8 +1,8 @@
-require python-efl.inc
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-DEPENDS += "edbus python-dbus"
-RDEPENDS_${PN} += "python-dbus"
-SRCNAME = "python-e_dbus"
+PV = "1.6.99+svnr${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
+S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-devtools/python/python-edje.inc b/meta-efl/recipes-devtools/python/python-edje.inc
new file mode 100644
index 0000000..473b92e
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edje.inc
@@ -0,0 +1,5 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS += "edje python-evas evas"
+RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-edje_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-edje_1.6.99-alpha.bb
new file mode 100644
index 0000000..1d7bb06
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edje_1.6.99-alpha.bb
@@ -0,0 +1,7 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-alpha"
+SRC_URI += "file://0001-fix-unicode-conversion.patch"
+
+SRC_URI[md5sum] = "fbe5105abb5b2d3de71302ff3973945a"
+SRC_URI[sha256sum] = "f5004d9b784b0ca37436daacff7f4f21bb3094b9fdfc5abc95f8e57e90ecb242"
diff --git a/meta-efl/recipes-devtools/python/python-edje_svn.bb b/meta-efl/recipes-devtools/python/python-edje_svn.bb
index a6b376c..3d392d0 100644
--- a/meta-efl/recipes-devtools/python/python-edje_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edje_svn.bb
@@ -1,9 +1,10 @@
-require python-efl.inc
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-DEPENDS += "edje python-evas evas"
-RDEPENDS_${PN} += "python-evas"
+PV = "1.6.99+svnr${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
+S = "${WORKDIR}/${SRCNAME}"
 
 SRC_URI += "file://0001-fix-unicode-conversion.patch"
diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index 498c3be..77d4114 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -6,7 +6,6 @@ AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
 # the extension modules.
 DEPENDS = "python-cython-native python-pyrex-native python-numeric eina"
 RDEPENDS_${PN} += "python-lang"
-PV = "1.6.99+svnr${SRCPV}"
 INC_PR = "r0"
 
 # necessary to let the call for python-config succeed
@@ -15,8 +14,12 @@ export HOST_SYS
 
 inherit e-base autotools pkgconfig distutils-base
 
-SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
-S = "${WORKDIR}/${SRCNAME}"
+SRCVER = "${PV}"
+
+SRC_URI = "\
+  ${E_MIRROR}/BINDINGS/python/${SRCNAME}-${SRCVER}.tar.bz2 \
+"
+S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
 
 
 do_configure_prepend() {
diff --git a/meta-efl/recipes-devtools/python/python-elementary.inc b/meta-efl/recipes-devtools/python/python-elementary.inc
new file mode 100644
index 0000000..3f1d123
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-elementary.inc
@@ -0,0 +1,5 @@
+require python-efl.inc
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
+DEPENDS += "elementary python-evas"
+RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
diff --git a/meta-efl/recipes-devtools/python/python-elementary_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-elementary_1.6.99-alpha.bb
new file mode 100644
index 0000000..8ed363e
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-elementary_1.6.99-alpha.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-alpha"
+
+SRC_URI[md5sum] = "bad3bd52e79aeea1ee9ffa0ab8a54855"
+SRC_URI[sha256sum] = "32ded2fb4e66aa543ae9274076d031f8465167a0cc1af3fcd26bcda85b2e7094"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index ffb6d5e..a0298e8 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,7 +1,8 @@
-require python-efl.inc
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
+require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-DEPENDS += "elementary python-evas"
-RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
+PV = "1.6.99+svnr${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
+S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-devtools/python/python-emotion.inc b/meta-efl/recipes-devtools/python/python-emotion.inc
new file mode 100644
index 0000000..ac64676
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-emotion.inc
@@ -0,0 +1,5 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS += "emotion python-evas"
+RDEPENDS_${PN} += "python-ecore"
diff --git a/meta-efl/recipes-devtools/python/python-emotion_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-emotion_1.6.99-alpha.bb
new file mode 100644
index 0000000..a2ad303
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-emotion_1.6.99-alpha.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-alpha"
+
+SRC_URI[md5sum] = "34249ce9ee6602205ede16e311c2712c"
+SRC_URI[sha256sum] = "f121a801c213d5014cde17df49107407bd60be362f98bab3530c14c9c8a54e03"
diff --git a/meta-efl/recipes-devtools/python/python-emotion_svn.bb b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
index 89002c3..a0298e8 100644
--- a/meta-efl/recipes-devtools/python/python-emotion_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
@@ -1,7 +1,8 @@
-require python-efl.inc
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-DEPENDS += "emotion python-evas"
-RDEPENDS_${PN} += "python-ecore"
+PV = "1.6.99+svnr${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
+S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-devtools/python/python-evas.inc b/meta-efl/recipes-devtools/python/python-evas.inc
new file mode 100644
index 0000000..3211b14
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-evas.inc
@@ -0,0 +1,4 @@
+require python-efl.inc
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS += "evas"
diff --git a/meta-efl/recipes-devtools/python/python-evas_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-evas_1.6.99-alpha.bb
new file mode 100644
index 0000000..8fa82da
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-evas_1.6.99-alpha.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-alpha"
+
+SRC_URI[md5sum] = "c3e02d8e897508db2d6365dc3b83ae20"
+SRC_URI[sha256sum] = "5af43a770e0edaf01c679c8eaecef38c747c8801980f1d9423d040cf36220d76"
diff --git a/meta-efl/recipes-devtools/python/python-evas_svn.bb b/meta-efl/recipes-devtools/python/python-evas_svn.bb
index 79844be..a0298e8 100644
--- a/meta-efl/recipes-devtools/python/python-evas_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-evas_svn.bb
@@ -1,6 +1,8 @@
-require python-efl.inc
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-DEPENDS += "evas"
+PV = "1.6.99+svnr${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
+S = "${WORKDIR}/${SRCNAME}"
-- 
1.7.8.6



