Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29785C64ED9
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:42:24 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.7896.1677534139298435974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dhXHfqo1;
 spf=pass (domain: konsulko.com, ip: 209.85.166.177, mailfrom: scott.murray@konsulko.com)
Received: by mail-il1-f177.google.com with SMTP id i4so5000979ils.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 13:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAkZ/W5K7j2Q/d+CgD+6UcdvIMxBX6zH3l+i+qPuWo4=;
        b=dhXHfqo1ZfC6fjCwihMqyv/cAi+SUvmbUYRt6FsnhygEfBPHIk9DveGPwDjEujBmxs
         8XpvaSm1KUgZCnQ+93ok4pdTptiQNy65JnIwB2rh0z1d8pGURdXwQadBDR32FcG9R1YY
         MIzTEtXiKQXGaC6+ZSGLPgEe5OhFSolmc4BXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAkZ/W5K7j2Q/d+CgD+6UcdvIMxBX6zH3l+i+qPuWo4=;
        b=ZwPkq/MhLfD4w0ME02Hhwky5LwYGfHySujpGOm+OV485lSTJLbaBrlKzoTVRAkyzCd
         zftvbxeSkqNtr+n6ZPm/wA6Y3QBKRw0mEBWk2BuyJnGwn8OrPTE1NOEKofF67KE4Len5
         daRX8rxtst+WgXM/jInjZiuw77E+f7/kzhZnT/y48aVqR4MzxMRq7nq1G28WLG8DMt/T
         xRfRKwq9tstZj5UqrWRKTk2zXmPjipt+JqLx86tel3tClwrEmyCbagfLKbKceHTRFfdl
         oq5d/pwXtnE1TMD08wVp+BpXCYkaao593iycqOkS1AqVzMnpkzFRP9Eb3w67VggkQqQY
         Fcbw==
X-Gm-Message-State: AO0yUKUnKMmADUBm0iJCuTnzWIoRCNrm4+PxCDR44TRjj4Lt59exFm+m
	lnOS8FPl8e2LOFc2hBBt1Wr2OX8I37BVKegb
X-Google-Smtp-Source: AK7set/zvZBmSpAdvZTDTobcG+tlKwUzEUv9yX6SOtRtjJp/TLsEauOinIwG8tPi4Yaq99DUyV73Qw==
X-Received: by 2002:a05:6e02:1c41:b0:315:3421:ef2a with SMTP id d1-20020a056e021c4100b003153421ef2amr813486ilg.25.1677534138353;
        Mon, 27 Feb 2023 13:42:18 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-82.cpe.teksavvy.com. [192.0.174.82])
        by smtp.gmail.com with ESMTPSA id a17-20020a02ac11000000b003c4f35c21absm2264516jao.137.2023.02.27.13.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:42:18 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][langdale][PATCH 1/2] ncmpc: Upgrade to 0.47
Date: Mon, 27 Feb 2023 16:42:07 -0500
Message-Id: <ea65e0afa5eee5a092d1e9d6e14d2feea2f2f7b9.1677531249.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677531249.git.scott.murray@konsulko.com>
References: <cover.1677531249.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101300

From: Khem Raj <raj.khem@gmail.com>

Backport a patch to fix c++17 build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9b6baed24d5efe0820266ccf3567bcff42701a01)
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 ...egular-integer-to-fix-Wenum-constexp.patch | 37 +++++++++++++++++++
 .../musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb}  |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch b/meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
new file mode 100644
index 000000000..92094af1f
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
index a77d4f978..44046912e 100644
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


