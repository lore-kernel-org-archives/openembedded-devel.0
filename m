Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 57E7A65DA2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:17:55 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2920364eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tpLDi1Ck9lOTfZ9bOHeWLr+WEmpND+cFA6SIoBs0db0=;
	b=VdlDkWpU3zNIGI9h8A7Odn6Do0hmVxfKmfc+v3vQr97dLYexyDrTeY/nl5IFU+EPaY
	TQqYcCtqvcA8q7dKDhfO45Pvn7k/hBkdy7bi/EdIX3ZSyAnts0odO50GB8JaPccrRg+F
	kkT20NdqgdRoFke5/Esi0Faw9ULmaRHodmAsLaGu+QiWCWDlZ+h5hRT8bM9vX1p8WnCt
	L9ttCy+5BmwEYk8mrBuadVplLj7RBcByz/cjiWctiEuipWXRNs69TjGhwTLUWT6mzCws
	sXUdqbq+vAE5lILwy7Yxpo9taCWY8K2RDGePesdZ2oYDYxA5tPdTDtDBAhwNXrIm0E4y
	nqww==
X-Received: by 10.15.43.132 with SMTP id x4mr37041491eev.59.1397985476149;
	Sun, 20 Apr 2014 02:17:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t44sm92930907eeo.6.2014.04.20.02.17.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:17:55 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:18:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420091800.GZ2486@jama>
References: <1397205325-22201-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397205325-22201-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libedit: update version to 20130712-3.1
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
X-List-Received-Date: Sun, 20 Apr 2014 09:17:56 -0000
X-Groupsio-MsgNum: 49307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p1zSJVlfBL7BTggM"
Content-Disposition: inline

--p1zSJVlfBL7BTggM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 04:35:25PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20

Merged, thanks.

> Changes:
> - Add DESCRIPTION.
> - Include the complete version number in the bb file name.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  ...libedit_20121213.bb =3D> libedit_20130712-3.1.bb} |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-devtools/libedit/{libedit_20121213.bb =3D> libedi=
t_20130712-3.1.bb} (47%)
>=20
> diff --git a/meta-oe/recipes-devtools/libedit/libedit_20121213.bb b/meta-=
oe/recipes-devtools/libedit/libedit_20130712-3.1.bb
> similarity index 47%
> rename from meta-oe/recipes-devtools/libedit/libedit_20121213.bb
> rename to meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb
> index bd02d86..1f76bb2 100644
> --- a/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
> +++ b/meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb
> @@ -1,4 +1,6 @@
>  SUMMARY =3D "BSD replacement for libreadline"
> +DESCRIPTION =3D "Command line editor library providing generic line edit=
ing, \
> +history, and tokenization functions"
>  HOMEPAGE =3D "http://www.thrysoee.dk/editline/"
>  SECTION =3D "libs"
>  LICENSE =3D "BSD"
> @@ -10,9 +12,9 @@ inherit autotools
> =20
>  # upstream site does not allow wget's User-Agent
>  FETCHCMD_wget +=3D "-U bitbake"
> -SRC_URI =3D "http://www.thrysoee.dk/editline/${BPN}-${PV}-3.0.tar.gz"
> +SRC_URI =3D "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz"
> =20
> -S =3D "${WORKDIR}/${BPN}-${PV}-3.0"
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> =20
> -SRC_URI[md5sum] =3D "f475f50fe7467c1074c0fbae8b5bca1a"
> -SRC_URI[sha256sum] =3D "0379e4a73c219f260e6d16adbc2e87635532ebb4c5a83a73=
99f231dc40108d1f"
> +SRC_URI[md5sum] =3D "0891336c697362727a1fa7e60c5cb96c"
> +SRC_URI[sha256sum] =3D "5d9b1a9dd66f1fe28bbd98e4d8ed1a22d8da0d08d902407d=
cc4a0702c8d88a37"
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

--p1zSJVlfBL7BTggM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkMgACgkQN1Ujt2V2gBzOPACfVuQlSXglz0TnJsGslETMLqMZ
A+gAn1svHUZdJV74NBZ+z2LmpDjkFJDQ
=86zU
-----END PGP SIGNATURE-----

--p1zSJVlfBL7BTggM--
