Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 574D66B013
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:47:23 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so1070535eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OFegnyYTceLq5cGxjVn/3gj4pORkf2piocAvLi9oeHI=;
	b=d8mJzS782xa8VxD7U5p/0+oOyape3QGdaJRJtPB09DaCr7QCmgM0uEsN4TDQBIDNn6
	wqa/JbrUooy4fyVtMyo3ABFi3XeFPdWFNtV5xuVBZKDnmulv+376XWkbtGTMQoee2kNx
	ibNzOheMknXMPtbWP+3qIE6U/0BCiiykDHOWV5g5VEm0eydR4DhPDjGI29BfWGnrPGjg
	t46ISCwmmSxaSrUP5CogSS7FohAzfSbKgfY12i58QIk0wHGyv2GjxtFLeF9nPraV0df1
	eRbk7O/j4tdYqynmRdaw+UIGq4WlKe7ooSaMAgH/IcgeS4k5wfWvFYbrOe2X7udKh0pc
	9PsA==
X-Received: by 10.15.94.11 with SMTP id ba11mr9232391eeb.101.1372988843770;
	Thu, 04 Jul 2013 18:47:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm9701609eeo.14.2013.07.04.18.47.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:47:22 -0700 (PDT)
Date: Fri, 5 Jul 2013 03:47:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130705014727.GC3259@jama>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
	<788893827d50f72918440c9a71a00743e61aa543.1372987207.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <788893827d50f72918440c9a71a00743e61aa543.1372987207.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 03/10] xorg-gsml-doctools: add missing dependency on util-macros
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
X-List-Received-Date: Fri, 05 Jul 2013 01:47:23 -0000
X-Groupsio-MsgNum: 45297
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline

--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2013 at 03:23:47AM +0200, Martin Jansa wrote:
> * fails without:
>   | configure.ac:32: error: must install xorg-macros 1.8 or later before
>   running autoconf/autogen

subject typo already fixed in branch

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb =
b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
> index 502723c..80f1f00 100644
> --- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
> +++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
> @@ -2,6 +2,8 @@ require xorg-doc-common.inc
>  PE =3D "1"
>  PR =3D "${INC_PR}.0"
> =20
> +DEPENDS +=3D "util-macros"
> +
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8c6c808cd3c797a07b24e443af1c=
449"
> =20
>  SRC_URI[md5sum] =3D "2588efb3f49f7fc6ecf41ce42e0b2e5e"
> --=20
> 1.8.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHWJa8ACgkQN1Ujt2V2gBxnRgCcCKxgHDOPGHHg0sOjaCNrpbIH
htQAoIdlQQD2eFmxf4WuAcWhwmF7W9D+
=vwvO
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
