Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1484.1793731037926019196
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ixkQIo5X;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a3c08d6928so5803368c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731037; x=1794335837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsHNeX5w4jjHxppAZAbv7WkV6o2NcI9glg/APjDYXow=;
        b=ixkQIo5XpocosozI7KVQpMzHVyAcAA2BDwbUQ5QFR8Y22PKL63+6y/9MWy5f/dFcka
         HB2aGWmMG7SFZvcrnWOTEHx1OILhHp0hElTbzlfxM3Fwz7vYIHgwBNQe4iTneOVKGOMb
         nBgXr1x1/wYuPvmsPOqHnNPM9pX3DpTpfuupGcUWFiaEAX56e2KyZJXK+1IPzRBc5bVC
         gPT56z6FcjC+/lvJ076x6OMYLL9gpXz2zWi/F4IE8Pone5D2w8SPGF4ANKLOeNeYrpFP
         PCE/X/NGE/NuXuC4DgvS/+N6xpU7WjSLt5yI172l8g6d45P0Nip2ThMuvumGvo+auejp
         76Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731037; x=1794335837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsHNeX5w4jjHxppAZAbv7WkV6o2NcI9glg/APjDYXow=;
        b=rT7AgoTApJQVpzXM4r5UYYltlj6t9e/IaOV6wv/b1sQeRG4kCVF21AM2Zoj2pvQneF
         OtGfHeoBNwzgerIq9E748XMvHHhXhf4xq++6EH5B+JxfUQZpoKlTJ+xB0gb/g1TNsqHg
         gc1TxM488zKeIABaUCGBwhOgdPSU6Rinr+RfrGhYXXVUPgZvSrdPvILT2G86ORP7l2kg
         w3vXIYBfimwLMsaudZG9VKfdvNTZDy8NZTjM/CH34VB1lJYr28MWFHF7KDkh2vvj04LX
         5HInbR+9DHjivSw4cCkRwK7KIMdAUlQr5A6fQv2NMif2Kn3mSyBXERcyaStwutiwKPov
         o8pw==
X-Gm-Message-State: APuU4Z8IjFerxThUTTtL473wuFBuTlltaroDfBx8hrtk7umfNv3jUx/t
	Qs0drWwaollDDUlrJvlYcOjEqQ0LcWehQt7Hi626heLHmDOJ2VQ68OFKPCXM/w==
X-Gm-Gg: AYBFou1oDnEdqtS2aeNBgVzavi9YytD/g5Dj+yKnhdmASQ3DV4BuUw+nTWuxG+x9/5K
	Vp1uA7nQRYdTJqdgnThCmQjkW9JCRgztXuiRZvgn8+V4AotBFRPpQNgvPjC3qIW3dijmZEqTe+h
	oSsrs5WUvIs1i8SbsPNURJTIIYBT3iWN8QXbkI0SW5qdtXHYQupmeXCoUEQoiP6EL5pCeljM7+u
	QS8VQCCOs2fBKlA6uVei8Mknqj62lAfpjNemFujTnUFafF/7yRSeSQ/W1SO6jd0UYUJ1X28HryZ
	Ca8mcO+mflOhipl5bm6/Yun1vv1QxSbGBNuJ2RVS4+C6Jwg/Pih8nSLXEI6abWSAWuo9lv6pz/6
	Z2wH0gzRgNje8WI9dhDnmmNsZZX5caAY9R1Gu1cjcBJVkp8BFQrJwHic2YoxMYupEdmSkt6pUiD
	zeRTzGG7ywTRsneuy9HHx+BSuCshVc8U3xBmxH5EIe4UIh1V36K5XWOgPouSapcr3VL5SkZ496C
	qZB7VbpIIQRtK3er7guncCBjbJYPONSg3NhjsqnoTR8IuXM7YPyDaeQfgTARXUT1Vym4eCCL3HA
	Gad4YeqQ31fvnh7dD249GbAtQqJsx/65fwyIjumtrCs3sz34ksi9NYlkhS4ie01q
X-Received: by 2002:a05:701b:2511:b0:14d:c7ae:85df with SMTP id a92af1059eb24-1ac5b0286e3mr18476384c88.12.1793731037180;
        Tue, 03 Nov 2026 10:37:17 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 16/20] swagger-ui: upgrade 5.34.0 -> 5.34.1
Date: Wed,  4 Nov 2026 07:36:36 +1300
Message-ID: <20261103183640.919438-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131814
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.34.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.34.0.bb => swagger-ui_5.34.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.34.0.bb => swagger-ui_5.34.1.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.1.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.1.bb
index 688a2e52a3..48b8e99fe1 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "a3d333d7e99611288312d597c4023ee10df721e0"
+SRCREV = "d3296954a6b813898d298815ac3e68daa1cf7408"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
