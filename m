Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id D86766A413
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:36:22 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so5896785eak.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=klybg+Pq6NH4b5Pin5slDJpUzzOAZvyYIEhJ2zXGjA4=;
	b=MofNxmSXZgyQoevtyz5PPJBb0Xk9nTynJuFBl0yk936lMs7a4xEf5MONjekiTWKxlK
	ku7X1iV1crvdAGAAOxqeS/VV2onxrrnswzNtrWd50vawbmzOnaj9c47LF79gu4+2JwoW
	vR+hmzh7EvJ3ZDrr/8erB4V/AfGx+lAR/WEwnhL2O35GXTXq+Fw4lItPxw+8O8+jEDDr
	Dd70lHra/WmfSLR5CXVvfc85ZF5ZUwfGLqJs3AaRb2xZsgSkiGDZXFb2Ldf/wT8KIM84
	yKfHIeCMIFdM1jvC2kARGM+xHX/swGcNTRJy/IXU1aG+dXT9fRV8rgLFz/wOZghziPuI
	F1/A==
X-Received: by 10.14.113.199 with SMTP id a47mr11097783eeh.41.1388579783554;
	Wed, 01 Jan 2014 04:36:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm126746618eeg.4.2014.01.01.04.36.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:36:22 -0800 (PST)
Date: Wed, 1 Jan 2014 13:36:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140101123625.GC11840@jama>
References: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
	<1387240261-7045-4-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1387240261-7045-4-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe PATCH v2 4/6] gdal: Add recipe for 1.10.1 version
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
X-List-Received-Date: Wed, 01 Jan 2014 12:36:23 -0000
X-Groupsio-MsgNum: 47548
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline

--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2013 at 10:30:59PM -0200, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Changes in v2: None

Please fix following error detected in:
http://jenkins.nas-admin.org/job/oe_shr-image-all_tmpfs_qemuarm/173/console=
Full

ERROR: This autoconf log indicates errors, it looked at host include
and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was
'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/gdal/1.10.1-r0/gdal-1.10.1'
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in:
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/gdal/1.10.1-r0/temp/log.do_configure.883
NOTE: recipe gdal-1.10.1-r0: task do_configure: Failed
ERROR: Task 14201
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/reci=
pes-navigation/gdal/gdal_1.10.1.bb,
do_configure) failed with exit code '1'


>=20
>  meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb | 105 +++++++++++++++++++=
++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
>=20
> diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/rec=
ipes-navigation/gdal/gdal_1.10.1.bb
> new file mode 100644
> index 0000000..4632944
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> @@ -0,0 +1,105 @@
> +DESCRIPTION =3D "GDAL is a translator library for raster geospatial data=
 formats"
> +HOMEPAGE =3D "http://www.gdal.org/"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Db9bd75ae5af7ff87ab259be01=
21c4106"
> +
> +DEPENDS =3D "proj sqlite3"
> +
> +SRC_URI =3D "ftp://download.osgeo.org/gdal/${PV}/${P}.tar.xz"
> +
> +SRC_URI[md5sum] =3D "f354c614aea76e5630e4edbf06e5c292"
> +SRC_URI[sha256sum] =3D "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60=
b91639fb8d443791"
> +
> +inherit autotools lib_package binconfig
> +
> +EXTRA_OECONF =3D "--without-perl \
> +                --without-php \
> +                --without-ruby \
> +                --without-python \
> +                \
> +                --without-grass \
> +                --without-libgrass \
> +                --without-cfitsio \
> +                --without-dds \
> +                --without-gta \
> +                --without-pcidsk \
> +                --without-ogdi \
> +                --without-fme \
> +                --without-hdf4 \
> +                --without-hdf5 \
> +                --without-pg \
> +                --without-jpeg12 \
> +                --without-ogdi \
> +                --without-netcdf \
> +                --without-openjpeg \
> +                --without-fgdb \
> +                --without-ecw \
> +                --without-kakadu \
> +                --without-mrsid \
> +                --without-jp2mrsid \
> +                --without-mrsid_lidar \
> +                --without-msg \
> +                --without-bsb \
> +                --without-grib \
> +                --without-mysql \
> +                --without-ingres \
> +                --without-odbc \
> +                --without-dods_root \
> +                --without-xml2 \
> +                --without-spatialite \
> +                --without-pcre \
> +                --without-dwgdirect \
> +                --without-dwgdirect \
> +                --without-idb \
> +                --without-sde \
> +                --without-sde-version \
> +                --without-epsilon \
> +                --without-webp \
> +                --without-opencl \
> +                --without-opencl-include \
> +                --without-opencl-lib \
> +                --without-freexl \
> +                --without-pam \
> +                --without-poppler \
> +                --without-podofo \
> +                --without-podofo-lib \
> +                --without-podofo-extra-lib-for-test \
> +                --without-static_proj4 \
> +                --without-perl \
> +                --without-php \
> +                --without-ruby \
> +                --without-python \
> +                --without-java \
> +                --without-mdb \
> +                --without-jvm-lib \
> +                --without-jvm-lib-add-rpath \
> +                --without-rasdaman \
> +                --without-armadillo \
> +                \
> +                --with-pcraster=3Dinternal \
> +                --with-geotiff=3Dinternal \
> +"
> +
> +EXTRA_OEMAKE +=3D "INST_DATA=3D"${datadir}/gdal""
> +
> +PACKAGECONFIG ?=3D "geos png jasper"
> +PACKAGECONFIG[geos] =3D "--with-geos,--without-geos,geos"
> +PACKAGECONFIG[lzma] =3D "--with-liblzma,--without-liblzma,xz"
> +PACKAGECONFIG[png] =3D "--with-png,--without-png,libpng"
> +PACKAGECONFIG[tiff] =3D "--with-libtiff,--without-tiff,tiff"
> +PACKAGECONFIG[gif] =3D "--with-gif,--without-gif,giflib"
> +PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg,jpeg"
> +PACKAGECONFIG[z] =3D "--with-libz,--without-libz,zlib"
> +PACKAGECONFIG[jasper] =3D "--with-jasper,--without-jasper,jasper"
> +PACKAGECONFIG[curl] =3D "--with-curl,--without-curl,curl"
> +
> +do_configure_prepend () {
> +    # The configure script has many hardcoded paths to search
> +    # for the library headers when using external libraries,
> +    # workaround it.
> +    sed -e 's,/usr/include,NON_EXISTENT_DIR,g' \
> +        -e 's,/usr/lib,NON_EXISTENT_DIR,g' \
> +        -i ${S}/configure.in
> +}
> +
> +FILES_${PN} +=3D "${libdir}/gdalplugins"
> --=20
> 1.8.4.3
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLEC8kACgkQN1Ujt2V2gBzVZgCgr/2z8KOm0/HhBSkfyESopy3p
kj4AoLjXIBtuGEYDaCS/hzmbjcxvJgg3
=urxs
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
