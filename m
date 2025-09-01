Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB61CA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 11:06:29 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.48594.1756724785872798541
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 04:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Lb6j8jI8;
 spf=pass (domain: konsulko.com, ip: 209.85.218.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b042cc3953cso98438066b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756724784; x=1757329584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wE3ojO4tO8m+fmn48rwORPG2CyNdaQCBSpwKxNtqHoo=;
        b=Lb6j8jI8SNHFCLARin/2Rgq5HUU0aD+rLxqyN8x0CO4WM9SZ0FUFrLzNpYxr6U4+Sp
         SaDKN2fzi4Um0HtdOztNxuV8ul6QCydCw6ew4RCDnLZ0witVLNWpvuTKn/fQNiZ9iEnt
         SPSnCmM2RdM1bxsLGTB96MeffiD0Wb0QoiX5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724784; x=1757329584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wE3ojO4tO8m+fmn48rwORPG2CyNdaQCBSpwKxNtqHoo=;
        b=eYq4M0wr9YMT5B0YMhi1Mt/tauWotQOkhK47c80Yp/xVa3z3VGVu6+BYwM4EdphWVd
         C6oCxJa9jrGkea48XHHeugtd0yRpE0ncigA1SgMxe0UjF6Yev09kP2rfB2LDKaR20RY8
         hUyrXE8qlTZRyzj1hK/OCw+wYw0J4UKYo/elipjFm92hXFBHApeeCgAG8ho8vO2psiO0
         9wdxJAXGglkKK0KSSdmWOlxrgqQYQTYzwuTxwCvEYIj9YtHbpA8tQuSUc9zJeJ7UVy5e
         sHKqvyENeALCLXwOYiDlkErfsFRpk1qQUXAcTYSPCLvcJYfiJTwbxdCvGdMXIQcbTqHX
         pjXQ==
X-Gm-Message-State: AOJu0Ywa/w23XGLqiNaVtluFhM5pFEOSsWCUkepr1IoxmAq8cXdEvMuP
	ZzJmDluCf1+ZuuR2PxKjndjqPyKE6KUs4sl8J502+23pa1oY8zvdfCC6rGLnxHrzsjlce+0fX0P
	3Wo+s
X-Gm-Gg: ASbGncv/YY49LgshP6X5EkvnyngD829fqlcMKHoPLWoxycxfYOawxtnyUr70UJwaq3Y
	jPCUM0fx6IRIwWTrWdEjh9ogn6DEfM43Iq9MMv3ft2i/y358rypebuVNlVt0FhaE2KQuY3fhrbQ
	HU69Ofj/vVY0lJnFqa2HSt7O8hLwr+bwIwzouzU6ZT3jhMTVwIAwPOSYtqm5+IrWfz9zWD08vFJ
	/brIxUNlGgeFp1eTeIdakEvL8vDRF4yRvU8yjfLYMKNPAtRcOM2nk0IQB6bS47IHNW36g1zy+uu
	7v5v0JChT2n9E5gmRbZ5lCDJUOoR0CK5atH6LTagzd/q1MyneFXE5p37dh/MU9kayB2yDM0eQEv
	hAqOKoQEToVFbwJYiYGKpa51YDPhkj9DCTC8DdVDmb4vKeFI=
X-Google-Smtp-Source: AGHT+IFKeGikke4PPPKhVy7SZXvxI62SMAfua/S72XxvGjv1xSLit8Dodaa1z0JxpI9bIol5JM6keA==
X-Received: by 2002:a17:907:c24:b0:b01:6e50:208c with SMTP id a640c23a62f3a-b01d8c7da70mr655126566b.22.1756724783755;
        Mon, 01 Sep 2025 04:06:23 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd9090sm825856166b.69.2025.09.01.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:06:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-charset-normalizer: Upgrade 3.4.2 -> 3.4.3
Date: Mon,  1 Sep 2025 14:06:18 +0300
Message-ID: <20250901110620.158572-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 11:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119155

Upgrade to release 3.4.3:

- mypy(c) is no longer a required dependency at build time if
  CHARSET_NORMALIZER_USE_MYPYC isn't set to 1.
- automatically lower confidence on small bytes samples that are
  not Unicode in detect output legacy function.
- Custom build backend to overcome inability to mark mypy as an
  optional dependency in the build phase.
- Support for Python 3.14
- sdist archive contained useless directories.
- automatically fallback on valid UTF-16 or UTF-32 even if the md
  says it's noisy.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...project.toml-Update-mypy-requirement.patch | 28 -------------------
 ...bb => python3-charset-normalizer_3.4.3.bb} |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Update-mypy-requirement.patch
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.4.2.bb => python3-charset-normalizer_3.4.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Update-mypy-requirement.patch b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Update-mypy-requirement.patch
deleted file mode 100644
index 44b5283359..0000000000
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Update-mypy-requirement.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ee56a688a46a2abc2ca46c061898b27b44fb9602 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Thu, 17 Jul 2025 16:23:58 +0300
-Subject: [PATCH] pyproject.toml: Update mypy requirement
-
-Updates the requirements on mypy to permit the latest version.
-
-Upstream-Status: Submitted [https://github.com/jawah/charset_normalizer/pull/632]
-
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index e7f052a..3a75dc1 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools", "setuptools-scm", "mypy>=1.4.1,<=1.15.0"]
-+requires = ["setuptools", "setuptools-scm", "mypy>=1.4.1,<=1.17.0"]
- build-backend = "setuptools.build_meta"
- 
- [project]
--- 
-2.39.5
-
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.3.bb
index e98f823247..c257e1fb2a 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
-SRC_URI += "file://0001-pyproject.toml-Update-mypy-requirement.patch"
+#SRC_URI += "file://0001-pyproject.toml-Update-mypy-requirement.patch"
 
-SRC_URI[sha256sum] = "5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63"
+SRC_URI[sha256sum] = "6fce4b8500244f6fcb71465d4a4930d132ba9ab8e71a7859e6a5d59851068d14"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
 
@@ -17,7 +17,6 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 RDEPENDS:${PN} += " \
 	python3-core \
 	python3-logging \
-	python3-mypy \
 	python3-codecs \
 	python3-json \
 "
-- 
2.47.2


