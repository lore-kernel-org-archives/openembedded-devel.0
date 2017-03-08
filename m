Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id D9B70600B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 13:16:13 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id j127so10793137qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 05:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oD1OpopHrcNmZhoSUv1thN3Z9FR1btRYmnCQ0gFywVU=;
	b=NgImCYTJiIwGza69UdryFxm0wvnVcHREJ9T0VEoFxI6S2JvjM7AdpLEm3uvfw9cNVP
	iantQqIvvKR/Bk4jYqzdc/uUYDvSu+Fx/hlZmFicLZPNiZz5v7j4A8SuFwP46w4WCK2l
	SSOx7weRVZhsQaA0Z6i/UZRFEIWzw+AeudODXr2BirSX20EIII/zNFCP9AEYMQvsqaMo
	xtrSlulYYe/udzssxIbadchf2DMzDGfFXaU4t4nEQJylh4Cc4V9+N92QgcW6kGkzyFM5
	K/qZ1C94zdaykGUdSYE/OlWbiHu5fUhEn661J00NPqjxLxbHyALdb81qhF6nk4NnDGpE
	31AQ==
X-Gm-Message-State: AFeK/H0EjL6mpnQCzrhM7YKG64vWLXU8hjbaFAxkwX8imnghBFxVtbXTy0qlLNcxPFVw7Q==
X-Received: by 10.55.68.84 with SMTP id r81mr6914783qka.90.1488978974867;
	Wed, 08 Mar 2017 05:16:14 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	a26sm2074974qtb.28.2017.03.08.05.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 05:16:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Mar 2017 08:16:03 -0500
Message-Id: <1488978964-31526-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-serpent: add a python3 recipe
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
X-List-Received-Date: Wed, 08 Mar 2017 13:16:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-serpent.inc    | 13 +++++++++++++
 .../recipes-devtools/python/python-serpent_1.18.1.bb      | 15 ++-------------
 .../recipes-devtools/python/python3-serpent_1.18.1.bb     |  8 ++++++++
 3 files changed, 23 insertions(+), 13 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-serpent.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-serpent_1.18.1.bb

diff --git a/meta-python/recipes-devtools/python/python-serpent.inc b/meta-python/recipes-devtools/python/python-serpent.inc
new file mode 100644
index 0000000..a1520db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-serpent.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Serialization based on ast.literal_eval"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2669deccb79531c74a5ddd71b45f5095"
+
+SRC_URI[md5sum] = "e2cd7b751274c59b420d4f54db9a49cf"
+SRC_URI[sha256sum] = "9afebb58ac8b827050e1969324388349dc9738b0a03b0d91567b328834a27732"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    "    
diff --git a/meta-python/recipes-devtools/python/python-serpent_1.18.1.bb b/meta-python/recipes-devtools/python/python-serpent_1.18.1.bb
index f18343a..0db3cf9 100644
--- a/meta-python/recipes-devtools/python/python-serpent_1.18.1.bb
+++ b/meta-python/recipes-devtools/python/python-serpent_1.18.1.bb
@@ -1,13 +1,2 @@
-SUMMARY = "Serialization based on ast.literal_eval"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2669deccb79531c74a5ddd71b45f5095"
-
-SRC_URI[md5sum] = "e2cd7b751274c59b420d4f54db9a49cf"
-SRC_URI[sha256sum] = "9afebb58ac8b827050e1969324388349dc9738b0a03b0d91567b328834a27732"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    "    
+inherit setuptools
+require python-serpent.inc
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.18.1.bb b/meta-python/recipes-devtools/python/python3-serpent_1.18.1.bb
new file mode 100644
index 0000000..199dcfa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.18.1.bb
@@ -0,0 +1,8 @@
+inherit setuptools3
+require python-serpent.inc
+
+# Requires _pydecimal which is in misc
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-misc \
+"
-- 
2.7.4


