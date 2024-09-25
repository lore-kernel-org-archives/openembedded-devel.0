Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1DCCF9C77
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:24:33 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.9070.1727245470339559320
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fn2HeicW;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e039666812so3110089b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727245469; x=1727850269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nhbkRxQ0d/Qpjyb6aew1oD46Trq0zb+yTdGufDuih8=;
        b=Fn2HeicWqVUYADJDxE+HRXYZiYrVeQ7gfINn0oBCSzPNq15fH6hJJBoDVz+KyHmRU1
         +m1nFKZO9QZkfqULm/bJHjTbf3R0e9CHC/9adbfOZhzXsSqQN05hAw8y0ih17fXLfgrn
         Tha+CTVI+Ws03sNsNjOtTMif0GlicEulTsuBKPNLlBjsMCPWMWVlTx0MB4tH2/BC1Iar
         RG0xEhFDtzydHE4zQsnr/FSvRDGTbyq01fo44F5m1AUBh6vIV4s7OrWBwg6nlDLNrhOy
         VQ3TZW+yeuSdVKoDId6C/KjBySTcBqZHnDNigK7vSBmQLVsi3DAOpzIaAG6Kp26+Z5ic
         1ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245469; x=1727850269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nhbkRxQ0d/Qpjyb6aew1oD46Trq0zb+yTdGufDuih8=;
        b=FCpTp4Uv6xDnOjKzdipqaGNoPt+oa94rm8DLmiGiok0wn+wmhGlNlG/y/aeKzv5M78
         vHqKoUyC+P3pn2bG/FjQyaS9yqo1/E6VC1pPYy6vGtOrK5D/RXJkKkmcET+jjhbs/b5y
         7d/iYh82B6l/8Ajy64Y38QGxYXBuun44ZCv/9zVH6ofrrQC+9F2OxhMT+NlL7GwT04K5
         ZJ60iPKTX2iFwtKqL/qUxkPZaGnLi2uSGSEVcgPqkdVRsghH4lIk9ttTu/4MaejTx5BL
         7IO7q3seOmPY44AFHJEarWUGibva7vHJ/HciE4ytIeb9LK4RdLwzvLHA5+z9FmEms3zK
         QzZw==
X-Gm-Message-State: AOJu0YwtDbPSeWl+rixSPeUzlanBAzKR00GCu3rZ/9LamDGaH5trjzCx
	mZEbTCtrYPiEQjU4hS4i3dh+QofgDwgiyd3noPiKDDgExGWp6ABH0E/1gIpa
X-Google-Smtp-Source: AGHT+IFwBRzABmfDL/xn8lR8K2DAjb7jppivnD6ysbmCg/YPL6jPrHXNLxOLVgkgxk17WjhVnWkr6w==
X-Received: by 2002:a05:6808:3095:b0:3da:e007:9d5 with SMTP id 5614622812f47-3e29b7d8883mr1015791b6e.30.1727245469300;
        Tue, 24 Sep 2024 23:24:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c46f04sm2106309a12.38.2024.09.24.23.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:24:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/9] python3-starlette: Add recipe
Date: Tue, 24 Sep 2024 23:24:17 -0700
Message-ID: <20240925062422.3146738-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925062422.3146738-1-raj.khem@gmail.com>
References: <20240925062422.3146738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112487

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-starlette/run-ptest        |  3 ++
 .../python/python3-starlette_0.39.0.bb        | 41 +++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-starlette/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-starlette_0.39.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index e500843e88..da6206c6ba 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -72,6 +72,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-smpplib \
     python3-soupsieve \
     python3-sqlparse \
+    python3-starlette \
     python3-tomli-w \
     python3-tomlkit \
     python3-trustme \
diff --git a/meta-python/recipes-devtools/python/python3-starlette/run-ptest b/meta-python/recipes-devtools/python/python3-starlette/run-ptest
new file mode 100644
index 0000000000..09bdf7cedf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-starlette/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake --forked --deselect tests/test_staticfiles.py::test_staticfiles_with_invalid_dir_permissions_returns_401
diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.39.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.39.0.bb
new file mode 100644
index 0000000000..c4b3d99164
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.39.0.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for building async web services in Python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
+
+SRC_URI[sha256sum] = "b35acedae74e95967dd9c0a47b45f5803dcd8973d0d95c18c1abb184845ba42c"
+
+inherit pypi python_hatchling ptest
+
+PYPI_PACKAGE = "starlette"
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        python3-attrs \
+        python3-ctypes \
+        python3-httpx \
+        python3-itsdangerous \
+        python3-jinja2 \
+        python3-outcome \
+        python3-pytest \
+        python3-pytest-asyncio \
+        python3-pytest-forked \
+        python3-python-multipart \
+        python3-sortedcontainers \
+        python3-terminal \
+        python3-trio \
+        python3-typing-extensions \
+        python3-unittest-automake-output \
+        python3-pyyaml \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+        python3-anyio \
+"

