Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C587C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 17:49:12 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.23144.1716054542477999449
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 May 2024 10:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m032gvif;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f4603237e0so833341b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 May 2024 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716054542; x=1716659342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XYwJ4zLkf+W/yuz1enIdyRkiT2UFULtowsreQcmDfWM=;
        b=m032gvifVrGLvNWFBzQQF0O4W/lX44XDWQ0gkUZtNWvdm4GHkecqTu5tsR12KCcpVG
         2UIaFWkoR4nRFZ+F3AOKYlpdxq1xikp9XPC5Cdhu4QrjGvkZ/c9TJqnGQsXAgRR3TP/2
         2pGgtYJ63kJCtpb4IEN1ua2B822M/eqMatpzTNp6wLSxZw3JX72AOP28UVjY2vtGtp81
         ouYcB/KkANIwIO51Qq0w+Sqf677QNen9CNNN95+DBYyHe6Tla2SDgMFmqEms2pjAgiVx
         w1T5KQwDRwIoli4y2EmcgSIfm+reD9IiNyqqe/dTmOdD7LrjVtBcYfrNgtpUuUtmf/Ob
         RVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716054542; x=1716659342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYwJ4zLkf+W/yuz1enIdyRkiT2UFULtowsreQcmDfWM=;
        b=mhTVU4iaS73g1xo6L/WnqMfU1+2DZyevMH8Yo/duS9QZIFzBijiO58W0Rj4T5R6CnQ
         PbVBNwJGQNyeQRh+B2qhSiToma1Lts04FHQ2SFj7fbqBJ1uCoxTSLjC92d3g5UhrkQms
         e7FgXfsW3+sOcwsYie5ke2uhg8Pc8oHXiRxic1lByH0HCmS4T8umKBUCJO0KhKLhNtAA
         yfn9urlOO9slAL7YKlSkRYMVKR1JvPwrESGbWSC7UzEjDv+YLvV2IwI2SsqGVt1did2y
         I07ddmWl1ITAyG5FlrDHucA9otCuYpK5bE+mXxMppnyNmFutCsGT4wH7yahhdZmhuOw8
         jDgg==
X-Gm-Message-State: AOJu0YzfrqZNF/1A+y3kl/EB8oQQaAe1E5u8F71T+VBalzyBFJ07uCO0
	SZvbayr4py+xX2LY+W6u5KpG6AcHMcnGwnyi0J1Wk0V6jptCeW7mrVkjl1wVNV4=
X-Google-Smtp-Source: AGHT+IHjXiWG6BZNshI4myHs7ukCWlu1dSN7VUgLWcJD8+zQKn/q7tuNCTCD0eXjJsmUBnTMysXz/w==
X-Received: by 2002:a05:6a20:432b:b0:1ad:7e4f:9564 with SMTP id adf61e73a8af0-1b1ca3c3e80mr3273862637.9.1716054541563;
        Sat, 18 May 2024 10:49:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4fa8db6a2sm12822449b3a.177.2024.05.18.10.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 10:49:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libndp: Fix build with gcc-14/musl
Date: Sat, 18 May 2024 10:48:59 -0700
Message-ID: <20240518174859.2644879-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 May 2024 17:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110433

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-libndp-Fix-signature-of-sendto-API.patch | 40 +++++++++++++++++++
 .../recipes-connectivity/libndp/libndp_1.8.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp/0001-libndp-Fix-signature-of-sendto-API.patch

diff --git a/meta-oe/recipes-connectivity/libndp/libndp/0001-libndp-Fix-signature-of-sendto-API.patch b/meta-oe/recipes-connectivity/libndp/libndp/0001-libndp-Fix-signature-of-sendto-API.patch
new file mode 100644
index 0000000000..f625416acf
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libndp/libndp/0001-libndp-Fix-signature-of-sendto-API.patch
@@ -0,0 +1,40 @@
+From 14e036b5daf6b72483a1a21054b5133acabceabe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 17 May 2024 18:14:04 -0700
+Subject: [PATCH] libndp: Fix signature of sendto API
+
+This fixes build with musl/gcc-14
+
+| ../../git/libndp/libndp.c: In function 'mysendto6':
+| ../../git/libndp/libndp.c:212:50: error: passing argument 5 of 'sendto' from incompatible pointer type [-Wincompatible-pointer-types]
+|   212 |         ret = sendto(sockfd, buf, buflen, flags, &sin6, sizeof(sin6));
+|       |                                                  ^~~~~
+|       |                                                  |
+|       |                                                  struct sockaddr_in6 *
+| In file included from ../../git/libndp/libndp.c:27:
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libndp/1.8/recipe-sysroot/usr/include/sys/socket.h:396:49: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_in6 *'
+|   396 | ssize_t sendto (int, const void *, size_t, int, const struct sockaddr *, socklen_t);
+|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [Sent to maintainer]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libndp/libndp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libndp/libndp.c b/libndp/libndp.c
+index 6314717..056df0f 100644
+--- a/libndp/libndp.c
++++ b/libndp/libndp.c
+@@ -209,7 +209,7 @@ static int mysendto6(int sockfd, void *buf, size_t buflen, int flags,
+ 	memcpy(&sin6.sin6_addr, addr, sizeof(sin6.sin6_addr));
+ 	sin6.sin6_scope_id = ifindex;
+ resend:
+-	ret = sendto(sockfd, buf, buflen, flags, &sin6, sizeof(sin6));
++	ret = sendto(sockfd, buf, buflen, flags, (struct sockaddr*)&sin6, sizeof(sin6));
+ 	if (ret == -1) {
+ 		switch(errno) {
+ 		case EINTR:
+-- 
+2.45.1
+
diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
index 4d4d3e51cd..80946317e4 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
@@ -4,6 +4,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/jpirko/libndp;branch=master;protocol=https \
+           file://0001-libndp-Fix-signature-of-sendto-API.patch \
            "
 # tag for v1.8
 SRCREV = "009ce9cd9b950ffa1f4f94c9436027b936850d0c"
-- 
2.45.1


