Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	by mail.openembedded.org (Postfix) with ESMTP id AF28360B0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:28:03 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id b18so7655737oie.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QznfwWIg0OVK5uE9dDP/UGLVvW2qV/E4+YYnc/E+l1s=;
	b=fzHQk9xFuAeh8+vqPNJSCqWZtxobgtCb5FkV/gAgy9emCZAX4o/X4ib4NygudG+ib5
	iGaCHfaWNHgoY/Vv3+LSKP/gzOiWlDeWhla2wAHpj5le/7dEKmPP9WsUk2NexdYPTxub
	2lsmZ9YwFqJQsw+6p2czGTR3aJn2Zc1Wg0RVv+VyQHELinz4RS2h9qITAHSage8+4xxS
	aEnX3qLOrBcf9wCERpdK2FdCHxvK4vf+wTTLQtK/4i+qUHTRa81WaMT8hAMoyCuFGWhv
	xAjrjblyMiAxWwKW+bFD1Zl+/Rgslv44a2Q6nrCbG5LNpAgkeRo3nzTp/74U2Htb98D7
	7gfQ==
X-Gm-Message-State: APjAAAWUpUUxTnJUvN7pC0nJWc1jdDu1BwNmIor9t2JxuU+Gvzi85g4J
	q7QFx3bS2TDpNFcbKEa251EIwYgTrFk=
X-Google-Smtp-Source: APXvYqyGOssXn9Z74686Abthf9a+1UUoftB8F4c2yPUkhONrNCHp+Gjc8/9t4skZiWOik8tWMX314g==
X-Received: by 2002:aca:3f54:: with SMTP id m81mr8904003oia.73.1581294484603; 
	Sun, 09 Feb 2020 16:28:04 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	y14sm3429669oih.23.2020.02.09.16.28.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:28:04 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:27:50 -0500
Message-Id: <20200210002750.10772-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-astroid: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:28:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-astroid.inc                 | 33 -----------------
 .../python/python3-astroid_2.3.3.bb           | 35 +++++++++++++++++--
 2 files changed, 33 insertions(+), 35 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-astroid.inc

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
deleted file mode 100644
index e9a68789e0..0000000000
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "An abstract syntax tree for Python with inference support."
-HOMEPAGE = "https://pypi.python.org/pypi/astroid"
-SECTION = "devel/python"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI[md5sum] = "5f3d73d82d1753b59bb49a6bc6046dee"
-SRC_URI[sha256sum] = "71ea07f44df9568a75d0f354c49143a4575d90645e9fead6dfb52c26a85ed13a"
-
-inherit pypi
-
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN}-tests += " \
-    ${PYTHON_SITEPACKAGES_DIR}/astroid/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/astroid/__pycache__/test* \
-"
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-distutils \
-    ${PYTHON_PN}-lazy-object-proxy \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-wrapt \
-    ${PYTHON_PN}-setuptools \
-"
-
-RDEPENDS_${PN}-tests_class-target += "\
-    ${PYTHON_PN}-unittest \
-    ${PYTHON_PN}-xml \
-"
diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb b/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
index 6e32c288f2..dc1ce0eb4c 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
@@ -1,2 +1,33 @@
-inherit setuptools3
-require python-astroid.inc
+SUMMARY = "An abstract syntax tree for Python with inference support."
+HOMEPAGE = "https://pypi.python.org/pypi/astroid"
+SECTION = "devel/python"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI[md5sum] = "5f3d73d82d1753b59bb49a6bc6046dee"
+SRC_URI[sha256sum] = "71ea07f44df9568a75d0f354c49143a4575d90645e9fead6dfb52c26a85ed13a"
+
+inherit pypi setuptools3
+
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests += " \
+    ${PYTHON_SITEPACKAGES_DIR}/astroid/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/astroid/__pycache__/test* \
+"
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-lazy-object-proxy \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-wrapt \
+    ${PYTHON_PN}-setuptools \
+"
+
+RDEPENDS_${PN}-tests_class-target += "\
+    ${PYTHON_PN}-unittest \
+    ${PYTHON_PN}-xml \
+"
-- 
2.17.1


