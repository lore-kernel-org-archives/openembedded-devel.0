Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USRN4-00045l-C1
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 14:21:55 +0200
Received: by mail-da0-f53.google.com with SMTP id n34so754302dal.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 05:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Zqj5u5zRa3bnt0CNHhNsKy9Q2XBgPp4K9T+MQ5vCSF0=;
	b=L0VUC++SBWp5UxYTatS1cKy+KRzMGcLce+YkBkSbRxUiyCvVi34S0M+2A2OoJYoMP7
	VN0AKlVS1oRJoviZVDxhFVPZLdiMnY/OxTzCmLiLpeK21IjQqnqBjFbznIVxCfMwIRcJ
	pRF3WkMk/Vwt314W+WMs249ZadNrJON3HUgMvysbixVIRogIxd8xKLdbSZFF/DsT5vye
	gBe/+7wKRcRMaxgwuWCtwHZ5SUrN6Ra3Pd7iwAIlj/6rZzxVC4pDSNCVMSjbG/6Zbdc7
	VbR1B/KdzymXiDw3bJ1Kyz0rmB6myOo7lmJtPiMBf0y1Ah3HHNSdnITcBBNAR0zsrdUO
	xtGA==
X-Received: by 10.68.202.166 with SMTP id kj6mr8619663pbc.162.1366200262024;
	Wed, 17 Apr 2013 05:04:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ak5sm6957163pac.4.2013.04.17.05.04.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 05:04:20 -0700 (PDT)
Date: Wed, 17 Apr 2013 14:04:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130417120420.GG26007@jama>
References: <1365873301-29552-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1365873301-29552-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe PATCH 1/2] libgsf: update to version 1.14.26
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 12:21:57 -0000
X-Groupsio-MsgNum: 44282
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IuhbYIxU28t+Kd57"
Content-Disposition: inline

--IuhbYIxU28t+Kd57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2013 at 02:15:00PM -0300, Otavio Salvador wrote:
> From: Mario Domenech Goulart <mario@ossystems.com.br>
>=20
> Previous version was 1.14.21, but Gnumeric requires at least 1.14.24.
> Since we are changing it, we pick the latest available version.
>=20
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-gnome/libgsf/{libgsf_1.14.21.bb =3D> libgsf_1.14.26.bb} | 8 =
++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.21.bb =3D> libgsf_1.=
14.26.bb} (71%)
>=20
> diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gno=
me/recipes-gnome/libgsf/libgsf_1.14.26.bb
> similarity index 71%
> rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
> rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
> index a4f1ec2..a6127d6 100644
> --- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
> +++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
> @@ -3,16 +3,16 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddc7371b50816c96e145fa0f8ade8e=
24d \
>                      file://COPYING.LIB;md5=3D61464cfe342798eeced82efe9ae=
55f63"
> =20
> -PR =3D "r4"
> -
>  SECTION =3D "libs"
> =20
>  DEPENDS=3D "libxml2 bzip2 glib-2.0 zlib"
> =20
>  inherit autotools pkgconfig gnome gconf
> =20
> -SRC_URI[archive.md5sum] =3D "2b702648b853402554c97d75405c60d3"
> -SRC_URI[archive.sha256sum] =3D "eef0a9d6eca4e6af6c16b208947e3c958c428b94=
d22792bdd0b80c08a4b301db"
> +SRC_URI[archive.md5sum] =3D "3c5a4fbd16a727c36974078e6d0e9575"
> +SRC_URI[archive.sha256sum] =3D "8919e725aadd785380350c8dec7427d82cf33164=
bc9a9a549df9440a0c3da6d5"
> +
> +GNOME_COMPRESS_TYPE =3D "xz"
> =20
>  EXTRA_OECONF =3D "\
>  		--without-python \
> --=20
> 1.8.1

Please fix this QA

libgsf-1.14.26: libgsf: Files/directories were installed but not shipped
  /usr/share/thumbnailers
  /usr/share/thumbnailers/gsf-office.thumbnailer

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IuhbYIxU28t+Kd57
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFuj8QACgkQN1Ujt2V2gBxCOwCgohVHDKStjBOn9/o5bwG8EmaS
QOYAnRJG1OacSKPpZkjfVO5uDDg/x3+P
=4auG
-----END PGP SIGNATURE-----

--IuhbYIxU28t+Kd57--
