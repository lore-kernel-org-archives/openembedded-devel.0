Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id D8C69609BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 16:50:35 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id u56so4899736wes.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UPahVMdRQa6mFK8qxwOk3xATLCYDsKtRkxmkpIqdWVQ=;
	b=zavtXknuvHltRCG/iNATKemXW+SKfCqQyPAIiGSF4FPfn/ZtFqLLk/5gsGXGsA7Woj
	m6xDnA4TTO1uqc9BY/GxGhsG+WoHl3l0g5CoSk+1fVsrV8RHXCMbZZbhcxefFm21CPwU
	/uZCLTLkNk6RokOarSKBKM5pqZ+EMRJ/PGIGrA2sb1PtUIDvv479UIQpzvXrcQ8SQDMe
	WBNfeRGHYS9CotsB92kE/+t+9UuGyUnLUo89m0W+aYjoE6Ir9HX+JyLJ0aOY4fChzJ7R
	ApPHgyyM9kgz/2KqKlrOdzOmKI1Cp1YaqUHAdhbSHCFzk2lvwPzKMmcBYaQrLuDsIt7g
	NHNQ==
X-Received: by 10.180.96.36 with SMTP id dp4mr4816203wib.33.1411491036483;
	Tue, 23 Sep 2014 09:50:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hh7sm6297344wjb.34.2014.09.23.09.50.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 09:50:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Sep 2014 18:51:20 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140923165120.GB25706@jama>
References: <1411399687-11026-1-git-send-email-damann@sensoft.ca>
MIME-Version: 1.0
In-Reply-To: <1411399687-11026-1-git-send-email-damann@sensoft.ca>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-fsl-arm][PATCH] Fixed repo path for libmikmod, was changed in sourceforge
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
X-List-Received-Date: Tue, 23 Sep 2014 16:50:39 -0000
X-Groupsio-MsgNum: 52191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2014 at 11:28:06AM -0400, Dominic Amann wrote:
>=20

Doesn't apply, because we have 3.3.6 for some time:
commit 033964b269f448b2f330ef48e51dfa5611f1a650
Author: Tim Orling <TicoTimo@gmail.com>
Date:   Tue May 27 08:12:14 2014 -0700

    libmikmod: update to 3.3.6

also the meta-fsl-arm tag is incorrect.

> Signed-off-by: Dominic Amann <damann@sensoft.ca>
> ---
>  .../recipes-multimedia/mikmod/libmikmod_3.3.3.bb   |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb b/meta-=
oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
> index 6a3077f..7f9651f 100644
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
> +++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3Db2b941d=
484c442e5c031a51463d8e11b"
>  DEPENDS =3D "alsa-lib texinfo"
> =20
>  SRC_URI =3D "\
> -    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.g=
z \
> -"
> +    ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/=
${BPN}-${PV}.tar.gz\
> +	"
>  SRC_URI[md5sum] =3D "0e0f9bce8f8e598ca292b41e0ae385c8"
>  SRC_URI[sha256sum] =3D "79f02478c5abd8b2af73df4cc5f9d52625aa044327c01563=
168e270cf79b2437"
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQhpQgACgkQN1Ujt2V2gBz29QCcDlqIwHLe3V0c7UndQFCniNPy
JTUAoLu2kPn0uDoYjH6eNNiD/H8G1mOJ
=Ky77
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
