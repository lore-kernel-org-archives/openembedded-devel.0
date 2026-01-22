Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E86D625FD
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 08:43:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32952.1769071411262497524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 00:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bSKl6gZm;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee07570deso5477135e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 00:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769071409; x=1769676209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpfb+oj8FwTo1MB3AtqTucUivSmaD6nbSukwB6sCVsg=;
        b=bSKl6gZmmaYF3Q9PYZZaoylB3T4wMGry2D/uPfk25vZl/HITC0SJwtCtE3ke9VzAYR
         FLjw/bqNdgswEhZf/fa2aJ7o6l8Ch1fLrP+3frM2x2G/CKxUdIWCjBfjy6VQy/wkbBk8
         XyDQ0Cfn4PC437brcNh3VbSU5Wnb+tfVnnd3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071409; x=1769676209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lpfb+oj8FwTo1MB3AtqTucUivSmaD6nbSukwB6sCVsg=;
        b=tFfQfjSp232Tpzsx42iUGpG1qaUzdk4Bz1owvlKB8zq0QxxR0y3RUAAYOm+qCU6fbX
         Dl1X1hBKOFe9ssQv6yfl9G28t8Qg9BUlBR2Yz6cKb7OtRDwN+zxlKoa9ASJI7trEOyP2
         zeAkPVDm+cXkbAyFFrPZdeKUrsgdp7RJD6a5pd3B6mfoYESw2L6yJZ9q3b2eVhmsuRfY
         oLDVbP2VCA74atRQVmkdgYKorn7eCgBxPWXjAI9lcaFe1wnMf/e3yVlJNITJxplfeWva
         YNNjtgsx8shHkn6oObBXJlte5jIbZ23k2JzS9BM6HXfJNB9ZoXU7caUKGf2FOAU0c7XM
         f3OA==
X-Gm-Message-State: AOJu0YwbdxR+SH4jFDtLa0Tp6auKqwO/uDUJhsZp3dBllGEv9QX3fYel
	78QpLFnngxsD/LUviNAwi4bdslBYk/1q0GPCkBEUAsZXSQrErQZV/aB1nf5t+UGwtc27riEncyk
	sYq6H
X-Gm-Gg: AZuq6aJuM7Hngvm2kyFDfgyWWh0WDmHjEWYwuYXZ7BkpaSRjGxx8qu00ojA/c4xGU6q
	6JrGcndm9gyvUDKVO3SWgBLOwLWvF4a+Flcs97+J/8uTwaMokNTIUAdzvP745as/ekSScPG9xwh
	OP9jkT4FnV2i2mhreMZPtiZU3G3h/oYQpYUevHa6WyoOGLSopWSUGnkx3nKmxv63CO+4g/lRu7T
	kq6DZ7mj6b6MEnyILPEU91CZcgRKH2QTPkBX1v4ztknF0fI91Yxcc24JGTLOsAUSF5d/vqdCmEv
	mu51wb/AUyY8sZML3e8PM/oAIw3mDi3Lcb24KFO3BUmxfQmlIn2AbKrzw7uqJkUPW5kyzgHDZlP
	P0xxvtrQpkUkFR8Z63mRM9TRfbm5mScK6rmiZHRpdCR5xHFN0+TVLPJ62QZUo8Lvd3l31wv6EGL
	ZTIZUmnMOwgijF15F+YBuwnap/
X-Received: by 2002:a05:600c:37c8:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-4801eb0922cmr273439475e9.22.1769071409192;
        Thu, 22 Jan 2026 00:43:29 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804252b02dsm47163605e9.5.2026.01.22.00.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 00:43:27 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-scrypt: Upgrade 0.8.27 -> 0.9.4
Date: Thu, 22 Jan 2026 10:43:23 +0200
Message-ID: <20260122084323.1892117-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260122084323.1892117-1-leon.anavi@konsulko.com>
References: <20260122084323.1892117-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 08:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123732

Upgrade to release 0.9.4:

- chore: fix wheel build

For release 0.9.0:

- Update to scrypt 1.3.3
- fix(build): remove openssl header req

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-remove-the-hard-coded-include-paths.patch | 22 +++++++++++--------
 ...rypt_0.8.27.bb => python3-scrypt_0.9.4.bb} |  4 ++--
 2 files changed, 15 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.27.bb => python3-scrypt_0.9.4.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
index 3678d46cf6..e4310fc5d9 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
+++ b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
@@ -1,4 +1,4 @@
-From 47ede0950740e8919c28774840e77f223d5f3124 Mon Sep 17 00:00:00 2001
+From daa1e4113ae8821d3922309989d083928f010651 Mon Sep 17 00:00:00 2001
 From: Derek Straka <derek@asterius.io>
 Date: Sun, 11 Mar 2018 19:55:38 -0400
 Subject: [PATCH] py-scrypt: remove the hard coded include paths
@@ -6,19 +6,23 @@ Subject: [PATCH] py-scrypt: remove the hard coded include paths
 Upstream-Status: Pending
 
 Signed-off-by: Derek Straka <derek@asterius.io>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  setup.py | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 419a982..3f1fe52 100644
+index 7c013fe..5510375 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -26,7 +26,6 @@ if sys.platform.startswith('linux'):
-         ('_FILE_OFFSET_BITS', '64'),
+@@ -25,7 +25,6 @@ if sys.platform.startswith("linux"):
+         # ("DEBUG", "1"),
      ]
-     libraries = ['crypto', 'rt']
--    includes = ['/usr/local/include', '/usr/include']
-     CFLAGS.append('-O2')
- elif sys.platform.startswith('win32') and os.environ.get('MSYSTEM'):
-     msys2_env = os.getenv('MSYSTEM')
+     libraries = ["crypto", "rt"]
+-    includes = ["/usr/local/include", "/usr/include"]
+     CFLAGS.append("-O2")
+     CFLAGS.append("-g")
+     CFLAGS.append("-Wall")
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.9.4.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
rename to meta-python/recipes-devtools/python/python3-scrypt_0.9.4.bb
index 4cbc4c06c4..0a5a841a71 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.9.4.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Bindings for the scrypt key derivation function library"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=05b5ac2824a7ae7489193b0f6a6f2cd1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=514fe4e05afed341c690c453fc87b10b"
 HOMEPAGE = "https://github.com/holgern/py-scrypt"
 
 SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
-SRC_URI[sha256sum] = "a7b637848ed518c1ea2b31a9ecaaa3f49616598d8442de8706cf1f01fbabf0a7"
+SRC_URI[sha256sum] = "0d212010ba8c2e55475ba6258f30cee4da0432017514d8f6e855b7f1f8c55c77"
 
 inherit pypi ptest-python-pytest setuptools3 dos2unix
 
-- 
2.47.3


