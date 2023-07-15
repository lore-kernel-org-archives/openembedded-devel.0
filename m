Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA28BC001B0
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 20:17:17 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.4672.1689452232526252974
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jul 2023 13:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QW2WNda5;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-668711086f4so1900214b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 13:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689452232; x=1692044232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewRx8B4FA9rcPs+SYOBrk/eZIHKRsZMvu1k17/vui+Y=;
        b=QW2WNda5A3D5ymHS9CqO6Fbr0IYDJghlX+FTuNWpXXXt5iBrnvOTdnBfHjKUriwEM3
         pkDFvriTSXnSUTcei37+opBv2jMUJaJ2Px5ow6nV/w7v9ffGBi/Kdt4Sr7GGlAxTSY3L
         9uWSeh3F5me9gzpS2115r1/2H025qyTKmkimOeznsopTcWuqYm0NX2jnSXWGtysqo+Pc
         dxYQmf+r2JhkvdQQ2qN7NGcIk7CUgtD9wsah5qqFuZeZAYFdqw3yqFN2TU0DpNFXVN6S
         W2wkFdhjzYnul/mgT14xbs80mTmQxT3sQOnB9iaa/X1R6pNVNNHRM4j02TypZiZEPKJJ
         3mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689452232; x=1692044232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewRx8B4FA9rcPs+SYOBrk/eZIHKRsZMvu1k17/vui+Y=;
        b=jIf2209661XigRKi1nZpvam0ulORUUG12Urbo0WwpAYSM5LEBthPUvHhLSxd+F6kdj
         olN/7EJwc5ZTv8c6t1/TvLpBIa/SgtQf6FDPG9o3kLWHqgIA6l+knS+waZ7Oa0CbQdZY
         LVnJqS5xb7BjRMByDY8aWsFLKyCWwg9tu0ryhuPfImPlPPtKnev45D8YcWAgu+dyfuLO
         fcwqZ5FasnxWf4EGC/IWw23vyKthYJh0RhpG2TmcsoWf3BfnfIPgAnNuRLmFYzfIoqkL
         3JevrvsbFJooduoWlY3L0cZ2Z/+qjWBaRY0WsrvOmZ+Bgx9jIUK3hGd471LsuxPmliR2
         bOjw==
X-Gm-Message-State: ABy/qLanfMhNGvgmh0yEaipC1L7abXoQSzcJsDTweqUEoo5OgxO7jrq5
	1xcpQlh0pmmrLF+dFZ7VwpcsrHl6G1U=
X-Google-Smtp-Source: APBJJlGc71HO8Oj5eoWNECG30x9TmbyxyU7TCmBrgDjoZA3QcOW10Jpr6QVick6QFEQhk6cCo63LYQ==
X-Received: by 2002:a05:6a20:1446:b0:126:2bb7:d660 with SMTP id a6-20020a056a20144600b001262bb7d660mr7661892pzi.7.1689452231415;
        Sat, 15 Jul 2023 13:17:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1069])
        by smtp.gmail.com with ESMTPSA id s18-20020a63a312000000b005579f12a238sm9738490pge.86.2023.07.15.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 13:17:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] dlm: Fix build with linux kernel 6.4+
Date: Sat, 15 Jul 2023 13:17:08 -0700
Message-ID: <20230715201708.3142877-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 20:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103872

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dlm/dlm/0001-Disable-annobin-plugin.patch | 31 ++++++++++++++++
 ...ld-remove-unnecessary-header-include.patch | 35 +++++++++++++++++++
 .../recipes-extended/dlm/dlm_4.2.0.bb         |  4 +++
 3 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-Disable-annobin-plugin.patch
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-dlm_controld-remove-unnecessary-header-include.patch

diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-Disable-annobin-plugin.patch b/meta-networking/recipes-extended/dlm/dlm/0001-Disable-annobin-plugin.patch
new file mode 100644
index 0000000000..6302829267
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm/0001-Disable-annobin-plugin.patch
@@ -0,0 +1,31 @@
+From 5a0799d0bacc0cf93e15febdac7d8c50b21e7234 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2023 13:13:12 -0700
+Subject: [PATCH] Disable annobin plugin
+
+OE gcc does not build this plugin, moreover there are non gcc compilers
+which can be used with OE as well e.g. clang which might not have it
+either
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dlm_controld/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
+index 8802d88..0380ec9 100644
+--- a/dlm_controld/Makefile
++++ b/dlm_controld/Makefile
+@@ -47,7 +47,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
+ 
+ BIN_CFLAGS += $(CFLAGS) -fPIE -DPIE
+ BIN_CFLAGS += -I../include -I../libdlm
+-LIB_CFLAGS += $(CFLAGS) -fPIC -fplugin=annobin
++LIB_CFLAGS += $(CFLAGS) -fPIC
+ 
+ BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,now -pie
+ BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum -luuid
+-- 
+2.41.0
+
diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-dlm_controld-remove-unnecessary-header-include.patch b/meta-networking/recipes-extended/dlm/dlm/0001-dlm_controld-remove-unnecessary-header-include.patch
new file mode 100644
index 0000000000..55efcea184
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm/0001-dlm_controld-remove-unnecessary-header-include.patch
@@ -0,0 +1,35 @@
+From 4c40289eb9e47cfd272a8cc402fd2ddb29e2a3dc Mon Sep 17 00:00:00 2001
+From: Alexander Aring <aahringo@redhat.com>
+Date: Wed, 24 May 2023 13:50:59 +0000
+Subject: [PATCH] dlm_controld: remove unnecessary header include
+
+The timewarn netlink functionality got dropped and will be removed by
+kernel v6.4. The user space part was already dropped by commit 34ea31e7
+("controld: remove timewarn handling"). This is just a left over of this
+commit. Recent builds fails now because the UAPI header in the Linux
+kernel was removed. This means older dlm sources cannot be build with
+newer kernel-headers, however it is not recommended to use older dlm
+sources and all existing users should upgrade anyway.
+
+Upstream-Status: Backport [https://pagure.io/dlm/c/ddbba6608896f81bfce8f8edf3d0f507714cfc43?branch=main]
+Reported-by: Fabio M. Di Nitto <fdinitto@redhat.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dlm_controld/main.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/dlm_controld/main.c b/dlm_controld/main.c
+index 7cf6348..e70e96a 100644
+--- a/dlm_controld/main.c
++++ b/dlm_controld/main.c
+@@ -12,7 +12,6 @@
+ #include <pthread.h>
+ #include <linux/netlink.h>
+ #include <linux/genetlink.h>
+-#include <linux/dlm_netlink.h>
+ #include <uuid/uuid.h>
+ 
+ #ifdef USE_SD_NOTIFY
+-- 
+2.41.0
+
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
index 8cfb27a903..5073192763 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
@@ -8,6 +8,8 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 SRC_URI = "https://pagure.io/dlm/archive/dlm-${PV}/dlm-dlm-${PV}.tar.gz \
            file://0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch \
            file://0001-make-Replace-cp-a-with-mode-preserving-options.patch \
+           file://0001-dlm_controld-remove-unnecessary-header-include.patch \
+           file://0001-Disable-annobin-plugin.patch \
            "
 
 SRC_URI[sha256sum] = "90237e18af7422ac15fc756899b3bb6932597b13342296de8e0e120e6d8729ab"
@@ -33,6 +35,8 @@ SYSTEMD_AUTO_ENABLE = "enable"
 
 export EXTRA_OEMAKE = ""
 
+PARALLEL_MAKE = ""
+
 DONTBUILD = "${@bb.utils.contains('PACKAGECONFIG', 'pacemaker', '', 'fence', d)}"
 
 do_compile:prepend:toolchain-clang() {
-- 
2.41.0


