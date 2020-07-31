Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.12218.1596172887901448762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 22:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97199290"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 13:21:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C44C4CE1505
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:21:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 13:21:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] linuxptp: upgrade 2.0 -> 3.0
Date: Sat, 1 Aug 2020 01:21:13 +0800
Message-ID: <1596216075-3418-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7C44C4CE1505.A3C97
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

time_t_maybe_long_long.patch
Removed since this is included in 3.0.

Refresh the following patch:
build-Allow-CC-and-prefix-to-be-overriden.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-Allow-CC-and-prefix-to-be-overriden.patch |   4 +-
 .../linuxptp/time_t_maybe_long_long.patch     | 135 ------------------
 .../{linuxptp_2.0.bb => linuxptp_3.0.bb}      |   5 +-
 3 files changed, 4 insertions(+), 140 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_long.patch
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_2.0.bb => linuxptp_3.0.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
index b1d96ae5a7..55ce4c9a90 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
@@ -22,8 +22,8 @@ index 22e7d0d..809cc8f 100644
 +CC	?= $(CROSS_COMPILE)gcc
  VER     = -DVER=$(version)
  CFLAGS	= -Wall $(VER) $(incdefs) $(DEBUG) $(EXTRA_CFLAGS)
- LDLIBS	= -lm -lrt $(EXTRA_LDFLAGS)
-@@ -35,7 +35,7 @@ incdefs := $(shell $(srcdir)/incdefs.sh)
+ LDLIBS	= -lm -lrt -pthread $(EXTRA_LDFLAGS)
+@@ -43,7 +43,7 @@ incdefs := $(shell $(srcdir)/incdefs.sh)
  version := $(shell $(srcdir)/version.sh $(srcdir))
  VPATH	= $(srcdir)
  
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_long.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_long.patch
deleted file mode 100644
index af99d2b7f9..0000000000
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_long.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-Fix printf if time_t is long long
-
-On some platforms, time_t has recently switched from "long" to "long
-long" [1]. For these platforms it is necessary to use "%lld" as printf
-format specifier because the ABI differs between "long" and "long long".
-
-I found no way for creating something similar to PRId64 for time_t. No
-idea how to determine whether it's "long" or "long long". So I cast
-everything to "long long" instead.
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=38143339646a4ccce8afe298c34467767c899f51
-
-Upstream-Status: Accepted [next version is after 2.0]
-Upstream-Patch: https://github.com/richardcochran/linuxptp/commit/7de73fefc378cc42b9ed1115b3afa409d0250a48
-
-Signed-off-by: Christian Eggers <ceggers@arri.de>
----
-diff -Naur linuxptp-2.0.org/phc_ctl.c linuxptp-2.0/phc_ctl.c
---- linuxptp-2.0.org/phc_ctl.c	2018-08-12 23:08:43.000000000 +0200
-+++ linuxptp-2.0/phc_ctl.c	2020-05-29 21:34:26.166519963 +0200
-@@ -230,8 +230,8 @@
- 			strerror(errno));
- 		return -1;
- 	} else {
--		pr_notice("set clock time to %ld.%09ld or %s",
--			ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
-+		pr_notice("set clock time to %lld.%09ld or %s",
-+			(long long)ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
- 	}
- 
- 	return args_to_eat;
-@@ -248,8 +248,8 @@
- 
- 		return -1;
- 	} else {
--		pr_notice("clock time is %ld.%09lu or %s",
--			ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
-+		pr_notice("clock time is %lld.%09lu or %s",
-+			(long long)ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
- 	}
- 
- 	/* get operation does not require any arguments */
-diff -Naur linuxptp-2.0.org/print.c linuxptp-2.0/print.c
---- linuxptp-2.0.org/print.c	2018-08-12 23:08:43.000000000 +0200
-+++ linuxptp-2.0/print.c	2020-05-29 21:34:26.166519963 +0200
-@@ -73,16 +73,16 @@
- 
- 	if (verbose) {
- 		f = level >= LOG_NOTICE ? stdout : stderr;
--		fprintf(f, "%s[%ld.%03ld]: %s%s%s\n",
-+		fprintf(f, "%s[%lld.%03ld]: %s%s%s\n",
- 			progname ? progname : "",
--			ts.tv_sec, ts.tv_nsec / 1000000,
-+			(long long)ts.tv_sec, ts.tv_nsec / 1000000,
- 			message_tag ? message_tag : "", message_tag ? " " : "",
- 			buf);
- 		fflush(f);
- 	}
- 	if (use_syslog) {
--		syslog(level, "[%ld.%03ld] %s%s%s",
--		       ts.tv_sec, ts.tv_nsec / 1000000,
-+		syslog(level, "[%lld.%03ld] %s%s%s",
-+		       (long long)ts.tv_sec, ts.tv_nsec / 1000000,
- 		       message_tag ? message_tag : "", message_tag ? " " : "",
- 		       buf);
- 	}
-diff -Naur linuxptp-2.0.org/unicast_service.c linuxptp-2.0/unicast_service.c
---- linuxptp-2.0.org/unicast_service.c	2018-08-12 23:08:43.000000000 +0200
-+++ linuxptp-2.0/unicast_service.c	2020-05-29 21:36:23.170497415 +0200
-@@ -209,9 +209,9 @@
- 	tmo = now.tv_sec + req->durationField;
- 	if (tmo > client->grant_tmo) {
- 		client->grant_tmo = tmo;
--		pr_debug("%s grant of 0x%x extended to %ld",
-+		pr_debug("%s grant of 0x%x extended to %lld",
- 			 pid2str(&client->portIdentity),
--			 client->message_types, tmo);
-+			 client->message_types, (long long)tmo);
- 	}
- }
- 
-@@ -226,8 +226,8 @@
- 	interval = pqueue_peek(p->unicast_service->queue);
- 	if (interval) {
- 		tmo.it_value = interval->tmo;
--		pr_debug("arming timer tmo={%ld,%ld}",
--			 interval->tmo.tv_sec, interval->tmo.tv_nsec);
-+		pr_debug("arming timer tmo={%lld,%ld}",
-+			 (long long)interval->tmo.tv_sec, interval->tmo.tv_nsec);
- 	} else {
- 		pr_debug("stopping unicast service timer");
- 	}
-@@ -499,8 +499,8 @@
- 
- 	while ((interval = pqueue_peek(p->unicast_service->queue)) != NULL) {
- 
--		pr_debug("peek i={2^%d} tmo={%ld,%ld}", interval->log_period,
--			 interval->tmo.tv_sec, interval->tmo.tv_nsec);
-+		pr_debug("peek i={2^%d} tmo={%lld,%ld}", interval->log_period,
-+			 (long long)interval->tmo.tv_sec, interval->tmo.tv_nsec);
- 
- 		if (timespec_compare(&now, &interval->tmo) >= 0) {
- 			break;
-@@ -519,8 +519,8 @@
- 		}
- 
- 		interval_increment(interval);
--		pr_debug("next i={2^%d} tmo={%ld,%ld}", interval->log_period,
--			 interval->tmo.tv_sec, interval->tmo.tv_nsec);
-+		pr_debug("next i={2^%d} tmo={%lld,%ld}", interval->log_period,
-+			 (long long)interval->tmo.tv_sec, interval->tmo.tv_nsec);
- 		pqueue_insert(p->unicast_service->queue, interval);
- 	}
- 
-diff -Naur linuxptp-2.0.org/unicast_client.c linuxptp-2.0/unicast_client.c
---- linuxptp-2.0.org/unicast_client.c	2018-08-12 23:08:43.000000000 +0200
-+++ linuxptp-2.0/unicast_client.c	2020-06-02 11:13:06.922997844 +0200
-@@ -216,7 +216,7 @@
- 				       long duration)
- {
- 	struct timespec now;
--	long tmo;
-+	time_t tmo;
- 
- 	if (clock_gettime(CLOCK_MONOTONIC, &now)) {
- 		pr_err("clock_gettime failed: %m");
-@@ -226,7 +226,7 @@
- 	tmo = now.tv_sec + duration;
- 	if (!master->renewal_tmo || tmo < master->renewal_tmo) {
- 		master->renewal_tmo = tmo;
--		pr_debug("port %d: renewal timeout at %ld", portnum(p), tmo);
-+		pr_debug("port %d: renewal timeout at %lld", portnum(p), (long long)tmo);
- 	}
- }
- 
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb
index 930c6673dc..69dee1a2f1 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb
@@ -5,11 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://no-incdefs-using-host-headers.patch \
-           file://time_t_maybe_long_long.patch \
            "
 
-SRC_URI[md5sum] = "d8bb7374943bb747db7786ac26f17f11"
-SRC_URI[sha256sum] = "0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d"
+SRC_URI[md5sum] = "1318805702eb6d59f9f247e1dd5ce12a"
+SRC_URI[sha256sum] = "d74ceca722c75bfff53c633425f926dd48eb04f4a089451b855155c016d15785"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
     EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
-- 
2.25.1



