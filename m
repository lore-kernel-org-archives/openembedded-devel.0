Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 14D41607B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 06:43:49 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id l131so893844lfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=y6aAwX3msHRgmzQ5enlyh6JFqSVScFUT8ZdnmBvTNHU=;
	b=Fyqq8PW80APL3jxsxZcPKvCkl+g5dkO1nu70wW6m9/LSihaz4RJfiNZhPArK8fhDN8
	5CaXnEHwsE1OZKhIO/p2mKJj8DJ7HBzT/0zMJrhGPbGQ6wap8FvMitUIZ2paEskJ8Lo5
	QK3vk1XuJbDFUELyLAO0BNxxQuDdtSCdzMyyCmmhQzA/1tdQq1t2p21FZK+aj9YBlHcA
	jEv4DeM1VZskgHtZ3N9TgDmrPt1sUCWII8N2Mejsowwrvdn3aAwcRgTqLMtLLGhvAMG7
	jIAE6yew9lkUmqrjNoJmqfU+yzIawbkPp7J3xyQ8i0gF3CLN8YmVIrAzAY3Q2Dv5TbRs
	+0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y6aAwX3msHRgmzQ5enlyh6JFqSVScFUT8ZdnmBvTNHU=;
	b=UPWLTVAS2Yr/6alkemt+Gcexn+8LHkGI8ZfnmGWYW3AZVIHRZvQYcBruk/2xamkGiF
	Co6zhpXMSaeWsg3igh8496BAUPoYEYV5ZYnEQ1Nm8KmiJfaivw5fLxkWYvsdoM9nRrxk
	13WbynKtz5qXaapmNDgzadL59O10rqEiN4gb31HbW9N7qwP0J6KCLvTqHOtHKstqwrzT
	AnddDPfW4t5lys8cNwGLEgQW5tLt9B0NqiVeFw4XrjAbtl4E7Z5chleQiXiNMyXKLhlx
	yDi/wfIj9QeyzfehtlTtGssaUSxxhAOeKFdnQIXt4fX0T3GJ1aDFUWotEeWOfuzwEv8I
	Qipg==
X-Gm-Message-State: AE9vXwPOCijJ0QfIo2K46TmOAoaE2Tnpj4DfifQ82n5MtQvJ6m/lPW8tppzvR7V1o/0gEA==
X-Received: by 10.25.32.134 with SMTP id g128mr9305521lfg.87.1474958630700;
	Mon, 26 Sep 2016 23:43:50 -0700 (PDT)
Received: from localhost.localdomain (m77-218-254-22.cust.tele2.se.
	[77.218.254.22])
	by smtp.gmail.com with ESMTPSA id 41sm145095ljb.37.2016.09.26.23.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 23:43:49 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 08:43:53 +0200
Message-Id: <1474958633-16995-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH V2] rsyslog: fixes musl libc build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Sep 2016 06:43:50 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

- struct timeval is defined in sys/time.h with a musl libc.
- include fcntl.h without the conditional checking.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../rsyslog/rsyslog/fix_build_with_musl.patch      | 62 ++++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb  |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
new file mode 100644
index 0000000..db35db0
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
@@ -0,0 +1,62 @@
+From b6cc506b6ad0b5dd9aa9831ed42e6759183aaf45 Mon Sep 17 00:00:00 2001
+From: Peter Liu <peter.x.liu@external.atlascopco.com>
+Date: Mon, 26 Sep 2016 17:03:57 +0200
+Subject: [PATCH] fix building with musl libc
+
+- struct timeval is defined in sys/time.h with a musl libc.
+- include fcntl.h without the conditional checking.
+
+Upstream-Status: Pending
+
+Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
+---
+ tests/msleep.c  | 2 +-
+ tools/omfile.c  | 4 +---
+ tools/pidfile.c | 2 --
+ 3 files changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/tests/msleep.c b/tests/msleep.c
+index 36fa01b..ca818be 100644
+--- a/tests/msleep.c
++++ b/tests/msleep.c
+@@ -26,7 +26,7 @@
+ #include "config.h"
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <time.h>
++#include <sys/time.h>
+ 
+ int main(int argc, char *argv[])
+ {
+diff --git a/tools/omfile.c b/tools/omfile.c
+index 11eab56..765ef91 100644
+--- a/tools/omfile.c
++++ b/tools/omfile.c
+@@ -48,9 +48,7 @@
+ #include <libgen.h>
+ #include <unistd.h>
+ #include <sys/file.h>
+-#ifdef OS_SOLARIS
+-#	include <fcntl.h>
+-#endif
++#include <fcntl.h>
+ #ifdef HAVE_ATOMIC_BUILTINS
+ #	include <pthread.h>
+ #endif
+diff --git a/tools/pidfile.c b/tools/pidfile.c
+index 8298b94..188cca4 100644
+--- a/tools/pidfile.c
++++ b/tools/pidfile.c
+@@ -36,9 +36,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <signal.h>
+-#ifdef __sun
+ #include <fcntl.h>
+-#endif
+ 
+ #include "srUtils.h"
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb
index 664ab9f..38bbe9c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://use_gnutls_certificate_type_set_priority_only_if_available.patch \
            file://bugfix-include-config.h-before-any-other-headers.patch \
            file://enable_tls_ptests.patch \
+           file://fix_build_with_musl.patch \
 "
 
 SRC_URI[md5sum] = "fa78a6e675fe78a811edcdf7eb6f1975"
-- 
1.9.1


