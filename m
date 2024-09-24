Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3977CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 03:43:50 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.5727.1727149422841542305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 20:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Shn7E2Ll;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d8a54f1250so3304000a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 20:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727149422; x=1727754222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HV+DGs5tLoOSkXTcWSTsbsff8i3tWbzGnWktSy6cFpg=;
        b=Shn7E2Lln0JAycYPjlD2QXd/BQajPKswn/7U0wBWmcnl7LDIbpF49C9mbp6hxpLU/1
         5wCCmFOhvqX8nFtSY74KDIxjtN/TRPOYQ1sE7UNj22U9GQq9/im+tOFpponlSJSOT83S
         rbg7mRqo+lp2CwGwcRAH4d5tUF8V55aoz6JSj5V6grcVzYLfr57DSwKTctSSf7BuKGzW
         RqXDh1nzLII/MLVB6SMOD+kPKGITAeT4Hg2AmIb8aw4TS2D2hlBoCPESqtPscNRNaEJC
         8toY8YWJ6fz53W4mygSzrz3ohQFYQZvQcRlcvW00W4LjO1+VktYKVEOf9wrhl6KuSIfH
         x+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727149422; x=1727754222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HV+DGs5tLoOSkXTcWSTsbsff8i3tWbzGnWktSy6cFpg=;
        b=dXs74bsz37is0nS/pHa55uDYxppTxWteECiZdzYwsfRAshLfvsGRwuNIJ6SxhcBmZ8
         mKRCRcgbEDr39KKXwQnokslwP1Huq6pRV25M9HLjBXDnjkc9nb5e9XEmeK1gvsCRKa8P
         GYY6mLVq3NaJ5Tj9s4+OhLNLjRLsn9Un0pDL4tFvGhYe9GmKWqYsWcME5foryIhejwjb
         2Z7RYhdvjSXXh+fPjpbmGLi2GynIBhnDOg6cmG4V6Jig82EJ+aCuwehH9v5kXUv2mqir
         795WLy5hwR4hbwHjuXlA3JOeqdYx0J6sH55fHSrKrMAgv9iH33LOFHfWa7XK2LETzC+d
         IDEA==
X-Gm-Message-State: AOJu0YxFZD0d0WzxXOtziLWNotWQLNHmfxvVo6Vx4zq9c6NZm12Pvm/l
	5AMV44GL8SiL0QuCC5/9Q5/Vtt1vsorxj1PF5w4xrQBM949JwjYUniYfbzNG
X-Google-Smtp-Source: AGHT+IGMLE9kKpqgH6YhWBaBDOts/DSW1TnTSE6EB5wTwgGF8aYUEPqd7dpZZ8/Kf3dlYR+7exlnig==
X-Received: by 2002:a17:90b:953:b0:2d3:da82:28e0 with SMTP id 98e67ed59e1d1-2dd80c13cdcmr14434865a91.9.1727149422006;
        Mon, 23 Sep 2024 20:43:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e660])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0590070b1sm392522a91.42.2024.09.23.20.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 20:43:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-console: Fix build with musl
Date: Mon, 23 Sep 2024 20:43:39 -0700
Message-ID: <20240924034339.2533347-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 03:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112467

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 .../0001-include-locale.h-for-setlocale.patch | 34 +++++++++++++++++++
 .../gnome-console/gnome-console_47.0.bb       |  2 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-console/gnome-console/0001-include-locale.h-for-setlocale.patch

diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console/0001-include-locale.h-for-setlocale.patch b/meta-gnome/recipes-gnome/gnome-console/gnome-console/0001-include-locale.h-for-setlocale.patch
new file mode 100644
index 0000000000..28f26476ce
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console/0001-include-locale.h-for-setlocale.patch
@@ -0,0 +1,34 @@
+From e72f6da3d509561b75e223667a0380772e7bd48a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Sep 2024 20:38:09 -0700
+Subject: [PATCH] include locale.h for setlocale()
+
+This issue is surfaced on systems+clang
+
+Fixes
+../gnome-console-47.0/src/main.c:29:3: error: call to undeclared function 'setlocale'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+   29 |   setlocale (LC_ALL, "");
+      |   ^
+../gnome-console-47.0/src/main.c:29:14: error: use of undeclared identifier 'LC_ALL'
+   29 |   setlocale (LC_ALL, "");
+      |              ^
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/console/-/merge_requests/171]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/main.c b/src/main.c
+index af9c5a5..5d16160 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -17,7 +17,7 @@
+  */
+ 
+ #include <glib/gi18n.h>
+-
++#include <locale.h>
+ #include <kgx.h>
+ 
+ int
diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
index 922b0576e1..8785ca013c 100644
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
     pcre2 \
     vte \
 "
-
+SRC_URI += "file://0001-include-locale.h-for-setlocale.patch"
 SRC_URI[archive.sha256sum] = "487ec0de0a24f12ef6f778e4aee98d744a9dcc921c9e7df98b2d9f410b00ef52"
 
 PACKAGECONFIG ?= ""

