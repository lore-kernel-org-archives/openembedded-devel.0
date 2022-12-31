Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C3BC3DA7D
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 22:27:24 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.52685.1672525642350573150
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 14:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FuTOlc21;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id n12so13136422pjp.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 14:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bHJcM5TZfQuTVTtmC2zik5RlkNhgDwa39xEcqWB/cY=;
        b=FuTOlc21i/029kYYwYrPSmuw+6KdOxzmqnRDDHo/AnjGupQf/1lTmVhm9xAWp1iOOZ
         +v4R3UAO9s+vz1OGxYjWyBIfsLDYm6YTVLhr4HPJJk7OQTuPHAFiqupABb4/hnZrXuNr
         9TY2laLpy2BbXsSV068rbg0kevTa5ggVE6q89zhoGOUAIPKelq2XY5UbgBtNOvUEi1Kn
         8RPfWVBxhiyF4Ef3g0z4k+8CJWWWqrnFLhRw+F0pMu/eB5RNrzC1Jnk+dVcJgjAY4Kdt
         vHYfeyBX8xI+OBcltfYI/36uDtp/8SjIcGnhMaWqflOIZPRXwtSz05XRbIhEnBSqtubm
         +lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bHJcM5TZfQuTVTtmC2zik5RlkNhgDwa39xEcqWB/cY=;
        b=cpD3PqoSecPaoCbwKxs3hx8o+HNRiJX8N4001/Sfa3tTlGYHo5eErZBIDTnwm/zt6C
         M3/xhSvXn8XJO3p8/EdkHcrN6h9heU7GjL9X32lDOCnQaaYlP0Mq3pSq1VSFDWE/7r58
         aBC6/XHVsDauzJLYfRJHCTigD2mIZMZzIPNik5tl0ZTIQlJV1qB5e2OZ/R4CJYfSc26a
         cXJvwCnnH4AYkBp+OxL5GW1qF5tt0C4lHWNQ+UUaPfSJOQ9SMpMB9Hsd7QkBJCEUJMKU
         +2Kstafm90PcB6ORx2kzR7z9ogd6bUtATv7x7Jvuy8X5oKailMM6pv1uvQSdvNktLhik
         aHVQ==
X-Gm-Message-State: AFqh2kpulzGBISod1jwjDKEoo2Os3MutDt7X0q7YTj7FilwDmdKPSJaJ
	LtbFJz3zDrYh0WTnbx3ImE0lDGG93As=
X-Google-Smtp-Source: AMrXdXtrRalQ0w4Z+9bnSDP0t+NYGBDbrDDOoMkrx8O+gEOnrP+FIvnc2FrocCtSAGB56hBdkUg1iQ==
X-Received: by 2002:a17:90a:f8b:b0:223:f235:bc6 with SMTP id 11-20020a17090a0f8b00b00223f2350bc6mr38156144pjz.2.1672525641288;
        Sat, 31 Dec 2022 14:27:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id c21-20020a17090aa61500b00219463262desm14671427pjq.39.2022.12.31.14.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 14:27:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] spdlog: Do not use LFS64 functions with musl
Date: Sat, 31 Dec 2022 14:27:17 -0800
Message-Id: <20221231222718.1455310-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 22:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100326

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-use-LFS64-functions-on-linux-musl.patch | 30 +++++++++++++++++++
 .../recipes-support/spdlog/spdlog_1.11.0.bb   |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/spdlog/spdlog/0001-Do-not-use-LFS64-functions-on-linux-musl.patch

diff --git a/meta-oe/recipes-support/spdlog/spdlog/0001-Do-not-use-LFS64-functions-on-linux-musl.patch b/meta-oe/recipes-support/spdlog/spdlog/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
new file mode 100644
index 0000000000..b997389aa2
--- /dev/null
+++ b/meta-oe/recipes-support/spdlog/spdlog/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
@@ -0,0 +1,30 @@
+From ce7a593e74c8e0c2ece15c73e7614d4f13a19a53 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Dec 2022 13:04:08 -0800
+Subject: [PATCH] Do not use LFS64 functions on linux/musl
+
+On musl, off_t is 64bit always ( even on 32bit platforms ), therefore using
+LFS64 funcitons is not needed on such platforms. Moreover, musl has stopped
+providing aliases for these functions [1] which means it wont compile on
+newer musl systems. Therefore only use it on 32bit glibc/linux platforms
+and exclude musl like cygwin or OSX
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=246f1c811448f37a44b41cd8df8d0ef9736d95f4
+
+Upstream-Status: Submitted [https://github.com/gabime/spdlog/pull/2589]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/spdlog/details/os.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- a/include/spdlog/details/os-inl.h
++++ b/include/spdlog/details/os-inl.h
+@@ -237,7 +237,7 @@ SPDLOG_INLINE size_t filesize(FILE *f)
+     int fd = ::fileno(f);
+ #    endif
+ // 64 bits(but not in osx or cygwin, where fstat64 is deprecated)
+-#    if (defined(__linux__) || defined(__sun) || defined(_AIX)) && (defined(__LP64__) || defined(_LP64))
++#    if ((defined(__linux__) && defined(__GLIBC__)) || defined(__sun) || defined(_AIX)) && (defined(__LP64__) || defined(_LP64))
+     struct stat64 st;
+     if (::fstat64(fd, &st) == 0)
+     {
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
index 2c71331ffa..ec985fb039 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
@@ -4,7 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRCREV = "ad0e89cbfb4d0c1ce4d097e134eb7be67baebb36"
-SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
+SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x \
+           file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch \
+           "
 
 DEPENDS += "fmt"
 
-- 
2.39.0


