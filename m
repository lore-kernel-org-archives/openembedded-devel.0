Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.25067.1609683184710153316
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kjzPkusy;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id qw4so33425061ejb.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UHSt0rwe4mim3LQBFReiiv1uZKSrbDGt2ziq2CmnBCM=;
        b=kjzPkusyT0FEY6iNXMlubl2ZnsktzNx1ONOm84ucAyNnNr7PIcHJFMiLYSrIyBbLZ6
         UROskIsWROxaX7TB0JReBgKY4p/UauX9afKVSJwiC7xmUN+VqfL5H/8rFBR7imOfAmWI
         94m8+dM1R8tLi8d3rxMwt2lsUcUh6VT7E4AArTosOl8L1oTBxmPemZGZCZoy2NBT54yi
         +fGj1VNSdyNAm7TcVicgrwpqE3usez3TaIZ4ON8Xkdtl7i0uAlQtVGaETrMUPg2GaP6B
         UTQpuv1QMizVxLJk4cMkD5fylrG8DxinXaA83WJ/xrddatVjdl92jscPBYgk618TMmEY
         YMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UHSt0rwe4mim3LQBFReiiv1uZKSrbDGt2ziq2CmnBCM=;
        b=AHHpPSvJALj8esBh2Smni03n5Mif25x6xEjmbVfGOsYMzbACi3VbzRFyr/A6azbnpu
         98Z8S7fpckwquujsiIUIr+4WcIo2Xa43ggZdJRG6goMWQqh2+GQE+au7Ldg9zT0TAL6Z
         CTz1Ye3IhIIF+YE7xo01hOTesQtFZkfNmtMu+4bFrskC5yl/3MVxSlgbiIUwPSFcnQNZ
         qBzyJLdb/k5jpO3j1B4WTB3FUa4MA9YD/qb679d0SbTZ/KIOr3BWZsXCFSOxu9LU2UaU
         1TU6+cJKe/HeaulIFciRwx2faXoMHQ6V0yn39DO6EH+OARFtMdItt0YTMb8bwY47PADE
         +6GQ==
X-Gm-Message-State: AOAM531TVFWxL6vnEbegYZ7hLlov+j0FZMwXXW+xof5XMU7vrUe0EHGm
	BC9Q2Ta47/YqyJH1/UNIwVQcnFZI9zQ=
X-Google-Smtp-Source: ABdhPJyoYmanqGdNQsSr5GuTgCDHq5kVbd/nOHCzWGu4rvgR+djupt5MJKsDBA0Z0ipXSWs2rJgrAw==
X-Received: by 2002:a17:906:5285:: with SMTP id c5mr52239310ejm.17.1609683183374;
        Sun, 03 Jan 2021 06:13:03 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:02 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 04/16] xfce4-screenshooter: upgrade 1.9.7 -> 1.9.8
Date: Sun,  3 Jan 2021 15:12:35 +0100
Message-Id: <20210103141247.1637618-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
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
 ...ce4-screenshooter_1.9.7.bb => xfce4-screenshooter_1.9.8.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.7.bb => xfce4-screenshooter_1.9.8.bb} (80%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.7.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
similarity index 80%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.7.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
index a0de63004..9e2497d43 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.7.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
@@ -7,8 +7,7 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "9b63c0fa7cbde8ec4e6cacb75fc44b65"
-SRC_URI[sha256sum] = "0f7161053a23a6413376f4d17db6b774d4849384a9b1ffe01fdb2b0035a070d1"
+SRC_URI[sha256sum] = "6f029d614ad3b63fbcf742984dc6c976f3008e7d88fa487d49ed544f56f62c50"
 
 do_compile_prepend() {
     mkdir -p lib
-- 
2.26.2

