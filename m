Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7207C25B7F
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.3058.1716315044050768976
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ji+l3CDn;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1edf506b216so102127035ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315043; x=1716919843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9zpfWYiN6/6IT/Bok99jo8g5ZOxFGz28hCTv/p+p9I=;
        b=Ji+l3CDnHZpkLi7HNkdUZaus0eyypwQiOA8R86UnECQhuLcQ7nASbHK3gsg1F7O93m
         tFLK1qRkNdHg3ffaoc7nT8FPeh3xTVXjBQB3BqH5prHhOKsHj06G2/8Fg/9aBR4N2I0z
         3ebphQpcmQguzR+RpDCOGUXgxJ+5wD19CnCejxger16h98Isbz6j2lQ2zrK6sJm1Dtuv
         t6cuAPGEyH2t+1s1hAKyuTNfmtCUhlUpMa8v3Iv/EfTAwLlpcEwCO3SPcmpDn0SFZhXj
         EOD48u5p/a8N+aKZd9F28M1SNd2OFzBhiGxU5lnx3DBn5goUvfWloEGWVb5dMlcoGJ7Z
         O83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315043; x=1716919843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9zpfWYiN6/6IT/Bok99jo8g5ZOxFGz28hCTv/p+p9I=;
        b=YpcQTnBK0c8ODCXiThb0hYNeFnvUWDNsAY4S893zjDakUTOMsUJcaaAdvjwsKEcZt1
         nRK6Ypf7N5wGVRayERzU5hUEnvBl1orCxzq0Gf/TLjFFQqeS+P/i/CZu/+6cvSyaY1vW
         7mwivrvyAvCB1a6Rt/Ki73L4VRo/SkjqaWwK48BxvOhVKG+F55LH1Xp5tKIlrmilfN13
         CWr9gWRBNTKiNuidFqkgyBVGkVYSJgjqINITu3SjNEMUkjf3wxsgjY2GmZocLe3kENvj
         n1GSTTTg6bccxeIjcOQ7D568yYaK40DGLGiC82KFWbNdR3C90yV1FLIR/8mpu12xnK79
         wi9A==
X-Gm-Message-State: AOJu0YyZrAkilM2kSgD30JROxNRYPghbLu5HhkGG/A/MzSKsRc4EZFdQ
	OE8osSMiSIW/3hBFdQ5v8IMCUPQTOcbkyGB93pZu42PBTov3O8Xh83tjqo55wR4=
X-Google-Smtp-Source: AGHT+IFVMwPS/MB4Om94mS/eurLQGnnZ++S0ZXlFXJxgy4OV1rvhD9CK0mKe/7c1HTJRbd7/Z1vE6w==
X-Received: by 2002:a17:903:1250:b0:1ea:26bf:928 with SMTP id d9443c01a7336-1ef44161501mr394896165ad.50.1716315043152;
        Tue, 21 May 2024 11:10:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][ 17/22] pipewire-0.2: Include time.h for timespec struct signature
Date: Tue, 21 May 2024 11:10:18 -0700
Message-ID: <20240521181024.426176-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110466

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n-idle-Include-time.h-for-struct-tim.patch | 43 +++++++++++++++++++
 .../pipewire/pipewire-0.2_git.bb              |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2/0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2/0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2/0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch
new file mode 100644
index 0000000000..ce381a78b3
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2/0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch
@@ -0,0 +1,43 @@
+From b1d911fdab4a583f276d18395037d90bfc305109 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2024 18:12:23 -0700
+Subject: [PATCH] module-suspend-on-idle: Include time.h for struct timespec
+ decl
+
+This is flagged as error with gcc-14 on musl targets
+
+In file included from ../git/src/pipewire/loop.h:27,
+                 from ../git/src/pipewire/core.h:44,
+                 from ../git/src/modules/module-suspend-on-idle.c:26:
+../git/spa/include/spa/support/loop.h:184:37: warning: 'struct timespec' declared inside parameter list will not be visible outside of this definition or declaration
+  184 |                              struct timespec *value,
+      |                                     ^~~~~~~~
+../git/src/modules/module-suspend-on-idle.c: In function 'node_state_changed':
+../git/src/modules/module-suspend-on-idle.c:110:69: error: passing argument 2 of 'main_loop->utils->update_timer' from incompatible pointer type [-Wincompatible-pointer-types]
+  110 |                 pw_loop_update_timer(main_loop, info->idle_timeout, &value, NULL, false);
+      |                                                                     ^~~~~~
+      |                                                                     |
+      |                                                                     struct timespec *
+
+Upstream-Status: Inappropriate [Fixed in latest pipewire differently]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/modules/module-suspend-on-idle.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/modules/module-suspend-on-idle.c b/src/modules/module-suspend-on-idle.c
+index e5c1fcb30..4dba3be71 100644
+--- a/src/modules/module-suspend-on-idle.c
++++ b/src/modules/module-suspend-on-idle.c
+@@ -20,6 +20,7 @@
+ #include <string.h>
+ #include <stdio.h>
+ #include <errno.h>
++#include <time.h>
+ 
+ #include "config.h"
+ 
+-- 
+2.45.1
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
index 9895e89761..7c8afd3d51 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
@@ -10,7 +10,9 @@ DEPENDS = "alsa-lib dbus udev"
 SRCREV = "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
 PV = "0.2.7"
 
-SRC_URI = "git://github.com/PipeWire/pipewire;branch=master;protocol=https"
+SRC_URI = "git://github.com/PipeWire/pipewire;branch=master;protocol=https \
+           file://0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.45.1


