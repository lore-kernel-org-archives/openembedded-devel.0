Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.20581.1600613459711850993
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f6116aGy;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id gr14so14361155ejb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FGylluzvVp3zeYF4EJXnHdqcvcRhLITpmfu3scn70cw=;
        b=f6116aGyvcpGiK9NFTY9jz6R49gXQkP4B+tJ1JbD7u7P6B+jbJ7aECFVuROCl7FEva
         hXpv0AdnJAV3j+5ocIzrFUgMLgW3f9yXgG5TdFjXzU7+m4OMUjfNdaqHpgiNOSrHS5kg
         M/of61NOEijuEGUF8pc9voPEVolIQO58O3o4VXxic/zhbkDF48eE3hpB9knwniFIJwHX
         Nji0gu/HPtznAkNfiFm6mvOUePPoBsQoZN4PUMJilWMr4dQFc1ehoT5j2ffxQdY0rU6p
         Re3U221+oCsjgjhmN4iO8tYktQqgKqVtO+dLs54zrAFgD0v1rGZjCF5iBj92HpR+Icak
         UUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FGylluzvVp3zeYF4EJXnHdqcvcRhLITpmfu3scn70cw=;
        b=b0w2Inkg/8nEAhC4/VKxencVB9QqxLyBjI+YcSC1S5SWiy9sGZZjF+G3phdDoaek/8
         Htx1IXgsdxBrZ9A9pjH9orcVKsngTo2KvJlbMbWE/iXAwImlyaqJaVInaE31wrbPN2fl
         f7Z6Yj+QSysRNzOCqP6C6gtZf3VSxMO1zbkxkl6zbuVvEA3wqfRkvrbPHGfHXv+ekVQn
         wD9ndMemN7H0TAMiuXlxup39kDGKHY6KrOLDXsm12sSqSZA7rS3qXF09i3XVVRcAPfJT
         PJ5Vl0PrNI0A4A2YmzQYh+QiPG0Nuz5/dqzFkuZwrta0CTK8wukF9GyqzODuU1grYr8Z
         iZCA==
X-Gm-Message-State: AOAM531kP7yLPmJWcui1HHpGjkNOmi9o6RlrZC4C2QVudfCi3AkZk4Dj
	Kr93zknBJrpLKSQXutUOSQVS8RKYFBM=
X-Google-Smtp-Source: ABdhPJzAi5+2tT0PFnhkrdoDMFjtESUOj3r4aP/gAngFFheWfEibpAlQUavGIhqKsXQVU8oxKZR8Vg==
X-Received: by 2002:a17:906:68cd:: with SMTP id y13mr45640431ejr.132.1600613457863;
        Sun, 20 Sep 2020 07:50:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:57 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/11] xfce4-notifyd: upgrade 0.6.1 -> 0.6.2
Date: Sun, 20 Sep 2020 16:50:37 +0200
Message-Id: <20200920145039.2240-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.6.2
=======================
- Switch to new app icon and rDNS icon name
- Default to session autostart instead of DBus (Fixes #27)
- Add configurable log size limit (default: 100)
- Make buttons on non-1st notifications work
- panel-plugin: Add option to hide "Clear log" dialog
- log: properly handle iso8601 timestamps
- log: Use SHA-1 data hash in icon cache paths (bug #16825)
- log: Improve performance of adding notifications (bug #14865)
- log: Refactor log keyfile element insertion into a separate function
- Add basic GitLab pipeline
- Fix GTimeVal deprecation (Bug #16805)
- Remove unused expire_timeout variable
- Fix memory leaks
- settings: Switch to symbolic close icon
- Translation Updates:
  Bulgarian, Catalan, Chinese (China), Danish, Dutch, Eastern Armenian,
  Estonian, Finnish, French, Galician, German, Hebrew, Indonesian,
  Italian, Japanese, Kazakh, Korean, Lithuanian, Norwegian Bokmål,
  Portuguese, Portuguese (Brazil), Russian, Serbian, Spanish, Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-notifyd_0.6.1.bb => xfce4-notifyd_0.6.2.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.6.1.bb => xfce4-notifyd_0.6.2.bb} (84%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.1.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.2.bb
similarity index 84%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.1.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.2.bb
index aed5ce4dc..5476b20bd 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.2.bb
@@ -14,8 +14,7 @@ DEPENDS = " \
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "58e70621d6b9e0e66399ed41ab402a47"
-SRC_URI[sha256sum] = "9b5274999c89bf296a7de03b375e8233eef37940b7444502130b92dfb6a089b4"
+SRC_URI[sha256sum] = "19ab84c6665c7819998f2269322d53f462c30963ce26042df23ae525e7d16545"
 
 # Avoid trouble with other desktops e.g KDE which also ships dbus service named
 # org.freedesktop.Notifications
-- 
2.26.2

