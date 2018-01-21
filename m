Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2039E7875B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:24 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c2so15147771qtn.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=01GpM2cbFQnnsOkPthhpiLtExp7yE0/ESTnLGSV0k+Y=;
	b=YN7mzm6iqwJPTynBkjsmzJsDyxdYH89nY71ipkizM8yRKv9QQL2NqQeQZMW8kZMsdw
	nQ4RJVEDu1MPzJT45kSPcx03mZUcUixbVAUjibF1Y+A6aYpDDGoxrv1k+WzHIrA968EF
	Y7lqhb6WCPqyRNvhQzfQcduWs2+CubINskc9sH+/JpRWKkvNwoCyWVMJ8GP041EoNOvM
	Dqn0i2HkUJXyFZgKBlIdyi8hqEh8D1i5QBvuiCUs5jzjcOPY2hxw/fIiddg7HN/7H6Ty
	8zxqvohLJAv32dOFg53Nfzl76hww/anFqakT+D9YDyNHam0Ir8ymqRika9xqp8QgBha6
	WW2Q==
X-Gm-Message-State: AKwxytfERnzj33PYoaZ4IaIfOIAEUEjYBjk7Y8E5YL+0aJUSE7LVa1ts
	nMA/VyjYIyaH28gFA7x4bV2nEQZI
X-Google-Smtp-Source: AH8x224mLn/yOXtdY+3mQSfWURUm5nzEvb+0MK2WckL0/2/r2NUhBZladI+YvJAVupwoajqpxqaepA==
X-Received: by 10.55.42.21 with SMTP id q21mr6184078qkh.282.1516551685206;
	Sun, 21 Jan 2018 08:21:25 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:32 -0500
Message-Id: <1516551637-32255-6-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 05/10] Remove deprecated ${PYTHON_PN}-importlib from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:24 -0000

The ${PYTHON_PN}-importlib package was removed as part of the migration to the
json manifest file.  The functionality is now part of core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python-astroid_1.6.0.bb   | 1 -
 meta-python/recipes-devtools/python/python-behave_1.2.5.bb    | 2 +-
 meta-python/recipes-devtools/python/python-can.inc            | 1 -
 meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb | 1 -
 meta-python/recipes-devtools/python/python-django.inc         | 1 -
 meta-python/recipes-devtools/python/python-pandas_0.22.0.bb   | 1 -
 meta-python/recipes-devtools/python/python-pyroute2.inc       | 1 -
 meta-python/recipes-devtools/python/python-pyserial_3.4.bb    | 2 +-
 9 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
index 9d2e165..7ddf4e5 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
@@ -26,7 +26,7 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF = "--disable-cairo --with-python=${PYTHON}"
 
-RDEPENDS_${PN} += "python-setuptools python-importlib"
+RDEPENDS_${PN} += "python-setuptools"
 RDEPENDS_${PN}_class-native = ""
 
 do_install_append() {
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
index 42208bc..fd98630 100644
--- a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
@@ -4,7 +4,6 @@ require python-astroid.inc
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-enum34 \
     ${PYTHON_PN}-backports-functools-lru-cache \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-re \
     ${PYTHON_PN}-singledispatch \
 "
diff --git a/meta-python/recipes-devtools/python/python-behave_1.2.5.bb b/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
index 541a79d..3db2016 100644
--- a/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
 SRC_URI[md5sum] = "3af4bc2886d2be982e41bfaba61da3bc"
 SRC_URI[sha256sum] = "81b731ac5187e31e4aad2594944fa914943683a9818320846d037c5ebd6d5d0b"
 
-RDEPENDS_${PN} += "python-difflib python-setuptools python-pkgutil python-misc python-argparse python-xml python-importlib python-enum34 python-parse python-parse-type python-six"
+RDEPENDS_${PN} += "python-difflib python-setuptools python-pkgutil python-misc python-argparse python-xml python-enum34 python-parse python-parse-type python-six"
 
 inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index 8cdd4d3..2b15af4 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -10,7 +10,6 @@ PYPI_PACKAGE="python-can"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netserver \
diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb b/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
index fb8c0aa..ec8c54a 100644
--- a/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
+++ b/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
@@ -20,7 +20,6 @@ inherit pypi setuptools
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-dbus \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-pygobject \
     ${PYTHON_PN}-xml \
     "
diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 9287715..3602a74 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -19,7 +19,6 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-html \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-multiprocessing \
     ${PYTHON_PN}-netserver \
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb b/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
index 355074c..b3bfab9 100644
--- a/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
@@ -4,5 +4,4 @@ require python-pandas.inc
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-future \
     ${PYTHON_PN}-json \
-    ${PYTHON_PN}-importlib \
 "
diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
index f63ccbd..24e3555 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -13,7 +13,6 @@ inherit pypi
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-distutils \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-multiprocessing \
diff --git a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb b/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
index 0497087..fd852a2 100644
--- a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
+++ b/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
@@ -1,4 +1,4 @@
 inherit setuptools
 require python-pyserial.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-argparse ${PYTHON_PN}-importlib"
+RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
-- 
2.7.4


