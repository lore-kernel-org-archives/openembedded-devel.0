Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id A8F346158B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:08:49 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so4103000eei.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a48h1cwgVIZXcmnG+YGA5cHhFkRfd0lW3106MKaF6wQ=;
	b=ADhQi1aAJCW8jU7Lv+I7DNudyjsTvW7R+jm8D29bXm1tixZPOcgBbSG+VBv3QWhxLY
	mOoqxijw+PaoySuo+v0pD7g/JTQKchO9rXlEjqHYqo9c9d6NqIS3vQudEm197NYgqDua
	PSFzrt7z7CzRptwlbEjFoanbIGBGHFkWCQIm0218JDHNWv7qhRIeCHwlPurloUqkVBjy
	W7Av8M1ywrgPIWALGDHXp8lJWjXDh/dlRaCsm/Ly5LI/uAGPSSCbaZJdpeIzDAtGWH0C
	/4LbL2a84PYQgUfJTGQdieS8MhSfSXvySa1/YzVn2TH2AZ7qja0kO8ObTDhQlyAID6YH
	bhow==
X-Received: by 10.15.10.5 with SMTP id f5mr1782744eet.87.1379592531002;
	Thu, 19 Sep 2013 05:08:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm10824731eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:08:50 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:10:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130919121028.GB18414@jama>
References: <1379187756-9984-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1379187756-9984-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] proxy-libintl: Do not act as gettext provider
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
X-List-Received-Date: Thu, 19 Sep 2013 12:08:50 -0000
X-Groupsio-MsgNum: 46247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2013 at 12:42:36PM -0700, Khem Raj wrote:
> It only is a replacement for libintl so lets not
> go overboard.

Merged thanks!
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb=
 b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> index 0c652b6..df12299 100644
> --- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> +++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> @@ -5,9 +5,7 @@ LICENSE =3D "LGPLv2"
>  LIC_FILES_CHKSUM =3D "file://src/proxy-libintl/COPYING.LIB.txt;md5=3Dbc4=
00bc21422f9a92e76ec2c5167ca2e"
> =20
>  PR =3D "r1"
> -PROVIDES =3D "virtual/libintl virtual/gettext"
> -RPROVIDES_${PN} +=3D "gettext"
> -RPROVIDES_${PN}-dev +=3D "gettext-dev"
> +PROVIDES =3D "virtual/libintl"
> =20
>  SRC_URI =3D " \
>      http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-dev=
_${PV}_win32.zip \
> --=20
> 1.8.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI66bQACgkQN1Ujt2V2gBwyNQCgu78m5FdMJvPy90pQbT78ajY+
hJMAn37zf7YIFQFyXXzrLes6PIRGhHXz
=pLrG
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
