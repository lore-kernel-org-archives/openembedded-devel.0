Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id DF1CE7F990
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 16:46:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id t26so11150332wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 08:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9+LheZNh7AXL4GpjX7QQ6R50ZsBowM+e2UIM3+MLc9Y=;
	b=qJnC+BgrliI/RzFdforN+3Sf0chdRVfOGx509YH3vNCynr4e5sxMwg0olY5ybPl24Q
	SIEaSA81+fnvVIvsksTF9GIWmOdi9QWwuSmObefw1M3rQZa3JxNpZ5kTWvkB+WRdiNEn
	NnKsk5j5O8aoQNKZFGzzl3NV8G7NdACMGyQ19xWR5c2yUPJ6yYEHJpBZzlIFpwFLGmt1
	WCI47mjAvtuT2gmXLoIxmisX9DEkEsG4PYP4hL6ptx7Gdyln303U1z6G1eFlWlWo1+S8
	LYIVlQA05XmKl5mbnawA7xXZxI+RR27YLCmufEqN5Deavic6NB1bN+KmLzYZ+i/YU637
	W2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9+LheZNh7AXL4GpjX7QQ6R50ZsBowM+e2UIM3+MLc9Y=;
	b=AcmhWpNs9jyw8S/lNzkDI4Ez7G7rjNMmuTVE17O7b9vdj2mKsghYmvrQWT9WATuVHq
	1vZ57ZfxoBESwP68ox31RgMwkkwfkNbdx+xfIuwPQLyx1OSAmeDBQklIi7ldntgeAQ6e
	9v7dulMHs+VM1pBKtaCe18IQwIxuOwHhUlasGgAKVLOZfbaa0XUJabhHa9bb0Kmj9wak
	SDogYWNxOmvZQWY24OJaZUsQT6DKI5WWAe8eUeeaRJtyrZcrVo7DFzo1MxSidOrsCIJw
	jB0tp4jFxjBI7XV5+Rh/ghFpR61P/HbDePX0hqWoWnI3RTSyJrj22U+w487JhWonbLWr
	XE6Q==
X-Gm-Message-State: APjAAAUM5wv/BhPfdAj/mr5dv0pXXGFiJSUt0gzvoG18WrfayWsY6RMt
	JtGy+dlmbYWu9O6yRA1a0cqCUwrnFJ4=
X-Google-Smtp-Source: APXvYqwbxg2nTzDMfJHCQTCRT0OC/wnBWNfWujmTgh1yaAliU7JZqjvwWc7zs5f2yTxZOvxz7QtcxQ==
X-Received: by 2002:a1c:bc89:: with SMTP id m131mr16516826wmf.14.1573836388848;
	Fri, 15 Nov 2019 08:46:28 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b8sm11702210wrt.39.2019.11.15.08.46.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 08:46:27 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2019 16:46:11 +0000
Message-Id: <20191115164610.32167-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH v2] python-jsonschema: multiple fixes
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
X-List-Received-Date: Fri, 15 Nov 2019 16:46:29 -0000
Content-Transfer-Encoding: 8bit

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
 .../python/python-jsonschema.inc              | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index d9ccf1cad..c1b11a2cc 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -1,15 +1,27 @@
 SUMMARY = "An implementation of JSON Schema validation for Python"
+HOMEPAGE = "https://github.com/Julian/jsonschema"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
+                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
+DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
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
@@ -17,9 +29,8 @@ RDEPENDS_${PN} += " \
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
-- 
2.20.1


