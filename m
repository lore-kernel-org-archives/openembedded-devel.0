Return-Path: <dhuo@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFA566069A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 09:53:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02B9r4bE012633
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 02:53:04 -0700 (PDT)
Received: from pek-lpggp2 (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 11 Mar 2020 02:52:58 -0700
Received: by pek-lpggp2 (Postfix, from userid 18189)	id E313C721DF0; Wed, 11
	Mar 2020 17:52:31 +0800 (CST)
From: De Huo <De.Huo@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Mar 2020 17:52:30 +0800
Message-ID: <1583920350-198351-1-git-send-email-De.Huo@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH] rng-tools: Supply patches to fix rngd block reboot issue
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
X-List-Received-Date: Wed, 11 Mar 2020 09:53:04 -0000
Content-Type: text/plain

There will be issue about "Hardware RNG Entropy Gatherer Daemon slow stop"
during "reboot" of CN96xx.

Backport the patches from
https://github.com/nhorman/rng-tools/commit/3e47faae108df4824531bf9c003cc1c65b7b2842
 and
https://github.com/nhorman/rng-tools/commit/cf1475fbdf33d5c3a62099b6b20f2b2017d6de33

Signed-off-by: De Huo <De.Huo@windriver.com>
---
 .../0001-Allow-jitter-threads-to-exit-faster.patch | 130 +++++++++++++++++++++
 .../rng-tools/0002-Daemonize-earlier-in-init.patch |  88 ++++++++++++++
 meta/recipes-support/rng-tools/rng-tools_6.7.bb    |   2 +
 3 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-Allow-jitter-threads-to-exit-faster.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-Daemonize-earlier-in-init.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-Allow-jitter-threads-to-exit-faster.patch b/meta/recipes-support/rng-tools/rng-tools/0001-Allow-jitter-threads-to-exit-faster.patch
new file mode 100644
index 0000000..46a401a
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-Allow-jitter-threads-to-exit-faster.patch
@@ -0,0 +1,130 @@
+From 3e47faae108df4824531bf9c003cc1c65b7b2842 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@tuxdriver.com>
+Date: Fri, 7 Jun 2019 08:51:02 -0400
+Subject: [PATCH] Allow jitter threads to exit faster
+
+commit:3e47faae108df4824531bf9c003cc1c65b7b2842
+https://github.com/nhorman/rng-tools
+
+Even with the recent pipe adjustments, it can take a long time for
+jitterentropy to exit.  This is because the call to jent_read_entropy
+can take a long time to complete, and termination signal delivery won't
+cause it to return early, like a syscall.
+
+Mitigate this by using sigsetjmp/siglongjmp.  We set a return point at
+the top of the loop for each thread, and register a signal handler to
+execute a siglongjmp back to that point so that we can recheck the
+active flag and break the loop as soon as a signal is delivered.
+
+Upstream-Status: Backport
+
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+Signed-off-by: Anca Nicoleta Mihalache <anca.mihalache@windriver.com>
+Signed-off-by: De Huo <de.huo@windriver.com>
+---
+ rngd_jitter.c | 32 ++++++++++++++++++++++++++++++--
+ 1 file changed, 30 insertions(+), 2 deletions(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index 54070ae..7f01ee9 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -26,6 +26,7 @@
+ #include <time.h>
+ #include <unistd.h>
+ #include <signal.h>
++#include <setjmp.h>
+ #include "rng-tools-config.h"
+ 
+ #include <jitterentropy.h>
+@@ -48,6 +49,7 @@ struct thread_data {
+ 	int active;
+ 	int done;
+ 	struct timespec slptm;
++	sigjmp_buf	jmpbuf;
+ };
+ 
+ static struct thread_data *tdata;
+@@ -228,6 +230,16 @@ static inline void update_sleep_time(struct thread_data *me,
+ 	me->slptm.tv_nsec /= 2;
+ }
+ 
++void jitter_thread_exit_signal(int signum)
++{
++	pthread_t self = pthread_self();
++	int i;
++	for(i=0;i<num_threads;i++)  {
++		if (threads[i] == self)
++			siglongjmp(tdata[i].jmpbuf, 1);
++	}
++}
++
+ static void *thread_entropy_task(void *data)
+ {
+ 	cpu_set_t cpuset;
+@@ -263,6 +275,13 @@ static void *thread_entropy_task(void *data)
+ 		goto out;
+ 	}
+ 
++	/*
++	 * Use setjmp here to allow us to return early from
++	 * jent_read_entropy, as it can run for a long time
++	 */
++	if (sigsetjmp(me->jmpbuf, 1))
++		goto out_interrupt;
++
+ 	/* Now go to sleep until there is more work to do */
+ 	do {
+ 		message(LOG_DAEMON|LOG_DEBUG, "JITTER thread on cpu %d wakes up for refill\n", me->core_id);
+@@ -286,7 +305,11 @@ static void *thread_entropy_task(void *data)
+ 			message(LOG_DAEMON|LOG_DEBUG, "DONE Writing to pipe with return %ld\n", ret);
+ 			if (first)
+ 				me->active = 1;
+-			if (ret < 0)
++			/*
++ 			 * suppress EBADF errors, as those indicate the pipe is
++ 			 * closed and we are exiting
++ 			 */
++			if ((ret < 0) && (errno != EBADF))
+ 				message(LOG_DAEMON|LOG_WARNING, "Error on pipe write: %s\n", strerror(errno));
+ 			if (!first && !me->active)
+ 				break;
+@@ -296,6 +319,7 @@ static void *thread_entropy_task(void *data)
+ 
+ 	} while (me->active);
+ 
++out_interrupt:
+ 	free(tmpbuf);
+ out:
+ 	me->done = 1;
+@@ -335,6 +359,7 @@ int validate_jitter_options(struct rng *ent_src)
+ 	return 0;
+ }
+ 
++
+ /*
+  * Init JITTER
+  */
+@@ -349,6 +374,9 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ #ifdef HAVE_LIBGCRYPT
+ 	char key[AES_BLOCK];
+ #endif
++
++	signal(SIGUSR1, jitter_thread_exit_signal);
++
+ 	int ret = jent_entropy_init();
+ 	if(ret) {
+ 		message(LOG_DAEMON|LOG_WARNING, "JITTER rng fails with code %d\n", ret);
+@@ -474,8 +502,8 @@ void close_jitter_entropy_source(struct rng *ent_src)
+ 	/* And wait for completion of each thread */
+ 	for (i=0; i < num_threads; i++) {
+ 		message(LOG_DAEMON|LOG_DEBUG, "Checking on done for thread %d\n", i);
++		pthread_kill(threads[i], SIGUSR1);
+ 		while (!tdata[i].done)
+-			pthread_kill(threads[i], SIGINT);
+ 			if(tdata[i].done) {
+ 				message(LOG_DAEMON|LOG_INFO, "Closing thread %d\n", tdata[i].core_id);
+ 				pthread_join(threads[i], NULL);
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-Daemonize-earlier-in-init.patch b/meta/recipes-support/rng-tools/rng-tools/0002-Daemonize-earlier-in-init.patch
new file mode 100644
index 0000000..c517516
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0002-Daemonize-earlier-in-init.patch
@@ -0,0 +1,88 @@
+From cf1475fbdf33d5c3a62099b6b20f2b2017d6de33 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@hmswarspite.think-freely.org>
+Date: Wed, 13 Nov 2019 08:23:22 -0500
+Subject: [PATCH] Daemonize earlier in init
+
+commit:cf1475fbdf33d5c3a62099b6b20f2b2017d6de33
+https://github.com/nhorman/rng-tools
+
+It was reported here:
+https://github.com/nhorman/rng-tools/issues/73
+
+That rngd hangs on shutdown, but only when being run as a daemon.  The problem
+turns out to be that we are daemonizing too late in init.  Because we daemonize
+after initalizing all our entropy sources, we get a premature exit on the
+threads created prior to daemonization.  This leads to hangs in shutdown when we
+wait for termination of threads that have already exited abnormally.
+
+Fix it by daemonizing before we init any entropy sources
+
+Upstream-Status: Backport
+
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+Signed-off-by: Anca Nicoleta Mihalache <anca.mihalache@windriver.com>
+Signed-off-by: De Huo <de.huo@windriver.com>
+---
+ rngd.c | 34 +++++++++++++++++-----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/rngd.c b/rngd.c
+index a086949..78ff4f4 100644
+--- a/rngd.c
++++ b/rngd.c
+@@ -749,6 +749,22 @@ int main(int argc, char **argv)
+ 	if (argp_parse(&argp, argc, argv, 0, 0, arguments) < 0)
+ 		return 1;
+ 
++	if (arguments->daemon && !arguments->list) {
++		am_daemon = true;
++
++		if (daemon(0, 0) < 0) {
++			message(LOG_CONS|LOG_INFO, "can't daemonize: %s\n",
++			strerror(errno));
++			return 1;
++		}
++
++		/* require valid, locked PID file to proceed */
++		pid_fd = write_pid_file(arguments->pid_file);
++		if (pid_fd < 0)
++			return 1;
++
++	}
++
+ 	if (arguments->list) {
+ 		int found = 0;
+ 		message(LOG_CONS|LOG_INFO, "Entropy sources that are available but disabled\n");
+@@ -807,28 +823,12 @@ int main(int argc, char **argv)
+ 	/* Init entropy sink and open random device */
+ 	init_kernel_rng(arguments->random_name);
+ 
+-	if (arguments->daemon) {
+-		am_daemon = true;
+-
+-		if (daemon(0, 0) < 0) {
+-			message(LOG_CONS|LOG_INFO, "can't daemonize: %s\n",
+-			strerror(errno));
+-			return 1;
+-		}
+-
+-		/* require valid, locked PID file to proceed */
+-		pid_fd = write_pid_file(arguments->pid_file);
+-		if (pid_fd < 0)
+-			return 1;
+-
+-		signal(SIGHUP, SIG_IGN);
+-		signal(SIGPIPE, SIG_IGN);
+-	}
+ 	/*
+ 	 * We always catch these to ensure that we gracefully shutdown
+ 	 */
+ 	signal(SIGINT, term_signal);
+ 	signal(SIGTERM, term_signal);
++
+ 	if (arguments->test) {
+ 		message(LOG_CONS|LOG_INFO, "Entering test mode...no entropy will "
+ 			"be delivered to the kernel\n");
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.7.bb b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
index b4e453f..c73466e 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.7.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
@@ -13,6 +13,8 @@ SRC_URI = "\
     file://init \
     file://default \
     file://rngd.service \
+    file://0001-Allow-jitter-threads-to-exit-faster.patch \
+    file://0002-Daemonize-earlier-in-init.patch \
 "
 SRCREV = "9fc873c5af0e392632e6b736938b811f7ca97251"
 
-- 
1.9.1


