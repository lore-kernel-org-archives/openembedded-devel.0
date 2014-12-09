Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id F3F1671F23
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:25:27 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so403400wgg.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F6MLYGEchjFLgTZMHA5kuiad3C4MhOF0POV+ifgm2Q0=;
	b=xeUMUFZ5UbG1HEppFdg6EkLb/3PH4woqQnKbu64cOlm8R46cfdEnaRqEInfNdo+aVP
	ZsRjc028g8W6tLoWgyfsyqb+ww/6W2I+Zpq1CK4qaVSjNWB1eouCQK7LqnimxtR00P70
	v9gB9SKEGH0oTeBfWYP9M3R5c7VhBH0WeGLnyDzG/q59Q1VjxDQYGHqGNh/dvFxC8AuJ
	v14B140SiJYayuD9Fs/8bi/P87pqp7SQ8G3KFRKtnBKHhJNY5S0i85lG2jceRdh4CMw5
	Qd1V1d2TMVR7LuVtpMfN6isE1hTziStH41Gebig37ww4wGhr52gtI9bhvRt7tUaHRUiT
	rXRQ==
X-Received: by 10.194.85.197 with SMTP id j5mr3568682wjz.106.1418120727999;
	Tue, 09 Dec 2014 02:25:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jp3sm13222198wid.9.2014.12.09.02.25.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:25:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:25:25 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209102525.GF2470@jama>
References: <1417596619-28605-1-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1417596619-28605-1-git-send-email-sven.ebenfeld@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] stunnel: Update to Version 5.07
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
X-List-Received-Date: Tue, 09 Dec 2014 10:25:37 -0000
X-Groupsio-MsgNum: 53233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Content-Disposition: inline

--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2014 at 09:50:19AM +0100, Sven Ebenfeld wrote:
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 17 -----------=
------
>  meta-networking/recipes-support/stunnel/stunnel_5.07.bb | 15 +++++++++++=
++++
>  2 files changed, 15 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.=
bb
>  create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.07.=
bb

Causes new QA warnings:

stunnel-5.07: stunnel rdepends on liblzma, but it isn't a build
dependency? [build-deps]
stunnel-5.07: stunnel rdepends on libsystemd, but it isn't a build
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
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.07.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_5.07.bb
> new file mode 100644
> index 0000000..bf47aef
> --- /dev/null
> +++ b/meta-networking/recipes-support/stunnel/stunnel_5.07.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "SSL encryption wrapper between remote client and local (ine=
td-startable) or remote server."
> +SECTION =3D "net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D45e8e7befe9a0f7e0543b78dfeebd=
e20"
> +
> +DEPENDS =3D "openssl"
> +SRC_URI =3D "https://www.stunnel.org/downloads/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "c10edd84ecbc676a5a48c7e34ab3d1c5"
> +SRC_URI[sha256sum] =3D "505c6c63c4a20fc0cce8c35ef1ab7626c7b01071e3fca4ac=
6ea417afe8065309"
> +
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_INCDIR}' --disable-fips"
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

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSGzhUACgkQN1Ujt2V2gBwGgwCaAoFOohwx4m2YxZslPuwkKNW7
SjoAoKeLLlsmiNlgvlg7cfqqNVhSUzH1
=U4xf
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--
