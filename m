Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 96AD373CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 14:00:17 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1ZbUIr-0000G4-L8 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2015 07:00:17 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Sep 2015 07:00:16 -0700
Received: by burninator (Postfix, from userid 1000)	id CB3E65828AD; Mon, 14
	Sep 2015 09:59:09 -0400 (EDT)
Date: Mon, 14 Sep 2015 09:59:09 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150914135909.GA8691@mentor.com>
References: <1440060202-17953-1-git-send-email-kai.kang@windriver.com>
	<55ED028C.9000008@windriver.com> <55F63F27.9000109@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55F63F27.9000109@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] inetutils: add package config pam
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
X-List-Received-Date: Mon, 14 Sep 2015 14:00:19 -0000
X-Groupsio-MsgNum: 57340
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH] inetutils: add package config pam] On 15.09.14 (Mon 11:29=
) Kang Kai wrote:

> On 2015=E5=B9=B409=E6=9C=8807=E6=97=A5 11:20, Kang Kai wrote:
> >On 2015=E5=B9=B408=E6=9C=8820=E6=97=A5 16:43, kai.kang@windriver.com wro=
te:
> >>From: Kai Kang <kai.kang@windriver.com>
> >>
> >>Add package config pam for inetutils. And only check pam_appl.h when pam
> >>is enabled.
> >
> >Ping.
>=20
> Any comment on this patch? Thanks.

Other than it got missed from my processing queue because it didn't have
meta-networking in the subject?  Nope.  :-)

Someone else mentioned it to me on IRC on Friday so I've now found it
and it'll get merged today I expect unless something scary shakes out of
it.

-J.

>=20
> >
> >
> >>
> >>Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>---
> >>  ...ls-only-check-pam_appl.h-when-pam-enabled.patch | 40
> >>++++++++++++++++++++++
> >>  .../inetutils/inetutils_1.9.4.bb                   |  6 +++-
> >>  2 files changed, 45 insertions(+), 1 deletion(-)
> >>  create mode 100644 meta-networking/recipes-connectivity/inetutils/ine=
tutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
> >>
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/i=
netutils-only-check-pam_appl.h-when-pam-enabled.patch b/meta-networking/rec=
ipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-=
pam-enabled.patch
> >>
> >>new file mode 100644
> >>index 0000000..ff3abd8
> >>--- /dev/null
> >>+++ b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutil=
s-only-check-pam_appl.h-when-pam-enabled.patch
> >>@@ -0,0 +1,40 @@
> >>+Only check security/pam_appl.h which is provided by package libpam when
> >>pam is
> >>+enabled.
> >>+
> >>+Upstream-Status: Pending
> >>+
> >>+Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>+---
> >>+diff --git a/configure.ac b/configure.ac
> >>+index b35e672..e78a751 100644
> >>+--- a/configure.ac
> >>++++ b/configure.ac
> >>+@@ -195,6 +195,19 @@ fi
> >>+
> >>+ # See if we have libpam.a.  Investigate PAM versus Linux-PAM.
> >>+ if test "$with_pam" =3D yes ; then
> >>++  AC_CHECK_HEADERS([security/pam_appl.h], [], [], [
> >>++#include <sys/types.h>
> >>++#ifdef HAVE_NETINET_IN_SYSTM_H
> >>++# include <netinet/in_systm.h>
> >>++#endif
> >>++#include <netinet/in.h>
> >>++#ifdef HAVE_NETINET_IP_H
> >>++# include <netinet/ip.h>
> >>++#endif
> >>++#ifdef HAVE_SYS_PARAM_H
> >>++# include <sys/param.h>
> >>++#endif
> >>++])
> >>+   AC_CHECK_LIB(dl, dlopen, LIBDL=3D-ldl)
> >>+   AC_CHECK_LIB(pam, pam_authenticate, LIBPAM=3D-lpam)
> >>+   if test "$ac_cv_lib_pam_pam_authenticate" =3D yes ; then
> >>+@@ -587,7 +600,7 @@ AC_HEADER_DIRENT
> >>+ AC_CHECK_HEADERS([arpa/nameser.h errno.h fcntl.h features.h \
> >>+           glob.h memory.h netinet/ether.h netinet/in_systm.h \
> >>+           netinet/ip.h netinet/ip_icmp.h netinet/ip_var.h \
> >>+-          security/pam_appl.h shadow.h \
> >>++          shadow.h \
> >>+           stdarg.h stdlib.h string.h stropts.h sys/tty.h \
> >>+           sys/utsname.h sys/ptyvar.h sys/msgbuf.h sys/filio.h \
> >>+           sys/ioctl_compat.h sys/cdefs.h sys/stream.h sys/mkdev.h \
> >>diff --git
> >>a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> >>b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> >>index db07cd6..adfc940 100644
> >>--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> >>+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> >>@@ -19,6 +19,7 @@ SRC_URI =3D
> >>"${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
> >>             file://telnet.xinetd.inetutils \
> >>             file://tftpd.xinetd.inetutils \
> >>             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
> >>+ file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
> >>  "
> >>    SRC_URI[md5sum] =3D "04852c26c47cc8c6b825f2b74f191f52"
> >>@@ -29,9 +30,12 @@ inherit autotools gettext update-alternatives texinfo
> >>  SRC_URI +=3D "${@base_contains('DISTRO_FEATURES', 'ipv6', '',
> >>'file://fix-disable-ipv6.patch', d)}"
> >>  noipv6=3D"${@base_contains('DISTRO_FEATURES', 'ipv6', '',
> >>'--disable-ipv6 gl_cv_socket_ipv6=3Dno', d)}"
> >>  -PACKAGECONFIG ??=3D "ftp uucpd"
> >>+PACKAGECONFIG ??=3D "ftp uucpd \
> >>+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> >>'pam', '', d)} \
> >>+                  "
> >>  PACKAGECONFIG[ftp] =3D "--enable-ftp,--disable-ftp,readline"
> >>  PACKAGECONFIG[uucpd] =3D "--enable-uucpd,--disable-uucpd,readline"
> >>+PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
> >>    EXTRA_OECONF =3D "--with-ncurses-include-dir=3D${STAGING_INCDIR} \
> >>          ${noipv6} \
> >
> >
>=20
>=20
--=20
-Joe MacDonald.
:wq

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV9tKpAAoJEEn8ffcsOfaWdAkH/RZnWmA37H3gXdyaEV5R/MSw
F8c6nwLjSQ+o7usvNbVaLX4K/9ONWkbVcaWmj6eF2sPEETZVr1r0QbXeHORXVgsB
hsCdTwaRVyHRqkxCDZAlYLc6Sr3nXfD35bTcY9Ph+77+yWr2KkbgBx0p2AMrvAYy
0JEhYiyVkLiGwJ6dTTKshCoRazvXl2hnAr/0eUrF50hpCURYVXmLG4hQgqW/cnBi
ekdwJT7MAGTzqvz8luE3FWOKFXneS+buJ+4apvq8Mbh3nDAMlkDWjVpIwFCf3Ldy
x6uaAiDYecHBa2lw7j1forOHvRnNCLOjhyW/RuKLh6ucxXILWnVdQ90xvO81pqk=
=99p8
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
