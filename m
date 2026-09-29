Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42ECCA5FB3
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:58:14 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1480.1790722685267222915
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m7E4HBWg;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso4692069eec.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722685; x=1791327485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVqBpr5S9cwpo6SB5ibCnebrp8QLKpvpksYUjiyUWC8=;
        b=m7E4HBWgvsSAT70CPEfRP9v1orA2eUTuxO6yZZ1A330xQ8dC1EALjKYTPp10iH9ESL
         JBRMMnL6hcQYtL7rhBFUbxmp1NNMUKMBBjqM6MZexDTFIwyzYFqRjSCpMgrA1U5FuKXn
         1t6Qr3uvaHmwM3Sgl59gcrw/i4AgyCN4aH8WeZCbO1fVTyH8h5u3wVoVF9nh7dAuhnzN
         tMMktlt41wUWvHC93ipe6xPqCimfcqUH4Wjdo1UJMGXn5Aq175q1aSCoOXjAFQoJp3So
         h2DB1rXmCtU93ztNUNee0cZs/KT2YPeN0RoXtmJV2tZsUiCjRcv8ErxLxrELdmxFmKvz
         BLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722685; x=1791327485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVqBpr5S9cwpo6SB5ibCnebrp8QLKpvpksYUjiyUWC8=;
        b=0EMHedklzHZj/46PTITXmHv4eACO318Zq8eo7uyuGuDM05+YD5IPbE5xebmkGr+JGM
         0AxSyXsk7GSJRKR1x7NKIEgv7SrChcib40nl/wOaj3nt0riXdNtvVC9jhD+Oo2tpJ6lA
         RPe4Okrxtf7GD9u9S0pYenDYB39taTIs16klwC1fSYFAehN8Wo0c8vj7yGKGYSbDjdny
         ns03h11llG7b0NxJhxChZJIvZF1/I8cMLyKnv5+Zux8s9Iz/u6JuybgSE20P7WsjVRgA
         636baYzuO8EliERiXEbBZICrMJd7sNSFcSy2MTmtR6uNSlITNBqOmKMQNyC5PQxR+snG
         1uNA==
X-Gm-Message-State: AFq9FYJTbI6UQYYFRTSQLie8Se1aavYopuMGmtTNaHFeNaE030ZrxPpB
	7hp++vISOTiTkdkjqwWdGWPSwKsL9Mvvza+jnBL1Qkgwu3L0Y+3Tfntuofk19nB5ouE=
X-Gm-Gg: AYBFou3KWYdYQz9kgJAqJondeRxK4iNeu0foq7wUQ9Wcd/witpM9BmjF9QbZR1sYEDj
	auRTuc91ukk3VHbsnd2lrxPVt45wI+cdcqX5vLvuhrWNcusNyLTEGyPrnuuHDX9AdDDDUQPKTYo
	lIe9h+FEymvpinP+cs8b5PeBBkwTY/WhsNaF03XxZ/RY1TF794Xg6/ZEwHhAPmZDmUg2LGmrjCL
	k63yBmOt4vV4MU5iDtQRALqrG07c6j1woT9EgkqQTj1jIpekxTFW/Xz2ou3bqYj7Kr/Jk7GeZzJ
	Wyeboldxpt8VIqTUaQjXp3O6fiJcQYIFcbrOyFNj0SHeV7mGD4VVFZy8JBEldhPS8ZLevlc4X3Q
	6rNzJ1KvAAaOJ3NifEnJhI/K+D/Q75U14oTroe4Lf4Q7CVFlWrlyRb8IhbGVDfK240yrRpwYxY1
	c9RWtYd7nm+6mQkR/oikaZDEALhOVjckVzoRESMP4JgmjVPO8Yn4qSOEf9cAQXC4ta2ZBpSV/lA
	PYk/FR+bnRzcpevxQ+YGYL/iekyoqcRl9WioDcHMBW9ycVFgK2naKPgOvBqvJid9qcLBl34Mzzz
	BUdElDn7tUPn1cQulxSxuVRe/mQhgkpRdhT4/S28XVKHfuQRzMtQkwAJyIP8CLeueEGzZLPmfxi
	nrJXbSXygYnyrLxnj2Z1oDowMvFCWKxYWV9vQM94G7PfQfz7jVNVQAQCYxAg3/C6oQHkLGq73Vp
	PqitQwzDIlOrevyUtPW93DrMBFU7lQs6nF6CCg8Q==
X-Received: by 2002:a05:7301:428d:b0:33c:e93:764d with SMTP id 5a478bee46e88-34c644d1084mr807186eec.39.1790722684525;
        Tue, 29 Sep 2026 15:58:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:58:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 26/26] rtc-testbench: Fix build with musl
Date: Tue, 29 Sep 2026 15:57:23 -0700
Message-ID: <20260929225723.1046705-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130513

Cast socket addresses to struct sockaddr * for bind() and sendto(), since
musl has no transparent union for them like glibc, and pin threads with
pthread_setaffinity_np() after creation where
pthread_attr_setaffinity_np() is not available.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../files/0002-Fix-build-with-musl.patch      | 121 ++++++++++++++++++
 .../rtc-testbench/rtc-testbench_5.5.bb        |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-oe/recipes-test/rtc-testbench/files/0002-Fix-build-with-musl.patch

diff --git a/meta-oe/recipes-test/rtc-testbench/files/0002-Fix-build-with-musl.patch b/meta-oe/recipes-test/rtc-testbench/files/0002-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..9fa1138952
--- /dev/null
+++ b/meta-oe/recipes-test/rtc-testbench/files/0002-Fix-build-with-musl.patch
@@ -0,0 +1,121 @@
+From: Khem Raj <raj.khem@gmail.com>
+Subject: [PATCH] Fix build with musl
+
+- bind() and sendto() take a struct sockaddr pointer. glibc accepts other
+  sockaddr types in C via a transparent union, musl does not:
+
+    net.c:417:25: error: incompatible pointer types passing 'struct sockaddr_in *' to parameter of type 'const struct sockaddr *' [-Wincompatible-pointer-types]
+
+  Cast to struct sockaddr * instead.
+
+- pthread_attr_setaffinity_np() is a glibc extension musl does not have:
+
+    thread.c:67:8: error: call to undeclared function 'pthread_attr_setaffinity_np'
+
+  Without it, pin the thread with pthread_setaffinity_np() right after
+  creating it.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+diff --git a/src/log_json.c b/src/log_json.c
+index 5ac7e87..e13b1fe 100644
+--- a/src/log_json.c
++++ b/src/log_json.c
+@@ -44,11 +44,11 @@ static void log_json_add_traffic_class(struct log_json_thread_context *ctx,
+ 	switch (ctx->dest.ss_family) {
+ 	case AF_INET:
+ 		ret = sendto(ctx->socket, stat_message, strlen(stat_message), 0,
+-			     (struct sockaddr_in *)&ctx->dest, sizeof(struct sockaddr_in));
++			     (struct sockaddr *)&ctx->dest, sizeof(struct sockaddr_in));
+ 		break;
+ 	case AF_INET6:
+ 		ret = sendto(ctx->socket, stat_message, strlen(stat_message), 0,
+-			     (struct sockaddr_in6 *)&ctx->dest, sizeof(struct sockaddr_in6));
++			     (struct sockaddr *)&ctx->dest, sizeof(struct sockaddr_in6));
+ 		break;
+ 	default:
+ 		ret = -EINVAL;
+diff --git a/src/net.c b/src/net.c
+index 408920b..14d1e29 100644
+--- a/src/net.c
++++ b/src/net.c
+@@ -414,10 +414,10 @@ int create_udp_socket(const char *udp_destination, const char *udp_source, const
+ 
+ 	switch (source.ss_family) {
+ 	case AF_INET:
+-		ret = bind(socket_fd, (struct sockaddr_in *)&source, sizeof(struct sockaddr_in));
++		ret = bind(socket_fd, (struct sockaddr *)&source, sizeof(struct sockaddr_in));
+ 		break;
+ 	case AF_INET6:
+-		ret = bind(socket_fd, (struct sockaddr_in6 *)&source, sizeof(struct sockaddr_in6));
++		ret = bind(socket_fd, (struct sockaddr *)&source, sizeof(struct sockaddr_in6));
+ 		break;
+ 	default:
+ 		ret = -EINVAL;
+diff --git a/src/thread.c b/src/thread.c
+index a679164..635dda7 100644
+--- a/src/thread.c
++++ b/src/thread.c
+@@ -64,11 +64,13 @@ int create_rt_thread(pthread_t *task_id, int thread_priority, int cpu_core,
+ 
+ 	CPU_ZERO(&cpus);
+ 	CPU_SET(cpu_core, &cpus);
++#ifdef __GLIBC__
+ 	ret = pthread_attr_setaffinity_np(&attr, sizeof(cpus), &cpus);
+ 	if (ret) {
+ 		pthread_error(ret, "pthread_attr_setaffinity_np() failed");
+ 		goto err;
+ 	}
++#endif
+ 
+ 	ret = pthread_create(task_id, &attr, thread_routine, data);
+ 	if (ret) {
+@@ -76,6 +78,15 @@ int create_rt_thread(pthread_t *task_id, int thread_priority, int cpu_core,
+ 		goto err;
+ 	}
+ 
++#ifndef __GLIBC__
++	/* No pthread_attr_setaffinity_np() e.g. on musl, pin the new thread instead. */
++	ret = pthread_setaffinity_np(*task_id, sizeof(cpus), &cpus);
++	if (ret) {
++		pthread_error(ret, "pthread_setaffinity_np() failed");
++		goto err;
++	}
++#endif
++
+ 	ret = pthread_setname_np(*task_id, thread_name);
+ 	if (ret) {
+ 		pthread_error(ret, "pthread_setname_np() failed");
+diff --git a/src/udp_thread.c b/src/udp_thread.c
+index bcdd000..ffbeba9 100644
+--- a/src/udp_thread.c
++++ b/src/udp_thread.c
+@@ -68,11 +68,11 @@ static void udp_send_frame(struct thread_context *thread_context, const unsigned
+ 	switch (destination->ss_family) {
+ 	case AF_INET:
+ 		ret = sendto(socket_fd, frame_data, frame_length, 0,
+-			     (struct sockaddr_in *)destination, sizeof(struct sockaddr_in));
++			     (struct sockaddr *)destination, sizeof(struct sockaddr_in));
+ 		break;
+ 	case AF_INET6:
+ 		ret = sendto(socket_fd, frame_data, frame_length, 0,
+-			     (struct sockaddr_in6 *)destination, sizeof(struct sockaddr_in6));
++			     (struct sockaddr *)destination, sizeof(struct sockaddr_in6));
+ 		break;
+ 	default:
+ 		ret = -EINVAL;
+@@ -107,11 +107,11 @@ static void udp_gen_and_send_frame(struct thread_context *thread_context, unsign
+ 	switch (destination->ss_family) {
+ 	case AF_INET:
+ 		ret = sendto(socket_fd, frame_data, frame_length, 0,
+-			     (struct sockaddr_in *)destination, sizeof(struct sockaddr_in));
++			     (struct sockaddr *)destination, sizeof(struct sockaddr_in));
+ 		break;
+ 	case AF_INET6:
+ 		ret = sendto(socket_fd, frame_data, frame_length, 0,
+-			     (struct sockaddr_in6 *)destination, sizeof(struct sockaddr_in6));
++			     (struct sockaddr *)destination, sizeof(struct sockaddr_in6));
+ 		break;
+ 	default:
+ 		ret = -EINVAL;
diff --git a/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.5.bb b/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.5.bb
index 6aa2a76a09..92b5cac1a6 100644
--- a/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.5.bb
+++ b/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.5.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = " \
 SRC_URI = " \
     git://github.com/Linutronix/RTC-Testbench.git;tag=v${PV};nobranch=1;protocol=https \
     file://0001-CMakeLists.txt-make-BPF-clang-and-include-paths-conf.patch \
+    file://0002-Fix-build-with-musl.patch \
 "
 SRCREV = "b7541b4b93b4d9fe6f395bc53d3cb50401d406a4"
 

