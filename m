Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CC5C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:41 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11274.1784590715951034194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tGhyTWQU;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso4499183a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590715; x=1785195515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5x55RjJCbhI6bbvfp4nOB1PKup98JfWr+HzSOpvtUI=;
        b=tGhyTWQUIrTehFcBr2uFhO45I0SVgR3SfnBZF/fvlWl0e8RkGd/ARbzchnvrhOfNtO
         eAzWCwCeY02qP/8UbLxD03+PS7MNWA8T1CCukLlbtwxn8oAr7VAgENtM2lMuXW6dVl7/
         uNWglCwOJkkdEXC3OfciXjah4FW/wankXDw3FCo1CbIycshQ2dZTxrXME/8pE4T6JVSB
         6rYCRSjLnUBTnM4hfwd96PvKVhLj0+F1zAQDCzeZ2JFQO0LkTUYhle9tXnqEV1WuM5w2
         0m37itnQMepmNwTpMiv+YR0w+lBgdsJxeTFLG0JSJfUHhs9MhHytwzOutJ1jwvLpIm4v
         Bbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590715; x=1785195515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5x55RjJCbhI6bbvfp4nOB1PKup98JfWr+HzSOpvtUI=;
        b=Cns+5yKyTSrHVNq/jl9HI/XBOSK+5Nj6LWVl7jG0FI6cl/Px8zN4hwbqJvvz8IFoRU
         vY0CbOgGrlSX8g2nKPMwTR5eS/5jYJ+1O7kYInXxXRX7hQm5wgJceOlrhG/0QFRW/MDu
         lIg0c07mfRsczJCAzTBZxJ0FNjAw5UWVWZemyF2NgqPktRZTMRnbAV9DiJHnilBwDm5k
         yx7lzDoyTUJc1Gpt8VWkSGBWXyI+4kDZzvgUUtPRUx3arC3DMJmHafdANc8YCyT8PQpn
         EEgVP3WbdL8vbgOjGWfoKrcE9TJtRAC+xYYG5+lUEKu9xcvUG0FUgMGDh1GB2b/JZB2E
         yUEg==
X-Gm-Message-State: AOJu0YwBO7K0LPH3zKo5c+Fcpu9sbmkAPavVe4il/ffY3hrysGHGGt8b
	C62V7rgJwOOxG1E/SShow4HoWTcyEc//kDYB0YgsetRmVMNsL+JAAr3NLIAvHg==
X-Gm-Gg: AfdE7clerVlb1O0pDyivIy7mRgjs3WvNZ5SVoG19g6Himqm+bAonkQM9FFS0bIxp93A
	B6j2+02enyMUi70xP7MFFeyMsT+snElWQz0CaicHBrZhd/v8HMA86tEN/Te9b1pAvLLsIXktlfR
	9bZbt9L+g2ylPb1aKLQKMjFWCc3dr4oltVDL2FUa5PU9sO62pbsKInVS2rfeCFOYMGarjwW8ALm
	yIx27sxcCzx9sgFcw0q4lSu6mavRdWYjc99TBjivRNQqUnGF0FW/3ea/MmMH6UeAvJ1oatLZutx
	Mmnsn8tB6j7BIO+3uGhe8hnX7/1NHd8tOCh7Bs+TuY2MGIdC1P+Mlg1V+WCxz0dDZIP8mZjEOt9
	b7unpkDFBK/ZwEflWRhg0/UAj9gmtNrbSnSmWNzqdz24TyWF3e1gaOYywRZjHlRArdzAJY6lq4e
	qrqaaGZFmJyOnhMToI7WvCMUK4DQ==
X-Received: by 2002:a05:6a20:6a0d:b0:3b3:216b:274c with SMTP id adf61e73a8af0-3c3ad80caf6mr17682198637.22.1784590715250;
        Mon, 20 Jul 2026 16:38:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 5/30] python3-tornado: Upgrade 6.5.6 -> 6.5.7
Date: Tue, 21 Jul 2026 11:37:46 +1200
Message-ID: <20260720233811.2324493-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128306

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 6.5.7:

- CurlAsyncHTTPClient now fully resets the curl object before reusing
  it. This prevents incorrectly reusing options from a previous request,
  specifically including client SSL and credentials used for accessing
  proxies.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7c11942641db6a10044cfa76c76757f07a3f74e0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tornado_6.5.6.bb => python3-tornado_6.5.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.6.bb => python3-tornado_6.5.7.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index bb363fe1c1..4dda1541b8 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9a365179fe8ff6b8766f602c0f67c185d778193e9bdd828b19f0b6ed7764177d"
+SRC_URI[sha256sum] = "66c513a76cda70d53907bc27cf1447557699c2e95aa48ba27a442ff61c3ddfc2"
 
 inherit pypi python_setuptools_build_meta
 

