Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D35EC678D7
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 05:22:52 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.190223.1673932963946689084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 21:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=glklSK+X;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id cx21-20020a17090afd9500b00228f2ecc6dbso8170595pjb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 21:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgMztwzxVtMbayTbG+i2AMUCukv+tiaH9PmUYVHp3jI=;
        b=glklSK+Xu54Fcb7IPrfopiLDfsGkAZ0kKpdBT0nSPa278I1Q/+QxMq9lEWM6aozmwo
         JxHXY1VnKRE97THDNLX6ojefwx88rXGP3o+x43EBdLDfx9BnDqIuTRkwq3TLC90NZ4QU
         /QLKyvYGFw3Umq5i+S8n6f9WtJZsCDvrEcvm+X6CWsHE+EgMNn4/P4xjyrXZllg1IEe0
         S69hP0dmBaigMNsOR9JdAGUghR1HqUVSBX/DwdgnvmWTdg1Rzs8GkcpoS5GOPHQ12zgA
         nbRx7pFEUFcIepIbqWspFEw5NaX7Gnp1PmUhpMNtieiPuaPppBJNUPpVYHL0Zv7v9tYM
         wsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgMztwzxVtMbayTbG+i2AMUCukv+tiaH9PmUYVHp3jI=;
        b=CfEjjKKoasy0/vaLGxFqq4d3BRo0lEwNRJnaQfYXXkmPKB22BKwGZqChigM4dunGjZ
         ztqNgiJ0kEJszoBlQF0ts7GUn8YVTKG/wt5NnqXuUKACKaJ+nsjn22rxVroYJ+PR7odc
         nw5KnnA4jLjb2JjsGxvF5xaX5odgXinpnguxOQe1xItWDbquW/o7NqG1hTWpkTMMSQpF
         6yEzYBiSP+qvd9IoaRhBS8+EfD/9Fa7XfswVPHXtvZbmsJuQhogLWSFj6EJ1tKSLdOrP
         nvbVd8HaqfPyPBhogtihG7PYwIstAWjGe03Aw8JXz6PU1s4A6dfb8AILf9rx9idM9ui2
         7fAw==
X-Gm-Message-State: AFqh2kr8wudBDa9RLWMYQP5xg7KEjih/gtnQUKiDpsossGHqbh8AqhbG
	rHoNV/MkpnBp+PF95IGwQIaUhcp/hqIVxg==
X-Google-Smtp-Source: AMrXdXsNAgiJpnPWgfl6HEQ7L5HhbQEAJBl4MEf8Qmfhbr5jXtGHLGvjlwHRruw9WzzK6zT8Z6GRMQ==
X-Received: by 2002:a17:902:778b:b0:194:6409:b54a with SMTP id o11-20020a170902778b00b001946409b54amr2410052pll.49.1673932963045;
        Mon, 16 Jan 2023 21:22:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id c22-20020a6566d6000000b0045dc85c4a5fsm12682692pgw.44.2023.01.16.21.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 21:22:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 5/7] ncmpc: Upgrade to 0.47
Date: Mon, 16 Jan 2023 21:22:35 -0800
Message-Id: <20230117052237.3117521-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117052237.3117521-1-raj.khem@gmail.com>
References: <20230117052237.3117521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 05:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100591

Backport a patch to fix c++17 build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...egular-integer-to-fix-Wenum-constexp.patch | 37 +++++++++++++++++++
 .../musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb}  |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch b/meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
new file mode 100644
index 0000000000..92094af1f2
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
@@ -0,0 +1,37 @@
+From 2e8dc2c28c0938dbbb85ebbac2b9a60be9ccd9f3 Mon Sep 17 00:00:00 2001
+From: Max Kellermann <max@musicpd.org>
+Date: Wed, 23 Nov 2022 12:25:50 +0100
+Subject: [PATCH] SearchPage: use regular integer to fix -Wenum-constexpr-conversion
+
+Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/ncmpc/commit/ddd1757907f0376b5843f707bf182b7827ff6591]
+---
+ src/SearchPage.cxx | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/SearchPage.cxx b/src/SearchPage.cxx
+index 2fa5edbc..3f91c4fe 100644
+--- a/src/SearchPage.cxx
++++ b/src/SearchPage.cxx
+@@ -81,7 +81,7 @@ search_get_tag_id(const char *name)
+ }
+ 
+ struct SearchMode {
+-	enum mpd_tag_type table;
++	int table;
+ 	const char *label;
+ };
+ 
+@@ -89,8 +89,8 @@ static constexpr SearchMode mode[] = {
+ 	{ MPD_TAG_TITLE, N_("Title") },
+ 	{ MPD_TAG_ARTIST, N_("Artist") },
+ 	{ MPD_TAG_ALBUM, N_("Album") },
+-	{ (enum mpd_tag_type)SEARCH_URI, N_("Filename") },
+-	{ (enum mpd_tag_type)SEARCH_ARTIST_TITLE, N_("Artist + Title") },
++	{ SEARCH_URI, N_("Filename") },
++	{ SEARCH_ARTIST_TITLE, N_("Artist + Title") },
+ 	{ MPD_TAG_COUNT, nullptr }
+ };
+ 
+-- 
+2.39.0
+
diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.46.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.47.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.46.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.47.bb
index a77d4f9783..44046912ed 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.46.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.47.bb
@@ -34,6 +34,7 @@ PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https \
+    file://0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch \
 "
-SRCREV = "b9b5e11e10d8f66cd672ffb51728aa447f78ecd4"
+SRCREV = "fc8de01c71acdf10ad07c7aae756dc522b848124"
 S = "${WORKDIR}/git"
-- 
2.39.0


