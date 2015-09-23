Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id DC05576FE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:08:20 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so71039298wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oA+AXrBeV9iNqPSFcCXt+/NYBbV+Tfzao3ts1ax4cpA=;
	b=yvoMylrYk7EvxjCN5KfNmsYRpkD3svZ1bYLl5BicWV+PEbqAmHvvomv/DTt/oO6n+w
	pxlOakTUCD1loYx1fjIh/kTbqdCK8UK0vkFKs3jkG+4NrhAjKWV6vQwiNzF63vt3y07U
	XYZSjH3IkI9cfBnptwTbqex4QTCmlnbrMdovajL8Ma9OkIVu84aE5qvs1O36QZbgO5XY
	s5odhhm+XAjRYGgyAoJAMhtSSk2w2NPGiUhxUKCZrF9AScAlxT7iLcuurmtlTgHTMwGq
	CoQFof0JSJirK2XGjFt2CM1QumHUpmlx2ES2X54IoeJa7l3t6hn0lPM1ZMp4fO+YWr37
	D8jQ==
X-Received: by 10.194.203.99 with SMTP id kp3mr35188158wjc.157.1443017300574; 
	Wed, 23 Sep 2015 07:08:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl4sm7454212wjb.29.2015.09.23.07.08.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 07:08:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Sep 2015 16:08:29 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150923140829.GE2384@jama>
References: <1441704708-22940-1-git-send-email-kai.kang@windriver.com>
	<1441704708-22940-2-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1441704708-22940-2-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 1/2] efivar: 0.7 -> 0.21
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
X-List-Received-Date: Wed, 23 Sep 2015 14:08:21 -0000
X-Groupsio-MsgNum: 57517
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline

--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 05:31:47PM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Upgrade efivar from 0.7 to 0.21.
>=20
> * update HOMEPAGE

Fails to build in world http://errors.yoctoproject.org/Errors/Details/18426/

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-extended/efivar/efivar_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/efivar/efivar_git.bb b/meta-oe/reci=
pes-extended/efivar/efivar_git.bb
> index 18446a0..bf2e6d2 100644
> --- a/meta-oe/recipes-extended/efivar/efivar_git.bb
> +++ b/meta-oe/recipes-extended/efivar/efivar_git.bb
> @@ -1,14 +1,14 @@
>  SUMMARY =3D "Tools to manipulate UEFI variables"
>  DESCRIPTION =3D "efivar provides a simple command line interface to the =
UEFI variable facility"
> -HOMEPAGE =3D "https://github.com/vathpela/efivar"
> +HOMEPAGE =3D "https://github.com/rhinstaller/efivar"
> =20
>  LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6626bb1e20189cfa95f2c508ba286=
393"
> =20
>  DEPENDS =3D "popt"
> =20
> -SRCREV =3D "c9e1f24a81b5374408bca5616402276e47171cf7"
> -PV =3D "0.7+git${SRCPV}"
> +SRCREV =3D "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> +PV =3D "0.21+git${SRCPV}"
>  SRC_URI =3D "git://github.com/vathpela/efivar.git"
> =20
>  S =3D "${WORKDIR}/git"
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

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYCsl0ACgkQN1Ujt2V2gBxgeACfY++Lyz2Eui/GTIBwWXxUqqtW
SnIAnjyBU1Pr2blYS8rrHRc3leD5Z91l
=0Prx
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
