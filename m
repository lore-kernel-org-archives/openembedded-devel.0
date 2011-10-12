Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msprathap@ti.com>) id 1RDwOa-0004Ua-K3
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 12:50:44 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9CAgbTb028623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 05:42:39 -0500
Received: from dbde70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9CAgauj003206
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 16:12:36 +0530 (IST)
Received: from dbde02.ent.ti.com ([172.24.170.145]) by dbde70.ent.ti.com
	([172.24.170.148]) with mapi; Wed, 12 Oct 2011 16:12:36 +0530
From: "Srinivas, Prathap" <msprathap@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Oct 2011 16:12:35 +0530
Thread-Topic: [oe] Patches to add support for TI Linux Graphics SDK release
	04.04.00.02
Thread-Index: AcyIyESFwRxKmyboRoex709qF/JhUAAAOMuw
Message-ID: <5A47E75E594F054BAF48C5E4FC4B92AB038595A16D@dbde02.ent.ti.com>
References: <5A47E75E594F054BAF48C5E4FC4B92AB038595A123@dbde02.ent.ti.com>
	<j73pg0$knr$1@dough.gmane.org>
In-Reply-To: <j73pg0$knr$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Patches to add support for TI Linux Graphics SDK release 04.04.00.02
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
X-List-Received-Date: Wed, 12 Oct 2011 10:50:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the comments. Please find my responses inline.

Thanks,
Prathap.


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
Sent: Wednesday, October 12, 2011 3:48 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Patches to add support for TI Linux Graphics SDK release =
04.04.00.02

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-10-11 11:57, Srinivas, Prathap schreef:
> Hi All, Attached are the patches for adding TI Linux Graphics SDK
> 04.04.00.02 Release support in OE. Please include these patches in the
> OE.
>=20
> Details of patches - 1)
> 0001-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch - Adds
> support for TI Linux graphics SDK release 04.04.00.02 2)
> 0002-Fix-for-library-linking-isssue-with-graphics-SDK.patch - Fix to link
> the appropriate graphics user library with TI Linux graphics SDK release
> 04.04.00.02.
>=20
> Since I am sending through outlook, the patches may get mangled. So I am
> attaching the patches.
>=20
> Thanks, Prathap.
>=20
>=20
>=20
> 0001-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch
>=20
>=20
> From a11f1ae4c07d09be89be49f9094207abddad854e Mon Sep 17 00:00:00 2001=20
> From: Prathap M S <msprathap@ti.com> Date: Mon, 10 Oct 2011 15:09:46
> +0530 Subject: [PATCH 1/2] libgles-omap3_4.04.00.02: added support for
> graphics sdk 04.04.00.02
>=20
> * added support sgx ddk 1.6.16.4117 * included video driver as part of
> the kernel for accessing the fbdev in the sgx driver
>=20
> Signed-off-by: Prathap M S <msprathap@ti.com> --- classes/kernel.bbclass
> |    2 +- .../powervr-drivers/libgles-omap3_4.04.00.02.bb    |   29
> +++++++++++++ .../omap3-sgx-modules_1.6.16.4117.bb               |   44
> ++++++++++++++++++++ 3 files changed, 74 insertions(+), 1 deletions(-)=20
> create mode 100644 recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb=20
> create mode 100644
> recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
>=20
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass index
> 0109ce6..bf731e6 100644 --- a/classes/kernel.bbclass +++
> b/classes/kernel.bbclass @@ -168,7 +168,7 @@ sysroot_stage_all_append()
> { mkdir -p $kerneldir/include/asm-generic cp -fR include/asm-generic/*
> $kerneldir/include/asm-generic/
>=20
> -	for entry in drivers/crypto drivers/media include/generated
> include/linux include/net include/pcmcia include/media include/acpi
> include/sound include/video include/scsi include/trace include/mtd
> include/rdma include/drm include/xen crypto/ocf; do +	for entry in
> drivers/crypto drivers/media drivers/video drivers/gpu drivers/base
> include/generated include/linux include/net include/pcmcia include/media
> include/acpi include/sound include/video include/scsi include/trace
> include/mtd include/rdma include/drm include/xen crypto/ocf; do if [ -d
> $entry ]; then mkdir -p $kerneldir/$entry cp -fR $entry/*
> $kerneldir/$entry/

The above needs to be a seperate patch
- Yes. Will address that.


> diff --git a/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb
> b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb new file mode
> 100644 index 0000000..c5062c1 --- /dev/null +++
> b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb @@ -0,0 +1,29 @@=20
> +BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x" +BINLOCATION_ti816x =3D
> "${S}/gfx_rel_es6.x" + +ES2LOCATION =3D "${S}/gfx_rel_es2.x" +ES3LOCATION=
 =3D
> "${S}/gfx_rel_es3.x" +ES5LOCATION =3D "${S}/gfx_rel_es5.x" +ES6LOCATION =
=3D
> "${S}/gfx_rel_es6.x"

Since the above is being repeated in each recipe, shouldn't it move to the =
.inc?
- I am just following in the way of already existing recipes. Existing reci=
pes have this. If it still needs to be addressed, let me know.

> --- /dev/null +++
> b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb

> +MACHINE_KERNEL_PR_append =3D "i"

Start at 'a' please, or remove it
- I am just following in the way of already existing recipes. Existing reci=
pes have this way only. If it still needs to be addressed, let me know.

> +TI_PLATFORM_omap3 =3D "omap3630" +TI_PLATFORM_ti816x =3D "ti81xx" +=20
> +MODULESLOCATION_omap3 =3D "dc_omapfb3_linux" +MODULESLOCATION_ti816x =3D
> "dc_ti81xx_linux"

Move to .inc?
- I am just following in the way of already existing recipes. Existing reci=
pes have this way only. If it still needs to be addressed, let me know.

> From 59227811f6d4364cb8cf254f527efd233bd10827 Mon Sep 17 00:00:00 2001=20
> From: Prathap M S <msprathap@ti.com> Date: Tue, 11 Oct 2011 10:58:34
> +0530 Subject: [PATCH 2/2] Fix for library linking isssue with graphics
> SDK

please format the summary according to the commit guidelines
-OK

> Signed-off-by: Prathap M S <msprathap@ti.com>
>=20
> --- recipes/powervr-drivers/libgles-omap3.inc |    9 ++++++++- 1 files
> changed, 8 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/powervr-drivers/libgles-omap3.inc
> b/recipes/powervr-drivers/libgles-omap3.inc index 36c311d..e605681
> 100644 --- a/recipes/powervr-drivers/libgles-omap3.inc +++
> b/recipes/powervr-drivers/libgles-omap3.inc @@ -1,7 +1,7 @@ DESCRIPTION =
=3D
> "libGLES for the omap3" LICENSE =3D "proprietary-binary"
>=20
> -PR =3D "r15" +PR =3D "r16"
>=20
> COMPATIBLE_MACHINE =3D "(omap3|ti816x)"
>=20
> @@ -35,6 +35,13 @@ do_configure() { for i in $(find ${S} -name "*.h")
> $(find ${S} -name "*.c") $(find ${S} -name "Make*") ; do chmod 0644 $i=20
> done + +	for drifile in $(find ${S} -name "libsrv_um_dri.so"); do +
> if [ "$drifile" !=3D "" ] ; then +                        dir=3D$(dirname
> ${drifile}) +                        rm -rf ${dir}/libsrv_um_dri.so +
> fi +	done

What does this try to fix exactly?
- This fix is for the issue seen with opkg install of libgles-omap3_4.04.00=
.02-r16.6_armv7a.ipk on target. With Graphics SDK release 04.04.00.02, ther=
e are 2 versions of the library libsrv_um.so - one is libsrv_um.so and othe=
r is libsrv_um_dri.so (For Xorg driver). What we observed was in presence o=
f libsrv_um_dri.so , the links created under /usr/lib were all by default l=
inking to libsrv_um_dri.so only. Due to this demos used to fail. Now this f=
ix makes sure that only 1 appropriate version of the library libsrv_um.so i=
s present and hence links created will now be proper.

Thanks,
Prathap.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOlWk8MkyGM64RGpERAl2qAJsFjMZDHiIY14FPRsWrqg+bIkQAZwCeJqTJ
NHO0BQ5XeErYUttBY44hqGM=3D
=3DlbJ/
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


