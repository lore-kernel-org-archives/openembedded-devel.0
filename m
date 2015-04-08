Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 053A673CC1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:43:24 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI00FBL3ZLYL90@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2015 13:42:58 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=NqFmqHZM c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8	a=1zuX0w3UXh9jMOohIYwA:9 a=AJvY2eXjBuM69a16:21
	a=Rqckg0_-PDtXdPJh:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B80D6200F0;	Wed,
	8 Apr 2015 14:42:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 08 Apr 2015 14:42:55 -0400
Message-id: <1428518576-11800-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] serialcheck: add version 1.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Apr 2015 19:43:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...01-Add-option-to-enable-internal-loopback.patch | 80 ++++++++++++++++++++++
 .../0002-Restore-original-loopback-config.patch    | 48 +++++++++++++
 .../serialcheck/serialcheck_1.0.0.bb               | 19 +++++
 3 files changed, 147 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
 create mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
 create mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb

diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
new file mode 100644
index 0000000..fc387d7
--- /dev/null
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
@@ -0,0 +1,80 @@
+From 059d5512e840fe68e2bb37add6c9208fa9c34d15 Mon Sep 17 00:00:00 2001
+From: Sekhar Nori <nsekhar@ti.com>
+Date: Tue, 24 Feb 2015 22:16:37 +0530
+Subject: [PATCH 1/2] Add option to enable internal loopback
+
+---
+ serialcheck.c | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+
+diff --git a/serialcheck.c b/serialcheck.c
+index 4f5b747..4100c37 100644
+--- a/serialcheck.c
++++ b/serialcheck.c
+@@ -12,6 +12,8 @@
+ #include <sys/ioctl.h>
+ #include <linux/serial.h>
+
++#define TIOCM_LOOP	0x8000
++
+ #define __same_type(a, b)	__builtin_types_compatible_p(typeof(a), typeof(b))
+ #define BUILD_BUG_ON_ZERO(e)	(sizeof(struct { int:-!!(e); }))
+ #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
+@@ -40,6 +42,7 @@ struct g_opt {
+	unsigned char hflow;
+	unsigned char do_termios;
+	unsigned char *cmp_buff;
++	unsigned char loopback;
+ };
+
+ /* name, key, arg, flags, doc, group */
+@@ -51,6 +54,7 @@ static struct argp_option options[] = {
+	{"mode",	'm', "M",    0, "transfer mode (d = duplex, t = send r = receive)", 0},
+	{"loops",	'l', "NUM",  0, "loops to perform (0 => wait fot CTRL-C", 0},
+	{"no-termios",	'n', NULL,   0, "No termios change (baud rate etc. remains unchanged)", 0},
++	{"loopback",	'k', NULL,   0, "loopback mode", 0},
+	{NULL, 0, NULL, 0, NULL, 0}
+ };
+
+@@ -67,6 +71,7 @@ static error_t parse_opt(int key, char *arg, struct argp_state *state)
+		go->baudrate = 115200;
+		go->loops = UINT_MAX;
+		go->do_termios = 1;
++		go->loopback = 0;
+		break;
+	case ARGP_KEY_ARG:
+		ret =  ARGP_ERR_UNKNOWN;
+@@ -113,6 +118,9 @@ static error_t parse_opt(int key, char *arg, struct argp_state *state)
+		} else
+			go->loops = num;
+		break;
++	case 'k':
++		go->loopback = 1;
++		break;
+	default:
+		ret = ARGP_ERR_UNKNOWN;
+	}
+@@ -487,6 +495,21 @@ int main(int argc, char *argv[])
+			die("tcflush failed: %m\n");
+	}
+
++	if (opts.loopback) {
++		unsigned int mcr;
++
++		ret = ioctl(fd, TIOCMGET, &mcr);
++		if (ret < 0)
++			die("mcr get failed: %m\n");
++
++		mcr |= TIOCM_LOOP;
++
++		ret = ioctl(fd, TIOCMSET, &mcr);
++		if (ret < 0)
++			die ("mcr set failed: %m\n");
++
++	}
++
+	ret = fcntl(fd, F_SETFL, 0);
+	if (ret)
+		printf("Failed to remove nonblock mode\n");
+--
+1.9.1
diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch b/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
new file mode 100644
index 0000000..a2ac6d0
--- /dev/null
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
@@ -0,0 +1,48 @@
+From a6e5813d2f8402bf3a311c8bcda02623bfb76882 Mon Sep 17 00:00:00 2001
+From: Carlos Hernandez <ceh@ti.com>
+Date: Tue, 24 Feb 2015 16:00:34 -0500
+Subject: [PATCH 2/2] Restore original loopback config
+
+If loopback option is enabled. Disable it at the end of the test.
+
+Signed-off-by: Carlos Hernandez <ceh@ti.com>
+---
+ serialcheck.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/serialcheck.c b/serialcheck.c
+index 4100c37..06470f7 100644
+--- a/serialcheck.c
++++ b/serialcheck.c
+@@ -427,6 +427,7 @@ int main(int argc, char *argv[])
+	unsigned char *data;
+	unsigned int open_mode;
+	off_t data_len;
++	unsigned int mcr;
+
+	argp_parse(&argp, argc, argv, 0, NULL, &opts);
+	if (!opts.file_trans)
+@@ -496,8 +497,6 @@ int main(int argc, char *argv[])
+	}
+
+	if (opts.loopback) {
+-		unsigned int mcr;
+-
+		ret = ioctl(fd, TIOCMGET, &mcr);
+		if (ret < 0)
+			die("mcr get failed: %m\n");
+@@ -535,6 +534,12 @@ int main(int argc, char *argv[])
+	ret = tcsetattr(fd, TCSAFLUSH, &old_term);
+	if (ret)
+		printf("tcsetattr() of old ones failed: %m\n");
++	if (opts.loopback) {
++		mcr &= ~(TIOCM_LOOP);
++		ret = ioctl(fd, TIOCMSET, &mcr);
++	}
++	if (ret)
++		printf("disabling loopback failed: %m\n");
+
+	close(fd);
+	return status;
+--
+1.9.1
diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
new file mode 100644
index 0000000..6154241
--- /dev/null
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Application to verify operation of serial ports"
+HOMEPAGE = "git://git.breakpoint.cc/bigeasy/serialcheck.git"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://git.breakpoint.cc/bigeasy/serialcheck.git \
+            file://0001-Add-option-to-enable-internal-loopback.patch \
+            file://0002-Restore-original-loopback-config.patch"
+
+SRCREV = "63854a2d0c0129efab132ec328a75279e013fb84"
+
+S = "${WORKDIR}/git"
+
+CFLAGS_prepend = "-Wall -Wextra -Wno-sign-compare -Wno-pointer-sign "
+
+do_install() {
+    install -d ${D}${bindir}
+    install ${S}/serialcheck ${D}${bindir}/serialcheck
+}
-- 
2.2.0


