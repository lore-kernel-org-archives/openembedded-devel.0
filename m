Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYQKl-0004mD-Sw
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 23:51:27 +0100
Received: by wgbds11 with SMTP id ds11so1818255wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 14:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=euD/cMCUvBxPDrvxcNIXpbnN7m5zkP8LEYtfl+BN2BY=;
	b=fJgIYU/KiEsGnt2l+hI6gOq0d9bbVvifRNqmsVfXFwZOMQO1LWLdxoSxlsW1LHk5pg
	jbxycnofYZ6vhWsjCVz9Fa6XQrph8RkM0Izpmdv6kEVYyOsEZfu+T46UTifPNTYMmQsS
	VmOxMAJjvrxa0YwZp8LO2XdaoudyWXgUmYoh4=
Received: by 10.227.207.136 with SMTP id fy8mr379304wbb.16.1323297878936;
	Wed, 07 Dec 2011 14:44:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z5sm5267483wix.5.2011.12.07.14.44.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 14:44:37 -0800 (PST)
Date: Wed, 7 Dec 2011 23:44:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111207224425.GA3761@jama.jama.net>
References: <1323262428-856-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1323262428-856-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-efl] places: add autopoint
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
X-List-Received-Date: Wed, 07 Dec 2011 22:51:28 -0000
X-Groupsio-MsgNum: 35974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 01:53:48PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-efl/recipes-efl/e17/places_svn.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-ef=
l/e17/places_svn.bb
> index 0abe138..103d720 100644
> --- a/meta-efl/recipes-efl/e17/places_svn.bb
> +++ b/meta-efl/recipes-efl/e17/places_svn.bb
> @@ -2,9 +2,13 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D344895f253c32f38e182dcaf30fe8=
a35"
> =20
>  PV =3D "0.1.0+svnr${SRCPV}"
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> =20
>  require e-module.inc
> =20
> +do_configure_prepend() {
> +	autopoint || touch config.rpath
> +}
> +
>  # Calls /usr/bin/eject for media
>  RRECOMMENDS_${PN} +=3D "eject"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7f7EkACgkQN1Ujt2V2gBzlrQCeKmDeNRyewqEnNMtaIU7xGt1c
rTIAn0doZskDUOX9xcTt/XM9K2PPbX8L
=T2My
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
