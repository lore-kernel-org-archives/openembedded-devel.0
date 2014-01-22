Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id E21366E747
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 11:51:25 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so3344398eae.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 03:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a+cViTokT4qgDFzfuJm13pxCfXr/nhzHVlh05DAiVBw=;
	b=ddPrPMVTm+7bgZBgcRUSLqxHYinT9+H6VAwfDHceaGQtok5On2n6h1Qbxp3/K5bwt4
	sdF2DWXGaYFfOYQbyfqFqIBwrA9g3VyfRIGg+JdQYu/C2WP2JHg8lyP/BsZeKWGfpjNF
	j2S0z83xQKTPbetEMnzdgcGT1BNc3BJO7SA+feNg8ZGPda1OiZopmudOHhfwcpu2XWT9
	0hnIR3iIlUj/27W8IvYUGQkVUAWlredxlMUSTH5lDw/wP+tpgRYJDk1OTeX6hVs2BQHl
	jDhndvtE6C6+0+ZotfnsdpUuHBbe5hImwzqSmd1f4UBaPBzlVBKI90hBIG37lHXqS5Wi
	OLtw==
X-Received: by 10.14.221.193 with SMTP id r41mr1088326eep.92.1390391483043;
	Wed, 22 Jan 2014 03:51:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o13sm26239554eex.19.2014.01.22.03.51.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 03:51:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2014 12:51:16 +0100
Message-Id: <1390391479-22665-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390391479-22665-1-git-send-email-Martin.Jansa@gmail.com>
References: <1390239757-27055-4-git-send-email-Martin.Jansa@gmail.com>
	<1390391479-22665-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCHv2 2/5] python-efl: Upgrade to 1.8.1 and update packaging to match old packages
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
X-List-Received-Date: Wed, 22 Jan 2014 11:51:26 -0000

* announcement:
  http://sourceforge.net/mailarchive/message.php?msg_id=31862842
* like in efl recipe create packages matching with old separate recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl.inc    | 41 ++++++++++++++++++++--
 .../recipes-devtools/python/python-efl_1.8.0.bb    |  4 ---
 .../recipes-devtools/python/python-efl_1.8.1.bb    |  4 +++
 3 files changed, 43 insertions(+), 6 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.8.0.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.8.1.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index c608bac..cca3562 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -12,7 +12,6 @@ DEPENDS = "python-cython-native python-pyrex-native python-numeric eina"
 RDEPENDS_${PN} += "python-lang"
 
 PROVIDES = "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas"
-RPROVIDES_${PN} += "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas"
 
 # necessary to let the call for python-config succeed
 export BUILD_SYS
@@ -27,7 +26,45 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
 
+do_install_append() {
+    # drop all .pyo, pyc files
+    find ${D}${libdir}/${PYTHON_DIR}/site-packages -name \*.pyo -o -name \*.pyc | xargs rm -f
+}
+
+PACKAGES += "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas ${PN}-examples"
+
+FILES_${PN} = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/python_efl*egg-info \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/eo.so \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/utils \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/__init__.py \
+"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*.egg/*/*/.debug"
+FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/site-packages/*/*.la"
 
-PACKAGES += "${PN}-examples"
 FILES_${PN}-examples = "${datadir}/${PN}/examples"
+
+FILES_python-ecore = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/ecore/ \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/ecore.so \
+"
+FILES_python-eldbus = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/e_dbus/ \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/dbus_mainloop.so \
+"
+FILES_python-edje = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/edje/ \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/edje*so \
+"
+FILES_python-elementary = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/elementary/ \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/elementary/ \
+"
+FILES_python-emotion = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/emotion/ \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/emotion.so \
+"
+FILES_python-evas = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/evas/ \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/evas.so \
+"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.8.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.8.0.bb
deleted file mode 100644
index a6ae64e..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.8.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "58a55193caee3c2c74fd962cc17bc9c1"
-SRC_URI[sha256sum] = "8f883c325e30ee3eb2fa38822fa353a22207441b385f4e167cf9c1cf855638f7"
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
-- 
1.8.5.3


