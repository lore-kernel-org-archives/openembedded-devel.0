Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA0AFEC10C
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 20:20:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6624.1774383599166449649
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 13:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ThjCr2oH;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso16604585e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774383597; x=1774988397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qa1zfcfn2laL5PSmTczBmu6QBEczrEL/01JQXDknq58=;
        b=ThjCr2oHCGk+S59/wzpKeO8QnR2buneu9R69AFLTCPHJtD+4o2EZkp2CrYHsffp2Yw
         Uh0vHbTlnEMP2FeCMwBLi8SRddrXMZPEvfrXGGrE2UdW66rtHMEzcbIRe4xKDPPmOA9S
         MK7nljq8X/z48+Db43LFRK1oKpv6HBKYsxYPgQsgmaxc8Jfy0a/qULwyhBEWZkXwHZes
         iDrZ9h/ru2C33Wsl6/pcj+hypRmmym1TQ0fmLUGWFkR6OR7m5yWTQudIXcWd9I0zsrnt
         V/uiJ16reqxNSK9M81JW8eG71cvX/zdGB2bzqBipUwuU0YxlbNJ9V5ul0glbnu6O73Bu
         RB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774383597; x=1774988397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qa1zfcfn2laL5PSmTczBmu6QBEczrEL/01JQXDknq58=;
        b=SB8hfjRk1Ouq6FtJjtd4rRoJqyzOqGlIL85/ZPI4HxIXfFvq67DdgQje2nJ09lbT09
         OsRskrm0bRGkFjTEvbH7h7jFrxL5+6ltl161TscKyrI3L6eGEW+UIMYBw4p89mX0cE3U
         m+W+N3HU30OzkQnNvmRv2bPLjBQssN4O4I4GgR87dMJnmSejks/AZXZEpqUSpEzFL42z
         ySVEqLx4INue6Sddc6Ma6CgR1w6IUXJN80FyoQ3B3f5wYBU8zPGaFTRJp903m2kfPqRs
         o2b7UHQ9eASAf8Fr9RuTDwxmCtmulXDdvwZlIRbRK1fw8nU4gj2eBGyh2CkzFYhNPDmr
         zG0g==
X-Gm-Message-State: AOJu0YxnJqnfwgh1LEktyeR58YrQ2xk+XWMvDq8i7bLVU+gtAJ2eOsWT
	ja3b+Oqu4kTRcGaO2L45jyE+GAMsGxzgEi8JukEr8bZYdU3TE/8Eeq2rid+roA==
X-Gm-Gg: ATEYQzy9XUvkO2bpFgi8Re6faUvnes1oTRvO555X+ekgbOtA/hpkUeuZGv4RgCEDsor
	W5DiSeeXJGuckToKn4SUG8ib8+r4XOr+mW4mWoo1/grZ9BHsvRKX7cqaFAlpWZAzksXP3UVDXfo
	YqQ6/yd0vrxPjClSJ3lVgJ38LuWo1kQfU3gK4oTS8qA2NaxK8ShqNCEmAXN4fQwWJix04FMCNyh
	Z99t0maTIMKIRV0E96ytObXhaMax6TpnSuAyHSF+BcwIq19BvVNBrr5JRQKg/55FdCihP3d20Fi
	IKc534sH6p9ByBYN9uPPyNUxMNayiHk/J38bF3ajWxnOtSYwKhvK4QC8AqLNK9YQ43Hn68IlPRb
	I0OuMzh5s2uzZWeRpbQ+Y9R61Dbx67e0flEvSbKMmm6pC1DYk5/oo5jAyU7EPrHipfoqqdVtuTt
	pEE3Ub1C7hY2Oltw93mzDN
X-Received: by 2002:a05:600c:3d90:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-48715fc38f3mr15699495e9.4.1774383597180;
        Tue, 24 Mar 2026 13:19:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116939b8sm113236475e9.3.2026.03.24.13.19.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:19:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-scrypt: upgrade 0.8.27 -> 0.9.4
Date: Tue, 24 Mar 2026 21:19:55 +0100
Message-ID: <20260324201955.3844896-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 20:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125591

License-Update: Copyright year bump

Shortlog:
https://github.com/holgern/py-scrypt/compare/v0.8.27...v0.9.4

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...crypt-remove-the-hard-coded-include-paths.patch | 14 +++++++-------
 ...n3-scrypt_0.8.27.bb => python3-scrypt_0.9.4.bb} |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.27.bb => python3-scrypt_0.9.4.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
index 3678d46cf6..73950f4cd2 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
+++ b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
@@ -14,11 +14,11 @@ diff --git a/setup.py b/setup.py
 index 419a982..3f1fe52 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -26,7 +26,6 @@ if sys.platform.startswith('linux'):
-         ('_FILE_OFFSET_BITS', '64'),
+@@ -25,7 +25,6 @@
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
 

