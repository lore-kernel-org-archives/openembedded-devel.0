Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id F41B06FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 01:05:26 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y7so14374556pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jun 2017 18:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TmchiDn2yERIvNukNzPRxDqBYxEb0KxgXXHhLJc7qU0=;
	b=kBqi7EmMvAVeQGoeMwSLKxKSqfkouERPb+t6qVp0fT/u7S/G55PTNK4xaNzbNhG6Fb
	8MSDRRvcEApQpUU6IPL7tX30f8WpFDpOYvqW6oxpZ2gVZYbG/KI6P7bPm3sMbGTv9PHa
	avvNFRXft1zRBrIt//saOlsvy72yfEFUcA7gCVzjiAUwn4lVB1+QKAEYW+JZYyw/6tso
	cFC+xwJ+Rbew1SmPL5i8TueM8ffV4o1FmAiZ0pWkTGCpft4wgB7k8D0h3E14MUehtJW2
	S7x+JN+CvGbqhVIpmFqfEEanW56/mbgcbCVXs+g6CLO7OoKY93xEPl8XA63XiCruhCgf
	GAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TmchiDn2yERIvNukNzPRxDqBYxEb0KxgXXHhLJc7qU0=;
	b=aLAE+v0RZzxaSJorfFDLv3cDFgwyTv8QelpQVbX73xnn+3i7KrBp0vks4tso7meXPs
	8AIP9l/uB9tjyE90BngD2Sqe642dV7lhFJTakANQ6RayjiQl5hG7I37PFY5wMdurQhFE
	PvAVUlmnCil8W3pzx8fspT6srDD7vL4YbESN+4LNPAjLf+dv33hmKjY9S9LD9Rv/diR/
	gyQgbY4cRQ086ugilHtn9QYM8wdLFPTRFJAQLbkixBsp/0by98GIdqDQufnhXVa7uvFE
	oXGBJWIS5ead5FD8j/4sxrHp753Drox7IQ0hpynKXlH9xvCreXlkMdqN+XQztQYypkay
	E7hw==
X-Gm-Message-State: AKS2vOxPkuPUtzRkUbfgvADceLsyWjeGRHDUxEWxY/95pKdxO1s6dXvv
	ljxBEAZkaa+shuIg
X-Received: by 10.99.65.194 with SMTP id o185mr22979594pga.278.1497834327434; 
	Sun, 18 Jun 2017 18:05:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	t128sm15389319pfd.64.2017.06.18.18.05.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Jun 2017 18:05:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jun 2017 18:05:14 -0700
Message-Id: <20170619010516.11453-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-networking][PATCH 1/3] linux-atm: Fix build with hardening flags
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
X-List-Received-Date: Mon, 19 Jun 2017 01:05:28 -0000

Port to build on musl while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-ttcp-Add-printf-format-string.patch       | 34 ++++++++++++++++++++
 ...0002-sigd-Replace-on_exit-API-with-atexit.patch | 30 ++++++++++++++++++
 ...p-old-hack-to-compile-with-very-old-glibc.patch | 37 ++++++++++++++++++++++
 .../recipes-support/linux-atm/linux-atm_2.5.2.bb   |  3 ++
 4 files changed, 104 insertions(+)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-ttcp-Add-printf-format-string.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0002-sigd-Replace-on_exit-API-with-atexit.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-ttcp-Add-printf-format-string.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-ttcp-Add-printf-format-string.patch
new file mode 100644
index 000000000..87e7dc3c6
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-ttcp-Add-printf-format-string.patch
@@ -0,0 +1,34 @@
+From b83fd54584fabd5d24f6645b4a3cf345c9d2020d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 16:11:59 -0700
+Subject: [PATCH 1/3] ttcp: Add printf format string
+
+Fixes compiler warnings when format security is enabled
+
+| ../../../linux-atm-2.5.2/src/test/ttcp.c:666:21: error: format not a string literal and no format arguments [-Werror=format-security]
+|      fprintf(stderr, Usage);
+|                      ^~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/test/ttcp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/test/ttcp.c b/src/test/ttcp.c
+index acb9185..337cee5 100644
+--- a/src/test/ttcp.c
++++ b/src/test/ttcp.c
+@@ -663,7 +663,7 @@ int no_check = 0;
+     exit(0);
+ 
+   usage:
+-    fprintf(stderr, Usage);
++    fprintf(stderr, "%s", Usage);
+     exit(1);
+ }
+ 
+-- 
+2.13.1
+
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0002-sigd-Replace-on_exit-API-with-atexit.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0002-sigd-Replace-on_exit-API-with-atexit.patch
new file mode 100644
index 000000000..ce061231c
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0002-sigd-Replace-on_exit-API-with-atexit.patch
@@ -0,0 +1,30 @@
+From 27fa80dc8045e71c30dd2abea835206d5c8f6c71 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 16:18:56 -0700
+Subject: [PATCH 2/3] sigd: Replace on_exit() API with atexit()
+
+on_exit is not universally available
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sigd/atmsigd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sigd/atmsigd.c b/src/sigd/atmsigd.c
+index 52e41c7..b766606 100644
+--- a/src/sigd/atmsigd.c
++++ b/src/sigd/atmsigd.c
+@@ -517,7 +517,7 @@ int main(int argc,char **argv)
+ 	    exit(0);
+ 	}
+     }
+-    (void) on_exit(trace_on_exit,NULL);
++    atexit(trace_on_exit);
+     poll_loop();
+     close_all();
+     for (sig = entities; sig; sig = sig->next) stop_saal(&sig->saal);
+-- 
+2.13.1
+
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch
new file mode 100644
index 000000000..0302286dc
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch
@@ -0,0 +1,37 @@
+From fe954b2fb17d813aaab3e926cee76144314a115a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 16:22:55 -0700
+Subject: [PATCH 3/3] mpoad: Drop old hack to compile with very old glibc
+
+Use poll.h instead of sys/poll.h
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mpoad/io.c | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/src/mpoad/io.c b/src/mpoad/io.c
+index 69900c2..8d1433f 100644
+--- a/src/mpoad/io.c
++++ b/src/mpoad/io.c
+@@ -10,14 +10,7 @@
+ #include <errno.h>
+ #include <sys/ioctl.h>
+ #include <sys/param.h> /* for OPEN_MAX   */
+-#if __GLIBC__ >= 2
+-#include <sys/poll.h>
+-#else /* ugly hack to make it compile on RH 4.2 - WA */
+-#include <syscall.h>
+-#include <linux/poll.h>
+-#define SYS_poll 168
+-_syscall3(int,poll,struct pollfd *,ufds,unsigned int,nfds,int,timeout);
+-#endif
++#include <poll.h>
+ #include <atm.h>
+ #include <linux/types.h>
+ #include <linux/atmioc.h>
+-- 
+2.13.1
+
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 6ab8b07d0..9fce4fba6 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -11,6 +11,9 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://link-with-ldflags.patch \
            file://install-from-buildir.patch \
            file://0001-fix-compile-error-with-linux-kernel-v4.8.patch \
+           file://0001-ttcp-Add-printf-format-string.patch \
+           file://0002-sigd-Replace-on_exit-API-with-atexit.patch \
+           file://0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch \
 "
 
 SRC_URI[md5sum] = "d49499368c3cf15f73a05d9bce8824a8"
-- 
2.13.1


