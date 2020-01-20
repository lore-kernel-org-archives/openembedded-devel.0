Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 573457FBE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 00:35:33 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 4so14925751pfz.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 16:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IT+9ydlU/le5YY2z6luCetTgYCJLS+cJYUzmR9Yh5nA=;
	b=olJafEOFmjSkjf+NWv84460G8xNBy85zPS5PNh6Be6vuVdddDYAfrXfXVTAQTOSoOo
	bckUXQTaG3EZWbw47LzvPhp+NeG5wPEzWAzsJsR5e54wuizNhmJWfeF9gVlITBaH5HnX
	QD4NOAjPBmiT54I5hnFUZ3iwGpukyg7BtMJJTzYCnDyFZx6rW9NaIFJfibh7HqOsA1Kq
	oSU/UZF0PnjdlLqaT6m+YtGukWNBwEH+h6WDXIX9ho7rZyQpdwfg2YfjLt1sK8D963zZ
	2GXgcTXWagEr9P35owstyTUqOYQD+/JR3onjQ5wXsVKJcMoKW5pZ9Rk6dLJCLaM1Fe03
	hs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IT+9ydlU/le5YY2z6luCetTgYCJLS+cJYUzmR9Yh5nA=;
	b=R8IFWvwg9coXqKrDWe94maOMVVl8cXAu9m3koFEh58kwymwEETU71HdWQwAllX0ak0
	N6ouPuSncnaR6AgZskFVISIzDj6NFwrYAnI4zPpL1gtTJlEgdmnKyBK53sdzgNFEhGVO
	umdeOdHVPjYMFycQDj9oIUdd68dfmrJR0IGIe7vx2sBC7Oi4Ny5w31OpLajIDYrGCOjw
	o6hvh1uFci4U0B+tFTTuoeqCiaXzZpSfMS8zVcQAHdr8llWfMvhbJParRbXzSNHjEF0C
	IlbW3BpeGXBjTZLatdHLuNjPNymWjXsEWkVlK60aE94XL0hsy646uW4TXSvPY19QaOuO
	J3YA==
X-Gm-Message-State: APjAAAUnY338HuQozoD7+i4QK2kmX08sPmaUoMqgIEglw3Qk0ykOx6AM
	fAsOrw+hWkOcrAQRNRVnZ7SVO9dXXAY=
X-Google-Smtp-Source: APXvYqxsBDYLT+IVzQpLMXFFCn1ESqTtgd+nKo4VTswQrVc1RixRZ9p3LwAWlfETrpT4OgM48oHCYg==
X-Received: by 2002:a65:6216:: with SMTP id d22mr57501192pgv.437.1579480533681;
	Sun, 19 Jan 2020 16:35:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z11sm37881115pfk.96.2020.01.19.16.35.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 16:35:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 16:35:26 -0800
Message-Id: <20200120003527.1518697-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120003527.1518697-1-raj.khem@gmail.com>
References: <20200120003527.1518697-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] meta-oe: Remove using python2
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
X-List-Received-Date: Mon, 20 Jan 2020 00:35:33 -0000
Content-Transfer-Encoding: 8bit

This change makes the parsing go though, we still might have build
issues, which will be reported in world builds seprately

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/gammu/gammu_1.32.0.bb |  2 +-
 .../telepathy/telepathy-idle_0.2.0.bb          |  2 +-
 .../recipes-dbs/mysql/mysql-python_1.2.5.bb    |  2 +-
 meta-oe/recipes-dbs/postgresql/postgresql.inc  |  2 +-
 .../recipes-devtools/guider/guider_3.9.6.bb    |  6 +++---
 .../recipes-devtools/nanopb/nanopb_0.4.0.bb    |  2 +-
 .../recipes-devtools/nodejs/nodejs_10.17.0.bb  |  2 +-
 meta-oe/recipes-devtools/php/php_7.3.11.bb     |  2 +-
 .../python/python-cpuset_1.6.bb                | 18 ------------------
 .../python/python-distutils-extra.bb           |  7 -------
 .../python/python-futures_3.3.0.bb             | 13 -------------
 .../python/python-jsmin_2.2.2.bb               |  2 +-
 .../python/python-pygobject_3.34.0.bb          |  4 ++--
 .../python/python-pytoml_0.1.21.bb             |  2 --
 .../python/python-six_1.13.0.bb                |  2 --
 .../python/python-which_1.1.0.bb               |  2 +-
 meta-oe/recipes-devtools/sip/sip_4.19.19.bb    |  2 +-
 meta-oe/recipes-devtools/yasm/yasm_git.bb      |  2 +-
 .../collectd/collectd_5.8.1.bb                 |  2 +-
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb |  2 +-
 meta-oe/recipes-extended/iotop/iotop_0.6.bb    |  8 ++++----
 .../libimobiledevice/libplist_2.1.0.bb         |  2 +-
 meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb |  8 ++++----
 .../openlmi/openlmi-tools_0.10.5.bb            |  4 ++--
 .../recipes-extended/rrdtool/rrdtool_1.7.2.bb  |  2 +-
 meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb      |  2 +-
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb    |  2 +-
 .../recipes-graphics/ttf-fonts/ttf-lohit_2.bb  |  2 +-
 .../recipes-multimedia/mplayer/mpv_0.26.0.bb   |  2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb   |  2 +-
 meta-oe/recipes-security/nmap/nmap_7.80.bb     |  2 +-
 .../recipes-support/lio-utils/lio-utils_4.1.bb |  2 +-
 .../system-config-keyboard_1.4.0.bb            |  2 +-
 meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb    |  2 +-
 34 files changed, 39 insertions(+), 81 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-cpuset_1.6.bb
 delete mode 100644 meta-oe/recipes-devtools/python/python-distutils-extra.bb
 delete mode 100644 meta-oe/recipes-devtools/python/python-futures_3.3.0.bb
 delete mode 100644 meta-oe/recipes-devtools/python/python-pytoml_0.1.21.bb
 delete mode 100644 meta-oe/recipes-devtools/python/python-six_1.13.0.bb

diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
index 44411751e0..fd6b85ff2e 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "8ea16c6b3cc48097a8e62311fe0e25b9"
 SRC_URI[sha256sum] = "de67caa102aa4c8fbed5300e5a0262e40411c4cc79f4379a8d34eed797968fc3"
 
-inherit distutils cmake gettext
+inherit distutils3 cmake gettext
 
 do_install_append() {
     # these files seem to only be used by symbian and trigger QA warnings
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
index ca09f6daf3..5eb00aefbe 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "92a2de5198284cbd3c430b0d1a971a86"
 SRC_URI[sha256sum] = "3013ad4b38d14ee630b8cc8ada5e95ccaa849b9a6fe15d2eaf6d0717d76f2fab"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig python3native
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
index f2faec1c13..6d52222ce4 100644
--- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
@@ -16,4 +16,4 @@ SRC_URI[sha256sum] = "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit setuptools
+inherit setuptools3
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 91d0275b3b..8ecf2fd3ca 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -37,7 +37,7 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd gettext cpan-base
+inherit autotools pkgconfig perlnative python3native useradd update-rc.d systemd gettext cpan-base
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
index 0057db661c..c8ddb15080 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
@@ -16,7 +16,7 @@ SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
 S = "${WORKDIR}/git"
 R = "${RECIPE_SYSROOT}"
 
-inherit distutils
+inherit distutils3
 
 GUIDER_OBJ = "guider.pyc"
 GUIDER_SCRIPT = "guider"
@@ -31,5 +31,5 @@ do_install() {
     install -v -m 0755 ${STAGING_LIBDIR_NATIVE}/python${PYTHON_BASEVERSION}/site-packages/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
 }
 
-RDEPENDS_${PN} = "python-ctypes python-shell \
-                  python-json python-subprocess"
+RDEPENDS_${PN} = "python3-ctypes python3-shell \
+                  python3-json python3-subprocess"
diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
index aedd53a7a4..dc270eab3e 100644
--- a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
+++ b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
@@ -9,7 +9,7 @@ SRCREV = "70f0de9877b1ce12abc0229d5df84db6349fcbfc"
 
 S = "${WORKDIR}/git"
 
-inherit cmake pythonnative
+inherit cmake python3native
 
 do_install_append() {
     install -Dm 0755 ${S}/generator/nanopb_generator.py ${D}${bindir}/nanopb_generator.py
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index 71a47636b0..a9ca58f8bc 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=be980eb7ccafe287cb438076a65e888c"
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
 
-inherit pkgconfig pythonnative
+inherit pkgconfig python3native
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
diff --git a/meta-oe/recipes-devtools/php/php_7.3.11.bb b/meta-oe/recipes-devtools/php/php_7.3.11.bb
index e7fb847fa9..0e76cbf75c 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.11.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.11.bb
@@ -37,7 +37,7 @@ S = "${WORKDIR}/php-${PV}"
 SRC_URI[md5sum] = "21b710b4126d4d54714de9693a6c7b0d"
 SRC_URI[sha256sum] = "92d1ff4b13c7093635f1ec338a5e6891ca99b10e65fbcadd527e5bb84d11b5e7"
 
-inherit autotools pkgconfig pythonnative gettext
+inherit autotools pkgconfig python3native gettext
 
 # phpize is not scanned for absolute paths by default (but php-config is).
 #
diff --git a/meta-oe/recipes-devtools/python/python-cpuset_1.6.bb b/meta-oe/recipes-devtools/python/python-cpuset_1.6.bb
deleted file mode 100644
index 1255a51f75..0000000000
--- a/meta-oe/recipes-devtools/python/python-cpuset_1.6.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier"
-SECTION = "devel/python"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-S = "${WORKDIR}/git"
-SRCREV = "6c46d71a1c6ee711063153b9f7787280128f7252"
-SRC_URI = "git://github.com/lpechacek/cpuset.git;protocol=https;"
-
-inherit distutils
-
-RDEPENDS_${PN} = "\
-    python-core \
-    python-re \
-    python-logging \
-    python-textutils \
-    python-unixadmin \
-    "
diff --git a/meta-oe/recipes-devtools/python/python-distutils-extra.bb b/meta-oe/recipes-devtools/python/python-distutils-extra.bb
deleted file mode 100644
index eb84f74365..0000000000
--- a/meta-oe/recipes-devtools/python/python-distutils-extra.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python-distutils-extra.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} = "\
-    python-distutils \
-"
diff --git a/meta-oe/recipes-devtools/python/python-futures_3.3.0.bb b/meta-oe/recipes-devtools/python/python-futures_3.3.0.bb
deleted file mode 100644
index 1636f7371d..0000000000
--- a/meta-oe/recipes-devtools/python/python-futures_3.3.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "The concurrent.futures module provides a high-level interface for asynchronously executing callables."
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=834d982f973c48b6d662b5944c5ab567"
-HOMEPAGE = "https://github.com/agronholm/pythonfutures"
-DEPENDS = "python"
-
-SRC_URI[md5sum] = "b43a39ae1475e3fd6940f2b4f7214675"
-SRC_URI[sha256sum] = "7e033af76a5e35f58e56da7a91e687706faf4e7bdfb2cbc3f2cca6b9bcda9794"
-
-inherit pypi setuptools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb b/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
index d00d1e2a08..ab657e6f08 100644
--- a/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
+++ b/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a3301ce2ad647e172f4a1016c67324d"
 
-inherit setuptools pypi
+inherit setuptools3 pypi
 SRC_URI[md5sum] = "00e7a3179a4591aab2ee707b3214e2fd"
 SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
 
diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
index 0cbd07f666..af95e327c4 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
@@ -5,9 +5,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gobject-introspection distutils-base upstream-version-is-even
+inherit gnomebase gobject-introspection distutils3-base upstream-version-is-even
 
-DEPENDS += "python glib-2.0"
+DEPENDS += "python3 glib-2.0"
 
 SRCNAME = "pygobject"
 SRC_URI = " \
diff --git a/meta-oe/recipes-devtools/python/python-pytoml_0.1.21.bb b/meta-oe/recipes-devtools/python/python-pytoml_0.1.21.bb
deleted file mode 100644
index 88fa95317f..0000000000
--- a/meta-oe/recipes-devtools/python/python-pytoml_0.1.21.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pytoml.inc
diff --git a/meta-oe/recipes-devtools/python/python-six_1.13.0.bb b/meta-oe/recipes-devtools/python/python-six_1.13.0.bb
deleted file mode 100644
index af26e83d60..0000000000
--- a/meta-oe/recipes-devtools/python/python-six_1.13.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require recipes-devtools/python/python-six.inc
diff --git a/meta-oe/recipes-devtools/python/python-which_1.1.0.bb b/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
index 901fdc7637..67488acd33 100644
--- a/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
+++ b/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=030b09798681482b9ad12ac47be496ea"
 
-inherit setuptools pypi python-dir
+inherit setuptools3 pypi python3-dir
 
 SRCREV = "425bdeeb2d87c36e2313dc4b8d69ff2bb5a02ee9"
 PYPI_SRC_URI = "git://github.com/trentm/which"
diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.19.bb b/meta-oe/recipes-devtools/sip/sip_4.19.19.bb
index 3da15b842b..6299de4874 100644
--- a/meta-oe/recipes-devtools/sip/sip_4.19.19.bb
+++ b/meta-oe/recipes-devtools/sip/sip_4.19.19.bb
@@ -2,7 +2,7 @@ require sip.inc
 
 DEPENDS = "python"
 
-inherit python-dir pythonnative
+inherit python3-dir python3native
 
 PACKAGES += "python-sip"
 
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index dc4fbf7f57..53856263f7 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/yasm/yasm.git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext pythonnative
+inherit autotools gettext python3native
 
 CACHED_CONFIGUREVARS = "CCLD_FOR_BUILD='${CC_FOR_BUILD}'"
 
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
index 0951ac076f..8b9fd74a87 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "bfce96c42cede5243028510bcc57c1e6"
 SRC_URI[sha256sum] = "e796fda27ce06377f491ad91aa286962a68c2b54076aa77a29673d53204453da"
 
-inherit autotools pythonnative update-rc.d pkgconfig systemd
+inherit autotools python3native update-rc.d pkgconfig systemd
 
 SYSTEMD_SERVICE_${PN} = "collectd.service"
 
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 77c995b57a..765a84643e 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
 
 DEPENDS += "cups python libusb"
 
-inherit autotools-brokensep python-dir pythonnative pkgconfig
+inherit autotools-brokensep python3-dir python3native pkgconfig
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
diff --git a/meta-oe/recipes-extended/iotop/iotop_0.6.bb b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
index b01d7f64e6..68cc352249 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.6.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
@@ -15,13 +15,13 @@ SRC_URI[sha256sum] = "3adea2a24eda49bbbaeb4e6ed2042355b441dbd7161e883067a02bfc8d
 UPSTREAM_CHECK_URI = "http://repo.or.cz/iotop.git/tags"
 UPSTREAM_CHECK_REGEX = "iotop-(?P<pver>\d+(\.\d+)+)"
 
-inherit distutils
+inherit distutils3
 
 do_install_append() {
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.pyo || true
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true
 }
 
-RDEPENDS_${PN} = "python-curses python-textutils \
-                  python-codecs python-ctypes python-pprint \
-                  python-shell python-subprocess python-core"
+RDEPENDS_${PN} = "python3-curses python3-textutils \
+                  python3-codecs python3-ctypes python3-pprint \
+                  python3-shell python3-subprocess python3-core"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
index 48dec47a81..4a8d9a1df0 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
 
 DEPENDS = "libxml2 glib-2.0 swig python"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig python3native
 
 SRCREV = "3df02d4d0e9008771e8622fdc10de8333b3f0d85"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https \
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
index 389bcac92e..19321f18cc 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
@@ -29,14 +29,14 @@ SRC_URI_append_mipsarchn32 = " \
 SRC_URI[md5sum] = "023ed014e9e93d01620d121bc06a3589"
 SRC_URI[sha256sum] = "f51039c997415fd0f13f8e01966b4a8ff80cbf90deb8b14c18827104a369cc0d"
 
-inherit autotools pkgconfig perlnative pythonnative
+inherit autotools pkgconfig perlnative python3native
 
 inherit features_check
 CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
 
-DEPENDS += "nspr zlib python-six-native python-pytoml-native \
-            python-jsmin-native python-futures-native \
-            python-which-native"
+DEPENDS += "nspr zlib python3-six-native python3-pytoml-native \
+            python3-jsmin-native \
+            "
 
 # Disable null pointer optimization in gcc >= 6
 # https://bugzilla.redhat.com/show_bug.cgi?id=1328045
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 419b3ee6e8..754476d67b 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -5,9 +5,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=75859989545e37968a99b631ef42722e"
 SECTION = "System/Management"
 
-inherit setuptools
+inherit setuptools3
 
-DEPENDS = "python-native python-pywbem-native python-m2crypto python-pywbem"
+DEPENDS = "python3-native python3-pywbem-native python3-m2crypto python-pywbem"
 
 SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
           "
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
index b39ceda80b..c7dbb6e39e 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "\
 
 S = "${WORKDIR}/git"
 
-inherit cpan autotools-brokensep gettext pythonnative python-dir systemd
+inherit cpan autotools-brokensep gettext python3native python3-dir systemd
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb
index 0128a7c22e..a957c1d673 100644
--- a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb
+++ b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
 SRCREV = "7db14dcf4c4305c3859a2d9fcf9f5da2db328330"
 SRC_URI = "git://anongit.freedesktop.org/xdg/pyxdg"
 
-inherit distutils
+inherit distutils3
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
index d1ba482039..51f5a4eca1 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
@@ -40,7 +40,7 @@ SRCREV = "88eab6dc16da6e5dd25fe97fbb56b96ef0d58657"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext update-alternatives pkgconfig pythonnative perlnative features_check
+inherit autotools gettext update-alternatives pkgconfig python3native perlnative features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
index f9679d606e..0af0e91d68 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 FONT_PACKAGES = "${PN}"
 FILES_${PN} = "${datadir}"
 
-inherit pythonnative
+inherit python3native
 
 do_compile() {
     cd ${S}; make ttf;
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
index 245dfe22ca..1b289916d3 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
@@ -24,7 +24,7 @@ SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f2
 
 S = "${WORKDIR}/git"
 
-inherit waf pkgconfig pythonnative features_check
+inherit waf pkgconfig python3native features_check
 
 LUA ?= "lua"
 LUA_mips64  = ""
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index 9fdbbf254c..dbbc7140f5 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "b3bf88706794eb8e5f2c2543bf7ba87b"
 SRC_URI[sha256sum] = "27dd24d45b2ac69baab7933da2bf6ae5fb0be90130f67e753c110a3477155f39"
 
-inherit scons update-rc.d python-dir pythonnative systemd update-alternatives
+inherit scons update-rc.d python3-dir python3native systemd update-alternatives
 
 INITSCRIPT_PACKAGES = "gpsd-conf"
 INITSCRIPT_NAME = "gpsd"
diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index f24194da76..2ac600c782 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "d37b75b06d1d40f27b76d60db420a1f5"
 SRC_URI[sha256sum] = "fcfa5a0e42099e12e4bf7a68ebe6fde05553383a682e816a7ec9256ab4773faa"
 
-inherit autotools-brokensep pkgconfig pythonnative
+inherit autotools-brokensep pkgconfig python3native
 
 PACKAGECONFIG ?= "ncat nping ndiff pcap"
 
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index ea54e75523..058117ed83 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/Datera/lio-utils.git \
 SRCREV = "0ac9091c1ff7a52d5435a4f4449e82637142e06e"
 S = "${WORKDIR}/git"
 
-inherit distutils
+inherit distutils3
 
 EXTRA_OEMAKE += "DESTDIR=${D}"
 
diff --git a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
index 26b4412f52..1ce3c8e442 100644
--- a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
+++ b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
@@ -6,7 +6,7 @@ SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "c267db0ee7a2131ba418399dc17f9e72"
 SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707b5c2ece28df772f2155fd044b9bb1614284"
 
-inherit python-dir gettext
+inherit python3-dir gettext
 DEPENDS += "intltool-native gettext-native"
 
 EXTRA_OEMAKE = " \
diff --git a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
index 342fccf413..252eea3665 100644
--- a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
+++ b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f489
 
 S = "${WORKDIR}/cxxtest-${PV}/python"
 
-inherit distutils
+inherit distutils3
 
 do_install_append() {
     install -d ${D}${includedir}
-- 
2.25.0


