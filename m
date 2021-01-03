Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.19962.1609637180635368237
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IWQpM6he;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id y23so14494338wmi.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=00giY8/vqpm/6YQ4+P/VFapXDD9RiGOFdggGOFOolU8=;
        b=IWQpM6heh4dAAmPajo2d2rHVB3tHcJPGCULYE5aub9snm9xvSiiD2gkFRe+LPFrI7m
         wKkGBFWZAi8H9vYpk84Cgh8tGfT6Xa3GNXZ4HLYlobI2TxgyMZNA3QrxEaUb2kwH/OAS
         vvDD0QRepi3l5g8dI/5rjYOTrlH9+n/miLNAtha2Doh9PYk+JtZWEUnpq1CbtX9Uq9m4
         j6FLdGiFZhhORAOCtHgqBW/9/Sn7BRCFyoX20E8c+MonH89OF7DfSrBfzXPv4fImALU8
         fAWQPtjkD2GyW51aF3gl0BtGu0efRcT6m9dmxbvido+KlnWYmrr5TBMB39A9WJFBEMlX
         uyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=00giY8/vqpm/6YQ4+P/VFapXDD9RiGOFdggGOFOolU8=;
        b=tPjQKpLp4xAxHJQ00Y2uIkP2SskJ0MTicY2+FziT6B2M5AlrIIvyqPcbTg+APS3Vt0
         Un8MEhXD4JVqrUKgH6GNGPDmPjTm1BJFlXOMiaGDEu3ZHvsCpDFSAdLOTmykyVD/tKs3
         cz3ggRqM7NY9EOKcr65v/OleBHk5uQYh0HiaD+lUB0f8tGy3NDH+Y4IpoRVhranFkHh/
         /Tol2HOvg9P1I7TjnPv6TDKwL5uEFYkNYwccr+lYmgef7lwicP+xKBF/TNNSM18ujBvO
         zPP39CslxHfzFGF/0/7g1hJGKt31TQyMqM71LT/vK1Ifr00LAeb1xLG1HOjPPNCAl3x8
         xdGw==
X-Gm-Message-State: AOAM532QYqsRqf2CwwaddW11NrFodnXtB5Ihojm+qTM8whvekBdmZODO
	qVBWUnQh0T0n4O6C2R0vbVsSxacsaY41Mg==
X-Google-Smtp-Source: ABdhPJyIHE5LW4SR4ye0cnwy7ZgmG2iZSJPde4WHQYn98S6wMEaVmjTtc0pLGHjQUr2RZb46j3+jrA==
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr21266488wmi.143.1609637179203;
        Sat, 02 Jan 2021 17:26:19 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:18 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/16] xfce4-wavelan-plugin: upgrade 0.6.1 -> 0.6.2
Date: Sun,  3 Jan 2021 02:25:54 +0100
Message-Id: <20210103012556.557336-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.6.2
=======================
- Fix build with panel 4.15
- Fix ISO C90 forbids mixed declarations and code
- Update configure.ac.in syntax and enable debug when building from git
- Create README.md. Update configure.ac.in
- Add basic GitLab pipeline
- Update .gitignore, fix configure scripts
- Update URLs from goodies.x.o to docs.x.o (Bug #16181)
- Make build less verbose
- s/http/https
- Translation Updates:
  Albanian, Armenian (Armenia), Belarusian, Bulgarian, Chinese
  (Taiwan), Eastern Armenian, English (Canada), French, Galician,
  Greek, Hebrew, Hungarian, Polish, Slovak, Slovenian, Spanish,
  Turkish, Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-wavelan-plugin_0.6.1.bb => xfce4-wavelan-plugin_0.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.6.1.bb => xfce4-wavelan-plugin_0.6.2.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb
rename to meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
index 95c1fe4d9..a918f4c32 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "e4e3d5240297253d242464e77f6145df"
-SRC_URI[sha256sum] = "f41f81ea063ae3c7d7904e1ee647a6b5efafc7436f47caed662ee417038eed17"
+SRC_URI[md5sum] = "957852f7bfcadc159169bc0125fdf31c"
+SRC_URI[sha256sum] = "ea7aa36650c596b1a29567d100776c68ed732aaf0f48c92245c4466058b5481d"
-- 
2.26.2

