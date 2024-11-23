Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B197BE6ADCB
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 00:03:29 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.38772.1732320203528276015
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 16:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E2dmIkxz;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e388d853727so2511765276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 16:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732320202; x=1732925002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZYEenoqVZ+0NAf7ARg6vax+BWBrgivM++EQXFzTdUE=;
        b=E2dmIkxz+JxinfHUgYPVc3dhBBdkHCrq3AtlZLcrdAdmX+YA/jSD0lyrO+pvdIGUVQ
         MuZeHzd1lTCjADbvBtkfUXBdwVHz7YEbADoOOaEnNPQPHK6MnZsRGg521YQwC4yeZfeI
         xLyvnvvMtWZZT2mtoiAi4VgvPSNwuFxPxJu/itrQ0cIjxKtCZJeJ92wZqgugkQ2Mv4AN
         ApaF8FgXTmshEdKe9PCwPmrPD4d88jr3gsH5JVd2NppffIwMthX230RzmU61j8btLiHM
         LV4NjVRpXd0D6AZOdZ3qDe6OItjSWqLBUTQJ5x00oiB+JA/tlwg6bJlnjbgMex3M4j8+
         rhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732320202; x=1732925002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZYEenoqVZ+0NAf7ARg6vax+BWBrgivM++EQXFzTdUE=;
        b=d8anFN1k0F+r0LH/RqgNhA+y9kDewKwBs80oyPYSWa/ZkbTbeqOGXZW7bJ+vXzHMxb
         s2rhcByzqGZMpIfePZEPSXSaqfTyVr9Wt+TeOYCTTg+FSs2CpYM9ITSULIQthfVyZ5xT
         Kz73uw8AhFarGY+HRmemI3PZcG6mCyDmKfSGv5hEGsujuTMU2eE00yMSdiQlwiOMBXlg
         6NMK61dr/7zGi9MjnGuqYPvKe30yb9La9eQ479vX9R+HdZqiVDXr4rDmv79jXXsC+f/i
         0pYjJ+vTTk72XIfEYtI8uVW3qaMCDXz8wuR+VA/Vs0LvEXTvY7WZJsYXFI36YaweCeoc
         9eBQ==
X-Gm-Message-State: AOJu0YxMmBsWjRZhtSHh+mDem3FgYIurAQjNCtWhW/8bB7vwIsRDEVp1
	Tebst1LKfGhit7e8fgvO/r1XGTmsyYuwkv8ZebIrmK8X1JLAQ2VmNG5X1x6O
X-Gm-Gg: ASbGnctR07dWokRA1d+uXzjskAaQ5WffJ0ldH9S3ezBkivHo+0n3QMw5P0yPNCNAPCE
	0Ok6p/Q/xjbKZ/NOftfBY6X8Ad0a9Y6afk2vVwTnvg49zQKRcdj08blVJtw2ZDVg8dEWqEywxV3
	yB6ZEcSNC6rPklxGKHPhpqwWiwHp1ztJu/gQD9tVDL+xE3Re0fDBW2eAKIRtw6SB4TY9HZegGE2
	gAo4g9PWViOHv6/dch9+ow1VDdgSnT5zpHZ5DCT+yMdNgvIdtXVjx9A
X-Google-Smtp-Source: AGHT+IFtkql50GLYHzLUBZvOZEXk4shf1onB1EJwxh6G/NgO83zVV8sZwU+VPQLeeoxgAJRsZXLTaQ==
X-Received: by 2002:a05:6902:921:b0:e2e:35db:9b94 with SMTP id 3f1490d57ef6-e38f8bc8dcdmr5028567276.39.1732320201904;
        Fri, 22 Nov 2024 16:03:21 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f6319e12sm888256276.38.2024.11.22.16.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 16:03:21 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/6] xfce4-appfinder: Upgrade 4.19.1 -> 4.19.2
Date: Fri, 22 Nov 2024 19:02:25 -0500
Message-ID: <20241123000230.1479075-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 00:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114010

Changelog: https://gitlab.xfce.org/xfce/xfce4-appfinder/-/tags/xfce4-appfinder-4.19.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-appfinder_4.19.1.bb => xfce4-appfinder_4.19.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.19.1.bb => xfce4-appfinder_4.19.2.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.2.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.2.bb
index 0fea41c77..abc04a031 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.2.bb
@@ -8,6 +8,6 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "d8bd2a1dd9d193eb25e8e5e68b1beae3578a46d1c5eeee30bec7dabbf4330648"
+SRC_URI[sha256sum] = "e2f4878482bb8bbef63d9499329e46b2a1e0c5b984e8515e6aeec7efb5bfd330"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.43.0


