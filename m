Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.19965.1609637173309506859
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oyLb4QGi;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id y17so27348955wrr.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2+qF+RNdjLx7geOMOrVpZ6/Hu2ItI9fLRLVZBMFN6mg=;
        b=oyLb4QGinS+QdW1+j7lhaOUShhmuOeb2remxpHbfRShLnI5Wpekt1+j/EbmvyuJq45
         /BNngYtGAc4/QldVJgev/8kHDWCJamAEos8HAzNE7Fvv9+q4mc8Jod9YvTL0XqDwxb2q
         TTf2x++nGJMl6N9P3ranOzPkEOgz45B2wcfmgsYLU7J5NJIxwZm0m25D50N7RlQuih8c
         qnefq35qoJA1dGyy86+ABT6Ce5zBVDTIYr/LGT8TYZZWqFZHZJ8K0gMmeR2+3H+o5zRU
         ScgJ94bYDlgIR6nYeffLFwhfbZ40BnJ6kkV5wHh4v1hxugzo4tvFZcTkLG2dh9pLYhao
         a8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2+qF+RNdjLx7geOMOrVpZ6/Hu2ItI9fLRLVZBMFN6mg=;
        b=GIfxnwhEpQb7kBYmI/QXs8KiI79pYpH2/+87AnLaiMfd2KZnht8tqkd/zxwISe7Bvc
         ysZ4LysLPVU2cNWcuFzd5fmezOrc9h8IawDGQ16V0a1cTt1nHzQrJpzHWU8rcGRIjKux
         PxKM5kYD7cyxu2bZrcHrCOVZEbbmRDFm3D2zsWjhqmej2fN1NB55PKVJBR09bcvN1h/F
         vdJ3W/BY7JG8OHHq9TubLs7TNGMnpoKw05KMHjLpE/zIvQ9PlB3MkpeGntt1bDdUXt0d
         8hN+NkJ5p2ZMl3PWdKDAXSleyBFpwCFEpJ+TEk7cXjh7M39BjcDiRBqd9NYBCgULW5Ql
         reXA==
X-Gm-Message-State: AOAM531S4Oux1dYpmVqiw1JJTi3JjorlT3wVmZ9ne3lwZCAIOUvDsD+8
	2Z5Q5Vqu3IyqJkPwF/0J5GOQcByENkwJuw==
X-Google-Smtp-Source: ABdhPJzMwCtVJyzM9cy4HzTs04tv0ejfWvqP/AAkpJ5UZcluDv6rYaZ1Z6GTOUfXHm3z3ZWq1PHEnw==
X-Received: by 2002:adf:e511:: with SMTP id j17mr73087644wrm.416.1609637171955;
        Sat, 02 Jan 2021 17:26:11 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:11 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/16] xfce4-calculator-plugin: upgrade 0.7.0 -> 0.7.1
Date: Sun,  3 Jan 2021 02:25:46 +0100
Message-Id: <20210103012556.557336-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
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
 ...lator-plugin_0.7.0.bb => xfce4-calculator-plugin_0.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/calculator/{xfce4-calculator-plugin_0.7.0.bb => xfce4-calculator-plugin_0.7.1.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.0.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.0.bb
rename to meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
index 1216456b4..31d353641 100644
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=909430f63fddd63f120ba29e8979f65c"
 
 inherit xfce-panel-plugin gtk-icon-cache
 
-SRC_URI[md5sum] = "1ae192a69834ee2f51f34a0a981181f4"
-SRC_URI[sha256sum] = "7b50ab947ab058e1c079113e7f0f8b38ef242fec36ec9f31bb4e3c19cb3f9de9"
+SRC_URI[md5sum] = "f2730b389006811baeccb38567f26025"
+SRC_URI[sha256sum] = "e4016a03c3ef4ebddd97e4135f5e304f80677033c98e19644b9989ec6f5ada81"
-- 
2.26.2

