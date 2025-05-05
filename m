Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38620C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 14:33:08 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.51578.1746455581468920125
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 07:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=T3NEVftV;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so612773566b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1746455579; x=1747060379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QT/tmAS1xbyBLHXgeekXIE5YAEJKNlqHOQFl5p4MYQI=;
        b=T3NEVftVFXLXYUqBvSfW49OSgnEbsFxyfzskhXQC9rpuXIkMA82nSFtAENKFltpJRu
         kPjSx8JquQQlPwwtmY5XenssxpJd0dJugRxGEJlQzbVbFrWsROGu15Og1VXAQa090s20
         ZHyNHpB+FCcLIxyWiSP9REwM73BQwE/8So5z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455579; x=1747060379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QT/tmAS1xbyBLHXgeekXIE5YAEJKNlqHOQFl5p4MYQI=;
        b=vp4HyvmqozUwD9Mn0asZi2HZUW0eMI1Dbc1OgQJIHOxb3SkHkxdHUeQKVeMHHaOxfn
         P4/fBjW/OvRXlufCvzIoD4Rw06AKLCQcUMBjCIJK7lDI7WjsJYXe9O5Pe9ndR+MRltET
         7+TfoLojNukXL8a/wlruxJuLr7tFMkzhtQvICO9susfY8MMmLxs/9e9lhvDiw4W4G6Av
         YfbplYA/zyFDAZypQhSzmpEfYRZv771pPCJytPuGju/UVKWxupHpwez2HvVpuv7ZNYlP
         7wEllVlgq4OOYx+toAoXHE+04mGLHOf7ISGCKMn7cuKGt3F/0ejuOm6iz5KXHZBNjEGM
         b5qw==
X-Gm-Message-State: AOJu0Yy+5qW99JGSXbdMNaS7yNJ1hxXy/otppq+/vQfLOVsI4LKQLRrR
	0AvCSclNEcNqgKIiXdpHoXqbgwYHFc8dkjiLgg/G3E/bXaKGhv6ASVAH2kUmiCZEfGctDJDwDoK
	y
X-Gm-Gg: ASbGncuD4nZbJW+xrNcAQlLqiMHgP94TjzIHQh1jUy7GOQmMYsRtUyfgHU0J7gNfpsu
	7nUygNf4gp1kT3Q+g/vuJYp2zJY6xqBt2PLBCPXbKeej4ZGUNp8/Yl0kCW/+MmSWm4EDP1ZaYzy
	EdxiPL6s+gHr3v61KZbeUUP061E3BmBB35Yc+y5DY/T3cU7UyHRh5CmiVqFjdPuQN83zxbitARy
	A+foQ5KnMD1KDmToF1R76pEx02csnWppAV7Bf7Q+mj4pIInYxJmK+ouGiDNFUe+iKmtBq8i8jOe
	7KfgCJbK6MroRBMPFjblSXaidChMjft9DLsdx55tlqTNUDsillMPRrI=
X-Google-Smtp-Source: AGHT+IHD5Ax2IZ83OXaiU6cV55ag29h9MMN7kwyn4ILGTa4k7VZVehTD0cL0iC1Bbjw1/zakZfdg8w==
X-Received: by 2002:a17:907:2d20:b0:ace:37d6:a5ce with SMTP id a640c23a62f3a-ad19065651amr719306966b.19.1746455578022;
        Mon, 05 May 2025 07:32:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895400fesm495312966b.167.2025.05.05.07.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:32:57 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH] x265: Fix error: 'uint8_t'
Date: Mon,  5 May 2025 17:32:55 +0300
Message-Id: <20250505143255.1548816-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 14:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117316

Include cstdint in json11.cpp Fixes:

json11.cpp:101:32: error: 'uint8_t' does not name a type

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-json11.cpp-Include-cstdint.patch     | 33 +++++++++++++++++++
 .../recipes-multimedia/x265/x265_4.1.bb       |  5 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch

diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
new file mode 100644
index 0000000000..38a5a319c7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
@@ -0,0 +1,33 @@
+From 6cbd417be3f6bcbda77464db6a4d83cef3df8904 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 5 May 2025 14:08:36 +0000
+Subject: [PATCH] json11.cpp: Include cstdint
+
+Fixes:
+
+json11.cpp:101:32: error: 'uint8_t' does not name a type
+
+This work was sponsored by GOVCERT.LU.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ dynamicHDR10/json11/json11.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dynamicHDR10/json11/json11.cpp b/dynamicHDR10/json11/json11.cpp
+index 7625777..74f990a 100644
+--- a/dynamicHDR10/json11/json11.cpp
++++ b/dynamicHDR10/json11/json11.cpp
+@@ -25,6 +25,7 @@
+ #include <cstdlib>
+ #include <cstdio>
+ #include <limits>
++#include <cstdint>
+ 
+ #if _MSC_VER
+ #pragma warning(disable: 4510) //const member cannot be default initialized
+-- 
+2.39.5
+
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
index 23d6342d26..ae0f7758c1 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
 
 DEPENDS = "nasm-native gnutls zlib libpcre numactl"
 
-SRC_URI = "https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz"
+SRC_URI = " \
+    https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz \
+    file://0001-json11.cpp-Include-cstdint.patch \
+"
 SRC_URI[sha256sum] = "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
 S = "${WORKDIR}/x265_${PV}/source"
 
-- 
2.39.5


