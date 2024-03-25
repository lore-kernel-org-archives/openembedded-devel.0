Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D06DC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 19:48:41 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.1513.1711396111760566688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 12:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNaukiwU;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ea80de0e97so1963246b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 12:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711396111; x=1712000911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZOISbR+A8ODp2C6rwPmFra+PQQwpuT2CJvbv//kEAE=;
        b=XNaukiwUmgaxLlNXEyPOQBnLYvyqQDO+OSJCE9SnrWJvp8rbdN5A41wCtLHLzob6Z+
         0u+mvSKyB5FPlVpXEAa1xtcxXKm0tLQInSQ8rYVOerGhzPk/ryJrrsXs2MJGqzTDBHLi
         vesqjsIlPD6/iL3p3k5ehfbMm+HriJY6FjNGupyQUBb2/T/4kyespNsMkxbflYVSiC6u
         fBuJEgpHF85DKuBgw9evREEos2pUChTZZQxWmeC6Bt9Fw9hZs0ueZgWRfOhFaD/yIecS
         +xy1Rk7iKblD5yTxbipTQWGlVmsz9nl/YudS04ZZuStL9ayibKQjMxBydwsJcYe5lu2e
         MZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711396111; x=1712000911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZOISbR+A8ODp2C6rwPmFra+PQQwpuT2CJvbv//kEAE=;
        b=ZolhWFJX708TMBQ2dv2lyVUl9kyULhLHOlLRMm5wUZ+GVcVkPEWn6nmJNEIKvMJjLN
         0joj8IjZzwsNA6RwhoLaKdRsI3mLJRxu9OnSdbcDTpp01OYWY9yDyAnjCZxwomniFRdg
         8MUDqZvplaj3j8gafpXwdfGr+1URTVYTD9gowzxJ6rC1Oe0EFdPcm8FI8uV/76P2X4fS
         UIvlyZLDrtQB2ql7N1jrSdgBfKoJEjoOgvzVojO03uSlgoZHrYxCOi5CpwIwffh98wv/
         /2kQemPsWesuTiukQyYVHm4ZqI9roQEFfI13OeEVyQU+hENbvcUZIGPMF3jm1MpPZcCd
         vORQ==
X-Gm-Message-State: AOJu0Yxd4IonyeFVtIrKiWEYIQRQt1ZRPMYAqdzpUwiRIxE9wj4Ewpbe
	OIJfKBZtNV+Fmcl+kQH4AWS0iYkQjLMITzh9iw7BpdM+eeiHjiaAAdH9ZvnA
X-Google-Smtp-Source: AGHT+IFQnUYeudRdVP/OWsiIcrRRqqF06Yi9ShJAXbi4QecXEdIsDltKPNO3cIq7Tc4jhuiPKwW1ng==
X-Received: by 2002:a05:6a00:b43:b0:6e4:62ed:23c3 with SMTP id p3-20020a056a000b4300b006e462ed23c3mr11737673pfo.9.1711396110812;
        Mon, 25 Mar 2024 12:48:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id r14-20020a6560ce000000b005ce472f2d0fsm5122282pgv.66.2024.03.25.12.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:48:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] autofs: Fix build with musl >= 1.2.5
Date: Mon, 25 Mar 2024 12:48:25 -0700
Message-ID: <20240325194825.641241-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325194825.641241-1-raj.khem@gmail.com>
References: <20240325194825.641241-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 19:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109603

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-libgen.h-for-basename.patch  | 58 +++++++++++++++++++
 .../recipes-daemons/autofs/autofs_5.1.8.bb    |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-include-libgen.h-for-basename.patch

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-include-libgen.h-for-basename.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-include-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..4c8b4ef779
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-include-libgen.h-for-basename.patch
@@ -0,0 +1,58 @@
+From 1651e7a35be8b3e2fa90ca57b073f6944664fa62 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 12:04:03 -0700
+Subject: [PATCH] include libgen.h for basename
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ daemon/automount.c    | 1 +
+ daemon/master.c       | 1 +
+ modules/lookup_file.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/daemon/automount.c b/daemon/automount.c
+index 3d9461d..61b3478 100644
+--- a/daemon/automount.c
++++ b/daemon/automount.c
+@@ -21,6 +21,7 @@
+ 
+ #include <dirent.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <signal.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/daemon/master.c b/daemon/master.c
+index f99359c..3f56499 100644
+--- a/daemon/master.c
++++ b/daemon/master.c
+@@ -21,6 +21,7 @@
+ #include <string.h>
+ #include <memory.h>
+ #include <limits.h>
++#include <libgen.h>
+ #include <signal.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+diff --git a/modules/lookup_file.c b/modules/lookup_file.c
+index 6afc558..82b1f28 100644
+--- a/modules/lookup_file.c
++++ b/modules/lookup_file.c
+@@ -15,6 +15,7 @@
+ 
+ #include <stdio.h>
+ #include <malloc.h>
++#include <libgen.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <time.h>
+-- 
+2.44.0
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
index ca11f1a170..e3f9777380 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
@@ -29,6 +29,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://mount_conflict.patch \
            file://0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch \
            file://0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch \
+           file://0001-include-libgen.h-for-basename.patch \
            "
 SRC_URI[sha256sum] = "0bd401c56f0eb1ca6251344c3a3d70bface3eccf9c67117cd184422c4cace30c"
 
-- 
2.44.0


