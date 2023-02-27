Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D6AC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:51:24 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.8183.1677534674421314751
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rSaNAz03;
 spf=pass (domain: konsulko.com, ip: 209.85.160.169, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f169.google.com with SMTP id l18so7341693qtp.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 13:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAkZ/W5K7j2Q/d+CgD+6UcdvIMxBX6zH3l+i+qPuWo4=;
        b=rSaNAz03KC7AfF1+x7ok+9GeuyslCPGqSNB9r6JRAzWZzfreCUZ63eVsh2ZfPg99Iu
         ok6pei3BhDHa8bCy5dv1aynu+ziIa9QDr8TULhU4TLBsYaDMg5Z4clt7GmSlsZY00cIV
         TaNlx4u6SBijR6g5lSFGd2b1KdVeQEW5aDleI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAkZ/W5K7j2Q/d+CgD+6UcdvIMxBX6zH3l+i+qPuWo4=;
        b=qdkdIYKc4Lv4nvCDtj+xzbVm5QA9oAALORrL1QMe0BGpmtkX4iTqlbB0WW8A7oJca6
         w9Z5A09yt1DqAqL5vrQFKZsgq2eX2hflgtNm32AF7893VbXA+ifA1QIxEqVk7GSmfV4f
         aPC1hGBJx3tZ5/sHOOtinYfIl0KrPqIVI808yGO2Yx0I4HQkz7q4ub7LtpVFOTrjYfmj
         UqIO2llLqyU3jgkiO98ktFeJW/3ZsS5PZckun8c5HOse5GrA4b6KQ2J3I593lRzjvzwG
         v3jI0VdtXAvsaGlzactoZTwf4ENezhtuEGtS1aB17wIfwCxzVPp2YI5YrzkAn8g1OfrB
         /wmA==
X-Gm-Message-State: AO0yUKWNqO0JNSTZVoH7V9UNaJWohpkHL2KQ5AbXpc2nIyAkfN08KIwE
	Bv3veGc7rVpiubFvINuPvCHL55meXKFHSvFu
X-Google-Smtp-Source: AK7set/z5v1fxaQ7e7WRXVRvP66IuSfnc7aLrftRSz2OM66lclnKN2goVP8H5UkwSudOjAz0rJ5z4A==
X-Received: by 2002:a05:622a:50:b0:3bf:ce27:e1fc with SMTP id y16-20020a05622a005000b003bfce27e1fcmr1782214qtw.7.1677534673121;
        Mon, 27 Feb 2023 13:51:13 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-82.cpe.teksavvy.com. [192.0.174.82])
        by smtp.gmail.com with ESMTPSA id a186-20020a3798c3000000b007423c122457sm5650370qke.63.2023.02.27.13.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:51:12 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 3/5] ncmpc: Upgrade to 0.47
Date: Mon, 27 Feb 2023 16:51:01 -0500
Message-Id: <20230227215103.795230-4-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227215103.795230-1-scott.murray@konsulko.com>
References: <20230227215103.795230-1-scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101305

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


