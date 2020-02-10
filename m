Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
	[209.85.167.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0030960E75
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:55:18 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id b18so7692873oie.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:55:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LxGEjUVlH5kG9Oxgalm3Of6UMUtRQEkNdmyn3jgCOn0=;
	b=olsG5ZrDtJ7opZ0DTjLynL9sZ/Fy6qM8R/oj3oF+HpTGeIXIyFGjQbnqJ0Cz6gSbuV
	PEE6r9sbuS0MURvaC0qYj6DKUe/hKeovZ1uzkl+noXPed7tPdn2LdmTVNn/LrWhM8aFM
	QtdjHW8z7LaWY8UEpifB8J7V2z/fHBNw1CKNyPdtEzAGXPSp9BOGz46P/xzrWkXIMoVl
	X1Fuuvv+SCVLd/jOsHiButrAFBbOZi7YVXNXkftRMttwbVbpEr1RLDlkz6CA+p1hmqNN
	u1M/UR7LgnQLwZ6i5kUfpWFTsO1zth6Zj+cWzzidyulVTsxxJfyGVy4Y0be5y9S3aGoB
	Tu3A==
X-Gm-Message-State: APjAAAUP+ba1HxqsTCWoDHjCMhvvyKJ3FBE/5Z0JUEEb3wm1QlPvjgWI
	0lQcFzCDxUSWz5dcjOZQ8QpHzxTVwNg=
X-Google-Smtp-Source: APXvYqxe/f3iRlemR3p2LlEPOI7ka/3xhtvXUyV+0An+B/RWjgNKzXVoe9Pqf3DBDDFzizXfEg6f0w==
X-Received: by 2002:aca:c507:: with SMTP id v7mr9307556oif.157.1581296119651; 
	Sun, 09 Feb 2020 16:55:19 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	z21sm3943373oto.52.2020.02.09.16.55.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:55:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:55:10 -0500
Message-Id: <20200210005510.15298-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-automat: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:55:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-automat.inc                 | 24 -------------------
 ...etup.py-remove-the-dependency-on-m2r.patch |  0
 .../python/python3-automat_0.8.0.bb           | 23 ++++++++++++++++--
 3 files changed, 21 insertions(+), 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-automat.inc
 rename meta-python/recipes-devtools/python/{python-automat => python3-automat}/0001-setup.py-remove-the-dependency-on-m2r.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-automat.inc b/meta-python/recipes-devtools/python/python-automat.inc
deleted file mode 100644
index ec392216e8..0000000000
--- a/meta-python/recipes-devtools/python/python-automat.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Self-service finite-state machines for the programmer on the go"
-HOMEPAGE = "https://github.com/glyph/Automat"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-automat:"
-
-SRC_URI[md5sum] = "47e980a48201a1dabe37fa11f0187013"
-SRC_URI[sha256sum] = "269a09dfb063a3b078983f4976d83f0a0d3e6e7aaf8e27d8df1095e09dc4a484"
-
-PYPI_PACKAGE = "Automat"
-
-inherit pypi
-
-SRC_URI_append = " \
-    file://0001-setup.py-remove-the-dependency-on-m2r.patch \
-"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-RDEPENDS_${PN} += "\
-   ${PYTHON_PN}-attrs \
-   ${PYTHON_PN}-six \
-"
diff --git a/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch b/meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
rename to meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
diff --git a/meta-python/recipes-devtools/python/python3-automat_0.8.0.bb b/meta-python/recipes-devtools/python/python3-automat_0.8.0.bb
index 2c747643ff..f8981bcb19 100644
--- a/meta-python/recipes-devtools/python/python3-automat_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-automat_0.8.0.bb
@@ -1,2 +1,21 @@
-inherit setuptools3
-require python-automat.inc
+DESCRIPTION = "Self-service finite-state machines for the programmer on the go"
+HOMEPAGE = "https://github.com/glyph/Automat"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
+
+SRC_URI[md5sum] = "47e980a48201a1dabe37fa11f0187013"
+SRC_URI[sha256sum] = "269a09dfb063a3b078983f4976d83f0a0d3e6e7aaf8e27d8df1095e09dc4a484"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+SRC_URI_append = " \
+    file://0001-setup.py-remove-the-dependency-on-m2r.patch \
+"
+
+PYPI_PACKAGE = "Automat"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+   ${PYTHON_PN}-attrs \
+   ${PYTHON_PN}-six \
+"
-- 
2.17.1


