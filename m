Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.18015.1590941792220251275
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UiF4QsOS;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id f3so2290655pfd.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LXixir0QkcKyLYk6q5CrZZ/FFlV6jQgGcT29qjQtIxg=;
        b=UiF4QsOSPd8VDHPLkS0FBN1RcaP73jx36jqnK+x5bE38f/7ZPHX5N5VA3GS9qOTeUB
         yqKzNEFTwfy+gc53WOBnROdGNcp2jn/q3KhqBuZ77ulv9ScKy3BBlEfvK8xWgAGBNUmQ
         Uw2eCzsGTHhit2B//wMBOkFu/3CRvOuwrOTiANn0BtSRTs703Ry4s0rEXaE51zfAIjY9
         ZTZ+CC/XphyZIlKuw8rdAKN4eoDF8znNwD5CjVN9shmT3zBOH9yDJ/9iDt+PPOXy4ZIO
         yVc+lbp0DfiMSC0U+vI473ANfPC9y9Q/M9Vp1q59VDx9SuaGdUKLKO9tfX4c4K4+BwBk
         NG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LXixir0QkcKyLYk6q5CrZZ/FFlV6jQgGcT29qjQtIxg=;
        b=gieTAYNqMNaFvezNmHZHVMrtq9cFl/IxMJquFvsjzHYlwmcHnzTga5IPSQDkOvjgnl
         N++ARTNyiEn9o6R4b6sZjDnvQVX5MclTlkfXEcUWjAA2E2aNoHy+dBuJND1oYpixHUV2
         Eg5a1zfgruxUyky33aVZBKfCosCCSwgLIcWHG2fbwHIexMxDGHKbTJmCFh2+bXN6S1Yc
         fEejxHo7ZC0G7ig/9EH7ni1Ti3lACv+iElw/K0a+ArLqR3JqsPuhcw6zfOk2ULp9W1uQ
         zRXH/KxK9J3D4e8DhnHR4Zzb7TMimTUV+uTMa7M/CG+yNTylSNuB4auNJzhgrOiAZT+e
         4sNw==
X-Gm-Message-State: AOAM531TUnpph3lpZjCCHYOVt3nBPoFy9wvLN0wEz+QwHHm/7TRJPtHN
	+PD2CPekaREw5UTBZGQgJ4cWUvf8
X-Google-Smtp-Source: ABdhPJxYnkDX9sUJLgKdH5skKGKxiKxPbEZ2olwnqcu/oKcBn+VDtnYkBrLcPHfBGxTi9bTMul9UzA==
X-Received: by 2002:aa7:9e9a:: with SMTP id p26mr17897349pfq.20.1590941791636;
        Sun, 31 May 2020 09:16:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/35] xfconf: 4.14.2 -> 4.14.3
Date: Sun, 31 May 2020 09:15:51 -0700
Message-Id: <69ecf16cda21ecc32be774a3e126ac45b7e5a18e.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Kai Kang <kai.kang@windriver.com>

xfconf 4.14.3 NEWS

==================
- Always provide files for vala bindings

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 47f9b3b4da3a646f939a8f75ee2dd7268905da09)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xfconf/{xfconf_4.14.2.bb => xfconf_4.14.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.2.bb => xfconf_4.14.3.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.3.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.14.3.bb
index 893a32f420..792f8b1600 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.3.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "769b74d354aa65e0013edc6823b78e48"
-SRC_URI[sha256sum] = "1e7086cc5a63219e375c95a1dfd10ad7098c2586f55ac209e66aef61b969f255"
+SRC_URI[md5sum] = "25c32ed08a43e81f7900c03601dffc02"
+SRC_URI[sha256sum] = "589052a0efc6151c5fb5f438da463502a4fd91848cae7b9376d417be4c5a0c02"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.17.1

