Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35E8D637A2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 19:40:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2579.1765914008998545964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 11:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G1SCFRVH;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so32243345e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 11:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765914007; x=1766518807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WxbAeBKLJhMmw7CHDoXf3837897aKOKFsGaJTDKIUk=;
        b=G1SCFRVHu9OKyi+QuK2CJD1nuf5lwRM8BvJM2WLBgWH4mw5AGSdazZRrtKNCKfuWTO
         eQHFHkgFEjkc+3t1W062WJYw56lD5M72P8vFkaAdiktLJveiY3oOeF9kHkHl3bPElwIA
         I50urc8hYxIV7/CfOXeQvAoKbRWUACEnlcJpzg1aQaJuXSzoFiEFG8D9xt+ouUGYEiZN
         jQ8qvHEX0SsMFJzTIES45Jg2adqfFtRXsL8UbEuVeTI4+by2aZ+umbpID1JEBI6Vm6h7
         RgZqPAnK50FazgYu6H8c9HWzl8wFpQ95UZCQcHoxKaJMnysvT2rClc6e5LWLLrjmCbAH
         6heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765914007; x=1766518807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5WxbAeBKLJhMmw7CHDoXf3837897aKOKFsGaJTDKIUk=;
        b=FEEDvqkstrsLyAjbGl2KpEjppSFDy86pYik7Gb+MOGmQRPGCjNHWZTXTTnt8nlfPDV
         C6BwysjiA7WDC2nVB7SeJlinVq9xMJzGdOfkptQVMyNYx2gtV/qzDOepqdQJ1EdzEi7I
         ntQx/vhPcoWX8uIToLeJbLlUcoU7XjFTJcQWArm/b+VC7KaGtueovP2eFDO7KKDfSIAU
         OZuBSzH21LKHQYTUSUNa5xk9ljpPXR1pSoHvvX1YgHN8gpWwxwyfXseb376ZRx7Zjt4l
         rdC2cyi8AKiHdvnUOIPejIcYY1j2vkbiFnf3Bt2rx6why5+vDeiF2F2ePM6jCUC1FgfB
         emnQ==
X-Gm-Message-State: AOJu0YzKUlxqNz6ICb9VVHmCMvd82aXLVaf2gqZQOWHpErU7yPwI1cZY
	ThcUiBPRtUxlzhI0snmnQgKzl3MZU3qMzsDvAd9Sb4g7fgtCUlpYM/gGF3/HRw==
X-Gm-Gg: AY/fxX55sV18IYMT38VgNvulW2Gmr7S8MG//DwGuk/7smM8vTNY5s/nYM/Xe0JnL5BG
	MyBbUWwb3vkm2xVeSWLWPcyEgQMFsANL+U7jpIqzVm8pDvnTGGyHOZ43Y4AFGBEk62Gm6is1RhT
	h8Lwhcn5mob5zw5nCkjRm2NstWIz4KloOWzTB4dAsMG57Hp93e0nMlouTcQYZeUYs+IiWuTLrpo
	AjCIjz53pPx8RaQckIf316prwGBZS2XLFxouHHEDx58CFM7YSnRhnD+99IsH43JF5+fJ4UzmteL
	C1xq1vkSIGWENilENAralS3GvGYKzmIRVW1xDbSg5lQCXkXWnPYpv+IHVf48yPgF7qUhKe7tCBz
	+7LoOHfgnpsAkkX7joPZR5FX6q+Xw5cXdhRpRVFUsqObyved/J0uA4wYbGGwm+aCOpkx4dP3RFK
	rsQRFtoTL3
X-Google-Smtp-Source: AGHT+IEk4x2KVxfpmwJPlwp3F+syKrQB7wmDnYqiXBC+DyteDgUmDmKCUwEB1uf2hcaFWAvWXb5p8w==
X-Received: by 2002:a05:600c:35d4:b0:477:7b16:5fa6 with SMTP id 5b1f17b1804b1-47a8f89c85dmr191352885e9.3.1765914007246;
        Tue, 16 Dec 2025 11:40:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1defb4sm4741395e9.9.2025.12.16.11.40.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 11:40:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/4] postgresql: upgrade 14.19 -> 14.20
Date: Tue, 16 Dec 2025 20:40:03 +0100
Message-ID: <20251216194005.3006575-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216194005.3006575-1-skandigraun@gmail.com>
References: <20251216194005.3006575-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 19:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122708

Beside other bugfixes, it contains fixes for CVE-2025-12817 and CVE-2025-12818.

Release notes: https://www.postgresql.org/docs/release/14.20/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
 .../postgresql/{postgresql_14.19.bb => postgresql_14.20.bb}     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.19.bb => postgresql_14.20.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 2eb1deec07..76363cd26d 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index bbbb204..0919d2b 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.19], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.20], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
index 1d8ab90c25..04d8723f15 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "727e9e334bc1a31940df808259f69fe47a59f6d42174b22ae62d67fe7a01ad80"
+SRC_URI[sha256sum] = "7527f10f1640761bc280ad97d105d286d0cf72e54d36d78cf68e5e5f752b646b"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \

