Received: from moutng.kundenserver.de ([212.227.17.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Borutta@schoeps.de>) id 1Qtdv3-0006NF-Rd
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 13:04:21 +0200
Received: from ZEUS.schoeps.local (pd95ba764.dip0.t-ipconnect.de
	[217.91.167.100])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0MAihL-1QzR9g3zHn-00BxTg; Wed, 17 Aug 2011 12:35:36 +0200
Received: from ZEUS.schoeps.local ([fe80::71f0:3b18:ef63:ee9c]) by
	ZEUS.schoeps.local ([fe80::71f0:3b18:ef63:ee9c%10]) with mapi;
	Wed, 17 Aug 2011 12:35:21 +0200
From: Christian Borutta <Borutta@schoeps.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Aug 2011 12:34:06 +0200
Thread-Topic: Problems using local patch
Thread-Index: AcxcyTCYWLt8U4coReqtzVHC3ycQOQ==
Message-ID: <311EE95A63F86C4E960B402004EAD7E310B5F883D2@ZEUS.schoeps.local>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: A1jF BFNe Bxi+ B1uP D/6c EFhu ExLH E41m GgBt Glpn G/ya
	Hi3+ Icqh JSgP LgTK Lrch; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {24F81558-61A9-4855-8067-9B3C7C79E148};
	YgBvAHIAdQB0AHQAYQBAAHMAYwBoAG8AZQBwAHMALgBkAGUA; Wed,
	17 Aug 2011 10:34:50 GMT;
	UAByAG8AYgBsAGUAbQBzACAAdQBzAGkAbgBnACAAbABvAGMAYQBsACAAcABhAHQAYwBoAA==
x-cr-puzzleid: {24F81558-61A9-4855-8067-9B3C7C79E148}
acceptlanguage: en-US, de-DE
MIME-Version: 1.0
X-Provags-ID: V02:K0:mp3SK4mRZeXuQufJ5a9sZoS60coiAql3XZCqIRb17fC
	d1ABdnxrwDViIEAAA1oOgMThhyoyhlENBJkUCCHkoy1TDBdz5r
	F+avv6WbLv2abt1GYzwZzAbnOYWmH6P3ltReO/LHHwNNFrZb0H
	L9GMAuYXkS7xEFkJ4qGDr6a1G+hISyILWX8xSMkA8lulwKje7R
	oaSs1tWWwAR/nb3LbjYOQ==
Subject: Problems using local patch
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
X-List-Received-Date: Wed, 17 Aug 2011 11:04:22 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I=B4m having some trouble using a patch I have created. I want to build for=
 the freescale mx28evk with linux-imx_git.bb . Here is what I did:

The patch is:=20
"
--- /stuff/tmp/work/mx28evk-angstrom-linux-gnueabi/linux-imx-2.6.35-r0/git/=
arch/arm/mach-mx28/mx28evk.c	2011-05-06 11:32:37.000000000 +0200
+++ /stuff/mylayer/myfiles/mymx28evk.c	2011-08-17 09:33:36.000000000 +0200
@@ -43,6 +43,7 @@
=20
 static struct i2c_board_info __initdata mxs_i2c_device[] =3D {
 	{ I2C_BOARD_INFO("sgtl5000-i2c", 0xa), .flags =3D I2C_M_TEN }
+	{ I2C_BOARD_INFO("cs2000", 0x4f) }
 };
=20
 static void __init i2c_device_init(void)
"
My new recipe is:
"
require linux.inc

FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/linux-imx-git=
/${MACHINE}"

PR =3D "r1"

COMPATIBLE_MACHINE =3D "(chumby-falconwing|mx28evk)"

SRC_URI_chumby-falconwing =3D "git://opensource.freescale.com/pub/scm/imx/l=
inux-2.6-imx.git;protocol=3Dhttp;branch=3Dimx_2.6.28 \
                             http://files.chumby.com/source/falconwing/buil=
d2913/oe-patch-freescale-kernel.patch;name=3Dpatch \
                             file://defconfig"
SRCREV_chumby-falconwing =3D "eee5a08306df7d9b1f23f463c9e9439e04293b57"
PV_chumby-falconwing =3D "2.6.28"
SRC_URI_chumby-falconwing[patch.md5sum] =3D "47fd149d78839e0d54239a3f5934ee=
d1"
SRC_URI_chumby-falconwing[patch.sha256sum] =3D "4bf5efedef5ab6be0ce29b21b7d=
06bfe0cec2c33c5e3dea831b6b66e08a371ad"


SRC_URI_mx28evk =3D "git://opensource.freescale.com/pub/scm/imx/linux-2.6-i=
mx.git;protocol=3Dhttp;branch=3Dimx_2.6.35_10.12.01 \
                   http://foss.doredevelopment.dk/mirrors/imx/imx-bootlets-=
src-${PV_imx_bootlets}.tar.gz;name=3Dimx-bootlets \
                   file://defconfig \
		   file://addingCS2000toBoardInfo.patch \
                   file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2"
SRCREV_mx28evk =3D "cca29a03fc83751ed319df4b3c38ce2f4216ee0a"
SRC_URI[imx-bootlets.md5sum] =3D "cf0ab3822dca694b930a051501c1d0e4"
SRC_URI[imx-bootlets.sha256sum] =3D "63f6068ae36884adef4259bbb1fe2591755718=
f22c46d0a59d854883dfab1ffc"
PV_mx28evk =3D "2.6.35"
PV_imx_bootlets =3D "10.12.01"
DEPENDS_append_mx28 =3D " elftosb-native"

do_compile_prepend_mx28() {
	# We just build the bootlets here
	oe_runmake -C ${WORKDIR}/imx-bootlets-src-${PV_imx_bootlets} -e MAKEFLAGS=
=3D linux_prep boot_prep power_prep CC=3D"${CC}" CFLAGS=3D"${CFLAGS}" AR=3D=
"${AR}" BOARD=3DiMX28_EVK ARCH=3Dmx28
}

do_deploy_append_mx28 () {
	cd ${WORKDIR}/imx-bootlets-src-${PV_imx_bootlets}
	sed -i 's,[^ *]zImage.*;,\tzImage=3D"'${S}/arch/arm/boot/zImage'";,' linux=
.bd
	sed -i 's,[^ *]zImage.*;,\tzImage=3D"'${S}/arch/arm/boot/zImage'";,' linux=
_ivt.bd
	elftosb -z -c linux.bd -o imx28_linux.sb
	elftosb -z -f imx28 -c ./linux_ivt.bd -o imx28_ivt_linux.sb
	install -d ${DEPLOY_DIR_IMAGE}
	install -m 0644 ${WORKDIR}/imx-bootlets-src-${PV_imx_bootlets}/imx28*linux=
.sb ${DEPLOY_DIR_IMAGE}/
}

S =3D "${WORKDIR}/git"
"
And the Openembedded Output is:
"
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 411 of 765 (ID: 10, /stuff/mylayer/recipes/linux/linux-i=
mx_git.bb, do_setscene)
NOTE: package linux-imx-2.6.35-r1: task do_setscene: Started
NOTE: package linux-imx-2.6.35-r1: task do_setscene: Succeeded
NOTE: Running task 412 of 765 (ID: 8, /stuff/mylayer/recipes/linux/linux-im=
x_git.bb, do_fetch)
NOTE: package linux-imx-2.6.35-r1: task do_fetch: Started
NOTE: package linux-imx-2.6.35-r1: task do_fetch: Succeeded
NOTE: Running task 413 of 765 (ID: 0, /stuff/mylayer/recipes/linux/linux-im=
x_git.bb, do_unpack)
NOTE: package linux-imx-2.6.35-r1: task do_unpack: Started
NOTE: package linux-imx-2.6.35-r1: task do_unpack: Succeeded
NOTE: Running task 446 of 765 (ID: 1, /stuff/mylayer/recipes/linux/linux-im=
x_git.bb, do_patch)
NOTE: package linux-imx-2.6.35-r1: task do_patch: Started
ERROR: Execution of 'quilt --quiltrc=3D/stuff/tmp/sysroots/i686-linux/usr/b=
in/quiltrc push' failed with exit code 1:
Applying patch addingCS2000toBoardInfo.patch
patching file stuff/mylayer/myfiles/mymx28evk.c
Hunk #1 FAILED at 43.
1 out of 1 hunk FAILED -- rejects in file stuff/mylayer/myfiles/mymx28evk.c
Patch addingCS2000toBoardInfo.patch does not apply (enforce with -f)

NOTE: package linux-imx-2.6.35-r1: task patch_do_patch: Failed
ERROR: Function 'patch_do_patch' failed
ERROR: Task 1 (/stuff/mylayer/recipes/linux/linux-imx_git.bb, do_patch) fai=
led with exit code '1'
ERROR: '/stuff/mylayer/recipes/linux/linux-imx_git.bb' failed
"
What did I do wrong?


Thanks,
Christian Borutta



