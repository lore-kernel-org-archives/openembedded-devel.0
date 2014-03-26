Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id E53996E81B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 21:35:20 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so2142067eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WUl1+MBfZnV6bJx49lo6c4iOSEicTq4BLMwrjr5t9b0=;
	b=sNfUi7TsWKvco+allDtBCQQFeG0BBMJTA73qcLhhtftVRfBtew/zbhniajeNZHoxrf
	5IlOqSDGTcYTmLqr1LSI//PdUt1aazX3o/tBLREwmI9zakrYPVh7NX9ag1TbT+SYWnDi
	zVB9lvX44pfhmoDssdv8N/8+ilPlQu6zmkX5nXCbZcRqAtm+/kE5VKv8NJNKfhhf11tl
	SKdeLShl8R0GJYq6XyT8DDiz91NOOhU3lhLEPbvBC8TQw0WrkuVh4oaq05cgQKIIvtRP
	72yypfr5cdIKrv5p+c70qkLZpWronZ8FOfOwwDFeSIe2E25Hk0bOFPaxnzPsnGs8zOAx
	ivbQ==
X-Received: by 10.14.5.135 with SMTP id 7mr5009430eel.86.1395869721794;
	Wed, 26 Mar 2014 14:35:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bc51sm49757294eeb.22.2014.03.26.14.35.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 14:35:20 -0700 (PDT)
Date: Wed, 26 Mar 2014 22:35:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140326213520.GN3709@jama>
References: <1395869254-7092-1-git-send-email-adam.yh.lee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1395869254-7092-1-git-send-email-adam.yh.lee@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] exo: Add intltool-native as native dependency
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
X-List-Received-Date: Wed, 26 Mar 2014 21:35:22 -0000
X-Groupsio-MsgNum: 48850
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1HuzLmPZrG5RH6bG"
Content-Disposition: inline

--1HuzLmPZrG5RH6bG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 02:27:34PM -0700, Adam YH Lee wrote:
> exo-native fails to build due to more strict dependency checking
> introduced in autotools.bbclass. intltool-native should be explicitly
> defined as a dependency.
>=20
> Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
> ---
>  meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes=
-xfce/exo/exo_0.10.2.bb
> index 09aacc3..3eb03bc 100644
> --- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> +++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> @@ -3,8 +3,8 @@ SECTION =3D "x11"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  DEPENDS =3D "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-nat=
ive cairo"
> -DEPENDS_class-native =3D "glib-2.0-native xfce4-dev-tools-native"
> -PR =3D "r4"
> +DEPENDS_class-native =3D "glib-2.0-native xfce4-dev-tools-native intltoo=
l-native"
> +PR =3D "r5"

We don't do PR bumps anymore, I'll remove that when cherry-picking to
master-next.

>  inherit xfce pythonnative perlnative
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

--1HuzLmPZrG5RH6bG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMzSBgACgkQN1Ujt2V2gBxqdwCgqBSYltNjPNOsBjNvPN0AicHm
dtkAn1mtHO7hmlcN7HVH8uzb791t0lXJ
=qtcG
-----END PGP SIGNATURE-----

--1HuzLmPZrG5RH6bG--
