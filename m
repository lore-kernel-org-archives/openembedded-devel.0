Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 69D946017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 21:28:37 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1XlleY-0001rg-O0 from Joe_MacDonald@mentor.com ;
	Tue, 04 Nov 2014 13:28:38 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.181.6; Tue, 4 Nov 2014
	13:28:38 -0800
Received: by burninator (Postfix, from userid 1000)	id B06E4581737; Tue,  4
	Nov 2014 16:28:37 -0500 (EST)
Date: Tue, 4 Nov 2014 16:28:37 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <jackie.huang@windriver.com>
Message-ID: <20141104212837.GA11534@mentor.com>
References: <1414560206-29833-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1414560206-29833-1-git-send-email-jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] vpnc: use nativeperl to run perl scripts
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
X-List-Received-Date: Tue, 04 Nov 2014 21:28:47 -0000
X-Groupsio-MsgNum: 52732
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] vpnc: use nativeperl to run perl scripts] On=
 14.10.29 (Wed 01:23) jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> inhert perlnative and make sure we use nativeperl
> to run perl scripts when compile.
>=20
> fixed:
> | ./makeman.pl
> | Can't locate Fatal.pm in @INC
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/me=
ta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> index 986416a..4efc412 100644
> --- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> +++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> @@ -7,9 +7,16 @@ LICENSE =3D "GPL-2.0+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D173b74cb8ac640a9992c03f3bce22=
a33"
>  DEPENDS =3D "libgcrypt"
> =20
> +inherit perlnative
> +
>  CFLAGS_append =3D ' -DVERSION=3D\\"${PV}\\"'
>  LDFLAGS_append =3D " -lgcrypt -lgpg-error"
> =20
> +do_configure_append () {
> +    # Make sure we use our nativeperl wrapper
> +    sed -i "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/*.pl
> +}
> +
>  do_install () {
>      sed -i s:m600:m\ 600:g Makefile   =20
>      oe_runmake 'DESTDIR=3D${D}' 'PREFIX=3D/usr' install
> --=20
> 2.0.0
>=20
--=20
-Joe MacDonald.
:wq

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUWUUFAAoJEEn8ffcsOfaWdtIIANX7SnsVvoGhekjRnrB7abQ0
DnSVICq94mQDUHyXWQ5eDHT7iYMYPiStQ/udNjowDGvvEG/fWkEIFCHzjPk4v+Gt
ZCYUEfH9f8oocREAWe+kMqzh9DaTXyw6nwqI1tkh4X4UKFPkMHtPqXvNHSYdnFYA
j/zJgQeYzgkyaqdxsI01y5vHpo5VHbP5A9MOESaHYAfIffoCLg3Gup8l5O3xqGhu
iaqfOpxU7GORuBEZVCkMzkxO4jNJaBKPQTIofOS7OlaM+zciaz3ZOoZBlP0HioUi
/NejBfrwRtIgL3km7reLz7VGA5Lff0XbpPzReMnFMzRdxJwWjtGH9b3ilGVxVI8=
=KTLb
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
