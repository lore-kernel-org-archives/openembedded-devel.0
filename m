Received: from mail-gh0-f174.google.com ([209.85.160.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFosV-0007dZ-JC
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:50:33 +0100
Received: by mail-gh0-f174.google.com with SMTP id g15so206210ghb.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YKrAF6RLgFsYw2DUIu2j6q8LV7jxCIjsGiq3ABdFjvg=;
	b=QPTqX7ZkfKVojiXunbTHSWU/trN7OwX21CxqK6VUoKZzmmLADJwdS4aybxAeSn/Yw9
	qrE+C+9HNl5dAwI0PXolVXaPJLSovmxMeBbqZT+3YdewENl1RY5V7OptYibU+kkEXVVw
	glFb5YF9XB0aAr/EJG181fu+Il3+adf3EOOQ0XbgaqrxHUzXVsLbDPVmHK0Qudk4KLD5
	jjBausWWmY1lOwJ7bMcQdoM3d6eqoirMJ/itdgyhn8gbF6Ld+E631sSVUY+3TghjlaWd
	gu64iDTIGMzXB60sm352eEDEwEX/pVJl+aE3htkNSq60VMePuGeRFO5S+YTzgc4GKD2Q
	FyZA==
X-Received: by 10.236.132.65 with SMTP id n41mr15980718yhi.6.1363192410153;
	Wed, 13 Mar 2013 09:33:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k2sm36306710yhn.26.2013.03.13.09.33.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:33:29 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:33:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163322.GN3260@jama>
References: <1363126161-9828-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1363126161-9828-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libav: library packages shouldn't rdepend on libav package
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
X-List-Received-Date: Wed, 13 Mar 2013 16:50:57 -0000
X-Groupsio-MsgNum: 43527
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="20XocjIeMTCm4X0r"
Content-Disposition: inline

--20XocjIeMTCm4X0r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2013 at 11:09:21PM +0100, Andreas Oberritter wrote:
> Otherwise the libav executables (avplay, ffmpeg etc.) get dragged
> into the image, along with all their dependencies (e.g. SDL).

Applied, thanks!

>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-oe/recipes-multimedia/libav/libav.inc |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes=
-multimedia/libav/libav.inc
> index 388a567..54307af 100644
> --- a/meta-oe/recipes-multimedia/libav/libav.inc
> +++ b/meta-oe/recipes-multimedia/libav/libav.inc
> @@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET =3D "arm"
>  # faac faad2 lame schroedinger libgsm
>  DEPENDS =3D "x264 virtual/libsdl zlib libogg libvorbis libvpx libtheora =
${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
> =20
> -INC_PR =3D "r7"
> +INC_PR =3D "r8"
> =20
>  inherit autotools pkgconfig
> =20
> @@ -96,6 +96,7 @@ python populate_packages_prepend() {
>      do_split_packages(d, av_libdir, '^lib(.*)\.so\..*',
>                        output_pattern=3D'lib%s',
>                        description=3D'libav %s library',
> +                      extra_depends=3D'',
>                        prepend=3DTrue,
>                        allow_links=3DTrue)
> =20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--20XocjIeMTCm4X0r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAqlIACgkQN1Ujt2V2gBwsaQCgscF2frXlRL4mfq0wWWL3JPnV
kywAoIYcVWpwv1huuKV0IKk7oPuAqIT0
=EWbB
-----END PGP SIGNATURE-----

--20XocjIeMTCm4X0r--
