Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.19842.1609637172357296583
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CnvmyCiN;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id 91so27339096wrj.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XzElD1vFwNshLDs3+avAnqmkppaM6zDCkXzvXqi2GP8=;
        b=CnvmyCiNtFokOFjl8SyRVKXyYHt7EmMvcUjH7JpoLzjV0om3flT/CSfOwP0AXG1+wp
         yagUpoucccXWX9bQNahNDM9FKd8DAXOmP5+h+etAWDve1ESyXxcec8CQ4F+bkgO3QhyW
         cb+HQQ+9sGHpx3yXpYGDv4tbZiG6JgkXMby5FMaMgY3ABDgRuQ4q9NVbacgXAHVYHEbk
         xE0NZ/b7gnq+q+R3Z0mH05UZVUv50XMZC9cg8cULIIGBibLWFiVnB9KCIjvUnfGbVzpb
         zWTkvoHBMLiOnCwXkVrTAIZjoQ2BoMAi9/DvbPl25aUsTvVzX2Qu0pJJFy2w4wNAoHiA
         14Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XzElD1vFwNshLDs3+avAnqmkppaM6zDCkXzvXqi2GP8=;
        b=Dk2co78TaAB5k91b3sjKhAvq/MStuDD8DLzhP6EELP+mz3A5dtriXYqwP0R/MglFtp
         iGQ1ovKCwEhr73esBBs2hF98jMILp/D2+PY2WzRCAlAr6Nf1upFe4S+ntIJU9nWzJQs0
         IcgoIlDvo9h9fU5gllzz9kXyjvKaWaZjy+JoIeffm/6cjsoTz2gLUze9JZNBPp6MQbf6
         xPH9VftqE//teF/yyJODWJi0fmTlivzo/cvP1ngy7GuWaDmpMAoheHFGIP2TD6cHAfR9
         zB1Ivigm+OBlF1IBUkbswcYO7C980TgTHlhXt51uWzH00iEtQYoCGxBjFI7DeU7F+VPU
         BA4Q==
X-Gm-Message-State: AOAM532WraSWTlILp0rbTDU5BigatW1DtncbpCoKgchgW9yevP2boI3e
	NfFpZYPkIV7CHkDPvSOhzk6PvKM3gKH2Sg==
X-Google-Smtp-Source: ABdhPJyzZzMqO3enLHwjBPsetH2TOA2Mcg6r+JDRqCZzs7U4lUKBgc1D3Oen/6Xn36SI1WUWNMX0Zw==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr74314873wrv.124.1609637171059;
        Sat, 02 Jan 2021 17:26:11 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:10 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/16] xfce4-taskmanager: upgrade 1.2.3 -> 1.4.0
Date: Sun,  3 Jan 2021 02:25:45 +0100
Message-Id: <20210103012556.557336-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
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
 ...{xfce4-taskmanager_1.2.3.bb => xfce4-taskmanager_1.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.2.3.bb => xfce4-taskmanager_1.4.0.bb} (61%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.3.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
similarity index 61%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.3.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
index 256009485..e94c2f459 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
@@ -6,5 +6,5 @@ inherit xfce-app
 
 DEPENDS += "gtk+3 cairo libwnck libxmu xfce4-dev-tools-native exo-native"
 
-SRC_URI[md5sum] = "202928c8ff0678a9df949d22a43f1614"
-SRC_URI[sha256sum] = "dcfc44da7c1f61d03e2c4bd1cdc8f92ce0d48b013bd0d140b3745d79b75dc3c4"
+SRC_URI[md5sum] = "c04afde45f1f3f87a3a9ac56f73acd26"
+SRC_URI[sha256sum] = "655684ddfc15fc09071f78f9fce5439d20bbd2d80ecfc5ba0a08fb38313e7d43"
-- 
2.26.2

