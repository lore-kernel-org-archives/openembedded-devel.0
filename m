Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id E9FEC71853
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 10:34:59 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id fb4so1586744wid.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Bc9C1HFWHgVaFQ60Ky1L5WtmQQAqD+EnYcyTOtp21WQ=;
	b=In+3rhRHL4ljOuOhLohcEwZP1330IhGS2v7ly8RQ+9/PLx/6Jxd/IYCBWJGxFicuZM
	+sncXDNMaOxlmzmeSPSQCPFIbuWtIO1/A9VCKOAZuL5mdk2M2NMHmOE4xaDhIL+qurZv
	Dy5tTTazAsqVc1wW4odrDtyIrQlbKBuCQGvfrBS3yb8Ilrw0hR1oaeU3PLqDIb6mCZHx
	tt4DjscG6SDNlbytLZZzx0DxMdb8lH61i/hQ3uh4XWrRBx06OgWjapKULj/Us2m9n4nY
	iz/9i+QjZtEDAz+M74FkaUyrtpq24K4y0H2baVLuMZx+0MPvs/Wki/sOFT723u2WmQOX
	DDwA==
X-Received: by 10.180.186.230 with SMTP id fn6mr3928864wic.44.1412937300232;
	Fri, 10 Oct 2014 03:35:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bc5sm4592703wjb.14.2014.10.10.03.34.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 03:34:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Oct 2014 12:36:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141010103606.GK12322@jama>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
	<1412151555-19865-7-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1412151555-19865-7-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe 06/15] tumbler: fix build deps QA warnings
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
X-List-Received-Date: Fri, 10 Oct 2014 10:35:00 -0000
X-Groupsio-MsgNum: 52425
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="enGqbSaueFq5omEL"
Content-Disposition: inline

--enGqbSaueFq5omEL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2014 at 10:19:06AM +0200, Andreas M=FCller wrote:
> WARNING: QA Issue: tumbler rdepends on libxml2, but it isn't a build depe=
ndency? [build-deps]
> WARNING: QA Issue: tumbler rdepends on libgsf, but it isn't a build depen=
dency? [build-deps]
> WARNING: QA Issue: tumbler rdepends on libbz2, but it isn't a build depen=
dency? [build-deps]

Looks like 2 more were missed, can you please check & fix?

tumbler-0.1.30: tumbler rdepends on gstreamer1.0, but it isn't a build depe=
ndency? [build-deps]
tumbler-0.1.30: tumbler rdepends on libgsttag-1.0, but it isn't a build dep=
endency? [build-deps]

>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb b/meta-xfce=
/recipes-xfce/tumbler/tumbler_0.1.30.bb
> index 8651d00..9f361e9 100644
> --- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
> +++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
> @@ -2,7 +2,7 @@ DESCRIPTION=3D"Thumbnail service implementing the thumbna=
il management D-Bus speci
>  SECTION =3D "x11/libs"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> -DEPENDS =3D "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools-=
native"
> +DEPENDS =3D "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools-=
native libxml2 libgsf"
> =20
>  inherit xfce gtk-doc
> =20
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--enGqbSaueFq5omEL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ3tpYACgkQN1Ujt2V2gBwn2wCggsRYE+lnmsuj3SuHxK8djQSq
LuMAoIT0g9VOTpTabO88lt4CHr/x7qFp
=4qye
-----END PGP SIGNATURE-----

--enGqbSaueFq5omEL--
