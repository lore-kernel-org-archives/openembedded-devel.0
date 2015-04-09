Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 57F37737F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 01:28:54 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI002F1MS2DHK0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2015 20:28:55 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=OqT4EJ7o c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8 a=l-wRgUANAAAA:8	a=FCJyDhTm91xeGMjJUTUA:9
	a=cKZOCgYk3925epvw:21 a=u9Kf1ZDBoGOZD7oJ:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 28BA3200E2;	Wed,
	8 Apr 2015 21:28:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 08 Apr 2015 21:28:44 -0400
Message-id: <1428542925-15985-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2 1/2] serialcheck: add version 1.0.0
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
X-List-Received-Date: Thu, 09 Apr 2015 01:28:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Simple serial tester

Usage (as explained in Readme.txt, part of ${PN}-doc package):
 - Create a random file.
   dd if=/dev/urandom of=binary count=1 bs=4096

 - Copy the random file to both nodes.

 - Start the test
   receiving node:
        serialcheck -d /dev/ttyS0 -f binary -m r -l 10

   sending node:
        serialcheck -d /dev/ttyUSB0 -f binary -m t -l 10

   Start the receiving side before the sending side. This will transfer the
   "binary" file 10 times and the other side will expect the file 10 times.
   Once the program completes both sides should write something similar to:

|  Needed 0 reads 1 writes loops 10 / 10
|  cts: 0 dsr: 0 rng: 0 dcd: 0 rx: 0 tx: 40960 frame 0 ovr 0 par: 0 brk: 0 buf_ovrr: 0

   and in error case the receive side:

Needed 20 reads 0 writes Oh oh, inconsistency at pos 2273 (0x8e1).
Original sample:
000008b0: 28 b2 18 c9 ec b5 2c b3  3a a1 29 b1 fc 27 20 7f   (.....,.:.)..' .
000008c0: 42 f8 d5 cb d8 52 ec b5  c8 76 d3 4b d2 57 44 6a   B....R...v.K.WDj
000008d0: 40 81 6a 82 27 fd 8d 50  84 70 bc 24 6b 3d 88 fd   @.j.'..P.p.$k=..
000008e0: 9f ac 78 a4 76 9b f9 1c  74 2c d6 79 22 60 c5 de   ..x.v...t,.y"`..
000008f0: 02 9c fb 52 21 4b 40 6f  80 69 2e 80 df 12 ba a0   ...R!K@o.i......
00000900: 75 57 d5 22 33 c0 f3 bc  94 f8 aa 22 9d 02 59 20   uW."3......"..Y

Received sample:
000008b0: 28 b2 18 c9 ec b5 2c b3  3a a1 29 b1 fc 27 20 7f   (.....,.:.)..' .
000008c0: 42 f8 d5 cb d8 52 ec b5  c8 76 d3 4b d2 57 44 6a   B....R...v.K.WDj
000008d0: 40 81 6a 82 27 fd 8d 50  84 70 bc 24 6b 3d 88 fd   @.j.'..P.p.$k=..
000008e0: 9f 00 ac 78 a4 76 9b f9  1c 74 2c d6 79 22 60 c5   ...x.v...t,.y"`.
000008f0: de 02 9c fb 52 21 4b 40  6f 80 69 2e 80 df 12 ba   ....R!K@o.i.....
00000900: a0 75 57 d5 22 33 c0 f3  bc 94 f8 aa 22 9d 02 59   .uW."3......"..Y
loops 54878 / 4294967295

cts: 0 dsr: 0 rng: 0 dcd: 0 rx: 224792017 tx: 223379456 frame 0 ovr 1 par: 0 brk: 0 buf_ovrr: 0

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 changes:
 - fix HOMEPAGE
 - add nativesdk BBCLASSEXTEND
 - install Readme.txt to docdir
 - add Upstream-status to patches
 - extend commit log

 ...01-Add-option-to-enable-internal-loopback.patch | 81 ++++++++++++++++++++++
 .../0002-Restore-original-loopback-config.patch    | 49 +++++++++++++
 .../serialcheck/serialcheck_1.0.0.bb               | 23 ++++++
 3 files changed, 153 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
 create mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
 create mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb

diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
new file mode 100644
index 0000000..f69254a
--- /dev/null
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
@@ -0,0 +1,81 @@
+From 059d5512e840fe68e2bb37add6c9208fa9c34d15 Mon Sep 17 00:00:00 2001
+From: Sekhar Nori <nsekhar@ti.com>
+Date: Tue, 24 Feb 2015 22:16:37 +0530
+Subject: [PATCH 1/2] Add option to enable internal loopback
+
+Upstream-status: Pending
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
index 0000000..1b8c95b
--- /dev/null
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
@@ -0,0 +1,49 @@
+From a6e5813d2f8402bf3a311c8bcda02623bfb76882 Mon Sep 17 00:00:00 2001
+From: Carlos Hernandez <ceh@ti.com>
+Date: Tue, 24 Feb 2015 16:00:34 -0500
+Subject: [PATCH 2/2] Restore original loopback config
+
+If loopback option is enabled, disable it at the end of the test.
+
+Signed-off-by: Carlos Hernandez <ceh@ti.com>
+Upstream-status: Pending
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
index 0000000..98324e8
--- /dev/null
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Application to verify operation of serial ports"
+HOMEPAGE = "http://git.breakpoint.cc/cgit/bigeasy/serialcheck.git/"
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
+    install ${S}/serialcheck ${D}${bindir}
+    install -d ${D}${docdir}/${BP}
+    install ${S}/Readme.txt ${D}${docdir}/${BP}
+}
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.2.0


