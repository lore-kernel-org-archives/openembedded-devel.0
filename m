Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.25405.1609683185599657275
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hmEjeEDh;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id cw27so24547633edb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=39dvQT/QFynyAvwbnJYnu6Yz58BxEMjJOWp06ZSqNxE=;
        b=hmEjeEDhTsyLdcOnPMaWFuw57H+jnficiVXpPygYPS2KqyBYw7n8YOwCt/ORo0pKx7
         zyauzS46XOWr2LBuyYdEHbmybb8s5+VnL8unRc+nZmxvbchlB5pedkuRyR2n3f0zz6fq
         XNjExDZzMKxspAKGmiDxhRD7agCRkoXEh24i5QjIXK7QZe0S7boxdfWOCX717mpT1TFw
         VrI9KnJ1zSg46QsDsYsEwefeiZzO/4U3IU0m4eVJkWXlE8QbnZUFrrVbbHfV6Rrlp25m
         QXI9zZNpd94UueZdwVRtL58MMsVLefhYu1IKfpJciqvYppCYCJ2LmCV7+XcG/rgS5xTj
         mmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=39dvQT/QFynyAvwbnJYnu6Yz58BxEMjJOWp06ZSqNxE=;
        b=CY4Qpe3jbz1plL+MFdLT2dX3ZrZ71gmdpE9Nuiyj5+LQBMWoTuVK4i+kJ2Wx83+RMm
         Co83yWnFd3XnzyDcqaZ5kiqbNSkke6YozbL5RHuxghrPUxg2vLhvAXVRnIRjlN+YfKCT
         qwVNk1iTHmbkBnarj/yefvjzA3G3t37xoVegjuGwU8x8Y4VfJFalAXZ7I0S+VQAq9E0T
         pFI40Mp+bG0TbcqOseAli3fdwpTrD2k31236hCnRX/m8zH3HlUrxAJJpan0TCdIwL14H
         X5pkHx/XSfTn8ZK8cCWJwQ1zy22DSZAL0/SIcxgKWSZltG6Rmt54Rh7XmWPkBbR/2eRi
         cDeQ==
X-Gm-Message-State: AOAM530eOvJyqXjqA70rxD2FxvCO1f4I0Th2tWmWT1O8QTCeuBLPo1mU
	lqJbvValUUJ5ZN3EUZ2f3yRTVw4/n9E=
X-Google-Smtp-Source: ABdhPJyMDtAjo6/UY1mLjS6bCW5XLKAzu8b3aPMHH3gJq6p0i5H/gQb0LZLRItGNxjWAB3OAqXGyXw==
X-Received: by 2002:a05:6402:171a:: with SMTP id y26mr68339208edu.371.1609683184275;
        Sun, 03 Jan 2021 06:13:04 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:03 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 05/16] xfce4-taskmanager: upgrade 1.2.3 -> 1.4.0
Date: Sun,  3 Jan 2021 15:12:36 +0100
Message-Id: <20210103141247.1637618-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.4.0
=======================
- Drop Gtk2 support
- Add support for MemAvailable (!10)
- statusbar: Use color with better contrast for dark themes
- Fix: some times processes are not removed from the list
- Add tooltip to show full command
- Add application icon (Issue #23)
- Replace appfinder icon with edit-find (Fixes #23)
- Replace old icon name with utilities-terminal #23
- Replace old icon name with system-run #23
- Always show memory usage in bytes and percent (Fixes #24)
- Improve comment in desktop file (Fixes #20)
- Add basic GitLab pipeline
- Add README.md
- Update libwnck and xmu deps in README
- Remove GKSU leftovers
- Remove unused url_hook_about_dialog function
- Replace deprecated gtk_menu_popup
- Fix GTimeVal deprecation warning
- Fix indentation
- Update .gitignore
- AC_CONFIG_MACRO_DIR → AC_CONFIG_MACRO_DIRS
- Bump minimal xdt version
- Bug #16717: Move from exo-csource to xdt-csource
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Asturian, Basque, Belarusian,
  Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong), Chinese
  (Taiwan), Croatian, Czech, Danish, Dutch, Eastern Armenian, English
  (Australia), English (United Kingdom), Estonian, Finnish, French,
  Galician, German, Greek, Hebrew, Hungarian, Icelandic, Indonesian,
  Interlingue, Italian, Japanese, Kazakh, Korean, Lithuanian, Malay,
  Norwegian Bokmål, Occitan (post 1500), Polish, Portuguese,
  Portuguese (Brazil), Russian, Serbian, Slovak, Spanish, Swedish,
  Telugu, Thai, Turkish, Ukrainian, Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-taskmanager_1.2.3.bb => xfce4-taskmanager_1.4.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.2.3.bb => xfce4-taskmanager_1.4.0.bb} (61%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.3.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
similarity index 61%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.3.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
index 256009485..1f84c2b01 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
@@ -6,5 +6,4 @@ inherit xfce-app
 
 DEPENDS += "gtk+3 cairo libwnck libxmu xfce4-dev-tools-native exo-native"
 
-SRC_URI[md5sum] = "202928c8ff0678a9df949d22a43f1614"
-SRC_URI[sha256sum] = "dcfc44da7c1f61d03e2c4bd1cdc8f92ce0d48b013bd0d140b3745d79b75dc3c4"
+SRC_URI[sha256sum] = "655684ddfc15fc09071f78f9fce5439d20bbd2d80ecfc5ba0a08fb38313e7d43"
-- 
2.26.2

