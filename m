Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27552C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 08:08:24 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.25048.1744531698697440891
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 01:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nNwMUdQs;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-39d83782ef6so2701455f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744531696; x=1745136496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TkO17eykQQZWuXbhTB837uIhHJteQQpXderPAx0Z9qo=;
        b=nNwMUdQsaIxPP7zved6a1hynkBJrtwWkNF5/tZlP756KFznwTMy7PMvxb2GsaQdu5j
         2uY3Iuh444NCqKha5mj8xpv6ijy8QgSnEJa4VXdq4j32Ypmj6tKV2vtd1HfwSYaB1KRV
         1qWWctnzeFX7lcs4shfOhE0wuMElPHUk/o4wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744531696; x=1745136496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkO17eykQQZWuXbhTB837uIhHJteQQpXderPAx0Z9qo=;
        b=Up2MXsbt6C1u5loDtkHW1BpcHsbOXNj5igwwIjqPuUqq5NlgM2Yc1JARy1fw9Auv+d
         EQgocsEjJnIF0Yu3MEZLGPIrmyH/BAoi9MlasT+2g8u8XtVzMUiU4IwLXHadLK9Cma1e
         9HPtjrP8XmSjBSmxDHybEloTWWJoESVyYgsg9Kuk21/eObskeN8shgh4Te9T881blIbg
         6kS8+PSoii/X9LeVCWXo3aQo+iTReDXbrjRkcQiWr8tXs73Fcj7i66/GTI4sOpETtokW
         AFtS7o3elzatUKil+wBKgZfg1+EmNAyarMsNfyHvvlizTljUBUJxmUhxu08oyupmOlpK
         6LJw==
X-Gm-Message-State: AOJu0YywFaz6FOg0QBe++14AEamkriYBPUE2fnuYitUIs/yxCnUeFwZ9
	XbEStPcpOHEhLnOlN2YJmOZDaSM1sY75gxYxrEXgHk7XoE6I7EXH6SotdeniDag6Kcl5bR2bgpm
	X7ZkpKA==
X-Gm-Gg: ASbGnctuQf0Rh+qnc1ouhX9rKo5rv9ehGAdERCrGL0o80FaY3ZkyRw2PtgYd9pWr7Kp
	F8VdiMds6BXAa718DT4RJYd0NEDoIKFBLyRFcOlZ/S8sytTNEPiOx/WTMYKtT8ma7YRS0coR8tk
	e8s14R4TTWbCpn2Mdg1PCJggOgIm31u4I8XpRBT9l61beyCKvM3I4lusMn5h7dr0i6ymRXRQ/F9
	mWTxtM9fskncTBFmhCRQEf7hPWI2WOAsuQArS4YA7Daz404A1dOJd/unbU8bYnkgwkYxzHqzReL
	sTjFblJFvywsuH3rZWav95JgCdIasnS/SpmJmMLq5PcJSjGkNOGnK/4ZNg/mS93I3PGZM7kbYRt
	A0cYgnpozaidJvk+R4PAcfczDVjb2s6QctuQJkYxb47uhY5s=
X-Google-Smtp-Source: AGHT+IEhyG8o7NozOKQYb24iKCoPMovOsnZRkSxpyBeFNS/mwRqE24vARvD5p/WtjOLksyyTyaE6MQ==
X-Received: by 2002:a05:6000:2508:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39d8f4dcd59mr10734254f8f.25.1744531696481;
        Sun, 13 Apr 2025 01:08:16 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef00090089785c06a34e3.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:9008:9785:c06a:34e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d053sm7289212f8f.68.2025.04.13.01.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 01:08:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH 1/2] python3-evdev: Use Yocto kernel headers instead of host's
Date: Sun, 13 Apr 2025 10:08:01 +0200
Message-Id: <20250413080802.602658-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 08:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116822

From: Yoann Congal <yoann.congal@smile.fr>

Commit 01ebfecf1c94 ("python3-evdev: switch to PEP-517 build backend")
did not update the way build arguments are passed to the build making
them unused. In python3-evdev case that meant that the build used host
kernel headers instead of Yocto's.

When host's and Yocto's headers were different (currently the case on
Debian 12 as seen on AB[0]), that triggered:

| src/evdev/ecodes.c:542:29: error: 'KEY_LINK_PHONE' undeclared (first use in this function); did you mean 'KEY_PICKUP_PHONE'?
|   542 |     PyModule_AddIntMacro(m, KEY_LINK_PHONE);
|       |                             ^~~~~~~~~~~~~~
[...]
ERROR: Task (.../../../layers/meta-openembedded/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb:do_compile) failed with exit code '1'

To fix this, use PEP517_BUILD_OPTS with the working (but weird looking) escaping.

Now that correct headers are used, their paths end up in the ecode.c
file which lead to a buildpaths error, skip the check for this patch.
This will be fixed in a following patch.

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/40/steps/40/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
index c48bc39c1f..b8930c97d5 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
@@ -11,7 +11,8 @@ do_compile:prepend() {
     rm -rf ${S}/evdev/ecodes.c
 }
 
-SETUPTOOLS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
+PEP517_BUILD_OPTS = "--config-setting=--build-option='build_ecodes \
+    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h'"
 
 RDEPENDS:${PN} += "\
     python3-ctypes \
@@ -20,3 +21,4 @@ RDEPENDS:${PN} += "\
     python3-shell \
     python3-stringold \
     "
+INSANE_SKIP:${PN}-src = "buildpaths"

