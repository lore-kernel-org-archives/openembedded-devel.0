Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 92A436FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 19:06:55 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u25so4197253qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KrcZBIVcq3vfj2Xx4WhqMlWCZK7Qd3jZ3mHLIxKQyT4=;
	b=i74k4BPeBHBM1al6UuMKDXTr8sWmBiHe9B+Mg4ndL6c5T7iJdIrQkLm8HQ2l9OGJW0
	P3xwAhHDjYolPhPOcgEmJV4drk1fBCDhNPbJxacQppaOK+N1xpr7zE3JEVvyct2gzetv
	cgU69v8ZMtuMSRQ+G+TPdU65NEBOfMdaSdKFs9SbU09uEuoE5n+yJ20mUuszDkJUvbcu
	7aecpMzhfl9INwn0fxZ1zVlESg2b1LPqrsxa29cQT44V0PEGk0LXYXNDtNZbHvREzLiI
	Yym/yn1J7lfGErURi1kLtKmIXnq+Vxc857aG7J+9e4dCqL4KIoTkRPCQoEyCLTXw4iNo
	zEkA==
X-Gm-Message-State: ALyK8tIr0el4Hxy40pXyi4jjfS2EiE4w63YVPSkkCrvyhQifz/7+JPwp/ic77x76Ys7pPA==
X-Received: by 10.200.50.167 with SMTP id z36mr23461081qta.6.1468609615372;
	Fri, 15 Jul 2016 12:06:55 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id p2sm2765239qta.15.2016.07.15.12.06.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jul 2016 12:06:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:06:47 -0400
Message-Id: <1468609607-21002-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-django: update to version 1.9.7 and add the required RDEPENDS
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
X-List-Received-Date: Fri, 15 Jul 2016 19:06:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-django_1.8.8.bb | 14 -------------
 .../recipes-devtools/python/python-django_1.9.7.bb | 24 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-django_1.8.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python-django_1.9.7.bb

diff --git a/meta-python/recipes-devtools/python/python-django_1.8.8.bb b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
deleted file mode 100644
index e56c555..0000000
--- a/meta-python/recipes-devtools/python/python-django_1.8.8.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A high-level Python Web framework"
-HOMEPAGE = "http://www.djangoproject.com/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
-
-SRC_URI[md5sum] = "08ecf83b7e9d064ed7e3981ddc3a8a15"
-SRC_URI[sha256sum] = "8255242fa0d9e0bf331259a6bdb81364933acbe8863291661558ffdb2fc9ed70"
-
-PYPI_PACKAGE = "Django"
-inherit pypi setuptools
-
-FILES_${PN} += "${datadir}/django"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-django_1.9.7.bb b/meta-python/recipes-devtools/python/python-django_1.9.7.bb
new file mode 100644
index 0000000..8693da8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-django_1.9.7.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A high-level Python Web framework"
+HOMEPAGE = "http://www.djangoproject.com/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
+
+SRC_URI[md5sum] = "7de9ba83bfe01f4b7d45645c1b259c83"
+SRC_URI[sha256sum] = "2b29e81c8c32b3c0d9a0119217416887c480d927ae2630bada2da83078c93bf6"
+
+PYPI_PACKAGE = "Django"
+inherit pypi setuptools
+
+FILES_${PN} += "${datadir}/django"
+
+BBCLASSEXTEND = "nativesdk"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-importlib \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pip \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
+    "
-- 
1.9.1


