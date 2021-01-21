Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.1089.1611269711403242846
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YZuo98wv;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id 6so3326362wri.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 14:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=foWg2ptD7d43veDQ0I0jGK5Nj2ohdzzuX4ypF38+VhI=;
        b=YZuo98wvSgT+1Sd/gxz07b481H33JJQ0AfY1EYbNc8LuBJR5L56xVKwIFnw5H/4+Bp
         Ku75Oe4gW434QYjozgQpnqxWFR2PK1CvNHYUBHF9H8e0mq+DA2K+UhuqXeQaYrFSryz9
         AdgG0DWhtVOROEFx58QYXQbF7NOqKeUMJPRd3Q/p5tmuhJpAYR90rRvDZSchAPwhp0CJ
         Y0Sy5srdWMIhnYOiDwb8yBs4CTtB/XKkbK522890sX67U+FnSM43bFxNbOU2oNCOsWsX
         IxcZfA4bt6AWJl//Jhz0OSMBuixPSpzgLxZsDj7yOXkQmjb710lCXkYN4nOjfjUW6MGw
         dkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=foWg2ptD7d43veDQ0I0jGK5Nj2ohdzzuX4ypF38+VhI=;
        b=WxrFDpfNZARLH6ImWpZwLmRGQO3aZp2BgvOmVvk5xVZg9SkLfgDL/WEjqHHHOjE9nX
         i+W52b/9Y9Jd9DxS9dqYYLn9JQwCxTurIUdrTASDANgR8ZEJ61pmgJwqMOqFKMAWKtvS
         KK5Ne7uxtUsI7WZiB2tpNnxKov0PKoAFLuBlurPEJEj18PVE1+gyvjWKQzNE6EeQWdIw
         2oj3W0mAHaOwWe0SFeQHyHVBd8yNr2alPTIt6xilbSS0sL81qrL90puD9S7Elm08Z1hR
         W6im8/jOCQc/wvRe9+7fqddUW23nlmBlEIOE5nPNI0orBuePjw+MWissdlNGjgym/hLx
         Ykeg==
X-Gm-Message-State: AOAM532Yx3YqVSpiHXMidKLftBGn96YYKzsZAl7bDAVYmAhimVHTkg6F
	zj/He5tvz287brSbVZSLE1CEoO7o/TxwHw==
X-Google-Smtp-Source: ABdhPJzkgASjED+KPvoXAz8FVx+wjmRjt+SM5dL+8IcJ6Ss/Qu9CQCOEDz286gT4ZRv9I6HRnI7dTw==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr1631043wrs.72.1611269710097;
        Thu, 21 Jan 2021 14:55:10 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d446818dfa6dffe17955.dip0.t-ipconnect.de. [2003:f0:7f09:d446:818d:fa6d:ffe1:7955])
        by smtp.gmail.com with ESMTPSA id n9sm10019742wrq.41.2021.01.21.14.55.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:55:09 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/7] thunar: upgrade 4.16.0 -> 4.16.2
Date: Thu, 21 Jan 2021 23:54:54 +0100
Message-Id: <20210121225458.278343-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121225458.278343-1-schnitzeltony@gmail.com>
References: <20210121225458.278343-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes (and yes 4.16.2 'Regression:'... was on my list)

4.16.2

- Regression: "Open with other application" missing (Issue #470)
- Always create new files and folders in current directory (Issue #462)
- Translation Updates:
  Albanian, Arabic, Armenian, Armenian (Armenia), Asturian, Basque,
  Belarusian, Bengali, Bulgarian, Catalan, Chinese (China), Chinese
  (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
  Eastern Armenian, English (Australia), English (United Kingdom),
  Esperanto, Estonian, Finnish, French, Galician, German, Greek,
  Hebrew, Hungarian, Icelandic, Indonesian, Interlingue, Italian,
  Japanese, Kazakh, Korean, Latvian, Lithuanian, Malay, Norwegian
  Bokmål, Norwegian Nynorsk, Occitan (post 1500), Panjabi (Punjabi),
  Persian (Iran), Polish, Portuguese, Portuguese (Brazil), Romanian,
  Russian, Serbian, Slovak, Spanish, Swedish, Telugu, Thai, Turkish,
  Ukrainian, Urdu, Urdu (Pakistan), Vietnamese

4.16.1

- Prevent crash on Ctrl+H when there is no sidepane (Issue #453)
- Roleback to previous spinner handling (Issue #448)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_4.16.0.bb => thunar_4.16.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.0.bb => thunar_4.16.2.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.2.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.0.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.16.2.bb
index ae05f867f..6b1a6b482 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.2.bb
@@ -8,7 +8,7 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "6277c448116a91ebfa564972645d8d79ef69864992a02bb164b7b13f98fdfd9b"
+SRC_URI[sha256sum] = "67a90b98c436192f9aa6cd18a22a089e713007864aebfa65f36f121c86ba7add"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.26.2

