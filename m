Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D7B9377202
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:23:01 +0000 (UTC)
Received: by wmec201 with SMTP id c201so38361448wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 07:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=DMVRKq92B81WRI5uroa9RrDK7DW9zF0W5Jti+aP5/Iw=;
	b=BTn8mUAyuLhwVWzGif5cOhZQ5jgq+Sie1krElEI7rFQFzR2DE6ZvJY8dKFXHzlZjOk
	KknjzxqBPRavHnvRptnKUdmBlUNt7AXIVvQgO1Gh8rgu6oI6SQVbqmIEQo4hbK34Hhhu
	cYMZaDSTtYLc2W/OdMTnivhLe7qPDX/nr9mqGdgfwoDv8rgFK6XgOlKzj0JW26MibC8U
	5a+9KTwCndrpytt62taUpQweRIw+bzFNH0wlhCKKRtSonQGE+MvuvSI8F8JL8XdNsQfD
	hH+PTbSOYJCquCT1OxxQXds/cWHjiSZmgDtOtvgD5jV71vTE3dbwtAL3ypSkaFfkKu9z
	soeQ==
X-Received: by 10.28.213.212 with SMTP id m203mr45141252wmg.33.1447341781071; 
	Thu, 12 Nov 2015 07:23:01 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	gl4sm7878846wjd.17.2015.11.12.07.23.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Nov 2015 07:23:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1447327014-27893-1-git-send-email-jackie.huang@windriver.com>
Date: Thu, 12 Nov 2015 16:22:59 +0100
Message-Id: <BA61B1AD-E729-4B0E-ABF1-8B5CC3E2768B@gmail.com>
References: <1447327014-27893-1-git-send-email-jackie.huang@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [v2][PATCH] talloc: upgrade to 2.1.3
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
X-List-Received-Date: Thu, 12 Nov 2015 15:23:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 12.11.2015 um 12:16 schrieb jackie.huang@windriver.com:
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> - use ${SOLIBS} and ${SOLIBSDEV} instead of hardcoded suffix
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
> .../talloc/{talloc_2.1.1.bb =3D> talloc_2.1.3.bb}        | 18 =
++++++++----------
> 1 file changed, 8 insertions(+), 10 deletions(-)
> rename meta-oe/recipes-support/talloc/{talloc_2.1.1.bb =3D> =
talloc_2.1.3.bb} (69%)
>=20
> diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb =
b/meta-oe/recipes-support/talloc/talloc_2.1.3.bb
> similarity index 69%
> rename from meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> rename to meta-oe/recipes-support/talloc/talloc_2.1.3.bb
> index 89c390f..83c8f8f 100644
> --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> +++ b/meta-oe/recipes-support/talloc/talloc_2.1.3.bb
> @@ -7,8 +7,8 @@ SRC_URI =3D =
"http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
> LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=3Dbfccfe952269=
fff2b407dd11f2f3083b \
>                     =
file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=3Dc79ff39f19dfec=
6d293b95dea7b07891"
>=20
> -SRC_URI[md5sum] =3D "5dffb86414218a91864ed4453ba9be07"
> -SRC_URI[sha256sum] =3D =
"3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb6a459025488b6174"
> +SRC_URI[md5sum] =3D "3e285de2228ae67ff0a0f5cec658f627"
> +SRC_URI[sha256sum] =3D =
"7aa5f75b22d4ef9c737b25515f2a2837ddc13014ff4ac6e58dd9e311f41f2cb0"
>=20
> inherit waf-samba
>=20
> @@ -27,19 +27,17 @@ FILES_${PN} =3D ""
> FILES_${PN}-dev =3D ""
> FILES_${PN}-dbg =3D ""
>=20
> -FILES_libtalloc =3D "${libdir}/libtalloc.so.2 \
> -                   ${libdir}/libtalloc.so.2.1.1"
> +FILES_libtalloc =3D "${libdir}/libtalloc${SOLIBS}"
> FILES_libtalloc-dbg =3D "/usr/src/debug/ \
> -                   ${libdir}/.debug/libtalloc.so.2.1.1"
> +                   ${libdir}/.debug/libtalloc${SOLIBS}"
> FILES_libtalloc-dev =3D "${includedir}/ \
> -                   ${libdir}/libtalloc.so \
> +                   ${libdir}/libtalloc${SOLIBSDEV} \
>                    ${libdir}/pkgconfig/"
>=20
> FILES_pytalloc =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
> -                  ${libdir}/libpytalloc-util.so.2 \
> -                  ${libdir}/libpytalloc-util.so.2.1.1 \
> +                  ${libdir}/libpytalloc-util${SOLIBS} \
>                  "
> FILES_pytalloc-dbg =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
> -                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
> -FILES_pytalloc-dev =3D "${libdir}/libpytalloc-util.so"
> +                      ${libdir}/.debug/libpytalloc-util${SOLIBS}"
> +FILES_pytalloc-dev =3D "${libdir}/libpytalloc-util${SOLIBSDEV}"
> RDEPENDS_pytalloc =3D "python"
> --=20
> 1.9.1
>=20
> --=20


I'm missing the fix discussed in =
http://patchwork.openembedded.org/patch/104719/ - is talloc-dev not =
empty with the update?

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


