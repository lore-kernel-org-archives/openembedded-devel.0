Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D62C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 07:39:24 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.7845.1645256363187472972
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 23:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=odTXiuHE;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id ik27so126459plb.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 23:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P7md2779r4ET0615HGsxMaiW2iRwnRq9SzzmlFuuH7s=;
        b=odTXiuHE1AhSHexDud0YZBglcZEQkkza24wQkMKvPg2BVZ//Zau44zAiNqssOEBH0y
         IalXm8VaIEBcLR48eUEJUTNOKgJDcPYeVseL/Z7Ozj7OMPWk6qU/tVe1Vx5KxkL+HgmG
         13hhmhL/P+XFb4XfYYpAf7aZUZTaXuByMt//d3zPTVzZBHTU5UonIuwyE5sVa8RxNc8R
         d8mwAt3Lfgeh+W1LoShYLohR44Af0NiyK4IccaknnDVpsJOH3Dn53DiDm4TVCIdogMPr
         xeEQkFDCkuV0yGV32GMK7QhdzOAgVtXno6XHHYjTO/ic1efpP960MoyxbVgX9EfQHu0u
         kkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P7md2779r4ET0615HGsxMaiW2iRwnRq9SzzmlFuuH7s=;
        b=1a7qVfxHtAYiv60T+sE3JS5tndeJdV0zXVjOEhqHvUZgMatvQwj5xsZ8CvHsIfrkQX
         5fbu/10p9UW5FAuMXeKC2nX+igW2/csv6OytrrLrpJWStLsILGi70CwNrij5D60um1vy
         2f2+PxdR0Wr+VI1uPMc0uO/EFPlEToZkwd4ciBDRBfjY3iBlq+MRt1DrjJDufoFKygdE
         8xBDYL6smDKjaMj3pI1xge8H07vWMiQLd4GESEp0B53aGmloNX3xUYLAv0hZSelW/tjr
         63nsAeIL0Q5vUgHo/jH2EYtOZZNzYPNBgTixTPt6fBZEj5D+6EE6QAGhkbZZ5BlP9jS2
         Wdkg==
X-Gm-Message-State: AOAM530+ddskSCCWFWQJBocZjOAqqKcI2PCYIEjAs3J5+TH+SCd5Hp/Y
	SI1w3JN6S7vrDBr2+D1VzF/veUdKtkW7RQ==
X-Google-Smtp-Source: 
 ABdhPJwSLzlraCDmaI568RwudMa7ccXtWCzXtbw3pYgqmBYBuk8y0ne9BPsP78Eti0X5RKqjZxJkEA==
X-Received: by 2002:a17:90a:d58a:b0:1b9:fe1e:403c with SMTP id
 v10-20020a17090ad58a00b001b9fe1e403cmr11903839pju.124.1645256362227;
        Fri, 18 Feb 2022 23:39:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 g1sm4997460pfu.32.2022.02.18.23.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 23:39:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] geany-plugins: Fix build with libgit2 1.4+
Date: Fri, 18 Feb 2022 23:39:19 -0800
Message-Id: <20220219073919.448208-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Feb 2022 07:39:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95389

Fixes
git-changebar/src/gcb-plugin.c:219:12: error: no member named
 'asize' in 'git_buf'; did you mean 'size'?
|   if (buf->asize == 0) {
|            ^~~~~
|            size

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bar-Adjust-structs-for-libgit2-1.4.x.patch | 36 +++++++++++++++++++
 .../geany/geany-plugins_1.38.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch
new file mode 100644
index 0000000000..fe2d9f54ba
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins/0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch
@@ -0,0 +1,36 @@
+From 90c46235ad69a411d83a5e978492421e8e378934 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 18 Feb 2022 23:35:58 -0800
+Subject: [PATCH] git-changebar: Adjust structs for libgit2 1.4.x
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ git-changebar/src/gcb-plugin.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git-changebar/src/gcb-plugin.c b/git-changebar/src/gcb-plugin.c
+index f8ce20c..4488b22 100644
+--- a/git-changebar/src/gcb-plugin.c
++++ b/git-changebar/src/gcb-plugin.c
+@@ -216,7 +216,7 @@ static int
+ gcb_git_buf_grow (git_buf  *buf,
+                   size_t    target_size)
+ {
+-  if (buf->asize == 0) {
++  if (buf->reserved == 0) {
+     if (target_size == 0) {
+       target_size = buf->size;
+     }
+@@ -234,7 +234,7 @@ buf_zero (git_buf *buf)
+   if (buf) {
+     buf->ptr = NULL;
+     buf->size = 0;
+-    buf->asize = 0;
++    buf->reserved = 0;
+   }
+ }
+ 
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
index 16dd71c16f..bb419c976a 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
@@ -31,6 +31,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = " \
     https://plugins.geany.org/${BPN}/${BP}.tar.bz2 \
     file://0001-Use-pkg-config-to-find-gpgme.patch \
+    file://0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch \
 "
 SRC_URI[sha256sum] = "1c578a7ebb390aa8882f195acd3d8da3ceb73925d291b28dec90cd3e5fd20586"
 
-- 
2.35.1


