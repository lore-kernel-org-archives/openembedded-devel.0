Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 25D3A6E881
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2014 18:06:48 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so4432013eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2014 10:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UgYi4s6bmrFneTf3iDS/vllH5+6fEUUyxvr3rqzQ//U=;
	b=VSv77QFq3m0lYCq1QkyKFd1na9lHAZ0/p4YEnmqd1slUyVDkfEF9f8v5BEzn0r4VqV
	xWhIpZmbzOwpJ7kQriz97O1eqEIqWCEjM2nZ2c6lESmmTKZ8VisFHOnDJ2pdfMGDkssi
	eMhHeAAehA2McW4PxZPRWNXX9Vmztc5dxzHiuYL8uQs2yjCKo3rgnzJjGDOpGY++xLdM
	4hNXfL8MCu+9D1zb3imrDg2fzeY4YhccQMTQrNTQX1eIAUBbW5wMgWRN8IJvwQtHSbfG
	s5YoVMs7hmDEwFsvhoEGLGWyNQaF63RfkHpCcnn0WhJsHxi//Mn3sS2uUhJ7YqdVv2Eh
	Zh2Q==
X-Received: by 10.15.45.194 with SMTP id b42mr4093679eew.103.1391537208997;
	Tue, 04 Feb 2014 10:06:48 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id s46sm26957119eeb.0.2014.02.04.10.06.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Feb 2014 10:06:47 -0800 (PST)
Date: Tue, 4 Feb 2014 19:07:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140204180700.GJ3698@jama>
References: <1388821532-10851-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1388821532-10851-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-browser][PATCH] Update after toplevel LICENSE file checksum change
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
X-List-Received-Date: Tue, 04 Feb 2014 18:06:50 -0000
X-Groupsio-MsgNum: 48044
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ucgz5Oc/kKURWzXs"
Content-Disposition: inline

--Ucgz5Oc/kKURWzXs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 04, 2014 at 08:45:32AM +0100, Martin Jansa wrote:
> * it would be good time to remove ugly hack now instead of this change

I guess I can apply it myself, but ping :)

I thought it was already applied, but now I've rebased meta-browser and
noticed that I still have this only locally.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-mozilla/firefox-addon/firefox-addon.inc | 2 +-
>  recipes-mozilla/firefox-l10n/firefox-l10n.inc   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-mozilla/firefox-addon/firefox-addon.inc b/recipes-mo=
zilla/firefox-addon/firefox-addon.inc
> index 24e0c18..5bbd626 100644
> --- a/recipes-mozilla/firefox-addon/firefox-addon.inc
> +++ b/recipes-mozilla/firefox-addon/firefox-addon.inc
> @@ -7,7 +7,7 @@ RDEPENDS_${PN} =3D "firefox"
>  LICENSE =3D "MPLv1 | GPLv2+ | LGPLv2.1+"
> =20
>  # Ugly hack for now; we need to check license per recipe later
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937=
c2bc47fbc49d690"
> =20
>  S =3D "${WORKDIR}"
> =20
> diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozi=
lla/firefox-l10n/firefox-l10n.inc
> index 2369318..945fe90 100644
> --- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
> +++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
> @@ -7,7 +7,7 @@ RDEPENDS_${PN} =3D "firefox"
>  LICENSE =3D "MPLv1 | GPLv2+ | LGPLv2.1+"
> =20
>  # Ugly hack for now; we need to check license per recipe later
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937=
c2bc47fbc49d690"
> =20
>  LANGUAGE =3D "${@get_language_name('${PN}')}"
>  INC_PR =3D "r2"
> --=20
> 1.8.4.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ucgz5Oc/kKURWzXs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLxLEQACgkQN1Ujt2V2gBz7BgCdFXzsvb20tZegD3U5QLWfCpzA
puUAoIqowZJVjJYEQ4zjwdKoeERhxGzD
=nYjv
-----END PGP SIGNATURE-----

--Ucgz5Oc/kKURWzXs--
