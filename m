Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0uod-0003cF-KN
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 15:08:39 +0100
Received: by mail-da0-f51.google.com with SMTP id i30so1297977dad.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 05:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Rdmpw5QFPgzVJ/dkwU2340f31PRGE4BoZdNxWIrdsuI=;
	b=0Tg1+n8CQRQd0K+uCBeL4kjkvxGquhUtg/y7YD4OikjdoeCcdcpEi0gGgRg/4Z/v3Y
	znPnhUbTe8k2E4/bTkumBcW+KAThC8Cb5kszoE5dexTKzS7wWOcGSTrHUS8YALjfVQtu
	NG+ZmSxxUgTOvCltUa/dMhlteWvJD33pflfUpfl9aIFWF9zqtsu+UmH/Augu+xQFqPxJ
	iVPIu5eCzRVsao4MoFQHh5AaJXWpQOCotNifmbP10YZjjT4vx21MTM8ID7Gg9++VLqhi
	3oeH6wYE5EOyeHZL5QCuCbBvbPDzc19pewAfPrvNvEMpMZbvHmQytns2btIMqpew2Eli
	SO7g==
X-Received: by 10.69.1.73 with SMTP id be9mr22713491pbd.116.1359640372385;
	Thu, 31 Jan 2013 05:52:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hs2sm5086899pbc.22.2013.01.31.05.52.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 05:52:51 -0800 (PST)
Date: Thu, 31 Jan 2013 14:52:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130131135249.GE2102@jama.dyndns-home.com>
References: <1359638269-28437-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1359638269-28437-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe][meta-gnome 1/2] mplayer2: add faad2 to DEPENDS
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
X-List-Received-Date: Thu, 31 Jan 2013 14:08:42 -0000
X-Groupsio-MsgNum: 42940
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Content-Disposition: inline

--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2013 at 02:17:48PM +0100, Martin Jansa wrote:
> * it's autodetected from sysroot after faad2 is built
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe=
/recipes-multimedia/mplayer/mplayer2_git.bb
> index 685a0bb..e980f55 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -3,7 +3,7 @@ SECTION =3D "multimedia"
>  HOMEPAGE =3D "http://www.mplayerhq.hu/"
>  DEPENDS =3D "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg x=
sp zlib \
>             libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
> -           libxv virtual/libx11 libass speex \
> +           libxv virtual/libx11 libass speex faad22 \

Second 2 is removed in branch.. I've sent wrong version.

>  	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lam=
e', d)}"
> =20
>  RDEPENDS_${PN} =3D "mplayer-common"
> --=20
> 1.8.1.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEKdzEACgkQN1Ujt2V2gBxphACgnDPmaXwQjUSGAq2d7rsqavP/
W64An1iltw/dTMnE9vOMP6BTCBx10eE4
=4WLt
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--
