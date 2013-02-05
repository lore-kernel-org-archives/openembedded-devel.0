Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2frx-0008NQ-Qj
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 11:35:18 +0100
Received: by mail-wi0-f177.google.com with SMTP id hm14so4012689wib.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 02:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=a9A2nGpsGMZa34paKqxqHZputtaqXX2hnpBVb8hlr7Y=;
	b=jo8yG9waLGASr0bft0x7eid7hKlCl6blZjSIWwF9UTty1wr7xNcYtEwNcCzoWl+CTn
	BLgx1sicfzpCxtwSH2BAxPIiNH+mT2wA5rszPWJMrocdznc+0SCDkf6Z6ZkNZf6cnIky
	m2SfTZn2aL+Y+6Rz4z3ne+hD40rAzg9spvaOlfzcwGyZIUoAMFHLnjleaPAcShR3zIQX
	ETrKujUyDlLxhVyFofZS837EroN1Ova6Efjlk0nTKLsMDPproyttzrETiUIp2Qj4yH+L
	zbJdH62viCuB3aYDXK72gH48uYUkmhfj0zgt8AGWYveblvKP4XuA8Knf4HuAkDsqkwAC
	jEnw==
X-Received: by 10.194.178.33 with SMTP id cv1mr40952578wjc.46.1360059568668;
	Tue, 05 Feb 2013 02:19:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w5sm5472735wif.11.2013.02.05.02.19.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 02:19:28 -0800 (PST)
Date: Tue, 5 Feb 2013 11:19:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205101927.GJ3271@jama>
References: <1359371413-12437-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1359371413-12437-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] xf86-video-geode: Update to 2.11.14
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
X-List-Received-Date: Tue, 05 Feb 2013 10:35:20 -0000
X-List-Received-Date: Tue, 05 Feb 2013 10:35:20 -0000
X-Groupsio-MsgNum: 42996
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UTZ8bGhNySVQ9LYl"
Content-Disposition: inline

--UTZ8bGhNySVQ9LYl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 09:10:13AM -0200, Otavio Salvador wrote:
> Change-Id: Ia42af02f16e22f6d1ecd9e437dc875c8e267a84a
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Merged, thanks

> ---
>  .../xorg-driver/xf86-video-geode_2.11.12.bb        |   12 ------------
>  .../xorg-driver/xf86-video-geode_2.11.14.bb        |   12 ++++++++++++
>  2 files changed, 12 insertions(+), 12 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.12.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.14.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.1=
2.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
> deleted file mode 100644
> index aa1dc29..0000000
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require recipes-graphics/xorg-driver/xorg-driver-video.inc
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df8ad89d9d9a024f19d7dcc5acb044=
a42"
> -
> -DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
> -PR =3D "${INC_PR}.1"
> -
> -SRC_URI[md5sum] =3D "a99c521db731c2f1df309057a8465e4c"
> -SRC_URI[sha256sum] =3D "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766=
089db1103b1c2d92"
> -
> -COMPATIBLE_HOST =3D "i.86.*-linux"
> -
> -RDEPENDS_${PN} +=3D "xserver-xorg-module-exa"
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.1=
4.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb
> new file mode 100644
> index 0000000..fdc49b2
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb
> @@ -0,0 +1,12 @@
> +require recipes-graphics/xorg-driver/xorg-driver-video.inc
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De7f3e39474aeea5af381a8e103daf=
c36"
> +
> +DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "c9a4e1c5438240e5bdce332f92df9163"
> +SRC_URI[sha256sum] =3D "4c750b46c932934faa008919922f5ac8a572afcfe265ac8d=
7c203b8167a0cfcc"
> +
> +COMPATIBLE_HOST =3D "i.86.*-linux"
> +
> +RDEPENDS_${PN} +=3D "xserver-xorg-module-exa"
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

--UTZ8bGhNySVQ9LYl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEQ3K8ACgkQN1Ujt2V2gBxgWwCeOGcSMDEKj+o8lJfV8kWQr9YJ
gRgAn0/qjgAmj4XZpeqzfx+tKvlqrLui
=tfjb
-----END PGP SIGNATURE-----

--UTZ8bGhNySVQ9LYl--
