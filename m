Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyNz-0007CE-2w
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:35:44 +0100
Received: by mail-da0-f53.google.com with SMTP id n34so1052118dal.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=09hLWkWlxYVY9pRN+RVg2Z99sU809OjWO9KFaAWB81A=;
	b=yprlIyBwYnyhVla9TbZH2sbgkdCFaI4PVJ/5LVyDlvenWJkYWTkaNukMgF3jUYtly5
	Hyd2w71lf3mvGc/qKVIP1v+kE3AmuHQ4wPy6sP927KhPekgtmDjIc3Uvh7h8mik1kH2f
	tBKk830W5gZMH+p3+YMybNVUSf9X71OtwgLLRJbr3iq/x2KckVitEFXLdxih8mYhgIK2
	CxslUay/Til02QOfpDotBRjPg2R6HC8MoO4AUET4KZQghdxGmYV5LOFYpDikEJHB3/Na
	J9M8x1tu0pxvdiqRt4G3G6GY6KIZyPSi5F/v1J9fK364pgsOnNrxOuVpZLbIEYIQUiHr
	4YkA==
X-Received: by 10.66.148.65 with SMTP id tq1mr2258776pab.19.1363943928819;
	Fri, 22 Mar 2013 02:18:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ab1sm1699635pbd.37.2013.03.22.02.18.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:18:47 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:18:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322091846.GF3219@jama>
References: <1363713111-21464-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1363713111-21464-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] polkit: add (taken from oe-core)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 09:35:49 -0000
X-Groupsio-MsgNum: 43647
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Content-Disposition: inline

--K/NRh952CO+2tg14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2013 at 05:11:51PM +0000, Ross Burton wrote:
> PolKit will be removed from oe-core as it isn't massively applicable in
> embedded, isn't used by anything by default anymore, and future upgrades =
require
> the SpiderMonkey JavaScript runtime.

Applied, thanks!

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...ession-Set-error-if-we-cannot-find-a-sess.patch |   70 ++++++++++++++=
++++++
>  ...ession-Actually-return-TRUE-if-a-session-.patch |   46 +++++++++++++
>  .../polkit-0.104/obsolete_automake_macros.patch    |   23 +++++++
>  .../polkit/polkit-0.104/polkit-1_pam.patch         |   23 +++++++
>  .../recipes-extended/polkit/polkit-gnome_0.102.bb  |   26 ++++++++
>  meta-oe/recipes-extended/polkit/polkit_0.104.bb    |   44 ++++++++++++
>  .../recipes-extended/polkit/polkit_0.104.bbappend  |    1 -
>  7 files changed, 232 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0001-Pol=
kitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0002-Pol=
kitUnixSession-Actually-return-TRUE-if-a-session-.patch
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/obsolete=
_automake_macros.patch
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1=
_pam.patch
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bb
>  delete mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>=20
> diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnix=
Session-Set-error-if-we-cannot-find-a-sess.patch b/meta-oe/recipes-extended=
/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-s=
ess.patch
> new file mode 100644
> index 0000000..c021bfb
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession=
-Set-error-if-we-cannot-find-a-sess.patch
> @@ -0,0 +1,70 @@
> +From c46d2d13eac240d2a609b2dd8fc617ea18a78bfa Mon Sep 17 00:00:00 2001
> +From: David Zeuthen <davidz@redhat.com>
> +Date: Mon, 6 Feb 2012 11:24:53 -0500
> +Subject: [PATCH 1/2] PolkitUnixSession: Set error if we cannot find a se=
ssion for the given pid
> +
> +Also, don't treat the integer returned by sd_pid_get_session() as a
> +boolean because that's just confusing. Also, don't confuse memory
> +supposed to be freed by g_free() and free(3) with each other. See
> +
> + https://bugzilla.redhat.com/show_bug.cgi?id=3D787222
> +
> +for more details.
> +
> +Signed-off-by: David Zeuthen <davidz@redhat.com>
> +---
> +
> +Upstream-Status: Accepted
> +
> + src/polkit/polkitunixsession-systemd.c |   21 ++++++++++++++++-----
> + 1 files changed, 16 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/polkit/polkitunixsession-systemd.c b/src/polkit/polkitu=
nixsession-systemd.c
> +index e7e913f..94a7ee4 100644
> +--- a/src/polkit/polkitunixsession-systemd.c
> ++++ b/src/polkit/polkitunixsession-systemd.c
> +@@ -23,6 +23,7 @@
> + #  include "config.h"
> + #endif
> +=20
> ++#include <stdlib.h>
> + #include <string.h>
> + #include "polkitunixsession.h"
> + #include "polkitsubject.h"
> +@@ -450,9 +451,8 @@ polkit_unix_session_initable_init (GInitable     *in=
itable,
> +                                    GError       **error)
> + {
> +   PolkitUnixSession *session =3D POLKIT_UNIX_SESSION (initable);
> +-  gboolean ret;
> +-
> +-  ret =3D FALSE;
> ++  gboolean ret =3D FALSE;
> ++  char *s;
> +=20
> +   if (session->session_id !=3D NULL)
> +     {
> +@@ -461,8 +461,19 @@ polkit_unix_session_initable_init (GInitable     *i=
nitable,
> +       goto out;
> +     }
> +=20
> +-  if (!sd_pid_get_session (session->pid, &session->session_id))
> +-    ret =3D TRUE;
> ++  if (sd_pid_get_session (session->pid, &s) =3D=3D 0)
> ++    {
> ++      session->session_id =3D g_strdup (s);
> ++      free (s);
> ++      ret =3D TRUE;
> ++      goto out;
> ++    }
> ++
> ++  g_set_error (error,
> ++               POLKIT_ERROR,
> ++               POLKIT_ERROR_FAILED,
> ++               "No session for pid %d",
> ++               (gint) session->pid);
> +=20
> + out:
> +   return ret;
> +--=20
> +1.7.2.5
> +
> diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnix=
Session-Actually-return-TRUE-if-a-session-.patch b/meta-oe/recipes-extended=
/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-sessi=
on-.patch
> new file mode 100644
> index 0000000..49f8ce2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession=
-Actually-return-TRUE-if-a-session-.patch
> @@ -0,0 +1,46 @@
> +From 8fb8b406bab50c5ef8c5d4f743e3f13924bd5f73 Mon Sep 17 00:00:00 2001
> +From: David Zeuthen <davidz@redhat.com>
> +Date: Mon, 6 Feb 2012 11:26:06 -0500
> +Subject: [PATCH 2/2] PolkitUnixSession: Actually return TRUE if a sessio=
n exists
> +
> +Also, don't treat the integer returned by sd_session_get_uid() as a
> +boolean because that's just confusing.
> +
> +Signed-off-by: David Zeuthen <davidz@redhat.com>
> +---
> +
> +Upstream-Status: Accepted
> +
> + src/polkit/polkitunixsession-systemd.c |   12 +++++-------
> + 1 files changed, 5 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/polkit/polkitunixsession-systemd.c b/src/polkit/polkitu=
nixsession-systemd.c
> +index 94a7ee4..8a8bf65 100644
> +--- a/src/polkit/polkitunixsession-systemd.c
> ++++ b/src/polkit/polkitunixsession-systemd.c
> +@@ -361,17 +361,15 @@ polkit_unix_session_to_string (PolkitSubject *subj=
ect)
> +=20
> + static gboolean
> + polkit_unix_session_exists_sync (PolkitSubject   *subject,
> +-                                    GCancellable    *cancellable,
> +-                                    GError         **error)
> ++                                 GCancellable    *cancellable,
> ++                                 GError         **error)
> + {
> +   PolkitUnixSession *session =3D POLKIT_UNIX_SESSION (subject);
> +-  gboolean ret;
> ++  gboolean ret =3D FALSE;
> +   uid_t uid;
> +=20
> +-  ret =3D FALSE;
> +-
> +-  if (!sd_session_get_uid (session->session_id, &uid))
> +-    ret =3D FALSE;
> ++  if (sd_session_get_uid (session->session_id, &uid) =3D=3D 0)
> ++    ret =3D TRUE;
> +=20
> +   return ret;
> + }
> +--=20
> +1.7.2.5
> +
> diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automa=
ke_macros.patch b/meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_aut=
omake_macros.patch
> new file mode 100644
> index 0000000..5a6046c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macr=
os.patch
> @@ -0,0 +1,23 @@
> +Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=
=3D59091]
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd polkit-0.104/configure.ac polkit-0.104/configure.ac
> +--- polkit-0.104/configure.ac	2012-01-03 18:25:49.000000000 +0200
> ++++ polkit-0.104/configure.ac	2013-01-07 03:13:31.862125625 +0200
> +@@ -3,7 +3,7 @@
> + AC_PREREQ(2.59c)
> + AC_INIT(polkit, 0.104, http://lists.freedesktop.org/mailman/listinfo/po=
lkit-devel)
> + AM_INIT_AUTOMAKE(polkit, 0.104)
> +-AM_CONFIG_HEADER(config.h)
> ++AC_CONFIG_HEADERS(config.h)
> + AM_MAINTAINER_MODE
> +
> + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> +@@ -24,7 +24,6 @@
> +
> + AC_ISC_POSIX
> + AC_PROG_CC
> +-AM_PROG_CC_STDC
> + AC_HEADER_STDC
> + AM_PROG_LIBTOOL
> + AC_PROG_MAKE_SET
> diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1_pam.pa=
tch b/meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch
> new file mode 100644
> index 0000000..74647ef
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch
> @@ -0,0 +1,23 @@
> +polkit: No system-auth in OE-Core, we can use common-* in place of it.
> +
> +Upstream-Status:Inappropriate [configuration]
> +
> +Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> +
> +--- a/configure.ac	2011-03-04 02:26:20.000000000 +0800
> ++++ b/configure.ac.new	2011-07-18 10:14:12.516818852 +0800
> +@@ -350,10 +350,10 @@
> +     PAM_FILE_INCLUDE_PASSWORD=3Dsystem
> +     PAM_FILE_INCLUDE_SESSION=3Dsystem
> + else
> +-   PAM_FILE_INCLUDE_AUTH=3Dsystem-auth
> +-   PAM_FILE_INCLUDE_ACCOUNT=3Dsystem-auth
> +-   PAM_FILE_INCLUDE_PASSWORD=3Dsystem-auth
> +-   PAM_FILE_INCLUDE_SESSION=3Dsystem-auth
> ++   PAM_FILE_INCLUDE_AUTH=3Dcommon-auth
> ++   PAM_FILE_INCLUDE_ACCOUNT=3Dcommon-account
> ++   PAM_FILE_INCLUDE_PASSWORD=3Dcommon-password
> ++   PAM_FILE_INCLUDE_SESSION=3Dcommon-session
> + fi
> +=20
> + AC_SUBST(PAM_FILE_INCLUDE_AUTH)
> diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta=
-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
> new file mode 100644
> index 0000000..7e9fc2b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "GNOME Authentication Agent for PolicyKit"
> +DESCRIPTION =3D "PolicyKit-gnome provides an Authentication Agent for Po=
licyKit that integrates well with the GNOME desktop environment"
> +HOMEPAGE =3D "http://www.packagekit.org/"
> +BUGTRACKER =3D "http://bugzilla.gnome.org/"
> +DEPENDS =3D "polkit dbus-glib gconf gtk+"
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74579fab173e4c5e12aac0cd83ee9=
8ec \
> +                    file://src/main.c;beginline=3D1;endline=3D20;md5=3Da=
ba145d1802f2329ba561e3e48ecb795"
> +
> +SRC_URI =3D "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.=
bz2 \
> +          "
> +
> +PR =3D "r2"
> +
> +EXTRA_OECONF =3D " --disable-scrollkeeper \
> +                 --disable-man-pages \
> +                 --disable-examples \
> +                 --disable-introspection "
> +
> +inherit autotools gtk-doc pkgconfig
> +
> +FILES_${PN} +=3D " ${datadir}/dbus-1 \
> +                 ${datadir}/PolicyKit \
> +               "
> +SRC_URI[md5sum] =3D "f6b485ffd7bd605af815fd2747180481"
> +SRC_URI[sha256sum] =3D "81caa6972e651e90ef4ac31d7ed41bc79543d46b850dbd5b=
14b40f8ef7107d11"
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bb b/meta-oe/re=
cipes-extended/polkit/polkit_0.104.bb
> new file mode 100644
> index 0000000..ab2547b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bb
> @@ -0,0 +1,44 @@
> +SUMMARY =3D "PolicyKit Authorization Framework"
> +DESCRIPTION =3D "The polkit package is an application-level toolkit for =
defining and handling the policy that allows unprivileged processes to spea=
k to privileged processes."
> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/polkit"
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb \
> +                    file://src/polkit/polkit.h;beginline=3D1;endline=3D2=
0;md5=3D0a8630b0133176d0504c87a0ded39db4"
> +
> +DEPENDS =3D "expat glib-2.0 intltool-native gobject-introspection-stub"
> +
> +PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '',=
 d)} \
> +                 ${@base_contains('DISTRO_FEATURES','systemd','systemd',=
'consolekit',d)}"
> +
> +PACKAGECONFIG[pam] =3D "--with-authfw=3Dpam,--with-authfw=3Dshadow,libpa=
m,libpam"
> +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
> +# there is no --enable/--disable option for consolekit and it's not pick=
ed by shlibs, so add it to RDEPENDS
> +PACKAGECONFIG[consolekit] =3D ",,,consolekit"
> +
> +PR =3D "r9"
> +
> +PAM_SRC_URI =3D "file://polkit-1_pam.patch"
> +SRC_URI =3D "http://www.freedesktop.org/software/polkit/releases/polkit-=
${PV}.tar.gz \
> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', =
'', d)} \
> +           file://0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-s=
ess.patch \
> +           file://0002-PolkitUnixSession-Actually-return-TRUE-if-a-sessi=
on-.patch \
> +           file://obsolete_automake_macros.patch \
> +          "
> +
> +SRC_URI[md5sum] =3D "e380b4c6fb1e7bccf854e92edc0a8ce1"
> +SRC_URI[sha256sum] =3D "6b0a13d8381e4a7b7e37c18a54595191b50757e0fcd186cd=
9918e9ad0f18c7f9"
> +
> +EXTRA_OECONF =3D "--with-os-type=3Dmoblin --disable-man-pages --disable-=
introspection"
> +
> +inherit autotools gtk-doc pkgconfig
> +
> +do_install_append() {
> +	rm -f ${D}${libdir}/${BPN}-1/extensions/*.a
> +}
> +
> +FILES_${PN} +=3D "${libdir}/${BPN}-1/extensions/*.so \
> +                ${datadir}/${BPN}-1/actions/* \
> +                ${datadir}/dbus-1/system-services/*"
> +FILES_${PN}-dbg +=3D "${libdir}/${BPN}-1/extensions/.debug/*.so"
> +FILES_${PN}-dev +=3D "${libdir}/${BPN}-1/extensions/*.la "
> +
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta=
-oe/recipes-extended/polkit/polkit_0.104.bbappend
> deleted file mode 100644
> index ceb2b6b..0000000
> --- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -PRINC :=3D "${@int(PRINC) + 5}"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K/NRh952CO+2tg14
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIfYACgkQN1Ujt2V2gBw+HwCfaCEKQFs6+1qZCGXvhDnUpP34
P6kAmwS8EtMRtvajV6yxFbzop9U0VYl5
=qQqe
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--
