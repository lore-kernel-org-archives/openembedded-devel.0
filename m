Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOuNx-0001BV-5P
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 19:59:57 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so5243322wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0zOycqXqTyyLeCqLC61OXRxJLGrIe2jUYHukgWSePwY=;
	b=ej2QO41YnUMrLUw0fQ4BlV1vNyqJQKoJE5ouC9AUvoJQZ1icE/akVTnlBtd9yP59Yg
	0yRAHNGI1TqQvIYSh14oqpggYArh56Ou8GT2Kop1KOy/JnIZb0jpgVi+z+HYDyNbPUK1
	1Zv+OIf+w7kCM6Lt01uWtstHGYnB/lgmUXR6ZtfrUGLwBlS+YVlgjAJeTlw+pKZDlX4C
	/QqJrJ/ZYV6QZRfGeopNEW3/5MGLzcO1ecSJv2MLFGm3zf9s7KnbFsv37TnsNDaycmiz
	vuLJrSfxuwWEmDhauOO9O5okDt/FIkFggTZjQ6I9UdWwajojUTXdB2/8d1FuNzcKh5iz
	doPg==
Received: by 10.180.80.100 with SMTP id q4mr12902863wix.20.1350582397497;
	Thu, 18 Oct 2012 10:46:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm30558354wif.4.2012.10.18.10.46.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 10:46:32 -0700 (PDT)
Date: Thu, 18 Oct 2012 19:46:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121018174642.GC3087@jama.jama.net>
References: <1350579089-23342-1-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1350579089-23342-1-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] [meta-oe] libav: Fix git URI
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
X-List-Received-Date: Thu, 18 Oct 2012 17:59:57 -0000
X-Groupsio-MsgNum: 41141
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jousvV0MzM2p6OtC"
Content-Disposition: inline

--jousvV0MzM2p6OtC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 10:51:29AM -0600, Gary Thomas wrote:
> Specifying SRCREV and branch in the git SRC_URI confuses the bitbake
> fetcher.  This ends up with a saved tarball which contains neither
> the SRCREV nor the branch, which in turn means the git tree needs
> to be fetched every time even though a saved tarball has been created.

That's fetcher fault.

Branch is part of persistent db key for LOCALCOUNT, so this breaks
upgrade path.

Also AUTOREV wont work without branch specified in SRC_URI.

Fix bitbake fetcher instead.

Cheers,

=20
> Simply removing the branch (which is redundant anyway) from the SRC_URI
> makes everything happy.
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-multimedia/libav/libav_0.8.3.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb b/meta-oe/re=
cipes-multimedia/libav/libav_0.8.3.bb
> index 66a32c9..f9a2e06 100644
> --- a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
> +++ b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
> @@ -6,13 +6,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02"
> =20
>  PV =3D "0.8.3+git${SRCPV}"
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> =20
>  # When bumping SRCREV make sure you bump PR here and in dependant
>  # recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
>  # changes
>  SRCREV =3D "2fb4be9a99a2c2a9435339830e3d940171cc0d9b"
> -SRC_URI =3D "git://git.libav.org/libav.git;protocol=3Dgit;branch=3Drelea=
se/0.8"
> +SRC_URI =3D "git://git.libav.org/libav.git;protocol=3Dgit"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jousvV0MzM2p6OtC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCAQIEACgkQN1Ujt2V2gBxLawCglNoyKlRDh0NibrFO2g1P9XU2
Vv8An3dR6QBQNsbgamxmGiSw4CqfN0m8
=xz6k
-----END PGP SIGNATURE-----

--jousvV0MzM2p6OtC--
