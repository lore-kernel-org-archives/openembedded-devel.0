Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76A6FD2D68
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:17:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38525.1773145049851626567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mk1W5Yrx;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439f59dfda2so227407f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 05:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773145048; x=1773749848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnyKSYGAMm7EqPUKcJmMi9aJ9t+IoF46k4mCNkBUBzU=;
        b=Mk1W5Yrx5g4EW4dDe34JXXQor6OA1OeUlQzzEd6/4jYyir67ovIOlQ0elRmOgta9LF
         j0rVouNazQfWPdBNGLUNSMbQJccUT4PaPi6vl2JwpYdajM8FqRTdzIKdRRkMffxYRloM
         /SjorTXidb9dWeQ9H5NQTEggEp/M7VuJAQA72Um5Ti+Wa9frPgEF3EPUfZxMV1sjiq1x
         XdMopqutzFsoF09XEsnReDyo7Me4TmDkUAMvwUD6fQrPMXT7hO+PFdgd5+B5+zJvhhIX
         X0dJwSZGY1vXOxIS0T0eK5WQ//s3IMIaI95eUOVtLBpgsJFvbgLurzxlusUFJuE8ADRR
         8wrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145048; x=1773749848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnyKSYGAMm7EqPUKcJmMi9aJ9t+IoF46k4mCNkBUBzU=;
        b=q2PORHm7x1Xlv4exkH5geQY8SffgcylVZnoDjjVYx3LnkGRixJlCdoAmFbyO4jFlAF
         s61CwUPg36ZSJPunS7KR0kXB6vIxOwXO1+uznZEEh30fHevmTjpkOgGH3floMFpRORJ2
         ODHX42sS0bX3onfUbIHmjiKtAHqiDoNWj+X2h+SOTUB9Q39lvmEZTW7Qt/rB7LgcTyA3
         0hGm2CrCgOZia9+lfBrBXq2JiVHw8WLULcse0hAuU3PHhe8p8kZ19mz+GOjF6B6SZmsh
         LJjhgCwiBFO9wFgwv/dWhhiVIjCJ4hBHItlhhn6y6GpcVd3AxAqnyyFE2ilL7vMPg5dy
         OaOw==
X-Gm-Message-State: AOJu0YysB/W1TesUxkTNr0d+a2OizGqcSbAix01P+zkNxKtXDrTcGXNE
	yiXKPvWK7ztXY8bChoSMqYwjXKw+noYFMHe59JoOU0anvIO80MVhRdOYCbx0pw==
X-Gm-Gg: ATEYQzww1YqOi+vfdegaailP/GpaZZY2Efrs/GkMayQdAyqpZzRAcXDd/+dVVltXX4A
	NKBWVXJduDc4pGrzFMQkKV5wZNubMysAALXdaJg2EG0bBKNhPLCPg2qJEI6Bjb64LY99xxxvL4D
	spXXGe1nYfaxn8JQkNIAw6X8cziiISeeOgwEpHfcjUsShxpctaddk0qlT+4Eln++35WzNFHRjkm
	PD/SCHYZuc4qVr29L5QtC98gHOxW6Q6fngERejEVEi8pnqWy9wfjbmVplFStDUnHqehBXK9WJZX
	YOkqgMUOzZMxJ7/cxV/rYvVJiYYtCGn0Cja8i8pJSOsP40Wx9c4sKlrihyj8JTh2GPTGXnTt6JD
	LdNB6r8RX9tFrCo+4M+hmD186aCEMmF8cKniP5Y6+2Gxb6u3vnrZgR7qD4U974VfBz3X7kVBcBn
	buldMunah4134QXtiskvXN
X-Received: by 2002:a05:6000:25c4:b0:439:b62d:bea6 with SMTP id ffacd0b85a97d-439da36a70fmr25448741f8f.47.1773145047855;
        Tue, 10 Mar 2026 05:17:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3c80esm31822538f8f.29.2026.03.10.05.17.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:17:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 1/2] python3-django: upgrade 5.2.11 -> 5.2.12
Date: Tue, 10 Mar 2026 13:17:25 +0100
Message-ID: <20260310121726.1115244-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 12:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125026

Ptests passed successfully.

Changelog: https://docs.djangoproject.com/en/6.0/releases/5.2.12/
- Fixed CVE-2026-25673 and CVE-2026-25674
- Fixed NameError when inspecting functions making use of deferred
  annotations in Python 3.14.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-django_5.2.11.bb => python3-django_5.2.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.11.bb => python3-django_5.2.12.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.11.bb b/meta-python/recipes-devtools/python/python3-django_5.2.12.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.2.11.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.12.bb
index edf9aabb79..a7567265b5 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.12.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3"
+SRC_URI[sha256sum] = "6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

