Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TwBPq-0003du-J8
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 13:51:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0ICa1fA024703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 04:36:01 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 18 Jan 2013 04:36:00 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 72BED7FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 07:34:13 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id DFB31222A4; Fri,
	18 Jan 2013 07:35:59 -0500 (EST)
Date: Fri, 18 Jan 2013 07:35:59 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130118123559.GA4551@windriver.com>
References: <1358501958-3585-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1358501958-3585-1-git-send-email-raj.khem@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] netcat_0.7.1.bb: Fix build with new versions of autotools
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
X-List-Received-Date: Fri, 18 Jan 2013 12:51:38 -0000
X-Groupsio-MsgNum: 42737
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] netcat_0.7.1.bb: Fix build with new versions=
 of autotools] On 13.01.18 (Fri 01:39) Khem Raj wrote:

> autoconf and automake got updates which need these changes
> see patch header for details
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Merged, thanks.
-J.

> ---
>  .../netcat/netcat/obsolete_autoconf_macros.patch   |   32 ++++++++++++++=
++++++
>  .../recipes-support/netcat/netcat_0.7.1.bb         |    6 ++--
>  2 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-support/netcat/netcat/obsolet=
e_autoconf_macros.patch
>=20
> diff --git a/meta-networking/recipes-support/netcat/netcat/obsolete_autoc=
onf_macros.patch b/meta-networking/recipes-support/netcat/netcat/obsolete_a=
utoconf_macros.patch
> new file mode 100644
> index 0000000..9b0ed58
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat/obsolete_autoconf_mac=
ros.patch
> @@ -0,0 +1,32 @@
> +Replace obsoleted AM_CONFIG_HEADER flagged by autoconf 2.69
> +locale.h check was picked from old gettext macros but with new aclocal
> +it picks the right 0.18 gettext.m4 and does not get the check
> +therefore we explicitly add it to configure.ac
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: netcat-0.7.1/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- netcat-0.7.1.orig/configure.ac	2013-01-18 01:30:01.928069739 -0800
> ++++ netcat-0.7.1/configure.ac	2013-01-18 01:32:50.568073009 -0800
> +@@ -26,8 +26,7 @@
> + AC_PREREQ(2.53)
> +=20
> + dnl without this order in this file, automake will be confused!
> +-AM_CONFIG_HEADER(config.h)
> +-
> ++AC_CONFIG_HEADERS(config.h)
> + dnl check for programs.  first the c compiler.
> + AC_PROG_CC
> + AC_PROG_CPP
> +@@ -56,7 +55,7 @@
> + AC_LBL_LIBRARY_NET
> +=20
> + dnl Fortunately we have Solaris...
> +-AC_CHECK_HEADERS(sys/sockio.h)
> ++AC_CHECK_HEADERS(sys/sockio.h locale.h)
> +=20
> + AC_CHECK_FUNCS(srandom random)
> + if test $ac_cv_func_srandom =3D no; then
> diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/met=
a-networking/recipes-support/netcat/netcat_0.7.1.bb
> index c4f1f33..8dacdec 100644
> --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> @@ -4,9 +4,11 @@ HOMEPAGE =3D "http://netcat.sourceforge.net"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
> +           file://obsolete_autoconf_macros.patch \
> +          "
> =20
>  SRC_URI[md5sum] =3D "0a29eff1736ddb5effd0b1ec1f6fe0ef"
>  SRC_URI[sha256sum] =3D "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd0744890=
03f3df09676332bb"
--=20
-Joe MacDonald.
:wq

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlD5QawACgkQPN8S4W6ZZndtmwCfa5tjbsTgjWmeIpnFJxfUTuXb
NWoAn2PukXOgi6IaPIm6BhzI+aGZUw4x
=0qTO
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
