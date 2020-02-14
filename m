Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id CC166610EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 22:38:01 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id g64so10646030otb.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=avjwIitMhyq2WXh0Es0swBjgglKyYY7c04UD5DM/WGI=;
	b=VokWK8SjYAgBz+qUGMe7he19PbEqNCDmW9Ws0Uj3K+vABe81PXlVpZ6SK4NddLgvSz
	lqfyEDkrr+pP8IGPREkBo+b6CEX9MrdNBgkKp0YgmGZgYRbJoJ6J+1YtTeBQkdarf7S/
	mYrCpD+BrK/A5uERttlkIJ2hEHz5KDcNm2RtQhEj3UYXdlRz2cHZQchcfKcDYjYmk1qo
	eJVNU4wcAUJ5JvaGrFZYO/yFnqS+yiA1YOlWsuyFqqtp37qBO9nbRVDzAIqkQEKdQA2f
	efLcr47zoXQ4Ve1Q79ElVGNyHvJXrUDFCwOJvsHpkoO9WggFUtEtAyx3e0OPKYvHRAej
	GqXA==
X-Gm-Message-State: APjAAAWhouFMchU9lS3MEnEJmnes2Rga/m52HInJ3ckhHcj5VBQuhNgT
	OswMT6txIJ3RNUUcCwbsfGrHH8DuwWY=
X-Google-Smtp-Source: APXvYqwHh1jeEMRACxMCBugbIk74o6Auuw5DOlP7fl919vvuTFFAwFTEFVgQhyzXR6/+B6TqssQXMA==
X-Received: by 2002:a9d:7305:: with SMTP id e5mr3917706otk.64.1581719882439;
	Fri, 14 Feb 2020 14:38:02 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id l12sm2586316oth.9.2020.02.14.14.38.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 14:38:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:37:51 -0500
Message-Id: <20200214223751.16148-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-cffi: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 22:38:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-cffi.inc   | 17 -----------------
 .../python/python3-cffi_1.13.2.bb             | 19 ++++++++++++++++++-
 2 files changed, 18 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cffi.inc

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
deleted file mode 100644
index a2b0c3bb0c..0000000000
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Foreign Function Interface for Python calling C code"
-HOMEPAGE = "http://cffi.readthedocs.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
-DEPENDS += "libffi ${PYTHON_PN}-pycparser"
-
-SRC_URI[md5sum] = "652203cf99faa254efff7fab23c2f3a2"
-SRC_URI[sha256sum] = "599a1e8ff057ac530c9ad1778293c665cb81a791421f46922d80a86473c13346"
-
-RDEPENDS_${PN}_class-target = " \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-pycparser \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb b/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
index e888084347..6156081126 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
@@ -1,2 +1,19 @@
+SUMMARY = "Foreign Function Interface for Python calling C code"
+HOMEPAGE = "http://cffi.readthedocs.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
+DEPENDS += "libffi ${PYTHON_PN}-pycparser"
+
+SRC_URI[md5sum] = "652203cf99faa254efff7fab23c2f3a2"
+SRC_URI[sha256sum] = "599a1e8ff057ac530c9ad1778293c665cb81a791421f46922d80a86473c13346"
+
 inherit pypi setuptools3
-require python-cffi.inc
+
+RDEPENDS_${PN}_class-target = " \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-pycparser \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


