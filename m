Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3F063788CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 20:52:02 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id k19so37677968qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 12:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SnHZMAHMIlRKdi4tsIZvENZZwRjL3nRG8v4bXliTeug=;
	b=OzCf+G0wbg9eHPp+nnR2uLd+tELi17M33tzYJeV7RA90SnaF4DjSmKqc6bvh142+vI
	BLhJIBUtC/ZGdVxl+l6gylN+iZVjwoEVGSnyApuYktlbYGDahuaQfd6xSaoA8OItpsVw
	PXDd1KmJGW4EgrY1mUxfadc+82nN675a9m+1w7sjgx9FGkBdrnw4VYrqiEJIwywCAFtK
	inx8x91LBAU9NN4R2wHIjEywvE/j2gFZU/7AeORDyaAKqWEQvUNDyaGjh/LPoW1FGX/m
	OY4vv1nE74Or0kenKwBbT9xEOLXYqlj/DRRn7uyqb8+jpn+q6fbR3xua1JwdTc/AxpnV
	dW2g==
X-Gm-Message-State: AKGB3mLNQeE8zYs5e8m7xox7PyWALbeFP7Vvpxd+M8qG09/KrJQ6gCyp
	uL/QW88rpOKRzMpIQLxapmaWO3x+
X-Google-Smtp-Source: ACJfBotcCEyVsrhKB/pGysSjyfBzhoBd+9u5pOEg02MLB0vXqNUIbs1eeZI7mRcVw+luRdmxKazs8A==
X-Received: by 10.200.63.208 with SMTP id v16mr21616166qtk.249.1513975924010; 
	Fri, 22 Dec 2017 12:52:04 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	h55sm15106037qta.75.2017.12.22.12.52.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 12:52:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Dec 2017 15:51:57 -0500
Message-Id: <1513975917-10491-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-django: update to version 1.11.8
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
X-List-Received-Date: Fri, 22 Dec 2017 20:52:03 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-django.inc  | 18 ++++++++++++++----
 ...python-django_1.11.5.bb => python-django_1.11.8.bb} |  2 ++
 .../recipes-devtools/python/python3-django_1.11.5.bb   |  2 --
 .../recipes-devtools/python/python3-django_1.11.8.bb   |  7 +++++++
 4 files changed, 23 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django_1.11.5.bb => python-django_1.11.8.bb} (53%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_1.11.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_1.11.8.bb

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index e4ed860..fec5379 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "8cef0d42aabacbc414ec4fbbb6056f3c"
-SRC_URI[sha256sum] = "1836878162dfdf865492bacfdff0321e4ee8f1e7d51d93192546000b54982b29"
+SRC_URI[md5sum] = "e8b68d44b87a3de36e13547ec2722af2"
+SRC_URI[sha256sum] = "fed3e79bb5a3a8d5eb054c7a1ec1de229ef3f43335a67821cc3e489e9582f711"
 
 PYPI_PACKAGE = "Django"
 inherit pypi
@@ -14,11 +14,21 @@ FILES_${PN} += "${datadir}/django"
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-html \
     ${PYTHON_PN}-importlib \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pip \
     ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pytz \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
-    "
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-xml \
+"
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.5.bb b/meta-python/recipes-devtools/python/python-django_1.11.8.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python-django_1.11.5.bb
rename to meta-python/recipes-devtools/python/python-django_1.11.8.bb
index ccd7714..ed92c9b 100644
--- a/meta-python/recipes-devtools/python/python-django_1.11.5.bb
+++ b/meta-python/recipes-devtools/python/python-django_1.11.8.bb
@@ -1,2 +1,4 @@
 require python-django.inc
 inherit setuptools
+
+RDEPENDS_${PN} += "${PYTHON_PN}-zlib"
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.5.bb b/meta-python/recipes-devtools/python/python3-django_1.11.5.bb
deleted file mode 100644
index e1e38c3..0000000
--- a/meta-python/recipes-devtools/python/python3-django_1.11.5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-django.inc
-inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.8.bb b/meta-python/recipes-devtools/python/python3-django_1.11.8.bb
new file mode 100644
index 0000000..ef77603
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_1.11.8.bb
@@ -0,0 +1,7 @@
+require python-django.inc
+inherit setuptools3
+
+# Requires _pydecimal which is in misc
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-misc \
+"
-- 
2.7.4


