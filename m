Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.21174.1610905019921915670
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aWwsNkQC;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 15so9478833pgx.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vWQyZYQjuwNvGvw75mW/dTbBzjBNgPtIbP1PWZGcZ7s=;
        b=aWwsNkQCxUp74eDgonnxeeg22sHkdbTSf9BD9JKIAmGpeGobisE2RuhZRKEdDCUpk0
         3iB1u7neoe46C+jvqNpK48OTQhy2xHH1jIjOUUDG9jLrBlLFrlH5HZfllBpbhYTwrzNt
         VfexUfx/6L73R4OtepumTtOyVcIFNLEmRvTEGwS+wVY8m3rIp7l2typ8cSqIiNkhLJxq
         M76OZEvuFPCE/PPaZRv2ZqItprfvkCSYk8olcQZ7sj8760BzoI1YsWtiyfJCuJOfPh+O
         RMosU49F3xEMYVMy0JtumTW2OmrVU54DCsbulII44rcD8OLJyBeOWFkV42P4i1f7zZw3
         hbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vWQyZYQjuwNvGvw75mW/dTbBzjBNgPtIbP1PWZGcZ7s=;
        b=L1yZqYZTx+Y9EZPy33hAAuuDfbjqzDq8RAP60TohlS99IaFKNsLxhvTwF5M3f2w136
         wGmL0I2NeTOaok1UYb4pEzJpXmgMll8fxQ5loaaX7KVJUUTxCsAJUqqzDTwn+cuO6KNY
         bL8qExUBDFo4yU0DrV9Zc5jg0dWFrMogmR2waKZOxnOm9XdoEtXmX8XLFm5hjhtQfVwk
         UT5+ca4OYhTqOiaYn+NKsLI+RyqmPzFG9YSDxRiXNfj0OAKkqkNLLRfbaMy/vbl/uuda
         1A9Pkrgpc0CDJrFu6W0M3PwvqW/d/bB4T1nu6DdL6BfBktvOobHnhA+eXWZoyqFE+hdj
         L9+w==
X-Gm-Message-State: AOAM533OwprFFhN35+gexgQ8bRFvLEOSoQjNroyQXnnqtI47Vtory1fw
	/UjHm4zCE0vir8mnufDJeVh6GhjVNgNwsA==
X-Google-Smtp-Source: ABdhPJz5jDBYqM/ypFj/JMt4VRMYFkM03RUrBmB8LjhatloR/O9FLYcURWjBw8rWCajeXhbN+SvbQg==
X-Received: by 2002:aa7:8d8b:0:b029:19e:1081:77af with SMTP id i11-20020aa78d8b0000b029019e108177afmr22372306pfr.78.1610905019332;
        Sun, 17 Jan 2021 09:36:59 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:58 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 19/31] spdlog: Fix recipe so other recipes can use spdlog with external fmt.
Date: Sun, 17 Jan 2021 09:36:24 -0800
Message-Id: <243f73385af8dbdc3fecd49627c56d0df54e36a6.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Philip Balister <philip@balister.org>

* I enabled the shared library option to eliminate linker issues
   with a package that used spdlog.
 * Edited the tweak.h file so programs use the external fmt library
   headers, not the oners in spdlog.

Signed-off-by: Philip Balister <philip@opensdr.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 010cd128e7ae8258f83c03195caa605bbce3e76b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1-Enable-use-of-external-fmt-library.patch | 26 +++++++++++++++++++
 .../recipes-support/spdlog/spdlog_1.8.1.bb    |  5 ++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch

diff --git a/meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch b/meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch
new file mode 100644
index 0000000000..b62b379a76
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
index 7d28fff5e3..34937c83c8 100644
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
2.17.1

