Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 43DBD77681
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:30:40 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id w33so235870500qtc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 06:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=00M9mFwe/OR1clduCK9GwECdz4EQYOmMs/p7UwpMdJc=;
	b=BfyBoJyUPO6hIz/GuIs5UmxrqaEBKnLhb5up/iiFOanDcFyvm5Kf1mKVm8aMyFiZrC
	swgciTtlJKWA7uc0nWklOv2ya8dn+i800lBYR9RRg9S5ZpK8N5Smy8vWleMKx/9/s75R
	x35wxr5IA9mjO8sZC08Dr/eEKFBvfeNmbiWCXNNxrVYI4TyVkEyzyfoq+YmbJq9rNRfk
	QpLWMm+qdHsptLoG4LzKSwNZDXmPjUcNFRLdlS3jbhgEKPFrv4fNUVK04kGzUv52mxsi
	o/mm9eWfQSDwKQBM/AE7+n41zNy1OaLHWg5EhwqCq24c5y5g+bG2wqSxzvK4ZDjxKUtf
	BVdw==
X-Gm-Message-State: AIkVDXIMU7+lhCKFA5kFIcS2mPcARZl9+tFmQGRpwyqLFr1rMYaEtt/4HPLAQygFnYdchQ==
X-Received: by 10.237.41.129 with SMTP id o1mr9783683qtd.10.1482417042095;
	Thu, 22 Dec 2016 06:30:42 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	z29sm18115323qtz.16.2016.12.22.06.30.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Dec 2016 06:30:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 09:30:32 -0500
Message-Id: <1482417032-7430-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.25.2
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
X-List-Received-Date: Thu, 22 Dec 2016 14:30:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc            | 7 +++----
 meta-python/recipes-devtools/python/python-cython_0.24.1.bb      | 6 ------
 meta-python/recipes-devtools/python/python-cython_0.25.2.bb      | 9 +++++++++
 .../{python3-cython_0.24.1.bb => python3-cython_0.25.2.bb}       | 0
 4 files changed, 12 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cython_0.24.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-cython_0.25.2.bb
 rename meta-python/recipes-devtools/python/{python3-cython_0.24.1.bb => python3-cython_0.25.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index de8a1a9..1ecdcc9 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,14 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "890b494a12951f1d6228c416a5789554"
-SRC_URI[sha256sum] = "84808fda00508757928e1feadcf41c9f78e9a9b7167b6649ab0933b76f75e7b9"
+SRC_URI[md5sum] = "642c81285e1bb833b14ab3f439964086"
+SRC_URI[sha256sum] = "f141d1f9c27a07b5a93f7dc5339472067e2d7140d1c5a9e20112a5665ca60306"
 
 inherit pypi
 
-RDEPENDS_${PN} += "\
+RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-shell \
 "
-RDEPENDS_${PN}_class-native = ""
diff --git a/meta-python/recipes-devtools/python/python-cython_0.24.1.bb b/meta-python/recipes-devtools/python/python-cython_0.24.1.bb
deleted file mode 100644
index 6be0b1e..0000000
--- a/meta-python/recipes-devtools/python/python-cython_0.24.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-cython.inc
-
-RDEPENDS_${PN} += "\
-    python-distribute \
-"
diff --git a/meta-python/recipes-devtools/python/python-cython_0.25.2.bb b/meta-python/recipes-devtools/python/python-cython_0.25.2.bb
new file mode 100644
index 0000000..bdf9490
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cython_0.25.2.bb
@@ -0,0 +1,9 @@
+inherit setuptools
+require python-cython.inc
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Cython/"
+UPSTREAM_CHECK_REGEX = "/Cython/(?P<pver>(\d+[\.\-_]*)+)"
+
+RDEPENDS_${PN} += "\
+    python-distribute \
+"
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.24.1.bb b/meta-python/recipes-devtools/python/python3-cython_0.25.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.24.1.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.25.2.bb
-- 
2.7.4


