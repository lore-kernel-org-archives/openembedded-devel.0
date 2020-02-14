Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	by mail.openembedded.org (Postfix) with ESMTP id D0F78610F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 22:34:03 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id p8so10630923oth.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rLmJp88cRPQSz7XGbWDP8XNu6Ag+4y7BZHE5TNs0KFQ=;
	b=Wmqvjk1Ud7W9gDgq2ALF1DwgbK78uCsjU/2iFvZzlQPQxj1cNNQG7PX7NZxod5cc0l
	rQ37+kGkzaZzcRrFnTjYaQUiqoEg7RISIPPG2//JPeYC3oBD/0a939rcWZ6Ue2apD4ok
	o9dVQPL9VXwhANq9TB3UrSx92k2WdyYLX/cr9vjqOyjdJr+7TOtwS2lCCwSVwVMiLFn7
	U9cvMMMphzY3k1auOtO5PL1Ku+75wS1bxoFS5eBBG7OOo6uToGidvntkPD7cS8N8459n
	B3rmfev3t6uXadxS+r9uLDAKAshiEyrSkJdkh79iNh38gxG6h2R2eQ85PQzxzw8Ql0Yb
	0C/g==
X-Gm-Message-State: APjAAAVkiQ5JL+cqCd1eMUi4Wi1tLpfUUp3hX6RAubC6MySCJyIh+HmJ
	IB4mw1bpsqvf9Bzh6a9G6GMpN8bDeFI=
X-Google-Smtp-Source: APXvYqzRRuzPYz1HqjJ1R5nlAlbqWWeqbb8u2EZLBjYB6frFqFmpFuc1sz99VJvo7lt4jJIXKVpm8g==
X-Received: by 2002:a05:6830:1d55:: with SMTP id
	p21mr3989685oth.145.1581719644387; 
	Fri, 14 Feb 2020 14:34:04 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	r205sm2324564oih.54.2020.02.14.14.34.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 14:34:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:33:46 -0500
Message-Id: <20200214223346.14550-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-cassandra-driver: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 22:34:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-cassandra-driver.inc        | 33 -----------------
 .../python/python3-cassandra-driver_3.14.0.bb | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 37 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cassandra-driver.inc

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
deleted file mode 100644
index 53ebfec337..0000000000
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "DataStax Python Driver for Apache Cassandra"
-DESCRIPTION = "A modern, feature-rich and highly-tunable Python client \
-library for Apache Cassandra (1.2+) and DataStax Enterprise (3.1+) using \
-exclusively Cassandra's binary protocol and Cassandra Query Language v3."
-HOMEPAGE = "https://github.com/datastax/python-driver"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-SRCNAME = "cassandra-driver"
-
-SRC_URI[md5sum] = "c5bed026bf48c821424c1f6296193908"
-SRC_URI[sha256sum] = "b65218e2582277f5b77d1436e420db8616f63e3437a9e839cdcd7172d760e861"
-
-DISTUTILS_BUILD_ARGS += " \
-    --no-libev \
-"
-DISTUTILS_INSTALL_ARGS += " \
-    --no-libev \
-"
-
-inherit pypi
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-cython \
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-json \
-    libevent \
-"
-
-DEPENDS += "\
-    ${PYTHON_PN}-cython \
-"
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
index 34f149d3f5..768e557b94 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
@@ -1,8 +1,35 @@
-inherit setuptools3
-require python-cassandra-driver.inc
+SUMMARY = "DataStax Python Driver for Apache Cassandra"
+DESCRIPTION = "A modern, feature-rich and highly-tunable Python client \
+library for Apache Cassandra (1.2+) and DataStax Enterprise (3.1+) using \
+exclusively Cassandra's binary protocol and Cassandra Query Language v3."
+HOMEPAGE = "https://github.com/datastax/python-driver"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+SRCNAME = "cassandra-driver"
 
-# Requires concurrent which is currently in -misc
-RDEPENDS_${PN} += " \
+SRC_URI[md5sum] = "c5bed026bf48c821424c1f6296193908"
+SRC_URI[sha256sum] = "b65218e2582277f5b77d1436e420db8616f63e3437a9e839cdcd7172d760e861"
+
+DISTUTILS_BUILD_ARGS += " \
+    --no-libev \
+"
+DISTUTILS_INSTALL_ARGS += " \
+    --no-libev \
+"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-cython \
+    ${PYTHON_PN}-json \
     ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-multiprocessing \
     ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-six \
+    libevent \
+"
+
+DEPENDS += "\
+    ${PYTHON_PN}-cython \
 "
-- 
2.17.1


