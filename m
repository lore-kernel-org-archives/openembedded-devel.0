Return-Path: <nick83ola@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7C46C4D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 12:49:24 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id n16so5152680oig.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 04:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OIkojVY+hPkBkuC07CBoJXwrxUQiQSmo/w4daAwrpxc=;
	b=Xe6xBQrNfXqFxg7iyezxn2dU0Wvas54cVWAFJp18O6ccx3kRWYuOLhuc7h/kNya4Db
	0egzAFJZJRo0CmmWAX0wUccTOWPxbUGJ1MuL+M6eO4anxLrgDOgrCJfYs+4oQkcUrttW
	m6olvYHbMwPTW7FfpRk2qsMuX9s8z7UhaYBPrnKfDrimWdx4zH9CMouiRwKcP3otg1qA
	vnAHGuhkW3HKTq9H6bLrVuraLdK7qIvyNUoMJWP4sv658D6BeLfDv6IgJGDTkLEEi/HQ
	1VzQHgfPANbBk8ql3epVbIIZJeMKJcXfC+7RwRuxOriHdpVr31qVwqy3dG7BlQVgGBOE
	kbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OIkojVY+hPkBkuC07CBoJXwrxUQiQSmo/w4daAwrpxc=;
	b=o5qnqi6Q0kEn5HN/BkQnfnphmsOFEMyXfnTXMc9KKrj2r5Nu6hXHinAHPeJZVtopK8
	xFOTzFXCEJZsGGfxqygFnA6EljbyQfw/I0sg0dVcUD09v7vx7hWQYrSPwRjffF17dize
	1oeR712r7y9reXkhpKXMUYo32MkB/+ar4xW6pbLvCOoCrLYqMtzlc7mVCZUTbYM9nILP
	5+KPBndIzNxskzr8qfR9grRf+rD+3ZWd4Hymg0WChi8UBoQt0Gw0Lz4ldrma0KPrKE9E
	Xv6/jGe6GjGAPwDzWUWpKFxnX2y3ZHtPfQ4fETYANe/jylsqmALXUHdSkUNS5B6besUV
	M61g==
X-Gm-Message-State: APjAAAWCOvUDo4rr+Tv40+AWdSvBt4GSkGYVnfEWIT8ud1UbGbEGycFY
	g61OwYP4+EiDLnA9DfR9kogpkH3pgEY=
X-Google-Smtp-Source: APXvYqzmGHOQbLepfpDDkW0nUzt1Wuu5BKSSSInXIe50jU8nuaCAwhvSrWvHJNRHyEMgD/EKFBfmpg==
X-Received: by 2002:a05:6808:495:: with SMTP id
	z21mr3426005oid.18.1573735765497; 
	Thu, 14 Nov 2019 04:49:25 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k135sm1781247oih.54.2019.11.14.04.49.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 04:49:24 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 12:48:52 +0000
Message-Id: <20191114124851.9868-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-rfc3986-validator: add recipe
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
X-List-Received-Date: Thu, 14 Nov 2019 12:49:25 -0000
Content-Transfer-Encoding: 8bit

This is an optional dependency for python-jsonschema

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python-rfc3986-validator.inc       | 23 +++++++++++++
 ...e-pytest-runner-to-test_requirements.patch | 32 +++++++++++++++++++
 .../python/python-rfc3986-validator_0.1.1.bb  |  2 ++
 .../python/python3-rfc3986-validator_0.1.1.bb |  2 ++
 4 files changed, 59 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-rfc3986-validator.inc
 create mode 100644 meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
 create mode 100644 meta-python/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-rfc3986-validator.inc b/meta-python/recipes-devtools/python/python-rfc3986-validator.inc
new file mode 100644
index 0000000000..71f7a7904f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rfc3986-validator.inc
@@ -0,0 +1,23 @@
+SUMMARY = "Pure python rfc3986 validator"
+HOMEPAGE = "https://github.com/naimetti/rfc3986-validator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3986-validator:"
+
+SRC_URI[md5sum] = "47f7657b790aaf6011a1ab3d86c6be95"
+SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
+
+PYPI_PACKAGE = "rfc3986_validator"
+
+inherit pypi
+
+SRC_URI_append = " \
+    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
+"
+
+RDEPENDS_${PN} += "\
+    python3-core \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch b/meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
new file mode 100644
index 0000000000..8a646874e8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
@@ -0,0 +1,32 @@
+From 3531ff73631a0d59234eb4713e7b3a7f5ea57bbb Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nicola.lunghi@jci.com>
+Date: Thu, 14 Nov 2019 12:17:51 +0000
+Subject: [PATCH] setup.py: move pytest-runner to test_requirements
+
+This fixes an issue with yocto build.
+pytest-runner is only needed when running tests.
+
+Upstream-Status: Pending
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 53ebea7..ebb0de2 100644
+--- a/setup.py
++++ b/setup.py
+@@ -10,9 +10,9 @@ with open('README.md') as readme_file:
+ 
+ requirements = []
+ 
+-setup_requirements = ['pytest-runner', ]
++setup_requirements = []
+ 
+-test_requirements = ['pytest>=3', ]
++test_requirements = ['pytest>=3', 'pytest-runner']
+ 
+ setup(
+     author="Nicolas Aimetti",
+-- 
+2.20.1
+
diff --git a/meta-python/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
new file mode 100644
index 0000000000..9dddbb4a99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-rfc3986-validator.inc
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
new file mode 100644
index 0000000000..6491308cbb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-rfc3986-validator.inc
\ No newline at end of file
-- 
2.20.1


