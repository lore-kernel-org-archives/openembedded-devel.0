Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB88C67868
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.8756.1661843659252808778
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TeSNUDQY;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id p18so10243300plr.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=OQpUaL/dAdoLgqXovHbgQqLY8UH5hoSMCmxRHbHrXTI=;
        b=TeSNUDQYU4o0u7TnJZBZLJQIqip5MGZnKLRBeuwOZl9FvJoXS9HmseTZk5z3wd2EeP
         dpiJKZqGv1tcRC63CgBd0NFqWioE4naQ9LBakeGxWzZA5jgEXoTVItdPRfhW2DcvD6VW
         e07wwlCWdsKSHjRlehlYu0pMd7wicanb1FRts1IZjdKOEicHX0L/wSvmm2DarA7Mg97U
         SKL47AIzSAovQoACUBKT1IhoYeIRXXLvnUX3dD9viRHB5qzczulKOsBPHCvrseaCAwkP
         VPFxIwkLUSeJ25h6mjnE06Nr+R0R6t/Vn8OBcrPHz3HqgwUOdYerZ3BzXRjXOR+3+rf0
         irNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=OQpUaL/dAdoLgqXovHbgQqLY8UH5hoSMCmxRHbHrXTI=;
        b=cOwglGzDBDC5j/bY8UvT1CCe7p6RkmpK5j94qszoe78x4PzlKe+OJqGq1pSJUSFzPf
         6q2QX5+PEK8+UOt67k3xbXPdRPtWDHM3UaBFLXfqzeMenRwqNOWVbKKwHTC/PWaODuwn
         vN/Tk0WIZBWSFzgfe1ceDqKCoUxkeedf/FR9UJoSUEpBVhkcDx8fJ97CmcnbeNBstwir
         ejXztIEu9tP3eGLIU6JARSfb732XL0irECI/kDJwH4naIlt4PKAU7PrmmtHHDeN/c4iU
         TfULTxOGw+oJELoO2HMbRF3g3EmuAgMbpZ57aQ+5ouc6V+OVKw/aKgZw5UE4fXAyTHlO
         9sSg==
X-Gm-Message-State: ACgBeo2IYgnT9qqVXopzK8bSRPQiJpGTIUCboh8GctGjmk8Fob1xOU75
	6wt+4uy/LOw1e/lnvZ3gOwfggL8b/3Sjkg==
X-Google-Smtp-Source: 
 AA6agR5o3oEV78IJgXyWMGVd4zbNkaPjWNAfFOSTomX2b9XLl/aEtKT08QrPgilxmOXL2cqyWB0VvQ==
X-Received: by 2002:a17:90b:3ec9:b0:1f5:62d5:4157 with SMTP id
 rm9-20020a17090b3ec900b001f562d54157mr21948889pjb.183.1661843658370;
        Tue, 30 Aug 2022 00:14:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 04/21] dlm: Upgrade to 4.1.1
Date: Tue, 30 Aug 2022 00:13:56 -0700
Message-Id: <20220830071413.3887189-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98541

Forward port patches and add a patch to fix compiler warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...error-since-xml2-config-should-not-b.patch | 13 +++++------
 ...nclude-string.h-for-memset-prototype.patch | 23 +++++++++++++++++++
 .../dlm/{dlm_4.0.9.bb => dlm_4.1.1.bb}        |  4 ++--
 3 files changed, 31 insertions(+), 9 deletions(-)
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/0004-include-string.h-for-memset-prototype.patch
 rename meta-networking/recipes-extended/dlm/{dlm_4.0.9.bb => dlm_4.1.1.bb} (91%)

diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
index f56359a473..3d1551574e 100644
--- a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
+++ b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
@@ -1,4 +1,4 @@
-From ad207a6f83dac390b2d95e3a8262d27292921863 Mon Sep 17 00:00:00 2001
+From da08f5ec5e553bd43f92a0b0f7476179b0b74502 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 26 Jun 2019 11:49:33 +0800
 Subject: [PATCH] dlm: fix compile error since xml2-config should not be used
@@ -9,28 +9,27 @@ to find libxml2.
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
  fence/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/fence/Makefile b/fence/Makefile
-index b927879..6e16078 100644
+index 2b080468..ff2eda3f 100644
 --- a/fence/Makefile
 +++ b/fence/Makefile
-@@ -18,11 +18,11 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
+@@ -18,12 +18,12 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
  	-fstack-clash-protection -Wl,-z,now
  
  CFLAGS += -fPIE -DPIE
 -CFLAGS += `xml2-config --cflags`
 +CFLAGS += `pkg-config libxml-2.0 --cflags`
  CFLAGS += -I../include
+ CFLAGS += $(shell pkg-config --cflags pacemaker-fencing)
  
- LDFLAGS += -Wl,-z,relro -pie
+ LDFLAGS += -Wl,-z,relro -Wl,-z,defs -pie
 -LDFLAGS += `xml2-config --libs`
 +LDFLAGS += `pkg-config libxml-2.0 --libs`
  LDFLAGS += -ldl
  
  all: $(BIN_TARGET)
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-extended/dlm/dlm/0004-include-string.h-for-memset-prototype.patch b/meta-networking/recipes-extended/dlm/dlm/0004-include-string.h-for-memset-prototype.patch
new file mode 100644
index 0000000000..257c5d02ff
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm/0004-include-string.h-for-memset-prototype.patch
@@ -0,0 +1,23 @@
+From 9652e6b3c43b4c051f2ff0e000d7ebf5fbab418e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 10:54:51 -0700
+Subject: [PATCH] include string.h for memset prototype
+
+Upstream-Status: Submitted [https://pagure.io/dlm/pull-request/3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dlm_controld/lib.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dlm_controld/lib.c b/dlm_controld/lib.c
+index 8cbdd27f..a7502fcd 100644
+--- a/dlm_controld/lib.c
++++ b/dlm_controld/lib.c
+@@ -10,6 +10,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <stdint.h>
++#include <string.h>
+ #include <errno.h>
+ #include <time.h>
+ #include <sys/types.h>
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb b/meta-networking/recipes-extended/dlm/dlm_4.1.1.bb
similarity index 91%
rename from meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
rename to meta-networking/recipes-extended/dlm/dlm_4.1.1.bb
index 3e699d2ff6..bb33890ec9 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.1.1.bb
@@ -9,10 +9,10 @@ SRC_URI = "https://pagure.io/dlm/archive/dlm-${PV}/dlm-dlm-${PV}.tar.gz \
            file://0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch \
            file://0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch \
            file://0001-make-Replace-cp-a-with-mode-preserving-options.patch \
+           file://0004-include-string.h-for-memset-prototype.patch \
            "
 
-SRC_URI[md5sum] = "4c57a941a15547859cd38fd55f66388e"
-SRC_URI[sha256sum] = "d59142e067cbd603aaf66151a04e9fa34330219680b8827c953d20821b951991"
+SRC_URI[sha256sum] = "f12c0056b9196dfcecbec2fa8930feb87c605a86ef0f3d7bd6fb0b77cd7f45ca"
 
 UPSTREAM_CHECK_URI = "https://pagure.io/dlm/releases"
 UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
-- 
2.37.2


