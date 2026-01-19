Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62168CA601B
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31278.1768811328678668440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=coVaQL2/;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a137692691so26153715ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811328; x=1769416128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSBKaOPZopSxt7aBaDuIwuUIJDhoUVc54q9QLI8Prro=;
        b=coVaQL2/xQpot5TMnw2oA617bPaW1BuMMxqu9DUI9MWK4ZT9QdsHwvosQommqQ8jsK
         GQVWZOkrnqgIWrF+0Y1i57bgkc75uqPQmCcrhkfw1bADN1eGOMVvwkUH9jth0R/hw455
         WjVHAwubyQU/Mr1lWfuugKOWCdaWR8KPYp/tfcF4M5dc33GKyCStpnjh3oTF9ha/yHJg
         p4bSPFWL7uTBxSczPqym99rbv8Mf9GYz1r6Ky+8GjL0B6hFZv6n0FfJ4j2ACDd/r3RzN
         N1BSEIJePacwxHUYkOApaDqhdp/rpsu51pidDeXEFlLYHYKjGsD4OZPcaRp673h3g3lL
         MUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811328; x=1769416128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSBKaOPZopSxt7aBaDuIwuUIJDhoUVc54q9QLI8Prro=;
        b=CMvs1RqyLe6+PfNbXzhz+hoF6layU2TkG0EhYX3uXZm+A8GzGe1qMQUP5OWm+UaUQX
         +4cyBKY3jpsNdRGI71TxCzJU+fiVV7FwCjfuQ7L2hOaMivneuToZ6S422SM/EmbYxyWR
         Pk/EeP3EknOni3j7VwA4bDrirBWhquSgsH/c4ClelPNDexApJHWWIGcuEzdOtZOABVaK
         o7WOelhd+1wPpxJz3fuRb5s49TJ/X1YmXy3ElB4Hy5K070VHzoIjIF4eZR6sREobtdZL
         31HUCXw9kJ5hHSl3N4boJ5gH5OgOEwablKG6bYj/kplRUGpTWH8y7Oqm7l3+Ym505pzv
         mDLQ==
X-Gm-Message-State: AOJu0YxgNZSqgXknukl/UQdxWPYxmdClA3SKGgh7rHc/+GBd9828DYQU
	kksEuro7YwBkyQ609HpZ/6HI6FHrb+/71vejyC/MoSPWXZZHkLej79LzUudXiw==
X-Gm-Gg: AZuq6aIB6QvtGGCPqozm3qvtqzLITay34c5HBNloVf5GFM3rDQlY0GnixVI2MqJ9QI6
	Yo7Bu8ahKHS3Pr9tdBIUiCMhK5vAgAdQmJKeu61A7Fekm4SKUsGoxSdQ76BWB5V6nGPbB0Qsh6n
	uoi1y75SqEWR0rPfgCNLDrMamyLZ7DwbIr9B1dQdK87rzot7cDnS4RrufIR4qEAPOUGGxacICe6
	zlMOUgpvTd5m8zU9DzTpJjTWp52Tneol60cEAk/LC2pTWrsfNGm6+iQ2x0IT2TEaynn5lfFa5Dg
	r1JfaR9V+lMjVVxvUwJzG480Km6bbMX04Eqx7086TyTfS+/fLujxUhgXn536DpimJr1uzNleGMw
	6d5XoG5y3e/ZnTW7MtaUxQpth1FLMp+FEBUoeYjEUjFgeteYLFciYI+98jtWN0sMwlsNjwXpa6y
	KIas6TCSfyllsz2vA1ophdwLQ=
X-Received: by 2002:a17:903:3c26:b0:2a0:941a:6b08 with SMTP id d9443c01a7336-2a7175395a4mr93357645ad.21.1768811327760;
        Mon, 19 Jan 2026 00:28:47 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 18/28] libjxl: Fix build error with arm and musl
Date: Mon, 19 Jan 2026 21:27:40 +1300
Message-ID: <20260119082752.4120991-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123612

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Build fails for qemuarm with musl with following error:
/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1/lib/jxl/convolve_separable5.cc
| error: out of range pc-relative fixup value

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 63ae47a70d6d81937f5122c535d890678ed3c13e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
index 7b0a6db9fb..ad5b5d169b 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
@@ -46,5 +46,8 @@ PACKAGECONFIG[sizeless-vectors] = "-DJPEGXL_ENABLE_SIZELESS_VECTORS=ON,-DJPEGXL_
 # lcms/src/cmsps2.c
 # error: out of range pc-relative fixup value
 CFLAGS:append:toolchain-clang:arm = " -fno-integrated-as"
+# lib/jxl/convolve_separable5.cc
+# error: out of range pc-relative fixup value
+CXXFLAGS:append:toolchain-clang:arm = " -fno-integrated-as"
 
 FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"

