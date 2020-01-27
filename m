Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C4B6C7FE4F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:03:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m10so308368wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HoIU6FhRxAFHw+yei7OMEHeklegEVPTpk4hDFaOhJyQ=;
	b=saDxF1i/MpjdVPVwPaX8FHz0gKwqa5vi0+JvGEA8K+p+4FdIkSLH/vajLrpuXbiZ+e
	DXjJiQIfh0FUhfAo+Q2p3eCRh+LcGR8q82LIYpQa9FG7gPJXWQnmCn61B3VWybQdK0oH
	N6e7T0qRu1ab3pXsi1eKWiFWl/X6f+rMEN9BXubova0WJCVb4dQbojqhw4ZhMpVXtgZU
	gYsxFpLJt0g3HVSKQDixFvKKONtnt7DJFcXVc0JiAS+cV1j9ky9c7esrUQm+RBHL1iP+
	j3/0mam0Z+IdGoDO6/pG5EZdtYlZl/jp24kIwb3JbiyR0QUhbM8/VEMxen2JaZMMB3Rz
	A27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HoIU6FhRxAFHw+yei7OMEHeklegEVPTpk4hDFaOhJyQ=;
	b=rx1ewQhOeKS3byjPwnATivbGhMkATLvH5wl/vlMQQ3DtwnMZwpfEnJgX1ycpA1u3hD
	2iRvgyKkA+G1oxbR0Svu3XbUfJ0ue2dLIf9aBLF8mgVIjQSBe508O0AM934/UlzSn6j+
	wyW+vpj1lfTDEnXZYyN2vSupmIdhx10K+HD5iURYedr4sGAYmlwcq7De/+pGcZBWveLd
	zWQDc0lrnEtliTliKzrEXb0GUWyxS9W1VsE4rVBa7DcLiL1YpGTHs4ye3QpAy9kriJUg
	I2VW/lFh0dOw++ylw1ih4UQsxYYEvuNSExI2R/xPI3IIkervFfgyGkHGrPOkmCzUQ6j4
	xm9A==
X-Gm-Message-State: APjAAAWz17WDGgalkZ8p5CoVwiBR49hr15+FptQyQqdyhytiJFezkd2/
	V92ijfV5RcZCethCz+Xwq3R0AGJNQJY=
X-Google-Smtp-Source: APXvYqyDWvElEoE5OC1FxagCGEooNI6JAlG9dAMKsZMJoqXJzzU0vfpdXzPspUbtrCN57w8hXzyg8A==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr610245wmj.4.1580159018423;
	Mon, 27 Jan 2020 13:03:38 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7]) by smtp.gmail.com with ESMTPSA id
	e16sm22555192wrs.73.2020.01.27.13.03.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 13:03:37 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 21:02:42 +0000
Message-Id: <20200127210242.25283-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH v2] opensaf: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 21:03:38 -0000

Update recipe to include support for python3. Introduce a patch which
converts samples to utilize pytho3 on the target.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...0001-immom_python-convert-to-python3.patch | 50 +++++++++++++++++++
 .../opensaf/opensaf_5.19.10.bb                |  5 +-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-immom_python-convert-to-python3.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-immom_python-convert-to-python3.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immom_python-convert-to-python3.patch
new file mode 100644
index 000000000..f45874680
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immom_python-convert-to-python3.patch
@@ -0,0 +1,50 @@
+From ffc829603a2c50674c8e04de5221e43f80bfc1b2 Mon Sep 17 00:00:00 2001
+From: Andrey Zhizhikin <andrey.z@gmail.com>
+Date: Mon, 27 Jan 2020 13:00:53 +0000
+Subject: [PATCH] immom_python: convert to python3
+
+Convert immom_python to use python3, python2 is EOL and is not supported
+by all distributions anymore.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
+---
+ samples/immsv/immom_python/immom.py         | 2 +-
+ samples/immsv/immom_python/immomexamples.py | 2 +-
+ samples/immsv/immom_python/immomtest.py     | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/samples/immsv/immom_python/immom.py b/samples/immsv/immom_python/immom.py
+index 4f68625ed..f88197000 100755
+--- a/samples/immsv/immom_python/immom.py
++++ b/samples/immsv/immom_python/immom.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#!/usr/bin/env python3
+ """
+ immom -- An IMM Object Manager in Python
+ 
+diff --git a/samples/immsv/immom_python/immomexamples.py b/samples/immsv/immom_python/immomexamples.py
+index 70c579265..bd693c25f 100755
+--- a/samples/immsv/immom_python/immomexamples.py
++++ b/samples/immsv/immom_python/immomexamples.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#!/usr/bin/env python3
+ 
+ import immom
+ 
+diff --git a/samples/immsv/immom_python/immomtest.py b/samples/immsv/immom_python/immomtest.py
+index 4b98bea8c..ed2463ba9 100755
+--- a/samples/immsv/immom_python/immomtest.py
++++ b/samples/immsv/immom_python/immomtest.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ 
+ import immom
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
index a7eb4c849..8ce8fce59 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
@@ -14,7 +14,7 @@ SECTION = "admin"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
 
-DEPENDS = "libxml2 python"
+DEPENDS = "libxml2 python3"
 TOOLCHAIN = "gcc"
 
 SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
            file://0001-Add-configure-time-check-for-gettid-API.patch \
            file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
+           file://0001-immom_python-convert-to-python3.patch \
            "
 SRC_URI[md5sum] = "9b61df01d1a092101c4a626692edae19"
 SRC_URI[sha256sum] = "6da9af96e8ee58d11031d305bf4804a00deb6108e12e422722882a2091bd34bd"
@@ -66,7 +67,7 @@ FILES_${PN}-staticdev += "${PKGLIBDIR}/*.a"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-RDEPENDS_${PN} += "bash python"
+RDEPENDS_${PN} += "bash python3-core"
 
 # http://errors.yoctoproject.org/Errors/Details/186970/
 COMPATIBLE_HOST_libc-musl = 'null'
-- 
2.17.1


