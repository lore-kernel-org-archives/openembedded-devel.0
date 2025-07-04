Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E35BC83F07
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 01:28:14 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.3146.1751592487197691401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 18:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nqoh8veg;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23636167b30so5197675ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 18:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751592486; x=1752197286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3X+/NHRMWA5jTuf9MNTHfleqlF42FIJiJRZb+b6Pqdc=;
        b=nqoh8veglRilom550a0k6le71D2n1V3VjaBV5eoiRYPZR4T4z+pJ5rnakLf00h9JCg
         L8cELfNDmuKsxG78k9HBnily7BStPUQ1X0p7fv6UGNyXYZEXN0RlG6cVmwQrg5dBqmIX
         EkWWOe/F1M4iZ8AqYiIizOYeaE+T9MNFGcyrLDoaFSIla8y7NfGGnqor4fnZsCJSXgNK
         rcDuo+JrWAyXepzKaQcln2jfvOgrEu8R/NvqB0SP7PKSYvBIeWCbFJZZjGck2WdQhZd1
         o07thBkxINFRDCXk5BKV21IGhSyAxezi0AAndVK+RkDJ5ep/SV99CnI22hPaMqlsBCmv
         MqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592486; x=1752197286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3X+/NHRMWA5jTuf9MNTHfleqlF42FIJiJRZb+b6Pqdc=;
        b=JWYr9wM1ZX0jKPqgXEJ7W3bR/9I1qDZyIAfe2+dzpBUMfbgS1+QpYL1tdMp9dIpFeq
         xc8IP4T16fZ4fOfdbVBTXZu/IKSmq7jknLIVZDLGj64gySoiAa/aRLgRnmsiRhDUJ/SX
         WaC2OuUCqiPJRjudaYEw1Zo3Va7gr0qIsj8JS6v9vXgnv6t+Ip31Ql0F+yL1GFwaVlZ+
         XsPfn7AMeb+GB8DpTMnMAaPNFQOeuHiOELMtvkSp2abOiRy0AD0E135zft7oRbQlM1lB
         TJnwP5oCmGJpvH/2omsarnm0rPWjoXFyYh2Tf7zyRQWWstITlJjgixq5SHA6DyrkvBVl
         /rnA==
X-Gm-Message-State: AOJu0YzN81/LdktCVTd3+K/A5BgzhCO1eCr/6a5bnOt6d/kURMDgOlEF
	xxMaqmlrDecPGTRgR2efX1WEZI01gfXZ0/Lzkr6CDg4vz5Zax6p3NJZZRFtwnn8K
X-Gm-Gg: ASbGnct0nV8icbkR5rxr9KW6qtGa4IoGIsk/A4hj21nhJnZvkgVxVyXPOOy79WiJmSy
	SHq+E4dU1MVogyrwfZbKVruSiOhH2htL3YQkkwxSjh4h5tqjtrOE2HgZHxG4qpzSklBNBj87yIX
	6Dj4X5JBB50MdlDZaA5pHKx2HaT5b98VwsWCtTbemwhJIl2RZhqrt57LCEd8p4Nbu0Xws9MGugI
	TQIyX3IJbnv2ulKVAnkIZMXJK0/x6d9/KVdg1aS/3Ep4K4bKTYogcSDbfVt4O4lq3H/+yWQa2Un
	s0DvmxefVWmdmFljXsflRT7IoXkwmk7Osym8ar+jUp07JBQRg0Nq+w==
X-Google-Smtp-Source: AGHT+IEpiNC4d4Se7e+Pa5YqMyHQkvcMGFZwQedoSBFujkngx3EBUkBWxkOnqxiQTDWIbUwhhq621w==
X-Received: by 2002:a17:903:184:b0:229:1619:ab58 with SMTP id d9443c01a7336-23c85eace89mr15644655ad.43.1751592486241;
        Thu, 03 Jul 2025 18:28:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845bf52asm6735365ad.241.2025.07.03.18.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:28:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pandas: Loosen the search path for generated file sparse.pyx.c
Date: Thu,  3 Jul 2025 18:28:02 -0700
Message-ID: <20250704012802.2817020-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704012802.2817020-1-raj.khem@gmail.com>
References: <20250704012802.2817020-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 01:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118228

Hardcoded path works only when target is x86_64, but fails for other
architectures, loosen the search path regexp

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
index b817b0538d..d32f0e17bb 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
@@ -42,7 +42,7 @@ do_compile:append() {
 }
 
 do_install:prepend() {
-	sed -i -e 's;${S};;g' ${B}/pandas/_libs/sparse.cpython-313-x86_64-linux-gnu.so.p/pandas/_libs/sparse.pyx.c
+	sed -i -e 's;${S};;g' ${B}/pandas/_libs/sparse.cpython-*/pandas/_libs/sparse.pyx.c
 }
 
 EXTRA_OEMESON:append:class-target = " -Dnumpy_inc_dir=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include "

