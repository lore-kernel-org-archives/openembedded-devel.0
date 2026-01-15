Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1A3D33A07
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 08:29:21 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31224.1768465759834192662
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 00:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IvY2fPel;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so6946645e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 00:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768465758; x=1769070558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHss6UzGuo6QWJYYtXAMVuoDaNho7aHoGpozh4VjrIo=;
        b=IvY2fPel1/2gccxAXhCDXJ5qmhlQoJ8pQMl4qiyURmuFfhSWT8b8MDsDjgEDhDjyOY
         /EqSwwnM1/k0w7hob7cmp02u1gv9g3IxyAs4Yvk/bOt+yPEFXhiYkgooztg1PCZIxt/i
         qno0h/UXUzpNKknbN5yLIs+nYDA3D1irURg2ppP/YquOyFKgsNapHwssk+n+I2qJ2AZQ
         jjyR2bQmgf2NprWOjdlub7ux6/8jfHouwyV4taTKrssV7iGP2Y+Qb71YiVBC5B/0HV3X
         rpxCvGszFU+Wm6zYlRq47pR1wpeOg+PfduK32SyfY9omWioDHz3RMohBCYUnmQrNJe4p
         189w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465758; x=1769070558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHss6UzGuo6QWJYYtXAMVuoDaNho7aHoGpozh4VjrIo=;
        b=EhWyWwKNgQS11EZ3WEr/gWzTkDaJwnxznpiSZ1z0zjJ9trzJbzQVYVOMEN8IzRe87v
         mMKgjuL2s5zT32YmSGxkOO7fAlvsFvIap+vGpK3TCuaTfZQa4CIP0SdHt5Ex7osvhnOS
         46o7U3XG5Ls7XGfhE+I7iZaWry54CYABbWw1GI3Ntedf0bBHjHdZ/MpdUn+5WR2PyTfW
         C9s8+vk+V32mgrtyM4hAAECacQoCKNbRB0wLGm5y6fTSeHKauYM6w03SZHXLuYIJocK4
         7WPZUJBMAXq8eRvUHLmBDEoxrVEfxQGwrx+7gDB8413hMD2qmXh1+/MudpcfyEt1j+p6
         XkrA==
X-Gm-Message-State: AOJu0Yw+ckfby17cpFDjJtfBl8boFbaSRN7JCdwoC3JjAySrdlX0Pn2Q
	6D/6aux5sCv63Z3Pv85IBGa4WxNh0HzssNusAvOlP5p+0za1FpHZiyEtksu0Hg==
X-Gm-Gg: AY/fxX7F1/LPgkXsY4IQO586/b88xVCX0nD0lp3dfnp/RcZzq38VW3OqUFAo00+4vO8
	7qnzXgEsn1dOcWMpgLNLcoCTojpSNCFdzxVtOS/9jmNMnLzOHXP8lbG9I/WXNy+5xBK/yFFcFoM
	+9SQ0IZYbGukT1MSxO7Drtcft1isphmRNsvh1cLgsOYZFsdgpI0kZJ6/rZs3C8c4DKKFJ6oAeHr
	/kl+o9UL14sC4fcak1loiyH/1zw1Ef57Dy1huKlvKPokbIT++z7GsupQHq/tQhlCwwalciiUkbR
	S0qm/mjmlB3wlF6OogllflC6adNpqS2d2Mz3az5Hlc9CNqZRCJjB7lwxBJbBNs9Lea3EicJdL48
	LKk0uHtvgIYNrSaHTWT76oVAOQaIwO4J/8ELMQpYu6/u184Z1JEcXdP0zn/xeo6XlK9Ih2/lM1p
	dyz6EeHF8W
X-Received: by 2002:a05:6000:2082:b0:432:dcb1:68bc with SMTP id ffacd0b85a97d-434df0ed27fmr2494346f8f.23.1768465757974;
        Thu, 15 Jan 2026 00:29:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d90aasm4310083f8f.29.2026.01.15.00.29.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:29:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/5] python3-django: handle non-existing import from CVE patch
Date: Thu, 15 Jan 2026 09:29:10 +0100
Message-ID: <20260115082915.2357544-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115082915.2357544-1-skandigraun@gmail.com>
References: <20260115082915.2357544-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 08:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123494

This change is for python3-django_2.2.28.

During backporting a patch for CVE-2024-56374, an import got into
the patch for v2.2.28 that does not exist yet in that version.

This patch handles this import with a fallback to prevent throwing
and ImportError.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-django/0001-fix-ipv6-test.patch   | 34 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-fix-ipv6-test.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-fix-ipv6-test.patch b/meta-python/recipes-devtools/python/python3-django/0001-fix-ipv6-test.patch
new file mode 100644
index 0000000000..57f2a073cc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-fix-ipv6-test.patch
@@ -0,0 +1,34 @@
+From b56516c12f05cf56e65cc960f865d5ebdae733e2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 14 Jan 2026 11:05:36 +0100
+Subject: [PATCH] fix ipv6 test
+
+During backporting a patch for CVE-2024-56374, an import got into
+the patch for v2.2.28 that does not exist yet in that version.
+
+This patch handles this import with a fallback to prevent throwing
+and ImportError.
+
+Upstream-Status: Inappropriate [Backport specific]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/utils_tests/test_ipv6.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv6.py
+index 1ac6763..3b21948 100644
+--- a/tests/utils_tests/test_ipv6.py
++++ b/tests/utils_tests/test_ipv6.py
+@@ -8,8 +8,10 @@ from django.utils.ipv6 import (
+     clean_ipv6_address,
+     is_valid_ipv6_address,
+ )
+-from django.utils.version import PY310
+-
++try:
++    from django.utils.version import PY310
++except ImportError:
++    PY310 = None
+ 
+ class TestUtilsIPv6(SimpleTestCase):
+ 
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 3b5491cd5e..3dd64a5507 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -36,7 +36,8 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://Fix-missing-JSONField-in-django.db.mo.patch \
             file://0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch \
             file://0001-implement-group-method-for-FakeMatch.patch \
-           "
+            file://0001-fix-ipv6-test.patch \
+            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
 

