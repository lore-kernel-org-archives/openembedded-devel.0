Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40862C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 18:02:33 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.469.1643047351988110053
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dDUpY3Ev;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id i1so6709971pla.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oJ7WGGT/vS5OfhdoLRNlj3kLpfcQrz4wdpq1jX5ct0U=;
        b=dDUpY3EvlWDtD3x9Dh3BKCoRQMB8Q9J3kJZW/KoUhOd4hPc69fmR8e8BWZWJlr2ZP6
         nc4t9b7AhRzUabCPNEgkEyTJ4S881XJ1vAhcS7FKe+qn8OrkMsBIXNXhVg/g7TSezPut
         9wrAvGUjSRSebFYhzfUNq83pG/YrXPc9nG/7yfTd9ZGFiosJ7FRpYVYvIZ9wdHDV3Ryg
         51ThgIWF9i3F+CwFXnLrg1qc+0hGdXKooMGNXq7zhlxwhkMtn2yqAp5oYFTCsKVbBQ3r
         7KjBQlAp65r8qcrzAfiAHLa4iZS80mHYm60nrFfHtFpFy8YL/XIsNE6AQ6xVRbSnLPbz
         WlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oJ7WGGT/vS5OfhdoLRNlj3kLpfcQrz4wdpq1jX5ct0U=;
        b=y3Rcuy4Rz55uRsjKrLhnVOT/TtSszynfhMCsTd15YUOxGjvMoJbkC1j58osuzagV4a
         vuIAogdyFjARMgwxMdRgGsP8L2/UzHy52myH/7fxQRlauXgwjNpBHzcrr+YRmWAFCPO5
         dMsQjP3o21m+3mUbVosYPmqvGrMOYW2NbwI9htiGcr9zofCuR1QrHJTTLL2nGb8XtZ9O
         n8zT1o5stT3YlY0Qm0M0enh3NnjBF0d0Z/Zv2bhAgfsO1GaOO+uALse/CQNhU2qxBKbD
         s1NFxGIim9QNJf38qohbl7THMnU/+WZmY3xo0MrYAOZltW6O5Og7C7seuMe0p84wobQL
         hOug==
X-Gm-Message-State: AOAM533k202neeEY38KfeQKSbO/YbgluKfwAudA7OlKjd9QctgR9FZhH
	iYhKfb77pN3YCdeZfnGcfBjOSyo6VYKxRQ==
X-Google-Smtp-Source: 
 ABdhPJxxNQAcBzOctEwc49XLhuaH119Vbc9kgl1kpBdtTqJbhD91fIt3dsnLAqi0o5ptMqhCFuyLIA==
X-Received: by 2002:a17:902:dac9:b0:14b:1fc4:42b5 with SMTP id
 q9-20020a170902dac900b0014b1fc442b5mr14013097plx.74.1643047351236;
        Mon, 24 Jan 2022 10:02:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 mm24sm27914pjb.20.2022.01.24.10.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 10:02:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-datetime-setter: Fix build with meson 0.61+
Date: Mon, 24 Jan 2022 10:02:28 -0800
Message-Id: <20220124180228.2693986-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 18:02:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95043

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-with-meson-0.61.patch      | 26 +++++++++++++++++++
 .../xfce4-datetime-setter_3.32.2.bb           |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-Fix-build-with-meson-0.61.patch

diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-Fix-build-with-meson-0.61.patch b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-Fix-build-with-meson-0.61.patch
new file mode 100644
index 0000000000..617d175579
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-Fix-build-with-meson-0.61.patch
@@ -0,0 +1,26 @@
+From d463b7e9abbbc87ec0e25216a24d9a40d347f1a6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 Jan 2022 09:59:02 -0800
+Subject: [PATCH] Fix build with meson >= 0.61
+
+Upstream-Status: Submitted [https://github.com/schnitzeltony/xfce4-datetime-setter/pull/3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ panels/datetime/meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/panels/datetime/meson.build b/panels/datetime/meson.build
+index 241e177..4356907 100644
+--- a/panels/datetime/meson.build
++++ b/panels/datetime/meson.build
+@@ -10,7 +10,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: 'xfce-datetime.desktop',
+-- 
+2.34.1
+
diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
index 4ae83ceca1..9d68ad272b 100644
--- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
@@ -8,6 +8,7 @@ DEPENDS = "glib-2.0-native libxfce4ui"
 
 SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https;branch=master \
            file://fix-inner-dependency.patch \
+           file://0001-Fix-build-with-meson-0.61.patch \
 "
 SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
 
-- 
2.34.1


