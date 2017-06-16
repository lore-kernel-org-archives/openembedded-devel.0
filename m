Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8A7784A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:08:05 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id x58so12390115qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ciQUVDGq+EjY1RjXtiGeczQJ5lsDjkLQGhbwGxPOIFs=;
	b=R1B5o+8FpPeFAiP13KISngx0i926vPX415kfbfojMwOMLdGH79bS+IIpu/7hzy85sY
	gtIN0FTCQE8sQf9/p47FpaVCRJnlZc2dpn2IzZ6P6WpLxGk974HN+WuD8liYVQ2p8fGF
	l8Dcf3VJhIShjND+acgXS2drpF+tq6aOcHa1ViXeOVK9KSBeLcrJ+rkxjmkXq6G/Ljhh
	ZVVKDKJBovBMvZQ6z94AL0fZgADKutiXMWydbWS2e8i0x6VpLHkYI9CiuR+0FG/YKjgm
	AVpvEVEjkBy2I4R4tuHT7bC3s5UKgI2Uw42TrLrTYn5SagCbcabodXhJPBMqIjQwIq3q
	O+7A==
X-Gm-Message-State: AKS2vOwq1JqIeltPYGBXP+dhTX2RhmoZzlX+RMFDmEEgpNInzq5jwVYC
	GfLCdDCnepC5e8/FyW0=
X-Received: by 10.55.129.7 with SMTP id c7mr15605115qkd.255.1497640086666;
	Fri, 16 Jun 2017 12:08:06 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	i134sm1910546qke.41.2017.06.16.12.08.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 12:08:06 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:07:58 -0400
Message-Id: <1497640078-31238-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-multidict: update to version 2.1.6
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
X-List-Received-Date: Fri, 16 Jun 2017 19:08:06 -0000

Drop patch incorporated in upstream release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...w-calling-make-clean-without-sphinx-build.patch | 34 ----------------------
 .../python/python3-multidict_2.1.4.bb              | 11 -------
 .../python/python3-multidict_2.1.6.bb              |  9 ++++++
 3 files changed, 9 insertions(+), 45 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-multidict/0001-Allow-calling-make-clean-without-sphinx-build.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-multidict_2.1.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-multidict/0001-Allow-calling-make-clean-without-sphinx-build.patch b/meta-python/recipes-devtools/python/python3-multidict/0001-Allow-calling-make-clean-without-sphinx-build.patch
deleted file mode 100644
index d1d7ef5..0000000
--- a/meta-python/recipes-devtools/python/python3-multidict/0001-Allow-calling-make-clean-without-sphinx-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 39e13b4e3f7a1d1dd748e80cee241d511865d4e8 Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@nextrem.ch>
-Date: Mon, 16 Jan 2017 21:29:12 +0100
-Subject: [PATCH] Allow calling make clean without sphinx-build
-
-Currently make clean fails without sphinx-build installed
-However sphinx-build is not really necessary to do a clean.
-This trick makes the docs/Makefile use the false binary instead of
-sphinx-build for the check when a clean is done.
-
-Upstream-Status: Submitted https://github.com/aio-libs/multidict/pull/41
-
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 8f525f3..6d601e5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -51,8 +51,8 @@ clean:
- 	rm -rf coverage
- 	rm -rf build
- 	rm -rf cover
--	make -C docs clean
--	python setup.py clean
-+	make -C docs clean SPHINXBUILD=false
-+	python3 setup.py clean
- 	rm -f multidict/_multidict.html
- 	rm -f multidict/_multidict.c
- 	rm -f multidict/_multidict.*.so
--- 
-2.7.4
-
diff --git a/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb b/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb
deleted file mode 100644
index 62895d2..0000000
--- a/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args etc."
-HOMEPAGE = "https://github.com/aio-libs/multidict/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
-
-inherit pypi setuptools3
-
-SRC_URI += "file://0001-Allow-calling-make-clean-without-sphinx-build.patch"
-
-SRC_URI[md5sum] = "051d92edec87fd98e43ea83f3ce6072d"
-SRC_URI[sha256sum] = "a77aa8c9f68846c3b5db43ff8ed2a7a884dbe845d01f55113a3fba78518c4cd7"
diff --git a/meta-python/recipes-devtools/python/python3-multidict_2.1.6.bb b/meta-python/recipes-devtools/python/python3-multidict_2.1.6.bb
new file mode 100644
index 0000000..646cb77
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-multidict_2.1.6.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args etc."
+HOMEPAGE = "https://github.com/aio-libs/multidict/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "7837353cf71008484e99737ccf55a4ea"
+SRC_URI[sha256sum] = "9ec33a1da4d2096949e29ddd66a352aae57fad6b5483087d54566a2f6345ae10"
-- 
2.7.4


