Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6B66A600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 01:38:58 +0000 (UTC)
Received: by pdfh10 with SMTP id h10so1097736pdf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 18:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=hEIZyIvazULEX1huyzpzV0OM9ikeB6QWSlEpO+TTwV0=;
	b=I+i30RumXanMQ66TXkn80AuVrZFT5D/2B6mMHhFtfH69Be+nESfkuaHKTVsgGFslvY
	Vt/xQO1PjEUfOVPd1E5Brn9J4lTiZk+sP8VO57a/wwJ0kO1S+XwLt+ieLEyD7hbjfMk+
	FXiSTWyFEqnT7OMzD0dVEg/qpJkRGnpCQlduUNAUDQr//Ecw7i2LdKLcZNQ2VMdp3DXK
	hzWKFcuqzGPGqIj5QsFULNdogwLQfkdurT0VIj9E8CSV9SAzvcvJh1R+0j1IK/gpoN3g
	T5pgfvPAr9scU2fiQBsiTZmAiVIuyG1fbsaqESHikVr4ijZyZZl0y3Mca9GPMqHMiTJt
	g6WA==
X-Received: by 10.66.102.103 with SMTP id fn7mr3127727pab.85.1431999539181;
	Mon, 18 May 2015 18:38:59 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:d1bd:ca93:84da:dce8?
	([2601:9:3580:84c:d1bd:ca93:84da:dce8])
	by mx.google.com with ESMTPSA id
	kr9sm11243149pbc.34.2015.05.18.18.38.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 May 2015 18:38:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <e68dccc9144fe4275e0130202bb65311c4a19c3e.1431587286.git.yi.zhao@windriver.com>
Date: Mon, 18 May 2015 18:38:53 -0700
Message-Id: <735FCF95-F9F6-461F-84E0-8247E35BCA3A@gmail.com>
References: <cover.1431587286.git.yi.zhao@windriver.com>
	<e68dccc9144fe4275e0130202bb65311c4a19c3e.1431587286.git.yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-oe][PATCH 3/3] sylpheed: remove do_install_append
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
X-List-Received-Date: Tue, 19 May 2015 01:38:59 -0000
X-Groupsio-MsgNum: 55550
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3A163988-5FCC-4BF5-8A57-41A36791654F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3A163988-5FCC-4BF5-8A57-41A36791654F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 14, 2015, at 12:14 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
>=20
> The .desktop and .png files alreay install by make install.
> So remove the do_install_append
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb |   10 +---------
> 1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb =
b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
> index 1b010a5..304b654 100644
> --- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
> +++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
> @@ -7,8 +7,6 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D4325afd396febcb659c36b49533135d4 \
>=20
> PR =3D "r2"
>=20
> -PNBLACKLIST[sylpheed] ?=3D "BROKEN: Doesn't work with B!=3DS"
> -
> SRC_URI =3D =
"http://sylpheed.sraoss.jp/sylpheed/v2.7/sylpheed-${PV}.tar.bz2 \
>     file://glib-2.32.patch \
> "
> @@ -18,7 +16,7 @@ SRC_URI[sha256sum] =3D =
"8bb6457db4e2eea1877b487d9ac8513546372db9a6a2e4271d11229f4a
> FILES_${PN} +=3D "${datadir}/pixmaps ${datadir}/applications"
> FILES_${PN}-doc +=3D "${datadir}"
>=20
> -EXTRA_OECONF =3D "--disable-ssl --enable-gnutls"
> +EXTRA_OECONF =3D "--disable-ssl=E2=80=9D
>=20

you did not explain this change


> CFLAGS +=3D "-D_GNU_SOURCE"
>=20
> @@ -31,9 +29,3 @@ do_configure_prepend() {
>=20
> inherit autotools pkgconfig
>=20
> -do_install_append() {
> -    install -d ${D}${datadir}/applications
> -    install -m 0644 sylpheed.desktop ${D}${datadir}/applications/
> -    install -d ${D}${datadir}/pixmaps
> -    install -m 0644 sylpheed.png ${D}${datadir}/pixmaps/
> -}
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_3A163988-5FCC-4BF5-8A57-41A36791654F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlValDEACgkQuwUzVZGdMxQ8vgCeP4YPkWdRf/iQbZ7LNE1395MK
7NMAn2h4GcGErIe0IMVQVkZUIIFtwCHy
=U2Mj
-----END PGP SIGNATURE-----

--Apple-Mail=_3A163988-5FCC-4BF5-8A57-41A36791654F--
