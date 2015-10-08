Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7484B73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:04:37 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so18086105wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Psv1fBGKwsNfjDkHvuLYGXHh9Ea5V35W59er6B8kQXg=;
	b=fVDMZ0HManjLtz8keFdXkLCvDsvl3zYWjwyNLU2ap74nS2SFiqqSUMefw5YFbaTZ/I
	ANQITv/JHxbQ5RYRoMNj4im9k7y74T7sxRj73+PKm313UTOu4X9nNVkJRoCi5bwQ7Nzr
	fqjJbnRmEMK+mG96PefRGIulkPkoa/c/5LXjpmsTVGrxWYYDIQLJdaFQELDVMlMcBHQ+
	MgD44PfEGFa4/FDEMmVOMzrfm+0YVjFNr1jj+aPinFKEOmJzIGDGiVqGKHF6z/Il3h4Z
	a/hGU+QAm1C7SQNe9akS0c6H0lGQom9bwpdSYPMGH8RftMRFjrON4h0+eYp+d9laXHdI
	Mfvg==
X-Received: by 10.194.110.4 with SMTP id hw4mr6750433wjb.135.1444298677989;
	Thu, 08 Oct 2015 03:04:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i3sm1060046wij.9.2015.10.08.03.04.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:04:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:04:48 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008100448.GC2385@jama>
References: <1443904539-21781-1-git-send-email-manuel.bachmann@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1443904539-21781-1-git-send-email-manuel.bachmann@iot.bzh>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 2/3][meta-multimedia] gupnp-dlna: Update to 0.9.4, support gstreamer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 10:04:39 -0000
X-Groupsio-MsgNum: 57729
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline

--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2015 at 10:35:39PM +0200, Manuel Bachmann wrote:
> Minor update.
> As we now have GStreamer 1.0+, add a PACKAGECONFIG option
> to build the additional "gupnp-dlna-gst" library if it is
> present.
> This is most notably needed by Rygel.

This seems to break media-service-upnp/0.4.0-r0:
http://errors.yoctoproject.org/Errors/Details/20232/

>=20
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> ---
>  meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb   | 20 --=
------------------
>  meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb   | 19 ++=
+++++++++++++++++
>  delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna=
_0.9.2.bb
>  create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna=
_0.9.4.bb
>  2 files changed, 19 insertions(+), 20 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.=
bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
> deleted file mode 100644
> index b7e71cf..0000000
> --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY =3D "Helpers for AV applications using DLNA"
> -LICENSE =3D "LGPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
> -                    file://libgupnp-dlna/gupnp-dlna-profile.h;beginline=
=3D1;endline=3D22;md5=3D1b85459f65cb1e73a885ca137aab6274"
> -
> -DEPENDS =3D "libxml2 glib-2.0"
> -
> -SRC_URI =3D "http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.t=
ar.xz"
> -SRC_URI[md5sum] =3D "d972f9b03f0f3793cb895eb034ea314f"
> -SRC_URI[sha256sum] =3D "c28d5650604c7da4f193e6b85049a4885f3a01f1996df768=
d55b5cb898a9fc53"
> -
> -inherit autotools pkgconfig
> -
> -require no-vala.inc
> -
> -# The GStreamer metadata backend requires GStreamer 1.0, so skip this un=
til we
> -# have that packaged.
> -EXTRA_OECONF =3D "--disable-gstreamer-metadata-backend"
> -
> -FILES_${PN} +=3D "${datadir}/gupnp-dlna-2.0/dlna-profiles"
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.=
bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
> new file mode 100644
> index 0000000..b7e71cf
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Helpers for AV applications using DLNA"
> +LICENSE =3D "LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
> +                    file://libgupnp-dlna/gupnp-dlna-profile.h;beginline=
=3D1;endline=3D22;md5=3D1b85459f65cb1e73a885ca137aab6274"
> +
> +DEPENDS =3D "libxml2 glib-2.0"
> +
> +SRC_URI =3D "http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.t=
ar.xz"
> +SRC_URI[md5sum] =3D "f93665e535a512e4d515a86311435cb6"
> +SRC_URI[sha256sum] =3D "69969713f36c0e815fbbbcfdfb3ad9bd447cfd10d0fd8622=
7d82dfd8edb6c807"
> +
> +inherit autotools pkgconfig
> +
> +require no-vala.inc
> +
> +PACKAGECONFIG ?=3D "gstreamer"
> +PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer-metadata-backend,--disa=
ble-gstreamer-metadata-backend,gstreamer1.0 gstreamer1.0-plugins-base"
> +
> +FILES_${PN} +=3D "${datadir}/gupnp-dlna-2.0/dlna-profiles"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWP78ACgkQN1Ujt2V2gByLRwCfQBgfptPgwSaRGWX2qsUBjWK/
gIIAn3nANMZBMvszi7WzhtLBlgyXSRei
=Chhx
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
