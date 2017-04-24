Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0445F71D8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:38 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id x188so13077033itb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CtYfCqOvS0bHT26GsxIvf/lMKXi9vAOjLqbXSesxjls=;
	b=poln9hdjOMK+XvTMw5zdNZ9l3HjLyvR2UgM/pzkvdqg6dNZRijDW8TQIrTzT09H2VY
	En6hcVhYP1ON86wOEoH4j8VwbzhquGJqxWj1Tr7SXiStesPkPoEHaSXFAh9XMrQsDrrM
	QA7D2MuMwWUQy7sf4ewI2eXLu3FMqlYLo50/WVnN4z0adAXA8Kr0PYXqlTdNiDEDEZxt
	rLvT3JQwYJ6MW2Lw6UXmqfjG9tWbzBEZPob1haeob5gaoYDmVRBunpVJTDXLdtUldA1n
	2CP6V536rLCjCKASqLDScwiKJli9nm7dYmjgOvN8YoDSLk28+lAHcJtnhrQetuxtJo59
	OtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CtYfCqOvS0bHT26GsxIvf/lMKXi9vAOjLqbXSesxjls=;
	b=cJW1wd91Af8kuAaJRbUM/wYxsFcPH/wmduTmXypH4w0M9FuINIyQH/PR0doJrzZNdi
	fNyyBUH2erjwCSNmlITvDKxWDz1szQFH0AQSHUE/vSHwPUUt72wnER7vcfZuPF7bkWMD
	RDuiaEFwvHnoydv39qMVyE67Qm2HrE5b9rAS2PX7n96+I8Fp04nLPUSBH6AKT8nxyuqw
	ITLtML4KAuPwHazPtCLPIVI59uDhCBxZHKQtR3Os6Di2K/7yrekWfJWvp7RTth29pDI2
	6Dpkpu1Ka3ju3tW/8GPP3eMROBJlcjWWsaTmwGZfHN0tLZew/VJdHKx5VBUnLfKmXCis
	yIVw==
X-Gm-Message-State: AN3rC/6eKmhcgfKVz1EGPebQUiKLSa6v4AElY5plbVSnU0B9hENZ0xkc
	0dzCoEkgW6kiFg==
X-Received: by 10.84.229.144 with SMTP id c16mr30525254plk.27.1493011299354;
	Sun, 23 Apr 2017 22:21:39 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:58 -0700
Message-Id: <20170424052058.4952-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 17/17] samba: Upgrade to 4.6.2
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../waf-cross-answers/cross-answers-aarch64.txt    |  1 +
 .../files/waf-cross-answers/cross-answers-arm.txt  |  1 +
 .../files/waf-cross-answers/cross-answers-i586.txt |  1 +
 .../files/waf-cross-answers/cross-answers-i686.txt |  1 +
 .../files/waf-cross-answers/cross-answers-mips.txt |  1 +
 .../waf-cross-answers/cross-answers-mips64.txt     |  1 +
 .../waf-cross-answers/cross-answers-mipsel.txt     |  1 +
 .../waf-cross-answers/cross-answers-powerpc.txt    |  1 +
 .../waf-cross-answers/cross-answers-powerpc64.txt  |  1 +
 .../waf-cross-answers/cross-answers-x86_64.txt     |  1 +
 .../samba/samba-4.4.5/10-use-only-libsystemd.patch | 30 -------
 .../samba-4.4.5/internal_tevent_to_0.9.31.patch    | 92 ----------------------
 .../00-fix-typos-in-man-pages.patch                |  0
 ...void-timeout-for-nmbd-if-started-offline-.patch |  0
 ...006-avoid-using-colon-in-the-checking-msg.patch |  0
 .../16-do-not-check-xsltproc-manpages.patch        |  0
 ...-import-target-module-while-cross-compile.patch |  0
 .../21-add-config-option-without-valgrind.patch    |  0
 .../{samba-4.4.5 => samba}/samba-4.2.7-pam.patch   |  0
 .../samba-4.3.9-remove-getpwent_r.patch            |  0
 .../{samba-4.4.5 => samba}/volatiles.03_samba      |  0
 .../samba/{samba_4.4.5.bb => samba_4.6.2.bb}       | 10 +--
 22 files changed, 13 insertions(+), 129 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/10-use-only-libsystemd.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/internal_tevent_to_0.9.31.patch
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.5 => samba}/00-fix-typos-in-man-pages.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.5 => samba}/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.5 => samba}/0006-avoid-using-colon-in-the-checking-msg.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.5 => samba}/16-do-not-check-xsltproc-manpages.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.5 => samba}/20-do-not-import-target-module-while-cross-compile.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.5 => samba}/21-add-config-option-without-valgrind.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.5 => samba}/samba-4.2.7-pam.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.5 => samba}/samba-4.3.9-remove-getpwent_r.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.5 => samba}/volatiles.03_samba (100%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.4.5.bb => samba_4.6.2.bb} (97%)

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
index bbf7f1620..1023f6aff 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
@@ -36,3 +36,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
index e926fcd3c..a5cd9981a 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
@@ -37,3 +37,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
index e926fcd3c..a5cd9981a 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
@@ -37,3 +37,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
index e926fcd3c..a5cd9981a 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
@@ -37,3 +37,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
index 18bfa0203..3e239e727 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
@@ -37,3 +37,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
index 8fa015ab9..82e694fda 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
@@ -36,3 +36,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
index 18bfa0203..3e239e727 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
@@ -37,3 +37,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
index fb93b56fc..27b9378a4 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
@@ -37,3 +37,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
index fd585f0d5..7fd3092cb 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
@@ -37,3 +37,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
index bbf7f1620..1023f6aff 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
@@ -36,3 +36,4 @@ getcwd takes a NULL argument: OK
 Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/10-use-only-libsystemd.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/10-use-only-libsystemd.patch
deleted file mode 100644
index 0ddc9410c..000000000
--- a/meta-networking/recipes-connectivity/samba/samba-4.4.5/10-use-only-libsystemd.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-diff -ur samba-4.4.2/lib/util/debug.c samba-4.4.2/lib/util/debug.c
---- samba-4.4.2/lib/util/debug.c	2016-05-08 18:33:24.000000000 +0200
-+++ samba-4.4.2/lib/util/debug.c	2016-05-08 18:27:09.341481492 +0200
-@@ -102,7 +102,7 @@
- 	.fd = 2 /* stderr by default */
- };
- 
--#if defined(WITH_SYSLOG) || defined(HAVE_LIBSYSTEMD_JOURNAL)
-+#if defined(WITH_SYSLOG) || defined(HAVE_LIBSYSTEMD)
- static int debug_level_to_priority(int level)
- {
- 	/*
-@@ -179,7 +179,7 @@
- }
- #endif /* WITH_SYSLOG */
- 
--#ifdef HAVE_LIBSYSTEMD_JOURNAL
-+#ifdef HAVE_LIBSYSTEMD
- #include <systemd/sd-journal.h>
- static void debug_systemd_log(int msg_level,
- 			      const char *msg, const char *msg_no_nl)
-@@ -251,7 +251,7 @@
- 	},
- #endif
- 
--#ifdef HAVE_LIBSYSTEMD_JOURNAL
-+#ifdef HAVE_LIBSYSTEMD
- 	{
- 		.name = "systemd",
- 		.log = debug_systemd_log,
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/internal_tevent_to_0.9.31.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/internal_tevent_to_0.9.31.patch
deleted file mode 100644
index bd4cd6407..000000000
--- a/meta-networking/recipes-connectivity/samba/samba-4.4.5/internal_tevent_to_0.9.31.patch
+++ /dev/null
@@ -1,92 +0,0 @@
---- samba-4.4.5.orig/lib/tevent/tevent_internal.h	2016-01-26 12:45:46.000000000 +0100
-+++ samba-4.4.5/lib/tevent/tevent_internal.h	2016-10-07 06:45:35.000000000 +0200
-@@ -228,6 +228,16 @@
- 	void *additional_data;
- };
- 
-+struct tevent_threaded_context {
-+	struct tevent_threaded_context *next, *prev;
-+
-+#ifdef HAVE_PTHREAD
-+	pthread_mutex_t event_ctx_mutex;
-+#endif
-+	struct tevent_context *event_ctx;
-+	int wakeup_fd;
-+};
-+
- struct tevent_debug_ops {
- 	void (*debug)(void *context, enum tevent_debug_level level,
- 		      const char *fmt, va_list ap) PRINTF_ATTRIBUTE(3,0);
-@@ -241,24 +251,41 @@
- 	/* the specific events implementation */
- 	const struct tevent_ops *ops;
- 
-+	/*
-+	 * The following three pointers are queried on every loop_once
-+	 * in the order in which they appear here. Not measured, but
-+	 * hopefully putting them at the top together with "ops"
-+	 * should make tevent a *bit* more cache-friendly than before.
-+	 */
-+
-+	/* list of signal events - used by common code */
-+	struct tevent_signal *signal_events;
-+
-+	/* List of threaded job indicators */
-+	struct tevent_threaded_context *threaded_contexts;
-+
-+	/* list of immediate events - used by common code */
-+	struct tevent_immediate *immediate_events;
-+
- 	/* list of fd events - used by common code */
- 	struct tevent_fd *fd_events;
- 
- 	/* list of timed events - used by common code */
- 	struct tevent_timer *timer_events;
- 
--	/* list of immediate events - used by common code */
--	struct tevent_immediate *immediate_events;
--
--	/* list of signal events - used by common code */
--	struct tevent_signal *signal_events;
-+	/* List of scheduled immediates */
-+	pthread_mutex_t scheduled_mutex;
-+	struct tevent_immediate *scheduled_immediates;
- 
- 	/* this is private for the events_ops implementation */
- 	void *additional_data;
- 
- 	/* pipe hack used with signal handlers */
--	struct tevent_fd *pipe_fde;
--	int pipe_fds[2];
-+	struct tevent_fd *wakeup_fde;
-+	int wakeup_fd;		/* fd to write into */
-+#ifndef HAVE_EVENT_FD
-+	int wakeup_read_fd;
-+#endif
- 
- 	/* debugging operations */
- 	struct tevent_debug_ops debug_ops;
-@@ -282,6 +309,10 @@
- 	 * tevent_common_add_timer_v2()
- 	 */
- 	struct tevent_timer *last_zero_timer;
-+
-+#ifdef HAVE_PTHREAD
-+	struct tevent_context *prev, *next;
-+#endif
- };
- 
- const struct tevent_ops *tevent_find_ops_byname(const char *name);
-@@ -327,6 +358,12 @@
- 				      const char *handler_name,
- 				      const char *location);
- bool tevent_common_loop_immediate(struct tevent_context *ev);
-+void tevent_common_threaded_activate_immediate(struct tevent_context *ev);
-+
-+bool tevent_common_have_events(struct tevent_context *ev);
-+int tevent_common_wakeup_init(struct tevent_context *ev);
-+int tevent_common_wakeup_fd(int fd);
-+int tevent_common_wakeup(struct tevent_context *ev);
- 
- struct tevent_signal *tevent_common_add_signal(struct tevent_context *ev,
- 					       TALLOC_CTX *mem_ctx,
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/00-fix-typos-in-man-pages.patch b/meta-networking/recipes-connectivity/samba/samba/00-fix-typos-in-man-pages.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.5/00-fix-typos-in-man-pages.patch
rename to meta-networking/recipes-connectivity/samba/samba/00-fix-typos-in-man-pages.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch b/meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.5/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
rename to meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/0006-avoid-using-colon-in-the-checking-msg.patch b/meta-networking/recipes-connectivity/samba/samba/0006-avoid-using-colon-in-the-checking-msg.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.5/0006-avoid-using-colon-in-the-checking-msg.patch
rename to meta-networking/recipes-connectivity/samba/samba/0006-avoid-using-colon-in-the-checking-msg.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/16-do-not-check-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/samba/16-do-not-check-xsltproc-manpages.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.5/16-do-not-check-xsltproc-manpages.patch
rename to meta-networking/recipes-connectivity/samba/samba/16-do-not-check-xsltproc-manpages.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/20-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.5/20-do-not-import-target-module-while-cross-compile.patch
rename to meta-networking/recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/21-add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.5/21-add-config-option-without-valgrind.patch
rename to meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.2.7-pam.patch b/meta-networking/recipes-connectivity/samba/samba/samba-4.2.7-pam.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.2.7-pam.patch
rename to meta-networking/recipes-connectivity/samba/samba/samba-4.2.7-pam.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.3.9-remove-getpwent_r.patch b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.3.9-remove-getpwent_r.patch
rename to meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/volatiles.03_samba b/meta-networking/recipes-connectivity/samba/samba/volatiles.03_samba
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba-4.4.5/volatiles.03_samba
rename to meta-networking/recipes-connectivity/samba/samba/volatiles.03_samba
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.6.2.bb
index f2d52a2c8..38876c2c3 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb
@@ -13,22 +13,19 @@ ${SAMBA_MIRROR}    http://www.mirrorservice.org/sites/ftp.samba.org \n \
 
 SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://00-fix-typos-in-man-pages.patch \
-           file://10-use-only-libsystemd.patch \
            file://16-do-not-check-xsltproc-manpages.patch \
            file://20-do-not-import-target-module-while-cross-compile.patch \
            file://21-add-config-option-without-valgrind.patch \
            file://0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch \
            file://0006-avoid-using-colon-in-the-checking-msg.patch \
-           file://internal_tevent_to_0.9.31.patch \
            file://volatiles.03_samba \
           "
 SRC_URI_append_libc-musl = " \
            file://samba-4.2.7-pam.patch \
            file://samba-4.3.9-remove-getpwent_r.patch \
           "
-
-SRC_URI[md5sum] = "6950c5e9f7bdeb8a610c2ca957a15be4"
-SRC_URI[sha256sum] = "b876ef2e63f66265490e80a122e66ef2d7616112b839df68f56ac2e1ce17a7bd"
+SRC_URI[md5sum] = "461def8190ffc651fd8458b24ca2a622"
+SRC_URI[sha256sum] = "927afcc16e444718985e3952de92d34e7b776b9ca0238179d866da18a6441c35"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
@@ -201,9 +198,8 @@ FILES_${PN}-base = "${sbindir}/nmbd \
 FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
                           ${bindir}/ctdb_run_cluster_tests \
                           ${sysconfdir}/ctdb/nodes \
-                          ${libdir}/ctdb-tests \
                           ${datadir}/ctdb-tests \
-                          /run/ctdb \
+                          ${datadir}/ctdb/tests \
                          "
 
 FILES_${BPN}-common = "${sysconfdir}/default \
-- 
2.12.2


