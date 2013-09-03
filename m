Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFC26BFFA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:57:44 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so3172665eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/mVPPKHYcNRTX7Y0OK8JMzartWKgcfONLAgw2VCo2f8=;
	b=OjMJqb10G9BecGFR279pAYqlYvb7pWMnqZa/FDF8LCsxjv3xHNRhc5O/aCcsimaJee
	95PL1H7CLofqSyL0wLQ08l9dwwwHTi0VIKNPvtQOUX4sCHVsjicXPw5cs+YO+rdrRKI/
	LzSePyCmqE7N/RDMDAu3gBVVOdeaSi43MEQi3THb6hZbdlGn8MqbuAQLBGpJtTi8Frw+
	GkNgreD5bTxpFP0R+qIWLY4GRJnSoo0bYR3MIzCcC2O6Mk0helqFtbrPueSmZFdycU4i
	YJVpTWs7fJeNBiCShCDo0Qxnh+eLS02Re8c/TDr1Upw+fLrP5ioUs2VWMsgFWrduqsq7
	2Gqw==
X-Received: by 10.15.10.5 with SMTP id f5mr251087eet.87.1378231064719;
	Tue, 03 Sep 2013 10:57:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm33404534eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 10:57:44 -0700 (PDT)
Date: Tue, 3 Sep 2013 19:59:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130903175902.GG3553@jama>
References: <1377265124-14387-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1377265124-14387-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] xf86-video-nouveau: new recipe
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
X-List-Received-Date: Tue, 03 Sep 2013 17:57:44 -0000
X-Groupsio-MsgNum: 46050
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline

--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 11:38:44PM +1000, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Both xf86-video applied, thanks!

> ---
>  .../xorg-driver/xf86-video-nouveau_1.0.9.bb              | 16 ++++++++++=
++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-nouve=
au_1.0.9.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.=
9.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb
> new file mode 100644
> index 0000000..7b52de0
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb
> @@ -0,0 +1,16 @@
> +require recipes-graphics/xorg-driver/xorg-driver-video.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4641deddaa80fe7ca88e944e1fd94=
a94"
> +
> +SUMMARY =3D "X.Org X server -- nouveau video driver"
> +
> +DESCRIPTION =3D "Open-source X.org graphics driver for NVIDIA graphics"
> +
> +DEPENDS +=3D "virtual/libx11 libxvmc drm xf86driproto glproto \
> +            virtual/libgl xineramaproto libpciaccess"
> +RDEPENDS_${PN} +=3D "xserver-xorg-module-exa"
> +
> +COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
> +
> +SRC_URI[md5sum] =3D "8b2c0df5de3929597ade8c5ddb489a44"
> +SRC_URI[sha256sum] =3D "b247c800e532fad1c80a5666d8ca0d4e5712064b6d7a3b03=
0b32206a8de04482"
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImI2YACgkQN1Ujt2V2gBxR2gCgnyi/ETN06Q0goh/KlhwWKGbc
OwAAoITshN29OEEMIe3xsEl1Pb6Wwd43
=kJOn
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--
