Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C75CEC1E94
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 10:20:30 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17487.1770286820519796352
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 02:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QMaN9qvy;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso625573f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 02:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770286818; x=1770891618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMaEMMII8Eyi15nYdeEo4PEyp4n8X70pXpiIve492fU=;
        b=QMaN9qvyO7D+WwTMN+mHvsjGyem0NG8BkiN+xZY022sqNsqbCgBZcuuektBAE6cHfY
         8I9gj0UjzfztjIgNmK1S6vjODQTbZ76sYlGbFzbuytePBjuewEbPgkY9xSRyxt24+09H
         3h8r4h7UT8YP6ACP7a1/UeZLUprNfR1U0l5zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770286818; x=1770891618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zMaEMMII8Eyi15nYdeEo4PEyp4n8X70pXpiIve492fU=;
        b=wvS0yXMePEVqXT/u3BHTNmzFenCa9PxhXU72xGOU1G15048YX5nWlG76lxVCUb9Mox
         Co/pJbVlfgLUBci0optcCcRhZ7Qn5u9CHLxkzAzphZ1bM9YH0RXJQs06Qq3DNj6ldDux
         rxQKpa8emN4Rdm5jAbu83FGjZcNkBNq/Xm4VLXFoqpbtXXazIiFZJmsAw7W0O+Fn7ye1
         lXcSwnLv+n80E7+e/BbTqqqmkQMuOMPDETlw5qZcHaXA3Sp5+zBeFIphjyulonhb5wfB
         wM5bbiVYJU877aF35JJ6v0SrPMKsFyFpg1Ex0jddBn5noRQ9wKfFmytgNXP4pHxVz9BU
         nGTg==
X-Gm-Message-State: AOJu0Yz+76qJa2BzlKdgi/LMhMoGC9Qqoh3Eb64+S77A1YWBlcTwJyB2
	9QaVtMYRRMq40jO43FihfF0hl6ii9Wrsox1QAOeGl1soN0jxQZSF5zT2RveXfrgCQfuLv3YKR69
	fZUdt
X-Gm-Gg: AZuq6aK0zIHaR4myzE6IU5bRqTBECwc9PZ9qWnFzKTLsRPoS8yJLpXz3HNiNTaXxlxf
	frpMJHmdoEZvss9wv0LFaQc2C8tl9iHOyrhzlknjf7KfgUzSdi9YDJn7xV1n1/KGOk1hiLTW8aK
	uOED4hq3LeCJC1JvRE//usUrtDZ4CMow6SVHjYe6ctNHf4Zjx9l0FfhxXL5wEik9E4aDI8reczy
	8sHAJfHaQ1qgai8Nj6tgShQb6iO7KxR4w7XWrBCA1Ju+PpwyB4mmEzrLvnBYxlURVJfUxmXCsLb
	jvdO7DkfrXC3avYUMoq6sPGV2QzMgin/U5OY4dFJ1BkkHun8hsTEtrBsxlwTrMEMqMM8ZG815Kd
	j18wdJZYvDW3PmymQgMGzZczXSZ/wigRuw1m6+opxp407ttFJLyHBJoLq+54or57XTcSfRiQMrJ
	TAOdkVbjgcPX97bAYlcqSWozAq
X-Received: by 2002:a05:600c:3b14:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-4830e93a276mr85437225e9.16.1770286818485;
        Thu, 05 Feb 2026 02:20:18 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a963sm40625055e9.9.2026.02.05.02.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:20:17 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-dbus-fast: Upgrade 2.44.5 -> 4.0.0
Date: Thu,  5 Feb 2026 12:20:13 +0200
Message-ID: <20260205102014.1462884-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205102014.1462884-1-leon.anavi@konsulko.com>
References: <20260205102014.1462884-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 10:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124207

Upgrade to release 4.0.0:

- Chores
- Apt-get update before apt-get install
- Fix unix_fds parameter types
- Wrap lines in docs
- Annotated types for D-Bus signatures

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...oml-Remove-upper-version-constraint-for-C.patch | 14 +++++++-------
 ...s-fast_2.44.5.bb => python3-dbus-fast_4.0.0.bb} |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.44.5.bb => python3-dbus-fast_4.0.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch b/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch
index 5366627abf..e5b53340a8 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch
@@ -1,4 +1,4 @@
-From 85189fb66d3abb2645605f8a3c14d8152ef755fe Mon Sep 17 00:00:00 2001
+From bca444d7069afab9e1ac84f765e744d308d39e57 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 18 May 2025 10:24:19 -0700
 Subject: [PATCH] pyproject.toml: Remove upper version constraint for Cython
@@ -11,23 +11,23 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index e22ea42..f670d3d 100644
+index 6604cb8..40bd8c3 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -50,7 +50,7 @@ pytest-cov = ">=3,<7"
- pytest-asyncio = ">=0.19,<1.3"
+@@ -50,7 +50,7 @@ pytest-cov = ">=3,<8"
+ pytest-asyncio = ">=0.19,<1.4"
  pycairo = "^1.21.0"
  PyGObject = {version = ">=3.50,<3.51", python = "<4"}
--Cython = ">=3,<3.2.0"
+-Cython = ">=3,<3.3.0"
 +Cython = ">=3"
  setuptools = ">=65.4.1,<81.0.0"
  pytest-timeout = "^2.1.0"
  pytest-codspeed = ">=3.1.1,<5.0.0"
-@@ -104,7 +104,7 @@ module = "docs.*"
+@@ -108,7 +108,7 @@ module = "docs.*"
  ignore_errors = true
  
  [build-system]
--requires = ['setuptools>=65.4.1', 'wheel', 'Cython>=3,<3.1.0', "poetry-core>=1.0.0"]
+-requires = ['setuptools>=65.4.1', 'wheel', 'Cython>=3,<3.3.0', "poetry-core>=1.0.0"]
 +requires = ['setuptools>=65.4.1', 'wheel', 'Cython>=3', "poetry-core>=1.0.0"]
  build-backend = "poetry.core.masonry.api"
  
diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.5.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.44.5.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
index 4f21ec379e..15bbc1706e 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.5.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
 SRC_URI += "file://0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch"
-SRC_URI[sha256sum] = "e9d738e3898e2d505d7f2d5d21949bd705d7cd3d7240dda5481bb1c5fd5e3da8"
+SRC_URI[sha256sum] = "e1d3ee49a4a81524d7caaa2d5a31fc71075a1c977b661df958cee24bef86b8fe"
 
 PYPI_PACKAGE = "dbus_fast"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.3


