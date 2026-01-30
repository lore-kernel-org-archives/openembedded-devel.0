Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC090E6BF29
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 16:25:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14463.1769790311823943239
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 08:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TGII/OGC;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb2314f52so1431290f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769790310; x=1770395110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+ALep1P1xbjxa/bcf64Wc0JVRmzuguHySljobM5fOM=;
        b=TGII/OGC/gLGTC0F5oD39vDDIuAMAX60qPj7+aHTtnRYSrLZTt4+WGxI9aA36TyoeO
         sPa3SIkn6VuyZKguHfZUqVQvtmxjPZWNCMDHRwcABAFvj385qaSRwwuHynyt9SbBcwjT
         Nlu6LWPTQ3xvCeDTWz/9VAvY0nRUUsdhj9zw3pPlxKrWcbvVWAC851kgNBAEyTaUgfdk
         frlQ+7K8ptH2IZQj+bs6ntKXBaakiao6nb05mHZHkTjb/bEn9f6fL/d8A6jMlUOFaZ/Y
         Rg3NrPxQ6y3T9cMyIddNl5pwcvPvuqhyL4Q/PDYWtg/ijdtRPMBX26pRYwjdt/x04yp6
         Rufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769790310; x=1770395110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D+ALep1P1xbjxa/bcf64Wc0JVRmzuguHySljobM5fOM=;
        b=TC6qVEkwpkQWuO6YksHERQb2GQmJtZaKW3Jr3859cXU/RiR3/gwYZ+g0S1VKI9OKkQ
         tGM4g3GH+BJvt2BkU45UK3F4puUXx/8OTAGv2ZOqqCHknLDAee/AJbVWSgg6STTcK6hi
         cKVbN9MffAtKZZNl2jwEvBipT+tGlNflQ+qdnZwutGvacSrqxUO3GeSjoTsto/BkPs2s
         sBvr9KJsPsLK7TWDXMhHHN9WYZZCFtZYQIRDl6hjvfW07GJLvFlLcayjaQXqj37g657m
         /3Ox0W8OyGf5++lWVBB6IAhtpg9uPOE+ZEbSxupObb4DZjELcb8W8ktlYHiuO+H8PDuE
         2SfQ==
X-Gm-Message-State: AOJu0YwodkVSfspT9VMFXmpJil/f76LuEXcHaB/H6laUMjvE9wSoxeen
	CT/WbKsKLh1JWce/UikvtdJGfozX0+U2kfMAopLYulboscQxU7HkF06LJ9raiw==
X-Gm-Gg: AZuq6aI/HsDVfiHZ6RHoRoXwDUS7mHQJevtfvacqOihkYgILqu3MiJ3bxliVrIjTxPB
	3i0OBBu68sQtORGMxlhMV32qQnPe5pYFC6rec1eA6kIegULn3gLAdf957oZ8pVZ+eSt1o3/WTbL
	2CzD3MR4I3NO28YG9U3GGDGRy2QVk3EGZ7JTvy1z7XHbsBb25U+Ut4Zjkyoey6k69graDRyN5gx
	J3Zji82a38vBaKkE6fdswD6pefcaUY2tQXH9CNkckbhgC4HlLNkdjVpFqxFRvyGPMzy5/eONl3H
	4a9yzPKDG+Rgh2CM7uxvhTXQ7CBEPjAtmbUV8kuK7bWsEwk/covk/VwafFdJzV7oKyfODNwedSX
	5e5y9x7ABAYIp5JYIrOzCHwTGNNnkzUDAuaM5/Qci0kuRjaSsfGjpWdEMfq1WLHhQuERKEwx1+X
	eSm4mhjeHEHAS9YbHiljM=
X-Received: by 2002:a5d:64c9:0:b0:432:c092:ee50 with SMTP id ffacd0b85a97d-435f3aaf7acmr5656421f8f.50.1769790310053;
        Fri, 30 Jan 2026 08:25:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm23625810f8f.41.2026.01.30.08.25.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:25:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] paho-mqtt-c: upgrade 1.3.14 -> 1.3.15
Date: Fri, 30 Jan 2026 17:25:06 +0100
Message-ID: <20260130162508.664574-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130162508.664574-1-skandigraun@gmail.com>
References: <20260130162508.664574-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 16:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124014

Drop patch to fix gcc15 compatibility - the problem has been solved by upstream.

Changelog:
- Update getaddrinfo options to support IPv6 hostname resolution
- Removed unnecessary _WIN64 conditional checks
- Fixed condition variable timed wait
- Support tls:// prefix

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...rror-due-to-bool-keyword-with-gcc-15.patch | 37 -------------------
 ...mqtt-c_1.3.14.bb => paho-mqtt-c_1.3.15.bb} |  5 +--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.14.bb => paho-mqtt-c_1.3.15.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch
deleted file mode 100644
index 4215f698c7..0000000000
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 02fa96d0d59211e64483273e5253ca45c4395154 Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Wed, 9 Apr 2025 19:05:55 +0900
-Subject: [PATCH] Fix build error due to bool keyword with gcc-15
-
-* gcc-15 uses gnu23 for c.
-  'bool' is a keyword.
-TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:22: error: 'bool' cannot be defined via 'typedef'
-   31 | typedef unsigned int bool;
-      |                      ^~~~
-TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:22: note: 'bool' is a keyword with '-std=c23' onwards
-TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:1: warning: useless type name in empty declaration
-   31 | typedef unsigned int bool;
-      | ^~~~~~~
-
-Upstream-Status: Submitted [https://github.com/eclipse-paho/paho.mqtt.c/pull/1595]
-Signed-off-by: mark.yang <mark.yang@lge.com>
-Signed-off-by: markyang92 <pllpokko@alumni.kaist.ac.kr>
-
----
- src/MQTTPacket.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/MQTTPacket.h b/src/MQTTPacket.h
-index fd384ae9..0c64a0f4 100644
---- a/src/MQTTPacket.h
-+++ b/src/MQTTPacket.h
-@@ -28,7 +28,9 @@
- #include "LinkedList.h"
- #include "Clients.h"
- 
-+#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
- typedef unsigned int bool;
-+#endif
- typedef void* (*pf)(int, unsigned char, char*, size_t);
- 
- #include "MQTTProperties.h"
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.15.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.15.bb
index ad6637ed88..64b9de3848 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.15.bb
@@ -11,11 +11,10 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = " \
-    git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master \
-    file://0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch \
+    git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master;tag=v${PV} \
 "
 
-SRCREV = "2150ba29d9df24ad1733c460eb099f292af84ee5"
+SRCREV = "62782406bcf511ee8e22bc34e826f8c6b8254c7c"
 
 DEPENDS = "openssl"
 

