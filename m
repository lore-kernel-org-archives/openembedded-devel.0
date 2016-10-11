Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id B356060079
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 08:24:43 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id x79so2376922lff.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mIY8dgHc9v0xX8X2S1A55TidQ08n7VpnaNRFrBWgUWI=;
	b=OiDjsIwRi0LfaNv1lx+bB4dpXf8Ofn7n2k9svfWBgdiVH5mhpP7/HPa8wVCqRjhRkU
	USZqLuwDTCh3W4tpmY7cQ+049Q1tpOeJy5advbhj3ujipgGoCrerZfShZ+twRHyZDI3R
	T5S21PHgNygPM5cCRf1VoHTNev1PtPjdfwI5UJ1ZH4kdNK/QQa+WjeRk9I/uS9W2ZhCB
	ZFo1DqxIeCqplZkR/2+3xxXV2em/Oofqx9A/qEF1uX+pX581VatVpqWExD86r/c5JHAE
	sdow+GpOhYqhy+/aRlDGVNPKfFF91NcPvxtFx8TFG9Ko5lC/fBlIWt19unRefbjm1C+Y
	/llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mIY8dgHc9v0xX8X2S1A55TidQ08n7VpnaNRFrBWgUWI=;
	b=hyoDJGMufshq72KcZRe6wI4GiWrNom55Ebbk0K6hy8/9EiXxWlFxCkqUr3i8KaUbNz
	ZYeQ1lWc4oh+7KpsmJQ10Y+uQzSdrA/6nLI/BwyJJQzxV/I+JLpgiewL9xrZa584zPHj
	rjbI/qJINB5FV6IucQoc59luLIqiApLdYdnNCXSeM1zhBanycJpRsjyY8XQWPFwehYKm
	G9sGC4NQtPm1j+QHNS8nLuKytqGmIKBD3k3KS6dCUMKJ3shl/eP7IvOj5OjfuUw8VDPs
	17N0IeqZAvwK0gi+53Hbgo0Rlup7PzsKEh2KMtoC5B0z2yOe41GvugtRaXxzoyDB16sf
	Evww==
X-Gm-Message-State: AA6/9Rkqnp1iC3G/rHFWPXLaFj0MDLoMRpN6d+XvoUKxiy5KAc9b+3snFeFjQS6NHgJ30w==
X-Received: by 10.194.142.116 with SMTP id rv20mr3348369wjb.184.1476174283897; 
	Tue, 11 Oct 2016 01:24:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id p9sm4411818wjs.11.2016.10.11.01.24.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Oct 2016 01:24:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Oct 2016 10:24:43 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161011082443.GA2929@jama>
References: <1476117065-12316-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1476117065-12316-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [PATCH][meta-oe] opencv: fix packaging and install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Oct 2016 08:24:44 -0000
X-Groupsio-MsgNum: 63439
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2016 at 05:31:05PM +0100, Ross Burton wrote:
> The OpenCV*.cmake files and the static library should be in the opencv-dev
> package, not opencv-apps.

Why not PN-staticdev?

> There is no need to specify files for PN-dbg as they're automatically fou=
nd, so
> remove the FILES_PN-dbg assignment.
>=20
> Conditionalise the installation of the example and tutorial binaries so it
> doesn't abort if samples are disabled.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.1.bb
> index da11316..2136b07 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -116,15 +116,14 @@ PACKAGES_DYNAMIC +=3D "^libopencv-.*"
> =20
>  FILES_${PN} =3D ""
>  FILES_${PN}-apps =3D "${bindir}/* ${datadir}/OpenCV"
> -FILES_${PN}-dbg +=3D "${libdir}/.debug"
> -FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
> +FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV=
/*.cmake ${datadir}/OpenCV/3rdparty/lib/*.a"
>  FILES_${PN}-doc =3D "${datadir}/OpenCV/doc"
>  FILES_${PN}-java =3D "${datadir}/OpenCV/java"
>  FILES_${PN}-java-dbg =3D "${datadir}/OpenCV/java/.debug/"
>  FILES_${PN}-samples =3D "${datadir}/OpenCV/samples/"
>  FILES_${PN}-samples-dbg =3D "${datadir}/OpenCV/samples/bin/.debug"
> =20
> -INSANE_SKIP_${PN}-apps =3D "staticdev"
> +INSANE_SKIP_${PN}-dev =3D "staticdev"
>  INSANE_SKIP_${PN}-java =3D "libdir"
>  INSANE_SKIP_${PN}-java-dbg =3D "libdir"
> =20
> @@ -144,6 +143,8 @@ do_install_append() {
>          rm -rf ${D}/usr/lib
>      fi
> =20
> -    install -d ${D}${datadir}/OpenCV/samples/bin/
> -    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples=
/bin/
> +    if ${@bb.utils.contains("PACKAGECONFIG", "samples", "true", "false",=
 d)}; then
> +        install -d ${D}${datadir}/OpenCV/samples/bin/
> +        cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/sam=
ples/bin/
> +    fi
>  }
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf8ocsACgkQN1Ujt2V2gBxX7ACeMNP64eVQ9qE15ol2vrXAJ/xZ
vWUAoLMn+2RDeJ9XEyymv2Psg0dD2p2Y
=3Iyg
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
