Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id CA72B71AAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 18:18:40 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n21so218594050qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 10:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xEtZq5DSj3gwEM+wjFTc/jadz61ACS1HkQp1HZ8Qv7c=;
	b=ivxyQN6oeK7YYB9WABQ+f4ctn/GEAoBf6IcIeu0wddyQo6WtEVeKf+2b5vuD1ky0SM
	TsH6BG/Go6i0uXqJmoTrLMGHRXnzbVunTPKk+3uXTX4Cg9m5xqhlmlJoO1NBgndiDvLK
	3wgjxBhO7rGP+9S1XjhV2znnA8uHgQQmJ5mllJX2UbfQHzj9LdKB9SK7cXxxWZwJ7UjH
	0L1DKYkOqXmSxk9+4SKZ8WJ0Yy1Bf1WRUb3sv8srIY1yq0risSH5JU6P95uRksNCI497
	G57KuZlaNeLIwIa2eDmHOQzjxXCFOGHktLUKhLsRhZ6K9DyZrC2lDYmQWxSKPzDFMyux
	gkDA==
X-Gm-Message-State: AKaTC01WIf4vKNGvggFYRToxHCENM+iKoB9uMveBJA3cochGO6tU3eG/jcU/at6yq052gw==
X-Received: by 10.55.49.76 with SMTP id x73mr29151963qkx.188.1480529921923;
	Wed, 30 Nov 2016 10:18:41 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	d15sm33890614qkb.10.2016.11.30.10.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 10:18:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:18:31 -0500
Message-Id: <1480529911-21805-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-six: remove recipe that was pulled into oe-core
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
X-List-Received-Date: Wed, 30 Nov 2016 18:18:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-six.inc     | 18 ------------------
 .../recipes-devtools/python/python-six_1.10.0.bb       |  2 --
 .../recipes-devtools/python/python3-six_1.10.0.bb      |  2 --
 3 files changed, 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-six.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-six_1.10.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-six_1.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
deleted file mode 100644
index e33c01d..0000000
--- a/meta-python/recipes-devtools/python/python-six.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Python 2 and 3 compatibility library"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
-
-SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
-SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
-
-do_compile_append() {
-    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
-}
-do_install_append() {
-    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
-}
-
-RDEPENDS_${PN} += "${PYTHON_PN}-io"
-
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta-python/recipes-devtools/python/python-six_1.10.0.bb b/meta-python/recipes-devtools/python/python-six_1.10.0.bb
deleted file mode 100644
index 9075745..0000000
--- a/meta-python/recipes-devtools/python/python-six_1.10.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-six.inc
diff --git a/meta-python/recipes-devtools/python/python3-six_1.10.0.bb b/meta-python/recipes-devtools/python/python3-six_1.10.0.bb
deleted file mode 100644
index 7f76157..0000000
--- a/meta-python/recipes-devtools/python/python3-six_1.10.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-six.inc
-- 
2.7.4


