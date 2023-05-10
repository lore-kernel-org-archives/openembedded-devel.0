Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2E8C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 03:25:17 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.8217.1683689110067920677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 20:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hjBlX+Bm;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso6042630a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 20:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683689109; x=1686281109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvpwxhQsrIwg/TVBBSFFOABRlmFn+o3yIv8IXH6Ns5Y=;
        b=hjBlX+BmM18zzxRfsbe3R/Tzpp3M6kaatq3xM6pPhUqTdyM9/UPrQIZHxPcGJJA4nZ
         36c4Dv8Lp4TTQuElJutm1tMKmTKS0ItdQhqaTCL4YWAaQYthTfDUQM3uYTGOpEQE0hiw
         4rECXfHctpkc7VrqsRCToS8A63L5y5e/0FLmZwxT6agAxY5ksYpHjIFIlqmoucvZFILJ
         dkOTAXtrfl75GEaHRKyv7nY+Cm94PybS+yMMfGH4TEFuPptIZiaMD76vig0g4d7ocsz3
         94kw6bpdX7BoEbzvuUi8vFu2Rwuu9R78YQgPce0XocmwYa23gfLi+R09wAzx40U7xaEC
         VBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683689109; x=1686281109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvpwxhQsrIwg/TVBBSFFOABRlmFn+o3yIv8IXH6Ns5Y=;
        b=IcWzous3vZcvqNN19JEB6G0sIntcPdfqbPHlbqKB03HUs7d6MhmBp13KYQlFjtcaZT
         TCyiDbuS4zTojZEYJOjLPzR2ZJ2UmK2lKZNTuVBlrDn/T6ZwaMOHFSmYyyNGDsFjL8Bm
         yFYYTBBXJbltjpOu0P3t0ygNABQUErSvoQxw4QlbY8mzS4fGxlNzUcOzbhi0yiuyL3kr
         ECz4Z4LTJE2RxeJnee8HhMQ2r1n3iNT4y9OUETc/G1snfRr6VL7lgZZI/nDRn6JExiVd
         7mMoOrck2F3c/7iVR1ueXubfUsTSecMOxBYLtoE5kFbSbhPoylRp1zB49DcoViPQgdvh
         OSpg==
X-Gm-Message-State: AC+VfDw5s+r1TEDMDbVnPP3LAJHpC/8V157pwwzi06Q16SZz5PTXBGCW
	sfgTEjK506Je69yZKG8m7yDkKv5Sxh7NzQ==
X-Google-Smtp-Source: ACHHUZ7z20EhMBAP+xRMEGA8bZ6jUsvUdO3E7SVwY53tj3PuOCJPhGBZxo2ZtbXgHHMAKUOTUlIyLA==
X-Received: by 2002:a17:903:280b:b0:1ab:15c2:e2e9 with SMTP id kp11-20020a170903280b00b001ab15c2e2e9mr14792307plb.7.1683689109242;
        Tue, 09 May 2023 20:25:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001a505f04a06sm2446100plr.190.2023.05.09.20.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 20:25:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] libimobiledevice: Fix build with clang
Date: Tue,  9 May 2023 20:25:04 -0700
Message-Id: <20230510032504.457574-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510032504.457574-1-raj.khem@gmail.com>
References: <20230510032504.457574-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 03:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102526

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-unistd.h-for-usleep.patch    | 31 +++++++++++++++++++
 .../libimobiledevice/libimobiledevice_git.bb  |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice/0001-include-unistd.h-for-usleep.patch

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice/0001-include-unistd.h-for-usleep.patch b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice/0001-include-unistd.h-for-usleep.patch
new file mode 100644
index 0000000000..424a203e56
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice/0001-include-unistd.h-for-usleep.patch
@@ -0,0 +1,31 @@
+From 6cb8069cfe08114f1dc7b50a7fcd4dc040cd1bbb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 May 2023 20:19:23 -0700
+Subject: [PATCH] include unistd.h for usleep()
+
+clang16 flags the missing header
+
+Fixes
+../../git/tools/idevicedevmodectl.c:363:2: error: call to undeclared function 'usleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+
+Upstream-Status: Submitted [https://github.com/libimobiledevice/libimobiledevice/pull/1444]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/idevicedevmodectl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/idevicedevmodectl.c b/tools/idevicedevmodectl.c
+index 739bc13..9fe8d6a 100644
+--- a/tools/idevicedevmodectl.c
++++ b/tools/idevicedevmodectl.c
+@@ -34,6 +34,7 @@
+ #ifndef WIN32
+ #include <signal.h>
+ #endif
++#include <unistd.h>
+ 
+ #ifdef WIN32
+ #include <windows.h>
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
index c17c7224f8..1a0590c57b 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
@@ -11,7 +11,8 @@ DEPENDS = "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt libimobiledevic
 PV = "1.3.0+git${SRCPV}"
 
 SRCREV = "860ffb707af3af94467d2ece4ad258dda957c6cd"
-SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https;branch=master"
+SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https;branch=master \
+           file://0001-include-unistd.h-for-usleep.patch"
 
 S = "${WORKDIR}/git"
 inherit autotools pkgconfig
-- 
2.40.1


