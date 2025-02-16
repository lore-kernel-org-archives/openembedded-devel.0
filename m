Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB99C02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 14:08:23 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.29210.1739714895641710741
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Feb 2025 06:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CaFkZ2GL;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1733609f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 06:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739714894; x=1740319694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KcjqAJQquGYAmkL8i6fHSDJBxaU2PUOZa1A4RLLWytU=;
        b=CaFkZ2GLVGCTZwapFxkOB11qe2X03UAvKWSDhP3Gphh3JxVDLcnUD4piqtrL2aI1oe
         dTBZ4WUVJcLiHfDoD8FR4MdyaFejsWwwaU1phIqnVb84sdOGhR1tFnJ1faKAb9c94VNr
         N2p/qMoLN7HCGePkqzIG8wBmTxwMWKK2vfr1gocuAc2K/cTB7F85d6qoA5lAs7W3GHhz
         dcA1GOHv89RBPUzmrA4I8FI/pMzGuBOOyDXuxnIqme1pLcrFWOMZGlt02aa833DsY/1k
         75BrjAjYsLlUY0xyktf27Dt1CUvMovgyUr0Y2rUCeULjx1idU/OxEQSS7cmco87Z0lsK
         pbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739714894; x=1740319694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KcjqAJQquGYAmkL8i6fHSDJBxaU2PUOZa1A4RLLWytU=;
        b=X+YHrEA3mj4NHyVnFBnXdOJLkY3CFZ4yfNBVsgd4eASFBr2QP6MlyRzbrQAZuotnqz
         r6RPbVP+AnTutqwi7TcxU7ZM4xvkkT7tl/Wl9seHRWJEeo02QTpK6GK2StPUORkG0FTQ
         c7VktIJ+MZK59pDpbdTGHDfC0VWjwXjQ3gFL6qUr08kj+JpariWsJEJFPTA+v8xxulXE
         EPIvyLK26q0QvXtSIL88pDTBm020hnkHU8QioURVacPLVPaHqsc5v1Ujv6pjIq9EbW+I
         3oMOGeCiojWFYX2eApumolUKkhPuOb81QjxbC94xxq+VvJcyXm5TD26KhwdousmYckpw
         /TKA==
X-Gm-Message-State: AOJu0YxJftkRND2b5g0zLY1LCvKT3m7bWVgDeQ/QtWjNT6YTu0ciMjAD
	Az5GiLk2Z9L8CBsnglaSL3DbjaQ8KilPbw9fitNRgy5aOviKIbkFeGuTvA==
X-Gm-Gg: ASbGnctNnJUg6cDRWZZ6NiEe9cilx2/sTZQ+9W+bF4cPeJ0slaeg+H7gqGync9LCSTF
	j87YiaHEbMORzU94oBG7LXAEaEjtFPvoUZxWd18B/f76G0FJjmpdPu8crUcX8ZcpTIBIk7f1OFw
	/4ZDboHqEowFV/L0ytNZ+TY0MD7301sp2ayHe7d259vYo0DGIglfP2g525ofYiRhfB6M2oSIpVq
	jd8plBezALPzSUBMQkAlCmPthH7IFtfR3enSe+qchKzL2ELWhxfzL9W/L1VjSANhB4dusc1rsxH
	APPaejbwZTAwkm81yId1OiD+ckneY2o=
X-Google-Smtp-Source: AGHT+IFc8lHxLa5XIPY1AtrgFf/6ehW4kA0CNVcdVR8ov0ZJyuVgSozz2kZsGAT4tAPwUthXS7gmMw==
X-Received: by 2002:a5d:4684:0:b0:38d:d8c0:1f8c with SMTP id ffacd0b85a97d-38f3406cb07mr6566709f8f.38.1739714893927;
        Sun, 16 Feb 2025 06:08:13 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8115sm9840684f8f.92.2025.02.16.06.08.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 06:08:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] libplacebo: fix demos PACKAGECONFIG
Date: Sun, 16 Feb 2025 15:08:12 +0100
Message-ID: <20250216140812.1528278-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 14:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115504

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
v2: fix incorrect SRC_URI

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
index a5b38db335..aaeaad1455 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"
 DEPENDS += "fastfloat glad-native python3-mako-native python3-jinja2-native vulkan-headers"
 
 SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.349 \
-           file://0001-meson-add-glslang-lib-for-15.0.0-linking.patch"
+           file://0001-meson-add-glslang-lib-for-15.0.0-linking.patch \
+           file://0001-Fix-compiling-demos-without-nuklear.patch"
 SRCREV = "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
 
 inherit meson pkgconfig

