Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA0F60273
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:22:08 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id a22so7574711oid.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zhU26Ym6KdIgE0yp+t6xOpaVjmd3craU8UHtplkzvBQ=;
	b=lXKjA0JelO2m6ZR3uBUZmP8SDfq2xTIw3/ai+UJiSyKIxWzjTcD9dhUpErst08fLqR
	z2PouzUE3h4dOVIo6QZO0wmdCCQdsR8jUT82/AF4FKd7fmIeAgWGHkZjsumaTkigSn9C
	bgp8neQd0U4dtyy+0pnrwy/ZMyZfDyQtjtNFtl078+gq18ERRJq7axVdWfm0126qlWS5
	bDB3RGI5bfDV+wgqQ7ImF0inKYhyfS51BJ8izeq/+Jr7125NIK1QZ3Ep40IrYIQ4xL7H
	L/u7xpI9FRveNdQl/RTkxZ+8zS0jcKzCJWvT6zchP1h/LU80/tM0zNdDjoz1bwfXWSas
	XNRg==
X-Gm-Message-State: APjAAAWzMaikVKTb9JqwlYxFqwAFk0DSjoZu3catO4ulGW3Ixq9b3WuN
	TGUUENe6Np0vIWW5UT93cgV5ZKpugS0=
X-Google-Smtp-Source: APXvYqzKf4YlQfb/BJAmBN0AyUcbVtYgXMvFtDJPmP94IPYQRzN4eY3Qp8xbUuRBJl/ECSywl7zZaA==
X-Received: by 2002:aca:1005:: with SMTP id 5mr9287938oiq.16.1581294129302;
	Sun, 09 Feb 2020 16:22:09 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	m69sm3834311otc.78.2020.02.09.16.22.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:22:08 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:21:54 -0500
Message-Id: <20200210002154.7090-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-asn1crypto: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:22:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-asn1crypto.inc              | 23 -------------------
 .../python/python3-asn1crypto_1.3.0.bb        | 22 ++++++++++++++++--
 2 files changed, 20 insertions(+), 25 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-asn1crypto.inc

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
deleted file mode 100644
index de6e1a55bb..0000000000
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 structures"
-HOMEPAGE = "https://github.com/wbond/asn1crypto"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
-
-PYPI_PACKAGE = "asn1crypto"
-
-SRC_URI[md5sum] = "daad112940181917e3ff169b47b9bd9a"
-SRC_URI[sha256sum] = "5a215cb8dc12f892244e3a113fe05397ee23c5c4ca7a69cd6e69811755efc42d"
-
-inherit pypi
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netclient \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
index cfbe57520c..1b03c666a4 100644
--- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
@@ -1,6 +1,24 @@
-inherit setuptools3
-require python-asn1crypto.inc
+DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 structures"
+HOMEPAGE = "https://github.com/wbond/asn1crypto"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
+
+PYPI_PACKAGE = "asn1crypto"
+
+SRC_URI[md5sum] = "daad112940181917e3ff169b47b9bd9a"
+SRC_URI[sha256sum] = "5a215cb8dc12f892244e3a113fe05397ee23c5c4ca7a69cd6e69811755efc42d"
+
+inherit pypi setuptools3
 
 RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-shell \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


