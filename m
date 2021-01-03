Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.25314.1609683186498443319
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O0atBGnl;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id n26so33427597eju.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tE06D1y3htyo9J8SWRSV1ENuRuXJE9n6Ijz1UI2jNFM=;
        b=O0atBGnlgcBmFTWMQBXoTQse/DQw9AC6oCQbrCQ+TVvWgxkitniGNV8FcLnANIlalF
         mh4vgXMJsAHWfW+V+Z2B80MSl21M/k9jq4OFrX5X39nol9bNw+wPniDbMvARcpU4j78i
         KHMEo8fPZEJDl1M89SotI6WUxMTZS03j7g4xzlA4Mc+cVzXcUk0HaxCnIOGMqMnBXOeb
         v7dnyb+E89DgiyuQdUzNHeMNNOgm+jS9alYDmjLzEsGIp3gbY07957z+CAr0/CY0xbqV
         mo3mJu0bOK9IWxrJMtnrOl0SxLHxYRFxDXZoa995x75hazeEPsoFgEdCAz1REBWva3/I
         ObCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tE06D1y3htyo9J8SWRSV1ENuRuXJE9n6Ijz1UI2jNFM=;
        b=ibijNDjWCEwWfckREmCwC4/uWGflU6NTsF2bRkOMsJBkxp6erwTVBL4139gmJLEewK
         Os6AOUTn2QnsMUhtKSjQ0+oQCS+1YcRQTUqMDcPGSb2pgPcMwdYc4JnfNg9en+iQx5+R
         arVgobxRlOYHErQCuIWSVUlUlfD8w474QmYodUNC5ycwga/Vf6uYNLVhhgERjsuGZ57R
         isBw9m6pARiRwLYDnEscgMMKg0Y7bZ+Hkx9vT0VZK6YJOMWj09T1FC1mG8fhvkqKTUx8
         gSZ1J10LoylnyMxK+ffLnmJCx+bKEM0RVmchVpmai7OG1KRuUjhiixx3uUk77M6Ybjci
         O3kQ==
X-Gm-Message-State: AOAM5319f/slPYs5G2lzHOuAk4xHW6Ktft2dwBYnos1555vSU+NCFp01
	WRd8d4DwoxXCZPHlkFjukORh+qFUMVY=
X-Google-Smtp-Source: ABdhPJxpYqUWQQ84mefj5DfWz9Zl5uhpkQOazUOmMDbTwxBMDo93GZX45fo211mcjUbSTEGqN3HOmw==
X-Received: by 2002:a17:906:e093:: with SMTP id gh19mr63713730ejb.510.1609683185153;
        Sun, 03 Jan 2021 06:13:05 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:04 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 06/16] xfce4-calculator-plugin: upgrade 0.7.0 -> 0.7.1
Date: Sun,  3 Jan 2021 15:12:37 +0100
Message-Id: <20210103141247.1637618-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.7.1
=======================
- Add option to not move cursor after calculations (#3)
- Align spin buttons in properties dialog
- Add close button to properties dialog
- Handle delete event when properties dialog is closed
- Adds new README.md updates AM_INIT_AUTOMAKE
- Update URLs from goodies.x.o to docs.x.o (Bug #16155)
- Allow compilation with panel 4.15
- Disable emoji input
- Translation Updates:
  Albanian, Armenian (Armenia), Basque, Belarusian, Bulgarian, Catalan,
  Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
  Eastern Armenian, English (Australia), English (Canada), Estonian,
  Finnish, French, Galician, German, Hebrew, Hindi, Hungarian,
  Icelandic, Indonesian, Interlingue, Italian, Japanese, Korean,
  Lithuanian, Malay, Norwegian Bokmål, Persian (Iran), Polish,
  Portuguese, Portuguese (Brazil), Russian, Serbian, Slovak, Slovenian,
  Spanish, Swedish, Turkish, Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ulator-plugin_0.7.0.bb => xfce4-calculator-plugin_0.7.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/calculator/{xfce4-calculator-plugin_0.7.0.bb => xfce4-calculator-plugin_0.7.1.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.0.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.0.bb
rename to meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
index 1216456b4..6ed9e35d7 100644
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=909430f63fddd63f120ba29e8979f65c"
 
 inherit xfce-panel-plugin gtk-icon-cache
 
-SRC_URI[md5sum] = "1ae192a69834ee2f51f34a0a981181f4"
-SRC_URI[sha256sum] = "7b50ab947ab058e1c079113e7f0f8b38ef242fec36ec9f31bb4e3c19cb3f9de9"
+SRC_URI[sha256sum] = "e4016a03c3ef4ebddd97e4135f5e304f80677033c98e19644b9989ec6f5ada81"
-- 
2.26.2

