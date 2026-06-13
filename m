Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6BDCD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:19:25 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87402.1781338757164777048
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o1N1xhRc;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so14251395ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338756; x=1781943556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcNQ2Sk4JCiPWWXZe9nMuv+v/6oAvFwd0XpVHjbrtSs=;
        b=o1N1xhRctkrN7I15zpDcU4Qi5elVGXcK63yJfJagkWc56fB7gTeBZRabN+K37LuHuA
         Ww4qJpiobGWywu6NnlA0MlkanSjLOXQAFJPY5lV8kSOk75DjIMM/+lJ0BnJ3zLux7RN6
         fUfVXP1RXQlSjHWND0GU9EWilgCknb7eWdu2HweKusCHvcDXXaIcRcaw8Qepj2YjHuid
         Y9wgGKuIR5vF30OO24tfDIrJ/2KYw6w3lR8LJMC3uefKzO04f3RdhsZFL8hmc/iCAU1T
         0Z3TVfp5WezDbX+yyMC3D5g8x+v2Clp1jkCelTJBCkWfLHuUf3bo7hIAKapCip60B9Lk
         VK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338756; x=1781943556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CcNQ2Sk4JCiPWWXZe9nMuv+v/6oAvFwd0XpVHjbrtSs=;
        b=QLVfSKVj4wHh9P2zJJkH0hp8f9RwmFbJWeZmQ1n2kiJRwTxGztnhtIfpOp7hIvQH+6
         hE4scyyAE5DGcQpov5T4DwziYy1hUSelZD0rBMdUfsgP1/xWmU9mesIwhfN23X7LdjV3
         2Xj/f4zodNmD3bx4GZd5sUDWex7xWl4papITopw5YLFYpvyDqZ4c476QtQt+DARZRjBM
         Hv1cKGNlIVbI+o+oOwVHSjGfYhrjVlD/Ny4yTz60FHmXlelTm53E/vxTKczfeBPeuN7E
         MS8oByGLrEZzjqVB4isyXD2FuCFfa2aLkQESacuAUTWOm/aJi5OwVC+Ym3Oj5cwio5F6
         v1tA==
X-Gm-Message-State: AOJu0Ywt8HDZWHFypZW/9yK+0umq7ksFI4+ZKjEexkoj+DzS11pZxJJw
	KEvVlGxpzyZ6MBpm9RoXHegYTG4+69yx2/KUh5bS+Gi4OM5/H9zmbTi/d1sZM7w4
X-Gm-Gg: Acq92OHngC66g+YRWgEJTmApGUC1Lu5qo0QtiNUzzRiMuoWxMDNNDPFCPRhAea3m4Ys
	sWpJ/fXw3lDRnMcYXQa6HM7/StY6WwiYqah2JP/ccENw1PmOfxxR+Ysgbyt6uta/YQf4zHVrYRe
	oUmJ05QV5iYp1rA6qKS9958mIDCA2VrEqegjTAIP2KiLhN1gVAlsOWfFU/T+ygDLw7pNay2lImp
	oXUJAkH2Q7xYBIUyK6icHe7RUvAziHgjXJO/KM4FAf2M1VU2FrXGJVNTAMHw/iV96x/nDNQnigd
	7aG9ekmGOmNQLg5Ds3dDD/Iifk41sYt8OHC/0PMAeSbifXYSN2Y8bq5Fi9Uh+gmLH0UGSOZbLWJ
	yYBEv7iXLWBQL7Zg2dZD85eY7qwE+p4QLV+KueU6CiszpBr4fyw32biqMUAbpAOP/Sq1EzImqZW
	/87pNw0k74BIaPoiP4M3qnt9iuuEBoziiU6Lp+
X-Received: by 2002:a17:902:e887:b0:2bc:db35:96c7 with SMTP id d9443c01a7336-2c412f16571mr73922435ad.28.1781338756546;
        Sat, 13 Jun 2026 01:19:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:19:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][wrynose][PATCH 15/16] python3-django: upgrade 5.2.14 -> 5.2.15
Date: Sat, 13 Jun 2026 20:18:23 +1200
Message-ID: <20260613081824.1223609-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127567

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/5.2.15/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 18576ace94ee0dbaefe549fd058e1c76f1390a72)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.14.bb => python3-django_5.2.15.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.14.bb => python3-django_5.2.15.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.14.bb b/meta-python/recipes-devtools/python/python3-django_5.2.15.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.14.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.15.bb
index e9bfabc734..557c2f1522 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.15.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "58a63ba841662e5c686b57ba1fec52ddd68c0b93bd96ac3029d55728f00bf8a2"
+SRC_URI[sha256sum] = "5154a9bf84ac01dde011e367f355c07dbb329532e06810dcf3ef2af269e236e7"

