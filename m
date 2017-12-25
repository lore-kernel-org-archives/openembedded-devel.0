Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5D90071B27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 18:25:18 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id e2so43282722qti.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 10:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+0WKpe7KKoGvY0e7fprO64ub23qAuuk2RECyoCOC6KY=;
	b=kZYhi8SOAxf2EVXxKASsnauibPJUb7EyiZUQi4nsJbnawuw48eO/MEh8uTK39NLIdd
	BL8/urptDRUNuk2SLlG4AsCfsFs9YmZk62w3aTKdDkYEOhexJPyg/I6PksmKGaf+T4Ew
	APmhFJ8POFmV60j7jp22TeYL7UQLjaYWO96GLtzRK6PiRVT7L/K/RMsz+tx/rGOf6G8A
	Tl/fOm2OdgrzFHAFiojaA8NezUirCTMJ9We7bbm74eCB5+z8Xcp5tctde5ANS5o1brVI
	7r4WNe+cZIANJXK2rvQZZhprhjrVs6zJuOFnjhMjDdLPbEx3ou1vgYML9+Wm9FlQX3yF
	Ye0w==
X-Gm-Message-State: AKGB3mJVGqXO38+dDBD5Mi7hRWE75z0kubBU4jtHpt6uLgVYLsRVM+TE
	o6dYnJpGIUEwJ1AI5CYIE0QQVuws
X-Google-Smtp-Source: ACJfBosCXAsukhHwwRIaG6q6JHrSIg8ncCmCijx7XT5cdnTyLXSOWxSOYlAZ7j6I9gOO4oqCm86cSA==
X-Received: by 10.237.37.89 with SMTP id w25mr31767632qtc.160.1514226319922;
	Mon, 25 Dec 2017 10:25:19 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	k21sm18835246qta.27.2017.12.25.10.25.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Dec 2017 10:25:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Dec 2017 13:25:13 -0500
Message-Id: <1514226313-14562-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask-wtf: update to version 0.14.2
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
X-List-Received-Date: Mon, 25 Dec 2017 18:25:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-flask-wtf.inc   | 13 +++++-----
 .../import-simplejson-as-json.patch                | 28 ----------------------
 ...lask-wtf_0.12.bb => python-flask-wtf_0.14.2.bb} |  0
 ...ask-wtf_0.12.bb => python3-flask-wtf_0.14.2.bb} |  0
 4 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-wtf/import-simplejson-as-json.patch
 rename meta-python/recipes-devtools/python/{python-flask-wtf_0.12.bb => python-flask-wtf_0.14.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_0.12.bb => python3-flask-wtf_0.14.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-wtf.inc b/meta-python/recipes-devtools/python/python-flask-wtf.inc
index 3a959ae..3c90656 100644
--- a/meta-python/recipes-devtools/python/python-flask-wtf.inc
+++ b/meta-python/recipes-devtools/python/python-flask-wtf.inc
@@ -1,16 +1,15 @@
 DESCRIPTION = "Simple integration of Flask and WTForms."
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=507e8635f25a06dc4f041a3a1b3359b3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80"
 
-SRC_URI[md5sum] = "c53a74e8ba481bf53405fd5efdf0339e"
-SRC_URI[sha256sum] = "bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-flask-wtf:"
-SRC_URI += " file://import-simplejson-as-json.patch"
+SRC_URI[md5sum] = "586f50f233926cade42e3d744aca3e8f"
+SRC_URI[sha256sum] = "5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36"
 
 PYPI_PACKAGE = "Flask-WTF"
 
 RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-itsdangerous \
+    ${PYTHON_PN}-json \
     ${PYTHON_PN}-wtforms \
-    ${PYTHON_PN}-simplejson \
 "
diff --git a/meta-python/recipes-devtools/python/python-flask-wtf/import-simplejson-as-json.patch b/meta-python/recipes-devtools/python/python-flask-wtf/import-simplejson-as-json.patch
deleted file mode 100644
index 678f706..0000000
--- a/meta-python/recipes-devtools/python/python-flask-wtf/import-simplejson-as-json.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Subject: [PATCH] import simplejson as json
-
-At runtime python-Flask-WTF tries to import json, but the module is not 
-available, import simplejson as json solve the issue.
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- flask_wtf/recaptcha/validators.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/flask_wtf/recaptcha/validators.py b/flask_wtf/recaptcha/validators.py
-index bcff23d..4a244bb 100644
---- a/flask_wtf/recaptcha/validators.py
-+++ b/flask_wtf/recaptcha/validators.py
-@@ -8,7 +8,7 @@ from flask import request, current_app
- from wtforms import ValidationError
- from werkzeug import url_encode
- from .._compat import to_bytes, to_unicode
--import json
-+import simplejson as json
- 
- RECAPTCHA_VERIFY_SERVER = 'https://www.google.com/recaptcha/api/siteverify'
- RECAPTCHA_ERROR_CODES = {
--- 
-2.1.4
-
diff --git a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb b/meta-python/recipes-devtools/python/python-flask-wtf_0.14.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
rename to meta-python/recipes-devtools/python/python-flask-wtf_0.14.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
-- 
2.7.4


