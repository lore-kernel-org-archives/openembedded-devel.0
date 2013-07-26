Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4CEC76041D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2013 17:43:20 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so1676166eae.38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2013 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=spJaX9yiazXu0tb4PbAwyi2nDSWf1pln32X0uudX97A=;
	b=RtLgsiQXjQZOQB4dYcCBhXqf0OyvkxhERvct/dP80i67bjXARLEPJ3hP09dCV7nodT
	rExPwKDs30MYlfH/sXFRCbOUvyAzDZ0ilNkoK+EyIqmb3Exo/KsFuTVvhxkaYgAD4OQk
	UYQeMcQpjzv0jwCKGlYSQR04GDU6Uh1Fer9o9ELomFQ02OTeW9vJ2FP0D98J663Xxbw/
	ovYjDkPxZ/cI7Z+uZX2USOqz6A6HvipGOEq4AAaQ1MT+sygMWTwPlcy04h6BCd+Opc5b
	PKuPyiWWVpRXvQ3O0IsWBqFg0ouvvNEY8r8h1pxgn//xuaQOKc1mW/0ltSVEaXptgkPj
	sJ0g==
X-Received: by 10.15.45.5 with SMTP id a5mr48488551eew.7.1374860600128;
	Fri, 26 Jul 2013 10:43:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r54sm82288748eev.8.2013.07.26.10.43.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Jul 2013 10:43:19 -0700 (PDT)
Date: Fri, 26 Jul 2013 19:43:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130726174345.GE3280@jama>
References: <1374848729-19835-1-git-send-email-mihai.prica@intel.com>
MIME-Version: 1.0
In-Reply-To: <1374848729-19835-1-git-send-email-mihai.prica@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v2] lvm2: Add dependency on bash
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
X-List-Received-Date: Fri, 26 Jul 2013 17:43:20 -0000
X-Groupsio-MsgNum: 45512
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d8Lz2Tf5e5STOWUP"
Content-Disposition: inline

--d8Lz2Tf5e5STOWUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2013 at 05:25:29PM +0300, Mihai Prica wrote:
> Fixes rootfs generation error if bash is not included in the image.

With rpm right?

Find which script it has in shebang and add bash only to that package
RDEPENDS, if it's something which isn't always needed put it in separate
package.

>=20
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index 1f3b62e..cd5a339 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -1,10 +1,10 @@
>  SECTION =3D "utils"
>  DESCRIPTION =3D "LVM2 is a set of utilities to manage logical volumes in=
 Linux."
> -DEPENDS =3D "udev"
> +DEPENDS =3D "udev bash"
>  LICENSE =3D "GPLv2 & LGPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
>                      file://COPYING.LIB;md5=3Dfbc093901857fcd118f065f9009=
82c24"
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
> =20
> =20
>  S =3D "${WORKDIR}/LVM2.${PV}"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d8Lz2Tf5e5STOWUP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHytVEACgkQN1Ujt2V2gBxm1ACeLRvnHg8/N2oqyFJO2gnrchp/
QB4An22ijbceNhSL4f9KUpSe1aDy86V8
=9rKG
-----END PGP SIGNATURE-----

--d8Lz2Tf5e5STOWUP--
