Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QlcYm-0002HL-RF
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 10:00:12 +0200
Received: by ewy5 with SMTP id 5so175807ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 00:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LHXxxFg238HjReqgjzRKL72Qrll11SLo7eR4/Q3ND44=;
	b=mYnkUDlt28/G6+D7nK27bssujmTXYhNusTLu45Cm2N4Shq3cLti+S4zg7huR0qPwnI
	zELdcufatrOu9M6jQBra/O9w6xCVG3pfCFERnW45fy51ttt/4gRudYNBF1XH8eVKDWS2
	qNWKZ2WWQJXwRkQq5MfW9WJZ2WAUm97gkfxD8=
Received: by 10.205.82.5 with SMTP id aa5mr866625bkc.33.1311666959948;
	Tue, 26 Jul 2011 00:55:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g11sm75793bku.49.2011.07.26.00.55.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 00:55:58 -0700 (PDT)
Date: Tue, 26 Jul 2011 09:55:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110726075550.GE25533@jama.jama.net>
References: <1311666362-4023-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1311666362-4023-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFCv2 meta-efl] e(fl).bbclass: don't override PACKAGES, but add to it
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
X-List-Received-Date: Tue, 26 Jul 2011 08:00:12 -0000
X-Groupsio-MsgNum: 33329
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Content-Disposition: inline

--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2011 at 09:46:02AM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by:  Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta-efl/classes/e.bbclass   |    6 +++---
>  meta-efl/classes/efl.bbclass |    4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
> index 88a1f6a..c803399 100644
> --- a/meta-efl/classes/e.bbclass
> +++ b/meta-efl/classes/e.bbclass
> @@ -18,9 +18,9 @@ do_configure_append() {
>  export CURL_CONFIG =3D "${STAGING_BINDIR_CROSS}/curl-config"
>  export FREETYPE_CONFIG =3D "${STAGING_BINDIR_CROSS}/freetype-config"
> =20
> -# This construction is stupid, someone with more E knowledge should chan=
ge it to =3D+ or something
> -# And it's in efl.bbclass as well....
> -PACKAGES =3D "${PN}-dbg ${PN}-themes ${PN} ${PN}-dev ${PN}-doc ${PN}-lib=
 ${PN}-static"
> +PACKAGES =3D+ "${PN}-themes"
> +PACKAGES +=3D "${PN}-lib"
> +
>  FILES_${PN}-lib =3D "${libdir}/lib*.so.*"
>  FILES_${PN}-themes =3D "${datadir}/${PN}/themes ${datadir}/${PN}/data ${=
datadir}/${PN}/fonts ${datadir}/${PN}/pointers ${datadir}/${PN}/images ${da=
tadir}/${PN}/users ${datadir}/${PN}/images ${datadir}/${PN}/styles"
>  FILES_${PN}-dev +=3D "${includedir} ${libdir}/lib*.so"
> diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
> index 2dc6fc2..f90dc1c 100644
> --- a/meta-efl/classes/efl.bbclass
> +++ b/meta-efl/classes/efl.bbclass
> @@ -19,8 +19,8 @@ do_install_prepend () {
>  	done
>  }
> =20
> -# This construction is stupid, someone with more E knowledge should chan=
ge it to =3D+ or something
> -PACKAGES =3D "${PN}-dbg ${PN} ${PN}-themes ${PN}-dev ${PN}-doc ${PN}-tes=
ts ${PN}-static"
> +PACKAGES =3D+ "${PN}-themes"
> +PACKAGES +=3D "${PN}-tests"
> =20
>  FILES_${PN} =3D "${libdir}/*.so.* \
>                 ${libdir}/edje/modules/${PN}/*/module.so \
> --=20
> 1.6.6.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4ucwYACgkQN1Ujt2V2gByuNgCfYgOtStc9WisrLKw+kKuvz6sm
YC8An0pPDUrxfgFsgf5P1qF67Ph0ade9
=++40
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--
