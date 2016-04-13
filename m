Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id C87E270031
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:17:37 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id f105so4542697qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=pirV5/al+GUMTW8ByQ6nlHlzRPqcHRxL+L8MPCqqX50=;
	b=hnmkZIzNS5tci315+ZQrtixFehDom1A9ueTQXZEYAWYqbHcu/ImyNqce7chJ5X6rIs
	5nXjZOV4RIiRTyAFZNQ5hNFGs+lQFCeCLtGFXxq4vnNUDPNxY8+F4YZCGnik049ISulY
	oaWLm6BI9Us2l6q3HMHcyOLvtFbpb+BzUAEh9swdmg4XIavPIa8BxCp7XcCTqf+n5xak
	PKrRo69OrdkHqS1awXk+EMsO7k7+tsQN4qTKR+WnNgxSMmHoKzTwYBbfVQbeEOIoiIWe
	VQxO1pu2EW4fyRDMoKQKGr8EmPKWp1WAqJM5v1EadjNPb6R/oH4/vGzeYxT9KO6+u8cn
	GdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=pirV5/al+GUMTW8ByQ6nlHlzRPqcHRxL+L8MPCqqX50=;
	b=DbaMmnPZ0UrEKjctZQOIvdgtn1BufmPv5HET+KXcLBz26GoPJXj3d3HogfZYhP9frh
	qMpnEtceoKFkewCdTKAnrxknqlfLFpeN287X7m7wJQsppfluoGGEpYATL+p+X9I7MKGw
	a8xGzFkhTBCm1Z2wv0PSd4T5zrnmmYK70byoJUQ1cjvtaa5WShbjbzd71m1DkCtNG+2h
	85c5D8l2fpHH/vsm6bxbejmE61bOC/NmgX6YiAmonKegGbp23PeN/8xN3kqYEWx9m+Sh
	+IZ3I5ZCGOb8Uch++fdpTl684SFUxGhYtbKpS4VREKeGXwl7r0eyHWc+iR6Md8oyeKHq
	ZYqA==
X-Gm-Message-State: AOPr4FXxvYQzhvTY52RcNhopk7vyFq8L3Ka7lYf1wZRtChWUSkr8San/vTi9GskaO00FnQ==
X-Received: by 10.140.145.83 with SMTP id 80mr11605995qhr.95.1460553458658;
	Wed, 13 Apr 2016 06:17:38 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	s62sm9367206qhe.10.2016.04.13.06.17.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 06:17:37 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:16:58 -0300
Message-Id: <1460553420-12533-7-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 7/9] python-flask-wtf: Add recipe for version 0.12
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
X-List-Received-Date: Wed, 13 Apr 2016 13:17:37 -0000

It's a simple integration of Flask and WTForms.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../import-simplejson-as-json.patch                | 28 ++++++++++++++++++++++
 .../python/python-flask-wtf_0.12.bb                | 17 +++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf/import-simplejson-as-json.patch
 create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-wtf/import-simplejson-as-json.patch b/meta-python/recipes-devtools/python/python-flask-wtf/import-simplejson-as-json.patch
new file mode 100644
index 0000000..678f706
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-wtf/import-simplejson-as-json.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [configuration]
+
+Subject: [PATCH] import simplejson as json
+
+At runtime python-Flask-WTF tries to import json, but the module is not 
+available, import simplejson as json solve the issue.
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ flask_wtf/recaptcha/validators.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/flask_wtf/recaptcha/validators.py b/flask_wtf/recaptcha/validators.py
+index bcff23d..4a244bb 100644
+--- a/flask_wtf/recaptcha/validators.py
++++ b/flask_wtf/recaptcha/validators.py
+@@ -8,7 +8,7 @@ from flask import request, current_app
+ from wtforms import ValidationError
+ from werkzeug import url_encode
+ from .._compat import to_bytes, to_unicode
+-import json
++import simplejson as json
+ 
+ RECAPTCHA_VERIFY_SERVER = 'https://www.google.com/recaptcha/api/siteverify'
+ RECAPTCHA_ERROR_CODES = {
+-- 
+2.1.4
+
diff --git a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
new file mode 100644
index 0000000..79afaf6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Simple integration of Flask and WTForms."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=507e8635f25a06dc4f041a3a1b3359b3"
+
+SRC_URI[md5sum] = "c53a74e8ba481bf53405fd5efdf0339e"
+SRC_URI[sha256sum] = "bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
+
+SRC_URI += " file://import-simplejson-as-json.patch"
+
+PYPI_PACKAGE = "Flask-WTF"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "\
+    python-wtforms \
+    python-simplejson \
+"
-- 
2.1.4


