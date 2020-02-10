Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail.openembedded.org (Postfix) with ESMTP id 959D560EE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 01:11:02 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id z2so7688499oih.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 17:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=apZJlEzL1ENUBZCgGqiqv1MT6YqSYbuJqU8Yvf2CtM8=;
	b=EFUBBM7AFIKTUVBz2fg3T9bcABiTdz2SaMTtixhWhhqMlV4bKytikwadpUI1HERj33
	QwtPFbO+M6dnc1i9pUQmJln7AhDlPUYwcYJFOZoEQZ6X5OWnwsSyfGnaZmAFoR7qe/L5
	Dkuy9DG0Hq8YhBlVuo1sejn8sMm0IPUSiErK9np3o0WroVWXGYb8Jt38t5h8djtIRQNh
	inTCapB53fqwxewLQ5Wsm2NgcJnK+ey9gplYbjAhR/0fhagCMsACfJHyuql00KMLZ1cn
	LeK622WpQ7X5E0W65pFx1eI0+CYT2DskncgGzawo27UAza3lKVIx6HbEsadhZsuo28eN
	v5wg==
X-Gm-Message-State: APjAAAX+IQaURpT1RKyZpZtlU40oBo9c/s64ZwQk7G3kzafco0GMYDm7
	CRPedmglt5Q3VlU0X50JjfsKSxESTcg=
X-Google-Smtp-Source: APXvYqyRh8FDhu2tXEzFPIaA0LUpjxuWa7f508zGtyxcnlfsuRgwOZ6sRkjk1CqZlQeZATqnrlveIA==
X-Received: by 2002:aca:2803:: with SMTP id 3mr8868799oix.162.1581297063270;
	Sun, 09 Feb 2020 17:11:03 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	c21sm3448996oiy.11.2020.02.09.17.11.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 17:11:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 20:10:46 -0500
Message-Id: <20200210011047.18827-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH 1/2] python3-babel: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 01:11:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-babel.inc  | 27 -----------------
 .../python/python3-babel_2.7.0.bb             | 29 +++++++++++++++++--
 2 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-babel.inc

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
deleted file mode 100644
index c55b45922e..0000000000
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "A collection of tools for internationalizing Python applications"
-HOMEPAGE = "http://babel.edgewall.org/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=942469df9305abb1c59e95f778310384"
-
-SRC_URI[md5sum] = "83c158b7dae9135750a7cf204e6e2eea"
-SRC_URI[sha256sum] = "e86135ae101e31e2c8ec20a4e0c5220f4eed12487d5cf3f78be7e98d3a57fc28"
-
-PYPI_PACKAGE = "Babel"
-
-inherit pypi
-
-CLEANBROKEN = "1"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-distutils \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-babel_2.7.0.bb b/meta-python/recipes-devtools/python/python3-babel_2.7.0.bb
index 0715d59f42..45ff948736 100644
--- a/meta-python/recipes-devtools/python/python3-babel_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-babel_2.7.0.bb
@@ -1,2 +1,27 @@
-inherit setuptools3
-require python-babel.inc
+DESCRIPTION = "A collection of tools for internationalizing Python applications"
+HOMEPAGE = "http://babel.edgewall.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=942469df9305abb1c59e95f778310384"
+
+SRC_URI[md5sum] = "83c158b7dae9135750a7cf204e6e2eea"
+SRC_URI[sha256sum] = "e86135ae101e31e2c8ec20a4e0c5220f4eed12487d5cf3f78be7e98d3a57fc28"
+
+PYPI_PACKAGE = "Babel"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


