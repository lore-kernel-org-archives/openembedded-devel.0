Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.3676.1617934875758553549
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SF32i7f0;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id i81so4288731oif.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hIKONag1zuvTIj2Ye8UPNQ1+9PUiGLkYNvuczOTLgtc=;
        b=SF32i7f0EfAcM1ZkjkA2PzKfc/QWxX/+9OhkVIPf0GoKeakkUIqvpHa2jF9678Byd3
         aNuhCFxARk38TWmxp86/xGyjUll5xA3aPpF+ewMCYSzGYMdJ6+ByZFKrirqVqinZS9K4
         xON2t2sRRpsPANeWuWAwQvXstXrh/qmNuPcVMwhj2qSYy497s4IY0ItPsomcKMrl3pgx
         6kt/lfxIyMHr+2+fNJkUZ5d9vk9MG51Yda96P977uXUdIXErtbTz09g2i0tj1wA5MzdS
         0r6t8AR4wxw9IyYWGnTOPY6OGHGF9DmN9zNUJGtq/wBLd/aaCuY/UDhP94FgyiYOI2I4
         CL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hIKONag1zuvTIj2Ye8UPNQ1+9PUiGLkYNvuczOTLgtc=;
        b=tP2g/T41K+tRaJNuNHI3qN0oNwtHysq5CJkPZkvEh9VdJJaonaQILgA5D7++K7iHyf
         hge3nCCKDhuqJsxFUASzLYLX+eWRJalafchw0hRsstvixZm1Rh8Fl1nVZFyhfXpTeVcA
         aOnzhNytbivCz12eOZjvBdAry19cYtrW+wi0bnj6WpCHJH0kaTGPIkelL1/ebJWpIKqV
         8Fmaf6EPvcGH/7+DKT40D8SlLRl6dpfRFRW1Xq6tkjcQ44GtIYEm2SGATGRr0weA+4rp
         4OBKrVCGCNOLfDiXOC8xCMINg6W8RLpIapTPERVdJeOaZ16vIJu11zsLvuJrgKejM/kl
         +IDQ==
X-Gm-Message-State: AOAM533qdln2OW5TIVIpxQd8KxuUEJX9wChlCrVNE9YTDLqDPeVHtH8h
	kkUE8ALY1PGHtrXvEWDEIt25MO7IGo4=
X-Google-Smtp-Source: ABdhPJwOaEuFFOllRqfb6lrRPk3/9a2u+XNILWuHuPfjsWv3BYuDCrhoneEafQUOFLrl84qMcIItbA==
X-Received: by 2002:a05:6808:2d0:: with SMTP id a16mr8116307oid.83.1617934874864;
        Thu, 08 Apr 2021 19:21:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:14 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 25/36] thunar: upgrade 4.16.4 -> 4.16.6
Date: Thu,  8 Apr 2021 19:20:38 -0700
Message-Id: <133e083d2939a9b02e6bb2433d9a7409ae423bbd.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

4.16.6
======
- Reload current directory before selecting new files (Issue #524)
- tree-view: Hide menu-item "properties" for unmounted devices
- Removed 'the root folder has no parent' dialog box
- Revamp documentation to modernize/uniformize accross components
- Remove watches on shortcuts (Issue #513) (Issue #47)
- Translation Updates:
  Finnish, Occitan

4.16.5
======
- Revert "Bookmarks no longer need an existing file (Issue #47)"

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 905b27cc610c78c28424ab1a1d122852b0787367)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_4.16.4.bb => thunar_4.16.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.4.bb => thunar_4.16.6.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.4.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.4.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
index e5fd5ffd3ad..128043d19b7 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.4.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
@@ -8,7 +8,7 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "d51a2018c1ba7dcc420e7a84d85cc17a58f26fb1c80ee4c15e689a49f10425f9"
+SRC_URI[sha256sum] = "cb531d3fe67196a43ca04979ef271ece7858bbc80c15b0ee4323c1252a1a02b7"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.17.1

