Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14390C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 09:40:57 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.3514.1700127646591882772
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 01:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQIhBBvc;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso85624466b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 01:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700127644; x=1700732444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc4Zms6KITjhLHbHHslVQuMF5NJdv0OMevhA2Hj+uCo=;
        b=fQIhBBvciSCoY5qiHDhZGAUnxnrUWEo7Rlzap/JErhbl6YEIoeEjZErPI6LaHGyWK9
         arfE5dYTyVwHAZETxvs3DY8Mzu6MXU7TX74F38sQYiZTulrV4OQ0a+WbFnRRJqpNlJlT
         J9e2iHfmHrwIp/iKw7AeFfzaQvSlfUxQUP1Zp9YeINxHsyC8vVdi9ecdam2w1s7weMxI
         tbLcbkxyQz+pMtpQK5Ej3H+fEHN8V9InSvVeCfRXOG8I0aaKQJjzOwISNi7XbVYP0m1M
         JmU0oaKdq225TPnifiOCbF9OJ6OreFnWobQ6tp0pHwnIICx/w/5d4zns1mYf0QJIlsa/
         9IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700127644; x=1700732444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sc4Zms6KITjhLHbHHslVQuMF5NJdv0OMevhA2Hj+uCo=;
        b=RvgQ3o8bONDaX+Voz+n0FiOGxiGyyKUAGaK38binlpj3rrjQRODtukWcPTtVL1JU26
         F2au6IEC0Pp4iGvtGLW5i4ShZRJiGwOuzUVclYYis1Si/5VFhHtdA53Y/NVn5k+Epwrp
         5zIiQRuQxSnt9/ZWzxg54sXqTNjycNk+6pHLcVeWkdlN6dw3ak2m6JH6eBsmewLD4yYV
         0oj6UzPFNMnOljhnVSlniRkwe0JoEHJ2AtrbvTBD57ArSuhjxOBRKLELO1vOsu/XxdCt
         CfSFwmtsQjE4QRX3SEPgszwlA9QI522+3OyjBWE/bstTQQNKiZFjEWiM6+yFYTkV/iz8
         i6Qg==
X-Gm-Message-State: AOJu0YxzTddXyCyBa2ZETuP1q+EI7QKUUHQHkj7sJrwzFcQJOapN9wqF
	oZ7ucK0NclBJ789iMyeJv9zvTnlMhe0t6w==
X-Google-Smtp-Source: AGHT+IHj/PhYHBiDuQJkjVUDddp6O94aVRJztkW7GgaL8xaYBIrmALzEsUyXjwhf2xiqKnGIX8oeXA==
X-Received: by 2002:a17:906:3b16:b0:9c2:a072:78c4 with SMTP id g22-20020a1709063b1600b009c2a07278c4mr10605995ejf.25.1700127644087;
        Thu, 16 Nov 2023 01:40:44 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id o24-20020a170906359800b009dd90698893sm8154286ejb.38.2023.11.16.01.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 01:40:43 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] irssi: upgrade 1.4.4 -> 1.4.5
Date: Thu, 16 Nov 2023 12:40:31 +0300
Message-Id: <20231116094031.150008-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 09:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106809

Changelog:

- Add workaround for Perl 5.38.0 bug that breaks the Irssi locale and glyph rendering (scripts.irssi.org#857, #1498)
- Fix Perl scripts broken by Perl 5.38 (scripts.irssi.org#851, #1474).
- Document workaround to fix linker errors when building with meson on Apple
- Fix meson using wrong filenames on Apple, leading to broken Perl support
- Fix /upgrade not accepting
- Improve compatibility with Perl5-IDEA
- Fix logic in how own actions are printed for other protocols
- Fix crash on old PowerPC Mac
- Fix wrong prototype of library function used in terminal handling
- Minor cleanups
- Minor help and documentation fixes

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../irssi/{irssi_1.4.4.bb => irssi_1.4.5.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/irssi/{irssi_1.4.4.bb => irssi_1.4.5.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.4.4.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/irssi/irssi_1.4.4.bb
rename to meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb
index 52de589dd..5b5af3060 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.4.4.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
 DEPENDS = "glib-2.0 ncurses openssl"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "fefe9ec8c7b1475449945c934a2360ab12693454892be47a6d288c63eb107ead"
+SRC_URI[sha256sum] = "72a951cb0ad622785a8962801f005a3a412736c7e7e3ce152f176287c52fe062"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.25.1


