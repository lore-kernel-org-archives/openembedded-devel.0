Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 277CE716CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 13:41:09 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l18so13190065wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qrqbYYhAGBqmLUgK9WAFtyXRBrhuxJ8VM78ZlGIpc80=;
	b=cMoKPXknh6ObXyu7Oj9RVYJVUPhDvAjGbHc3dHBgZTKLskFx9wfWO3T3WnpozNs/OZ
	tGaxWGk5cVdv9FhkYJjgpGGaEU2vhO5FHenhE5WU1SLvuMpS19tkiPulOqLZaDCMBYXj
	NDtdO/nzC3jRmhFRNzp0WWFceu3swoV+Zhp/hkd/svBnj4eeeaMaGpY11ho7t2uICiSt
	JqyhQ7nQ3fUKjvI86ouwwC2dGx55M/w3zchZCrTP82EsjJvBlLdPlbT5r4HhVYw5I8ay
	gPl7JaUyoF7mODHSLMxVYcDlJOcfuilFF1bb//QAXjCGIxWFNHkX0/4ca0+WzR3/Y4fU
	jlIA==
X-Received: by 10.194.61.51 with SMTP id m19mr19119653wjr.39.1424439670109;
	Fri, 20 Feb 2015 05:41:10 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fs8sm2456692wib.8.2015.02.20.05.41.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 05:41:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Feb 2015 14:41:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150220134113.GD2322@jama>
References: <1424160094-5937-1-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1424160094-5937-1-git-send-email-sven.ebenfeld@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] stunnel: Update to version 5.10
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
X-List-Received-Date: Fri, 20 Feb 2015 13:41:13 -0000
X-Groupsio-MsgNum: 54428
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d8Lz2Tf5e5STOWUP"
Content-Disposition: inline

--d8Lz2Tf5e5STOWUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2015 at 09:01:34AM +0100, Sven Ebenfeld wrote:
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  .../recipes-support/stunnel/stunnel_4.56.bb          | 17 --------------=
---
>  .../recipes-support/stunnel/stunnel_5.10.bb          | 20 ++++++++++++++=
++++++
>  2 files changed, 20 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.=
bb
>  create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.10.=
bb
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
> index 0000000..5a24523
> --- /dev/null
> +++ b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Program for providing universal TLS/SSL tunneling service"
> +DESCRIPTION =3D "SSL encryption wrapper between remote client and local =
(inetd-startable) or remote server."
> +SECTION =3D "net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D866cdc7459d91e092b174388fab8d=
283"
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
> +
> +PACKAGECONFIG ??=3D "systemd"

Please respect systemd in DISTRO_FEATURES, otherwise you cause this
error in "bitbake world"
ERROR: Nothing PROVIDES 'systemd' (but build/meta-oe/meta-networking/recipe=
s-support/stunnel/stunnel_5.10.bb DEPENDS on or otherwise requires it)
ERROR: systemd was skipped: 'systemd' not in DISTRO_FEATURES

> +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
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

--d8Lz2Tf5e5STOWUP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTnOXkACgkQN1Ujt2V2gBwtnwCgkhh3ifL9vFsVXFK9SpXCHvY/
OyMAn1ZxI3o5h6KKwbm+lQFYgZgkldrC
=v9Z7
-----END PGP SIGNATURE-----

--d8Lz2Tf5e5STOWUP--
