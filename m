Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E865CEB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 03:33:00 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.10886.1689305576318455133
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jul 2023 20:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iisizv3b;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-53482b44007so942075a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jul 2023 20:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689305575; x=1691897575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNLjeHtRe6qWnRP2KV4jPqkmLfStv505CeFNUBQGLik=;
        b=iisizv3bNmq6yjS+PRTzDYjeXbTJ71XFNPG6t+E1EFduRz2ownUwrjdMhKUt2cTkI2
         HQnRnOaJRPW62DZ833c4lxXcBk2xm3X7Duee4Q5eCORV/3XC9RTL7y5da2iNH+DtMgbn
         0zNsPVLTgR8mgCVtf2QiGrjTF7YiFZ9wMBD7YiPCuU4MXNex6D6SH+18DDAsXzJzMAxK
         FyOxyXO+dAA2VtXE0kwcSvqqBG/Z1Pdz7QEpUOmSO55/lR6tA63Q5PpZlpSvE7zEBCR/
         g0VLUnl45j9OCQeGgi+RxDu8Af2Q8AGA7/993KVxEsy2I+N3PxmCYZo+Q/Jakm0YMpMk
         A+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689305575; x=1691897575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNLjeHtRe6qWnRP2KV4jPqkmLfStv505CeFNUBQGLik=;
        b=Kr7/qzHhUrL2wGoo8yhMETdP3d4FFGtoObUvMDbmRxzjTwEzPm2IpFazxaKU6LB5Yt
         ehr2I8UUgLJJ6et08vALtdqS7yjHAmctzrOhv7+9Wq7Akn+Sg1moRGan9ii0JF5ULw/N
         XGz20VECa7DDO30U46p4ZpngHELcSMmZ4Hn83fJNzd0dzC1b/NppxIRZiehvIYKB/fE8
         RH96/f3iVuUvUXNA8He7Dci+GrDi1QGaP/5GfUwT2TBQ+E2hEl20pu5PIuZIS0yER8CO
         dJVqriFPRrlaurifLKIrJ7qB0hQmBCLEik+7vGEL65+xz8TEb453JDAr0kOIcYYbLstk
         2+9A==
X-Gm-Message-State: ABy/qLb83WdO66/VRJrAbIJmSCxXgqEuhqn45udXdnw5tsZWyKKONYLQ
	J47FgbR06StFd3fULPRFJZda7CIOYC4=
X-Google-Smtp-Source: APBJJlHdAncPMz4ZXo7Gl1n4nT+AuqE8h8zYEAWRnHUDWBssGiNl6QYaAeYAqICf7orv4Akj0KQI1g==
X-Received: by 2002:a17:902:e5c1:b0:1b1:76c2:296a with SMTP id u1-20020a170902e5c100b001b176c2296amr2994052plf.60.1689305575406;
        Thu, 13 Jul 2023 20:32:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::e974])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001b9ff5aa2e7sm4276390plt.239.2023.07.13.20.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 20:32:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] dlm: Upgrade to 4.2.0
Date: Thu, 13 Jul 2023 20:32:51 -0700
Message-ID: <20230714033252.782768-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714033252.782768-1-raj.khem@gmail.com>
References: <20230714033252.782768-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 03:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103862

Drop upstreamed patch and another patch which is fixed differently
upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...error-since-xml2-config-should-not-b.patch | 35 -------------------
 ...nclude-string.h-for-memset-prototype.patch | 23 ------------
 .../dlm/{dlm_4.1.1.bb => dlm_4.2.0.bb}        |  4 +--
 3 files changed, 1 insertion(+), 61 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
 delete mode 100644 meta-networking/recipes-extended/dlm/dlm/0004-include-string.h-for-memset-prototype.patch
 rename meta-networking/recipes-extended/dlm/{dlm_4.1.1.bb => dlm_4.2.0.bb} (87%)

diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
deleted file mode 100644
index 3d1551574e..0000000000
--- a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From da08f5ec5e553bd43f92a0b0f7476179b0b74502 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 26 Jun 2019 11:49:33 +0800
-Subject: [PATCH] dlm: fix compile error since xml2-config should not be used
-
-xml2-config is disabled, so change Makefile to use pkgconfig
-to find libxml2.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- fence/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/fence/Makefile b/fence/Makefile
-index 2b080468..ff2eda3f 100644
---- a/fence/Makefile
-+++ b/fence/Makefile
-@@ -18,12 +18,12 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
- 	-fstack-clash-protection -Wl,-z,now
- 
- CFLAGS += -fPIE -DPIE
--CFLAGS += `xml2-config --cflags`
-+CFLAGS += `pkg-config libxml-2.0 --cflags`
- CFLAGS += -I../include
- CFLAGS += $(shell pkg-config --cflags pacemaker-fencing)
- 
- LDFLAGS += -Wl,-z,relro -Wl,-z,defs -pie
--LDFLAGS += `xml2-config --libs`
-+LDFLAGS += `pkg-config libxml-2.0 --libs`
- LDFLAGS += -ldl
- 
- all: $(BIN_TARGET)
diff --git a/meta-networking/recipes-extended/dlm/dlm/0004-include-string.h-for-memset-prototype.patch b/meta-networking/recipes-extended/dlm/dlm/0004-include-string.h-for-memset-prototype.patch
deleted file mode 100644
index 257c5d02ff..0000000000
--- a/meta-networking/recipes-extended/dlm/dlm/0004-include-string.h-for-memset-prototype.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 9652e6b3c43b4c051f2ff0e000d7ebf5fbab418e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 29 Aug 2022 10:54:51 -0700
-Subject: [PATCH] include string.h for memset prototype
-
-Upstream-Status: Submitted [https://pagure.io/dlm/pull-request/3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dlm_controld/lib.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dlm_controld/lib.c b/dlm_controld/lib.c
-index 8cbdd27f..a7502fcd 100644
---- a/dlm_controld/lib.c
-+++ b/dlm_controld/lib.c
-@@ -10,6 +10,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <stdint.h>
-+#include <string.h>
- #include <errno.h>
- #include <time.h>
- #include <sys/types.h>
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.1.1.bb b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
similarity index 87%
rename from meta-networking/recipes-extended/dlm/dlm_4.1.1.bb
rename to meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
index bb33890ec9..8cfb27a903 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.1.1.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
@@ -6,13 +6,11 @@ HOMEPAGE = "https://fedorahosted.org/cluster/wiki/HomePage"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 SRC_URI = "https://pagure.io/dlm/archive/dlm-${PV}/dlm-dlm-${PV}.tar.gz \
-           file://0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch \
            file://0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch \
            file://0001-make-Replace-cp-a-with-mode-preserving-options.patch \
-           file://0004-include-string.h-for-memset-prototype.patch \
            "
 
-SRC_URI[sha256sum] = "f12c0056b9196dfcecbec2fa8930feb87c605a86ef0f3d7bd6fb0b77cd7f45ca"
+SRC_URI[sha256sum] = "90237e18af7422ac15fc756899b3bb6932597b13342296de8e0e120e6d8729ab"
 
 UPSTREAM_CHECK_URI = "https://pagure.io/dlm/releases"
 UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
-- 
2.41.0


