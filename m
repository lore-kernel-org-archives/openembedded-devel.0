Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5559874242
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2015 16:08:15 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so178267302pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2015 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=y+mbdpr8qoelIuSfXqxbWVhJjO9jQCkByLRpxZOO0dk=;
	b=nAudiLrW7dFmsjQTHnKLpaaR6noDghMIC7u6qI4bC0t9zX0/sPYw6HxIZrR6cDvZl/
	CBh3yUk6EhhFbjIRWMAexsxnowgN5zzZ+icUvt4JZmEDdQh/2fttizCrCAGEaqt3Mll4
	d+6ZVoieZIgNb1XYfs2zET1IYY41MMQN9hBbJ+YsXp+10QcdnE8/xPlFQszKS7QBR6oL
	b1Rxo8QGZe/i4ldHRFIqdjyAqLyPpnvXEmmsUrDjuv3w83S/3PAvTxPu/1uUUa6GFNqC
	zpnEfnJpA2xDHCyfrAYmFL5K3bq88AI5A8HdKcMPH6l2dcg0KwDLxk0gnxIFNWW56Msk
	Qr4Q==
X-Received: by 10.68.68.197 with SMTP id y5mr27213050pbt.88.1443456495669;
	Mon, 28 Sep 2015 09:08:15 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:55c3:e462:f5f6:9d1b?
	([2601:647:4c02:370d:55c3:e462:f5f6:9d1b])
	by smtp.gmail.com with ESMTPSA id
	x10sm20338341pas.12.2015.09.28.09.08.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Sep 2015 09:08:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443440681-5009-1-git-send-email-adrian.ratiu@ni.com>
Date: Mon, 28 Sep 2015 09:07:58 -0700
Message-Id: <1E25FC86-FE6A-4FE0-850F-620603B9FC3D@gmail.com>
References: <1443440681-5009-1-git-send-email-adrian.ratiu@ni.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3094)
Subject: Re: [meta-oe][PATCH] vim: Compile and provide xxd in package vim-xxd
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
X-List-Received-Date: Mon, 28 Sep 2015 16:08:17 -0000
X-Groupsio-MsgNum: 57558
Content-Type: multipart/signed;
	boundary="Apple-Mail=_89FCF6A6-E582-4F83-9AB4-0553F6DF1AF3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_89FCF6A6-E582-4F83-9AB4-0553F6DF1AF3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 28, 2015, at 4:44 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> =
wrote:
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
> meta-oe/recipes-support/vim/vim_7.4.481.bb | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb =
b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> index 2ece53b..fcd036b 100644
> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> @@ -59,6 +59,11 @@ EXTRA_OECONF =3D " \
>     STRIP=3D/bin/true \
> "
>=20
> +do_compile_append() {
> +    cd "${S}/xxd"
> +    make

why not oe_runmake ?

> +}
> +
> do_install() {
>     autotools_do_install
>=20
> @@ -70,17 +75,20 @@ do_install() {
>     # Install example vimrc from runtime files
>     install -m 0644 ../runtime/vimrc_example.vim =
${D}/${datadir}/${BPN}/vimrc
>=20
> +    install -m 0755 xxd/xxd ${D}${bindir}/xxd
> +
>     # we use --with-features=3Dbig as default
>     mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
> }
>=20
> PARALLEL_MAKEINST =3D ""
>=20
> -PACKAGES =3D+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor =
${PN}-vimrc"
> +PACKAGES =3D+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor =
${PN}-vimrc ${PN}-xxd"
> FILES_${PN}-syntax =3D "${datadir}/${BPN}/${VIMDIR}/syntax"
> FILES_${PN}-help =3D "${datadir}/${BPN}/${VIMDIR}/doc"
> FILES_${PN}-tutor =3D "${datadir}/${BPN}/${VIMDIR}/tutor =
${bindir}/${BPN}tutor"
> FILES_${PN}-vimrc =3D "${datadir}/${BPN}/vimrc"
> +FILES_${PN}-xxd =3D "${bindir}/xxd"
> FILES_${PN}-data =3D "${datadir}/${BPN}"
> FILES_${PN}-common =3D " \
>     ${datadir}/${BPN}/${VIMDIR}/*.vim \
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_89FCF6A6-E582-4F83-9AB4-0553F6DF1AF3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYJZeoACgkQuwUzVZGdMxTTHQCfWn4BMw3BIqfYDsjl7OQr3qTG
hXgAniSjwSPF7D5iTP21yYIatqSNazp5
=S7wp
-----END PGP SIGNATURE-----

--Apple-Mail=_89FCF6A6-E582-4F83-9AB4-0553F6DF1AF3--
