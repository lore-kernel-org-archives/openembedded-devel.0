Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.9422.1609946279955189925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Onyp/jR5;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id g24so4675579edw.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zlm3sUIz0gcIMR+JMgtlulKopTa8ZLkhz+3f5InUYTo=;
        b=Onyp/jR5wqrHIwSvn6QtPs3qznLf5vIGZxLhw/cZO0NTA/u4gO9kcsUkuKGXfnKx57
         l6OGZdfIUf1voFWjvi9MrQ38RRZ8pRKII9SrQPHu6XXXCMHyaJsrH5zYA3zBMwMFNKS3
         37Vp+UHcV+YGlCnYv0u5IO2WPSrIF4df/bx/FnqRuLS0FsmF8lwYYhQhcaovwaKjuy+A
         AVQrvXv+TOzz+xCKXdHpvp7YSda6eayQwI+QdFg3V1sKNoLKm49cBX+OjPr4rOEQYiQY
         iTJDCVuvaMKrn1Doh0dRUHfG1UfUm2dmhga8t3Jl6mKUo2uDkm0sANAbNKq3e+h2PoWL
         ZcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zlm3sUIz0gcIMR+JMgtlulKopTa8ZLkhz+3f5InUYTo=;
        b=X5Ip78ZwuLuY1OuEJj/8w7+xrxigyRA0mn2NOw4uP7IFPNIhBkfRhDjUiD3QTGuER3
         DXFcUc9k297CuiWSTk3gbmIrLtROhIn4h/OQtOZ1tj+aV7z8ISpVjB5QGQur2pX1BuTV
         P71vKiLtOwPIuQotRjiQKwetEa8ykDH3jqSk1ePEkB3RO9vBBnlr5BCwWE7js6R6QH6v
         3xKOYELJTTeBXygDAGuU3h7ba7BSQLyJO288tv+vkzmc7QLF8+5TyXSVh4X7uCOaFcll
         J7kzRg9OeITyJgrObXFZIk7qsfy/wxB9toB1Py869ktvPuL8qxLCv8E+ISXksYK7J3od
         SrIw==
X-Gm-Message-State: AOAM532Mmg/Cd1e2kSwHnNLE5w5dZ5Sj7TLZKHM8GSzeIKf3dqLEJvg2
	KMMcy6XdSv/Jg2UEiNfqY34LFf+Mu+ua9g==
X-Google-Smtp-Source: ABdhPJxsNr820J3wWsR95EEREQ6SdGfu5E/+L1dRxIyNQ/z3HRFS7XutuGVFkaFlvfRPz6DXX0ea0g==
X-Received: by 2002:a50:c053:: with SMTP id u19mr4278898edd.109.1609946278594;
        Wed, 06 Jan 2021 07:17:58 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:57 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 22/28] xfce4-genmon-plugin: upgrade 4.0.2 -> 4.1.0
Date: Wed,  6 Jan 2021 16:17:11 +0100
Message-Id: <20210106151717.1779543-22-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

First version that builds with xfce 4.16

4.1.0 (2020/12/22)
==================
- Add basic GitLab pipeline
- Updated README file
- Add DBG anchors
- Add <icon> amd <iconclick> elements
- Make Save translatable
- Fix config values sometimes going to default
- Fix label sometimes re-appearing
- Enable multi-row support
- Remove unused variables and code
- Fix indentation
- Catch some edge cases
- Set tmp variable default values
- Fix period spinner display when cancelled
- Fix label toggle display when cancelled
- Fix font display when cancelled
- Support new libxfce4ui API
- Change close to save
- Closing config window cancels changes
- Change layout of config dialog
- Make tooltips translatable
- Update support URLs to docs.xfce.org
- Allow compilation with panel 4.15
- Replace deprecated xfce_create_panel_button
======
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Basque, Belarusian,
  Bulgarian, Catalan, Chinese (China), Chinese (Taiwan), Croatian,
  Czech, Danish, Dutch, Eastern Armenian, English (Australia), English
  (Canada), English (United Kingdom), Estonian, Finnish, French,
  Galician, German, Greek, Hebrew, Hindi, Hungarian, Icelandic,
  Indonesian, Interlingue, Italian, Japanese, Kazakh, Korean, Latvian,
  Lithuanian, Malay, Norwegian Bokmål, Occitan (post 1500), Polish,
  Portuguese, Portuguese (Brazil), Russian, Serbian, Slovak, Slovenian,
  Spanish, Swedish, Thai, Turkish, Ukrainian, Urdu, Urdu (Pakistan),
  Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ce4-genmon-plugin_4.0.2.bb => xfce4-genmon-plugin_4.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.0.2.bb => xfce4-genmon-plugin_4.1.0.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.2.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.0.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.2.bb
rename to meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.0.bb
index 3108a7760..a51c52f23 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.2.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.0.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "d808fe77a438c95b97ec6feda6162d22"
-SRC_URI[sha256sum] = "256c22526f61aabf43b91b903b976c13e56198657667df443cdb06b31fbf23aa"
+SRC_URI[sha256sum] = "d1256b4b47545c7bdb16842b21eaf3ac167be443e8f2f1093cf4209e65c84e7d"
-- 
2.26.2

