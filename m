Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.25072.1609683196075007783
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EtwK+ebe;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id jx16so33401310ejb.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TaBreQI7JZExIpks2ERCdqkGZO7J4sPZAuFTshwcf5I=;
        b=EtwK+ebe3SaGyXmStNvrQAu/ZksgJuMI8x4yYhpBxQTD2q24ptD12rJAzhxG7Bayfa
         nnkomdNaTN76Ux3ak5fB9BkUi6gCuQ8nQeTjwNxqxxBlH5K+PN43Q2B2cQ9aBhj6rIwc
         tVqXMC82jUoyKLHXnZThu0PQoPArZVRuixOee96yCurrcyacuwm1KfMvHqRIU6VF9RVF
         FhIH0VryFgU9d0lLitPfONMiGM7TJvqQe95HFefBcAeGoWtX9GuEcYS1XYHq8rkMYjOT
         NOkUbRPUyP6/a5VHK2qexyi1UAFhLb3sL1tULYs16sntskt6mACr8LyXoGqzOz4oRR7p
         sm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TaBreQI7JZExIpks2ERCdqkGZO7J4sPZAuFTshwcf5I=;
        b=uK+ypdz6KXFV8fWaFwiSbhI0su5F/GuflZgSmKm9AiQ2k5KRXJ+uxRtdkytqs6ciLz
         LEsu+V/xX5DwUy/bYamQHdYaLm8u4Kn90pSRruCIxSx0szU2uwklFgikGNMShuoKnrPz
         0i3Ypl9F7iwMB0cQ9Xl8HMkAdz83oaOO+Fg4frRv613k0lLafP63aLeU1DPJ3tWuBnqJ
         i2C4eXCjQN33TQ3aEJdolHs3L6BC+3VdhanYZ+85aVCO0g02e8/6aTZPOakhN+9a0QCz
         MPZEfwsrHEsHrSdhzRPL1Y3b8oSHWjoUnDi4DKyiAf0V9g0JkjSq5gz3waO+75732zcs
         +7Fg==
X-Gm-Message-State: AOAM531DHgUX6JH4RMYMB4GssEJwcPd/JU7sdb/m2hJh3J78PZ7SjLUW
	Z1hUTb7wHbBrIwfABt5jRoSJXItHBqE=
X-Google-Smtp-Source: ABdhPJzAqAhmdGBMdbK3s92tuInqU2IbT4hrl14elRunNWbI8z675BRRmLuceonhBwcU8buGQ/68RQ==
X-Received: by 2002:a17:906:71ca:: with SMTP id i10mr61139372ejk.528.1609683189722;
        Sun, 03 Jan 2021 06:13:09 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:09 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 11/16] xfce4-smartbookmark-plugin: upgrade 0.5.1 -> 0.5.2
Date: Sun,  3 Jan 2021 15:12:42 +0100
Message-Id: <20210103141247.1637618-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.5.2
=======================
- Fix build with panel 4.15
- Fix ISO C90 forbids mixed declarations and code
- Update configure.ac.in syntax
- Create README.md. Update configure.ac.in
- Add basic GitLab pipeline
- Update URLs from goodies.x.o to docs.x.o (Bug #16176)
- Fix build with panel 4.15
- Make build less verbose
- s/http/https
- Translation Updates:
  Albanian, Belarusian, Bulgarian, Eastern Armenian, English (Canada),
  Estonian, Galician, Hebrew, Hindi, Icelandic, Slovak, Slovenian,
  Spanish, Turkish, Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ark-plugin_0.5.1.bb => xfce4-smartbookmark-plugin_0.5.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/smartbookmark/{xfce4-smartbookmark-plugin_0.5.1.bb => xfce4-smartbookmark-plugin_0.5.2.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb
rename to meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
index fa2c474d6..81370e3c1 100644
--- a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb
+++ b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "f1c97ac62dd9054e8f2b01568fef3ba6"
-SRC_URI[sha256sum] = "3e28fb7cd2e2251e89a8715684081b862406e3fb4e6d8c0caa1b798a97703600"
+SRC_URI[sha256sum] = "2a279e2f5a54518684e62ad1f3cd8ef950826505b39725f1b5d8f0c43031cdd3"
-- 
2.26.2

