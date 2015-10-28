Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 17D0471633
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:15:14 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so195942900wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g8CUc1OnzWk5TXFYkZxTB7kLk6e8u8VJNKB215wySe8=;
	b=IMcdqTxDOG6mYdpg78t7LRCOqus6nHvWRtAA5CDU4y0JVQDLNgfzCC7xlXlv75rgM6
	pNs/uKgeuLVWyeIcoWmqCMuZw/93S9tyH5QW90Cxph2w4eqDvrEuds+FWkveGjPogvPT
	TbF7nSpthmCFdwxYyO2ARznQOyp5glv/H93QQKoBP5cFIyVvtPgfQZLkrTtQVVdVvG3j
	L6K3nNRVYy3/Q/G9h1T5tGN2Es+XoG0jKOnE3pBN5/lYgy9551i1op7D0btZQW11Den8
	PTZ0BibEs9hRTHeR4kF/TlLlBgC1Lo1SgnmTUj/kL7b/e7dg0oM73m0ww7fkSVOCX2j8
	JtVQ==
X-Received: by 10.194.77.146 with SMTP id s18mr38969063wjw.122.1446034514615; 
	Wed, 28 Oct 2015 05:15:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh5sm49727443wjb.42.2015.10.28.05.15.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 05:15:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Oct 2015 13:15:36 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151028121536.GA2566@jama>
References: <A162E8E5-5317-4F65-B049-7897DAF41CAC@gmail.com>
MIME-Version: 1.0
In-Reply-To: <A162E8E5-5317-4F65-B049-7897DAF41CAC@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] rrdtool: fix compile error V2
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
X-List-Received-Date: Wed, 28 Oct 2015 12:15:15 -0000
X-Groupsio-MsgNum: 58105
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 09:22:38PM +0100, Jens Rehsack wrote:
>=20
> Since cpan.bbclass has evolved, the old wrapper simulation needs some ado=
ption.
> Use as much as possible from cpan.bbclass instead of copying code from th=
ere.

I've fixed the commit message, when cherry-picking to master-next,
next time the "v2" belongs to [PATCHv2], not the commit summary.


>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/=
recipes-extended/rrdtool/rrdtool_1.5.4.bb
> index 2c81d56..666ace9 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "\
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -inherit autotools-brokensep gettext pythonnative perlnative python-dir c=
pan-base systemd
> +inherit cpan autotools-brokensep gettext pythonnative python-dir systemd
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> @@ -50,21 +50,13 @@ EXTRA_OECONF =3D " \
>      --disable-rpath \
>  "
> =20
> -# don't use perl.real, this results in break issues with prebuilts since=
 perl.real doesn't
> -# know where the PERL5LIB is...
> -# use wrapper perl instead
> -EXTRA_OEMAKE =3D "PERL=3D${STAGING_BINDIR_NATIVE}/perl-native/perl FULLP=
ERL=3D${STAGING_BINDIR_NATIVE}/perl-native/perl"
> -
>  export BUILD_SYS
>  export HOST_SYS
>  export STAGING_LIBDIR
>  export STAGING_INCDIR
> =20
> -# Env var which tells perl if it should use host (no) or target (yes) se=
ttings
> -export PERLCONFIGTARGET =3D "${@is_target(d)}"
> -export PERL_INC =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_v=
ersion(d)}/CORE"
> -export PERL_LIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_v=
ersion(d)}"
> -export PERL_ARCHLIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_pe=
rl_version(d)}"
> +# emulate cpan_do_configure
> +EXTRA_OEMAKE =3D ' PERL5LIB=3D"${PERL_ARCHLIB}" '
> =20
>  do_configure() {
>      #fix the pkglib problem with newer automake
> --=20
> 1.9.1
>=20
> This is a V2 after rebasing oe/master
>=20
> Error is here for a few days ... http://nopaste.linux-dev.org/?785761
>=20
> --=20
> Jens Rehsack - rehsack@gmail.com
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYwvFYACgkQN1Ujt2V2gByOjgCdGjPrMBwOISvMNhVzN2CnY8Gd
M1wAoIG7OQWt3e6XpmlNUI8ca6Cu68Ru
=tPkR
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
