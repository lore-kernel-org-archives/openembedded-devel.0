Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.10742.1593562074946334020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AgKBJnBJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id bj10so3933812plb.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DC+SAeQCtzMrFpjDHhPV4XmM1MlKbA7tj6aiAM9WJCY=;
        b=AgKBJnBJkFrEFs98ff3zCcQ5FCJKuigPGvQcZd6f0DIOuxIQWHEnZ/2rDlKsJRosx0
         iYWmsP4JMITcV/J8C5iTqa1R+RGES5RNXf7fIMRL6cS1+gAywwLo3sUd1ASKBTBZrbY5
         KpctjapZ5qodYdVtJn2dmxnbRizM4wCUqeWHvLH8XyRmibng4IH+r0MIf29nUY9TqXJG
         BEl8iN8XgNBtfWrwuZ/MMan1d/59p/DfwYaOolRvONQVURStlZufrAU8ZbjWM4OkQMwu
         fg2/hxrk6dZsgc4YDB+hZcIfc1sQsVzgrWoSco7hXIia5U45UxG1cvCnnAVlJuwYXvd2
         7JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DC+SAeQCtzMrFpjDHhPV4XmM1MlKbA7tj6aiAM9WJCY=;
        b=CZz6Z3XQvPA0ha66EVUElgnf2jl1PbnKVmW7sS4IAbi+tDjTjKso3weqE1hL+xUf5j
         61/MR7EpxlMJ8SHJrk+6KLBwq+XXpCybxUEHamxesCOVcA+d2HxwmNhyOqlv/or20FTh
         fdHVw95qkhIoT28TgvuWPhLtBDbVSciON+3jSaHTkfG1mqxkY77IZ8e8OXFeCiz1acSr
         TH4fZ+scG0wyeXfEIheFDDaBVZtW0ZaF9eWlIjWWx2NbnXQBOmY6P37Sv3sPPSykF63M
         fG4m6ICOaF0JdYgeDxJpFCEsulUP1nn/SppiBINXPXKfKdsRz+GIQiSwSx3k6QNNkKyu
         u7Sw==
X-Gm-Message-State: AOAM532PNnTh5fMehtMNojlRBbnKVpbZFsEHDWxxAOWb3gxARqznQhvj
	eHO8Z/NUlyVYYgoGKv1wuoCC6chuG74=
X-Google-Smtp-Source: ABdhPJzb6PTP2Yy3wM7WFaqR9b6ypkByizrJVjOIDGrzt544wUPj5LNbombetK5d14ZX69vi3LhP9w==
X-Received: by 2002:a17:90a:ea83:: with SMTP id h3mr13515001pjz.176.1593562073671;
        Tue, 30 Jun 2020 17:07:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 28/32] linuxptp: Fix segmentation fault on 32 bit platforms with 64 bit time_t
Date: Tue, 30 Jun 2020 17:07:13 -0700
Message-Id: <c88e8dceeb52688139cfd12f0ccfac1760dfd023.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Christian Eggers <ceggers@arri.de>

Back ported upstream patch:
https://github.com/richardcochran/linuxptp/commit/7de73fefc378cc42b9ed1115b3afa409d0250a48

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 924bd4dd084cb86704c52fecee5bd147186a6efb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linuxptp/time_t_maybe_long_long.patch     | 135 ++++++++++++++++++
 .../linuxptp/linuxptp_2.0.bb                  |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_long.patch

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_long.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_long.patch
new file mode 100644
index 0000000000..af99d2b7f9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_long.patch
@@ -0,0 +1,135 @@
+Fix printf if time_t is long long
+
+On some platforms, time_t has recently switched from "long" to "long
+long" [1]. For these platforms it is necessary to use "%lld" as printf
+format specifier because the ABI differs between "long" and "long long".
+
+I found no way for creating something similar to PRId64 for time_t. No
+idea how to determine whether it's "long" or "long long". So I cast
+everything to "long long" instead.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=38143339646a4ccce8afe298c34467767c899f51
+
+Upstream-Status: Accepted [next version is after 2.0]
+Upstream-Patch: https://github.com/richardcochran/linuxptp/commit/7de73fefc378cc42b9ed1115b3afa409d0250a48
+
+Signed-off-by: Christian Eggers <ceggers@arri.de>
+---
+diff -Naur linuxptp-2.0.org/phc_ctl.c linuxptp-2.0/phc_ctl.c
+--- linuxptp-2.0.org/phc_ctl.c	2018-08-12 23:08:43.000000000 +0200
++++ linuxptp-2.0/phc_ctl.c	2020-05-29 21:34:26.166519963 +0200
+@@ -230,8 +230,8 @@
+ 			strerror(errno));
+ 		return -1;
+ 	} else {
+-		pr_notice("set clock time to %ld.%09ld or %s",
+-			ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
++		pr_notice("set clock time to %lld.%09ld or %s",
++			(long long)ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
+ 	}
+ 
+ 	return args_to_eat;
+@@ -248,8 +248,8 @@
+ 
+ 		return -1;
+ 	} else {
+-		pr_notice("clock time is %ld.%09lu or %s",
+-			ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
++		pr_notice("clock time is %lld.%09lu or %s",
++			(long long)ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
+ 	}
+ 
+ 	/* get operation does not require any arguments */
+diff -Naur linuxptp-2.0.org/print.c linuxptp-2.0/print.c
+--- linuxptp-2.0.org/print.c	2018-08-12 23:08:43.000000000 +0200
++++ linuxptp-2.0/print.c	2020-05-29 21:34:26.166519963 +0200
+@@ -73,16 +73,16 @@
+ 
+ 	if (verbose) {
+ 		f = level >= LOG_NOTICE ? stdout : stderr;
+-		fprintf(f, "%s[%ld.%03ld]: %s%s%s\n",
++		fprintf(f, "%s[%lld.%03ld]: %s%s%s\n",
+ 			progname ? progname : "",
+-			ts.tv_sec, ts.tv_nsec / 1000000,
++			(long long)ts.tv_sec, ts.tv_nsec / 1000000,
+ 			message_tag ? message_tag : "", message_tag ? " " : "",
+ 			buf);
+ 		fflush(f);
+ 	}
+ 	if (use_syslog) {
+-		syslog(level, "[%ld.%03ld] %s%s%s",
+-		       ts.tv_sec, ts.tv_nsec / 1000000,
++		syslog(level, "[%lld.%03ld] %s%s%s",
++		       (long long)ts.tv_sec, ts.tv_nsec / 1000000,
+ 		       message_tag ? message_tag : "", message_tag ? " " : "",
+ 		       buf);
+ 	}
+diff -Naur linuxptp-2.0.org/unicast_service.c linuxptp-2.0/unicast_service.c
+--- linuxptp-2.0.org/unicast_service.c	2018-08-12 23:08:43.000000000 +0200
++++ linuxptp-2.0/unicast_service.c	2020-05-29 21:36:23.170497415 +0200
+@@ -209,9 +209,9 @@
+ 	tmo = now.tv_sec + req->durationField;
+ 	if (tmo > client->grant_tmo) {
+ 		client->grant_tmo = tmo;
+-		pr_debug("%s grant of 0x%x extended to %ld",
++		pr_debug("%s grant of 0x%x extended to %lld",
+ 			 pid2str(&client->portIdentity),
+-			 client->message_types, tmo);
++			 client->message_types, (long long)tmo);
+ 	}
+ }
+ 
+@@ -226,8 +226,8 @@
+ 	interval = pqueue_peek(p->unicast_service->queue);
+ 	if (interval) {
+ 		tmo.it_value = interval->tmo;
+-		pr_debug("arming timer tmo={%ld,%ld}",
+-			 interval->tmo.tv_sec, interval->tmo.tv_nsec);
++		pr_debug("arming timer tmo={%lld,%ld}",
++			 (long long)interval->tmo.tv_sec, interval->tmo.tv_nsec);
+ 	} else {
+ 		pr_debug("stopping unicast service timer");
+ 	}
+@@ -499,8 +499,8 @@
+ 
+ 	while ((interval = pqueue_peek(p->unicast_service->queue)) != NULL) {
+ 
+-		pr_debug("peek i={2^%d} tmo={%ld,%ld}", interval->log_period,
+-			 interval->tmo.tv_sec, interval->tmo.tv_nsec);
++		pr_debug("peek i={2^%d} tmo={%lld,%ld}", interval->log_period,
++			 (long long)interval->tmo.tv_sec, interval->tmo.tv_nsec);
+ 
+ 		if (timespec_compare(&now, &interval->tmo) >= 0) {
+ 			break;
+@@ -519,8 +519,8 @@
+ 		}
+ 
+ 		interval_increment(interval);
+-		pr_debug("next i={2^%d} tmo={%ld,%ld}", interval->log_period,
+-			 interval->tmo.tv_sec, interval->tmo.tv_nsec);
++		pr_debug("next i={2^%d} tmo={%lld,%ld}", interval->log_period,
++			 (long long)interval->tmo.tv_sec, interval->tmo.tv_nsec);
+ 		pqueue_insert(p->unicast_service->queue, interval);
+ 	}
+ 
+diff -Naur linuxptp-2.0.org/unicast_client.c linuxptp-2.0/unicast_client.c
+--- linuxptp-2.0.org/unicast_client.c	2018-08-12 23:08:43.000000000 +0200
++++ linuxptp-2.0/unicast_client.c	2020-06-02 11:13:06.922997844 +0200
+@@ -216,7 +216,7 @@
+ 				       long duration)
+ {
+ 	struct timespec now;
+-	long tmo;
++	time_t tmo;
+ 
+ 	if (clock_gettime(CLOCK_MONOTONIC, &now)) {
+ 		pr_err("clock_gettime failed: %m");
+@@ -226,7 +226,7 @@
+ 	tmo = now.tv_sec + duration;
+ 	if (!master->renewal_tmo || tmo < master->renewal_tmo) {
+ 		master->renewal_tmo = tmo;
+-		pr_debug("port %d: renewal timeout at %ld", portnum(p), tmo);
++		pr_debug("port %d: renewal timeout at %lld", portnum(p), (long long)tmo);
+ 	}
+ }
+ 
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
index eb262d36b2..930c6673dc 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://no-incdefs-using-host-headers.patch \
+           file://time_t_maybe_long_long.patch \
            "
 
 SRC_URI[md5sum] = "d8bb7374943bb747db7786ac26f17f11"
-- 
2.17.1

