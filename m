Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.9455.1609946264694094470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MqUNF3/9;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id jx16so5434631ejb.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XdWQmqmEtol7vihLi214nDjnoWtFGTLBqveYFF7iyQg=;
        b=MqUNF3/9+PYuxVZHkeOgsQDBGpL6Y6x/+lPARzifS7Gy2MW/b9LZxwjIrA5BbmSegR
         6BYp+o6a1vnlvuRliF/iKWl61gfbZJKRbjjlvzXOUGn9ZtcCLgT0MA22zyJ+6cS1UkDc
         zMmomUEcI6ZSeA4JKm9Nbrj7fiKfVQAsojOuFeqVLXENrWyw8DBFr3C56m87GCY1lZPC
         ASzKd6VREEmp78qdOoE9tXs6eEP2rtroJFzZ3zugA7VrWc+Yhm+S7IlOGz3e/aRseWYq
         ZNylpaH7h/R75vq1grMePjQ80mpyNGM2Dhh0uKTn2oQz3ZrLd9W/h5PzOFg3dNPedKGU
         Vc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XdWQmqmEtol7vihLi214nDjnoWtFGTLBqveYFF7iyQg=;
        b=VkAVAEfHBbj+UDVYT4SKHdyYYKEGxeG7nq5qV7ka6v4O6KDY//fwqrNxzaMXdWruPk
         N1f43HEF1de+h6R0WjPTedWoNBZUE3Px7YCLAW8H4iQ9//GwZyq2rADWXxxzQDr9V5tH
         jxOzO0P99SdIUt4gMxAOIyno3ZnzpfvNnAfjxERMyoAw3s0H5pMi61x+nqWljQ7QH0ms
         kOHDj7ob3kzOeGRrIJU6bBybXbAJu8Ec0lGwfNhm1Z8rBYjSTDT6U8CbqDMgSMY93Yz2
         ocEwrWqT0DCngkjZNX4EnFj/Q+e3TKUdiPVqZXXsWu3kgRNcsO26ffGFbAlEFqazAyZG
         bPOQ==
X-Gm-Message-State: AOAM531Ks4p+vorVGECkRSxCQljlQe1Yu5HD69VvzE5oooSlRKn2Q/Jn
	1dtAZc1bnReRKGCAelevqM7fOpl8yqrS4w==
X-Google-Smtp-Source: ABdhPJxMJeTi0oQnuX1G934eu19KgnypG/MFy22vIp0LRW25Ofz1oUANLQq1YAccdW987nPaQAM3/Q==
X-Received: by 2002:a17:906:134f:: with SMTP id x15mr3237141ejb.278.1609946263282;
        Wed, 06 Jan 2021 07:17:43 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:42 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/28] xfce4-power-manager: upgrade 1.6.6 -> 4.16.0
Date: Wed,  6 Jan 2021 16:17:01 +0100
Message-Id: <20210106151717.1779543-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- bump glib (and gio, gthread, etc) minimum to 2.50.0
- panel-plugin: Prefer ac-adapter-symbolic (Fixes #103)
- Add new icons in size 24x24 and 32x32
- Translation Updates:
  Albanian, Basque, Catalan, Danish, Estonian, French, Galician,
  Hebrew, Indonesian, Norwegian Bokmål, Portuguese, Portuguese
  (Brazil), Russian, Serbian, Slovenian, Swedish, Turkish

Release notes for 1.7.1
=======================
[Please note that this is a development release.]
- Add new app icon and switch to rDNS icon name
- Use more accurate status icons (Fixes #95)
- Also use symbolic icons in battery notifications
- Reorder screensavers so Xfce comes first (Fixes #101)
- settings: Adjust title and show min/max buttons
- settings: Allow critical battery level up to 70% (Fixes #67)
- settings: Add keywords for discoverability (Bug #10694)
- settings: Fix GtkSwitch signal handlers (Issue #99)
- xfpm: avoid default double fork
- Respect the notification daemon's timeouts (Fixes #57)
- Fix Laptop lid settings (Bug #15300)
- Fix spelling mistake (Bug #16698)
- Only update blank time when appropriate
- Bug #16717: Move from exo-csource to xdt-csource
- Guard against NULL pointer dereference
- More blank time debug code
- Indentation fixes
- Cleanup code
- Move default icon names into one place
- Silence compiler warnings
- Add README.md
- Add basic GitLab pipeline
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Hong Kong), Chinese (Taiwan),
  Croatian, Czech, Danish, Dutch, Eastern Armenian, English
  (Australia), English (Canada), English (United Kingdom), Estonian,
  Finnish, French, Galician, German, Greek, Hebrew, Hungarian,
  Icelandic, Indonesian, Interlingue, Italian, Japanese, Kannada,
  Kazakh, Korean, Lithuanian, Malay, Norwegian Bokmål, Norwegian
  Nynorsk, Occitan (post 1500), Polish, Portuguese, Portuguese
  (Brazil), Romanian, Russian, Serbian, Sinhala, Slovak, Slovenian,
  Spanish, Swedish, Telugu, Thai, Turkish, Ukrainian, Uyghur,
  Vietnamese

Release notes for 1.7.0
=======================
[Please note that this is a development release.]

- Fix inhibiting xfce4-screensaver (Bug #16364)
- Fix indentation (makes git blame harder, but code more readable)
- settings: Unclutter system and display tabs
- settings: Move % sign out of spinbutton (Bug #15994)
- Switch to symbolic window-close icons
- Dismiss critical notification when connecting to AC
- Make brightness steps configurable (Bug #12062)
- Allow compilation with panel 4.15
- panel-plugin: Properly show 'About' menu item
- panel-plugin: Add (optional) Presentation mode indicator (Bug #15773)
- panel-plugin: Toggle presentation mode on middle click
- panel-plugin: Add warning color to presentation mode indicator
- panel-plugin: Use GtkSwitch for Presentation mode
- panel-plugin: Replace deprecated call
- systray: Ensure presentation mode can be toggled (Bug #16337)
- Translation Updates:
  Albanian, Arabic, Belarusian, Catalan, Chinese (China), Chinese
  (Taiwan), Croatian, Czech, Danish, Dutch, Finnish, French, Galician,
  German, Greek, Hebrew, Italian, Japanese, Kazakh, Korean, Lithuanian,
  Malay, Norwegian Bokmål, Portuguese, Portuguese (Brazil), Russian,
  Serbian, Slovak, Slovenian, Spanish, Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-power-manager_1.6.6.bb => xfce4-power-manager_4.16.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.6.bb => xfce4-power-manager_4.16.0.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.6.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.6.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
index 608990ad4..7a778bdfc 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.6.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
@@ -11,8 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[md5sum] = "19873fc8a6de5e37ed57036a0002a5ce"
-SRC_URI[sha256sum] = "1b7bf0d3e8af69b10f7b6a518451e01fc7888e0d9d360bc33f6c89179bb6080b"
+SRC_URI[sha256sum] = "eb9c587c01b502fa45a32e7fc2aba98fa6d8391475133883654f77e562c43bf3"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.26.2

