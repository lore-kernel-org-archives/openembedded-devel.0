Return-Path: <gyurco@freemail.hu>
X-Greylist: delayed 579 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jun 2016 17:59:21 UTC
Received: from mail-outd.mail.t-online.hu (mail-outd.mail.t-online.hu
	[195.228.240.66])
	by mail.openembedded.org (Postfix) with ESMTP id A2F49731C9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 17:59:21 +0000 (UTC)
Received: from fsmeopfe.local (1F2EA8E2.dsl.pool.telekom.hu [31.46.168.226])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail00k.mail.t-online.hu (Postfix) with ESMTPSA id 3rYJK14zrDz6Rl;
	Mon, 20 Jun 2016 19:49:41 +0200 (CEST)
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Date: Mon, 20 Jun 2016 19:49:41 +0200
Message-ID: <2201005.gbJOnNeX38@gyurco.localdomain>
User-Agent: KMail/5.1.3 (Linux/4.5.7-300.fc24.x86_64; KDE/5.22.0; x86_64; ; )
In-Reply-To: <20160620140845.GA4931@mentor.com>
References: <1466276817-4209-1-git-send-email-gyurco@freemail.hu>
	<20160620140845.GA4931@mentor.com>
MIME-Version: 1.0
X-DCC--Metrics: mail00k.mail.t-online.hu 1307; Body=2 Fuz1=2 Fuz2=2
X-Spam-Probability: 0.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] Samba: use only libsystemd
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
X-List-Received-Date: Mon, 20 Jun 2016 17:59:24 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday, June 20, 2016 10:08:45 AM CEST Joe MacDonald wrote:
> Hi Gyorgy,
>=20
> [[oe] [meta-networking][PATCH] Samba: use only libsystemd] On 16.06.18 (S=
at=20
21:06) Gyorgy Szombathelyi wrote:
> > This patch was disappeared while moved to 4.4.2
>=20
> I can't find this patch in the git history, but I'm happy to merge it if
> you can provide a bit more detail on it.  Is it always valid to assume
> HAVE_LIBSYSTEMD will always mean HAVE_LIBSYSTEMD_JOURNAL and
> HAVE_LIBSYSTEMD_DAEMON?  Also, can you provide an upstream-status on
> this?

Hi Joe,

I did not do a deep research, but without the patch, the systemd notify cod=
e=20
doesn't work, so a systemctl start smb will never succeed.=20
Seems some (older?) systemd installations had libsystemd-journal.so and
libsystemd-daemon.so, but now only libsystemd.so exists.

Br,
Gy=F6rgy
>=20
> Thanks.
> -J.
>=20
> > Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
> > ---
> >=20
> >  .../samba/samba-4.4.2/10-use-only-libsystemd.patch | 81
> >  ++++++++++++++++++++++ .../recipes-connectivity/samba/samba_4.4.2.bb  =
 =20
> >   |  1 +
> >  2 files changed, 82 insertions(+)
> >  create mode 100644
> >  meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-lib=
sy
> >  stemd.patch>=20
> > diff --git
> > a/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-li=
bs
> > ystemd.patch
> > b/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-li=
bs
> > ystemd.patch new file mode 100644
> > index 0000000..81621ff
> > --- /dev/null
> > +++
> > b/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-li=
bs
> > ystemd.patch @@ -0,0 +1,81 @@
> > +diff -ur samba-4.4.2/lib/util/become_daemon.c
> > samba-4.4.2/lib/util/become_daemon.c +---
> > samba-4.4.2/lib/util/become_daemon.c	2016-05-08 18:33:24.000000000 +0200
> > ++++ samba-4.4.2/lib/util/become_daemon.c	2016-05-08 18:26:50.275177918
> > +0200 +@@ -24,7 +24,7 @@
> > + #include "includes.h"
> > + #include "system/filesys.h"
> > + #include "system/locale.h"
> > +-#if HAVE_LIBSYSTEMD_DAEMON
> > ++#if HAVE_LIBSYSTEMD
> > + #include <systemd/sd-daemon.h>
> > + #endif
> > + #include "lib/util/close_low_fd.h"
> > +@@ -69,9 +69,9 @@
> > + 	if (do_fork) {
> > + 		newpid =3D fork();
> > + 		if (newpid) {
> > +-#if HAVE_LIBSYSTEMD_DAEMON
> > ++#if HAVE_LIBSYSTEMD
> > + 			sd_notifyf(0, "READY=3D0\nSTATUS=3DStarting process...\nMAINPID=3D
%lu",
> > (unsigned long) newpid); +-#endif /* HAVE_LIBSYSTEMD_DAEMON */
> > ++#endif /* HAVE_LIBSYSTEMD */
> > + 			_exit(0);
> > + 		}
> > + 	}
> > +@@ -98,7 +98,7 @@
> > +
> > + _PUBLIC_ void exit_daemon(const char *msg, int error)
> > + {
> > +-#ifdef HAVE_LIBSYSTEMD_DAEMON
> > ++#ifdef HAVE_LIBSYSTEMD
> > + 	if (msg =3D=3D NULL) {
> > + 		msg =3D strerror(error);
> > + 	}
> > +@@ -117,7 +117,7 @@
> > + 	if (name =3D=3D NULL) {
> > + 		name =3D "Samba";
> > + 	}
> > +-#ifdef HAVE_LIBSYSTEMD_DAEMON
> > ++#ifdef HAVE_LIBSYSTEMD
> > + 	sd_notifyf(0, "READY=3D1\nSTATUS=3D%s: ready to serve connections...=
",
> > name); + #endif
> > + 	DEBUG(0, ("STATUS=3Ddaemon '%s' finished starting up and ready to se=
rve=20
"
> > +@@ -129,7 +129,7 @@
> > + 	if (name =3D=3D NULL) {
> > + 		name =3D "Samba";
> > + 	}
> > +-#ifdef HAVE_LIBSYSTEMD_DAEMON
> > ++#ifdef HAVE_LIBSYSTEMD
> > + 	sd_notifyf(0, "\nSTATUS=3D%s: %s", name, msg);
> > + #endif
> > + 	DEBUG(0, ("STATUS=3Ddaemon '%s' : %s", name, msg));
> > +diff -ur samba-4.4.2/lib/util/debug.c samba-4.4.2/lib/util/debug.c
> > +--- samba-4.4.2/lib/util/debug.c	2016-05-08 18:33:24.000000000 +0200
> > ++++ samba-4.4.2/lib/util/debug.c	2016-05-08 18:27:09.341481492 +0200
> > +@@ -102,7 +102,7 @@
> > + 	.fd =3D 2 /* stderr by default */
> > + };
> > +
> > +-#if defined(WITH_SYSLOG) || defined(HAVE_LIBSYSTEMD_JOURNAL)
> > ++#if defined(WITH_SYSLOG) || defined(HAVE_LIBSYSTEMD)
> > + static int debug_level_to_priority(int level)
> > + {
> > + 	/*
> > +@@ -179,7 +179,7 @@
> > + }
> > + #endif /* WITH_SYSLOG */
> > +
> > +-#ifdef HAVE_LIBSYSTEMD_JOURNAL
> > ++#ifdef HAVE_LIBSYSTEMD
> > + #include <systemd/sd-journal.h>
> > + static void debug_systemd_log(int msg_level,
> > + 			      const char *msg, const char *msg_no_nl)
> > +@@ -251,7 +251,7 @@
> > + 	},
> > + #endif
> > +
> > +-#ifdef HAVE_LIBSYSTEMD_JOURNAL
> > ++#ifdef HAVE_LIBSYSTEMD
> > + 	{
> > + 		.name =3D "systemd",
> > + 		.log =3D debug_systemd_log,
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
> > b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb index
> > 50c100e..b7ee730 100644
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
> > @@ -13,6 +13,7 @@ ${SAMBA_MIRROR}  =20
> > http://www.mirrorservice.org/sites/ftp.samba.org \n \>=20
> >  SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
> > =20
> >             file://00-fix-typos-in-man-pages.patch \
> >=20
> > +           file://10-use-only-libsystemd.patch \
> >=20
> >             file://16-do-not-check-xsltproc-manpages.patch \
> >             file://20-do-not-import-target-module-while-cross-compile.p=
atc
> >             h \
> >             file://21-add-config-option-without-valgrind.patch \



