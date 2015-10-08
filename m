Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5518960232
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:25:01 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so21390356wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Vxz+Uq7c4SIxPg7s1Iv6WRsbMt0Su/6vNjLjycPv0wc=;
	b=0/dOJsotJuIp5eGuCPNyfuO1A8TPLkzzexocuit1m9elaUW5i+5A9kAA1MU1maBdAb
	sj2jYItgXcKyH19eheO+I5aAD1rI+aJZKnOnvdO4ibvSh5INOlhGhbXmSdpeFD0U67gy
	Qcq5k1ASZlif8r8c+7uJH9Y4G/d/i9W/4iqzZ3jG1rPY9xtMCw9d67xqIt41QVrJ4FsE
	IeqtMmikw+69dmd99N+J8iMoMjPuQfDnYvIf+YoiGqs3lhoExXzqYk/URr06vr0IsRn2
	6+kz98zjlsBNQrWosOEThBZOu5dZOnilQwMhyX0wD3LTI2hv9nDCpRukDrQm4BGf6Llf
	4U+Q==
X-Received: by 10.180.8.232 with SMTP id u8mr2969258wia.26.1444299902007;
	Thu, 08 Oct 2015 03:25:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i3sm1133282wij.9.2015.10.08.03.24.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:24:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:25:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008102504.GJ2385@jama>
References: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
	<1443016567-15788-2-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1443016567-15788-2-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH 2/5] aalib: add new recipe
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
X-List-Received-Date: Thu, 08 Oct 2015 10:25:02 -0000
X-Groupsio-MsgNum: 57735
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liqSWPDvh3eyfZ9k"
Content-Disposition: inline

--liqSWPDvh3eyfZ9k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 03:56:04PM +0200, Carlos Rafael Giani wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb | 16 ++++++++++=
++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4=
=2Ebb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb b/m=
eta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
> new file mode 100644
> index 0000000..06c4e5e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "AAlib is an portable library for rendering graphics as =
ASCII art."
> +HOMEPAGE =3D "http://aa-project.sourceforge.net/aalib/"
> +SECTION =3D "libs"
> +
> +DEPENDS =3D "ncurses"
> +
> +LICENSE =3D "LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> +
> +S =3D "${WORKDIR}/aalib-1.4.0"

Fails to build
http://errors.yoctoproject.org/Errors/Details/20262/

> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/aa-project/aalib-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "d5aa8e9eae07b7441298b5c30490f6a6"
> +SRC_URI[sha256sum] =3D "0b214b98850f559e0a9ef7282de2ff336b094e1aacedefff=
3ffa50f07711db58"
> +
> +inherit autotools
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--liqSWPDvh3eyfZ9k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWRH4ACgkQN1Ujt2V2gBzkzgCdG2+KOv63lc4mlEX2XzAz/6RD
4NkAoKiIZav8pW2v4DeAhK5XjPPQs2JQ
=sO6/
-----END PGP SIGNATURE-----

--liqSWPDvh3eyfZ9k--
