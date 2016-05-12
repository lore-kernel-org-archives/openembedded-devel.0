Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 02E9F6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 14:11:04 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1b0rKT-0005W1-72 from Joe_MacDonald@mentor.com ;
	Thu, 12 May 2016 07:11:05 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 May 2016 07:11:04 -0700
Received: by burninator (Postfix, from userid 1000)	id E81065810B3; Thu, 12
	May 2016 10:11:03 -0400 (EDT)
Date: Thu, 12 May 2016 10:11:03 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20160512141103.GA23790@mentor.com>
References: <1462525337-13509-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1462525337-13509-1-git-send-email-Qi.Chen@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] openconnect: add dependency to fix Makefile.am
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
X-List-Received-Date: Thu, 12 May 2016 14:11:05 -0000
X-Groupsio-MsgNum: 61480
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] openconnect: add dependency to fix Makefile.=
am] On 16.05.06 (Fri 17:02) Chen Qi wrote:

> main.c needs version.c which is generated at build time.
> Add this dependency to avoid the following error.
>=20
>   ../git/main.c:78:21: fatal error: version.c: No such file or directory
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../0001-Makefile.am-add-missing-dependency.patch  | 28 ++++++++++++++++=
++++++
>  .../openconnect/openconnect_git.bb                 |  3 ++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-connectivity/openconnect/file=
s/0001-Makefile.am-add-missing-dependency.patch
>=20
> diff --git a/meta-networking/recipes-connectivity/openconnect/files/0001-=
Makefile.am-add-missing-dependency.patch b/meta-networking/recipes-connecti=
vity/openconnect/files/0001-Makefile.am-add-missing-dependency.patch
> new file mode 100644
> index 0000000..c465bf1
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openconnect/files/0001-Makefil=
e.am-add-missing-dependency.patch
> @@ -0,0 +1,28 @@
> +Upstream-Status: Pending

I think you should run this by upstream first, actually.

> +
> +Subject: Makefile.am: add missing dependency
> +
> +Add missing dependency to avoid the following error.
> +
> +  ../git/main.c:78:21: fatal error: version.c: No such file or directory
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index d823e01..ea48ec1 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -112,6 +112,7 @@ EXTRA_DIST +=3D $(shell cd "$(top_srcdir)" && \
> +=20
> + DISTCLEANFILES =3D $(pkgconfig_DATA)
> +=20
> ++main.c: version.c

main.c isn't a generated file so this dependency seems meaningless.  The
target we want to build is main.o and the existing target clearly says
we need version.c to exist before main.o can be built.  I don't know how
you'd get a scenario where make thinks all of the dependencies for
main.o have been satisfied but version.c doesn't exist.

-J.

> + main.o: version.c
> + version.c: $(library_srcs) $(lib_openssl_srcs) $(lib_gnutls_srcs) \
> + 	   $(openconnect_SOURCES) Makefile.am configure.ac \
> +--=20
> +2.8.1
> +
> diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect=
_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.=
bb
> index 6d3c252..d8fe439 100644
> --- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> @@ -8,7 +8,8 @@ RDEPENDS_${PN} =3D "vpnc"
>  PV =3D "7.06"
> =20
>  SRCREV =3D "35542d52202672b8c12ecc63867432128244013a"
> -SRC_URI =3D "git://git.infradead.org/users/dwmw2/openconnect.git"
> +SRC_URI =3D "git://git.infradead.org/users/dwmw2/openconnect.git \
> +           file://0001-Makefile.am-add-missing-dependency.patch"
> =20
>  S =3D "${WORKDIR}/git"
> =20
--=20
-Joe MacDonald.
:wq

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXNI70AAoJEEn8ffcsOfaWT5EIAJXIwftn+RAOZx+X2ijCsZZQ
3sqZMBnrlUY0hOQ7tPbLjAAIE9XPKGWI7YDqarsjgVK0hr6Y/sp5Sx9iAMxSLeTj
Xtu0/nj5dRMjKeooQZoeZLGSthqebB9K1dfjbK4gKXyeqgqR6FkiYR+XrdxgFkTO
OtJQ4i12w4BhYBz4wp3XJ110SMtjM7biamcioXnX8hhSzNSFDB8fTgGTVxiV/a9U
YWvBu/ENqmSjk9tHFYjPi2rJoBQyYNqI9sCxyw1YfUV+dJswVVhEqHKwZJqRZL9v
NhyvXuerjuz2VbFClanZxThqVoUDJZmO3PspcRaMo/CiyoFWh8Dd03DFFJmVpJc=
=MsLM
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
