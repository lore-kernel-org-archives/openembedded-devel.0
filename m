Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.3674.1617934873014323808
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HvPXRebO;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id c16so4303822oib.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/VziokVC/fUISfYacMkqQqPp6zuXiiSUMqtwLmZDTek=;
        b=HvPXRebOyM5eNEiTbGqwIa6sXRO4MAFgvWU60ScwRC8rTCWjBg8QcZGWmNAHEiaNny
         glD6AucUw4Ufy0/FCnnilGGx/y7pxNEztMr6DpX0fNX6TrgQeieMnHxYRcLDkZuvDJtO
         g1rH1mAL9aiJbjIxRWJLwO4SGT6kYTv1y4LMiN978zxmnNkik4U1rLu1XcwX75htgaMR
         jX0SGB1jk+Gu0x+WIiBfzgre4A6fnfskGenP6P9LPTvpHfsM7XEgbO2bRh+olO8KmZh4
         6jX8HkKUwXyxwa21G9A3dArMunfkcunNfmd7XcK6hnw2YPKyOCZBsf7tVdhp3zl5P0hw
         57dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/VziokVC/fUISfYacMkqQqPp6zuXiiSUMqtwLmZDTek=;
        b=Fp3mNyzS8RkoIiDw+P9gv+rp/TwP7zeta8wuc/0C62dHBHc6MVTBSqumtOGJ7vlA5b
         8k9DnJhPCavZL5uI/RNae9QUb+i/mvHg+V2aqUDYChm2134h+AKeNkdzcjM1PDp9/YGH
         4Prd/2rI8f8HzLs95XfkGUgpbI7s0z2yj95JDc2lBp4XlueBL59U+lmUyNV4cFn1t8l+
         GmdKrRX76OyMVA9dCGXV9dukiAdQvG0BolfkcL3cxy8wk/yD9F+vra8l9Mo3Q5SnArnb
         6guXdTV4l5lyupb9KMuCZiCG6wsJfRe1pFcVFT0CjmPpW5QmdFqHjD3jfoC2K1Sy/xmG
         ShLg==
X-Gm-Message-State: AOAM531ZfoCRclFuqCSvfGCJoqakIifyTPWCb4Em1VigvSxrUHJQeqVw
	mCrOaih5VW5bdE6dZxKpRoOL3ZBA578=
X-Google-Smtp-Source: ABdhPJx6HLtTmfjFFbeabWiXBFdRRwPzBJ0jU3cSvVsp23jL3fvxI/qj9Z44MMCf5d53aaFe+thRVQ==
X-Received: by 2002:aca:3888:: with SMTP id f130mr8502217oia.54.1617934872242;
        Thu, 08 Apr 2021 19:21:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:11 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 22/36] mousepad: upgrade 0.5.3 -> 0.5.4
Date: Thu,  8 Apr 2021 19:20:35 -0700
Message-Id: <189f20b8b45045792d64c06e9692b910d9af55c1.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Release notes for 0.5.4
=======================
- New Features:
  - Add --line/-l and --column/-c number (#107, !83)
  - Port to GtkSourceView 4 (#55, #80, !10)

- Bug Fixes:
  - Delay request to scroll to cursor for the correct active view
  - Monitor hardlinks with glib 2.56.2 (#110, !82)
  - Transfer encoding from remote to primary instance (#109)
  - Prevent a crash when no language is found
  - Make window require attention when opening new tabs (#106, #93, !81)
  - Fix BOM array (!80)
  - Correctly initialize toolbar style combo box (#103)
  - Allow checking parent sources when looking up schema (#101)
  - Fix missing parameter to "select-all" signal (!79)

- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 60480f82af8c5d40932c469b0674641b73f7ced1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mousepad/{mousepad_0.5.3.bb => mousepad_0.5.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.5.3.bb => mousepad_0.5.4.bb} (67%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.3.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.4.bb
similarity index 67%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.5.3.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.5.4.bb
index 1fba679148d..7a2f12b1e29 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.3.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.4.bb
@@ -3,11 +3,11 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+3 gtksourceview3 xfconf xfce4-dev-tools-native"
+DEPENDS = "gtk+3 gtksourceview4 xfconf xfce4-dev-tools-native"
 
 inherit xfce-app gsettings mime-xdg
 
-SRC_URI[sha256sum] = "e7208bb9e96a1525d3358a64f9cdd165005078e84e81984a953a2a03491fcaa8"
+SRC_URI[sha256sum] = "d90f492e5d0cba5f5b3b0c1eb7fd7c1701aef57e3fa244d2c457e7f9b0a42aa1"
 
 FILES_${PN} += " \
     ${datadir}/glib-2.0/schemas \
-- 
2.17.1

