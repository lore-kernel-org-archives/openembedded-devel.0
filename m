Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D5FC02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 14:02:13 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.29091.1739714529590422141
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Feb 2025 06:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ciUOekQm;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so738881f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 06:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739714528; x=1740319328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKb6m7uYnHZ+N6feC1QUsUOPOAeru230h8ccb56bmvo=;
        b=ciUOekQmtDzjDSl6/cEcs+YvIY05CgAXJOaYU56SmAhPt7wsA/wjQ9Ni5bvFJk6+pj
         90BlSt+NHY/n81YhS6tegPdHF8Z1cEO+sp7H8qVDR730n80l0tqOx7maVp6FCXdXtrmk
         CtPpBELgKhDRvVSKuHVbAAS+xtCWRxzLeqG1wX+e9mxyLJAz8mgeFHrS3cLg++otZUeu
         5e1NctFl83+ldh0XBj5i4d3IbSV2GDwIwqxuJdSyiofApUREVtEasdSf2oROtuuj1aT5
         WVdTN7g3ZNasOyf6wilpA9LbxMRx/9sI4FPnzWIKa0AgIyaCM1icbLGFMSxrnfOWyAi1
         hI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739714528; x=1740319328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKb6m7uYnHZ+N6feC1QUsUOPOAeru230h8ccb56bmvo=;
        b=NOf0scczepoJ39dGFbBY0rzOMHnNcGf8NQ1cvINLnSRx+IjkQ2YkSLYQGBQebXceaw
         yNeZBXvXn2exz0n6Ja7NKDc0rRj1VOxVhxuMG2ywzeTqy6P+gsudXbwmRhU5+ZdyfKsA
         RwNnDzhj/2tiB11zXxpIl8B8hsreGq1eiM4/BzGVx4g4hV9I7Pqj1evHSIV26Wyujkzg
         dGho2vA6cppTOslqeRnTWzh4X/9FR8/t766is2+4KSFvLfe1MQX0vF5GdByM8qMAHhZI
         TYKGKreig1A0I7Zc5MeSOWFqDHJV7w/9+oO0aDL846K7wlc/93p1dE1dUbJ9YKWOrZ3K
         ynEg==
X-Gm-Message-State: AOJu0YyD/JS0eISdQ0AwJu7ica8SsYjGOMvWhNzS1fimKhzR15KWpogc
	D8mKHb5Sr0kq82PNzXHwdVxcDWJoARePijXa2siFGqFRVxC8zXDHTP0Ipw==
X-Gm-Gg: ASbGncvqKEQ1a16/Wp1Kwh3aqcH3Zup90FXIOWy2oux6v2m0wLQT1ZPnXQtS4xBj+qI
	95sjvlnDpiDbkPM+0zIHKH9VAoU5OH3GahUE+xURYg0wr3qs+esXMah2+x+fOpZDINevQ3u3F56
	XHhnemReRBxLlAgQS79gmLcYf1vXe2ZzkRz3iU2hMQlTYHi+BKpIZE8eQC5stz2pNuOSXF3m9JH
	LNHoPdlDVTLb+6OukZzEhPNL7a8bNhR9iSTP5GiwZdHY41zJx80RO+PBD39+gRHVWp1weq2e3JW
	FkvgMVskr/fb8qBjECxbThJ6DbIjpG0=
X-Google-Smtp-Source: AGHT+IEM94+Yn6L9+/DnbYXafrqqAR9CzDhJGXsSAEIyOWP/Qvb6lBke/TMhgpP4RqOpZfM60s2hLw==
X-Received: by 2002:a5d:5f47:0:b0:38f:3791:c1d3 with SMTP id ffacd0b85a97d-38f3791c27emr5448360f8f.54.1739714527456;
        Sun, 16 Feb 2025 06:02:07 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddba7sm9854640f8f.38.2025.02.16.06.02.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 06:02:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libplacebo: fix demos PACKAGECONFIG
Date: Sun, 16 Feb 2025 15:02:05 +0100
Message-ID: <20250216140205.1527859-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216140205.1527859-1-skandigraun@gmail.com>
References: <20250216140205.1527859-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 14:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115503

In case the demos PACKAGECONFIG is enabled, linking fails with
the following error:

| /usr/src/debug/libplacebo/7.349.0/demos/plplay.c:669:(.text.startup+0x90): undefined reference to `parse_args'
| collect2: error: ld returned 1 exit status

The implementation of the missing function is guarded erroneously by
an ifdef flag (HAVE_NUKLEAR, which is only true in case headers from the nuklear
library are present - but in this recipe they are not included).

This patch moves the implementation of this function outside of the ifdef to
avoid the build failure.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-Fix-compiling-demos-without-nuklear.patch | 40 +++++++++++++++++++
 .../mplayer/libplacebo_7.349.0.bb             |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-Fix-compiling-demos-without-nuklear.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-Fix-compiling-demos-without-nuklear.patch b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-Fix-compiling-demos-without-nuklear.patch
new file mode 100644
index 0000000000..bd849a75dd
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-Fix-compiling-demos-without-nuklear.patch
@@ -0,0 +1,40 @@
+From ad0bbc5099d99bbb0c914b39cb5ab4920fd6eeda Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 16 Feb 2025 14:23:40 +0100
+Subject: [PATCH] Fix compiling demos without nuklear
+
+Demos can't be compiled if nuklear headers are not present, because
+the implementation of parse_args function is guarded by HAVE_NUKLEAR macro.
+
+To allow compiling demos without the Nuklear headers, move the implementation
+outside of this ifdef.
+
+Upstream-Status: Submitted [https://github.com/haasn/libplacebo/pull/315]
+---
+ demos/settings.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/demos/settings.c b/demos/settings.c
+index 197e8b7e..73f0e5b9 100644
+--- a/demos/settings.c
++++ b/demos/settings.c
+@@ -14,9 +14,6 @@
+ #define PL_BASENAME basename
+ #endif
+ 
+-#ifdef HAVE_NUKLEAR
+-#include "ui.h"
+-
+ bool parse_args(struct plplay_args *args, int argc, char *argv[])
+ {
+     static struct option long_options[] = {
+@@ -89,6 +86,9 @@ error:
+     return false;
+ }
+ 
++#ifdef HAVE_NUKLEAR
++#include "ui.h"
++
+ static void add_hook(struct plplay *p, const struct pl_hook *hook, const char *path)
+ {
+     if (!hook)
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
index a5b38db335..e79ab2e983 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"
 DEPENDS += "fastfloat glad-native python3-mako-native python3-jinja2-native vulkan-headers"
 
 SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.349 \
-           file://0001-meson-add-glslang-lib-for-15.0.0-linking.patch"
+           file://0001-meson-add-glslang-lib-for-15.0.0-linking.patch \
+           file:///0001-Fix-compiling-demos-without-nuklear.patch"
 SRCREV = "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
 
 inherit meson pkgconfig

