Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id E33EB65FFC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 16:28:36 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id w61so2982461wes.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 09:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Oj4QOv9GZHmo+WrboAYJU5S+nbo0GwdJWA+U5V88/oA=;
	b=DYTkZx1jN7JZyrH4BHdLFW/t62eG/DF9tHSRG6W5LWTxoUADcMssP9Fgr5Rtd2om95
	nZW91fv2pS9TnrNp0Gr12uNE5/W2czwcaqkX3mGMxTcheDuZzeM+2n60Uiq4w5T341gC
	dKbmc+IUO7gig68K8wiTeNoWvea45xkCDT6p/iXN5ou6xxXYfC9/HudwckjuXozQZt1D
	6jBMLYCvRwmC2UU9T0ZLeJFk/IlBtw4lsPabCnI0wnL7/+ms46ZRuhXtHToEOv4a/ex4
	+ljkliPuYHYwTIl5fzsU4gtTGONTf91vOYyZD+4NCfvr38EMU0nbMGwZAnKp4/sip3FQ
	gN8Q==
X-Received: by 10.194.119.67 with SMTP id ks3mr940544wjb.96.1411489717325;
	Tue, 23 Sep 2014 09:28:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u8sm2810033wia.24.2014.09.23.09.28.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 09:28:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Sep 2014 18:29:21 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140923162921.GA25706@jama>
References: <1411282139-8785-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1411282139-8785-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] packagegroups: Move inheriting packagegroup below PACKAGE_ARCH assignment
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
X-List-Received-Date: Tue, 23 Sep 2014 16:28:40 -0000
X-Groupsio-MsgNum: 52190
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2014 at 11:48:59PM -0700, Khem Raj wrote:
> Fixes errors
>=20
> sets PACKAGE_ARCH before inherit packagegroup

wasn't this already resolved in:
commit 5a25dde053e93e64b945776ab3fbf8b67c8c0773
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Sun Aug 24 18:01:11 2014 +0200

    packagegroup*: set PACKAGE_ARCH before packagegroup inherit

?

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-basic.bb | 5 +++--
>  meta-oe/recipes-core/packagegroups/packagegroup-boot.bb  | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> index 08db943..9412df2 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> @@ -7,12 +7,13 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D=
4d92cd373abda3937c2bc47fbc49d
> =20
>  PR =3D "r13"
> =20
> -inherit packagegroup
> -
> +#
>  # packages which content depend on MACHINE_FEATURES need to be MACHINE_A=
RCH
>  #
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> +inherit packagegroup
> +
>  # Poke extra recomendations into the list using your machine.conf
>  #
>  MACHINE_EXTRA_RRECOMMENDS ?=3D ""
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/me=
ta-oe/recipes-core/packagegroups/packagegroup-boot.bb
> index 3b634f3..ae7e989 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
> @@ -4,12 +4,13 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D=
4d92cd373abda3937c2bc47fbc49d
> =20
>  PR =3D "r58"
> =20
> -inherit packagegroup
> -
> +#
>  # packages which content depend on MACHINE_FEATURES need to be MACHINE_A=
RCH
>  #
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> +inherit packagegroup
> +
>  #
>  # those ones can be set in machine config to supply packages needed to g=
et machine booting
>  #
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQhn+EACgkQN1Ujt2V2gBwPxwCgkRHAJMISdhTfI6L8e/VhwJI8
uEsAoJiHQeJkNagdcbaNL+v68cl7J2Fy
=vOsQ
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
