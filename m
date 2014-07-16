Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0D66E70333
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 13:43:25 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so6195837wiv.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8H0qC18rBOpJkFSx6t2DdERbhS5z4H7yvykwS49hXFE=;
	b=iUUZZYTozupAcdU5FBbD08M04hQ6HpUxx/M9VanSFighfI5qt3Kml/JfAdfuI9TRja
	QmyApIlEwfrZdZ79QW6wVq13sPnlOqonPlBQKGE3GJGIHF78aL8j4gNlNOI1/FmSBEWz
	vXN3HtdKndkIJmTyk5jDcROlbovUbxccW8FNg+YB59myK5sEzcRIiJqwprKv15P5rTs8
	wca7Tmoc4GFEwalkSZgllMaWYBIBjTInGD1AeHNDP5pW3ODH85FVnC7URW6mp2t78XaL
	+a7htvmSaHDM7RB72gdlX32tTRCslhBat7cr7fnxpGvyQ2nzWS/C+cHVG880mV4cZRC7
	Oc/w==
X-Received: by 10.194.90.7 with SMTP id bs7mr35365330wjb.25.1405518204353;
	Wed, 16 Jul 2014 06:43:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wu6sm39854377wjb.46.2014.07.16.06.43.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 06:43:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 15:43:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716134334.GZ2433@jama>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
	<1405491841-24744-4-git-send-email-ting.liu@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1405491841-24744-4-git-send-email-ting.liu@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: yocto@mindchasers.com
Subject: Re: [meta-oe][PATCH 3/3] luajit: replace MACHINEOVERRIDES fslmachine with qoriq-ppc
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
X-List-Received-Date: Wed, 16 Jul 2014 13:43:28 -0000
X-Groupsio-MsgNum: 51003
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tArtifyz9D3PkaxN"
Content-Disposition: inline

--tArtifyz9D3PkaxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 02:24:01PM +0800, ting.liu@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> fslmachine is too generic, use qoriq-ppc instead.
> The change had been applided in meta-fsl-ppc layer.

BTW: target luajit seems to be using host's headers and sometimes
failing.

I've recently removed multilib headers from my host distro and now it's
failing with:

| In file included from /usr/include/features.h:403:0,
|                  from /usr/include/sys/types.h:25,
|                  from host/buildvm.h:9,
|                  from host/buildvm_asm.c:6:
| /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file =
or directory
|  # include <gnu/stubs-32.h>
|                            ^
| compilation terminated.
| Makefile:661: recipe for target 'host/buildvm_asm.o' failed
| make[1]: *** [host/buildvm_asm.o] Error 1
| make[1]: Leaving directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt-o=
e-linux-gnueabi/luajit/2.0.3-r0/LuaJIT-2.0.3/src'
| Makefile:103: recipe for target 'default' failed

Shouldn't we disable all host builds in target luajit and use the tools onl=
y from luajit-native?

> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/re=
cipes-devtools/luajit/luajit_2.0.3.bb
> index de3a40b..75885d6 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> @@ -9,7 +9,7 @@ SRC_URI =3D "http://luajit.org/download/LuaJIT-${PV}.tar.=
gz \
>  SRC_URI[md5sum] =3D "f14e9104be513913810cd59c8c658dc0"
>  SRC_URI[sha256sum] =3D "55be6cb2d101ed38acca32c5b1f99ae345904b365b642203=
194c585d27bebd79"
> =20
> -SRC_URI_append_fslmachine =3D " file://ppc-fixplt.patch "
> +SRC_URI_append_qoriq-ppc =3D " file://ppc-fixplt.patch "
> =20
>  S =3D "${WORKDIR}/LuaJIT-${PV}"
> =20
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

--tArtifyz9D3PkaxN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGgYYACgkQN1Ujt2V2gBzeTwCdE9b+soLAUEXdGaI+3wQdQYzt
JIsAnicIpMHdUN+bv2gEcV+6+AOBTooi
=7tQ1
-----END PGP SIGNATURE-----

--tArtifyz9D3PkaxN--
