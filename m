Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyMw-00079s-6j
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:34:38 +0100
Received: by mail-da0-f48.google.com with SMTP id p8so2150595dan.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ltadCXSkOxnFI/hI4FKm8RjaNJsa5CTHxQDFS6+yw/c=;
	b=RKueQeZAZXYMAkGCeKFxY/aDH7KZf+aAk5tZ49U6VGzMc6sV31i9XN/g1Ve5ihgV4k
	3wBPL7ozXHA8M8ds6O5E3Suc9vtC559rMd788fVcKDq2Tn9vSA6Z/pbV3aBYinTbC9Ho
	VBXkDxb3bbE5HyXicXPqtxhn1cca/j63tLWy40SpxbDpc1We+Cq3Ky5AbgyWiyHozwRW
	0iqpKrzdy9y3PcWdcix5mrWmiG6pKP/T+l0Hhcllvms0XmNLYte5bfv7OAslqgqQHhwX
	24MSxRaW/h6Fg7l9EG2bGyFuGf3f7vN9hJFS5nGvous4joPiQrz3sKTEhUbXeXAKZ6A4
	m8Qw==
X-Received: by 10.66.72.105 with SMTP id c9mr2047129pav.177.1363943863875;
	Fri, 22 Mar 2013 02:17:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 1sm1721861pbg.18.2013.03.22.02.17.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:17:42 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:17:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322091740.GD3219@jama>
References: <1363516413-32548-1-git-send-email-koen@dominion.thruhere.net>
	<1363516413-32548-2-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1363516413-32548-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 2/2] opencv: switch to out-of-tree builds
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
X-List-Received-Date: Fri, 22 Mar 2013 09:34:39 -0000
X-Groupsio-MsgNum: 43645
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline

--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2013 at 11:33:33AM +0100, Koen Kooi wrote:
> This eliminates a few warnings from the configure step and makes sense in=
 general.

Both applied, thanks!

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-support/opencv/opencv_2.4.3.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb b/meta-oe/rec=
ipes-support/opencv/opencv_2.4.3.bb
> index 2114e77..916c8c5 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
> @@ -20,6 +20,10 @@ PR =3D "r2"
> =20
>  S =3D "${WORKDIR}/OpenCV-${PV}"
> =20
> +# Do an out-of-tree build
> +OECMAKE_SOURCEPATH =3D "${S}"
> +OECMAKE_BUILDPATH =3D "${WORKDIR}/build-${TARGET_ARCH}"
> +
>  EXTRA_OECMAKE =3D "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=3D${STAGING_LIBDIR}/$=
{PYTHON_DIR}/site-packages/numpy/core/include \
>                   -DBUILD_PYTHON_SUPPORT=3DON \
>                   -DWITH_FFMPEG=3DON \
> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIbQACgkQN1Ujt2V2gBwNdgCdGetbDNkAoH5GdMy8tEm0boqk
O8oAnjZ2o9UgrbfZXjAE0jjbI+nDiYiq
=4PGg
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--
