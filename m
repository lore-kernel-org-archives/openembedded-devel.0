Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21.1794324470140897363
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=T+/t+2Dy;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso15687805e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324468; x=1794929268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7db/hJtYltUg4X9Lf4uxy8rplWIrDwAuu756OcrCbes=;
        b=T+/t+2DyM5cozUm4raXCGJ+L4BBDDF1x415m2Zd1rJzxfCRKnIP40zVNpL1tqKuD0K
         s3e6O20ssOdnHSNuZ207RQwkSib3MC9bqWVKFVZ3MVGR9u4XKMhiLGN7MO/3ZITPTpzL
         jDzTKu4B65kbD1mXSPnVkHhatlo4pZDECybzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324468; x=1794929268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7db/hJtYltUg4X9Lf4uxy8rplWIrDwAuu756OcrCbes=;
        b=Ih2SjMXfYwOD3MvdqBxfu5rBXDEc9ZUMJVHzv1UND2vXUU4s2kQupV3H/DZYpXpNVI
         W5Obw2K2mrBlwLJ2e+tnfCu1DdpzjTugaWpPYhWVf8b2M8EguBqTUVXyhTJHG8AeDl/I
         joN07jKS2MV4/gZf1cjqF7JK97YEhikuOp2I4TDofxqLCj+0+GCBdrFViGyJ2yWjRPrO
         ingQOkQpHm1Ah5tnJ1cfmmQVnW3soECjPZIaULL9Nz2ZpTrXJ1BmbEspAFWpMzBcbJtT
         s+iP75mJVKe/p64iZX38r6qcEIqjOyqeuo5dCdus+ShA2fczK3uXx+rhek+02rOgRHJN
         2vMA==
X-Gm-Message-State: APuU4Z+rUQ5Or3mLICVCfEBmIaRBbsS6RRPxPLSzF7hGFOxmCcvOXRGz
	f897M+PC9TUBz6LtE58FRRDlMFdlETzCDlOmCRL4ox0Mc8/D0B0cfinSEL4AHLGh8q/whUycKPQ
	YmJ9u
X-Gm-Gg: AYBFou3EvU9fmvbAsXDFlF8NEnQ/A+tpKhVIO2IlzFXvhUa1OPmtp1R91QUUJCu96Tw
	aEtUxyoRdvYke0Ye3XCMtpz1+EbSabUROfNgkybJuazWPCB5+5KWVbaCAhTcb2nCIDWnRJEOKpo
	fiHwzeetq6feDS1jGGy1griTWdGT0W76OR2TwL69Di8ev4/CeHMYfMrW+UbxnnvZIJsDYgP6ov5
	2ppAzNGYoJt3oI7vG5+D6fvok+EPvpBYvTu46pbYD0m0+NlKu2GnHmOuZltcJsj18B6SzY4KJ+w
	tp84xiQez7QLbjBSDW7/f3YWB63u45T+ldH0phKggzUbFVbpS9npcVT1xpDGS4JYSahskpXeIgx
	cAD33coLBLOO6EUH68ED0xJ1TC3znWH8sXiZUYIg604vj4+phqR1eE+7nMDfumJxX9op83xQb6D
	2yPLKq5vlpGWvAOIxx0wjr5WscczCcWbf9fWPqaP9Amjg+/FLDcgxe/Y8GzrlVz349qZgInJLQi
	xH00iRYT2geR03xVGtvxgQ5gul3TnZvZNCDynGPZVu4FcOiylRDxwHhobArcEdgw5oZYJsQ489v
	qlP0o8LtLosmUHOz1rPkjks5Kkva7zzQrs+ibZjaLpsFpN5ZC/RlYaxuqKLX5jUtWqA+GwSyjaJ
	f2st5zg4oMQKEO8g3VbkWlBTzCLiGuyMbqujjnzeWLczp5mpI+v6EOQ==
X-Received: by 2002:a05:600c:4752:b0:4a5:87a:50ba with SMTP id 5b1f17b1804b1-4ba0235ba4amr50046935e9.33.1794324468264;
        Tue, 10 Nov 2026 07:27:48 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:47 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 17/19] python3-truststore: Upgrade 0.10.4 -> 0.10.5
Date: Tue, 10 Nov 2026 17:27:27 +0200
Message-ID: <20261110152729.1065911-17-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132091
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.10.5:

- Take the context lock in wrap_bio() as wrap_socket() does
- Add validation for server_hostname and check_hostname for
  wrap_socket
- Add explicit support for Python 3.15
- Mitigate thread safety issues during handshakes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-truststore_0.10.4.bb => python3-truststore_0.10.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-truststore_0.10.4.bb => python3-truststore_0.10.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-truststore_0.10.4.bb b/meta-python/recipes-devtools/python/python3-truststore_0.10.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-truststore_0.10.4.bb
rename to meta-python/recipes-devtools/python/python3-truststore_0.10.5.bb
index 1d778a8642..0fe2c8e9ee 100644
--- a/meta-python/recipes-devtools/python/python3-truststore_0.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-truststore_0.10.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/sethmlarson/truststore"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74420fc3965c4558a4a1529e63c2867f"
 
-SRC_URI[sha256sum] = "9d91bd436463ad5e4ee4aba766628dd6cd7010cf3e2461756b3303710eebc301"
+SRC_URI[sha256sum] = "30d36967ccaded5cbb38d602c433f53600036c79d502f4533a49b60a03bbefcd"
 
 inherit pypi python_flit_core
 
-- 
2.47.3

