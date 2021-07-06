Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.3729.1625562819955001621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SBA45uSY;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id m1so27033935edq.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 02:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4BvuPEn5eLI3IBmopkESyLQg/hcX5WFkGNJ91kvDQAo=;
        b=SBA45uSYqwq+hnTlyYXrsvyN/MF2+C4eTL4l61rRl8eXLjr8tPOEkN+bMl9V086blG
         rQWCwfapjcRBjBoKphHzWHVYwsU1ow5bDE0Z4NvDeAsaVfjaJ7RNoK+I4QEFPwqvTSo7
         ED37al9ylhKjD/bGfTSNl+Hq7ZnPClH55bJKiuHIusGXQ3OWr4QHjUR/TTCmf4pp7WVa
         sPFOnaS02ILjYxVI0LTGEmEv8D69GYURyRgzoslgAJsK29aBn6JakbaSKJByoEP3FEK9
         e4IMxv3VqWsovQCw7QRo4H8q6djKUuTnYaEjwCwidIH/9cCCYCLDHtQYyL37lavOMARJ
         vP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4BvuPEn5eLI3IBmopkESyLQg/hcX5WFkGNJ91kvDQAo=;
        b=HKA183eS7aZP+J77dc8WkJtwgBlJcvXXS+e0ViYG7Gkx1H7yqyErEzISFF0TWGIEaM
         r+HPdp8KmZyO53UKhsnFtAZn8wAw2QT9zhCnLHDOBKL0u7JNcWLaeLwTsilIztbMbi7z
         24NLMLx+T1sWT+sOjnKyVc4g7NgYVA3FZPiWIkFMt7Vx1WHdyDHYwue9FbPoKRBybBJ3
         JRFt+ASS+ECbxgTfvpf6BS3jPKqJeJgOpCqmBhsV0g41n5+9leYDIpIXgxgnspfrpfW6
         xQDXXH30spc8PIbztJNbGYLhv8WFM3Pq9AsR0nXF5FJ7/XwLH1W03tZe9uoVxy3hyEsK
         sABQ==
X-Gm-Message-State: AOAM531ArFiA0P02vQwDxDkA3UE+ycIX3/Zitcx80nfHScscuk28MyZJ
	CoSelbIbGxORr+2bnYHkPw4cLP/a97g=
X-Google-Smtp-Source: ABdhPJxaL/5gwqHiGDGH1U+Esy06BQphvB9utZUaRPpRQtOB2JRYyvS6ujkKbd+ZESNVGrAYww7QAQ==
X-Received: by 2002:a50:ff09:: with SMTP id a9mr21496855edu.368.1625562818541;
        Tue, 06 Jul 2021 02:13:38 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d4039af027e3874c3f08b.dip0.t-ipconnect.de. [2003:f0:7f3d:4039:af02:7e38:74c3:f08b])
        by smtp.gmail.com with ESMTPSA id p5sm5358273ejm.115.2021.07.06.02.13.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 02:13:38 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/9] ristretto: upgrade 0.10.0 -> 0.11.0
Date: Tue,  6 Jul 2021 11:13:23 +0200
Message-Id: <20210706091327.1513939-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706091327.1513939-1-schnitzeltony@gmail.com>
References: <20210706091327.1513939-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.11.0
========================
- Update copyright years and appdata infos
- Enable `HAVE_MAGIC_H`-delimited code
- Fix compilation warnings
- autoconf: Some updates
- Update `.gitignore`
- Add option to copy image to clipboard (!20)
- Allow dragging window when CSD is used (#52)
- Remove GSourceFunc casts
- Added new stock icons with reverse DNS format
- Updates README.md
- Include string.h
- Codebase cleanup (!7)
- Make build less verbose
- Update .gitignore
- Make sure that argument passed to strncmp is non-NULL (!1)
- privacy_dialog.c: Remove dead initialization (!2)
- image_list.c: Remove dead assignment (!2)
- Add basic GitLab pipeline
- Switch to README.md and foreign automake mode
- Bug #16717: Move from exo-csource to xdt-csource
- Resolve couple "cast between incompatible function types" warnings
- Fix memory leaks in Privacy Dialog
- Resolve deprecation warnings
- Resolve some deprecation warnings
- Clean up unused functions
- Rename vars and funcs: show -> hide
- Add inactivity timeout setting to Preferences
- Hide the cursor while inactive in fullscreen mode
- Fix 'Status bar appears upon leaving fullscreen'
- Update .gitignore
- Do not show translation info on --help output
- Fix "window-state-event" handler
- Update credits
- Add support for old gtk2-style bg color settings
- Add missing LDFLAGS (fixes build on *bsd)
- In fullscreen mode, show toolbar when the mouse pointer is moved to the top
- Return to git versioning
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../ristretto/{ristretto_0.10.0.bb => ristretto_0.11.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.10.0.bb => ristretto_0.11.0.bb} (72%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.11.0.bb
similarity index 72%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.11.0.bb
index fbca96f60..e611ddd93 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.11.0.bb
@@ -10,7 +10,6 @@ inherit xfce-app mime-xdg
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "4249e14fba78728481d89ce61a8771fc"
-SRC_URI[sha256sum] = "16225dd74245eb6e0f82b9c72c6112f161bb8d8b11f3fc77277b7bc3432d4769"
+SRC_URI[sha256sum] = "877e30d412c8cbfa9706f4ac0cab1a478f5829beafb773addc7722ca0cb78823"
 
 FILES_${PN} += "${datadir}/metainfo"
-- 
2.31.1

