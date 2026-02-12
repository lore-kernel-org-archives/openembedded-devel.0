Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA21EEA86B
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 22:36:37 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58281.1770935795793684552
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 14:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G9OewddY;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so2388925e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 14:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770935794; x=1771540594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIzeZ7/ut4IGP35qSTlnLd1k0X5Wc4h5oCWLQc/WO/Y=;
        b=G9OewddYb7FtgcyIHvvtmycYwi0jD2TeS6pNhudBk6HF5QFZMlbVwW8Cdf7GIVCML0
         pbwpMig60WFGmcjEB14Cq0suQBVXLXMeXEsQ3gw9WoWEpmUjnwEbncGySKJ8Ld5EG7Db
         C2At7Q4WaeZXF51i76swNfp0tkMgkXVwdtZHUyr3CmRiAdmvKPlZu74305yvouODdmfA
         8VG+4qW72DeOgCnXxf1V94x5Ayyn7LNjWjt/+Er5vw7a5db5IW/yq3+GVVhW5TlWYkIB
         WzCPjww47hYnQWPy7SzxGlmpph5CBCm3UBgAvJAmzO7wEaVuMxTM3/Qfq4evBrSe2qJs
         x+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770935794; x=1771540594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIzeZ7/ut4IGP35qSTlnLd1k0X5Wc4h5oCWLQc/WO/Y=;
        b=T2gfOGRKGpRDgjQRflSn8UbfKwiF3jCx3+R3Qcqo4eUJxwugDvR1aqE0a+ps/vtiNW
         9/or4eERCwmGc4qptTiBhwG3og4+vBCOWK1rPnuKmaXo4Z7INlmNXVlsuMl6jZmkqZY0
         sw+CSH1yqU+QD6+COxo+JM7//u5uBVvLSYzAEHGWXx6Xqm3XJUDAYoAXSx6HfREd7rHL
         rBEp+0DM6HZnI0ZHgLhAX2Itzm1mAh9tBJAVawWylN4lJO6tePOflyY/FEPDUwCdzx6V
         KrpP6ldJVpW4s4CsmwNHng/l+pTtk9yXaSaxMJT4Wkqt9il9rzA7bxxCBDfr+WJuNPeG
         9VoQ==
X-Gm-Message-State: AOJu0YwuY2r8SxzcGIQkwePsZCIENErnzXGRwcwMRBKXFiJqDdl9L08S
	i99clee+y+yRzTQKhYPrR3Sxr/1K/FwWZdgTPm2pgaNEhtoVMg0UEuQ9r5XKLA==
X-Gm-Gg: AZuq6aIz9rr4EwT2MtluiJktKXsybC3IBshNvGJCedEcuFtjTFZj5D5WGqTJ9mYSinE
	digx9Ko4SuxTd5ytexUyNGToWrMDbN/ta2K74ZXdig3gs0XM5aFjKlFFu4gtRRZI7oMHEhlQ8qq
	OcLLSUojjXqRyfOtsVVy1wFIKsvoyOojqh3RH/Wxx1c6cAGXmSlpR6ADZmcpBP1zUQl7pctJ7zW
	FoT7OeQie91tgZ5zeJWTM28JXZpv8jFXr6g3nWlfcHuhDp2trelkBPXbTIuWkziV7FezVP7DPaL
	R4OVeZwXSHVARH9UNQ/KKZP/qZ0O0B0F96ZNvyILbidT7ydoEvVRfjVyKSbQAY4jGaXtgVZ/jK2
	Ab2NXl5rWxpbOk2Iewr9H0SyhzqQvI2gpkMh9zKh9Ssd3KQm3w4Y1jxiw9koyj4ZM/Wvnk5/4zU
	mQ/1euvMNyNY3cE2TFo14m
X-Received: by 2002:a05:600c:474e:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-4837109740amr10170815e9.37.1770935793934;
        Thu, 12 Feb 2026 14:36:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99e194sm116308435e9.8.2026.02.12.14.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 14:36:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: eric.meyers15310@gmail.com,
	eric.meyers@arthrex.com
Subject: [meta-oe][PATCH] redis: add back DEBUG_PREFIX_MAP to LDFLAGS
Date: Thu, 12 Feb 2026 23:36:32 +0100
Message-ID: <20260212223632.1099944-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 22:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124363

Without this redis embeds absoute build paths in the binaries, failing
qa check. These LDFLAGS were recently removed from oe-core[1] - this
change adds it back to this recipe.

The qa error was not showing with redis 6 recipe, so it is added only to
redis 7.

[1]: https://git.openembedded.org/openembedded-core/commit/?id=1797741aad02b8bf429fac4b81e30cdda64b5448

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index 8abf758930..63a801dd57 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -47,6 +47,8 @@ PACKAGECONFIG[systemd] = "USE_SYSTEMD=yes,USE_SYSTEMD=no,systemd"
 
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
+
 do_compile:prepend() {
     oe_runmake -C deps hdr_histogram fpconv hiredis lua linenoise
 }

