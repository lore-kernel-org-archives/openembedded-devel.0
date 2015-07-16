Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 708D16013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:52:31 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZFjaR-0002Nx-KU from Joe_MacDonald@mentor.com ;
	Thu, 16 Jul 2015 06:52:31 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 16 Jul 2015 06:52:31 -0700
Received: by burninator (Postfix, from userid 1000)	id 48A675835B3; Thu, 16
	Jul 2015 09:52:06 -0400 (EDT)
Date: Thu, 16 Jul 2015 09:52:06 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20150716135205.GA4432@mentor.com>
References: <1436174216-14196-1-git-send-email-rongqing.li@windriver.com>
	<20150715160631.GC29923@mentor.com> <55A719E5.60603@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55A719E5.60603@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] inetutils: Fix deadlock in telnetd when cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jul 2015 13:52:36 -0000
X-Groupsio-MsgNum: 56263
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH][meta-networking] inetutils: Fix deadlock in telnetd when =
cleanup] On 15.07.16 (Thu 10:41) Rongqing Li wrote:

>=20
>=20
> On 2015=E5=B9=B407=E6=9C=8816=E6=97=A5 00:06, Joe MacDonald wrote:
> >Is this fix even relevant?  Has anyone seen this or able to trigger it
> >(maybe by using the script in the first link?  I wasn't.)  If someone
> >thinks this is still required, I'll merge it, but on the surface it's a
> >five year old patch for a different piece of software (netkit-telnet vs.
> >inetutils) that causes a deadlock on a much older version of a libc
> >library and a five-and-a-half-year-old kernel.
> >
> >-J.
>=20
>=20
> Ok, please drop it;
>=20
> Our customer reported a telnetd deadlock issue on our old product,
> And Wang fixed it by porting this patch; but I can not reproduce it
> whether in old or new product.

Dropped, thanks for the clarification, Roy.

-J.

>=20
> -Roy
>=20
> >
> >[[oe] [PATCH][meta-networking] inetutils: Fix deadlock in telnetd when c=
leanup] On 15.07.06 (Mon 17:16) rongqing.li@windriver.com wrote:
> >
> >>From: Li Wang <li.wang@windriver.com>
> >>
> >>the patch comes from:
> >>https://bugs.launchpad.net/ubuntu/+source/netkit-telnet/+bug/507455
> >>https://launchpadlibrarian.net/37882973/0001-telnetd-Fix-deadlock-on-cl=
eanup.patch
> >>
> >>The cleanup function in telnetd is called both directly and on SIGCHLD
> >>signals. This, unfortunately, triggered a deadlock in eglibc 2.9 while
> >>running on a 2.6.31.11 kernel.
> >>
> >>What we were seeing is hangs like these:
> >>
> >>   (gdb) bt
> >>   #0  0xb7702424 in __kernel_vsyscall ()
> >>   #1  0xb7658e61 in __lll_lock_wait_private () from ./lib/libc.so.6
> >>   #2  0xb767e7b5 in _L_lock_15 () from ./lib/libc.so.6
> >>   #3  0xb767e6e0 in utmpname () from ./lib/libc.so.6
> >>   #4  0xb76bcde7 in logout () from ./lib/libutil.so.1
> >>   #5  0x0804c827 in cleanup ()
> >>   #6  <signal handler called>
> >>   #7  0xb7702424 in __kernel_vsyscall ()
> >>   #8  0xb7641003 in __fcntl_nocancel () from ./lib/libc.so.6
> >>   #9  0xb767e0c3 in getutline_r_file () from ./lib/libc.so.6
> >>   #10 0xb767d675 in getutline_r () from ./lib/libc.so.6
> >>   #11 0xb76bce42 in logout () from ./lib/libutil.so.1
> >>   #12 0x0804c827 in cleanup ()
> >>   #13 0x0804a0b5 in telnet ()
> >>   #14 0x0804a9c3 in main ()
> >>
> >>and what has happened here is that the user closes the telnet session
> >>via the escape character. This causes telnetd to call cleanup in frame
> >>the SIGCHLD signal is delivered while telnetd is executing cleanup.
> >>
> >>Telnetd then calls the signal handler for SIGCHLD, which is cleanup().
> >>Ouch. The actual deadlock is in libc. getutline_r in frame #10 gets the
> >>__libc_utmp_lock lock, and utmpname above does the same thing in frame
> >>
> >>The fix registers the SIGCHLD handler as cleanup_sighandler, and makes
> >>cleanup disable the SIGCHLD signal before calling cleanup_sighandler.
> >>
> >>Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> >>Signed-off-by: Li Wang <li.wang@windriver.com>
> >>---
> >>  .../telnetd-Fix-deadlock-on-cleanup.patch          | 108 ++++++++++++=
+++++++++
> >>  .../inetutils/inetutils_1.9.2.bb                   |   1 +
> >>  2 files changed, 109 insertions(+)
> >>  create mode 100644 meta-networking/recipes-connectivity/inetutils/ine=
tutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch
> >>
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-conn=
ectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch
> >>new file mode 100644
> >>index 0000000..3ec7613
> >>--- /dev/null
> >>+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/te=
lnetd-Fix-deadlock-on-cleanup.patch
> >>@@ -0,0 +1,108 @@
> >>+telnetd: Fix deadlock on cleanup
> >>+
> >>+the patch comes from:
> >>+https://bugs.launchpad.net/ubuntu/+source/netkit-telnet/+bug/507455
> >>+https://launchpadlibrarian.net/37882973/0001-telnetd-Fix-deadlock-on-c=
leanup.patch
> >>+
> >>+The cleanup function in telnetd is called both directly and on SIGCHLD
> >>+signals. This, unfortunately, triggered a deadlock in eglibc 2.9 while
> >>+running on a 2.6.31.11 kernel.
> >>+
> >>+What we were seeing is hangs like these:
> >>+
> >>+  (gdb) bt
> >>+  #0  0xb7702424 in __kernel_vsyscall ()
> >>+  #1  0xb7658e61 in __lll_lock_wait_private () from ./lib/libc.so.6
> >>+  #2  0xb767e7b5 in _L_lock_15 () from ./lib/libc.so.6
> >>+  #3  0xb767e6e0 in utmpname () from ./lib/libc.so.6
> >>+  #4  0xb76bcde7 in logout () from ./lib/libutil.so.1
> >>+  #5  0x0804c827 in cleanup ()
> >>+  #6  <signal handler called>
> >>+  #7  0xb7702424 in __kernel_vsyscall ()
> >>+  #8  0xb7641003 in __fcntl_nocancel () from ./lib/libc.so.6
> >>+  #9  0xb767e0c3 in getutline_r_file () from ./lib/libc.so.6
> >>+  #10 0xb767d675 in getutline_r () from ./lib/libc.so.6
> >>+  #11 0xb76bce42 in logout () from ./lib/libutil.so.1
> >>+  #12 0x0804c827 in cleanup ()
> >>+  #13 0x0804a0b5 in telnet ()
> >>+  #14 0x0804a9c3 in main ()
> >>+
> >>+and what has happened here is that the user closes the telnet session
> >>+via the escape character. This causes telnetd to call cleanup in frame
> >>+the SIGCHLD signal is delivered while telnetd is executing cleanup.
> >>+
> >>+Telnetd then calls the signal handler for SIGCHLD, which is cleanup().
> >>+Ouch. The actual deadlock is in libc. getutline_r in frame #10 gets the
> >>+__libc_utmp_lock lock, and utmpname above does the same thing in frame
> >>+
> >>+The fix registers the SIGCHLD handler as cleanup_sighandler, and makes
> >>+cleanup disable the SIGCHLD signal before calling cleanup_sighandler.
> >>+
> >>+Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> >>+Signed-off-by: Li Wang <li.wang@windriver.com>
> >>+---
> >>+ telnetd/pty.c     |   17 ++++++++++++++++-
> >>+ telnetd/telnetd.c |    2 +-
> >>+ telnetd/telnetd.h |    1 +
> >>+ 3 files changed, 18 insertions(+), 2 deletions(-)
> >>+
> >>+diff --git a/telnetd/pty.c b/telnetd/pty.c
> >>+index 21b0b69..22a17c5 100644
> >>+--- a/telnetd/pty.c
> >>++++ b/telnetd/pty.c
> >>+@@ -145,7 +145,7 @@ start_login (char *host, int autologin, char *name)
> >>+  * reported exit code.
> >>+  */
> >>+ void
> >>+-cleanup (int sig)
> >>++cleanup_sighandler (int sig)
> >>+ {
> >>+   int status =3D EXIT_FAILURE;
> >>+   char *p;
> >>+@@ -168,3 +168,18 @@ cleanup (int sig)
> >>+   shutdown (net, 2);
> >>+   exit (status);
> >>+ }
> >>++
> >>++void cleanup(int sig) {
> >>++    sigset_t mask, oldmask;
> >>++
> >>++    /* Set up the mask of signals to temporarily block. */
> >>++    sigemptyset (&mask);
> >>++    sigaddset (&mask, SIGCHLD);
> >>++
> >>++    /* Block SIGCHLD while running cleanup */
> >>++    sigprocmask (SIG_BLOCK, &mask, &oldmask);
> >>++
> >>++    cleanup_sighandler(sig);
> >>++    /* Technically not needed since cleanup_sighandler exits */
> >>++    sigprocmask (SIG_UNBLOCK, &mask, NULL);
> >>++}
> >>+diff --git a/telnetd/telnetd.c b/telnetd/telnetd.c
> >>+index cf7ce0f..4fe95b5 100644
> >>+--- a/telnetd/telnetd.c
> >>++++ b/telnetd/telnetd.c
> >>+@@ -527,7 +527,7 @@ telnetd_setup (int fd)
> >>+   signal (SIGTTOU, SIG_IGN);
> >>+ #endif
> >>+
> >>+-  signal (SIGCHLD, cleanup);
> >>++  signal (SIGCHLD, cleanup_sighandler);
> >>+ }
> >>+
> >>+ int
> >>+diff --git a/telnetd/telnetd.h b/telnetd/telnetd.h
> >>+index ce90fbc..8bac120 100644
> >>+--- a/telnetd/telnetd.h
> >>++++ b/telnetd/telnetd.h
> >>+@@ -326,6 +326,7 @@ extern void add_slc (char func, char flag, cc_t va=
l);
> >>+ extern void check_slc (void);
> >>+ extern void change_slc (char func, char flag, cc_t val);
> >>+
> >>++extern void cleanup_sighandler (int);
> >>+ extern void cleanup (int);
> >>+ extern void clientstat (int, int, int);
> >>+ extern void copy_termbuf ();
> >>+--
> >>+1.7.9.5
> >>+
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1=
=2E9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.=
bb
> >>index 9bb9fe8..5c5699a 100644
> >>--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> >>+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> >>@@ -18,6 +18,7 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.=
tar.gz \
> >>             file://telnet.xinetd.inetutils \
> >>             file://tftpd.xinetd.inetutils \
> >>             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
> >>+           file://telnetd-Fix-deadlock-on-cleanup.patch \
> >>  "
> >>
> >>  SRC_URI[md5sum] =3D "aa1a9a132259db83e66c1f3265065ba2"
> >>--
> >>1.9.1
> >>
>=20
--=20
-Joe MacDonald.
:wq

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVp7cCAAoJEEn8ffcsOfaWgRMH/i5YlvNCi2oJpW2ltU8Yr2L4
axGbvApOhz2ZNoNz1AtzxEARdOi36C9HaTBl9iYe2kwP3LsKwOhzaWuaHtO2+Z7W
yGokzYLn6IksVz0a1ETlhuIxPlgxSzTXcrMlFiCRC0riQeAhxtbN6drsQkEyBdlr
ed2VoSIBTH4WAPDTXrUfMFhr3nlVjG3PnL1hRMThyh/l89A382xV45Yv4MSLKjzE
3kf/hNMzCuX6K1VhRRQN/FyjXyvf13GWW+zuxa79jgQ6/CbNRscPYZsnC3YS1NX9
G3J93cpNjK9KCQMtfoRFQaclwOFRCLAjeJ+ma0esVQbbcYkgkmok6JUtxvEayuI=
=oXO7
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
