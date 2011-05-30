Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRAHK-0006t2-M2
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 23:45:38 +0200
Received: by fxm19 with SMTP id 19so3127350fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 14:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=YeyYYde+QCE1bwwe/nRP5dWUYxyMDKX/6u7vOGmT44k=;
	b=YatYdxACeD11K/G6n1sRiV5tXOGOVnqf/do+a5EZG8OQ57l83JngCYTPL4qztkfCBW
	bB9Wv1B3K791bdtfJ7g7xEZqEWIRpKBZjeebZ/t9o3QL7uz7H6a8uOy3fW1ktYrywvZz
	pJw1TaOlYALALCJwbDQj4By/k/7k+QoyxYB4M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ZOGtrj03gzHhqECs5Gn4tWHUZceojYXzr/KiDiRKMuBo2FGixk6YtWPMaB9bVqzLGn
	ATE/TizhtlffdGSx56R647RXGyre4ETrsi6HTbladQXD9EH4mKeQNRlbS3CjYHzLNNkt
	3q9AwVPBXhk3slta59svEuPsBYjpQ+MoQzUqs=
Received: by 10.223.63.139 with SMTP id b11mr4768972fai.147.1306791750028;
	Mon, 30 May 2011 14:42:30 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id o23sm868210faa.33.2011.05.30.14.42.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 14:42:29 -0700 (PDT)
Date: Mon, 30 May 2011 23:42:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110530214218.GC6506@jama.jama.net>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
	<1306767263-29895-6-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1306767263-29895-6-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 05/17] xserver-xorg (1.10.0.902): enable xephyr
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
X-List-Received-Date: Mon, 30 May 2011 21:45:38 -0000
X-Groupsio-MsgNum: 32406
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline

--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2011 at 02:54:11PM +0000, Otavio Salvador wrote:
> ---
>  recipes/xorg-xserver/xserver-xorg_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/xorg-xserver/xserver-xorg_git.bb b/recipes/xorg-xser=
ver/xserver-xorg_git.bb
> index d18bdd7..95ade9c 100644
> --- a/recipes/xorg-xserver/xserver-xorg_git.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74df27b6254cc8=
8d2799b5f4f5949c00"
>  DESCRIPTION =3D "the X.Org X server"
>  DEPENDS +=3D "pixman libpciaccess openssl dri2proto glproto xorg-minimal=
-fonts font-util-native"
>  PV =3D "1.10.0.902"
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>  PR_append =3D "+gitr${SRCPV}"
>  PE =3D "2"
> =20
> @@ -32,7 +32,7 @@ do_install_prepend() {
>  PACKAGE_ARCH_ion =3D "${MACHINE_ARCH}"
>  XINERAMA =3D "${@['--disable-xinerama','--enable-xinerama'][bb.data.getV=
ar('MACHINE',d) in ['ion']]}"
> =20
> -EXTRA_OECONF +=3D " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdriv=
e --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disabl=
e-dmx"
> +EXTRA_OECONF +=3D " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl =
--disable-xfake --disable-xfbdev --disable-dmx"

as reported on IRC I still get ICE with gcc-4.5 from OE, with gcc-4.6
=66rom meta-oe it builds fine. So I've enabled it only for meta-oe and
will push it with 1.10.2 after more tests.

Cheers,

>  EXTRA_OECONF +=3D " --enable-dri2 --disable-unit-tests --disable-docs --=
disable-devel-docs"
> =20
>  export LDFLAGS +=3D " -ldl "
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3kDzoACgkQN1Ujt2V2gByDugCcCe47RV8KkWoXSAk8Kk5ooSOR
aNkAniXJVroCJjjeOvY0B8VDTkpJNQcF
=9AAD
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
