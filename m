Return-Path: <gyurco@freemail.hu>
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC9871B1F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Mar 2017 20:15:42 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id 1D1C0803F9;
	Sun,  5 Mar 2017 21:15:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ggdimvMYxdUL; Sun,  5 Mar 2017 21:15:29 +0100 (CET)
Received: from gyurco.lan (unknown [10.8.0.14])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id 951DC800CC;
	Sun,  5 Mar 2017 21:15:29 +0100 (CET)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Mar 2017 21:15:11 +0100
Message-Id: <20170305201511.32453-1-gyurco@freemail.hu>
X-Mailer: git-send-email 2.9.3
Subject: [meta-networking][PATCH] samba: update tevent_internal.h
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
X-List-Received-Date: Sun, 05 Mar 2017 20:15:43 -0000

Update the tevent_internal.h file to the same version
as the current OpenEmbedded recipe version, otherwise
nmbd will segfault immediately at start, and strange
crashes occurs with smbd. Samba uses this internal
libtevent header file, and it is crucial to match
this file to the external libtevent.

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 .../samba-4.4.5/internal_tevent_to_0.9.31.patch    | 92 ++++++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.4.5.bb      |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/internal_tevent_to_0.9.31.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/internal_tevent_to_0.9.31.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/internal_tevent_to_0.9.31.patch
new file mode 100644
index 0000000..bd4cd64
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba-4.4.5/internal_tevent_to_0.9.31.patch
@@ -0,0 +1,92 @@
+--- samba-4.4.5.orig/lib/tevent/tevent_internal.h	2016-01-26 12:45:46.000000000 +0100
++++ samba-4.4.5/lib/tevent/tevent_internal.h	2016-10-07 06:45:35.000000000 +0200
+@@ -228,6 +228,16 @@
+ 	void *additional_data;
+ };
+ 
++struct tevent_threaded_context {
++	struct tevent_threaded_context *next, *prev;
++
++#ifdef HAVE_PTHREAD
++	pthread_mutex_t event_ctx_mutex;
++#endif
++	struct tevent_context *event_ctx;
++	int wakeup_fd;
++};
++
+ struct tevent_debug_ops {
+ 	void (*debug)(void *context, enum tevent_debug_level level,
+ 		      const char *fmt, va_list ap) PRINTF_ATTRIBUTE(3,0);
+@@ -241,24 +251,41 @@
+ 	/* the specific events implementation */
+ 	const struct tevent_ops *ops;
+ 
++	/*
++	 * The following three pointers are queried on every loop_once
++	 * in the order in which they appear here. Not measured, but
++	 * hopefully putting them at the top together with "ops"
++	 * should make tevent a *bit* more cache-friendly than before.
++	 */
++
++	/* list of signal events - used by common code */
++	struct tevent_signal *signal_events;
++
++	/* List of threaded job indicators */
++	struct tevent_threaded_context *threaded_contexts;
++
++	/* list of immediate events - used by common code */
++	struct tevent_immediate *immediate_events;
++
+ 	/* list of fd events - used by common code */
+ 	struct tevent_fd *fd_events;
+ 
+ 	/* list of timed events - used by common code */
+ 	struct tevent_timer *timer_events;
+ 
+-	/* list of immediate events - used by common code */
+-	struct tevent_immediate *immediate_events;
+-
+-	/* list of signal events - used by common code */
+-	struct tevent_signal *signal_events;
++	/* List of scheduled immediates */
++	pthread_mutex_t scheduled_mutex;
++	struct tevent_immediate *scheduled_immediates;
+ 
+ 	/* this is private for the events_ops implementation */
+ 	void *additional_data;
+ 
+ 	/* pipe hack used with signal handlers */
+-	struct tevent_fd *pipe_fde;
+-	int pipe_fds[2];
++	struct tevent_fd *wakeup_fde;
++	int wakeup_fd;		/* fd to write into */
++#ifndef HAVE_EVENT_FD
++	int wakeup_read_fd;
++#endif
+ 
+ 	/* debugging operations */
+ 	struct tevent_debug_ops debug_ops;
+@@ -282,6 +309,10 @@
+ 	 * tevent_common_add_timer_v2()
+ 	 */
+ 	struct tevent_timer *last_zero_timer;
++
++#ifdef HAVE_PTHREAD
++	struct tevent_context *prev, *next;
++#endif
+ };
+ 
+ const struct tevent_ops *tevent_find_ops_byname(const char *name);
+@@ -327,6 +358,12 @@
+ 				      const char *handler_name,
+ 				      const char *location);
+ bool tevent_common_loop_immediate(struct tevent_context *ev);
++void tevent_common_threaded_activate_immediate(struct tevent_context *ev);
++
++bool tevent_common_have_events(struct tevent_context *ev);
++int tevent_common_wakeup_init(struct tevent_context *ev);
++int tevent_common_wakeup_fd(int fd);
++int tevent_common_wakeup(struct tevent_context *ev);
+ 
+ struct tevent_signal *tevent_common_add_signal(struct tevent_context *ev,
+ 					       TALLOC_CTX *mem_ctx,
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 0ba59c7..6a4f726 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://21-add-config-option-without-valgrind.patch \
            file://0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch \
            file://0006-avoid-using-colon-in-the-checking-msg.patch \
+           file://internal_tevent_to_0.9.31.patch \
            file://volatiles.03_samba \
           "
 SRC_URI_append_libc-musl = " \
-- 
2.9.3


