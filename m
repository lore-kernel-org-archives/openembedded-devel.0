Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF02C54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:21:22 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6386.1785223275672137173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 00:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XbAoQyv3;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848479c9bd5so2732393b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785223275; x=1785828075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYC8UQUQ5qVXrw4BMijFr5/rZBmE7d0IuTvpiIRHEyI=;
        b=XbAoQyv3b2axr8c1x4bc0MyDi0aSs4v4uR3NFsY3qIBgER5iNB/jTotr2zFIcRFyBy
         0N8haGQcp1YkHVDjEbKQvGCROy7o4oL7XmABgjZN9gOPwdozRKSS56F4pkCmfG4eVjX6
         S8zv+Tgli0lzW29HuG88BcPTjmopmCGLaNB+ibiaP+4mCyVLH9Zo/CyuL1BOULX6kYNS
         9JkFBL7JUEwcTk2ubeKkSh2N5xY9KfbgITQG8v2lMxf5efM8oKXP3HXsVMXxxuvvMJWf
         5rLNxJmm1V6e8DYbV41fqcdX/lwvon2YCNbv7ICXmw0en1l/W/Hr12Rv062TIJBArPXo
         Ytxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223275; x=1785828075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYC8UQUQ5qVXrw4BMijFr5/rZBmE7d0IuTvpiIRHEyI=;
        b=kMPdKbz6Ba1AVlpyqSxwPvsl0q+hPpeyj6+X/A91lk4S04KE2PixOkhPBSpnPqnm1i
         ZY9ZQExqzWShpBBtMHzVQ7w5lVQ/y789FuemkWVYVUPzFMupPz9hyqEYjxQ6XOhsaaSI
         Fh3yG3L+1khsr58TSsSqn1e6pxUfG0G5eQ55ijNdR5O5ufMs1fCt6hchTdFcD1/SW5Od
         QA+vSzzjy0nf8mhxoyX7VPyv3bJqg24dF/qhJiwUAQ6kqTDkVK0OnTb5k3Z036ZtEi4C
         4gdnMIxEsZauCvzYT7xDy2skYYJdBBRVNOdRaFQgZbdxWTn7JgpH1df0Eq8Spvd47Ian
         UYLQ==
X-Gm-Message-State: AOJu0Yy17md6OjPwwL0YzpdnLAthKPmLggwk3dnIX56+0FJ0SVDRhGub
	RwYECJdis2ZKcUwyrWdzG0TUZoGHoDYRQoXjf/CV0CCBNgZ7BIqSgEuJ1r5B4lfK
X-Gm-Gg: AR+sD13Osh8knGRI6c1Cpyxp40krZ/upmrtczWzbrnLXZDKe16ZTjKKhSr4dw8WtjHO
	YISZlYwKdWseTOu1L/xYPqFpCvNYtq9HnNR0A8ITzT1w6/ovFIMAoXd5JcsHuYTCUTz4QUh49u8
	snbR6Lrihu4L1Os9wPnzqFZND3cQbw9vivnwxNjW5+5ZOZZ49vgZGCPfZceiraLkCOJOCyzL8Wy
	Lwc84Qoy3LcMS38hRmNRMRrEFg0MIY54320klwb4nH6watoGluDTxTLvk9F5kfO6JVqy3YfI9AZ
	f84TnWf1XwBTeY7oehn9STsUvtqW9s9HoNJIPU3BalWH2o/XRJDrAlpIcKnDRhigC4tRc7CgrM5
	6NQbKxv6GppZQWG4OHo2pE1vAU+/fbywMPR9kjHYxcRQ/9TJEQeP09tq/sP+jMohCfLbyEPvZlG
	g4UigBYMLUyDp03DnIjJjlRfYT2WoC7thWIBsXvB5wCJRXbEJ967QEAk3h289IG8ZY3HkMPOaHe
	HQ8IfKITTYqF41BTuUTXgbYm5XRHDr69eioAfPlZ110rTxPpAIkTLGUi8aacxWcUcYjnaHvEJnW
	sbb4ZlS6qN6PZxXoDRY=
X-Received: by 2002:a05:6a21:6e91:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3c8ba6132f8mr1632986637.51.1785223274558;
        Tue, 28 Jul 2026 00:21:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm37245911eec.28.2026.07.28.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:21:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/4] uml-utilities: remove recipe
Date: Tue, 28 Jul 2026 00:21:08 -0700
Message-ID: <20260728072111.3266991-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 07:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128503

Upstream is dead. The newest tools tarball on SourceForge is
uml_utilities_20040406 from 2004-04-08 [1], which is what this recipe
tracks, and the project's last artifact of any kind is a 2.4 kernel
patch from Nov 2004. The tarball still ships CVS metadata directories.

Keeping it building against a current toolchain has meant carrying six
portability patches (~450 lines) for missing headers, stat64 -> stat and
LDFLAGS handling, with a new one needed every couple of years.

Most of what it installs is no longer relevant to UML. The current
kernel UML HOWTO [2] documents only the vector transports and does not
mention uml_net or uml_switch at all. uml_net is also installed setuid
root and execvp()s bare "ifconfig"/"route" off $PATH from that setuid
context, which is not something we should be shipping.

tunctl is not lost: meta-networking has a standalone tunctl recipe, and
uml-utilities only registered it through update-alternatives at the
default priority anyway.

Nothing in any layer depends on it - the only reference was the
meta-oe-extended packagegroup, for build coverage.

Debian has since moved to a later 20070815.4 snapshot from a different
upstream tree, and even that was removed from testing in Nov 2025 with
open RC bugs [3]. Should anyone want uml_mconsole, uml_moo/uml_mkcow or
port-helper back, the right starting point is that snapshot rather than
this one.

[1] https://sourceforge.net/projects/user-mode-linux/files/tools/1/
[2] https://docs.kernel.org/virt/uml/user_mode_linux_howto_v2.html
[3] https://tracker.debian.org/pkg/uml-utilities

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |   1 -
 ...andard-headers-for-str-and-exit-APIs.patch |  64 ---------
 .../0001-cow.c-Replace-stat64-with-stat.patch |  34 -----
 ...-system-header-files-for-fd_set-and-.patch |  43 ------
 ...ppend-to-CFLAGS-instead-of-re-assign.patch | 122 ------------------
 .../uml-utilities-20040406/fix-ldflags.patch  | 106 ---------------
 .../uml-utilities-20040406/unstrip.patch      |  86 ------------
 .../uml-utilities/uml-utilities_20040406.bb   |  33 -----
 8 files changed, 489 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch
 delete mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch
 delete mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-include-required-system-header-files-for-fd_set-and-.patch
 delete mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch
 delete mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
 delete mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch
 delete mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 824ef445f1..66d48f25f3 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -410,7 +410,6 @@ RDEPENDS:packagegroup-meta-oe-extended = "\
     tmate \
     tmux \
     triggerhappy \
-    uml-utilities \
     upm \
     vlock \
     volume-key \
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch
deleted file mode 100644
index 9fce51a593..0000000000
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From a1c4716ceaed6333f8be01b5d4d971e64babcdd7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Sep 2022 18:57:42 -0700
-Subject: [PATCH] Add missing standard headers for str* and exit APIs
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- jail/jail_uml             | Bin 19120 -> 19120 bytes
- jail/jail_uml.c           |   1 +
- port-helper/port-helper.c |   1 +
- uml_router/port.c         |   1 +
- uml_router/uml_switch.c   |   1 +
- watchdog/uml_watchdog.c   |   1 +
- 6 files changed, 5 insertions(+)
-
---- a/jail/jail_uml.c
-+++ b/jail/jail_uml.c
-@@ -1,5 +1,6 @@
- #include <stdio.h>
- #include <unistd.h>
-+#include <stdlib.h> /* for exit */
- #include <errno.h>
-
- static void Usage(void)
---- a/port-helper/port-helper.c
-+++ b/port-helper/port-helper.c
-@@ -12,6 +12,7 @@ for read and write, and the console is f
-
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h> /* memset */
- #include <signal.h>
- #include <errno.h>
- #include <unistd.h>
---- a/uml_router/port.c
-+++ b/uml_router/port.c
-@@ -1,5 +1,6 @@
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h> /* memcmp */
- #include <unistd.h>
- #include <errno.h>
- #include <sys/socket.h>
---- a/uml_router/uml_switch.c
-+++ b/uml_router/uml_switch.c
-@@ -5,6 +5,7 @@
- #include <stdio.h>
- #include <errno.h>
- #include <stdlib.h>
-+#include <string.h> /* strcmp */
- #include <signal.h>
- #include <fcntl.h>
- #include <stdint.h>
---- a/watchdog/uml_watchdog.c
-+++ b/watchdog/uml_watchdog.c
-@@ -1,5 +1,6 @@
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h> /* strcmp */
- #include <unistd.h>
- #include <signal.h>
- #include <errno.h>
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch
deleted file mode 100644
index 348d7ce104..0000000000
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c4f85268da6c30b0aec3d9a0e951b2088887cff4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 May 2023 18:35:37 -0700
-Subject: [PATCH] cow.c: Replace stat64 with stat
-
-LFS64 is deprecated in latest musl and this fails to build
-therefore switch to using stat API which is same as stat64 these days
-
-Upstream-Status: Inappropriate [No upstream]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- moo/cow.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/moo/cow.c
-+++ b/moo/cow.c
-@@ -161,7 +161,7 @@ int write_cow_header(char *cow_file, int
- 		     int sectorsize, int alignment, long long *size)
- {
-         struct cow_header_v3 *header;
--	struct stat64 buf;
-+	struct stat buf;
- 	int err;
-
- 	err = cow_seek_file(fd, 0);
-@@ -192,7 +192,7 @@ int write_cow_header(char *cow_file, int
- 		      backing_file))
- 		goto out_free;
-
--	err = stat64(header->backing_file, &buf);
-+	err = stat(header->backing_file, &buf);
- 	if(err < 0){
- 		cow_printf("Stat of backing file '%s' failed, errno = %d\n",
- 			   header->backing_file, errno);
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-include-required-system-header-files-for-fd_set-and-.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-include-required-system-header-files-for-fd_set-and-.patch
deleted file mode 100644
index 02aca7da45..0000000000
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-include-required-system-header-files-for-fd_set-and-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a8d85949a068ee6cd9a2f923cd039047993f239e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 Apr 2017 17:11:32 -0700
-Subject: [PATCH] include required system header files for fd_set and makedev
-
-fd_set comes from sys/select.h
-makedev macro is defined in sys/sysmacros.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- uml_net/ethertap.c | 1 +
- uml_net/host.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/uml_net/ethertap.c b/uml_net/ethertap.c
-index ddd41f2..57f7119 100644
---- a/uml_net/ethertap.c
-+++ b/uml_net/ethertap.c
-@@ -11,6 +11,7 @@
- #include <sys/signal.h>
- #include <sys/socket.h>
- #include <sys/stat.h>
-+#include <sys/select.h>
- #include <sys/ioctl.h>
- #include <net/if.h>
- #include "host.h"
-diff --git a/uml_net/host.c b/uml_net/host.c
-index 65c20df..fc04cd4 100644
---- a/uml_net/host.c
-+++ b/uml_net/host.c
-@@ -10,6 +10,7 @@
- #include <ctype.h>
- #include <sys/wait.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include "output.h"
- #include "host.h"
-
---
-2.12.2
-
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch
deleted file mode 100644
index 1962e84c7e..0000000000
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From ac72fffe639d564f59ec1e1eafde83980acef1b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 23 May 2023 14:40:31 -0700
-Subject: [PATCH] makefiles: Append to CFLAGS instead of re-assign
-
-This helps in inserting yocto provided CFLAGS from build environment
-
-Upstream-Status: Inappropriate [No upstream]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- jailtest/Makefile    | 2 +-
- mconsole/Makefile    | 2 +-
- moo/Makefile         | 2 +-
- port-helper/Makefile | 2 +-
- tunctl/Makefile      | 2 +-
- uml_net/Makefile     | 2 +-
- uml_router/Makefile  | 2 +-
- watchdog/Makefile    | 2 +-
- 8 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/jailtest/Makefile b/jailtest/Makefile
-index 610ca1a..025fca9 100644
---- a/jailtest/Makefile
-+++ b/jailtest/Makefile
-@@ -1,6 +1,6 @@
- OBJS = jailtest.o
- BIN = jailtest
--CFLAGS = -g -Wall
-+CFLAGS += -g -Wall
-
- BIN_DIR ?= /usr/bin
-
-diff --git a/mconsole/Makefile b/mconsole/Makefile
-index 9818d8a..74a2560 100644
---- a/mconsole/Makefile
-+++ b/mconsole/Makefile
-@@ -1,6 +1,6 @@
- BIN = uml_mconsole
- OBJS = $(BIN).o
--CFLAGS = -g -Wall
-+CFLAGS += -g -Wall
-
- BIN_DIR ?= /usr/bin
-
-diff --git a/moo/Makefile b/moo/Makefile
-index 6cdb591..60d300d 100644
---- a/moo/Makefile
-+++ b/moo/Makefile
-@@ -3,7 +3,7 @@ BIN = uml_moo uml_mkcow
- uml_moo_OBJS = uml_moo.o cow.o
- uml_mkcow_OBJS = uml_mkcow.o cow.o
-
--CFLAGS = -g -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
-+CFLAGS += -g -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
-
- BIN_DIR ?= /usr/bin
-
-diff --git a/port-helper/Makefile b/port-helper/Makefile
-index 8e33bdf..8b695f3 100644
---- a/port-helper/Makefile
-+++ b/port-helper/Makefile
-@@ -1,6 +1,6 @@
- OBJS = port-helper.o
- BIN = port-helper
--CFLAGS = -g -Wall
-+CFLAGS += -g -Wall
-
- LIB_DIR ?= /usr/lib/uml
-
-diff --git a/tunctl/Makefile b/tunctl/Makefile
-index 743bfea..a39ad2b 100644
---- a/tunctl/Makefile
-+++ b/tunctl/Makefile
-@@ -1,6 +1,6 @@
- OBJS = tunctl.o
- BIN = tunctl
--CFLAGS = -g -Wall
-+CFLAGS += -g -Wall
-
- BIN_DIR ?= /usr/bin
-
-diff --git a/uml_net/Makefile b/uml_net/Makefile
-index 36efec6..2e1ad0e 100644
---- a/uml_net/Makefile
-+++ b/uml_net/Makefile
-@@ -1,7 +1,7 @@
- TUNTAP = $(shell [ -e /usr/include/linux/if_tun.h ] && echo -DTUNTAP)
-
- BIN = uml_net
--CFLAGS = -g -Wall $(TUNTAP)
-+CFLAGS += -g -Wall $(TUNTAP)
-
- BIN_DIR ?= /usr/bin
-
-diff --git a/uml_router/Makefile b/uml_router/Makefile
-index b7b5401..e399ea5 100644
---- a/uml_router/Makefile
-+++ b/uml_router/Makefile
-@@ -2,7 +2,7 @@ TUNTAP = $(shell [ -e /usr/include/linux/if_tun.h ] && echo -DTUNTAP)
-
- OBJS = hash.o port.o uml_switch.o
- BIN = uml_switch
--CFLAGS = -g -Wall $(TUNTAP)
-+CFLAGS += -g -Wall $(TUNTAP)
-
- BIN_DIR ?= /usr/bin
-
-diff --git a/watchdog/Makefile b/watchdog/Makefile
-index c26fd9f..5178cc6 100644
---- a/watchdog/Makefile
-+++ b/watchdog/Makefile
-@@ -1,6 +1,6 @@
- BIN = uml_watchdog
- OBJS = $(BIN).o
--CFLAGS = -g -Wall
-+CFLAGS += -g -Wall
-
- BIN_DIR ?= /usr/bin
-
---
-2.40.1
-
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
deleted file mode 100644
index a66d7d5906..0000000000
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-Upstream-Status: Pending
-
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- tools/mconsole/Makefile~fix-ldflags	2003-02-08 05:10:08.000000000 +0100
-+++ tools/mconsole/Makefile	2004-04-01 15:37:37.000000000 +0200
-@@ -7,7 +7,7 @@
- all : $(BIN)
-
- $(BIN) : $(OBJS)
--	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) -lreadline -lncurses
-+	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS) -lreadline -lncurses
-
- clean :
- 	rm -f $(BIN) $(OBJS) *~
-diff -uNr tools.orig/jailtest/Makefile tools/jailtest/Makefile
---- tools.orig/jailtest/Makefile	2017-04-03 15:56:02.068461380 +0200
-+++ tools/jailtest/Makefile	2017-04-03 16:00:04.857449005 +0200
-@@ -7,7 +7,7 @@
- all : $(BIN)
-
- $(BIN) : $(OBJS)
--	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
-+	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
-
- clean :
- 	rm -f $(BIN) $(OBJS) *~
-diff -uNr tools.orig/moo/Makefile tools/moo/Makefile
---- tools.orig/moo/Makefile	2017-04-03 15:56:02.068461380 +0200
-+++ tools/moo/Makefile	2017-04-03 15:59:56.466449432 +0200
-@@ -10,10 +10,10 @@
- all : $(BIN)
-
- uml_moo : $(uml_moo_OBJS)
--	$(CC) $(CFLAGS) -o $@ $($@_OBJS)
-+	$(CC) $(CFLAGS) -o $@ $($@_OBJS) $(LDFLAGS)
-
- uml_mkcow : $(uml_mkcow_OBJS)
--	$(CC) $(CFLAGS) -o $@ $($@_OBJS)
-+	$(CC) $(CFLAGS) -o $@ $($@_OBJS) $(LDFLAGS)
-
- $(uml_moo_OBJS) $(uml_mkcow_OBJS) : cow.h cow_sys.h
-
-diff -uNr tools.orig/port-helper/Makefile tools/port-helper/Makefile
---- tools.orig/port-helper/Makefile	2017-04-03 15:56:02.068461380 +0200
-+++ tools/port-helper/Makefile	2017-04-03 15:59:41.251450208 +0200
-@@ -7,7 +7,7 @@
- all : $(BIN)
-
- $(BIN) : $(OBJS)
--	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
-+	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
-
- clean :
- 	rm -f $(BIN) $(OBJS) *~
-diff -uNr tools.orig/tunctl/Makefile tools/tunctl/Makefile
---- tools.orig/tunctl/Makefile	2017-04-03 15:56:02.068461380 +0200
-+++ tools/tunctl/Makefile	2017-04-03 16:00:01.091449197 +0200
-@@ -7,7 +7,7 @@
- all : $(BIN)
-
- $(BIN) : $(OBJS)
--	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
-+	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
-
- clean :
- 	rm -f $(BIN) $(OBJS) *~
-diff -uNr tools.orig/uml_net/Makefile tools/uml_net/Makefile
---- tools.orig/uml_net/Makefile	2017-04-03 15:56:02.068461380 +0200
-+++ tools/uml_net/Makefile	2017-04-03 16:00:12.449448618 +0200
-@@ -14,7 +14,7 @@
- all : $(BIN)
-
- $(BIN) : $(OBJS)
--	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
-+	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
-
- clean :
- 	rm -f $(BIN) $(OBJS) *~
-diff -uNr tools.orig/uml_router/Makefile tools/uml_router/Makefile
---- tools.orig/uml_router/Makefile	2017-04-03 15:56:02.068461380 +0200
-+++ tools/uml_router/Makefile	2017-04-03 16:00:46.796446867 +0200
-@@ -13,7 +13,7 @@
- all : $(BIN)
-
- $(BIN) : $(OBJS)
--	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
-+	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
-
- clean :
- 	rm -f $(BIN) $(OBJS) *~
-diff -uNr tools.orig/watchdog/Makefile tools/watchdog/Makefile
---- tools.orig/watchdog/Makefile	2017-04-03 15:56:02.068461380 +0200
-+++ tools/watchdog/Makefile	2017-04-03 15:59:45.216450006 +0200
-@@ -7,7 +7,7 @@
- all : $(BIN)
-
- $(BIN) : $(OBJS)
--	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
-+	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
-
- clean :
- 	rm -f $(BIN) $(OBJS) *~
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch
deleted file mode 100644
index b6fce00986..0000000000
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Upstream-Status: Pending
-
-Dont strip during install let the packaging handle it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: tools/jailtest/Makefile
-===================================================================
---- tools.orig/jailtest/Makefile	2003-02-07 20:10:27.000000000 -0800
-+++ tools/jailtest/Makefile	2012-09-05 12:13:56.061615854 -0700
-@@ -14,4 +14,4 @@
-
- install : $(BIN)
- 	install -d $(DESTDIR)$(BIN_DIR)
--	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
-+	install $(BIN) $(DESTDIR)$(BIN_DIR)
-Index: tools/mconsole/Makefile
-===================================================================
---- tools.orig/mconsole/Makefile	2012-09-05 12:05:09.869607043 -0700
-+++ tools/mconsole/Makefile	2012-09-05 12:14:07.725607469 -0700
-@@ -14,4 +14,4 @@
-
- install : $(BIN)
- 	install -d $(DESTDIR)$(BIN_DIR)
--	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
-+	install $(BIN) $(DESTDIR)$(BIN_DIR)
-Index: tools/moo/Makefile
-===================================================================
---- tools.orig/moo/Makefile	2003-06-26 09:27:00.000000000 -0700
-+++ tools/moo/Makefile	2012-09-05 12:14:20.981604580 -0700
-@@ -22,4 +22,4 @@
-
- install : $(BIN)
- 	install -d $(DESTDIR)$(BIN_DIR)
--	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
-+	install $(BIN) $(DESTDIR)$(BIN_DIR)
-Index: tools/port-helper/Makefile
-===================================================================
---- tools.orig/port-helper/Makefile	2003-02-07 20:05:31.000000000 -0800
-+++ tools/port-helper/Makefile	2012-09-05 12:14:39.429609678 -0700
-@@ -14,4 +14,4 @@
-
- install : $(BIN)
- 	install -d $(DESTDIR)$(LIB_DIR)
--	install -s $(BIN) $(DESTDIR)$(LIB_DIR)
-+	install $(BIN) $(DESTDIR)$(LIB_DIR)
-Index: tools/tunctl/Makefile
-===================================================================
---- tools.orig/tunctl/Makefile	2003-02-07 20:05:04.000000000 -0800
-+++ tools/tunctl/Makefile	2012-09-05 12:14:49.985606470 -0700
-@@ -14,4 +14,4 @@
-
- install : $(BIN)
- 	install -d $(DESTDIR)$(BIN_DIR)
--	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
-+	install $(BIN) $(DESTDIR)$(BIN_DIR)
-Index: tools/uml_net/Makefile
-===================================================================
---- tools.orig/uml_net/Makefile	2003-02-07 20:04:55.000000000 -0800
-+++ tools/uml_net/Makefile	2012-09-05 12:15:00.961607290 -0700
-@@ -21,4 +21,4 @@
-
- install : $(BIN)
- 	install -d $(DESTDIR)$(BIN_DIR)
--	install -s -m 04755 $(BIN) $(DESTDIR)$(BIN_DIR)
-+	install -m 04755 $(BIN) $(DESTDIR)$(BIN_DIR)
-Index: tools/uml_router/Makefile
-===================================================================
---- tools.orig/uml_router/Makefile	2003-02-07 20:04:39.000000000 -0800
-+++ tools/uml_router/Makefile	2012-09-05 12:15:10.649607571 -0700
-@@ -20,4 +20,4 @@
-
- install : $(BIN)
- 	install -d $(DESTDIR)$(BIN_DIR)
--	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
-+	install $(BIN) $(DESTDIR)$(BIN_DIR)
-Index: tools/watchdog/Makefile
-===================================================================
---- tools.orig/watchdog/Makefile	2003-02-07 20:04:25.000000000 -0800
-+++ tools/watchdog/Makefile	2012-09-05 12:15:35.561612203 -0700
-@@ -14,4 +14,4 @@
-
- install : $(BIN)
- 	install -d $(DESTDIR)$(BIN_DIR)
--	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
-+	install $(BIN) $(DESTDIR)$(BIN_DIR)
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
deleted file mode 100644
index 0e189b558f..0000000000
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SECTION = "console/utils"
-SUMMARY = "Utilities for User-Mode-Linux"
-LICENSE = "GPL-2.0-only"
-DEPENDS = "zlib ncurses readline"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-SRC_URI = "http://downloads.sourceforge.net/project/user-mode-linux/tools/1/uml_utilities_${PV}.tar.bz2 \
-           file://fix-ldflags.patch \
-           file://unstrip.patch \
-           file://0001-include-required-system-header-files-for-fd_set-and-.patch \
-           file://0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch \
-           file://0001-cow.c-Replace-stat64-with-stat.patch \
-           file://0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch \
-           "
-SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cded9f41"
-
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/user-mode-linux/files/tools/1/"
-
-S = "${UNPACKDIR}/tools"
-
-inherit update-alternatives
-
-do_compile() {
-    oe_runmake LIB_DIR=${libdir}/uml
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D} LIB_DIR=${libdir}/uml
-}
-
-FILES:${PN} += "${libdir}/uml"
-
-ALTERNATIVE:${PN} = "tunctl"
-ALTERNATIVE_LINK_NAME[tunctl] = "${bindir}/tunctl"

