Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id E05D97856A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 16:59:22 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id y89-v6so3160120qtd.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WcCLC1SyCWLcXby+XgjbHsR8v+zEnjQaAeU1sO4/naE=;
	b=KldXQJK7bEIgpt2QBxictl1iDN6KpjBocbI4qfvkNS9tu9OGN+Gub4lN19stMhfv01
	FwBdf1NVNtJT/7ArpeHYS6vz9vpT0AhyeoXDslZmFmw6Yd+iw0ld8v5b83B1C2SE4KSt
	2D/6DgRVt1xTHJNs96VxFy27heO19da0aynSncPXRej/GLtxewm/QrmooIOrwQmQ+5YC
	1QjUQJS1WqTPtSvl5lABdqnJkQv5M9C9WGUQVyZWfQPKPpPxxlDA1pn0YVuIZLIJvDiK
	5ARAwi4v9t06Hz4+tCawXlTlXM2fZ6IpiCcTsoU5oJcQ/nrWXM6Ae1CBuFl9sKBwLv7c
	FLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WcCLC1SyCWLcXby+XgjbHsR8v+zEnjQaAeU1sO4/naE=;
	b=Zmb7cuG9UC8MHqbY3U+rpWTmLLn5+YPbOMoQebLd4xeoxnYZr12tru+nV1xIf/Wjt7
	TZpAW0CkAWzZLlIi0bPZIN7COrrSLekSyK2bZoztShoWZpVlyArEsH2PFIwylmJ+NCWR
	fDVOWoQErsDQgbSs/UVuvPx/9YiciQe2DMF3Wm96wwe0TfBg5yWvRDQHkDv52O147Yhc
	VO2+d9jj3a+1yKyjDwmMEGNZ1Z5aGArAsYPI1d1UcZAeU+1KUYrlX66Nl+zspQHVIRws
	23gyBc738g/qX3pY2q2hW4q2j1uZasgXRK8iBbWgqRxcqT6ZQ7daP2bClbWT+90a4q8w
	g0eg==
X-Gm-Message-State: APt69E1TqNzejJSwMHKYdxpg2o+uO/efgYstEbZRaQIjLIEGlZVTg/g1
	K0HcU7P7XIN7F6n8rT2t4lF2Hdv2/bETcVTCoIo=
X-Google-Smtp-Source: ADUXVKKqCT0/d+o5lGIWbSu/zUG3NQAl253Ef7QOT4s27KpHYaziEbnw40eypHxEvS8LK2UpCWhw2txc2Axr8p8Ij/A=
X-Received: by 2002:a0c:9a43:: with SMTP id
	q3-v6mr24600162qvd.221.1528217963477; 
	Tue, 05 Jun 2018 09:59:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 09:58:53 -0700 (PDT)
In-Reply-To: <1528008170-11349-1-git-send-email-ishitsuka.sc@ncos.nec.co.jp>
References: <1528008170-11349-1-git-send-email-ishitsuka.sc@ncos.nec.co.jp>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jun 2018 09:58:53 -0700
Message-ID: <CAMKF1sqzrUUfE1PnMhaD2sm+HWp5Fqfk=Yg6CdPC4DkLgSDFAg@mail.gmail.com>
To: Seiichi Ishitsuka <ishitsuka.sc@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] telnetd: Fix deadlock on cleanup
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
X-List-Received-Date: Tue, 05 Jun 2018 16:59:23 -0000
Content-Type: text/plain; charset="UTF-8"

can you rebase it on top of master-next and resend ?

On Sat, Jun 2, 2018 at 11:42 PM, Seiichi Ishitsuka
<ishitsuka.sc@gmail.com> wrote:
> The cleanup function in telnetd is called both directly and on SIGCHLD signals.
> This triggered a deadlock in glibc and was reproduced in glibc 2.27 while
> running on a 4.14.30 kernel.
>
> Signed-off-by: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
> ---
>  ...01-telnet-telnetd-Fix-deadlock-on-cleanup.patch | 114 +++++++++++++++++++++
>  .../netkit-telnet/netkit-telnet_0.17.bb            |   1 +
>  2 files changed, 115 insertions(+)
>  create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch
>
> diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch
> new file mode 100644
> index 0000000..945785d
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch
> @@ -0,0 +1,114 @@
> +From 06ed6a6bf25a22902846097d6b6c97e070c2c326 Mon Sep 17 00:00:00 2001
> +From: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
> +Date: Fri, 1 Jun 2018 14:27:35 +0900
> +Subject: [PATCH] telnetd: Fix deadlock on cleanup
> +
> +The cleanup function in telnetd is called both directly and on SIGCHLD
> +signals. This, unfortunately, triggered a deadlock in eglibc 2.9 while
> +running on a 2.6.31.11 kernel.
> +
> +What we were seeing is hangs like these:
> +
> +  (gdb) bt
> +  #0  0xb7702424 in __kernel_vsyscall ()
> +  #1  0xb7658e61 in __lll_lock_wait_private () from ./lib/libc.so.6
> +  #2  0xb767e7b5 in _L_lock_15 () from ./lib/libc.so.6
> +  #3  0xb767e6e0 in utmpname () from ./lib/libc.so.6
> +  #4  0xb76bcde7 in logout () from ./lib/libutil.so.1
> +  #5  0x0804c827 in cleanup ()
> +  #6  <signal handler called>
> +  #7  0xb7702424 in __kernel_vsyscall ()
> +  #8  0xb7641003 in __fcntl_nocancel () from ./lib/libc.so.6
> +  #9  0xb767e0c3 in getutline_r_file () from ./lib/libc.so.6
> +  #10 0xb767d675 in getutline_r () from ./lib/libc.so.6
> +  #11 0xb76bce42 in logout () from ./lib/libutil.so.1
> +  #12 0x0804c827 in cleanup ()
> +  #13 0x0804a0b5 in telnet ()
> +  #14 0x0804a9c3 in main ()
> +
> +and what has happened here is that the user closes the telnet session
> +via the escape character. This causes telnetd to call cleanup in frame
> +the SIGCHLD signal is delivered while telnetd is executing cleanup.
> +
> +Telnetd then calls the signal handler for SIGCHLD, which is cleanup().
> +Ouch. The actual deadlock is in libc. getutline_r in frame #10 gets the
> +__libc_utmp_lock lock, and utmpname above does the same thing in frame
> +
> +The fix registers the SIGCHLD handler as cleanup_sighandler, and makes
> +cleanup disable the SIGCHLD signal before calling cleanup_sighandler.
> +
> +Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> +
> +The patch was imported from the Ubuntu netkit-telnet package.
> +(https://bugs.launchpad.net/ubuntu/+source/netkit-telnet/+bug/507455)
> +
> +A previous patch declaring attributes of functions, but it is not used
> +in upstream.
> +
> +Signed-off-by: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
> +---
> + telnetd/ext.h      |  1 +
> + telnetd/sys_term.c | 17 ++++++++++++++++-
> + telnetd/telnetd.c  |  2 +-
> + 3 files changed, 18 insertions(+), 2 deletions(-)
> +
> +diff --git a/telnetd/ext.h b/telnetd/ext.h
> +index b98d6ec..08f9d07 100644
> +--- a/telnetd/ext.h
> ++++ b/telnetd/ext.h
> +@@ -97,6 +97,7 @@ void add_slc(int, int, int);
> + void check_slc(void);
> + void change_slc(int, int, int);
> + void cleanup(int);
> ++void cleanup_sighandler(int);
> + void clientstat(int, int, int);
> + void copy_termbuf(char *, int);
> + void deferslc(void);
> +diff --git a/telnetd/sys_term.c b/telnetd/sys_term.c
> +index 5b4aa84..c4fb0f7 100644
> +--- a/telnetd/sys_term.c
> ++++ b/telnetd/sys_term.c
> +@@ -719,7 +719,7 @@ static void addarg(struct argv_stuff *avs, const char *val) {
> +  * This is the routine to call when we are all through, to
> +  * clean up anything that needs to be cleaned up.
> +  */
> +-void cleanup(int sig) {
> ++void cleanup_sighandler(int sig) {
> +     char *p;
> +     (void)sig;
> +
> +@@ -742,3 +742,18 @@ void cleanup(int sig) {
> +     shutdown(net, 2);
> +     exit(0);
> + }
> ++
> ++void cleanup(int sig) {
> ++    sigset_t mask, oldmask;
> ++
> ++    /* Set up the mask of signals to temporarily block. */
> ++    sigemptyset (&mask);
> ++    sigaddset (&mask, SIGCHLD);
> ++
> ++    /* Block SIGCHLD while running cleanup */
> ++    sigprocmask (SIG_BLOCK, &mask, &oldmask);
> ++
> ++    cleanup_sighandler(sig);
> ++    /* Technically not needed since cleanup_sighandler exits */
> ++    sigprocmask (SIG_UNBLOCK, &mask, NULL);
> ++}
> +diff --git a/telnetd/telnetd.c b/telnetd/telnetd.c
> +index 9ace838..788919c 100644
> +--- a/telnetd/telnetd.c
> ++++ b/telnetd/telnetd.c
> +@@ -833,7 +833,7 @@ void telnet(int f, int p)
> +     signal(SIGTTOU, SIG_IGN);
> + #endif
> +
> +-    signal(SIGCHLD, cleanup);
> ++    signal(SIGCHLD, cleanup_sighandler);
> +
> + #ifdef TIOCNOTTY
> +     {
> +--
> +2.7.4
> +
> diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> index 807b566..743cf26 100644
> --- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> @@ -11,6 +11,7 @@ SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/${BP}.tar.gz \
>             file://telnet-xinetd \
>             file://cross-compile.patch \
>             file://0001-telnet-telnetd-Fix-print-format-strings.patch \
> +           file://0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch \
>             "
>
>  EXTRA_OEMAKE = "INSTALLROOT=${D} SBINDIR=${sbindir} DAEMONMODE=755 \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

