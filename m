Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id BBD696158B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:07:56 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so4085200eae.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jCMqcge3iHnVWSTdGwFp3duiUaPGh3Amg0pq6QO+544=;
	b=lIRqtW+JvWUiL4BaCQVABN0/4ZY/1M2gCcFZi9W+HY6n0yKQp3aGGJE1+dBBF5fqcB
	UocCtlsjToenQO1GTaqCt9/lqpybMytIVxcD53fDV+YGLsrBaKRY5XysvaViyNEhsp31
	A9phnjRt7eu7KEwffvHxglvRZXe90iDlxrJzw3I8EgMwK8papRozHuRgssrgaXWBmDC2
	2HbtjIKox2zqee/BU1IJjnVvPs0UWiuYtzWS0BgVyQu39H5Pcu5inwYHEgXhU9aihIJo
	dUHSrbUewltnjUMOSilT/6OP8rP+xpFE12eLndp950HR+srQiSF65a0mRVDv/eGtZ+mh
	AMpg==
X-Received: by 10.14.100.66 with SMTP id y42mr1907806eef.48.1379592478036;
	Thu, 19 Sep 2013 05:07:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm10825763eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:07:57 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:09:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130919120935.GA18414@jama>
References: <5235B492.6070400@philipp-wagner.com>
	<5235B62D.4080507@philipp-wagner.com>
MIME-Version: 1.0
In-Reply-To: <5235B62D.4080507@philipp-wagner.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] Update iw to 3.11
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
X-List-Received-Date: Thu, 19 Sep 2013 12:07:58 -0000
X-Groupsio-MsgNum: 46246
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2013 at 03:29:17PM +0200, Philipp Wagner wrote:
> Unfortunately the patch failed to track the file rename, so I've attached=
 an updated one.
>=20
> Philipp

And this one is missing SOB line and author field is incorrect, but
don't worry I've updated it from previous patch, so you don't need to
resend.

>=20
> ---
> diff --git a/meta-oe/recipes-connectivity/iw/iw_3.11.bb b/meta-oe/recipes=
-connectivity/iw/iw_3.11.bb
> new file mode 100644
> index 0000000..42477e7
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/iw/iw_3.11.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "nl80211 based CLI configuration utility for wireless device=
s"
> +DESCRIPTION =3D "iw is a new nl80211 based CLI configuration utility for=
 \
> +wireless devices. It supports almost all new drivers that have been adde=
d \
> +to the kernel recently. "
> +HOMEPAGE =3D "http://wireless.kernel.org/en/users/Documentation/iw"
> +SECTION =3D "base"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D878618a5c4af25e9b93ef0be1a93f=
774"
> +
> +DEPENDS =3D "libnl pkgconfig"
> +
> +SRC_URI =3D "http://www.kernel.org/pub/software/network/iw/${P}.tar.bz2 \
> +           file://0001-iw-version.sh-don-t-use-git-describe-for-versioni=
ng.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "e633cf7c875c7d8b547abafc0d95f6c4"
> +SRC_URI[sha256sum] =3D "09348d4f7371fad00c07cfb67b9e34f24403cbd9361f9634=
cfb4dff9cdd40139"
> +
> +EXTRA_OEMAKE =3D ""
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} install
> +}
> diff --git a/meta-oe/recipes-connectivity/iw/iw_3.6.bb b/meta-oe/recipes-=
connectivity/iw/iw_3.6.bb
> deleted file mode 100644
> index a09339c..0000000
> --- a/meta-oe/recipes-connectivity/iw/iw_3.6.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY =3D "nl80211 based CLI configuration utility for wireless device=
s"
> -DESCRIPTION =3D "iw is a new nl80211 based CLI configuration utility for=
 \
> -wireless devices. It supports almost all new drivers that have been adde=
d \
> -to the kernel recently. "
> -HOMEPAGE =3D "http://linuxwireless.org/en/users/Documentation/iw"
> -SECTION =3D "base"
> -LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D878618a5c4af25e9b93ef0be1a93f=
774"
> -
> -DEPENDS =3D "libnl pkgconfig"
> -
> -SRC_URI =3D "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
> -           file://0001-iw-version.sh-don-t-use-git-describe-for-versioni=
ng.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "1c18bfbbc8773629e5e8ac733a39540c"
> -SRC_URI[sha256sum] =3D "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b=
5840f948cdb6c857"
> -
> -EXTRA_OEMAKE =3D ""
> -
> -do_install() {
> -    oe_runmake DESTDIR=3D${D} install
> -}
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI66X8ACgkQN1Ujt2V2gByItACdHJuBg6WvKY1b0FYqeTJUXubS
tZQAoLFzNbapV7pOOBbTRXTP4l70B46+
=BLD2
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
