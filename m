Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.19841.1609637171419505174
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eth1UIJO;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id e25so14512833wme.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LqkYnyStGCUfHwFtdE4aBVQU0AiRyxIHogfhxqdVV+o=;
        b=eth1UIJO+/VX7/vXDV9MtAWP+Ws39YNR1DjUwduQpGtCrTCqaVFv16pFjFZcvymQYW
         3L/ETbo/S0gVjwxO87zWaQycGop+BG14ZsjMcM/8lIRQ9+vv6NFFqfNz3VFXzHxJbRU2
         Gnlrb9uPWpVW/TyTZdkJYzBxSSz9Q+nw8xDuLeuXxYHflIATL4tAajHjUMXQvLEOYazA
         uSPGY6Z4xRdwdcQaWSGGvH3l/CcFdDzy1+w+9EY2HOZNy9s2bCZ85JBYZgIeTDSKeDGc
         fVL3+NpC0rdemLqgnK39xkMfq+7tQgTTAM1SynajDbWwH0URPqWwA+g/4TQIfD6/HjEp
         Fjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LqkYnyStGCUfHwFtdE4aBVQU0AiRyxIHogfhxqdVV+o=;
        b=lJUfdNt9ve0NFB2evGCB/1GteIb+nWVYqLgYfcLJh3tSYGvlApoiLbjf+Q1+kpzGE5
         +gFgmVMXmrhICIkgzUPUxmUaRhcg9BcrGUgQqDysjrjnpigIyL+t/rvgIu7wll0SXgGI
         zUZMW25pUqZVd/u7mV9peKwWb//fFvQilTUspkqJGXAjEWFN+fd62PX695T0QSgluohT
         ye6tVQCz7YC2enPWt8annXuUi9DISbkaVQH7gp9j/WH8ZEar9f+OdJ2hw6Dgxwl9k97p
         zZwcu1/21dGoyt4z6SH716/TCozAKagUTTsjPHsw0+DuvtF3+i5yNl02/3C5+52QZJU/
         BDcw==
X-Gm-Message-State: AOAM531QF5RN3JnLF/BKf5wjgJt/P3lWjO3f2uu6xPtxwDe/HETTVUqu
	XIxb2pKL+5tvmOJvmcTGfy/DXWF9iw6epQ==
X-Google-Smtp-Source: ABdhPJxLhnvyPWOG5tyh182T9QQmH0EqmSOi3caSGt8IOxY0UyQF85A5Txg0UqR66xi3BncwSe5mnw==
X-Received: by 2002:a7b:c319:: with SMTP id k25mr21223438wmj.142.1609637170107;
        Sat, 02 Jan 2021 17:26:10 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:09 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/16] xfce4-screenshooter: upgrade 1.9.7 -> 1.9.8
Date: Sun,  3 Jan 2021 02:25:44 +0100
Message-Id: <20210103012556.557336-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.9.8
=======================
- Fix dialog icons and add title to error dialog
- Go back to actions dialog if image upload fails (#12)
- Go back to actions dialog if GtkFileChooser is dismissed (#33)
- Make radio buttons execute actions on enter/space press
- Exclude shadow borders from CSD windows (!10)
- Capture mouse cursor in rectangle selection (#30)
- Region size should show updated size (!9)
- Add info about Ctrl to "Select region" tooltip
- Replace AC_CONFIG_MACRO_DIR with AC_CONFIG_MACRO_DIRS (!4)
- Added 24px and 32px icons
- Fix screenshot capture when scale > 1
- Add new App icon and switch to rDNS icon name
- Switch to README.md and foreign automake mode
- Bug #16717: Move from exo-csource to xdt-csource
- Update homepage link at appdata.xml
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United
  Kingdom), Estonian, Finnish, French, Galician, Georgian, German,
  Greek, Hebrew, Hungarian, Icelandic, Indonesian, Interlingue,
  Italian, Japanese, Kazakh, Korean, Latvian, Lithuanian, Malay,
  Norwegian Bokmål, Norwegian Nynorsk, Occitan (post 1500), Polish,
  Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian, Slovak,
  Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian, Urdu, Urdu
  (Pakistan), Uyghur, Vietnamese

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-screenshooter_1.9.7.bb => xfce4-screenshooter_1.9.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.7.bb => xfce4-screenshooter_1.9.8.bb} (80%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.7.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
similarity index 80%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.7.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
index a0de63004..936834bff 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.7.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
@@ -7,8 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "9b63c0fa7cbde8ec4e6cacb75fc44b65"
-SRC_URI[sha256sum] = "0f7161053a23a6413376f4d17db6b774d4849384a9b1ffe01fdb2b0035a070d1"
+SRC_URI[md5sum] = "35f049f959ca5aeae07b065fff7c2762"
+SRC_URI[sha256sum] = "6f029d614ad3b63fbcf742984dc6c976f3008e7d88fa487d49ed544f56f62c50"
 
 do_compile_prepend() {
     mkdir -p lib
-- 
2.26.2

