Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2F160F43
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 16:39:11 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id p125so6944367oif.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 08:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7cV7dQrJGGWYvMcF0Tp2Zu7qJhl7Nze+0kvZ4qo3IGE=;
	b=iOQhx4VmenGnCIeXR15bVneV80E/Sj9hxjEND/R2hFEGrcIZ0vqUzR2mSaYH7Eq7vx
	5JP0xcSY/6hYwRDSMxG/12I/6vCzNGRO1uGLo3c/udEi72DM8r6VTquZwuNTOGcJPJha
	03NVnaVNQCj/a2lgPNQ+nAxMihy1uQrhyR+eTn8xOvHusL3KoCwqk2IWXizwoGWHQLz1
	C0/mTR/X3ueOjQcmTStZ4asOyWk1biPWdQ50gBMfnMnTE+1U/Ge/pRng8gW8wtfKeI+P
	AVKbZ7TOZM2qElzurWAZm9b+OCz0QCGmVWYkTfoQ3Z8eqNl78GhqrtDL++0KHFHBCTdB
	3XhQ==
X-Gm-Message-State: APjAAAU4QLtZN4qTkgucM3JHlISaEnNDfqyCXg151o0g69/x9x4viwV3
	GS/2k0HhBKFXRvGyDDaH3SsbSadzKNw=
X-Google-Smtp-Source: APXvYqz4CjflKGfwo0c7B1ioAwt/fDN4LeNsVZVExq14ubj1TpczmLT9dD/C69OAUyKk6M3tJmLdRQ==
X-Received: by 2002:aca:1708:: with SMTP id j8mr8407961oii.166.1581266352191; 
	Sun, 09 Feb 2020 08:39:12 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	r17sm3524957otq.70.2020.02.09.08.39.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:39:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 11:38:59 -0500
Message-Id: <20200209163859.24667-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-alembic: update to version 1.4.0
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
X-List-Received-Date: Sun, 09 Feb 2020 16:39:12 -0000

Update license checksum for copyright change to 2020
Verified license remains MIT

Consolidated inc & bb file for python3 only recipe

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-alembic.inc  | 15 ---------------
 .../python/python3-alembic_1.3.2.bb             |  2 --
 .../python/python3-alembic_1.4.0.bb             | 17 +++++++++++++++++
 3 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-alembic.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-alembic_1.3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-alembic_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
deleted file mode 100644
index c94c142ddb..0000000000
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "A database migration tool for SQLAlchemy"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=28aaf14a6592d14dbfb2f4abd597aa27"
-
-SRC_URI[md5sum] = "3d7584a8fb0203ec82b90baa726d2bd9"
-SRC_URI[sha256sum] = "3b0cb1948833e062f4048992fbc97ecfaaaac24aaa0d83a1202a99fb58af8c6d"
-
-PYPI_PACKAGE = "alembic"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-editor \
-    ${PYTHON_PN}-mako \
-    ${PYTHON_PN}-sqlalchemy \
-"
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.3.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.3.2.bb
deleted file mode 100644
index e248fe7ce9..0000000000
--- a/meta-python/recipes-devtools/python/python3-alembic_1.3.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-alembic.inc
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.4.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.4.0.bb
new file mode 100644
index 0000000000..8247166da6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.4.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A database migration tool for SQLAlchemy"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "758b28361557e45c79c454d662131a83"
+SRC_URI[sha256sum] = "2df2519a5b002f881517693b95626905a39c5faf4b5a1f94de4f1441095d1d26"
+
+PYPI_PACKAGE = "alembic"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dateutil \
+    ${PYTHON_PN}-editor \
+    ${PYTHON_PN}-mako \
+    ${PYTHON_PN}-sqlalchemy \
+"
-- 
2.17.1


