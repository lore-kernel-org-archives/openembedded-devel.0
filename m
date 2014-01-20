Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id C8BF86C8FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 17:42:39 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so3275848ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a+cViTokT4qgDFzfuJm13pxCfXr/nhzHVlh05DAiVBw=;
	b=ubHR4quWqN7u/W+4H/2gjcapT0DdjaVr/+zUrQseUMlw4yJxr1VvY9XD57S4f0OjBK
	lrqIAWWYo0SFHv4uILWXcotq2EZQgKl22JqCBKFHRy1yyQfulCzVrmQWD8Tr6StrwAKw
	MIBIMyEy+EfrE7ax59bET7A0++XgCiArGCEbHLLCsF7ypSxovH5SAokX5Mg6+8Kww5Go
	Y73B5l5Q5lYJ57kBgUnDBYcDDJdg29TSbURGParslzVvoqd96DCXeD6yIDZqWb2y0KBy
	H7MWBqkYShuhoRMdWY1g8o8R4zKlDRvBz45aSGxq7gqqpvKCjgVs4Fn82O5M9Ao/fZ+H
	/10w==
X-Received: by 10.14.204.9 with SMTP id g9mr3440320eeo.82.1390239760411;
	Mon, 20 Jan 2014 09:42:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id i2sm5440645eem.6.2014.01.20.09.42.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 09:42:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2014 18:42:36 +0100
Message-Id: <1390239757-27055-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
	<1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] python-efl: Upgrade to 1.8.1 and update packaging to match old packages
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
X-List-Received-Date: Mon, 20 Jan 2014 17:42:40 -0000

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


