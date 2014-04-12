Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7F365D16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Apr 2014 10:44:03 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so4788268eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Apr 2014 03:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cojKQx6nviaw4LIwXe66lwZQuP0naoEtcvgu5+B852c=;
	b=q7y4qvCGKy5rfb+9KMmHcjN2jA0DIabKWp3L8WkVP/Bj2XHVq5XRdZO/G3da0IFyyc
	04yGER0/ff8BY8p8pQv6MZzqzT/geUprirHw6S84RR3DMg+StVBWoo4+JOqKhmL9Hhr0
	9F2iVKZRyqOuPRMPAIOebiiuwUaYuNK2eZDroNZFQwcK4Q4a1hdbKnVbuwVqTAay/vZv
	UBC1fDT9crKAjsegVVgnTJYoScbWRBEsAMmeNyNtkd5jj9hAYOkD4+0IylKb1Ft5PKZf
	cTEqGePIbVw31DrX85AgBkLKnyTzBcgQNkQ983tPEivfkB1agfB6sYBAwrlkGKZHXXO1
	eI+g==
X-Received: by 10.14.87.201 with SMTP id y49mr2373201eee.62.1397299443955;
	Sat, 12 Apr 2014 03:44:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm24425663eew.25.2014.04.12.03.44.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Apr 2014 03:44:02 -0700 (PDT)
Date: Sat, 12 Apr 2014 12:44:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140412104412.GW2132@jama>
References: <1396701582-15906-1-git-send-email-trevor.woerner@linaro.org>
	<1396701582-15906-2-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396701582-15906-2-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: patches@linaro.org
Subject: Re: [meta-oe][PATCH 1/3] liblockfile: remove configure warning
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
X-List-Received-Date: Sat, 12 Apr 2014 10:44:05 -0000
X-Groupsio-MsgNum: 49196
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mlvFMpb4NrD3AMcD"
Content-Disposition: inline

--mlvFMpb4NrD3AMcD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 05, 2014 at 08:39:40AM -0400, Trevor Woerner wrote:
> This fix gets rid of the following warning:
>=20
>     configure: WARNING: unrecognized options: ... --with-libtool-sysroot
>=20
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  .../liblockfile/liblockfile-1.09/configure.patch       | 18 ++++++++++++=
++----
>  .../recipes-extended/liblockfile/liblockfile_1.09.bb   |  4 ++++
>  2 files changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/config=
ure.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure=
=2Epatch
> index ea13e11..12413cf 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.pat=
ch
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.pat=
ch
> @@ -3,16 +3,26 @@
>  # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
>  #
> =20
> ---- liblockfile-1.05/./configure.in~configure
> -+++ liblockfile-1.05/./configure.in
> -@@ -1,4 +1,5 @@
> +Index: liblockfile-1.09/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- liblockfile-1.09.orig/configure.in
> ++++ liblockfile-1.09/configure.in
> +@@ -1,10 +1,13 @@
>  -AC_INIT(lockfile.c)
>  +AC_INIT
>  +AC_CONFIG_SRCDIR([lockfile.c])
>   AC_CONFIG_HEADER(autoconf.h)
>   AC_REVISION($Revision: 1.0 $)dnl
>  =20
> -@@ -111,7 +112,8 @@
> + dnl Check for GNU cc
> + AC_PROG_CC
> +=20
> ++AC_PROG_LIBTOOL
> ++
> + dnl Set Default CFLAGS
> + if test "$GCC" =3D "yes"; then
> +     CFLAGS=3D"$CFLAGS -Wall -D_GNU_SOURCE"
> +@@ -111,7 +114,8 @@ AC_SUBST(TARGETS)
>   AC_SUBST(INSTALL_TARGETS)
>   AC_SUBST(nfslockdir)
>  =20
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/m=
eta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
> index 88ebfd8..67d2221 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
> @@ -16,6 +16,10 @@ inherit autotools
> =20
>  EXTRA_OECONF =3D "--enable-shared"

Can you please rebase on current master (maybe you have one more patch
which you haven't sent), because in master there is:

EXTRA_OECONF =3D "--enable-shared --enable-static"

so this doesn't apply.

> =20
> +do_configure_prepend () {
> +    touch install-sh
> +}
> +
>  do_install () {
>      oe_runmake 'ROOT=3D${D}' INSTGRP=3D'' install
>  }
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mlvFMpb4NrD3AMcD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNJGPwACgkQN1Ujt2V2gByeLQCeOUE31lL3kYlSLPn1NLBnOyJO
bt4An15kgi9SCO7np2AxjYTpu8XDbeuQ
=IU6Q
-----END PGP SIGNATURE-----

--mlvFMpb4NrD3AMcD--
