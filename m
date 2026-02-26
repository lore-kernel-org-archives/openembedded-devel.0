Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA46FFD8FCF
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 16:30:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74183.1772123445820296369
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 08:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QGOqGnwR;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-436309f1ad7so893622f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 08:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772123444; x=1772728244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8dGdq7PbJZLKcnuXqgimeSMNtAkbDqF1ZzlbwIBmxxs=;
        b=QGOqGnwR276iy7cVbI2hNdW29LCb19AKOzx7pMXf+beidB/vUAi9OFolEA6FsFosYY
         6XWC4MWzKTGB5fSicxFJNLJqTImXLhpqFFP80lKp22/neIgd4nbyqfzzmU+HxWMYNpGj
         N5Nw6x5s5Ks7EnMBrTmpkfB/GBtqnxd2uwgC13mpkum4g65Ze+RtO5tJUSo7yWsux9+t
         3PcI8ysckenb7/RmcBgxwQxs5/KrIxCA+r70Q4mQ6QZUKQq+kn9zQcB8dyHDs3ORtAXy
         u3WqE5juZVBJzu2K46OTzqJ60OVp3eNih1ziQfduW9wy2xdqkHUt2BbgKggwata400q8
         ksuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772123444; x=1772728244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dGdq7PbJZLKcnuXqgimeSMNtAkbDqF1ZzlbwIBmxxs=;
        b=v8LVT7m9k5MrJXhyh5YcqikcBI2eDctSxrExA9XnMj2WX4if1x9wG2BHf47JFdYS7s
         j1bjNPRT4aHGgFAl5gz/SbCAEoKHWjDESnNOKdaLFMmz3OVIL8b62hsv5zKTNnVjsaAK
         oWKnGP4IlqmaQsMiSd2P0BPJwbS6MnOEGgi9ziQoDr7oI7i3HcgSNgrgdLFU84omwRmj
         sNlykydWB1SSqPr/sb7+/C1Cj4qryyWwhXuW/p3xMoZ/prWZwp6TQQ0y91nQGfAIC2KY
         7ai+OY/G/5lEJFcGpPaU6dnMPGmjVZbRxt1geeldOKJa2jx9uNg+2kr/fxulwvwIXXVl
         DiTw==
X-Gm-Message-State: AOJu0YyQA9QwXDbOEpASFvu8VhIM0Wnu6PAkIiIiSJEoifZ/xYOdvHdT
	pxEZ7kh+V1D0vCjFV53LI+4DMsSwf/xWo71pc5G2sa7hOiYlvB+fCjaOgs9G+A==
X-Gm-Gg: ATEYQzyFdOXMgqQiQZshzWD8f9CeH1xLA+viSSAtJqUSWyj/F8OmHWnXDFi5HglV7UC
	dihKmOF1S5MXM6q7VjfQybOjw8VpAqZYM1j2O8rIuT5L+Ws2l3Z7RLb3zh3SCxBbummaOzEZyGe
	E6tHoQDb9lr4Qz2W0z25GAWfKhPkcnPoIMg4k+GHDrVk52f6tYfCCrFzG6tw3CmloHYJIbisSVr
	kg3bi6dFUHHpy1REg3heBpp4nT8vi4jsv6b+OZ8TnjTqq/d+sdfeShqvx2i4nXbZoqwQe0xuOd7
	kUb5ZZM6ZlMoxoBwbJieNxOw3cykOrc/f03mIcez2Ef0MiQOghhh7LH298pxJShR82IR2Uq3yXf
	YLq4Oy7/qFCPzDgku9r8vfOBVzirmTG+fDJfvRgTu09gPqXQ42+z8Q6FmAnNVHU64cszsTiLjmB
	hKN4iWRChWoFhxDvJ6cWgS54m13Q4McP4=
X-Received: by 2002:a05:6000:2881:b0:437:6c6b:1f95 with SMTP id ffacd0b85a97d-439942ecf56mr8159016f8f.29.1772123443867;
        Thu, 26 Feb 2026 08:30:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c76b40esm446164f8f.36.2026.02.26.08.30.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:30:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/2] libconfuse: patch CVE-2022-40320
Date: Thu, 26 Feb 2026 17:30:41 +0100
Message-ID: <20260226163042.3765918-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 16:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124685

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-40320

Pick the patch that was marked to resolve the github bug in the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libconfuse/CVE-2022-40320.patch           | 40 +++++++++++++++++++
 .../libconfuse/libconfuse_3.3.bb              |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/libconfuse/libconfuse/CVE-2022-40320.patch

diff --git a/meta-networking/recipes-support/libconfuse/libconfuse/CVE-2022-40320.patch b/meta-networking/recipes-support/libconfuse/libconfuse/CVE-2022-40320.patch
new file mode 100644
index 0000000000..ac8dedf012
--- /dev/null
+++ b/meta-networking/recipes-support/libconfuse/libconfuse/CVE-2022-40320.patch
@@ -0,0 +1,40 @@
+From ee3769c0bb797e648dd16997148aad135283e829 Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Fri, 2 Sep 2022 16:12:46 +0200
+Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+
+CVE: CVE-2022-40320
+Upstream-Status: Backport [https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/confuse.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/confuse.c b/src/confuse.c
+index ce4fca8..18dbccf 100644
+--- a/src/confuse.c
++++ b/src/confuse.c
+@@ -1865,16 +1865,19 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
+ 		} else {
+ 			/* ~user or ~user/path */
+ 			char *user;
++			size_t len;
+ 
+ 			file = strchr(filename, '/');
+ 			if (file == 0)
+ 				file = filename + strlen(filename);
+ 
+-			user = malloc(file - filename);
++			len = file - filename - 1;
++			user = malloc(len + 1);
+ 			if (!user)
+ 				return NULL;
+ 
+-			strncpy(user, filename + 1, file - filename - 1);
++			strncpy(user, &filename[1], len);
++			user[len] = 0;
+ 			passwd = getpwnam(user);
+ 			free(user);
+ 		}
diff --git a/meta-networking/recipes-support/libconfuse/libconfuse_3.3.bb b/meta-networking/recipes-support/libconfuse/libconfuse_3.3.bb
index b8d0536eb3..c98235dda3 100644
--- a/meta-networking/recipes-support/libconfuse/libconfuse_3.3.bb
+++ b/meta-networking/recipes-support/libconfuse/libconfuse_3.3.bb
@@ -3,7 +3,9 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=42fa47330d4051cd219f7d99d023de3a"
 
 SRCREV = "a42aebf13db33afd575da6e63f55163d371f776d"
-SRC_URI = "git://github.com/libconfuse/libconfuse.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/libconfuse/libconfuse.git;branch=master;protocol=https \
+           file://CVE-2022-40320.patch \
+           "
 
 inherit autotools-brokensep pkgconfig gettext
 

