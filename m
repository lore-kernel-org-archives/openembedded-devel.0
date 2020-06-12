Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.10930.1591925740150732809
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 18:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8DFC440C2E;
	Fri, 12 Jun 2020 01:35:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9yHkwcBlSwC; Fri, 12 Jun 2020 01:35:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5604640AB5;
	Fri, 12 Jun 2020 01:35:38 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DEF2617320A;
	Thu, 11 Jun 2020 21:35:37 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] serialcheck: switch to a fork and update to the latest
Date: Thu, 11 Jun 2020 21:35:37 -0400
Message-Id: <1591925737-25568-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Original serialcheck at https://git.breakpoint.cc/cgit/bigeasy/serialcheck.git/
hasn't been updated since early 2015 and has been forked and continued at
https://github.com/nsekhar/serialcheck

Switch to the fork and update to the latest, while dropping merged and unneeded
patches.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - package serialstats separately into ${PN}-stats

 ...01-Add-option-to-enable-internal-loopback.patch | 81 ----------------------
 .../0001-Makefile-Change-order-of-link-flags.patch | 34 ---------
 .../0002-Restore-original-loopback-config.patch    | 49 -------------
 .../serialcheck/serialcheck_1.0.0.bb               | 27 ++++----
 4 files changed, 14 insertions(+), 177 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
 delete mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patch
 delete mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch

diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
deleted file mode 100644
index f69254a..0000000
--- a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 059d5512e840fe68e2bb37add6c9208fa9c34d15 Mon Sep 17 00:00:00 2001
-From: Sekhar Nori <nsekhar@ti.com>
-Date: Tue, 24 Feb 2015 22:16:37 +0530
-Subject: [PATCH 1/2] Add option to enable internal loopback
-
-Upstream-status: Pending
----
- serialcheck.c | 23 +++++++++++++++++++++++
- 1 file changed, 23 insertions(+)
-
-diff --git a/serialcheck.c b/serialcheck.c
-index 4f5b747..4100c37 100644
---- a/serialcheck.c
-+++ b/serialcheck.c
-@@ -12,6 +12,8 @@
- #include <sys/ioctl.h>
- #include <linux/serial.h>
-
-+#define TIOCM_LOOP	0x8000
-+
- #define __same_type(a, b)	__builtin_types_compatible_p(typeof(a), typeof(b))
- #define BUILD_BUG_ON_ZERO(e)	(sizeof(struct { int:-!!(e); }))
- #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
-@@ -40,6 +42,7 @@ struct g_opt {
-	unsigned char hflow;
-	unsigned char do_termios;
-	unsigned char *cmp_buff;
-+	unsigned char loopback;
- };
-
- /* name, key, arg, flags, doc, group */
-@@ -51,6 +54,7 @@ static struct argp_option options[] = {
-	{"mode",	'm', "M",    0, "transfer mode (d = duplex, t = send r = receive)", 0},
-	{"loops",	'l', "NUM",  0, "loops to perform (0 => wait fot CTRL-C", 0},
-	{"no-termios",	'n', NULL,   0, "No termios change (baud rate etc. remains unchanged)", 0},
-+	{"loopback",	'k', NULL,   0, "loopback mode", 0},
-	{NULL, 0, NULL, 0, NULL, 0}
- };
-
-@@ -67,6 +71,7 @@ static error_t parse_opt(int key, char *arg, struct argp_state *state)
-		go->baudrate = 115200;
-		go->loops = UINT_MAX;
-		go->do_termios = 1;
-+		go->loopback = 0;
-		break;
-	case ARGP_KEY_ARG:
-		ret =  ARGP_ERR_UNKNOWN;
-@@ -113,6 +118,9 @@ static error_t parse_opt(int key, char *arg, struct argp_state *state)
-		} else
-			go->loops = num;
-		break;
-+	case 'k':
-+		go->loopback = 1;
-+		break;
-	default:
-		ret = ARGP_ERR_UNKNOWN;
-	}
-@@ -487,6 +495,21 @@ int main(int argc, char *argv[])
-			die("tcflush failed: %m\n");
-	}
-
-+	if (opts.loopback) {
-+		unsigned int mcr;
-+
-+		ret = ioctl(fd, TIOCMGET, &mcr);
-+		if (ret < 0)
-+			die("mcr get failed: %m\n");
-+
-+		mcr |= TIOCM_LOOP;
-+
-+		ret = ioctl(fd, TIOCMSET, &mcr);
-+		if (ret < 0)
-+			die ("mcr set failed: %m\n");
-+
-+	}
-+
-	ret = fcntl(fd, F_SETFL, 0);
-	if (ret)
-		printf("Failed to remove nonblock mode\n");
---
-1.9.1
diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patch b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patch
deleted file mode 100644
index 2ab4834..0000000
--- a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From efc8a4e717ba919c869c2da1c7de2d08bc976926 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 Feb 2016 18:48:07 +0000
-Subject: [PATCH] Makefile: Change order of link flags
-
-This helps in injectcting LDFLAGS from env to take effect
-as it appears last on cmdline now
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Makefile | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index ba2bfbb..6d13e68 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,3 +1,9 @@
--CFLAGS=-O2 -Wall -Wextra -g -Wno-sign-compare -Wno-pointer-sign
--CC=gcc
-+CFLAGS?=-O2 -Wall -Wextra -g -Wno-sign-compare -Wno-pointer-sign
-+CC?=gcc
- all: serialcheck
-+serialcheck : serialcheck.o
-+	$(CC) -o serialcheck serialcheck.o $(CFLAGS) $(LDFLAGS)
-+
-+%.o : %.c
-+	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
-+
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch b/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
deleted file mode 100644
index 1b8c95b..0000000
--- a/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a6e5813d2f8402bf3a311c8bcda02623bfb76882 Mon Sep 17 00:00:00 2001
-From: Carlos Hernandez <ceh@ti.com>
-Date: Tue, 24 Feb 2015 16:00:34 -0500
-Subject: [PATCH 2/2] Restore original loopback config
-
-If loopback option is enabled, disable it at the end of the test.
-
-Signed-off-by: Carlos Hernandez <ceh@ti.com>
-Upstream-status: Pending
----
- serialcheck.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/serialcheck.c b/serialcheck.c
-index 4100c37..06470f7 100644
---- a/serialcheck.c
-+++ b/serialcheck.c
-@@ -427,6 +427,7 @@ int main(int argc, char *argv[])
-	unsigned char *data;
-	unsigned int open_mode;
-	off_t data_len;
-+	unsigned int mcr;
-
-	argp_parse(&argp, argc, argv, 0, NULL, &opts);
-	if (!opts.file_trans)
-@@ -496,8 +497,6 @@ int main(int argc, char *argv[])
-	}
-
-	if (opts.loopback) {
--		unsigned int mcr;
--
-		ret = ioctl(fd, TIOCMGET, &mcr);
-		if (ret < 0)
-			die("mcr get failed: %m\n");
-@@ -535,6 +534,12 @@ int main(int argc, char *argv[])
-	ret = tcsetattr(fd, TCSAFLUSH, &old_term);
-	if (ret)
-		printf("tcsetattr() of old ones failed: %m\n");
-+	if (opts.loopback) {
-+		mcr &= ~(TIOCM_LOOP);
-+		ret = ioctl(fd, TIOCMSET, &mcr);
-+	}
-+	if (ret)
-+		printf("disabling loopback failed: %m\n");
-
-	close(fd);
-	return status;
---
-1.9.1
diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
index cd5e0a4..16eaf62 100644
--- a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -1,30 +1,31 @@
 SUMMARY = "Application to verify operation of serial ports"
-HOMEPAGE = "http://git.breakpoint.cc/cgit/bigeasy/serialcheck.git/"
+HOMEPAGE = "https://github.com/nsekhar/serialcheck"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://git.breakpoint.cc/bigeasy/serialcheck.git \
-           file://0001-Add-option-to-enable-internal-loopback.patch \
-           file://0002-Restore-original-loopback-config.patch \
-           file://0001-Makefile-Change-order-of-link-flags.patch \
-           "
+SRC_URI = " \
+    git://github.com/nsekhar/serialcheck.git \
+"
 
-SRCREV = "63854a2d0c0129efab132ec328a75279e013fb84"
+SRCREV = "45eb2ffa5378396e85432872833890b0a1cba872"
 
 S = "${WORKDIR}/git"
 
+inherit autotools
+
 DEPENDS_append_libc-musl = " argp-standalone"
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE_append_libc-musl = " LIBS='-largp'"
 
-CFLAGS_prepend = "-Wall -Wextra -Wno-sign-compare -Wno-pointer-sign "
-LDFLAGS_append_libc-musl = " -largp"
+PACKAGE_BEFORE_PN += "${PN}-stats"
 
 do_install() {
     install -d ${D}${bindir}
-    install ${S}/serialcheck ${D}${bindir}
+    install ${B}/serialcheck ${D}${bindir}
+    install ${B}/serialstats ${D}${bindir}
     install -d ${D}${docdir}/${BP}
-    install ${S}/Readme.txt ${D}${docdir}/${BP}
+    install ${S}/README ${D}${docdir}/${BP}
 }
-CLEANBROKEN = "1"
+
+FILES_${PN}-stats = "${bindir}/serialstats"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.7.4

