Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68073C982D0
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 15:33:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8683.1768577596687336239
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 07:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzqwmSKX;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801bbbdb4aso10288325e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768577595; x=1769182395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+G7Vi+Fa9anGeeIveMMoYB6vZ15DlFrK58XYxWOQcyw=;
        b=GzqwmSKX0f3aA/p5hhgMw9TLLm5xKnnSLvNXJmkvtN6LdRdF8w8mfRZI1giPmpZQ7j
         vUnv8dYrPaFlycwJ1joi1XUo1W0TNrFZWjlOS1rOqOCV+P3mn9GpejAJtavHmouA9THu
         mhCYHwVqjUXc4Fver9tCUwvzlPeOo0IlpqtAiS2is3OD3DxAFAE4eSFTrLDHI2D6AvQ/
         5/3fr4Cho9o0r4dDx9jMyZ32iw9U5KV/dXfvpE9jpHxdvB3zse4CLztZBtwM0JzYMsCI
         bWQZyfDKcmBHC0red3HtzdXUEcJp42cUFFsQ4uFqqFFrMyf62WM20Z6Qdwpoi1nC+sr4
         /zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577595; x=1769182395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+G7Vi+Fa9anGeeIveMMoYB6vZ15DlFrK58XYxWOQcyw=;
        b=fBgXy7Xdnwjmr9PjjZH/yJH+af6URL7ANMOfa4CncuNHOwIH2nWfDbgAsrpuKtA8ge
         +sQOivG36S7rZXMXive9DzP1CgjmmOv9J4hmHd+t1Kj/KzyMWXZ8iS8lOavQLauwRCuT
         2s3OPUfVkPaGC+g6E1VoNWYh1OK2vfoREnruKmybhfohc5aL6Y5Eoz5QWvXvC9P5nyeu
         eghPTRvwrCF5jIg5enbcngEcHK7Fr6tLFStHHl3kA3duc+8Hjgwr/cK2lNiGfbuTaZUt
         qwZiiBcP1/xlTKNTLX4DNzlgzy+Q6cYWwkeJfA7NhsfGB3g2gqG49zro9l95ybwYc1YV
         DL1A==
X-Gm-Message-State: AOJu0YyhWYLRdNlwvxKkFYvhfkuDsCwZthp7GLlPmn+aPoavFRKllqTm
	ouHzHYHSpOIJxsuYPKeUHRS7G94MJN0BecINrxF+CVR4/BfdQfJwI6dvsKiZfA==
X-Gm-Gg: AY/fxX7rT0OC6M+GrYTRgDc4FiQTINyY00YGbwCg/HJpOH0Pr3Gzslvn4Lrm4uPqbvb
	SleK5YQ2G93Eyjske4QOryG2CCr7go6efQQHrCbmcH/FCS0Mh9YNYhhqhRhRbcrqP+tqLauf9nj
	zcJgM7n/cA3nh2B9i8bK6ywxt4tycGl7Oplm9oblgumCAzjiwB9OHfbwZlb1SoEWps3+T+gXSI0
	D0+jcs2SKuWxyE6rArwrtpw2WefuaNsWZH5izfmvoZ94krxJ9Wszv+HJRD31dOPs1wAIjW66oZ1
	UVt4HKBBE34axHIYmBI+VYhf4xJSD+mBEPVF4KQjGcxDG57hZiNzIcdiCvUOgP5dqCowGmhZmG8
	EAtSwmBcl9HwBnuFxYuygG4MVJhJax/KbnH28l58JWdwdxwJz1E3tgz23lWu0eIj8p2Rdzvd1WO
	Jx5giJHeOK
X-Received: by 2002:a05:600d:640f:20b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-4801e7d2a3cmr32121415e9.17.1768577594954;
        Fri, 16 Jan 2026 07:33:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801ea19f94sm21010985e9.3.2026.01.16.07.33.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:33:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/5] python3-django: consolidate dependencies in .inc file
Date: Fri, 16 Jan 2026 16:33:10 +0100
Message-ID: <20260116153311.3444648-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116153311.3444648-1-skandigraun@gmail.com>
References: <20260116153311.3444648-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 15:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123535

Django 4.2.x recipe has been deleted, the dependencies that were specific
to version 5.x can be moved to the common .inc file.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-django.inc      | 3 ++-
 meta-python/recipes-devtools/python/python3-django_5.2.9.bb | 5 -----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
index 317793abba..589f6a5b85 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -15,6 +15,7 @@ FILES:${PN} += "${datadir}/django"
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "\
+    python3-asgiref \
     python3-compression \
     python3-ctypes \
     python3-datetime \
@@ -27,6 +28,7 @@ RDEPENDS:${PN} += "\
     python3-numbers \
     python3-pkgutil \
     python3-pytz \
+    python3-sqlparse \
     python3-threading \
     python3-unixadmin \
     python3-xml \
@@ -45,7 +47,6 @@ do_install_ptest(){
 
 RDEPENDS:${PN}-ptest += " \
     gettext \
-    python3-asgiref \
     python3-bcrypt \
     python3-compile \
     python3-docutils \
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
index fa9fb2e929..11f438d623 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
@@ -5,8 +5,3 @@ SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
             file://0001-Fix-test_strip_tags-test.patch \
 "
 SRC_URI[sha256sum] = "16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495"
-
-RDEPENDS:${PN} += "\
-    python3-sqlparse \
-    python3-asgiref \
-"

