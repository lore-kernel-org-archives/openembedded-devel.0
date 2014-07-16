Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6E87970588
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 17:58:28 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so1205482wgg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rBM2q6DwPFh4n8YxrbNNHpzIW/g5NHJBuiAwj7iJ2AE=;
	b=Co0f7aTf3vjH1A1YdVgY8nvGlG/wew639BJ+EdoV2pBK1MpPAZoLeOGxvSVhPDQNPK
	pajeTfJwXs78Q2QuopfvIvi9Ef8IxJhbVM3iY1LF823KozfR2y1wEauDb4uBoxDApnN8
	spdm2XLUv19GoVuGdsvNtznfc3ozveNT0LXE5SjNavCE1C0FhTcGNwhePfNL/XHx7pUB
	qEeKBOVXkkyWSDZj5S0oL/MjjKrc1OvIVA4VlhoE4QRccAzMPjdjh6YC7NkRH1oYmAbb
	V6lPMON5bOJUZMc6L3mQaRIlsQX/9h8738jwVUzFP5WqNz2vTCxLZiObRLyWLunELPij
	Cceg==
X-Received: by 10.194.62.5 with SMTP id u5mr36922336wjr.46.1405533504509;
	Wed, 16 Jul 2014 10:58:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id jv9sm67912wjc.28.2014.07.16.10.58.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 10:58:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 19:58:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716175834.GH2433@jama>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
	<1405491841-24744-4-git-send-email-ting.liu@freescale.com>
	<20140716134334.GZ2433@jama>
MIME-Version: 1.0
In-Reply-To: <20140716134334.GZ2433@jama>
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
X-List-Received-Date: Wed, 16 Jul 2014 17:58:31 -0000
X-Groupsio-MsgNum: 51013
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uWFPrswxdEczfxSh"
Content-Disposition: inline

--uWFPrswxdEczfxSh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 03:43:34PM +0200, Martin Jansa wrote:
> On Wed, Jul 16, 2014 at 02:24:01PM +0800, ting.liu@freescale.com wrote:
> > From: Ting Liu <b28495@freescale.com>
> >=20
> > fslmachine is too generic, use qoriq-ppc instead.
> > The change had been applided in meta-fsl-ppc layer.
>=20
> BTW: target luajit seems to be using host's headers and sometimes
> failing.
>=20
> I've recently removed multilib headers from my host distro and now it's
> failing with:
>=20
> | In file included from /usr/include/features.h:403:0,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_asm.c:6:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such fil=
e or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | compilation terminated.
> | Makefile:661: recipe for target 'host/buildvm_asm.o' failed
> | make[1]: *** [host/buildvm_asm.o] Error 1
> | make[1]: Leaving directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt=
-oe-linux-gnueabi/luajit/2.0.3-r0/LuaJIT-2.0.3/src'
> | Makefile:103: recipe for target 'default' failed
>=20
> Shouldn't we disable all host builds in target luajit and use the tools o=
nly from luajit-native?

FYI: this is caused by -m32 we're passing in HOST_CC variable, dropping
-m32 causes lua to complain about different sizes while cross-compiling.

So in the end we require 32bit headers/libs on 64bit builders (this
luajit is the only recipe requiring it in my images).

/me enabling multilib again

> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> >  meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/=
recipes-devtools/luajit/luajit_2.0.3.bb
> > index de3a40b..75885d6 100644
> > --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> > +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> > @@ -9,7 +9,7 @@ SRC_URI =3D "http://luajit.org/download/LuaJIT-${PV}.ta=
r.gz \
> >  SRC_URI[md5sum] =3D "f14e9104be513913810cd59c8c658dc0"
> >  SRC_URI[sha256sum] =3D "55be6cb2d101ed38acca32c5b1f99ae345904b365b6422=
03194c585d27bebd79"
> > =20
> > -SRC_URI_append_fslmachine =3D " file://ppc-fixplt.patch "
> > +SRC_URI_append_qoriq-ppc =3D " file://ppc-fixplt.patch "
> > =20
> >  S =3D "${WORKDIR}/LuaJIT-${PV}"
> > =20
> > --=20
> > 1.7.3.4
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uWFPrswxdEczfxSh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGvUoACgkQN1Ujt2V2gBzeAQCgnBNlIu965ihPQ8GjoK14lNPN
M74AoKX0ZmuPs7z7zx6Eb9bNgTFZ/Mic
=HEQx
-----END PGP SIGNATURE-----

--uWFPrswxdEczfxSh--
