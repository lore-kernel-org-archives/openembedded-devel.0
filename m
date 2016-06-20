Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DD8B560667
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 14:08:46 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1bEzsc-0001su-Lp from Joe_MacDonald@mentor.com ;
	Mon, 20 Jun 2016 07:08:46 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Jun 2016 07:08:46 -0700
Received: by burninator (Postfix, from userid 1000)	id 6AC87580D69; Mon, 20
	Jun 2016 10:08:45 -0400 (EDT)
Date: Mon, 20 Jun 2016 10:08:45 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Gyorgy Szombathelyi <gyurco@freemail.hu>
Message-ID: <20160620140845.GA4931@mentor.com>
References: <1466276817-4209-1-git-send-email-gyurco@freemail.hu>
MIME-Version: 1.0
In-Reply-To: <1466276817-4209-1-git-send-email-gyurco@freemail.hu>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Mon, 20 Jun 2016 14:08:47 -0000
X-Groupsio-MsgNum: 61894
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy,

[[oe] [meta-networking][PATCH] Samba: use only libsystemd] On 16.06.18 (Sat=
 21:06) Gyorgy Szombathelyi wrote:

> This patch was disappeared while moved to 4.4.2

I can't find this patch in the git history, but I'm happy to merge it if
you can provide a bit more detail on it.  Is it always valid to assume
HAVE_LIBSYSTEMD will always mean HAVE_LIBSYSTEMD_JOURNAL and
HAVE_LIBSYSTEMD_DAEMON?  Also, can you provide an upstream-status on
this?

Thanks.
-J.

>=20
> Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
> ---
>  .../samba/samba-4.4.2/10-use-only-libsystemd.patch | 81 ++++++++++++++++=
++++++
>  .../recipes-connectivity/samba/samba_4.4.2.bb      |  1 +
>  2 files changed, 82 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.=
2/10-use-only-libsystemd.patch
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-us=
e-only-libsystemd.patch b/meta-networking/recipes-connectivity/samba/samba-=
4.4.2/10-use-only-libsystemd.patch
> new file mode 100644
> index 0000000..81621ff
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-=
libsystemd.patch
> @@ -0,0 +1,81 @@
> +diff -ur samba-4.4.2/lib/util/become_daemon.c samba-4.4.2/lib/util/becom=
e_daemon.c
> +--- samba-4.4.2/lib/util/become_daemon.c	2016-05-08 18:33:24.000000000 +=
0200
> ++++ samba-4.4.2/lib/util/become_daemon.c	2016-05-08 18:26:50.275177918 +=
0200
> +@@ -24,7 +24,7 @@
> + #include "includes.h"
> + #include "system/filesys.h"
> + #include "system/locale.h"
> +-#if HAVE_LIBSYSTEMD_DAEMON
> ++#if HAVE_LIBSYSTEMD
> + #include <systemd/sd-daemon.h>
> + #endif
> + #include "lib/util/close_low_fd.h"
> +@@ -69,9 +69,9 @@
> + 	if (do_fork) {
> + 		newpid =3D fork();
> + 		if (newpid) {
> +-#if HAVE_LIBSYSTEMD_DAEMON
> ++#if HAVE_LIBSYSTEMD
> + 			sd_notifyf(0, "READY=3D0\nSTATUS=3DStarting process...\nMAINPID=3D%l=
u", (unsigned long) newpid);
> +-#endif /* HAVE_LIBSYSTEMD_DAEMON */
> ++#endif /* HAVE_LIBSYSTEMD */
> + 			_exit(0);
> + 		}
> + 	}
> +@@ -98,7 +98,7 @@
> +=20
> + _PUBLIC_ void exit_daemon(const char *msg, int error)
> + {
> +-#ifdef HAVE_LIBSYSTEMD_DAEMON
> ++#ifdef HAVE_LIBSYSTEMD
> + 	if (msg =3D=3D NULL) {
> + 		msg =3D strerror(error);
> + 	}
> +@@ -117,7 +117,7 @@
> + 	if (name =3D=3D NULL) {
> + 		name =3D "Samba";
> + 	}
> +-#ifdef HAVE_LIBSYSTEMD_DAEMON
> ++#ifdef HAVE_LIBSYSTEMD
> + 	sd_notifyf(0, "READY=3D1\nSTATUS=3D%s: ready to serve connections...",=
 name);
> + #endif
> + 	DEBUG(0, ("STATUS=3Ddaemon '%s' finished starting up and ready to serv=
e "
> +@@ -129,7 +129,7 @@
> + 	if (name =3D=3D NULL) {
> + 		name =3D "Samba";
> + 	}
> +-#ifdef HAVE_LIBSYSTEMD_DAEMON
> ++#ifdef HAVE_LIBSYSTEMD
> + 	sd_notifyf(0, "\nSTATUS=3D%s: %s", name, msg);
> + #endif
> + 	DEBUG(0, ("STATUS=3Ddaemon '%s' : %s", name, msg));
> +diff -ur samba-4.4.2/lib/util/debug.c samba-4.4.2/lib/util/debug.c
> +--- samba-4.4.2/lib/util/debug.c	2016-05-08 18:33:24.000000000 +0200
> ++++ samba-4.4.2/lib/util/debug.c	2016-05-08 18:27:09.341481492 +0200
> +@@ -102,7 +102,7 @@
> + 	.fd =3D 2 /* stderr by default */
> + };
> +=20
> +-#if defined(WITH_SYSLOG) || defined(HAVE_LIBSYSTEMD_JOURNAL)
> ++#if defined(WITH_SYSLOG) || defined(HAVE_LIBSYSTEMD)
> + static int debug_level_to_priority(int level)
> + {
> + 	/*
> +@@ -179,7 +179,7 @@
> + }
> + #endif /* WITH_SYSLOG */
> +=20
> +-#ifdef HAVE_LIBSYSTEMD_JOURNAL
> ++#ifdef HAVE_LIBSYSTEMD
> + #include <systemd/sd-journal.h>
> + static void debug_systemd_log(int msg_level,
> + 			      const char *msg, const char *msg_no_nl)
> +@@ -251,7 +251,7 @@
> + 	},
> + #endif
> +=20
> +-#ifdef HAVE_LIBSYSTEMD_JOURNAL
> ++#ifdef HAVE_LIBSYSTEMD
> + 	{
> + 		.name =3D "systemd",
> + 		.log =3D debug_systemd_log,
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
> index 50c100e..b7ee730 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
> @@ -13,6 +13,7 @@ ${SAMBA_MIRROR}    http://www.mirrorservice.org/sites/f=
tp.samba.org \n \
> =20
>  SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>             file://00-fix-typos-in-man-pages.patch \
> +           file://10-use-only-libsystemd.patch \
>             file://16-do-not-check-xsltproc-manpages.patch \
>             file://20-do-not-import-target-module-while-cross-compile.pat=
ch \
>             file://21-add-config-option-without-valgrind.patch \
> --=20
> 2.7.4
>=20
--=20
-Joe MacDonald.
:wq

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXZ/jpAAoJEEn8ffcsOfaW6JUH/2MAttH0lFFleF3i+eF5lOM4
NnZEu0zcuN+3SAwbp34hBy88Ssop8wFC3Cwe6ffSMq7lfcq+AiuBzh2imFheZ47+
kfK70wi0EjWXhoN6VYOUcDul8PJgANMti8xRAT7eN6wTWw7fqUyDvM8htJ6o05HO
CP3f3gnZ1XisIzoFACWD6kDtqTAjnI059OUzIwKjcLqe8yEvDKql0eNJB+BoWrP0
k9flGOoZ6YrIygPbsM8dW0GFtCsY7Tcr6fO5s/ycsLRftCcpHBc1kHaX+Au1n412
aWVQV+KgZ+ZI/3yrnlOE+TgAFMPOVd4NNCVQUSjwHZIodPsv86EAn5FhFzzNrJw=
=BWw6
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
