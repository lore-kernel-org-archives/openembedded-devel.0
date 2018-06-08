Return-Path: <ishitsuka.sc@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88D1575436
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 04:42:35 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id d2-v6so5776505pga.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 21:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CR2AjzW00L+M5O9T+lWn8j2C+8pwtnMobExDbuP+rJw=;
	b=APGGasXjU4RtpCU8wCoZ2ePWM/+mVaig6rRbc0XVMZ9wjeuzD43jZXjJt3x8NBmJEh
	pF/iZ1udjP7djpsuMvRF/983n2vr0kZheWAhyLj/tC7n72q9MvxH3tEpLlFLUuAvQ+od
	Rnr4O01WUpLOmEsEkrZqv2ddFWqRfYnSwGPr7bBXmWVzkRcFUk/9sD5s+NvmWzRe2Ybq
	nWiC8lbcIa1uQ7pDuzTWhBTdw5bPJcfWMKw+BsTvn4jrx54+2vwAjv8XIqfkYef00Fzj
	fHlj3eveLRl9FP0JuF3wtDT+Lf0zf8RnYze+fv5n/h01vW2bKHdmPNfhGob0KrJ5qJgm
	Lw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CR2AjzW00L+M5O9T+lWn8j2C+8pwtnMobExDbuP+rJw=;
	b=JSaz+KEhpAxEB5gNORIMq9pIMONXAR+quoNuCZD9umf8XsrumVh9qMt2C8/26Ls+BQ
	cmsqEkJP4rQcADid4E5PqOYUQL65br4NS21mIhmRv6QCLCIaMtjM0A0VWojGxYZ7RQyz
	AsoVF736a7+v/lS/TDAK449jfcEeGXy1PWXEdbDsKNEToSs+0LNS27HhAOVJsRyKKLzV
	aUrYJeMj+fdSEA7yaPXV88G6GR6+1CYHaOG/lGc6BmyIM4TcLiuCzkWH/hWQsKRAXkgh
	XyCzMEjaqdCiyOg+WvlgLPt3xiQq9nn7LK+OXAM7fHoM/EX1C5+W2WeTppn9vlDJ1zTW
	cWLg==
X-Gm-Message-State: APt69E3PyNfucB+GKFjDYv7m6A37IImltltIPvUX+cWr6bSTpwCYsyEv
	jfDlsPJIiDtKleEVpYYyE2X4WHCF
X-Google-Smtp-Source: ADUXVKJvTbJtflghhgEBnwA95qf7uIQeweHuxDZoFgKRhZrwtJ5m2ZCMnNcW6SsR5FP7BoX2R3gGeQ==
X-Received: by 2002:a62:ac14:: with SMTP id
	v20-v6mr4337360pfe.126.1528432956330; 
	Thu, 07 Jun 2018 21:42:36 -0700 (PDT)
Received: from localhost.localdomain (softbank219174086128.bbtec.net.
	[219.174.86.128]) by smtp.gmail.com with ESMTPSA id
	t67-v6sm58068644pfg.51.2018.06.07.21.42.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 21:42:35 -0700 (PDT)
From: Seiichi Ishitsuka <ishitsuka.sc@gmail.com>
X-Google-Original-From: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 13:42:11 +0900
Message-Id: <1528432931-5039-1-git-send-email-ishitsuka.sc@ncos.nec.co.jp>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] telnetd: Fix deadlock on cleanup
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
X-List-Received-Date: Fri, 08 Jun 2018 04:42:35 -0000

The cleanup function in telnetd is called both directly and on SIGCHLD signals.
This triggered a deadlock in glibc and was reproduced in glibc 2.27 while
running on a 4.14.30 kernel.

Signed-off-by: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
---
 ...01-telnet-telnetd-Fix-deadlock-on-cleanup.patch | 114 +++++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb            |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch
new file mode 100644
index 0000000..945785d
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch
@@ -0,0 +1,114 @@
+From 06ed6a6bf25a22902846097d6b6c97e070c2c326 Mon Sep 17 00:00:00 2001
+From: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
+Date: Fri, 1 Jun 2018 14:27:35 +0900
+Subject: [PATCH] telnetd: Fix deadlock on cleanup
+
+The cleanup function in telnetd is called both directly and on SIGCHLD
+signals. This, unfortunately, triggered a deadlock in eglibc 2.9 while
+running on a 2.6.31.11 kernel.
+
+What we were seeing is hangs like these:
+
+  (gdb) bt
+  #0  0xb7702424 in __kernel_vsyscall ()
+  #1  0xb7658e61 in __lll_lock_wait_private () from ./lib/libc.so.6
+  #2  0xb767e7b5 in _L_lock_15 () from ./lib/libc.so.6
+  #3  0xb767e6e0 in utmpname () from ./lib/libc.so.6
+  #4  0xb76bcde7 in logout () from ./lib/libutil.so.1
+  #5  0x0804c827 in cleanup ()
+  #6  <signal handler called>
+  #7  0xb7702424 in __kernel_vsyscall ()
+  #8  0xb7641003 in __fcntl_nocancel () from ./lib/libc.so.6
+  #9  0xb767e0c3 in getutline_r_file () from ./lib/libc.so.6
+  #10 0xb767d675 in getutline_r () from ./lib/libc.so.6
+  #11 0xb76bce42 in logout () from ./lib/libutil.so.1
+  #12 0x0804c827 in cleanup ()
+  #13 0x0804a0b5 in telnet ()
+  #14 0x0804a9c3 in main ()
+
+and what has happened here is that the user closes the telnet session
+via the escape character. This causes telnetd to call cleanup in frame
+the SIGCHLD signal is delivered while telnetd is executing cleanup.
+
+Telnetd then calls the signal handler for SIGCHLD, which is cleanup().
+Ouch. The actual deadlock is in libc. getutline_r in frame #10 gets the
+__libc_utmp_lock lock, and utmpname above does the same thing in frame
+
+The fix registers the SIGCHLD handler as cleanup_sighandler, and makes
+cleanup disable the SIGCHLD signal before calling cleanup_sighandler.
+
+Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
+
+The patch was imported from the Ubuntu netkit-telnet package.
+(https://bugs.launchpad.net/ubuntu/+source/netkit-telnet/+bug/507455)
+
+A previous patch declaring attributes of functions, but it is not used
+in upstream.
+
+Signed-off-by: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
+---
+ telnetd/ext.h      |  1 +
+ telnetd/sys_term.c | 17 ++++++++++++++++-
+ telnetd/telnetd.c  |  2 +-
+ 3 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/telnetd/ext.h b/telnetd/ext.h
+index b98d6ec..08f9d07 100644
+--- a/telnetd/ext.h
++++ b/telnetd/ext.h
+@@ -97,6 +97,7 @@ void add_slc(int, int, int);
+ void check_slc(void);
+ void change_slc(int, int, int);
+ void cleanup(int);
++void cleanup_sighandler(int);
+ void clientstat(int, int, int);
+ void copy_termbuf(char *, int);
+ void deferslc(void);
+diff --git a/telnetd/sys_term.c b/telnetd/sys_term.c
+index 5b4aa84..c4fb0f7 100644
+--- a/telnetd/sys_term.c
++++ b/telnetd/sys_term.c
+@@ -719,7 +719,7 @@ static void addarg(struct argv_stuff *avs, const char *val) {
+  * This is the routine to call when we are all through, to
+  * clean up anything that needs to be cleaned up.
+  */
+-void cleanup(int sig) {
++void cleanup_sighandler(int sig) {
+     char *p;
+     (void)sig;
+ 
+@@ -742,3 +742,18 @@ void cleanup(int sig) {
+     shutdown(net, 2);
+     exit(0);
+ }
++
++void cleanup(int sig) {
++    sigset_t mask, oldmask;
++
++    /* Set up the mask of signals to temporarily block. */
++    sigemptyset (&mask);
++    sigaddset (&mask, SIGCHLD);
++
++    /* Block SIGCHLD while running cleanup */
++    sigprocmask (SIG_BLOCK, &mask, &oldmask);
++
++    cleanup_sighandler(sig);
++    /* Technically not needed since cleanup_sighandler exits */
++    sigprocmask (SIG_UNBLOCK, &mask, NULL);
++}
+diff --git a/telnetd/telnetd.c b/telnetd/telnetd.c
+index 9ace838..788919c 100644
+--- a/telnetd/telnetd.c
++++ b/telnetd/telnetd.c
+@@ -833,7 +833,7 @@ void telnet(int f, int p)
+     signal(SIGTTOU, SIG_IGN);
+ #endif
+     
+-    signal(SIGCHLD, cleanup);
++    signal(SIGCHLD, cleanup_sighandler);
+     
+ #ifdef TIOCNOTTY
+     {
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 28ef36b..c03b8d9 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -11,6 +11,7 @@ SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/${BP}.tar.gz \
            file://telnet-xinetd \
            file://cross-compile.patch \
            file://0001-telnet-telnetd-Fix-print-format-strings.patch \
+           file://0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch \
            "
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/"
-- 
2.7.4


