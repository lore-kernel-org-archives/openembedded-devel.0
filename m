Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681E0CEE33E
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 18:21:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.24215.1728498072855720179
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 11:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E88yF7dg;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c5cf26b95aso570a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728498071; x=1729102871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4H2MFZDbDo7lcQxtwb3bfYGIKH0njw+6qrJ6BKbClE=;
        b=E88yF7dgIkWpnbRGKZcyhWdSPwonT8faDPbkd0XX9/T2/P1X5ojSvSBxXS8VcPkqWT
         5FGOS8AcVWGa0sQEcBl+eV0vb8AZzlouP9v5OJlBlobJXTzKBOYzcFNl+/GZWF6Y/uNW
         Ula7sUrTV+/zSTXZW13ERiMLMp0H1KpJBwxnuxtAPZl1a3lMiJt7BLocgaX4T4Ve4TII
         K6TYofYjZo4SL5UXGC0cZJMyZTTzWihLuXKq8TY9zu88PH/LU/RXv1sdwzinVvplpbte
         VLLCKnlXCuhBe7aK5Bz8chEBhtsJtW53QpJWiTjxmbCf/5q5fGYn6ebvtGcja1KpjiiN
         Y6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728498071; x=1729102871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4H2MFZDbDo7lcQxtwb3bfYGIKH0njw+6qrJ6BKbClE=;
        b=nlVJ88oEo0ewZs9L4+eaYYsLgZgXX9xDxXrIVrTxdeqOJPXMI4JhqBGr4FlGRiM+4L
         oYI3mB7HwtPeLWo6b4iyOb2P+BXXmeTjRQ/mA74PvZgyPUALsDASRFiqh4dfkJ5OMqej
         PnvWvtPukfmQu+jkENfTBkVxzreQweFkenGdjLff10lbSjkY/RJ5CxoXnEVdhR5nPSrT
         +IZbdfAFUXskocbE5+AYDuURCj2wC7FFrNxONWwlY6OAHN+fHnRYmaezg8zhGesl8UMI
         gmGWKFsRxaNhu/9N7pbyMloBeGFihHc+eJn4qL+TWHQjpc43XIdCkBhiwgx+Eswe2Cgu
         GI5A==
X-Gm-Message-State: AOJu0Yy4FYmTaw3Lf4ePKwekegLWLKW2LyU7w3Ugdh91IDUHHepspMm4
	aC/+JNsc1h/W6ZW6uF1vFVK7nKQOElGyERZis0Agfc3peO5ZClYAvzqVzQ==
X-Google-Smtp-Source: AGHT+IGT53zUZkiN5nIeaIJfWus5E34y6+cvNNovC7MZTL8Tp/TNQ3hoJ+4gzvZO6iQB/G6T/aTP7Q==
X-Received: by 2002:a17:907:7d8b:b0:a99:5629:b3d7 with SMTP id a640c23a62f3a-a998d1995femr268746466b.20.1728498070456;
        Wed, 09 Oct 2024 11:21:10 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9954cd8395sm446754466b.30.2024.10.09.11.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:21:09 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 1/7] python3-sqlalchemy: Upgrade 2.0.32 -> 2.0.35 and switch to PEP-517 build backend
Date: Wed,  9 Oct 2024 21:20:25 +0300
Message-Id: <20241009182031.242045-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112737

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- PYPI_PACKAGE name changed SQLAlchemy to sqlalchemy.

- Added missing Cython dependency.

Fix:

WARNING: python3-sqlalchemy-2.0.32-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Changelog:

https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.33
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.34
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.35

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...3-sqlalchemy_2.0.32.bb => python3-sqlalchemy_2.0.35.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.32.bb => python3-sqlalchemy_2.0.35.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
index bb319d566..202350dcd 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
@@ -4,10 +4,11 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "c1b88cc8b02b6a5f0efb0345a03672d4c897dc7d92585176f88c67346f565ea8"
+SRC_URI[sha256sum] = "e11d7ea4d24f0a262bccf9a7cd6284c976c5369dac21db237cff59586045ab9f"
 
-PYPI_PACKAGE = "SQLAlchemy"
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-cython-native"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.25.1


