Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D54FC97FA
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:05 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37392.1774820340937003553
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SgJB2/Ku;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso5542367a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820339; x=1775425139; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJaW06rFrBzfAdTFxMk+MV/Am1fvfnzrfckCRK0Ea3Y=;
        b=SgJB2/KuCVxfVkI+P9LoTGQi67DMeuru80+ahi6K3wu1pTIij4wZ5b66bLqtkEFF/K
         aWSmEcDBDw7lXACMgW1xm1SULXijPkwb/qbvmVx7Qc1kNvMO5cKR13qzfG+580RQLHeX
         4mUoDgXnOjUAcKahugNOVN4N6XC6TkRIWJ1kZL/vZ+K7gxI5ygd8dHsL5WZNhAqnKolJ
         0DkthcvmaR7d4OfruETMt6MTLxXVBP5y1HXDQOGHeShZUADUj6iQesT0iwNFXj3wxNmk
         LdJ3u2kHb5hjA4kpXhPErDYGYrrenw2RQiuIxlVYezNkLd1tdFdytEavg3xOhNJbIuWn
         Xznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820339; x=1775425139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJaW06rFrBzfAdTFxMk+MV/Am1fvfnzrfckCRK0Ea3Y=;
        b=lluhTTWBaAgIB3zUDNpwdrtsWwSVAcMjzZw9i16113AsDLHyjTKKpJbPafdxgbTMTc
         vUB5jF6vhH5KJJX8kUoSIYpet8y9OesX4gGoCx5mGicG/M34VeMH4cLwQPsTybujKrkQ
         A8uc93tosJ8EjhpXwB82kiJ0fO6m9FMp56eYTTP+u5ox3UpsWN960FL4+5G/BJ4Y33T5
         GQoPgqM/HUaq1yzmRAigb66PyoHKoo2+FjCgMG9PYYeeQZgUGOCnaWuOOtQy6zL23UVF
         GBKetKvZbyaMRE9fD2dAsgODNVXU54eV9jMVuA6wZgAbUEM4a52upo/9NvDKimyOb+ce
         v6kA==
X-Gm-Message-State: AOJu0YwMbthL0pdep1J0eU0JESufkIj1tBqNca3xQmhyOVmiUTRhKdLc
	na1+T0w09HlQHAbt6O01Cm/jvvVnnTib/ExTDEoLRV9Jkf8FKKdwAeRda4pL1Q==
X-Gm-Gg: ATEYQzwdWZySYxE0PWcBQeWGxDOYOmp5aIKt+PBf18pfXWHEYMeGDiIZ1/IqB6oXzk6
	Ux9jFAArP6bZOxcscWw0r2EI83Nb3N4gyh5cvuNnR0gj019aqKhWxkhcLZ2khfsFdEl7BtQfZlf
	hJ3ScXsFF4YtcphOkxH3vC/VxcEAM7A1Ms2NtBW2xsJiUcHi2gbn0E/0AE3c2+f9wYdWsD124Ox
	aqCw6PNzeypj21BWoCQl4Qh0X/7RvOCQD+P3MwAhQp9Y+ALFkRIi6u0Ksr7lhGinRKarZY13l+A
	SSj5mKCZnlJcbHKmdpHIjmhovHM3zl4TiKVUKt6qqK1F7i4Zu7Tcnrp9/mY5IzBUDKlxfjsJENh
	Cpdv/r7XDWV+kVqcsYx+Jvopu42ri+mbCyDb+ZCk77p4rOirqtj0hPcGZBPdZmhQJVMmEoolFrb
	3JxgSCm7/dAk41YEED2DpinUzWJw0XF2MdgiBYizBi/DslFjvfp1wp5+AScxU2
X-Received: by 2002:a17:907:e0d8:b0:b97:acca:fcf6 with SMTP id a640c23a62f3a-b9b50358146mr388120466b.23.1774820339160;
        Sun, 29 Mar 2026 14:38:59 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:58 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:12 +0200
Subject: [PATCH 11/13] syzkaller: Fix appends overriding values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-11-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125820

Those LIC_FILES_CHKSUM:class-native(sdk) were actually overriding the
rest of LIC_FILES_CHKSUM.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc b/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
index af118a4dd4..65306a17d0 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
+++ b/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
@@ -79,5 +79,5 @@ LIC_FILES_CHKSUM_HOST = "\
     file://pkg/mod/google.golang.org/appengine/v2@v2.0.6/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
 "
 
-LIC_FILES_CHKSUM:class-native += "${LIC_FILES_CHKSUM_HOST}"
-LIC_FILES_CHKSUM:class-nativesdk += "${LIC_FILES_CHKSUM_HOST}"
+LIC_FILES_CHKSUM:append:class-native = " ${LIC_FILES_CHKSUM_HOST}"
+LIC_FILES_CHKSUM:append:class-nativesdk = " ${LIC_FILES_CHKSUM_HOST}"

-- 
2.53.0


