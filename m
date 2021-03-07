Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.28477.1615156505908308903
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 14:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nb2tHjwb;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id p7so5057341eju.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 14:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9hk7GziuvsLNEq+fchnpjn3uNz19cR/Kwh83JZyM7AA=;
        b=Nb2tHjwbp8T1Ferr8+AAc6ugftNUSmn3DpRxYKkV8Moc7f3LcEApVRVVRw+mhOawXo
         VFx+o1nRTn4quRKdRWzZcXBPCNL8AmOzMNskZt5Y+WXehbNcugnFPi7emaBSGmYVJAlp
         wIL4RgRuf0uu2TJ33dl06gaDsUNrRQQeGHeB4go5vj/d1Emdh29wb8aBUsFQYgzmugk2
         FbOQrSVSVPX/HRpv85MJXLDljWPcfUXphim/LFhFmsYSwYaumzyWmF6fhxJqzAJEiTwp
         P45QHSfp3Czsb02ewaRNl0kZpMFezQqXRUw29di7+jXmM4vKbqGPYcxK3cSHJPP1oVvn
         i67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9hk7GziuvsLNEq+fchnpjn3uNz19cR/Kwh83JZyM7AA=;
        b=lUjM9K3wV5AZnJ/LuC2hLXYKA7x9PAFh6vmqVJxDhO9ytcYtsnz/BjGLCkzflk6HYI
         XLy3WrlF75gLfLzQncSQNAYXG2I+O6a8ZnydYOYX8n/gD1aumHdsDL2xFyz7EtpDGcj4
         1l96A/42E0NvpCTKjgYc2jW7YMWl0MZZEYDl9KSfW5FStuYbOMyd3bnaBNUfStet7JZR
         E94ID/PE/DRdBtxuSwYgVxXKX1jKyuEya0MEq3Mfi8PdiwPlUojSGugCrcUM6CISL60k
         G1iTrFdihl4a49gMYde11a8d24cOs3bhfcd4oCaQ8BLEHRu5JBVoOQ/iUp5ct54G0YcG
         +qUA==
X-Gm-Message-State: AOAM5315S/HCzIgO+3286noXUuuWoETYjzV1qyTJP/fYdHF+ck5SA1cl
	piDdH7fH8B1ojKVO9NFRXFBTrRkPjac=
X-Google-Smtp-Source: ABdhPJx1G5ZJrXlDYXlUxvgUcjAHV1tp4bjCEQsCoGfmEp8vDsw4wz+UikbuzlQAZ1mQ8JAhtzdA/A==
X-Received: by 2002:a17:906:d9d1:: with SMTP id qk17mr12343287ejb.52.1615156504517;
        Sun, 07 Mar 2021 14:35:04 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f3c4e6849043cb4c496f775.dip0.t-ipconnect.de. [2003:f0:7f3c:4e68:4904:3cb4:c496:f775])
        by smtp.gmail.com with ESMTPSA id mc2sm5501399ejb.115.2021.03.07.14.35.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:35:04 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 8/9] thunar: upgrade 4.16.2 -> 4.16.4
Date: Sun,  7 Mar 2021 23:34:47 +0100
Message-Id: <20210307223448.1063315-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307223448.1063315-1-schnitzeltony@gmail.com>
References: <20210307223448.1063315-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

thunar-4.16.4:
- Bookmarks no longer need an existing, underlying file (Issue #47)
- Regression: Select copied files after copy operation (Issue #520)
- Reintroduce alternative zoom shortcuts (Issue #514)
- Prevent hangup if a copy task that is blocked is resumed (Issue #467)
- Regression: Allow custom image files for UCA icons (Issue #517)
- Dont merge folders when creating copy with same name (Issue #491)
- Fix incorrect return value in scroll event handler (Issue #512)
- Translation Updates

thunar-4.16.3:
- By default show all available volumes
- Regression: Skip app info updates on sendto actions (Issue #502)
- Regression: Toggle menu visibility on F10 if menu hidden (Issue #498)
- Regression: "Shift" + "Select Trash in menu" has to trigger delete
- Dont select previous file after delete/trash (Issue #477)
- Increase min. size of "text" field in bulk renamer (Issue #474)
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_4.16.2.bb => thunar_4.16.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.2.bb => thunar_4.16.4.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.2.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.4.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.2.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.16.4.bb
index 6b1a6b482..e5fd5ffd3 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.4.bb
@@ -8,7 +8,7 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "67a90b98c436192f9aa6cd18a22a089e713007864aebfa65f36f121c86ba7add"
+SRC_URI[sha256sum] = "d51a2018c1ba7dcc420e7a84d85cc17a58f26fb1c80ee4c15e689a49f10425f9"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.26.2

