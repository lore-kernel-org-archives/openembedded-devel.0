Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30C5108B911
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:04:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10987.1774008240346700969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fspy8Xdf;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b48ac2727so1465699f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774008239; x=1774613039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1lD/XQzlQC0uIcNQ1U+s/8hxN27sNLRnWjZErULq6M=;
        b=fspy8Xdf8XQyN/Pp3shnAQ6IF4VKTi2yVFMtjhMjzNy9uQ97Y5r3Dk7oIDVWnq9vf0
         5KUuAvhYPlSZN0GwoTMwcTl3Dk6M2OuT4S2+k05TEMXRvjSdosWvmnV6f1mm/KBwd/WV
         +1SGgETwApdKClzl4kQUEdyJVFJVVwBogRGPHNSmQflMKVaisn9imJAtsbY7Vva2i0is
         b6ceci6ql6XWuj/yNR3Kv5VbUQJHXNJposMoi5YKLnqZDxrsWuu0cXzWxXhzZBrgU2Bu
         llEwEqZ/NNnQtxjcLNuBjdxkKv8lgPU1XhA+pOllSVz3AZdlfDt07aiix96wxd4uVaUG
         Cmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774008239; x=1774613039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B1lD/XQzlQC0uIcNQ1U+s/8hxN27sNLRnWjZErULq6M=;
        b=RrchaDKdHZYZIvIqrvq/LKZGrcgwtaGccgYlgXECF79PdFMRPAQrirMgQOTZ+O4ghh
         PnoUyT+hYm6TKtNdhXRd0fX1RfJA0C0+rmZjp25SZeBJ8qCCY1XKZCNYucggwm5mbhtz
         iMof8yqg7Q8LEUspxUsVzk4Gy7Cr7UQxLy7o73zgN6FI/piukRUTdDYXxystDQT+ez8U
         0gL/z2vWW7e6Fd8JIJ4ng8XY8fsP81Nyn4gPQCZtzfbSsSvez/RD1+l/C9B2lP79dDEu
         jfK9h4SptW0KRTvLd9guDPSvdcoE29b1n1wzl2cUCX9BiGLhysunHRu+X0i8w0ZQVf6R
         qwSw==
X-Gm-Message-State: AOJu0Yx8U12/VThndF+GbApmdisTp104mFyNciolDAuQ6fT1SfJpOjdk
	clD94f8+Pq5GFpCM/NyFop1DxKrefiAc9sup4NUxzDWSQHY8DJ6FViQSzQ+9NQ==
X-Gm-Gg: ATEYQzyr4SjO28bXll8+H66zV3el3z02xokq4kAeCS1y73SGfcNdPI9INe+JfooN6x9
	SiqONObJPX4obXzzXBsBoHQYRCKDHbZ6cdQIG5/vbh+qYIJfOaSUL+7dRVpiKg/rmciEDluz/hd
	3+GqOPfeB1oSQBV7Ou2JGPmhxpm/n9xXWSmPv//m1qxqKTCE9jgfJN/4dAAbtwVNBS/Vu4ouMjJ
	OAS0rGJJcFm46QcrbyaVu9tV2/lw8GYibCauV3ZWT+vUaBz3Fm2tkc0cE42FrjQgGiWsoxlP+l4
	alst8TKRmOdWA0mAm8xnTihqgpFm5LltBDRAbBWdu9k6XR1Tkart6i8ZIQ9Xp13SPElTN9tSNgJ
	dtUPlT4nmHgnkoaKhXRJZWetoTByn/YikcolV4kLVCqk5FA0wNN9dyvgEaYjaGyumFtUlwFZUy7
	9LaecjNhyODSCo/gLNI9IR
X-Received: by 2002:a05:6000:220b:b0:439:a958:4342 with SMTP id ffacd0b85a97d-43b6427d9c2mr4642319f8f.34.1774008238578;
        Fri, 20 Mar 2026 05:03:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm6258558f8f.3.2026.03.20.05.03.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:03:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 3/3] sthttpd: remove obsolete CVE_STATUS
Date: Fri, 20 Mar 2026 13:03:55 +0100
Message-ID: <20260320120355.2973635-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320120355.2973635-1-skandigraun@gmail.com>
References: <20260320120355.2973635-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 12:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125438

The CVE is now tracked with the correct version info by NVD.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index 9ff1772531..9459670344 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -56,5 +56,3 @@ SYSTEMD_SERVICE:${PN} = "thttpd.service"
 
 FILES:${PN} += "${SRV_DIR}"
 FILES:${PN}-dbg += "${SRV_DIR}/cgi-bin/.debug"
-
-CVE_STATUS[CVE-2017-10671] = "fixed-version: No action required. The current version (2.27.1) is not affected by the CVE."

