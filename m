Return-Path: <gyurco@freemail.hu>
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id 77D4F6FFEA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jun 2016 19:07:05 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id 1C80280568;
	Sat, 18 Jun 2016 21:07:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1rZpb9AvxKaL; Sat, 18 Jun 2016 21:07:03 +0200 (CEST)
Received: from gyurco.lan (unknown [10.8.0.14])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id 2314D80405;
	Sat, 18 Jun 2016 21:07:03 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jun 2016 21:06:57 +0200
Message-Id: <1466276817-4209-1-git-send-email-gyurco@freemail.hu>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] Samba: use only libsystemd
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
X-List-Received-Date: Sat, 18 Jun 2016 19:07:09 -0000

This patch was disappeared while moved to 4.4.2

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 .../samba/samba-4.4.2/10-use-only-libsystemd.patch | 81 ++++++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.4.2.bb      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-libsystemd.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-libsystemd.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-libsystemd.patch
new file mode 100644
index 0000000..81621ff
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-libsystemd.patch
@@ -0,0 +1,81 @@
+diff -ur samba-4.4.2/lib/util/become_daemon.c samba-4.4.2/lib/util/become_daemon.c
+--- samba-4.4.2/lib/util/become_daemon.c	2016-05-08 18:33:24.000000000 +0200
++++ samba-4.4.2/lib/util/become_daemon.c	2016-05-08 18:26:50.275177918 +0200
+@@ -24,7 +24,7 @@
+ #include "includes.h"
+ #include "system/filesys.h"
+ #include "system/locale.h"
+-#if HAVE_LIBSYSTEMD_DAEMON
++#if HAVE_LIBSYSTEMD
+ #include <systemd/sd-daemon.h>
+ #endif
+ #include "lib/util/close_low_fd.h"
+@@ -69,9 +69,9 @@
+ 	if (do_fork) {
+ 		newpid = fork();
+ 		if (newpid) {
+-#if HAVE_LIBSYSTEMD_DAEMON
++#if HAVE_LIBSYSTEMD
+ 			sd_notifyf(0, "READY=0\nSTATUS=Starting process...\nMAINPID=%lu", (unsigned long) newpid);
+-#endif /* HAVE_LIBSYSTEMD_DAEMON */
++#endif /* HAVE_LIBSYSTEMD */
+ 			_exit(0);
+ 		}
+ 	}
+@@ -98,7 +98,7 @@
+ 
+ _PUBLIC_ void exit_daemon(const char *msg, int error)
+ {
+-#ifdef HAVE_LIBSYSTEMD_DAEMON
++#ifdef HAVE_LIBSYSTEMD
+ 	if (msg == NULL) {
+ 		msg = strerror(error);
+ 	}
+@@ -117,7 +117,7 @@
+ 	if (name == NULL) {
+ 		name = "Samba";
+ 	}
+-#ifdef HAVE_LIBSYSTEMD_DAEMON
++#ifdef HAVE_LIBSYSTEMD
+ 	sd_notifyf(0, "READY=1\nSTATUS=%s: ready to serve connections...", name);
+ #endif
+ 	DEBUG(0, ("STATUS=daemon '%s' finished starting up and ready to serve "
+@@ -129,7 +129,7 @@
+ 	if (name == NULL) {
+ 		name = "Samba";
+ 	}
+-#ifdef HAVE_LIBSYSTEMD_DAEMON
++#ifdef HAVE_LIBSYSTEMD
+ 	sd_notifyf(0, "\nSTATUS=%s: %s", name, msg);
+ #endif
+ 	DEBUG(0, ("STATUS=daemon '%s' : %s", name, msg));
+diff -ur samba-4.4.2/lib/util/debug.c samba-4.4.2/lib/util/debug.c
+--- samba-4.4.2/lib/util/debug.c	2016-05-08 18:33:24.000000000 +0200
++++ samba-4.4.2/lib/util/debug.c	2016-05-08 18:27:09.341481492 +0200
+@@ -102,7 +102,7 @@
+ 	.fd = 2 /* stderr by default */
+ };
+ 
+-#if defined(WITH_SYSLOG) || defined(HAVE_LIBSYSTEMD_JOURNAL)
++#if defined(WITH_SYSLOG) || defined(HAVE_LIBSYSTEMD)
+ static int debug_level_to_priority(int level)
+ {
+ 	/*
+@@ -179,7 +179,7 @@
+ }
+ #endif /* WITH_SYSLOG */
+ 
+-#ifdef HAVE_LIBSYSTEMD_JOURNAL
++#ifdef HAVE_LIBSYSTEMD
+ #include <systemd/sd-journal.h>
+ static void debug_systemd_log(int msg_level,
+ 			      const char *msg, const char *msg_no_nl)
+@@ -251,7 +251,7 @@
+ 	},
+ #endif
+ 
+-#ifdef HAVE_LIBSYSTEMD_JOURNAL
++#ifdef HAVE_LIBSYSTEMD
+ 	{
+ 		.name = "systemd",
+ 		.log = debug_systemd_log,
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
index 50c100e..b7ee730 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
@@ -13,6 +13,7 @@ ${SAMBA_MIRROR}    http://www.mirrorservice.org/sites/ftp.samba.org \n \
 
 SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://00-fix-typos-in-man-pages.patch \
+           file://10-use-only-libsystemd.patch \
            file://16-do-not-check-xsltproc-manpages.patch \
            file://20-do-not-import-target-module-while-cross-compile.patch \
            file://21-add-config-option-without-valgrind.patch \
-- 
2.7.4


