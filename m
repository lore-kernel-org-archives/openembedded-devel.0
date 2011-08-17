Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtibB-0006tJ-8J
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 18:04:09 +0200
Received: by pzk2 with SMTP id 2so1817414pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=u+fFdtc4bzC+oBiNNr9EtY4r+n6KyZgzj5/0qadadD4=;
	b=alnXFo1X9OeFJiKRTrSqRWSyvCNV/X80igsXJDkYlCvA9d28Xw/QLrGJI+GR9yFUSd
	ESlTZ1bY3fIwSTiZ8R+lPqj/HW/1g74mXeysc1gC1bLLKGlCTIMjYiXSW5/8HB9Vsavd
	G4v7SwQx2UuW2Cf+eOnXK98BHdTxK3gCCz5yQ=
Received: by 10.142.156.20 with SMTP id d20mr550118wfe.119.1313596769083; Wed,
	17 Aug 2011 08:59:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.197 with HTTP; Wed, 17 Aug 2011 08:58:59 -0700 (PDT)
In-Reply-To: <311EE95A63F86C4E960B402004EAD7E310B5F883D2@ZEUS.schoeps.local>
References: <311EE95A63F86C4E960B402004EAD7E310B5F883D2@ZEUS.schoeps.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Aug 2011 08:58:59 -0700
Message-ID: <CAMKF1sp6Z2q1DY8wbWE6dujyELVgtBtyK=k1OJpO3UvDArTsWQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Problems using local patch
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
X-List-Received-Date: Wed, 17 Aug 2011 16:04:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2011 at 3:34 AM, Christian Borutta <Borutta@schoeps.de> wro=
te:
> Hello,
>
> I=C2=B4m having some trouble using a patch I have created. I want to buil=
d for the freescale mx28evk with linux-imx_git.bb . Here is what I did:
>
> The patch is:
> "
> --- /stuff/tmp/work/mx28evk-angstrom-linux-gnueabi/linux-imx-2.6.35-r0/gi=
t/arch/arm/mach-mx28/mx28evk.c 2011-05-06 11:32:37.000000000 +0200
> +++ /stuff/mylayer/myfiles/mymx28evk.c =C2=A02011-08-17 09:33:36.00000000=
0 +0200
> @@ -43,6 +43,7 @@
>
> =C2=A0static struct i2c_board_info __initdata mxs_i2c_device[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ I2C_BOARD_INFO("sgtl5000-i2c", 0xa), .flags =
=3D I2C_M_TEN }
> + =C2=A0 =C2=A0 =C2=A0 { I2C_BOARD_INFO("cs2000", 0x4f) }
> =C2=A0};
>
> =C2=A0static void __init i2c_device_init(void)
> "
> My new recipe is:
> "
> require linux.inc
>
> FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/linux-imx-g=
it/${MACHINE}"
>
> PR =3D "r1"
>
> COMPATIBLE_MACHINE =3D "(chumby-falconwing|mx28evk)"
>
> SRC_URI_chumby-falconwing =3D "git://opensource.freescale.com/pub/scm/imx=
/linux-2.6-imx.git;protocol=3Dhttp;branch=3Dimx_2.6.28 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 http://files.chumby.com/source/falconwing/build291=
3/oe-patch-freescale-kernel.patch;name=3Dpatch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 file://defconfig"
> SRCREV_chumby-falconwing =3D "eee5a08306df7d9b1f23f463c9e9439e04293b57"
> PV_chumby-falconwing =3D "2.6.28"
> SRC_URI_chumby-falconwing[patch.md5sum] =3D "47fd149d78839e0d54239a3f5934=
eed1"
> SRC_URI_chumby-falconwing[patch.sha256sum] =3D "4bf5efedef5ab6be0ce29b21b=
7d06bfe0cec2c33c5e3dea831b6b66e08a371ad"
>
>
> SRC_URI_mx28evk =3D "git://opensource.freescale.com/pub/scm/imx/linux-2.6=
-imx.git;protocol=3Dhttp;branch=3Dimx_2.6.35_10.12.01 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://fos=
s.doredevelopment.dk/mirrors/imx/imx-bootlets-src-${PV_imx_bootlets}.tar.gz=
;name=3Dimx-bootlets \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://def=
config \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add=
ingCS2000toBoardInfo.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://${L=
OGO_SIZE}/logo_linux_clut224.ppm.bz2"
> SRCREV_mx28evk =3D "cca29a03fc83751ed319df4b3c38ce2f4216ee0a"
> SRC_URI[imx-bootlets.md5sum] =3D "cf0ab3822dca694b930a051501c1d0e4"
> SRC_URI[imx-bootlets.sha256sum] =3D "63f6068ae36884adef4259bbb1fe25917557=
18f22c46d0a59d854883dfab1ffc"
> PV_mx28evk =3D "2.6.35"
> PV_imx_bootlets =3D "10.12.01"
> DEPENDS_append_mx28 =3D " elftosb-native"
>
> do_compile_prepend_mx28() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# We just build the bootlets here
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${WORKDIR}/imx-bootlets-src-${PV=
_imx_bootlets} -e MAKEFLAGS=3D linux_prep boot_prep power_prep CC=3D"${CC}"=
 CFLAGS=3D"${CFLAGS}" AR=3D"${AR}" BOARD=3DiMX28_EVK ARCH=3Dmx28
> }
>
> do_deploy_append_mx28 () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/imx-bootlets-src-${PV_imx_bootle=
ts}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's,[^ *]zImage.*;,\tzImage=3D"'${S}/arc=
h/arm/boot/zImage'";,' linux.bd
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's,[^ *]zImage.*;,\tzImage=3D"'${S}/arc=
h/arm/boot/zImage'";,' linux_ivt.bd
> =C2=A0 =C2=A0 =C2=A0 =C2=A0elftosb -z -c linux.bd -o imx28_linux.sb
> =C2=A0 =C2=A0 =C2=A0 =C2=A0elftosb -z -f imx28 -c ./linux_ivt.bd -o imx28=
_ivt_linux.sb
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${DEPLOY_DIR_IMAGE}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/imx-bootlets-src-${=
PV_imx_bootlets}/imx28*linux.sb ${DEPLOY_DIR_IMAGE}/
> }
>
> S =3D "${WORKDIR}/git"
> "
> And the Openembedded Output is:
> "
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 411 of 765 (ID: 10, /stuff/mylayer/recipes/linux/linux=
-imx_git.bb, do_setscene)
> NOTE: package linux-imx-2.6.35-r1: task do_setscene: Started
> NOTE: package linux-imx-2.6.35-r1: task do_setscene: Succeeded
> NOTE: Running task 412 of 765 (ID: 8, /stuff/mylayer/recipes/linux/linux-=
imx_git.bb, do_fetch)
> NOTE: package linux-imx-2.6.35-r1: task do_fetch: Started
> NOTE: package linux-imx-2.6.35-r1: task do_fetch: Succeeded
> NOTE: Running task 413 of 765 (ID: 0, /stuff/mylayer/recipes/linux/linux-=
imx_git.bb, do_unpack)
> NOTE: package linux-imx-2.6.35-r1: task do_unpack: Started
> NOTE: package linux-imx-2.6.35-r1: task do_unpack: Succeeded
> NOTE: Running task 446 of 765 (ID: 1, /stuff/mylayer/recipes/linux/linux-=
imx_git.bb, do_patch)
> NOTE: package linux-imx-2.6.35-r1: task do_patch: Started
> ERROR: Execution of 'quilt --quiltrc=3D/stuff/tmp/sysroots/i686-linux/usr=
/bin/quiltrc push' failed with exit code 1:
> Applying patch addingCS2000toBoardInfo.patch
> patching file stuff/mylayer/myfiles/mymx28evk.c
> Hunk #1 FAILED at 43.
> 1 out of 1 hunk FAILED -- rejects in file stuff/mylayer/myfiles/mymx28evk=
.c
> Patch addingCS2000toBoardInfo.patch does not apply (enforce with -f)
>
> NOTE: package linux-imx-2.6.35-r1: task patch_do_patch: Failed
> ERROR: Function 'patch_do_patch' failed
> ERROR: Task 1 (/stuff/mylayer/recipes/linux/linux-imx_git.bb, do_patch) f=
ailed with exit code '1'
> ERROR: '/stuff/mylayer/recipes/linux/linux-imx_git.bb' failed
> "
> What did I do wrong?

by default patcher uses patch strip level 1 if you have different
patch strip level then either you can refresh the patch so that it has
strip level 1 or use striplevel=3D<n> to denote the strip level in
src_uri e.g.

SRC_URI +=3D "file://foo.patch;striplevel=3D2" to specify 2 dir to be
stripped off from patch path
>
>
> Thanks,
> Christian Borutta
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


