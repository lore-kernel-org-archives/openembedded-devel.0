Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.1332.1591500287292000962
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HfmONcDd;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id x22so6921224pfn.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=P5hFOtWrHRsvtAKrEcQ9WTIS5Uo6eKcTRsJZUJrRC50=;
        b=HfmONcDdNZc8AcvG5I00n4gU4+Fz6iJiYYO/g0V5NEyG4EzT8jr1S6sAlk6JdWoJP3
         4E2aLwT7SU6FXleU4lhe/8xkk7lIeu5oRmSudLLvj1dLsmIOHFLmSC9nI9k2vwBhAv/s
         iU9KKT1mRQd2uH71hzg4XQTNU/NJy4ndomxb7KyLVyAZgIXSdQGWk4mB/JP12v1zlZ8F
         nCoxg/X+YoWJGZk3/JkJyQCqqNY2JSwWj6N5/Hmk2aWKuaW8/JHHx3zFAHsfF5H8dzE8
         gsPM/u8XntDRcO/NVcTXVHTXmPawZ3pS+iFGnBxry/lq39ykfHnL8Ubux/Qp2np2VUZx
         7WlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=P5hFOtWrHRsvtAKrEcQ9WTIS5Uo6eKcTRsJZUJrRC50=;
        b=cJnmKIDhhRNdm/kvhN3IieVkWNrS/X3Of+M0EZcI6voCON/HKsJgQRpQpQ3u3AEx7A
         ryGGDtb2fsik9D4ruj1axKFXXi6LYie8jC7haJII8aObj8QtdEAxXCDmF1P/f1+kt/Y+
         aEB1jd05iaCagF6YDeQCBxG5oofXDtGqzY2TEbmzJx9G/TxC891lW6cSeoSJ3uZW0in8
         ZVRLQ5czPmEKtDP5tC+6smFItJLdFAj/fgoBoL5xHPoCiVh8NBh0FEL/dPrflgR6TbpC
         z1oAdA4QZbNp3JrcZ2FE/93u9LiqpwpgykxOr/gDjniU8LEFxV6W5wcsfrq22laOxUG7
         xGtA==
X-Gm-Message-State: AOAM532TBYWniFdEBc3T31Tn35Dl2MuVjAMABJHYPzOPj4fULr2trsG0
	W8fsIL91e7UUvxN3SEpJA7xcU/SY
X-Google-Smtp-Source: ABdhPJz/nxQbWQOcEIKeKWkMnYoXI584pXN+tSZ2VLXWwaa3bmXhdLBRnZ4VUW1+KCgJ5MwywLiZVw==
X-Received: by 2002:a63:f854:: with SMTP id v20mr15901931pgj.0.1591500286341;
        Sat, 06 Jun 2020 20:24:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:45 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/26] gsoap: upgrade 2.8.100 -> 2.8.103
Date: Sat,  6 Jun 2020 20:24:15 -0700
Message-Id: <b2e61ccf4732e803b30c9c294255cc5d53112b63.1591500139.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fd389304acc29aa2b4c3f3ebca3c899f21e35e17)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gsoap/{gsoap_2.8.100.bb => gsoap_2.8.103.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.100.bb => gsoap_2.8.103.bb} (89%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.100.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.103.bb
similarity index 89%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.100.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.103.bb
index 0b4eac8897..8543c6f484 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.100.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.103.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
            "
-SRC_URI[md5sum] = "f0fc5394286753eff657cf62b46d024b"
-SRC_URI[sha256sum] = "11b4f99d28392e3e1aeb29bfd006a4f1f40e7fdd7a3f3444ee69014d415f09f2"
+SRC_URI[md5sum] = "3207ece9fc8ceb787091de93838f5952"
+SRC_URI[sha256sum] = "afe2ba08d2fa56adc3c774b6741587203a72140a255346e9947b8d2ee6c7d4b6"
 
 inherit autotools
 
-- 
2.17.1

