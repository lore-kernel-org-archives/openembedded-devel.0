Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14646.1793092840243364156
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sE3LSKGF;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2356693f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092838; x=1793697638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWCU95C5/VsRn+MpjYHjS5u/1a+p8M0ISA4bV+3wJ/A=;
        b=sE3LSKGFhSMAz8ebTofqyTYzAMQbHmAkuw7X+sLFk2X8rGqmYSjP7rr95I2owNJjlx
         3aqP8XLgx2bIHboyyfcJ7Ww/qkW33VkDyPUlBDCrxtaN6rKBcRtoJ9gw5ZaNs9NBgq4d
         GlEI+6fuDFxC1BR89D7TMkTRwFDHS/kuu0U4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092838; x=1793697638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWCU95C5/VsRn+MpjYHjS5u/1a+p8M0ISA4bV+3wJ/A=;
        b=CpCWjjoXIU82AmDT8JJmnYDoQQRe822t/7MTSGw91/o4Ou3Xu5bjYWJcfQc0e73IzL
         byttY8qjgpwK4jTrHIygaMoemSCDhfOCj527cH8wj4ourMSwA3hS7VCRzS0gfb9l8eJ9
         5iUa1VnkfyhbYBuIpX4MOA5XyA4DJbPRvaeUqB76vaNOrjo2YQ2LPtpn5JmGHsVUvbmt
         LPaI91NPmaL8y/0NqS/yZmTN2OaYuUZKQyhq1ALdC49DwaYKHCGdOIYYqBppAsZsuPro
         FWQ8/Pug6sjo044HhHIG/F5sEkj0ELKa4QVT8w7DBtAA3E70IDmCvfF/+af34tvylQUH
         IUBA==
X-Gm-Message-State: AFq9FYIA4SCh+rNQ8I8z145KG/VAeonkdV6zilzZmxaKD2XaVLAifwOW
	xISO1D7R8WZlkzeKlLIuIWHJPCNj4zZIeM62SK5aoAvvqqfVJwZRVHgrFyVRT+L4Q2QOIJY88cU
	Fh1xh
X-Gm-Gg: AYBFou26yQO70q4c6QYbKW7bNXZ5INtRYrsFnBsBInBH8EnPOxzldLkkAr0D+jkCuQP
	AR4KBVwfWCW/1hZtTs+pAU4SygcpNF2iWZ0H5plRTMC3gk9OircQruWjzpVC2WHLWC3PGlSdyx4
	/iWOztuRvT2k9yp3Il5xJQglLHQGWyZVwNHAy6XksXSEkT1QcuYknFWdMvEGqX/attx6Nwjx+rN
	nQZvoFXN7iFXmHQjnoKyWA6dPyIFrqY2iueJ8p47lPYvj9lBxZ8CR+GXH6/YtzjwdK2QgyHyUSa
	TzWWVTFeZGAvvPAQynkKnQT5NEKN4Qf7YgibwWcSJHuZSwfAiWg/zQiEyp2t0fbmtpw5vkV1/tC
	XxYlafheHX4NjxeuzS44wwFzEZHhxFEg0KySEsBgM4NGZWkzBiNpKPGYWhb0G/8cH6Jtn+kMv99
	BdXWFcRGVu40qLsZ6eIDmaBrwQ4G+H3S4B3SeDLn42VGuNOXWx+VMOJvdtE/vXzTw/kmkcGewW3
	zzxSyh8m1e6liyZ9D3VCcS0e0vW0Bw2F/xjKz+FmZIYCIgwZWX9f1syLenGsmPwdhLcpWuZO+EV
	J8zTDUzqLnRkCy9KzqT5LeORuUgvtV0OBSTm8ArGAyCkoKvLnDYIz9yEKT8eWcCZfMzNE2B0SvP
	raCov
X-Received: by 2002:a05:600c:4e4b:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4a35aca5bd3mr159019375e9.16.1793092838466;
        Tue, 27 Oct 2026 02:20:38 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:37 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/61] python3-grpcio-reflection: Upgrade 1.84.1 -> 1.85.0
Date: Tue, 27 Oct 2026 11:19:33 +0200
Message-ID: <20261027092028.782979-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131470
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.85.0:

- [AIO] Fixed data race in PollerCompletionQueue.
- Fix SyncServicerContext abort not raising exception.
- Fixed channelz module leak.
- Fixed CSDS memory leak.
- Unpin Cython dependency for source builds.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...reflection_1.84.1.bb => python3-grpcio-reflection_1.85.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.84.1.bb => python3-grpcio-reflection_1.85.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.0.bb
index 27c313626b..2a2452a6a7 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "09d72642fbabaf45f8fb9c86b0d3cf45945fb7c7c1c4a2dd3321dfdb05cbe2f8"
+SRC_URI[sha256sum] = "b50383d750c2bbddb9c2b163b41de2219550e4393e1f1e0fb0080b8e1284fdd2"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
-- 
2.47.3

