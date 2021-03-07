Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.27981.1615156504614710274
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 14:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LgZ0mcSI;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id p7so5057275eju.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 14:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A06BDYCmzpkdeTzKSXHX9c47pIRn3ovQUTj2eLzllKk=;
        b=LgZ0mcSI9mOPF/wiArp5bjWOW7axSR/0FJdZOrr2XlsfkbUHLJ/djYv7c1ql1iUdff
         tw8gyYC6XpUuWLY2D+DbT7xUMNwrmIEygVAUIl8GFbaKn8vgaZyfJBy3jMFUXUebsSx6
         3hlRNOCc9e7ehrmJAdVJ4756MfZfS86YuA7OeY6gccrjlIglHFcPNX74H9S6oBABFxuj
         UvlzU1SxXmi4gy0mW5WGq6UXAhXqDWu7CqOs5TYOsTVYXUoyEC2zy4/8oW9PFOay6Hl4
         SGT3OvgQoh6aFanbRWPjOmgK0pLDM54pSTXG3tlfvsoTEE2Um6ILugo/0CRuhUWdm6i5
         oK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A06BDYCmzpkdeTzKSXHX9c47pIRn3ovQUTj2eLzllKk=;
        b=luQYF0E2Q6TWHy5f0d6P8HWNY8/xlQHVGIvuvSwAnZSwJsDIqRWBD8ER3R+v3/VesZ
         jE2TtJGczzp1orLZhZxWFvcpZIqPcrqWWwIqTgV+MAJK0nh7bc5qXCauaKIGBgonlNGG
         uv6hE6mHif1iRyTYqBV2MD/xPT9lM0PnU/dwnvnAL5VWuKEGe1bNhFK7vxj4bX66jA/u
         ViMMTBc+3zPfsSkjppwGFNmeFssTFxazomQ0zAkajWEvI6rCpeS4HHNrvDKeu4qrkpOb
         T2IbF6I+htiNb/giR+4j+HBtokLUM1LTGkgTaegv7XGRlutG76H4gjzvGDQpQoOhIqtD
         rGvg==
X-Gm-Message-State: AOAM532yvnblXXtJMvolssjqvSVi+3cIuXhZ9297JMO7t9FJ+1TZX8FM
	OAUSXTs8caS/oW+eXJozO4N0k2MlkrE=
X-Google-Smtp-Source: ABdhPJys14Y8i4OgvvvXtomKjidt7r0x/yY9os/Uim2OrTeTSYV93RXAEc4dMZDkrHmYfLZsr26cZw==
X-Received: by 2002:a17:906:bd2:: with SMTP id y18mr12405549ejg.482.1615156503171;
        Sun, 07 Mar 2021 14:35:03 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f3c4e6849043cb4c496f775.dip0.t-ipconnect.de. [2003:f0:7f3c:4e68:4904:3cb4:c496:f775])
        by smtp.gmail.com with ESMTPSA id mc2sm5501399ejb.115.2021.03.07.14.35.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:35:02 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/9] mousepad: upgrade 0.5.2 -> 0.5.3
Date: Sun,  7 Mar 2021 23:34:45 +0100
Message-Id: <20210307223448.1063315-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307223448.1063315-1-schnitzeltony@gmail.com>
References: <20210307223448.1063315-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.5.3
=======================
- Appearance Changes:
  - Use old style menu alignment (#97, !77)

- Bug Fixes:
  - Add a keybinding to reset font size
  - Fix inverted return value of scroll event handler
  - Various small improvements regarding accels
  - Block the right signal handler for tooltip updates
  - A clarification about action groups

- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mousepad/{mousepad_0.5.2.bb => mousepad_0.5.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.5.2.bb => mousepad_0.5.3.bb} (80%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.2.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.3.bb
similarity index 80%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.5.2.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.5.3.bb
index a7e96851a..1fba67914 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.2.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+3 gtksourceview3 xfconf xfce4-dev-tools-native"
 
 inherit xfce-app gsettings mime-xdg
 
-SRC_URI[sha256sum] = "30adc5631a4e551df7b3e17ddc1d10e9980080f96518dedccc32170cb18efb8e"
+SRC_URI[sha256sum] = "e7208bb9e96a1525d3358a64f9cdd165005078e84e81984a953a2a03491fcaa8"
 
 FILES_${PN} += " \
     ${datadir}/glib-2.0/schemas \
-- 
2.26.2

