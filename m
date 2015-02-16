Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 88ED0606E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 17:47:10 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id em10so26711940wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 09:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MQm4g/KQR4FSmtkfIsOvPyTsbAxzTt5pHTSA6IImr9I=;
	b=RhTIkuq63ZADWbNErzpD2bMrI6mCbasSL/XrbQVhhxGNP7nrspZAo88+T3BPhh6fyW
	0dc0pX8gT3gH17aK8GngZupy7cd+LbA008crO5fTBn+x0931B76UMfCAuK871IZJTF+O
	7D80AVy5PPKE51e/eVhMeV7ZwV3LwGNcHZaPkatA7b5PNaCnqcU3z4x+bW/oiLrmSSfx
	+d+x/gS4VtPypTG4hM1qnKSH/Ifc/ejNnFeOR4ZAuUWiplJb5ttN9ongteHOqH2cY/uE
	Gaxei6WFJtvmV84TJE2kieK01rUxmDBhf2p4q5NEDfXKR/DX20HtO6qCXitpMiG12xEN
	GYhA==
X-Received: by 10.180.221.201 with SMTP id qg9mr38974862wic.5.1424108831492;
	Mon, 16 Feb 2015 09:47:11 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a5sm16615902wib.20.2015.02.16.09.47.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 09:47:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Feb 2015 18:47:19 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150216174719.GI2297@jama>
References: <1423651677-15387-1-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1423651677-15387-1-git-send-email-sven.ebenfeld@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] stunnel: Update to 5.10
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
X-List-Received-Date: Mon, 16 Feb 2015 17:47:11 -0000
X-Groupsio-MsgNum: 54328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2VXyA7JGja7B50zs"
Content-Disposition: inline

--2VXyA7JGja7B50zs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2015 at 11:47:57AM +0100, Sven Ebenfeld wrote:
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  .../recipes-support/stunnel/stunnel_4.56.bb            | 17 ------------=
-----
>  .../recipes-support/stunnel/stunnel_5.10.bb            | 18 ++++++++++++=
++++++
>  2 files changed, 18 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.=
bb
>  create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.10.=
bb

Causes new QA warnings:
stunnel-5.10: stunnel rdepends on libsystemd, but it isn't a build
dependency? [build-deps]
stunnel-5.10: stunnel rdepends on liblzma, but it isn't a build
dependency? [build-deps]

>=20
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_4.56.bb
> deleted file mode 100644
> index 74f2234..0000000
> --- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY =3D "Program for providing universal TLS/SSL tunneling service"
> -DESCRIPTION =3D "SSL encryption wrapper between remote client and local =
(inetd-startable) or remote server."
> -SECTION =3D "net"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df41ebed8571077706fee0b860c4d6=
666"
> -DEPENDS =3D "openssl zlib tcp-wrappers"
> -
> -RDEPENDS_${PN} +=3D "perl"
> -
> -SRC_URI =3D "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "ac4c4a30bd7a55b6687cbd62d864054c"
> -SRC_URI[sha256sum] =3D "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec=
8d2778a01c871293"
> -
> -inherit autotools
> -
> -EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_EXECPREFIXDIR}' --disable-fip=
s"
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.10.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_5.10.bb
> new file mode 100644
> index 0000000..0feacc1
> --- /dev/null
> +++ b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Program for providing universal TLS/SSL tunneling service"
> +DESCRIPTION =3D "SSL encryption wrapper between remote client and local =
(inetd-startable) or remote server."
> +SECTION =3D "net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D866cdc7459d91e092b174388fab8d=
283"
> +
> +DEPENDS =3D "openssl zlib tcp-wrappers"
> +
> +RDEPENDS_${PN} +=3D "perl"
> +
> +SRC_URI =3D "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "a0edda805eb7d6ea600a230fb0979ea1"
> +SRC_URI[sha256sum] =3D "032bfc1854f8a0b9e452343c36ec6b52c7e0daef0863423c=
6b13a61a7c92eb23"
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_EXECPREFIXDIR}' --disable-fip=
s"
> \ No newline at end of file
> --=20
> 1.8.1.rc3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2VXyA7JGja7B50zs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlTiLScACgkQN1Ujt2V2gBynDwCfYOuPRzgeTXIIctcmKKdFMnNZ
+mIAlRnAWdIGPlFgK48sDVBBRM40BXg=
=/yK4
-----END PGP SIGNATURE-----

--2VXyA7JGja7B50zs--
