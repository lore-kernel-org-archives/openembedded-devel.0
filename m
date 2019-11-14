Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id E41646C4D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 12:48:18 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id w24so4242012otk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 04:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=27GEgDODRB2vv81VYU7mU9Ws7kPt14Id/edGJaQpg6c=;
	b=nnuU3Lgys5dBTGb6Am5/7Y8N3Ce7RrPi8S42wtKOrZyy/h3th9x9IV1mCoyEN6bTjh
	/kuo8kmKHrxQvftu8RvNiTTz+LCEENqHN65MrZJ207dtQcvbvaQzJoMTnffX2vzUYPUl
	lwdq6eDYeH62u1qs99XoXuRLVDlVVOMcFCXiFVOwrcIwMB0DJ+m+pHIpoS3i6uBE0GeY
	XaPjgxfZRFJW+q++n2zJHyR5X56rDQlMD7u1FuyJ9ppMOWO4ZP1JTMB2d73yRalMoMlx
	mF9hXdcrS6jvYTbfaVECfOj+maQypvJIbKTfoIieV9vTqZbqZAAodIgJUvmNDkszlxdS
	o8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=27GEgDODRB2vv81VYU7mU9Ws7kPt14Id/edGJaQpg6c=;
	b=hEXhzV9wYlCmYu00GmZFzeq6HjIvJ4lYE/RrlfHGE4k+9QGRVwYz4Qv/r4ebP77fz0
	lFHpTp/w+suaubdJ6mIDf2OG5Hh8YugIcvRaGliPKTlnf1Rc11zjiOQmPILzzTAGarE+
	asB+nJ4m8q3FDeTZniVxDHqNJ5SQbSOCll4rzcHVtcvXQno6da5kGGv8SDgmCvk3mzxv
	Gh3icfjxvTyRLfd0KErCbZB0RoGWIrw55dVapOJQtsd49M/KvTstLCclQj/+U4TtF5uc
	kk7M/WRmfPT9Ave4WecPtCOi8KDMW3NweE/cNkpPmKE9ls6BmiuezCFJ0HySXBNB/KD7
	q5kQ==
X-Gm-Message-State: APjAAAUFQMN2hkB2ub59P5TR+LfgiSJjCiWDboljxSYnTyO+VoR5QuJn
	bDII7M1V8ezzCDgSYDHgiMWFwDbdrrI=
X-Google-Smtp-Source: APXvYqxwJ6/0QboVhpVfaqF7SDJePMmyGJ8MuEelueCQTnVt8l3HPSM7gx11kffsCg60L/QiqTbKeA==
X-Received: by 2002:a9d:155:: with SMTP id 79mr6775421otu.240.1573735699311;
	Thu, 14 Nov 2019 04:48:19 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id k9sm849933otc.35.2019.11.14.04.48.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 04:48:18 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 12:47:58 +0000
Message-Id: <20191114124757.9570-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-rfc3339-validator: add recipe
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
X-List-Received-Date: Thu, 14 Nov 2019 12:48:19 -0000
Content-Transfer-Encoding: 8bit

This is an optional dependency for python-jsonschema

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python-rfc3339-validator.inc       | 25 +++++++++++++++
 ...e-pytest-runner-to-test_requirements.patch | 32 +++++++++++++++++++
 .../python/python-rfc3339-validator_0.1.1.bb  |  2 ++
 .../python/python3-rfc3339-validator_0.1.1.bb |  2 ++
 4 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-rfc3339-validator.inc
 create mode 100644 meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
 create mode 100644 meta-python/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-rfc3339-validator.inc b/meta-python/recipes-devtools/python/python-rfc3339-validator.inc
new file mode 100644
index 0000000000..3da082984d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rfc3339-validator.inc
@@ -0,0 +1,25 @@
+SUMMARY = "A pure python RFC3339 validator"
+HOMEPAGE = "https://github.com/naimetti/rfc3339-validator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3339-validator:"
+
+SRC_URI[md5sum] = "9d8899041d83f98180bddd8b62ee7e99"
+SRC_URI[sha256sum] = "20a600d01fbb1f793cbb6f4ec4ebb2104f4c9e80d74d5f78350b63ecc6cccd08"
+
+PYPI_PACKAGE = "rfc3339_validator"
+
+inherit pypi
+
+SRC_URI_append = " \
+    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch b/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
new file mode 100644
index 0000000000..ce8ca0bc8c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
@@ -0,0 +1,32 @@
+From 2de281fdca88f223ace1eb6428a77b9903c69264 Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nicola.lunghi@jci.com>
+Date: Thu, 14 Nov 2019 11:58:28 +0000
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
+index 9a50767..e3b1c6e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -12,9 +12,9 @@ requirements = [
+     'six',
+ ]
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
diff --git a/meta-python/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
new file mode 100644
index 0000000000..29b8a6e0d1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-rfc3339-validator.inc
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
new file mode 100644
index 0000000000..f4ee8fedaa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-rfc3339-validator.inc
\ No newline at end of file
-- 
2.20.1


