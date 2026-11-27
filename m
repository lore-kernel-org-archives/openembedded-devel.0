Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8104.1795739769220005721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=W2OQfKPU;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0464dd6b6so46224425ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739768; x=1796344568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zI2X09dVA4VE0y9C+oiwSrLEoxYclZgDszbih3nl6ck=;
        b=W2OQfKPUTjJbTipckfObOZbnGXeit5DWy2lM4xTf/416bHj1gsx5A4zPrlpyweY+iH
         +l+xWY3Bq4TKX+0G3e8Fdt5MCIRBaXlo9GqUyNZ22f0qwk2LN64l5RAo/YecD+FJGV/o
         DkURIjTWXOE3AHR5EVuKbGM9b441G0mKoYxMNHK/unXLrE2sDc9eOBaaV2GQnXHOJNOx
         sZ2Nu+jBvJ4EeqT8Vy3dz8iLzwQcweOXlryB0lxlo7TOB7Po6inFwZye2gIWt77ONAdG
         0KM+t+Cu2K9kq0KBLBHBfEckbyc13T3sD3p7HDPYITTd+Xq2v6X5nRwMhoWytjC2sCOb
         YHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739768; x=1796344568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zI2X09dVA4VE0y9C+oiwSrLEoxYclZgDszbih3nl6ck=;
        b=UwIB4m8M+PKDjQWiKsk7Egzjpe6Ln3Ge24wl8CT2xVdUSNoruNb9c0p7NHTnwn6PUh
         qdEqRWH/m3PT5osts9dbmqMiX28iAk2Og9edA0xUO2iZZYpnFDqLFD7qd9Qi4q75iVPG
         ksitys9OA/CAmJ4YmLNZdApKB8H9qZQ1kc2rp6xHUEqr3VJI1oSEcfKPy0NsZxFrHfAK
         mWPNXvtb36shLrgo5rkuSDr9Lqbos9SQ3HxLaErOFWDJagZNIeyLwQz08ouBqRZiOEpq
         u08FAtMsvgerjdL2iEjjivc/VmNo41491+AHPBvEkfUvfuNfatI9JepUd1Wv8DOVOGAc
         5MVA==
X-Gm-Message-State: APuU4Z9QdckSWx7YDtGpjLvL6YRAViHTnkU8GdFKKMaJqSH7uUeRKDMR
	ehazvlqYsZL61EpFsZ9UqPC2Hk85REAfZOE6efU0K2bfpWcgG7DWwxATwvQvY1Ur
X-Gm-Gg: AZFdTZdTYcBGupxe8nLaIbtVSRh3liYMSs/eH3knYnfab+WMoibNCbVBgbbhfsJEhZg
	iENefngVqPh7KVUhBGypZZUtydKDZ9CzL7CzrtqoO0s/2poyAXnjwDjsW24JAx52e6e48rFV0Rr
	fq5B/4zuh6baiNupo8ep3qid0h9lFhaDSTIl3RLaiV0NQRRi9MxhOMO9MZ1gmwKaAndCTVY62Te
	6SYElnDhiBYueeAHHtBKBP5rSHMaJd7aEEIUyYl44hAXTHZjcwqQ5TxgzYysk6aJagOb39ICQ8B
	c/gK36neu2QJsauv+EqO4/EA/1YCULXKCLtd4n6Kswol05wIvRO7WOc0DnThtlkylyUWmX8VF8X
	dUnkDtpuzESAR5bx7SKLuOHpFL2mAmyVyCQvhV74EbN37vQt7HCqS3qjVxW7V8EiAxIlCzSDwZh
	9KHppDDHNlz8Hd8yBOuF5yV7NT8Sr8FIaz5jxIrEDITnkr5Uus2SRZHiKwkKjqYOZ8h9R3pYEAn
	hFjeLxQq0kTIwJxz/DivzdVJSTNHmMVtbC9J5WsGibPhLtVZGSpgxH0JcCKe1SYxdzbAxW0r8R5
	7OdqFul61V4e9vIpQVAylWIgX3oX6hbK6KGa3soGNa/Ak3FB6QK4hszrQRQmpEWhzZpSu3Z0reE
	7cmqLeDdgmiVow6/S3EGSeUumf1Zwe07zrWDqdAqAS9VbCK2AeqIei7dPalIU9CfYgqsfNGQLbd
	gy0ozZwb4AxtJEGnn1xPiTXyW5Tc/5t+Oiyg17IbMDotBWR5AFFv7dVKSjwDpMR3QAH4L5gSkwe
	piNXn6AZ44fKMtAC6hLfwyWPwk3maJsLHo8tJSXmc5YeC9XLrEB56cFit50UuOTt+NLd2Ioa8TA
	5/c1WAMVF9aJxGyPHfgUrmvsaNk=
X-Received: by 2002:a17:902:ea0c:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2f03f1cf406mr258843425ad.57.1795739768486;
        Thu, 26 Nov 2026 16:36:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/39] phoronix-test-suite: Fetch from GitHub releases
Date: Thu, 26 Nov 2026 16:35:08 -0800
Message-ID: <20261127003543.2167775-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133174
Content-Type: text/plain; charset="utf-8"

www.phoronix-test-suite.com/releases no longer serves 10.8.4. The GitHub
release asset is the same tarball (same sha256).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../phoronix-test-suite/phoronix-test-suite_10.8.4.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
index 33be88c116..d122b0b0ee 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
-SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz \
+SRC_URI = "https://github.com/phoronix-test-suite/phoronix-test-suite/releases/download/v${PV}/${BP}.tar.gz \
            file://CVE-2022-40704.patch \
           "
 
