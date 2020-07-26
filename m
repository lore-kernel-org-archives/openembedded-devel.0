Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.40007.1595802909564073641
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IkI70jse;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id g7so6888646ejw.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6jsoshr0ZNqwUJN2wz4d1Yul0dL6U4Au7lyA4cgB3QA=;
        b=IkI70jse0WPnz3Wwr7hcdBcQEwoG3Vx1ZDblgk0kUEg16XBywrUfWTtV1R5uaZAY3K
         BBajd4VVOIt7Wf3c18XqMRLagy5dsLmBhZZmPHBbC7ZPhfRS5DJKEzLKj96jhpP7Ni05
         6Gwquhe2MqvnzsNVj5HSPGYxYLL3tQLQXldQOX9pUoTY5ZcDpRrxuhfSkFQBvOMKtGQm
         vBm4RKa/dVFex14IaxSqHDJdxNKKn31lrlWeIhAYNo15bfF7Xk303+h1zLymhFYUdad1
         dmpOqNvZdNYv470Jp9WDj3boP+7n/S48ZRX/fzL0weuI9U0eACv4NmbjrnZ0wgAiTcH/
         h4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6jsoshr0ZNqwUJN2wz4d1Yul0dL6U4Au7lyA4cgB3QA=;
        b=a4QMIGXJtD1eyYCcT8XUc+lbNP8nMqqKdJDGv6owFLs44QTae3+EECHYgRyULQ1i9g
         KKpspdXUkUcwqwFQcrSkgrjwo5GZgp/92HSHZ4XIswDzOvq1aDB/D5QLoQLjL2HUfAfc
         osCbAiPPrVJmNCF0z5QJvDhxfKCh6phKh/DjWKRbEIxwuqu1mDVufADwE7pAg32ViP4r
         ntEvvai4jukyXDdgy5LWxzK0Ap6+epYnalZlV5iakETyAd7Y7FUiCDnWg4tP9SpZBWO0
         WCWx8xRYScBBJsGYveUGAgxa4IqEnI0J4dL5aV5/GM+SR03Ji/Fi/G7GKuJIV/9RALUA
         i7hQ==
X-Gm-Message-State: AOAM533YFlzIIMrojHmVbFLfhCypOY9QbfEl09pZ80zdZXDIlN30/9X2
	KdmrXwX9Gm8l0nBmAPK71+5kOPKC
X-Google-Smtp-Source: ABdhPJy0XTJACWxkObgCaEZnkcuPx6tWxP4aIkoi2ZTPWrVUlkBAYriERlLejs6Aa3VV/wvVT9NdXA==
X-Received: by 2002:a17:906:8608:: with SMTP id o8mr17279970ejx.156.1595802907859;
        Sun, 26 Jul 2020 15:35:07 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:07 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/10] xfce4-timer-plugin: upgrade 1.7.0 -> 1.7.1
Date: Mon, 27 Jul 2020 00:34:48 +0200
Message-Id: <20200726223455.333001-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726223455.333001-1-schnitzeltony@gmail.com>
References: <20200726223455.333001-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.7.1
=======================
- Update URLs from goodies.x.o to docs.x.o (Bug #16180)
- Do not recreate box when orientation changes
- Remove unused eventbox
- Avoid square-sized plugin (Bug #16101)
- Remove unused variables and function
- Resolve GCC warning: ISO C90 forbids mixed declarations and code
- Preferences: Improved spacing and layout in editor (Bug #14678)
- Selecting a timer always starts it
- Add Hossam Ayman's multiple timer code, some leak and g_free fixes in
  update_function.
- Translation Updates:
  Albanian, Arabic, Asturian, Basque, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United Kingdom),
  Finnish, French, Galician, German, Greek, Hebrew, Hungarian, Icelandic,
  Indonesian, Italian, Japanese, Korean, Latvian, Lithuanian, Malay,
  Norwegian Bokmål, Occitan (post 1500), Polish, Portuguese, Portuguese
  (Brazil), Russian, Serbian, Slovak, Slovenian, Spanish, Swedish, Thai,
  Turkish, Uighur, Ukrainian, Urdu, Urdu (Pakistan)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...fce4-timer-plugin_1.7.0.bb => xfce4-timer-plugin_1.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/timer/{xfce4-timer-plugin_1.7.0.bb => xfce4-timer-plugin_1.7.1.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.0.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.0.bb
rename to meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
index 2ddc6f67c..f154023e2 100644
--- a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae39271267fd63eb7619432ff24e7ff1"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "32e6a14e80bf9a93db2f2b3bfd7de920"
-SRC_URI[sha256sum] = "2e4e5343e39926230cc981d5fe56cd58a2f3817d2e9b6089b5673a2e39bf7e9b"
+SRC_URI[md5sum] = "e0df5b6be30993719d084fc4f78a6218"
+SRC_URI[sha256sum] = "4b52d2911b1949e945971be6533155ee6ba99c77078eac7fd43b0f2aeca824e3"
-- 
2.26.2

