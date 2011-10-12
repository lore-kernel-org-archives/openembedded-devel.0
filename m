Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDsEM-0001L0-E4
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 08:23:54 +0200
Received: by eyd9 with SMTP id 9so382151eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 23:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=l1eDC8iznvn+jxvPM/HBwVAztag+u28uJI6TfXS9jKY=;
	b=IkgsGKvE3zvb8QJM6l3LxRsWljE1rGxshjTQ7P2ESFKZXK21jmavK6oiO0iuTcqc5a
	8834L5BtE4daveGpzKxkn70QR/Au1Mr073/5XDiYXL6mbTX/CkJy+iCld3Cko0JNrsWQ
	mPF7cDEDdD9LHY9cdO7TNq4JXfw6vvfMlPbMY=
Received: by 10.223.15.10 with SMTP id i10mr44588371faa.17.1318400291557;
	Tue, 11 Oct 2011 23:18:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c1sm1978216fab.15.2011.10.11.23.18.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 23:18:10 -0700 (PDT)
Date: Wed, 12 Oct 2011 08:18:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111012061804.GH27073@jama.jama.net>
References: <1318384647-17338-1-git-send-email-raj.khem@gmail.com>
	<1318384647-17338-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1318384647-17338-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 2/2] mesa, xorg-xserver: include glx-use-tls.inc instead of inheriting glx-use-tls class
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
X-List-Received-Date: Wed, 12 Oct 2011 06:23:54 -0000
X-Groupsio-MsgNum: 34658
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AzNpbZlgThVzWita"
Content-Disposition: inline

--AzNpbZlgThVzWita
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 06:57:27PM -0700, Khem Raj wrote:
> To match oe-core

Both should be removed completely
http://patches.openembedded.org/patch/12633/
http://patches.openembedded.org/patch/12627/

but needs the rest of Xorg patchset in oe-core
http://patches.openembedded.org/patch/12933/

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-graphics/mesa/mesa-common.inc      |    3 +--
>  .../xorg-xserver/xorg-xserver-common.inc           |    4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/mesa/mesa-common.inc b/meta-oe/reci=
pes-graphics/mesa/mesa-common.inc
> index 2e6b599..9b80ecd 100644
> --- a/meta-oe/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta-oe/recipes-graphics/mesa/mesa-common.inc
> @@ -25,8 +25,7 @@ EXTRA_OECONF =3D "--enable-glu \
>                  --disable-glw \
>                  --disable-glut \
>  	       "
> -
> -inherit glx-use-tls
> +include recipes-graphics/mesa/glx-use-tls.inc
> =20
>  PACKAGES =3D+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa =
libosmesa-dev libgl libgl-dev"
>  FILES_libegl =3D "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
> diff --git a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.in=
c b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
> index 0b4a854..13bfac7 100644
> --- a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
> +++ b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
> @@ -36,8 +36,8 @@ SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_P=
N}-${PV}.tar.bz2"
> =20
>  S =3D "${WORKDIR}/${XORG_PN}-${PV}"
> =20
> -inherit autotools pkgconfig glx-use-tls
> -
> +inherit autotools pkgconfig
> +include recipes-graphics/mesa/glx-use-tls.inc
>  EXTRA_OECONF +=3D " --enable-xcalibrate \
>                    --enable-kdrive \
>                    --enable-xephyr \
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AzNpbZlgThVzWita
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6VMRsACgkQN1Ujt2V2gBwgPwCeKdasHJwIBEUqhoAOUto+XFV2
UW8AnimlQ+kqwdYUogM7Vf9d3KrI204l
=4+So
-----END PGP SIGNATURE-----

--AzNpbZlgThVzWita--
