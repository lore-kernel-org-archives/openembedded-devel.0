Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630E7108B8E8
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:06:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9355.1774001193939703816
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 03:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dJ7DMaSJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fda2a389so3098735e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774001192; x=1774605992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8c7skHkSZXn4vyiSuiMmFU7wAvKXeEljUE1XMKLb1U=;
        b=dJ7DMaSJiOzsGECbjlpUIJrwUsITg+3WIiB+dQATV9qho4UQaENjraiZzlniJ+8MgS
         O0bqNJ+fGqzn6cINDSywamE1KXRwWhHJ5wuxvSaD+Ro58q3qmbQ537+W+uBgHnoLEfpb
         lwUpIBsj4yv8UnMbou5SDpbSNCyZ5pCWoWYdmXBkrh1cuQGQ4TeQu7gHRLx4b/HXpDWt
         mvrmTAoQPRKl0SuR/RAhS6RUuYph2RX4/qHALYD6/Y3Ywo5l9fGMmfVkdc7oeYYjwj9b
         7c3HxJHNS5xYzJjYOAKMMvMo9UQE3KDHojYSOLJHUpwATtrCb+3SHO+hjVD4v+vkhGrm
         qanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774001192; x=1774605992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8c7skHkSZXn4vyiSuiMmFU7wAvKXeEljUE1XMKLb1U=;
        b=q9/ofKmZ2Ca437sENz9fUMHjhjAchDq6K0d+VlDeiZHhI1YOtNnGwtKA3ibggM+DM/
         Ij+W5qcUDoBYEmzE+9/JRv0bn6BO9yJtU164DmfsKeXuMwElc5EqQaSxqHlOFiGungvO
         hDRSkqsRjwHrcx8fHdVgk3GmNmFtyOHXccweCgO0hW37jlZOW7UgyjBIy6e6S79uo87P
         SQDiZoCBq7Ivq9G2P6CqqCU/sOrjINXgEOoMoOwaFWzMOKM+BFS43juDFkmpqjgu+v6f
         K69eCULhEsotfQ6HHbQvKfeg0J0kFQk1gxjIr3EUzUhOytFO2JMqNub7MV3EymTz1Hny
         sVCg==
X-Gm-Message-State: AOJu0YyrPNaVpkRucBlnyYtRBfUpnWiQVtHmx/vVSxtm57LVDxn7mhHh
	sR/Xo3IolV8NExVRqORYvgK80x8UnmQ8ClEZkLRtrcRpRqOuEkLb2YrFgGswew==
X-Gm-Gg: ATEYQzxI8lyUuxWMblA02Z0bzDoMsSI5YrInXQ/NHufzXMbCV4IO4PMNlF+toetaDqN
	HCLvdKUl3z43naKzXKLFhW2e7TLa3b4nU8ze2i0TABNjZoHrccUWw2oh3/cqXUUVf3XOByDyd+V
	pKhCzo1gEnCVZ+1/hXQsDaa6mibYsP5WDqZh3XwdITSUcvCvNygxZKBjbAhH42JC6TZjeSHKc3O
	Q8LlV7uwBXw3pVf4guVIo5EzBN4v31e0+MFY4TWpdrN+0i2oNLS9qEeaisKEP8PzzxO0nbzNKhd
	x2ELQFLinmZgEvpp4ATeCBQfbMHlBZFubeVd5Xr2tFlIiyH5sJRW8fa5wGstZizGQX40u+7Iv7Z
	qY5HffcvyVRtcgz0s/CoAAWQLreFnur30dg83TyUowU+csWEiJ5QZYNoPbcVYHrO434A5e/IuuZ
	OnsKCkxfN17winoo5Qy1bi
X-Received: by 2002:a05:600c:3f19:b0:483:badb:618e with SMTP id 5b1f17b1804b1-486fedf70a8mr36103435e9.8.1774001192121;
        Fri, 20 Mar 2026 03:06:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d3b7sm12865355e9.20.2026.03.20.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:06:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-xfce][PATCH] imsettings: upgrade 1.8.10 -> 1.8.11
Date: Fri, 20 Mar 2026 11:06:30 +0100
Message-ID: <20260320100631.2774563-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125431

Fixes building with glibc 2.43

Shortlog:
Reset gtk-im-module in gsettings to use the wayland module instead gtk4
Ensure collecting proper information on even Wayland session
Fix unexpected D-Bus session lifetime
Fix "assignment discards 'const' qualifier from pointer target type"
Show few more information in log
Drop cinnamon backend
Disable imsettings for Cinnamon

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imsettings/imsettings/0001-remove-man-page.patch      | 8 ++++----
 .../{imsettings_1.8.10.bb => imsettings_1.8.11.bb}        | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-extended/imsettings/{imsettings_1.8.10.bb => imsettings_1.8.11.bb} (94%)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings/0001-remove-man-page.patch b/meta-xfce/recipes-extended/imsettings/imsettings/0001-remove-man-page.patch
index a2fe0451b0..e2ade1aa6c 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings/0001-remove-man-page.patch
+++ b/meta-xfce/recipes-extended/imsettings/imsettings/0001-remove-man-page.patch
@@ -45,9 +45,9 @@ index b492532..2236257 100644
 -SUFFIXES = .1.xml
 +
  
- ##
- # Local Rules
-@@ -50,12 +42,6 @@ bin_PROGRAMS =						\
+ #
+ imsettings_boot_in = imsettings-boot.sh.in
+@@ -59,12 +51,6 @@ bin_PROGRAMS =						\
  libexec_PROGRAMS =					\
  	imsettings-check				\
  	$(NULL)
@@ -60,7 +60,7 @@ index b492532..2236257 100644
  #
  autostartdir = $(sysconfdir)/xdg/autostart
  #
-@@ -64,13 +50,6 @@ autostart_in_files =					\
+@@ -73,13 +59,6 @@ autostart_in_files =					\
  	$(NULL)
  autostart_DATA = $(autostart_in_files:.desktop.in=.desktop)
  #
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.11.bb
similarity index 94%
rename from meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.8.11.bb
index 6daf1f57b1..e3fe0241b3 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.11.bb
@@ -16,11 +16,11 @@ DEPENDS = "autoconf-archive-native gtk+3 libnotify"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://gitlab.com/tagoh/imsettings.git;protocol=https;branch=main \
+SRC_URI = "git://gitlab.com/tagoh/imsettings.git;protocol=https;branch=main;tag=${PV} \
            file://imsettings-gcc10.patch \
            file://0001-remove-man-page.patch \
           "
-SRCREV = "27d84c88831ef76397a15891ba0738ce9a83902a"
+SRCREV = "7fadd84fcbfe6c321dbe1c97b50cbb70efe20155"
 
 
 do_configure:prepend() {

