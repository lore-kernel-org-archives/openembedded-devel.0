Received: from mail-ye0-f178.google.com ([209.85.213.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFosp-0007eq-MD
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:50:35 +0100
Received: by mail-ye0-f178.google.com with SMTP id q7so206073yen.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rTvUZRoyeL1L6nUWIO4BHYpUJEs44cahX+H+zV0QZLU=;
	b=pVn6xRiSl2Qrlkjj0KoqRGKH2Z13z4xQ8i8iiEGlqi6/L+pFzZ7eLw9izruJRt+Nd+
	wWJBlP+ASlkWlG8CN8zgp74gviHh8QMBEVb+f6Jkubp11HhOW20KEUm6WAWkXaW2JsjC
	fQiJi7IRmZ81Wbvl3sodcXocCdmwzF5hfC6BDyFOEnRzy1fNEQl54WXfFyh2cP1BfxsX
	wYD0S1liBG/pv5CFBdrbL78XH92WPO88G7oyW32LOWtKyTFaPCbw86KMsCPrOLj1nl9K
	j0WD6qu5Z/C5DJq7HmkmXUfYp5Dp3zQRgJoClGi/+5un37FL5JActVPnpQ76VKi7dipQ
	QauQ==
X-Received: by 10.236.161.7 with SMTP id v7mr15848974yhk.201.1363192430408;
	Wed, 13 Mar 2013 09:33:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r43sm36289478yhl.19.2013.03.13.09.33.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:33:49 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:33:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163342.GO3260@jama>
References: <1363070578-8438-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1363070578-8438-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] lmsensors: Upgrade 3.3.2 -> lmsensors_3.3.3
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
X-List-Received-Date: Wed, 13 Mar 2013 16:50:57 -0000
X-Groupsio-MsgNum: 43526
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nG9yj4eE4W6Oba0"
Content-Disposition: inline

--+nG9yj4eE4W6Oba0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2013 at 11:42:58PM -0700, Khem Raj wrote:
> Fix build with mutlilib enabled architectures
> when we have libdir !=3D /usr/lib it always would
> not package libsensors.* since they will get
> installed into /usr/lib and ignored. So define
> LIBDIR properly

Applied, thanks!

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{lmsensors_3.3.2.bb =3D> lmsensors_3.3.3.bb}     |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-support/lm_sensors/{lmsensors_3.3.2.bb =3D> lmsen=
sors_3.3.3.bb} (96%)
>=20
> diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb b/meta=
-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
> similarity index 96%
> rename from meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
> rename to meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
> index 1a1ef2d..4f15535 100644
> --- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
> +++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
> @@ -11,11 +11,8 @@ SRC_URI =3D "http://dl.lm-sensors.org/lm-sensors/relea=
ses/lm_sensors-${PV}.tar.bz2
>             file://fancontrol.init \
>             file://sensord.init \
>  "
> -
> -SRC_URI[md5sum] =3D "f357ba00b080ab102a170f7bf8bb2578"
> -SRC_URI[sha256sum] =3D "f13dd885406841a7352ccfb8b9ccb23c4c057abe3de4258d=
a5444c149a9e3ae1"
> -
> -PR =3D "r1"
> +SRC_URI[md5sum] =3D "73c2fcccdab6049d289c5e0c596192a1"
> +SRC_URI[sha256sum] =3D "ecc91ba3d918e96fb7d5eb9acce978af803b130e0b33b08d=
5ea05b2bfca84955"
> =20
>  inherit update-rc.d
> =20
> @@ -29,6 +26,7 @@ S =3D "${WORKDIR}/lm_sensors-${PV}"
> =20
>  EXTRA_OEMAKE =3D 'LINUX=3D${STAGING_KERNEL_DIR} EXLDFLAGS=3D"${LDFLAGS}"=
 \
>  		MACHINE=3D${TARGET_ARCH} PREFIX=3D${prefix} MANDIR=3D${mandir} \
> +	        LIBDIR=3D${libdir} \
>  		CC=3D"${CC}" AR=3D"${AR}"'
> =20
>  do_compile() {
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

--+nG9yj4eE4W6Oba0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAqmYACgkQN1Ujt2V2gBwMCQCcDm5ifHdpWjWJG0s9CJAlmjsl
5wYAmgOufaH2oFIJ4uNYNMoRu/TgA8Cz
=wHQ2
-----END PGP SIGNATURE-----

--+nG9yj4eE4W6Oba0--
