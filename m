Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QlbhN-00037q-9S
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 09:05:06 +0200
Received: by ewy5 with SMTP id 5so138878ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 00:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I+NkKMmND25P+1HLXKgEeacoTnQu025hTNRbRItRXPE=;
	b=I/g75pCquB6YLbDmui7T2DmCjWEmhOkcJhIosWkwLDNOODrugxGn0aY7pelk19+imz
	CyXis/6Z/p1wo67UNpq0SBHRnB3fMhVKekVeZ9+OIthfKQcYu5iCk9vhHpkZVXxBMEfF
	HKx0EtSocDmBVh9xcq4WAVaJuzpLcLR0E94Cw=
Received: by 10.204.144.199 with SMTP id a7mr1727135bkv.287.1311663648188;
	Tue, 26 Jul 2011 00:00:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f12sm60556bkt.36.2011.07.26.00.00.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 00:00:46 -0700 (PDT)
Date: Tue, 26 Jul 2011 09:00:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110726070039.GD25533@jama.jama.net>
References: <1311663177-19331-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1311663177-19331-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC meta-efl] e(fl).bbclass: don't override PACKAGES, but add to it
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
X-List-Received-Date: Tue, 26 Jul 2011 07:05:06 -0000
X-Groupsio-MsgNum: 33324
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Content-Disposition: inline

--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2011 at 08:52:57AM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-efl/classes/e.bbclass   |    6 +++---
>  meta-efl/classes/efl.bbclass |    4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
> index 88a1f6a..ebf1da8 100644
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
> +PACKAGES +=3D "${PN}-lib ${PN}-tests"

${PN}-tests wasn't in original PACKAGES

>  FILES_${PN}-lib =3D "${libdir}/lib*.so.*"
>  FILES_${PN}-themes =3D "${datadir}/${PN}/themes ${datadir}/${PN}/data ${=
datadir}/${PN}/fonts ${datadir}/${PN}/pointers ${datadir}/${PN}/images ${da=
tadir}/${PN}/users ${datadir}/${PN}/images ${datadir}/${PN}/styles"
>  FILES_${PN}-dev +=3D "${includedir} ${libdir}/lib*.so"
> diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
> index 2dc6fc2..c831439 100644
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
> +PACKAGES +=3D "${PN}-lib ${PN}-tests"

${PN}-lib wasn't in original PACKAGES

>  FILES_${PN} =3D "${libdir}/*.so.* \
>                 ${libdir}/edje/modules/${PN}/*/module.so \
> --=20
> 1.6.6.1

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4uZhcACgkQN1Ujt2V2gBzqGQCeIvlTl1kCB51a0019kUdVwpl4
zV8An25qx1P5tEHZKrnVcrNUAHk3HaD5
=Vuol
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
