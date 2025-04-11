Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF85CC369AD
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:16 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.14147.1744332132617567757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lnlJNg8F;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so1165077b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332132; x=1744936932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+V66ubYZSUliSZ14b62FgB4SGYGOr6jJD0a1fLgXEU=;
        b=lnlJNg8FcxZAdVHZ484PihwPrQ9zwTmalh0EKR5ii+kNXO0d6DhkO1QeEXYz9J4nIn
         gHF5Mhv16kh1nVf68gHnhIqLiizsJUi+EoFn7us94ilERaTxexmkIa40O0jqIKda0+Ef
         +cclmfE08Kqyy/NYH6+4pwkrlxChFpvWJqzCxdKOLvgaPuilJy6u55JrrMwMum8olIJA
         uRaphaQNRGAxe29a50V+CkVY9pD+Qzd12EdOL6ygUXIBsefB7bxiMLQwi9UjJDCoY5/d
         Pw5CSlZ5ZPWEBihd5a/tTkzZ8/0UhAh6KKd8/SQ64yi4vdwaegralN22YCgrCoNeIxTp
         bD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332132; x=1744936932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+V66ubYZSUliSZ14b62FgB4SGYGOr6jJD0a1fLgXEU=;
        b=cWHqe4g4eHlcczmkpYjydXGPMeNsDAd9SiPsvNclgIlBhRmSc9/POUOjQtBIaQZzo+
         2s75et17kSyd1h4ZkR9jBdPbioiTGGXFByON7gS3vMtQCvuncjS3nY27QZxmg7UXxp5z
         o4caVHQGKe8xmXdR84o8iYcTwA9rCy0nj2pLmifIwNoHk5Vv0oblGEPjJR7IHvTHUrg5
         OfZD0/fBHULVNtPZMCI+ofvsWw4f9ykL343GB9RgplQ6XGEn1it42BVF81oWcfMRN8iG
         mRkfUy2P9bXtFd6bF1H+L6BP5taLqx4smbDmiHjua5ulp4Xa+nYi0M8jBqbBvFqPe4WA
         f/VQ==
X-Gm-Message-State: AOJu0Yz/uZVVeC+qnhlSmdSQrAjg+M0FKX3pObgtsckbwo5COUJflCc/
	Q9lDZ6pzYdnIQfBFuURyw90eAdDdSCiGrTZzIftYHXXJly9oeD0n+mcBARPZ
X-Gm-Gg: ASbGncvhLeABckMKzUPqnE9d5H/m24wupB6ByzQo5isuUiGJ7uL6gJc5XMpnjypAwC0
	LY3y2OnOLcWRPakGAbNwzMgt6a4BJsNpPop+J32FGr1y7f1pTuUA8SOx17I9Ed9hpe4782c8VFK
	B043x1AOjK2VXb8bVbmHeDqyq6rSWon7qZFezHgKwyBqIOoPh6rB+Nx3JyOO5Tzautxl/E7JvrS
	5UDLOi2oGqWpn+UsUNqrjl4KngwKelamG8X8eBidDS20qJgQsb3eOsmM9MfgZ0jc8FtUy9aBK7F
	MOjFvWLRlkGjsCc3YPMsW+sMsPqxd7FB
X-Google-Smtp-Source: AGHT+IGohwl2YyLHanmAl8EesYHaF1L4J8d8FMhwjhdSvMMQelNCagLCEoJN4TTfbhqFMHPcR0vW7g==
X-Received: by 2002:a05:6a00:3a0d:b0:736:53ce:a32c with SMTP id d2e1a72fcca58-73bd126b810mr960983b3a.17.1744332131618;
        Thu, 10 Apr 2025 17:42:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 07/12] python3-charset-normalizer: Switch to PEP-517 build backends
Date: Thu, 10 Apr 2025 17:41:56 -0700
Message-ID: <20250411004201.3826913-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116781

Add ptest support but do not enable them as they all do not pass yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...yproject.toml-Relax-version-for-mypy.patch | 25 +++++++++++++++++++
 .../python3-charset-normalizer_3.4.1.bb       |  7 +++++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Relax-version-for-mypy.patch

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Relax-version-for-mypy.patch b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Relax-version-for-mypy.patch
new file mode 100644
index 0000000000..d544caaa17
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Relax-version-for-mypy.patch
@@ -0,0 +1,25 @@
+From 57b626d6d8c247c9203dde51a988b9401abe065c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Apr 2025 23:44:44 -0700
+Subject: [PATCH] pyproject.toml: Relax version for mypy
+
+It asks for mypy <= 1.14.0 but we have 1.15.x
+already in meta-python
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index bbb8227..ad42715 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools", "setuptools-scm", "mypy>=1.4.1,<=1.14.0"]
++requires = ["setuptools", "setuptools-scm", "mypy>=1.4.1,<=1.16.0"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb
index b13524c227..4f9b09ef93 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb
@@ -3,9 +3,12 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
+SRC_URI += "file://0001-pyproject.toml-Relax-version-for-mypy.patch"
 SRC_URI[sha256sum] = "44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3"
 
-inherit pypi setuptools3
+DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PYPI_PACKAGE = "charset_normalizer"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
@@ -13,8 +16,10 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 RDEPENDS:${PN} += " \
 	python3-core \
 	python3-logging \
+	python3-mypy \
 	python3-codecs \
 	python3-json \
 "
 
+RDEPENDS:${PN}-ptest:append:libc-glibc  = " glibc-charmap-gb18030 glibc-charmaps"
 BBCLASSEXTEND = "native nativesdk"

