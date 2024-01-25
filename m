Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72941C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 11:26:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.15250.1706181987902813942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jan 2024 03:26:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDYQNqPE;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so6334147f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jan 2024 03:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706181986; x=1706786786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56OojX3L0wbi1eGX20DTDZEcSaBSL1xGxX/j0Tx0NRc=;
        b=EDYQNqPEyBPa006zGWtpqUZKpwmj/llU6oBShj3lLLwNaZiZNKSCEejQAptp4cMdsO
         6svO6EXt2Sao4DlwX1SOdTef4co2ETyioohlmLt39y80Jqz82Ol03WZo/UCMq8qAYhiw
         IKmUGFk5rJiYcSeB43evecN7z+V6r8QHGd3IL8HT6QRaxwA0/C9DOl3NQVz0dSu9u0xT
         xrPpMNt6LriyS2xHcMEI0iYSbT04JY9zyZImNsMNnbxHYtv2R7bo21UCe9MARy0qPY3a
         VrbEjGGBrlt02jq0MwBgSqqMgzVMHSdqeAXF0waCL65bgzpxz8mRA2L4gBF94aDKpZs/
         fY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706181986; x=1706786786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56OojX3L0wbi1eGX20DTDZEcSaBSL1xGxX/j0Tx0NRc=;
        b=eg2dFzer+EJ183x+YwtLUpM+q/XWRtKYeAV8ITj84N4FJ1guGPElMzv/C3/Nhrnv5s
         XOYEKZH0I/a6Kf8npWWMZqPybYQniZq/sjEFMeGlj3jkKrw25bz7wMfZNDmu1mKwknjj
         V6+C1QrsZFcjonA2iGa1Z50hcd80nDvE9oiHgmsRccVxekm/vs2e36UMEN/0DD2H6bzm
         1scwesTxlYfbgjKpuynhCBpOD0V6pfq+7MwXmEQAwmHkrNIyrxdjWFLrxKZB+f4NcHW3
         r91aHQ7Y0u2URttkIa/YrhDi8dJ3z7qn1lhcnQnqDJwdh1bEHvwkt1PHZ/Yq2c9MlqUT
         Sqzw==
X-Gm-Message-State: AOJu0Yx2mWV/8tlZSIL0jrVBiIPL07ght+8j+bDBUvmYO2etd0zlIo/c
	Awjx7Kytw1vbtbr38Wx+/+QNrSi+OxuFDHge4GdvRleFluu0JH3jC/eqBQkFfFc=
X-Google-Smtp-Source: AGHT+IHHC0F+xt++Jrq0Z+a8Hh3+zPwv4DpzV+VrGz+9e1ayg2S4ZmHTGDh8D+4l7tW+qg9Ng53ncA==
X-Received: by 2002:adf:fe09:0:b0:337:bdf3:a4d7 with SMTP id n9-20020adffe09000000b00337bdf3a4d7mr436458wrr.91.1706181985363;
        Thu, 25 Jan 2024 03:26:25 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d5909000000b0033936c34713sm9714535wrd.78.2024.01.25.03.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 03:26:24 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-flask-marshmallow: upgrade 0.15.0 -> 1.1.0
Date: Thu, 25 Jan 2024 14:26:20 +0300
Message-Id: <20240125112620.91634-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jan 2024 11:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108454

* Upstream provides a pyproject.toml which declares the "python_setuptools_build_meta" backend for PEP-517 packaging.

	use python_setuptools_build_meta since normal setuptools3 bbclass ends up in error -> ERROR: 'python3 setup.py bdist_wheel ' execution failed.

* Set PYPI_PACKAGE to "flask_marshmallow" because when downloading the archive error pops up. they use "_" instead of "-".

* Dependencies defined ["Flask>=2.2", "marshmallow>=3.0.0"] in pyproject.toml so "python3-packaging" removed.

License-Update: Copyright years change

Changelog:
=================================
1.1.0 (2024-01-16)

Features:

    Add type coverage (:pr:`290`).

==================================
1.0.0 (2024-01-16)

Features:

    Add field fields.File, validate.FileType, and validate.FileSize for deserializing uploaded files (:issue:`280`, :pr:`282`). Thanks :user:`uncle-lv` for the PR
    Add field Config for serializing Flask configuration values (:issue:`280`, :pr:`281`). Thanks :user:`greyli` for the PR.

Support:

    Support marshmallow-sqlalchemy>=0.29.0.
    Test against Python 3.12.
    Drop support for Python 3.7.

Other changes:

    Backwards-incompatible: Remove `flask_marshmallow.__version__ and flask_marshmallow.__version_info__ attributes (:pr:`284`). Use feature detection or importlib.metadata.version("flask-marshmallow") instead.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-flask-marshmallow_0.15.0.bb    | 14 --------------
 .../python/python3-flask-marshmallow_1.1.0.bb     | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-marshmallow_0.15.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-marshmallow_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_0.15.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_0.15.0.bb
deleted file mode 100644
index 25ca4d24c..000000000
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_0.15.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Flask + marshmallow for beautiful APIs"
-HOMEPAGE = "https://github.com/marshmallow-code/flask-marshmallow"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c3ff8567ef1f2a8cf223f30ac5a6f094"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "2083ae55bebb5142fff98c6bbd483a2f5dbc531a8bc1be2180ed5f75e7f3fccc"
-
-RDEPENDS:${PN} += "\
-    python3-flask \
-    python3-marshmallow \
-    python3-packaging \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.1.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.1.0.bb
new file mode 100644
index 000000000..15fb22900
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.1.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Flask + marshmallow for beautiful APIs"
+HOMEPAGE = "https://github.com/marshmallow-code/flask-marshmallow"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dfbd4ae0074716275fc229c775723e8f"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "flask_marshmallow"
+
+SRC_URI[sha256sum] = "2d186af7c8b4455b8a2c166c7470939c17d70353671ea5a287a14676846fa013"
+
+RDEPENDS:${PN} += "\
+    python3-flask \
+    python3-marshmallow \
+    "
-- 
2.25.1


