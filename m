Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4391373710
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Sep 2015 19:31:16 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so117418606wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Sep 2015 12:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fOcJvzg7VygDqffAvLHGIvo66HXmYLZjyqJH7RfdOKQ=;
	b=tjg6D0e38N4vu4NjViQoHSuLpVxL0OVmfAJEqzoHBtDfBjpwAxm3DPIFssRLdQldCD
	APBx2MrchGU2RqrG/5VTbB1PvvmAjkMp8UAQbgU5AJTraIT/B6D54SmfYvxf9ST+rg2F
	VIzx+ibE3WYeKsIjH9e6z8mdWBwVeQeEKJn1KGnwmEof+eluWV9LAhuRQtDT8biWPiXN
	0b405ZSC01V2Mygcj67vW1ty1wc12FD8ZiDJ4NGhoqkgRpcU19Qqkuhvi8L9O0Ae2Ogm
	EZyg/Yg/hsJwQ7W/QaLpmTE/91oFBOCZ5xiUIkFfZr0m/LpM2bFIcx8CWgbtxRIn5Tn5
	uY3A==
X-Received: by 10.194.47.161 with SMTP id e1mr21797454wjn.1.1442172676756;
	Sun, 13 Sep 2015 12:31:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c7sm11649898wjb.19.2015.09.13.12.31.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Sep 2015 12:31:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 13 Sep 2015 21:32:19 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150913193219.GB19136@jama>
References: <1441977480-44314-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
In-Reply-To: <1441977480-44314-1-git-send-email-josep.puigdemont@enea.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][fido][PATCH] vim: add checksum
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
X-List-Received-Date: Sun, 13 Sep 2015 19:31:23 -0000
X-Groupsio-MsgNum: 57320
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Content-Disposition: inline

--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2015 at 03:18:00PM +0200, Josep Puigdemont wrote:
> This fixes this build issue:
> ERROR: No checksum specified for .../downloads/vim_vim.googlecode.com_.hg=
=2E_v7-4-481.tar.gz, please add at least one to the recipe:
> SRC_URI[md5sum] =3D "797c8c3023a810bb8c11ea0a0d185855"
> SRC_URI[sha256sum] =3D "359d5e3d8981c5047364a3fe5cf7c0928b796570f7cf74aa3=
ed01593942fd064"
> ERROR: Function failed: Fetcher failure for URL: 'http://downloads.yoctop=
roject.org/mirror/sources/vim_vim.googlecode.com_.hg._v7-4-481.tar.gz;proto=
col=3Dhttps;module=3Dvim'. Missing SRC_URI checksum

NAK, you need to update your bitbake (the version you're using has a bug
in hg fetcher).

> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  meta-oe/recipes-support/vim/vim_7.4.481.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes=
-support/vim/vim_7.4.481.bb
> index afdea84..2c8e4c6 100644
> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> @@ -11,6 +11,8 @@ SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3Dhtt=
ps;module=3Dvim \
>             file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=
=3D.. \
>  "
>  SRCREV =3D "v7-4-481"
> +SRC_URI[md5sum] =3D "797c8c3023a810bb8c11ea0a0d185855"
> +SRC_URI[sha256sum] =3D "359d5e3d8981c5047364a3fe5cf7c0928b796570f7cf74aa=
3ed01593942fd064"
> =20
>  S =3D "${WORKDIR}/vim/src"
> =20
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

--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX1z0EACgkQN1Ujt2V2gBwfVQCePdmBKe2kJPifugrW32kGRbJb
a34AoJsadsb0RYwDHRV8kY9cfJfDLyMH
=vCyP
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--
