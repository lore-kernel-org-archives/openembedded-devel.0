Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 152D06025F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:06:34 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id i190so2211558qka.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 06:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XejBckLGnO7s3taq8ipF/mnRubXSd7NnAPdHejvqonM=;
	b=CNnGfd7ZEH3IZSwfG4aL/jxpT9SnGJBGW7Mi2Nthb68HamNTj3udgwK2ceOMH2H21E
	jflvGhhbMWvfBsl1DrfsyfBy0mL+Z2sb7+NtSJsgWw8MMZH/2XaZjpTS4E+EbvSxuQnp
	FxUZKjPcjRUKZwV8JhKaJM1/8xju7MzKmADSTExc+ICdb03wC9HfkMsWrGsTw6v+1T21
	qzvb7rGRFOyWkbefZRdw2UQ7U2Hjt2nvoaDAI/g0XwJx9luMzYAGLN7pa9Qdw/US30Nt
	5V0PEJCWJpFNvf3kWUf1ne9a5yuqPHI3cg7JOH1CmzEkGFc3uvya/Gt45E9EpPUEt4Hg
	IY0A==
X-Gm-Message-State: AKGB3mIeStKbsqTwUfxmHbRNidQa6SDPhePA/OG41k9aezJDBmUg54hs
	DSq1npcfPHLat68WwY9uvXliYsHL
X-Google-Smtp-Source: ACJfBosPHMP1SSchdJgUleSQLgPB9VqO5ysXxedbsq/6JCRUom7zVIfOf8voc7a2q22ubUJe++Q/tw==
X-Received: by 10.55.167.73 with SMTP id q70mr5008969qke.47.1513692395679;
	Tue, 19 Dec 2017 06:06:35 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s58sm9632811qtb.41.2017.12.19.06.06.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 06:06:35 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 09:06:14 -0500
Message-Id: <1513692374-7434-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-astroid: update to version 1.6.0
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
X-List-Received-Date: Tue, 19 Dec 2017 14:06:35 -0000

Split out the test packages
Update the RDEPENDS for minimal python installs

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-astroid.inc   | 16 ++++++++++++++--
 .../recipes-devtools/python/python-astroid_1.5.3.bb      |  7 -------
 .../recipes-devtools/python/python-astroid_1.6.0.bb      |  9 +++++++++
 ...python3-astroid_1.5.3.bb => python3-astroid_1.6.0.bb} |  0
 4 files changed, 23 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-astroid_1.5.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
 rename meta-python/recipes-devtools/python/{python3-astroid_1.5.3.bb => python3-astroid_1.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index 4cb1a3c..971aaf4 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -4,11 +4,18 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "6f65e4ea8290ec032320460905afb828"
-SRC_URI[sha256sum] = "492c2a2044adbf6a84a671b7522e9295ad2f6a7c781b899014308db25312dd35"
+SRC_URI[md5sum] = "6f8f60b316218455726958f08c6e17f1"
+SRC_URI[sha256sum] = "71dadba2110008e2c03f9fde662ddd2053db3c0489d0e03c94e828a0399edd4f"
 
 inherit pypi
 
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests += " \
+    ${PYTHON_SITEPACKAGES_DIR}/astroid/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/astroid/__pycache__/test* \
+"
+
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-lazy-object-proxy \
@@ -18,3 +25,8 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-re \
     ${PYTHON_PN}-setuptools \
 "
+
+RDEPENDS_${PN}-tests_class-target += "\
+    ${PYTHON_PN}-unittest \
+    ${PYTHON_PN}-xml \
+"
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.5.3.bb b/meta-python/recipes-devtools/python/python-astroid_1.5.3.bb
deleted file mode 100644
index f7a0a5e..0000000
--- a/meta-python/recipes-devtools/python/python-astroid_1.5.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit setuptools
-require python-astroid.inc
-
-RDEPENDS_${PN}_class-target += "${PYTHON_PN}-enum34 \
-                                ${PYTHON_PN}-importlib \
-                                ${PYTHON_PN}-singledispatch \
-                               "
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
new file mode 100644
index 0000000..3ced19a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
@@ -0,0 +1,9 @@
+inherit setuptools
+require python-astroid.inc
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-enum34 \
+    ${PYTHON_PN}-backports-functools-lru-cache \
+    ${PYTHON_PN}-importlib \
+    ${PYTHON_PN}-singledispatch \
+"
diff --git a/meta-python/recipes-devtools/python/python3-astroid_1.5.3.bb b/meta-python/recipes-devtools/python/python3-astroid_1.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-astroid_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_1.6.0.bb
-- 
2.7.4


