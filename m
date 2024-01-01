Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35DBC4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 15:45:30 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.7790.1704123928201458738
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 07:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D1F4Ec+1;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d858c56cbso15870095e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704123926; x=1704728726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ob0ob+6cimVRLIub1bCJTpdvU3xoqm9NbnKVbyAA41o=;
        b=D1F4Ec+1jJQh0aS/Q//4kOVe9rnbhOc0XcDhJgF8hMxEig+kYSRxeSZ+D9SpuIQgll
         jABtHb+I+eKwMywE1exEC8w43T2kEucJ2SKJXin1lRqDRbaSe+ncthvvI8YtGhhoSPze
         rvAJDCVHGIzVxyHgM1QvkHREqUDEVot3WvdB+Ch3XFNG1nLlD5dwf2upG3/2C3+57OlW
         GzJe4RWNkauR/zC+8iBpTmHQsKtpmmqh1vzwcHlkYw5gmHMJsh/tX1ieuu/3JL1zmiGR
         rZcRHig+mzRbJIAooJW0gWUaH9laOhYrvWGfsmrhLcaYK7KkVwjUl0RYRvG9K8LCiLDe
         Ku4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704123926; x=1704728726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ob0ob+6cimVRLIub1bCJTpdvU3xoqm9NbnKVbyAA41o=;
        b=m1nJnwN2rNVXQFqH0HRkCJ/HrNiaovIzQHIa3ZLOz0lZbEV2cRxnuR1gniXqLQ2JOD
         8e05ljTXmxbBwgpWL+KxeqykeNyqZRNEg74jvgX1XZ7dV5Evp8smIEvbIBfG4668IJyx
         yUtlixiMbySQciubIpVaHvHsap3YX5KtSxVybCjPg6iAVeGeMQUWVqsFN6sjNzcDcCGE
         I2+yEsZxTaQF5ZrKarvjr0F7LuGz7+/BnmxAADEf0bzMPB7bQRz8fhK6THXy4kSEk/js
         wWVDm/2v5eZU6sfbohiFK7XeJB9lemXUpzmBR7mMw0CluT4upWG3mhXxqHP1r1YOz10S
         FTZw==
X-Gm-Message-State: AOJu0Yy/w4yfcweX3dpXQy5wVrKvOStbfEht6v+CP353syzGgcV7LKbv
	YKPxVdhn4QTf87GzQLukqh1/aOwbXJE=
X-Google-Smtp-Source: AGHT+IFP9Z3sbZkeX/fyiZBof1a3DvdwC0jku1pOQ2e2a31Zpm134IL3q8DPlduTA42oZ0vFgxSChw==
X-Received: by 2002:a05:600c:3494:b0:40d:8a2a:220b with SMTP id a20-20020a05600c349400b0040d8a2a220bmr549510wmq.171.1704123925863;
        Mon, 01 Jan 2024 07:45:25 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.193])
        by smtp.gmail.com with ESMTPSA id fb8-20020a05600c520800b0040d87b9eec7sm5353637wmb.32.2024.01.01.07.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 07:45:25 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libnvme: upgrade 1.6 -> 1.7.1
Date: Mon,  1 Jan 2024 18:45:19 +0300
Message-Id: <20240101154519.540245-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 15:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107985

* Patch dropped because it is already available in the new version.

Changelog:

====== 1.7.1 ======

* The v1.7 contains a bug in the sysfs scan topology code which could double free some memory. As this is a very common code path to execute, it's worth to get this fix out fast.

======= 1.7 =======

* allocated payloads aligned
* refactoring and improvements of RAE handling in get log pages
* auto cleanup of resources
* build instruction update and improving build situation for older distros
* support for TP8018
* use sysfs only for topology scan

The last point addresses a long standing problem. Whenever 'nvme list' is used it could add error log entries for certain devices. With the corresponding kernel changes this will not happen anymore. It also unlocks some possible new features. Note this depends on the upcoming 6.8 kernel.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...01-test-handle-POSIX-ioctl-prototype.patch | 68 -------------------
 .../{libnvme_1.6.bb => libnvme_1.7.1.bb}      |  6 +-
 2 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
 rename meta-oe/recipes-support/libnvme/{libnvme_1.6.bb => libnvme_1.7.1.bb} (86%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch b/meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
deleted file mode 100644
index ef9cc47d2..000000000
--- a/meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From ca47ba3119365eafac0ab25a86cab9d9a1b29bd4 Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Sat, 30 Sep 2023 06:38:53 +0100
-Subject: [PATCH] test: handle POSIX ioctl prototype
-
-glibc has the following prototype for ioctl: int ioctl(int fd, unsigned long request, ...)
-POSIX (inc. musl) has the following for ioctl: int ioctl(int fd, int request, ...)
-
-Check which prototype is used in <sys/ioctl.h> to avoid a conflict and conditionally
-define the right one for the system.
-
-Bug: https://bugs.gentoo.org/914921
-Signed-off-by: Sam James <sam@gentoo.org>
-Upstream-Status: Backport [https://github.com/linux-nvme/libnvme/commit/ca47ba3119365eafac0ab25a86cab9d9a1b29bd4]
----
- meson.build       | 10 ++++++++++
- test/ioctl/mock.c |  6 +++++-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 6fcf1da..2c979cc 100644
---- a/meson.build
-+++ b/meson.build
-@@ -230,6 +230,16 @@ conf.set(
-     ),
-     description: 'Is network address and service translation available'
- )
-+conf.set(
-+    'HAVE_GLIBC_IOCTL',
-+    cc.compiles(
-+        '''#include <sys/ioctl.h>
-+        int ioctl(int fd, unsigned long request, ...);
-+        ''',
-+        name: 'ioctl has glibc-style prototype'
-+    ),
-+    description: 'Is ioctl the glibc interface (rather than POSIX)'
-+)
- 
- if cc.has_function_attribute('fallthrough')
-   conf.set('fallthrough', '__attribute__((__fallthrough__))')
-diff --git a/test/ioctl/mock.c b/test/ioctl/mock.c
-index e917244..5d2ac94 100644
---- a/test/ioctl/mock.c
-+++ b/test/ioctl/mock.c
-@@ -114,7 +114,11 @@ void end_mock_cmds(void)
- 	} \
- })
- 
-+#ifdef HAVE_GLIBC_IOCTL
- int ioctl(int fd, unsigned long request, ...)
-+#else
-+int ioctl(int fd, int request, ...)
-+#endif
- {
- 	struct mock_cmds *mock_cmds;
- 	bool result64;
-@@ -141,7 +145,7 @@ int ioctl(int fd, unsigned long request, ...)
- 		result64 = true;
- 		break;
- 	default:
--		fail("unexpected %s %lu", __func__, request);
-+		fail("unexpected %s %lu", __func__, (unsigned long) request);
- 	}
- 	check(mock_cmds->remaining_cmds,
- 	      "unexpected %s command", mock_cmds->name);
--- 
-2.40.1
-
diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.6.bb b/meta-oe/recipes-support/libnvme/libnvme_1.7.1.bb
similarity index 86%
rename from meta-oe/recipes-support/libnvme/libnvme_1.6.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.7.1.bb
index 802edac50..985fd7c55 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.7.1.bb
@@ -11,11 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "37a803cf77e224f66d86b1e1d9e74a15f55ea600"
+SRCREV = "13ba38387e5446849ae59d3ccd8183cf9aca3145"
 
-SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master \
-           file://0001-test-handle-POSIX-ioctl-prototype.patch \
-"
+SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


