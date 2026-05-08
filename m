Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962B0CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 03:51:25 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5896.1778212267137005095
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 20:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KltcDMoK;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7bd810cdc5dso16837437b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 20:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778212266; x=1778817066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5RA2c3bIFtzv6MAJs6vMwFGtcN+9VdNrtlkb9KJOFs=;
        b=KltcDMoKaC7e4bDdYzPwYf8Y7pgZv3L197ToEsqASSREgcSKV+xWVg2YtdcmlnX9eN
         eNN7slkg/r9269ciDw+XOtbzUABZBmJmFPwZRc0PHKVS8TAw0QLnwD+RW0qKwjskUJoP
         Ox48pbVjgGMW9tD85FnqCtwyTXpEy/shjnKIINb6XlZzwDHtvIZr9SXTNIxpqlZc2uUj
         JzX6wXuDam73m3OZrsjmnWcfiCZsb3wYGFGZoSIOjIWySxHaes8hu46hGBud6lRVyKhT
         QFLKssbd9TpsRLXveYu+pSHvuA4+EM2BR8/wI86JAxz0JxeguMOwW+9V8994S68LXUNY
         8stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778212266; x=1778817066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5RA2c3bIFtzv6MAJs6vMwFGtcN+9VdNrtlkb9KJOFs=;
        b=F5vGB1X4RyssM+Ilg/f7lFw4LlQWwPh6Rf1w1G12OwVWpJEfe2A8hqX0zU/bWy3HEO
         TcHws2+Iv0i6tRvQNr1lQary1jbOnsgIOOy8cvRCSsspfkoNrTzvLpKLPeMstB6WgQW/
         I2sooTIWW1qAlR5INgpYSIdWoG1H3AnnhvZPhCf3b4UhtvB/zn0BXir3m2UY1T53nGmZ
         0HCgwAlV6cnPvQN/EXD+qrybVU4+rQKUQzl2zhXnHoV9Djs+BTtCV+/qxvnRSdrSZw5K
         l+4YfavyFqWavkjRE05d78eVN0zoTYRvaQ5/iI9WhQ4IFsKg8f14jTx34MZ6mi+SjixO
         F6DA==
X-Gm-Message-State: AOJu0YxqhIwa6AZWrSrTtmluGutWLLVNUIP+aWj8ogU6QJsYZFqQNLHm
	AvB6HhRVKsnmswIUyKWPqlBiIFEcZ7RJRce6Hzam6fRXQq+PFjGWZ6NUpwObbnU8
X-Gm-Gg: Acq92OEz1UYN9JXzkzWca6QQ6QTrNzzNzU2neW1KL6ZxWhk/rVugThGbr6tNOUV9zsu
	H7M0dPX503GBFzz0Ao59RnV+DdbybEkpvbkjNTPM6TkWIF5gfGOvrlKkeP0oyiMzmw5GLEX7g8b
	Da7NFKDX+2ydJv3zkHsw2A7z4xtsknS2KAWTPY323nDkd64eOIWgxnFLDyunTcgLzCZ5XZNX6kd
	DitXOIvgyN7V4mQ2/+6fAVc5+Zt79J34/i+MlYiFLAoWrEnHQ0k+Pkjvs1Peu4jZBdN9SMHUGqY
	BmHJWZcDRj1NaROQS+J0IW0xkMn6guYH4l5EZNQcjUp3FMUPtiAfVndRcbyp/hpwluww0Y6wX9+
	0xNYWToopO/3WTc0W3YolkwDxieJaIi9qQoOxnVGpkrNOevhl3c0tog4AlkmwLor1LSbBA2lQwj
	JVfswkuNloqYLiSHEX2tBEFAhMNL6xObG0xI3POLec1np0Z6jO4ZLRT8AxQHED6yJBkNdCDkd2c
	P4/PBcMQem0B9nDEzAJ0Il4pLO/bG6YCYAtbOjUMRgxAzk=
X-Received: by 2002:a05:690c:a053:b0:7b3:f33:35e2 with SMTP id 00721157ae682-7bdf5d7f22emr96689257b3.10.1778212265640;
        Thu, 07 May 2026 20:51:05 -0700 (PDT)
Received: from testing.. ([50.219.35.228])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66838851sm101283357b3.23.2026.05.07.20.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:51:04 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.5 -> 8.5.6
Date: Thu,  7 May 2026 23:50:59 -0400
Message-ID: <20260508035059.1687654-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 03:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126818

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.5.bb => php_8.5.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.5.bb => php_8.5.6.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.5.bb b/meta-oe/recipes-devtools/php/php_8.5.6.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.5.bb
rename to meta-oe/recipes-devtools/php/php_8.5.6.bb
index 2924b478ad..db5bba9ccc 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.6.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "ee262beff61c431965d1f97192854b36208adeac38983c3498bb3500ae87283c"
+SRC_URI[sha256sum] = "4457240f65f0c59a620920d66cdab1b12100a431e03ad9febe38b13a1b25957f"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


