Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E981BC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 16:11:41 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.11849.1749139896984882435
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 09:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IAc6PqUm;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70f86c9e3e7so13315377b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139896; x=1749744696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n0HEPVTcKVokjrNu7Eb2Qm3CGbhAknfy6Z02e/zayV8=;
        b=IAc6PqUmsNduUfCuwvZ9KgITrqL3IivaAcdWzXBeuZqyC2pXMtkelfW+Cdr/3XQxU/
         J1zGbqd+O8/ezZr+6eOjw04fXKVe4BLi57VO4a1Z+ivYBQzAEvxgMOtg4v7gkNfmm4v0
         Cnw/HbAC8sTSh8u64ZFMcpYrLFsUSPNtWiWz6BIvMVyHJrEQVDrdz9bWajrdu6P7qBs9
         KZjnDAFWOM6MwuMDinkN4ivZVZl4dZDe0JCO2wDA9f34kAvgrGC0KqhzsI4VQRChXR3f
         6CN5yR0hCWySPXLzq9y9hkMNWGsgorTz0UX0jVdVlDm48fMGba6kgK1EPVS00FED46sJ
         v6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139896; x=1749744696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0HEPVTcKVokjrNu7Eb2Qm3CGbhAknfy6Z02e/zayV8=;
        b=CcdPPuuviMmXtKjT3j/z2jU8N4JxlIsnCSUgsEpb4jAZjbHgVoO4laKs7kR46rAz9G
         ZA2/o08GiI4iH7XLmrFLmLxXobbeb+EdZWfFOYVSqjl6t+uO0L1DoXuZNwizWDTO8x3T
         /BtA+FbpWhZ5mStn6+DiAhm43ZKxzWUKmW/nSWStjB8CwijCdhaxZ7KTgFeOdP7kq2+0
         nHnAIVIzvzU7hr5g+rbbymaWpUvezQrKs7n/9+CuDN3tqBm+z0cKuQ3Cfq30lwZ/IhHr
         5RVt5Ap0O0k2HrZ40Tm010wldt0cXSFFCQJsbbRR6WWaxIRRmIeXjO13ywqcOb1bpdqS
         g69A==
X-Gm-Message-State: AOJu0Yyf/D6TpCTZBGhfd84dZ27C02HEPg0bgejE7TzJeKEiAavYdy1t
	EhcBSj+tuU+rCJsSpuAWIoeUFV+/b1Kt/nr8wvhn+RvFfj+HnaQihfIVVFZWtIDI
X-Gm-Gg: ASbGncuC9IWt/aQMyup5+fwZMEbUbuNPBUYrjnuy6Nb1Ob8WW07d+NdQJiYMRusvSyl
	me4hMzk1K/kP0psPZZifAiUtGYEOghSSRdlEVQPPrIAwXGLxeRDfuxHezkjLaS3upiX1HwjA5N7
	+mlNBEhiat9RH48y1vpeQbpRnQaNlQDnlXqwwUnY9OhTJsRgzlEe6lUyhyZGrnYs69BDJXb9jTE
	QadX4qJMBkJJbPAimxKGTfSWxPJGCT7I66XtkKm1Y+d4JYWRA4rPgL7v1sv4tZgTrgjtV9XtIT3
	IHS1i8oyoBgLWjdwGgXDJtwUzIut5vn7NThCuB5o4x0a/2XuIHN2haY4rOs7uEZS2xAI690mSSA
	DooYsO1hN2Q==
X-Google-Smtp-Source: AGHT+IHe0SdOKY5VfH8ULsaZt01UoryqfsSUU/I/yVnn7sSsMOAy5tJsczzrB1d73d0zjk11vuMWfg==
X-Received: by 2002:a05:690c:6505:b0:710:f46d:ced5 with SMTP id 00721157ae682-710f46dd7d4mr15968097b3.33.1749139895523;
        Thu, 05 Jun 2025 09:11:35 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f7317649sm87887b3.35.2025.06.05.09.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:11:35 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] thunar-plugin.bbclass change and plugins
Date: Thu,  5 Jun 2025 12:11:26 -0400
Message-ID: <20250605161126.20001-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 16:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117751

Newer thunar plugins are being distributed as tar.xz archives
instead of tar.bz2.  Update the bbclass to reflect that.

Also update the three users of this bbclass to newer plugin versions
that are distributed as tar.xz arcives.

All three of these plugins still build with autotools.  Although some
thought should be given to how we want to build with meson in the future.

thunar-shares-plugin: upgrade 0.4.0 -> 0.5.0

Changelog: https://gitlab.xfce.org/thunar-plugins/thunar-shares-plugin/-/tags/thunar-shares-plugin-0.5.0

thunar-media-tags-plugin: upgrade 0.5.0 -> 0.6.0

Changelog: https://gitlab.xfce.org/thunar-plugins/thunar-media-tags-plugin/-/tags/thunar-media-tags-plugin-0.6.0

thunar-archive-plugin: upgrade 0.5.3 -> 0.6.0

Changelog: https://gitlab.xfce.org/thunar-plugins/thunar-archive-plugin/-/tags/thunar-archive-plugin-0.6.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/classes/thunar-plugin.bbclass                         | 2 +-
 ...r-archive-plugin_0.5.3.bb => thunar-archive-plugin_0.6.0.bb} | 2 +-
 ...a-tags-plugin_0.5.0.bb => thunar-media-tags-plugin_0.6.0.bb} | 2 +-
 ...nar-shares-plugin_0.4.0.bb => thunar-shares-plugin_0.5.0.bb} | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-thunar-plugins/archive/{thunar-archive-plugin_0.5.3.bb => thunar-archive-plugin_0.6.0.bb} (81%)
 rename meta-xfce/recipes-thunar-plugins/media-tags/{thunar-media-tags-plugin_0.5.0.bb => thunar-media-tags-plugin_0.6.0.bb} (75%)
 rename meta-xfce/recipes-thunar-plugins/shares/{thunar-shares-plugin_0.4.0.bb => thunar-shares-plugin_0.5.0.bb} (78%)

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
index 3719cba219..ad9e15296e 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -6,7 +6,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 DEPENDS += "thunar"
 
-SRC_URI = "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.xz"
 
 FILES:${PN} += "${libdir}/thunarx-3/*.so"
 
diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.3.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.6.0.bb
similarity index 81%
rename from meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.3.bb
rename to meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.6.0.bb
index e4d5d731c6..e38636be24 100644
--- a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.3.bb
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
 
 inherit thunar-plugin
 
-SRC_URI[sha256sum] = "cc0ffc86dc48e72edc6f6a61ad4345f99018526d5d854360960759ce1ec2ca22"
+SRC_URI[sha256sum] = "692708cd047c7a552f2f85fe2ee32f19c7d5be5bf695d0288e8cadf50289db06"
 
 # install tap files in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
diff --git a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.5.0.bb b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.6.0.bb
similarity index 75%
rename from meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.5.0.bb
rename to meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.6.0.bb
index 7418083149..5d75e43e61 100644
--- a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.6.0.bb
@@ -7,4 +7,4 @@ inherit thunar-plugin
 
 DEPENDS += "taglib"
 
-SRC_URI[sha256sum] = "105a72d51c7fbcc690c9b9a850f3743accbd9bf5dc51480b5ea283dfde96d61e"
+SRC_URI[sha256sum] = "b62dc047100346324e63d46acaaa497e8d7fccd1d10ef5bfb8370fd666a48c4a"
diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.4.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
similarity index 78%
rename from meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.4.0.bb
rename to meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
index f22e0ca9fa..3b4f38da02 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.4.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
@@ -7,6 +7,6 @@ inherit thunar-plugin features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRC_URI[sha256sum] = "0afc9b9ff31c88b208ca9a58bc61d95f9f5408f2adbcd7fe911dfce9e22fba44"
+SRC_URI[sha256sum] = "34d4d69d413e63837c5083506b4dbf65f1fd2efe17667b1d7ad0699e1e2eb07d"
 
 RDEPENDS:${PN} += "samba-server"
-- 
2.43.0


