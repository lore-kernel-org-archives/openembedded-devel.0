Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EEEEE0AE0
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:29:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3971.1770467350642520708
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksxj710D;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee07570deso13451145e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467349; x=1771072149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGG/5hFe9l1UuZ7F/Y/Ey7rK+aOOoZHlKqOBh2TGADk=;
        b=ksxj710DRKzTryQcwXwSMHfrkbRM+d8/2Tjk/ad2nohUanBdVUbt9XkKgSpTlO2mbO
         1dfOIX0KZ4OTuI2nlLDxXnXoBovtWg2G4C0FELwIXhP6I8JFlfu92HwdZQnL5SCaNODh
         OBQn3nhXKqc9Ohu2a6qVqHVSylOFI/xP5GroTM4qMKV08qUvJygM9klIDmolbeCVUxtw
         j4P0SwnWHwKeVavtYeMBBe/Y8GF3Y3SiSrk4OV00NkH8b4zEr7Hg3RvHTpLFedW4D1Qw
         JbHBpc/e1rOFOOU1Ky+R2almiii+jqf16rlRql4DwPzBtz6QKhc4yxQWGPyxu0TpEIxw
         pnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467349; x=1771072149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGG/5hFe9l1UuZ7F/Y/Ey7rK+aOOoZHlKqOBh2TGADk=;
        b=wgpY1CiRUbnkQvRHUDiIopluutyuzi9vqYZ9R2bnXmR1gpSLY/DRZfI93PUhwz8Hoa
         1K/IR+vitXUq3wf1H6NwRmuruprXHvjADCXdESV4HoS6EoeIr1zd7H4sGMBcixf5rivc
         eogulESr4H5r5psvMtnZ5cQRyZab0lDd3lio6VorFEl+pcTf/NfGcF4J2z+g2Yd7PIwL
         nvq631Wycd0TEUmT4A7+Gf5+x4uaQSoQEDJE/A6THXK9yOWgrRIgSXjUBNBYmiKKBOca
         WkQv1tzCc/+xoswZ9bfnpH7Ac+qS/tq3PBuvyH8dANIFlee8zAouCc2KIo516b4Zu6Rr
         GSWw==
X-Gm-Message-State: AOJu0YwVfywKQd3xShF8AuyBKy6hkKq7D6G4xqnzGEVYnEP+FfTCQ92a
	7Y+U1Dj55iJHI+wYZhWHMw647XA9sd08a3CRcZ7xLQxo5UniyV27U5F89+uevA==
X-Gm-Gg: AZuq6aKswe3dWeTPFcHY13bFPxeI9uF392EY78ZwWbv+uLZq9ZWMRhp73tIYv2zyssH
	UXpfkr3agvsXTByTc3FqduWH54qeZBUVA9aG0xPRGLb90igPek92lQrF7/ay4HjY+l5oTtFsoTn
	VqEk3PYfJRACGBDixz946xJSt+Tjt+OXE4xkSzqY7Lt0wmST1WcZB2dbvLo3+FOeU1raGrasqh9
	WqGo9FktrFkJoo+eRTljtDWZaeBZ1d2fp7J5F81zvTYSmm+Ry4z6Ivi74LltD1OkjPwuHoRHVf+
	R5aZjg/MgbwUb4e5CLTRrVJE/E1P2lJRK6NUbMpUbjphCtzNuUlKp+8VmpDSRpD9gTPU91ee5bi
	Ry9y1wAXzQS/C43eAe0JWEOrZA7SoLBiPrFI/Rg/o64hoQaauFww3YLdevMVLvjZbZyBgsY+Xa8
	jQ+5PabFuR
X-Received: by 2002:a05:600c:19cd:b0:47d:586e:2fea with SMTP id 5b1f17b1804b1-483201e270bmr75850605e9.15.1770467348889;
        Sat, 07 Feb 2026 04:29:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320728774sm106667885e9.14.2026.02.07.04.29.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:29:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-desktop: upgrade 44.1 -> 44.4
Date: Sat,  7 Feb 2026 13:29:07 +0100
Message-ID: <20260207122907.665134-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124269

Changes:
Version 44.4
- Support TryExec for thumbnailers
- Translation updates

Version 44.3
- Fix CI regression for release upload

Version 44.2
- Stop using ratio character for time in the wall-clock
- Fix variable initialization
- General CI cleanups
- Only parse XML files as slideshows
- Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-desktop_44.1.bb => gnome-desktop_44.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.1.bb => gnome-desktop_44.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
index 629fe929a1..2fe66b9e52 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
@@ -14,7 +14,7 @@ GIR_MESON_OPTION = ""
 
 SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
             file://0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch"
-SRC_URI[archive.sha256sum] = "ae7ca55dc9e08914999741523a17d29ce223915626bd2462a120bf96f47a79ab"
+SRC_URI[archive.sha256sum] = "1d8cb9c6a328eb689b0c1269cf53834cc84d851d7e71970cdabba82706b44984"
 
 DEPENDS += " \
     fontconfig \

