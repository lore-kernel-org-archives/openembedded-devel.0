Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4EA700F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 03:17:26 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n127so24178351qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 19:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zhHH/MPP05way5oP5viwHmMF+FmUjJd5Sc4sftXrF6c=;
	b=SCICeSEeSH6jxQTSqddRhZ9kp669DGlrXu1z/wG9MQcsGzNBsQGVIwc/kSY1oaTs8S
	zcBoUID1ihRkA5QXeuI2WmwXNeRb2bZGGh/GpeKy8Rroh/9fCkw4W7fkfYKQuOXDLTGP
	9dCg7EjIaAtMO7Kh6DdwCjfv6o0Gfq05/D4GQqbOjTDfs8GXS+EF+yz/b6O05EH3rZsP
	ySv7t4Y8N9PGhVzYIRytmj/J8cxcn62C2Sfm04LwwEuk7RCAOtQKU41TxbKW2nu7Cn7N
	cgh6JTao6EDUuuCf9t/OiIWQW0Cj6hVkNFG+MBUMBe+MjMDRC67pxIyTfbjdrVYV06Ge
	eeDg==
X-Gm-Message-State: AMke39nLK+szsFIr9324uNZLiDnVvNTpF0OsReG6QUON5bwn8Ir2WS4+O11h+mASjOnhKw==
X-Received: by 10.55.114.194 with SMTP id n185mr536102qkc.257.1488511047853;
	Thu, 02 Mar 2017 19:17:27 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	o190sm6756633qkc.65.2017.03.02.19.17.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Mar 2017 19:17:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Mar 2017 22:17:17 -0500
Message-Id: <1488511037-2171-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dnspython: add initial recipe with version 1.15.0
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
X-List-Received-Date: Fri, 03 Mar 2017 03:17:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-dnspython.inc     | 20 ++++++++++++++++++++
 .../python/python-dnspython_1.15.0.bb                |  2 ++
 .../python/python3-dnspython_1.15.0.bb               |  9 +++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-dnspython.inc
 create mode 100644 meta-python/recipes-devtools/python/python-dnspython_1.15.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb

diff --git a/meta-python/recipes-devtools/python/python-dnspython.inc b/meta-python/recipes-devtools/python/python-dnspython.inc
new file mode 100644
index 0000000..6a04429
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dnspython.inc
@@ -0,0 +1,20 @@
+DESCRIPTION = "DNS toolkit for Python"
+HOMEPAGE = "http://www.dnspython.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b9d855ee0d7bea17c8b0994d37985e1e"
+
+SRC_URI[md5sum] = "05d33ffb5d8f35ae0474bb952778a344"
+SRC_URI[sha256sum] = "40f563e1f7a7b80dc5a4e76ad75c23da53d62f1e15e6e517293b04e1f84ead7c"
+
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-dnspython_1.15.0.bb b/meta-python/recipes-devtools/python/python-dnspython_1.15.0.bb
new file mode 100644
index 0000000..9dbcd0f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dnspython_1.15.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-dnspython.inc
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
new file mode 100644
index 0000000..26024c6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
@@ -0,0 +1,9 @@
+inherit setuptools3
+require python-dnspython.inc
+
+# Requires _pydecimal.py which is in misc
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-selectors \
+"
-- 
2.7.4


