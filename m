Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AE1C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 05:39:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.8145.1676266792256238207
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 21:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ny5BkCrs;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id m2so12382786plg.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 21:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngBOXA81ms3LuulyVJ3E044W/Ri/nkd8imCKnx3AYgU=;
        b=Ny5BkCrsuir5N3JKJEFuoMuWvcM5L7X/1/rCJ/XOVmIL5WNo45Ntzmib7HglahMaif
         NQAOIfM6eSlRtrQafTmjZYWmTHXzGddEO3jmcYO72nHMwZLlgc+8+NaM0/tf2TnW29Hc
         yef2fH5WfbUL3YMLatN2JYxOFWYJWEv6S94rwZ0wMjQrD2yNWKvQSeCuBdE9PYoXEIna
         yxzlPNmeGda4lUtxSeTToVzw/5SmKGfSynyGuYTVRu0dy2NR8sQ9EJkRFjoDkAnjsDq+
         4l+RMVNIoOEpPzji2jAqLRTSY8Yr8Ftf9+pw0fSzxru3MTFluzfdy1L/lyAGfHr35yE6
         woeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngBOXA81ms3LuulyVJ3E044W/Ri/nkd8imCKnx3AYgU=;
        b=JTvEW2vY2koLjDTNvEaYmFN1KT2fCKBYBp+vhJXpiHlrxpmTxVBj3L/uKEEehJt+Br
         xzVF+B/V+ooEhhDB9UDbFdazTqHGl5330GIZtE02PhoJuakc4X/yNAo0jidpvW4JeAiZ
         wbcM2SfcRozBDOWzRa9AqrCZ79WsLGzRQlutZGS+krKR2QrUWZLkhvZevcNRnUAdVxvT
         orjbQhtdlqwzy552UMHA4jfAE/Y4jURQvTF8nOJ94dIltN8ZhVtyogcUx6omVm5f6B4e
         ewMKMHpDPhuu85KmZ0sfCKCD14R/nf4YpiUi4PNYAdN9zjij59s4sqXlN7tJbvH0dEbZ
         M5DA==
X-Gm-Message-State: AO0yUKU2SLMp+EYGGxGuAF/GDT1iqIPwXrf7iTsl1g/f5jDitw+/LjoJ
	L6vqj7hxA85n0vXU5uVGL1HNd05JyOs=
X-Google-Smtp-Source: AK7set9omRRHW16mafQDtt/iuqqu0wh0rP3tz/l0veqdovv4nebLQW1tv00+XBCSKk/iC2ayzILeUQ==
X-Received: by 2002:a05:6a20:938f:b0:c0:d39f:d1ad with SMTP id x15-20020a056a20938f00b000c0d39fd1admr27455429pzh.38.1676266791302;
        Sun, 12 Feb 2023 21:39:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::789d])
        by smtp.gmail.com with ESMTPSA id ja15-20020a170902efcf00b0019607547f29sm7179364plb.304.2023.02.12.21.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 21:39:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-grpcio: Add missing include for close/open APIs
Date: Sun, 12 Feb 2023 21:39:49 -0800
Message-Id: <20230213053949.137181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 05:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101061

This is found with clang16 stricter warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...clude-unistd.h-for-open-close-C-APIs.patch | 27 +++++++++++++++++++
 .../python/python3-grpcio_1.51.1.bb           |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
new file mode 100644
index 0000000000..918c6c8601
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
@@ -0,0 +1,27 @@
+From 4432b9a296c9c287dfe281b4d464dfd03e4eb721 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 12 Feb 2023 21:25:04 -0800
+Subject: [PATCH] zlib: Include unistd.h for open/close C APIs
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/zlib/gzguts.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/third_party/zlib/gzguts.h b/third_party/zlib/gzguts.h
+index 57faf37..3c700c2 100644
+--- a/third_party/zlib/gzguts.h
++++ b/third_party/zlib/gzguts.h
+@@ -19,6 +19,7 @@
+ #endif
+ 
+ #include <stdio.h>
++#include <unistd.h>
+ #include "zlib.h"
+ #ifdef STDC
+ #  include <string.h>
+-- 
+2.39.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
index 3d45c56b0a..7a9b7d8018 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
@@ -12,6 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-Include-missing-cstdint-header.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
+                                file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
 "
 SRC_URI[sha256sum] = "e6dfc2b6567b1c261739b43d9c59d201c1b89e017afd9e684d85aa7a186c9f7a"
 
-- 
2.39.1


