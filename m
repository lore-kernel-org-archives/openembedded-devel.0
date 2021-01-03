Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.20011.1609637182459968850
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L2xTobMC;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id d26so27312534wrb.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jV3eq5ZQ8b5m7og1qfShJDxMzuGp892IV1/RLL6vAgU=;
        b=L2xTobMCILWWORSKaudSajXRd/HgAppx0gqTYszHOOk+76kLolG8q2np4RWxB0irfL
         IivvU6FFppTXLYJibr+dFsidVL/k9ZRls+ICb6BxXWnlXT3jIxpd3HUejoz4YGJD6Aub
         CVQDt6T9VSmGgc5hTkK0zbTpf8Cqdv19/VrgCwJsp4qFuxsISKytH2jcLPE8+1YFGnSk
         RDyRBztLxqquwtj4rY40/eUSKVycZgOAYG9vle2YatsMh71FId4HcoHFzAw837VCjMQf
         uaZUeBzOt3U939pIGCHWMn6kbcgfWwizsKw6jnW1ORlcNCwvxJpMv9fTbXHyoYTq8zCI
         QJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jV3eq5ZQ8b5m7og1qfShJDxMzuGp892IV1/RLL6vAgU=;
        b=HM53KeSW1svT3A1oAsm8K1VoOu8Xkc3otjiO/FOX95lRL8WwSdNn+tEiDmdhUTZDl4
         O9H+iD38/oHI/15f9dsaQzDHXxtlHLngNLYDBcFZQbLSGMfkRYs3GaKSkzfUhvFTC6pP
         PGaTxHkItYFJEloBRpYdYeroba6q9d+75kdAafGgUz7ZI8pCAbEkGLtnRwNEGCsJTo1V
         ImxtFWDSliNEsKOYJ/psuXE5S2kvMIeyy1LJ9S29iDg7fvRuuUbKzhfzg03y+4aq2Tom
         Sp5lcLHHLgIYKWS1zl7IDHRlsqrJeT7SaubEJA68wQTyscCCDaxgg9DmeIg3jIrnecws
         uujg==
X-Gm-Message-State: AOAM532LkCPQpgdlUDjYMHXWpCi1zNikHLUkbER/01MSK5zPrXAW4mih
	9ZZVr5fJDQ7xMxz7h7DbnYlinXXu4UmdqA==
X-Google-Smtp-Source: ABdhPJzrWnhtQ19tUrR+GBBvwsC/ra5iy1/+gGw3wwp8VVNqGSy7jCNne10yW7xHwP7hid37JCghQA==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr75037316wrl.406.1609637180979;
        Sat, 02 Jan 2021 17:26:20 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:20 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/16] xfce4-xkb-plugin: upgrade 0.8.1 -> 0.8.2
Date: Sun,  3 Jan 2021 02:25:56 +0100
Message-Id: <20210103012556.557336-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.8.2
=======================
- Fix build with panel 4.15
- Update configure.ac.in syntax
- scale alternate layout dots to be visible on hi dpi displays
- Add basic GitLab pipeline
- Minor build updates
- Update URLs from goodies.x.o to docs.x.o (Bug #16184)
- Update .gitignore
- s/http/https
- Update Myanmar flag
- Improve spacing (Bug #14684)
- Fix compilation warnings
- Add -lX11 to libxkb_la_LIBADD
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Asturian, Basque, Belarusian,
  Bulgarian, Catalan, Chinese (China), Chinese (Taiwan), Croatian,
  Czech, Danish, Dutch, Eastern Armenian, English (Australia), English
  (Canada), English (United Kingdom), Estonian, Finnish, French,
  Galician, Georgian, German, Greek, Hebrew, Hungarian, Icelandic,
  Indonesian, Interlingue, Italian, Japanese, Kazakh, Korean, Latvian,
  Lithuanian, Malay, Norwegian Bokmål, Occitan (post 1500), Polish,
  Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian, Slovak,
  Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian, Urdu, Urdu
  (Pakistan), Uyghur, Uzbek, Uzbek (Latin)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-xkb-plugin_0.8.1.bb => xfce4-xkb-plugin_0.8.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.1.bb => xfce4-xkb-plugin_0.8.2.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
index 8ee374035..ee4e02dc7 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "72530bf59d7cd902326469e5a7a9892b"
-SRC_URI[sha256sum] = "c19ecf126201deb6148741c521124771ad396adc874471512ab5ffe1946567a1"
+SRC_URI[md5sum] = "8e10f98a44082a2df6a997caab9a0b21"
+SRC_URI[sha256sum] = "bb4be13f6f73cd86a6d939e1a6b125841cf266415bc4fd134a511e4f0cf97967"
 
 DEPENDS += "libxklavier libwnck3 librsvg garcon"
 
-- 
2.26.2

