Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81F296B220
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 20:01:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6HK1lJu008871
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 13:01:47 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 17 Jul 2013 13:01:45 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id EC63B7FE7;
	Wed, 17 Jul 2013 16:01:44 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 99091410F9; Wed,
	17 Jul 2013 15:55:44 -0400 (EDT)
Date: Wed, 17 Jul 2013 15:55:44 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130717195544.GG31259@windriver.com>
References: <1373951266-21073-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1373951266-21073-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] netcat: intergrat two fixes
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
X-List-Received-Date: Wed, 17 Jul 2013 20:01:47 -0000
X-Groupsio-MsgNum: 45398
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8/pVXlBMPtxfSuJG"
Content-Disposition: inline

--8/pVXlBMPtxfSuJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

And merged.  Thanks, Roy.

-J.

[[PATCH] netcat: intergrat two fixes] On 13.07.16 (Tue 13:07) rongqing.li@w=
indriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> 1. fix a running issue on PPC, since 'char' type has different range of v=
alues
> on x86 and on PPC.
> 2. fix a building issue.
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  .../netcat/make-netcat_flag_count_work.patch       |   34 ++++++++++++++=
++++++
>  .../netcat/netcat/netcat-locale_h.patch            |   25 ++++++++++++++
>  .../recipes-support/netcat/netcat_0.7.1.bb         |    2 ++
>  3 files changed, 61 insertions(+)
>  create mode 100644 meta-networking/recipes-support/netcat/netcat/make-ne=
tcat_flag_count_work.patch
>  create mode 100644 meta-networking/recipes-support/netcat/netcat/netcat-=
locale_h.patch
>=20
> diff --git a/meta-networking/recipes-support/netcat/netcat/make-netcat_fl=
ag_count_work.patch b/meta-networking/recipes-support/netcat/netcat/make-ne=
tcat_flag_count_work.patch
> new file mode 100644
> index 0000000..dd1938a
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat/make-netcat_flag_coun=
t_work.patch
> @@ -0,0 +1,34 @@
> +Make netcat_flag_count() return positive value
> +
> +C language has 3 distinct char types:
> +         char
> +         unsigned char
> +         signed char
> +A char has the same range of values as signed char on X86,
> +but same as unsigned char on PPC which made netcat_flag_count
> +return a negative value, now we force variable c as signed char
> +to make netcat_flag_count return positive value.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + src/flagset.c |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/src/flagset.c b/src/flagset.c
> +index 442b634..54ac898 100644
> +--- a/src/flagset.c
> ++++ b/src/flagset.c
> +@@ -134,7 +134,7 @@ unsigned short netcat_flag_next(unsigned short port)
> +=20
> + int netcat_flag_count(void)
> + {
> +-  register char c;
> ++  register signed char c;
> +   register int i;
> +   int ret =3D 0;
> +=20
> +--=20
> +1.7.5.4
> +
> diff --git a/meta-networking/recipes-support/netcat/netcat/netcat-locale_=
h.patch b/meta-networking/recipes-support/netcat/netcat/netcat-locale_h.pat=
ch
> new file mode 100644
> index 0000000..5cbcb08
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat/netcat-locale_h.patch
> @@ -0,0 +1,25 @@
> +Apparently somewhere along the line HAVE_LOCALE_H was changed to
> +HAVE_LC_MESSAGES.  Adjust netcat to match.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +Index: netcat-0.7.1/src/intl.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- netcat-0.7.1.orig/src/intl.h
> ++++ netcat-0.7.1/src/intl.h
> +@@ -25,11 +25,11 @@
> + #ifdef ENABLE_NLS
> + #include <libintl.h>
> +=20
> +-#ifdef HAVE_LOCALE_H
> ++#if defined(HAVE_LC_MESSAGES) || defined(HAVE_LOCALE_H)
> + #include <locale.h>
> + #else
> + #error You must have locale.h in your system
> +-#endif	/* HAVE_LOCALE_H */
> ++#endif	/* HAVE_LC_MESSAGES || HAVE_LOCALE_H */
> +=20
> + /* Our dear (and very common) gettext macros */
> + #define _(String) gettext(String)
> diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/met=
a-networking/recipes-support/netcat/netcat_0.7.1.bb
> index a4805a4..0bb5c87 100644
> --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> @@ -8,6 +8,8 @@ PR =3D "r3"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
>             file://obsolete_autoconf_macros.patch \
> +           file://netcat-locale_h.patch \
> +           file://make-netcat_flag_count_work.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "0a29eff1736ddb5effd0b1ec1f6fe0ef"
--=20
-Joe MacDonald.
:wq

--8/pVXlBMPtxfSuJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHm9sAACgkQPN8S4W6ZZnfP2QCcDGd32PA5JcFE/YevFyJKTIjs
N/YAniIjFolxn0YIgbhZectQ0d75XwEf
=9Bg6
-----END PGP SIGNATURE-----

--8/pVXlBMPtxfSuJG--
