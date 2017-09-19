Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 133C177EA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 18:17:50 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id q4so493285qtq.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 11:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rgnuVtDzXD4+GtORvrtlxhLXqdf97QChvHyYmntGkDc=;
	b=VqqNO4uvGNFPPYr9U/zqkQzjKN1fhR9oKYLWYMlk/WjazhkmEy7BcAOW9rMFHXWQwQ
	FJAhuQfKCbHMmfOEMsdsbJfTHVfB2CbVRBz99Eduz0koMI2+tXXGKbSQA/5JZBKN4IcW
	NXwt+sSpjnBan4TWVxD6eEbB/e8ZujGLLOBx/s8r46NF51LmV47GEiobJnXZ7kmF0OFr
	2Wa4CMW1sb0acaDvCJJxdsP5859omiWW3DWqtfFXSHjnpWztMeMJitq659djdhV139Ml
	NQxobKQLWZU/KkpY4sm2sx8RAquk/8dlpQhQRYsblNqs6ojTmNYreByV5Rh1B8BtB5ZY
	GyCw==
X-Gm-Message-State: AHPjjUhuvwdEYWPo8r6ING/SRUHcpBEWop04MpY7YeED63WickPtVT/b
	eSfbjkbgaMqME4F1+S8hvQJJ4OfB
X-Google-Smtp-Source: AOwi7QBROQn07uugCxt3+/cQumLzpXmYMgNckW3raAXwkQvf0MCdfaGz+xcrGv3KqRyeBewL6f0jZw==
X-Received: by 10.200.53.200 with SMTP id l8mr3689208qtb.334.1505845071510;
	Tue, 19 Sep 2017 11:17:51 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	x124sm7194971qka.85.2017.09.19.11.17.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 11:17:50 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 14:17:45 -0400
Message-Id: <1505845065-15217-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-twisted: update version to 17.5.0
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
X-List-Received-Date: Tue, 19 Sep 2017 18:17:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-twisted.inc     | 15 ++++-
 ...-twisted_13.2.0.bb => python-twisted_17.5.0.bb} |  0
 .../0001-initsendmsg-Return-NULL-on-error.patch    | 76 ----------------------
 ...twisted_13.2.0.bb => python3-twisted_17.5.0.bb} |  3 -
 4 files changed, 12 insertions(+), 82 deletions(-)
 rename meta-python/recipes-devtools/python/{python-twisted_13.2.0.bb => python-twisted_17.5.0.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-twisted/0001-initsendmsg-Return-NULL-on-error.patch
 rename meta-python/recipes-devtools/python/{python3-twisted_13.2.0.bb => python3-twisted_17.5.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index d734e03..bdb3c60 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -5,10 +5,10 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5602d7228daf59a16f0f1b2640c46bca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8a9c2fbfcba7d70504e3ba545e1820ed"
 
-SRC_URI[md5sum] = "83fe6c0c911cc1602dbffb036be0ba79"
-SRC_URI[sha256sum] = "095175638c019ac7c0604f4c291724a16ff1acd062e181b01293bf4dcbc62cf3"
+SRC_URI[md5sum] = "cd5c287802dcbaf7be15cf937c922b71"
+SRC_URI[sha256sum] = "f198a494f0df2482f7c5f99d7f3eef33d22763ffc76641b36fec476b878002ea"
 
 PYPI_PACKAGE = "Twisted"
 PYPI_PACKAGE_EXT = "tar.bz2"
@@ -72,12 +72,14 @@ FILES_${PN} = ""
 FILES_${PN}-test = " \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy/test/ \
 "
 
 FILES_${PN}-protocols = " \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy \
 "
 
 FILES_${PN}-zsh = " \
@@ -180,6 +182,9 @@ ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
 ${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
 "
 
 FILES_${PN}-lore = " \
@@ -236,6 +241,10 @@ ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
 "
 
+FILES_${PN}-doc += " \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_pydoctortemplates/ \
+"
+
 RDEPENDS_{PN}-src = "${PN}"
 FILES_${PN}-src = " \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
diff --git a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python-twisted_17.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
rename to meta-python/recipes-devtools/python/python-twisted_17.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-twisted/0001-initsendmsg-Return-NULL-on-error.patch b/meta-python/recipes-devtools/python/python3-twisted/0001-initsendmsg-Return-NULL-on-error.patch
deleted file mode 100644
index d4cf345..0000000
--- a/meta-python/recipes-devtools/python/python3-twisted/0001-initsendmsg-Return-NULL-on-error.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 890d039f067d52a0ab77b561d40da13f0c135634 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 3 Aug 2017 11:24:43 -0700
-Subject: [PATCH] initsendmsg: Return NULL on error
-
-Fixes a clang error
-
-sendmsg.c:129:9: error: non-void function 'initsendmsg' should return a value [-Wreturn-type]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- twisted/python/sendmsg.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/twisted/python/sendmsg.c b/twisted/python/sendmsg.c
-index 9f2fd8c..9c080e1 100644
---- a/twisted/python/sendmsg.c
-+++ b/twisted/python/sendmsg.c
-@@ -126,7 +126,7 @@ PyMODINIT_FUNC initsendmsg(void) {
-     module = Py_InitModule3("sendmsg", sendmsg_methods, sendmsg_doc);
- 
-     if (!module) {
--        return;
-+        return NULL;
-     }
- 
-     /*
-@@ -135,39 +135,39 @@ PyMODINIT_FUNC initsendmsg(void) {
-     */
- 
-     if (-1 == PyModule_AddIntConstant(module, "SCM_RIGHTS", SCM_RIGHTS)) {
--        return;
-+        return NULL;
-     }
- 
- 
-     /* BSD, Darwin, Hurd */
- #if defined(SCM_CREDS)
-     if (-1 == PyModule_AddIntConstant(module, "SCM_CREDS", SCM_CREDS)) {
--        return;
-+        return NULL;
-     }
- #endif
- 
-     /* Linux */
- #if defined(SCM_CREDENTIALS)
-     if (-1 == PyModule_AddIntConstant(module, "SCM_CREDENTIALS", SCM_CREDENTIALS)) {
--        return;
-+        return NULL;
-     }
- #endif
- 
-     /* Apparently everywhere, but not standardized. */
- #if defined(SCM_TIMESTAMP)
-     if (-1 == PyModule_AddIntConstant(module, "SCM_TIMESTAMP", SCM_TIMESTAMP)) {
--        return;
-+        return NULL;
-     }
- #endif
- 
-     module = PyImport_ImportModule("socket");
-     if (!module) {
--        return;
-+        return NULL;
-     }
- 
-     sendmsg_socket_error = PyObject_GetAttrString(module, "error");
-     if (!sendmsg_socket_error) {
--        return;
-+        return NULL;
-     }
- }
- 
--- 
-2.13.4
-
diff --git a/meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_17.5.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_17.5.0.bb
index 57406cd..98016cc 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_17.5.0.bb
@@ -1,9 +1,6 @@
 inherit pypi setuptools3
 require python-twisted.inc
 
-SRC_URI += "file://0001-initsendmsg-Return-NULL-on-error.patch \
-           "
-
 RDEPENDS_${PN}-core = "python3-core python3-zopeinterface python3-lang"
 
 FILES_${PN}-core_append += " \
-- 
2.7.4


