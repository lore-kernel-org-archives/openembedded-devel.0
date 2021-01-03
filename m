Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.20007.1609637177724033063
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A1R1r86w;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id a6so13903176wmc.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2dEWxmIc+TJafP9rWyrCNTPIBy+i8cxcy9t0qyNH/UI=;
        b=A1R1r86wp7ZFHJN/UerDong3C3Nzykp85J9KER98Mk5UsuJx9MGzaz3J7qmIt2gqGf
         0GT4tIn/QaDJkK2w+rNkuNxPU4awRnker77dJUsnu4CuNnxgOzzLY5ZYcmbTZAr5vvuD
         aF2zaJc92rrMXJXiu8EpKr+2/MHRU8Gy9fBjYqeJJQK31mJ9OwO+D/WWRL+H1yM0+kfH
         sSkBFFVoj4IxIc+V1AtUJM9ZeUGeCypMAY+tUGxKVyN27jBkj4wamuT0IjRBNFjJ5g8W
         RvvxsuPoVXvCtlpgom/d0mbTAcH/QbnqYejn0pHsF6QyVU76qX6tKii0rP0NMkCRpNuj
         pEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2dEWxmIc+TJafP9rWyrCNTPIBy+i8cxcy9t0qyNH/UI=;
        b=EEEEW7FmNNQXXplWWQ7cKvozzez+OTMvc9lHsJa+I2/yvDKpH1BXVeVi/8RqB0C+Ub
         t6VS/p0j5+YUyUMgWN4hcTUOFBudadPKLh8wKBdNNXrAZukXqPj5CY0Agqr80P/ppMbI
         U9AzmUXI00x/yB/yh1Kjs63fAmdWwzgh+48rl1TN71phpw2iFNgUuiEMcWsnPMkDbAN+
         fY1App6x+VnX3jvy00JhUy/JWEQ9MCG93mDZKNOI1ED44vNyuB/0AHO4sf1/n+cI/cUn
         FzhGGQIv2hPOFv1+zGVYVfBd2xXRBLt1SqO1VACxkWGlMcGQXwE9SXyOo9KL/fzwnjIo
         60ag==
X-Gm-Message-State: AOAM533aeNQWtQ0F8VihBMxabAODa7dLzhrfK4pTpdzsAZGHaT6PPllF
	Ih65rmYhupgzackftiuMwi50famH9E29Yw==
X-Google-Smtp-Source: ABdhPJwqAU4aL4UqbZNxg7tXK7blEVO6ne1XFA89JgmUirNB/tgBbMW0bhZjZFurWOT9eof1odFTpA==
X-Received: by 2002:a05:600c:2306:: with SMTP id 6mr21242205wmo.53.1609637176420;
        Sat, 02 Jan 2021 17:26:16 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:15 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/16] xfce4-smartbookmark-plugin: upgrade 0.5.1 -> 0.5.2
Date: Sun,  3 Jan 2021 02:25:51 +0100
Message-Id: <20210103012556.557336-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
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
 ...rk-plugin_0.5.1.bb => xfce4-smartbookmark-plugin_0.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/smartbookmark/{xfce4-smartbookmark-plugin_0.5.1.bb => xfce4-smartbookmark-plugin_0.5.2.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb
rename to meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
index fa2c474d6..252d4d71d 100644
--- a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb
+++ b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "f1c97ac62dd9054e8f2b01568fef3ba6"
-SRC_URI[sha256sum] = "3e28fb7cd2e2251e89a8715684081b862406e3fb4e6d8c0caa1b798a97703600"
+SRC_URI[md5sum] = "a418a441a57c9e0248d13c467fac050e"
+SRC_URI[sha256sum] = "2a279e2f5a54518684e62ad1f3cd8ef950826505b39725f1b5d8f0c43031cdd3"
-- 
2.26.2

