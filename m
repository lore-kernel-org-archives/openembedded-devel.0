Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.2919.1607027093749327765
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 12:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pe2d/Qs6;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: philip.balister@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id u4so3397628qkk.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 12:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=hYz4Oubt9rX0F0BYB+NxebKU4ABrghDxTcY9HNDaEbk=;
        b=Pe2d/Qs6A/JZkeDTqGEi9oNFeUntW7vQodAYVbVeOtAwgwjlEckzMAK4CpfBDKJ7ev
         8kLhxzLLYFZNKrTA0VuRvzRgfGxl42Yq/cMCcAwDlK0lIYMVODggdf7wfOObnJK4PaCc
         Ep2kuzubUbAM0dJn6EAjODZE+WExWr1jHssyN3uGtFSgkrHZgoDkchMkIW1KHGsSVtbk
         Kp8SzS8Gpvc+J9mOmd4pILOrres63x32B0ySBkUn9VFqpKO6KESZp3X5P28OOvjB+DVJ
         LoJtQnaNIOx8nU9h6PEeS1pnWdkOO8riVBJeCI3TatUkMnZoKk0Onlchn1y/3HgXFaoC
         JwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=hYz4Oubt9rX0F0BYB+NxebKU4ABrghDxTcY9HNDaEbk=;
        b=e8V94/pxdzsxPgcyEVI8p8x/3dNVzpT0veIv1BnrECfV1EZPOTXeVBfl/h/cM9mL5m
         DGkLfKoDmrnW9ZBjjaXkwn2S8MRatBLL55KdP/GiOYkByLu7y0qrmg5bR69buyRE3FvF
         Ygev9yY9I4qjQJVqpqHq1IHlXaiy4gxCmsxg7gQ+dfGO3BvChrvbT2qGSDkepB88hxzQ
         152CFVpUZtvfgLHcfQUtdmciD7kWQDLOHxdkqj5XTONpc5ApAo7X6QnuCP9PEvfzXcPF
         bX0iN6eaZ+sPiYnCIBvfGhkhY1MVSZcaUMOGul5m4N3BAWJsYH312l8xFClb9b3kedpK
         qihQ==
X-Gm-Message-State: AOAM531x+oRiclNiO4EamtsRpn/bOhrRl4S8qee7FIeQj2DzElk+9Pdy
	T+jA+oQfbKO7ENCuPS8aLZiXgwt4Fh5CUw==
X-Google-Smtp-Source: ABdhPJxvZd4ytZDes+hlAxXFTyTeZlRdRwEOvxV45gdaebXHHDlkMaocRxLEYg46jR4yv9ukwY4cgA==
X-Received: by 2002:a37:404d:: with SMTP id n74mr4850284qka.25.1607027092482;
        Thu, 03 Dec 2020 12:24:52 -0800 (PST)
Return-Path: <philip.balister@gmail.com>
Received: from prague.hsd1.va.comcast.net ([2601:5c0:c200:1421:b727:f6cb:1b56:c419])
        by smtp.gmail.com with ESMTPSA id f59sm2017774qtd.84.2020.12.03.12.24.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 12:24:51 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: "Philip Balister" <philip@balister.org>
X-Google-Original-From: Philip Balister <philip@opensdr.com>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe][PATCHv2] spdlog: Fix recipe so other recipes can use spdlog with external fmt.
Date: Thu,  3 Dec 2020 15:24:48 -0500
Message-Id: <20201203202448.3031-1-philip@opensdr.com>
X-Mailer: git-send-email 2.13.6

 * I enabled the shared library option to eliminate linker issues
   with a package that used spdlog.
 * Edited the tweak.h file so programs use the external fmt library
   headers, not the oners in spdlog.

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 .../0001-Enable-use-of-external-fmt-library.patch  | 26 ++++++++++++++++++++++
 meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb     |  5 +++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch

diff --git a/meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch b/meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch
new file mode 100644
index 000000000..b62b379a7
--- /dev/null
+++ b/meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch
@@ -0,0 +1,26 @@
+From 23ce2fe30e7485d48e2864bdd8276119fbb8cbd1 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@balister.org>
+Date: Thu, 3 Dec 2020 09:22:50 -0500
+Subject: [PATCH] Enable use of external fmt library.
+
+Signed-off-by: Philip Balister <philip@balister.org>
+---
+ include/spdlog/tweakme.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/spdlog/tweakme.h b/include/spdlog/tweakme.h
+index 244bc3b3..2594a6fe 100644
+--- a/include/spdlog/tweakme.h
++++ b/include/spdlog/tweakme.h
+@@ -63,7 +63,7 @@
+ // In this case spdlog will try to include <fmt/format.h> so set your -I flag
+ // accordingly.
+ //
+-// #define SPDLOG_FMT_EXTERNAL
++#define SPDLOG_FMT_EXTERNAL
+ ///////////////////////////////////////////////////////////////////////////////
+ 
+ ///////////////////////////////////////////////////////////////////////////////
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb b/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
index 7d28fff5e..34937c83c 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
@@ -4,7 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRCREV = "cbe9448650176797739dbab13961ef4c07f4290f"
-SRC_URI = "git://github.com/gabime/spdlog.git;protocol=git;branch=v1.x;"
+SRC_URI = "git://github.com/gabime/spdlog.git;protocol=git;branch=v1.x; \
+           file://0001-Enable-use-of-external-fmt-library.patch"
 
 DEPENDS += "fmt"
 
@@ -12,7 +13,7 @@ S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
 # no need to build example&text&benchmarks on pure yocto
-EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
+EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
 
 inherit cmake
 
-- 
2.13.6

