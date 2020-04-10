Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.1833.1586556601543490064
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 15:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YHr7usyT;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id z6so4207981wml.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I8TId3io335delHZfGWlZzaphrtqOVJs46/P6ibDw/U=;
        b=YHr7usyTCLnNHOUpp6Xtci0qQR1zOk+zcI9xE2HlEle5maxinKhvI2pwg/6ES4wQmH
         zaSItuf5amWDkKct+E4klwQadAFkM5wmrKKl4qydFovClTwiq3pzhXI0GEAcLimatghv
         qVjR+jXMdMPQhnHqYu7ZUucTmsQ0v0M6LK2+wVbgNlXW7Vq+K4d6ZVU8G568IV/IqEYD
         bH40mmH1Ohu/2zed3WA30Wza7IKNpXtgMaAk9pb7fJSOB0XX7DN2cqGcNsKagUy7PGPV
         rfSSKzl0xJ6sKTwFxqxqpBo3AB2UB6EjqZs0NwFhHwrnuji4KoKoo3qA6Hl9n3Z/uYgg
         DPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I8TId3io335delHZfGWlZzaphrtqOVJs46/P6ibDw/U=;
        b=npgM+7iDusX+0LMXE6xCY9K+a5jpZoTFnZf32PyHQ4wasGen3e3xvP1KVkmoWiwHnE
         oVSlBoamtj68FzcoDv0RqYK4LosN8zL9Y2yD4+GoFv0Jx+fkIkk2WItVudBzlrW+Mghc
         2gZaaeaw5J4Rujv3i0bkReEb+r/W/mgHTyVI51qyn51q43D9Ckxf48eHuBZw8kGypohu
         VJ+T7X7jsXWObHiOK47H4ZFSw70bJRSoPB9A+ZnEu8p2Ki6W7TngYyQtq1j0hMeMoN/B
         spKqUxGhHvLomnWFb3HXpmkf1ErqaWA/S1uus/dbv4x2YnVVTu/C+nGWqPoKUXNx2IGl
         Lt7A==
X-Gm-Message-State: AGi0PuYzGKFniu/oswIdu/YFra317JJtnBjVKyfMi3gO+06PUoS0qIuV
	fLeLYeNpWkyVNO7MB/kVN7/9itCFTRo=
X-Google-Smtp-Source: APiQypJWjco1N6cGUHdKiubWPWOGwLARKt9YIohBNdxac1+jwrga6FZwkSEbXK2zdr0JWB0lcSuJAw==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr6875362wmj.17.1586556599880;
        Fri, 10 Apr 2020 15:09:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F05DA42C8F51B0BBAC2F53F.dip0.t-ipconnect.de. [2003:f0:7f05:da42:c8f5:1b0b:bac2:f53f])
        by smtp.gmail.com with ESMTPSA id i9sm4664773wrn.25.2020.04.10.15.09.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:09:59 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] xfce4-notifyd: upgrade 0.4.4 -> 0.6.0
Date: Sat, 11 Apr 2020 00:09:43 +0200
Message-Id: <20200410220945.23712-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200410220945.23712-1-schnitzeltony@gmail.com>
References: <20200410220945.23712-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.6.0
=======================
This is a new stable release. Please note that the default fallback
style for notification bubbles was changed due to the simplified drawing
procedure. All existing themes should however continue to work without
amendments, but the Adwaita theme will look slightly different (better
hopefully :)).

- Simplify drawing the notification bubble
- Switch to new fallback style class "keycap"
- Ensure normal font size with Adwaita and keycap class
- Fix logging simultaneous notifications (Bug #15167)
- Disable rounded corners w/o compositing (Bug #16586)
- panel-plugin: Fix configure dialog
- panel-plugin: Use new XfceTitledDialog api
- panel-plugin: Toggle 'Do not disturb' with middle mouse click (Bug
  #16132)
- Allow compilation with panel 4.15
- panel-plugin: Remove deprecated calls
- Replace GtkStock buttons
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Belarusian, Chinese (China),
  Chinese (Taiwan), Croatian, Danish, Finnish, Galician, Georgian,
  German, Greek, Icelandic, Indonesian, Italian, Norwegian Bokmål,
  Portuguese, Portuguese (Brazil), Serbian, Slovak, Slovenian, Spanish,
  Turkish, Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-notifyd_0.4.4.bb => xfce4-notifyd_0.6.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.4.4.bb => xfce4-notifyd_0.6.0.bb} (84%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.4.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.0.bb
similarity index 84%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.4.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.0.bb
index 06ab0dfeb..5e0f44e29 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.0.bb
@@ -14,8 +14,8 @@ DEPENDS = " \
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "9614d4f7c0790e8ab24e55896a44a8ac"
-SRC_URI[sha256sum] = "090571acf94c423003426cb779fb23e8545c68bab6485563b589c7def8a21b55"
+SRC_URI[md5sum] = "1724fcb635bbab44c9f62c69734e446d"
+SRC_URI[sha256sum] = "c1d126a81604ff967e4655f06427763bf559c338ba629c95cb9aa7f5d6dc8ba6"
 
 # Avoid trouble with other desktops e.g KDE which also ships dbus service named
 # org.freedesktop.Notifications
-- 
2.21.1

