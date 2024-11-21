Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F4CD75BD7
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 08:40:21 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.6571.1732178416222730076
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 00:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iKNMeed6;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ea1c455d0eso556385a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 00:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732178415; x=1732783215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GtIvqXU04EdKIX8OHhXlj3WK8stcYZQIImbCPH2GWP0=;
        b=iKNMeed6viC42DivmVyzvtH6QLw2YbHSB4nYOlDTJT9Pw2hR2yg/Ki7vRxJ9mSUU1U
         6174Iwwxh6afBVlkiZGLZUrtVzcyjGUabGuWEgu/FSr1Xb7mTwt9unvy0qkvQFcErtcm
         Oln7ByHxo46VpTiiUCDdxFb0DtFB3H8KEtKRp35PKNooQbn4ufqzVRrbaSHrCOLBIhCy
         kN5Y9f3hNWWQyzm1EI6qCthmbVDF8NwwERTficgjPF8N279ozpFzUAuTFb+OEXMDnXTg
         XqyzMZq95YJlhUSFzoWu7RfbQIhz6jd9eSY84lCuvoet/1wH5QsXr0Dz2ZK16+T0hy5w
         K3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732178415; x=1732783215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtIvqXU04EdKIX8OHhXlj3WK8stcYZQIImbCPH2GWP0=;
        b=T0rsyQqIa+4A9vXz8EbanmkOwjI4pIpccYE2fib+FJRPz8seI3jJS7s+ZoILsfhrvJ
         ttY8bhmko3r+OEGsq6E607l6qMKMIWoCuO0vYPY0Syre3luAlxnIEP4EYdG4UosuRSY7
         BLnEvvoYQcG6+5cdBhXbRZudBKRfPmOfysAlJQ14/RoU1/qB2zBgv+zQnbdaSQEMyjCn
         TDagGup7SPHHJ+CT+Z/4cKU9X4JJrwjhOjhYuvZPBkyhxjzy4fKNCCVoTsaxPEsieue+
         4Ph4I+IzkWgs6ZN0CUbRLL7yBKyhUS34m/makI07lQO76Jd6MYj+zkTD53sNBe/G4PDC
         FdWA==
X-Gm-Message-State: AOJu0YyeraBovaK3t88ynMTEUHtB+R0V9UzEIFak/lXAomz2L9ZF8aON
	da3KRlxiy1pV2xkc6XW6baMpTsOMX6SdKa9GdsL0nHu5IHUOy+MouVH7mQ==
X-Google-Smtp-Source: AGHT+IGunkCEdj5TOZVmdoJmxrG4nWripWHBStTluWPCvzjRSxbd8hRKTai6FHSUgEA4/vLvZHUzzA==
X-Received: by 2002:a17:90b:4c04:b0:2ea:6d7a:d6bc with SMTP id 98e67ed59e1d1-2eaca738f91mr6896033a91.19.1732178415283;
        Thu, 21 Nov 2024 00:40:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2128788f8c5sm8443445ad.18.2024.11.21.00.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:40:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native
Date: Thu, 21 Nov 2024 00:40:12 -0800
Message-ID: <20241121084012.65729-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 08:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113961

Fixes build issues in these recipe in meta-gnome

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/ghex/ghex_46.1.bb                 | 1 +
 meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb   | 2 +-
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/ghex/ghex_46.1.bb b/meta-gnome/recipes-gnome/ghex/ghex_46.1.bb
index 1a8c49efbe..412b304681 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_46.1.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_46.1.bb
@@ -7,6 +7,7 @@ DEPENDS = " \
     desktop-file-utils-native  \
     glib-2.0-native \
     gtk4 \
+    itstool-native \
     libadwaita \
 "
 
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
index e3365f6181..47c412d75e 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
@@ -13,8 +13,8 @@ DEPENDS = " \
     cairo \
     desktop-file-utils-native \
     glib-2.0 \
-    glib-2.0 \
     gtk4 \
+    itstool-native \
     libadwaita \
     librsvg \
     pango \
diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
index 883f192db3..81c3c65a48 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
@@ -16,6 +16,7 @@ DEPENDS = " \
     gexiv2 \
     gnome-online-accounts \
     gsettings-desktop-schemas \
+    itstool-native \
     libdazzle \
     tinysparql \
     libhandy \

