Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.24463.1606077476479399167
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 12:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uqCLqlUP;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id f17so3777344pge.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2020 12:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mIqgBR7bjOUTIGZs7mcOVw/Q3xpnL2pQ6m5Rx0b9qCs=;
        b=uqCLqlUPZlRgJv/UeuvG38soqVfxs5sHVMFzT4htt8X6KoGNYrnd4zcKZC0bsXjE1Z
         y+2ZNnekYxaMKKD7Puvr0iwm4LZlWeb7NsuSmPTf/d2fIyveHyCGq3yLVvqZ63FT0Dqb
         v0t0DgmcMJzD0bJ0xZMBY6CNGjIiFGHiUy/fB3ylk+kNSQaoF85Lh8yj9Oy616bsdH9u
         lPBsoasaR038Y1QlB3Qk+1pwP/zUddfACiGmRQiTnTwfI0ZuSrEj1ypRvswvj2kx0Rlp
         ClNt7LuNKpnwMSbYNshiQrRQ3HLAZs1qJjvaBLYtssjzdpB1q3vTsB03DW1070QUMdUk
         arMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mIqgBR7bjOUTIGZs7mcOVw/Q3xpnL2pQ6m5Rx0b9qCs=;
        b=NFePd791BWzWtdGq4B0AB4CLFa+tRfDv7ZxvBpfriQA4LR4W6ej2WPSo5WhVTjC6Ct
         43N2At5n8w6hVn8nuHp6EMWALSMh27gdra/6R+K/vC839mfqhcFGvm7H+65GY2GE1mZo
         mGTF5lKLPafzz9vgP89r3V0qbc8zJKytY10/HSG+MxaKUMb6aDJT5AtWq6aaWO0YtLIq
         gCIyI4WyNgK6mYMYsrkQhW8VkMx9eIcu/n8irJKeJhm1YfBVsqbAaDs8/vJHGbB68C0Z
         jW2zM3Nrmd+eaAC4a7FJCHbvrXvJC8ReFE5aZZZBOBl90dMcACaGx/cz3Jg/oekDlDIw
         vvNA==
X-Gm-Message-State: AOAM532UmekVhzRJ5PFsvUqTVpYm/ZTKbca79rS4C/KBM9RpjN2fPC6h
	SmwG2Z8koqPklFuXWWYZKYKQIAcA7XSrlg==
X-Google-Smtp-Source: ABdhPJysvAGyPxTXHc8sHn5XT3MaUBW53XEBzf6TyoWWIs1Rx55ryzaRSLe4q/hwxtxHLBHJyvgDNA==
X-Received: by 2002:a65:5944:: with SMTP id g4mr24982870pgu.446.1606077475550;
        Sun, 22 Nov 2020 12:37:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id g4sm8957166pgu.81.2020.11.22.12.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 12:37:54 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][PATCH 1/2] musl-nscd: Replace -fcommon with code patch
Date: Sun, 22 Nov 2020 12:37:50 -0800
Message-Id: <20201122203751.2535670-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch fixes the need for -fcommon

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Fix-build-under-GCC-fno-common.patch | 43 +++++++++++++++++++
 .../recipes-devtools/musl/musl-nscd_git.bb    |  6 +--
 2 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/musl/musl-nscd/0001-Fix-build-under-GCC-fno-common.patch

diff --git a/meta-oe/recipes-devtools/musl/musl-nscd/0001-Fix-build-under-GCC-fno-common.patch b/meta-oe/recipes-devtools/musl/musl-nscd/0001-Fix-build-under-GCC-fno-common.patch
new file mode 100644
index 0000000000..6fee0526d2
--- /dev/null
+++ b/meta-oe/recipes-devtools/musl/musl-nscd/0001-Fix-build-under-GCC-fno-common.patch
@@ -0,0 +1,43 @@
+From 8c0e4b7907eb577b1e5214f9a7bc75d5c3263b0a Mon Sep 17 00:00:00 2001
+From: Ariadne Conill <ariadne@dereferenced.org>
+Date: Sat, 14 Nov 2020 22:55:30 -0700
+Subject: [PATCH] Fix build under GCC -fno-common.
+
+Upstream-Status: Submitted [https://github.com/pikhq/musl-nscd/pull/11]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/modules.h | 4 ++--
+ src/main.c        | 3 +++
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/include/modules.h b/include/modules.h
+index 70c1960..e77ec58 100644
+--- a/include/modules.h
++++ b/include/modules.h
+@@ -28,7 +28,7 @@ struct mod_passwd {
+ 	link_t link;
+ };
+ 
+-list_t passwd_mods;
+-list_t group_mods;
++extern list_t passwd_mods;
++extern list_t group_mods;
+ 
+ #endif
+diff --git a/src/main.c b/src/main.c
+index c1a78bb..808ef74 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -18,6 +18,9 @@
+ #include "parse.h"
+ #include "util.h"
+ 
++list_t passwd_mods;
++list_t group_mods;
++
+ static void *get_dll(const char *service)
+ {
+ 	char *path;
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
index b03cc868fd..94a506ae71 100644
--- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -9,10 +9,10 @@ SECTION = "utils"
 
 PV = "1.0.2"
 
-CFLAGS += "-fcommon"
-
 SRCREV = "af581482a3e1059458f3c8b20a56f82807ca3bd4"
-SRC_URI = "git://github.com/pikhq/musl-nscd"
+SRC_URI = "git://github.com/pikhq/musl-nscd \
+           file://0001-Fix-build-under-GCC-fno-common.patch \
+          "
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.29.2

