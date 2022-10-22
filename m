Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA54FA373D
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 12:46:15 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.5803.1666442765699686421
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Oct 2022 05:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bj3T8D6/;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1666442766;
  x=1697978766;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=hnXIoSlV5fiKYtPLDPjVMyAFT3TAyqk7pi/fciq8sH8=;
  b=bj3T8D6/s8KyoLv9a+srsHagMi+NcRjkMglS0nPMFQhaDvk4YTB+MLyP
   E63RbWz7ZEA9RNLr5umQr54b3/1D16gIYJCvKCA73rW71wS+P5dgDHKF9
   xT7+mUfkni8wLoKfj96XsyCDXXwoEh5fBvyQx1ijZP1OwvPWlp+YF2M07
   i15kvSMXxHHEumPyiBjNBmk+lN4P6hL7wcf4Xtzf/V3Lj1n8F313XwiIF
   GZ2y7z/FZRX9FVXz5wWwOH9RUhe/4b5JyJz80I4c01xxc8bR5pBZ+BNmO
   tEbPz/vNGe99KgGLQL88WO7o+VoxLXuuurPh+ZCV1pD3k6rwAQOXb9r4L
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-multimedia][PATCH] libcamera: upgrade -> 0.0.1
Thread-Topic: [oe] [meta-multimedia][PATCH] libcamera: upgrade -> 0.0.1
Thread-Index: AQHY5fZpFrukOTOXgkijIepMd/R/G64aTfBw
Date: Sat, 22 Oct 2022 12:46:02 +0000
Message-ID: <81287e5fe61e432d98037f20316c1faa@axis.com>
References: <20221022091208.24098-1-f_l_k@t-online.de>
In-Reply-To: <20221022091208.24098-1-f_l_k@t-online.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Oct 2022 12:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99258

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Markus Volk
> Sent: den 22 oktober 2022 11:12
> To: openembedded-devel@lists.openembedded.org
> Cc: Markus Volk <f_l_k@t-online.de>
> Subject: [oe] [meta-multimedia][PATCH] libcamera: upgrade -> 0.0.1
>=20
> libcamera has recently received its first release.
> Note: meta-raspberrypi needs to adjust the name of libcamera.bbappend
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{libcamera.bb =3D> libcamera_0.0.1.bb}         | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera.bb =3D> l=
ibcamera_0.0.1.bb} (84%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/=
meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
> similarity index 84%
> rename from meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
> index 53cd94cbf..8329707b5 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
> @@ -12,9 +12,9 @@ SRC_URI =3D " \
>          git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
>  "
>=20
> -SRCREV =3D "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
> +SRCREV =3D "a83aed77df1258e469c0eb42d9cb4f1938db53f2"
>=20
> -PV =3D "202105+git${SRCPV}"
> +PV =3D "0.0.1"

Remove PV. There is no need to set it here as it is now set in the filename=
.
Instead, you should add:

PE =3D "1"

to avoid the following warning when upgrading from the current version:

WARNING: libcamera-0.0.1-r0 do_packagedata: QA Issue: Package version for=20
package libcamera went backwards which would break package feeds (from=20
0:202105+git0+ed591e705c-r0.2 to 0:0.0.1-r0.0) [version-going-backwards]

>=20
>  S =3D "${WORKDIR}/git"
>=20
> @@ -45,8 +45,8 @@ do_configure:prepend() {
>  }
>=20
>  do_install:append() {
> -    chrpath -d ${D}${libdir}/libcamera.so.0.0.0
> -    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.0
> +    chrpath -d ${D}${libdir}/libcamera.so.0.0.1
> +    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.1

Change to:

    chrpath -d ${D}${libdir}/libcamera.so
    chrpath -d ${D}${libdir}/v4l2-compat.so

so that it does not have to be updated every new version.
I dropped chrpath for libcamera-base.so because it has no rpath, so=20
no need to remove something that isn't there.

>  }
>=20
>  addtask do_recalculate_ipa_signatures_package after do_package before do=
_packagedata
> @@ -64,11 +64,11 @@ do_recalculate_ipa_signatures_package() {
>=20
>  FILES:${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
>  FILES:${PN}-dev +=3D " ${libdir}/libcamera.so"
> -FILES:${PN} +=3D " ${libdir}/libcamera.so.0"
> -FILES:${PN} +=3D " ${libdir}/libcamera.so.0.0.0"
> +FILES:${PN} +=3D " ${libdir}/libcamera.so"
> +FILES:${PN} +=3D " ${libdir}/libcamera.so.0.0.1"
>  FILES:${PN}-dev +=3D " ${libdir}/libcamera-base.so"
> -FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0"
> -FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0.0.0"
> +FILES:${PN} +=3D " ${libdir}/libcamera-base.so"
> +FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0.0.1"
>  FILES:${PN} +=3D " ${libdir}/v4l2-compat.so"
>  FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0/libgstlibcamera.so"
>  FILES:${PN} +=3D " ${bindir}/cam"

Remove all the FILES variables above and replace them with:

FILES:${PN} +=3D " ${libdir}/v4l2-compat.so"
FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0"

> --
> 2.34.1

//Peter


