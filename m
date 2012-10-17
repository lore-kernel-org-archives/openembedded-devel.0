Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOSOd-00048r-Lx
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 14:06:48 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so501599wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vATQ4JpD5gtk+ZL5h6rM3Dpka5O1xSQdCzt4c/ag3Vk=;
	b=wNmN+DnqPUb7xOtqEIUj58q5/jJNRDiBPaX0N5bzl6pQ7oggjjZqXqb/D5vXIIMMmu
	mUH7SZNI2zBzQ4LqsLc7sWu5W5MZRcyYhN3CnnJh6fEeZWC4WHFg1OtipFSI0iHYerPJ
	OTjmgJgx2OA3wli/w+Y70rwKaGPOA8oAXtatiXD9eVwlQLhyis60RfMhZjSGaFw1ISIv
	13moCXIdDNem/nIyFOR8tiGbO3jorcOcw4JNNGuuKRxHcZevpXDixGI7OqPDXnUUCu7v
	D7E7rSpXMUR/GHZa7Cr6CuNnmVwYZsa+Ab94xaczOljkORM2KOvFe1SRfQPIb1tOKkEB
	w2eQ==
Received: by 10.180.91.169 with SMTP id cf9mr3696497wib.1.1350474809462;
	Wed, 17 Oct 2012 04:53:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm27280962wib.10.2012.10.17.04.53.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 04:53:27 -0700 (PDT)
Date: Wed, 17 Oct 2012 13:53:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121017115334.GI3405@jama.jama.net>
References: <1350474405-3421-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1350474405-3421-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gst123: add package
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
X-List-Received-Date: Wed, 17 Oct 2012 12:06:48 -0000
X-Groupsio-MsgNum: 41118
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline

--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2012 at 12:46:45PM +0100, Ross Burton wrote:
> gst123 is useful for testing as it simply uses PlayBin, but can display t=
he
> pipeline being used for QA purposes.

Missing subject prefix.

Cheers,

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../recipes-multimedia/gstreamer/gst123_0.3.1.bb    |   19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/gstreamer/gst123_0.3.1.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/gstreamer/gst123_0.3.1.bb b/meta-=
oe/recipes-multimedia/gstreamer/gst123_0.3.1.bb
> new file mode 100644
> index 0000000..b543958
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/gstreamer/gst123_0.3.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "gst123"
> +DESCRIPTION =3D "Flexible command line player in the spirit of ogg123 an=
d mpg123, based on GStreamer"
> +HOMEPAGE =3D "http://space.twc.de/~stefan/gst123.php"
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2 \
> +                    file://src/gst123.cc;beginline=3D1;endline=3D19;md5=
=3D05d2f5d54b985b986c26af931d2084f8"
> +
> +DEPENDS =3D "libx11 gstreamer gtk+ ncurses"
> +
> +PR =3D "r0"
> +
> +# This is actually the commit after 0.3.1 which fixes a display bug
> +SRCREV =3D "3e46d2e501da68d929bb5f26900a292a5fc04a1f"
> +
> +SRC_URI =3D "git://space.twc.de/public/git/gst123.git;protocol=3Dhttp"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB+nD4ACgkQN1Ujt2V2gBzYHQCdH6OMl8XwAjhu4wtiFdY1nSc0
+8YAoIa/1if/HvOoTjl3Uuj985Ic9dBX
=Wjb9
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
