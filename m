Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by mail.openembedded.org (Postfix) with ESMTP id 6806D76BF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:28:29 +0000 (UTC)
Received: from dastp.fritz.box ([79.250.183.143]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0MGj8j-1ZXyHN3jEn-00DVOv;
	Mon, 24 Aug 2015 17:28:28 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:27:54 +0200
Message-Id: <1440430077-551-6-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
References: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:eyw1N/5Loij4k6UTMXAxFTK13jXb+V43F18uJal8owHM1gus7h/
	BCnTqdhAxSksrppRLPpgH9yMF+zHKbyVgFzB9w6L6jWLah3WVZnn4DfEToKSlB9amItJtvq
	11GAp8SM7xKe47MZf57W0wUUtRRb2TErMYAfgZsrKrfJqEh2OSz7dRD4rsHNqcoVJWmgHdT
	pxYNYU4oVl3+JrW6Bd2yw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:wnpMjtsCcyA=:qtJwCh7sgcSm8MNy3wjOwW
	EwldtBtAysBQ1L3k92N2BelewkA8M9Kb+pQKQGNcdCAN8ro4ZiprFg1bXl8R/ImRsPmOvRxQ6
	LNf7amOy8dN+K3c2N0Vank+Ga+Rof5/Ng0K01M/Bc98PEDFas/86ojIX9/x/8lQxe+dxP016q
	wI6qGx60iigD8V8HPzzaMwykitSfy92tZ2PlnEitjEgWAAg9MkmtgSkGgoUrsLo9/iTot4Lk1
	HajC72Ahyx6VmibO1ayanqO1lYpGPVGRqzQd3dxmTwi0QvzebFyO56EUs9t82Txl2FQGEYbE6
	0PSPA1nVj+v82do5nrTV84lp/pbpuirYGtaeymVkPcli7zXejuNkZZ7yJSrxoAqdgpVDk9IYH
	pUedKfttfnoYqRi8dxhTZGRuYCeOczV6O4APQDY9Uq9u1HUltJHIEBdYvS9IyO4spVlBioxKD
	aj/rBv1cm0mhqQ2nyGNWs5wx6Qych+ZVUk8VP3+4mCJLlQwFrIRofjB7OZYorDUF2wgeCS5HM
	4SQh9zazyFYl+FVRVKGdfvjYIqpMPnO8v2LW4a1BheiGO+aeGSg2lRhQwRMySgPKhkJHJ/o9o
	sf50jT2NgRzJMJajQPWplIa0qrOrGmujJJ4/lCR9nZzv59EEQvOpx0wlmGgegn8TMumlzTUVq
	5qjM+OZYVl6elKnoOecMoEclJeTFaXc8w+Ka1t/07YncFDs9ucxL/jtz5cubq2GuT08yaG46e
	ujoqil7/dYAeLcJvHiCb1S60LgqtKelOlhmN+Q==
Subject: [meta-python][PATCH 5/8] python3-cython: Add new recipe
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
X-List-Received-Date: Mon, 24 Aug 2015 15:28:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use a common .inc file for the python-cython and python3-cython recipes.
Add suffix '3' to scripts in ${bindir} to avoid conflict between the two
packages.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../recipes-devtools/python/python-cython.inc       | 21 +++++++++++++++++++++
 .../recipes-devtools/python/python-cython_0.23.1.bb | 20 +-------------------
 .../python/python3-cython_0.23.1.bb                 | 18 ++++++++++++++++++
 3 files changed, 40 insertions(+), 19 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-cython.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-cython_0.23.1.bb

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
new file mode 100644
index 0000000..6c8b084
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "Cython is a language specially designed for writing Python extension modules. \
+It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
+and the messy, low-level world of C."
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
+SRCNAME = "Cython"
+BBCLASSEXTEND = "native"
+
+SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "db3c5b365e1c3f71c7cd90e96473a3ab"
+SRC_URI[sha256sum] = "bdfd12d6a2a2e34b9a1bbc1af5a772cabdeedc3851703d249a52dcda8378018a"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-shell \
+"
+RDEPENDS_${PN}_class-native = ""
diff --git a/meta-python/recipes-devtools/python/python-cython_0.23.1.bb b/meta-python/recipes-devtools/python/python-cython_0.23.1.bb
index a0babc8..6be0b1e 100644
--- a/meta-python/recipes-devtools/python/python-cython_0.23.1.bb
+++ b/meta-python/recipes-devtools/python/python-cython_0.23.1.bb
@@ -1,24 +1,6 @@
-DESCRIPTION = "Cython is a language specially designed for writing Python extension modules. \
-It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
-and the messy, low-level world of C."
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
-SRCNAME = "Cython"
-BBCLASSEXTEND = "native"
-
-SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-SRC_URI[md5sum] = "db3c5b365e1c3f71c7cd90e96473a3ab"
-SRC_URI[sha256sum] = "bdfd12d6a2a2e34b9a1bbc1af5a772cabdeedc3851703d249a52dcda8378018a"
-
 inherit setuptools
+require python-cython.inc
 
 RDEPENDS_${PN} += "\
     python-distribute \
-    python-netserver \
-    python-subprocess \
-    python-shell \
 "
-RDEPENDS_${PN}_class-native = ""
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.23.1.bb b/meta-python/recipes-devtools/python/python3-cython_0.23.1.bb
new file mode 100644
index 0000000..2ce6bdb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cython_0.23.1.bb
@@ -0,0 +1,18 @@
+inherit setuptools3
+require python-cython.inc
+
+RDEPENDS_${PN} += "\
+    python3-setuptools \
+"
+
+# running build_ext a second time during install fails, because Python
+# would then attempt to import cythonized modules built for the target
+# architecture.
+DISTUTILS_INSTALL_ARGS += "--skip-build"
+
+do_install_append() {
+    # rename scripts that would conflict with the Python 2 build of Cython
+    mv ${D}${bindir}/cython ${D}${bindir}/cython3
+    mv ${D}${bindir}/cythonize ${D}${bindir}/cythonize3
+    mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
+}
-- 
2.5.0


