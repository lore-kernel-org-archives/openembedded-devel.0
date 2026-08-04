Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873D2C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 23:04:09 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28845.1785884648334025457
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 16:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k8wVTGcc;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d032846c95so5481335ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 16:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785884648; x=1786489448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M39g8I802nvoZfYbLBq5iBubt0Mw1EsmvkOGwPV5WRI=;
        b=k8wVTGcc5fCUy0KN5X/jDxhnBmx8nBz97Yc7Ql1r67C0L6tQc+1mol7VHEr2nIU3AI
         ldbcgFIw6GotS9oK6l4BDAo31z+AAOb3QfbM0eExha5vbcNN0iXCRTh7bHa2y77nOgou
         OQGD4xG3daRspl+OEJ9BJalKN+cfch96PUsblXNsaxrLSBNUva49rtQUTic08m9dsCRk
         hSuCuJTrfgNPkIs8gFvSStUlnLWtneifPWgCnxV/sczKDracp/wMLGmW6bhVh5HhUgWB
         QrAcNdjDG9zxIq1Ny3GalCDIVphlIkJBdxFKLH7o4GSTW9rqI/kO2uhWQtdCEmTgtRNi
         00/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785884648; x=1786489448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M39g8I802nvoZfYbLBq5iBubt0Mw1EsmvkOGwPV5WRI=;
        b=dHQLUYf3Kco0VN1SlHwt5aLs455SDJ632amy6xc58iZkI1NWkYGjGbT2FDA5Br2fwZ
         XOxDpablViJWFJ5TUZT2Oubt8oAVsc6fFDkclf6UL/uh0w7tpOG57SD+s3Dx3ZZzG7mv
         JJ+qFiKCIQCkmgsR2wyLjnjgw5r5aFoEZelFrEy4CHj4KjBJXlI6OXj5eaJOP97nGCou
         bHCbTgTnf13ecdT5BtMdlYJOGz9BiLsjxxi+Ckg7/Lamw/FCJHhvL55dMr1fXNve2NLs
         4O+7x8WC40I27yYghj5KRKDS+9XNxFNFF6F3fHmlxaEZjQGv70/VjSuqzHEWpn0IC4uq
         YRjw==
X-Gm-Message-State: AOJu0YxYYvlQJUSo1aSvfVVMgRBaAA7DZx4MLnhNvHp630abaRZummkM
	WJi/RDoiyQB2cUsX+fyFfu2HmJuJCsKrMWp6iaPFIADaAI4Na2rUUOGeBJwV1FRJ
X-Gm-Gg: AR+sD11AAANRbiJpmpshuvCGvqB4dY/7UQH2sgwBF8YRY8P0rG7bjbYyAtr5fRT9hrK
	qqJHsxHCYDbwBj8UIJzCuYzdYO6cBPEHFGAy6+Cns4a0/Pct9z7d+8wrvjECRFCUH9kb9uz7AcG
	hbKvtr5iyVk1YfjR7JCRdcSG1mCgqQFXoM5+1GTWFxGw+qNaYO5OOh3+8dOWqQPl9zWnPfDuMOn
	6JOqwglKJyLEJmUqd7eueh/yub40+1bT5dhIU4Ol2fK0IsUJZtILmDlr0GO2yKjnqx1VQL8ByoT
	MTskRaXCoANygggs1q7WVABapV27MPPY8n5RxTIQw+/xRyL8kAC/iYe/7cXEzCP7p4A8XLQkKYR
	DPztDkYaT6QYhdbzC1+CmgTYZC70U8a9yY6pDKbahA7qVxTjFio/sc1sm/JwCdeh1GS8um46yN0
	FKjz+phLhZFmlbTCiEQREnpI1XrRTkwtVxfvr2d4W0QgHbtUoOXHDFE3Al6nGVHfqn836xeFIv8
	0AKWNytwuH0
X-Received: by 2002:a17:903:fa5:b0:2cf:ba10:6d6 with SMTP id d9443c01a7336-2d0ca71b510mr23814885ad.4.1785884647496;
        Tue, 04 Aug 2026 16:04:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm13444844eec.21.2026.08.04.16.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 16:04:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 1/4] python3-django: upgrade 5.2.16 -> 5.2.17
Date: Wed,  5 Aug 2026 11:03:55 +1200
Message-ID: <20260804230358.365670-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 23:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128785

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/5.2.17/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.16.bb => python3-django_5.2.17.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.16.bb => python3-django_5.2.17.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.16.bb b/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.16.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.17.bb
index 2629ff3714..a9009adaf9 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.16.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "59ea02020c3136fce14bef0bbece21a10a4febef5eed1c51c22ae468efa22200"
+SRC_URI[sha256sum] = "9d4d93be539a18ab80d058eb515900e10951e04c537c5a6b394fc49528d3251f"

