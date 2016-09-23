Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 013906069D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 15:59:02 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id s29so5931987lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=84+4pMQf9LI4u5wwEmR4hsap8Z5OKm66y4/aSprV83U=;
	b=UtpIWXtq69vJDCgoPcrQ5pUcMDFzEuJgK2UfvlotLKhwEf9gLRashSxv6hXd49hxnl
	VMgSggnIwyNL1w415nDAeJIrC5hSyVkECjplLgIwUysztF1xQd7QmByFVSUeSQzt12Gq
	pkxfazjUKJuwn25LToy/w/2fJbLadynPqVh6gg7NXQjJDBfoyjTzhY8YCCoaNtITP8cP
	jlYCyi7EqDnDv6nT0xn4NbRAMM2JuUEqIKwx3t6LfDT8sNS1eoFBRIUFAMt7nyY0OPud
	MJStALHC5Oe+xeUQBWaemayq8i8gzm7csVlI+CgB4htOMp6oGIkZ4MTrH8J5LpFEEcp9
	JsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=84+4pMQf9LI4u5wwEmR4hsap8Z5OKm66y4/aSprV83U=;
	b=m3J4ZWuBdsX37kNw6SqHyTCxODKI/HsrsZveLA2c/H6nxEXOpno/zsD4hZJknf00/G
	/BejVmz1FuJy2PI0pRoKVF3M1ySHvyjvVbTs43CclIDxciCcS1Ld544dq+HEk0aGhK53
	L4+M96WkbEY9UR21fu83V79YFt9yOqzTkXRNW1vZw7Fz12Bc2cmgkwVrJZbcr3yAclw6
	cBgrUizxp7U6vkrVAHnP6K+0SVSTkLo8+poc5AIDulNZfBne7PrcPzfCgp6tI+xyPlIl
	VlbtRf7zrk70ic7LKgli0DVCYEvB+YsUFpkL6VxFvgVE9wYJlC4GqN2P1F9tisw9qihh
	FBRA==
X-Gm-Message-State: AE9vXwNIM7fKQSMTIA9Th9HoIZUOcERqnjhxnbzU/C6VrcCvcF1IhWwQV+r/E4TKtykTww==
X-Received: by 10.46.1.92 with SMTP id 89mr3313182ljb.77.1474646343087;
	Fri, 23 Sep 2016 08:59:03 -0700 (PDT)
Received: from localhost.localdomain (m77-218-246-7.cust.tele2.se.
	[77.218.246.7]) by smtp.gmail.com with ESMTPSA id
	h14sm1284037ljh.21.2016.09.23.08.59.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Sep 2016 08:59:02 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Sep 2016 17:58:53 +0200
Message-Id: <1474646333-26474-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] rsyslog: fix building with musl libc
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
X-List-Received-Date: Fri, 23 Sep 2016 15:59:03 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

- struct timeval is defined in sys/time.h with a musl libc.
- include fcntl.h without the conditional checking.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../rsyslog/rsyslog/fix_build_with_musl.patch      | 62 ++++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb  |  2 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
new file mode 100644
index 0000000..206ef97
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
@@ -0,0 +1,62 @@
+From 51464a1c3522d738f340bef05ed7c68123b66aa5 Mon Sep 17 00:00:00 2001
+From: Peter Liu <peter.x.liu@external.atlascopco.com>
+Date: Fri, 23 Sep 2016 17:35:42 +0200
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
+index 3335067..c20a015 100644
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
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
index c1d923c..48c1056 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
@@ -30,6 +30,8 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://enable_tls_ptests.patch \
 "
 
+SRC_URI_append_libc-musl = " file://fix_build_with_musl.patch"
+
 SRC_URI[md5sum] = "093c462a5245012bd9e7b82dd8aedffb"
 SRC_URI[sha256sum] = "357f089d866c351d5fe5b7139fa85b010223d77b3c21f29b2a1baa8688926111"
 
-- 
1.9.1


