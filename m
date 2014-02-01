Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 97E976E9AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:18 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so2647121eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=k7Qg+O1XK+3UBJjHsrzBCRH5UDa9jdE7DrZZ2DERtNg=;
	b=lM+GCXplO9XOiLiKgBV1cg2rEYCfAnOLrzUvSGIa9iSu2X1XT+w5Gu542Yxv3y1899
	pIu0xh91KVk9GE8dSoqMmX8s7rJTvsXA2KnplPulrNCHQ9aprxqUlDb9mrNlNGe8IVZ0
	7pApnYGZYrSxB54UU+681lUTnba3hgs/LDHGuxE4WmY4cNYdTR6ttIVUXbYWAxFEDb5V
	OUVIRm3XYlD40unXOxkeZfRGkK1eVKy6OHwb5enl7cTYyQyl+/kBZNHTLXNWwcGzAa8E
	swJWU/93+Fa2DHlV+dGAFWK7HgNY0M3TVdBjBo+ddIKTimdscRQ4TZ6v+BSCR4psWEea
	3DXA==
X-Received: by 10.14.88.131 with SMTP id a3mr483377eef.64.1391240059291;
	Fri, 31 Jan 2014 23:34:19 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id n7sm46204144eef.5.2014.01.31.23.34.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:00 +0100
Message-Id: <c0decce3da364c0459b26ab058c153eb468f8113.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/20] python-efl: update packaging to match old packages
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:19 -0000

* like in efl recipe create packages matching with old separate recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl.inc | 41 +++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

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
-- 
1.8.5.3


