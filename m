Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.48672.1591047946399299005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PzCVNCBA;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id r15so1008906wmh.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MhFJOhcFPhnDN4jQ8ybpX5RVQp7crTDK/xf27rur4RM=;
        b=PzCVNCBAvi9be/QbZa5ELaGAXK8YCa8TFrTvHNVhqT9ud3T7yPTCweSOb/BjWfoVT6
         8dSemVzXoUN9z1ohSrCQYV6XxY3skuni/E81zZH0OeRE9cF8J5F68UVFjSkAy6rpDkwO
         whki42XN6XTleF7+5eaUxHnG9BCMPx06x9Muf8A6gug2GbbI2DNtEmbdO8SX2/HKjVxW
         +iw69U35YFbwyluxlCz2NOHJZHDd5F1V1gMbN+dQFigFIOu1dlqLzWBLZ1Vw5KMdfI28
         HkDawcAH3Vl0QnQJkr+ilwdyZmp8ZZyRAren69i7IeTpVnalPGHV3Iua5SwBQyugoTwk
         OiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MhFJOhcFPhnDN4jQ8ybpX5RVQp7crTDK/xf27rur4RM=;
        b=OOuc867ZvhF0J+txPz9mdgvXexYyXK9FkTa3cgzlUhv29SRP8KMca3je45G3IER1//
         bvAT1lbWvaqN8f1Ytsjup1ILilmlL7IuAClEU40hVeHtVsbrkkkiObCpO7n01h+EcilB
         y3ixlfq4TDy8bhLcqQrzGXqyxp78IzrtA5XqRkxj6/El3OaV0lsAPcEM+B07VnLLJNg1
         pcqPafDp+0ToqM2gxrwbwaYX0phs+kMX279jW3fMAe3WfpP21/MRDX2JAEDX+VjMSMhF
         ZVfVzVrUuNLY5qIarZwMd9X5sYG+Ea1Qr7ykAdNM59NVpCqzsFGlZm3FLYiWQQGvOaUI
         oQUg==
X-Gm-Message-State: AOAM530g5735HYcZ1MnL9qao+V7OGjXyj7bLRsBagJnV6hxC3AqiJ/s+
	vI6VSVt7aIIkcoWPxT0zDz3yC03sgd4=
X-Google-Smtp-Source: ABdhPJyAQK8nF23oO4N+KbUa26DYIhTJqaQDtS5lBqFNJmrUBeJcw6nQs+yYAdExFH2b2+2nkAWc4Q==
X-Received: by 2002:a1c:4189:: with SMTP id o131mr1218413wma.110.1591047944710;
        Mon, 01 Jun 2020 14:45:44 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:44 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/38] gnome-system-monitor: upgrade 3.32.1 -> 3.36.1
Date: Mon,  1 Jun 2020 23:44:55 +0200
Message-Id: <20200601214516.26624-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

New in 3.36.1 - 29 March 2020

* added/updated translations
  Yuri Chornoivan, Daniel Korostil (uk)
  Christian Kirbach (de)
  Daniel È˜erbÄƒnescu (ro)
  Yosef Or Boczko (he)
  Cheng-Chia Tseng (zh_TW)
  RÅ«dolfs Mazurs (lv)
  DuÅ¡an Kazik (sk)
  çŽ‹æ»‹æ¶µ Zephyr Wang (zh_CN)

List of fixed bugs
  gitlab#142 - Michael Debertol: fixed net stats delta calculation

New in 3.36.0 - 07 March 2020

* added/updated translations
  Matej UrbanÄiÄ (sl)
  Milo Casagrande (it)

New in 3.35.92 - 29 February 2020

* added/updated translations
  Goran VidoviÄ‡ (hr)
  Danial Behzadi (fa)
  ÐœÐ°Ñ€ÐºÐ¾ ÐšÐ¾ÑÑ‚Ð¸Ñ› (sr)
  sicklylife (jp)
  Marek Cernocky (cz)
  BalÃ¡zs Ãšr (hu)
  Victor Grousset (eo)
  Fran DiÃ©guez (gl)
  Asier Sarasua Garmendia (eu)
  Guillaume Bernard (fr)
  Nathan Follens (nl)
  Zander (en_GB)
  Alan Mortensen (da)
  Seong-ho Cho (ko)

List of fixed bugs
  gitlab#108 - Robert Roth: drop polkit dependency
             - Robert Roth: added translator comment for new string
             - Sabri Ãœnal: fixed GPLv2 text
  gitlab!16  - Michael Hudson-Doyle: Fix displayed network transfer rates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ystem-monitor_3.32.1.bb => gnome-system-monitor_3.36.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_3.32.1.bb => gnome-system-monitor_3.36.1.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.36.1.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.36.1.bb
index f30edee68..ddd11201b 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.36.1.bb
@@ -18,8 +18,8 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check get
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit"
 
-SRC_URI[archive.md5sum] = "37356a1b8c20939adc6f47f739d2e49a"
-SRC_URI[archive.sha256sum] = "48c131335091bd927862f40ef56400f997981df2acfc82abea662bf91a1ea4f1"
+SRC_URI[archive.md5sum] = "b1443ab12c3b7bcca940d28754e5b948"
+SRC_URI[archive.sha256sum] = "866b47ab0f4c75b0ec57d6300337a7373463aaad5df95eddfe5354c22be7bca1"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.21.3

