Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3E21A70428
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 12:26:48 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so821754wes.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 05:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zr1DyQtuI27fy2G0J03qpmX5CIThF5UcJ2dsW7ve5MY=;
	b=xCQhJkDcQ5JAYRJzC673o+GiOqVRjvnesezhiGv5zNOjWUsQtnc5oLSvc3kge8+6D1
	wASYKZhQ/wFxlXl/0RXfeLxCIBrcppxa+uxEi7Ot4alz/RMHR0Eu9LM1BDUd1Y0coxEl
	QtpQdkpP/s07m2RWWJQKYQ8sIbEC6nXXMXDRSOVdpGon026Rz6ZGWCdjiWtT4nKpEn5l
	NZhkieR2cmDrIqix6AAU6qPAZ2VeZzUV+bd7ncva+rEwiJOu8HeO/CMm3HIVOwvRT2eZ
	dsMt36FxfuNbCSowCmXTwghhAGRB4iqLpGuWhK0+dkU366hVOqkJnS8MIw0pZMJVF8zA
	9/8w==
X-Received: by 10.180.126.9 with SMTP id mu9mr12970692wib.69.1405513609514;
	Wed, 16 Jul 2014 05:26:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w6sm39480418wjr.4.2014.07.16.05.26.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 05:26:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 14:26:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716122659.GT2433@jama>
References: <1405505662-28883-1-git-send-email-ting.liu@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1405505662-28883-1-git-send-email-ting.liu@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] luajit: remove fsl ppc specfic patch
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
X-List-Received-Date: Wed, 16 Jul 2014 12:26:51 -0000
X-Groupsio-MsgNum: 50996
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nZJAkgcjPzQrJB+u"
Content-Disposition: inline

--nZJAkgcjPzQrJB+u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 06:14:22PM +0800, ting.liu@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> Will add this patch in meta-fsl-ppc layer via bbappend.
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/re=
cipes-devtools/luajit/luajit_2.0.3.bb
> index de3a40b..684ec14 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> @@ -9,8 +9,6 @@ SRC_URI =3D "http://luajit.org/download/LuaJIT-${PV}.tar.=
gz \
>  SRC_URI[md5sum] =3D "f14e9104be513913810cd59c8c658dc0"
>  SRC_URI[sha256sum] =3D "55be6cb2d101ed38acca32c5b1f99ae345904b365b642203=
194c585d27bebd79"
> =20
> -SRC_URI_append_fslmachine =3D " file://ppc-fixplt.patch "
> -

I've also removed the actual .patch file when cherry-picking this to
master-next.

>  S =3D "${WORKDIR}/LuaJIT-${PV}"
> =20
>  inherit pkgconfig binconfig
> --=20
> 1.7.3.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nZJAkgcjPzQrJB+u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGb5MACgkQN1Ujt2V2gBwlzwCfdIkJl2w9/E4PgdcJP3yH6tj+
EhkAnjuGAJtgfc7Xobpd1JrbGtdg4mEJ
=PVqN
-----END PGP SIGNATURE-----

--nZJAkgcjPzQrJB+u--
