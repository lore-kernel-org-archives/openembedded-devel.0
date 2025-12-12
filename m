Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77AAD49216
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:14 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11040.1765540694400190110
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M65eGURt;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso684100b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540694; x=1766145494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgX5RDoKG61VAcjcQwx/bFNkopj3MSUT3E8aNyUbMKs=;
        b=M65eGURtAQ16sTFsZHVT40/MvQEsqitp988ZdPxVSvmYo64erIflKw5aKeVwqhA7kW
         pExYDgPE4TcN6q0QDxojBUQJCZ1AivTcc2Hc10832TL5tPG3Y9Hyfe91ifd88leKaS2R
         /ADGhNR4WZ1HxU1Gcmm+wCvmitxcAzlAiiihZH8823t+BpQsmACJHdxpY/JiAcYZ0MXV
         CSwaZMgn/D5OxDs8qAd3qR1pCswapWjGOV1uf0paRVF42Fr19cPBJtLEE0RGdVC4FoNJ
         szY4dQLkMRgTuk0k44E2P8dkHcfGnlOZzyyza+l0ZRM6BTu+NxaTJQ6n5CF9pDfcP1Yk
         aEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540694; x=1766145494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FgX5RDoKG61VAcjcQwx/bFNkopj3MSUT3E8aNyUbMKs=;
        b=uljfvOSeruMbxul/GaojCbZohYR2dQWLggOanLeZf8t6f0t/JTUi+nev9F6paA/PYm
         MNMDmNBJIBr+kJRdBfhxxkr0N+AfFKbLhThd95Jp2s3NVBhBOWAUKYPeqniWRMuKFYjk
         GiuowaB0IZo1UoJfhWQhuNMG+jg3w2saQrdqTOzUYkZOaBM59mkA8MYfo1pk7kekRNH9
         Jb5QdpFncltzP8Ux6T3EDx51QBm8uNTUAaBlfNs606wlYJ+/Be8wo28HbDIrr9YNBecp
         pUZvdhtKbfcP4hrt3KnDVBy9ZFkS5+wjoOcAAdIYnELrCANvVxcz1G9BQiRIEPB5kUlt
         zhaQ==
X-Gm-Message-State: AOJu0Yzdl6FDocLHWwGzhx8gJEBZ/dYqDM1FKvouF4UtGC2i4VUhZ0AF
	J2Lg9r/ZNiQEpxPOUm4UArAFjWvaFdBEMmQ4iSiDmPZV2mSr2c1vZJ+CbL1pnQ==
X-Gm-Gg: AY/fxX6lYe8D4S24OvkCyun6p8aBVIgHxzjzJM2Pizz595joNAU6zw3JXDdg/qj+RSb
	Dix6ai2kO7R4JFoHdOxCnTkd1fPYoO47TnmlovHhaGWlU8s84wZqq9MyMeCC/lQRlc8LRojZRZh
	HK3FG8uGCNak9ovXUdEkFeuyfE078+pUFgO7uJDpdHCeG3bf8nTHz7bn2OPBXwEhMCgrJPoaHin
	FjVnhbdyfyy8i0su2Q+IS1EKGqC6162JcjBjsfa8O252vrP7hxmYw9j0213LybwIJ8J/r8LJfj5
	4CS/dwitpT8yeQ0VCJh6CkThphAHWFNj4n0Uj7UfLVPlT+C8ft4AkGb8ssK+Sqo79iBD4jdpbU8
	HBtndwiPopcPEDkXY57LZGWhoDnMfRo6zBWdTzGSWeGYZokdZZ6YT1Ou8CMk9J+H2CU0cZSAUrK
	WjbNR75jw3SEwyxEpOZavTpmtzAnFbZRcZdw==
X-Google-Smtp-Source: AGHT+IH0KG5wVl32ALHPsBBivB2BsPVbyqevLAWIvPKWQfhzTr8uwXyQsK4b/DNLaXD1WHePINXNfw==
X-Received: by 2002:a05:6a00:8c12:b0:7e8:3fcb:bc4a with SMTP id d2e1a72fcca58-7f669c8a4efmr1815648b3a.31.1765540693632;
        Fri, 12 Dec 2025 03:58:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 11/15] python3-sqlparse: upgrade 0.5.3 -> 0.5.4
Date: Fri, 12 Dec 2025 17:27:40 +0530
Message-ID: <20251212115744.569676-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122611

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Enhancements
---------------
* Add support for Python 3.14.
* Add type annotations to top-level API functions and include py.typed marker
  for PEP 561 compliance, enabling type checking with mypy and other tools
* Add pre-commit hook support. sqlparse can now be used as a pre-commit hook
  to automatically format SQL files. The CLI now supports multiple files and
  an '--in-place' flag for in-place editing
* Add 'ATTACH' and 'DETACH' to PostgreSQL keywords
* Add 'INTERSECT' to close keywords in WHERE clause
* Support 'REGEXP BINARY' comparison operator

Bug Fixes
----------
* Add additional protection against denial of service attacks when parsing
  very large lists of tuples. This enhances the existing recursion protections
  with configurable limits for token processing to prevent DoS through
  algorithmic complexity attacks. The new limits (MAX_GROUPING_DEPTH=100,
  MAX_GROUPING_TOKENS=10000) can be adjusted or disabled (by setting to None)
  if needed for legitimate large SQL statements.
* Remove shebang from cli.py and remove executable flag
* Fix strip_comments not removing all comments when input contains only
  comments
* Fix splitting statements with IF EXISTS/IF NOT EXISTS inside BEGIN...END
  blocks
* Fix splitting on semicolons inside BEGIN...END blocks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 705abb20c1ec1d780183eef9ffd2a02894ef42e6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-sqlparse_0.5.3.bb => python3-sqlparse_0.5.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.3.bb => python3-sqlparse_0.5.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
index e3e0e67c15..d8c3bc0ed7 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI[sha256sum] = "09f67787f56a0b16ecdbde1bfc7f5d9c3371ca683cfeaa8e6ff60b4807ec9272"
+SRC_URI[sha256sum] = "4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e"
 
 export BUILD_SYS
 export HOST_SYS

