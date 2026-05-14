Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AD3CD4F21
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 02:55:16 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2284.1778727311128222170
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 19:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gX+SkNrO;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6579254f996so5038108d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 19:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778727310; x=1779332110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+1mi78VW4mkZ4Q63nmeTeSgYGxRuK1Zf49aux+dlRas=;
        b=gX+SkNrOB0D2asf6q3H/16LMp3x3qQwlotJ3Zg8gr3FmPMVsaWElSlABJZp4n6jE6K
         0/cIf+hgURXddzeqVkJky5eTtCh6RS0sjDvhPZPoI9ik3L6JC4/iFQtQ4/3UJPp83uBc
         o3ECA6c040cDlLG+FxrMDYb2pJoOZhk4zFNleHkRl8UgAT+aftcfz15yYTr+YIm/0u5a
         F/H8bCvG0kx6gNeZMpGYtmSiap/tDRwRbdQ1ubtDyoYIYrjQ0MlQnD9iU6cuWpIubsks
         DGpAfBhpxA7H+H6dzHMJ+cdrgITjferQ2l3Kx+zmYOBh5nPdpT4wv0ds/kM9xIiBbIMb
         LXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778727310; x=1779332110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1mi78VW4mkZ4Q63nmeTeSgYGxRuK1Zf49aux+dlRas=;
        b=AwkO1pYaDF0i4hvYCuReYZeVd180OgVvp1LxeMcBdPGGoLWMiIc4v3EgMg1n2xkAxJ
         KFX79p7x8/3h0E0Fcf98V4ImBO+wQqQ/cf6dQA55yOcvgo0O4anLwZbtXwb7CLqDnEn1
         J/rOc4Nmlh2K2ObNkQYIC24vHOO7vDo7388zCn030wJRW7WmQ7GyFN/Jfohx7ncQaNfd
         D90ggvZiVJW/ARGQL62GVQAh3O8NXYxpenpClLOvtT3R6zSEec7UoSFXaoKJY/Uf30O1
         n3VZpq+RHHQAHO/qKWCgk73YZ5SmBpv3F79lYf2oKcpDqbW6y5Khkjdb+P7QRHsBsKN6
         /zdg==
X-Gm-Message-State: AOJu0YyuxJ7EM7KU/+zr2KXoeBiFZjYwTWO+KRbsAXgQ65AtNs9siIAO
	HjViHLVdAf3PeD4Jg53T9IATuOv+NViz1e3SsA4IqkR6Ihm573Kx0H1Z+lcN7nIb
X-Gm-Gg: Acq92OGXTyadf32zJGn4Cc8KIEcPgJwxECj3xQQx8Jthaktv36uytWWLAUDWJP89/SF
	8ak4/jTP6WiA0ScklN72iAWvzJ4tpFaPPh+nCgGkcG1PdIhlcgBiGErVTuR/cwuBzTVki3BZsOS
	Qw8Ku97TEsdslNPTOg5ZIYybhl7a7wdHVIFxckAY6FQtpJmMrLsC4JjwMg6vpfwcEMMO/zCbwh2
	168jwzRTsLn8+D9YVDu3UaUg98l7PJi43ofkGC5/gvyEuQrsL+gV0lWwUc1ARLgrNI34SogB+DB
	NSzUcmTAi4zx8xwFb23VzX1YKwMcknGx2uzJ9nMzRKJ3x2uiKabCbywJBvFLew5wmLsvEn1s7U5
	19PtXjFrZkkV9hQfyfxVpDwsiyjxC+8wKaYBhVis90KhbOt40tyLHvUUxEk+JoIip0hP5sgOpnI
	uC577rfjCmh9512arDAlY+W1BNqrg1qukI6+NKF9Vd8JA06T6+GL6aceZ92/KqWCWpo9xVEzTkh
	WVJAcdkNUh4SV7pC/zvtCG/yGeNWoe7sdcse+Aet2v8yCPfYX4=
X-Received: by 2002:a05:690c:d8b:b0:7b3:6ff8:fdb4 with SMTP id 00721157ae682-7c6dc0bb9b0mr58958817b3.34.1778727309844;
        Wed, 13 May 2026 19:55:09 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f4fdd0c2sm6922697b3.28.2026.05.13.19.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 19:55:09 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-appfinder: upgrade 4.21.0 -> 4.21.1
Date: Wed, 13 May 2026 22:54:52 -0400
Message-ID: <20260514025452.32849-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 02:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126982

4.21.1 (2026-03-29)
======
- Rename bookmarks to favorites
- Avoid crash when resetting items frecency
- Add Name field and column to Custom Actions tab
- Add merge request template
- build: Fix typo in optimization level
- search: Only fuzzy search by app name and command
- fuzzy search: Optimize
- Correctly load symbolic icons
- Add option to clear frecency history (#102)
- Add css class for easier theming (#107)
- Make item description slightly transparent (#99)
- README.md: Add uninstall info
- Update README after switchover to meson
- Remove autotools build
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Asturian, Basque,
  Belarusian, Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong),
  Chinese (Taiwan), Croatian, Czech, Danish, Dutch, Eastern Armenian,
  English (Australia), English (Canada), English (United Kingdom),
  Estonian, Finnish, French, Galician, Georgian, German, Greek, Hebrew,
  Hindi, Hungarian, Icelandic, Indonesian, Interlingue, Italian,
  Japanese, Kazakh, Korean, Lithuanian, Malay, Norwegian Bokmål,
  Norwegian Nynorsk, Occitan (post 1500), Polish, Portuguese,
  Portuguese (Brazil), Romanian, Russian, Serbian, Slovak, Slovenian,
  Spanish, Swedish, Tatar, Thai, Turkish, Ukrainian, Uyghur, Vietnamese

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-appfinder_4.21.0.bb => xfce4-appfinder_4.21.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.21.0.bb => xfce4-appfinder_4.21.1.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.1.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.1.bb
index 4d7a1e2da3..e1e5a65914 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.1.bb
@@ -12,6 +12,6 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "e3befc3e73d2315074eb88933f2b042c5b417f4f7f24be9bd4f4508a091037b7"
+SRC_URI[sha256sum] = "62fba13ec05066e73200f5a34c2fa1e7a1a7c4dbefffbaf29af9e9e97bb4a7c9"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.43.0


