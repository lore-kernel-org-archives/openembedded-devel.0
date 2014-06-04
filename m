Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id C745C6FB3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:18:17 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so8256769wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dCreH/hq4W6bVGrieA7gUNYyMdKwYTnMi2bB3MdhsU8=;
	b=IPTQ1mRJpV8AQeofl79ygPEEz7T+QjVn13v07QsvD8HDGAzVtGKGj1YFEXVGmMr0KR
	W+XsOouaVAmhVR+yb85bOiYbyx+ip0Ex6X7uQ79SR43ZnXrlWm3Al4ATae84l+qjQqSN
	kkaC2+V4QnydWriUvIBRC8quYed4bMgSSmObTT5clVDZJ62slfy66upOhh9NwKGW+/K0
	sCm9KW+0YKoxHs/gAEo1qpQekEKJDvWKFqGr+VIuoc0Tk9xXXhsf3lsAw9R3Sft6/cnz
	NscVDfqrMJ6/YRqnHH//xn9nObtWlTC+M94/PQIdQQfI0DOOTxbi+gz52T/TZ9u3sdNo
	QjAw==
X-Received: by 10.195.18.8 with SMTP id gi8mr2729508wjd.75.1401873498250;
	Wed, 04 Jun 2014 02:18:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id d6sm8572581wiz.4.2014.06.04.02.18.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:18:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 11:18:21 +0200
Message-Id: <1401873504-32120-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/7] python-efl: upgrade to 1.10.0
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
X-List-Received-Date: Wed, 04 Jun 2014 09:18:18 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/60/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl.inc       | 7 ++++++-
 meta-efl/recipes-devtools/python/python-efl_1.10.0.bb | 4 ++++
 meta-efl/recipes-devtools/python/python-efl_1.9.0.bb  | 4 ----
 3 files changed, 10 insertions(+), 5 deletions(-)
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.10.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.9.0.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index 0cfe2a5..9780518 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -31,7 +31,7 @@ do_install_append() {
     find ${D}${libdir}/${PYTHON_DIR}/site-packages -name \*.pyo -o -name \*.pyc | xargs rm -f
 }
 
-PACKAGES += "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas ${PN}-examples"
+PACKAGES += "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas python-ethumb ${PN}-examples"
 
 FILES_${PN} = " \
     ${libdir}/${PYTHON_DIR}/site-packages/python_efl*egg-info \
@@ -47,6 +47,7 @@ FILES_${PN}-examples = "${datadir}/${PN}/examples"
 FILES_python-ecore = " \
     ${libdir}/${PYTHON_DIR}/site-packages/ecore/ \
     ${libdir}/${PYTHON_DIR}/site-packages/efl/ecore.so \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/ecore \
 "
 FILES_python-eldbus = " \
     ${libdir}/${PYTHON_DIR}/site-packages/e_dbus/ \
@@ -68,3 +69,7 @@ FILES_python-evas = " \
     ${libdir}/${PYTHON_DIR}/site-packages/evas/ \
     ${libdir}/${PYTHON_DIR}/site-packages/efl/evas.so \
 "
+FILES_python-ethumb = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/ethumb/ \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/ethumb*so \
+"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.10.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.10.0.bb
new file mode 100644
index 0000000..43f0e0a
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.10.0.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "46166e51bdbab4f2fa790dee98b1ccf5"
+SRC_URI[sha256sum] = "b144e976a351cd9703771b5e91a45ce9b2eedcc0097ade5c5437554b1516dbc6"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.9.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.9.0.bb
deleted file mode 100644
index f34e428..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.9.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "c643d66157cac9b2892af8b6d1a803b1"
-SRC_URI[sha256sum] = "f6d6fecca20df016acc79a12348ae0a0f6db82e6cceaf53c4b46d7ca72bb8f07"
-- 
2.0.0


