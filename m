Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EB0C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 03:08:56 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.2522.1721099330513484402
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 20:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kIJHFmvl;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3dab3b85623so1537176b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 20:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721099329; x=1721704129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=alLTEYvzqiGES3iFYt1ph/P62Odi+wvC/s9w/L+nbVw=;
        b=kIJHFmvll56Kh62sZaLLjgNweTJ2lO29S0M52X4E8bEiJZkhurD3BfabDqxev+Fwh/
         wC7dJnRFWlxhBWo0Dh1V0SFwtBJMqr0gG0DrstonHf69RF+5HszZFcPVCwB0nvQHDjAl
         SHBvA8iaY8t8SuaQdNUK1iOu+bJG1aoup7kjP1TqIo+VNWvLK+Nl3McU0Wu1jAo0jEjy
         r2lzeZ4NRwlB04qGVV6D1sDu88txynni43ChDbEAMv70KBT1FebJG7DRk1m4oKFkpb5B
         b+llBO4VIWkpox3gOgvkKHKpsMp/5/79hFVgVVePqQdVXvHVk3W0R+VNnN6tRSBUiqag
         9E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721099329; x=1721704129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alLTEYvzqiGES3iFYt1ph/P62Odi+wvC/s9w/L+nbVw=;
        b=hmC0DmyuTCaiE6yj6KywR3L91UjkiZni9Pg8ZDDtOkv1ycNp5xpAgVR/xDt56yqRuh
         F+OxG33JOvhPbVkzyaPCZS0J9KbWtzSfS81j/LPhRaXJepmYluT6i5IzR5b/2l2UCXt6
         OfzlMmqDB2ks8rlcE+Alix9MDVeONc0LovcBSEahA53arEvUfOqo83ovzkB7RqQha82c
         YcMLKWrfbk36lzlNeByKdY7EeiW4nlUus5YqkeX1glDI9SMXhgztPDMXnL+Ky3jeuOiS
         81Z8YxmbFmBwt+we0BkpuMmU0gsWTDcggLPUxvbfmYn3UCpQdu/+kLdFsJiA3Oq8goTJ
         Nevg==
X-Gm-Message-State: AOJu0YwdwERLsSgUwR+6KHC1WLe6yO2/sSdu/Tfc0Qxq5tcC0YyF0Mt1
	mylYeLVZ8t/v0h8F+h6EVgUP8W/kmhM0+fH5+OMdSjMGM324y3kdtKmaJnew
X-Google-Smtp-Source: AGHT+IFZb/qOJrchtdDjU8GqP3gbrDucEHkfKvEFJV8vBhKmKkNXekblApQt63AL1q7s2go2ZGqLyw==
X-Received: by 2002:a05:6808:f92:b0:3d9:28cc:5329 with SMTP id 5614622812f47-3dac7b848dfmr1192412b6e.17.1721099329429;
        Mon, 15 Jul 2024 20:08:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5842])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c7bcsm5184474b3a.33.2024.07.15.20.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 20:08:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Check GTK3DISTROFEATURES for enabling gtk support
Date: Mon, 15 Jul 2024 20:08:46 -0700
Message-ID: <20240716030846.2581655-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 03:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111367

gtk with wayland without x11 works equally well, there is no need
for x11 alone to enable it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
index cf836d3ecf..54b850e68f 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
@@ -86,7 +86,7 @@ EXTRA_OECMAKE:append:x86 = " -DX86=ON"
 EXTRA_OECMAKE:remove:x86 = " -DENABLE_SSE41=1 -DENABLE_SSE42=1"
 
 PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
+    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}
     ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpeg commercial", "libav", "", d)}"
 
 # TBB does not build for powerpc so disable that package config

