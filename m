Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12740.1792777448862291798
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 10:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tXH8wDNP;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4d870d54so768020f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792777447; x=1793382247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cWjDbXz6WfeStn3Zho2yADjmUlPJwvp1LLqtK3nrEI=;
        b=tXH8wDNPUIo3O7bQpX8xVcJ8tDBd7isIX5xdVcm12RX1IfGhtBbyfJEnrUC13VSoAb
         1FpCm1FIvh/s6HYpxWqTCiZtr2uyH2D9V20qsjTU66eb9bAS1wNGcfrC3BM6eMQMPzZe
         IdvxR0GD2H3eaOUmtBL4iDnWHcZrKZguP9rno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777447; x=1793382247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cWjDbXz6WfeStn3Zho2yADjmUlPJwvp1LLqtK3nrEI=;
        b=GLhGHVUR4okLL96ORCQHKlJmAcfNjgUsED5a5ZcCVaWShYPsXBSMFgXbm+kW/B73Kv
         xWoJQ2gZWlFdsLhaA/9UC0Q1BtRvKwba3xaeHv+R/8NyNC7wivxYp2quoTTIaHl/Zl+V
         YbJogcjOXNzjXRxGP2VW7+YbMEyOv6G2Jzz3dTgzl1b1JXp59yU5TMIoAUTQbyDFbaqh
         FZYwTIMHb93tkO6VusKAkIk3cDRhS+vLqfL89AVq20befoevDwrocFqJk7YkWzRr2QLC
         9jIcjUiZHDV9/5lFnBbAcqnEyeP3kBi+9YQCKng5PUHWz4f+/dF1hBjQa/MkcQYA4vtx
         QPBw==
X-Gm-Message-State: AFq9FYJQrq2ykjZ/3fMv6dUJWE+76FEenAmoAlY6hiZYj0wCSqw4yhah
	y6/wb1sHJZbGjEN27D7wZeWa06nUdnGp5kplM2CDY77tBPNxMZui69ijvUgQY6+s6a0sB0zizyJ
	PBUKd
X-Gm-Gg: AYBFou2fJVnFQpavHHyUsWsCpmplqC+1nIliwfk0RS5MW69a6+/4L+C0Mk7R+f33EXt
	qeeR8jOcyyNDplhN+hov59HypxYyYbGc03ZURM8GmxtTDcwy/d4JjlvdW6tA24zDLHxXfHGImJM
	KrRVOK6ER1HCAMRA/MpKChf6tjg9YjYPPu3Otgv9CP57+aZOHo+ELOe7jxpb7EckVoanWnRQk1I
	Shas+B+mklpChw9sBrTUVB2vS8G6/BTThfxwaoTNUSKNGg/29R0amfD2UgurFK8C+WOOLUcZZkP
	49wCnObrVhUpOES9DyHIfKqDWHwGP/j3CxZdGjK27icSMnIf6318er64sYgDB+xdxoP6HRqmJ8f
	Ad/qFykRbLMSnC65G+FziDbv1hRDm6Ks6zg34n6DPin7ILUGkVI4tpw/fRUmj4p1HoeshgEmMJ5
	fAiYbWXaEFZz4iz13UjWZ1pfrIwJ02VoVhImQL9sCTecVDuAOtGC4b2sqgBvBh9x41rznAtBmTt
	TgUtavj5YruFODyEf/w3eIO8bMRxIsQEHVwlmfnfJzaqaMYqJXedvA2Cs2STCGZh/tuj570D8Vv
	i8jRksZP1ykkgSt1/iLzsOQqwxp86uA8vk/Jt2yjGzazHoPkCcWc6QY/y4GbaLght/w5PFFwYwq
	FXSsK
X-Received: by 2002:a05:600c:620e:b0:4a1:f03f:f1f8 with SMTP id 5b1f17b1804b1-4a211c731bfmr46239085e9.3.1792777447150;
        Fri, 23 Oct 2026 10:44:07 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1147864f8f.14.2026.10.23.10.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:44:06 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/9] python3-brotli: Upgrade 1.2.0 -> 1.2.1
Date: Fri, 23 Oct 2026 20:43:55 +0300
Message-ID: <20261023174401.3617912-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174401.3617912-1-leon.anavi@konsulko.com>
References: <20261023174401.3617912-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 17:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131381
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.1:

- CVE-2026-111497: out-of-bounds write permits remote code execution

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb b/meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
index 8e493fd0a0..2c1bf23f64 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
 CVE_PRODUCT = "brotli"
 
-SRC_URI[sha256sum] = "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
+SRC_URI[sha256sum] = "02b2f7b5a83485efe448a44ddf7983def05c3bb1dcf917d4f7154070260e13de"
 
 inherit pypi pkgconfig python_setuptools_build_meta
 
-- 
2.47.3

