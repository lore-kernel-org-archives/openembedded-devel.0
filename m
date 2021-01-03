Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.25073.1609683196217740604
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MSlAzs4v;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id h16so24503404edt.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uSydUEXR/NXmFLvk6vrAeVLbHDFg83EyvYWS4DdS9do=;
        b=MSlAzs4v+vjCIm0jImCI/SlHdm9lrlFJrHWf0ne+oK4SQ3sLLV8G2MLrsUQmLQf/Vs
         I7CBbQjPQDH0ck066GcqH1AJEpcgc7+VYQf9RPicrAlnh2GmKGKkeY7Qe7AqtJjEvfZG
         WyzWSDuPfCHiQTjrHnfQ8scrTuJTSlFStYcmiG4zMbJVQsqgx5MgxMKVgcBbvCgqHmii
         4+WDO68XdFqVr7hMmBltov8NpPCpr6Iz1na1tUViI/edh6Aeysmx6cEZNQxVAjrunE2x
         ovjTFsscRpJNM9ZjAlYFZmhUL4GNBlTXjGLUSwpqSkT1PG8SFyq6UUCjX1Xs1MrNb1gI
         XJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uSydUEXR/NXmFLvk6vrAeVLbHDFg83EyvYWS4DdS9do=;
        b=J/kSL7H+05SpSsqsW3tRBdTrVz2XLBlcp0iPE4wwbFo2lKX+cH/a41jO6hWjqFUg7M
         PwWBcFfFN1k4Gh9/3U4iug6MkhuI+oAfaHbNoDQtuJbEFoghPLwZrMK/t4Yy8grRd9ta
         W999T3yVs1UAtTUMyvOp1reXjxayytzdJsVdlH3RBVw5KT23NL1efo1Rfi1q1IyKOJXP
         mPuy/X7x7oP39liNNWThG5cpnjfp6Y/ltd+UuWvi3Drf/t+XWTt2OcLLMPqSPi30v646
         +Lrv7Be8GTpF09no3vQZ/xoYa/tOd3uEtEcFknhMG8+85NrCqmTixSESRvVnW+YfGPYw
         y6qg==
X-Gm-Message-State: AOAM530mj/f66TCpPuqPItlQ3Ovd4C17NKg4u9UZZjeJGYKI2wFKk6T/
	t9/3bOaJnDW1iSU3Tj728nAEyeSpRrs=
X-Google-Smtp-Source: ABdhPJz+PqjIJz1ZGoULOG945m3xfLZmFG6tn0ZQvDc3cq+6G3VVdWnsv4y9hVsXWsmx+M7kzwB7TA==
X-Received: by 2002:aa7:c403:: with SMTP id j3mr65948796edq.217.1609683194883;
        Sun, 03 Jan 2021 06:13:14 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:14 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 16/16] xfce4-xkb-plugin: upgrade 0.8.1 -> 0.8.2
Date: Sun,  3 Jan 2021 15:12:47 +0100
Message-Id: <20210103141247.1637618-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
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
 .../{xfce4-xkb-plugin_0.8.1.bb => xfce4-xkb-plugin_0.8.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.1.bb => xfce4-xkb-plugin_0.8.2.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
index 8ee374035..bf9e0435b 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "72530bf59d7cd902326469e5a7a9892b"
-SRC_URI[sha256sum] = "c19ecf126201deb6148741c521124771ad396adc874471512ab5ffe1946567a1"
+SRC_URI[sha256sum] = "bb4be13f6f73cd86a6d939e1a6b125841cf266415bc4fd134a511e4f0cf97967"
 
 DEPENDS += "libxklavier libwnck3 librsvg garcon"
 
-- 
2.26.2

