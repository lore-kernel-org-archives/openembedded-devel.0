Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id C7375723C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 22:55:34 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so2089475wgg.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Dec 2014 14:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OSE1lVXJg573tC4dKD3dyJrnKV90nmxq61I03ZV0hG4=;
	b=zWFC1gMEyFwOY20GNHkTWrYrfkidCrWxUzwZPp4W1932IioAYxOfpTgvUT16LrHr0D
	y1ltwyjaA21mkxw02w2KUuSo1fyj5vk9isN4wxRnEAt9nFqO/38vrWBaPZxkzKJjdH3P
	jm8tXEvtKZZNgbj1G5V9Hm3tzPoZ0lM5Jr6b3cCq4NFOJQM43o2Lm5GkdEZQcMK0l3YY
	/L9shqY2QSFLgm5gt5mZaVpg7qjXii22/0Mpnz1xeV/MiYNpgfIYxEREG3jOaH2iJItI
	M3Mcn+Itkv9zIEwyxrQepm0exuCV2XMLMUZe5awKtEiFgFBqsTnmu3d6JcJ/76KGH5LY
	1Nvg==
X-Received: by 10.180.84.198 with SMTP id b6mr7486094wiz.41.1417820134329;
	Fri, 05 Dec 2014 14:55:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jr4sm6413890wjc.20.2014.12.05.14.55.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Dec 2014 14:55:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Dec 2014 23:55:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141205225538.GB2446@jama>
References: <1417801829-2363-1-git-send-email-rapphil@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1417801829-2363-1-git-send-email-rapphil@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libftdi: update to 1.1
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
X-List-Received-Date: Fri, 05 Dec 2014 22:55:43 -0000
X-Groupsio-MsgNum: 53209
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2014 at 03:50:29PM -0200, Raphael Silva wrote:
> Previous version was 0.19, but it had a failing recipe due to=20
> the fact that libusb was not detect during do_configure.
> This problem does not happen in version 1.1.

Please resend with -M40

> Signed-off-by: Mario Goulart <mario.goulart@gmail.com>
> Signed-off-by: Raphael Silva <rapphil@gmail.com>
> ---
>  meta-oe/recipes-support/libftdi/libftdi_0.19.bb | 31 -------------------=
------
>  meta-oe/recipes-support/libftdi/libftdi_1.1.bb  | 29 +++++++++++++++++++=
++++
>  2 files changed, 29 insertions(+), 31 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/libftdi/libftdi_0.19.bb
>  create mode 100644 meta-oe/recipes-support/libftdi/libftdi_1.1.bb
>=20
> diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/re=
cipes-support/libftdi/libftdi_0.19.bb
> deleted file mode 100644
> index 773b791..0000000
> --- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -DESCRIPTION =3D "libftdi is a library to talk to FTDI chips.\
> -FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
> -including the popular bitbang mode."
> -HOMEPAGE =3D "http://www.intra2net.com/en/developer/libftdi/"
> -SECTION =3D "libs"
> -
> -PR =3D "r1"
> -
> -LICENSE =3D "LGPLv2.1 GPLv2"
> -LIC_FILES_CHKSUM=3D "file://COPYING.GPL;md5=3D751419260aa954499f7abaabaa=
882bbe \
> -                   file://COPYING.LIB;md5=3Ddb979804f025cf55aabec7129cb6=
71ed \
> -"
> -
> -PNBLACKLIST[libftdi] =3D "BROKEN: needs to be updated to detect libusb w=
ith pkg-config instead of libusb-config"
> -
> -DEPENDS =3D "virtual/libusb0"
> -DEPENDS_virtclass-native =3D "virtual/libusb0-native"
> -
> -SRC_URI =3D "http://www.intra2net.com/en/developer/libftdi/download/libf=
tdi-${PV}.tar.gz \
> -           file://libtool-m4.patch \
> -"
> -SRC_URI[md5sum] =3D "e6e25f33b4327b1b7aa1156947da45f3"
> -SRC_URI[sha256sum] =3D "567c9d2c42d92fc401c5aba2deed45ffb2433990984e816b=
cdf31e441aef06be"
> -
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[cpp-wrapper] =3D "--enable-libftdipp,--disable-libftdipp,b=
oost"
> -
> -inherit autotools binconfig pkgconfig
> -
> -BBCLASSEXTEND =3D "native"
> -
> diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb b/meta-oe/rec=
ipes-support/libftdi/libftdi_1.1.bb
> new file mode 100644
> index 0000000..641e5a7
> --- /dev/null
> +++ b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION =3D "libftdi is a library to talk to FTDI chips.\
> +FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
> +including the popular bitbang mode."
> +HOMEPAGE =3D "http://www.intra2net.com/en/developer/libftdi/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "LGPLv2.1 GPLv2"
> +LIC_FILES_CHKSUM=3D "\
> +    file://COPYING.GPL;md5=3D751419260aa954499f7abaabaa882bbe \
> +    file://COPYING.LIB;md5=3Ddb979804f025cf55aabec7129cb671ed \
> +"
> +
> +DEPENDS =3D "libusb1"
> +
> +SRC_URI =3D "http://www.intra2net.com/en/developer/${BPN}/download/${BPN=
}1-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "b79a6356978aa8e69f8eecc3a720ff79"
> +SRC_URI[sha256sum] =3D "c0b1af1a13e2c6682a1d8041e5b164a1e0d90267cd378bb5=
1e059bd62f821e21"
> +
> +S =3D "${WORKDIR}/${BPN}1-${PV}"
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[cpp-wrapper] =3D "-DFTDI_BUILD_CPP=3Don,-DFTDI_BUILD_CPP=
=3Doff,boost"
> +
> +inherit cmake binconfig pkgconfig
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake"
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.2.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSCN+oACgkQN1Ujt2V2gBwDggCfXEufrHHN3NHZJJdE3Hntli4W
XtwAn1gc53ClJGHX29ASu0c6z2+6SA6G
=/C2w
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
