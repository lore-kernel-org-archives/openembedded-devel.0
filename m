Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id AACC7719D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 17:40:33 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id x190so217399696qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1vtllcd8vwSYiOnXxIibbfSyV1S1Coq6xhS9YmEGdPk=;
	b=h8+O2MEGEcjSYKXBQd3Ky+j9QKLYBDk0XjDTsl8YuDhI7otPZKvWlx1NwQKbp+na6N
	1W//EnObcTada5nsyAEt1YLcPuVBGUiUoBD/qgFhAN/Xx+Gfue/UEmFh6I7ar3IuCBV0
	iZ9QpoMrX9x0UaYsgDRFJXuDHcVjwVIUgKqyV7PwjNqtyAkBVnumJQIr4yON/QUpWshy
	pRcnsxuNCaONNwML1XEHeXOlDgUodvKKcSB5nbzKFZuEtjXUbg/DEOvSVaOGFjYGczV/
	cGc61A75s6ZkB+dMkydUTFOUupdz0PDp566nL5RESR9szYxrbIQHfalCldBXGNkM8Yhq
	ai5w==
X-Gm-Message-State: AKaTC031A5Qoz7i8iR4Fbd8I0kf7Cg67A9mVsDTrl7uEAgxt8iGQ/bfRz0FEKd+0AFvXGw==
X-Received: by 10.55.154.205 with SMTP id c196mr27841293qke.25.1480527634409; 
	Wed, 30 Nov 2016 09:40:34 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	i41sm33976190qtc.18.2016.11.30.09.40.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 09:40:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 12:40:26 -0500
Message-Id: <1480527626-31294-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.0.0
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
X-List-Received-Date: Wed, 30 Nov 2016 17:40:33 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc          | 10 +++++++---
 .../python/{python-psutil_4.2.0.bb => python-psutil_5.0.0.bb}  |  4 ----
 .../{python3-psutil_4.2.0.bb => python3-psutil_5.0.0.bb}       |  4 +---
 3 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_4.2.0.bb => python-psutil_5.0.0.bb} (50%)
 rename meta-python/recipes-devtools/python/{python3-psutil_4.2.0.bb => python3-psutil_5.0.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 33573fc..13f3695 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,9 +2,13 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "713f259f917a0c26acfbb7e6ae632ef7"
-SRC_URI[sha256sum] = "544f013a0aea7199e07e3efe5627f5d4165179a04c66050b234cc3be2eca1ace"
+SRC_URI[md5sum] = "362a03686ce36940d22a548ecb47d7e0"
+SRC_URI[sha256sum] = "5411e22c63168220f4b8cc42fd05ea96f5b5e65e08b93b675ca50653aea482f8"
+
+PYPI_PACKAGE_EXT = "zip"
 
 RDEPENDS_${PN} += " \
-    python-subprocess \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
 "
diff --git a/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb b/meta-python/recipes-devtools/python/python-psutil_5.0.0.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.0.0.bb
index d718011..bf402aa 100644
--- a/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-psutil_5.0.0.bb
@@ -1,6 +1,2 @@
 inherit pypi setuptools
 require python-psutil.inc
-
-RDEPENDS_${PN} += " \
-    python-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python3-psutil_4.2.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.0.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-psutil_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.0.0.bb
index d95332c..c1969ea 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-psutil_5.0.0.bb
@@ -1,6 +1,4 @@
 inherit pypi setuptools3
 require python-psutil.inc
 
-RDEPENDS_${PN} += " \
-    python3-subprocess \
-"
+RDEPENDS_${PN} += "${PYTHON_PN}-netclient"
-- 
2.7.4


