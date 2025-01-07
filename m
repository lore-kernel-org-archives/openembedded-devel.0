Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A28DE77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 12:22:48 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.19010.1736252561955610951
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 04:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XhrZbDxZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e461015fbd4so15532228276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736252561; x=1736857361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IllsSuSSiQ5RiJjXTAv2sbF/hEUe69ZpzRg1+O0SUYQ=;
        b=XhrZbDxZzpDxvI104bqky3NPZVvIrxpYubxHxSpoq6evrJLmYNkKRhtr9+ptMxIcWz
         /Ze3VGQCgh2/xc+B7tMpTYQPohdM+L7dObiZkIogo4lbTBK44jfEyA22v0Z+JlOrwzkc
         T0P1oB+0FD+M2r8bpnMXnFhm3k+2+ofRYRZ2yXLhMJm9iooGMCYUniRk+Oo+CPhLv/Uy
         udOO8P1zuSsNFYslaO/45hsTbRf52OAghsg95LcQ26+Vr6G75MBBarWESum2YoXp/WH2
         eTsReH5DOYLIjP/6OqrN6sCH7x/u5FtcrfV1tOg36Zn23IRzqc7wpu1nX3RrmKszv3de
         k1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252561; x=1736857361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IllsSuSSiQ5RiJjXTAv2sbF/hEUe69ZpzRg1+O0SUYQ=;
        b=ik9Z3D+lPuooKc9SQYZMUhOUYrawxJvOnDeqgy5UvKY9TVnf92YV/496lcIal0llPp
         xZKdsjmRPVC5BZIfWSERThkyob5S2kvXNHO+S65996soi8tvcO0ihS7SPbwfZdptN/Fh
         SxVF3tWFHS9Fq0cIyrtsLpSnR5WVBlWia0Z3hiacFrHHArTE2v3SCs6qW+zV8UuNLyoA
         scVbvXhy0133S/nvEo73g2AnPI8mPLaI2wKIlCANfvhtcAZkEapLFQapNfed3q59GkQz
         WFe3NlqYcO0X+SH6xnpNSpoMJ4a8eoUHhcQwqzHSX8kq30Wj1t7vUvP1gK7vIvhgwx3N
         09gw==
X-Gm-Message-State: AOJu0YyiA3fx5cqT6bm9+Zm6rPhAvJQiPYvVp/bVDLgYcxdlH7uk3rT+
	loUc/obHeu628nu5ayrmNlAxOSnRTp2chFXAb4cQZNl7mau+Aojl7REDwejI
X-Gm-Gg: ASbGncsnb2gNb1o3mFi5gTefkKRilMKVxp79bKOgd375OEV/iXmdLjq7dXeV/KgGGQV
	LdIXXUkzgcb2Uuh/LpQGnEbvM4Or/Bx2zkzRKW22PE+bQxFZH9SgJ8OncSUEF2xIA/BPLBBBp5B
	4N3pXyHe6JV88B5gqIHR6vQ/o0ONLV0DNfxEGiLp/iEclZSkM/jgv8zvCuutKFMGvRir3XP1IqJ
	A/4cev26qgyrxXFtBrFchSnrZq6WFQXrmprCYF/gyrkqX8Bfc9Cs0Twb2sxWcMsh21BigY=
X-Google-Smtp-Source: AGHT+IEctTbD+s70NqlTDxv5QpgcJiOVWaxK7dBGBQvC76bGUmS8K1fucs3kDoE/h/OkN8mXaHX/wg==
X-Received: by 2002:a05:690c:6c8a:b0:6ef:75af:6155 with SMTP id 00721157ae682-6f3f820e070mr440445557b3.32.1736252561040;
        Tue, 07 Jan 2025 04:22:41 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:c122:4970:902f:30e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e73e7c05sm88318047b3.15.2025.01.07.04.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:22:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 3/3] ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native
Date: Tue,  7 Jan 2025 07:22:38 -0500
Message-ID: <20250107122238.1517492-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107122238.1517492-1-akuster808@gmail.com>
References: <20250107122238.1517492-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 12:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114696

From: Khem Raj <raj.khem@gmail.com>

Fixes build issues in these recipe in meta-gnome

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit af6858aa3729a81780f2ec113c095f7f0c87c226)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/ghex/ghex_46.0.bb                 | 1 +
 meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb   | 2 +-
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/ghex/ghex_46.0.bb b/meta-gnome/recipes-gnome/ghex/ghex_46.0.bb
index 41d8391636..04b0f99532 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_46.0.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_46.0.bb
@@ -7,6 +7,7 @@ DEPENDS = " \
     desktop-file-utils-native  \
     glib-2.0-native \
     gtk4 \
+    itstool-native \
     libadwaita \
 "
 
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
index bb53b58df7..0b78a935f1 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
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
index 4b05e52ca0..e025b8b5a5 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
@@ -16,6 +16,7 @@ DEPENDS = " \
     gexiv2 \
     gnome-online-accounts \
     gsettings-desktop-schemas \
+    itstool-native \
     libdazzle \
     tracker \
     libhandy \
-- 
2.43.0


