Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 45A3F7886B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 17:31:33 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id i1so18239986qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 09:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ik6L8piBgnVUaTsPz8N/SdOSzspEcvzVjePDmEqmAtU=;
	b=VCf0ujhJZfBwnIFbiLkTu+yr0FhF8EAKDh7m1Pj5DsS9hMFI+QLVzAT0moljPwQTUJ
	BGgaPQXCBbY4d3PPeVnB7q8OnZkyccI52M7n6iCCQanj2uKl0GNCFCb55z3YugBSaxE0
	4sdW0z4OZGgjxbPgp1BIEHSbniIri1UMQu5hGj1lvAd4fYSXTp5jFQUCcV5k0TF6t/BD
	stG2m1sZq2myif7Lr5zEqzgZjdu3he4VpROEsOKrKAMFX63XLDcEegsVZBtOCui5lhae
	1bjESpHyBJqIT5tubJ+GgoxhPsNoJxaDF/hSyjpI8uHYFz9VGfe0WOmgz/GVf3LsP7oq
	7FRg==
X-Gm-Message-State: AKwxytdeLp+eLqidxoV0tErhB6EJc9fwL6UQ6C72yNPQoXRdvQHM1hOP
	sRYzhuIfmfpFO6OBfhI7vfMiZyca
X-Google-Smtp-Source: AH8x227bcP21/D3boNUjm3L12zWVzV7BfE9W1C64KE7olarW86+Sodwr66Z3BrSCzQNNAc9te3B3ig==
X-Received: by 10.237.41.163 with SMTP id o32mr47451611qtd.80.1517333494797;
	Tue, 30 Jan 2018 09:31:34 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	r34sm11496929qtd.48.2018.01.30.09.31.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 09:31:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 12:31:29 -0500
Message-Id: <1517333489-20422-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python: remove python3 DEPENDS on python3-misc due to missing _pydecimal.py
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
X-List-Received-Date: Tue, 30 Jan 2018 17:31:34 -0000

Several packages required numbers, but the _pydecimal.py file was incorrectly
placed in the misc package.  The underlying issue has been resolved upstream,
so remove the RDEPENDS here

http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146808.html

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-babel_2.5.3.bb       | 3 ---
 meta-python/recipes-devtools/python/python3-django_1.11.9.bb     | 5 -----
 meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb  | 5 -----
 meta-python/recipes-devtools/python/python3-jinja2_2.10.bb       | 5 -----
 meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb     | 5 -----
 meta-python/recipes-devtools/python/python3-serpent_1.23.bb      | 5 -----
 meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb | 5 -----
 meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb | 3 ---
 meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb      | 5 -----
 9 files changed, 41 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb b/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb
index 05084ac..0715d59 100644
--- a/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb
@@ -1,5 +1,2 @@
 inherit setuptools3
 require python-babel.inc
-
-# Requires _pydecimal.py which is in misc
-RDEPENDS_${PN} += "${PYTHON_PN}-misc"
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.9.bb b/meta-python/recipes-devtools/python/python3-django_1.11.9.bb
index ef77603..e1e38c3 100644
--- a/meta-python/recipes-devtools/python/python3-django_1.11.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_1.11.9.bb
@@ -1,7 +1,2 @@
 require python-django.inc
 inherit setuptools3
-
-# Requires _pydecimal which is in misc
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
index 091eb36..ce4dfdc 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
@@ -1,7 +1,2 @@
 inherit setuptools3
 require python-dnspython.inc
-
-# Requires _pydecimal.py which is in misc
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb
index 8375f8c..61156b6 100644
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb
@@ -1,7 +1,2 @@
 inherit pypi setuptools3
 require python-jinja2.inc
-
-# Requires _pydecimal which is in misc
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
index 415ca9f..5164b18 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
@@ -1,7 +1,2 @@
 inherit pypi setuptools3
 require python-pymongo.inc
-
-# Requires _pydecimal which is in misc
-RDEPENDS_${PYTHON_PN}-bson += " \
-    ${PYTHON_PN}-misc \
-"
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.23.bb b/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
index bc8bfff..1e04def 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
@@ -1,7 +1,2 @@
 inherit setuptools3
 require python-serpent.inc
-
-# Requires _pydecimal which is in misc
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
index d44bc15..38f406c 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
@@ -1,7 +1,2 @@
 inherit setuptools3
 require python-simplejson.inc
-
-# Requires _pydecimal which is in misc
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
index eaa0090..86cf9ed 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
@@ -1,5 +1,2 @@
 inherit setuptools3
 require python-sqlalchemy.inc
-
-# Requires _pydecimal.py which is in misc
-RDEPENDS_${PN} += "${PYTHON_PN}-misc"
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
index 8ad1c17..5d8af30 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
@@ -1,7 +1,2 @@
 inherit pypi setuptools3
 require python-whoosh.inc
-
-# Requires _pydecimal.py which is in misc
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
-- 
2.7.4


