Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14659.1793092859472072864
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uikK50Si;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1802848f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092858; x=1793697658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3AreGmwnTwVEclfvfvHXhya9saswY0p32MI6zrBCVU=;
        b=uikK50SifuOUpM42EXIEy2W3ZXzI0mQI6PqNpQU92OGl3VzRp2PfHGD/9OIo/7OP75
         3K1TdOdTmRJBs9G50UkofQCGvyCc7X4d72PqbRqFOU+8R/t5C/dsgWUIjBMs3p79lH4M
         nWyMcGc+wag4wHfR48uB84ddQXAsfUvvUMwzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092858; x=1793697658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3AreGmwnTwVEclfvfvHXhya9saswY0p32MI6zrBCVU=;
        b=HOaOCOmNVwuOkBwXuSHkPYEl1hnLig3ISBP7IZ5yEo7FcRFCcMKYFazXRNNDSunLY6
         /5TxbkctHm4T8HaZqJb9AWRY36ohAHvdElMGV4Ohjp/LMkWQ6oeRTbrM9Ypk+J6pR5ib
         tQV0YOYYHKJ74k2k4nJtHTg41yo4sYMESXHhqr9XqLKbKYFxXj19BrDq3/igFj0HkmDr
         v4fpfPPUQXTgV6UQZVrqCxsZRkW6W+JDjJey+iYoeiCWlSbA78lsGTB0DM7aTFxAovDp
         91VcRF+p8mHsW7KQPndwF9nZG5z9/E14vTZS/0Dlrsam+m7MROKagx3QB1rWJ/UXbFR+
         ENhw==
X-Gm-Message-State: AFq9FYLUWkrxGd9Oh3AVdvZ2GGT2eKjAKII36Q2uB7o0bAXC7kkNNHB4
	xbRj8ysqxRTlUlYGesK/1GihSHJhA2OoqY8OfB8A1Dk+fd+z8ANNLaWFKPugZFoJTflGN/d1Itk
	N2nmh
X-Gm-Gg: AYBFou1hR9OgXBzV4SBZ7lg4+nO+4MSLoavk6DZQpDbtLVidutYiS9usyoOrDm7qIF5
	A4UW5hic5Ypb7/FVu94EBNZvxQpxxrEYRdprC0XiGp1YCg4vV1cf32cJM1tK5Gdlo6q9BeRmJOU
	U2+hAC6M2b/qQQPqDJ1FFH14DQF+WuB1+/M+8krk6M2OSOkp/blxAJRnR55xQ4/SCBQ904ZAH/I
	5LION3a7LSlUWYhUgLLwvVxOdfhocZ066T+86KDJafAznZDC/5gM9uzuOZlTHCEWknGyZEcKZrA
	UAH5TZKr28SANFY5GeNEH4L/+ufc1Pd0404WGyO0oPi7bCPkyDrGQyO5rpTwBihYGW8AwnEk7OK
	DcOanLD6ZusIWPu/XVBzsevfNBruykPS72OJK6w3sfJPN/2J/Lps20u1cad+yG8ZN8JoMmE2xqq
	g/D82ltK2FJR1eMEP8jKx6XgzKKSyj0Pd6k4n+mKgVe47ep5/l2C3mxj8klNSBpH3uWKdnVc2J4
	oBztaZZYqhxi2NOYkMyhsSNLTklA+n1IP8LKGyCgfJa9jS3dc3e5WGK2eDEtqjBpOeJZecjDCwD
	qRhVKSMOwiJSjJZegGedWAYr++kN3rLpjtxLNvBVIKXQBW+9OX2amr6mj0Smj/OBlkN07Tr6dQN
	TtVOv
X-Received: by 2002:a05:600c:3541:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a35acc76eemr164477105e9.34.1793092857726;
        Tue, 27 Oct 2026 02:20:57 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:57 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 24/61] python3-pymysql: Upgrade 1.2.0 -> 1.2.3
Date: Tue, 27 Oct 2026 11:19:51 +0200
Message-ID: <20261027092028.782979-24-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131488
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.3:

- Restored the ability to import
  pymysql.converters.escape_bytes_prefixed for compatibility
  with aiomysql.
- Use pymysql.converters at your own risk. It's internal functions.
  No backward compatibility are guaranteed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymysql_1.2.0.bb => python3-pymysql_1.2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_1.2.0.bb => python3-pymysql_1.2.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.2.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_1.2.3.bb
index 12a9e25aa0..3bda908ff8 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.2.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[sha256sum] = "6c7b17ca686988104d7426c27895b455cdeea3e9d3ceb1270f0c3704fead8c33"
+SRC_URI[sha256sum] = "d5b288529782e536ae171866df3ca9dc4f6cbfb3cc2f18e6f837fbb90dbc262b"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

