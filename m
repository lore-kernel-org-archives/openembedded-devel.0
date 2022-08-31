Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4992FECAAD3
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 05:41:49 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.22140.1661924504270755763
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NdsUsEX7;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id 76so13437136pfy.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ciWEDn3bGkuVCCLYY0GRPfwOcG/woUCAecr2WYpfI50=;
        b=NdsUsEX7FJOVfluw0QTLtlX2nnqwRMX73fGLMEjvA8SLEDN0JONP9L8QO/FiGBdT1L
         c2u5vEZr/qdiAu8cm5gXowTVyJwebPPG9SPtK7dftMeBXCAsCyQJ1ZUQUaKVrq8d8Zwc
         J2a3V+3b0dVvBFljkGABTCXHnuw10tqIjxHG8d/XMGsHF65DF1XRYQdND9GGQSbsem7S
         gD8pcyLgzvmoK1BdBmxyufwBQ3A6sFm1y+bSkxX/atfyxuUtdDA/iPZkI7Mq0gvrhTfw
         VNMBZ0xpwmJIBX+kan2a0VIZb9VSpBD/Fym+TE3moMBnkUv4Gt8hinUbsYkjk7YVoc0C
         1myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ciWEDn3bGkuVCCLYY0GRPfwOcG/woUCAecr2WYpfI50=;
        b=KE2I440ge+tEkcmNd1J+vvrkzOLCZo5iI/tnKdzerZV6OYOYdhvYziZidTFYkJI5tq
         2Pm1mojM1Kar2JR0/xUwRvyhYFFHn6CzupfoX5LRi0PnDIGh5ZlBJLEJd3Axd/TEOpDQ
         a/01X0SeC6j+nbxGAXBrD5EBulaJUIiSe+NkR7KuGAqJ3XE5dq+bUfe7okG3ZfPEmsB9
         HrRSJBx2Az/tcbEZa9JQ2pNXFCAl+m4BvVukI+ub7PqWlRYvoD0jqn3xlC1+9mGi3d/N
         Gqu1+Cu/NpTGMsNTdbIJZsUY/VSKiukJc8NPzYcZpRA2bCrL5dBXb4CZrm812KKBBOc5
         B1iw==
X-Gm-Message-State: ACgBeo1k0jpCFJzjj/4+M7WWPUZS//GsOOvC4f+VFY4y9fly/4D2nN8C
	s5dmiyr4ixPQIjBHCHJOVyEHu4QU1NVBNA==
X-Google-Smtp-Source: 
 AA6agR6ydzFc3KZGQc62IVtzbRxsv2LDchAK/dJXJu8e/2ahXI+Jb/XTMZkZoVMv1GK/NzsNURiEoQ==
X-Received: by 2002:a65:4941:0:b0:42a:8c1b:6b6c with SMTP id
 q1-20020a654941000000b0042a8c1b6b6cmr21175944pgs.375.1661924503201;
        Tue, 30 Aug 2022 22:41:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e80400b001733c13cc81sm7275181plg.169.2022.08.30.22.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 22:41:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] rasdaemon: Upgrade to 0.6.8
Date: Tue, 30 Aug 2022 22:41:35 -0700
Message-Id: <20220831054139.3493726-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Aug 2022 05:41:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98570

Fix build on musl while here
Drop unneeded header include patch which is fixed upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-system-header-includes.patch     | 44 -------------------
 ...-version-of-strerror_r-on-non-glibc-.patch | 35 +++++++++++++++
 ...{rasdaemon_0.6.7.bb => rasdaemon_0.6.8.bb} |  8 +---
 3 files changed, 37 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch
 create mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch
 rename meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/{rasdaemon_0.6.7.bb => rasdaemon_0.6.8.bb} (92%)

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch
deleted file mode 100644
index 0164321312..0000000000
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 18786db1ad03716267927d983c83275469a1478a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 May 2020 12:27:19 -0700
-Subject: [PATCH] Fix system header includes
-
-Use poll.h instead of sys/poll.h
-Fixes
-warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
-
-Include limits.h for PATH_MAX
-
-Fixes
-ras-events.c:359:16: error: 'PATH_MAX' undeclared (first use in this function)
-  359 |  char pipe_raw[PATH_MAX];
-      |                ^~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ras-events.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/ras-events.c b/ras-events.c
-index 511c93d..400e740 100644
---- a/ras-events.c
-+++ b/ras-events.c
-@@ -18,13 +18,14 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
-+#include <poll.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
- #include <sys/stat.h>
- #include <sys/types.h>
--#include <sys/poll.h>
- #include <signal.h>
- #include <sys/signalfd.h>
- #include "libtrace/kbuffer.h"
--- 
-2.26.2
-
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch
new file mode 100644
index 0000000000..fef71afde5
--- /dev/null
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch
@@ -0,0 +1,35 @@
+From e415152b51eacab8705b6b3274cc0d1a274772e0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 30 Aug 2022 19:54:35 -0700
+Subject: [PATCH] libtrace: Use XSI version of strerror_r on non glibc systems
+
+The version used is glibc specific therefore make it so
+and provide a fallback for non-glibc systems
+
+Upstream-Status: Submitted [https://github.com/mchehab/rasdaemon/pull/70]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libtrace/event-parse.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libtrace/event-parse.c b/libtrace/event-parse.c
+index 6c705c3..6b651d5 100644
+--- a/libtrace/event-parse.c
++++ b/libtrace/event-parse.c
+@@ -5071,7 +5071,13 @@ int pevent_strerror(struct pevent *pevent, enum pevent_errno errnum,
+ 	const char *msg;
+ 
+ 	if (errnum >= 0) {
++#if defined(__GLIBC__)
+ 		msg = strerror_r(errnum, buf, buflen);
++#else
++		if (strerror_r(errnum, buf, buflen) != 0)
++			snprintf(buf, buflen, "unknown error %i", errnum);
++		msg = buf;
++#endif
+ 		if (msg != buf) {
+ 			size_t len = strlen(msg);
+ 			memcpy(buf, msg, min(buflen - 1, len));
+-- 
+2.37.3
+
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.7.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.8.bb
similarity index 92%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.7.bb
rename to meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.8.bb
index f30822b06e..3a525e8a15 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.7.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.8.bb
@@ -4,11 +4,11 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
 
 SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https \
-           file://0001-Fix-system-header-includes.patch \
+           file://0001-libtrace-Use-XSI-version-of-strerror_r-on-non-glibc-.patch \
            file://rasdaemon.service \
            file://init"
 
-SRCREV = "aa96737648d867a3d73e4151d05b54bbab494605"
+SRCREV = "c2255178a49f62c53009a456bc37dd5e37332f09"
 
 S = "${WORKDIR}/git"
 
@@ -32,10 +32,6 @@ PACKAGECONFIG[abrt-report] = "--enable-abrt-report,--disable-abrt-report"
 DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
-do_configure:prepend () {
-	( cd ${S}; autoreconf -vfi )
-}
-
 do_install:append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rasdaemon
-- 
2.37.3


