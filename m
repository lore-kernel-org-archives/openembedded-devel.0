Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC23FC6FA92
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.2756.1662594067454241459
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=njPAoreq;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so563700pjl.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FYw3yYdgMvE4oilf9gB9FpyBFH4BDGn1pxMdlFiXcoI=;
        b=njPAoreqyg4frk1Jq+ermbrrNcSrBnH/NZTkRll+wLCpoJPQoWXalTI0BnEI9OxKKe
         7KDRbBUW3xaA/SgrapDtRZ6of4vYbtaPWDoPVeGfK5fNOH5DNUsXBB0Rbzc/X53l8bYU
         tRyDE74l4O0cG99qnphG+cXivou95/K+M9tAhARy/N7n7zxYE/WofAsqUODUrWrMgZIu
         JX/iXMoYeJKElxOa9L8wObm/NqL5YZ+bu6j5v8QOj+70S6VD63Lzqw4JW76TJ3+CeGB0
         QkBrU1uOUFBw0oYMPOG4PDasWkw/xmjI4o7VQLvXvoAg6s8tzMqgO+bphQ9YnjoBrwQB
         Ic9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FYw3yYdgMvE4oilf9gB9FpyBFH4BDGn1pxMdlFiXcoI=;
        b=LUz+BQZ2qYar3uB+G8bZk5kaoMvQX9v6/l1pF0QqQM5X0qGpeI3BmcO/JLQv17eN6g
         Yvcqcl8Gp1SiQNaDIvc/vWsbX94xnh3E1qdIBdd2Tr28DuSG9XjUqtbNKt2eg6PovukH
         1SUKWwj3m700gQGOw13lmopS0NOoefca93zbWt7RHgysGNYeGbkjNja7Mysgox5yVUpa
         aef1tfcjqmpQ2ORu/7bHehcl5VUSQtPVLbsZqNKZWsznQShgQ2ahhl0vLvT2hRYcnI90
         eqkRpSlshLwca0ZgGnnsUDvJIJHAmyBNlDsmqi1G5HDgGSxpm1+ht/rVrEvWSYMRlC3/
         szLQ==
X-Gm-Message-State: ACgBeo0i544cO9o0FPo+PNINLTpLb8IplU9aDxpXuaJVyeF3en+YMgIP
	+mh5fDvuCXEPyqF/BeaTwqQO8ElJOwXjpQ==
X-Google-Smtp-Source: 
 AA6agR6ZKKfzGpIMob2HbPoMg0hRiZd6rtopxpcprTZzvJgFoQuAp7mlNpMMWGb8eND7xyRI6Aw2iQ==
X-Received: by 2002:a17:90a:b00f:b0:1f7:67c6:5df5 with SMTP id
 x15-20020a17090ab00f00b001f767c65df5mr967591pjq.59.1662594066641;
        Wed, 07 Sep 2022 16:41:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/22] jq: Upgrade to latest and fix configure tests
Date: Wed,  7 Sep 2022 16:40:43 -0700
Message-Id: <20220907234102.3312797-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98693

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...XOPEN_SOURCE-when-checking-for-strpt.patch | 40 +++++++++++++++++++
 ...ace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch | 30 ++++++++++++++
 meta-oe/recipes-devtools/jq/jq_git.bb         |  7 +++-
 3 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch b/meta-oe/recipes-devtools/jq/jq/0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch
new file mode 100644
index 0000000000..e4d6ebb45b
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch
@@ -0,0 +1,40 @@
+From 40bbd419ad8d1bd9cbe8b17063c323f8a40ab327 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Sep 2022 09:59:31 -0700
+Subject: [PATCH 1/2] configure: Pass _XOPEN_SOURCE when checking for strptime
+
+Include sys/time.h for gettimeofday since thats where its in glibc
+
+Upstream-Status: Submitted [https://github.com/stedolan/jq/pull/2480]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a2cd99e..95afe06 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -139,7 +139,10 @@ AC_FUNC_ALLOCA
+ 
+ AC_FIND_FUNC([isatty], [c], [#include <unistd.h>], [0])
+ AC_FIND_FUNC([_isatty], [c], [#include <io.h>], [0])
++OLD_CFLAGS=$CFLAGS
++CFLAGS="$CFLAGS -D_XOPEN_SOURCE"
+ AC_FIND_FUNC([strptime], [c], [#include <time.h>], [0, 0, 0])
++CFLAGS=$OLD_CFLAGS
+ AC_FIND_FUNC([strftime], [c], [#include <time.h>], [0, 0, 0, 0])
+ AC_FIND_FUNC([setenv], [c], [#include <stdlib.h>], [0, 0, 0])
+ AC_FIND_FUNC([timegm], [c], [#include <time.h>], [0])
+@@ -147,7 +150,7 @@ AC_FIND_FUNC([gmtime_r], [c], [#include <time.h>], [0, 0])
+ AC_FIND_FUNC([gmtime], [c], [#include <time.h>], [0])
+ AC_FIND_FUNC([localtime_r], [c], [#include <time.h>], [0, 0])
+ AC_FIND_FUNC([localtime], [c], [#include <time.h>], [0])
+-AC_FIND_FUNC([gettimeofday], [c], [#include <time.h>], [0, 0])
++AC_FIND_FUNC([gettimeofday], [c], [#include <sys/time.h>], [0, 0])
+ AC_CHECK_MEMBER([struct tm.tm_gmtoff], [AC_DEFINE([HAVE_TM_TM_GMT_OFF],1,[Define to 1 if the system has the tm_gmt_off field in struct tm])],
+                 [], [[#include <time.h>]])
+ AC_CHECK_MEMBER([struct tm.__tm_gmtoff], [AC_DEFINE([HAVE_TM___TM_GMT_OFF],1,[Define to 1 if the system has the __tm_gmt_off field in struct tm])],
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch b/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch
new file mode 100644
index 0000000000..d2f999a728
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch
@@ -0,0 +1,30 @@
+From cda1734bed3b048c01452c798877d05b8c2f4c15 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Sep 2022 10:00:59 -0700
+Subject: [PATCH 2/2] builtin: Replace _BSD_SOURCE with _DEFAULT_SOURCE
+
+newer glibc has remove _BSD_SOURCE and wants it to be replaced with _DEFAULT_SOURCE
+
+Fixes
+/usr/include/features.h:194:3: warning: "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-W#warnings]
+warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
+
+Uptream-Status: Submitted [https://github.com/stedolan/jq/pull/2480]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/builtin.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index 1c6b08c..2a31496 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -1,4 +1,4 @@
+-#define _BSD_SOURCE
++#define _DEFAULT_SOURCE
+ #define _GNU_SOURCE
+ #ifndef __sun__
+ # define _XOPEN_SOURCE
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/jq/jq_git.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
index 8b0218c83e..f69b435e51 100644
--- a/meta-oe/recipes-devtools/jq/jq_git.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -9,8 +9,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2814b59e00e7918c864fa3b6bbe049b4"
 
 PV = "1.6+git${SRCPV}"
-SRC_URI = "git://github.com/stedolan/jq;protocol=https;branch=master"
-SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
+SRC_URI = "git://github.com/stedolan/jq;protocol=https;branch=master \
+    file://0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch \
+    file://0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch \
+    "
+SRCREV = "cff5336ec71b6fee396a95bb0e4bea365e0cd1e8"
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
-- 
2.37.3


