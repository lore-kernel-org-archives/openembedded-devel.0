Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF846C46CD2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:09:26 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.49285.1702919359275561316
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VW4a/r4p;
 spf=pass (domain: konsulko.com, ip: 209.85.167.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e3cdcf010so1149061e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 09:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702919357; x=1703524157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lEuY2kL0LWNVjMUl1qXWl9QWqO3SkHlonH3B611uOA=;
        b=VW4a/r4pFyySj680NPD9WshH5Gg3gNt8vKmqxlSmVC7iXY5z8E6eAy6YOQ3LRoojvN
         IlWxjtYvOgQzr2MrVw7DhbNkfDyMPtxzBy63+6ogA/c3ll6uT9DdOB0To+Vbk1X3KNIj
         rW1P/rGucky1ePjpBAwu0h2rdOFxzQyBW5fjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702919357; x=1703524157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lEuY2kL0LWNVjMUl1qXWl9QWqO3SkHlonH3B611uOA=;
        b=sKzfvFqtUjH7nfRd9IIFeWkfEFn1UN4yk9H1SQQSTXI5LUdlptUm0pnhigBuHDl2aV
         8v3fvd5O0XUEiLq30FT69Tjg+pN5X/UXR3R0Pz6ePj7S4hFTlqGLxDv5ZqwoDdxLZO6h
         n6xylWeXlYmkJLBlz1pOEb/+5Zg1U+SYY5US/l1+rHZXzQVAMdlJWE1mg0zLNZXUMGJH
         PJREBt+iJ8us5XsPbi9obZI0Bb9sg21Rw+sJZwEQmYl6gRVQt9R0d2wOTmyJLU998k5R
         W5zSsbBacGoM9Yuu3oVpgb+tI4ZlUvX4+h/bK2plfRRSrLcf4IIqPz1oHdW4JFtMrO0z
         GV2A==
X-Gm-Message-State: AOJu0Ywld/cNNlWqzOkY11GzmCCHUElghWANuBwHzi0+QRjneOXtCCtR
	1a4YDOnaD4Bp/JvJD+czGgvTdKyP0u8W/KEEVG0=
X-Google-Smtp-Source: AGHT+IGgaUBrJGA7krK1T7na91t2aTm62K4yC24fI1qXbB43YWYrcuOXABKlurPqIDtHo3pXND+yUA==
X-Received: by 2002:a05:6512:2352:b0:50d:1e6f:b52c with SMTP id p18-20020a056512235200b0050d1e6fb52cmr5573762lfu.76.1702919357008;
        Mon, 18 Dec 2023 09:09:17 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d12-20020a056402000c00b0055344b92fb6sm1380419edu.75.2023.12.18.09.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 09:09:16 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-rlp: upgrade 3.0.0 -> 4.0.0
Date: Mon, 18 Dec 2023 19:09:01 +0200
Message-Id: <20231218170901.1378254-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218170901.1378254-1-leon.anavi@konsulko.com>
References: <20231218170901.1378254-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 17:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107548

Upgrade to version 4.0.0:

- repr() now returns an evaluatable string, like
  MyRLPObj(my_int_field=1, my_str_field="a_str")
- Convert .format strings to f-strings
- Add autoflake linting and move config to pyproject.toml

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-setup-don-t-use-setuptools-markdown.patch | 37 -------------------
 ...hon3-rlp_3.0.0.bb => python3-rlp_4.0.0.bb} |  8 ++--
 2 files changed, 5 insertions(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
 rename meta-python/recipes-devtools/python/{python3-rlp_3.0.0.bb => python3-rlp_4.0.0.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch b/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
deleted file mode 100644
index 0ab012a98..000000000
--- a/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5a2db801c6520be296cee9cba0e0e4ffac68430c Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <brgl@bgdev.pl>
-Date: Wed, 11 May 2022 15:11:19 +0200
-Subject: [PATCH] setup: don't use setuptools-markdown
-
-This project is deprecated and irrelevant for the functionality of
-pyrlp. We don't support it in meta-python so just drop it from the
-dependencies.
-
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
----
-Upstream-Status: Pending
-
- setup.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 1055fb1..55fca24 100755
---- a/setup.py
-+++ b/setup.py
-@@ -46,13 +46,11 @@ setup(
-     # *IMPORTANT*: Don't manually change the version here. See README for more.
-     version='3.0.0',
-     description="A package for Recursive Length Prefix encoding and decoding",
--    long_description_markdown_filename='README.md',
-     author="jnnk",
-     author_email='jnnknnj@gmail.com',
-     url='https://github.com/ethereum/pyrlp',
-     packages=find_packages(exclude=["tests", "tests.*"]),
-     include_package_data=True,
--    setup_requires=['setuptools-markdown'],
-     install_requires=[
-         "eth-utils>=2.0.0,<3",
-     ],
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-rlp_3.0.0.bb b/meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-rlp_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb
index e747ae33b..49efd09a4 100644
--- a/meta-python/recipes-devtools/python/python3-rlp_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb
@@ -4,11 +4,13 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00854fa80a84236706b11f47f23e61e7"
 
-SRC_URI[sha256sum] = "63b0465d2948cd9f01de449d7adfb92d207c1aef3982f20310f8009be4a507e8"
-SRC_URI += "file://0001-setup-don-t-use-setuptools-markdown.patch"
+SRC_URI[sha256sum] = "61a5541f86e4684ab145cb849a5929d2ced8222930a570b3941cf4af16b72a78"
 
 inherit pypi setuptools3
 
 DEPENDS += "python3-pip-native"
 
-RDEPENDS:${PN} += "python3-eth-utils"
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-eth-utils \
+    ${PYTHON_PN}-typing-extensions \
+"
-- 
2.39.2


