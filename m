Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id CD93A65C91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 13:52:51 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id y19so6603661wgg.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 05:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=io5T79W6K2ifmAL9Cgfp6vCHX/lGrHqXYavwbgIHZ+o=;
	b=BNlzhO5/mpmYPsgufXAp7yrfU4OO/6o08wOycvAFHbaniA7oBFMm0b5r2fcihvA1an
	UaDSTltnU4vIim/lQ1y9/Jh+mrqsk4jEUwJXdosjUCfQo+bh+NrhiQ/qJmMQmgXTkwpz
	pDnjshtPit8YXe3MIf0vXG89SKyRmD2+uELuzeqNBliGFrn4pjFnY5Z0W/FH0+W3EghT
	V4Fuhn64BFXOInQPZxIoyjTM3Y2Dl+W2bvIPkZ2hy0kNJBHtaGmDTNSD31XKztCWoSe3
	Cl9o6CqJCTPNZyuuuzPyzkv5GLDSfPSFXMMxlXbgw1LrPgPdOpHi01FCdPeAxz+jeYG0
	VAbg==
X-Received: by 10.180.20.163 with SMTP id o3mr8492266wie.12.1416577966044;
	Fri, 21 Nov 2014 05:52:46 -0800 (PST)
Received: from localhost ([89.176.104.3])
	by mx.google.com with ESMTPSA id jp3sm6637261wid.9.2014.11.21.05.52.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 05:52:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 14:52:46 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141121135246.GB2163@jama>
References: <1415583192-2041-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1415583192-2041-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] takao-fonts : new recipe
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
X-List-Received-Date: Fri, 21 Nov 2014 13:52:53 -0000
X-Groupsio-MsgNum: 52966
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline

--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 09:33:12AM +0800, Li xin wrote:
> Takao Fonts are a community developed derivatives of IPA Fonts.
> IPA Fonts are high quality Japanese outline fonts developed by
> Information-technology Promotion Agency,Japan(called IPA for short).
> Homepage:https://launchpad.net/takao-fonts
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../takao-fonts/takao-fonts_003.02.01.bb           | 23 ++++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-support/takao-fonts/takao-fonts_003.0=
2.01.bb
>=20
> diff --git a/meta-oe/recipes-support/takao-fonts/takao-fonts_003.02.01.bb=
 b/meta-oe/recipes-support/takao-fonts/takao-fonts_003.02.01.bb
> new file mode 100644
> index 0000000..afa1a4e
> --- /dev/null
> +++ b/meta-oe/recipes-support/takao-fonts/takao-fonts_003.02.01.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Takao Fonts are a community developed derivatives of IPA Fo=
nts."
> +
> +HOMEPAGE =3D "https://launchpad.net/takao-fonts"
> +SECTION =3D "User Interface/X"
> +
> +LICENSE =3D "IPA"
> +LIC_FILES_CHKSUM =3D "file://IPA_Font_License_Agreement_v1.0.txt;md5=3D6=
cd3351ba979cf9db1fad644e8221276"
> +
> +SRC_URI =3D "http://launchpad.net/takao-fonts/003.02/003.02.01/+download=
/takao-fonts-ttf-003.02.01.zip"
> +SRC_URI[md5sum] =3D "ca480e5edb9f26d871bf6df6cb910306"
> +SRC_URI[sha256sum] =3D "2f526a16c7931958f560697d494d8304949b3ce0aef246fb=
0c727fbbcc39089e"
> +
> +RPROVIDES_${PN} =3D "virtual-japanese-font"

This causes new NOTE, do we need this RPROVIDES?

NOTE: multiple providers are available for runtime virtual-japanese-font (t=
tf-sazanami, takao-fonts)
NOTE: consider defining a PREFERRED_PROVIDER entry to match virtual-japanes=
e-font

> +
> +S =3D "${WORKDIR}/${PN}-ttf-${PV}"
> +
> +do_install() {
> +	install -m 0755 -d ${D}/${datadir}/fonts
> +	install -m 0644 -p ${S}/*.ttf ${D}/${datadir}/fonts/
> +}
> +
> +FILES_${PN} +=3D "${datadir}/fonts/*.ttf"
> +
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvQ64ACgkQN1Ujt2V2gBz7LgCfUIvzqtxEAJoN0gBYkkEnHcyt
eBYAnRtAGTMONsoLDJc+EPktvWtROmN+
=Tqxn
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
