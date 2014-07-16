Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id BEC0770585
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:26:47 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so1112537wes.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kqEtoi6Eq97kD6ZYn28XRkHHViuKGuRH387aHdJcJ9g=;
	b=gX6uGkGJ4+tLmd0+yP3j52VIZMhdjhfH+oMojM/w/MQCiyeIEL/WK4b8JgzAoougHd
	JRk3gkebI2VIqXoLdakabjxkr5MMsp8GC3ggKCylcd1+topZC6FPpI8qodJ/eMl6l/O6
	7aayHysf5LryX7nJ+tfSm35PImmtBWawBNRovlByC+m7SDvqVbe4HU+HRD5+L/1LPUqC
	ofNO1IkiO6oy5iji7YnZhaUo5bmoqUsMhz43GMWj4ChyYtINh0CFFfpM6wCqq/FsDE8G
	kLfBeeS5a8hgtyFPjFnXqctiiXU3FarvmjUVZAR5R+PcU3c890AULvvq+JS7/f/Owuqt
	z+SQ==
X-Received: by 10.194.92.196 with SMTP id co4mr37372564wjb.4.1405524407897;
	Wed, 16 Jul 2014 08:26:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o12sm57666083wiw.5.2014.07.16.08.26.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 08:26:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 17:26:57 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716152657.GD2433@jama>
References: <20140716145924.GA13352@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20140716145924.GA13352@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe] [PATCH] postgresql configure error
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
X-List-Received-Date: Wed, 16 Jul 2014 15:26:50 -0000
X-Groupsio-MsgNum: 51009
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7fVr/IRGAG9sAW4J"
Content-Disposition: inline

--7fVr/IRGAG9sAW4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 10:59:28AM -0400, Amy Fong wrote:
> Author: Amy Fong <amy.fong@windriver.com>
> Date:   Wed Jul 16 10:57:38 2014 -0400
>=20
>     postgresql: libxml2 configure error
>    =20
>     postgresql is looking for libxml2 in the wrong location .../usr/inclu=
de
>     libxml2 installs its header files under .../usr/include/libxml2
>    =20
>     Signed-off-by: Amy Fong <amy.fong@windriver.com>
>=20
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/=
recipes-support/postgre
> index 4e5ec02..47aa3a6 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -47,7 +47,7 @@ PACKAGECONFIG[uuid] =3D "--with-ossp-uuid,--without-oss=
p-uuid,ossp-uuid,"
>  PACKAGECONFIG[tcl] =3D \
>      "--with-tcl --with-tclconfig=3D${STAGING_BINDIR_CROSS},--without-tcl=
,tcl,"
>  PACKAGECONFIG[nls] =3D "--enable-nls,--disable-nls,,"
> -PACKAGECONFIG[libxml] =3D "--with-libxml,--without-libxml,libxml2,libxml=
2"
> +PACKAGECONFIG[libxml] =3D "--with-libxml CFLAGS=3D-I${STAGING_INCDIR}/li=
bxml2,--without-libxml,libx

Using libxml pkgconfig is better option (see patch on ML)

>  PACKAGECONFIG[perl] =3D "--with-perl,--without-perl,perl,perl"
> =20
>  EXTRA_OECONF +=3D "--enable-thread-safety --disable-rpath \
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7fVr/IRGAG9sAW4J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGmcEACgkQN1Ujt2V2gBwZSgCeMR0oDKgoA8Yb1vEXKwnQarkj
vVoAn1wEjCcJvcl01jmEKN5qmsTVbHwz
=Nfgx
-----END PGP SIGNATURE-----

--7fVr/IRGAG9sAW4J--
