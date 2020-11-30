Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.62808.1606754850231284479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 08:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oa0sVtVs;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id i2so17081328wrs.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Nov 2020 08:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSQ+x7pHUL60nkXLmonm8ywN0QUTZESX7uQ0sRxtcho=;
        b=Oa0sVtVsfVsL7icb2mKnPtbRWI7fVqHKON1EduwLUpC1UFgBDPjH1RQye60O/B3n/e
         H1N94xLy570lRoUR0uFSD0n/pGzN1u173HcQEUiBFHJ8vy7TK/7iJsd7kVXajMO0q5rb
         TnbNQeAf5EZUOc3McNhjzZT4ujHSQcyjApjBCRzg73txRi7+oKTP2vU4nodtySd1C8P3
         pSGr8oVdDX8Noo0HQUQBqCQMT1N5tqBqs8FA+GqzG5d3/VQodvY5uN1pDaeR+FI6VmpT
         +OwmS1iU97jhEOwc/yTe5Ye/NSHUuytWdL8KHlYScmpA1QN8arTrIFHdS9pUvoX3wZTY
         O3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSQ+x7pHUL60nkXLmonm8ywN0QUTZESX7uQ0sRxtcho=;
        b=PXB0PzkUo6lwV6o4LvMGUp3VeL9qD6/hX4BapJWeReP9YpwzwGa/bCr+mWqcu+vVTN
         KnozkDvlDBdlZZ5SdksIVc69tZxZ02eiGr/TTG0b/wOH9DAjUhIcluD0nXkNEB35hyLX
         AqRwoJKR4o6LpTuyah6aJKuTdDRALxSqKLcyLUM8UYlQxRelHkjbEOgnNECi4XTBUUcz
         1a30hLA/o5ejJT1G4Ffhx2nVdT8mfdZOOLGGDTRa+QJ/EputzBAK2HEhHc7pc9LA/weS
         X9w5w6y75IVDrYeKm76hDBzThlWWfLevX5DSN5++EzBYvn8NpgculvaVH+vzHwb8mf7S
         FwOQ==
X-Gm-Message-State: AOAM530rF8BRdyBy/S3eqgTnGIv8eNcVbx5J6JOljSgV5k0bDC1bz7el
	IcJewbD94/9fq1B+maCcVrW+5mL6u7k=
X-Google-Smtp-Source: ABdhPJx3NzHjiB7Q0Ng7H1cKyaFb3twnhC1IcK9F6cwKIEBo88bMbkJWHkLCik0DXwbcHnOqlocpxQ==
X-Received: by 2002:adf:f181:: with SMTP id h1mr28781893wro.267.1606754848284;
        Mon, 30 Nov 2020 08:47:28 -0800 (PST)
Return-Path: <beniaminsandu@gmail.com>
Received: from localhost.localdomain (5-13-193-159.residential.rdsnet.ro. [5.13.193.159])
        by smtp.gmail.com with ESMTPSA id n14sm2888414wrx.79.2020.11.30.08.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 08:47:27 -0800 (PST)
From: "beni" <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH v2] trace-cmd: create recipe for version 2.9.1
Date: Mon, 30 Nov 2020 18:47:06 +0200
Message-Id: <20201130164706.13121-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |   1 +
 ...01-trace-cmd-make-it-build-with-musl.patch | 132 ++++++++++++++++++
 .../trace-cmd/trace-cmd_2.9.1.bb              |  17 +++
 3 files changed, 150 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/trace-cmd/files/0001-trace-cmd-make-it-build-with-musl.patch
 create mode 100644 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e62b1eb46..841e1cd1b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -596,6 +596,7 @@ RDEPENDS_packagegroup-meta-oe-kernel ="\
     minicoredumper \
     oprofile \
     spidev-test \
+    trace-cmd \
 "
 RDEPENDS_packagegroup-meta-oe-kernel_append_x86 = " intel-speed-select ipmiutil pm-graph turbostat"
 RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat"
diff --git a/meta-oe/recipes-kernel/trace-cmd/files/0001-trace-cmd-make-it-build-with-musl.patch b/meta-oe/recipes-kernel/trace-cmd/files/0001-trace-cmd-make-it-build-with-musl.patch
new file mode 100644
index 000000000..220991804
--- /dev/null
+++ b/meta-oe/recipes-kernel/trace-cmd/files/0001-trace-cmd-make-it-build-with-musl.patch
@@ -0,0 +1,132 @@
+From b63f13d2df91ede45288653b21e0d30a6b45f2ac Mon Sep 17 00:00:00 2001
+From: Beniamin Sandu <beniaminsandu@gmail.com>
+Date: Mon, 30 Nov 2020 18:24:48 +0200
+Subject: [PATCH] trace-cmd: make it build with musl
+
+Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
+---
+ include/trace-cmd/trace-cmd.h |  1 +
+ lib/trace-cmd/trace-msg.c     |  1 +
+ lib/trace-cmd/trace-plugin.c  |  2 ++
+ lib/tracefs/tracefs-events.c  |  1 +
+ tracecmd/trace-agent.c        |  1 +
+ tracecmd/trace-setup-guest.c  |  1 +
+ tracecmd/trace-tsync.c        | 15 ++++++++++-----
+ 7 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/include/trace-cmd/trace-cmd.h b/include/trace-cmd/trace-cmd.h
+index f3c95f3..a697905 100644
+--- a/include/trace-cmd/trace-cmd.h
++++ b/include/trace-cmd/trace-cmd.h
+@@ -6,6 +6,7 @@
+ #ifndef _TRACE_CMD_H
+ #define _TRACE_CMD_H
+ 
++#include <sys/types.h>
+ #include "traceevent/event-parse.h"
+ 
+ #define TRACECMD_MAGIC { 23, 8, 68 }
+diff --git a/lib/trace-cmd/trace-msg.c b/lib/trace-cmd/trace-msg.c
+index 4a0bfa9..fc1f2c7 100644
+--- a/lib/trace-cmd/trace-msg.c
++++ b/lib/trace-cmd/trace-msg.c
+@@ -21,6 +21,7 @@
+ #include <arpa/inet.h>
+ #include <sys/types.h>
+ #include <linux/types.h>
++#include <byteswap.h>
+ 
+ #include "trace-write-local.h"
+ #include "trace-cmd-local.h"
+diff --git a/lib/trace-cmd/trace-plugin.c b/lib/trace-cmd/trace-plugin.c
+index 92f9edf..c2ef3dc 100644
+--- a/lib/trace-cmd/trace-plugin.c
++++ b/lib/trace-cmd/trace-plugin.c
+@@ -8,6 +8,8 @@
+ #include <dlfcn.h>
+ #include <sys/stat.h>
+ #include <libgen.h>
++#include <limits.h>
++
+ #include "trace-cmd.h"
+ #include "trace-local.h"
+ 
+diff --git a/lib/tracefs/tracefs-events.c b/lib/tracefs/tracefs-events.c
+index 8e825f5..a8d8560 100644
+--- a/lib/tracefs/tracefs-events.c
++++ b/lib/tracefs/tracefs-events.c
+@@ -13,6 +13,7 @@
+ #include <errno.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
++#include <limits.h>
+ 
+ #include "kbuffer.h"
+ #include "tracefs.h"
+diff --git a/tracecmd/trace-agent.c b/tracecmd/trace-agent.c
+index b581696..abfefac 100644
+--- a/tracecmd/trace-agent.c
++++ b/tracecmd/trace-agent.c
+@@ -20,6 +20,7 @@
+ #include <unistd.h>
+ #include <linux/vm_sockets.h>
+ #include <pthread.h>
++#include <limits.h>
+ 
+ #include "trace-local.h"
+ #include "trace-msg.h"
+diff --git a/tracecmd/trace-setup-guest.c b/tracecmd/trace-setup-guest.c
+index 899848c..99595a1 100644
+--- a/tracecmd/trace-setup-guest.c
++++ b/tracecmd/trace-setup-guest.c
+@@ -13,6 +13,7 @@
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
++#include <limits.h>
+ 
+ #include "trace-local.h"
+ #include "trace-msg.h"
+diff --git a/tracecmd/trace-tsync.c b/tracecmd/trace-tsync.c
+index e639788..b8b5ac3 100644
+--- a/tracecmd/trace-tsync.c
++++ b/tracecmd/trace-tsync.c
+@@ -104,13 +104,15 @@ int tracecmd_host_tsync(struct buffer_instance *instance,
+ 
+ 	pthread_attr_init(&attrib);
+ 	pthread_attr_setdetachstate(&attrib, PTHREAD_CREATE_JOINABLE);
+-	if (!get_first_cpu(&pin_mask, &mask_size))
+-		pthread_attr_setaffinity_np(&attrib, mask_size, pin_mask);
+ 
+ 	ret = pthread_create(&instance->tsync_thread, &attrib,
+ 			     tsync_host_thread, &instance->tsync);
+-	if (!ret)
++	if (!ret) {
++		if (!get_first_cpu(&pin_mask, &mask_size))
++			pthread_setaffinity_np(instance->tsync_thread, mask_size, pin_mask);
+ 		instance->tsync_thread_running = true;
++	}
++
+ 	if (pin_mask)
+ 		CPU_FREE(pin_mask);
+ 	pthread_attr_destroy(&attrib);
+@@ -243,11 +245,14 @@ unsigned int tracecmd_guest_tsync(char *tsync_protos,
+ 	pthread_attr_init(&attrib);
+ 	tsync->sync_proto = proto;
+ 	pthread_attr_setdetachstate(&attrib, PTHREAD_CREATE_JOINABLE);
+-	if (!get_first_cpu(&pin_mask, &mask_size))
+-		pthread_attr_setaffinity_np(&attrib, mask_size, pin_mask);
+ 
+ 	ret = pthread_create(thr_id, &attrib, tsync_agent_thread, tsync);
+ 
++	if (!ret) {
++		if (!get_first_cpu(&pin_mask, &mask_size))
++			pthread_setaffinity_np(*thr_id, mask_size, pin_mask);
++	}
++
+ 	if (pin_mask)
+ 		CPU_FREE(pin_mask);
+ 	pthread_attr_destroy(&attrib);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
new file mode 100644
index 000000000..d39afff8e
--- /dev/null
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "User-space front-end command-line tool for ftrace"
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=873f48a813bded3de6ebc54e6880c4ac"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master \
+	file://0001-trace-cmd-make-it-build-with-musl.patch"
+
+SRCREV = "530b1a0caef39466e16bbd49de5afef89656f03f"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+       oe_runmake etcdir=${sysconfdir} DESTDIR=${D} install
+}
+
+FILES_${PN} += "${libdir}/traceevent/plugins"
-- 
2.25.1

