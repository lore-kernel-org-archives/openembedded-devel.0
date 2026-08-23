Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E022C5DF98
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:28 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13149.1787485946422067989
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KA9E/TXO;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3811f512167so3405591a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485946; x=1788090746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgFHa1PSPBUJwDoa5uGyz53DvY4Rkz+CglrkOkzes+8=;
        b=KA9E/TXOOK1uoTwX/UpGNKURzsV3hR0v2+5TOs8bBpgqR+WhK2LNBdJAEi64bChBHE
         CXUnQbKwB8oZDJYg1NlEkOky6FsWHVb8mw/uMFFMws4pjJKrJnxhEipI5RqBxZEH7Mub
         1ZZOmlvywuqueoSS/tPtb1QXZWHK+A+CecgDmtCLARx8pbW7QATOPdXS5U0L/tKmyaum
         OvnBBaPNvIFFrZka6VYVEEDKpm+KCbNySaV2aZHQZYFqDSU/oOQZ5hqpjmtdPfmtbGEh
         IORcKwrYk2URNmi/dKgIbKKTyBX2eo98gW9R93xznoctoBbDbmzfb1Wh28FGEPwoRR/y
         sOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485946; x=1788090746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UgFHa1PSPBUJwDoa5uGyz53DvY4Rkz+CglrkOkzes+8=;
        b=qEjzsl/gT4wWk1x6jL1X2iJm0+uUt+bxhGeYU/X72FANyMrbfeaOPdv33GuZYreRtM
         J7BcsgvxGTDoXl8CkWi27M1ch+WY1G29EPS2rYvI+bIZuuj0X4OKZZIgs6lGwGkLkfAe
         lucBMY6viYaIsiNzyi0IDYWXpZkhTzuZP1R6YqtZBU/EjwJfZHoAPj3lARHA76TD+KfX
         t9W+FVqKSqMrNwmwAN/Zjl5Fab9qfyOkZUHViXBVclQzXBesd9QNKu6Q95L9g2iiTUN4
         kqXjjd0V4ZISJCocPPRECpVNXk9qnvNvkre0ssuGVxVONx2TDdPtjRnGFQwugT4eAOug
         tevQ==
X-Gm-Message-State: AFuF++mbNYZA0ioGGV0GhuTLLmj01NyJ04MPv6fKQyoj1GMHuyZXHb0U
	bq44Cu+wlK+bTpHy4EedBZjOS8TY4N3DGZOixDK/MaYyIutWEjdV9R6qFguLSQ==
X-Gm-Gg: AR+sD12Bv29mFHNs+Gu1VlYe0hsN8mxaG+OX4w8uXFYxpO6/iH+2z0cFgRzVobTq85u
	c6+vQ0aazD35tkwXaUg752fC3OQJ4aamPyzzV1B6Gu2iT1sG2nNctkyDdC4s1yd13dPaJ21rJ2a
	E6NcriFFmORLv1q7Jj8VkDDYoDD1KONQQFu+cvKlNSqL7XT0j6DoQVJ6Kb/3p10urtVjJxP+BX0
	QmnNc+qU2g81C6aNQoA1kXWOiu80gG1lqqYV9nrs3eh/KUb2zd9ANt9Gyheoa1mvbif+zlt6Kv+
	JUnsVV7vCh3MnChlo9iKi2A9x/mOedO2Q/ynWTH4ADarhFcmx+4NhV1Gut1GcdAFWPPtb3ffcDW
	GpdEcDbc88IIsRX0YaER+U2T3SOYblI9rNN98WPYe9SO23ZWPYsdX5TiZ3TrhVejcGUO7/QZ/CN
	udK9IUv/36peH+UA7WKJPrQS5MS8ipp9KEcRsAVLFNfcRXpEoGPb8b7JrgKXrSdFZQtyPaw7v3Z
	w==
X-Received: by 2002:a17:90b:530c:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-395c35e25e2mr31456844a91.11.1787485945720;
        Sun, 23 Aug 2026 04:52:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-gnome][wrynose][PATCH 8/20] gnome-software: upgrade 50.0 -> 50.3
Date: Sun, 23 Aug 2026 23:51:46 +1200
Message-ID: <20260823115158.1582363-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129442

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version gnome-software
...
INFO: Current version: 50.0
INFO: Latest version:

Release Notes:
https://gitlab.gnome.org/GNOME/gnome-software/-/blob/50.3/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a5b12a47ca5a6a7fa5e0ebcb7a8ddb5941122182)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gnome-software_50.0.bb => gnome-software_50.3.bb}       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_50.0.bb => gnome-software_50.3.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.0.bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.3.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_50.0.bb
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_50.3.bb
index 0cbf238181..4b43be9052 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.3.bb
@@ -28,7 +28,10 @@ RDEPENDS:${PN} = "iso-codes"
 
 EXTRA_OEMESON += "-Dtests=false"
 
-SRC_URI[archive.sha256sum] = "3515e2015f235b6abb7a342806008acb1f184c29d9c4ced3581f8ed4c1f1c241"
+SRC_URI[archive.sha256sum] = "b1318e68f02bb3902fcd8f904d56f03f534ea5098f65e4c6bb9c2c924da7f823"
+
+UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/gnome-software/-/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 PACKAGECONFIG ?= "flatpak"
 PACKAGECONFIG[flatpak] = "-Dflatpak=true,-Dflatpak=false,flatpak ostree"

