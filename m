Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail.openembedded.org (Postfix) with ESMTP id AC09561145
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:08:28 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id a22so10992012oid.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AiPyhF/ElLCZwGEr5zODbcg1Zt/puDPHFlt0preCbQw=;
	b=L6R3GU7EpghMGr0uLYdrIZ9XhkyiXKLBL7qp52Z9oycIuqrsVr10uUw/RSVa8Z5BBR
	syMW7hQ+rYeXM2ZybTZZ//Vosew8/Gn1YUeg3Xp/dXPe/sv2e4iw2xZbVZKiJ//0jxbz
	NuOsBKMzxFFiGVmTUQc/mxEn0fWru1iW/CtCmN0xjO0PKobJUGcBBStuV9cZqnWvjggm
	DRb1Gate2pWYdiBPj9vlRmXDvXIGgf0HdXHUJxEDUj06NE+V0zDz2PS6eJwO6lrxPNby
	tZbOtYWpRt7+xp1Ywaof2iEqzHLrbbehAkpdwLinbb2VG/vHPx0nL04+u9y1w7oBxWQh
	lWgg==
X-Gm-Message-State: APjAAAW//coguzI/TGSOKZzvlU3cW4zWYcd1CdDDon9Kn3J0G/R39i1j
	08p+4XZ9lLedjIffn+ca0yc6ljzKAEk=
X-Google-Smtp-Source: APXvYqy7sv01FL21/KLGcVpFop/zAExhX0qul/fHgZhMXDILwh0V7BAbfO2GNr7LuDRB/9B/PsaJ7g==
X-Received: by 2002:aca:5dc3:: with SMTP id r186mr3525335oib.137.1581721709476;
	Fri, 14 Feb 2020 15:08:29 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id u3sm2505727ote.50.2020.02.14.15.08.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 15:08:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 18:08:19 -0500
Message-Id: <20200214230819.23318-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH v2] python3-cffi: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 23:08:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-cffi.inc   | 17 -----------------
 .../python/python3-cffi_1.14.0.bb             | 19 ++++++++++++++++++-
 2 files changed, 18 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cffi.inc

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
deleted file mode 100644
index af10c5f36d..0000000000
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Foreign Function Interface for Python calling C code"
-HOMEPAGE = "http://cffi.readthedocs.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
-DEPENDS += "libffi ${PYTHON_PN}-pycparser"
-
-SRC_URI[md5sum] = "74845f8d2b7b583dd9a3574f402edf39"
-SRC_URI[sha256sum] = "2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6"
-
-RDEPENDS_${PN}_class-target = " \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-pycparser \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb
index e888084347..53c8ee2650 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb
@@ -1,2 +1,19 @@
+SUMMARY = "Foreign Function Interface for Python calling C code"
+HOMEPAGE = "http://cffi.readthedocs.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
+DEPENDS += "libffi ${PYTHON_PN}-pycparser"
+
+SRC_URI[md5sum] = "74845f8d2b7b583dd9a3574f402edf39"
+SRC_URI[sha256sum] = "2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6"
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


