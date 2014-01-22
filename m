Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 09FCF6002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:14:32 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id r15so3563441ead.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G3JHNui2VsuhpBkxXuIuEkzwZM3Um2oPReGSxfXdPYk=;
	b=QMGDm/UINQWT3pbtwk4m42+DYJC8tjdi14psyaUde66CvKpdU48h8sCtY8SVgerFZC
	NwBCH7j+B7yQapSENKsbODN+RUt/bk/cdV7o4JVgBelPrJ7tGlhc3rR96NBVmop+icHF
	yeT7wz6IKqYQ452tvr/0i/kNJnPztHweqZpVIt4HNTqaAvHJ3VrYb0lFbbXUvEsDbd6o
	+voSrOsCUH5LV7HBBqqy9mYYN6FNKjKuH/eoN1G3x+XpgcNYAX1xFyyjZIFdblUipoIV
	dBmAqllvpWvN/PoVFt33/FtBTOC0u6kDDb6IQEWTZ38OAuOSrj9JCGNOsItxqQE56oG3
	QtdA==
X-Received: by 10.14.220.136 with SMTP id o8mr551237eep.97.1390385673759;
	Wed, 22 Jan 2014 02:14:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm25289532eef.16.2014.01.22.02.14.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 02:14:32 -0800 (PST)
Date: Wed, 22 Jan 2014 11:14:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140122101433.GR4100@jama>
References: <1390385072-19636-1-git-send-email-nickdademo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1390385072-19636-1-git-send-email-nickdademo@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] Bump SRCREV: PV is now 2.4.8+git
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
X-List-Received-Date: Wed, 22 Jan 2014 10:14:34 -0000
X-Groupsio-MsgNum: 47851
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SWsnvgFfkTS2ATo5"
Content-Disposition: inline

--SWsnvgFfkTS2ATo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 09:04:32PM +1100, Nick D'Ademo wrote:
> Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>

Start the subject with name of changed component:

opencv: bump SRCREV, PV is now 2.4.8+git

> ---
>  meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recip=
es-support/opencv/opencv_2.4.bb
> index df89b0a..538c7a3 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> @@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET =3D "arm"
> =20
>  DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0"
> =20
> -SRCREV =3D "1253c2101b22b9e89400553fd220858cda8d6ea5"
> +SRCREV =3D "a4b34e7ae10351fc4d30dc55995679340efc488e"
>  SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
>             file://opencv-fix-pkgconfig-generation.patch \
>  "
> =20
> -PV =3D "2.4.6+git${SRCPV}"
> +PV =3D "2.4.8+git${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SWsnvgFfkTS2ATo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLfmgkACgkQN1Ujt2V2gBz4eACfbCVUqzXxHffuXTjBylv/pA+X
GBgAnR84s5+IijOHLp10VWfIe/aFVVvj
=zd6F
-----END PGP SIGNATURE-----

--SWsnvgFfkTS2ATo5--
