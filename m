Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id EE54877D6C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 06:32:27 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id k3so1764511pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 23:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ScOeprUEMTE0KOrX9JfFwfBpEekWFKJnJuDyxmKclas=;
	b=ANbDsjgJzSjZ0OQHFhjLLJ2yTawJV9fSIbEIrWTyhV+ugGkFLcIX7JLwU6Aj+BJi5H
	cPUUMxvvEWJ6OqK5rNLTwaaeTY+acaAZkj0q39k/QoGoIfvciHTi2qb8/+k/ZpWy2Vv3
	4nZPeFZBBOhBDamFZnac8Y7Tmka9CQzvJY5JWQAubdjLi/7JQpFW1tk8VnIAatRMR5L3
	sCuDnpOfXRkY2DovODoQuZS6rqn02Jjabp2Qd1BXg0+nN9Ui7zxkUJcr25B87jXdqnfj
	70CP0MgYs7b0WZNx9cJ+uAOoMxHt65NcZPi5xI1vIRgVPOTgjnpQY1L3McRE5gzuG3gu
	zmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ScOeprUEMTE0KOrX9JfFwfBpEekWFKJnJuDyxmKclas=;
	b=XonRLlT9VrrM+aE2tuA7kvlxnNzbxcXd6cZwGyZOlFjXrj7Vs7NoQJUGVwzGXOj18N
	UI1kDAG4uMmK6olOCA4quh97RoWNqJqDwrGUOBB+9kOiS9dIDFJ0UU9WLNpr1VLc3DDm
	ZxV4GpbJbXaGqCqDSAQESd/xwwR+WoeGH1gdVjrprsVyofpouQys5Wkb7I5Ehy1ltUvA
	PWDHN/I0JjolE8UHoa1PG73d/sdW2htmogIEiZsWkeIYeQTN4VTIPNrDY+l+uEH6F2qX
	vzBJL2GMjzFIelvDRDrNAUflv1sE8VIfkAamxmD9iOTFnKL4uCEYnFitqzBUQRzwHz/b
	gYng==
X-Gm-Message-State: AHYfb5iqWePhHiQGqccZ2RJYlgjg53BNz314rW/fBxldG7qUzSUI/NzC
	zaBUrcrUz6y9kBaI
X-Received: by 10.84.217.157 with SMTP id p29mr3814344pli.406.1503988348892;
	Mon, 28 Aug 2017 23:32:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	c14sm3629272pfm.151.2017.08.28.23.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Aug 2017 23:32:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Aug 2017 23:32:18 -0700
Message-Id: <20170829063219.1039-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH 1/2] tftp-hpa: Fix PIE build with clang
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
X-List-Received-Date: Tue, 29 Aug 2017 06:32:28 -0000

clang finds a name clash with libc and linker errors out like below

tftpd.o: relocation R_ARM_REL32 against external or undefined symbol `__progname@@GLIBC_2.4' can not be used when making a PIE executable; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-__progname-is-provided-by-libc.patch      | 62 ++++++++++++++++++++++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch b/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch
new file mode 100644
index 000000000..cead977e2
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch
@@ -0,0 +1,62 @@
+From 941038fc05be21202cab7a7a9434097fb55ecbe0 Mon Sep 17 00:00:00 2001
+From: Thorsten Glaser <tg@mirbsd.de>
+Date: Thu, 31 Jul 2014 16:29:41 +0930
+Subject: [PATCH] __progname[] is provided by libc
+
+Rename local variable to tftpd_progname to avoid a clash with glibc
+global symbols and work around Debian bug #519006 (Closes: #564052).
+
+[ hpa: specifically, double-underscore symbols in C are reserved for
+  the implementation, i.e. compiler/libc. ]
+
+Signed-off-by: Ron Lee <ron@debian.org>
+Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
+---
+ tftpd/tftpd.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/tftpd/tftpd.c b/tftpd/tftpd.c
+index e247b97..5fec7bf 100644
+--- a/tftpd/tftpd.c
++++ b/tftpd/tftpd.c
+@@ -76,7 +76,7 @@ static int ai_fam = AF_INET;
+ #define TRIES   6               /* Number of attempts to send each packet */
+ #define TIMEOUT_LIMIT ((1 << TRIES)-1)
+ 
+-const char *__progname;
++const char *tftpd_progname;
+ static int peer;
+ static unsigned long timeout  = TIMEOUT;        /* Current timeout value */
+ static unsigned long rexmtval = TIMEOUT;       /* Basic timeout value */
+@@ -395,9 +395,9 @@ int main(int argc, char **argv)
+     /* basename() is way too much of a pain from a portability standpoint */
+ 
+     p = strrchr(argv[0], '/');
+-    __progname = (p && p[1]) ? p + 1 : argv[0];
++    tftpd_progname = (p && p[1]) ? p + 1 : argv[0];
+ 
+-    openlog(__progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
++    openlog(tftpd_progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
+ 
+     srand(time(NULL) ^ getpid());
+ 
+@@ -946,14 +946,14 @@ int main(int argc, char **argv)
+        syslog daemon gets restarted by the time we get here. */
+     if (secure && standalone) {
+         closelog();
+-        openlog(__progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
++        openlog(tftpd_progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
+     }
+ 
+ #ifdef HAVE_TCPWRAPPERS
+     /* Verify if this was a legal request for us.  This has to be
+        done before the chroot, while /etc is still accessible. */
+     request_init(&wrap_request,
+-                 RQ_DAEMON, __progname,
++                 RQ_DAEMON, tftpd_progname,
+                  RQ_FILE, fd,
+                  RQ_CLIENT_SIN, &from, RQ_SERVER_SIN, &myaddr, 0);
+     sock_methods(&wrap_request);
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 0a418b97f..fe8a32e7d 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
            file://add-error-check-for-disk-filled-up.patch \
            file://tftp-hpa-bug-fix-on-separated-CR-and-LF.patch \
            file://fix-writing-emtpy-file.patch \
+           file://0001-__progname-is-provided-by-libc.patch \
            file://tftpd-hpa.socket \
            file://tftpd-hpa.service \
 "
-- 
2.14.1


