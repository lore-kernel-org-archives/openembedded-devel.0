Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCF676BF6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:28:29 +0000 (UTC)
Received: from dastp.fritz.box ([79.250.183.143]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0MDhny-1ZWapf1Pn4-00H4AU;
	Mon, 24 Aug 2015 17:28:29 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:27:56 +0200
Message-Id: <1440430077-551-8-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
References: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:/VJ+8WT7/mRNhQh1S3yB5z+cjH4vK9R/BYyBwaMCzVo/Y14vqP4
	6uy/W/Uc3QHt9ytgG86mQIPIiWauIinBCjxlysbHOJWrPdOD+nq3TSHZ3MJuFOR58/tLsuX
	h/2OqYq18BqmEDCyGxYKiGQz/YINFucYOPYVyhAe473XPupx5ALDSMW1hE1WoIBvkcQgKBb
	za1mN1zKfTnWSnSvl8tGA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:3n9qOIblOgA=:1Qi5DlPOnfCGdoVr/Fk4Vq
	OKVPvRxGBI1LKJ87QAzThmDHwMEesF0QxIv4WjXCbFDM6D7z6lyOu1+rl5ZBdeozA8ByEDZAz
	qynhoLn+GRscQNo9ojnHN34eZVk9nHLvZRphVHxN2Sxduao2xNMYtApsDoNjESiORKegfWPjI
	GbKmVuM25SqZIRjtnaDcGvLY34p0bYznmtaeOBG3oRlNeCBxNMtk7JT8F+Hvop9fe8nEH6php
	ZUfHKxqY0etAGzfKLYcDctgD/2qWPrQ8X47h/ljga9JxMwWrRvkHZIerFa73ZeYdXXSHW0br2
	5aIx17MTquUOSMqXr5Dm6C7ChmMFHKrNX8C5w1Fu7tK+UXFIc1IA4OpDM+E1tZMpqZkN1w/6l
	3OC31krCMnonY2QedMpbxaL3TjERNzcnFGbTKFq47Bi8zEFMOVSzUmrScHcHO8KMYtX+9BE+Y
	S3tYL11qn5gjNM2Rhy1O7r2ydbbtf2cTlfhyaIVq+ZFZ0CoBFRV6hM7ec2ab7p3R9HDxRWRk0
	GCoT9mz1wVRilu4NWbizSRDpKK/8/3WwRxBBhxLRPGSr9z0FSQneiMJmQucm5l3PmjDVLjYfT
	Z4KGjCMW0CFOD0Q0EQJbrGxd2qTy+E3pG4/B9pVuXrbNu/hILeEdWmMJ3CInLdkLxDku9Ik9o
	9vmKeoTjd3doejEqos3t4lC0nOT2EPUOFp7Ucw23puJgNipAzQz58C67eulJBCw/2Z1VGs580
	IQ/Nq9vkH86a8edxUDonFjXRam5cDZpKCIyxXw==
Subject: [meta-python][PATCH 7/8] python3-pyserial: Add new recipe
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

Use a common .inc file for the python-pyserial and python3-pyserial
recipes.
Remove ${bindir}/miniterm.py from the Python 3 version of the package.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../recipes-devtools/python/python-pyserial.inc     | 19 +++++++++++++++++++
 .../recipes-devtools/python/python-pyserial_2.7.bb  | 21 +--------------------
 .../recipes-devtools/python/python3-pyserial_2.7.bb |  7 +++++++
 3 files changed, 27 insertions(+), 20 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyserial.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyserial_2.7.bb

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
new file mode 100644
index 0000000..0fd6747
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -0,0 +1,19 @@
+SUMMARY = "Serial Port Support for Python"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c557c64905dac5b725980b9505bf8d7b"
+SRCNAME = "pyserial"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+# FIXME might stop packaging serialwin32 and serialjava files
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-stringold \
+"
+
+SRC_URI[md5sum] = "794506184df83ef2290de0d18803dd11"
+SRC_URI[sha256sum] = "3542ec0838793e61d6224e27ff05e8ce4ba5a5c5cc4ec5c6a3e8d49247985477"
diff --git a/meta-python/recipes-devtools/python/python-pyserial_2.7.bb b/meta-python/recipes-devtools/python/python-pyserial_2.7.bb
index 276db34..ad2b350 100644
--- a/meta-python/recipes-devtools/python/python-pyserial_2.7.bb
+++ b/meta-python/recipes-devtools/python/python-pyserial_2.7.bb
@@ -1,21 +1,2 @@
-SUMMARY = "Serial Port Support for Python"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c557c64905dac5b725980b9505bf8d7b"
-SRCNAME = "pyserial"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 inherit setuptools
-
-# FIXME might stop packaging serialwin32 and serialjava files
-
-RDEPENDS_${PN} = "\
-    python-fcntl \
-    python-io \
-    python-stringold \
-"
-
-SRC_URI[md5sum] = "794506184df83ef2290de0d18803dd11"
-SRC_URI[sha256sum] = "3542ec0838793e61d6224e27ff05e8ce4ba5a5c5cc4ec5c6a3e8d49247985477"
+require python-pyserial.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_2.7.bb b/meta-python/recipes-devtools/python/python3-pyserial_2.7.bb
new file mode 100644
index 0000000..17ed3f8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyserial_2.7.bb
@@ -0,0 +1,7 @@
+inherit setuptools3
+require python-pyserial.inc
+
+do_install_append() {
+    rm -f ${D}${bindir}/miniterm.py
+    rmdir ${D}${bindir}
+}
-- 
2.5.0


