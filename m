Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id ECB417F9A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 20:29:05 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id w24so5571342otk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 12:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WJaH+Xhb2+PPxfqqXpjlzt7ChPoADSGfGlpZdM5YE+I=;
	b=LYccMBIIiAnP6V7/EtUaOVh+SSH4xwyck75kE5f026fY2HqGq9n8sbtSIMzQrzv5+K
	OelMV1dh1PV5x1z2OqjgU/puTle6IsqkYv29Y6J3+e8k+raic3vee3t80Hgz+jIqLFU3
	NSyoB2xC2VlAH+cW/o50N7bt8uRDvQBktvmy0eyqs+uxeB4qUducVweAePZugIl/I9tX
	rWyOQxMbHU+bWYdrHuzzqDt1AyzgfJoZYJJT605vJ36h0H+iy0o4G5YOXNYrlbG/m/dg
	NBPkmE2BCNhhjYNkQZdOvfPyZHT9iN7F5nSbrAAPACINnpCbuyN9b1sLruepU/ldhg0P
	tFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WJaH+Xhb2+PPxfqqXpjlzt7ChPoADSGfGlpZdM5YE+I=;
	b=Y2U0C+ICHQvSk108srSd0u4LXIINnNlJD/o7vUwjvSNUCZSp6TVlS2ZTZbJc6jaoJS
	OSKyBTt1mxjvmx+h3bEHwvjpUcWvWAL07mlX1wDRFRvaK040KQk67jvvMBf1KTbrkWch
	7k3I8WsmxDd967HSoae9JGahTa5hzpNP1WVwQ5EwlQnbKQoa58APEr0dU6ouEVDuOeSg
	Gn8dH4Zf4KBuOu2p1r1+HCHuk1GRTLbd5WX7VppLTSw4HQSXNFEjCMkpu0iPl+o8fR7m
	J0ZJIQaeNl84s5XNZCKIi83xr4/imcEft1k3N5Nsp5btRhnV6qRByVw6F2Zk1HoZ7vbq
	nX7w==
X-Gm-Message-State: APjAAAXr0aHnv4vOw7VL2eIRgrJY+4CRDeExpd0MTQZ/862QgDHe3fMN
	p8tLqWbctB0Ck8FbzcQqgceO6T8T4NE=
X-Google-Smtp-Source: APXvYqwNfkgfkAsew3L/IsOxNMQiuBpiio3sma55EqFFhoaKJVdOYUaIeAdk2fmenGz7i2xYRiOXPg==
X-Received: by 2002:a05:6830:2017:: with SMTP id
	e23mr7148601otp.327.1573763345600; 
	Thu, 14 Nov 2019 12:29:05 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 62sm2149130otq.78.2019.11.14.12.29.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 12:29:04 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:27:59 +0000
Message-Id: <20191114202759.26789-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python-jsonschema: multiple fixes
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
X-List-Received-Date: Thu, 14 Nov 2019 20:29:07 -0000
Content-Transfer-Encoding: 8bit

- remove extra space in python-jsonschema_3.1.1.bb
- add second license file to LIC_FILES_CHKSUM for json module
- add missing dependencies: six, datetime, importlib-metadata
- add HOMEPAGE field

Also:
- add RDEPENDS for PACKAGECONFIG[format] for optional modules that are
  not always needed. In particular rfc3987 and strict-rfc3339 are GPLv3
  modules.
- add missing idna and jsonpointer modules for PACKAGECONFIG[format]

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python-jsonschema.inc              | 20 +++++++++++++++----
 .../python/python-jsonschema_3.1.1.bb         |  2 +-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index d9ccf1cad..df41f06a2 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -1,15 +1,28 @@
 SUMMARY = "An implementation of JSON Schema validation for Python"
+HOMEPAGE = "https://github.com/Julian/jsonschema"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
+                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
+DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
+PR = "r1"
 
 SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
 SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
 
-DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
+PACKAGECONFIG ??= "format"
+PACKAGECONFIG[format] = ",,,\
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-jsonpointer \
+    ${PYTHON_PN}-webcolors \
+    ${PYTHON_PN}-rfc3987 \
+    ${PYTHON_PN}-strict-rfc3339 \
+"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-importlib-metadata \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-netclient \
@@ -17,9 +30,8 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-pyrsistent \
-    ${PYTHON_PN}-rfc3987 \
     ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-strict-rfc3339 \
+    ${PYTHON_PN}-six \
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-setuptools-scm \
 "
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb b/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
index b677c646e..13ed45384 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
@@ -8,5 +8,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-lang \
     ${PYTHON_PN}-re \
     ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-textutils \ 
+    ${PYTHON_PN}-textutils \
 "
-- 
2.20.1


