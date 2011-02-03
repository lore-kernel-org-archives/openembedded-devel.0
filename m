Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pkwga-0000S1-Bk
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 11:45:33 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 93B8C491278;
	Thu,  3 Feb 2011 11:44:15 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 3 Feb 2011 11:44:15 +0100
Message-ID: <4D4A86FE.1010402@dresearch.de>
Date: Thu, 03 Feb 2011 11:44:14 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Holger Freyther <holger+oe@freyther.de>
References: <4D4929CB.6040009@dresearch.de> <4D49552D.3010705@dresearch.de>
	<4D49584D.3010502@freyther.de> <4D4A61DE.8070808@dresearch.de>
	<4D4A6EC8.6050601@freyther.de>
In-Reply-To: <4D4A6EC8.6050601@freyther.de>
X-OriginalArrivalTime: 03 Feb 2011 10:44:15.0671 (UTC)
	FILETIME=[4D69CC70:01CBC38F]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 10:45:34 -0000
X-Groupsio-MsgNum: 28776
Content-Type: multipart/mixed; boundary="------------010609010700070900050605"

--------------010609010700070900050605
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 03.02.2011 10:00, schrieb Holger Freyther:
> On 02/03/2011 09:05 AM, Steffen Sledz wrote:
>=20
>> Hmmmm? This doesn't seem to work. :(
>>
>> If local.conf contains this
>>  ------------->snip<------------
>>  PROFILE_OPTIMIZATION =3D "-pg"
>>
>>  SELECTED_OPTIMIZATION_pn-libsoup =3D "${PROFILE_OPTIMIZATION}"
>>  LDFLAGS_pn-libsoup =3D+ "-pg"
>>
>>  SELECTED_OPTIMIZATION_pn-libgupnp =3D "${PROFILE_OPTIMIZATION}"
>>  LDFLAGS_pn-libgupnp =3D+ "-pg"
>>
>>  SELECTED_OPTIMIZATION_pn-libgssdp =3D "${PROFILE_OPTIMIZATION}"
>>  LDFLAGS_pn-libgssdp =3D+ "-pg"
>>  ------------->snip<------------
>=20
> Just a general remark, using bitbake -e -b libsoup.bb you will see what
> bitbake has as input and how it is expanding it... also look at OVERRID=
ES to
> see if maybe something 'stronger' is winning.

It seems that the "classic override system" does not work here.

The TARGET_CFLAGS are created just from SELECTED_OPTIMIZATION and not fro=
m SELECTED_OPTIMIZATION_pn-libgssdp. :(

------------->snip<---------------
...
# SELECTED_OPTIMIZATION_pn-libgssdp=3D${PROFILE_OPTIMIZATION}
SELECTED_OPTIMIZATION_pn-libgssdp=3D"-pg"
...
# SELECTED_OPTIMIZATION=3D${@bb.data.getVar(['FULL_OPTIMIZATION', 'DEBUG_=
OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) =3D=3D '1'], d, 1)}
SELECTED_OPTIMIZATION=3D"-fexpensive-optimizations -frename-registers -fo=
mit-frame-pointer -O2 -ggdb2"
...
# SELECTED_OPTIMIZATION_pn-libsoup=3D${PROFILE_OPTIMIZATION}
SELECTED_OPTIMIZATION_pn-libsoup=3D"-pg"
...
# TARGET_CFLAGS=3D${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}
export TARGET_CFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp=
.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimi=
zations -frename-registers -fomit-frame-pointer -O2 -ggdb2"
...
# SELECTED_OPTIMIZATION_pn-libgupnp=3D${PROFILE_OPTIMIZATION}
SELECTED_OPTIMIZATION_pn-libgupnp=3D"-pg"
...
------------->snip<---------------

Steffen

PS: Complete bitbake -e output is attached.

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

--------------010609010700070900050605
Content-Type: text/plain;
 name="opti.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="opti.log"

ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
NOTE: Out of date cache found, rebuilding...
ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${@bb.fetch.get_srcrev(d)}
ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${@bb.fetch.get_srcrev(d)}
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${SRCPV}
# PREFERRED_VERSION_qt4-x11-free=3D${ANGSTROM_QT_VERSION}
PREFERRED_VERSION_qt4-x11-free=3D"4.6.3"

# SRCREV_pn-libccss=3D92bc59e1d39302c8be500d53cb5dd8b05c2e4a15
SRCREV_pn-libccss=3D"92bc59e1d39302c8be500d53cb5dd8b05c2e4a15"

# STAGING_INCDIR_NATIVE=3D${STAGING_DIR_NATIVE}${includedir_native}
STAGING_INCDIR_NATIVE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/i686-linux/usr/include"

# layout_base_sbindir=3D${base_sbindir}
layout_base_sbindir=3D"/sbin"

# ROOT_FLASH_SIZE=3D256
ROOT_FLASH_SIZE=3D"256"

# PREFERRED_VERSION_autoconf-native=3D2.65
PREFERRED_VERSION_autoconf-native=3D"2.65"

# PREFERRED_VERSION_opie-restartapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-restartapplet=3D"1.2.4"

# localstatedir=3D${base_prefix}/var
export localstatedir=3D"/var"

# do_package_write_deb=3DNone
# PREFERRED_VERSION_opie-today=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-today=3D"1.2.4"

# IMAGE_DEPENDS_squashfs=3Dsquashfs-tools-native
IMAGE_DEPENDS_squashfs=3D"squashfs-tools-native"

# prefix=3D/usr
export prefix=3D"/usr"

# PREFERRED_VERSION_opie-packagemanager=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-packagemanager=3D"1.2.4"

# FREESMARTPHONE_GIT=3Dgit://git.freesmartphone.org
FREESMARTPHONE_GIT=3D"git://git.freesmartphone.org"

# layout_base_bindir=3D${base_bindir}
layout_base_bindir=3D"/bin"

# CPP=3D${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS}
export CPP=3D"arm-angstrom-linux-gnueabi-gcc -E"

# PREFERRED_VERSION_opie-mediaplayer2-skin-techno=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer2-skin-techno=3D"1.2.4"

# CVSDIR=3D${CO_DIR}/cvs
CVSDIR=3D"/home/DRESEARCH/sledz/sources/cvs"

# SVNDIR=3D${CO_DIR}/svn
SVNDIR=3D"/home/DRESEARCH/sledz/sources/svn"

# mandir=3D${datadir}/man
export mandir=3D"/usr/share/man"

# PREFERRED_VERSION_gcc-cross-intermediate=3D${ANGSTROM_GCC_VERSION}
PREFERRED_VERSION_gcc-cross-intermediate=3D"4.3.3"

# PREFERRED_VERSION_opie-gutenbrowser=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-gutenbrowser=3D"1.2.4"

# PREFERRED_VERSION_fontconfig=3D2.8.0
PREFERRED_VERSION_fontconfig=3D"2.8.0"

# bindir_cross=3D/bin
bindir_cross=3D"/bin"

# HOST_CC_ARCH=3D${TARGET_CC_ARCH}
HOST_CC_ARCH=3D"-march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno=
-thumb"

# GNU_MIRROR=3Dftp://ftp.gnu.org/gnu
GNU_MIRROR=3D"ftp://ftp.gnu.org/gnu"

# PREFERRED_VERSION_qt4-tools-native=3D${ANGSTROM_QT_VERSION}
PREFERRED_VERSION_qt4-tools-native=3D"4.6.3"

# MACHINE_DISPLAY_WIDTH_PIXELS=3D240
MACHINE_DISPLAY_WIDTH_PIXELS=3D"240"

# DISTRO_BLUETOOTH_MANAGER=3Dblueprobe bluez4=20
DISTRO_BLUETOOTH_MANAGER=3D"blueprobe bluez4"

# BUILD_OS=3Dlinux
BUILD_OS=3D"linux"

# STRIP=3D${HOST_PREFIX}strip
export STRIP=3D"arm-angstrom-linux-gnueabi-strip"

# PREFERRED_VERSION_opie-usermanager=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-usermanager=3D"1.2.4"

# IMAGE_CMD_cpio.gz.u-boot=3Dcd ${IMAGE_ROOTFS} && (find . | cpio -o -H new=
c | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_I=
MAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_N=
AME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE=
}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot
IMAGE_CMD_cpio.gz.u-boot=3D"cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/=
rootfs/libsoup-2.4 && (find . | cpio -o -H newc | gzip -c -9 >/home/DRESEAR=
CH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/Angstrom-libsoup-2=
.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.cpio.gz) ; mkimage -A arm -O=
 linux -T ramdisk -C gzip -n Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-201=
10203-hipox -d /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ima=
ges/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.=
cpio.gz /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hip=
ox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.cpio.gz=
.u-boot"

# STAGING_DATADIR=3D${STAGING_DIR_HOST}${datadir}
STAGING_DATADIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/arm=
v5te-angstrom-linux-gnueabi/usr/share"

# target_datadir=3D/usr/share
target_datadir=3D"/usr/share"

# PREFERRED_VERSION_opie-security=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-security=3D"1.2.4"

# CCACHE=3D
# __BBANONFUNCS=3D['__anon_184__home_DRESEARCH_sledz_work_openembedded_clas=
ses_staging_bbclass', '__anon_91__home_DRESEARCH_sledz_work_openembedded_cl=
asses_packaged_staging_bbclass', '__anon_416_classes_base_bbclass', '__anon=
_38_classes_src_distribute_local_bbclass', '__anon_18_classes_angstrom_bbcl=
ass', '__anon_148__home_DRESEARCH_sledz_work_openembedded_classes_package_b=
bclass', '__anon_320_classes_package_ipk_bbclass', '__anon_101__home_DRESEA=
RCH_sledz_work_openembedded_classes_siteinfo_bbclass']
# PREFERRED_VERSION_qt4-x11-free-gles=3D${ANGSTROM_QT_VERSION}
PREFERRED_VERSION_qt4-x11-free-gles=3D"4.6.3"

# IMAGE_ROOTFS=3D${TMPDIR}/rootfs/${PN}
IMAGE_ROOTFS=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/libsoup-=
2.4"

# FETCHCOMMAND_cvs=3D/usr/bin/env 'PATH=3D${PATH}' cvs '-d${CVSROOT}' co ${=
CVSCOOPTS} ${CVSMODULE}
FETCHCOMMAND_cvs=3D"/usr/bin/env 'PATH=3D/home/DRESEARCH/sledz/work/HydraIP=
/OE/tmp.6/sysroots/i686-linux/usr/armv5te/bin:/home/DRESEARCH/sledz/work/Hy=
draIP/OE/tmp.6/sysroots/i686-linux/usr/sbin:/home/DRESEARCH/sledz/work/Hydr=
aIP/OE/tmp.6/sysroots/i686-linux/usr/bin:/home/DRESEARCH/sledz/work/HydraIP=
/OE/tmp.6/sysroots/i686-linux/sbin:/home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.6/sysroots/i686-linux//bin:/opt/bitbake/bin:/opt/avr/bin/:/opt/avr/bin/:/=
home/DRESEARCH/sledz/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11=
R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:/opt/gno=
me/bin:/usr/lib/qt3/bin:/usr/sbin:/sbin:/usr/sbin:/sbin' cvs '-d${CVSROOT}'=
 co ${CVSCOOPTS} ${CVSMODULE}"

# STAGING_SIPDIR=3D${STAGING_DATADIR_NATIVE}/sip
export STAGING_SIPDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/i686-linux/usr/share/sip"

# base_bindir_native=3D/bin
base_bindir_native=3D"/bin"

# IMAGE_CMD_ext3.gz=3Dinstall -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b =
${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.=
rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAG=
E_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.ro=
otfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEP=
LOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz
IMAGE_CMD_ext3.gz=3D"install -d /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6=
/deploy/glibc/images/hipox/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d /home/DR=
ESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/libsoup-2.4 /home/DRESEARCH/sled=
z/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.gz/Angstrom-libsoup-2=
.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext3 ; tune2fs -j /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.gz/Angstrom=
-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext3; gzip -f -9 /=
home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.gz=
/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext3; mv =
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.g=
z/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext3.gz =
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/Angst=
rom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext3.gz"

# IMAGE_DEPENDS_cpio.gz.u-boot=3Du-boot-mkimage-native
IMAGE_DEPENDS_cpio.gz.u-boot=3D"u-boot-mkimage-native"

# PSTAGE_PKGPN=3D${@bb.data.expand('staging-${PN}-${MULTIMACH_ARCH}${TARGET=
_VENDOR}-${TARGET_OS}', d).replace('_', '-')}
PSTAGE_PKGPN=3D"staging-libsoup-2.4-armv5te-angstrom-linux-gnueabi"

# MACHINE_DISPLAY_ORIENTATION=3D0
MACHINE_DISPLAY_ORIENTATION=3D"0"

# SECTION_${PN}-dbg=3DNone
# PREFERRED_VERSION_opie-minesweep=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-minesweep=3D"1.2.4"

# DATETIME=3D${DATE}${TIME}
DATETIME=3D"20110203095327"

# TARGET_CC_ARCH_pn-cairo=3D-march=3Darmv4t
TARGET_CC_ARCH_pn-cairo=3D"-march=3Darmv4t"

# P=3D${PN}-${PV}
P=3D"libsoup-2.4-2.29.91"

# FILESPATHPKG=3D${PF}:${P}:${PN}:${BP}:${BPN}:files:.
FILESPATHPKG=3D"libsoup-2.4-2.29.91-r0:libsoup-2.4-2.29.91:libsoup-2.4:libs=
oup-2.4-2.29.91:libsoup-2.4:files:."

# ASSUME_PROVIDED=3Dbc-native bzip2-native cvs-native diffstat-native patch=
-native perl-native-runtime python-native-runtime svn-native texinfo-native=
 util-linux-native=20
ASSUME_PROVIDED=3D"bc-native bzip2-native cvs-native diffstat-native patch-=
native perl-native-runtime python-native-runtime svn-native texinfo-native =
util-linux-native"

# BUILDCFG_VARS=3DBB_VERSION METADATA_BRANCH METADATA_REVISION TARGET_ARCH =
TARGET_OS MACHINE DISTRO DISTRO_VERSION TARGET_FPU
BUILDCFG_VARS=3D"BB_VERSION METADATA_BRANCH METADATA_REVISION TARGET_ARCH T=
ARGET_OS MACHINE DISTRO DISTRO_VERSION TARGET_FPU"

# PREFERRED_VERSION_opie-keyboard=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-keyboard=3D"1.2.4"

# FILESPATH=3D${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp =
in d.getVar('FILESPATHBASE', 1).split(':') for p in d.getVar('FILESPATHPKG'=
, 1).split(':') for o in (d.getVar('OVERRIDES', 1) + ':').split(':')])}
FILESPATH=3D"/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-=
2.4-2.29.91-r0/local:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/=
libsoup-2.4-2.29.91-r0/hipox:/home/DRESEARCH/sledz/work/openembedded/recipe=
s/gnome/libsoup-2.4-2.29.91-r0/angstrom:/home/DRESEARCH/sledz/work/openembe=
dded/recipes/gnome/libsoup-2.4-2.29.91-r0/linux-gnueabi:/home/DRESEARCH/sle=
dz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91-r0/arm:/home/DRESEAR=
CH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91-r0/build-linux=
:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91-=
r0/fail-fast:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-=
2.4-2.29.91-r0/pn-libsoup-2.4:/home/DRESEARCH/sledz/work/openembedded/recip=
es/gnome/libsoup-2.4-2.29.91-r0/armv5te:/home/DRESEARCH/sledz/work/openembe=
dded/recipes/gnome/libsoup-2.4-2.29.91-r0/Unknown:/home/DRESEARCH/sledz/wor=
k/openembedded/recipes/gnome/libsoup-2.4-2.29.91-r0/libc-glibc:/home/DRESEA=
RCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91-r0/thumb-inte=
rwork:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.2=
9.91-r0:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2=
.29.91/local:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-=
2.4-2.29.91/hipox:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/lib=
soup-2.4-2.29.91/angstrom:/home/DRESEARCH/sledz/work/openembedded/recipes/g=
nome/libsoup-2.4-2.29.91/linux-gnueabi:/home/DRESEARCH/sledz/work/openembed=
ded/recipes/gnome/libsoup-2.4-2.29.91/arm:/home/DRESEARCH/sledz/work/openem=
bedded/recipes/gnome/libsoup-2.4-2.29.91/build-linux:/home/DRESEARCH/sledz/=
work/openembedded/recipes/gnome/libsoup-2.4-2.29.91/fail-fast:/home/DRESEAR=
CH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91/pn-libsoup-2.4=
:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91/=
armv5te:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2=
.29.91/Unknown:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsou=
p-2.4-2.29.91/libc-glibc:/home/DRESEARCH/sledz/work/openembedded/recipes/gn=
ome/libsoup-2.4-2.29.91/thumb-interwork:/home/DRESEARCH/sledz/work/openembe=
dded/recipes/gnome/libsoup-2.4-2.29.91:/home/DRESEARCH/sledz/work/openembed=
ded/recipes/gnome/libsoup-2.4/local:/home/DRESEARCH/sledz/work/openembedded=
/recipes/gnome/libsoup-2.4/hipox:/home/DRESEARCH/sledz/work/openembedded/re=
cipes/gnome/libsoup-2.4/angstrom:/home/DRESEARCH/sledz/work/openembedded/re=
cipes/gnome/libsoup-2.4/linux-gnueabi:/home/DRESEARCH/sledz/work/openembedd=
ed/recipes/gnome/libsoup-2.4/arm:/home/DRESEARCH/sledz/work/openembedded/re=
cipes/gnome/libsoup-2.4/build-linux:/home/DRESEARCH/sledz/work/openembedded=
/recipes/gnome/libsoup-2.4/fail-fast:/home/DRESEARCH/sledz/work/openembedde=
d/recipes/gnome/libsoup-2.4/pn-libsoup-2.4:/home/DRESEARCH/sledz/work/opene=
mbedded/recipes/gnome/libsoup-2.4/armv5te:/home/DRESEARCH/sledz/work/openem=
bedded/recipes/gnome/libsoup-2.4/Unknown:/home/DRESEARCH/sledz/work/openemb=
edded/recipes/gnome/libsoup-2.4/libc-glibc:/home/DRESEARCH/sledz/work/opene=
mbedded/recipes/gnome/libsoup-2.4/thumb-interwork:/home/DRESEARCH/sledz/wor=
k/openembedded/recipes/gnome/libsoup-2.4:/home/DRESEARCH/sledz/work/openemb=
edded/recipes/gnome/libsoup-2.4-2.29.91/local:/home/DRESEARCH/sledz/work/op=
enembedded/recipes/gnome/libsoup-2.4-2.29.91/hipox:/home/DRESEARCH/sledz/wo=
rk/openembedded/recipes/gnome/libsoup-2.4-2.29.91/angstrom:/home/DRESEARCH/=
sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91/linux-gnueabi:/ho=
me/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91/arm:=
/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91/b=
uild-linux:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.=
4-2.29.91/fail-fast:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/l=
ibsoup-2.4-2.29.91/pn-libsoup-2.4:/home/DRESEARCH/sledz/work/openembedded/r=
ecipes/gnome/libsoup-2.4-2.29.91/armv5te:/home/DRESEARCH/sledz/work/openemb=
edded/recipes/gnome/libsoup-2.4-2.29.91/Unknown:/home/DRESEARCH/sledz/work/=
openembedded/recipes/gnome/libsoup-2.4-2.29.91/libc-glibc:/home/DRESEARCH/s=
ledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91/thumb-interwork:/h=
ome/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4-2.29.91:/ho=
me/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/local:/home/=
DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/hipox:/home/DRE=
SEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/angstrom:/home/DRE=
SEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/linux-gnueabi:/hom=
e/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/arm:/home/DRE=
SEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/build-linux:/home/=
DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/fail-fast:/home=
/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/pn-libsoup-2.4=
:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/armv5te:=
/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/Unknown:/=
home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/libc-glibc=
:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4/thumb-in=
terwork:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4:/=
home/DRESEARCH/sledz/work/openembedded/recipes/gnome/files/local:/home/DRES=
EARCH/sledz/work/openembedded/recipes/gnome/files/hipox:/home/DRESEARCH/sle=
dz/work/openembedded/recipes/gnome/files/angstrom:/home/DRESEARCH/sledz/wor=
k/openembedded/recipes/gnome/files/linux-gnueabi:/home/DRESEARCH/sledz/work=
/openembedded/recipes/gnome/files/arm:/home/DRESEARCH/sledz/work/openembedd=
ed/recipes/gnome/files/build-linux:/home/DRESEARCH/sledz/work/openembedded/=
recipes/gnome/files/fail-fast:/home/DRESEARCH/sledz/work/openembedded/recip=
es/gnome/files/pn-libsoup-2.4:/home/DRESEARCH/sledz/work/openembedded/recip=
es/gnome/files/armv5te:/home/DRESEARCH/sledz/work/openembedded/recipes/gnom=
e/files/Unknown:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/files=
/libc-glibc:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/files/thu=
mb-interwork:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/files:/h=
ome/DRESEARCH/sledz/work/openembedded/recipes/gnome/local:/home/DRESEARCH/s=
ledz/work/openembedded/recipes/gnome/hipox:/home/DRESEARCH/sledz/work/opene=
mbedded/recipes/gnome/angstrom:/home/DRESEARCH/sledz/work/openembedded/reci=
pes/gnome/linux-gnueabi:/home/DRESEARCH/sledz/work/openembedded/recipes/gno=
me/arm:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/build-linux:/h=
ome/DRESEARCH/sledz/work/openembedded/recipes/gnome/fail-fast:/home/DRESEAR=
CH/sledz/work/openembedded/recipes/gnome/pn-libsoup-2.4:/home/DRESEARCH/sle=
dz/work/openembedded/recipes/gnome/armv5te:/home/DRESEARCH/sledz/work/opene=
mbedded/recipes/gnome/Unknown:/home/DRESEARCH/sledz/work/openembedded/recip=
es/gnome/libc-glibc:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/t=
humb-interwork:/home/DRESEARCH/sledz/work/openembedded/recipes/gnome"

# PREFERRED_VERSION_opie-deco-polished=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-deco-polished=3D"1.2.4"

# PREFERRED_VERSION_opie-citytime=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-citytime=3D"1.2.4"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm=3D"gtk+"

# PREFERRED_VERSION_opie-go=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-go=3D"1.2.4"

# PROFILE_OPTIMIZATION=3D-pg
PROFILE_OPTIMIZATION=3D"-pg"

# BOOTSTRAP_EXTRA_RRECOMMENDS=3D
# PREFERRED_PROVIDER_classpath=3Dclasspath
PREFERRED_PROVIDER_classpath=3D"classpath"

# PREFERRED_VERSION_qt4-tools-sdk=3D${ANGSTROM_QT_VERSION}
PREFERRED_VERSION_qt4-tools-sdk=3D"4.6.3"

# PREFERRED_VERSION_libmailwrapper=3D${OPIE_VERSION}
PREFERRED_VERSION_libmailwrapper=3D"1.2.4"

# SEPPUKU_AUTOBUILD=3D1
SEPPUKU_AUTOBUILD=3D"1"

# BUILD_CXXFLAGS=3D${BUILD_CFLAGS} -fpermissive
export BUILD_CXXFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/sysroots/i686-linux/usr/include -O2 -g -fpermissive"

# PREFERRED_VERSION_xserver-kdrive=3D1.4.0.90
PREFERRED_VERSION_xserver-kdrive=3D"1.4.0.90"

# OBJCOPY=3D${HOST_PREFIX}objcopy
export OBJCOPY=3D"arm-angstrom-linux-gnueabi-objcopy"

# AR=3D${HOST_PREFIX}ar
export AR=3D"arm-angstrom-linux-gnueabi-ar"

# CONFIGUREOPTS=3D --build=3D${BUILD_SYS} 		  --host=3D${HOST_SYS} 		  --ta=
rget=3D${TARGET_SYS} 		  --prefix=3D${prefix} 		  --exec_prefix=3D${exec_pr=
efix} 		  --bindir=3D${bindir} 		  --sbindir=3D${sbindir} 		  --libexecdir=
=3D${libexecdir} 		  --datadir=3D${datadir} 		  --sysconfdir=3D${sysconfdir=
} 		  --sharedstatedir=3D${sharedstatedir} 		  --localstatedir=3D${localsta=
tedir} 		  --libdir=3D${libdir} 		  --includedir=3D${includedir} 		  --oldi=
ncludedir=3D${oldincludedir} 		  --infodir=3D${infodir} 		  --mandir=3D${ma=
ndir}
CONFIGUREOPTS=3D"--build=3Di686-linux 		  --host=3Darm-angstrom-linux-gnuea=
bi 		  --target=3Darm-angstrom-linux-gnueabi 		  --prefix=3D/usr 		  --exec=
_prefix=3D/usr 		  --bindir=3D/usr/bin 		  --sbindir=3D/usr/sbin 		  --libe=
xecdir=3D/usr/libexec 		  --datadir=3D/usr/share 		  --sysconfdir=3D/etc 		=
  --sharedstatedir=3D/com 		  --localstatedir=3D/var 		  --libdir=3D/usr/li=
b 		  --includedir=3D/usr/include 		  --oldincludedir=3D/usr/include 		  --=
infodir=3D/usr/share/info 		  --mandir=3D/usr/share/man"

# PREFERRED_VERSION_binutils_avr32=3D2.17
PREFERRED_VERSION_binutils_avr32=3D"2.17"

# EXTENDPEVER=3D${@int('${PE}') and '${PE}:' or ''}
# SRCREV_pn-librest=3D14d35103d9649dc1e10c3e9ac2c690b3165c8184
SRCREV_pn-librest=3D"14d35103d9649dc1e10c3e9ac2c690b3165c8184"

# PSTAGE_WORKDIR=3D${TMPDIR}/pstage
PSTAGE_WORKDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage"

# PREFERRED_VERSION_opie-confeditor=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-confeditor=3D"1.2.4"

# F77=3D${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
export F77=3D"arm-angstrom-linux-gnueabi-g77 -march=3Darmv5te -mtune=3Darm9=
26ej-s -mthumb-interwork -mno-thumb"

# EXTRA_IMAGECMD_cpio.gz=3D
# SOLIBSDEV_darwin8=3D.dylib
SOLIBSDEV_darwin8=3D".dylib"

# PREFERRED_VERSION_opie-rotateapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-rotateapplet=3D"1.2.4"

# ANGSTROM_MODE=3Duclibc
ANGSTROM_MODE=3D"uclibc"

# USER=3Dsledz
export USER=3D"sledz"

# SRC_URI=3D${GNOME_MIRROR}/libsoup/${@gnome_verdir("${PV}")}/libsoup-${PV}=
.tar.bz2;name=3Dlibsoup
SRC_URI=3D"http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.29/libsoup-2.29=
.91.tar.bz2;name=3Dlibsoup"

# PREFERRED_VERSION_glib-2.0-native=3D2.24.1
PREFERRED_VERSION_glib-2.0-native=3D"2.24.1"

# ANGSTROM_GCC_VERSION_avr32=3D4.2.2
ANGSTROM_GCC_VERSION_avr32=3D"4.2.2"

# includedir_native=3D${prefix_native}/include
includedir_native=3D"/usr/include"

# SITEINFO_BITS=3D32
SITEINFO_BITS=3D"32"

# PREFERRED_VERSION_opie-textedit=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-textedit=3D"1.2.4"

# OES_BITBAKE_CONF=3D1
OES_BITBAKE_CONF=3D"1"

# SRCREV_pn-mozilla-headless-services=3Dc7873654894af6c7c6c01194d6185db4666=
7b81f
SRCREV_pn-mozilla-headless-services=3D"c7873654894af6c7c6c01194d6185db46667=
b81f"

# PREFERRED_VERSION_udev_libc-uclibc=3D141
PREFERRED_VERSION_udev_libc-uclibc=3D"141"

# PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc=3DNone
# PSTAGE_DIR=3D${TMPDIR}/pstage
PSTAGE_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage"

# IMAGE_EXTRA_SPACE=3D10240
IMAGE_EXTRA_SPACE=3D"10240"

# EXTENDPV=3D${EXTENDPEVER}${PV}-${PR}${DISTRO_PR}
EXTENDPV=3D"2.29.91-r0.6"

# PREFERRED_VERSION_opie-addressbook=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-addressbook=3D"1.2.4"

# sharedstatedir=3D${base_prefix}/com
export sharedstatedir=3D"/com"

# PREFERRED_VERSION_opie-handwriting=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-handwriting=3D"1.2.4"

# FETCHCMD_hg=3D/usr/bin/env hg
FETCHCMD_hg=3D"/usr/bin/env hg"

# STAGING_BINDIR=3D${STAGING_DIR_HOST}${bindir}
STAGING_BINDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv=
5te-angstrom-linux-gnueabi/usr/bin"

# BBFILE_COLLECTIONS=3Dupstream localcommon local
BBFILE_COLLECTIONS=3D"upstream localcommon local"

# UPDATECOMMAND=3DERROR, this must be a BitBake bug
UPDATECOMMAND=3D"ERROR, this must be a BitBake bug"

# ANGSTROM_URI=3Dhttp://www.angstrom-distribution.org
ANGSTROM_URI=3D"http://www.angstrom-distribution.org"

# MACHINE_KERNEL_PR=3D
# OLDEST_KERNEL_ppc64=3D2.4.21
OLDEST_KERNEL_ppc64=3D"2.4.21"

# EXTENDPE=3D${@int('${PE}') and '${PE}_' or ''}
# QTE_VERSION=3D2.3.10
QTE_VERSION=3D"2.3.10"

# MACHINE_DISPLAY_HEIGHT_PIXELS=3D320
MACHINE_DISPLAY_HEIGHT_PIXELS=3D"320"

# PREFERRED_VERSION_opie-notesapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-notesapplet=3D"1.2.4"

# FILESDIR=3D${@bb.which(d.getVar('FILESPATH', 1), '.')}
FILESDIR=3D"/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/files/."

# PREFERRED_VERSION_qte-mt=3D${QTE_VERSION}
PREFERRED_VERSION_qte-mt=3D"2.3.10"

# PREFERRED_VERSION_gcc-cross-initial=3D${ANGSTROM_GCC_VERSION}
PREFERRED_VERSION_gcc-cross-initial=3D"4.3.3"

# MACHINE_KERNEL_VERSION=3D2.6
MACHINE_KERNEL_VERSION=3D"2.6"

# BB_NUMBER_THREADS=3D4
BB_NUMBER_THREADS=3D"4"

# FILES_${PN}-static=3DNone
# PREFERRED_PROVIDER_bluez-libs=3Dbluez4
PREFERRED_PROVIDER_bluez-libs=3D"bluez4"

# CE_VERSION=3D2.25.01
CE_VERSION=3D"2.25.01"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-pnm=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-pnm=3D"gtk+"

# SDK_NAME=3D${DISTRO}/${TARGET_ARCH}
SDK_NAME=3D"angstrom/arm"

# OELAYOUT_ABI=3D5
OELAYOUT_ABI=3D"5"

# IMAGE_CMD_tar.bz2=3Dcd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/$=
{IMAGE_NAME}.rootfs.tar.bz2 .
IMAGE_CMD_tar.bz2=3D"cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/=
libsoup-2.4 && tar -jcvf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy=
/glibc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hip=
ox.rootfs.tar.bz2 ."

# TMPDIR=3D/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6
TMPDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6"

# PREFERRED_VERSION_ti-dm355mm-module=3D1_13
PREFERRED_VERSION_ti-dm355mm-module=3D"1_13"

# SELECTED_OPTIMIZATION_pn-libgssdp=3D${PROFILE_OPTIMIZATION}
SELECTED_OPTIMIZATION_pn-libgssdp=3D"-pg"

# layout_base_prefix=3D${base_prefix}
# PACKAGESTRIPFUNCS=3D do_runstrip
PACKAGESTRIPFUNCS=3D"do_runstrip"

# PSTAGING_ACTIVE=3D1
export PSTAGING_ACTIVE=3D"1"

# PREFERRED_VERSION_ti-codecs-dm6446=3D2_05_00_00
PREFERRED_VERSION_ti-codecs-dm6446=3D"2_05_00_00"

# layout_docdir=3D${docdir}
layout_docdir=3D"/usr/share/doc"

# base_libdir_native=3D/lib
base_libdir_native=3D"/lib"

# PREFERRED_VERSION_opie-zkbapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-zkbapplet=3D"1.2.4"

# PKGR=3D${PR}${DISTRO_PR}
PKGR=3D"r0.6"

# IMAGE_DEPENDS_ubifs=3Dmtd-utils-native
IMAGE_DEPENDS_ubifs=3D"mtd-utils-native"

# XDG_DATA_DIRS=3D${STAGING_DATADIR}
export XDG_DATA_DIRS=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroot=
s/armv5te-angstrom-linux-gnueabi/usr/share"

# QEMU_OPTIONS_iwmmxt=3D-cpu pxa270-c5
QEMU_OPTIONS_iwmmxt=3D"-cpu pxa270-c5"

# PREFERRED_VERSION_opie-today-fortuneplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-today-fortuneplugin=3D"1.2.4"

# PREFERRED_PROVIDER_libgpewidget=3Dlibgpewidget
PREFERRED_PROVIDER_libgpewidget=3D"libgpewidget"

# PREFERRED_VERSION_opie-mediummount=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediummount=3D"1.2.4"

# BBFILE_PATTERN_upstream=3D^${OE_ROOT}/recipes/
BBFILE_PATTERN_upstream=3D"^/home/DRESEARCH/sledz/work/openembedded/recipes=
/"

# libexecdir=3D${exec_prefix}/libexec
export libexecdir=3D"/usr/libexec"

# PREFERRED_VERSION_opie-lockapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-lockapplet=3D"1.2.4"

# PREFERRED_VERSION_opie-volumeapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-volumeapplet=3D"1.2.4"

# PREFERRED_VERSION_gst-pulse=3D0.9.7
PREFERRED_VERSION_gst-pulse=3D"0.9.7"

# PREFERRED_VERSION_opie-mediaplayer1-libtremorplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer1-libtremorplugin=3D"1.2.4"

# PREFERRED_VERSION_opie-ftplib=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-ftplib=3D"1.2.4"

# PREFERRED_VERSION_opie-vmemo-settings=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-vmemo-settings=3D"1.2.4"

# OVERRIDE_INTERWORK=3D${@['', ':thumb-interwork'][bb.data.getVar('THUMB_IN=
TERWORK', d, 1) =3D=3D 'yes']}
OVERRIDE_INTERWORK=3D":thumb-interwork"

# PREFERRED_VERSION_opie-examples-python=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-examples-python=3D"1.2.4"

# LIBC=3D${ANGSTROMLIBC}
unset LIBC

# PREFERRED_PROVIDER_libfribidi=3Dfribidi
PREFERRED_PROVIDER_libfribidi=3D"fribidi"

# FILES_${PN}-dbg=3DNone
# IMAGE_DEPENDS_jffs2=3Dmtd-utils-native
IMAGE_DEPENDS_jffs2=3D"mtd-utils-native"

# PREFERRED_VERSION_opie-tictac=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-tictac=3D"1.2.4"

# LDFLAGS_pn-libsoup=3D-pg=20
LDFLAGS_pn-libsoup=3D"-pg"

# EXTRA_IMAGECMD_cpio=3D
# bindir_native=3D${prefix_native}/bin
bindir_native=3D"/usr/bin"

# SRC_DISTRIBUTEDIR=3D${DEPLOY_DIR}/sources
SRC_DISTRIBUTEDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/gli=
bc/sources"

# FILE_DIRNAME=3D${@os.path.dirname(bb.data.getVar('FILE', d))}
FILE_DIRNAME=3D"/home/DRESEARCH/sledz/work/openembedded/recipes/gnome"

# BB_MIN_VERSION=3D1.8.18
BB_MIN_VERSION=3D"1.8.18"

# datadir_native=3D${prefix_native}/share
datadir_native=3D"/usr/share"

# QTDIR=3D${STAGING_DIR_HOST}/qt2
export QTDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5t=
e-angstrom-linux-gnueabi/qt2"

# ANGSTROM_BINUTILS_VERSION_armv7a=3D2.18.50.0.7
ANGSTROM_BINUTILS_VERSION_armv7a=3D"2.18.50.0.7"

# PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc=3DNone
# PREFERRED_VERSION_opie-mediaplayer1-libmadplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer1-libmadplugin=3D"1.2.4"

# STAGING_DIR_TARGET=3D${STAGING_DIR}/${BASEPKG_TARGET_SYS}
STAGING_DIR_TARGET=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/=
armv5te-angstrom-linux-gnueabi"

# PREFERRED_VERSION_opie-formatter=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-formatter=3D"1.2.4"

# PREFERRED_PROVIDER_tslib=3Dtslib
PREFERRED_PROVIDER_tslib=3D"tslib"

# PREFERRED_VERSION_udev=3D141
PREFERRED_VERSION_udev=3D"141"

# COMBINED_FEATURES=3D${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEAT=
URES", "alsa", d)} ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURE=
S", "bluetooth", d)} ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATU=
RES", "ext2", d)} ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES=
", "vfat", d)} ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", =
"irda", d)} ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pc=
mcia", d)} ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pci=
", d)} ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbgadg=
et", d)} ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbho=
st", d)} ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "wifi"=
, d)} ${@base_ifelse( base_contains('DISTRO_FEATURES', ('pci', 'wifi', 'mad=
wifi'), True, False, d) and base_contains('MACHINE_FEATURES', 'pci', True, =
False, d), 'madwifi', '')} ${@base_ifelse( base_contains('DISTRO_FEATURES',=
 ('wifi', 'hostap'), True, False, d) and ((base_contains('MACHINE_FEATURES'=
, 'pci', True, False, d) and base_contains('DISTRO_FEATURES', 'pci', True, =
False, d)) or (base_contains('MACHINE_FEATURES', 'pcmcia', True, False, d) =
and base_contains('DISTRO_FEATURES', 'pcmcia', True, False, d))), 'hostap',=
 '')}
COMBINED_FEATURES=3D"ext2    pci  usbhost"

# PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-gcc-initial=3Dgcc-c=
ross-initial
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-gcc-initial=3D"gcc-cr=
oss-initial"

# IMAGE_CMD_tar.gz=3Dcd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.tar.gz .
IMAGE_CMD_tar.gz=3D"cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/l=
ibsoup-2.4 && tar -zcvf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/=
glibc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipo=
x.rootfs.tar.gz ."

# KONSOLE_TERMCMDRUN=3D${KONSOLE_TERMCMD} -e $SHELLCMDS
KONSOLE_TERMCMDRUN=3D"konsole -T \"$TERMWINDOWTITLE\" -e $SHELLCMDS"

# PREFERRED_VERSION_opie-wellenreiter=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-wellenreiter=3D"1.2.4"

# datadir=3D${prefix}/share
export datadir=3D"/usr/share"

# RDEPENDS_libsoup-2.4-dev=3D${PN} (=3D ${EXTENDPV})
RDEPENDS_libsoup-2.4-dev=3D"libsoup-2.4 (=3D 2.29.91-r0.6)"

# STAGING_ETCDIR_NATIVE=3D${STAGING_DIR_NATIVE}${sysconfdir_native}
STAGING_ETCDIR_NATIVE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/i686-linux/etc"

# STAGE_TEMP=3D${WORKDIR}/temp-staging
STAGE_TEMP=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angs=
trom-linux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging"

# PSTAGE_PKGMANAGER=3Dstage-manager-ipkg
PSTAGE_PKGMANAGER=3D"stage-manager-ipkg"

# layout_datadir=3D${datadir}
layout_datadir=3D"/usr/share"

# PREFERRED_VERSION_opie-suspendapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-suspendapplet=3D"1.2.4"

# FEED_URIS=3DNone
# PREFERRED_VERSION_opie-checkbook=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-checkbook=3D"1.2.4"

# HOST_EXEEXT=3D
# SRCDATE=3D${DATE}
SRCDATE=3D"20110203"

# GNOME_TERMCMDRUN=3D${GNOME_TERMCMD} -x $SHELLCMDS
GNOME_TERMCMDRUN=3D"gnome-terminal --disable-factory -t \"$TERMWINDOWTITLE\=
" -x $SHELLCMDS"

# SEPPUKU_PASS=3DNone
# PREFERRED_VERSION_opie-cardapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-cardapplet=3D"1.2.4"

# SRCREV_pn-mutter=3Daff4cf110307e149d3497d20543cde27b9699758
SRCREV_pn-mutter=3D"aff4cf110307e149d3497d20543cde27b9699758"

# PREFERRED_VERSION_xserver-xorg=3D1.7.4
PREFERRED_VERSION_xserver-xorg=3D"1.7.4"

# ANGSTROM_BINUTILS_VERSION=3D2.18
ANGSTROM_BINUTILS_VERSION=3D"2.18"

# PREFERRED_VERSION_opie-recorder=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-recorder=3D"1.2.4"

# PREFERRED_PROVIDER_virtual/xserver=3Dxserver-xorg
PREFERRED_PROVIDER_virtual/xserver=3D"xserver-xorg"

# TARGET_CC_ARCH=3D-march=3Darmv5te -mtune=3Darm926ej-s ${ARM_INTERWORK_M_O=
PT} ${ARM_THUMB_M_OPT}
TARGET_CC_ARCH=3D"-march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -m=
no-thumb"

# QEMU_OPTIONS_armv6=3D-cpu arm1136
QEMU_OPTIONS_armv6=3D"-cpu arm1136"

# SHELLRCCMD=3Dbash --rcfile $TERMRCFILE
SHELLRCCMD=3D"bash --rcfile $TERMRCFILE"

# HOST_ARCH=3D${TARGET_ARCH}
HOST_ARCH=3D"arm"

# ENABLE_BINARY_LOCALE_GENERATION=3D0
ENABLE_BINARY_LOCALE_GENERATION=3D"0"

# FILES_libsoup-2.4-doc=3D${datadir}/
FILES_libsoup-2.4-doc=3D"/usr/share/"

# PREFERRED_PROVIDER_gdk-pixbuf-csource-native=3Dgtk+-native
PREFERRED_PROVIDER_gdk-pixbuf-csource-native=3D"gtk+-native"

# TARGET_OS=3Dlinux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in =
['arm', 'armeb']]}
TARGET_OS=3D"linux-gnueabi"

# PREFERRED_VERSION_dropbear=3D0.51
PREFERRED_VERSION_dropbear=3D"0.51"

# GPEPHONE_MIRROR=3Dhttp://gpephone.linuxtogo.org/download/gpephone
GPEPHONE_MIRROR=3D"http://gpephone.linuxtogo.org/download/gpephone"

# GPEPHONE_SVN=3Dsvn://projects.linuxtogo.org/svn/gpephone/trunk/source;mod=
ule=3D${PN}
GPEPHONE_SVN=3D"svn://projects.linuxtogo.org/svn/gpephone/trunk/source;modu=
le=3Dlibsoup-2.4"

# sbindir_native=3D${prefix_native}/sbin
sbindir_native=3D"/usr/sbin"

# SOLIBS_darwin8=3D.*.dylib
SOLIBS_darwin8=3D".*.dylib"

# PREFERRED_VERSION_opie-pics=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-pics=3D"1.2.4"

# PREFERRED_VERSION_ti-xdais=3D6_25_01_08
PREFERRED_VERSION_ti-xdais=3D"6_25_01_08"

# PREFERRED_VERSION_u-boot=3D2009.03
PREFERRED_VERSION_u-boot=3D"2009.03"

# ARM_KEEP_OABI_pn-linux-openmoko-2.6.28_om-gta01=3D1
ARM_KEEP_OABI_pn-linux-openmoko-2.6.28_om-gta01=3D"1"

# RANLIB=3D${HOST_PREFIX}ranlib
export RANLIB=3D"arm-angstrom-linux-gnueabi-ranlib"

# GUI_MACHINE_CLASS=3D${MACHINE_GUI_CLASS}
GUI_MACHINE_CLASS=3D"smallscreen"

# PREFERRED_PROVIDER_qt4-x11-free=3Dqt4-x11-free
PREFERRED_PROVIDER_qt4-x11-free=3D"qt4-x11-free"

# TARGET_CC_ARCH_pn-webkit-gtk=3D-march=3Darmv4t
TARGET_CC_ARCH_pn-webkit-gtk=3D"-march=3Darmv4t"

# PREFERRED_VERSION_opie-batteryapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-batteryapplet=3D"1.2.4"

# MACHINE_EXTRA_RRECOMMENDS=3D
# PREFERRED_PROVIDER_gdk-pixbuf-loader-gif=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-gif=3D"gtk+"

# PACKAGE_ARCHS=3Dall any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MA=
CHINE}
PACKAGE_ARCHS=3D"all any noarch arm  armv4 armv4t armv5te hipox"

# PREFERRED_VERSION_opie-taskbar-images=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-taskbar-images=3D"1.2.4"

# DISTRO_REVISION=3D3
DISTRO_REVISION=3D"3"

# E_URI=3Dhttp://enlightenment.freedesktop.org/files
E_URI=3D"http://enlightenment.freedesktop.org/files"

# ISHOULDNEVEREXIST=3DNone
# FILES_${PN}=3DNone
# PREFERRED_VERSION_opie-launcher-settings=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-launcher-settings=3D"1.2.4"

# QEMU_OPTIONS=3D
# FILES_libsoup-2.4-dev=3D${includedir}/ ${libdir}/
FILES_libsoup-2.4-dev=3D"/usr/include/ /usr/lib/"

# SDK_PATH=3D/usr/local/${SDK_NAME}
SDK_PATH=3D"/usr/local/angstrom/arm"

# BUILD_CXX=3D${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}
export BUILD_CXX=3D"g++"

# FULL_OPTIMIZATION=3D-fexpensive-optimizations -frename-registers -fomit-f=
rame-pointer -O2 -ggdb2
FULL_OPTIMIZATION=3D"-fexpensive-optimizations -frename-registers -fomit-fr=
ame-pointer -O2 -ggdb2"

# PREFERRED_VERSION_pkgconfig=3D0.23
PREFERRED_VERSION_pkgconfig=3D"0.23"

# PREFERRED_VERSION_opie-style-metal=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-style-metal=3D"1.2.4"

# PREFERRED_VERSION_opie-networkapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-networkapplet=3D"1.2.4"

# TINDER_HOST=3Dewi546.ewi.utwente.nl
TINDER_HOST=3D"ewi546.ewi.utwente.nl"

# PREFERRED_VERSION_opie-restartapplet2=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-restartapplet2=3D"1.2.4"

# UPDATECOMMAND_cvs=3D/usr/bin/env 'PATH=3D${PATH}' cvs -d${CVSROOT} update=
 -d -P ${CVSCOOPTS}
UPDATECOMMAND_cvs=3D"/usr/bin/env 'PATH=3D/home/DRESEARCH/sledz/work/HydraI=
P/OE/tmp.6/sysroots/i686-linux/usr/armv5te/bin:/home/DRESEARCH/sledz/work/H=
ydraIP/OE/tmp.6/sysroots/i686-linux/usr/sbin:/home/DRESEARCH/sledz/work/Hyd=
raIP/OE/tmp.6/sysroots/i686-linux/usr/bin:/home/DRESEARCH/sledz/work/HydraI=
P/OE/tmp.6/sysroots/i686-linux/sbin:/home/DRESEARCH/sledz/work/HydraIP/OE/t=
mp.6/sysroots/i686-linux//bin:/opt/bitbake/bin:/opt/avr/bin/:/opt/avr/bin/:=
/home/DRESEARCH/sledz/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X1=
1R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:/opt/gn=
ome/bin:/usr/lib/qt3/bin:/usr/sbin:/sbin:/usr/sbin:/sbin' cvs -d${CVSROOT} =
update -d -P ${CVSCOOPTS}"

# PARALLEL_MAKE=3D-j 4
PARALLEL_MAKE=3D"-j 4"

# PSTAGE_INSTALL_CMD=3D${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -force-=
depends -o ${TMPDIR} install
PSTAGE_INSTALL_CMD=3D"stage-manager-ipkg -f /home/DRESEARCH/sledz/work/Hydr=
aIP/OE/tmp.6/pstage/opkg.conf -force-depends -o /home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.6 install"

# PREFERRED_VERSION_opie-rdesktop=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-rdesktop=3D"1.2.4"

# MKTEMPCMD=3Dmktemp -q ${TMPBASE}
MKTEMPCMD=3D"mktemp -q ${TMPBASE}"

# DATE=3D20110203
DATE=3D"20110203"

# APACHE_MIRROR=3Dhttp://archive.apache.org/dist
APACHE_MIRROR=3D"http://archive.apache.org/dist"

# IMAGE_DEPENDS_squashfs-lzma=3Dsquashfs-tools-native
IMAGE_DEPENDS_squashfs-lzma=3D"squashfs-tools-native"

# SDK_LDFLAGS=3D-L${STAGING_DIR_SDK}${libdir} -Wl,-rpath-link,${STAGING_DIR=
_SDK}${libdir} -Wl,-O1
export SDK_LDFLAGS=3D"-L/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroot=
s/i686-linux/usr/lib -Wl,-rpath-link,/home/DRESEARCH/sledz/work/HydraIP/OE/=
tmp.6/sysroots/i686-linux/usr/lib -Wl,-O1"

# PREFERRED_VERSION_opie-dagger=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-dagger=3D"1.2.4"

# do_rootfs=3DNone
# BASEPKG_HOST_SYS=3D${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}
BASEPKG_HOST_SYS=3D"armv5te-angstrom-linux-gnueabi"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-jpeg=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-jpeg=3D"gtk+"

# LD=3D${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS}
export LD=3D"arm-angstrom-linux-gnueabi-ld"

# HOST_VENDOR=3D${TARGET_VENDOR}
HOST_VENDOR=3D"-angstrom"

# QEMU_OPTIONS_armv6-novfp=3D-cpu arm1136
QEMU_OPTIONS_armv6-novfp=3D"-cpu arm1136"

# PATCHRESOLVE=3Dnoop
PATCHRESOLVE=3D"noop"

# PREFERRED_VERSION_opie-quicklauncher=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-quicklauncher=3D"1.2.4"

# HOST_OS=3D${TARGET_OS}
HOST_OS=3D"linux-gnueabi"

# PREFERRED_VERSION_eglibc-initial=3D2.9
PREFERRED_VERSION_eglibc-initial=3D"2.9"

# EXTRA_OEMAKE=3D
# PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial=3DNone
# SECTION_libsoup-2.4-doc=3Ddoc
SECTION_libsoup-2.4-doc=3D"doc"

# PREFERRED_VERSION_opie-multikeyapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-multikeyapplet=3D"1.2.4"

# UDEV_GE_141=3D1
UDEV_GE_141=3D"1"

# TARGET_FPU_armv6=3Dhard
TARGET_FPU_armv6=3D"hard"

# LDFLAGS=3D${TARGET_LDFLAGS}
export LDFLAGS=3D"-L/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/ar=
mv5te-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/home/DRESEARCH/sledz/=
work/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-=
O1 -Wl,--hash-style=3Dgnu"

# DISTRO_TYPE=3Ddebug
DISTRO_TYPE=3D"debug"

# layout_prefix=3D${prefix}
layout_prefix=3D"/usr"

# HOST_NONSYSV=3DNone
# PREFERRED_VERSION_opie-style-phase=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-style-phase=3D"1.2.4"

# MULTIMACH_TARGET_SYS=3D${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}
MULTIMACH_TARGET_SYS=3D"armv5te-angstrom-linux-gnueabi"

# PREFERRED_VERSION_libtool-cross=3D2.2.6b
PREFERRED_VERSION_libtool-cross=3D"2.2.6b"

# FREEBSD_MIRROR=3Dftp://ftp.freebsd.org/pub/FreeBSD/
FREEBSD_MIRROR=3D"ftp://ftp.freebsd.org/pub/FreeBSD/"

# PREFERRED_VERSION_binutils-cross=3D${ANGSTROM_BINUTILS_VERSION}
PREFERRED_VERSION_binutils-cross=3D"2.18"

# COLORTERM=3D1
export COLORTERM=3D"1"

# EXTRA_AUTORECONF=3D--exclude=3Dautopoint
EXTRA_AUTORECONF=3D"--exclude=3Dautopoint"

# PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils=3DNone
# THUMB_INTERWORK=3Dyes
THUMB_INTERWORK=3D"yes"

# SRCREV_pn-twitter-glib=3D849bec29292df88590e0b2898b50b9b8d766817e
SRCREV_pn-twitter-glib=3D"849bec29292df88590e0b2898b50b9b8d766817e"

# PREFERRED_VERSION_qt4-embedded-gles=3D${ANGSTROM_QT_VERSION}
PREFERRED_VERSION_qt4-embedded-gles=3D"4.6.3"

# EXTRA_IMAGECMD_squashfs=3D
# SYSVINIT_ENABLED_GETTYS=3DNone
# SYSROOTEXTRALIBDIRSED=3D
# DISTRO_EXTRA_RRECOMMENDS=3D  kernel-module-vfat kernel-module-ext2 kernel=
-module-ext3 kernel-module-af-packet avahi-daemon avahi-autoipd openssh-sft=
p-server ${DEBUG_APPS}=20
DISTRO_EXTRA_RRECOMMENDS=3D"kernel-module-vfat kernel-module-ext2 kernel-mo=
dule-ext3 kernel-module-af-packet avahi-daemon avahi-autoipd openssh-sftp-s=
erver  strace procps"

# TARGET_CXXFLAGS=3D${TARGET_CFLAGS} -fpermissive
export TARGET_CXXFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp=
.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimiza=
tions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive"

# PREFERRED_VERSION_opie-qss=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-qss=3D"1.2.4"

# PREFERRED_VERSION_opie-vtapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-vtapplet=3D"1.2.4"

# SOLIBSDEV=3D.so
SOLIBSDEV=3D".so"

# BUILD_ARCH=3Di686
BUILD_ARCH=3D"i686"

# GNOME_TERMCMD=3Dgnome-terminal --disable-factory -t "$TERMWINDOWTITLE"
GNOME_TERMCMD=3D"gnome-terminal --disable-factory -t \"$TERMWINDOWTITLE\""

# HOST_SYS=3D${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}
HOST_SYS=3D"arm-angstrom-linux-gnueabi"

# TOOLCHAIN_PATH=3D${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARC=
H}
TOOLCHAIN_PATH=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686=
-linux/usr/armv5te"

# PREFERRED_VERSION_libgemwidget=3D1.0
PREFERRED_VERSION_libgemwidget=3D"1.0"

# MAKE=3Dmake
export MAKE=3D"make"

# PREFERRED_VERSION_opie-securityplugin-blueping=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-securityplugin-blueping=3D"1.2.4"

# PREFERRED_VERSION_libqpe-opie=3D${OPIE_VERSION}
PREFERRED_VERSION_libqpe-opie=3D"1.2.4"

# UPDATECOMMAND_svn=3D/usr/bin/env svn update --non-interactive --force --a=
ccept theirs-full ${SVNCOOPTS}
UPDATECOMMAND_svn=3D"/usr/bin/env svn update --non-interactive --force --ac=
cept theirs-full ${SVNCOOPTS}"

# PKGV=3D${PV}
PKGV=3D"2.29.91"

# IMAGE_CMD_cramfs=3Dmkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_N=
AME}.rootfs.cramfs ${EXTRA_IMAGECMD}
IMAGE_CMD_cramfs=3D"mkcramfs /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/ro=
otfs/libsoup-2.4 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/i=
mages/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootf=
s.cramfs"

# includedir=3D${exec_prefix}/include
export includedir=3D"/usr/include"

# layout_infodir=3D${infodir}
layout_infodir=3D"/usr/share/info"

# TARGET_CPPFLAGS=3D-isystem${STAGING_DIR_TARGET}${includedir}
export TARGET_CPPFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp=
.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include"

# RRECOMMENDS_${PN}-dbg=3DNone
# PREFERRED_VERSION_opie-dvorak=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-dvorak=3D"1.2.4"

# IMAGE_CMD_cpio.gz=3Dcd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzi=
p -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD=
}
IMAGE_CMD_cpio.gz=3D"cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/=
libsoup-2.4 && (find . | cpio -o -H newc | gzip -c -9 >/home/DRESEARCH/sled=
z/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/Angstrom-libsoup-2.4-glib=
c-ipk-2010.7-test-20110203-hipox.rootfs.cpio.gz)"

# SELECTED_OPTIMIZATION=3D${@bb.data.getVar(['FULL_OPTIMIZATION', 'DEBUG_OP=
TIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) =3D=3D '1'], d, 1)}
SELECTED_OPTIMIZATION=3D"-fexpensive-optimizations -frename-registers -fomi=
t-frame-pointer -O2 -ggdb2"

# PCMCIA_MANAGER=3Dpcmciautils
PCMCIA_MANAGER=3D"pcmciautils"

# PREFERRED_VERSION_ti-dmai-apps=3D2_10_00_01+svnr%
PREFERRED_VERSION_ti-dmai-apps=3D"2_10_00_01+svnr%"

# OE_HOME=3D/home/DRESEARCH/sledz/work/HydraIP/OE
export OE_HOME=3D"/home/DRESEARCH/sledz/work/HydraIP/OE"

# PREFERRED_VERSION_ti-biosutils=3D1_02_02
PREFERRED_VERSION_ti-biosutils=3D"1_02_02"

# STAGING_DIR_NATIVE=3D${STAGING_DIR}/${BUILD_SYS}
STAGING_DIR_NATIVE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/=
i686-linux"

# PREFERRED_PROVIDER_opkg=3Dopkg
PREFERRED_PROVIDER_opkg=3D"opkg"

# FILESPATHBASE=3D${FILE_DIRNAME}
FILESPATHBASE=3D"/home/DRESEARCH/sledz/work/openembedded/recipes/gnome"

# PREFERRED_VERSION_glibmm=3D2.24.0
PREFERRED_VERSION_glibmm=3D"2.24.0"

# PREFERRED_VERSION_opie-mediaplayer2-skin-default-landscape=3D${OPIE_VERSI=
ON}
PREFERRED_VERSION_opie-mediaplayer2-skin-default-landscape=3D"1.2.4"

# MACHINE_TASK_PROVIDER=3D${DEFAULT_TASK_PROVIDER}
MACHINE_TASK_PROVIDER=3D"task-base"

# FILE=3D/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4_=
2.29.91.bb
FILE=3D"/home/DRESEARCH/sledz/work/openembedded/recipes/gnome/libsoup-2.4_2=
.29.91.bb"

# PREFERRED_VERSION_libopie2=3D${OPIE_VERSION}
PREFERRED_VERSION_libopie2=3D"1.2.4"

# PREFERRED_VERSION_opie-mobilemsg=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mobilemsg=3D"1.2.4"

# PREFERRED_VERSION_ti-local-power-manager=3D1_24_01
PREFERRED_VERSION_ti-local-power-manager=3D"1_24_01"

# EXTENDPKGEVER=3D${@['','${PKGE\x7d:'][bb.data.getVar('PKGE',d,1) > 0]}
# IMAGE_CMD_ubi=3Decho \[ubifs\] > ubinize.cfg ; echo mode=3Dubi >> ubinize=
.cfg ; echo image=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubini=
ze.cfg ; echo vol_id=3D0 >> ubinize.cfg ; echo vol_type=3Ddynamic >> ubiniz=
e.cfg ; echo vol_name=3D${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=3Dau=
toresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE=
}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMA=
GE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
IMAGE_CMD_ubi=3D"echo \[ubifs\] > ubinize.cfg ; echo mode=3Dubi >> ubinize.=
cfg ; echo image=3D/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc=
/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.roo=
tfs.ubifs >> ubinize.cfg ; echo vol_id=3D0 >> ubinize.cfg ; echo vol_type=
=3Ddynamic >> ubinize.cfg ; echo vol_name=3Dhipox-rootfs >> ubinize.cfg ; e=
cho vol_flags=3Dautoresize >> ubinize.cfg;mkfs.ubifs -r /home/DRESEARCH/sle=
dz/work/HydraIP/OE/tmp.6/rootfs/libsoup-2.4 -o /home/DRESEARCH/sledz/work/H=
ydraIP/OE/tmp.6/deploy/glibc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-20=
10.7-test-20110203-hipox.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o /home/D=
RESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/Angstrom-lib=
soup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ubi ${UBINIZE_ARGS} ub=
inize.cfg"

# libdir_native=3D${prefix_native}/lib
libdir_native=3D"/usr/lib"

# PSTAGE_BUILD_CMD=3Dstage-manager-ipkg-build -o 0 -g 0
PSTAGE_BUILD_CMD=3D"stage-manager-ipkg-build -o 0 -g 0"

# IMAGE_CMD_ext2.bz2=3Dinstall -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -=
b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAM=
E}.rootfs.ext2 ${EXTRA_IMAGECMD}; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/$=
{IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.root=
fs.ext2.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.bz2
IMAGE_CMD_ext2.bz2=3D"install -d /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/deploy/glibc/images/hipox/tmp.bz2 ; genext2fs -b ${ROOTFS_SIZE} -d /home/=
DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/libsoup-2.4 /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.bz2/Angstrom-libsou=
p-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext2 ; bzip2 -f -9 /home/=
DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.bz2/Ang=
strom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext2; mv /hom=
e/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.bz2/A=
ngstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext2.bz2 /h=
ome/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/Angstro=
m-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext2.bz2"

# acpaths=3Ddefault
acpaths=3D"default"

# PREFERRED_VERSION_libopietooth1=3D${OPIE_VERSION}
PREFERRED_VERSION_libopietooth1=3D"1.2.4"

# PREFERRED_PROVIDER_dbus-glib=3Ddbus-glib
PREFERRED_PROVIDER_dbus-glib=3D"dbus-glib"

# FILES_${PN}-doc=3DNone
# layout_includedir=3D${includedir}
layout_includedir=3D"/usr/include"

# ARM_INTERWORK_M_OPT=3D${@['-mno-thumb-interwork', '-mthumb-interwork'][bb=
.data.getVar('THUMB_INTERWORK', d, 1) =3D=3D 'yes']}
ARM_INTERWORK_M_OPT=3D"-mthumb-interwork"

# PREFERRED_VERSION_networkmanager=3D0.8.1
PREFERRED_VERSION_networkmanager=3D"0.8.1"

# BBFILE_PATTERN_local=3D^${OE_HOME}/hipox/recipes/
BBFILE_PATTERN_local=3D"^/home/DRESEARCH/sledz/work/HydraIP/OE/hipox/recipe=
s/"

# PRIORITY=3Doptional
PRIORITY=3D"optional"

# PREFERRED_VERSION_binutils=3D${ANGSTROM_BINUTILS_VERSION}
PREFERRED_VERSION_binutils=3D"2.18"

# BBMASK=3D${@base_conditional('ENTERPRISE_DISTRO', '1', base_conditional('=
OLDBBMASK', '', '', '(${OLDBBMASK})|', d) + '(mp3blaster|mpg123|mpg321|smpe=
g|liba52|lame|libmad|mpeg2dec|xmms-mad|madplay|python-mad|opie-mediaplayer1=
-libmadplugin|ffmpeg|mplayer)', '${OLDBBMASK}', d)}
# OPIEDIR=3D${STAGING_DIR_HOST}
export OPIEDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv=
5te-angstrom-linux-gnueabi"

# FEED_ARCH_bfin=3Dblackfin
FEED_ARCH_bfin=3D"blackfin"

# PREFERRED_VERSION_libtool-sdk=3D2.2.6b
PREFERRED_VERSION_libtool-sdk=3D"2.2.6b"

# PREFERRED_VERSION_mythplugins=3D0.22
PREFERRED_VERSION_mythplugins=3D"0.22"

# SEPPUKU_QUERY=3Dhttp://bugs.openembedded.net/buglist.cgi?
SEPPUKU_QUERY=3D"http://bugs.openembedded.net/buglist.cgi?"

# PREFERRED_PROVIDER_bluez-utils-dbus=3Dbluez-utils
PREFERRED_PROVIDER_bluez-utils-dbus=3D"bluez-utils"

# SECTION=3Dx11/gnome/libs
SECTION=3D"x11/gnome/libs"

# DISTRO_PR=3D.6
DISTRO_PR=3D".6"

# TARGET_FPU_armv6-novfp=3Dsoft
TARGET_FPU_armv6-novfp=3D"soft"

# SDK_CC_ARCH=3D${BUILD_CC_ARCH}
# MAINTAINER=3DAngstrom Developers <angstrom-distro-devel@linuxtogo.org>
MAINTAINER=3D"Angstrom Developers <angstrom-distro-devel@linuxtogo.org>"

# DISTRO_NAME=3DAngstrom
DISTRO_NAME=3D"Angstrom"

# GROUP_locale=3DNone
# BUILD_CC=3D${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}
export BUILD_CC=3D"gcc"

# BUILD_LDFLAGS=3D-L${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_LIBD=
IR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1
export BUILD_LDFLAGS=3D"-L/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysro=
ots/i686-linux/usr/lib -Wl,-rpath-link,/home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.6/sysroots/i686-linux/usr/lib -Wl,-rpath,/home/DRESEARCH/sledz/work/H=
ydraIP/OE/tmp.6/sysroots/i686-linux/usr/lib -Wl,-O1"

# UBI_VOLNAME=3D${MACHINE}-rootfs
UBI_VOLNAME=3D"hipox-rootfs"

# EXTRA_IMAGECMD_ubi=3D
# STAGING_LIBDIR=3D${STAGING_DIR_HOST}${libdir}
STAGING_LIBDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv=
5te-angstrom-linux-gnueabi/usr/lib"

# PREFERRED_VERSION_gtk+=3D2.20.1
PREFERRED_VERSION_gtk+=3D"2.20.1"

# CONFIG_SITE=3D${@' '.join(_autotools_get_sitefiles(d))}
export CONFIG_SITE=3D"/home/DRESEARCH/sledz/work/openembedded/site/endian-l=
ittle /home/DRESEARCH/sledz/work/openembedded/site/arm-common /home/DRESEAR=
CH/sledz/work/openembedded/site/common-linux /home/DRESEARCH/sledz/work/ope=
nembedded/site/common-glibc /home/DRESEARCH/sledz/work/openembedded/site/ar=
m-linux /home/DRESEARCH/sledz/work/openembedded/site/common"

# OPKG_SRCREV=3D554
OPKG_SRCREV=3D"554"

# TARGET_ARCH=3Darm
unset TARGET_ARCH

# PREFERRED_VERSION_dbus=3D1.2.24
PREFERRED_VERSION_dbus=3D"1.2.24"

# FETCHCMD_cvs=3D/usr/bin/env cvs
FETCHCMD_cvs=3D"/usr/bin/env cvs"

# PREFERRED_PROVIDER_virtual/alsa-scenarios=3Dfsodeviced
PREFERRED_PROVIDER_virtual/alsa-scenarios=3D"fsodeviced"

# PREFERRED_VERSION_opie-aqpkg=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-aqpkg=3D"1.2.4"

# CXXFLAGS=3D${TARGET_CXXFLAGS} -fvisibility-inlines-hidden
export CXXFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysr=
oots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -=
frename-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility=
-inlines-hidden"

# BUILD_F77=3D${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}
export BUILD_F77=3D"g77"

# PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc=3Dglib=
c
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc=3D"glibc=
"

# PREFERRED_VERSION_linux-libc-headers-native=3D${LINUX_LIBC_HEADERS_VERSIO=
N}
PREFERRED_VERSION_linux-libc-headers-native=3D"2.6.31"

# PREFERRED_VERSION_ti-codecs-dm355-server=3D1_13_000
PREFERRED_VERSION_ti-codecs-dm355-server=3D"1_13_000"

# STAGING_IDLDIR=3D${STAGING_DATADIR}/idl
export STAGING_IDLDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/armv5te-angstrom-linux-gnueabi/usr/share/idl"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-ani=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-ani=3D"gtk+"

# insane_do_package_write=3D	package_do_package_write

insane_do_package_write=3D"package_do_package_write"

# PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate=3DNone
# layout_sbindir=3D${sbindir}
layout_sbindir=3D"/usr/sbin"

# BB_LOCALCOUNT_OVERRIDE=3D1
BB_LOCALCOUNT_OVERRIDE=3D"1"

# GENTOO_MIRROR=3Dhttp://distfiles.gentoo.org/distfiles
GENTOO_MIRROR=3D"http://distfiles.gentoo.org/distfiles"

# CO_DIR=3D${DL_DIR}
CO_DIR=3D"/home/DRESEARCH/sledz/sources"

# bindir=3D${exec_prefix}/bin
export bindir=3D"/usr/bin"

# FILES_libsoup-2.4-static=3D${libdir}/*.a ${base_libdir}/*.a
FILES_libsoup-2.4-static=3D"/usr/lib/*.a /lib/*.a"

# PREFERRED_VERSION_opie-zsame=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-zsame=3D"1.2.4"

# ALLOW_EMPTY_${PN}-dbg=3DNone
# PREFERRED_VERSION_opie-alarm=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-alarm=3D"1.2.4"

# QUILTRCFILE=3D${STAGING_BINDIR_NATIVE}/quiltrc
QUILTRCFILE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-li=
nux/usr/bin/quiltrc"

# PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-initial=3Dglib=
c-initial
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-initial=3D"glibc=
-initial"

# DEPLOY_DIR_DEB=3D${DEPLOY_DIR}/deb
DEPLOY_DIR_DEB=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/=
deb"

# TARGET_VENDOR=3D-angstrom
TARGET_VENDOR=3D"-angstrom"

# BUILD_PREFIX=3D
# EXTRA_IMAGECMD_cpio.lzma=3D
# TOOLCHAIN_BRAND=3D
# PREFERRED_VERSION_opie-unikeyboard=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-unikeyboard=3D"1.2.4"

# BOOTSTRAP_EXTRA_RDEPENDS=3D
# PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-g++=3Dgcc-cross
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-g++=3D"gcc-cross"

# BUILD_LD=3D${BUILD_PREFIX}ld
export BUILD_LD=3D"ld"

# PREFERRED_VERSION_opie-kpacman=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-kpacman=3D"1.2.4"

# BUILD_SYS=3D${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}
BUILD_SYS=3D"i686-linux"

# PREFERRED_VERSION_opie-autorotateapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-autorotateapplet=3D"1.2.4"

# STAGING_INCDIR=3D${STAGING_DIR_HOST}${includedir}
STAGING_INCDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv=
5te-angstrom-linux-gnueabi/usr/include"

# EXTRA_IMAGECMD_ubifs=3D
# PREFERRED_VERSION_ti-codecs-dm6446-server=3D2_05_00_00
PREFERRED_VERSION_ti-codecs-dm6446-server=3D"2_05_00_00"

# PREFERRED_VERSION_glib-2.0=3D2.24.1
PREFERRED_VERSION_glib-2.0=3D"2.24.1"

# BB_ENV_EXTRAWHITE=3DOE_HOME OE_ROOT
export BB_ENV_EXTRAWHITE=3D"OE_HOME OE_ROOT"

# STAGING_DIR_SDK=3D${STAGING_DIR}/${SDK_SYS}
STAGING_DIR_SDK=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i68=
6-linux"

# sysconfdir_native=3D/etc
sysconfdir_native=3D"/etc"

# exec_prefix=3D/usr
export exec_prefix=3D"/usr"

# PREFERRED_VERSION_pango-native=3D1.24.4
PREFERRED_VERSION_pango-native=3D"1.24.4"

# PREFERRED_PROVIDER_hotplug=3Dudev
PREFERRED_PROVIDER_hotplug=3D"udev"

# SDK_EXEEXT=3D
# SELECTED_OPTIMIZATION_pn-libsoup=3D${PROFILE_OPTIMIZATION}
SELECTED_OPTIMIZATION_pn-libsoup=3D"-pg"

# PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++=3DNone
# PREFERRED_VERSION_opie-todo=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-todo=3D"1.2.4"

# IMAGE_ROOTFS_SIZE_ext3=3D65536
IMAGE_ROOTFS_SIZE_ext3=3D"65536"

# IMAGE_ROOTFS_SIZE_ext2=3D65536
IMAGE_ROOTFS_SIZE_ext2=3D"65536"

# PREFERRED_VERSION_automake=3D1.11.1
PREFERRED_VERSION_automake=3D"1.11.1"

# IMAGE_CMD_squashfs=3Dmksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMA=
GE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend
IMAGE_CMD_squashfs=3D"mksquashfs /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/rootfs/libsoup-2.4 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/gli=
bc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.r=
ootfs.squashfs  -noappend"

# STAGING_EXECPREFIXDIR=3D${STAGING_DIR_HOST}${exec_prefix}
STAGING_EXECPREFIXDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/armv5te-angstrom-linux-gnueabi/usr"

# PREFERRED_VERSION_opie-freetype=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-freetype=3D"1.2.4"

# PATCHDEPENDENCY=3D${PATCHTOOL}-native:do_populate_sysroot
PATCHDEPENDENCY=3D"quilt-native:do_populate_sysroot"

# PREFERRED_VERSION_opie-screenshotapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-screenshotapplet=3D"1.2.4"

# PREFERRED_VERSION_opie-sh-snes=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-sh-snes=3D"1.2.4"

# layout_exec_prefix=3D${exec_prefix}
layout_exec_prefix=3D"/usr"

# PREFERRED_VERSION_opie-bluetoothapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-bluetoothapplet=3D"1.2.4"

# LANG=3Den_US.UTF-8
export LANG=3D"en_US.UTF-8"

# PREFERRED_VERSION_opie-performance=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-performance=3D"1.2.4"

# PREFERRED_VERSION_opie-datebook=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-datebook=3D"1.2.4"

# DEPENDS_virtclass-native=3D${@autotools_deps(d)}${@base_deps(d)}=20
DEPENDS_virtclass-native=3D"autoconf-native automake-native libtool-native =
libtool-cross gnu-config-native coreutils-native virtual/arm-angstrom-linux=
-gnueabi-gcc virtual/libc"

# PREFERRED_VERSION_opie-datebook-chrisholidayplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-datebook-chrisholidayplugin=3D"1.2.4"

# SEPPUKU_PRODUCT=3DOpenembedded
SEPPUKU_PRODUCT=3D"Openembedded"

# PREFERRED_VERSION_opie-clipboardapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-clipboardapplet=3D"1.2.4"

# HOME=3D/home/DRESEARCH/sledz
export HOME=3D"/home/DRESEARCH/sledz"

# PREFERRED_VERSION_opie-clock=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-clock=3D"1.2.4"

# FETCHCOMMAND_wget=3D/usr/bin/env 'PATH=3D${PATH}' wget -t 5 --passive-ftp=
 --no-check-certificate -P ${DL_DIR} '${URI}'
FETCHCOMMAND_wget=3D"/usr/bin/env 'PATH=3D/home/DRESEARCH/sledz/work/HydraI=
P/OE/tmp.6/sysroots/i686-linux/usr/armv5te/bin:/home/DRESEARCH/sledz/work/H=
ydraIP/OE/tmp.6/sysroots/i686-linux/usr/sbin:/home/DRESEARCH/sledz/work/Hyd=
raIP/OE/tmp.6/sysroots/i686-linux/usr/bin:/home/DRESEARCH/sledz/work/HydraI=
P/OE/tmp.6/sysroots/i686-linux/sbin:/home/DRESEARCH/sledz/work/HydraIP/OE/t=
mp.6/sysroots/i686-linux//bin:/opt/bitbake/bin:/opt/avr/bin/:/opt/avr/bin/:=
/home/DRESEARCH/sledz/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X1=
1R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:/opt/gn=
ome/bin:/usr/lib/qt3/bin:/usr/sbin:/sbin:/usr/sbin:/sbin' wget -t 5 --passi=
ve-ftp --no-check-certificate -P /home/DRESEARCH/sledz/sources '${URI}'"

# KERNEL_CCSUFFIX_archos5=3D-4.2.1+csl-arm-2007q3-53
KERNEL_CCSUFFIX_archos5=3D"-4.2.1+csl-arm-2007q3-53"

# PREFERRED_VERSION_opie-today-stocktickerplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-today-stocktickerplugin=3D"1.2.4"

# PREFERRED_VERSION_opie-mediaplayer1=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer1=3D"1.2.4"

# FETCHCMD_svn=3D/usr/bin/env svn --non-interactive
FETCHCMD_svn=3D"/usr/bin/env svn --non-interactive"

# ENTERPRISE_DISTRO=3D0
ENTERPRISE_DISTRO=3D"0"

# RRECOMMENDS_libsoup-2.4-dbg=3D${PN} (=3D ${EXTENDPV})
RRECOMMENDS_libsoup-2.4-dbg=3D"libsoup-2.4 (=3D 2.29.91-r0.6)"

# PREFERRED_VERSION_classpath-initial=3D0.93
PREFERRED_VERSION_classpath-initial=3D"0.93"

# GPE_EXTRA_SVN=3Dsvn://projects.linuxtogo.org/svn/gpe/trunk/extra;module=
=3D${PN}
GPE_EXTRA_SVN=3D"svn://projects.linuxtogo.org/svn/gpe/trunk/extra;module=3D=
libsoup-2.4"

# oldincludedir=3D${exec_prefix}/include
export oldincludedir=3D"/usr/include"

# PREFERRED_VERSION_opie-helpbrowser=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-helpbrowser=3D"1.2.4"

# PSTAGE_PKGPATH=3D${DISTRO}${PSTAGE_EXTRAPATH}
PSTAGE_PKGPATH=3D"angstromglibc"

# TERMCMDRUN=3D${GNOME_TERMCMDRUN}
TERMCMDRUN=3D"gnome-terminal --disable-factory -t \"$TERMWINDOWTITLE\" -x $=
SHELLCMDS"

# PREFERRED_VERSION_openssl=3D1.0.0a
PREFERRED_VERSION_openssl=3D"1.0.0a"

# PREFERRED_VERSION_opie-mediaplayer2-skin-default=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer2-skin-default=3D"1.2.4"

# PREFERRED_PROVIDER_virtual/kernel=3Dlinux
PREFERRED_PROVIDER_virtual/kernel=3D"linux"

# IPKGCONF_CANSDK=3D${STAGING_ETCDIR_NATIVE}/opkg-canadian-sdk.conf
IPKGCONF_CANSDK=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i68=
6-linux/etc/opkg-canadian-sdk.conf"

# DEPENDS_virtclass-nativesdk=3D${@autotools_deps(d)}${@base_deps(d)}=20
DEPENDS_virtclass-nativesdk=3D"autoconf-native automake-native libtool-nati=
ve libtool-cross gnu-config-native coreutils-native virtual/arm-angstrom-li=
nux-gnueabi-gcc virtual/libc"

# base_sbindir=3D${base_prefix}/sbin
export base_sbindir=3D"/sbin"

# ARM_INSTRUCTION_SET_pn-uclibc-initial=3Darm
ARM_INSTRUCTION_SET_pn-uclibc-initial=3D"arm"

# PSTAGE_LIST_CMD=3D${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -o ${TMPDI=
R} list_installed
PSTAGE_LIST_CMD=3D"stage-manager-ipkg -f /home/DRESEARCH/sledz/work/HydraIP=
/OE/tmp.6/pstage/opkg.conf -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6 l=
ist_installed"

# SERIAL_CONSOLE=3D115200 ttyS1
SERIAL_CONSOLE=3D"115200 ttyS1"

# PREFERRED_VERSION_opie-wordgame=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-wordgame=3D"1.2.4"

# TINDER_URL=3D/tinderbox
TINDER_URL=3D"/tinderbox"

# PREFERRED_VERSION_samba=3D3.3.9
PREFERRED_VERSION_samba=3D"3.3.9"

# SCREEN_TERMCMDRUN=3D${SCREEN_TERMCMD} $SHELLCMDS
SCREEN_TERMCMDRUN=3D"screen -D -m -t \"$TERMWINDOWTITLE\" $SHELLCMDS"

# PREFERRED_VERSION_libtool=3D2.2.6b
PREFERRED_VERSION_libtool=3D"2.2.6b"

# CCLD=3D${CC}
export CCLD=3D"arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm=
926ej-s -mthumb-interwork -mno-thumb"

# TIME=3D095327
TIME=3D"095327"

# IMAGE_DEPENDS_cpio.lzma=3Dlzma-native
IMAGE_DEPENDS_cpio.lzma=3D"lzma-native"

# SDK_CFLAGS=3D${SDK_CPPFLAGS} ${SELECTED_OPTIMIZATION}
export SDK_CFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sy=
sroots/i686-linux/usr/include -isystem/home/DRESEARCH/sledz/work/HydraIP/OE=
/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-opti=
mizations -frename-registers -fomit-frame-pointer -O2 -ggdb2"

# PREFERRED_VERSION_opie-button-settings=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-button-settings=3D"1.2.4"

# SRCREV_pn-xf86-video-psb=3Db6b3bba06fe5a3fe0b1bd6e31a7369dd83812bab
SRCREV_pn-xf86-video-psb=3D"b6b3bba06fe5a3fe0b1bd6e31a7369dd83812bab"

# PREFERRED_VERSION_gcc=3D${ANGSTROM_GCC_VERSION}
PREFERRED_VERSION_gcc=3D"4.3.3"

# SHELLCMDS=3D${SHELLRCCMD}
export SHELLCMDS=3D"bash --rcfile $TERMRCFILE"

# KERNEL=3Dkernel26
KERNEL=3D"kernel26"

# PREFERRED_VERSION_opie-odict=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-odict=3D"1.2.4"

# IMAGE_CMD_ubifs=3Dmkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}
IMAGE_CMD_ubifs=3D"mkfs.ubifs -r /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/rootfs/libsoup-2.4 -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/=
glibc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipo=
x.ubifs.img ${MKUBIFS_ARGS}"

# TARGET_FPU_arm=3Dsoft
TARGET_FPU_arm=3D"soft"

# SEPPUKU_USER=3DNone
# IMAGE_DEPENDS_cramfs=3Dcramfs-native
IMAGE_DEPENDS_cramfs=3D"cramfs-native"

# FEED_DEPLOYDIR_BASE_URI=3DNone
# PREFERRED_PROVIDER_virtual/java-native=3Djamvm-native
PREFERRED_PROVIDER_virtual/java-native=3D"jamvm-native"

# DEBIAN_NAMES=3D1
DEBIAN_NAMES=3D"1"

# QPEDIR=3D${STAGING_DIR_HOST}
export QPEDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5=
te-angstrom-linux-gnueabi"

# PREFERRED_VERSION_opie-i18n=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-i18n=3D"1.2.4"

# PSTAGE_TMPDIR_STAGE=3D${WORKDIR}/staging-pkg
PSTAGE_TMPDIR_STAGE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/arm=
v5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg"

# DEPCHAIN_POST=3D-dev -dbg
DEPCHAIN_POST=3D"-dev -dbg"

# BUILD_OPTIMIZATION_pn-perl-native=3D-O1 -g
BUILD_OPTIMIZATION_pn-perl-native=3D"-O1 -g"

# QA_LOG=3D1
QA_LOG=3D"1"

# PREFERRED_VERSION_ti-lpm-module=3D1_24_01
PREFERRED_VERSION_ti-lpm-module=3D"1_24_01"

# SRCREV_pn-json-glib=3D930fdf4c4dff1f5310a946c2a9f5b6860f7c8ba8
SRCREV_pn-json-glib=3D"930fdf4c4dff1f5310a946c2a9f5b6860f7c8ba8"

# PREFERRED_PROVIDER_virtual/libqpe1=3Dlibqpe-opie
PREFERRED_PROVIDER_virtual/libqpe1=3D"libqpe-opie"

# PREFERRED_VERSION_opie-aboutapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-aboutapplet=3D"1.2.4"

# PREFERRED_VERSION_opie-kbill=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-kbill=3D"1.2.4"

# LDFLAGS_pn-libgupnp=3D-pg=20
LDFLAGS_pn-libgupnp=3D"-pg"

# TINDER_BRANCH=3Dorg.openembedded.dev
TINDER_BRANCH=3D"org.openembedded.dev"

# TARGET_FPU_armeb=3Dsoft
TARGET_FPU_armeb=3D"soft"

# BUILD_CCLD=3D${BUILD_PREFIX}gcc
export BUILD_CCLD=3D"gcc"

# IMAGE_NAME=3D${DISTRO_NAME}-${IMAGE_BASENAME}-${LIBC}-${ANGSTROM_PKG_FORM=
AT}-${DISTRO_VERSION}-${MACHINE}
IMAGE_NAME=3D"Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox"

# PREFERRED_PROVIDER_virtual/libsdl=3Dlibsdl-x11
PREFERRED_PROVIDER_virtual/libsdl=3D"libsdl-x11"

# PREFERRED_VERSION_opie-light-and-power=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-light-and-power=3D"1.2.4"

# PREFERRED_VERSION_ti-dsplink-module=3D1_64
PREFERRED_VERSION_ti-dsplink-module=3D"1_64"

# SOLIBSDEV_darwin=3D.dylib
SOLIBSDEV_darwin=3D".dylib"

# PREFERRED_VERSION_ti-codecs_omapl138=3D1_00_00
PREFERRED_VERSION_ti-codecs_omapl138=3D"1_00_00"

# GROUP_packaging=3DNone
# PREFERRED_VERSION_ti-codecs_omapl137=3D1_00_00
PREFERRED_VERSION_ti-codecs_omapl137=3D"1_00_00"

# LDFLAGS_pn-libgssdp=3D-pg=20
LDFLAGS_pn-libgssdp=3D"-pg"

# B=3D${S}
B=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linu=
x-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91"

# GROUP_fetcher=3DNone
# SECTION_libsoup-2.4-dev=3Ddevel
SECTION_libsoup-2.4-dev=3D"devel"

# PREFERRED_VERSION_opie-securityplugin-notice=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-securityplugin-notice=3D"1.2.4"

# PREFERRED_VERSION_mesa=3D7.6
PREFERRED_VERSION_mesa=3D"7.6"

# OVERRIDES=3Dlocal:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-=
${BUILD_OS}:fail-fast:pn-${PN}:${FEED_ARCH}:${SOC_FAMILY}:libc-glibc${OVERR=
IDE_THUMB}${OVERRIDE_INTERWORK}
OVERRIDES=3D"local:hipox:angstrom:linux-gnueabi:arm:build-linux:fail-fast:p=
n-libsoup-2.4:armv5te:Unknown:libc-glibc:thumb-interwork"

# TARGET_FPU_ppc405=3Dsoft
TARGET_FPU_ppc405=3D"soft"

# INHERIT=3D devshell src_distribute_local debian sanity angstrom devshell =
angstrom-mirrors insane recipe_sanity testlab package_ipk sanity
INHERIT=3D"devshell src_distribute_local debian sanity angstrom devshell an=
gstrom-mirrors insane recipe_sanity testlab package_ipk sanity"

# BBPATH=3D/home/DRESEARCH/sledz/work/HydraIP/OE/:/home/DRESEARCH/sledz/wor=
k/HydraIP/OE/hipox:/home/DRESEARCH/sledz/work/HydraIP/OE/common:/home/DRESE=
ARCH/sledz/work/openembedded
export BBPATH=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/:/home/DRESEARCH/sle=
dz/work/HydraIP/OE/hipox:/home/DRESEARCH/sledz/work/HydraIP/OE/common:/home=
/DRESEARCH/sledz/work/openembedded"

# IMAGE_DEPENDS_yaffs2=3Dyaffs2-utils-native
IMAGE_DEPENDS_yaffs2=3D"yaffs2-utils-native"

# PREFERRED_VERSION_gtk+-native=3D2.20.1
PREFERRED_VERSION_gtk+-native=3D"2.20.1"

# XTERM_TERMCMD=3Dxterm -T "$TERMWINDOWTITLE"
XTERM_TERMCMD=3D"xterm -T \"$TERMWINDOWTITLE\""

# layout_bindir=3D${bindir}
layout_bindir=3D"/usr/bin"

# SDK_SYS=3D${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1=
), ''][bb.data.getVar('SDK_OS', d, 1) =3D=3D ('' or 'custom')]}
SDK_SYS=3D"i686-linux"

# OLDBBMASK=3D
# PREFERRED_VERSION_ti-edma3lld=3D01_11_00_03
PREFERRED_VERSION_ti-edma3lld=3D"01_11_00_03"

# BBFILE_PRIORITY=3D10
BBFILE_PRIORITY=3D"10"

# PREMIRRORS=3Dcvs://.*/.* http://www.angstrom-distribution.org/unstable/so=
urces/
svn://.*/.* http://www.angstrom-distribution.org/unstable/sources/
git://.*/.* http://www.angstrom-distribution.org/unstable/sources/
hg://.*/.* http://www.angstrom-distribution.org/unstable/sources/
bzr://.*/.* http://www.angstrom-distribution.org/unstable/sources/

PREMIRRORS=3D"cvs://.*/.* http://www.angstrom-distribution.org/unstable/sou=
rces/
svn://.*/.* http://www.angstrom-distribution.org/unstable/sources/
git://.*/.* http://www.angstrom-distribution.org/unstable/sources/
hg://.*/.* http://www.angstrom-distribution.org/unstable/sources/
bzr://.*/.* http://www.angstrom-distribution.org/unstable/sources/"

# PREFERRED_VERSION_libgpephone=3D0.4
PREFERRED_VERSION_libgpephone=3D"0.4"

# SOLIBSDEV_darwin9=3D.dylib
SOLIBSDEV_darwin9=3D".dylib"

# IPKGBUILDCMD=3Dipkg-build -o 0 -g 0
IPKGBUILDCMD=3D"ipkg-build -o 0 -g 0"

# IMAGE_CMD_ext2=3Dgenext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_=
DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}
IMAGE_CMD_ext2=3D"genext2fs -b ${ROOTFS_SIZE} -d /home/DRESEARCH/sledz/work=
/HydraIP/OE/tmp.6/rootfs/libsoup-2.4 /home/DRESEARCH/sledz/work/HydraIP/OE/=
tmp.6/deploy/glibc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-=
20110203-hipox.rootfs.ext2"

# IMAGE_CMD_ext3=3Dgenext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_=
DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY=
_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
IMAGE_CMD_ext3=3D"genext2fs -b ${ROOTFS_SIZE} -d /home/DRESEARCH/sledz/work=
/HydraIP/OE/tmp.6/rootfs/libsoup-2.4 /home/DRESEARCH/sledz/work/HydraIP/OE/=
tmp.6/deploy/glibc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-=
20110203-hipox.rootfs.ext3 ; tune2fs -j /home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.6/deploy/glibc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-te=
st-20110203-hipox.rootfs.ext3"

# ASSUME_SHLIBS=3DNone
# base_libdir=3D${base_prefix}/lib
export base_libdir=3D"/lib"

# PREFERRED_VERSION_ti-codecs-dm6467-server=3D1_00_00_03
PREFERRED_VERSION_ti-codecs-dm6467-server=3D"1_00_00_03"

# FETCHCMD_wget=3D/usr/bin/env wget -t 5 --no-check-certificate
FETCHCMD_wget=3D"/usr/bin/env wget -t 5 --no-check-certificate"

# PREFERRED_PROVIDER_tslib-conf=3Dtslib
PREFERRED_PROVIDER_tslib-conf=3D"tslib"

# GROUP_dependencies=3DNone
# UBOOT_ENTRYPOINT=3D0x48008000
UBOOT_ENTRYPOINT=3D"0x48008000"

# PREFERRED_VERSION_ti-dspbios=3D5_41_02_14
PREFERRED_VERSION_ti-dspbios=3D"5_41_02_14"

# SANITY_ABIFILE=3D${TMPDIR}/abi_version
SANITY_ABIFILE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/abi_version"

# PREFERRED_VERSION_wpa-supplicant=3D0.6.9
PREFERRED_VERSION_wpa-supplicant=3D"0.6.9"

# SCENEFUNCS=3D packagestage_scenefunc base_scenefunction
SCENEFUNCS=3D"packagestage_scenefunc base_scenefunction"

# IMAGE_CMD_ext2.gz=3Dinstall -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b =
${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.=
rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAG=
E_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext=
2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz
IMAGE_CMD_ext2.gz=3D"install -d /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6=
/deploy/glibc/images/hipox/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d /home/DR=
ESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/libsoup-2.4 /home/DRESEARCH/sled=
z/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.gz/Angstrom-libsoup-2=
.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext2 ; gzip -f -9 /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.gz/Angstrom=
-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext2; mv /home/DRE=
SEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.gz/Angstro=
m-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext2.gz /home/DRE=
SEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/Angstrom-libso=
up-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext2.gz"

# PKGDATA_DIR=3D${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}
PKGDATA_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pkgdata/armv5te-=
angstrom-linux-gnueabi"

# PREFERRED_VERSION_gcc-cross=3D${ANGSTROM_GCC_VERSION}
PREFERRED_VERSION_gcc-cross=3D"4.3.3"

# __BBHANDLERS=3D['packagedstage_stampfixing_eventhandler', 'oe_import', 'b=
ase_eventhandler', 'check_sanity_eventhandler', 'recipe_sanity_eh', 'check_=
sanity_eventhandler']
# PREFERRED_VERSION_opie-doctab=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-doctab=3D"1.2.4"

# PREFERRED_VERSION_opie-sounds=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-sounds=3D"1.2.4"

# PREFERRED_VERSION_opie-bluetoothmanager=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-bluetoothmanager=3D"1.2.4"

# LOGNAME=3Dsledz
export LOGNAME=3D"sledz"

# PATH=3D${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${S=
TAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING=
_DIR_NATIVE}/${base_bindir_native}:/opt/bitbake/bin:/opt/avr/bin/:/opt/avr/=
bin/:/home/DRESEARCH/sledz/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/u=
sr/X11R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:/o=
pt/gnome/bin:/usr/lib/qt3/bin:/usr/sbin:/sbin:/usr/sbin:/sbin
export PATH=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-li=
nux/usr/armv5te/bin:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i6=
86-linux/usr/sbin:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686=
-linux/usr/bin:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-li=
nux/sbin:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux//b=
in:/opt/bitbake/bin:/opt/avr/bin/:/opt/avr/bin/:/home/DRESEARCH/sledz/bin:/=
usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/opt/kde=
3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:/opt/gnome/bin:/usr/lib/qt3/bin:/u=
sr/sbin:/sbin:/usr/sbin:/sbin"

# PREFERRED_PROVIDER_hostap-modules_h2200=3Dhostap-modules
PREFERRED_PROVIDER_hostap-modules_h2200=3D"hostap-modules"

# PREFERRED_VERSION_opie-appearance=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-appearance=3D"1.2.4"

# PREFERRED_VERSION_opie-today-weatherplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-today-weatherplugin=3D"1.2.4"

# TARGET_CFLAGS=3D${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}
export TARGET_CFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6=
/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimizati=
ons -frename-registers -fomit-frame-pointer -O2 -ggdb2"

# base_bindir=3D${base_prefix}/bin
export base_bindir=3D"/bin"

# layout_sharedstatedir=3D${sharedstatedir}
layout_sharedstatedir=3D"/com"

# IPKGCONF_TARGET=3D${STAGING_ETCDIR_NATIVE}/opkg.conf
IPKGCONF_TARGET=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i68=
6-linux/etc/opkg.conf"

# PREFERRED_VERSION_opie-deco-liquid=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-deco-liquid=3D"1.2.4"

# _task_deps=3D{'depends': {'do_patch': 'quilt-native:do_populate_sysroot',=
 'do_package_write_ipk': 'ipkg-utils-native:do_populate_sysroot fakeroot-na=
tive:do_populate_sysroot', 'do_package_update_index_ipk': ' ipkg-utils-nati=
ve:do_populate_sysroot', 'do_package': ' file-native:do_populate_sysroot pa=
x-utils-native:do_populate_sysroot desktop-file-utils-native:do_populate_sy=
sroot', 'do_setscene': ' stagemanager-native:do_populate_sysroot'}, 'tasks'=
: ['do_patch', 'do_populate_sysroot', 'do_package_stage', 'do_package_stage=
_all', 'do_listtasks', 'do_clean', 'do_cleanall', 'do_rebuild', 'do_distcle=
an', 'do_checkuri', 'do_checkuriall', 'do_fetchall', 'do_buildall', 'do_set=
scene', 'do_fetch', 'do_unpack', 'do_configure', 'do_compile', 'do_install'=
, 'do_build', 'do_devshell', 'do_distribute_sources', 'do_distribute_source=
s_all', 'do_distsrcall', 'do_package', 'do_package_write', 'do_qa_staging',=
 'do_qa_configure', 'do_recipe_sanity', 'do_recipe_sanity_all', 'do_package=
_write_ipk', 'do_package_update_index_ipk'], 'parents': {'do_recipe_sanity_=
all': ['do_recipe_sanity'], 'do_configure': ['do_unpack', 'do_patch'], 'do_=
package': ['do_install'], 'do_package_write': ['do_package_write_ipk', 'do_=
package'], 'do_fetchall': ['do_fetch'], 'do_rebuild': ['do_build'], 'do_com=
pile': ['do_qa_configure', 'do_configure'], 'do_cleanall': ['do_clean'], 'd=
o_checkuri': [], 'do_unpack': ['do_fetch'], 'do_distsrcall': ['do_distribut=
e_sources_all'], 'do_qa_configure': ['do_configure'], 'do_build': ['do_pack=
age_write', 'do_package', 'do_distribute_sources', 'do_package_stage_all', =
'do_package_stage'], 'do_package_stage': ['do_qa_staging', 'do_package_writ=
e', 'do_populate_sysroot'], 'do_fetch': ['do_setscene'], 'do_devshell': ['d=
o_patch'], 'do_populate_sysroot': ['do_install'], 'do_recipe_sanity': [], '=
do_checkuriall': ['do_checkuri'], 'do_install': ['do_compile'], 'do_package=
_write_ipk': ['do_package'], 'do_listtasks': [], 'do_clean': [], 'do_patch'=
: ['do_unpack'], 'do_distribute_sources': ['do_fetch'], 'do_buildall': ['do=
_build'], 'do_distribute_sources_all': ['do_distribute_sources'], 'do_packa=
ge_update_index_ipk': [], 'do_distclean': [], 'do_package_stage_all': ['do_=
package_stage'], 'do_setscene': [], 'do_qa_staging': ['do_populate_sysroot'=
]}, 'rdeptask': {'do_package_write_ipk': 'do_package'}, 'recrdeptask': {'do=
_buildall': 'do_build', 'do_distribute_sources_all': 'do_distribute_sources=
', 'do_package_update_index_ipk': ' do_package_write_ipk do_package_write_i=
pk', 'do_recipe_sanity_all': 'do_recipe_sanity', 'do_package_stage_all': 'd=
o_package_stage', 'do_fetchall': 'do_fetch', 'do_cleanall': 'do_clean', 'do=
_checkuriall': 'do_checkuri'}, 'deptask': {'do_configure': 'do_populate_sys=
root', 'do_package': 'do_package'}, 'nostamp': {'do_distribute_sources_all'=
: '1', 'do_package_update_index_ipk': '1', 'do_recipe_sanity_all': '1', 'do=
_devshell': '1', 'do_listtasks': '1', 'do_clean': '1', 'do_rebuild': '1', '=
do_distsrcall': '1', 'do_recipe_sanity': '1', 'do_checkuri': '1', 'do_check=
uriall': '1', 'do_distclean': '1'}}
# PWD=3D/home/DRESEARCH/sledz/work/HydraIP/OE
export PWD=3D"/home/DRESEARCH/sledz/work/HydraIP/OE"

# PREFERRED_VERSION_ti-dvsdk-demos=3D3_10_00_11
PREFERRED_VERSION_ti-dvsdk-demos=3D"3_10_00_11"

# PREFERRED_VERSION_opie-libqrsync=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-libqrsync=3D"1.2.4"

# DISTRO_VERSION=3D2010.7-test-${DATE}
DISTRO_VERSION=3D"2010.7-test-20110203"

# FILES_libsoup-2.4-dbg=3D${bindir}/.debug ${sbindir}/.debug ${libexecdir}/=
.debug ${libdir}/.debug ${base_bindir}/.debug ${base_sbindir}/.debug ${base=
_libdir}/.debug ${libdir}/${PN}/.debug ${libdir}/matchbox-panel/.debug ${da=
tadir}/gdb/autoload
FILES_libsoup-2.4-dbg=3D"/usr/bin/.debug /usr/sbin/.debug /usr/libexec/.deb=
ug /usr/lib/.debug /bin/.debug /sbin/.debug /lib/.debug /usr/lib/libsoup-2.=
4/.debug /usr/lib/matchbox-panel/.debug /usr/share/gdb/autoload"

# PREFERRED_VERSION_gcc-cross-sdk=3D${ANGSTROM_GCC_VERSION}
PREFERRED_VERSION_gcc-cross-sdk=3D"4.3.3"

# servicedir=3D${base_prefix}/srv
export servicedir=3D"/srv"

# BUILD_CPP=3D${BUILD_PREFIX}cpp
export BUILD_CPP=3D"cpp"

# IMAGE_CMD_tar=3Dcd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAG=
E_NAME}.rootfs.tar .
IMAGE_CMD_tar=3D"cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/libs=
oup-2.4 && tar -cvf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glib=
c/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.ro=
otfs.tar ."

# HOMEPAGE=3Dunknown
HOMEPAGE=3D"unknown"

# DEPLOY_DIR_TOOLS=3D${DEPLOY_DIR}/tools
DEPLOY_DIR_TOOLS=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glib=
c/tools"

# PREFERRED_VERSION_opie-backgammon=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-backgammon=3D"1.2.4"

# ARM_INSTRUCTION_SET_pn-uclibc=3Darm
ARM_INSTRUCTION_SET_pn-uclibc=3D"arm"

# IMAGE_CMD_yaffs2=3Dmkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} ${DEPL=
OY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2
IMAGE_CMD_yaffs2=3D"mkyaffs2image  /home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.6/rootfs/libsoup-2.4 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/g=
libc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox=
.rootfs.yaffs2"

# PREFERRED_VERSION_opie-datebook-nationalholidayplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-datebook-nationalholidayplugin=3D"1.2.4"

# PREFERRED_VERSION_opie-lrelease-native=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-lrelease-native=3D"1.2.4"

# SEPPUKU_COMPONENT=3Dorg.openembedded.dev
SEPPUKU_COMPONENT=3D"org.openembedded.dev"

# MACHINE=3Dhipox
unset MACHINE

# STAGING_DATADIR_NATIVE=3D${STAGING_DIR_NATIVE}${datadir_native}
STAGING_DATADIR_NATIVE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysro=
ots/i686-linux/usr/share"

# GITDIR=3D${CO_DIR}/git
GITDIR=3D"/home/DRESEARCH/sledz/sources/git"

# RESUMECOMMAND_wget=3D/usr/bin/env 'PATH=3D${PATH}' wget -c -t 5 --passive=
-ftp --no-check-certificate -P ${DL_DIR} '${URI}'
RESUMECOMMAND_wget=3D"/usr/bin/env 'PATH=3D/home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.6/sysroots/i686-linux/usr/armv5te/bin:/home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.6/sysroots/i686-linux/usr/sbin:/home/DRESEARCH/sledz/work/Hy=
draIP/OE/tmp.6/sysroots/i686-linux/usr/bin:/home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.6/sysroots/i686-linux/sbin:/home/DRESEARCH/sledz/work/HydraIP/OE/=
tmp.6/sysroots/i686-linux//bin:/opt/bitbake/bin:/opt/avr/bin/:/opt/avr/bin/=
:/home/DRESEARCH/sledz/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X=
11R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:/opt/g=
nome/bin:/usr/lib/qt3/bin:/usr/sbin:/sbin:/usr/sbin:/sbin' wget -c -t 5 --p=
assive-ftp --no-check-certificate -P /home/DRESEARCH/sledz/sources '${URI}'=
"

# PREFERRED_VERSION_opie-mediaplayer2=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer2=3D"1.2.4"

# SDK_OS=3D${BUILD_OS}
SDK_OS=3D"linux"

# XAUTHORITY=3D/home/DRESEARCH/sledz/.Xauthority
export XAUTHORITY=3D"/home/DRESEARCH/sledz/.Xauthority"

# PREFERRED_VERSION_opie-sshkeys=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-sshkeys=3D"1.2.4"

# SDK_CXXFLAGS=3D${SDK_CFLAGS} -fpermissive
export SDK_CXXFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/=
sysroots/i686-linux/usr/include -isystem/home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-op=
timizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive=
"

# GPE_MIRROR=3Dhttp://gpe.linuxtogo.org/download/source
GPE_MIRROR=3D"http://gpe.linuxtogo.org/download/source"

# SOLIBS_darwin9=3D.*.dylib
SOLIBS_darwin9=3D".*.dylib"

# IMAGE_POSTPROCESS_COMMAND=3D   do_testlab ;
IMAGE_POSTPROCESS_COMMAND=3D"do_testlab ;"

# SECTION_${PN}-dev=3DNone
# SOC_FAMILY=3DUnknown
SOC_FAMILY=3D"Unknown"

# PREFERRED_VERSION_opie-keyview=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-keyview=3D"1.2.4"

# SOURCE_MIRROR_URL=3DNone
# sbindir=3D${exec_prefix}/sbin
export sbindir=3D"/usr/sbin"

# PREFERRED_VERSION_opie-taskbar=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-taskbar=3D"1.2.4"

# CFLAGS=3D${TARGET_CFLAGS}
export CFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fr=
ename-registers -fomit-frame-pointer -O2 -ggdb2"

# PREFERRED_VERSION_opie-showimg=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-showimg=3D"1.2.4"

# PREFERRED_VERSION_opie-help-en=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-help-en=3D"1.2.4"

# PREFERRED_VERSION_ti-codecs-dm365=3D3_10_00_02
PREFERRED_VERSION_ti-codecs-dm365=3D"3_10_00_02"

# BUILD_AR=3D${BUILD_PREFIX}ar
export BUILD_AR=3D"ar"

# SRCREV_pn-libgdbus=3Daeab6e3c0185b271ca343b439470491b99cc587f
SRCREV_pn-libgdbus=3D"aeab6e3c0185b271ca343b439470491b99cc587f"

# layout_base_libdir=3D${base_libdir}
layout_base_libdir=3D"/lib"

# PREFERRED_VERSION_opie-mediaplayer1-libmodplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer1-libmodplugin=3D"1.2.4"

# PREFERRED_VERSION_opie-irc=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-irc=3D"1.2.4"

# HANDHELDS_CVS=3Dcvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs
HANDHELDS_CVS=3D"cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs"

# IMAGE_DEPENDS_ext2.bz2=3Dgenext2fs-native
IMAGE_DEPENDS_ext2.bz2=3D"genext2fs-native"

# PREFERRED_VERSION_ti-dsplink=3D1_64
PREFERRED_VERSION_ti-dsplink=3D"1_64"

# SDK_PREFIX=3D${SDK_SYS}-
SDK_PREFIX=3D"i686-linux-"

# DEBIAN_MIRROR=3Dftp://ftp.debian.org/debian/pool
DEBIAN_MIRROR=3D"ftp://ftp.debian.org/debian/pool"

# PREFERRED_PROVIDER_virtual/libc=3Dglibc
PREFERRED_PROVIDER_virtual/libc=3D"glibc"

# RESUMECOMMAND=3DERROR, this must be a BitBake bug
RESUMECOMMAND=3D"ERROR, this must be a BitBake bug"

# DEFAULT_TASK_PROVIDER=3Dtask-base
DEFAULT_TASK_PROVIDER=3D"task-base"

# PREFERRED_VERSION_opie-sheet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-sheet=3D"1.2.4"

# __BBTASKS=3D['do_patch', 'do_populate_sysroot', 'do_package_stage', 'do_p=
ackage_stage_all', 'do_listtasks', 'do_clean', 'do_cleanall', 'do_rebuild',=
 'do_distclean', 'do_checkuri', 'do_checkuriall', 'do_fetchall', 'do_builda=
ll', 'do_setscene', 'do_fetch', 'do_unpack', 'do_configure', 'do_compile', =
'do_install', 'do_build', 'do_devshell', 'do_distribute_sources', 'do_distr=
ibute_sources_all', 'do_distsrcall', 'do_package', 'do_package_write', 'do_=
qa_staging', 'do_qa_configure', 'do_recipe_sanity', 'do_recipe_sanity_all',=
 'do_package_write_ipk', 'do_package_update_index_ipk']
# SELECTED_OPTIMIZATION_pn-libgupnp=3D${PROFILE_OPTIMIZATION}
SELECTED_OPTIMIZATION_pn-libgupnp=3D"-pg"

# MACHINE_DISPLAY_BPP=3D16
MACHINE_DISPLAY_BPP=3D"16"

# IMAGE_ROOTFS_SIZE_ext2.gz=3D65536
IMAGE_ROOTFS_SIZE_ext2.gz=3D"65536"

# PREFERRED_VERSION_opie-dasher=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-dasher=3D"1.2.4"

# LICENSE=3DGPL
LICENSE=3D"GPL"

# TOPDIR=3D/home/DRESEARCH/sledz/work/HydraIP/OE
TOPDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE"

# PREFERRED_VERSION_ti-cgt6x=3D6_1_9
PREFERRED_VERSION_ti-cgt6x=3D"6_1_9"

# PREFERRED_VERSION_opie-wirelessapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-wirelessapplet=3D"1.2.4"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-tga=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-tga=3D"gtk+"

# KERNEL_IMAGETYPE=3DuImage
KERNEL_IMAGETYPE=3D"uImage"

# IMAGE_LINGUAS=3D${@base_less_or_equal("ROOT_FLASH_SIZE", "16", "", "en-us=
", d)}
IMAGE_LINGUAS=3D"en-us"

# DEPLOY_DIR_IPK=3D${DEPLOY_DIR}/ipk
DEPLOY_DIR_IPK=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/=
ipk"

# STAGE_TEMP_PREFIX=3D
# PREFERRED_VERSION_opie-zsafe=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-zsafe=3D"1.2.4"

# PREFERRED_VERSION_pango=3D1.24.4
PREFERRED_VERSION_pango=3D"1.24.4"

# ENABLE_BINARY_LOCALE_GENERATION_ep9312=3D0
ENABLE_BINARY_LOCALE_GENERATION_ep9312=3D"0"

# ALLOWED_FLAGS=3D-O -mcpu -march -pipe
ALLOWED_FLAGS=3D"-O -mcpu -march -pipe"

# PREFERRED_VERSION_pkgconfig-native=3D0.23
PREFERRED_VERSION_pkgconfig-native=3D"0.23"

# SDKPATH=3D${SDK_PATH}
SDKPATH=3D"/usr/local/angstrom/arm"

# PREFERRED_VERSION_opie-examples=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-examples=3D"1.2.4"

# STAGING_DIR_JAVA=3D${STAGING_DIR}/java
STAGING_DIR_JAVA=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/ja=
va"

# PREFERRED_VERSION_mythtv=3D0.22
PREFERRED_VERSION_mythtv=3D"0.22"

# PREFERRED_VERSION_ti-codec-engine=3D2_25_01_06
PREFERRED_VERSION_ti-codec-engine=3D"2_25_01_06"

# prefix_native=3D/usr
prefix_native=3D"/usr"

# PACKAGE_EXTRA_ARCHS=3D armv4 armv4t armv5te
PACKAGE_EXTRA_ARCHS=3D"armv4 armv4t armv5te"

# PREFERRED_PROVIDER_hostap-modules_hx4700=3Dhostap-modules
PREFERRED_PROVIDER_hostap-modules_hx4700=3D"hostap-modules"

# PREFERRED_PROVIDER_virtual/java-initial=3Djamvm-initial
PREFERRED_PROVIDER_virtual/java-initial=3D"jamvm-initial"

# PACKAGE_DEPENDS=3D file-native pax-utils-native desktop-file-utils-native
PACKAGE_DEPENDS=3D"file-native pax-utils-native desktop-file-utils-native"

# BBFILE_PATTERN_localcommon=3D^${OE_HOME}/common/recipes/
BBFILE_PATTERN_localcommon=3D"^/home/DRESEARCH/sledz/work/HydraIP/OE/common=
/recipes/"

# PREFERRED_VERSION_linux-libc-headers=3D2.6.24
PREFERRED_VERSION_linux-libc-headers=3D"2.6.24"

# SOURCEFORGE_MIRROR=3Dhttp://downloads.sourceforge.net
SOURCEFORGE_MIRROR=3D"http://downloads.sourceforge.net"

# DBUS_SESSION_BUS_ADDRESS=3DNone
# TOOLCHAIN_SYSPATH=3D${TOOLCHAIN_PATH}/${TARGET_SYS}
TOOLCHAIN_SYSPATH=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i=
686-linux/usr/armv5te/arm-angstrom-linux-gnueabi"

# EFL_SRCREV=3D52678
EFL_SRCREV=3D"52678"

# PREFERRED_VERSION_linux-handhelds-2.6=3D2.6.21-hh20
PREFERRED_VERSION_linux-handhelds-2.6=3D"2.6.21-hh20"

# SOLIBS_darwin=3D.*.dylib
SOLIBS_darwin=3D".*.dylib"

# PN=3D${@bb.parse.BBHandler.vars_from_file('${FILE}', d)[0] or 'defaultpkg=
name'}
PN=3D"libsoup-2.4"

# OBJDUMP=3D${HOST_PREFIX}objdump
export OBJDUMP=3D"arm-angstrom-linux-gnueabi-objdump"

# IMAGE_LINK_NAME=3D${IMAGE_BASENAME}-${MACHINE}
IMAGE_LINK_NAME=3D"libsoup-2.4-hipox"

# IMAGE_BASENAME=3D${PN}
IMAGE_BASENAME=3D"libsoup-2.4"

# PATCHTOOL=3Dquilt
PATCHTOOL=3D"quilt"

# XORG_MIRROR=3Dhttp://xorg.freedesktop.org/releases
XORG_MIRROR=3D"http://xorg.freedesktop.org/releases"

# SYSROOT_DESTDIR=3D${WORKDIR}/sysroot-destdir/
SYSROOT_DESTDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te=
-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/sysroot-destdir/"

# PSTAGE_TASKS_COVERED=3Dfetch unpack munge patch configure qa_configure ri=
g_locales compile sizecheck install deploy package populate_sysroot package=
_write_deb package_write_ipk package_write package_stage qa_staging
PSTAGE_TASKS_COVERED=3D"fetch unpack munge patch configure qa_configure rig=
_locales compile sizecheck install deploy package populate_sysroot package_=
write_deb package_write_ipk package_write package_stage qa_staging"

# IMAGE_ROOTFS_SIZE=3D65536
IMAGE_ROOTFS_SIZE=3D"65536"

# PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial=3DNone
# PREFERRED_VERSION_opie-symlinker=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-symlinker=3D"1.2.4"

# BUILD_CFLAGS=3D${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}
export BUILD_CFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/=
sysroots/i686-linux/usr/include -O2 -g"

# PREFERRED_VERSION_opie-calibrate=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-calibrate=3D"1.2.4"

# PREFERRED_PROVIDER_task-bootstrap=3Dtask-bootstrap
PREFERRED_PROVIDER_task-bootstrap=3D"task-bootstrap"

# CPPFLAGS=3D${TARGET_CPPFLAGS}
export CPPFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysr=
oots/armv5te-angstrom-linux-gnueabi/usr/include"

# AUTOTOOLS_NATIVE_STAGE_INSTALL=3D1
AUTOTOOLS_NATIVE_STAGE_INSTALL=3D"1"

# TINDER_LOG=3D${TMPDIR}/tinder.log
TINDER_LOG=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/tinder.log"

# PREFERRED_VERSION_opie-search=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-search=3D"1.2.4"

# SPECIAL_PKGSUFFIX=3D-native -cross -initial -intermediate -nativesdk -cro=
sssdk -cross-canadian -sdk
SPECIAL_PKGSUFFIX=3D"-native -cross -initial -intermediate -nativesdk -cros=
ssdk -cross-canadian -sdk"

# METADATA_REVISION=3D${@base_get_scm_revision(d)}
METADATA_REVISION=3D"<unknown>"

# BUILD_EXEEXT=3D
# PREFERRED_PROVIDER_virtual/gail=3Dgtk+
PREFERRED_PROVIDER_virtual/gail=3D"gtk+"

# PREFERRED_VERSION_wget=3D1.11.4
PREFERRED_VERSION_wget=3D"1.11.4"

# OLDEST_KERNEL=3D2.6.16
OLDEST_KERNEL=3D"2.6.16"

# PREFERRED_PROVIDER_gpsd=3Dgpsd
PREFERRED_PROVIDER_gpsd=3D"gpsd"

# PREFERRED_PROVIDER_e-wm-menu=3De-wm-menu
PREFERRED_PROVIDER_e-wm-menu=3D"e-wm-menu"

# EXEEXT=3D${HOST_EXEEXT}
# ANGSTROM_BLACKLIST_pn-bluez-utils=3Dbluez-utils 3.x has been replaced by =
bluez4
ANGSTROM_BLACKLIST_pn-bluez-utils=3D"bluez-utils 3.x has been replaced by b=
luez4"

# ANGSTROM_PKG_FORMAT=3Dipk
ANGSTROM_PKG_FORMAT=3D"ipk"

# SECTION_${PN}-doc=3DNone
# PREFERRED_VERSION_opie-tableviewer=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-tableviewer=3D"1.2.4"

# PR=3D${@bb.parse.BBHandler.vars_from_file('${FILE}', d)[2] or 'r0'}
PR=3D"r0"

# PREFERRED_VERSION_ti-codec-engine-examples=3D2_25_01_06
PREFERRED_VERSION_ti-codec-engine-examples=3D"2_25_01_06"

# PREFERRED_PROVIDER_hostap-conf=3Dhostap-conf
PREFERRED_PROVIDER_hostap-conf=3D"hostap-conf"

# PV=3D${@bb.parse.BBHandler.vars_from_file('${FILE}', d)[1] or '1.0'}
PV=3D"2.29.91"

# PREFERRED_VERSION_jamvm=3D1.5.2
PREFERRED_VERSION_jamvm=3D"1.5.2"

# PSTAGE_PKGNAME=3D${PSTAGE_PKGPN}_${PSTAGE_PKGVERSION}_${PSTAGE_PKGARCH}.i=
pk
PSTAGE_PKGNAME=3D"staging-libsoup-2.4-armv5te-angstrom-linux-gnueabi_2.29.9=
1-r0_armv5te-linux-gnueabi.ipk"

# AUTHOR=3DNone
# PREFERRED_VERSION_myththemes=3D0.22
PREFERRED_VERSION_myththemes=3D"0.22"

# TARGET_FPU_ppc603e=3Dhard
TARGET_FPU_ppc603e=3D"hard"

# PKGDEST=3D${WORKDIR}/packages-split
PKGDEST=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstro=
m-linux-gnueabi/libsoup-2.4-2.29.91-r0/packages-split"

# PREFERRED_VERSION_opie-lupdate-native=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-lupdate-native=3D"1.2.4"

# PREFERRED_VERSION_opie-multikey=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-multikey=3D"1.2.4"

# STAGING_BINDIR_NATIVE=3D${STAGING_DIR_NATIVE}${bindir_native}
STAGING_BINDIR_NATIVE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/i686-linux/usr/bin"

# OE_STRICT_CHECKSUMS=3D1
OE_STRICT_CHECKSUMS=3D"1"

# PE=3D0
PE=3D"0"

# PSTAGE_REMOVE_CMD=3D${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -force-d=
epends -o ${TMPDIR} remove
PSTAGE_REMOVE_CMD=3D"stage-manager-ipkg -f /home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.6/pstage/opkg.conf -force-depends -o /home/DRESEARCH/sledz/work/H=
ydraIP/OE/tmp.6 remove"

# PREFERRED_VERSION_glibc=3D2.9
PREFERRED_VERSION_glibc=3D"2.9"

# PREFERRED_VERSION_ti-dm365mm-module=3D1_0_3
PREFERRED_VERSION_ti-dm365mm-module=3D"1_0_3"

# ENABLE_BINARY_LOCALE_GENERATION_armeb=3D0
ENABLE_BINARY_LOCALE_GENERATION_armeb=3D"0"

# PREFERRED_VERSION_libtool-native=3D2.2.6b
PREFERRED_VERSION_libtool-native=3D"2.2.6b"

# DISTRO=3Dangstrom
unset DISTRO

# IPKG_VARIANT=3Dopkg angstrom-version ${ANGSTROM_FEED_CONFIGS}
IPKG_VARIANT=3D"opkg angstrom-version angstrom-feed-configs"

# PREFERRED_PROVIDER_xserver=3Dxserver-xorg
PREFERRED_PROVIDER_xserver=3D"xserver-xorg"

# PREFERRED_VERSION_opie-remote=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-remote=3D"1.2.4"

# BUILD_OPTIMIZATION=3D-O2 -g
BUILD_OPTIMIZATION=3D"-O2 -g"

# PREFERRED_VERSION_opie-networksettings=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-networksettings=3D"1.2.4"

# PREFERRED_PROVIDER_swt3.4-gtk=3Dswt3.4-gtk
PREFERRED_PROVIDER_swt3.4-gtk=3D"swt3.4-gtk"

# FILES_${PN}-dev=3DNone
# PREFERRED_VERSION_mesa-xlib=3D7.6
PREFERRED_VERSION_mesa-xlib=3D"7.6"

# PREFERRED_VERSION_opie-write=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-write=3D"1.2.4"

# S=3D${WORKDIR}/libsoup-${PV}
S=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linu=
x-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91"

# E_CVS=3Dcvs://anonymous@anoncvs.enlightenment.org/var/cvs/e
E_CVS=3D"cvs://anonymous@anoncvs.enlightenment.org/var/cvs/e"

# QMAKE_MKSPEC_PATH=3D${STAGING_DATADIR_NATIVE}/qmake
export QMAKE_MKSPEC_PATH=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sys=
roots/i686-linux/usr/share/qmake"

# IMAGE_DEPENDS=3D
# DEBUG_APPS=3D ${@base_conditional("DISTRO_TYPE", "release", "", "strace p=
rocps",d)}
DEBUG_APPS=3D"strace procps"

# PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-gcc-intermediate=3D=
gcc-cross-intermediate
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-gcc-intermediate=3D"g=
cc-cross-intermediate"

# PREFERRED_PROVIDER_virtual/update-alternatives-native=3Dopkg-native
PREFERRED_PROVIDER_virtual/update-alternatives-native=3D"opkg-native"

# PREFERRED_VERSION_opie-keypebble=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-keypebble=3D"1.2.4"

# MKTEMPDIRCMD=3Dmktemp -d -q ${TMPBASE}
MKTEMPDIRCMD=3D"mktemp -d -q ${TMPBASE}"

# STAGING_KERNEL_DIR=3D${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/kernel
STAGING_KERNEL_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/=
armv5te-angstrom-linux-gnueabi/kernel"

# PREFERRED_VERSION_openssl-native=3D1.0.0a
PREFERRED_VERSION_openssl-native=3D"1.0.0a"

# PREFERRED_PROVIDER_esound=3Dpulseaudio
PREFERRED_PROVIDER_esound=3D"pulseaudio"

# PREFERRED_VERSION_opie-zlines=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-zlines=3D"1.2.4"

# SEPPUKU_LOGIN=3Dhttp://bugs.openembedded.net/query.cgi?
SEPPUKU_LOGIN=3D"http://bugs.openembedded.net/query.cgi?"

# PREFERRED_PROVIDER_linux-libc-headers=3Dlinux-libc-headers
PREFERRED_PROVIDER_linux-libc-headers=3D"linux-libc-headers"

# IMAGE_CMD_ext3.bz2=3Dinstall -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -=
b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAM=
E}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.bz2/${=
IMAGE_NAME}.rootfs.ext3; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NA=
ME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3.b=
z2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.bz2
IMAGE_CMD_ext3.bz2=3D"install -d /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/deploy/glibc/images/hipox/tmp.bz2 ; genext2fs -b ${ROOTFS_SIZE} -d /home/=
DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/libsoup-2.4 /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.bz2/Angstrom-libsou=
p-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext3 ; tune2fs -j /home/D=
RESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/tmp.bz2/Angs=
trom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext3; bzip2 -f=
 -9 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/t=
mp.bz2/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext=
3; mv /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox=
/tmp.bz2/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.e=
xt3.bz2 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hip=
ox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox.rootfs.ext3.bz=
2"

# layout_localstatedir=3D${localstatedir}
layout_localstatedir=3D"/var"

# QEMU_OPTIONS_armv7a=3D-cpu cortex-a8
QEMU_OPTIONS_armv7a=3D"-cpu cortex-a8"

# ADOBE_MIRROR=3Dhttp://fpdownload.macromedia.com/get/flashplayer/current/
ADOBE_MIRROR=3D"http://fpdownload.macromedia.com/get/flashplayer/current/"

# PREFERRED_VERSION_opie-login=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-login=3D"1.2.4"

# SOLIBS=3D.so.*
SOLIBS=3D".so.*"

# PREFERRED_VERSION_opie-memoryapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-memoryapplet=3D"1.2.4"

# PROVIDES=3D${P} ${PF} ${PN}=20
PROVIDES=3D"libsoup-2.4-2.29.91 libsoup-2.4-2.29.91-r0 libsoup-2.4"

# PKG_CONFIG_DIR=3D${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TA=
RGET_OS}${libdir}/pkgconfig
export PKG_CONFIG_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/armv5te-angstrom-linux-gnueabi/usr/lib/pkgconfig"

# PACKAGE_PREPROCESS_FUNCS=3D autotools_prepackage_lamangler
PACKAGE_PREPROCESS_FUNCS=3D"autotools_prepackage_lamangler"

# do_package_write_tar=3DNone
# SRCREV_pn-bickley=3Dde9431b7c6040bc3731157c05947159ad2c7a0a9
SRCREV_pn-bickley=3D"de9431b7c6040bc3731157c05947159ad2c7a0a9"

# __inherit_cache=3D['classes/base.bbclass', 'classes/patch.bbclass', '/hom=
e/DRESEARCH/sledz/work/openembedded/classes/patch.bbclass', 'classes/stagin=
g.bbclass', '/home/DRESEARCH/sledz/work/openembedded/classes/staging.bbclas=
s', 'classes/packaged-staging.bbclass', '/home/DRESEARCH/sledz/work/openemb=
edded/classes/packaged-staging.bbclass', 'classes/packagedata.bbclass', '/h=
ome/DRESEARCH/sledz/work/openembedded/classes/packagedata.bbclass', 'classe=
s/mirrors.bbclass', '/home/DRESEARCH/sledz/work/openembedded/classes/mirror=
s.bbclass', 'classes/utils.bbclass', '/home/DRESEARCH/sledz/work/openembedd=
ed/classes/utils.bbclass', 'classes/utility-tasks.bbclass', '/home/DRESEARC=
H/sledz/work/openembedded/classes/utility-tasks.bbclass', 'classes/metadata=
_scm.bbclass', '/home/DRESEARCH/sledz/work/openembedded/classes/metadata_sc=
m.bbclass', 'classes/devshell.bbclass', 'classes/src_distribute_local.bbcla=
ss', 'classes/src_distribute.bbclass', '/home/DRESEARCH/sledz/work/openembe=
dded/classes/src_distribute.bbclass', 'classes/debian.bbclass', 'classes/sa=
nity.bbclass', 'classes/qemu.bbclass', '/home/DRESEARCH/sledz/work/openembe=
dded/classes/qemu.bbclass', 'classes/angstrom.bbclass', 'classes/angstrom-m=
irrors.bbclass', 'classes/insane.bbclass', 'classes/package.bbclass', '/hom=
e/DRESEARCH/sledz/work/openembedded/classes/package.bbclass', 'classes/reci=
pe_sanity.bbclass', 'classes/testlab.bbclass', 'classes/package_ipk.bbclass=
', 'classes/gnome.bbclass', '/home/DRESEARCH/sledz/work/openembedded/classe=
s/gnome.bbclass', 'classes/gnomebase.bbclass', '/home/DRESEARCH/sledz/work/=
openembedded/classes/gnomebase.bbclass', 'classes/autotools.bbclass', '/hom=
e/DRESEARCH/sledz/work/openembedded/classes/autotools.bbclass', 'classes/si=
teinfo.bbclass', '/home/DRESEARCH/sledz/work/openembedded/classes/siteinfo.=
bbclass', 'classes/pkgconfig.bbclass', '/home/DRESEARCH/sledz/work/openembe=
dded/classes/pkgconfig.bbclass', 'classes/gtk-icon-cache.bbclass', '/home/D=
RESEARCH/sledz/work/openembedded/classes/gtk-icon-cache.bbclass', 'classes/=
gconf.bbclass', '/home/DRESEARCH/sledz/work/openembedded/classes/gconf.bbcl=
ass', 'classes/mime.bbclass', '/home/DRESEARCH/sledz/work/openembedded/clas=
ses/mime.bbclass']
# docdir=3D${datadir}/doc
export docdir=3D"/usr/share/doc"

# PREFERRED_VERSION_binutils-cross-sdk_avr32=3D2.17
PREFERRED_VERSION_binutils-cross-sdk_avr32=3D"2.17"

# DISTRO_FEATURES=3Dlargefile ipv4 ipv6 nfs smbfs wifi ppp alsa bluetooth e=
xt2 vfat irda pcmcia usbgadget usbhost pci pam tk  ${@["", "thumb-interwork=
"][bb.data.getVar('THUMB_INTERWORK', d, 1) =3D=3D "yes"]}  ${@["", "thumb-i=
nterwork"][bb.data.getVar('THUMB_INTERWORK', d, 1) =3D=3D "yes"]}
DISTRO_FEATURES=3D"largefile ipv4 ipv6 nfs smbfs wifi ppp alsa bluetooth ex=
t2 vfat irda pcmcia usbgadget usbhost pci pam tk  thumb-interwork  thumb-in=
terwork"

# TARGET_SYS=3D${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARG=
ET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) =3D=3D ('' or 'custom'=
)]}
TARGET_SYS=3D"arm-angstrom-linux-gnueabi"

# IMAGE_DEPENDS_ext2.gz=3Dgenext2fs-native
IMAGE_DEPENDS_ext2.gz=3D"genext2fs-native"

# DEPLOY_DIR_TAR=3D${DEPLOY_DIR}/tar
DEPLOY_DIR_TAR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/=
tar"

# PREFERRED_VERSION_opie-osearch=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-osearch=3D"1.2.4"

# TARGET_CC_ARCH_pn-cairo_armv5te=3D-march=3Darmv4t
TARGET_CC_ARCH_pn-cairo_armv5te=3D"-march=3Darmv4t"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-wbmp=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-wbmp=3D"gtk+"

# PREFERRED_VERSION_binutils-cross-sdk=3D${ANGSTROM_BINUTILS_VERSION}
PREFERRED_VERSION_binutils-cross-sdk=3D"2.18"

# EXTRA_IMAGECMD_jffs2=3D
# PREFERRED_VERSION_opie-ftp=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-ftp=3D"1.2.4"

# ANGSTROM_BLACKLIST_pn-fso-apm=3Dregular apmd is good enough
ANGSTROM_BLACKLIST_pn-fso-apm=3D"regular apmd is good enough"

# PREFERRED_VERSION_ti-lpm-utils=3D1_24_01
PREFERRED_VERSION_ti-lpm-utils=3D"1_24_01"

# TERMCMD=3Dxterm
TERMCMD=3D"xterm"

# PREFERRED_VERSION_konqueror-embedded=3D20070316
PREFERRED_VERSION_konqueror-embedded=3D"20070316"

# PREFERRED_VERSION_opie-style-flat=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-style-flat=3D"1.2.4"

# PREFERRED_VERSION_opie-bartender=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-bartender=3D"1.2.4"

# BBFILE_PRIORITY_localcommon=3D9
BBFILE_PRIORITY_localcommon=3D"9"

# layout_sysconfdir=3D${sysconfdir}
layout_sysconfdir=3D"/etc"

# PREFERRED_PROVIDER_gtk+=3Dgtk+
PREFERRED_PROVIDER_gtk+=3D"gtk+"

# PREFERRED_VERSION_cairo=3D1.10.0
PREFERRED_VERSION_cairo=3D"1.10.0"

# IMAGE_DEPENDS_ext3.gz=3Dgenext2fs-native e2fsprogs-native
IMAGE_DEPENDS_ext3.gz=3D"genext2fs-native e2fsprogs-native"

# infodir=3D${datadir}/info
export infodir=3D"/usr/share/info"

# PREFERRED_VERSION_opie-tetrix=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-tetrix=3D"1.2.4"

# PREFERRED_VERSION_opie-vmemo=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-vmemo=3D"1.2.4"

# PREFERRED_VERSION_opie-sh=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-sh=3D"1.2.4"

# libdir=3D${exec_prefix}/lib
export libdir=3D"/usr/lib"

# LINUX_LIBC_HEADERS_VERSION=3D2.6.31
LINUX_LIBC_HEADERS_VERSION=3D"2.6.31"

# PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-gcc=3Dgcc-cross
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-gcc=3D"gcc-cross"

# SPLASH=3D ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstro=
m", "",d)}
SPLASH=3D""

# IMAGE_CMD_jffs2=3Dmkfs.jffs2 -x lzo --root=3D${IMAGE_ROOTFS} --faketime -=
-output=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}
IMAGE_CMD_jffs2=3D"mkfs.jffs2 -x lzo --root=3D/home/DRESEARCH/sledz/work/Hy=
draIP/OE/tmp.6/rootfs/libsoup-2.4 --faketime --output=3D/home/DRESEARCH/sle=
dz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/Angstrom-libsoup-2.4-gli=
bc-ipk-2010.7-test-20110203-hipox.rootfs.jffs2"

# KONSOLE_TERMCMD=3Dkonsole -T "$TERMWINDOWTITLE"
KONSOLE_TERMCMD=3D"konsole -T \"$TERMWINDOWTITLE\""

# ALLOW_EMPTY_${PN}-dev=3DNone
# PREFERRED_VERSION_qt4-embedded=3D${ANGSTROM_QT_VERSION}
PREFERRED_VERSION_qt4-embedded=3D"4.6.3"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-png=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-png=3D"gtk+"

# FILES_libsoup-gnome=3D${libdir}/libsoup-gnome*.so.*
FILES_libsoup-gnome=3D"/usr/lib/libsoup-gnome*.so.*"

# base_prefix=3D
# SRC_DISTRIBUTE_DLONLY=3D0
SRC_DISTRIBUTE_DLONLY=3D"0"

# layout_mandir=3D${mandir}
layout_mandir=3D"/usr/share/man"

# __depends=3D[('/home/DRESEARCH/sledz/work/HydraIP/OE/hipox/conf/local.con=
f', 1296725026), ('/home/DRESEARCH/sledz/work/openembedded/conf/machine/hip=
ox.conf', 1284017760), ('/home/DRESEARCH/sledz/work/openembedded/conf/machi=
ne/include/tune-arm926ejs.inc', 1287649457), ('/home/DRESEARCH/sledz/work/o=
penembedded/conf/distro/angstrom-2008.1.conf', 1296491286), ('/home/DRESEAR=
CH/sledz/work/openembedded/conf/distro/include/sane-srcdates.inc', 12964912=
86), ('/home/DRESEARCH/sledz/work/openembedded/conf/distro/include/sane-src=
revs.inc', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/conf/dist=
ro/include/angstrom-2008-preferred-versions.inc', 1296491286), ('/home/DRES=
EARCH/sledz/work/openembedded/conf/distro/include/angstrom-codec-engine-2.2=
5.01-preferred-versions.inc', 1287649457), ('/home/DRESEARCH/sledz/work/ope=
nembedded/conf/distro/include/preferred-opie-versions-1.2.4.inc', 129649128=
6), ('/home/DRESEARCH/sledz/work/openembedded/conf/distro/include/toolchain=
-internal.inc', 1287649457), ('/home/DRESEARCH/sledz/work/openembedded/conf=
/distro/include/arm-thumb.inc', 1296491286), ('/home/DRESEARCH/sledz/work/o=
penembedded/conf/distro/include/angstrom.inc', 1296491286), ('/home/DRESEAR=
CH/sledz/work/openembedded/conf/distro/include/angstrom-glibc.inc', 1296639=
956), ('/home/DRESEARCH/sledz/work/openembedded/conf/distro/include/glibc-i=
nternal.inc', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/conf/d=
istro/include/sane-toolchain-java.inc', 1284017760), ('/home/DRESEARCH/sled=
z/work/openembedded/conf/distro/include/angstrom-jalimo.conf', 1296491286),=
 ('/home/DRESEARCH/sledz/work/openembedded/conf/distro/include/angstrom-pac=
kage-ipk.inc', 1284017760), ('/home/DRESEARCH/sledz/work/openembedded/conf/=
documentation.conf', 1284017760), ('/home/DRESEARCH/sledz/work/openembedded=
/conf/sanity.conf', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/=
conf/abi_version.conf', 1287649457), ('/home/DRESEARCH/sledz/work/openembed=
ded/conf/enterprise.conf', 1284017760), ('/home/DRESEARCH/sledz/work/openem=
bedded/conf/compatibility-providers.conf', 1296491286), ('/home/DRESEARCH/s=
ledz/work/openembedded/classes/base.bbclass', 1296491286), ('/home/DRESEARC=
H/sledz/work/openembedded/classes/patch.bbclass', 1296491286), ('/home/DRES=
EARCH/sledz/work/openembedded/classes/staging.bbclass', 1296491286), ('/hom=
e/DRESEARCH/sledz/work/openembedded/classes/packaged-staging.bbclass', 1296=
491286), ('/home/DRESEARCH/sledz/work/openembedded/classes/packagedata.bbcl=
ass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/classes/mirror=
s.bbclass', 1287649457), ('/home/DRESEARCH/sledz/work/openembedded/classes/=
utils.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/clas=
ses/utility-tasks.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/opene=
mbedded/classes/metadata_scm.bbclass', 1296491286), ('/home/DRESEARCH/sledz=
/work/openembedded/classes/devshell.bbclass', 1284017760), ('/home/DRESEARC=
H/sledz/work/openembedded/classes/src_distribute_local.bbclass', 1287649457=
), ('/home/DRESEARCH/sledz/work/openembedded/classes/src_distribute.bbclass=
', 1287649457), ('/home/DRESEARCH/sledz/work/openembedded/classes/debian.bb=
class', 1287649457), ('/home/DRESEARCH/sledz/work/openembedded/classes/sani=
ty.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/classes=
/qemu.bbclass', 1287649457), ('/home/DRESEARCH/sledz/work/openembedded/clas=
ses/angstrom.bbclass', 1284017760), ('/home/DRESEARCH/sledz/work/openembedd=
ed/classes/devshell.bbclass', 1284017760), ('/home/DRESEARCH/sledz/work/ope=
nembedded/classes/angstrom-mirrors.bbclass', 1287649457), ('/home/DRESEARCH=
/sledz/work/openembedded/classes/insane.bbclass', 1296491286), ('/home/DRES=
EARCH/sledz/work/openembedded/classes/package.bbclass', 1296491286), ('/hom=
e/DRESEARCH/sledz/work/openembedded/classes/recipe_sanity.bbclass', 1287649=
457), ('/home/DRESEARCH/sledz/work/openembedded/classes/testlab.bbclass', 1=
287649457), ('/home/DRESEARCH/sledz/work/openembedded/classes/package_ipk.b=
bclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/classes/san=
ity.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/classe=
s/gnome.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/cl=
asses/gnomebase.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openemb=
edded/classes/autotools.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work=
/openembedded/classes/siteinfo.bbclass', 1296491286), ('/home/DRESEARCH/sle=
dz/work/openembedded/classes/pkgconfig.bbclass', 1296491286), ('/home/DRESE=
ARCH/sledz/work/openembedded/classes/gtk-icon-cache.bbclass', 1296491286), =
('/home/DRESEARCH/sledz/work/openembedded/classes/gconf.bbclass', 128764945=
7), ('/home/DRESEARCH/sledz/work/openembedded/classes/mime.bbclass', 128401=
7760)]
# METADATA_BRANCH=3D${@base_get_scm_branch(d)}
METADATA_BRANCH=3D"2010-10-01_oe_sync"

# PREFERRED_VERSION_ti-codecs-omap3530=3D1_00_01
PREFERRED_VERSION_ti-codecs-omap3530=3D"1_00_01"

# CC=3D${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
export CC=3D"arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm92=
6ej-s -mthumb-interwork -mno-thumb"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-ico=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-ico=3D"gtk+"

# GPE_SVN=3Dsvn://projects.linuxtogo.org/svn/gpe/trunk/base;module=3D${PN}
GPE_SVN=3D"svn://projects.linuxtogo.org/svn/gpe/trunk/base;module=3Dlibsoup=
-2.4"

# SYSROOT_PREPROCESS_FUNCS=3D pkgconfig_sysroot_preprocess
SYSROOT_PREPROCESS_FUNCS=3D"pkgconfig_sysroot_preprocess"

# HGDIR=3D${CO_DIR}/hg
HGDIR=3D"/home/DRESEARCH/sledz/sources/hg"

# PREFERRED_VERSION_tiff=3D3.9.2+4.0.0beta5
PREFERRED_VERSION_tiff=3D"3.9.2+4.0.0beta5"

# PREFERRED_VERSION_opie-sysinfo=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-sysinfo=3D"1.2.4"

# SEPPUKU_ATTACHMENT=3Dhttp://bugs.openembedded.net/attachment.cgi?
SEPPUKU_ATTACHMENT=3D"http://bugs.openembedded.net/attachment.cgi?"

# PREFERRED_VERSION_opie-style-fresh=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-style-fresh=3D"1.2.4"

# BPN=3D${@base_prune_suffix('${PN}', '${SPECIAL_PKGSUFFIX}'.split(), d)}
BPN=3D"libsoup-2.4"

# BB_DEFAULT_TASK=3Dbuild
BB_DEFAULT_TASK=3D"build"

# PREFERRED_VERSION_opie-stumbler=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-stumbler=3D"1.2.4"

# IMAGE_FSTYPES=3Dtar
IMAGE_FSTYPES=3D"tar"

# EXTRA_IMAGECMD_yaffs2=3D1
EXTRA_IMAGECMD_yaffs2=3D"1"

# PREFERRED_VERSION_opie-mail=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mail=3D"1.2.4"

# PREFERRED_VERSION_opie-embeddedkonsole=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-embeddedkonsole=3D"1.2.4"

# MACHINE_GUI_CLASS=3Dsmallscreen
MACHINE_GUI_CLASS=3D"smallscreen"

# STAGING_LOADER_DIR=3D${STAGING_DIR_HOST}/loader
STAGING_LOADER_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/=
armv5te-angstrom-linux-gnueabi/loader"

# ANGSTROM_GCC_VERSION_ppc405=3D4.1.1
ANGSTROM_GCC_VERSION_ppc405=3D"4.1.1"

# RDEPENDS=3D hicolor-icon-theme
RDEPENDS=3D"hicolor-icon-theme"

# DISTRO_EXTRA_RDEPENDS=3D angstrom-version ${ANGSTROM_FEED_CONFIGS} util-l=
inux-ng-mount util-linux-ng-umount angstrom-libc-fixup-hack=20
DISTRO_EXTRA_RDEPENDS=3D"angstrom-version angstrom-feed-configs util-linux-=
ng-mount util-linux-ng-umount angstrom-libc-fixup-hack"

# PREFERRED_VERSION_opie-oxygen=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-oxygen=3D"1.2.4"

# LOCALE_UTF8_ONLY=3D1
LOCALE_UTF8_ONLY=3D"1"

# IMAGE_DEPENDS_ext3=3Dgenext2fs-native e2fsprogs-native
IMAGE_DEPENDS_ext3=3D"genext2fs-native e2fsprogs-native"

# IMAGE_DEPENDS_ext2=3Dgenext2fs-native
IMAGE_DEPENDS_ext2=3D"genext2fs-native"

# PREFERRED_VERSION_icedtea6-native=3D1.7.3
PREFERRED_VERSION_icedtea6-native=3D"1.7.3"

# PREFERRED_VERSION_opie-today-todolistplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-today-todolistplugin=3D"1.2.4"

# DL_DIR=3D${HOME}/sources
DL_DIR=3D"/home/DRESEARCH/sledz/sources"

# PREFERRED_PROVIDER_gnome-vfs-plugin-file=3Dgnome-vfs
PREFERRED_PROVIDER_gnome-vfs-plugin-file=3D"gnome-vfs"

# PREFERRED_VERSION_opie-solitaire=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-solitaire=3D"1.2.4"

# PREFERRED_VERSION_usbutils=3D0.86
PREFERRED_VERSION_usbutils=3D"0.86"

# CACHE=3D/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/cache/glibc/hipox
CACHE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/cache/glibc/hipox"

# PREFERRED_PROVIDER_virtual/libx11=3Dlibx11
PREFERRED_PROVIDER_virtual/libx11=3D"libx11"

# TARGET_PREFIX=3D${TARGET_SYS}-
TARGET_PREFIX=3D"arm-angstrom-linux-gnueabi-"

# PREFERRED_VERSION_opie-mindbreaker=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mindbreaker=3D"1.2.4"

# expansion of SRCPV threw <class 'bb.fetch.ParameterError'>
# PREFERRED_VERSION_pulseaudio=3D0.9.15
PREFERRED_VERSION_pulseaudio=3D"0.9.15"

# STAGING_ETCDIR=3D${STAGING_DIR_HOST}${sysconfdir}
STAGING_ETCDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv=
5te-angstrom-linux-gnueabi/etc"

# ANGSTROM_GCC_VERSION=3D4.3.3
ANGSTROM_GCC_VERSION=3D"4.3.3"

# IPKGCONF_SDK=3D${STAGING_ETCDIR_NATIVE}/opkg-sdk.conf
IPKGCONF_SDK=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-l=
inux/etc/opkg-sdk.conf"

# TARGET_LDFLAGS=3D-L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGI=
NG_DIR_TARGET}${libdir} -Wl,-O1 ${TARGET_LINK_HASH_STYLE}
export TARGET_LDFLAGS=3D"-L/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysr=
oots/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/li=
b -Wl,-O1 -Wl,--hash-style=3Dgnu"

# PREFERRED_VERSION_opie-eye=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-eye=3D"1.2.4"

# D=3D${WORKDIR}/image
D=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linu=
x-gnueabi/libsoup-2.4-2.29.91-r0/image"

# TERM=3Dxterm
export TERM=3D"xterm"

# PACKAGES=3Dlibsoup-gnome ${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-static=
 ${PN}-locale
PACKAGES=3D"libsoup-gnome libsoup-2.4-dbg libsoup-2.4 libsoup-2.4-doc libso=
up-2.4-dev libsoup-2.4-static libsoup-2.4-locale"

# PREFERRED_PROVIDER_gnome-vfs=3Dgnome-vfs
PREFERRED_PROVIDER_gnome-vfs=3D"gnome-vfs"

# __recipe_sanity_reqvars=3DDESCRIPTION
__recipe_sanity_reqvars=3D"DESCRIPTION"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-pcx=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-pcx=3D"gtk+"

# IMAGE_DEPENDS_ext3.bz2=3Dgenext2fs-native e2fsprogs-native
IMAGE_DEPENDS_ext3.bz2=3D"genext2fs-native e2fsprogs-native"

# MULTIMACH_HOST_SYS=3D${MULTIMACH_ARCH}${HOST_VENDOR}-${HOST_OS}
MULTIMACH_HOST_SYS=3D"armv5te-angstrom-linux-gnueabi"

# PREFERRED_PROVIDER_virtual/update-alternatives=3Dopkg
PREFERRED_PROVIDER_virtual/update-alternatives=3D"opkg"

# TARGET_FPU=3Dsoft
TARGET_FPU=3D"soft"

# PREFERRED_VERSION_libopieobex0=3D${OPIE_VERSION}
PREFERRED_VERSION_libopieobex0=3D"1.2.4"

# PREFERRED_VERSION_opie-camera=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-camera=3D"1.2.4"

# PSTAGE_NATIVEDEPENDS=3D    shasum-native     stagemanager-native    =20
PSTAGE_NATIVEDEPENDS=3D"shasum-native     stagemanager-native"

# FILES_libsoup-2.4=3D${libdir}/libsoup-2*.so.*
FILES_libsoup-2.4=3D"/usr/lib/libsoup-2*.so.*"

# PREFERRED_VERSION_opie-advancedfm=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-advancedfm=3D"1.2.4"

# PKG_CONFIG_DISABLE_UNINSTALLED=3Dyes
export PKG_CONFIG_DISABLE_UNINSTALLED=3D"yes"

# PACKAGE_ARCH=3D${BASE_PACKAGE_ARCH}
PACKAGE_ARCH=3D"armv5te"

# BUILDNAME=3DAngstrom ${DISTRO_VERSION}
BUILDNAME=3D"Angstrom 2010.7-test-20110203"

# PREFERRED_VERSION_opie-pyquicklaunchapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-pyquicklaunchapplet=3D"1.2.4"

# MACHINE_EXTRA_RDEPENDS=3D
# SITEINFO_ENDIANNESS=3Dle
SITEINFO_ENDIANNESS=3D"le"

# SANITY_PRFILE=3D${TMPDIR}/distro_pr
SANITY_PRFILE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/distro_pr"

# MULTIMACH_ARCH=3Darmv5te
MULTIMACH_ARCH=3D"armv5te"

# DISTRO_CHECK=3D2010.7-test-20110203
DISTRO_CHECK=3D"2010.7-test-20110203"

# PREFERRED_VERSION_binutils-cross_avr32=3D2.17
PREFERRED_VERSION_binutils-cross_avr32=3D"2.17"

# PREFERRED_VERSION_network-manager-applet=3D0.8.1
PREFERRED_VERSION_network-manager-applet=3D"0.8.1"

# MACHINE_ESSENTIAL_EXTRA_RDEPENDS=3D
# STAMP=3D${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PF}
STAMP=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/stamps/armv5te-angstro=
m-linux-gnueabi/libsoup-2.4-2.29.91-r0"

# PREFERRED_VERSION_opie-datebook-birthdayplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-datebook-birthdayplugin=3D"1.2.4"

# PREFERRED_VERSION_opie-securityplugin-pin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-securityplugin-pin=3D"1.2.4"

# BBINCLUDELOGS=3Dyes
BBINCLUDELOGS=3D"yes"

# PREFERRED_VERSION_classpath=3D0.98
PREFERRED_VERSION_classpath=3D"0.98"

# PREFERRED_PROVIDER_virtual/libintl=3Dglibc
PREFERRED_PROVIDER_virtual/libintl=3D"glibc"

# PREFERRED_VERSION_cacaoh-native=3D0.99.3
PREFERRED_VERSION_cacaoh-native=3D"0.99.3"

# PREFERRED_VERSION_opie-icon-reload=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-icon-reload=3D"1.2.4"

# PYTHON=3D${@sys.executable}
PYTHON=3D"/usr/bin/python"

# SECTION_libsoup-2.4-dbg=3Ddevel
SECTION_libsoup-2.4-dbg=3D"devel"

# ANGSTROM_ARM_INSTRUCTION_SET=3Darm
ANGSTROM_ARM_INSTRUCTION_SET=3D"arm"

# PREFERRED_VERSION_opie-qasteroids=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-qasteroids=3D"1.2.4"

# PREFERRED_PROVIDER_bluez-utils=3Dbluez4
PREFERRED_PROVIDER_bluez-utils=3D"bluez4"

# ALLOW_EMPTY_libsoup-2.4-dev=3D1
ALLOW_EMPTY_libsoup-2.4-dev=3D"1"

# FILES_libsoup-2.4-locale=3D${datadir}/locale
FILES_libsoup-2.4-locale=3D"/usr/share/locale"

# METADATA_SCM=3D${@base_get_scm(d)}
METADATA_SCM=3D"git /home/DRESEARCH/sledz/work/openembedded"

# PREFERRED_VERSION_ti-codecs-omap3530-server=3D1_00_00
PREFERRED_VERSION_ti-codecs-omap3530-server=3D"1_00_00"

# __recipe_sanity_reqdiffvars=3DLICENSE
__recipe_sanity_reqdiffvars=3D"LICENSE"

# do_distribute_sources_all=3DNone
# SRCREV=3D1
SRCREV=3D"1"

# layout_servicedir=3D${servicedir}
layout_servicedir=3D"/srv"

# PACKAGEFUNCS=3Dperform_packagecopy                 ${PACKAGE_PREPROCESS_F=
UNCS} 		package_do_split_locales 		populate_packages 		package_do_shlibs 		=
package_do_pkgconfig 		read_shlibdeps 		package_depchains 		emit_pkgdata  d=
o_package_qa=20
PACKAGEFUNCS=3D"perform_packagecopy                  autotools_prepackage_l=
amangler 		package_do_split_locales 		populate_packages 		package_do_shlibs=
 		package_do_pkgconfig 		read_shlibdeps 		package_depchains 		emit_pkgdata=
  do_package_qa"

# PREFERRED_VERSION_opie-parashoot=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-parashoot=3D"1.2.4"

# PREFERRED_VERSION_opie-mailapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mailapplet=3D"1.2.4"

# PREFERRED_VERSION_mesa-dri=3D7.6
PREFERRED_VERSION_mesa-dri=3D"7.6"

# OPIE_VERSION=3D1.2.4
OPIE_VERSION=3D"1.2.4"

# BUILDCFG_NEEDEDVARS=3DTARGET_ARCH TARGET_OS
BUILDCFG_NEEDEDVARS=3D"TARGET_ARCH TARGET_OS"

# ANGSTROM_BLACKLIST_pn-ipkg=3Dipkg has been superseded by opkg
ANGSTROM_BLACKLIST_pn-ipkg=3D"ipkg has been superseded by opkg"

# BZRDIR=3D${CO_DIR}/bzr
BZRDIR=3D"/home/DRESEARCH/sledz/sources/bzr"

# PREFERRED_VERSION_automake-native=3D1.11.1
PREFERRED_VERSION_automake-native=3D"1.11.1"

# EXTRA_IMAGECMD_squashfs-lzma=3D
# T=3D${WORKDIR}/temp
T=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linu=
x-gnueabi/libsoup-2.4-2.29.91-r0/temp"

# PREFERRED_PROVIDER_openmoko-alsa-scenarios=3Dfsodeviced
PREFERRED_PROVIDER_openmoko-alsa-scenarios=3D"fsodeviced"

# PREFERRED_PROVIDER_atd=3Datd
PREFERRED_PROVIDER_atd=3D"atd"

# PREFERRED_VERSION_busybox=3D1.13.2
PREFERRED_VERSION_busybox=3D"1.13.2"

# IMAGE_DEPENDS_ubi=3Dmtd-utils-native
IMAGE_DEPENDS_ubi=3D"mtd-utils-native"

# PREFERRED_PROVIDER_virtual/db-native=3Ddb-native
PREFERRED_PROVIDER_virtual/db-native=3D"db-native"

# FULL_OPTIMIZATION_pn-perl=3D-fexpensive-optimizations -fomit-frame-pointe=
r -frename-registers -O1
FULL_OPTIMIZATION_pn-perl=3D"-fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O1"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-ras=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-ras=3D"gtk+"

# HOST_PREFIX=3D${TARGET_PREFIX}
HOST_PREFIX=3D"arm-angstrom-linux-gnueabi-"

# PREFERRED_PROVIDER_virtual/db=3Ddb
PREFERRED_PROVIDER_virtual/db=3D"db"

# BP=3D${BPN}-${PV}
BP=3D"libsoup-2.4-2.29.91"

# PREFERRED_VERSION_opie-calculator=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-calculator=3D"1.2.4"

# XLIBS_MIRROR=3Dhttp://xlibs.freedesktop.org/release
XLIBS_MIRROR=3D"http://xlibs.freedesktop.org/release"

# SDK_ARCH=3D${BUILD_ARCH}
SDK_ARCH=3D"i686"

# ANGSTROM_GCC_VERSION_armv4=3D4.4.2
ANGSTROM_GCC_VERSION_armv4=3D"4.4.2"

# SHELL=3D/bin/bash
export SHELL=3D"/bin/bash"

# TINDER_MACHINE=3D${MACHINE}-${LIBC}-build-image
TINDER_MACHINE=3D"hipox-glibc-build-image"

# PREFERRED_VERSION_jamvm-native=3D1.5.3
PREFERRED_VERSION_jamvm-native=3D"1.5.3"

# STAGING_PYDIR=3D${STAGING_DIR}/lib/python2.4
STAGING_PYDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/lib/p=
ython2.4"

# PREFERRED_PROVIDER_virtual/libx11-native=3Dlibx11-native
PREFERRED_PROVIDER_virtual/libx11-native=3D"libx11-native"

# PREFERRED_VERSION_uclibc=3D0.9.30.2
PREFERRED_VERSION_uclibc=3D"0.9.30.2"

# PREFERRED_PROVIDER_qemu-native=3Dqemu-native
PREFERRED_PROVIDER_qemu-native=3D"qemu-native"

# PREFERRED_VERSION_opie-pickboard=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-pickboard=3D"1.2.4"

# PREFERRED_VERSION_ti-codecs_omapl137-server=3D1_00_00
PREFERRED_VERSION_ti-codecs_omapl137-server=3D"1_00_00"

# BBFILE_PATTERN=3D^${OE_HOME}/hipox/recipes/
BBFILE_PATTERN=3D"^/home/DRESEARCH/sledz/work/HydraIP/OE/hipox/recipes/"

# IMAGE_PKGTYPE=3Dipk
IMAGE_PKGTYPE=3D"ipk"

# SHLIBSDIR=3D${STAGING_DIR_HOST}/shlibs
SHLIBSDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-a=
ngstrom-linux-gnueabi/shlibs"

# EXTENDPKGV=3D${EXTENDPKGEVER}${PKGV}-${PKGR}
EXTENDPKGV=3D"2.29.91-r0.6"

# TARGET_FPU_ixp4xx=3Dsoft
TARGET_FPU_ixp4xx=3D"soft"

# PREFERRED_VERSION_cacao=3D0.99.3
PREFERRED_VERSION_cacao=3D"0.99.3"

# PREFERRED_VERSION_ti-codecs-dm355=3D1_13_000
PREFERRED_VERSION_ti-codecs-dm355=3D"1_13_000"

# MACHINE_FEATURES=3Dkernel26 ext2 pci usbhost ethernet serial raid uboot
MACHINE_FEATURES=3D"kernel26 ext2 pci usbhost ethernet serial raid uboot"

# FULL_OPTIMIZATION_sparc=3D-fexpensive-optimizations -fomit-frame-pointer =
-frename-registers -O2
FULL_OPTIMIZATION_sparc=3D"-fexpensive-optimizations -fomit-frame-pointer -=
frename-registers -O2"

# palmqtdir=3D${palmtopdir}
export palmqtdir=3D"/usr/lib/opie"

# PREFERRED_VERSION_opie-homeapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-homeapplet=3D"1.2.4"

# SOURCE_MIRROR_FETCH=3DNone
# STAGING_SBINDIR_NATIVE=3D${STAGING_DIR_NATIVE}${sbindir_native}
STAGING_SBINDIR_NATIVE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysro=
ots/i686-linux/usr/sbin"

# ARM_THUMB_M_OPT=3D${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRU=
CTION_SET', d, 1) =3D=3D 'thumb']}
ARM_THUMB_M_OPT=3D"-mno-thumb"

# PREFERRED_PROVIDER_ntp=3Dntp
PREFERRED_PROVIDER_ntp=3D"ntp"

# ANGSTROM_GCC_VERSION_xilinx-ml403=3D4.1.1
ANGSTROM_GCC_VERSION_xilinx-ml403=3D"4.1.1"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-bmpg=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-bmpg=3D"gtk+"

# PREFERRED_VERSION_classpath-native=3D0.98
PREFERRED_VERSION_classpath-native=3D"0.98"

# TARGET_CC_ARCH_pn-webkit-gtk_armv5te=3D-march=3Darmv4t
TARGET_CC_ARCH_pn-webkit-gtk_armv5te=3D"-march=3Darmv4t"

# PREFERRED_VERSION_ti-codecs-dm6467=3D1_00_00_03
PREFERRED_VERSION_ti-codecs-dm6467=3D"1_00_00_03"

# PSTAGE_EXTRAPATH=3D${LIBC}
PSTAGE_EXTRAPATH=3D"glibc"

# do_package_write_rpm=3DNone
# PREFERRED_VERSION_ti-linuxutils=3D2_25_01_06
PREFERRED_VERSION_ti-linuxutils=3D"2_25_01_06"

# BBFILE_PRIORITY_local=3D10
BBFILE_PRIORITY_local=3D"10"

# PREFERRED_VERSION_opie-jumpx=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-jumpx=3D"1.2.4"

# PREFERRED_VERSION_mplayer=3D0.0+1.0rc3+svnr30165
PREFERRED_VERSION_mplayer=3D"0.0+1.0rc3+svnr30165"

# BBINCLUDELOGS_LINES=3DNone
# USERDISTRO=3Dangstrom-2008.1
USERDISTRO=3D"angstrom-2008.1"

# PREFERRED_VERSION_ti-dmai=3D2_10_00_01+svnr%
PREFERRED_VERSION_ti-dmai=3D"2_10_00_01+svnr%"

# CXX=3D${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
export CXX=3D"arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Darm9=
26ej-s -mthumb-interwork -mno-thumb"

# PREFERRED_VERSION_opie-drawpad=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-drawpad=3D"1.2.4"

# TOOLCHAIN_OPTIONS=3D
# PREFERRED_VERSION_lighttpd=3D1.4.26
PREFERRED_VERSION_lighttpd=3D"1.4.26"

# STAGING_DIR_HOST=3D${STAGING_DIR}/${BASEPKG_HOST_SYS}
STAGING_DIR_HOST=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/ar=
mv5te-angstrom-linux-gnueabi"

# TARGET_CC_KERNEL_ARCH=3D -mno-thumb-interwork -mno-thumb
TARGET_CC_KERNEL_ARCH=3D"-mno-thumb-interwork -mno-thumb"

# PREFERRED_VERSION_opie-systemtime=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-systemtime=3D"1.2.4"

# PREFERRED_VERSION=3DNone
# palmtopdir=3D${libdir}/opie
export palmtopdir=3D"/usr/lib/opie"

# TINDER_REPORT=3D1
TINDER_REPORT=3D"1"

# layout_libexecdir=3D${libexecdir}
layout_libexecdir=3D"/usr/libexec"

# BB_STAMP_WHITELIST=3D${PSTAGE_NATIVEDEPENDS}
BB_STAMP_WHITELIST=3D"shasum-native     stagemanager-native"

# PREFERRED_VERSION_opie-mediaplayer2-skin-pod=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer2-skin-pod=3D"1.2.4"

# BBFILE_PRIORITY_upstream=3D5
BBFILE_PRIORITY_upstream=3D"5"

# PREFERRED_VERSION_ti-framework-components=3D2_25_01_05
PREFERRED_VERSION_ti-framework-components=3D"2_25_01_05"

# PREFERRED_VERSION_ti-codecs-dm365-server=3D3_10_00_02
PREFERRED_VERSION_ti-codecs-dm365-server=3D"3_10_00_02"

# SCREEN_TERMCMD=3Dscreen -D -m -t "$TERMWINDOWTITLE"
SCREEN_TERMCMD=3D"screen -D -m -t \"$TERMWINDOWTITLE\""

# PREFERRED_PROVIDER_avahi=3Davahi
PREFERRED_PROVIDER_avahi=3D"avahi"

# PREFERRED_VERSION_xserver-common=3D1.33
PREFERRED_VERSION_xserver-common=3D"1.33"

# PREFERRED_VERSION_gtkmm=3D2.20.0
PREFERRED_VERSION_gtkmm=3D"2.20.0"

# PREFERRED_PROVIDER_virtual/libgl=3Dmesa
PREFERRED_PROVIDER_virtual/libgl=3D"mesa"

# PREFERRED_PROVIDER_virtual/libusb0=3Dlibusb-compat
PREFERRED_PROVIDER_virtual/libusb0=3D"libusb-compat"

# PREFERRED_PROVIDER_util-linux=3Dutil-linux-ng
PREFERRED_PROVIDER_util-linux=3D"util-linux-ng"

# PF=3D${PN}-${EXTENDPE}${PV}-${PR}
PF=3D"libsoup-2.4-2.29.91-r0"

# PREFERRED_VERSION_opie-today-addressbookplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-today-addressbookplugin=3D"1.2.4"

# PREFERRED_PROVIDER_virtual/libiconv=3Dglibc
PREFERRED_PROVIDER_virtual/libiconv=3D"glibc"

# PREFERRED_PROVIDER_virtual/libqte2=3D${@base_conditional("PALMTOP_USE_MUL=
TITHREADED_QT", "yes", "qte-mt", "qte", d)}
PREFERRED_PROVIDER_virtual/libqte2=3D"qte-mt"

# PREFERRED_VERSION_opie-reader=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-reader=3D"1.2.4"

# DEPLOY_DIR=3D${TMPDIR}/deploy/${LIBC}
DEPLOY_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc"

# LOCALCOUNT=3D0
LOCALCOUNT=3D"0"

# OLDEST_KERNEL_linux-gnueabi=3D2.6.16
OLDEST_KERNEL_linux-gnueabi=3D"2.6.16"

# TINDER_TREE=3DAngstrom
TINDER_TREE=3D"Angstrom"

# BUILD_CC_ARCH=3D
# PREFERRED_VERSION_jamvm-initial=3D1.4.5
PREFERRED_VERSION_jamvm-initial=3D"1.4.5"

# PREFERRED_VERSION_opie-pimconverter=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-pimconverter=3D"1.2.4"

# PKG_CONFIG_SYSROOT_DIR=3D${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_VEND=
OR}-${TARGET_OS}
export PKG_CONFIG_SYSROOT_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/sysroots/armv5te-angstrom-linux-gnueabi"

# BASEPKG_TARGET_SYS=3D${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}
BASEPKG_TARGET_SYS=3D"armv5te-angstrom-linux-gnueabi"

# BUILD_VENDOR=3D
# KERNELORG_MIRROR=3Dhttp://kernel.org
KERNELORG_MIRROR=3D"http://kernel.org"

# IMAGE_CMD=3D
# DEPCHAIN_PRE=3D
# ANGSTROM_QT_VERSION=3D4.6.3
ANGSTROM_QT_VERSION=3D"4.6.3"

# PREFERRED_VERSION_libsdl-x11=3D1.2.14
PREFERRED_VERSION_libsdl-x11=3D"1.2.14"

# SDK_VENDOR=3D${BUILD_VENDOR}
# FEED_ARCH=3Darmv5te
FEED_ARCH=3D"armv5te"

# ANGSTROM_GCC_VERSION_bfin=3D4.1.2
ANGSTROM_GCC_VERSION_bfin=3D"4.1.2"

# RPROVIDES=3D
# FETCHCOMMAND=3DERROR, this must be a BitBake bug
FETCHCOMMAND=3D"ERROR, this must be a BitBake bug"

# FEED_BASEPATH=3Dfeeds/unstable/${ANGSTROM_PKG_FORMAT}/${LIBC}/
FEED_BASEPATH=3D"feeds/unstable/ipk/glibc/"

# FULL_OPTIMIZATION_pn-glibc=3D-fexpensive-optimizations -fomit-frame-point=
er -O2
FULL_OPTIMIZATION_pn-glibc=3D"-fexpensive-optimizations -fomit-frame-pointe=
r -O2"

# PKGD=3D${WORKDIR}/package
PKGD=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/libsoup-2.4-2.29.91-r0/package"

# BBFILES=3D/home/DRESEARCH/sledz/work/openembedded/recipes/*/*.bb /home/DR=
ESEARCH/sledz/work/HydraIP/OE/hipox/recipes/*/*.bb /home/DRESEARCH/sledz/wo=
rk/HydraIP/OE/common/recipes/*/*.bb
BBFILES=3D"/home/DRESEARCH/sledz/work/openembedded/recipes/*/*.bb /home/DRE=
SEARCH/sledz/work/HydraIP/OE/hipox/recipes/*/*.bb /home/DRESEARCH/sledz/wor=
k/HydraIP/OE/common/recipes/*/*.bb"

# PREFERRED_PROVIDER_virtual/psplash=3Dpsplash-angstrom
PREFERRED_PROVIDER_virtual/psplash=3D"psplash-angstrom"

# PKG_CONFIG_PATH=3D${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig
export PKG_CONFIG_PATH=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysro=
ots/armv5te-angstrom-linux-gnueabi/usr/lib/pkgconfig:/home/DRESEARCH/sledz/=
work/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/pkg=
config"

# PREFERRED_PROVIDER_virtual/javac-native=3Decj-bootstrap-native
PREFERRED_PROVIDER_virtual/javac-native=3D"ecj-bootstrap-native"

# SYSROOT_LOCK=3D${STAGING_DIR}/staging.lock
SYSROOT_LOCK=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/stagin=
g.lock"

# FULL_OPTIMIZATION_ep9312=3D-fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O -fno-signed-zeros
FULL_OPTIMIZATION_ep9312=3D"-fexpensive-optimizations -fomit-frame-pointer =
-frename-registers -O -fno-signed-zeros"

# _=3D/opt/bitbake/bin/bitbake
export _=3D"/opt/bitbake/bin/bitbake"

# FILES=3D
# PSTAGE_PKG=3D${PSTAGE_DIR}/${PSTAGE_PKGPATH}/${PSTAGE_PKGNAME}
PSTAGE_PKG=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/angstromgl=
ibc/staging-libsoup-2.4-armv5te-angstrom-linux-gnueabi_2.29.91-r0_armv5te-l=
inux-gnueabi.ipk"

# XSERVER=3Dxserver-xorg xf86-input-evdev xf86-input-keyboard xf86-input-mo=
use xf86-video-fbdev
XSERVER=3D"xserver-xorg xf86-input-evdev xf86-input-keyboard xf86-input-mou=
se xf86-video-fbdev"

# PREFERRED_VERSION_opie-tinykate=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-tinykate=3D"1.2.4"

# GNOME_GIT=3Dgit://git.gnome.org
GNOME_GIT=3D"git://git.gnome.org"

# AS=3D${HOST_PREFIX}as
export AS=3D"arm-angstrom-linux-gnueabi-as"

# PREFERRED_PROVIDER_frameworkd-config=3Dframeworkd-config
PREFERRED_PROVIDER_frameworkd-config=3D"frameworkd-config"

# PREFERRED_PROVIDER_libxss=3Dlibxss
PREFERRED_PROVIDER_libxss=3D"libxss"

# MACHINE_ARCH=3D${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MAC=
HINE}', 'BASE_PACKAGE_ARCH')}
MACHINE_ARCH=3D"hipox"

# FREEDESKTOP_CVS=3Dcvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs
FREEDESKTOP_CVS=3D"cvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs"

# BUILDCFG_HEADER=3DBuild Configuration:
BUILDCFG_HEADER=3D"Build Configuration:"

# PREFERRED_VERSION_opie-mediaplayer1-libwavplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer1-libwavplugin=3D"1.2.4"

# PREFERRED_VERSION_opie-powerchord=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-powerchord=3D"1.2.4"

# PREFERRED_VERSION_opie-oyatzee=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-oyatzee=3D"1.2.4"

# BUILD_CPPFLAGS=3D-isystem${STAGING_INCDIR_NATIVE}
export BUILD_CPPFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/sysroots/i686-linux/usr/include"

# XTERM_TERMCMDRUN=3D${XTERM_TERMCMD} -e $SHELLCMDS
XTERM_TERMCMDRUN=3D"xterm -T \"$TERMWINDOWTITLE\" -e $SHELLCMDS"

# PREFERRED_VERSION_opie-tonleiter=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-tonleiter=3D"1.2.4"

# ALLOW_EMPTY_libsoup-2.4-dbg=3D1
ALLOW_EMPTY_libsoup-2.4-dbg=3D"1"

# PATCH_GET=3D0
export PATCH_GET=3D"0"

# PREFERRED_VERSION_autoconf=3D2.65
PREFERRED_VERSION_autoconf=3D"2.65"

# PREFERRED_VERSION_opie-euroconv=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-euroconv=3D"1.2.4"

# PREFERRED_VERSION_opie-keytabs=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-keytabs=3D"1.2.4"

# SEPPUKU_NEWREPORT=3Dhttp://bugs.openembedded.net/post_bug.cgi?bug_file_lo=
c=3Dhttp%3A%2F%2F&version=3DAngstrom%20unstable&priority=3DP2&bug_severity=
=3Dnormal&op_sys=3DLinux&rep_platform=3DOther&
SEPPUKU_NEWREPORT=3D"http://bugs.openembedded.net/post_bug.cgi?bug_file_loc=
=3Dhttp%3A%2F%2F&version=3DAngstrom%20unstable&priority=3DP2&bug_severity=
=3Dnormal&op_sys=3DLinux&rep_platform=3DOther&"

# ARM_KEEP_OABI_pn-linux-openmoko-2.6.24_om-gta01=3D1
ARM_KEEP_OABI_pn-linux-openmoko-2.6.24_om-gta01=3D"1"

# COMPATIBLE_MACHINE=3DNone
# DEPLOY_DIR_IMAGE=3D${DEPLOY_DIR}/images/${MACHINE}
DEPLOY_DIR_IMAGE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glib=
c/images/hipox"

# ANGSTROM_BINUTILS_VERSION_armv4=3D2.20
ANGSTROM_BINUTILS_VERSION_armv4=3D"2.20"

# PREFERRED_VERSION_glibc-initial=3D2.9
PREFERRED_VERSION_glibc-initial=3D"2.9"

# DISPLAY=3Dlocalhost:10.0
export DISPLAY=3D"localhost:10.0"

# PREFERRED_VERSION_ti-dsplink-examples=3D1_64
PREFERRED_VERSION_ti-dsplink-examples=3D"1_64"

# SLOT=3D0
SLOT=3D"0"

# PREFERRED_PROVIDER_gconf=3Dgconf
PREFERRED_PROVIDER_gconf=3D"gconf"

# NM=3D${HOST_PREFIX}nm
export NM=3D"arm-angstrom-linux-gnueabi-nm"

# SEPPUKU_ADDCOMMENT=3Dhttp://bugs.openembedded.net/process_bug.cgi?bug_fil=
e_loc=3Dhttp%3A%2F%2F&version=3DAngstrom&priority=3DP2&bug_severity=3Dnorma=
l&op_sys=3DLinux&rep_platform=3DOther&
SEPPUKU_ADDCOMMENT=3D"http://bugs.openembedded.net/process_bug.cgi?bug_file=
_loc=3Dhttp%3A%2F%2F&version=3DAngstrom&priority=3DP2&bug_severity=3Dnormal=
&op_sys=3DLinux&rep_platform=3DOther&"

# PREFERRED_VERSION_opie-fifteen=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-fifteen=3D"1.2.4"

# PREFERRED_PROVIDER_gdk-pixbuf-loader-xbm=3Dgtk+
PREFERRED_PROVIDER_gdk-pixbuf-loader-xbm=3D"gtk+"

# PREFERRED_VERSION_opie-deco-flat=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-deco-flat=3D"1.2.4"

# PREFERRED_VERSION_qte=3D${QTE_VERSION}
PREFERRED_VERSION_qte=3D"2.3.10"

# PREFERRED_VERSION_python-pycairo=3D1.8.0
PREFERRED_VERSION_python-pycairo=3D"1.8.0"

# PREFERRED_VERSION_opie-today-mailplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-today-mailplugin=3D"1.2.4"

# DEPENDS=3Dpkgconfig-native ${@autotools_deps(d)}${@base_deps(d)} libproxy=
 glib-2.0 gnutls libxml2 sqlite3 gnome-keyring gnome-common gconf gconf-nat=
ive shared-mime-info-native shared-mime-info
DEPENDS=3D"pkgconfig-native autoconf-native automake-native libtool-native =
libtool-cross gnu-config-native coreutils-native virtual/arm-angstrom-linux=
-gnueabi-gcc virtual/libc  libproxy glib-2.0 gnutls libxml2 sqlite3 gnome-k=
eyring gnome-common gconf gconf-native shared-mime-info-native shared-mime-=
info"

# PREFERRED_VERSION_opie-clockapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-clockapplet=3D"1.2.4"

# expansion of AUTOREV threw <class 'bb.fetch.ParameterError'>
# PREFERRED_VERSION_openjdk-6-jre=3D6b18-1.8
PREFERRED_VERSION_openjdk-6-jre=3D"6b18-1.8"

# PSTAGE_PKGVERSION=3D${PV}-${PR}
PSTAGE_PKGVERSION=3D"2.29.91-r0"

# ANGSTROM_FEED_CONFIGS=3Dangstrom-feed-configs
ANGSTROM_FEED_CONFIGS=3D"angstrom-feed-configs"

# PREFERRED_VERSION_opie-irdaapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-irdaapplet=3D"1.2.4"

# TARGET_LINK_HASH_STYLE=3D${@['-Wl,--hash-style=3Dgnu',''][bb.data.getVar(=
'TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el']]}
TARGET_LINK_HASH_STYLE=3D"-Wl,--hash-style=3Dgnu"

# IMAGE_CMD_cpio=3Dcd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLO=
Y_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) ${EXTRA_IMAGECMD}
IMAGE_CMD_cpio=3D"cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/lib=
soup-2.4 && (find . | cpio -o -H newc >/home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.6/deploy/glibc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-tes=
t-20110203-hipox.rootfs.cpio)"

# PSTAGE_PKGARCH=3D${PACKAGE_ARCH}-${HOST_OS}
PSTAGE_PKGARCH=3D"armv5te-linux-gnueabi"

# PSTAGE_UPDATE_CMD=3D${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -o ${TMP=
DIR} update
PSTAGE_UPDATE_CMD=3D"stage-manager-ipkg -f /home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.6/pstage/opkg.conf -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6=
 update"

# PREFERRED_VERSION_opie-sfcave=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-sfcave=3D"1.2.4"

# IMAGE_CMD_cpio.lzma=3Dcd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | l=
zma -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAG=
ECMD}
IMAGE_CMD_cpio.lzma=3D"cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootf=
s/libsoup-2.4 && (find . | cpio -o -H newc | lzma -c -9 >/home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.6/deploy/glibc/images/hipox/Angstrom-libsoup-2.4-gl=
ibc-ipk-2010.7-test-20110203-hipox.rootfs.cpio.lzma)"

# SDK_CPPFLAGS=3D-isystem${STAGING_DIR_SDK}${includedir} -isystem${STAGING_=
DIR_HOST}${includedir}
export SDK_CPPFLAGS=3D"-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/=
sysroots/i686-linux/usr/include -isystem/home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include"

# PREFERRED_VERSION_opie-theme=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-theme=3D"1.2.4"

# SRCREV_pn-moblin-menus=3De1d63681739dd16195d005b3cf15752df294bd3c
SRCREV_pn-moblin-menus=3D"e1d63681739dd16195d005b3cf15752df294bd3c"

# ARM_KEEP_OABI=3D0
ARM_KEEP_OABI=3D"0"

# PREFERRED_VERSION_opie-brightnessapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-brightnessapplet=3D"1.2.4"

# FILES_${PN}-locale=3DNone
# __recipe_sanity_badruntimevars=3DRDEPENDS RPROVIDES RRECOMMENDS RCONFLICT=
S
__recipe_sanity_badruntimevars=3D"RDEPENDS RPROVIDES RRECOMMENDS RCONFLICTS=
"

# PREFERRED_VERSION_opie-language=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-language=3D"1.2.4"

# DESCRIPTION=3DAn HTTP library implementation in C
DESCRIPTION=3D"An HTTP library implementation in C"

# PREFERRED_VERSION_opie-bluepin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-bluepin=3D"1.2.4"

# IMAGE_CMD_squashfs-lzma=3Dmksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/=
${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp lzma
IMAGE_CMD_squashfs-lzma=3D"mksquashfs /home/DRESEARCH/sledz/work/HydraIP/OE=
/tmp.6/rootfs/libsoup-2.4 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deplo=
y/glibc/images/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hi=
pox.rootfs.squashfs-lzma  -noappend -comp lzma"

# PREFERRED_VERSION_opie-snake=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-snake=3D"1.2.4"

# __recipe_sanity_cfgdata=3D{'STAGING_INCDIR_NATIVE': '${STAGING_DIR_NATIVE=
}${includedir_native}', 'PREFERRED_VERSION_autoconf-native': '2.65', 'PREFE=
RRED_VERSION_opie-restartapplet': '${OPIE_VERSION}', 'localstatedir': '${ba=
se_prefix}/var', 'PREFERRED_VERSION_opie-today': '${OPIE_VERSION}', 'prefix=
': '/usr', 'FREESMARTPHONE_GIT': 'git://git.freesmartphone.org', 'CVSDIR': =
'${CO_DIR}/cvs', 'SVNDIR': '${CO_DIR}/svn', 'PREFERRED_VERSION_gcc-cross-in=
termediate': '${ANGSTROM_GCC_VERSION}', 'PREFERRED_VERSION_fontconfig': '2.=
8.0', 'bindir_cross': '/bin', 'PREFERRED_VERSION_ti-codecs-dm6446': '2_05_0=
0_00', 'PREFERRED_VERSION_qt4-tools-native': '${ANGSTROM_QT_VERSION}', 'MAC=
HINE_DISPLAY_WIDTH_PIXELS': '240', 'do_devshell': '\tdevshell_do_devshell\n=
', 'STRIP': '${HOST_PREFIX}strip', 'IMAGE_CMD_cpio.gz.u-boot': 'cd ${IMAGE_=
ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IM=
AGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O li=
nux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME=
}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot', =
'STAGING_DATADIR': '${STAGING_DIR_HOST}${datadir}', 'target_datadir': '/usr=
/share', 'PREFERRED_VERSION_opie-security': '${OPIE_VERSION}', '__BBANONFUN=
CS': ['__anon_184__home_DRESEARCH_sledz_work_openembedded_classes_staging_b=
bclass', '__anon_91__home_DRESEARCH_sledz_work_openembedded_classes_package=
d_staging_bbclass', '__anon_416_classes_base_bbclass', '__anon_38_classes_s=
rc_distribute_local_bbclass', '__anon_18_classes_angstrom_bbclass', '__anon=
_148__home_DRESEARCH_sledz_work_openembedded_classes_package_bbclass', '__a=
non_320_classes_package_ipk_bbclass'], 'IMAGE_ROOTFS': '${TMPDIR}/rootfs/${=
PN}', 'FETCHCOMMAND_cvs': "/usr/bin/env 'PATH=3D${PATH}' cvs '-d${CVSROOT}'=
 co ${CVSCOOPTS} ${CVSMODULE}", 'STAGING_SIPDIR': '${STAGING_DATADIR_NATIVE=
}/sip', 'base_bindir_native': '/bin', 'IMAGE_DEPENDS_cpio.gz.u-boot': 'u-bo=
ot-mkimage-native', 'SECTION_${PN}-dbg': 'devel', 'PREFERRED_VERSION_opie-m=
inesweep': '${OPIE_VERSION}', 'DATETIME': '${DATE}${TIME}', 'FILESPATHPKG':=
 '${PF}:${P}:${PN}:${BP}:${BPN}:files:.', 'BUILDCFG_VARS': 'BB_VERSION META=
DATA_BRANCH METADATA_REVISION TARGET_ARCH TARGET_OS MACHINE DISTRO DISTRO_V=
ERSION', 'BUILD_CC': '${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}', 'PREFE=
RRED_VERSION_opie-citytime': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_gdk-pix=
buf-loader-xpm': 'gtk+', 'PREFERRED_VERSION_opie-go': '${OPIE_VERSION}', 'P=
REFERRED_VERSION_opie-snake': '${OPIE_VERSION}', 'do_fetchall': '\t:\n', 'P=
REFERRED_VERSION_qt4-tools-sdk': '${ANGSTROM_QT_VERSION}', 'PREFERRED_VERSI=
ON_libmailwrapper': '${OPIE_VERSION}', 'SEPPUKU_AUTOBUILD': '1', 'PREFERRED=
_VERSION_xserver-kdrive': '1.4.0.90', 'SCREEN_TERMCMDRUN': '${SCREEN_TERMCM=
D} $SHELLCMDS', 'PREFERRED_VERSION_binutils_avr32': '2.17', 'EXTENDPEVER': =
"${@int('${PE}') and '${PE}:' or ''}", 'SRCREV_pn-librest': '14d35103d9649d=
c1e10c3e9ac2c690b3165c8184', 'layout_base_bindir': '${base_bindir}', 'do_re=
build': '\t"""rebuild a package"""\n', 'SOLIBSDEV_darwin8': '.dylib', 'PREF=
ERRED_VERSION_opie-rotateapplet': '${OPIE_VERSION}', 'ANGSTROM_MODE': 'ucli=
bc', 'USER': 'sledz', 'PREFERRED_VERSION_opie-textedit': '${OPIE_VERSION}',=
 'OES_BITBAKE_CONF': '1', 'SRCREV_pn-mozilla-headless-services': 'c78736548=
94af6c7c6c01194d6185db46667b81f', 'PREFERRED_VERSION_udev_libc-uclibc': '14=
1', 'PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc': 'glibc', 'PS=
TAGE_DIR': '${TMPDIR}/pstage', 'EXTENDPV': '${EXTENDPEVER}${PV}-${PR}${DIST=
RO_PR}', 'PREFERRED_VERSION_opie-handwriting': '${OPIE_VERSION}', 'UPDATECO=
MMAND': 'ERROR, this must be a BitBake bug', 'MACHINE_KERNEL_PR': '', 'EXTE=
NDPE': "${@int('${PE}') and '${PE}_' or ''}", 'PREFERRED_VERSION_qte-mt': '=
${QTE_VERSION}', 'PREFERRED_VERSION_gcc-cross-initial': '${ANGSTROM_GCC_VER=
SION}', 'MACHINE_KERNEL_VERSION': '2.6', 'PREFERRED_PROVIDER_bluez-libs': '=
bluez4', 'SDK_NAME': '${DISTRO}/${TARGET_ARCH}', 'IMAGE_CMD_tar.bz2': 'cd $=
{IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz=
2 .', 'TMPDIR': '${OE_HOME}/tmp${DISTRO_PR}', 'PREFERRED_VERSION_ti-dm355mm=
-module': '1_13', 'PSTAGING_ACTIVE': '0', 'do_build': '', 'layout_docdir': =
'${docdir}', 'ANGSTROM_GCC_VERSION_ppc405': '4.1.1', 'PREFERRED_VERSION_opi=
e-zkbapplet': '${OPIE_VERSION}', 'QEMU_OPTIONS_iwmmxt': '-cpu pxa270-c5', '=
PREFERRED_PROVIDER_libgpewidget': 'libgpewidget', 'PREFERRED_VERSION_opie-m=
ediummount': '${OPIE_VERSION}', 'BBFILE_PATTERN_upstream': '^${OE_ROOT}/rec=
ipes/', 'libexecdir': '${exec_prefix}/libexec', 'PREFERRED_VERSION_opie-med=
iaplayer1-libtremorplugin': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-vmem=
o-settings': '${OPIE_VERSION}', 'OVERRIDE_INTERWORK': "${@['', ':thumb-inte=
rwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) =3D=3D 'yes']}", 'PREFERRED=
_PROVIDER_libfribidi': 'fribidi', 'IMAGE_DEPENDS_jffs2': 'mtd-utils-native'=
, 'PREFERRED_VERSION_opie-tictac': '${OPIE_VERSION}', 'LDFLAGS_pn-libsoup':=
 '-pg ', 'SRC_DISTRIBUTEDIR': '${DEPLOY_DIR}/sources', 'BB_MIN_VERSION': '1=
.8.18', 'datadir_native': '${prefix_native}/share', 'QTDIR': '${STAGING_DIR=
_HOST}/qt2', 'base_do_patch': "\tbb.build.exec_func('patch_do_patch', d)\n"=
, 'PREFERRED_VERSION_opie-mediaplayer1-libmadplugin': '${OPIE_VERSION}', 'P=
REFERRED_VERSION_opie-formatter': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_ts=
lib': 'tslib', 'SDK_OS': '${BUILD_OS}', 'KONSOLE_TERMCMDRUN': '${KONSOLE_TE=
RMCMD} -e $SHELLCMDS', 'PREFERRED_VERSION_networkmanager': '0.8.1', 'STAGIN=
G_ETCDIR_NATIVE': '${STAGING_DIR_NATIVE}${sysconfdir_native}', 'PSTAGE_PKGM=
ANAGER': 'stage-manager-ipkg', 'layout_datadir': '${datadir}', 'FEED_URIS':=
 None, 'HOST_EXEEXT': '', 'GNOME_TERMCMDRUN': '${GNOME_TERMCMD} -x $SHELLCM=
DS', 'PREFERRED_VERSION_xserver-xorg': '1.7.4', 'patch_do_patch': '\timport=
 oe.patch\n\timport oe.unpack\n\n\tsrc_uri =3D (bb.data.getVar(\'SRC_URI\',=
 d, 1) or \'\').split()\n\tif not src_uri:\n\t\treturn\n\n\tpatchsetmap =3D=
 {\n\t\t"patch": oe.patch.PatchTree,\n\t\t"quilt": oe.patch.QuiltTree,\n\t\=
t"git": oe.patch.GitApplyTree,\n\t}\n\n\tcls =3D patchsetmap[bb.data.getVar=
(\'PATCHTOOL\', d, 1) or \'quilt\']\n\n\tresolvermap =3D {\n\t\t"noop": oe.=
patch.NOOPResolver,\n\t\t"user": oe.patch.UserResolver,\n\t}\n\n\trcls =3D =
resolvermap[bb.data.getVar(\'PATCHRESOLVE\', d, 1) or \'user\']\n\n\ts =3D =
bb.data.getVar(\'S\', d, 1)\n\n\tpath =3D os.getenv(\'PATH\')\n\tos.putenv(=
\'PATH\', bb.data.getVar(\'PATH\', d, 1))\n\n\tclasses =3D {}\n\n\tsrc_uri =
=3D d.getVar("SRC_URI", True).split()\n\tsrcurldata =3D bb.fetch.init(src_u=
ri, d, True)\n\tworkdir =3D bb.data.getVar(\'WORKDIR\', d, 1)\n\tfor url in=
 d.getVar("SRC_URI", True).split():\n\t\turldata =3D srcurldata[url]\n\n\t\=
tlocal =3D urldata.localpath\n\t\tif not local:\n\t\t\traise bb.build.FuncF=
ailed(\'Unable to locate local file for %s\' % url)\n\n\t\tbase, ext =3D os=
.path.splitext(os.path.basename(local))\n\t\tif ext in (\'.gz\', \'.bz2\', =
\'.Z\'):\n\t\t\tlocal =3D oe.path.join(workdir, base)\n\n\t\tif not oe.unpa=
ck.is_patch(local, urldata.parm):\n\t\t\tcontinue\n\n\t\tparm =3D urldata.p=
arm\n\n\t\tif "striplevel" in parm:\n\t\t\tstriplevel =3D parm["striplevel"=
]\n\t\telif "pnum" in parm:\n\t\t\tbb.msg.warn(None, "Deprecated usage of \=
'pnum\' url parameter in \'%s\', please use \'striplevel\'" % url)\n\t\t\ts=
triplevel =3D parm["pnum"]\n\t\telse:\n\t\t\tstriplevel =3D \'1\'\n\n\t\tif=
 "pname" in parm:\n\t\t\tpname =3D parm["pname"]\n\t\telse:\n\t\t\tpname =
=3D os.path.basename(local)\n\n\t\tif "mindate" in parm or "maxdate" in par=
m:\n\t\t\tpn =3D bb.data.getVar(\'PN\', d, 1)\n\t\t\tsrcdate =3D bb.data.ge=
tVar(\'SRCDATE_%s\' % pn, d, 1)\n\t\t\tif not srcdate:\n\t\t\t\tsrcdate =3D=
 bb.data.getVar(\'SRCDATE\', d, 1)\n\n\t\t\tif srcdate =3D=3D "now":\n\t\t\=
t\tsrcdate =3D bb.data.getVar(\'DATE\', d, 1)\n\n\t\t\tif "maxdate" in parm=
 and parm["maxdate"] < srcdate:\n\t\t\t\tbb.note("Patch \'%s\' is outdated"=
 % pname)\n\t\t\t\tcontinue\n\n\t\t\tif "mindate" in parm and parm["mindate=
"] > srcdate:\n\t\t\t\tbb.note("Patch \'%s\' is predated" % pname)\n\t\t\t\=
tcontinue\n\n\n\t\tif "minrev" in parm:\n\t\t\tsrcrev =3D bb.data.getVar(\'=
SRCREV\', d, 1)\n\t\t\tif srcrev and srcrev < parm["minrev"]:\n\t\t\t\tbb.n=
ote("Patch \'%s\' applies to later revisions" % pname)\n\t\t\t\tcontinue\n\=
n\t\tif "maxrev" in parm:\n\t\t\tsrcrev =3D bb.data.getVar(\'SRCREV\', d, 1=
)\n\t\t\tif srcrev and srcrev > parm["maxrev"]:\n\t\t\t\tbb.note("Patch \'%=
s\' applies to earlier revisions" % pname)\n\t\t\t\tcontinue\n\n\t\tif "pat=
chdir" in parm:\n\t\t\tpatchdir =3D parm["patchdir"]\n\t\t\tif not os.path.=
isabs(patchdir):\n\t\t\t\tpatchdir =3D os.path.join(s, patchdir)\n\t\telse:=
\n\t\t\tpatchdir =3D s\n\n\t\tif not patchdir in classes:\n\t\t\tpatchset =
=3D cls(patchdir, d)\n\t\t\tresolver =3D rcls(patchset)\n\t\t\tclasses[patc=
hdir] =3D (patchset, resolver)\n\t\t\tpatchset.Clean()\n\t\telse:\n\t\t\tpa=
tchset, resolver =3D classes[patchdir]\n\n\t\tbb.note("Applying patch \'%s\=
' (%s)" % (pname, oe.path.format_display(local, d)))\n\t\ttry:\n\t\t\tpatch=
set.Import({"file":local, "remote":url, "strippath": striplevel}, True)\n\t=
\texcept Exception:\n\t\t\timport sys\n\t\t\traise bb.build.FuncFailed(str(=
sys.exc_value))\n\t\tresolver.Resolve()\n', 'PREFERRED_PROVIDER_gdk-pixbuf-=
csource-native': 'gtk+-native', 'GPEPHONE_MIRROR': 'http://gpephone.linuxto=
go.org/download/gpephone', 'GPEPHONE_SVN': 'svn://projects.linuxtogo.org/sv=
n/gpephone/trunk/source;module=3D${PN}', 'sbindir_native': '${prefix_native=
}/sbin', 'PREFERRED_VERSION_wget': '1.11.4', 'PREFERRED_VERSION_opie-pics':=
 '${OPIE_VERSION}', 'PREFERRED_VERSION_ti-xdais': '6_25_01_08', 'ARM_KEEP_O=
ABI_pn-linux-openmoko-2.6.28_om-gta01': '1', 'GUI_MACHINE_CLASS': '${MACHIN=
E_GUI_CLASS}', 'IMAGE_EXTRA_SPACE': '10240', 'FETCHCMD_hg': '/usr/bin/env h=
g', 'PREFERRED_VERSION_opie-taskbar-images': '${OPIE_VERSION}', 'E_URI': 'h=
ttp://enlightenment.freedesktop.org/files', 'do_recipe_sanity_all': '    :\=
n', 'PREFERRED_VERSION_opie-launcher-settings': '${OPIE_VERSION}', 'SDK_PAT=
H': '/usr/local/${SDK_NAME}', 'BUILD_CXX': '${CCACHE}${BUILD_PREFIX}g++ ${B=
UILD_CC_ARCH}', 'sysconfdir': '${base_prefix}/etc', 'SRCREV_pn-mutter': 'af=
f4cf110307e149d3497d20543cde27b9699758', 'PREFERRED_VERSION_opie-restartapp=
let2': '${OPIE_VERSION}', 'UPDATECOMMAND_cvs': "/usr/bin/env 'PATH=3D${PATH=
}' cvs -d${CVSROOT} update -d -P ${CVSCOOPTS}", 'PREFERRED_VERSION_opie-net=
workapplet': '${OPIE_VERSION}', 'DATE': '20110203', 'APACHE_MIRROR': 'http:=
//archive.apache.org/dist', 'do_rootfs': None, 'PREFERRED_VERSION_opie-dagg=
er': '${OPIE_VERSION}', 'BASEPKG_HOST_SYS': '${BASE_PACKAGE_ARCH}${HOST_VEN=
DOR}-${HOST_OS}', 'PREFERRED_PROVIDER_gdk-pixbuf-loader-jpeg': 'gtk+', 'LD'=
: '${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS}', 'HOST_VENDOR': '${TARGET_VENDOR}'=
, 'PREFERRED_VERSION_eglibc-initial': '2.9', 'MACHINE_TASK_PROVIDER': '${DE=
FAULT_TASK_PROVIDER}', 'EXTRA_OEMAKE': '-e MAKEFLAGS=3D', 'UDEV_GE_141': '1=
', 'LDFLAGS': '${TARGET_LDFLAGS}', 'DISTRO_TYPE': 'debug', 'HOST_NONSYSV': =
None, 'MULTIMACH_TARGET_SYS': '${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_O=
S}', 'PREFERRED_VERSION_libtool-cross': '2.2.6b', 'MACHINE_DISPLAY_ORIENTAT=
ION': '0', 'EXTRA_IMAGECMD_squashfs': '', 'SYSVINIT_ENABLED_GETTYS': None, =
'TARGET_CXXFLAGS': '${TARGET_CFLAGS} -fpermissive', 'perform_packagecopy': =
"\tdest =3D bb.data.getVar('D', d, True)\n\tdvar =3D bb.data.getVar('PKGD',=
 d, True)\n\n\tbb.mkdirhier(dvar)\n\n\t# Start by package population by tak=
ing a copy of the installed\n\t# files to operate on\n\tos.system('rm -rf %=
s/*' % (dvar))\n\tos.system('cp -pPR %s/* %s/' % (dest, dvar))\n", 'PREFERR=
ED_VERSION_opie-qss': '${OPIE_VERSION}', 'BUILD_ARCH': 'i686', 'GNOME_TERMC=
MD': 'gnome-terminal --disable-factory -t "$TERMWINDOWTITLE"', 'MAKE': 'mak=
e', 'PREFERRED_VERSION_opie-securityplugin-blueping': '${OPIE_VERSION}', '_=
_BBHANDLERS': ['packagedstage_stampfixing_eventhandler', 'oe_import', 'base=
_eventhandler', 'check_sanity_eventhandler', 'recipe_sanity_eh', 'check_san=
ity_eventhandler'], 'PREFERRED_PROVIDER_hostap-modules_h2200': 'hostap-modu=
les', 'IMAGE_CMD_cramfs': 'mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${I=
MAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}', 'includedir': '${exec_prefix}/=
include', 'package_depchains': '\t"""\n\tFor a given set of prefix and post=
fix modifiers, make those packages\n\tRRECOMMENDS on the corresponding pack=
ages for its RDEPENDS.\n\n\tExample:  If package A depends upon package B, =
and A\'s .bb emits an\n\tA-dev package, this would make A-dev Recommends: B=
-dev.\n\n\tIf only one of a given suffix is specified, it will take the RRE=
COMMENDS\n\tbased on the RDEPENDS of *all* other packages. If more than one=
 of a given\n\tsuffix is specified, its will only use the RDEPENDS of the s=
ingle parent\n\tpackage.\n\t"""\n\n\tpackages  =3D bb.data.getVar(\'PACKAGE=
S\', d, True)\n\tpostfixes =3D (bb.data.getVar(\'DEPCHAIN_POST\', d, True) =
or \'\').split()\n\tprefixes  =3D (bb.data.getVar(\'DEPCHAIN_PRE\', d, True=
) or \'\').split()\n\n\tdef pkg_adddeprrecs(pkg, base, suffix, getname, dep=
ends, d):\n\n\t\t#bb.note(\'depends for %s is %s\' % (base, depends))\n\t\t=
rreclist =3D explode_deps(bb.data.getVar(\'RRECOMMENDS_\' + pkg, d, True) o=
r bb.data.getVar(\'RRECOMMENDS\', d, True) or "")\n\n\t\tfor depend in depe=
nds:\n\t\t\tif depend.find(\'-native\') !=3D -1 or depend.find(\'-cross\') =
!=3D -1 or depend.startswith(\'virtual/\'):\n\t\t\t\t#bb.note("Skipping %s"=
 % depend)\n\t\t\t\tcontinue\n\t\t\tif depend.endswith(\'-dev\'):\n\t\t\t\t=
depend =3D depend.replace(\'-dev\', \'\')\n\t\t\tif depend.endswith(\'-dbg\=
'):\n\t\t\t\tdepend =3D depend.replace(\'-dbg\', \'\')\n\t\t\tpkgname =3D g=
etname(depend, suffix)\n\t\t\t#bb.note("Adding %s for %s" % (pkgname, depen=
d))\n\t\t\tif not pkgname in rreclist:\n\t\t\t\trreclist.append(pkgname)\n\=
n\t\t#bb.note(\'setting: RRECOMMENDS_%s=3D%s\' % (pkg, \' \'.join(rreclist)=
))\n\t\tbb.data.setVar(\'RRECOMMENDS_%s\' % pkg, \' \'.join(rreclist), d)\n=
\n\tdef pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):\n\n\t\t#bb.n=
ote(\'rdepends for %s is %s\' % (base, rdepends))\n\t\trreclist =3D explode=
_deps(bb.data.getVar(\'RRECOMMENDS_\' + pkg, d, True) or bb.data.getVar(\'R=
RECOMMENDS\', d, True) or "")\n\n\t\tfor depend in rdepends:\n\t\t\tif depe=
nd.endswith(\'-dev\'):\n\t\t\t\tdepend =3D depend.replace(\'-dev\', \'\')\n=
\t\t\tif depend.endswith(\'-dbg\'):\n\t\t\t\tdepend =3D depend.replace(\'-d=
bg\', \'\')\n\t\t\tpkgname =3D getname(depend, suffix)\n\t\t\tif not pkgnam=
e in rreclist:\n\t\t\t\trreclist.append(pkgname)\n\n\t\t#bb.note(\'setting:=
 RRECOMMENDS_%s=3D%s\' % (pkg, \' \'.join(rreclist)))\n\t\tbb.data.setVar(\=
'RRECOMMENDS_%s\' % pkg, \' \'.join(rreclist), d)\n\n\tdef add_dep(list, de=
p):\n\t\tdep =3D dep.split(\' (\')[0].strip()\n\t\tif dep not in list:\n\t\=
t\tlist.append(dep)\n\n\tdepends =3D []\n\tfor dep in explode_deps(bb.data.=
getVar(\'DEPENDS\', d, True) or ""):\n\t\tadd_dep(depends, dep)\n\n\trdepen=
ds =3D []\n\tfor dep in explode_deps(bb.data.getVar(\'RDEPENDS\', d, True) =
or ""):\n\t\tadd_dep(rdepends, dep)\n\n\tfor pkg in packages.split():\n\t\t=
for dep in explode_deps(bb.data.getVar(\'RDEPENDS_\' + pkg, d, True) or "")=
:\n\t\t\tadd_dep(rdepends, dep)\n\n\t#bb.note(\'rdepends is %s\' % rdepends=
)\n\n\tdef post_getname(name, suffix):\n\t\treturn \'%s%s\' % (name, suffix=
)\n\tdef pre_getname(name, suffix):\n\t\treturn \'%s%s\' % (suffix, name)\n=
\n\tpkgs =3D {}\n\tfor pkg in packages.split():\n\t\tfor postfix in postfix=
es:\n\t\t\tif pkg.endswith(postfix):\n\t\t\t\tif not postfix in pkgs:\n\t\t=
\t\t\tpkgs[postfix] =3D {}\n\t\t\t\tpkgs[postfix][pkg] =3D (pkg[:-len(postf=
ix)], post_getname)\n\n\t\tfor prefix in prefixes:\n\t\t\tif pkg.startswith=
(prefix):\n\t\t\t\tif not prefix in pkgs:\n\t\t\t\t\tpkgs[prefix] =3D {}\n\=
t\t\t\tpkgs[prefix][pkg] =3D (pkg[:-len(prefix)], pre_getname)\n\n\tfor suf=
fix in pkgs:\n\t\tfor pkg in pkgs[suffix]:\n\t\t\t(base, func) =3D pkgs[suf=
fix][pkg]\n\t\t\tif suffix =3D=3D "-dev" and not pkg.startswith("kernel-mod=
ule-"):\n\t\t\t\tpkg_adddeprrecs(pkg, base, suffix, func, depends, d)\n\t\t=
\tif len(pkgs[suffix]) =3D=3D 1:\n\t\t\t\tpkg_addrrecs(pkg, base, suffix, f=
unc, rdepends, d)\n\t\t\telse:\n\t\t\t\trdeps =3D []\n\t\t\t\tfor dep in ex=
plode_deps(bb.data.getVar(\'RDEPENDS_\' + base, d, True) or bb.data.getVar(=
\'RDEPENDS\', d, True) or ""):\n\t\t\t\t\tadd_dep(rdeps, dep)\n\t\t\t\tpkg_=
addrrecs(pkg, base, suffix, func, rdeps, d)\n', 'ANGSTROM_PKG_FORMAT': 'ipk=
', 'package_mapping_rename_hook': '\t"""\n\tRewrite variables to account fo=
r package renaming in things\n\tlike debian.bbclass or manual PKG variable =
name changes\n\t"""\n\truntime_mapping_rename("RDEPENDS", d)\n\truntime_map=
ping_rename("RRECOMMENDS", d)\n\truntime_mapping_rename("RSUGGESTS", d)\n\t=
runtime_mapping_rename("RPROVIDES", d)\n\truntime_mapping_rename("RREPLACES=
", d)\n\truntime_mapping_rename("RCONFLICTS", d)\n', 'IMAGE_CMD_cpio.gz': '=
cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_=
IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}', 'PREFERRED_VERSION=
_opie-solitaire': '${OPIE_VERSION}', 'FILESPATHBASE': '${FILE_DIRNAME}', 'P=
REFERRED_VERSION_opie-mediaplayer2-skin-default-landscape': '${OPIE_VERSION=
}', 'populate_sysroot_preamble': '\tif [ "$PSTAGING_ACTIVE" =3D "1" ]; then=
\n\t\tstage-manager -p ${STAGING_DIR} -c ${PSTAGE_WORKDIR}/stamp-cache-stag=
ing -u || true\n\tfi\n', 'PREFERRED_VERSION_libopie2': '${OPIE_VERSION}', '=
PREFERRED_VERSION_opie-mobilemsg': '${OPIE_VERSION}', 'IMAGE_CMD_ubi': 'ech=
o \\[ubifs\\] > ubinize.cfg ; echo mode=3Dubi >> ubinize.cfg ; echo image=
=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol=
_id=3D0 >> ubinize.cfg ; echo vol_type=3Ddynamic >> ubinize.cfg ; echo vol_=
name=3D${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=3Dautoresize >> ubini=
ze.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.r=
ootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}=
.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg', 'PREFERRED_VERSION_opie-button-se=
ttings': '${OPIE_VERSION}', 'PSTAGE_BUILD_CMD': 'stage-manager-ipkg-build -=
o 0 -g 0', 'IMAGE_CMD_ext2.bz2': 'install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; =
genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/=
${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; bzip2 -f -9 ${DEPLOY_DIR_IMAGE=
}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE=
_NAME}.rootfs.ext2.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.bz2', =
'PREFERRED_VERSION_libopietooth1': '${OPIE_VERSION}', 'PSTAGE_NATIVEDEPENDS=
': '    shasum-native     stagemanager-native     ', 'FILES_${PN}-doc': '${=
docdir} ${mandir} ${infodir} ${datadir}/gtk-doc ${datadir}/gnome/help', 'AR=
M_INTERWORK_M_OPT': "${@['-mno-thumb-interwork', '-mthumb-interwork'][bb.da=
ta.getVar('THUMB_INTERWORK', d, 1) =3D=3D 'yes']}", 'PRIORITY': 'optional',=
 'OPIEDIR': '${STAGING_DIR_HOST}', 'PREFERRED_VERSION_libtool-sdk': '2.2.6b=
', 'PREFERRED_VERSION_mythplugins': '0.22', 'SEPPUKU_QUERY': 'http://bugs.o=
penembedded.net/buglist.cgi?', 'SECTION': 'base', 'DISTRO_PR': '.6', 'TARGE=
T_FPU_armv6-novfp': 'soft', 'SDK_CC_ARCH': '${BUILD_CC_ARCH}', 'MAINTAINER'=
: 'Angstrom Developers <angstrom-distro-devel@linuxtogo.org>', 'do_package_=
write_ipk': '\tpackages =3D bb.data.getVar(\'PACKAGES\', d, True)\n\tif not=
 packages:\n\t\tbb.debug(1, "No PACKAGES defined, nothing to package")\n\t\=
treturn\n\n\tbb.build.exec_func("read_subpackage_metadata", d)\n\tbb.build.=
exec_func("do_package_ipk", d)\n', 'BUILD_LDFLAGS': '-L${STAGING_LIBDIR_NAT=
IVE} -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_N=
ATIVE} -Wl,-O1', 'UBI_VOLNAME': '${MACHINE}-rootfs', 'EXTRA_IMAGECMD_ubi': =
'', 'STAGING_LIBDIR': '${STAGING_DIR_HOST}${libdir}', 'TARGET_ARCH': 'arm',=
 'populate_packages': '\timport glob, errno, re,os\n\n\tworkdir =3D bb.data=
.getVar(\'WORKDIR\', d, True)\n\toutdir =3D bb.data.getVar(\'DEPLOY_DIR\', =
d, True)\n\tdvar =3D bb.data.getVar(\'PKGD\', d, True)\n\tpackages =3D bb.d=
ata.getVar(\'PACKAGES\', d, True)\n\tpn =3D bb.data.getVar(\'PN\', d, True)=
\n\n\tbb.mkdirhier(outdir)\n\tos.chdir(dvar)\n\n\t# Sanity check PACKAGES f=
or duplicates - should be moved to\n\t# sanity.bbclass once we have the inf=
rastucture\n\tpackage_list =3D []\n\tfor pkg in packages.split():\n\t\tif p=
kg in package_list:\n\t\t\tbb.error("-------------------")\n\t\t\tbb.error(=
"%s is listed in PACKAGES multiple times, this leads to packaging errors." =
% pkg)\n\t\t\tbb.error("Please fix the metadata/report this as bug to OE bu=
gtracker.")\n\t\t\tbb.error("-------------------")\n\t\telse:\n\t\t\tpackag=
e_list.append(pkg)\n\n\n\tif (bb.data.getVar(\'PACKAGE_STRIP\', d, True) !=
=3D \'no\'):\n\t\tfor f in (bb.data.getVar(\'PACKAGESTRIPFUNCS\', d, True) =
or \'\').split():\n\t\t\tbb.build.exec_func(f, d)\n\n\tpkgdest =3D bb.data.=
getVar(\'PKGDEST\', d, True)\n\tos.system(\'rm -rf %s\' % pkgdest)\n\n\tsee=
n =3D []\n\tmain_is_empty =3D 1\n\tmain_pkg =3D bb.data.getVar(\'PN\', d, T=
rue)\n\n\tfor pkg in package_list:\n\t\tlocaldata =3D bb.data.createCopy(d)=
\n\t\troot =3D os.path.join(pkgdest, pkg)\n\t\tbb.mkdirhier(root)\n\n\t\tbb=
.data.setVar(\'PKG\', pkg, localdata)\n\t\toverrides =3D bb.data.getVar(\'O=
VERRIDES\', localdata, True)\n\t\tif not overrides:\n\t\t\traise bb.build.F=
uncFailed(\'OVERRIDES not defined\')\n\t\tbb.data.setVar(\'OVERRIDES\', ove=
rrides + \':\' + pkg, localdata)\n\t\tbb.data.update_data(localdata)\n\n\t\=
tfilesvar =3D bb.data.getVar(\'FILES\', localdata, True) or ""\n\t\tfiles =
=3D filesvar.split()\n\t\tfor file in files:\n\t\t\tif os.path.isabs(file):=
\n\t\t\t\tfile =3D \'.\' + file\n\t\t\tif not os.path.islink(file):\n\t\t\t=
\tif os.path.isdir(file):\n\t\t\t\t\tnewfiles =3D  [ os.path.join(file,x) f=
or x in os.listdir(file) ]\n\t\t\t\t\tif newfiles:\n\t\t\t\t\t\tfiles +=3D =
newfiles\n\t\t\t\t\t\tcontinue\n\t\t\tglobbed =3D glob.glob(file)\n\t\t\tif=
 globbed:\n\t\t\t\tif [ file ] !=3D globbed:\n\t\t\t\t\tif not file in glob=
bed:\n\t\t\t\t\t\tfiles +=3D globbed\n\t\t\t\t\t\tcontinue\n\t\t\t\t\telse:=
\n\t\t\t\t\t\tglobbed.remove(file)\n\t\t\t\t\t\tfiles +=3D globbed\n\t\t\ti=
f (not os.path.islink(file)) and (not os.path.exists(file)):\n\t\t\t\tconti=
nue\n\t\t\tif file in seen:\n\t\t\t\tcontinue\n\t\t\tseen.append(file)\n\t\=
t\tif os.path.isdir(file) and not os.path.islink(file):\n\t\t\t\tbb.mkdirhi=
er(os.path.join(root,file))\n\t\t\t\tos.chmod(os.path.join(root,file), os.s=
tat(file).st_mode)\n\t\t\t\tcontinue\n\t\t\tfpath =3D os.path.join(root,fil=
e)\n\t\t\tdpath =3D os.path.dirname(fpath)\n\t\t\tbb.mkdirhier(dpath)\n\t\t=
\tret =3D bb.copyfile(file, fpath)\n\t\t\tif ret is False:\n\t\t\t\traise b=
b.build.FuncFailed("File population failed when copying %s to %s" % (file, =
fpath))\n\t\t\tif pkg =3D=3D main_pkg and main_is_empty:\n\t\t\t\tmain_is_e=
mpty =3D 0\n\t\tdel localdata\n\tos.chdir(workdir)\n\n\tunshipped =3D []\n\=
tfor root, dirs, files in os.walk(dvar):\n\t\tfor f in files:\n\t\t\tpath =
=3D os.path.join(root[len(dvar):], f)\n\t\t\tif (\'.\' + path) not in seen:=
\n\t\t\t\tunshipped.append(path)\n\n\tif unshipped !=3D []:\n\t\tbb.note("t=
he following files were installed but not shipped in any package:")\n\t\tfo=
r f in unshipped:\n\t\t\tbb.note("  " + f)\n\n\tbb.build.exec_func("package=
_name_hook", d)\n\n\tfor pkg in package_list:\n\t\tpkgname =3D bb.data.getV=
ar(\'PKG_%s\' % pkg, d, True)\n\t\tif pkgname is None:\n\t\t\tbb.data.setVa=
r(\'PKG_%s\' % pkg, pkg, d)\n\n\tdangling_links =3D {}\n\tpkg_files =3D {}\=
n\tfor pkg in package_list:\n\t\tdangling_links[pkg] =3D []\n\t\tpkg_files[=
pkg] =3D []\n\t\tinst_root =3D os.path.join(pkgdest, pkg)\n\t\tfor root, di=
rs, files in os.walk(inst_root):\n\t\t\tfor f in files:\n\t\t\t\tpath =3D o=
s.path.join(root, f)\n\t\t\t\trpath =3D path[len(inst_root):]\n\t\t\t\tpkg_=
files[pkg].append(rpath)\n\t\t\t\ttry:\n\t\t\t\t\ts =3D os.stat(path)\n\t\t=
\t\texcept OSError, (err, strerror):\n\t\t\t\t\tif err !=3D errno.ENOENT:\n=
\t\t\t\t\t\traise\n\t\t\t\t\ttarget =3D os.readlink(path)\n\t\t\t\t\tif tar=
get[0] !=3D \'/\':\n\t\t\t\t\t\ttarget =3D os.path.join(root[len(inst_root)=
:], target)\n\t\t\t\t\tdangling_links[pkg].append(os.path.normpath(target))=
\n\n\tfor pkg in package_list:\n\t\trdepends =3D explode_deps(bb.data.getVa=
r(\'RDEPENDS_\' + pkg, d, 0) or bb.data.getVar(\'RDEPENDS\', d, 0) or "")\n=
\n\t\tremstr =3D "${PN} (=3D ${EXTENDPKGV})"\n\t\tif main_is_empty and rems=
tr in rdepends:\n\t\t\trdepends.remove(remstr)\n\t\tfor l in dangling_links=
[pkg]:\n\t\t\tfound =3D False\n\t\t\tbb.debug(1, "%s contains dangling link=
 %s" % (pkg, l))\n\t\t\tfor p in package_list:\n\t\t\t\tfor f in pkg_files[=
p]:\n\t\t\t\t\tif f =3D=3D l:\n\t\t\t\t\t\tfound =3D True\n\t\t\t\t\t\tbb.d=
ebug(1, "target found in %s" % p)\n\t\t\t\t\t\tif p =3D=3D pkg:\n\t\t\t\t\t=
\t\tbreak\n\t\t\t\t\t\tif not p in rdepends:\n\t\t\t\t\t\t\trdepends.append=
(p)\n\t\t\t\t\t\tbreak\n\t\t\tif found =3D=3D False:\n\t\t\t\tbb.note("%s c=
ontains dangling symlink to %s" % (pkg, l))\n\t\tbb.data.setVar(\'RDEPENDS_=
\' + pkg, " " + " ".join(rdepends), d)\n', 'oe_machinstall': "\t# Purpose: =
Install machine dependent files, if available\n\t#          If not availabl=
e, check if there is a default\n\t#          If no default, just touch the =
destination\n\t# Example:\n\t#                $1  $2   $3         $4\n\t# o=
e_machinstall -m 0644 fstab ${D}/etc/fstab\n\t#\n\t# TODO: Check argument n=
umber?\n\t#\n\tfilename=3D`basename $3`\n\tdirname=3D`dirname $3`\n\n\tfor =
o in `echo ${OVERRIDES} | tr ':' ' '`; do\n\t\tif [ -e $dirname/$o/$filenam=
e ]; then\n\t\t\toenote $dirname/$o/$filename present, installing to $4\n\t=
\t\tinstall $1 $2 $dirname/$o/$filename $4\n\t\t\treturn\n\t\tfi\n\tdone\n#=
\toenote overrides specific file NOT present, trying default=3D$3...\n\tif =
[ -e $3 ]; then\n\t\toenote $3 present, installing to $4\n\t\tinstall $1 $2=
 $3 $4\n\telse\n\t\toenote $3 NOT present, touching empty $4\n\t\ttouch $4\=
n\tfi\n", 'ANGSTROM_GCC_VERSION_avr32': '4.2.2', 'PREFERRED_VERSION_linux-l=
ibc-headers-native': '${LINUX_LIBC_HEADERS_VERSION}', 'BUILD_F77': '${CCACH=
E}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}', 'insane_do_package_write': '\tpacka=
ge_do_package_write\n', 'BB_LOCALCOUNT_OVERRIDE': '1', 'ALLOW_EMPTY_${PN}-d=
bg': '1', 'FULL_OPTIMIZATION_ep9312': '-fexpensive-optimizations -fomit-fra=
me-pointer -frename-registers -O -fno-signed-zeros', 'QUILTRCFILE': '${STAG=
ING_BINDIR_NATIVE}/quiltrc', 'EXTRA_IMAGECMD_cpio.lzma': '', 'PREFERRED_VER=
SION_opie-unikeyboard': '${OPIE_VERSION}', 'BOOTSTRAP_EXTRA_RDEPENDS': '', =
'BUILD_LD': '${BUILD_PREFIX}ld', 'BUILD_SYS': '${BUILD_ARCH}${BUILD_VENDOR}=
-${BUILD_OS}', 'PREFERRED_VERSION_ti-codecs-dm6446-server': '2_05_00_00', '=
PREFERRED_VERSION_glib-2.0': '2.24.1', 'STAGING_DIR_SDK': '${STAGING_DIR}/$=
{SDK_SYS}', 'PREFERRED_VERSION_opie-irdaapplet': '${OPIE_VERSION}', 'PREFER=
RED_PROVIDER_hotplug': 'udev', 'SELECTED_OPTIMIZATION_pn-libsoup': '${PROFI=
LE_OPTIMIZATION}', 'IMAGE_ROOTFS_SIZE_ext3': '65536', 'IMAGE_ROOTFS_SIZE_ex=
t2': '65536', 'PATCHDEPENDENCY': '${PATCHTOOL}-native:do_populate_sysroot',=
 'PREFERRED_VERSION_opie-bluetoothapplet': '${OPIE_VERSION}', 'PREFERRED_VE=
RSION_opie-datebook': '${OPIE_VERSION}', 'DEPENDS_virtclass-native': None, =
'PREFERRED_VERSION_opie-clipboardapplet': '${OPIE_VERSION}', 'TOOLCHAIN_PAT=
H': '${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH}', 'FETCHCOM=
MAND_wget': "/usr/bin/env 'PATH=3D${PATH}' wget -t 5 --passive-ftp --no-che=
ck-certificate -P ${DL_DIR} '${URI}'", 'PREFERRED_VERSION_opie-today-stockt=
ickerplugin': '${OPIE_VERSION}', 'GPE_EXTRA_SVN': 'svn://projects.linuxtogo=
.org/svn/gpe/trunk/extra;module=3D${PN}', 'oldincludedir': '${exec_prefix}/=
include', 'ANGSTROM_BINUTILS_VERSION': '2.18', 'PREFERRED_VERSION_libecj-bo=
otstrap': '3.6', 'ARM_INSTRUCTION_SET_pn-uclibc-initial': 'arm', 'SERIAL_CO=
NSOLE': '115200 ttyS1', 'PREFERRED_VERSION_opie-sshkeys': '${OPIE_VERSION}'=
, 'TINDER_URL': '/tinderbox', 'PREFERRED_VERSION_samba': '3.3.9', 'TIME': '=
095327', 'IMAGE_DEPENDS_cpio.lzma': 'lzma-native', 'UPDATECOMMAND_svn': '/u=
sr/bin/env svn update --non-interactive --force --accept theirs-full ${SVNC=
OOPTS}', 'RRECOMMENDS_${PN}-dbg': '${PN} (=3D ${EXTENDPV})', 'SHELLCMDS': '=
${SHELLRCCMD}', 'do_configure': '\tbase_do_configure\n', 'IMAGE_CMD_ubifs':=
 'mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.=
img ${MKUBIFS_ARGS}', 'PREFERRED_VERSION_ti-local-power-manager': '1_24_01'=
, 'SEPPUKU_USER': None, 'FEED_DEPLOYDIR_BASE_URI': None, 'PREFERRED_PROVIDE=
R_virtual/java-native': 'jamvm-native', 'QPEDIR': '${STAGING_DIR_HOST}', 'B=
UILD_OPTIMIZATION_pn-perl-native': '-O1 -g', 'layout_exec_prefix': '${exec_=
prefix}', 'LANG': 'en_US.UTF-8', 'PREFERRED_VERSION_opie-kbill': '${OPIE_VE=
RSION}', 'BUILD_CCLD': '${BUILD_PREFIX}gcc', 'STAGING_LIBDIR_NATIVE': '${ST=
AGING_DIR_NATIVE}${libdir_native}', 'PREFERRED_VERSION_ti-dsplink-module': =
'1_64', 'OLDBBMASK': '', 'LDFLAGS_pn-libgssdp': '-pg ', 'B': '${S}', 'GROUP=
_fetcher': None, 'do_distribute_sources_all': None, 'insane_mapping_rename_=
hook': "\tbb.build.exec_func('package_mapping_rename_hook', d)\n", 'BBPATH'=
: '/home/DRESEARCH/sledz/work/HydraIP/OE/:/home/DRESEARCH/sledz/work/HydraI=
P/OE/hipox:/home/DRESEARCH/sledz/work/HydraIP/OE/common:/home/DRESEARCH/sle=
dz/work/openembedded', 'XTERM_TERMCMD': 'xterm -T "$TERMWINDOWTITLE"', 'lay=
out_bindir': '${bindir}', 'SRC_DISTRIBUTECOMMAND': None, 'PREFERRED_VERSION=
_mythtv': '0.22', 'PREFERRED_VERSION_ti-codecs-dm6467-server': '1_00_00_03'=
, 'PREFERRED_PROVIDER_tslib-conf': 'tslib', 'GROUP_dependencies': None, 'PR=
EFERRED_VERSION_ti-dspbios': '5_41_02_14', 'PREFERRED_VERSION_opie-parashoo=
t': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_swt3.4-gtk': 'swt3.4-gtk', 'IMAG=
E_CMD_ext2.gz': 'install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROO=
TFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootf=
s.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAM=
E}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz', 'PREFERRED_VERSION_gcc-c=
ross': '${ANGSTROM_GCC_VERSION}', 'PREMIRRORS': None, 'PREFERRED_VERSION_op=
ie-doctab': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-sounds': '${OPIE_VER=
SION}', 'PREFERRED_VERSION_opie-bluetoothmanager': '${OPIE_VERSION}', 'PACK=
AGES': '${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-static ${PN}-locale', 'PR=
EFERRED_VERSION_opie-today-weatherplugin': '${OPIE_VERSION}', 'IPKGCONF_TAR=
GET': '${STAGING_ETCDIR_NATIVE}/opkg.conf', 'PREFERRED_PROVIDER_atd': 'atd'=
, 'PREFERRED_VERSION_ti-dvsdk-demos': '3_10_00_11', 'PREFERRED_VERSION_opie=
-libqrsync': '${OPIE_VERSION}', 'PREFERRED_VERSION_gcc-cross-sdk': '${ANGST=
ROM_GCC_VERSION}', 'BUILD_CPP': '${BUILD_PREFIX}cpp', 'IMAGE_CMD_tar': 'cd =
${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar .'=
, 'HOMEPAGE': 'unknown', 'PREFERRED_PROVIDER_virtual/libx11-native': 'libx1=
1-native', 'PREFERRED_VERSION_opie-datebook-nationalholidayplugin': '${OPIE=
_VERSION}', 'PREFERRED_VERSION_opie-lrelease-native': '${OPIE_VERSION}', 'd=
o_clean': '\t"""clear the build and temp directories"""\n\tdir =3D bb.data.=
expand("${WORKDIR}", d)\n\tif dir =3D=3D \'//\': raise bb.build.FuncFailed(=
"wrong DATADIR")\n\tbb.note("removing " + base_path_out(dir, d))\n\tos.syst=
em(\'rm -rf \' + dir)\n\n\tdir =3D "%s.*" % bb.data.expand(bb.data.getVar(\=
'STAMP\', d), d)\n\tbb.note("removing " + base_path_out(dir, d))\n\tos.syst=
em(\'rm -f \'+ dir)\n', 'STAGING_DATADIR_NATIVE': '${STAGING_DIR_NATIVE}${d=
atadir_native}', 'RESUMECOMMAND_wget': "/usr/bin/env 'PATH=3D${PATH}' wget =
-c -t 5 --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'", 'ARM_K=
EEP_OABI': '0', 'SDK_CXXFLAGS': '${SDK_CFLAGS} -fpermissive', 'GPE_MIRROR':=
 'http://gpe.linuxtogo.org/download/source', 'PREFERRED_VERSION_opie-reader=
': '${OPIE_VERSION}', 'IMAGE_POSTPROCESS_COMMAND': '   do_testlab ;', 'SOC_=
FAMILY': 'Unknown', 'package_ipk_fn': "\tfrom bb import data\n\tbb.data.set=
Var('PKGFN', bb.data.getVar('PKG',d), d)\n", 'EXTENDPKGV': '${EXTENDPKGEVER=
}${PKGV}-${PKGR}', 'PREFERRED_VERSION_opie-help-en': '${OPIE_VERSION}', 'pa=
ckagedstage_stampfixing_eventhandler': '    if bb.event.getName(e) =3D=3D "=
StampUpdate":\n        taskscovered =3D bb.data.getVar("PSTAGE_TASKS_COVERE=
D", e.data, 1).split()\n        for (fn, task) in e.targets:\n            #=
 strip off \'do_\'\n            task =3D task[3:]\n            if task in t=
askscovered:\n                stamp =3D "%s.do_stage_package_populated" % e=
.stampPrefix[fn]\n                if os.path.exists(stamp):\n              =
      # We\'re targetting a task which was skipped with packaged staging\n =
                   # so we need to remove the autogenerated stamps.\n      =
              for task in taskscovered:\n                        covered =
=3D "%s.do_%s" % (e.stampPrefix[fn], task)\n                        oe.path=
.remove(covered)\n                    oe.path.remove(stamp)\n', 'SRCREV_pn-=
libgdbus': 'aeab6e3c0185b271ca343b439470491b99cc587f', 'CPPFLAGS': '${TARGE=
T_CPPFLAGS}', 'PREFERRED_VERSION_opie-mediaplayer1-libmodplugin': '${OPIE_V=
ERSION}', 'CE_VERSION': '2.25.01', 'HANDHELDS_CVS': 'cvs://anoncvs:anoncvs@=
anoncvs.handhelds.org/cvs', 'IMAGE_DEPENDS_ext2.bz2': 'genext2fs-native', '=
do_cleanall': '    pass\n', 'BOOTSTRAP_EXTRA_RRECOMMENDS': '', 'SELECTED_OP=
TIMIZATION_pn-libgupnp': '${PROFILE_OPTIMIZATION}', 'MACHINE_DISPLAY_BPP': =
'16', 'BBFILE_PRIORITY_local': '10', 'LICENSE': 'unknown', 'XDG_DATA_DIRS':=
 '${STAGING_DATADIR}', 'PREFERRED_VERSION_opie-wirelessapplet': '${OPIE_VER=
SION}', 'PREFERRED_PROVIDER_gdk-pixbuf-loader-tga': 'gtk+', 'PREFERRED_VERS=
ION_opie-zsafe': '${OPIE_VERSION}', 'PREFERRED_VERSION_pango': '1.24.4', 'A=
LLOWED_FLAGS': '-O -mcpu -march -pipe', 'PREFERRED_VERSION_pkgconfig-native=
': '0.23', 'PREFERRED_PROVIDER_virtual/java-initial': 'jamvm-initial', 'do_=
package_ipk': '\timport re, copy\n\n\tworkdir =3D bb.data.getVar(\'WORKDIR\=
', d, 1)\n\tif not workdir:\n\t\tbb.error("WORKDIR not defined, unable to p=
ackage")\n\t\treturn\n\n\n\toutdir =3D bb.data.getVar(\'DEPLOY_DIR_IPK\', d=
, 1)\n\tif not outdir:\n\t\tbb.error("DEPLOY_DIR_IPK not defined, unable to=
 package")\n\t\treturn\n\n\tdvar =3D bb.data.getVar(\'D\', d, 1)\n\tif not =
dvar:\n\t\tbb.error("D not defined, unable to package")\n\t\treturn\n\tbb.m=
kdirhier(dvar)\n\n\ttmpdir =3D bb.data.getVar(\'TMPDIR\', d, 1)\n\n\tif os.=
access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):=
\n\t\tos.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))\=
n\n\tpkgdest =3D bb.data.getVar(\'PKGDEST\', d, 1)\n\tbb.mkdirhier(pkgdest)=
\n\n\tpackages =3D bb.data.getVar(\'PACKAGES\', d, True)\n\tfor pkg in pack=
ages.split():\n\t\tlocaldata =3D bb.data.createCopy(d)\n\t\troot =3D "%s/%s=
" % (pkgdest, pkg)\n\t\tbb.mkdirhier(root)\n\n\t\tlf =3D bb.utils.lockfile(=
root + ".lock")\n\n\t\tbb.data.setVar(\'ROOT\', \'\', localdata)\n\t\tbb.da=
ta.setVar(\'ROOT_%s\' % pkg, root, localdata)\n\t\tpkgname =3D bb.data.getV=
ar(\'PKG_%s\' % pkg, localdata, 1)\n\t\tif not pkgname:\n\t\t\tpkgname =3D =
pkg\n\t\tbb.data.setVar(\'PKG\', pkgname, localdata)\n\n\t\toverrides =3D b=
b.data.getVar(\'OVERRIDES\', localdata, True)\n\t\tif not overrides:\n\t\t\=
traise bb.build.FuncFailed(\'OVERRIDES not defined\')\n\t\tbb.data.setVar(\=
'OVERRIDES\', overrides + \':\' + pkg, localdata)\n\n\t\tbb.data.update_dat=
a(localdata)\n\t\tbasedir =3D os.path.join(os.path.dirname(root))\n\t\tarch=
 =3D bb.data.getVar(\'PACKAGE_ARCH\', localdata, 1)\n\t\tpkgoutdir =3D "%s/=
%s" % (outdir, arch)\n\t\tbb.mkdirhier(pkgoutdir)\n\t\tos.chdir(root)\n\t\t=
from glob import glob\n\t\tg =3D glob(\'*\') + glob(\'.[!.]*\')\n\t\ttry:\n=
\t\t\tdel g[g.index(\'CONTROL\')]\n\t\t\tdel g[g.index(\'./CONTROL\')]\n\t\=
texcept ValueError:\n\t\t\tpass\n\t\tif not g and bb.data.getVar(\'ALLOW_EM=
PTY\', localdata) !=3D "1":\n\t\t\tbb.note("Not creating empty archive for =
%s-%s" % (pkg, bb.data.expand(\'${PV}-${PR}${DISTRO_PR}\', localdata)))\n\t=
\t\tbb.utils.unlockfile(lf)\n\t\t\tcontinue\n\n\t\tcontroldir =3D os.path.j=
oin(root, \'CONTROL\')\n\t\tbb.mkdirhier(controldir)\n\t\ttry:\n\t\t\tctrlf=
ile =3D file(os.path.join(controldir, \'control\'), \'w\')\n\t\texcept OSEr=
ror:\n\t\t\tbb.utils.unlockfile(lf)\n\t\t\traise bb.build.FuncFailed("unabl=
e to open control file for writing.")\n\n\t\tfields =3D []\n\t\tpe =3D bb.d=
ata.getVar(\'PE\', d, 1)\n\t\tif pe and int(pe) > 0:\n\t\t\tfields.append([=
"Version: %s:%s-%s\\n", [\'PE\', \'PKGV\', \'PKGR\']])\n\t\telse:\n\t\t\tfi=
elds.append(["Version: %s-%s\\n", [\'PKGV\', \'PKGR\']])\n\t\tfields.append=
(["Description: %s\\n", [\'DESCRIPTION\']])\n\t\tfields.append(["Section: %=
s\\n", [\'SECTION\']])\n\t\tfields.append(["Priority: %s\\n", [\'PRIORITY\'=
]])\n\t\tfields.append(["Maintainer: %s\\n", [\'MAINTAINER\']])\n\t\tfields=
.append(["License: %s\\n", [\'LICENSE\']])\n\t\tfields.append(["Architectur=
e: %s\\n", [\'PACKAGE_ARCH\']])\n\t\tfields.append(["OE: %s\\n", [\'PN\']])=
\n\t\tfields.append(["Homepage: %s\\n", [\'HOMEPAGE\']])\n\n\t\tdef pullDat=
a(l, d):\n\t\t\tl2 =3D []\n\t\t\tfor i in l:\n\t\t\t\tl2.append(bb.data.get=
Var(i, d, 1))\n\t\t\treturn l2\n\n\t\tctrlfile.write("Package: %s\\n" % pkg=
name)\n\t\t# check for required fields\n\t\ttry:\n\t\t\tfor (c, fs) in fiel=
ds:\n\t\t\t\tfor f in fs:\n\t\t\t\t\tif bb.data.getVar(f, localdata) is Non=
e:\n\t\t\t\t\t\traise KeyError(f)\n\t\t\t\tctrlfile.write(c % tuple(pullDat=
a(fs, localdata)))\n\t\texcept KeyError:\n\t\t\timport sys\n\t\t\t(type, va=
lue, traceback) =3D sys.exc_info()\n\t\t\tctrlfile.close()\n\t\t\tbb.utils.=
unlockfile(lf)\n\t\t\traise bb.build.FuncFailed("Missing field for ipk gene=
ration: %s" % value)\n\t\t# more fields\n\n\t\tbb.build.exec_func("mapping_=
rename_hook", localdata)\n\n\t\trdepends =3D explode_deps(bb.data.getVar("R=
DEPENDS", localdata, 1) or "")\n\t\trrecommends =3D explode_deps(bb.data.ge=
tVar("RRECOMMENDS", localdata, 1) or "")\n\t\trsuggests =3D (bb.data.getVar=
("RSUGGESTS", localdata, 1) or "").split()\n\t\trprovides =3D (bb.data.getV=
ar("RPROVIDES", localdata, 1) or "").split()\n\t\trreplaces =3D (bb.data.ge=
tVar("RREPLACES", localdata, 1) or "").split()\n\t\trconflicts =3D (bb.data=
.getVar("RCONFLICTS", localdata, 1) or "").split()\n\n\t\tif not \'-locale-=
\' and not \'-dbg\' and not \'-dev\' in pkgname:\n\t\t\trdepends.append(\'%=
s-locale*\' % pkgname)\n\n\t\tif rdepends:\n\t\t\tctrlfile.write("Depends: =
%s\\n" % ", ".join(rdepends))\n\t\tif rsuggests:\n\t\t\tctrlfile.write("Sug=
gests: %s\\n" % ", ".join(rsuggests))\n\t\tif rrecommends:\n\t\t\tctrlfile.=
write("Recommends: %s\\n" % ", ".join(rrecommends))\n\t\tif rprovides:\n\t\=
t\tctrlfile.write("Provides: %s\\n" % ", ".join(rprovides))\n\t\tif rreplac=
es:\n\t\t\tctrlfile.write("Replaces: %s\\n" % ", ".join(rreplaces))\n\t\tif=
 rconflicts:\n\t\t\tctrlfile.write("Conflicts: %s\\n" % ", ".join(rconflict=
s))\n\t\tsrc_uri =3D bb.data.getVar("SRC_URI", localdata, 1) or d.getVar("F=
ILE", True)\n\t\tsrc_uri =3D re.sub("\\s+", " ", src_uri)\n\t\tctrlfile.wri=
te("Source: %s\\n" % " ".join(src_uri.split()))\n\t\tctrlfile.close()\n\n\t=
\tfor script in ["preinst", "postinst", "prerm", "postrm"]:\n\t\t\tscriptva=
r =3D bb.data.getVar(\'pkg_%s\' % script, localdata, 1)\n\t\t\tif not scrip=
tvar:\n\t\t\t\tcontinue\n\t\t\ttry:\n\t\t\t\tscriptfile =3D file(os.path.jo=
in(controldir, script), \'w\')\n\t\t\texcept OSError:\n\t\t\t\tbb.utils.unl=
ockfile(lf)\n\t\t\t\traise bb.build.FuncFailed("unable to open %s script fi=
le for writing." % script)\n\t\t\tscriptfile.write(scriptvar)\n\t\t\tscript=
file.close()\n\t\t\tos.chmod(os.path.join(controldir, script), 0755)\n\n\t\=
tconffiles_str =3D bb.data.getVar("CONFFILES", localdata, 1)\n\t\tif conffi=
les_str:\n\t\t\ttry:\n\t\t\t\tconffiles =3D file(os.path.join(controldir, \=
'conffiles\'), \'w\')\n\t\t\texcept OSError:\n\t\t\t\tbb.utils.unlockfile(l=
f)\n\t\t\t\traise bb.build.FuncFailed("unable to open conffiles for writing=
.")\n\t\t\tfor f in conffiles_str.split():\n\t\t\t\tconffiles.write(\'%s\\n=
\' % f)\n\t\t\tconffiles.close()\n\n\t\tos.chdir(basedir)\n\t\tret =3D os.s=
ystem("PATH=3D\\"%s\\" %s %s %s" % (bb.data.getVar("PATH", localdata, 1),\n=
                                                          bb.data.getVar("I=
PKGBUILDCMD",d,1), pkg, pkgoutdir))\n\t\tif ret !=3D 0:\n\t\t\tbb.utils.unl=
ockfile(lf)\n\t\t\traise bb.build.FuncFailed("ipkg-build execution failed")=
\n\n\t\tbb.utils.prunedir(controldir)\n\t\tbb.utils.unlockfile(lf)\n', 'BBF=
ILE_PATTERN_localcommon': '^${OE_HOME}/common/recipes/', 'FILE_DIRNAME': "$=
{@os.path.dirname(bb.data.getVar('FILE', d))}", 'SOURCEFORGE_MIRROR': 'http=
://downloads.sourceforge.net', 'DBUS_SESSION_BUS_ADDRESS': None, 'TOOLCHAIN=
_SYSPATH': '${TOOLCHAIN_PATH}/${TARGET_SYS}', 'PREFERRED_VERSION_linux-hand=
helds-2.6': '2.6.21-hh20', 'read_shlibdeps': '\tpackages =3D bb.data.getVar=
(\'PACKAGES\', d, True).split()\n\tfor pkg in packages:\n\t\trdepends =3D e=
xplode_deps(bb.data.getVar(\'RDEPENDS_\' + pkg, d, 0) or bb.data.getVar(\'R=
DEPENDS\', d, 0) or "")\n\t\tfor extension in ".shlibdeps", ".pcdeps", ".cl=
ilibdeps":\n\t\t\tdepsfile =3D bb.data.expand("${PKGDEST}/" + pkg + extensi=
on, d)\n\t\t\tif os.access(depsfile, os.R_OK):\n\t\t\t\tfd =3D file(depsfil=
e)\n\t\t\t\tlines =3D fd.readlines()\n\t\t\t\tfd.close()\n\t\t\t\tfor l in =
lines:\n\t\t\t\t\trdepends.append(l.rstrip())\n\t\tbb.data.setVar(\'RDEPEND=
S_\' + pkg, " " + " ".join(rdepends), d)\n', 'STAGING_EXECPREFIXDIR': '${ST=
AGING_DIR_HOST}${exec_prefix}', 'PSTAGE_TASKS_COVERED': 'fetch unpack munge=
 patch configure qa_configure rig_locales compile sizecheck install deploy =
package populate_sysroot package_write_deb package_write_ipk package_write =
package_stage qa_staging', 'PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc=
-initial': 'glibc-initial', 'PREFERRED_VERSION_opie-symlinker': '${OPIE_VER=
SION}', 'PREFERRED_VERSION_opie-mediaplayer2': '${OPIE_VERSION}', 'do_distc=
lean': '\t"""clear downloaded sources, build and temp directories"""\n\n\tb=
b.build.exec_func(\'do_clean\', d)\n\n\tsrc_uri =3D bb.data.getVar(\'SRC_UR=
I\', d, 1)\n\tif not src_uri:\n\t\treturn\n\n\tfor uri in src_uri.split():\=
n\t\tif bb.decodeurl(uri)[0] =3D=3D "file":\n\t\t\tcontinue\n\n\t\ttry:\n\t=
\t\tlocal =3D bb.data.expand(bb.fetch.localpath(uri, d), d)\n\t\texcept bb.=
MalformedUrl, e:\n\t\t\tbb.debug(1, \'Unable to generate local path for mal=
formed uri: %s\' % e)\n\t\telse:\n\t\t\tbb.note("removing %s" % base_path_o=
ut(local, d))\n\t\t\ttry:\n\t\t\t\tif os.path.exists(local + ".md5"):\n\t\t=
\t\t\tos.remove(local + ".md5")\n\t\t\t\tif os.path.exists(local):\n\t\t\t\=
t\tos.remove(local)\n\t\t\texcept OSError, e:\n\t\t\t\tbb.note("Error in re=
moval: %s" % e)\n', 'PREFERRED_PROVIDER_task-bootstrap': 'task-bootstrap', =
'PREFERRED_VERSION_opie-search': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_vir=
tual/gail': 'gtk+', 'OLDEST_KERNEL': '2.6.16', 'PREFERRED_PROVIDER_e-wm-men=
u': 'e-wm-menu', 'base_do_fetch': '\timport sys\n\n\tlocaldata =3D bb.data.=
createCopy(d)\n\tbb.data.update_data(localdata)\n\n\tsrc_uri =3D bb.data.ge=
tVar(\'SRC_URI\', localdata, 1)\n\tif not src_uri:\n\t\treturn 1\n\n\ttry:\=
n\t\tbb.fetch.init(src_uri.split(),d)\n\texcept bb.fetch.NoMethodError:\n\t=
\t(type, value, traceback) =3D sys.exc_info()\n\t\traise bb.build.FuncFaile=
d("No method: %s" % value)\n\texcept bb.MalformedUrl:\n\t\t(type, value, tr=
aceback) =3D sys.exc_info()\n\t\traise bb.build.FuncFailed("Malformed URL: =
%s" % value)\n\n\ttry:\n\t\tbb.fetch.go(localdata)\n\texcept bb.fetch.Missi=
ngParameterError:\n\t\t(type, value, traceback) =3D sys.exc_info()\n\t\trai=
se bb.build.FuncFailed("Missing parameters: %s" % value)\n\texcept bb.fetch=
.FetchError:\n\t\t(type, value, traceback) =3D sys.exc_info()\n\t\traise bb=
.build.FuncFailed("Fetch failed: %s" % value)\n\texcept bb.fetch.MD5SumErro=
r:\n\t\t(type, value, traceback) =3D sys.exc_info()\n\t\traise bb.build.Fun=
cFailed("MD5  failed: %s" % value)\n\texcept:\n\t\t(type, value, traceback)=
 =3D sys.exc_info()\n\t\traise bb.build.FuncFailed("Unknown fetch Error: %s=
" % value)\n\n\n\tpv =3D bb.data.getVar(\'PV\', d, True)\n\tpn =3D bb.data.=
getVar(\'PN\', d, True)\n\n\t# Check each URI\n\tfirst_uri =3D True\n\tfor =
url in src_uri.split():\n\t\tlocalpath =3D bb.data.expand(bb.fetch.localpat=
h(url, localdata), localdata)\n\t\t(type,host,path,_,_,params) =3D bb.decod=
eurl(url)\n\t\turi =3D "%s://%s%s" % (type,host,path)\n\t\ttry:\n\t\t\tif t=
ype in [ "http", "https", "ftp", "ftps" ]:\n\t\t\t\t# We provide a default =
shortcut of plain [] for the first fetch uri\n\t\t\t\t# Explicit names in a=
ny uri overrides this default.\n\t\t\t\tif not "name" in params and first_u=
ri:\n\t\t\t\t\tfirst_uri =3D False\n\t\t\t\t\tparams["name"] =3D ""\n\t\t\t=
\tif not base_chk_file(pn, pv, uri, localpath, params, d):\n\t\t\t\t\tif no=
t bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS", d, True):\n\t\t\t\t\t\tbb.f=
atal("%s-%s: %s cannot check archive integrity" % (pn,pv,uri))\n\t\t\t\t\te=
lse:\n\t\t\t\t\t\tbb.note("%s-%s: %s cannot check archive integrity" % (pn,=
pv,uri))\n\t\texcept Exception:\n\t\t\traise bb.build.FuncFailed("Checksum =
of \'%s\' failed" % uri)\n', 'ANGSTROM_BLACKLIST_pn-bluez-utils': 'bluez-ut=
ils 3.x has been replaced by bluez4', 'devshell_do_devshell': '\texport TER=
MWINDOWTITLE=3D"Bitbake Developer Shell"\n\t${TERMCMD}\n\tif [ $? -ne 0 ]; =
then\n\t    echo "Fatal: \'${TERMCMD}\' not found. Check TERMCMD variable."=
\n\t    exit 1\n\tfi\n', 'SECTION_${PN}-doc': 'doc', 'PREFERRED_VERSION_ti-=
codec-engine-examples': '2_25_01_06', 'PREFERRED_PROVIDER_hostap-conf': 'ho=
stap-conf', 'XAUTHORITY': '/home/DRESEARCH/sledz/.Xauthority', 'AUTHOR': No=
ne, 'do_populate_sysroot': '    #\n    # if do_stage exists, we\'re legacy.=
 In that case run the do_stage,\n    # modify the SYSROOT_DESTDIR variable =
and then run the staging preprocess\n    # functions against staging direct=
ly.\n    #\n    # Otherwise setup a destdir, copy the results from do_insta=
ll\n    # and run the staging preprocess against that\n    #\n    pstageact=
ive =3D (bb.data.getVar("PSTAGING_ACTIVE", d, True) =3D=3D "1")\n    lockfi=
le =3D bb.data.getVar("SYSROOT_LOCK", d, True)\n    stagefunc =3D bb.data.g=
etVar(\'do_stage\', d, True)\n    legacy =3D is_legacy_staging(d)\n    if l=
egacy:\n        bb.data.setVar("SYSROOT_DESTDIR", "", d)\n        bb.note("=
Legacy staging mode for %s" % bb.data.getVar("FILE", d, True))\n\n        t=
ry:\n            file =3D open("%s/legacy-staging.log" % bb.data.getVar("TM=
PDIR", d, 1), "a")\n\t    file.write("%s\\n" % bb.data.getVar("FILE", d, Tr=
ue))\n\t    file.close()\n        except:\n            pass\n\n        if b=
b.data.getVarFlags(\'do_stage\', d) is None:\n            bb.fatal("This re=
cipe (%s) has a do_stage_prepend or do_stage_append and do_stage now doesn\=
't exist. Please rename this to do_stage()" % bb.data.getVar("FILE", d, Tru=
e))\n        lock =3D bb.utils.lockfile(lockfile)\n        bb.build.exec_fu=
nc(\'populate_sysroot_prehook\', d)\n        bb.build.exec_func(\'do_stage\=
', d)\n        for f in (bb.data.getVar(\'SYSROOT_PREPROCESS_FUNCS\', d, Tr=
ue) or \'\').split():\n            bb.build.exec_func(f, d)\n        bb.bui=
ld.exec_func(\'populate_sysroot_posthook\', d)\n        bb.utils.unlockfile=
(lock)\n    else:\n        dest =3D bb.data.getVar(\'D\', d, True)\n       =
 sysrootdest =3D bb.data.expand(\'${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}\'=
, d)\n        bb.mkdirhier(sysrootdest)\n\n        bb.build.exec_func("sysr=
oot_stage_all", d)\n        #os.system(\'cp -pPR %s/* %s/\' % (dest, sysroo=
tdest))\n        for f in (bb.data.getVar(\'SYSROOT_PREPROCESS_FUNCS\', d, =
True) or \'\').split():\n            bb.build.exec_func(f, d)\n        if p=
stageactive:\n            bb.build.exec_func("packagedstaging_fastpath", d)=
\n\n        lock =3D bb.utils.lockfile(lockfile)\n        os.system(bb.data=
.expand(\'cp -pPR ${SYSROOT_DESTDIR}${TMPDIR}/* ${TMPDIR}/\', d))\n        =
bb.utils.unlockfile(lock)\n', 'TARGET_FPU_ppc603e': 'hard', 'staging_packag=
e_libtoolhack': '\t# Deal with libtool not supporting sysroots and add our =
new\n\t# staging location\n        tmpdir =3D bb.data.getVar(\'TMPDIR\', d,=
 True)\n        staging =3D bb.data.getVar(\'STAGING_DIR\', d, True)\n     =
   fixmefn =3D  staging + "/fixmepath"\n        try:\n            fixmefd =
=3D open(fixmefn,"r")\n            fixmefiles =3D fixmefd.readlines()\n    =
        fixmefd.close()\n            oe.path.remove(fixmefn)\n            f=
or file in fixmefiles:\n                oe_run(d, "sed -i -e s:FIXMESTAGING=
DIR:%s:g %s" % (staging, tmpdir + \'/\' + file))\n        except IOError:\n=
            pass\n', 'PREFERRED_VERSION_glibc': '2.9', 'PREFERRED_VERSION_o=
pie-remote': '${OPIE_VERSION}', 'BUILD_OPTIMIZATION': '-O2 -g', 'PREFERRED_=
VERSION_opie-networksettings': '${OPIE_VERSION}', 'FILES_${PN}-dev': '${inc=
ludedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o ${libdir}/=
pkgconfig ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig', 'QMA=
KE_MKSPEC_PATH': '${STAGING_DATADIR_NATIVE}/qmake', 'PREFERRED_VERSION_opie=
-write': '${OPIE_VERSION}', 'sysroot_stage_dir': '\tsrc=3D"$1"\n\tdest=3D"$=
2"\n\t# This will remove empty directories so we can ignore them\n\trmdir "=
$src" 2> /dev/null || true\n\tif [ -d "$src" ]; then\n\t\tmkdir -p "$dest"\=
n\t\tcp -fpPR "$src"/* "$dest"\n\tfi\n', 'SEPPUKU_PRODUCT': 'Openembedded',=
 'package_name_hook': "\tbb.build.exec_func('debian_package_name_hook', d)\=
n", 'IMAGE_DEPENDS': '', 'DEBUG_APPS': ' ${@base_conditional("DISTRO_TYPE",=
 "release", "", "strace procps",d)}', 'do_testlab': 'if [ -e  ${IMAGE_ROOTF=
S}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" =3D "full" ] ; then\n\n\t=
IPKG_TMP_DIR=3D"${IMAGE_ROOTFS}-tmp"\n\tIPKG_ARGS=3D"-f ${STAGING_ETCDIR_NA=
TIVE}/opkg.conf -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DIR}"\n\n\tTESTLAB_DIR=3D"=
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-testlab"\n        mkdir -p ${TESTLAB_DIR}=
/\n        mkdir -p ${IPKG_TMP_DIR}/\n\tls -laR ${IMAGE_ROOTFS} > ${TESTLAB=
_DIR}/files-in-image.txt\n\n\techo > ${TESTLAB_DIR}/installed-packages.txt\=
n\techo -e "digraph depends {\\n    node [shape=3Dplaintext]" > ${TESTLAB_D=
IR}/depends.dot\n\n\tfor pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk=
 \'{print $1}\') ; do\n\t\topkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 =
"^Status.* \\(\\(installed\\)\\|\\(unpacked\\)\\)" | awk \'/^Package/ {prin=
tf $2"_"} /^Version/ {printf $2"_"} /^Archi/ {print $2".ipk"}\'  >> ${TESTL=
AB_DIR}/installed-packages.txt\n\n    \t\tfor depends in $(opkg-cl ${IPKG_A=
RGS} info $pkg | grep ^Depends) ; do\n        \t\techo "$pkg OPP $depends;"=
 | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Depends" | sed -e \'s:,::g=
\' -e \'s:-:_:g\' -e \'s:\\.:_:g\' -e \'s:+::g\' |sed \'s:OPP:->:g\' >> ${T=
ESTLAB_DIR}/depends.dot\n    \t\tdone\n\n\t\tfor recommends in $(opkg-cl ${=
IPKG_ARGS} info $pkg | grep ^Recom) ; do\n        \t\techo "$pkg OPP $recom=
mends [style=3Ddotted];" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Re=
com" | sed -e \'s:,::g\' -e \'s:-:_:g\' -e \'s:\\.:_:g\' -e \'s:+::g\' |sed=
 \'s:OPP:->:g\' >> ${TESTLAB_DIR}/depends.dot\n    \t\tdone\n\tdone\n\n\tec=
ho "}" >>  ${TESTLAB_DIR}/depends.dot\n\trm -rf ${IPKG_TMP_DIR}\n\n\tgrep -=
v kernel_2 ${TESTLAB_DIR}/depends.dot | grep -v kernel_image > ${TESTLAB_DI=
R}/depends-nokernel.dot\n\tgrep -v libc6 ${TESTLAB_DIR}/depends-nokernel.do=
t | grep -v libgcc > ${TESTLAB_DIR}/depends-nokernel-nolibc.dot\n\tgrep -v =
update_ ${TESTLAB_DIR}/depends-nokernel-nolibc.dot > ${TESTLAB_DIR}/depends=
-nokernel-nolibc-noupdate.dot\n        grep -v kernel_module ${TESTLAB_DIR}=
/depends-nokernel-nolibc-noupdate.dot > ${TESTLAB_DIR}/depends-nokernel-nol=
ibc-noupdate-nomodules.dot\n\n\t#dot has some library troubles when run und=
er fakeroot, uncomment at your own risk\n\t#dot -Tpng -o ${TESTLAB_DIR}/ima=
ge-dependencies.png  ${TESTLAB_DIR}/depends.dot\n\t#dot -Tpng -o ${TESTLAB_=
DIR}/image-dependencies-nokernel-nolibc.png ${TESTLAB_DIR}/depends-nokernel=
-nolibc.dot\n\t#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nol=
ibc-noupdate.png ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate.dot\n\t#do=
t -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc-noupdate-nomod=
ules.png ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate-nomodules.dot\n\n\=
tfor file in $(cat ${TESTLAB_DIR}/installed-packages.txt) ; do\n     \t\tdu=
 -k $(find ${DEPLOY_DIR_IPK} -name "$file") | head -n1\n\tdone | grep "\\.i=
pk" | sed -e s:${DEPLOY_DIR_IPK}::g | sort -n -r | awk \'{print $1 "\\tKiB =
" $2}\' > ${TESTLAB_DIR}/installed-package-sizes.txt\n\n\t# Log results to =
a git controlled directory structure than can be pushed to a remote locatio=
n\n\tif [ "${TESTLABLOG}" =3D "remote" ] && [ -n "${TESTLABREMOTEDIR}" ] ; =
then\n\t\tTESTLABLOGDIR=3D"${MACHINE_ARCH}/${IMAGE_BASENAME}"\n\t\tmkdir -p=
 ${TESTLABREMOTEDIR}/${TESTLABLOGDIR}\n\t\tcp ${TESTLAB_DIR}/*package* ${TE=
STLAB_DIR}/depends.dot ${TESTLABREMOTEDIR}/${TESTLABLOGDIR}\n\t\t# force ch=
ange to record builds where the testlab contents didn\'t change, but other =
things (e.g. git rev) did\n\t\techo "${MACHINE}: ${IMAGE_BASENAME} configur=
ed for ${DISTRO} ${DISTRO_VERSION} using branch ${METADATA_BRANCH} and revi=
sion ${METADATA_REVISION} " > ${TESTLABREMOTEDIR}/${TESTLABLOGDIR}/build-id=
\n\t\t# This runs inside fakeroot, so the git author is listed as root (or =
whatever root configured it to be) :(\n\t\t( cd ${TESTLABREMOTEDIR}/\n\t\t =
 git add ${TESTLABLOGDIR}/*\n\t\t  git commit ${TESTLABLOGDIR}/ -m "${MACHI=
NE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_VERSION} using bra=
nch ${METADATA_BRANCH} and revision ${METADATA_REVISION}" --author "testlab=
 <testlab@${DISTRO}>" || true)\n\tfi\nfi\n', 'PREFERRED_PROVIDER_virtual/up=
date-alternatives-native': 'opkg-native', 'PREFERRED_VERSION_opie-keypebble=
': '${OPIE_VERSION}', 'MKTEMPDIRCMD': 'mktemp -d -q ${TMPBASE}', 'PREFERRED=
_PROVIDER_esound': 'pulseaudio', 'SEPPUKU_LOGIN': 'http://bugs.openembedded=
.net/query.cgi?', 'IPKGCONF_SDK': '${STAGING_ETCDIR_NATIVE}/opkg-sdk.conf',=
 'PREFERRED_VERSION_opie-login': '${OPIE_VERSION}', 'SOLIBS': '.so.*', 'MUL=
TIMACH_ARCH': '${PACKAGE_ARCH}', 'PROVIDES': '', 'PACKAGE_PREPROCESS_FUNCS'=
: '', 'do_setscene': "\tbb.build.exec_func('base_do_setscene', d)\n", 'do_p=
ackage_write_tar': None, 'PREFERRED_PROVIDER_gdk-pixbuf-loader-wbmp': 'gtk+=
', 'docdir': '${datadir}/doc', 'base_scenefunction': '\tstamp =3D bb.data.g=
etVar(\'STAMP\', d, 1) + ".needclean"\n\tif os.path.exists(stamp):\n\t     =
   bb.build.exec_func("do_clean", d)\n', 'DISTRO_FEATURES': 'largefile ipv4=
 ipv6 nfs smbfs wifi ppp alsa bluetooth ext2 vfat irda pcmcia usbgadget usb=
host pci pam tk  ${@["", "thumb-interwork"][bb.data.getVar(\'THUMB_INTERWOR=
K\', d, 1) =3D=3D "yes"]}  ${@["", "thumb-interwork"][bb.data.getVar(\'THUM=
B_INTERWORK\', d, 1) =3D=3D "yes"]}', 'IMAGE_DEPENDS_ext2.gz': 'genext2fs-n=
ative', 'PREFERRED_VERSION_opie-osearch': '${OPIE_VERSION}', 'PREFERRED_VER=
SION_binutils-cross-sdk': '${ANGSTROM_BINUTILS_VERSION}', 'PREFERRED_VERSIO=
N_ti-lpm-utils': '1_24_01', 'PREFERRED_VERSION_opie-ftp': '${OPIE_VERSION}'=
, 'ANGSTROM_BLACKLIST_pn-fso-apm': 'regular apmd is good enough', 'TERMCMD'=
: 'xterm', 'PREFERRED_VERSION_konqueror-embedded': '20070316', 'PREFERRED_V=
ERSION_opie-bartender': '${OPIE_VERSION}', 'RESUMECOMMAND': 'ERROR, this mu=
st be a BitBake bug', 'layout_sysconfdir': '${sysconfdir}', 'PREFERRED_PROV=
IDER_gtk+': 'gtk+', 'IMAGE_DEPENDS_ext3.gz': 'genext2fs-native e2fsprogs-na=
tive', 'infodir': '${datadir}/info', 'SANITY_ABIFILE': '${TMPDIR}/abi_versi=
on', 'packagestage_scenefunc': '    import glob\n    if bb.data.getVar("PST=
AGING_ACTIVE", d, 1) =3D=3D "0":\n        return\n\n    bb.build.exec_func(=
"staging_helper", d)\n\n    removepkg =3D bb.data.expand("${PSTAGE_PKGPN}",=
 d)\n\n    pstage_cleanpackage(removepkg, d)\n\n    stagepkg =3D bb.data.ex=
pand("${PSTAGE_PKG}", d)\n    if not os.path.exists(stagepkg):\n        sta=
ging_fetch(stagepkg, d)\n\n    if os.path.exists(stagepkg):\n        pstage=
_set_pkgmanager(d)\n        file =3D bb.data.getVar("FILE", d, True)\n     =
   bb.debug(2, "Packaged staging active for %s\\n" % file)\n\n        #\n  =
      # Install the staging package somewhere temporarily so we can extract=
 the stamp files\n        #\n        bb.mkdirhier(bb.data.expand("${WORKDIR=
}/tstage/${libdir_native}/opkg/info/ ", d))\n        cmd =3D bb.data.expand=
("${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -force-depends -o ${WORKDIR}=
/tstage install", d)\n        try:\n            oe_run(d, "%s %s" % (cmd, s=
tagepkg))\n        except RuntimeError:\n            bb.fatal("Couldn\'t in=
stall the staging package to a temp directory")\n\n        #\n        # Gra=
b the staging lock now so that we don\'t have other threads try and\n      =
  # validate or install based on these stamps being valid.  This is a\n    =
    # potential issue for certain BB_STAMP_POLICY values and enough\n      =
  # concurrent threads.\n        #\n        lf =3D bb.utils.lockfile(bb.dat=
a.expand("${SYSROOT_LOCK}", d))\n\n        #\n        # Copy the stamp file=
s into the main stamps directoy\n        #\n        cmd =3D bb.data.expand(=
"cp -dpR ${WORKDIR}/tstage/stamps/* ${TMPDIR}/stamps/", d)\n        try:\n =
           ret =3D oe_run(d, cmd)\n        except RuntimeError:\n          =
  bb.utils.unlockfile(lf)\n            bb.fatal("Couldn\'t copy the staging=
 package stamp files")\n\n        #\n        # Iterate over the stamps seei=
ng if they\'re valid. If we find any that\n        # are invalid or the tas=
k wasn\'t in the taskgraph, assume caution and\n        # do a rebuild.\n  =
      #\n        # FIXME - some tasks are safe to ignore in the task graph.=
 e.g. package_write_*\n        stageok =3D True\n        taskscovered =3D b=
b.data.getVar("PSTAGE_TASKS_COVERED", d, True).split()\n        stamp =3D b=
b.data.getVar("STAMP", d, True)\n        for task in taskscovered:\n       =
     task =3D \'do_\' + task\n            stampfn =3D "%s.%s" % (stamp, tas=
k)\n            bb.debug(1, "Checking %s" % (stampfn))\n            if os.p=
ath.exists(stampfn):\n                stageok =3D bb.runqueue.check_stamp_f=
n(file, task, d)\n                bb.debug(1, "Result %s" % (stageok))\n   =
             if not stageok:\n                    bb.utils.unlockfile(lf)\n=
                    break\n\n        # Remove the stamps and files we added=
 above\n        # FIXME - we should really only remove the stamps we added\=
n        for fname in glob.glob(stamp + \'.*\'):\n            oe.path.remov=
e(fname)\n\n        oe.path.remove(bb.data.expand("${WORKDIR}/tstage", d))\=
n        if stageok:\n            bb.note("Staging package found, using it =
for %s." % file)\n            installcmd =3D bb.data.getVar("PSTAGE_INSTALL=
_CMD", d, 1)\n            try:\n                ret =3D oe_run(d, "%s %s" %=
 (installcmd, stagepkg))\n            except RuntimeError:\n               =
 bb.note("Failure installing prestage package")\n            finally:\n    =
            bb.utils.unlockfile(lf)\n\n            bb.build.exec_func("stag=
ing_package_libtoolhack", d)\n\n            bb.build.make_stamp("do_stage_p=
ackage_populated", d)\n        else:\n            bb.note("Staging package =
found but invalid for %s" % file)\n\n', 'base_do_configure': '\t:\n', 'SDK_=
CPPFLAGS': '-isystem${STAGING_DIR_SDK}${includedir} -isystem${STAGING_DIR_H=
OST}${includedir}', 'IMAGE_CMD_squashfs-lzma': 'mksquashfs ${IMAGE_ROOTFS} =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -n=
oappend -comp lzma', 'base_prefix': '', '__depends': [('/home/DRESEARCH/sle=
dz/work/HydraIP/OE/hipox/conf/local.conf', 1296725026), ('/home/DRESEARCH/s=
ledz/work/openembedded/conf/machine/hipox.conf', 1284017760), ('/home/DRESE=
ARCH/sledz/work/openembedded/conf/machine/include/tune-arm926ejs.inc', 1287=
649457), ('/home/DRESEARCH/sledz/work/openembedded/conf/distro/angstrom-200=
8.1.conf', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/conf/dist=
ro/include/sane-srcdates.inc', 1296491286), ('/home/DRESEARCH/sledz/work/op=
enembedded/conf/distro/include/sane-srcrevs.inc', 1296491286), ('/home/DRES=
EARCH/sledz/work/openembedded/conf/distro/include/angstrom-2008-preferred-v=
ersions.inc', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/conf/d=
istro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc', 128764=
9457), ('/home/DRESEARCH/sledz/work/openembedded/conf/distro/include/prefer=
red-opie-versions-1.2.4.inc', 1296491286), ('/home/DRESEARCH/sledz/work/ope=
nembedded/conf/distro/include/toolchain-internal.inc', 1287649457), ('/home=
/DRESEARCH/sledz/work/openembedded/conf/distro/include/arm-thumb.inc', 1296=
491286), ('/home/DRESEARCH/sledz/work/openembedded/conf/distro/include/angs=
trom.inc', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/conf/dist=
ro/include/angstrom-glibc.inc', 1296639956), ('/home/DRESEARCH/sledz/work/o=
penembedded/conf/distro/include/glibc-internal.inc', 1296491286), ('/home/D=
RESEARCH/sledz/work/openembedded/conf/distro/include/sane-toolchain-java.in=
c', 1284017760), ('/home/DRESEARCH/sledz/work/openembedded/conf/distro/incl=
ude/angstrom-jalimo.conf', 1296491286), ('/home/DRESEARCH/sledz/work/openem=
bedded/conf/distro/include/angstrom-package-ipk.inc', 1284017760), ('/home/=
DRESEARCH/sledz/work/openembedded/conf/documentation.conf', 1284017760), ('=
/home/DRESEARCH/sledz/work/openembedded/conf/sanity.conf', 1296491286), ('/=
home/DRESEARCH/sledz/work/openembedded/conf/abi_version.conf', 1287649457),=
 ('/home/DRESEARCH/sledz/work/openembedded/conf/enterprise.conf', 128401776=
0), ('/home/DRESEARCH/sledz/work/openembedded/conf/compatibility-providers.=
conf', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/classes/base.=
bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/classes/pa=
tch.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/classe=
s/staging.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/=
classes/packaged-staging.bbclass', 1296491286), ('/home/DRESEARCH/sledz/wor=
k/openembedded/classes/packagedata.bbclass', 1296491286), ('/home/DRESEARCH=
/sledz/work/openembedded/classes/mirrors.bbclass', 1287649457), ('/home/DRE=
SEARCH/sledz/work/openembedded/classes/utils.bbclass', 1296491286), ('/home=
/DRESEARCH/sledz/work/openembedded/classes/utility-tasks.bbclass', 12964912=
86), ('/home/DRESEARCH/sledz/work/openembedded/classes/metadata_scm.bbclass=
', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/classes/devshell.=
bbclass', 1284017760), ('/home/DRESEARCH/sledz/work/openembedded/classes/sr=
c_distribute_local.bbclass', 1287649457), ('/home/DRESEARCH/sledz/work/open=
embedded/classes/src_distribute.bbclass', 1287649457), ('/home/DRESEARCH/sl=
edz/work/openembedded/classes/debian.bbclass', 1287649457), ('/home/DRESEAR=
CH/sledz/work/openembedded/classes/sanity.bbclass', 1296491286), ('/home/DR=
ESEARCH/sledz/work/openembedded/classes/qemu.bbclass', 1287649457), ('/home=
/DRESEARCH/sledz/work/openembedded/classes/angstrom.bbclass', 1284017760), =
('/home/DRESEARCH/sledz/work/openembedded/classes/devshell.bbclass', 128401=
7760), ('/home/DRESEARCH/sledz/work/openembedded/classes/angstrom-mirrors.b=
bclass', 1287649457), ('/home/DRESEARCH/sledz/work/openembedded/classes/ins=
ane.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/classe=
s/package.bbclass', 1296491286), ('/home/DRESEARCH/sledz/work/openembedded/=
classes/recipe_sanity.bbclass', 1287649457), ('/home/DRESEARCH/sledz/work/o=
penembedded/classes/testlab.bbclass', 1287649457), ('/home/DRESEARCH/sledz/=
work/openembedded/classes/package_ipk.bbclass', 1296491286), ('/home/DRESEA=
RCH/sledz/work/openembedded/classes/sanity.bbclass', 1296491286)], 'PREFERR=
ED_VERSION_ti-codecs-omap3530': '1_00_01', 'CC': '${CCACHE}${HOST_PREFIX}gc=
c ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}', 'PREFERRED_PROVIDER_gdk-pixbuf-load=
er-ico': 'gtk+', 'HGDIR': '${CO_DIR}/hg', 'PREFERRED_VERSION_libqtaux2': '$=
{OPIE_VERSION}', 'PREFERRED_VERSION_opie-gutenbrowser': '${OPIE_VERSION}', =
'BUILD_OS': 'linux', 'IMAGE_FSTYPES': 'tar', 'MACHINE_GUI_CLASS': 'smallscr=
een', 'STAGING_LOADER_DIR': '${STAGING_DIR_HOST}/loader', 'RDEPENDS': '', '=
DISTRO_EXTRA_RDEPENDS': ' angstrom-version ${ANGSTROM_FEED_CONFIGS} util-li=
nux-ng-mount util-linux-ng-umount angstrom-libc-fixup-hack ', 'PREFERRED_VE=
RSION_icedtea6-native': '1.7.3', 'PREFERRED_VERSION_usbutils': '0.86', 'PRE=
FERRED_VERSION_opie-mindbreaker': '${OPIE_VERSION}', 'PREFERRED_VERSION_pul=
seaudio': '0.9.15', 'STAGING_ETCDIR': '${STAGING_DIR_HOST}${sysconfdir}', '=
DISTRO_REVISION': '3', 'TARGET_LDFLAGS': '-L${STAGING_DIR_TARGET}${libdir} =
-Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} -Wl,-O1 ${TARGET_LINK_HASH_S=
TYLE}', 'HOST_OS': '${TARGET_OS}', 'TERM': 'xterm', 'PREFERRED_PROVIDER_gdk=
-pixbuf-loader-pcx': 'gtk+', 'IMAGE_DEPENDS_ext3.bz2': 'genext2fs-native e2=
fsprogs-native', 'MULTIMACH_HOST_SYS': '${MULTIMACH_ARCH}${HOST_VENDOR}-${H=
OST_OS}', 'TARGET_FPU': None, 'STAGING_DIR_NATIVE': '${STAGING_DIR}/${BUILD=
_SYS}', 'PREFERRED_VERSION_opie-camera': '${OPIE_VERSION}', 'PREFERRED_VERS=
ION_opie-keyview': '${OPIE_VERSION}', 'PREFERRED_VERSION_openssl-native': '=
1.0.0a', 'PREFERRED_VERSION_gtk+': '2.20.1', 'MACHINE_EXTRA_RDEPENDS': '', =
'SANITY_PRFILE': '${TMPDIR}/distro_pr', 'MULTI_PROVIDER_WHITELIST': 'virtua=
l/libintl', 'DISTRO_CHECK': '2010.7-test-20110203', 'STAMP': '${TMPDIR}/sta=
mps/${MULTIMACH_TARGET_SYS}/${PF}', 'BBINCLUDELOGS': 'yes', 'PREFERRED_VERS=
ION_classpath': '0.98', 'PREFERRED_PROVIDER_virtual/libintl': 'glibc', 'PRE=
FERRED_VERSION_opie-i18n': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_virtual/l=
ibsdl': 'libsdl-x11', 'PREFERRED_VERSION_ti-codecs-omap3530-server': '1_00_=
00', 'PREFERRED_VERSION_cacaoh-native': '0.99.3', 'layout_servicedir': '${s=
ervicedir}', 'TARGET_EXEEXT': '', 'PREFERRED_VERSION_opie-mailapplet': '${O=
PIE_VERSION}', 'do_buildall': '\t:\n', 'OPIE_VERSION': '1.2.4', 'BUILDCFG_N=
EEDEDVARS': 'TARGET_ARCH TARGET_OS', 'ANGSTROM_BLACKLIST_pn-ipkg': 'ipkg ha=
s been superseded by opkg', 'DEPLOY_DIR_TOOLS': '${DEPLOY_DIR}/tools', 'PRE=
FERRED_PROVIDER_virtual/libgl': 'mesa', 'PREFERRED_VERSION_automake-native'=
: '1.11.1', 'T': '${WORKDIR}/temp', 'PREFERRED_PROVIDER_openmoko-alsa-scena=
rios': 'fsodeviced', 'PREFERRED_VERSION_opie-deco-liquid': '${OPIE_VERSION}=
', 'PREFERRED_VERSION_busybox': '1.13.2', 'IMAGE_DEPENDS_ubi': 'mtd-utils-n=
ative', 'FULL_OPTIMIZATION_pn-perl': '-fexpensive-optimizations -fomit-fram=
e-pointer -frename-registers -O1', 'package_generate_ipkg_conf': '\tmkdir -=
p ${STAGING_ETCDIR_NATIVE}/\n\techo "src oe file:${DEPLOY_DIR_IPK}" > ${IPK=
GCONF_TARGET}\n\techo "src oe file:${DEPLOY_DIR_IPK}" > ${IPKGCONF_SDK}\n\t=
echo "src oe file:${DEPLOY_DIR_IPK}" > ${IPKGCONF_CANSDK}\n\tipkgarchs=3D"$=
{PACKAGE_ARCHS}"\n\tpriority=3D1\n\tfor arch in $ipkgarchs; do\n\t\techo "a=
rch $arch $priority" >> ${IPKGCONF_TARGET}\n\t\techo "arch ${BUILD_ARCH}-$a=
rch-sdk $priority" >> ${IPKGCONF_SDK}\n\t\techo "arch ${SDK_SYS}-sdk-$arch =
$priority" >> ${IPKGCONF_CANSDK}\n\t\tpriority=3D$(expr $priority + 5)\n\t\=
tif [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then\n\t\t        echo "src o=
e-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_TARGET}\n\t\tfi\n\t\tif=
 [ -e ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages ] ; then\n\t\t    =
    echo "src oe-${BUILD_ARCH}-$arch-sdk file:${DEPLOY_DIR_IPK}/${BUILD_ARC=
H}-$arch-sdk" >> ${IPKGCONF_SDK}\n\t\tfi\n\t\tif [ -e ${DEPLOY_DIR_IPK}/${S=
DK_SYS}-sdk-$arch/Packages ] ; then\n\t\t        echo "src oe-${SDK_SYS}-sd=
k-$arch file:${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch" >> ${IPKGCONF_CANSDK}\=
n\t\tfi\n\tdone\n\techo "lists_dir ext /var/lib/opkg" >> ${IPKGCONF_TARGET}=
\n\techo "lists_dir ext /var/lib/opkg" >> ${IPKGCONF_SDK}\n\techo "lists_di=
r ext /var/lib/opkg" >> ${IPKGCONF_CANSDK}\n', 'SRC_DISTRIBUTECOMMAND-move+=
symlink': '    if ! [ -L ${SRC} ]; then\n        src=3D`basename "${SRC}"`\=
n        mv ${SRC} .\n        ln -sf $src "${SRC}"\n        if [ -e ${SRC}.=
md5 ]; then\n            mv ${SRC}.md5 .\n            ln -sf $src "${SRC}.m=
d5"\n        fi\n    fi\n', 'HOST_PREFIX': '${TARGET_PREFIX}', 'PREFERRED_V=
ERSION_opie-calculator': '${OPIE_VERSION}', 'do_distribute_sources': '\tbb.=
build.exec_func("do_fetch", d)\n\n\tcmd =3D bb.data.getVar(\'SRC_DISTRIBUTE=
COMMAND\', d, 1)\n\tif not cmd:\n\t\traise bb.build.FuncFailed("Unable to d=
istribute sources, SRC_DISTRIBUTECOMMAND not set")\n\n\ttry:\n\t\tdlonly =
=3D int(d.getVar("SRC_DISTRIBUTE_DLONLY", 1))\n\texcept ValueError:\n\t\tra=
ise bb.build.FuncFailed("Invalid value for SRC_DISTRIBUTE_DLONLY: expected =
integer.")\n\tdldir =3D os.path.realpath(d.getVar("DL_DIR", 1) or "")\n\n\t=
licenses =3D (bb.data.getVar(\'LICENSE\', d, 1) or "unknown").split()\n\tur=
ldatadict =3D bb.fetch.init(d.getVar("SRC_URI", True).split(), d, True)\n\t=
for url, urldata in urldatadict.iteritems():\n\t\tif not urldata.setup:\n\t=
\t\turldata.setup_localpath(d)\n\n\t\tlocal =3D urldata.localpath\n\t\tif d=
lonly and dldir and not \\\n\t\t   os.path.realpath(local).startswith(dldir=
 + os.path.sep):\n\t\t\tcontinue\n\n\t\tbb.data.setVar(\'SRC\', os.path.abs=
path(local), d)\n\t\tfor license in licenses:\n\t\t\tfor entry in license.s=
plit("|"):\n\t\t\t\tbb.data.setVar(\'LIC\', entry, d)\n\t\t\t\tbb.build.exe=
c_func(\'SRC_DISTRIBUTECOMMAND\', d)\n', 'PKGDATA_DIR': '${TMPDIR}/pkgdata/=
${MULTIMACH_TARGET_SYS}', 'sysconfdir_native': '/etc', 'XLIBS_MIRROR': 'htt=
p://xlibs.freedesktop.org/release', 'SDK_ARCH': '${BUILD_ARCH}', 'TINDER_MA=
CHINE': '${MACHINE}-${LIBC}-build-image', 'PREFERRED_VERSION_jamvm-native':=
 '1.5.3', 'PREFERRED_VERSION_opie-console': '${OPIE_VERSION}', 'STAGING_PYD=
IR': '${STAGING_DIR}/lib/python2.4', 'PREFERRED_PROVIDER_qemu-native': 'qem=
u-native', 'package_do_package': '\tpackages =3D (bb.data.getVar(\'PACKAGES=
\', d, True) or "").split()\n\tif len(packages) < 1:\n\t\tbb.debug(1, "No p=
ackages to build, skipping do_package")\n\t\treturn\n\n\tworkdir =3D bb.dat=
a.getVar(\'WORKDIR\', d, True)\n\toutdir =3D bb.data.getVar(\'DEPLOY_DIR\',=
 d, True)\n\tdest =3D bb.data.getVar(\'D\', d, True)\n\tdvar =3D bb.data.ge=
tVar(\'PKGD\', d, True)\n\tpn =3D bb.data.getVar(\'PN\', d, True)\n\n\tif n=
ot workdir or not outdir or not dest or not dvar or not pn or not packages:=
\n\t\tbb.error("WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, un=
able to package")\n\t\treturn\n\n\tfor f in (bb.data.getVar(\'PACKAGEFUNCS\=
', d, True) or \'\').split():\n\t\tbb.build.exec_func(f, d)\n\t\tpackage_ru=
n_hooks(f, d)\n', 'ENTERPRISE_DISTRO': '0', 'PREFERRED_VERSION_ti-codecs_om=
apl137-server': '1_00_00', 'SRC_DISTRIBUTECOMMAND-copy': '    test -e "${SR=
C}.md5" && cp -f "${SRC}.md5" .\n    cp -fr "${SRC}" .\n', 'PREFERRED_VERSI=
ON_binutils-cross_avr32': '2.17', 'PREFERRED_VERSION_ti-codecs-dm355': '1_1=
3_000', 'MACHINE_FEATURES': 'kernel26 ext2 pci usbhost ethernet serial raid=
 uboot', 'D': '${WORKDIR}/image', 'GNU_MIRROR': 'ftp://ftp.gnu.org/gnu', 'I=
MAGE_ROOTFS_SIZE': '65536', 'STAGING_SBINDIR_NATIVE': '${STAGING_DIR_NATIVE=
}${sbindir_native}', 'RANLIB': '${HOST_PREFIX}ranlib', 'ANGSTROM_GCC_VERSIO=
N_xilinx-ml403': '4.1.1', 'PREFERRED_PROVIDER_gdk-pixbuf-loader-bmpg': 'gtk=
+', 'PREFERRED_VERSION_opie-kpacman': '${OPIE_VERSION}', 'PREFERRED_VERSION=
_ti-codecs-dm6467': '1_00_00_03', 'do_package_write_rpm': None, 'PREFERRED_=
VERSION_ti-linuxutils': '2_25_01_06', 'PREFERRED_VERSION_opie-jumpx': '${OP=
IE_VERSION}', 'PREFERRED_VERSION_mplayer': '0.0+1.0rc3+svnr30165', 'base_sb=
indir': '${base_prefix}/sbin', 'PREFERRED_VERSION_ti-dsplink-examples': '1_=
64', 'PREFERRED_VERSION_ti-dmai': '2_10_00_01+svnr%', 'CXX': '${CCACHE}${HO=
ST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}', 'PREFERRED_VERSION_opie=
-systemtime': '${OPIE_VERSION}', 'TINDER_REPORT': '1', 'layout_libexecdir':=
 '${libexecdir}', 'ldconfig_postinst_fragment': 'if [ x"$D" =3D "x" ]; then=
\n\tif [ -e /etc/ld.so.conf ] ; then\n\t\t[ -x /sbin/ldconfig ] && /sbin/ld=
config\n\tfi\nfi\n', 'BUILDCFG_HEADER': 'Build Configuration:', 'MACHINE_AR=
CH': "${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE}', 'BA=
SE_PACKAGE_ARCH')}", 'PREFERRED_VERSION_ti-framework-components': '2_25_01_=
05', 'PREFERRED_VERSION_ti-codecs-dm365-server': '3_10_00_02', 'SCREEN_TERM=
CMD': 'screen -D -m -t "$TERMWINDOWTITLE"', 'SDK_VENDOR': '${BUILD_VENDOR}'=
, 'PREFERRED_VERSION_gtkmm': '2.20.0', 'PREFERRED_VERSION_opie-today-addres=
sbookplugin': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_virtual/libiconv': 'gl=
ibc', 'PREFERRED_PROVIDER_virtual/libqte2': '${@base_conditional("PALMTOP_U=
SE_MULTITHREADED_QT", "yes", "qte-mt", "qte", d)}', 'BUILD_RANLIB': '${BUIL=
D_PREFIX}ranlib', 'LOCALCOUNT': '0', 'OLDEST_KERNEL_linux-gnueabi': '2.6.16=
', 'UBOOT_LOADADDRESS': '0x48008000', 'PKG_CONFIG_SYSROOT_DIR': '${STAGING_=
DIR}/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}', 'BUILD_VENDOR': ''=
, 'KERNELORG_MIRROR': 'http://kernel.org', 'E_CVS': 'cvs://anonymous@anoncv=
s.enlightenment.org/var/cvs/e', 'IMAGE_DEPENDS_squashfs': 'squashfs-tools-n=
ative', 'FEED_ARCH': 'armv5te', 'RPROVIDES': '', 'PREFERRED_VERSION': None,=
 'FEED_BASEPATH': 'feeds/unstable/${ANGSTROM_PKG_FORMAT}/${LIBC}/', 'FULL_O=
PTIMIZATION_pn-glibc': '-fexpensive-optimizations -fomit-frame-pointer -O2'=
, 'PKG_CONFIG_PATH': '${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig', 'SYS=
ROOT_LOCK': '${STAGING_DIR}/staging.lock', 'FILES': '', 'PREFERRED_VERSION_=
opie-tinykate': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-stumbler': '${OP=
IE_VERSION}', 'COLORTERM': '1', 'PREFERRED_VERSION_opie-powerchord': '${OPI=
E_VERSION}', 'SOLIBSDEV_darwin9': '.dylib', 'PREFERRED_VERSION_opie-keytabs=
': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-performance': '${OPIE_VERSION=
}', 'ARM_KEEP_OABI_pn-linux-openmoko-2.6.24_om-gta01': '1', 'ANGSTROM_BINUT=
ILS_VERSION_armv4': '2.20', 'PREFERRED_VERSION_glibc-initial': '2.9', 'SLOT=
': '0', 'PREFERRED_VERSION_opie-datebook-chrisholidayplugin': '${OPIE_VERSI=
ON}', '__inherit_cache': ['classes/base.bbclass', 'classes/patch.bbclass', =
'/home/DRESEARCH/sledz/work/openembedded/classes/patch.bbclass', 'classes/s=
taging.bbclass', '/home/DRESEARCH/sledz/work/openembedded/classes/staging.b=
bclass', 'classes/packaged-staging.bbclass', '/home/DRESEARCH/sledz/work/op=
enembedded/classes/packaged-staging.bbclass', 'classes/packagedata.bbclass'=
, '/home/DRESEARCH/sledz/work/openembedded/classes/packagedata.bbclass', 'c=
lasses/mirrors.bbclass', '/home/DRESEARCH/sledz/work/openembedded/classes/m=
irrors.bbclass', 'classes/utils.bbclass', '/home/DRESEARCH/sledz/work/opene=
mbedded/classes/utils.bbclass', 'classes/utility-tasks.bbclass', '/home/DRE=
SEARCH/sledz/work/openembedded/classes/utility-tasks.bbclass', 'classes/met=
adata_scm.bbclass', '/home/DRESEARCH/sledz/work/openembedded/classes/metada=
ta_scm.bbclass', 'classes/devshell.bbclass', 'classes/src_distribute_local.=
bbclass', 'classes/src_distribute.bbclass', '/home/DRESEARCH/sledz/work/ope=
nembedded/classes/src_distribute.bbclass', 'classes/debian.bbclass', 'class=
es/sanity.bbclass', 'classes/qemu.bbclass', '/home/DRESEARCH/sledz/work/ope=
nembedded/classes/qemu.bbclass', 'classes/angstrom.bbclass', 'classes/angst=
rom-mirrors.bbclass', 'classes/insane.bbclass', 'classes/package.bbclass', =
'/home/DRESEARCH/sledz/work/openembedded/classes/package.bbclass', 'classes=
/recipe_sanity.bbclass', 'classes/testlab.bbclass', 'classes/package_ipk.bb=
class'], 'PREFERRED_PROVIDER_gdk-pixbuf-loader-xbm': 'gtk+', 'datadir': '${=
prefix}/share', 'PREFERRED_VERSION_python-pycairo': '1.8.0', 'PREFERRED_VER=
SION_opie-today-mailplugin': '${OPIE_VERSION}', 'package_do_split_locales':=
 '\tif (bb.data.getVar(\'PACKAGE_NO_LOCALE\', d, True) =3D=3D \'1\'):\n\t\t=
bb.debug(1, "package requested not splitting locales")\n\t\treturn\n\n\tpac=
kages =3D (bb.data.getVar(\'PACKAGES\', d, True) or "").split()\n\n\tdatadi=
r =3D bb.data.getVar(\'datadir\', d, True)\n\tif not datadir:\n\t\tbb.note(=
"datadir not defined")\n\t\treturn\n\n\tdvar =3D bb.data.getVar(\'PKGD\', d=
, True)\n\tpn =3D bb.data.getVar(\'PN\', d, True)\n\n\tif pn + \'-locale\' =
in packages:\n\t\tpackages.remove(pn + \'-locale\')\n\n\tlocaledir =3D os.p=
ath.join(dvar + datadir, \'locale\')\n\n\tif not os.path.isdir(localedir):\=
n\t\tbb.debug(1, "No locale files in this package")\n\t\treturn\n\n\tlocale=
s =3D os.listdir(localedir)\n\n\t# This is *really* broken\n\tmainpkg =3D p=
ackages[0]\n\t# At least try and patch it up I guess...\n\tif mainpkg.find(=
\'-dbg\'):\n\t\tmainpkg =3D mainpkg.replace(\'-dbg\', \'\')\n\tif mainpkg.f=
ind(\'-dev\'):\n\t\tmainpkg =3D mainpkg.replace(\'-dev\', \'\')\n\n\tfor l =
in locales:\n\t\tln =3D legitimize_package_name(l)\n\t\tpkg =3D pn + \'-loc=
ale-\' + ln\n\t\tpackages.append(pkg)\n\t\tbb.data.setVar(\'FILES_\' + pkg,=
 os.path.join(datadir, \'locale\', l), d)\n\t\tbb.data.setVar(\'RDEPENDS_\'=
 + pkg, \'%s virtual-locale-%s\' % (mainpkg, ln), d)\n\t\tbb.data.setVar(\'=
RPROVIDES_\' + pkg, \'%s-locale %s-translation\' % (pn, ln), d)\n\t\tbb.dat=
a.setVar(\'DESCRIPTION_\' + pkg, \'%s translation for %s\' % (l, pn), d)\n\=
n\tbb.data.setVar(\'PACKAGES\', \' \'.join(packages), d)\n', 'PSTAGE_PKGVER=
SION': '${PV}-${PR}', 'SOLIBSDEV_darwin': '.dylib', 'STAGING_DIR_HOST': '${=
STAGING_DIR}/${BASEPKG_HOST_SYS}', 'OE_STRICT_CHECKSUMS': '1', 'PREFERRED_V=
ERSION_opie-brightnessapplet': '${OPIE_VERSION}', 'debian_package_name_hook=
': '\timport glob, copy, stat, errno, re\n\n\tpkgdest =3D bb.data.getVar(\'=
PKGDEST\', d, 1)\n\tpackages =3D bb.data.getVar(\'PACKAGES\', d, 1)\n\n\tde=
f socrunch(s):\n\t\ts =3D s.lower().replace(\'_\', \'-\')\n\t\tm =3D re.mat=
ch("^(.*)(.)\\.so\\.(.*)$", s)\n\t\tif m is None:\n\t\t\treturn None\n\t\ti=
f m.group(2) in \'0123456789\':\n\t\t\tbin =3D \'%s%s-%s\' % (m.group(1), m=
.group(2), m.group(3))\n\t\telse:\n\t\t\tbin =3D m.group(1) + m.group(2) + =
m.group(3)\n\t\tdev =3D m.group(1) + m.group(2)\n\t\treturn (bin, dev)\n\n\=
tdef isexec(path):\n\t\ttry:\n\t\t\ts =3D os.stat(path)\n\t\texcept (os.err=
or, AttributeError):\n\t\t\treturn 0\n\t\treturn (s[stat.ST_MODE] & stat.S_=
IEXEC)\n\n\tdef auto_libname(packages, orig_pkg):\n\t\tbin_re =3D re.compil=
e(".*/s?bin$")\n\t\tlib_re =3D re.compile(".*/lib$")\n\t\tso_re =3D re.comp=
ile("lib.*\\.so")\n\t\tsonames =3D []\n\t\thas_bins =3D 0\n\t\thas_libs =3D=
 0\n\t\tpkg_dir =3D os.path.join(pkgdest, orig_pkg)\n\t\tfor root, dirs, fi=
les in os.walk(pkg_dir):\n\t\t\tif bin_re.match(root) and files:\n\t\t\t\th=
as_bins =3D 1\n\t\t\tif lib_re.match(root) and files:\n\t\t\t\thas_libs =3D=
 1\n\t\t\t\tfor f in files:\n\t\t\t\t\tif so_re.match(f):\n\t\t\t\t\t\tfp =
=3D os.path.join(root, f)\n\t\t\t\t\t\tcmd =3D "PATH=3D" + bb.data.getVar(\=
'PATH\', d, 1) + " " + (bb.data.getVar(\'TARGET_PREFIX\', d, 1) or "") + "o=
bjdump -p " + fp + " 2>/dev/null"\n\t\t\t\t\t\tfd =3D os.popen(cmd)\n\t\t\t=
\t\t\tlines =3D fd.readlines()\n\t\t\t\t\t\tfd.close()\n\t\t\t\t\t\tfor l i=
n lines:\n\t\t\t\t\t\t\tm =3D re.match("\\s+SONAME\\s+([^\\s]*)", l)\n\t\t\=
t\t\t\t\tif m and not m.group(1) in sonames:\n\t\t\t\t\t\t\t\tsonames.appen=
d(m.group(1))\n\n\t\tbb.debug(1, \'LIBNAMES: pkg %s libs %d bins %d sonames=
 %s\' % (orig_pkg, has_libs, has_bins, sonames))\n\t\tsoname =3D None\n\t\t=
if len(sonames) =3D=3D 1:\n\t\t\tsoname =3D sonames[0]\n\t\telif len(soname=
s) > 1:\n\t\t\tlead =3D bb.data.getVar(\'LEAD_SONAME\', d, 1)\n\t\t\tif lea=
d:\n\t\t\t\tr =3D re.compile(lead)\n\t\t\t\tfiltered =3D []\n\t\t\t\tfor s =
in sonames:\n\t\t\t\t\tif r.match(s):\n\t\t\t\t\t\tfiltered.append(s)\n\t\t=
\t\tif len(filtered) =3D=3D 1:\n\t\t\t\t\tsoname =3D filtered[0]\n\t\t\t\te=
lif len(filtered) > 1:\n\t\t\t\t\tbb.note("Multiple matches (%s) for LEAD_S=
ONAME \'%s\'" % (", ".join(filtered), lead))\n\t\t\t\telse:\n\t\t\t\t\tbb.n=
ote("Multiple libraries (%s) found, but LEAD_SONAME \'%s\' doesn\'t match a=
ny of them" % (", ".join(sonames), lead))\n\t\t\telse:\n\t\t\t\tbb.note("Mu=
ltiple libraries (%s) found and LEAD_SONAME not defined" % ", ".join(soname=
s))\n\n\t\tif has_libs and not has_bins and soname:\n\t\t\tsoname_result =
=3D socrunch(soname)\n\t\t\tif soname_result:\n\t\t\t\t(pkgname, devname) =
=3D soname_result\n\t\t\t\tfor pkg in packages.split():\n\t\t\t\t\tif (bb.d=
ata.getVar(\'PKG_\' + pkg, d) or bb.data.getVar(\'DEBIAN_NOAUTONAME_\' + pk=
g, d)):\n\t\t\t\t\t\tcontinue\n\t\t\t\t\tdebian_pn =3D bb.data.getVar(\'DEB=
IANNAME_\' + pkg, d)\n\t\t\t\t\tif debian_pn:\n\t\t\t\t\t\tnewpkg =3D debia=
n_pn\n\t\t\t\t\telif pkg =3D=3D orig_pkg:\n\t\t\t\t\t\tnewpkg =3D pkgname\n=
\t\t\t\t\telse:\n\t\t\t\t\t\tnewpkg =3D pkg.replace(orig_pkg, devname, 1)\n=
\t\t\t\t\tif newpkg !=3D pkg:\n\t\t\t\t\t\tbb.data.setVar(\'PKG_\' + pkg, n=
ewpkg, d)\n\n\tfor pkg in (bb.data.getVar(\'AUTO_LIBNAME_PKGS\', d, 1) or "=
").split():\n\t\tauto_libname(packages, pkg)\n', 'IMAGE_ROOTFS_SIZE_ext2.gz=
': '65536', 'PREFERRED_VERSION_opie-language': '${OPIE_VERSION}', 'IMAGE_LI=
NK_NAME': '${IMAGE_BASENAME}-${MACHINE}', 'FETCHCMD_bzr': '/usr/bin/env bzr=
', 'ANGSTROMLIBC': 'glibc', 'PREFERRED_VERSION_opie-lupdate-native': '${OPI=
E_VERSION}', 'PREFERRED_VERSION_opie-qcop': '${OPIE_VERSION}', 'PREFERRED_P=
ROVIDER_avahi': 'avahi', 'IMAGE_ROOTFS_SIZE_ext3.gz': '65536', 'PSTAGE_MACH=
CONFIG': '${PSTAGE_WORKDIR}/opkg.conf', 'do_qa_staging': '    bb.debug(2, "=
QA checking staging")\n\n    if not package_qa_check_staged(bb.data.getVar(=
\'STAGING_LIBDIR\',d,True), d):\n        bb.fatal("QA staging was broken by=
 the package built above")\n', 'ANGSTROM_BLACKLIST_pn-bluez-libs': 'bluez-l=
ibs 3.x has been replaced by bluez4', 'do_qa_configure': '    configs =3D [=
]\n    bb.debug(1, "Checking sanity of the config.log file")\n    for root,=
 dirs, files in os.walk(bb.data.getVar(\'WORKDIR\', d, True)):\n        sta=
tement =3D "grep \'CROSS COMPILE Badness:\' %s > /dev/null" % \\\n         =
           os.path.join(root,"config.log")\n        if "config.log" in file=
s:\n            if os.system(statement) =3D=3D 0:\n                bb.fatal=
("""This autoconf log indicates errors, it looked at host includes.\nRerun =
configure task after fixing this. The path was \'%s\'""" % root)\n\n       =
 if "configure.ac" in files:\n            configs.append(os.path.join(root,=
"configure.ac"))\n        if "configure.in" in files:\n            configs.=
append(os.path.join(root, "configure.in"))\n\n    if "gettext" not in bb.da=
ta.getVar(\'P\', d, True):\n       if bb.data.inherits_class(\'native\', d)=
 or bb.data.inherits_class(\'cross\', d) or bb.data.inherits_class(\'crosss=
dk\', d) or bb.data.inherits_class(\'nativesdk\', d):\n          gt =3D "ge=
ttext-native"\n       elif bb.data.inherits_class(\'cross-canadian\', d):\n=
          gt =3D "gettext-nativesdk"\n       else:\n          gt =3D "gette=
xt"\n       deps =3D bb.utils.explode_deps(bb.data.getVar(\'DEPENDS\', d, T=
rue) or "")\n       if gt not in deps:\n          for config in configs:\n =
             gnu =3D "grep \\"^[[:space:]]*AM_GNU_GETTEXT\\" %s >/dev/null"=
 % config\n              if os.system(gnu) =3D=3D 0:\n                 bb.n=
ote("""Gettext required but not in DEPENDS for file %s.\nMissing inherit ge=
ttext?""" % config)\n', 'staging_helper': '\t# Assemble appropriate opkg.co=
nf\n\tconffile=3D${PSTAGE_MACHCONFIG}\n\tmkdir -p ${PSTAGE_WORKDIR}/pstagin=
g_lists\n\tarch=3D"${PSTAGE_PKGARCH}"\n\tif [ ! -e $conffile ]; then\n\t\te=
cho "arch $arch 1" > $conffile\n\t\techo "dest root /" >> $conffile\n\telif=
 [ `grep -c " $arch " $conffile` -eq 0 ]; then\n\t\tpriority=3D$(expr `grep=
 -cE "^arch" $conffile` + 1)\n\t\tsed -i -e "/dest/iarch $arch $priority" $=
conffile\n\tfi\n\tif [ ! -e ${TMPDIR}${libdir_native}/opkg/info/ ]; then\n\=
t\tmkdir -p ${TMPDIR}${libdir_native}/opkg/info/\n\tfi\n \tif [ ! -e ${TMPD=
IR}${libdir_native}/ipkg/ ]; then\n\t\tln -sf opkg/ ${TMPDIR}${libdir_nativ=
e}/ipkg || true\n\tfi\n', 'MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS': '', 'PREFE=
RRED_VERSION_eglibc': '2.9', 'LOCALE_UTF8_ONLY': '1', 'TINDER_CLOBBER': '1'=
, 'TARGET_FPU_armv7a': 'hard', 'MIRRORS_append': None, 'SRCREV_pn-mojito': =
'0542c4b0e26c0e3b69c5ad1fa1898dc276fb9f48', 'BUILD_CFLAGS': '${BUILD_CPPFLA=
GS} ${BUILD_OPTIMIZATION}', 'PREFERRED_VERSION_opie-logoutapplet': '${OPIE_=
VERSION}', 'PREFERRED_VERSION_opie-mediaplayer1-core': '${OPIE_VERSION}', '=
FILES_${PN}-static': '${libdir}/*.a ${base_libdir}/*.a', 'mapping_rename_ho=
ok': "\tbb.build.exec_func('insane_mapping_rename_hook', d)\n", 'OE_HOME': =
'/home/DRESEARCH/sledz/work/HydraIP/OE', 'layout_libdir': '${libdir}', 'GNO=
ME_MIRROR': 'http://ftp.gnome.org/pub/GNOME/sources', 'EXTRA_IMAGECMD': '',=
 'OLDEST_KERNEL_sparc64': '2.4.21', 'PREFERRED_VERSION_opie-kjumpx': '${OPI=
E_VERSION}', 'COMPATIBLE_HOST': None, 'SRC_DIST_LOCAL': 'symlink', 'BASE_PA=
CKAGE_ARCH': 'armv5te', 'emit_pkgdata': '\tfrom glob import glob\n\n\tdef w=
rite_if_exists(f, pkg, var):\n\t\tdef encode(str):\n\t\t\timport codecs\n\t=
\t\tc =3D codecs.getencoder("string_escape")\n\t\t\treturn c(str)[0]\n\n\t\=
tval =3D bb.data.getVar(\'%s_%s\' % (var, pkg), d, True)\n\t\tif val:\n\t\t=
\tf.write(\'%s_%s: %s\\n\' % (var, pkg, encode(val)))\n \t\t\treturn\n \t\t=
val =3D bb.data.getVar(\'%s\' % (var), d, True)\n \t\tif val:\n \t\t\tf.wri=
te(\'%s: %s\\n\' % (var, encode(val)))\n \t\treturn\n\n\tpackages =3D bb.da=
ta.getVar(\'PACKAGES\', d, True)\n\tpkgdest =3D bb.data.getVar(\'PKGDEST\',=
 d, 1)\n\tpkgdatadir =3D bb.data.getVar(\'PKGDATA_DIR\', d, True)\n\n\tpsta=
geactive =3D bb.data.getVar(\'PSTAGING_ACTIVE\', d, True)\n\tif pstageactiv=
e =3D=3D "1":\n\t\tlf =3D bb.utils.lockfile(bb.data.expand("${STAGING_DIR}/=
staging.lock", d))\n\n\tdata_file =3D pkgdatadir + bb.data.expand("/${PN}" =
, d)\n\tf =3D open(data_file, \'w\')\n\tf.write("PACKAGES: %s\\n" % package=
s)\n\tf.close()\n\tpackage_stagefile(data_file, d)\n\n\tworkdir =3D bb.data=
.getVar(\'WORKDIR\', d, True)\n\n\tfor pkg in packages.split():\n\t\tsubdat=
a_file =3D pkgdatadir + "/runtime/%s" % pkg\n\t\tsf =3D open(subdata_file, =
\'w\')\n\t\twrite_if_exists(sf, pkg, \'PN\')\n\t\twrite_if_exists(sf, pkg, =
\'PV\')\n\t\twrite_if_exists(sf, pkg, \'PR\')\n\t\twrite_if_exists(sf, pkg,=
 \'PKGV\')\n\t\twrite_if_exists(sf, pkg, \'PKGR\')\n\t\twrite_if_exists(sf,=
 pkg, \'DESCRIPTION\')\n\t\twrite_if_exists(sf, pkg, \'RDEPENDS\')\n\t\twri=
te_if_exists(sf, pkg, \'RPROVIDES\')\n\t\twrite_if_exists(sf, pkg, \'RRECOM=
MENDS\')\n\t\twrite_if_exists(sf, pkg, \'RSUGGESTS\')\n\t\twrite_if_exists(=
sf, pkg, \'RREPLACES\')\n\t\twrite_if_exists(sf, pkg, \'RCONFLICTS\')\n\t\t=
write_if_exists(sf, pkg, \'PKG\')\n\t\twrite_if_exists(sf, pkg, \'ALLOW_EMP=
TY\')\n\t\twrite_if_exists(sf, pkg, \'FILES\')\n\t\twrite_if_exists(sf, pkg=
, \'pkg_postinst\')\n\t\twrite_if_exists(sf, pkg, \'pkg_postrm\')\n\t\twrit=
e_if_exists(sf, pkg, \'pkg_preinst\')\n\t\twrite_if_exists(sf, pkg, \'pkg_p=
rerm\')\n\t\tsf.close()\n\n\t\tpackage_stagefile(subdata_file, d)\n\t\t#if =
pkgdatadir2:\n\t\t#\tbb.copyfile(subdata_file, pkgdatadir2 + "/runtime/%s" =
% pkg)\n\n\t\tallow_empty =3D bb.data.getVar(\'ALLOW_EMPTY_%s\' % pkg, d, T=
rue)\n\t\tif not allow_empty:\n\t\t\tallow_empty =3D bb.data.getVar(\'ALLOW=
_EMPTY\', d, True)\n\t\troot =3D "%s/%s" % (pkgdest, pkg)\n\t\tos.chdir(roo=
t)\n\t\tg =3D glob(\'*\') + glob(\'.[!.]*\')\n\t\tif g or allow_empty =3D=
=3D "1":\n\t\t\tpackagedfile =3D pkgdatadir + \'/runtime/%s.packaged\' % pk=
g\n\t\t\tfile(packagedfile, \'w\').close()\n\t\t\tpackage_stagefile(package=
dfile, d)\n\tif pstageactive =3D=3D "1":\n\t\tbb.utils.unlockfile(lf)\n', '=
DEPLOY_DIR_IPK': '${DEPLOY_DIR}/ipk', 'PREFERRED_VERSION_ti-xdctools': '3_1=
6_01_27', 'STAGING_FIRMWARE_DIR': '${STAGING_DIR_HOST}/firmware', 'TOOLCHAI=
N_TYPE': 'internal', 'KERNEL_CCSUFFIX_archos5it': '-4.2.1+csl-arm-2007q3-53=
', 'do_distsrcall': None, 'AS': '${HOST_PREFIX}as', 'AR': '${HOST_PREFIX}ar=
', 'PREFERRED_PROVIDERS': 'virtual/qte:qte virtual/libqpe:libqpe-opie  virt=
ual/libsdl:libsdl-x11  virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initia=
l  virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate  virtual=
/${TARGET_PREFIX}gcc:gcc-cross  virtual/${TARGET_PREFIX}g++:gcc-cross', 'PR=
EFERRED_VERSION_xserver-common': '1.33', 'FILES_${PN}-locale': '${datadir}/=
locale', 'CVS_TARBALL_STASH': 'http://www.angstrom-distribution.org/unstabl=
e/sources/ ', 'WORKDIR': '${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}', 'T=
INDER_TREE': 'Angstrom', 'OVERRIDE_THUMB': "${@['', ':thumb'][bb.data.getVa=
r('ARM_INSTRUCTION_SET', d, 1) =3D=3D 'thumb']}", 'BUILD_CPPFLAGS': '-isyst=
em${STAGING_INCDIR_NATIVE}', 'sysroot_stage_libdir': '\tsrc=3D"$1"\n\tdest=
=3D"$2"\n\n\tolddir=3D`pwd`\n\tcd $src\n\tlas=3D$(find . -name \\*.la -type=
 f)\n\tcd $olddir\n\techo "Found la files: $las"\n\tfor i in $las\n\tdo\n\t=
\tsed -e \'s/^installed=3Dyes$/installed=3Dno/\' \\\n\t\t    -e \'/^depende=
ncy_libs=3D/s,${WORKDIR}[[:alnum:]/\\._+-]*/\\([[:alnum:]\\._+-]*\\),${STAG=
ING_LIBDIR}/\\1,g\' \\\n\t\t    -e "/^dependency_libs=3D/s,\\([[:space:]\']=
\\)${libdir},\\1${STAGING_LIBDIR},g" \\\n\t\t    ${SYSROOTEXTRALIBDIRSED} \=
\\n\t\t    -i $src/$i\n\tdone\n\tsysroot_stage_dir $src $dest\n', 'QEMU_OPT=
IONS': '', 'PREFERRED_VERSION_libsdl-x11': '1.2.14', 'PREFERRED_VERSION_qt4=
-x11-free': '${ANGSTROM_QT_VERSION}', 'SRCREV_pn-libccss': '92bc59e1d39302c=
8be500d53cb5dd8b05c2e4a15', 'do_package_write_deb': None, 'layout_base_sbin=
dir': '${base_sbindir}', 'QEMU_OPTIONS_armv6': '-cpu arm1136', 'PREFERRED_V=
ERSION_opie-packagemanager': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-con=
feditor': '${OPIE_VERSION}', 'CPP': '${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTION=
S}', 'PREFERRED_VERSION_opie-mediaplayer2-skin-techno': '${OPIE_VERSION}', =
'BBFILE_COLLECTIONS': 'upstream localcommon local', 'mandir': '${datadir}/m=
an', 'PREFERRED_PROVIDER_virtual/update-alternatives': 'opkg', 'HOST_CC_ARC=
H': '${TARGET_CC_ARCH}', 'DISTRO_BLUETOOTH_MANAGER': 'blueprobe bluez4 ', '=
PREFERRED_VERSION_opie-usermanager': '${OPIE_VERSION}', 'PREFERRED_VERSION_=
opie-style-web': '${OPIE_VERSION}', 'CCACHE': '', 'PREFERRED_VERSION_qt4-x1=
1-free-gles': '${ANGSTROM_QT_VERSION}', 'IMAGE_CMD_ext3.gz': 'install -d ${=
DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} $=
{DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune=
2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${D=
EPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/t=
mp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs=
.ext3.gz', 'PSTAGE_PKGPN': "${@bb.data.expand('staging-${PN}-${MULTIMACH_AR=
CH}${TARGET_VENDOR}-${TARGET_OS}', d).replace('_', '-')}", 'do_listtasks': =
'\timport sys\n\t# emit variables and shell functions\n\t#bb.data.emit_env(=
sys.__stdout__, d)\n\t# emit the metadata which isnt valid shell\n\tfor e i=
n d.keys():\n\t\tif bb.data.getVarFlag(e, \'task\', d):\n\t\t\tsys.__stdout=
__.write("%s\\n" % e)\n', 'P': '${PN}-${PV}', 'IMAGE_CMD_tar.gz': 'cd ${IMA=
GE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz .',=
 'PREFERRED_VERSION_opie-keyboard': '${OPIE_VERSION}', 'FILESPATH': "${@':'=
.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPA=
THBASE', 1).split(':') for p in d.getVar('FILESPATHPKG', 1).split(':') for =
o in (d.getVar('OVERRIDES', 1) + ':').split(':')])}", 'do_package_update_in=
dex_ipk': '\tset -x\n\n\tipkgarchs=3D"${PACKAGE_ARCHS}"\n\n\tif [ ! -z "${D=
EPLOY_KEEP_PACKAGES}" ]; then\n\t\treturn\n\tfi\n\n\tmkdir -p ${DEPLOY_DIR_=
IPK}\n\ttouch ${DEPLOY_DIR_IPK}/Packages\n\tipkg-make-index -r ${DEPLOY_DIR=
_IPK}/Packages -p ${DEPLOY_DIR_IPK}/Packages -l ${DEPLOY_DIR_IPK}/Packages.=
filelist -m ${DEPLOY_DIR_IPK}\n\n\tfor arch in $ipkgarchs; do\n\t\tif [ -e =
${DEPLOY_DIR_IPK}/$arch/ ] ; then\n\t\t\ttouch ${DEPLOY_DIR_IPK}/$arch/Pack=
ages\n\t\t\tipkg-make-index -r ${DEPLOY_DIR_IPK}/$arch/Packages -p ${DEPLOY=
_DIR_IPK}/$arch/Packages -l ${DEPLOY_DIR_IPK}/$arch/Packages.filelist -m ${=
DEPLOY_DIR_IPK}/$arch/\n\t\tfi\n\t\tif [ -e ${DEPLOY_DIR_IPK}/${BUILD_ARCH}=
-$arch-sdk/ ] ; then\n\t\t\ttouch ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk=
/Packages\n\t\t\tipkg-make-index -r ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-s=
dk/Packages -p ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -l ${DEPL=
OY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages.filelist -m ${DEPLOY_DIR_IPK}/=
${BUILD_ARCH}-$arch-sdk/\n\t\tfi\n\t\tif [ -e ${DEPLOY_DIR_IPK}/${SDK_SYS}-=
sdk-$arch/ ] ; then\n\t\t\ttouch ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Pac=
kages\n\t\t\tipkg-make-index -r ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Pack=
ages -p ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -l ${DEPLOY_DIR_IPK=
}/${SDK_SYS}-sdk-$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/${SDK_SYS}-sd=
k-$arch/\n\t\tfi\n\tdone\n', 'PREFERRED_VERSION_opie-deco-polished': '${OPI=
E_VERSION}', 'PREFERRED_VERSION_opie-style-phase': '${OPIE_VERSION}', 'stag=
ing_packager': '\n\tmkdir -p ${PSTAGE_TMPDIR_STAGE}/CONTROL\n\tmkdir -p ${P=
STAGE_DIR}/${PSTAGE_PKGPATH}\n\n\techo "Package: ${PSTAGE_PKGPN}"         >=
  ${PSTAGE_TMPDIR_STAGE}/CONTROL/control\n\techo "Version: ${PSTAGE_PKGVERS=
ION}"    >> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control\n\techo "Description: ${=
DESCRIPTION}"      >> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control\n\techo "Secti=
on: ${SECTION}"              >> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control\n\te=
cho "Priority: Optional"               >> ${PSTAGE_TMPDIR_STAGE}/CONTROL/co=
ntrol\n\techo "Maintainer: ${MAINTAINER}"        >> ${PSTAGE_TMPDIR_STAGE}/=
CONTROL/control\n\techo "Architecture: ${PSTAGE_PKGARCH}"  >> ${PSTAGE_TMPD=
IR_STAGE}/CONTROL/control\n\n\t# Protect against empty SRC_URI\n\tsrcuri=3D=
"${SRC_URI}"\n\tif [ "$srcuri" =3D=3D "" ]; then\n\t\tsrcuri=3D"OpenEmbedde=
d"\n\tfi\n\techo "Source: $srcuri"               >> ${PSTAGE_TMPDIR_STAGE}/=
CONTROL/control\n\n\t# Deal with libtool not supporting sysroots\n\t# Need =
to remove hardcoded paths and fix these when we install the\n\t# staging pa=
ckages.\n\t# Could someone please add sysroot support to libtool!\n        =
for i in `${PSTAGE_SCAN_CMD}` ; do \\\n                sed -i -e s:${STAGIN=
G_DIR}:FIXMESTAGINGDIR:g $i\n                echo $i | sed -e \'s:${PSTAGE_=
TMPDIR_STAGE}/::\' >> ${PSTAGE_TMPDIR_STAGE}/sysroots/fixmepath\n        do=
ne\n\n\t${PSTAGE_BUILD_CMD} ${PSTAGE_TMPDIR_STAGE} ${PSTAGE_DIR}/${PSTAGE_P=
KGPATH}\n', 'die': '\toefatal "$*"\n', 'base_do_install': '\t:\n', 'PROFILE=
_OPTIMIZATION': '-pg', 'BUILD_CXXFLAGS': '${BUILD_CFLAGS} -fpermissive', 'P=
REFERRED_VERSION_classpath-initial': '0.93', 'OBJCOPY': '${HOST_PREFIX}objc=
opy', 'TOPDIR': '/home/DRESEARCH/sledz/work/HydraIP/OE', 'PSTAGE_WORKDIR': =
'${TMPDIR}/pstage', 'PREFERRED_VERSION_ti-edma3lld': '01_11_00_03', 'PREFER=
RED_VERSION_mesa': '7.6', 'do_compile': '\tbase_do_compile\n', 'SRC_URI': '=
file://${FILE}', 'includedir_native': '${prefix_native}/include', 'PREFERRE=
D_VERSION_opie-dasher': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-addressb=
ook': '${OPIE_VERSION}', 'MACHINE_EXTRA_RRECOMMENDS': '', 'STAGING_BINDIR':=
 '${STAGING_DIR_HOST}${bindir}', 'IPKGBUILDCMD': 'ipkg-build -o 0 -g 0', 'A=
NGSTROM_URI': 'http://www.angstrom-distribution.org', 'ANGSTROM_GCC_VERSION=
_bfin': '4.1.2', 'OLDEST_KERNEL_ppc64': '2.4.21', 'QTE_VERSION': '2.3.10', =
'MACHINE_DISPLAY_HEIGHT_PIXELS': '320', 'PREFERRED_VERSION_opie-notesapplet=
': '${OPIE_VERSION}', 'FILESDIR': "${@bb.which(d.getVar('FILESPATH', 1), '.=
')}", 'PREFERRED_VERSION_opie-dvorak': '${OPIE_VERSION}', 'ENABLE_BINARY_LO=
CALE_GENERATION_armeb': '0', 'PREFERRED_PROVIDER_gdk-pixbuf-loader-pnm': 'g=
tk+', 'PREFERRED_VERSION_binutils-cross-sdk_avr32': '2.17', 'OELAYOUT_ABI':=
 '5', 'PREFERRED_PROVIDER_gdk-pixbuf-loader-png': 'gtk+', 'SELECTED_OPTIMIZ=
ATION_pn-libgssdp': '${PROFILE_OPTIMIZATION}', 'PACKAGESTRIPFUNCS': ' do_ru=
nstrip', 'base_libdir_native': '/lib', 'PKGR': '${PR}${DISTRO_PR}', 'IMAGE_=
DEPENDS_ubifs': 'mtd-utils-native', 'PREFERRED_VERSION_libtool': '2.2.6b', =
'PREFERRED_VERSION_opie-advancedfm': '${OPIE_VERSION}', 'PREFERRED_VERSION_=
opie-today-fortuneplugin': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-locka=
pplet': '${OPIE_VERSION}', 'PREFERRED_VERSION_gst-pulse': '0.9.7', 'PREFERR=
ED_VERSION_opie-ftplib': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-example=
s-python': '${OPIE_VERSION}', 'LIBC': '${ANGSTROMLIBC}', 'IMAGE_PKGTYPE': '=
ipk', 'FILES_${PN}-dbg': '${bindir}/.debug ${sbindir}/.debug ${libexecdir}/=
.debug ${libdir}/.debug ${base_bindir}/.debug ${base_sbindir}/.debug ${base=
_libdir}/.debug ${libdir}/${PN}/.debug ${libdir}/matchbox-panel/.debug ${da=
tadir}/gdb/autoload', 'servicedir': '${base_prefix}/srv', 'EXTRA_IMAGECMD_c=
pio': '', 'bindir_native': '${prefix_native}/bin', 'BUILD_PREFIX': '', 'HOM=
E': '/home/DRESEARCH/sledz', 'ANGSTROM_BINUTILS_VERSION_armv7a': '2.18.50.0=
.7', 'PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc': 'gcc-cross', 'PREFER=
RED_VERSION_jamvm-initial': '1.4.5', 'COMBINED_FEATURES': '${@base_both_con=
tain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} ${@base_both_contai=
n("DISTRO_FEATURES", "MACHINE_FEATURES", "bluetooth", d)} ${@base_both_cont=
ain("DISTRO_FEATURES", "MACHINE_FEATURES", "ext2", d)} ${@base_both_contain=
("DISTRO_FEATURES", "MACHINE_FEATURES", "vfat", d)} ${@base_both_contain("D=
ISTRO_FEATURES", "MACHINE_FEATURES", "irda", d)} ${@base_both_contain("DIST=
RO_FEATURES", "MACHINE_FEATURES", "pcmcia", d)} ${@base_both_contain("DISTR=
O_FEATURES", "MACHINE_FEATURES", "pci", d)} ${@base_both_contain("DISTRO_FE=
ATURES", "MACHINE_FEATURES", "usbgadget", d)} ${@base_both_contain("DISTRO_=
FEATURES", "MACHINE_FEATURES", "usbhost", d)} ${@base_both_contain("DISTRO_=
FEATURES", "MACHINE_FEATURES", "wifi", d)} ${@base_ifelse( base_contains(\'=
DISTRO_FEATURES\', (\'pci\', \'wifi\', \'madwifi\'), True, False, d) and ba=
se_contains(\'MACHINE_FEATURES\', \'pci\', True, False, d), \'madwifi\', \'=
\')} ${@base_ifelse( base_contains(\'DISTRO_FEATURES\', (\'wifi\', \'hostap=
\'), True, False, d) and ((base_contains(\'MACHINE_FEATURES\', \'pci\', Tru=
e, False, d) and base_contains(\'DISTRO_FEATURES\', \'pci\', True, False, d=
)) or (base_contains(\'MACHINE_FEATURES\', \'pcmcia\', True, False, d) and =
base_contains(\'DISTRO_FEATURES\', \'pcmcia\', True, False, d))), \'hostap\=
', \'\')}', 'do_package_stage_all': '\t:\n', 'FULL_OPTIMIZATION': '-fexpens=
ive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2', 'PRE=
FERRED_VERSION_qte': '${QTE_VERSION}', 'PREFERRED_VERSION_libtool-native': =
'2.2.6b', 'PREFERRED_VERSION_opie-suspendapplet': '${OPIE_VERSION}', 'popul=
ate_sysroot_prehook': '    bb.build.exec_func("populate_sysroot_preamble", =
d)\n', 'SRCDATE': '${DATE}', 'SEPPUKU_PASS': None, 'PREFERRED_VERSION_opie-=
cardapplet': '${OPIE_VERSION}', 'TINDER_HOST': 'ewi546.ewi.utwente.nl', 'PR=
EFERRED_VERSION_opie-recorder': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-=
style-flat': '${OPIE_VERSION}', 'TARGET_CC_ARCH': '-march=3Darmv5te -mtune=
=3Darm926ej-s', 'ROOT_FLASH_SIZE': '256', 'SHELLRCCMD': 'bash --rcfile $TER=
MRCFILE', 'HOST_ARCH': '${TARGET_ARCH}', 'ENABLE_BINARY_LOCALE_GENERATION':=
 '0', 'base_do_setscene': '        for f in (bb.data.getVar(\'SCENEFUNCS\',=
 d, 1) or \'\').split():\n                bb.build.exec_func(f, d)\n\tif no=
t os.path.exists(bb.data.getVar(\'STAMP\', d, 1) + ".do_setscene"):\n\t\tbb=
.build.make_stamp("do_setscene", d)\n', 'TARGET_OS': "linux${@['','-gnueabi=
'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}", 'PREFERRED_VER=
SION_dropbear': '0.51', 'PREFERRED_VERSION_opie-style-liquid': '${OPIE_VERS=
ION}', 'SOURCE_MIRROR_URL': None, 'SOLIBS_darwin8': '.*.dylib', 'SOLIBS_dar=
win9': '.*.dylib', 'PREFERRED_VERSION_u-boot': '2009.03', 'PREFERRED_PROVID=
ER_qt4-x11-free': 'qt4-x11-free', 'PREFERRED_VERSION_opie-batteryapplet': '=
${OPIE_VERSION}', 'PREFERRED_PROVIDER_gdk-pixbuf-loader-gif': 'gtk+', 'PSTA=
GE_INSTALL_CMD': '${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -force-depen=
ds -o ${TMPDIR} install', 'PREFERRED_VERSION_opie-wellenreiter': '${OPIE_VE=
RSION}', 'PREFERRED_VERSION_opie-style-metal': '${OPIE_VERSION}', 'MKTEMPCM=
D': 'mktemp -q ${TMPBASE}', 'FILES_${PN}': '${bindir}/* ${sbindir}/* ${libe=
xecdir}/* ${libdir}/lib*${SOLIBS} ${sysconfdir} ${sharedstatedir} ${localst=
atedir} ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*${SOLIBS} ${data=
dir}/${PN} ${libdir}/${PN}/* ${datadir}/pixmaps ${datadir}/applications ${d=
atadir}/idl ${datadir}/omf ${datadir}/sounds ${libdir}/bonobo/servers', 'PR=
EFERRED_VERSION_opie-rdesktop': '${OPIE_VERSION}', 'IMAGE_DEPENDS_squashfs-=
lzma': 'squashfs-tools-native', 'SDK_LDFLAGS': '-L${STAGING_DIR_SDK}${libdi=
r} -Wl,-rpath-link,${STAGING_DIR_SDK}${libdir} -Wl,-O1', 'PATCHRESOLVE': 'n=
oop', 'PREFERRED_VERSION_opie-quicklauncher': '${OPIE_VERSION}', 'do_fetch'=
: "\tbb.build.exec_func('base_do_fetch', d)\n", 'ASSUME_PROVIDED': 'bc-nati=
ve bzip2-native cvs-native diffstat-native patch-native perl-native-runtime=
 python-native-runtime svn-native texinfo-native util-linux-native ', 'insa=
ne_do_package': "\tbb.build.exec_func('package_do_package', d)\n", 'PREFERR=
ED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial': 'gcc-cross-initial', 'PRE=
FERRED_VERSION_opie-multikeyapplet': '${OPIE_VERSION}', 'TARGET_FPU_armv6':=
 'hard', 'DISTRO_NAME': 'Angstrom', 'layout_prefix': '${prefix}', 'FREEBSD_=
MIRROR': 'ftp://ftp.freebsd.org/pub/FreeBSD/', 'PREFERRED_VERSION_binutils-=
cross': '${ANGSTROM_BINUTILS_VERSION}', 'PREFERRED_PROVIDER_virtual/${TARGE=
T_PREFIX}binutils': 'binutils-cross', 'THUMB_INTERWORK': 'yes', 'SRCREV_pn-=
twitter-glib': '849bec29292df88590e0b2898b50b9b8d766817e', 'PREFERRED_VERSI=
ON_qt4-embedded-gles': '${ANGSTROM_QT_VERSION}', 'check_sanity_eventhandler=
': '    if isinstance(e, bb.event.BuildStarted):\n        check_sanity(e)\n=
', 'PREFERRED_VERSION_opie-wordgame': '${OPIE_VERSION}', 'SYSROOTEXTRALIBDI=
RSED': '', 'DISTRO_EXTRA_RRECOMMENDS': '  kernel-module-vfat kernel-module-=
ext2 kernel-module-ext3 kernel-module-af-packet avahi-daemon avahi-autoipd =
openssh-sftp-server ${DEBUG_APPS} ', 'TINDER_BRANCH': 'org.openembedded.dev=
', 'PREFERRED_VERSION_opie-vtapplet': '${OPIE_VERSION}', 'PKGD': '${WORKDIR=
}/package', 'HOST_SYS': '${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}', 'populate_=
sysroot_posthook': '    bb.build.exec_func("populate_sysroot_postamble", d)=
\n', 'PREFERRED_VERSION_libgemwidget': '1.0', 'PREFERRED_VERSION_libqpe-opi=
e': '${OPIE_VERSION}', 'PKGV': '${PV}', 'base_do_compile': '\tif [ -e Makef=
ile -o -e makefile -o -e GNUmakefile ]; then\n\t\toe_runmake || die "make f=
ailed"\n\telse\n\t\toenote "nothing to compile"\n\tfi\n', 'TARGET_CPPFLAGS'=
: '-isystem${STAGING_DIR_TARGET}${includedir}', 'PCMCIA_MANAGER': 'pcmciaut=
ils', 'PREFERRED_VERSION_ti-dmai-apps': '2_10_00_01+svnr%', 'base_do_packag=
e': '\t:\n', 'PREFERRED_VERSION_ti-biosutils': '1_02_02', 'PREFERRED_PROVID=
ER_opkg': 'opkg', 'PREFERRED_VERSION_glibmm': '2.24.0', 'FILE': 'conf/bitba=
ke.conf', 'do_checkuri': '\timport sys\n\n\tlocaldata =3D bb.data.createCop=
y(d)\n\tbb.data.update_data(localdata)\n\n\tsrc_uri =3D bb.data.getVar(\'SR=
C_URI\', localdata, 1)\n\n\ttry:\n\t\tbb.fetch.init(src_uri.split(),d)\n\te=
xcept bb.fetch.NoMethodError:\n\t\t(type, value, traceback) =3D sys.exc_inf=
o()\n\t\traise bb.build.FuncFailed("No method: %s" % value)\n\n\ttry:\n\t\t=
bb.fetch.checkstatus(localdata)\n\texcept bb.fetch.MissingParameterError:\n=
\t\t(type, value, traceback) =3D sys.exc_info()\n\t\traise bb.build.FuncFai=
led("Missing parameters: %s" % value)\n\texcept bb.fetch.FetchError:\n\t\t(=
type, value, traceback) =3D sys.exc_info()\n\t\traise bb.build.FuncFailed("=
Fetch failed: %s" % value)\n\texcept bb.fetch.MD5SumError:\n\t\t(type, valu=
e, traceback) =3D sys.exc_info()\n\t\traise bb.build.FuncFailed("MD5  faile=
d: %s" % value)\n\texcept:\n\t\t(type, value, traceback) =3D sys.exc_info()=
\n\t\traise bb.build.FuncFailed("Unknown fetch Error: %s" % value)\n', 'EXT=
ENDPKGEVER': "${@['','${PKGE\\x7d:'][bb.data.getVar('PKGE',d,1) > 0]}", 'li=
bdir_native': '${prefix_native}/lib', 'PREFERRED_PROVIDER_dbus-glib': 'dbus=
-glib', 'layout_includedir': '${includedir}', 'oewarn': '\techo "WARNING:" =
"$*"\n', 'BBFILE_PATTERN_local': '^${OE_HOME}/hipox/recipes/', 'PREFERRED_V=
ERSION_binutils': '${ANGSTROM_BINUTILS_VERSION}', 'BBMASK': "${@base_condit=
ional('ENTERPRISE_DISTRO', '1', base_conditional('OLDBBMASK', '', '', '(${O=
LDBBMASK})|', d) + '(mp3blaster|mpg123|mpg321|smpeg|liba52|lame|libmad|mpeg=
2dec|xmms-mad|madplay|python-mad|opie-mediaplayer1-libmadplugin|ffmpeg|mpla=
yer)', '${OLDBBMASK}', d)}", 'FEED_ARCH_bfin': 'blackfin', 'oe_soinstall': =
"\t# Purpose: Install shared library file and\n\t#          create the nece=
ssary links\n\t# Example:\n\t#\n\t# oe_\n\t#\n\t#oenote installing shared l=
ibrary $1 to $2\n\t#\n\tlibname=3D`basename $1`\n\tinstall -m 755 $1 $2/$li=
bname\n\tsonamelink=3D`${HOST_PREFIX}readelf -d $1 |grep 'Library soname:' =
|sed -e 's/.*\\[\\(.*\\)\\].*/\\1/'`\n\tsolink=3D`echo $libname | sed -e 's=
/\\.so\\..*/.so/'`\n\tln -sf $libname $2/$sonamelink\n\tln -sf $libname $2/=
$solink\n", 'PREFERRED_PROVIDER_bluez-utils-dbus': 'bluez-utils', 'SDKPATH'=
: '${SDK_PATH}', 'GROUP_locale': None, 'OPKG_SRCREV': '554', 'PREFERRED_VER=
SION_dbus': '1.2.24', 'FETCHCMD_cvs': '/usr/bin/env cvs', 'PREFERRED_PROVID=
ER_virtual/alsa-scenarios': 'fsodeviced', 'package_stagefile_shell': '\tif =
[ "$PSTAGING_ACTIVE" =3D "1" ]; then\n\t\tsrcfile=3D$1\n\t\tdestfile=3D`ech=
o $srcfile | sed s#${TMPDIR}#${PSTAGE_TMPDIR_STAGE}#`\n\t\tdestdir=3D`dirna=
me $destfile`\n\t\tmkdir -p $destdir\n\t\tcp -dp $srcfile $destfile\n\tfi\n=
', 'PREFERRED_VERSION_ti-codecs-dm355-server': '1_13_000', 'PREFERRED_PROVI=
DER_virtual/${TARGET_PREFIX}gcc-intermediate': 'gcc-cross-intermediate', 'l=
ayout_sbindir': '${sbindir}', 'GENTOO_MIRROR': 'http://distfiles.gentoo.org=
/distfiles', 'CO_DIR': '${DL_DIR}', 'bindir': '${exec_prefix}/bin', 'PREFER=
RED_VERSION_opie-alarm': '${OPIE_VERSION}', 'TARGET_VENDOR': '-angstrom', '=
TOOLCHAIN_BRAND': '', 'PREFERRED_VERSION_openjdk-6-jre': '6b18-1.8', 'PREFE=
RRED_VERSION_opie-autorotateapplet': '${OPIE_VERSION}', 'STAGING_INCDIR': '=
${STAGING_DIR_HOST}${includedir}', 'EXTRA_IMAGECMD_ubifs': '', 'BB_ENV_EXTR=
AWHITE': 'OE_HOME OE_ROOT', 'oefatal': '\techo "FATAL:" "$*"\n\texit 1\n', =
'exec_prefix': '/usr', 'PREFERRED_VERSION_pango-native': '1.24.4', 'SDK_EXE=
EXT': '', 'PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++': 'gcc-cross', 'P=
REFERRED_VERSION_opie-todo': '${OPIE_VERSION}', 'PREFERRED_VERSION_automake=
': '1.11.1', 'PREFERRED_VERSION_opie-screenshotapplet': '${OPIE_VERSION}', =
'PREFERRED_VERSION_opie-sh-snes': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_cl=
asspath': 'classpath', 'ANGSTROM_BLACKLIST_pn-libiconv': 'the glibc builtin=
 iconv replacement is used', 'PREFERRED_VERSION_opie-clock': '${OPIE_VERSIO=
N}', 'KERNEL_CCSUFFIX_archos5': '-4.2.1+csl-arm-2007q3-53', 'PREFERRED_VERS=
ION_opie-mediaplayer1': '${OPIE_VERSION}', 'FETCHCMD_svn': '/usr/bin/env sv=
n --non-interactive', 'PREFERRED_VERSION_opie-helpbrowser': '${OPIE_VERSION=
}', 'PSTAGE_PKGPATH': '${DISTRO}${PSTAGE_EXTRAPATH}', 'TERMCMDRUN': '${GNOM=
E_TERMCMDRUN}', 'PREFERRED_VERSION_openssl': '1.0.0a', 'PREFERRED_VERSION_o=
pie-mediaplayer2-skin-default': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_virt=
ual/kernel': 'linux', 'IPKGCONF_CANSDK': '${STAGING_ETCDIR_NATIVE}/opkg-can=
adian-sdk.conf', 'DEPENDS_virtclass-nativesdk': None, 'PSTAGE_LIST_CMD': '$=
{PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -o ${TMPDIR} list_installed', '=
PREFERRED_VERSION_pkgconfig': '0.23', 'CCLD': '${CC}', 'SRCREV_pn-xf86-vide=
o-psb': 'b6b3bba06fe5a3fe0b1bd6e31a7369dd83812bab', 'PREFERRED_VERSION_gcc'=
: '${ANGSTROM_GCC_VERSION}', 'SELECTED_OPTIMIZATION': "${@bb.data.getVar(['=
FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, =
1) =3D=3D '1'], d, 1)}", 'KERNEL': 'kernel26', 'PREFERRED_VERSION_opie-odic=
t': '${OPIE_VERSION}', 'TARGET_FPU_arm': 'soft', 'DEBIAN_NAMES': '1', 'PREF=
ERRED_PROVIDER_qt4-embedded': 'qt4-embedded', 'PSTAGE_TMPDIR_STAGE': '${WOR=
KDIR}/staging-pkg', 'DEPCHAIN_POST': '-dev -dbg', 'QA_LOG': '1', 'PREFERRED=
_VERSION_ti-lpm-module': '1_24_01', 'SRCREV_pn-json-glib': '930fdf4c4dff1f5=
310a946c2a9f5b6860f7c8ba8', 'PREFERRED_VERSION_opie-aboutapplet': '${OPIE_V=
ERSION}', 'LDFLAGS_pn-libgupnp': '-pg ', 'IMAGE_NAME': '${DISTRO_NAME}-${IM=
AGE_BASENAME}-${LIBC}-${ANGSTROM_PKG_FORMAT}-${DISTRO_VERSION}-${MACHINE}',=
 'PREFERRED_VERSION_opie-light-and-power': '${OPIE_VERSION}', 'PREFERRED_VE=
RSION_ti-codecs_omapl138': '1_00_00', 'GROUP_packaging': None, 'PREFERRED_V=
ERSION_ti-codecs_omapl137': '1_00_00', 'PREFERRED_VERSION_qt4-embedded': '$=
{ANGSTROM_QT_VERSION}', 'OVERRIDES': 'local:${MACHINE}:${DISTRO}:${TARGET_O=
S}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:${FEED_ARCH}:${SOC_F=
AMILY}:libc-glibc', 'TARGET_FPU_ppc405': 'soft', 'INHERIT': ' devshell src_=
distribute_local debian sanity angstrom devshell angstrom-mirrors insane re=
cipe_sanity testlab package_ipk sanity', 'ANGSTROM_GCC_VERSION_armv4': '4.4=
.2', 'PREFERRED_VERSION_gtk+-native': '2.20.1', 'SDK_SYS': "${SDK_ARCH}${SD=
K_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), ''][bb.data.getVar('SDK_=
OS', d, 1) =3D=3D ('' or 'custom')]}", 'PREFERRED_VERSION_libgpephone': '0.=
4', 'IMAGE_CMD_ext2': 'genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEP=
LOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}', 'IMAGE_CMD_ext=
3': 'genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${I=
MAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.ext3', 'ASSUME_SHLIBS': None, 'base_libdir': '${base_pre=
fix}/lib', 'FETCHCMD_wget': '/usr/bin/env wget -t 5 --no-check-certificate'=
, 'STAGING_IDLDIR': '${STAGING_DATADIR}/idl', 'UBOOT_ENTRYPOINT': '0x480080=
00', 'PREFERRED_PROVIDER_xserver': 'xserver-xorg', 'oe_libinstall': '\t# Pu=
rpose: Install a library, in all its forms\n\t# Example\n\t#\n\t# oe_libins=
tall libltdl ${STAGING_LIBDIR}/\n\t# oe_libinstall -C src/libblah libblah $=
{D}/${libdir}/\n\tdir=3D""\n\tlibtool=3D""\n\tsilent=3D""\n\trequire_static=
=3D""\n\trequire_shared=3D""\n\tstaging_install=3D""\n\twhile [ "$#" -gt 0 =
]; do\n\t\tcase "$1" in\n\t\t-C)\n\t\t\tshift\n\t\t\tdir=3D"$1"\n\t\t\t;;\n=
\t\t-s)\n\t\t\tsilent=3D1\n\t\t\t;;\n\t\t-a)\n\t\t\trequire_static=3D1\n\t\=
t\t;;\n\t\t-so)\n\t\t\trequire_shared=3D1\n\t\t\t;;\n\t\t-*)\n\t\t\toefatal=
 "oe_libinstall: unknown option: $1"\n\t\t\t;;\n\t\t*)\n\t\t\tbreak;\n\t\t\=
t;;\n\t\tesac\n\t\tshift\n\tdone\n\n\tlibname=3D"$1"\n\tshift\n\tdestpath=
=3D"$1"\n\tif [ -z "$destpath" ]; then\n\t\toefatal "oe_libinstall: no dest=
ination path specified"\n\tfi\n\tif echo "$destpath/" | egrep \'^${STAGING_=
LIBDIR}/\' >/dev/null\n\tthen\n\t\tstaging_install=3D1\n\tfi\n\n\t__runcmd =
() {\n\t\tif [ -z "$silent" ]; then\n\t\t\techo >&2 "oe_libinstall: $*"\n\t=
\tfi\n\t\t$*\n\t}\n\n\tif [ -z "$dir" ]; then\n\t\tdir=3D`pwd`\n\tfi\n\n\td=
otlai=3D$libname.lai\n\n\t# Sanity check that the libname.lai is unique\n\t=
number_of_files=3D`(cd $dir; find . -name "$dotlai") | wc -l`\n\tif [ $numb=
er_of_files -gt 1 ]; then\n\t\toefatal "oe_libinstall: $dotlai is not uniqu=
e in $dir"\n\tfi\n\n\n\tdir=3D$dir`(cd $dir;find . -name "$dotlai") | sed "=
s/^\\.//;s/\\/$dotlai\\$//;q"`\n\tolddir=3D`pwd`\n\t__runcmd cd $dir\n\n\tl=
afile=3D$libname.la\n\n\t# If such file doesn\'t exist, try to cut version =
suffix\n\tif [ ! -f "$lafile" ]; then\n\t\tlibname1=3D`echo "$libname" | se=
d \'s/-[0-9.]*$//\'`\n\t\tlafile1=3D$libname.la\n\t\tif [ -f "$lafile1" ]; =
then\n\t\t\tlibname=3D$libname1\n\t\t\tlafile=3D$lafile1\n\t\tfi\n\tfi\n\n\=
tif [ -f "$lafile" ]; then\n\t\t# libtool archive\n\t\teval `cat $lafile|gr=
ep "^library_names=3D"`\n\t\tlibtool=3D1\n\telse\n\t\tlibrary_names=3D"$lib=
name.so* $libname.dll.a"\n\tfi\n\n\t__runcmd install -d $destpath/\n\tdota=
=3D$libname.a\n\tif [ -f "$dota" -o -n "$require_static" ]; then\n\t\t__run=
cmd install -m 0644 $dota $destpath/\n\tfi\n\tif [ -f "$dotlai" -a -n "$lib=
tool" ]; then\n\t\tif test -n "$staging_install"\n\t\tthen\n\t\t\t# stop li=
btool using the final directory name for libraries\n\t\t\t# in staging:\n\t=
\t\t__runcmd rm -f $destpath/$libname.la\n\t\t\t__runcmd sed -e \'s/^instal=
led=3Dyes$/installed=3Dno/\' \\\n\t\t\t\t     -e \'/^dependency_libs=3D/s,$=
{WORKDIR}[[:alnum:]/\\._+-]*/\\([[:alnum:]\\._+-]*\\),${STAGING_LIBDIR}/\\1=
,g\' \\\n\t\t\t\t     -e "/^dependency_libs=3D/s,\\([[:space:]\']\\)${libdi=
r},\\1${STAGING_LIBDIR},g" \\\n\t\t\t\t     $dotlai >$destpath/$libname.la\=
n\t\telse\n\t\t\t__runcmd install -m 0644 $dotlai $destpath/$libname.la\n\t=
\tfi\n\tfi\n\n\tfor name in $library_names; do\n\t\tfiles=3D`eval echo $nam=
e`\n\t\tfor f in $files; do\n\t\t\tif [ ! -e "$f" ]; then\n\t\t\t\tif [ -n =
"$libtool" ]; then\n\t\t\t\t\toefatal "oe_libinstall: $dir/$f not found."\n=
\t\t\t\tfi\n\t\t\telif [ -L "$f" ]; then\n\t\t\t\t__runcmd cp -P "$f" $dest=
path/\n\t\t\telif [ ! -L "$f" ]; then\n\t\t\t\tlibfile=3D"$f"\n\t\t\t\t__ru=
ncmd install -m 0755 $libfile $destpath/\n\t\t\tfi\n\t\tdone\n\tdone\n\n\ti=
f [ -z "$libfile" ]; then\n\t\tif  [ -n "$require_shared" ]; then\n\t\t\toe=
fatal "oe_libinstall: unable to locate shared library"\n\t\tfi\n\telif [ -z=
 "$libtool" ]; then\n\t\t# special case hack for non-libtool .so.#.#.# link=
s\n\t\tbaselibfile=3D`basename "$libfile"`\n\t\tif (echo $baselibfile | gre=
p -qE \'^lib.*\\.so\\.[0-9.]*$\'); then\n\t\t\tsonamelink=3D`${HOST_PREFIX}=
readelf -d $libfile |grep \'Library soname:\' |sed -e \'s/.*\\[\\(.*\\)\\].=
*/\\1/\'`\n\t\t\tsolink=3D`echo $baselibfile | sed -e \'s/\\.so\\..*/.so/\'=
`\n\t\t\tif [ -n "$sonamelink" -a x"$baselibfile" !=3D x"$sonamelink" ]; th=
en\n\t\t\t\t__runcmd ln -sf $baselibfile $destpath/$sonamelink\n\t\t\tfi\n\=
t\t\t__runcmd ln -sf $baselibfile $destpath/$solink\n\t\tfi\n\tfi\n\n\t__ru=
ncmd cd "$olddir"\n', 'SCENEFUNCS': ' packagestage_scenefunc base_scenefunc=
tion', 'BPN': "${@base_prune_suffix('${PN}', '${SPECIAL_PKGSUFFIX}'.split()=
, d)}", 'LOGNAME': 'sledz', 'PATH': '/opt/bitbake/bin:/opt/avr/bin/:/opt/av=
r/bin/:/home/DRESEARCH/sledz/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:=
/usr/X11R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:=
/opt/gnome/bin:/usr/lib/qt3/bin:/usr/sbin:/sbin:/usr/sbin:/sbin', 'PREFERRE=
D_PROVIDER_gnome-vfs-plugin-file': 'gnome-vfs', 'PREFERRED_VERSION_opie-app=
earance': '${OPIE_VERSION}', 'TARGET_CFLAGS': '${TARGET_CPPFLAGS} ${SELECTE=
D_OPTIMIZATION}', 'base_bindir': '${base_prefix}/bin', 'layout_sharedstated=
ir': '${sharedstatedir}', 'PREFERRED_VERSION_jamvm': '1.5.2', 'IMAGE_CMD_ex=
t3.bz2': 'install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${ROOTFS_SI=
ZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext=
3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.r=
ootfs.ext3; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ex=
t3; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3.bz2 ${DEPLOY_D=
IR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.bz2', 'layout_infodir': '${infodir}', '=
PREFERRED_VERSION_opie-backgammon': '${OPIE_VERSION}', 'ARM_INSTRUCTION_SET=
_pn-uclibc': 'arm', 'IMAGE_CMD_yaffs2': 'mkyaffs2image ${EXTRA_IMAGECMD} ${=
IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2', 'IMAGE_DEPE=
NDS_cramfs': 'cramfs-native', 'SEPPUKU_COMPONENT': 'org.openembedded.dev', =
'MACHINE': 'hipox', 'GITDIR': '${CO_DIR}/git', 'do_package_qa': '    bb.deb=
ug(2, "DO PACKAGE QA")\n    pkgdest =3D bb.data.getVar(\'PKGDEST\', d, True=
)\n    packages =3D bb.data.getVar(\'PACKAGES\',d, True)\n\n    # no packag=
es should be scanned\n    if not packages:\n        return\n\n    checks =
=3D [package_qa_check_rpath, package_qa_check_dev,\n              package_q=
a_check_perm, package_qa_check_arch,\n              package_qa_check_deskto=
p, package_qa_hash_style,\n              package_qa_check_dbg]\n    walk_sa=
ne =3D True\n    rdepends_sane =3D True\n    for package in packages.split(=
):\n        if bb.data.getVar(\'INSANE_SKIP_\' + package, d, True):\n      =
      bb.note("package %s skipped" % package)\n            continue\n\n    =
    bb.debug(1, "Checking Package: %s" % package)\n        path =3D "%s/%s"=
 % (pkgdest, package)\n        if not package_qa_walk(path, checks, package=
, d):\n            walk_sane  =3D False\n        if not package_qa_check_rd=
epends(package, pkgdest, d):\n            rdepends_sane =3D False\n\n    if=
 not walk_sane or not rdepends_sane:\n        bb.fatal("QA run found fatal =
errors. Please consider fixing them.")\n    bb.debug(2, "DONE with PACKAGE =
QA")\n', 'prefix_native': '/usr', 'SECTION_${PN}-dev': 'devel', 'base_sbind=
ir_native': '/sbin', 'STAGING_DATADIR_JAVA': '${STAGING_DIR_JAVA}', 'sbindi=
r': '${exec_prefix}/sbin', 'PREFERRED_VERSION_opie-taskbar': '${OPIE_VERSIO=
N}', 'CFLAGS': '${TARGET_CFLAGS}', 'PREFERRED_VERSION_opie-showimg': '${OPI=
E_VERSION}', 'BUILD_AR': '${BUILD_PREFIX}ar', 'AUTO_LIBNAME_PKGS': '${PACKA=
GES}', 'PREFERRED_VERSION_wpa-supplicant': '0.6.9', 'layout_base_libdir': '=
${base_libdir}', 'PREFERRED_PROVIDER_virtual/libqpe1': 'libqpe-opie', 'IPKG=
_VARIANT': 'opkg angstrom-version ${ANGSTROM_FEED_CONFIGS}', 'SHLIBSDIR': '=
${STAGING_DIR_HOST}/shlibs', 'sharedstatedir': '${base_prefix}/com', 'PREFE=
RRED_VERSION_ti-dsplink': '1_64', 'DEBIAN_MIRROR': 'ftp://ftp.debian.org/de=
bian/pool', 'PREFERRED_PROVIDER_virtual/libc': 'glibc', 'DEFAULT_TASK_PROVI=
DER': 'task-base', 'PREFERRED_VERSION_opie-sheet': '${OPIE_VERSION}', '__BB=
TASKS': ['do_patch', 'do_populate_sysroot', 'do_package_stage', 'do_package=
_stage_all', 'do_listtasks', 'do_clean', 'do_cleanall', 'do_rebuild', 'do_d=
istclean', 'do_checkuri', 'do_checkuriall', 'do_fetchall', 'do_buildall', '=
do_setscene', 'do_fetch', 'do_unpack', 'do_configure', 'do_compile', 'do_in=
stall', 'do_build', 'do_devshell', 'do_distribute_sources', 'do_distribute_=
sources_all', 'do_distsrcall', 'do_package', 'do_package_write', 'do_qa_sta=
ging', 'do_qa_configure', 'do_recipe_sanity', 'do_recipe_sanity_all', 'do_p=
ackage_write_ipk', 'do_package_update_index_ipk'], 'F77': '${CCACHE}${HOST_=
PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}', 'PREFERRED_VERSION_ti-cgt6=
x': '6_1_9', 'PREFERRED_VERSION_opie-volumeapplet': '${OPIE_VERSION}', 'KER=
NEL_IMAGETYPE': 'uImage', 'IMAGE_LINGUAS': '${@base_less_or_equal("ROOT_FLA=
SH_SIZE", "16", "", "en-us", d)}', 'PREFERRED_VERSION_opie-multikey': '${OP=
IE_VERSION}', 'ENABLE_BINARY_LOCALE_GENERATION_ep9312': '0', 'PARALLEL_MAKE=
': '-j 4', 'PREFERRED_VERSION_opie-examples': '${OPIE_VERSION}', 'STAGING_D=
IR_JAVA': '${STAGING_DIR}/java', 'PREFERRED_PROVIDER_hostap-modules_hx4700'=
: 'hostap-modules', 'PREFERRED_VERSION_linux-libc-headers': '${LINUX_LIBC_H=
EADERS_VERSION}', 'EFL_SRCREV': '52678', 'PN': "${@bb.parse.BBHandler.vars_=
from_file('${FILE}', d)[0] or 'defaultpkgname'}", 'OBJDUMP': '${HOST_PREFIX=
}objdump', 'IMAGE_BASENAME': '${PN}', 'PATCHTOOL': 'quilt', 'XORG_MIRROR': =
'http://xorg.freedesktop.org/releases', 'SYSROOT_DESTDIR': '${WORKDIR}/sysr=
oot-destdir/', 'PREFERRED_VERSION_opie-calibrate': '${OPIE_VERSION}', 'TIND=
ER_LOG': '${TMPDIR}/tinder.log', 'PREFERRED_VERSION_opie-pimconverter': '${=
OPIE_VERSION}', 'SPECIAL_PKGSUFFIX': '-native -cross -initial -intermediate=
 -nativesdk -crosssdk -cross-canadian -sdk', 'BUILD_EXEEXT': '', 'PREFERRED=
_VERSION_opie-homeapplet': '${OPIE_VERSION}', 'SRC_DISTRIBUTECOMMAND-symlin=
k': '    test -e "${SRC}.md5" && ln -sf "${SRC}.md5" .\n    ln -sf "${SRC}"=
 .\n', 'DL_DIR': '${HOME}/sources', 'PREFERRED_PROVIDER_gpsd': 'gpsd', 'EXE=
EXT': '${HOST_EXEEXT}', 'PR': "${@bb.parse.BBHandler.vars_from_file('${FILE=
}', d)[2] or 'r0'}", 'PV': "${@bb.parse.BBHandler.vars_from_file('${FILE}',=
 d)[1] or '1.0'}", 'SOLIBSDEV': '.so', 'PSTAGE_PKGNAME': '${PSTAGE_PKGPN}_$=
{PSTAGE_PKGVERSION}_${PSTAGE_PKGARCH}.ipk', 'PREFERRED_VERSION_myththemes':=
 '0.22', 'SDK_PREFIX': '${SDK_SYS}-', 'PKGDEST': '${WORKDIR}/packages-split=
', '__anonymous': None, 'PF': '${PN}-${EXTENDPE}${PV}-${PR}', 'STAGING_BIND=
IR_NATIVE': '${STAGING_DIR_NATIVE}${bindir_native}', 'PE': '0', 'PSTAGE_REM=
OVE_CMD': '${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -force-depends -o $=
{TMPDIR} remove', 'PREFERRED_VERSION_ti-dm365mm-module': '1_0_3', 'DISTRO':=
 'angstrom', 'TARGET_FPU_armeb': 'soft', 'PREFERRED_VERSION_opie-tableviewe=
r': '${OPIE_VERSION}', 'PREFERRED_VERSION_autoconf': '2.65', 'DISTRO_VERSIO=
N': '2010.7-test-${DATE}', 'S': '${WORKDIR}/${BP}', 'PREFERRED_VERSION_mesa=
-xlib': '7.6', 'sysroot_stage_all': '\tsysroot_stage_dirs ${D} ${SYSROOT_DE=
STDIR}\n', 'STAGING_KERNEL_DIR': '${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ke=
rnel', 'PREFERRED_VERSION_opie-zlines': '${OPIE_VERSION}', 'PREFERRED_PROVI=
DER_linux-libc-headers': 'linux-libc-headers', 'layout_localstatedir': '${l=
ocalstatedir}', 'QEMU_OPTIONS_armv7a': '-cpu cortex-a8', 'ADOBE_MIRROR': 'h=
ttp://fpdownload.macromedia.com/get/flashplayer/current/', 'PREFERRED_VERSI=
ON_opie-memoryapplet': '${OPIE_VERSION}', 'PKG_CONFIG_DIR': '${STAGING_DIR}=
/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}${libdir}/pkgconfig', 'PR=
EFERRED_VERSION_udev': '141', 'SRCREV': '1', 'SRCREV_pn-bickley': 'de9431b7=
c6040bc3731157c05947159ad2c7a0a9', 'PREFERRED_VERSION_opie-irc': '${OPIE_VE=
RSION}', 'do_package': "\tbb.build.exec_func('insane_do_package', d)\n", 'T=
ARGET_SYS': "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET=
_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) =3D=3D ('' or 'custom')]=
}", 'PREFERRED_VERSION_ti-codecs-dm365': '3_10_00_02', 'DEPLOY_DIR_TAR': '$=
{DEPLOY_DIR}/tar', 'EXTRA_IMAGECMD_jffs2': '', 'PKG_CONFIG_DISABLE_UNINSTAL=
LED': 'yes', 'BBFILE_PRIORITY_localcommon': '9', 'PREFERRED_VERSION_cairo':=
 '1.10.0', 'XSERVER': 'xserver-xorg xf86-input-evdev xf86-input-keyboard xf=
86-input-mouse xf86-video-fbdev', 'PREFERRED_VERSION_opie-tetrix': '${OPIE_=
VERSION}', 'do_package_stage': '    if bb.data.getVar("PSTAGING_ACTIVE", d,=
 1) !=3D "1":\n        return\n\n    #\n    # Handle deploy/ packages\n    =
#\n    bb.build.exec_func("read_subpackage_metadata", d)\n    stagepath =3D=
 bb.data.getVar("PSTAGE_TMPDIR_STAGE", d, 1)\n    tmpdir =3D bb.data.getVar=
("TMPDIR", d, True)\n    packages =3D (bb.data.getVar(\'PACKAGES\', d, 1) o=
r "").split()\n    if len(packages) > 0:\n        if bb.data.inherits_class=
(\'package_ipk\', d):\n            ipkpath =3D bb.data.getVar(\'DEPLOY_DIR_=
IPK\', d, True).replace(tmpdir, stagepath)\n        if bb.data.inherits_cla=
ss(\'package_deb\', d):\n            debpath =3D bb.data.getVar(\'DEPLOY_DI=
R_DEB\', d, True).replace(tmpdir, stagepath)\n        if bb.data.inherits_c=
lass(\'package_rpm\', d):\n            rpmpath =3D bb.data.getVar(\'DEPLOY_=
DIR_RPM\', d, True).replace(tmpdir, stagepath)\n\n        for pkg in packag=
es:\n            pkgname =3D bb.data.getVar(\'PKG_%s\' % pkg, d, 1)\n      =
      if not pkgname:\n                pkgname =3D pkg\n            arch =
=3D bb.data.getVar(\'PACKAGE_ARCH_%s\' % pkg, d, 1)\n            if not arc=
h:\n                arch =3D bb.data.getVar(\'PACKAGE_ARCH\', d, 1)\n      =
      pr =3D bb.data.getVar(\'PR_%s\' % pkg, d, 1)\n            if not pr:\=
n                pr =3D bb.data.getVar(\'PR\', d, 1)\n            if not pa=
ckaged(pkg, d):\n                continue\n            if bb.data.inherits_=
class(\'package_ipk\', d):\n                srcname =3D bb.data.expand(pkgn=
ame + "_${PKGV}-" + pr + "${DISTRO_PR}" + "_" + arch + ".ipk", d)\n        =
        srcfile =3D bb.data.expand("${DEPLOY_DIR_IPK}/" + arch + "/" + srcn=
ame, d)\n                if os.path.exists(srcfile):\n                    d=
estpath =3D ipkpath + "/" + arch + "/"\n                    bb.mkdirhier(de=
stpath)\n                    bb.copyfile(srcfile, destpath + srcname)\n\n  =
          if bb.data.inherits_class(\'package_deb\', d):\n                i=
f arch =3D=3D \'all\':\n                    srcname =3D bb.data.expand(pkgn=
ame + "_${PV}-" + pr + "${DISTRO_PR}" + "_all.deb", d)\n                els=
e:\n                    srcname =3D bb.data.expand(pkgname + "_${PV}-" + pr=
 + "${DISTRO_PR}" + "_${DPKG_ARCH}.deb", d)\n                srcfile =3D bb=
.data.expand("${DEPLOY_DIR_DEB}/" + arch + "/" + srcname, d)\n             =
   if os.path.exists(srcfile):\n                    destpath =3D debpath + =
"/" + arch + "/"\n                    bb.mkdirhier(destpath)\n             =
       bb.copyfile(srcfile, destpath + srcname)\n\n            if bb.data.i=
nherits_class(\'package_rpm\', d):\n\t\tversion =3D bb.data.getVar(\'PV\', =
d, 1)\n\t\tversion =3D version.replace(\'-\', \'+\')\n\t\tbb.data.setVar(\'=
RPMPV\', version, d)\n                srcname =3D bb.data.expand(pkgname + =
"-${RPMPV}-" + pr + "${DISTRO_PR}" + ".${TARGET_ARCH}.rpm", d)\n           =
     srcfile =3D bb.data.expand("${DEPLOY_DIR_RPM}/" + arch + "/" + srcname=
, d)\n                if os.path.exists(srcfile):\n                    dest=
path =3D rpmpath + "/" + arch + "/"\n                    bb.mkdirhier(destp=
ath)\n                    bb.copyfile(srcfile, destpath + srcname)\n\n\n   =
 #\n    # Handle stamps/ files\n    #\n    stampfn =3D bb.data.getVar("STAM=
P", d, True)\n    destdir =3D os.path.dirname(stampfn.replace(tmpdir, stage=
path))\n    bb.mkdirhier(destdir)\n    # We need to include the package_sta=
ge stamp in the staging package so create one\n    bb.build.make_stamp("do_=
package_stage", d)\n    oe_run(d, "cp -dpR %s.do_* %s/" % (stampfn, destdir=
))\n\n    pstage_set_pkgmanager(d)\n    bb.build.exec_func("staging_helper"=
, d)\n    bb.build.exec_func("staging_packager", d)\n    lf =3D bb.utils.lo=
ckfile(bb.data.expand("${SYSROOT_LOCK}", d))\n    bb.build.exec_func("stagi=
ng_package_installer", d)\n    bb.utils.unlockfile(lf)\n', 'PREFERRED_VERSI=
ON_opie-sh': '${OPIE_VERSION}', 'libdir': '${exec_prefix}/lib', 'LINUX_LIBC=
_HEADERS_VERSION': '2.6.31', 'SPLASH': ' ${@base_contains("MACHINE_FEATURES=
", "screen", "psplash-angstrom", "",d)}', 'IMAGE_CMD_jffs2': 'mkfs.jffs2 -x=
 lzo --root=3D${IMAGE_ROOTFS} --faketime --output=3D${DEPLOY_DIR_IMAGE}/${I=
MAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}', 'layout_base_prefix': '${base_p=
refix}', 'ALLOW_EMPTY_${PN}-dev': '1', 'PREFERRED_VERSION_hal': '0.5.14', '=
SRC_DISTRIBUTE_DLONLY': '0', 'layout_mandir': '${mandir}', 'METADATA_BRANCH=
': '${@base_get_scm_branch(d)}', 'SYSROOT_PREPROCESS_FUNCS': '', 'PREFERRED=
_VERSION_tiff': '3.9.2+4.0.0beta5', 'PREFERRED_VERSION_opie-sysinfo': '${OP=
IE_VERSION}', 'SEPPUKU_ATTACHMENT': 'http://bugs.openembedded.net/attachmen=
t.cgi?', 'BB_DEFAULT_TASK': 'build', 'oe_import': '    if isinstance(e, bb.=
event.ConfigParsed):\n        import os, sys\n        bbpath =3D e.data.get=
Var("BBPATH", True).split(":")\n        sys.path[0:0] =3D [os.path.join(dir=
, "lib") for dir in bbpath]\n\n        def inject(name, value):\n          =
  """Make a python object accessible from the metadata"""\n            if h=
asattr(bb.utils, "_context"):\n                bb.utils._context[name] =3D =
value\n            else:\n                __builtins__[name] =3D value\n\n =
       for toimport in e.data.getVar("OE_IMPORTS", True).split():\n        =
    imported =3D __import__(toimport)\n            inject(toimport.split(".=
", 1)[0], imported)\n', 'PREFERRED_VERSION_opie-mail': '${OPIE_VERSION}', '=
PREFERRED_VERSION_opie-embeddedkonsole': '${OPIE_VERSION}', 'TOOLCHAIN_OPTI=
ONS': '', 'BB_NUMBER_THREADS': '4', 'PREFERRED_VERSION_opie-oxygen': '${OPI=
E_VERSION}', 'IMAGE_DEPENDS_ext3': 'genext2fs-native e2fsprogs-native', 'IM=
AGE_DEPENDS_ext2': 'genext2fs-native', 'PREFERRED_VERSION_opie-today-todoli=
stplugin': '${OPIE_VERSION}', 'PYTHON': '${@sys.executable}', 'CACHE': '/ho=
me/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/cache/glibc/hipox', 'PREFERRED_PRO=
VIDER_virtual/libx11': 'libx11', 'TARGET_PREFIX': '${TARGET_SYS}-', 'SRCPV'=
: '${@bb.fetch.get_srcrev(d)}', 'ANGSTROM_GCC_VERSION': '4.3.3', 'PREFERRED=
_VERSION_opie-eye': '${OPIE_VERSION}', 'do_unpack': "\tbb.build.exec_func('=
base_do_unpack', d)\n", 'PREFERRED_PROVIDER_gnome-vfs': 'gnome-vfs', '__rec=
ipe_sanity_reqvars': 'DESCRIPTION', 'PREFERRED_VERSION_opie-bounce': '${OPI=
E_VERSION}', 'PREFERRED_VERSION_libopieobex0': '${OPIE_VERSION}', 'PACKAGE_=
ARCHS': 'all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}', =
'PREFERRED_VERSION_lighttpd': '1.4.26', 'PREFERRED_VERSION_opie-sfcave': '$=
{OPIE_VERSION}', 'PACKAGE_ARCH': '${BASE_PACKAGE_ARCH}', 'BUILDNAME': 'Angs=
trom ${DISTRO_VERSION}', 'PREFERRED_VERSION_opie-pyquicklaunchapplet': '${O=
PIE_VERSION}', 'PREFERRED_PROVIDER_gdk-pixbuf-loader-ani': 'gtk+', 'do_inst=
all': '\tbase_do_install\n', 'PREFERRED_VERSION_network-manager-applet': '0=
.8.1', 'MACHINE_ESSENTIAL_EXTRA_RDEPENDS': '', 'PREFERRED_VERSION_opie-date=
book-birthdayplugin': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-securitypl=
ugin-pin': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-icon-reload': '${OPIE=
_VERSION}', 'ANGSTROM_ARM_INSTRUCTION_SET': 'arm', 'PREFERRED_VERSION_opie-=
qasteroids': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_bluez-utils': 'bluez4',=
 'METADATA_SCM': '${@base_get_scm(d)}', 'PREFERRED_VERSION_opie-securityplu=
gin-notice': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-style-fresh': '${OP=
IE_VERSION}', 'PACKAGEFUNCS': 'perform_packagecopy                 ${PACKAG=
E_PREPROCESS_FUNCS} \t\tpackage_do_split_locales \t\tpopulate_packages \t\t=
package_do_shlibs \t\tpackage_do_pkgconfig \t\tread_shlibdeps \t\tpackage_d=
epchains \t\temit_pkgdata  do_package_qa ', 'PREFERRED_VERSION_mesa-dri': '=
7.6', 'PWD': '/home/DRESEARCH/sledz/work/HydraIP/OE', 'BZRDIR': '${CO_DIR}/=
bzr', 'PREMIRRORS_append': None, 'oenote': '\techo "NOTE:" "$*"\n', 'GPE_SV=
N': 'svn://projects.linuxtogo.org/svn/gpe/trunk/base;module=3D${PN}', 'EXTR=
A_IMAGECMD_squashfs-lzma': '', 'IMAGE_DEPENDS_yaffs2': 'yaffs2-utils-native=
', 'do_package_write': '\t:\n', 'PREFERRED_PROVIDER_virtual/db-native': 'db=
-native', 'SOLIBS_darwin': '.*.dylib', 'PREFERRED_PROVIDER_virtual/db': 'db=
', 'BP': '${BPN}-${PV}', 'base_do_unpack': '    from glob import glob\n\n  =
  src_uri =3D d.getVar("SRC_URI", True)\n    if not src_uri:\n        retur=
n\n    srcurldata =3D bb.fetch.init(src_uri.split(), d, True)\n    filespat=
h =3D d.getVar("FILESPATH", True).split(":")\n\n    for url in src_uri.spli=
t():\n        urldata =3D srcurldata[url]\n        if urldata.type =3D=3D "=
file" and "*" in urldata.path:\n            # The fetch code doesn\'t know =
how to handle globs, so\n            # we need to handle the local bits our=
selves\n            for path in filespath:\n                srcdir =3D oe.p=
ath.join(path, urldata.host,\n                                      os.path=
.dirname(urldata.path))\n                if os.path.exists(srcdir):\n      =
              break\n            else:\n                bb.fatal("Unable to=
 locate files for %s" % url)\n\n            for filename in glob(oe.path.jo=
in(srcdir,\n                                              os.path.basename(=
urldata.path))):\n                oe_unpack(d, filename, urldata)\n        =
else:\n            local =3D urldata.localpath\n            if not local:\n=
                raise bb.build.FuncFailed(\'Unable to locate local file for=
 %s\' % url)\n\n            oe_unpack(d, local, urldata)\n', '__recipe_sani=
ty_reqdiffvars': 'LICENSE', 'recipe_sanity_eh': '    from bb.event import g=
etName\n\n    if getName(e) !=3D "ConfigParsed":\n        return\n\n    d =
=3D e.data\n\n    cfgdata =3D {}\n    for k in d.keys():\n    #for k in ["S=
", "PR", "PV", "PN", "DESCRIPTION", "LICENSE", "DEPENDS",\n    #          "=
SECTION"]:\n        cfgdata[k] =3D d.getVar(k, 0)\n\n    d.setVar("__recipe=
_sanity_cfgdata", cfgdata)\n    #d.setVar("__recipe_sanity_cfgdata", d)\n\n=
    # Sick, very sick..\n    from bb.data_smart import DataSmart\n    old =
=3D DataSmart.renameVar\n    def myrename(self, key, newkey):\n        oldv=
alue =3D self.getVar(newkey, 0)\n        old(self, key, newkey)\n        ne=
wvalue =3D self.getVar(newkey, 0)\n        if oldvalue:\n            rename=
s =3D self.getVar("__recipe_sanity_renames", 0) or set()\n            renam=
es.add((key, newkey, oldvalue, newvalue))\n            self.setVar("__recip=
e_sanity_renames", renames)\n    DataSmart.renameVar =3D myrename\n', 'PREF=
ERRED_VERSION_opie-mediaplayer2-skin-pod': '${OPIE_VERSION}', 'sysroot_stag=
e_dirs': '\tfrom=3D"$1"\n\tto=3D"$2"\n\n\tsysroot_stage_dir $from${included=
ir} $to${STAGING_INCDIR}\n\tif [ "${BUILD_SYS}" =3D "${HOST_SYS}" ]; then\n=
\t\tsysroot_stage_dir $from${bindir} $to${STAGING_DIR_HOST}${bindir}\n\t\ts=
ysroot_stage_dir $from${sbindir} $to${STAGING_DIR_HOST}${sbindir}\n\t\tsysr=
oot_stage_dir $from${base_bindir} $to${STAGING_DIR_HOST}${base_bindir}\n\t\=
tsysroot_stage_dir $from${base_sbindir} $to${STAGING_DIR_HOST}${base_sbindi=
r}\n\t\tsysroot_stage_dir $from${libexecdir} $to${STAGING_DIR_HOST}${libexe=
cdir}\n\t\tsysroot_stage_dir $from${sysconfdir} $to${STAGING_DIR_HOST}${sys=
confdir}\n\t\tif [ "${prefix}/lib" !=3D "${libdir}" ]; then\n\t\t\t# python=
 puts its files in here, make sure they are staged as well\n\t\t\tsysroot_s=
tage_dir $from/${prefix}/lib $to${STAGING_DIR_HOST}${prefix}/lib\n\t\tfi\n\=
tfi\n\tif [ -d $from${libdir} ]\n\tthen\n\t\tsysroot_stage_libdir $from/${l=
ibdir} $to${STAGING_LIBDIR}\n\tfi\n\tif [ -d $from${base_libdir} ]\n\tthen\=
n\t\tsysroot_stage_libdir $from${base_libdir} $to${STAGING_DIR_HOST}${base_=
libdir}\n\tfi\n\tsysroot_stage_dir $from${datadir} $to${STAGING_DATADIR}\n\=
tsysroot_stage_dir $from${sysconfdir} $to${STAGING_ETCDIR}\n', 'SHELL': '/b=
in/bash', 'do_clean_prepend': None, 'PREFERRED_VERSION_uclibc': '0.9.30.2',=
 'PREFERRED_VERSION_opie-pickboard': '${OPIE_VERSION}', 'DEPLOY_DIR': '${TM=
PDIR}/deploy/${LIBC}', 'TARGET_FPU_ixp4xx': 'soft', 'PREFERRED_VERSION_caca=
o': '0.99.3', 'FULL_OPTIMIZATION_sparc': '-fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2', 'palmqtdir': '${palmtopdir}', 'SOURC=
E_MIRROR_FETCH': None, 'ARM_THUMB_M_OPT': "${@['-mno-thumb', '-mthumb'][bb.=
data.getVar('ARM_INSTRUCTION_SET', d, 1) =3D=3D 'thumb']}", 'PREFERRED_PROV=
IDER_ntp': 'ntp', 'PREFERRED_VERSION_classpath-native': '0.98', 'TARGET_CC_=
ARCH_pn-webkit-gtk_armv5te': '-march=3Darmv4t', 'PSTAGE_EXTRAPATH': '${LIBC=
}', 'package_do_pkgconfig': '\timport re\n\n\tpackages =3D bb.data.getVar(\=
'PACKAGES\', d, True)\n\tworkdir =3D bb.data.getVar(\'WORKDIR\', d, True)\n=
\tpkgdest =3D bb.data.getVar(\'PKGDEST\', d, True)\n\n\tshlibs_dir =3D bb.d=
ata.getVar(\'SHLIBSDIR\', d, True)\n\tbb.mkdirhier(shlibs_dir)\n\n\tpc_re =
=3D re.compile(\'(.*)\\.pc$\')\n\tvar_re =3D re.compile(\'(.*)=3D(.*)\')\n\=
tfield_re =3D re.compile(\'(.*): (.*)\')\n\n\tpkgconfig_provided =3D {}\n\t=
pkgconfig_needed =3D {}\n\tfor pkg in packages.split():\n\t\tpkgconfig_prov=
ided[pkg] =3D []\n\t\tpkgconfig_needed[pkg] =3D []\n\t\ttop =3D os.path.joi=
n(pkgdest, pkg)\n\t\tfor root, dirs, files in os.walk(top):\n\t\t\tfor file=
 in files:\n\t\t\t\tm =3D pc_re.match(file)\n\t\t\t\tif m:\n\t\t\t\t\tpd =
=3D bb.data.init()\n\t\t\t\t\tname =3D m.group(1)\n\t\t\t\t\tpkgconfig_prov=
ided[pkg].append(name)\n\t\t\t\t\tpath =3D os.path.join(root, file)\n\t\t\t=
\t\tif not os.access(path, os.R_OK):\n\t\t\t\t\t\tcontinue\n\t\t\t\t\tf =3D=
 open(path, \'r\')\n\t\t\t\t\tlines =3D f.readlines()\n\t\t\t\t\tf.close()\=
n\t\t\t\t\tfor l in lines:\n\t\t\t\t\t\tm =3D var_re.match(l)\n\t\t\t\t\t\t=
if m:\n\t\t\t\t\t\t\tname =3D m.group(1)\n\t\t\t\t\t\t\tval =3D m.group(2)\=
n\t\t\t\t\t\t\tbb.data.setVar(name, bb.data.expand(val, pd), pd)\n\t\t\t\t\=
t\t\tcontinue\n\t\t\t\t\t\tm =3D field_re.match(l)\n\t\t\t\t\t\tif m:\n\t\t=
\t\t\t\t\thdr =3D m.group(1)\n\t\t\t\t\t\t\texp =3D bb.data.expand(m.group(=
2), pd)\n\t\t\t\t\t\t\tif hdr =3D=3D \'Requires\':\n\t\t\t\t\t\t\t\tpkgconf=
ig_needed[pkg] +=3D exp.replace(\',\', \' \').split()\n\n\tpstageactive =3D=
 bb.data.getVar(\'PSTAGING_ACTIVE\', d, True)\n\tif pstageactive =3D=3D "1"=
:\n\t\tlf =3D bb.utils.lockfile(bb.data.expand("${STAGING_DIR}/staging.lock=
", d))\n\n\tfor pkg in packages.split():\n\t\tpkgs_file =3D os.path.join(sh=
libs_dir, pkg + ".pclist")\n\t\tif os.path.exists(pkgs_file):\n\t\t\tos.rem=
ove(pkgs_file)\n\t\tif pkgconfig_provided[pkg] !=3D []:\n\t\t\tf =3D open(p=
kgs_file, \'w\')\n\t\t\tfor p in pkgconfig_provided[pkg]:\n\t\t\t\tf.write(=
\'%s\\n\' % p)\n\t\t\tf.close()\n\t\t\tpackage_stagefile(pkgs_file, d)\n\n\=
tfor dir in [shlibs_dir]:\n\t\tif not os.path.exists(dir):\n\t\t\tcontinue\=
n\t\tfor file in os.listdir(dir):\n\t\t\tm =3D re.match(\'^(.*)\\.pclist$\'=
, file)\n\t\t\tif m:\n\t\t\t\tpkg =3D m.group(1)\n\t\t\t\tfd =3D open(os.pa=
th.join(dir, file))\n\t\t\t\tlines =3D fd.readlines()\n\t\t\t\tfd.close()\n=
\t\t\t\tpkgconfig_provided[pkg] =3D []\n\t\t\t\tfor l in lines:\n\t\t\t\t\t=
pkgconfig_provided[pkg].append(l.rstrip())\n\n\tfor pkg in packages.split()=
:\n\t\tdeps =3D []\n\t\tfor n in pkgconfig_needed[pkg]:\n\t\t\tfound =3D Fa=
lse\n\t\t\tfor k in pkgconfig_provided.keys():\n\t\t\t\tif n in pkgconfig_p=
rovided[k]:\n\t\t\t\t\tif k !=3D pkg and not (k in deps):\n\t\t\t\t\t\tdeps=
.append(k)\n\t\t\t\t\tfound =3D True\n\t\t\tif found =3D=3D False:\n\t\t\t\=
tbb.note("couldn\'t find pkgconfig module \'%s\' in any package" % n)\n\t\t=
deps_file =3D os.path.join(pkgdest, pkg + ".pcdeps")\n\t\tif os.path.exists=
(deps_file):\n\t\t\tos.remove(deps_file)\n\t\tif len(deps):\n\t\t\tfd =3D o=
pen(deps_file, \'w\')\n\t\t\tfor dep in deps:\n\t\t\t\tfd.write(dep + \'\\n=
\')\n\t\t\tfd.close()\n\t\t\tpackage_stagefile(deps_file, d)\n\n\tif pstage=
active =3D=3D "1":\n\t\tbb.utils.unlockfile(lf)\n', 'BBINCLUDELOGS_LINES': =
None, 'USERDISTRO': 'angstrom-2008.1', 'base_eventhandler': '\tfrom bb impo=
rt note, error, data\n\tfrom bb.event import getName\n\n\n\tname =3D getNam=
e(e)\n\tif name =3D=3D "TaskCompleted":\n\t\tmsg =3D "package %s: task %s i=
s complete." % (data.getVar("PF", e.data, 1), e.task)\n\telif name =3D=3D "=
UnsatisfiedDep":\n\t\tmsg =3D "package %s: dependency %s %s" % (e.pkg, e.de=
p, name[:-3].lower())\n\telse:\n\t\treturn\n\n\t# Only need to output when =
using 1.8 or lower, the UI code handles it\n\t# otherwise\n\tif (int(bb.__v=
ersion__.split(".")[0]) <=3D 1 and int(bb.__version__.split(".")[1]) <=3D 8=
):\n\t\tif msg:\n\t\t\tnote(msg)\n\n\tif name.startswith("BuildStarted"):\n=
\t\tbb.data.setVar( \'BB_VERSION\', bb.__version__, e.data )\n\t\tstatusvar=
s =3D bb.data.getVar("BUILDCFG_VARS", e.data, 1).split()\n\t\tstatuslines =
=3D ["%-17s =3D \\"%s\\"" % (i, bb.data.getVar(i, e.data, 1) or \'\') for i=
 in statusvars]\n\t\tstatusmsg =3D "\\n%s\\n%s\\n" % (bb.data.getVar("BUILD=
CFG_HEADER", e.data, 1), "\\n".join(statuslines))\n\t\tprint statusmsg\n\n\=
t\tneeded_vars =3D bb.data.getVar("BUILDCFG_NEEDEDVARS", e.data, 1).split()=
\n\t\tpesteruser =3D []\n\t\tfor v in needed_vars:\n\t\t\tval =3D bb.data.g=
etVar(v, e.data, 1)\n\t\t\tif not val or val =3D=3D \'INVALID\':\n\t\t\t\tp=
esteruser.append(v)\n\t\tif pesteruser:\n\t\t\tbb.fatal(\'The following var=
iable(s) were not set: %s\\nPlease set them directly, or choose a MACHINE o=
r DISTRO that sets them.\' % \', \'.join(pesteruser))\n\n\t#\n\t# Handle re=
moving stamps for \'rebuild\' task\n\t#\n\tif name.startswith("StampUpdate"=
):\n\t\tfor (fn, task) in e.targets:\n\t\t\t#print "%s %s" % (task, fn)\n\t=
\t\tif task =3D=3D "do_rebuild":\n\t\t\t\tdir =3D "%s.*" % e.stampPrefix[fn=
]\n\t\t\t\tbb.note("Removing stamps: " + dir)\n\t\t\t\tos.system(\'rm -f \'=
+ dir)\n\t\t\t\tos.system(\'touch \' + e.stampPrefix[fn] + \'.needclean\')\=
n\n\tif not data in e.__dict__:\n\t\treturn\n\n\tlog =3D data.getVar("EVENT=
LOG", e.data, 1)\n\tif log:\n\t\tlogfile =3D file(log, "a")\n\t\tlogfile.wr=
ite("%s\\n" % msg)\n\t\tlogfile.close()\n', 'PREFERRED_VERSION_opie-drawpad=
': '${OPIE_VERSION}', 'PREFERRED_PROVIDER_virtual/libusb0': 'libusb-compat'=
, 'BUILD_CC_ARCH': '', 'FETCHCOMMAND': 'ERROR, this must be a BitBake bug',=
 'palmtopdir': '${libdir}/opie', 'BB_STAMP_WHITELIST': '${PSTAGE_NATIVEDEPE=
NDS}', 'PREFERRED_VERSION_opie-checkbook': '${OPIE_VERSION}', 'BBFILE_PRIOR=
ITY_upstream': '5', 'SRCREV_pn-moblin-menus': 'e1d63681739dd16195d005b3cf15=
752df294bd3c', 'PREFERRED_PROVIDER_util-linux': 'util-linux-ng', 'PREFERRED=
_VERSION_opie-freetype': '${OPIE_VERSION}', 'PREFERRED_VERSION_uclibc-initi=
al': '0.9.30.2', 'MIRRORS': '${DEBIAN_MIRROR}/main\thttp://snapshot.debian.=
net/archive/pool\n${DEBIAN_MIRROR}\tftp://ftp.de.debian.org/debian/pool\n${=
DEBIAN_MIRROR}\tftp://ftp.au.debian.org/debian/pool\n${DEBIAN_MIRROR}\tftp:=
//ftp.cl.debian.org/debian/pool\n${DEBIAN_MIRROR}\tftp://ftp.hr.debian.org/=
debian/pool\n${DEBIAN_MIRROR}\tftp://ftp.fi.debian.org/debian/pool\n${DEBIA=
N_MIRROR}\tftp://ftp.hk.debian.org/debian/pool\n${DEBIAN_MIRROR}\tftp://ftp=
.hu.debian.org/debian/pool\n${DEBIAN_MIRROR}\tftp://ftp.ie.debian.org/debia=
n/pool\n${DEBIAN_MIRROR}\tftp://ftp.it.debian.org/debian/pool\n${DEBIAN_MIR=
ROR}\tftp://ftp.jp.debian.org/debian/pool\n${DEBIAN_MIRROR}\tftp://ftp.no.d=
ebian.org/debian/pool\n${DEBIAN_MIRROR}\tftp://ftp.pl.debian.org/debian/poo=
l\n${DEBIAN_MIRROR}\tftp://ftp.ro.debian.org/debian/pool\n${DEBIAN_MIRROR}\=
tftp://ftp.si.debian.org/debian/pool\n${DEBIAN_MIRROR}\tftp://ftp.es.debian=
.org/debian/pool\n${DEBIAN_MIRROR}\tftp://ftp.se.debian.org/debian/pool\n${=
DEBIAN_MIRROR}\tftp://ftp.tr.debian.org/debian/pool\n${GNU_MIRROR}\tftp://m=
irrors.kernel.org/gnu\n${GNU_MIRROR}\tftp://ftp.cs.ubc.ca/mirror2/gnu\n${GN=
U_MIRROR}\tftp://sunsite.ust.hk/pub/gnu\n${GNU_MIRROR}\tftp://ftp.ayamura.o=
rg/pub/gnu\n${KERNELORG_MIRROR}\thttp://www.kernel.org/pub\n${KERNELORG_MIR=
ROR}\tftp://ftp.us.kernel.org/pub\n${KERNELORG_MIRROR}\tftp://ftp.uk.kernel=
.org/pub\n${KERNELORG_MIRROR}\tftp://ftp.hk.kernel.org/pub\n${KERNELORG_MIR=
ROR}\tftp://ftp.au.kernel.org/pub\n${KERNELORG_MIRROR}\tftp://ftp.jp.kernel=
.org/pub\nftp://ftp.gnupg.org/gcrypt/     ftp://ftp.franken.de/pub/crypt/mi=
rror/ftp.gnupg.org/gcrypt/\nftp://ftp.gnupg.org/gcrypt/     ftp://ftp.surfn=
et.nl/pub/security/gnupg/\nftp://ftp.gnupg.org/gcrypt/     http://gulus.USh=
erbrooke.ca/pub/appl/GnuPG/\nftp://dante.ctan.org/tex-archive ftp://ftp.fu-=
berlin.de/tex/CTAN\nftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.=
jp/pub/archives/ctan/\nftp://dante.ctan.org/tex-archive http://ctan.unsw.ed=
u.au/\nftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnutls.org/pub/gnutls/\nft=
p://ftp.gnutls.org/pub/gnutls ftp://ftp.gnupg.org/gcrypt/gnutls/\nftp://ftp=
.gnutls.org/pub/gnutls http://www.mirrors.wiretapped.net/security/network-s=
ecurity/gnutls/\nftp://ftp.gnutls.org/pub/gnutls ftp://ftp.mirrors.wiretapp=
ed.net/pub/security/network-security/gnutls/\nftp://ftp.gnutls.org/pub/gnut=
ls http://josefsson.org/gnutls/releases/\nhttp://ftp.info-zip.org/pub/infoz=
ip/src/ http://mirror.switch.ch/ftp/mirror/infozip/src/\nhttp://ftp.info-zi=
p.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip=
/src/\nftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cerias.pu=
rdue.edu/pub/tools/unix/sysutils/lsof/\nftp://lsof.itap.purdue.edu/pub/tool=
s/unix/lsof/  ftp://ftp.tau.ac.il/pub/unix/admin/\nftp://lsof.itap.purdue.e=
du/pub/tools/unix/lsof/  ftp://ftp.cert.dfn.de/pub/tools/admin/lsof/\nftp:/=
/lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.fu-berlin.de/pub/unix=
/tools/lsof/\nftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.ka=
izo.org/pub/lsof/\nftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://f=
tp.tu-darmstadt.de/pub/sysadmin/lsof/\nftp://lsof.itap.purdue.edu/pub/tools=
/unix/lsof/  ftp://ftp.tux.org/pub/sites/vic.cc.purdue.edu/tools/unix/lsof/=
\nftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/ut=
ils/admin-tools/lsof/\nftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp=
://sunsite.ualberta.ca/pub/Mirror/lsof/\nftp://lsof.itap.purdue.edu/pub/too=
ls/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/\nh=
ttp://www.apache.org/dist  http://archive.apache.org/dist\nftp://.*/.*     =
http://mirrors.openembedded.org/\nhttps?$://.*/.* http://mirrors.openembedd=
ed.org/\nftp://.*/.*     http://sources.openembedded.org/\nhttps?$://.*/.* =
http://sources.openembedded.org/\n\n', 'populate_sysroot_postamble': '\tif =
[ "$PSTAGING_ACTIVE" =3D "1" ]; then\n\t\t# list the packages currently ins=
talled in staging\n\t\t# ${PSTAGE_LIST_CMD} | awk \'{print $1}\' > ${PSTAGE=
_WORKDIR}/installed-list\n\n\t\t# exitcode =3D=3D 5 is ok, it means the fil=
es change\n\t\tset +e\n\t\tstage-manager -p ${STAGING_DIR} -c ${PSTAGE_WORK=
DIR}/stamp-cache-staging -u -d ${PSTAGE_TMPDIR_STAGE}/sysroots\n\t\texitcod=
e=3D$?\n\t\tif [ "$exitcode" !=3D "5" -a "$exitcode" !=3D "0" ]; then\n\t\t=
\texit $exitcode\n\t\tfi\n\t\tset -e\n\tfi\n', 'package_ipk_install': '\t#\=
n\t# Warning - this function is not multimachine safe (see stagingdir refer=
ence)!\n\t#\n\n\tpkg =3D bb.data.getVar(\'PKG\', d, 1)\n\tpkgfn =3D bb.data=
.getVar(\'PKGFN\', d, 1)\n\trootfs =3D bb.data.getVar(\'IMAGE_ROOTFS\', d, =
1)\n\tipkdir =3D bb.data.getVar(\'DEPLOY_DIR_IPK\', d, 1)\n\tstagingdir =3D=
 bb.data.getVar(\'STAGING_DIR\', d, 1)\n\ttmpdir =3D bb.data.getVar(\'TMPDI=
R\', d, 1)\n\n\tif None in (pkg,pkgfn,rootfs):\n\t\traise bb.build.FuncFail=
ed("missing variables (one or more of PKG, PKGFN, IMAGEROOTFS)")\n\ttry:\n\=
t\tbb.mkdirhier(rootfs)\n\t\tos.chdir(rootfs)\n\texcept OSError:\n\t\timpor=
t sys\n\t\t(type, value, traceback) =3D sys.exc_info()\n\t\tprint value\n\t=
\traise bb.build.FuncFailed\n\n\t# Generate ipk.conf if it or the stamp doe=
snt exist\n\tconffile =3D os.path.join(stagingdir,"opkg.conf")\n\tif not os=
.access(conffile, os.R_OK):\n\t\tipkg_archs =3D bb.data.getVar(\'PACKAGE_AR=
CHS\',d)\n\t\tif ipkg_archs is None:\n\t\t\tbb.error("PACKAGE_ARCHS missing=
")\n\t\t\traise FuncFailed\n\t\tipkg_archs =3D ipkg_archs.split()\n\t\tarch=
_priority =3D 1\n\n\t\tf =3D open(conffile,"w")\n\t\tfor arch in ipkg_archs=
:\n\t\t\tf.write("arch %s %s\\n" % ( arch, arch_priority ))\n\t\t\tarch_pri=
ority +=3D 1\n\t\tf.write("src local file:%s" % ipkdir)\n\t\tf.close()\n\n\=
n\tif (not os.access(os.path.join(ipkdir,"Packages"), os.R_OK) or\n\t\tnot =
os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),os.R_OK=
)):\n\t\tret =3D os.system(\'ipkg-make-index -p %s %s \' % (os.path.join(ip=
kdir, "Packages"), ipkdir))\n\t\tif (ret !=3D 0 ):\n\t\t\traise bb.build.Fu=
ncFailed\n\t\tf =3D open(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_=
CLEAN"),"w")\n\t\tf.close()\n\n\tret =3D os.system(\'opkg-cl  -o %s -f %s u=
pdate\' % (rootfs, conffile))\n\tret =3D os.system(\'opkg-cl  -o %s -f %s i=
nstall %s\' % (rootfs, conffile, pkgfn))\n\tif (ret !=3D 0 ):\n\t\traise bb=
.build.FuncFailed\n', 'BASEPKG_TARGET_SYS': '${BASE_PACKAGE_ARCH}${TARGET_V=
ENDOR}-${TARGET_OS}', 'do_recipe_sanity': '    p =3D d.getVar("P", 1)\n    =
p =3D "%s %s %s" % (d.getVar("PN", 1), d.getVar("PV", 1), d.getVar("PR", 1)=
)\n\n    sanitychecks =3D [\n        (can_remove_FILESDIR, "candidate for r=
emoval of FILESDIR"),\n        (can_remove_FILESPATH, "candidate for remova=
l of FILESPATH"),\n        #(can_use_autotools_base, "candidate for use of =
autotools_base"),\n        (incorrect_nonempty_PACKAGES, "native or cross r=
ecipe with non-empty PACKAGES"),\n    ]\n    cfgdata =3D d.getVar("__recipe=
_sanity_cfgdata", 0)\n\n    for (func, msg) in sanitychecks:\n        if fu=
nc(cfgdata, d):\n            __note(msg, d)\n\n    can_remove_others(p, cfg=
data, d)\n    var_renames_overwrite(cfgdata, d)\n    req_vars(cfgdata, d)\n=
    bad_runtime_vars(cfgdata, d)\n', 'IMAGE_CMD_squashfs': 'mksquashfs ${IM=
AGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGE=
CMD} -noappend', 'do_checkuriall': '\t:\n', 'DEPCHAIN_PRE': '', 'ANGSTROM_Q=
T_VERSION': '4.6.3', 'packagedstaging_fastpath': '\tmkdir -p ${PSTAGE_TMPDI=
R_STAGE}/sysroots/\n\tcp -fpPR ${SYSROOT_DESTDIR}/${STAGING_DIR}/* ${PSTAGE=
_TMPDIR_STAGE}/sysroots/ || /bin/true\n', 'GNOME_GIT': 'git://git.gnome.org=
', 'BBFILES': '/home/DRESEARCH/sledz/work/openembedded/recipes/*/*.bb /home=
/DRESEARCH/sledz/work/HydraIP/OE/hipox/recipes/*/*.bb /home/DRESEARCH/sledz=
/work/HydraIP/OE/common/recipes/*/*.bb', 'PREFERRED_PROVIDER_virtual/psplas=
h': 'psplash-angstrom', 'PREFERRED_PROVIDER_virtual/javac-native': 'ecj-boo=
tstrap-native', 'EXTRA_IMAGECMD_yaffs2': '1', '_': '/opt/bitbake/bin/bitbak=
e', 'do_patch': "\tbb.build.exec_func('base_do_patch', d)\n", 'staging_pack=
age_installer': '\t#${PSTAGE_INSTALL_CMD} ${PSTAGE_PKG}\n\n\tSTATUSFILE=3D$=
{TMPDIR}${libdir_native}/opkg/status\n\techo "Package: ${PSTAGE_PKGPN}"    =
    >> $STATUSFILE\n\techo "Version: ${PSTAGE_PKGVERSION}"   >> $STATUSFILE=
\n\techo "Status: install user installed"  >> $STATUSFILE\n\techo "Architec=
ture: ${PSTAGE_PKGARCH}" >> $STATUSFILE\n\techo "" >> $STATUSFILE\n\n\tCTRL=
FILE=3D${TMPDIR}${libdir_native}/opkg/info/${PSTAGE_PKGPN}.control\n\techo =
"Package: ${PSTAGE_PKGPN}"        > $CTRLFILE\n\techo "Version: ${PSTAGE_PK=
GVERSION}"   >> $CTRLFILE\n\techo "Architecture: ${PSTAGE_PKGARCH}" >> $CTR=
LFILE\n\n\tcd ${PSTAGE_TMPDIR_STAGE}\n\tfind -type f | grep -v ./CONTROL | =
sed -e \'s/^\\.//\' > ${TMPDIR}${libdir_native}/opkg/info/${PSTAGE_PKGPN}.l=
ist\n', 'PSTAGE_PKG': '${PSTAGE_DIR}/${PSTAGE_PKGPATH}/${PSTAGE_PKGNAME}', =
'IMAGE_CMD': '', 'QEMU_OPTIONS_armv6-novfp': '-cpu arm1136', 'PREFERRED_VER=
SION_linux-libc-headers_hipox': '2.6.24', 'PREFERRED_PROVIDER_frameworkd-co=
nfig': 'frameworkd-config', 'PREFERRED_PROVIDER_libxss': 'libxss', 'FREEDES=
KTOP_CVS': 'cvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs', 'PREFERRED_=
VERSION_opie-vmemo': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-mediaplayer=
1-libwavplugin': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-oyatzee': '${OP=
IE_VERSION}', 'XTERM_TERMCMDRUN': '${XTERM_TERMCMD} -e $SHELLCMDS', 'PREFER=
RED_VERSION_opie-tonleiter': '${OPIE_VERSION}', 'PATCH_GET': '0', 'PREFERRE=
D_VERSION_opie-euroconv': '${OPIE_VERSION}', 'SEPPUKU_NEWREPORT': 'http://b=
ugs.openembedded.net/post_bug.cgi?bug_file_loc=3Dhttp%3A%2F%2F&version=3DAn=
gstrom%20unstable&priority=3DP2&bug_severity=3Dnormal&op_sys=3DLinux&rep_pl=
atform=3DOther&', 'CXXFLAGS': '${TARGET_CXXFLAGS} -fvisibility-inlines-hidd=
en', 'COMPATIBLE_MACHINE': None, 'DEPLOY_DIR_IMAGE': '${DEPLOY_DIR}/images/=
${MACHINE}', 'PREFERRED_PROVIDER_virtual/xserver': 'xserver-xorg', 'DISPLAY=
': 'localhost:10.0', 'PREFERRED_PROVIDER_gconf': 'gconf', 'do_runstrip': "\=
timport stat\n\n\tdvar =3D bb.data.getVar('PKGD', d, True)\n\tdef isexec(pa=
th):\n\t\ttry:\n\t\t\ts =3D os.stat(path)\n\t\texcept (os.error, AttributeE=
rror):\n\t\t\treturn 0\n\t\treturn (s[stat.ST_MODE] & stat.S_IEXEC)\n\n\tfo=
r root, dirs, files in os.walk(dvar):\n\t\tfor f in files:\n\t\t\tfile =3D =
os.path.join(root, f)\n\t\t\tif not os.path.islink(file) and not os.path.is=
dir(file) and isexec(file):\n\t\t\t\trunstrip(file, d)\n", 'NM': '${HOST_PR=
EFIX}nm', 'SEPPUKU_ADDCOMMENT': 'http://bugs.openembedded.net/process_bug.c=
gi?bug_file_loc=3Dhttp%3A%2F%2F&version=3DAngstrom&priority=3DP2&bug_severi=
ty=3Dnormal&op_sys=3DLinux&rep_platform=3DOther&', 'PREFERRED_VERSION_opie-=
fifteen': '${OPIE_VERSION}', 'PREFERRED_VERSION_opie-aqpkg': '${OPIE_VERSIO=
N}', 'PREFERRED_VERSION_opie-deco-flat': '${OPIE_VERSION}', 'PREFERRED_PROV=
IDER_gdk-pixbuf-loader-ras': 'gtk+', 'DEPENDS': '', 'PREFERRED_VERSION_opie=
-clockapplet': '${OPIE_VERSION}', 'ANGSTROM_FEED_CONFIGS': 'angstrom-feed-c=
onfigs', 'TARGET_LINK_HASH_STYLE': "${@['-Wl,--hash-style=3Dgnu',''][bb.dat=
a.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el']]}",=
 'IMAGE_CMD_cpio': 'cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPL=
OY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) ${EXTRA_IMAGECMD}', 'PSTAGE_PKGARC=
H': '${PACKAGE_ARCH}-${HOST_OS}', 'PSTAGE_UPDATE_CMD': '${PSTAGE_PKGMANAGER=
} -f ${PSTAGE_MACHCONFIG} -o ${TMPDIR} update', 'IMAGE_CMD_cpio.lzma': 'cd =
${IMAGE_ROOTFS} && (find . | cpio -o -H newc | lzma -c -9 >${DEPLOY_DIR_IMA=
GE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}', 'KONSOLE_TERMCMD': =
'konsole -T "$TERMWINDOWTITLE"', 'PREFERRED_VERSION_opie-theme': '${OPIE_VE=
RSION}', 'oedebug': '\ttest $# -ge 2 || {\n\t\techo "Usage: oedebug level \=
\"message\\""\n\t\texit 1\n\t}\n\n\ttest ${OEDEBUG:-0} -ge $1 && {\n\t\tshi=
ft\n\t\techo "DEBUG:" $*\n\t}\n', '__recipe_sanity_badruntimevars': 'RDEPEN=
DS RPROVIDES RRECOMMENDS RCONFLICTS', 'PREFERRED_VERSION_opie-bluepin': '${=
OPIE_VERSION}', 'PREFERRED_VERSION_opie-kcheckers': '${OPIE_VERSION}', 'PAC=
KAGE_DEPENDS': ' file-native pax-utils-native desktop-file-utils-native', '=
METADATA_REVISION': '${@base_get_scm_revision(d)}', 'UBOOT_ARCH': 'arm', 'E=
XTRA_IMAGEDEPENDS': '', 'BUILD_STRIP': '${BUILD_PREFIX}strip', 'PREFERRED_V=
ERSION_ti-dmai-tests': '2_10_00_01+svnr%', 'read_subpackage_metadata': "\td=
ata =3D read_pkgdata(bb.data.getVar('PN', d, 1), d)\n\n\tfor key in data.ke=
ys():\n\t\tbb.data.setVar(key, data[key], d)\n\n\tfor pkg in bb.data.getVar=
('PACKAGES', d, 1).split():\n\t\tsdata =3D read_subpkgdata(pkg, d)\n\t\tfor=
 key in sdata.keys():\n\t\t\tbb.data.setVar(key, sdata[key], d)\n", 'PREFER=
RED_VERSION_opie-backup': '${OPIE_VERSION}', 'package_do_shlibs': '\timport=
 re\n\n\texclude_shlibs =3D bb.data.getVar(\'EXCLUDE_FROM_SHLIBS\', d, 0)\n=
\tif exclude_shlibs:\n\t\tbb.debug(1, "not generating shlibs")\n\t\treturn\=
n\n\tlib_re =3D re.compile("^lib.*\\.so")\n\tlibdir =3D bb.data.getVar(\'ba=
se_libdir\', d, True)\n\tlibdir_re =3D re.compile(".*%s$" % (libdir))\n\n\t=
packages =3D bb.data.getVar(\'PACKAGES\', d, True)\n\n\tworkdir =3D bb.data=
.getVar(\'WORKDIR\', d, True)\n\n\tver =3D bb.data.getVar(\'PKGV\', d, True=
)\n\tif not ver:\n\t\tbb.error("PKGV not defined")\n\t\treturn\n\n\tpkgdest=
 =3D bb.data.getVar(\'PKGDEST\', d, True)\n\n\tshlibs_dir =3D bb.data.getVa=
r(\'SHLIBSDIR\', d, True)\n\tbb.mkdirhier(shlibs_dir)\n\n\tpstageactive =3D=
 bb.data.getVar(\'PSTAGING_ACTIVE\', d, True)\n\tif pstageactive =3D=3D "1"=
:\n\t\tlf =3D bb.utils.lockfile(bb.data.expand("${STAGING_DIR}/staging.lock=
", d))\n\n\tif bb.data.getVar(\'PACKAGE_SNAP_LIB_SYMLINKS\', d, True) =3D=
=3D "1":\n\t\tsnap_symlinks =3D True\n\telse:\n\t\tsnap_symlinks =3D False\=
n\n\tif (bb.data.getVar(\'USE_LDCONFIG\', d, True) or "1") =3D=3D "1":\n\t\=
tuse_ldconfig =3D True\n\telse:\n\t\tuse_ldconfig =3D False\n\n\tneeded =3D=
 {}\n\tprivate_libs =3D bb.data.getVar(\'PRIVATE_LIBS\', d, True)\n\tfor pk=
g in packages.split():\n\t\tneeds_ldconfig =3D False\n\t\tbb.debug(2, "calc=
ulating shlib provides for %s" % pkg)\n\n\t\tpkgver =3D bb.data.getVar(\'PK=
GV_\' + pkg, d, True)\n\t\tif not pkgver:\n\t\t\tpkgver =3D bb.data.getVar(=
\'PV_\' + pkg, d, True)\n\t\tif not pkgver:\n\t\t\tpkgver =3D ver\n\n\t\tne=
eded[pkg] =3D []\n\t\tsonames =3D list()\n\t\ttop =3D os.path.join(pkgdest,=
 pkg)\n\t\trenames =3D []\n\t\tfor root, dirs, files in os.walk(top):\n\t\t=
\tfor file in files:\n\t\t\t\tsoname =3D None\n\t\t\t\tpath =3D os.path.joi=
n(root, file)\n\t\t\t\tif (os.access(path, os.X_OK) or lib_re.match(file)) =
and not os.path.islink(path):\n\t\t\t\t\tcmd =3D bb.data.getVar(\'OBJDUMP\'=
, d, True) + " -p " + path + " 2>/dev/null"\n\t\t\t\t\tcmd =3D "PATH=3D\\"%=
s\\" %s" % (bb.data.getVar(\'PATH\', d, True), cmd)\n\t\t\t\t\tfd =3D os.po=
pen(cmd)\n\t\t\t\t\tlines =3D fd.readlines()\n\t\t\t\t\tfd.close()\n\t\t\t\=
t\tfor l in lines:\n\t\t\t\t\t\tm =3D re.match("\\s+NEEDED\\s+([^\\s]*)", l=
)\n\t\t\t\t\t\tif m:\n\t\t\t\t\t\t\tneeded[pkg].append(m.group(1))\n\t\t\t\=
t\t\tm =3D re.match("\\s+SONAME\\s+([^\\s]*)", l)\n\t\t\t\t\t\tif m:\n\t\t\=
t\t\t\t\tthis_soname =3D m.group(1)\n\t\t\t\t\t\t\tif not this_soname in so=
names:\n\t\t\t\t\t\t\t\t# if library is private (only used by package) then=
 do not build shlib for it\n\t\t\t\t\t\t\t\tif not private_libs or -1 =3D=
=3D private_libs.find(this_soname):\n\t\t\t\t\t\t\t\t\tsonames.append(this_=
soname)\n\t\t\t\t\t\t\tif libdir_re.match(root):\n\t\t\t\t\t\t\t\tneeds_ldc=
onfig =3D True\n\t\t\t\t\t\t\tif snap_symlinks and (file !=3D soname):\n\t\=
t\t\t\t\t\t\trenames.append((path, os.path.join(root, this_soname)))\n\t\tf=
or (old, new) in renames:\n\t\t\tos.rename(old, new)\n\t\tshlibs_file =3D o=
s.path.join(shlibs_dir, pkg + ".list")\n\t\tif os.path.exists(shlibs_file):=
\n\t\t\tos.remove(shlibs_file)\n\t\tshver_file =3D os.path.join(shlibs_dir,=
 pkg + ".ver")\n\t\tif os.path.exists(shver_file):\n\t\t\tos.remove(shver_f=
ile)\n\t\tif len(sonames):\n\t\t\tfd =3D open(shlibs_file, \'w\')\n\t\t\tfo=
r s in sonames:\n\t\t\t\tfd.write(s + \'\\n\')\n\t\t\tfd.close()\n\t\t\tpac=
kage_stagefile(shlibs_file, d)\n\t\t\tfd =3D open(shver_file, \'w\')\n\t\t\=
tfd.write(pkgver + \'\\n\')\n\t\t\tfd.close()\n\t\t\tpackage_stagefile(shve=
r_file, d)\n\t\tif needs_ldconfig and use_ldconfig:\n\t\t\tbb.debug(1, \'ad=
ding ldconfig call to postinst for %s\' % pkg)\n\t\t\tpostinst =3D bb.data.=
getVar(\'pkg_postinst_%s\' % pkg, d, True) or bb.data.getVar(\'pkg_postinst=
\', d, True)\n\t\t\tif not postinst:\n\t\t\t\tpostinst =3D \'#!/bin/sh\\n\'=
\n\t\t\tpostinst +=3D bb.data.getVar(\'ldconfig_postinst_fragment\', d, Tru=
e)\n\t\t\tbb.data.setVar(\'pkg_postinst_%s\' % pkg, postinst, d)\n\n\tif ps=
tageactive =3D=3D "1":\n\t\tbb.utils.unlockfile(lf)\n\n\tshlib_provider =3D=
 {}\n\tlist_re =3D re.compile(\'^(.*)\\.list$\')\n\tfor dir in [shlibs_dir]=
:\n\t\tif not os.path.exists(dir):\n\t\t\tcontinue\n\t\tfor file in os.list=
dir(dir):\n\t\t\tm =3D list_re.match(file)\n\t\t\tif m:\n\t\t\t\tdep_pkg =
=3D m.group(1)\n\t\t\t\tfd =3D open(os.path.join(dir, file))\n\t\t\t\tlines=
 =3D fd.readlines()\n\t\t\t\tfd.close()\n\t\t\t\tver_file =3D os.path.join(=
dir, dep_pkg + \'.ver\')\n\t\t\t\tlib_ver =3D None\n\t\t\t\tif os.path.exis=
ts(ver_file):\n\t\t\t\t\tfd =3D open(ver_file)\n\t\t\t\t\tlib_ver =3D fd.re=
adline().rstrip()\n\t\t\t\t\tfd.close()\n\t\t\t\tfor l in lines:\n\t\t\t\t\=
tshlib_provider[l.rstrip()] =3D (dep_pkg, lib_ver)\n\n\tassumed_libs =3D bb=
.data.getVar(\'ASSUME_SHLIBS\', d, True)\n\tif assumed_libs:\n\t    for e i=
n assumed_libs.split():\n\t\tl, dep_pkg =3D e.split(":")\n\t\tlib_ver =3D N=
one\n\t\tdep_pkg =3D dep_pkg.rsplit("_", 1)\n\t\tif len(dep_pkg) =3D=3D 2:\=
n\t\t    lib_ver =3D dep_pkg[1]\n\t\tdep_pkg =3D dep_pkg[0]\n\t\tshlib_prov=
ider[l] =3D (dep_pkg, lib_ver)\n\n\tdep_packages =3D []\n\tfor pkg in packa=
ges.split():\n\t\tbb.debug(2, "calculating shlib requirements for %s" % pkg=
)\n\n\t\tdeps =3D list()\n\t\tfor n in needed[pkg]:\n\t\t\tif n in shlib_pr=
ovider.keys():\n\t\t\t\t(dep_pkg, ver_needed) =3D shlib_provider[n]\n\n\t\t=
\t\tif dep_pkg =3D=3D pkg:\n\t\t\t\t\tcontinue\n\n\t\t\t\tif ver_needed:\n\=
t\t\t\t\tdep =3D "%s (>=3D %s)" % (dep_pkg, ver_needed)\n\t\t\t\telse:\n\t\=
t\t\t\tdep =3D dep_pkg\n\t\t\t\tif not dep in deps:\n\t\t\t\t\tdeps.append(=
dep)\n\t\t\t\tif not dep_pkg in dep_packages:\n\t\t\t\t\tdep_packages.appen=
d(dep_pkg)\n\n\t\t\telse:\n\t\t\t\tbb.note("Couldn\'t find shared library p=
rovider for %s" % n)\n\n\t\tdeps_file =3D os.path.join(pkgdest, pkg + ".shl=
ibdeps")\n\t\tif os.path.exists(deps_file):\n\t\t\tos.remove(deps_file)\n\t=
\tif len(deps):\n\t\t\tfd =3D open(deps_file, \'w\')\n\t\t\tfor dep in deps=
:\n\t\t\t\tfd.write(dep + \'\\n\')\n\t\t\tfd.close()\n', 'STAGING_DIR': '${=
TMPDIR}/sysroots', 'oe_runmake': '\toenote ${MAKE} ${EXTRA_OEMAKE} "$@"\n\t=
${MAKE} ${EXTRA_OEMAKE} "$@" || die "oe_runmake failed"\n', 'PREFERRED_VERS=
ION_opie-buzzword': '${OPIE_VERSION}', 'PREFERRED_VERSION_ti-codecs-omapl13=
8-server': '1_00_00', 'DEPLOY_DIR_RPM': '${DEPLOY_DIR}/rpm', 'PREFERRED_VER=
SION_opie-zsame': '${OPIE_VERSION}', 'PREFERRED_VERSION_ti-codec-engine': '=
2_25_01_06', 'PACKAGES_DYNAMIC': '${PN}-locale-*', 'PREFERRED_VERSION_opie-=
tabmanager': '${OPIE_VERSION}', 'TARGET_CC_KERNEL_ARCH': None, 'SDK_CFLAGS'=
: '${SDK_CPPFLAGS} ${SELECTED_OPTIMIZATION}', 'PSTAGE_SCAN_CMD': 'find ${PS=
TAGE_TMPDIR_STAGE} \\( -name "*.la" -o -name "*-config" \\) -type f', 'ARM_=
INSTRUCTION_SET': '${ANGSTROM_ARM_INSTRUCTION_SET}', 'OESTATS_SERVER': 'tin=
derbox.openembedded.org', 'STAGING_DIR_TARGET': '${STAGING_DIR}/${BASEPKG_T=
ARGET_SYS}', 'DEBUG_OPTIMIZATION': '-O -fno-omit-frame-pointer -g', 'DISTRO=
_FEED_CONFIGS': '${ANGSTROM_FEED_CONFIGS}', 'RDEPENDS_${PN}-dev': '${PN} (=
=3D ${EXTENDPV})', 'PREFERRED_VERSION_opie-today-datebookplugin': '${OPIE_V=
ERSION}', 'OE_IMPORTS': ' oe.path oe.utils sys os time', 'AUTOREV': '${SRCP=
V}', 'DESCRIPTION': 'Version ${PV}-${PR} of package ${PN}', 'PREFERRED_VERS=
ION_glib-2.0-native': '2.24.1', 'FETCHCOMMAND_svn': '/usr/bin/env svn co --=
non-interactive ${SVNCOOPTS} ${SVNROOT} ${SVNMODULE}', 'DEPLOY_DIR_DEB': '$=
{DEPLOY_DIR}/deb', 'PACKAGE_EXTRA_ARCHS': ' armv4 armv4t armv5te', 'OE_ROOT=
': '/home/DRESEARCH/sledz/work/openembedded', 'EXTRA_IMAGECMD_cpio.gz': '',=
 'TARGET_CC_ARCH_pn-cairo_armv5te': '-march=3Darmv4t', 'PALMTOP_USE_MULTITH=
READED_QT': 'yes', 'STAGING_BINDIR_CROSS': '${STAGING_DIR_NATIVE}${prefix_n=
ative}/${BASE_PACKAGE_ARCH}${base_bindir_native}'}
# PREFERRED_VERSION_opie-kcheckers=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-kcheckers=3D"1.2.4"

# PREFERRED_VERSION_opie-console=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-console=3D"1.2.4"

# PREFERRED_VERSION_opie-style-liquid=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-style-liquid=3D"1.2.4"

# FETCHCMD_bzr=3D/usr/bin/env bzr
FETCHCMD_bzr=3D"/usr/bin/env bzr"

# MULTI_PROVIDER_WHITELIST=3Dvirtual/libintl
MULTI_PROVIDER_WHITELIST=3D"virtual/libintl"

# UBOOT_ARCH=3Darm
UBOOT_ARCH=3D"arm"

# PREFERRED_VERSION_hal=3D0.5.14
PREFERRED_VERSION_hal=3D"0.5.14"

# ANGSTROMLIBC=3Dglibc
ANGSTROMLIBC=3D"glibc"

# TARGET_EXEEXT=3D
# PREFERRED_VERSION_opie-qcop=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-qcop=3D"1.2.4"

# EXTRA_IMAGEDEPENDS=3D
# BUILD_STRIP=3D${BUILD_PREFIX}strip
export BUILD_STRIP=3D"strip"

# PREFERRED_VERSION_ti-dmai-tests=3D2_10_00_01+svnr%
PREFERRED_VERSION_ti-dmai-tests=3D"2_10_00_01+svnr%"

# ANGSTROM_BLACKLIST_pn-libiconv=3Dthe glibc builtin iconv replacement is u=
sed
ANGSTROM_BLACKLIST_pn-libiconv=3D"the glibc builtin iconv replacement is us=
ed"

# IMAGE_ROOTFS_SIZE_ext3.gz=3D65536
IMAGE_ROOTFS_SIZE_ext3.gz=3D"65536"

# PSTAGE_MACHCONFIG=3D${PSTAGE_WORKDIR}/opkg.conf
PSTAGE_MACHCONFIG=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/opk=
g.conf"

# PREFERRED_VERSION_libecj-bootstrap=3D3.6
PREFERRED_VERSION_libecj-bootstrap=3D"3.6"

# ANGSTROM_BLACKLIST_pn-bluez-libs=3Dbluez-libs 3.x has been replaced by bl=
uez4
ANGSTROM_BLACKLIST_pn-bluez-libs=3D"bluez-libs 3.x has been replaced by blu=
ez4"

# PREFERRED_VERSION_opie-backup=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-backup=3D"1.2.4"

# STAGING_DIR=3D${TMPDIR}/sysroots
STAGING_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots"

# PREFERRED_VERSION_opie-buzzword=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-buzzword=3D"1.2.4"

# PREFERRED_VERSION_ti-codecs-omapl138-server=3D1_00_00
PREFERRED_VERSION_ti-codecs-omapl138-server=3D"1_00_00"

# DEPLOY_DIR_RPM=3D${DEPLOY_DIR}/rpm
DEPLOY_DIR_RPM=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/=
rpm"

# MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS=3D
# PREFERRED_VERSION_eglibc=3D2.9
PREFERRED_VERSION_eglibc=3D"2.9"

# base_sbindir_native=3D/sbin
base_sbindir_native=3D"/sbin"

# TINDER_CLOBBER=3D1
TINDER_CLOBBER=3D"1"

# TARGET_FPU_armv7a=3Dhard
TARGET_FPU_armv7a=3D"hard"

# SRCREV_pn-mojito=3D0542c4b0e26c0e3b69c5ad1fa1898dc276fb9f48
SRCREV_pn-mojito=3D"0542c4b0e26c0e3b69c5ad1fa1898dc276fb9f48"

# AUTOTOOLS_STAGE_PKGCONFIG=3D1
AUTOTOOLS_STAGE_PKGCONFIG=3D"1"

# PREFERRED_VERSION_opie-logoutapplet=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-logoutapplet=3D"1.2.4"

# PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-binutils=3Dbinutils=
-cross
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-binutils=3D"binutils-=
cross"

# PREFERRED_VERSION_opie-mediaplayer1-core=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-mediaplayer1-core=3D"1.2.4"

# PREFERRED_PROVIDER_qt4-embedded=3Dqt4-embedded
PREFERRED_PROVIDER_qt4-embedded=3D"qt4-embedded"

# STAGING_DATADIR_JAVA=3D${STAGING_DIR_JAVA}
STAGING_DATADIR_JAVA=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroot=
s/java"

# layout_libdir=3D${libdir}
layout_libdir=3D"/usr/lib"

# PREFERRED_VERSION_opie-style-web=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-style-web=3D"1.2.4"

# PACKAGES_DYNAMIC=3D${PN}-locale-*
PACKAGES_DYNAMIC=3D"libsoup-2.4-locale-*"

# EXTRA_IMAGECMD=3D
# PREFERRED_VERSION_opie-tabmanager=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-tabmanager=3D"1.2.4"

# OLDEST_KERNEL_sparc64=3D2.4.21
OLDEST_KERNEL_sparc64=3D"2.4.21"

# PREFERRED_VERSION_opie-kjumpx=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-kjumpx=3D"1.2.4"

# COMPATIBLE_HOST=3DNone
# SRC_DIST_LOCAL=3Dsymlink
SRC_DIST_LOCAL=3D"symlink"

# BASE_PACKAGE_ARCH=3Darmv5te
BASE_PACKAGE_ARCH=3D"armv5te"

# PSTAGE_SCAN_CMD=3Dfind ${PSTAGE_TMPDIR_STAGE} \( -name "*.la" -o -name "*=
-config" \) -type f
PSTAGE_SCAN_CMD=3D"find /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/ar=
mv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg \( -name \"=
*.la\" -o -name \"*-config\" \) -type f"

# ARM_INSTRUCTION_SET=3D${ANGSTROM_ARM_INSTRUCTION_SET}
ARM_INSTRUCTION_SET=3D"arm"

# OESTATS_SERVER=3Dtinderbox.openembedded.org
OESTATS_SERVER=3D"tinderbox.openembedded.org"

# PREFERRED_VERSION_ti-xdctools=3D3_16_01_27
PREFERRED_VERSION_ti-xdctools=3D"3_16_01_27"

# STAGING_FIRMWARE_DIR=3D${STAGING_DIR_HOST}/firmware
STAGING_FIRMWARE_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroot=
s/armv5te-angstrom-linux-gnueabi/firmware"

# TOOLCHAIN_TYPE=3Dinternal
TOOLCHAIN_TYPE=3D"internal"

# KERNEL_CCSUFFIX_archos5it=3D-4.2.1+csl-arm-2007q3-53
KERNEL_CCSUFFIX_archos5it=3D"-4.2.1+csl-arm-2007q3-53"

# do_distsrcall=3DNone
# PREFERRED_VERSION_linux-libc-headers_hipox=3D2.6.24
PREFERRED_VERSION_linux-libc-headers_hipox=3D"2.6.24"

# BUILD_RANLIB=3D${BUILD_PREFIX}ranlib
export BUILD_RANLIB=3D"ranlib"

# DEBUG_OPTIMIZATION=3D-O -fno-omit-frame-pointer -g
DEBUG_OPTIMIZATION=3D"-O -fno-omit-frame-pointer -g"

# GNOME_MIRROR=3Dhttp://ftp.gnome.org/pub/GNOME/sources
GNOME_MIRROR=3D"http://ftp.gnome.org/pub/GNOME/sources"

# DISTRO_FEED_CONFIGS=3D${ANGSTROM_FEED_CONFIGS}
DISTRO_FEED_CONFIGS=3D"angstrom-feed-configs"

# RDEPENDS_${PN}-dev=3DNone
# STAGING_LIBDIR_NATIVE=3D${STAGING_DIR_NATIVE}${libdir_native}
STAGING_LIBDIR_NATIVE=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/i686-linux/usr/lib"

# PREFERRED_VERSION_opie-today-datebookplugin=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-today-datebookplugin=3D"1.2.4"

# PREFERRED_PROVIDERS=3Dvirtual/qte:qte virtual/libqpe:libqpe-opie  virtual=
/libsdl:libsdl-x11  virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial  =
virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate  virtual/${=
TARGET_PREFIX}gcc:gcc-cross  virtual/${TARGET_PREFIX}g++:gcc-cross
PREFERRED_PROVIDERS=3D"virtual/qte:qte virtual/libqpe:libqpe-opie  virtual/=
libsdl:libsdl-x11  virtual/arm-angstrom-linux-gnueabi-gcc-initial:gcc-cross=
-initial  virtual/arm-angstrom-linux-gnueabi-gcc-intermediate:gcc-cross-int=
ermediate  virtual/arm-angstrom-linux-gnueabi-gcc:gcc-cross  virtual/arm-an=
gstrom-linux-gnueabi-g++:gcc-cross"

# sysconfdir=3D${base_prefix}/etc
export sysconfdir=3D"/etc"

# OE_IMPORTS=3D oe.path oe.utils sys os time
OE_IMPORTS=3D"oe.path oe.utils sys os time"

# PREFERRED_VERSION_opie-bounce=3D${OPIE_VERSION}
PREFERRED_VERSION_opie-bounce=3D"1.2.4"

# CVS_TARBALL_STASH=3Dhttp://www.angstrom-distribution.org/unstable/sources=
/=20
CVS_TARBALL_STASH=3D"http://www.angstrom-distribution.org/unstable/sources/=
"

# WORKDIR=3D${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}
WORKDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstro=
m-linux-gnueabi/libsoup-2.4-2.29.91-r0"

# PREFERRED_VERSION_uclibc-initial=3D0.9.30.2
PREFERRED_VERSION_uclibc-initial=3D"0.9.30.2"

# OVERRIDE_THUMB=3D${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', =
d, 1) =3D=3D 'thumb']}
# FETCHCOMMAND_svn=3D/usr/bin/env svn co --non-interactive ${SVNCOOPTS} ${S=
VNROOT} ${SVNMODULE}
FETCHCOMMAND_svn=3D"/usr/bin/env svn co --non-interactive ${SVNCOOPTS} ${SV=
NROOT} ${SVNMODULE}"

# PREFERRED_VERSION_libqtaux2=3D${OPIE_VERSION}
PREFERRED_VERSION_libqtaux2=3D"1.2.4"

# OE_ROOT=3D/home/DRESEARCH/sledz/work/openembedded
export OE_ROOT=3D"/home/DRESEARCH/sledz/work/openembedded"

# UBOOT_LOADADDRESS=3D0x48008000
UBOOT_LOADADDRESS=3D"0x48008000"

# AUTO_LIBNAME_PKGS=3D${PACKAGES}
AUTO_LIBNAME_PKGS=3D"libsoup-gnome libsoup-2.4-dbg libsoup-2.4 libsoup-2.4-=
doc libsoup-2.4-dev libsoup-2.4-static libsoup-2.4-locale"

# PALMTOP_USE_MULTITHREADED_QT=3Dyes
PALMTOP_USE_MULTITHREADED_QT=3D"yes"

# STAGING_BINDIR_CROSS=3D${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKA=
GE_ARCH}${base_bindir_native}
STAGING_BINDIR_CROSS=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroot=
s/i686-linux/usr/armv5te/bin"

do_devshell() {
	devshell_do_devshell

}

gtk_icon_cache_postrm() {
for icondir in /usr/share/icons/* ; do
    if [ -d $icondir ] ; then
        gtk-update-icon-cache -qt  $icondir
    fi
done

}

do_package_update_index_ipk() {
	set -x

	ipkgarchs=3D"all any noarch arm  armv4 armv4t armv5te hipox"

	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
		return
	fi

	mkdir -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk
	touch /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/Package=
s
	ipkg-make-index -r /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glib=
c/ipk/Packages -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/=
ipk/Packages -l /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ip=
k/Packages.filelist -m /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/g=
libc/ipk

	for arch in $ipkgarchs; do
		if [ -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/$arc=
h/ ] ; then
			touch /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/$arch=
/Packages
			ipkg-make-index -r /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/gl=
ibc/ipk/$arch/Packages -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deplo=
y/glibc/ipk/$arch/Packages -l /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/d=
eploy/glibc/ipk/$arch/Packages.filelist -m /home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.6/deploy/glibc/ipk/$arch/
		fi
		if [ -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/i686=
-$arch-sdk/ ] ; then
			touch /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/i686-=
$arch-sdk/Packages
			ipkg-make-index -r /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/gl=
ibc/ipk/i686-$arch-sdk/Packages -p /home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.6/deploy/glibc/ipk/i686-$arch-sdk/Packages -l /home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.6/deploy/glibc/ipk/i686-$arch-sdk/Packages.filelist -m /home=
/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/i686-$arch-sdk/
		fi
		if [ -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/i686=
-linux-sdk-$arch/ ] ; then
			touch /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/i686-=
linux-sdk-$arch/Packages
			ipkg-make-index -r /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/gl=
ibc/ipk/i686-linux-sdk-$arch/Packages -p /home/DRESEARCH/sledz/work/HydraIP=
/OE/tmp.6/deploy/glibc/ipk/i686-linux-sdk-$arch/Packages -l /home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/i686-linux-sdk-$arch/Packages=
.filelist -m /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/i=
686-linux-sdk-$arch/
		fi
	done

}

die() {
	oefatal "$*"

}

base_do_install() {
	:

}

do_compile() {
	base_do_compile

}

do_package_stage_all() {
	:

}

do_recipe_sanity_all() {
    :

}

autotools_prepackage_lamangler() {
        for i in `find /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/arm=
v5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/package -name "*.la"` ; =
do \
            sed -i -e 's:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/armv5te-angstrom-linux-gnueabi/usr/lib:/usr/lib:g;' \
                   -e 's:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/a=
rmv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/image::g;' \
                   -e 's:-I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work=
/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0\S*: :g;' \
                   -e 's:-L/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work=
/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0\S*: :g;' \
                   $i
	done

}

gtk_icon_cache_postinst() {
if [ "x$D" !=3D "x" ]; then
        exit 1
fi

# Update the pixbuf loaders in case they haven't been registered yet
gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders

for icondir in /usr/share/icons/* ; do
    if [ -d $icondir ] ; then
        gtk-update-icon-cache -qt  $icondir
    fi
done

}

base_do_package() {
	:

}

autotools_stage_includes() {
	if [ "${INHIBIT_AUTO_STAGE_INCLUDES}" !=3D "1" ]
	then
		rm -rf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-=
linux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging
		mkdir -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstro=
m-linux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging
		make DESTDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-=
angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging" install
		cp -pPR /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom=
-linux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging//usr/include/* /home/DRE=
SEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/=
usr/include
		rm -rf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-=
linux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging
	fi

}

oewarn() {
	echo "WARNING:" "$*"

}

oe_machinstall() {
	# Purpose: Install machine dependent files, if available
	#          If not available, check if there is a default
	#          If no default, just touch the destination
	# Example:
	#                $1  $2   $3         $4
	# oe_machinstall -m 0644 fstab /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6=
/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/image/etc/fstab
	#
	# TODO: Check argument number?
	#
	filename=3D`basename $3`
	dirname=3D`dirname $3`

	for o in `echo local:hipox:angstrom:linux-gnueabi:arm:build-linux:fail-fas=
t:pn-libsoup-2.4:armv5te:Unknown:libc-glibc:thumb-interwork | tr ':' ' '`; =
do
		if [ -e $dirname/$o/$filename ]; then
			oenote $dirname/$o/$filename present, installing to $4
			install $1 $2 $dirname/$o/$filename $4
			return
		fi
	done
#	oenote overrides specific file NOT present, trying default=3D$3...
	if [ -e $3 ]; then
		oenote $3 present, installing to $4
		install $1 $2 $3 $4
	else
		oenote $3 NOT present, touching empty $4
		touch $4
	fi

}

package_stagefile_shell() {
	if [ "$PSTAGING_ACTIVE" =3D "1" ]; then
		srcfile=3D$1
		destfile=3D`echo $srcfile | sed s#/home/DRESEARCH/sledz/work/HydraIP/OE/t=
mp.6#/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linu=
x-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg#`
		destdir=3D`dirname $destfile`
		mkdir -p $destdir
		cp -dp $srcfile $destfile
	fi

}

staging_packager() {

	mkdir -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom=
-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg/CONTROL
	mkdir -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/angstromglibc

	echo "Package: staging-libsoup-2.4-armv5te-angstrom-linux-gnueabi"        =
 >  /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux=
-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg/CONTROL/control
	echo "Version: 2.29.91-r0"    >> /home/DRESEARCH/sledz/work/HydraIP/OE/tmp=
.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg/C=
ONTROL/control
	echo "Description: An HTTP library implementation in C"      >> /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libso=
up-2.4-2.29.91-r0/staging-pkg/CONTROL/control
	echo "Section: x11/gnome/libs"              >> /home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0=
/staging-pkg/CONTROL/control
	echo "Priority: Optional"               >> /home/DRESEARCH/sledz/work/Hydr=
aIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/sta=
ging-pkg/CONTROL/control
	echo "Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org=
>"        >> /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angst=
rom-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg/CONTROL/control
	echo "Architecture: armv5te-linux-gnueabi"  >> /home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0=
/staging-pkg/CONTROL/control

	# Protect against empty SRC_URI
	srcuri=3D"http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.29/libsoup-2.29=
.91.tar.bz2;name=3Dlibsoup"
	if [ "$srcuri" =3D=3D "" ]; then
		srcuri=3D"OpenEmbedded"
	fi
	echo "Source: $srcuri"               >> /home/DRESEARCH/sledz/work/HydraIP=
/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/stagin=
g-pkg/CONTROL/control

	# Deal with libtool not supporting sysroots
	# Need to remove hardcoded paths and fix these when we install the
	# staging packages.
	# Could someone please add sysroot support to libtool!
        for i in `find /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/arm=
v5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg \( -name "*.=
la" -o -name "*-config" \) -type f` ; do \
                sed -i -e s:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sys=
roots:FIXMESTAGINGDIR:g $i
                echo $i | sed -e 's:/home/DRESEARCH/sledz/work/HydraIP/OE/t=
mp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg=
/::' >> /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg/sysroots/fixmepath
        done

	stage-manager-ipkg-build -o 0 -g 0 /home/DRESEARCH/sledz/work/HydraIP/OE/t=
mp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg=
 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/angstromglibc

}

autotools_stage_libdir() {
	sysroot_stage_libdir $1 $2

}

autotools_stage_all() {
	if [ "${INHIBIT_AUTO_STAGE}" =3D "1" ]
	then
		return
	fi
	rm -rf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging
	mkdir -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom=
-linux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging
	oe_runmake DESTDIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/arm=
v5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging" install
	rm -rf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging//usr/share/man || true
	rm -rf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging//usr/share/info || true
	sysroot_stage_dirs /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5t=
e-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging=20
	rm -rf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/libsoup-2.4-2.29.91-r0/temp-staging

}

SRC_DISTRIBUTECOMMAND() {
    test -e "${SRC}.md5" && ln -sf "${SRC}.md5" .
    ln -sf "${SRC}" .

}

oe_libinstall() {
	# Purpose: Install a library, in all its forms
	# Example
	#
	# oe_libinstall libltdl /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/armv5te-angstrom-linux-gnueabi/usr/lib/
	# oe_libinstall -C src/libblah libblah /home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/image//=
usr/lib/
	dir=3D""
	libtool=3D""
	silent=3D""
	require_static=3D""
	require_shared=3D""
	staging_install=3D""
	while [ "$#" -gt 0 ]; do
		case "$1" in
		-C)
			shift
			dir=3D"$1"
			;;
		-s)
			silent=3D1
			;;
		-a)
			require_static=3D1
			;;
		-so)
			require_shared=3D1
			;;
		-*)
			oefatal "oe_libinstall: unknown option: $1"
			;;
		*)
			break;
			;;
		esac
		shift
	done

	libname=3D"$1"
	shift
	destpath=3D"$1"
	if [ -z "$destpath" ]; then
		oefatal "oe_libinstall: no destination path specified"
	fi
	if echo "$destpath/" | egrep '^/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6=
/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/' >/dev/null
	then
		staging_install=3D1
	fi

	__runcmd () {
		if [ -z "$silent" ]; then
			echo >&2 "oe_libinstall: $*"
		fi
		$*
	}

	if [ -z "$dir" ]; then
		dir=3D`pwd`
	fi

	dotlai=3D$libname.lai

	# Sanity check that the libname.lai is unique
	number_of_files=3D`(cd $dir; find . -name "$dotlai") | wc -l`
	if [ $number_of_files -gt 1 ]; then
		oefatal "oe_libinstall: $dotlai is not unique in $dir"
	fi


	dir=3D$dir`(cd $dir;find . -name "$dotlai") | sed "s/^\.//;s/\/$dotlai\$//=
;q"`
	olddir=3D`pwd`
	__runcmd cd $dir

	lafile=3D$libname.la

	# If such file doesn't exist, try to cut version suffix
	if [ ! -f "$lafile" ]; then
		libname1=3D`echo "$libname" | sed 's/-[0-9.]*$//'`
		lafile1=3D$libname.la
		if [ -f "$lafile1" ]; then
			libname=3D$libname1
			lafile=3D$lafile1
		fi
	fi

	if [ -f "$lafile" ]; then
		# libtool archive
		eval `cat $lafile|grep "^library_names=3D"`
		libtool=3D1
	else
		library_names=3D"$libname.so* $libname.dll.a"
	fi

	__runcmd install -d $destpath/
	dota=3D$libname.a
	if [ -f "$dota" -o -n "$require_static" ]; then
		__runcmd install -m 0644 $dota $destpath/
	fi
	if [ -f "$dotlai" -a -n "$libtool" ]; then
		if test -n "$staging_install"
		then
			# stop libtool using the final directory name for libraries
			# in staging:
			__runcmd rm -f $destpath/$libname.la
			__runcmd sed -e 's/^installed=3Dyes$/installed=3Dno/' \
				     -e '/^dependency_libs=3D/s,/home/DRESEARCH/sledz/work/HydraIP/OE/t=
mp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0[[:alnum:]/\=
._+-]*/\([[:alnum:]\._+-]*\),/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sy=
sroots/armv5te-angstrom-linux-gnueabi/usr/lib/\1,g' \
				     -e "/^dependency_libs=3D/s,\([[:space:]']\)/usr/lib,\1/home/DRESEA=
RCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr=
/lib,g" \
				     $dotlai >$destpath/$libname.la
		else
			__runcmd install -m 0644 $dotlai $destpath/$libname.la
		fi
	fi

	for name in $library_names; do
		files=3D`eval echo $name`
		for f in $files; do
			if [ ! -e "$f" ]; then
				if [ -n "$libtool" ]; then
					oefatal "oe_libinstall: $dir/$f not found."
				fi
			elif [ -L "$f" ]; then
				__runcmd cp -P "$f" $destpath/
			elif [ ! -L "$f" ]; then
				libfile=3D"$f"
				__runcmd install -m 0755 $libfile $destpath/
			fi
		done
	done

	if [ -z "$libfile" ]; then
		if  [ -n "$require_shared" ]; then
			oefatal "oe_libinstall: unable to locate shared library"
		fi
	elif [ -z "$libtool" ]; then
		# special case hack for non-libtool .so.#.#.# links
		baselibfile=3D`basename "$libfile"`
		if (echo $baselibfile | grep -qE '^lib.*\.so\.[0-9.]*$'); then
			sonamelink=3D`arm-angstrom-linux-gnueabi-readelf -d $libfile |grep 'Libr=
ary soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
			solink=3D`echo $baselibfile | sed -e 's/\.so\..*/.so/'`
			if [ -n "$sonamelink" -a x"$baselibfile" !=3D x"$sonamelink" ]; then
				__runcmd ln -sf $baselibfile $destpath/$sonamelink
			fi
			__runcmd ln -sf $baselibfile $destpath/$solink
		fi
	fi

	__runcmd cd "$olddir"

}

gnomebase_do_configure() {
	autotools_do_configure

}

base_do_compile() {
	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
		oe_runmake || die "make failed"
	else
		oenote "nothing to compile"
	fi

}

do_configure() {
	gnomebase_do_configure

}

gconf_prerm() {
if [ "$1" =3D remove ] || [ "$1" =3D upgrade ]; then
        SCHEMA_LOCATION=3D/etc/gconf/schemas
        for SCHEMA in ${SCHEMA_FILES}; do
                if [ -e $SCHEMA_LOCATION/$SCHEMA ]; then
                        HOME=3D/root GCONF_CONFIG_SOURCE=3D`gconftool-2 --g=
et-default-source` \
                                gconftool-2 \
                                        --makefile-uninstall-rule $SCHEMA_L=
OCATION/$SCHEMA > /dev/null
                fi
        done
fi

}

populate_sysroot_preamble() {
	if [ "$PSTAGING_ACTIVE" =3D "1" ]; then
		stage-manager -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots -c =
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/stamp-cache-staging -u |=
| true
	fi

}

devshell_do_devshell() {
	export TERMWINDOWTITLE=3D"Bitbake Developer Shell"
	xterm
	if [ $? -ne 0 ]; then
	    echo "Fatal: 'xterm' not found. Check TERMCMD variable."
	    exit 1
	fi

}

oe_soinstall() {
	# Purpose: Install shared library file and
	#          create the necessary links
	# Example:
	#
	# oe_
	#
	#oenote installing shared library $1 to $2
	#
	libname=3D`basename $1`
	install -m 755 $1 $2/$libname
	sonamelink=3D`arm-angstrom-linux-gnueabi-readelf -d $1 |grep 'Library sona=
me:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
	solink=3D`echo $libname | sed -e 's/\.so\..*/.so/'`
	ln -sf $libname $2/$sonamelink
	ln -sf $libname $2/$solink

}

sysroot_stage_dir() {
	src=3D"$1"
	dest=3D"$2"
	# This will remove empty directories so we can ignore them
	rmdir "$src" 2> /dev/null || true
	if [ -d "$src" ]; then
		mkdir -p "$dest"
		cp -fpPR "$src"/* "$dest"
	fi

}

sysroot_stage_all() {
	sysroot_stage_dirs /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5t=
e-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/image /home/DRESEARCH/sledz=
/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29=
.91-r0/sysroot-destdir/

}

do_testlab() {
if [ -e  /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/libsoup-2.4/etc=
/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" =3D "full" ] ; then

	IPKG_TMP_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/libsoup=
-2.4-tmp"
	IPKG_ARGS=3D"-f /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-=
linux/etc/opkg.conf -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/l=
ibsoup-2.4 -t ${IPKG_TMP_DIR}"

	TESTLAB_DIR=3D"/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/im=
ages/hipox/Angstrom-libsoup-2.4-glibc-ipk-2010.7-test-20110203-hipox-testla=
b"
        mkdir -p ${TESTLAB_DIR}/
        mkdir -p ${IPKG_TMP_DIR}/
	ls -laR /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/rootfs/libsoup-2.4 > $=
{TESTLAB_DIR}/files-in-image.txt

	echo > ${TESTLAB_DIR}/installed-packages.txt
	echo -e "digraph depends {\n    node [shape=3Dplaintext]" > ${TESTLAB_DIR}=
/depends.dot

	for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; do
		opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\=
)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"} /^Version/ {printf $2"_=
"} /^Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt

    		for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Depends) ; do
        		echo "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v "=
$pkg OPP Depends" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' =
|sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
    		done

		for recommends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Recom) ; do
        		echo "$pkg OPP $recommends [style=3Ddotted];" | grep -v "(" | gre=
p -v ")" | grep -v "$pkg OPP Recom" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.=
:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
    		done
	done

	echo "}" >>  ${TESTLAB_DIR}/depends.dot
	rm -rf ${IPKG_TMP_DIR}

	grep -v kernel_2 ${TESTLAB_DIR}/depends.dot | grep -v kernel_image > ${TES=
TLAB_DIR}/depends-nokernel.dot
	grep -v libc6 ${TESTLAB_DIR}/depends-nokernel.dot | grep -v libgcc > ${TES=
TLAB_DIR}/depends-nokernel-nolibc.dot
	grep -v update_ ${TESTLAB_DIR}/depends-nokernel-nolibc.dot > ${TESTLAB_DIR=
}/depends-nokernel-nolibc-noupdate.dot
        grep -v kernel_module ${TESTLAB_DIR}/depends-nokernel-nolibc-noupda=
te.dot > ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate-nomodules.dot

	#dot has some library troubles when run under fakeroot, uncomment at your =
own risk
	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies.png  ${TESTLAB_DIR}/depend=
s.dot
	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc.png ${TEST=
LAB_DIR}/depends-nokernel-nolibc.dot
	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc-noupdate.p=
ng ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate.dot
	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc-noupdate-n=
omodules.png ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate-nomodules.dot

	for file in $(cat ${TESTLAB_DIR}/installed-packages.txt) ; do
     		du -k $(find /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glib=
c/ipk -name "$file") | head -n1
	done | grep "\.ipk" | sed -e s:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6=
/deploy/glibc/ipk::g | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${TESTLA=
B_DIR}/installed-package-sizes.txt

	# Log results to a git controlled directory structure than can be pushed t=
o a remote location
	if [ "${TESTLABLOG}" =3D "remote" ] && [ -n "${TESTLABREMOTEDIR}" ] ; then
		TESTLABLOGDIR=3D"hipox/libsoup-2.4"
		mkdir -p ${TESTLABREMOTEDIR}/${TESTLABLOGDIR}
		cp ${TESTLAB_DIR}/*package* ${TESTLAB_DIR}/depends.dot ${TESTLABREMOTEDIR=
}/${TESTLABLOGDIR}
		# force change to record builds where the testlab contents didn't change,=
 but other things (e.g. git rev) did
		echo "hipox: libsoup-2.4 configured for angstrom 2010.7-test-20110203 usi=
ng branch 2010-10-01_oe_sync and revision <unknown> " > ${TESTLABREMOTEDIR}=
/${TESTLABLOGDIR}/build-id
		# This runs inside fakeroot, so the git author is listed as root (or what=
ever root configured it to be) :(
		( cd ${TESTLABREMOTEDIR}/
		  git add ${TESTLABLOGDIR}/*
		  git commit ${TESTLABLOGDIR}/ -m "hipox: libsoup-2.4 configured for angs=
trom 2010.7-test-20110203 using branch 2010-10-01_oe_sync and revision <unk=
nown>" --author "testlab <testlab@angstrom>" || true)
	fi
fi

}

mime_postrm() {
if [ "$1" =3D remove ] || [ "$1" =3D upgrade ]; then
	if [ -x /usr/bin/update-mime-database ] ; then
		echo "Updating MIME database... this may take a while."
		update-mime-database $D/usr/share/mime
	else
		echo "Missing /usr/bin/update-mime-database, update of mime database fail=
ed!"
		exit 1
	fi
fi

}

base_do_configure() {
	:

}

oe_runconf() {
	if [ -x /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-=
linux-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91/configure ] ; then
		/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-g=
nueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91/configure  --build=3Di686-lin=
ux 		  --host=3Darm-angstrom-linux-gnueabi 		  --target=3Darm-angstrom-linu=
x-gnueabi 		  --prefix=3D/usr 		  --exec_prefix=3D/usr 		  --bindir=3D/usr/=
bin 		  --sbindir=3D/usr/sbin 		  --libexecdir=3D/usr/libexec 		  --datadir=
=3D/usr/share 		  --sysconfdir=3D/etc 		  --sharedstatedir=3D/com 		  --loc=
alstatedir=3D/var 		  --libdir=3D/usr/lib 		  --includedir=3D/usr/include 	=
	  --oldincludedir=3D/usr/include 		  --infodir=3D/usr/share/info 		  --man=
dir=3D/usr/share/man ${EXTRA_OECONF} "$@"
	else
		oefatal "no configure script found"
	fi

}

do_install() {
	for i in `find /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-an=
gstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91/ -name "*.pc" -=
type f` ; do \
		sed -i -e 's:-L/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5=
te-angstrom-linux-gnueabi/usr/lib::g' \
			-e 's:-R/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-ang=
strom-linux-gnueabi/usr/lib::g' \
			-e 's:-I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-ang=
strom-linux-gnueabi/usr/include::g' \
			-e 's:-isystem/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5=
te-angstrom-linux-gnueabi/usr/include::g' \
			$i
        done
	gnomebase_do_install
	rm -rf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/libsoup-2.4-2.29.91-r0/image/var/lib/scrollkeeper/*
	rm -rf /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/libsoup-2.4-2.29.91-r0/image/var/scrollkeeper/*
	rm -f /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-li=
nux-gnueabi/libsoup-2.4-2.29.91-r0/image/usr/share/applications/*.cache

}

autotools_stage_dir() {
 	sysroot_stage_dir $1 $2

}

do_checkuriall() {
	:

}

do_buildall() {
	:

}

pkgconfig_sysroot_preprocess() {
	install -d /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstr=
om-linux-gnueabi/libsoup-2.4-2.29.91-r0/sysroot-destdir//home/DRESEARCH/sle=
dz/work/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/pk=
gconfig
	for pc in `find /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-a=
ngstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91 -name '*.pc' -=
type f | grep -v -- '-uninstalled.pc$'`; do
		pcname=3D`basename $pc`
		cat $pc > /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstr=
om-linux-gnueabi/libsoup-2.4-2.29.91-r0/sysroot-destdir//home/DRESEARCH/sle=
dz/work/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/pk=
gconfig/$pcname
	done

}

oenote() {
	echo "NOTE:" "$*"

}

gconf_postinst() {
if [ "$1" =3D configure ]; then
	if [ "x$D" !=3D "x" ]; then
		exit 1
	fi
	SCHEMA_LOCATION=3D/etc/gconf/schemas
	for SCHEMA in ${SCHEMA_FILES}; do
		if [ -e $SCHEMA_LOCATION/$SCHEMA ]; then
			HOME=3D/root GCONF_CONFIG_SOURCE=3D`gconftool-2 --get-default-source` \
				gconftool-2 \
				--makefile-install-rule $SCHEMA_LOCATION/$SCHEMA > /dev/null
		fi
	done
fi

}

do_package_write() {
	:

}

package_generate_ipkg_conf() {
	mkdir -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/e=
tc/
	echo "src oe file:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc=
/ipk" > /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/etc=
/opkg.conf
	echo "src oe file:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc=
/ipk" > /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/etc=
/opkg-sdk.conf
	echo "src oe file:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc=
/ipk" > /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/etc=
/opkg-canadian-sdk.conf
	ipkgarchs=3D"all any noarch arm  armv4 armv4t armv5te hipox"
	priority=3D1
	for arch in $ipkgarchs; do
		echo "arch $arch $priority" >> /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/sysroots/i686-linux/etc/opkg.conf
		echo "arch i686-$arch-sdk $priority" >> /home/DRESEARCH/sledz/work/HydraI=
P/OE/tmp.6/sysroots/i686-linux/etc/opkg-sdk.conf
		echo "arch i686-linux-sdk-$arch $priority" >> /home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.6/sysroots/i686-linux/etc/opkg-canadian-sdk.conf
		priority=3D$(expr $priority + 5)
		if [ -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/$arc=
h/Packages ] ; then
		        echo "src oe-$arch file:/home/DRESEARCH/sledz/work/HydraIP/OE/tmp=
.6/deploy/glibc/ipk/$arch" >> /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/s=
ysroots/i686-linux/etc/opkg.conf
		fi
		if [ -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/i686=
-$arch-sdk/Packages ] ; then
		        echo "src oe-i686-$arch-sdk file:/home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.6/deploy/glibc/ipk/i686-$arch-sdk" >> /home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.6/sysroots/i686-linux/etc/opkg-sdk.conf
		fi
		if [ -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/deploy/glibc/ipk/i686=
-linux-sdk-$arch/Packages ] ; then
		        echo "src oe-i686-linux-sdk-$arch file:/home/DRESEARCH/sledz/work=
/HydraIP/OE/tmp.6/deploy/glibc/ipk/i686-linux-sdk-$arch" >> /home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/etc/opkg-canadian-sdk.conf
		fi
	done
	echo "lists_dir ext /var/lib/opkg" >> /home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.6/sysroots/i686-linux/etc/opkg.conf
	echo "lists_dir ext /var/lib/opkg" >> /home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.6/sysroots/i686-linux/etc/opkg-sdk.conf
	echo "lists_dir ext /var/lib/opkg" >> /home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.6/sysroots/i686-linux/etc/opkg-canadian-sdk.conf

}

sysroot_stage_dirs() {
	from=3D"$1"
	to=3D"$2"

	sysroot_stage_dir $from/usr/include $to/home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include
	if [ "i686-linux" =3D "arm-angstrom-linux-gnueabi" ]; then
		sysroot_stage_dir $from/usr/bin $to/home/DRESEARCH/sledz/work/HydraIP/OE/=
tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/bin
		sysroot_stage_dir $from/usr/sbin $to/home/DRESEARCH/sledz/work/HydraIP/OE=
/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/sbin
		sysroot_stage_dir $from/bin $to/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/sysroots/armv5te-angstrom-linux-gnueabi/bin
		sysroot_stage_dir $from/sbin $to/home/DRESEARCH/sledz/work/HydraIP/OE/tmp=
.6/sysroots/armv5te-angstrom-linux-gnueabi/sbin
		sysroot_stage_dir $from/usr/libexec $to/home/DRESEARCH/sledz/work/HydraIP=
/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/libexec
		sysroot_stage_dir $from/etc $to/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/sysroots/armv5te-angstrom-linux-gnueabi/etc
		if [ "/usr/lib" !=3D "/usr/lib" ]; then
			# python puts its files in here, make sure they are staged as well
			sysroot_stage_dir $from//usr/lib $to/home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
		fi
	fi
	if [ -d $from/usr/lib ]
	then
		sysroot_stage_libdir $from//usr/lib $to/home/DRESEARCH/sledz/work/HydraIP=
/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
	fi
	if [ -d $from/lib ]
	then
		sysroot_stage_libdir $from/lib $to/home/DRESEARCH/sledz/work/HydraIP/OE/t=
mp.6/sysroots/armv5te-angstrom-linux-gnueabi/lib
	fi
	sysroot_stage_dir $from/usr/share $to/home/DRESEARCH/sledz/work/HydraIP/OE=
/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/share
	sysroot_stage_dir $from/etc $to/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6=
/sysroots/armv5te-angstrom-linux-gnueabi/etc

}

autotools_do_configure() {
	case libsoup-2.4 in
	autoconf*)
	;;
	automake*)
	;;
	*)
		# WARNING: gross hack follows:
		# An autotools built package generally needs these scripts, however only
		# automake or libtoolize actually install the current versions of them.
		# This is a problem in builds that do not use libtool or automake, in the=
 case
		# where we -need- the latest version of these scripts.  e.g. running a bu=
ild
		# for a package whose autotools are old, on an x86_64 machine, which the =
old
		# config.sub does not support.  Work around this by installing them manua=
lly
		# regardless.
		( for ac in `find /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5t=
e-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91 -name confi=
gure.in -o -name configure.ac`; do
			rm -f `dirname $ac`/configure
			done )
		if [ -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom=
-linux-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91/configure.in -o -e /h=
ome/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnuea=
bi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91/configure.ac ]; then
			olddir=3D`pwd`
			cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-lin=
ux-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91
			if [ x"default" =3D xdefault ]; then
				acpaths=3D
				for i in `find /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te=
-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91 -maxdepth 2 =
-name \*.m4|grep -v 'aclocal.m4'| \
					grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
					acpaths=3D"$acpaths -I $i"
				done
			else
				acpaths=3D"default"
			fi
			AUTOV=3D`automake --version |head -n 1 |sed "s/.* //;s/\.[0-9]\+$//"`
			automake --version
			echo "AUTOV is $AUTOV"
			install -d /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-=
angstrom-linux-gnueabi/usr/share/aclocal
			install -d /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-=
angstrom-linux-gnueabi/usr/share/aclocal-$AUTOV
			acpaths=3D"$acpaths -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroo=
ts/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-$AUTOV -I /home/DRESEAR=
CH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/=
share/aclocal"
			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
			# like it was auto-generated.  Work around this by blowing it away
			# by hand, unless the package specifically asked not to run aclocal.
			if ! echo --exclude=3Dautopoint | grep -q "aclocal"; then
				rm -f aclocal.m4
			fi
			if [ -e configure.in ]; then
			  CONFIGURE_AC=3Dconfigure.in
			else
			  CONFIGURE_AC=3Dconfigure.ac
			fi
			if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; the=
n
			  if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
			    : do nothing -- we still have an old unmodified configure.ac
			  else
			    oenote Executing glib-gettextize --force --copy
			    echo "no" | glib-gettextize --force --copy
			  fi
			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; the=
n
			  if [ -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-a=
ngstrom-linux-gnueabi/usr/share/gettext/config.rpath ]; then
			    cp /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-angs=
trom-linux-gnueabi/usr/share/gettext/config.rpath /home/DRESEARCH/sledz/wor=
k/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-=
r0/libsoup-2.29.91/
			  else
			    oenote /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-=
angstrom-linux-gnueabi/usr/share/gettext/config.rpath not found. gettext is=
 not installed.
			  fi
			fi

			fi
			mkdir -p m4
			oenote Executing autoreconf --verbose --install --force --exclude=3Dauto=
point $acpaths
			autoreconf -Wcross --verbose --install --force --exclude=3Dautopoint $ac=
paths || oefatal "autoreconf execution failed."
			if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; =
then
			  oenote Executing intltoolize --copy --force --automake
			  intltoolize --copy --force --automake
			fi
			cd $olddir
		fi
	;;
	esac
	if [ -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-=
linux-gnueabi/libsoup-2.4-2.29.91-r0/libsoup-2.29.91/configure ]; then
		oe_runconf $@
	else
		oenote "nothing to configure"
	fi

}

mime_postinst() {
if [ "$1" =3D configure ]; then
	if [ -x /usr/bin/update-mime-database ] ; then
		echo "Updating MIME database... this may take a while."
		update-mime-database $D/usr/share/mime
	else
		echo "Missing /usr/bin/update-mime-database, update of mime database fail=
ed!"
		exit 1
	fi
fi

}

populate_sysroot_postamble() {
	if [ "$PSTAGING_ACTIVE" =3D "1" ]; then
		# list the packages currently installed in staging
		# stage-manager-ipkg -f /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstag=
e/opkg.conf -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6 list_installed |=
 awk '{print $1}' > /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/inst=
alled-list

		# exitcode =3D=3D 5 is ok, it means the files change
		set +e
		stage-manager -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots -c =
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/stamp-cache-staging -u -=
d /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-g=
nueabi/libsoup-2.4-2.29.91-r0/staging-pkg/sysroots
		exitcode=3D$?
		if [ "$exitcode" !=3D "5" -a "$exitcode" !=3D "0" ]; then
			exit $exitcode
		fi
		set -e
	fi

}

packagedstaging_fastpath() {
	mkdir -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom=
-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg/sysroots/
	cp -fpPR /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom=
-linux-gnueabi/libsoup-2.4-2.29.91-r0/sysroot-destdir///home/DRESEARCH/sled=
z/work/HydraIP/OE/tmp.6/sysroots/* /home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg/=
sysroots/ || /bin/true

}

staging_package_installer() {
	#stage-manager-ipkg -f /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/=
opkg.conf -force-depends -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6 ins=
tall /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/angstromglibc/stagi=
ng-libsoup-2.4-armv5te-angstrom-linux-gnueabi_2.29.91-r0_armv5te-linux-gnue=
abi.ipk

	STATUSFILE=3D/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/usr/lib/opkg/stat=
us
	echo "Package: staging-libsoup-2.4-armv5te-angstrom-linux-gnueabi"        =
>> $STATUSFILE
	echo "Version: 2.29.91-r0"   >> $STATUSFILE
	echo "Status: install user installed"  >> $STATUSFILE
	echo "Architecture: armv5te-linux-gnueabi" >> $STATUSFILE
	echo "" >> $STATUSFILE

	CTRLFILE=3D/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/usr/lib/opkg/info/s=
taging-libsoup-2.4-armv5te-angstrom-linux-gnueabi.control
	echo "Package: staging-libsoup-2.4-armv5te-angstrom-linux-gnueabi"        =
> $CTRLFILE
	echo "Version: 2.29.91-r0"   >> $CTRLFILE
	echo "Architecture: armv5te-linux-gnueabi" >> $CTRLFILE

	cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux=
-gnueabi/libsoup-2.4-2.29.91-r0/staging-pkg
	find -type f | grep -v ./CONTROL | sed -e 's/^\.//' > /home/DRESEARCH/sled=
z/work/HydraIP/OE/tmp.6/usr/lib/opkg/info/staging-libsoup-2.4-armv5te-angst=
rom-linux-gnueabi.list

}

ldconfig_postinst_fragment() {
if [ x"$D" =3D "x" ]; then
	if [ -e /etc/ld.so.conf ] ; then
		[ -x /sbin/ldconfig ] && /sbin/ldconfig
	fi
fi

}

do_fetchall() {
	:

}

autotools_do_install() {
	oe_runmake 'DESTDIR=3D/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/arm=
v5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/image' install

}

oedebug() {
	test $# -ge 2 || {
		echo "Usage: oedebug level \"message\""
		exit 1
	}

	test ${OEDEBUG:-0} -ge $1 && {
		shift
		echo "DEBUG:" $*
	}

}

oe_runmake() {
	oenote make  "$@"
	make  "$@" || die "oe_runmake failed"

}

staging_helper() {
	# Assemble appropriate opkg.conf
	conffile=3D/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/opkg.conf
	mkdir -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/pstage/pstaging_lists
	arch=3D"armv5te-linux-gnueabi"
	if [ ! -e $conffile ]; then
		echo "arch $arch 1" > $conffile
		echo "dest root /" >> $conffile
	elif [ `grep -c " $arch " $conffile` -eq 0 ]; then
		priority=3D$(expr `grep -cE "^arch" $conffile` + 1)
		sed -i -e "/dest/iarch $arch $priority" $conffile
	fi
	if [ ! -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/usr/lib/opkg/info/ ]=
; then
		mkdir -p /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/usr/lib/opkg/info/
	fi
 	if [ ! -e /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/usr/lib/ipkg/ ]; th=
en
		ln -sf opkg/ /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/usr/lib/ipkg || =
true
	fi

}

oefatal() {
	echo "FATAL:" "$*"
	exit 1

}

gnomebase_do_install() {
	autotools_do_install

}

MIRRORS() {
ftp://ftp.debian.org/debian/pool/main	http://snapshot.debian.net/archive/po=
ol
ftp://ftp.debian.org/debian/pool	ftp://ftp.de.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.au.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.cl.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.hr.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.fi.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.hk.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.hu.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.ie.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.it.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.jp.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.no.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.pl.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.ro.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.si.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.es.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.se.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.tr.debian.org/debian/pool
ftp://ftp.gnu.org/gnu	ftp://mirrors.kernel.org/gnu
ftp://ftp.gnu.org/gnu	ftp://ftp.cs.ubc.ca/mirror2/gnu
ftp://ftp.gnu.org/gnu	ftp://sunsite.ust.hk/pub/gnu
ftp://ftp.gnu.org/gnu	ftp://ftp.ayamura.org/pub/gnu
http://kernel.org	http://www.kernel.org/pub
http://kernel.org	ftp://ftp.us.kernel.org/pub
http://kernel.org	ftp://ftp.uk.kernel.org/pub
http://kernel.org	ftp://ftp.hk.kernel.org/pub
http://kernel.org	ftp://ftp.au.kernel.org/pub
http://kernel.org	ftp://ftp.jp.kernel.org/pub
ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.franken.de/pub/crypt/mirror/ftp.g=
nupg.org/gcrypt/
ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.surfnet.nl/pub/security/gnupg/
ftp://ftp.gnupg.org/gcrypt/     http://gulus.USherbrooke.ca/pub/appl/GnuPG/
ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN
ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan=
/
ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/
ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnutls.org/pub/gnutls/
ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnupg.org/gcrypt/gnutls/
ftp://ftp.gnutls.org/pub/gnutls http://www.mirrors.wiretapped.net/security/=
network-security/gnutls/
ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.mirrors.wiretapped.net/pub/securi=
ty/network-security/gnutls/
ftp://ftp.gnutls.org/pub/gnutls http://josefsson.org/gnutls/releases/
http://ftp.info-zip.org/pub/infozip/src/ http://mirror.switch.ch/ftp/mirror=
/infozip/src/
http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/=
archiving/info-zip/src/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cerias.purdue.ed=
u/pub/tools/unix/sysutils/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tau.ac.il/pub/un=
ix/admin/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cert.dfn.de/pub/=
tools/admin/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.fu-berlin.de/pub=
/unix/tools/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.kaizo.org/pub/ls=
of/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tu-darmstadt.de/=
pub/sysadmin/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tux.org/pub/site=
s/vic.cc.purdue.edu/tools/unix/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/util=
s/admin-tools/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/=
pub/Mirror/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/p=
ub/security/host-security/lsof/
http://www.apache.org/dist  http://archive.apache.org/dist
ftp://.*/.*     http://mirrors.openembedded.org/
https?$://.*/.* http://mirrors.openembedded.org/
ftp://.*/.*     http://sources.openembedded.org/
https?$://.*/.* http://sources.openembedded.org/

ftp://.*/.*	http://www.angstrom-distribution.org/unstable/sources/
https?$://.*/.*	http://www.angstrom-distribution.org/unstable/sources/

}

sysroot_stage_libdir() {
	src=3D"$1"
	dest=3D"$2"

	olddir=3D`pwd`
	cd $src
	las=3D$(find . -name \*.la -type f)
	cd $olddir
	echo "Found la files: $las"
	for i in $las
	do
		sed -e 's/^installed=3Dyes$/installed=3Dno/' \
		    -e '/^dependency_libs=3D/s,/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0[[:alnum:]/\._+=
-]*/\([[:alnum:]\._+-]*\),/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysro=
ots/armv5te-angstrom-linux-gnueabi/usr/lib/\1,g' \
		    -e "/^dependency_libs=3D/s,\([[:space:]']\)/usr/lib,\1/home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/li=
b,g" \
		     \
		    -i $src/$i
	done
	sysroot_stage_dir $src $dest

}



python base_do_setscene () {
        for f in (bb.data.getVar('SCENEFUNCS', d, 1) or '').split():
                bb.build.exec_func(f, d)
	if not os.path.exists(bb.data.getVar('STAMP', d, 1) + ".do_setscene"):
		bb.build.make_stamp("do_setscene", d)
}


python do_listtasks () {
	import sys
	# emit variables and shell functions
	#bb.data.emit_env(sys.__stdout__, d)
	# emit the metadata which isnt valid shell
	for e in d.keys():
		if bb.data.getVarFlag(e, 'task', d):
			sys.__stdout__.write("%s\n" % e)
}


python populate_packages_append () {
None}


python do_rebuild () {
	"""rebuild a package"""
}


python insane_do_package () {
	bb.build.exec_func('package_do_package', d)
}


python check_sanity_eventhandler () {
    if isinstance(e, bb.event.BuildStarted):
        check_sanity(e)
}


python perform_packagecopy () {
	dest =3D bb.data.getVar('D', d, True)
	dvar =3D bb.data.getVar('PKGD', d, True)

	bb.mkdirhier(dvar)

	# Start by package population by taking a copy of the installed
	# files to operate on
	os.system('rm -rf %s/*' % (dvar))
	os.system('cp -pPR %s/* %s/' % (dest, dvar))
}


python populate_sysroot_posthook () {
    bb.build.exec_func("populate_sysroot_postamble", d)
}


python package_mapping_rename_hook () {
	"""
	Rewrite variables to account for package renaming in things
	like debian.bbclass or manual PKG variable name changes
	"""
	runtime_mapping_rename("RDEPENDS", d)
	runtime_mapping_rename("RRECOMMENDS", d)
	runtime_mapping_rename("RSUGGESTS", d)
	runtime_mapping_rename("RPROVIDES", d)
	runtime_mapping_rename("RREPLACES", d)
	runtime_mapping_rename("RCONFLICTS", d)
}


python populate_packages () {
	import glob, errno, re,os

	workdir =3D bb.data.getVar('WORKDIR', d, True)
	outdir =3D bb.data.getVar('DEPLOY_DIR', d, True)
	dvar =3D bb.data.getVar('PKGD', d, True)
	packages =3D bb.data.getVar('PACKAGES', d, True)
	pn =3D bb.data.getVar('PN', d, True)

	bb.mkdirhier(outdir)
	os.chdir(dvar)

	# Sanity check PACKAGES for duplicates - should be moved to
	# sanity.bbclass once we have the infrastucture
	package_list =3D []
	for pkg in packages.split():
		if pkg in package_list:
			bb.error("-------------------")
			bb.error("%s is listed in PACKAGES multiple times, this leads to packagi=
ng errors." % pkg)
			bb.error("Please fix the metadata/report this as bug to OE bugtracker.")
			bb.error("-------------------")
		else:
			package_list.append(pkg)


	if (bb.data.getVar('PACKAGE_STRIP', d, True) !=3D 'no'):
		for f in (bb.data.getVar('PACKAGESTRIPFUNCS', d, True) or '').split():
			bb.build.exec_func(f, d)

	pkgdest =3D bb.data.getVar('PKGDEST', d, True)
	os.system('rm -rf %s' % pkgdest)

	seen =3D []
	main_is_empty =3D 1
	main_pkg =3D bb.data.getVar('PN', d, True)

	for pkg in package_list:
		localdata =3D bb.data.createCopy(d)
		root =3D os.path.join(pkgdest, pkg)
		bb.mkdirhier(root)

		bb.data.setVar('PKG', pkg, localdata)
		overrides =3D bb.data.getVar('OVERRIDES', localdata, True)
		if not overrides:
			raise bb.build.FuncFailed('OVERRIDES not defined')
		bb.data.setVar('OVERRIDES', overrides + ':' + pkg, localdata)
		bb.data.update_data(localdata)

		filesvar =3D bb.data.getVar('FILES', localdata, True) or ""
		files =3D filesvar.split()
		for file in files:
			if os.path.isabs(file):
				file =3D '.' + file
			if not os.path.islink(file):
				if os.path.isdir(file):
					newfiles =3D  [ os.path.join(file,x) for x in os.listdir(file) ]
					if newfiles:
						files +=3D newfiles
						continue
			globbed =3D glob.glob(file)
			if globbed:
				if [ file ] !=3D globbed:
					if not file in globbed:
						files +=3D globbed
						continue
					else:
						globbed.remove(file)
						files +=3D globbed
			if (not os.path.islink(file)) and (not os.path.exists(file)):
				continue
			if file in seen:
				continue
			seen.append(file)
			if os.path.isdir(file) and not os.path.islink(file):
				bb.mkdirhier(os.path.join(root,file))
				os.chmod(os.path.join(root,file), os.stat(file).st_mode)
				continue
			fpath =3D os.path.join(root,file)
			dpath =3D os.path.dirname(fpath)
			bb.mkdirhier(dpath)
			ret =3D bb.copyfile(file, fpath)
			if ret is False:
				raise bb.build.FuncFailed("File population failed when copying %s to %s=
" % (file, fpath))
			if pkg =3D=3D main_pkg and main_is_empty:
				main_is_empty =3D 0
		del localdata
	os.chdir(workdir)

	unshipped =3D []
	for root, dirs, files in os.walk(dvar):
		for f in files:
			path =3D os.path.join(root[len(dvar):], f)
			if ('.' + path) not in seen:
				unshipped.append(path)

	if unshipped !=3D []:
		bb.note("the following files were installed but not shipped in any packag=
e:")
		for f in unshipped:
			bb.note("  " + f)

	bb.build.exec_func("package_name_hook", d)

	for pkg in package_list:
		pkgname =3D bb.data.getVar('PKG_%s' % pkg, d, True)
		if pkgname is None:
			bb.data.setVar('PKG_%s' % pkg, pkg, d)

	dangling_links =3D {}
	pkg_files =3D {}
	for pkg in package_list:
		dangling_links[pkg] =3D []
		pkg_files[pkg] =3D []
		inst_root =3D os.path.join(pkgdest, pkg)
		for root, dirs, files in os.walk(inst_root):
			for f in files:
				path =3D os.path.join(root, f)
				rpath =3D path[len(inst_root):]
				pkg_files[pkg].append(rpath)
				try:
					s =3D os.stat(path)
				except OSError, (err, strerror):
					if err !=3D errno.ENOENT:
						raise
					target =3D os.readlink(path)
					if target[0] !=3D '/':
						target =3D os.path.join(root[len(inst_root):], target)
					dangling_links[pkg].append(os.path.normpath(target))

	for pkg in package_list:
		rdepends =3D explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.d=
ata.getVar('RDEPENDS', d, 0) or "")

		remstr =3D "libsoup-2.4 (=3D 2.29.91-r0.6)"
		if main_is_empty and remstr in rdepends:
			rdepends.remove(remstr)
		for l in dangling_links[pkg]:
			found =3D False
			bb.debug(1, "%s contains dangling link %s" % (pkg, l))
			for p in package_list:
				for f in pkg_files[p]:
					if f =3D=3D l:
						found =3D True
						bb.debug(1, "target found in %s" % p)
						if p =3D=3D pkg:
							break
						if not p in rdepends:
							rdepends.append(p)
						break
			if found =3D=3D False:
				bb.note("%s contains dangling symlink to %s" % (pkg, l))
		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
	packages =3D bb.data.getVar('PACKAGES', d, 1).split()
	pkgdest =3D  bb.data.getVar('PKGDEST', d, 1)

	for pkg in packages:
		icon_dir =3D '%s/%s/%s/icons' % (pkgdest, pkg, bb.data.getVar('datadir', =
d, 1))
		if not os.path.exists(icon_dir):
			continue

		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)

		postinst =3D bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or bb.data.get=
Var('pkg_postinst', d, 1)
		if not postinst:
			postinst =3D '#!/bin/sh\n'
		postinst +=3D bb.data.getVar('gtk_icon_cache_postinst', d, 1)
		bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)

		postrm =3D bb.data.getVar('pkg_postrm_%s' % pkg, d, 1) or bb.data.getVar(=
'pkg_postrm', d, 1)
		if not postrm:
			postrm =3D '#!/bin/sh\n'
		postrm +=3D bb.data.getVar('gtk_icon_cache_postrm', d, 1)
		bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
	import re
	packages =3D bb.data.getVar('PACKAGES', d, 1).split()
	pkgdest =3D  bb.data.getVar('PKGDEST', d, 1)

	for pkg in packages:
		schema_dir =3D '%s/%s/etc/gconf/schemas' % (pkgdest, pkg)
		schemas =3D []
		schema_re =3D re.compile(".*\.schemas$")
		if os.path.exists(schema_dir):
			for f in os.listdir(schema_dir):
				if schema_re.match(f):
					schemas.append(f)
		if schemas !=3D []:
			bb.note("adding gconf postinst and prerm scripts to %s" % pkg)
			bb.data.setVar('SCHEMA_FILES', " ".join(schemas), d)
			postinst =3D bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or bb.data.ge=
tVar('pkg_postinst', d, 1)
			if not postinst:
				postinst =3D '#!/bin/sh\n'
			postinst +=3D bb.data.getVar('gconf_postinst', d, 1)
			bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
			prerm =3D bb.data.getVar('pkg_prerm_%s' % pkg, d, 1) or bb.data.getVar('=
pkg_prerm', d, 1)
			if not prerm:
				prerm =3D '#!/bin/sh\n'
			prerm +=3D bb.data.getVar('gconf_prerm', d, 1)
			bb.data.setVar('pkg_prerm_%s' % pkg, prerm, d)

	import os.path, re
	packages =3D bb.data.getVar('PACKAGES', d, 1).split()
	pkgdest =3D  bb.data.getVar('PKGDEST', d, 1)

	for pkg in packages:
		mime_dir =3D '%s/%s/usr/share/mime/packages' % (pkgdest, pkg)
		mimes =3D []
		mime_re =3D re.compile(".*\.xml$")
		if os.path.exists(mime_dir):
			for f in os.listdir(mime_dir):
				if mime_re.match(f):
					mimes.append(f)
		if mimes !=3D []:
			bb.note("adding mime postinst and postrm scripts to %s" % pkg)
			postinst =3D bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or bb.data.ge=
tVar('pkg_postinst', d, 1)
			if not postinst:
				postinst =3D '#!/bin/sh\n'
			postinst +=3D bb.data.getVar('mime_postinst', d, 1)
			bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
			postrm =3D bb.data.getVar('pkg_postrm_%s' % pkg, d, 1) or bb.data.getVar=
('pkg_postrm', d, 1)
			if not postrm:
				postrm =3D '#!/bin/sh\n'
			postrm +=3D bb.data.getVar('mime_postrm', d, 1)
			bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
			bb.note("adding freedesktop-mime-info dependency to %s" % pkg)
			rdepends =3D explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.=
data.getVar('RDEPENDS', d, 0) or "")
			rdepends.append("freedesktop-mime-info")
			bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
}


python do_clean () {
	"""
	Clear the build and temp directories
	"""

	removepkg =3D bb.data.expand("staging-libsoup-2.4-armv5te-angstrom-linux-g=
nueabi", d)
	pstage_cleanpackage(removepkg, d)

	stagepkg =3D bb.data.expand("/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/p=
stage/angstromglibc/staging-libsoup-2.4-armv5te-angstrom-linux-gnueabi_2.29=
.91-r0_armv5te-linux-gnueabi.ipk", d)
	if os.path.exists(stagepkg):
		bb.note("Removing staging package %s" % base_path_out(stagepkg, d))
	oe.path.remove(stagepkg)
	oe.path.remove(stagepkg + ".md5")
	"""clear the build and temp directories"""
	dir =3D bb.data.expand("/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/work/a=
rmv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0", d)
	if dir =3D=3D '//': raise bb.build.FuncFailed("wrong DATADIR")
	bb.note("removing " + base_path_out(dir, d))
	os.system('rm -rf ' + dir)

	dir =3D "%s.*" % bb.data.expand(bb.data.getVar('STAMP', d), d)
	bb.note("removing " + base_path_out(dir, d))
	os.system('rm -f '+ dir)
}


python insane_mapping_rename_hook () {
	bb.build.exec_func('package_mapping_rename_hook', d)
}


python package_depchains () {
	"""
	For a given set of prefix and postfix modifiers, make those packages
	RRECOMMENDS on the corresponding packages for its RDEPENDS.

	Example:  If package A depends upon package B, and A's .bb emits an
	A-dev package, this would make A-dev Recommends: B-dev.

	If only one of a given suffix is specified, it will take the RRECOMMENDS
	based on the RDEPENDS of *all* other packages. If more than one of a given
	suffix is specified, its will only use the RDEPENDS of the single parent
	package.
	"""

	packages  =3D bb.data.getVar('PACKAGES', d, True)
	postfixes =3D (bb.data.getVar('DEPCHAIN_POST', d, True) or '').split()
	prefixes  =3D (bb.data.getVar('DEPCHAIN_PRE', d, True) or '').split()

	def pkg_adddeprrecs(pkg, base, suffix, getname, depends, d):

		#bb.note('depends for %s is %s' % (base, depends))
		rreclist =3D explode_deps(bb.data.getVar('RRECOMMENDS_' + pkg, d, True) o=
r bb.data.getVar('RRECOMMENDS', d, True) or "")

		for depend in depends:
			if depend.find('-native') !=3D -1 or depend.find('-cross') !=3D -1 or de=
pend.startswith('virtual/'):
				#bb.note("Skipping %s" % depend)
				continue
			if depend.endswith('-dev'):
				depend =3D depend.replace('-dev', '')
			if depend.endswith('-dbg'):
				depend =3D depend.replace('-dbg', '')
			pkgname =3D getname(depend, suffix)
			#bb.note("Adding %s for %s" % (pkgname, depend))
			if not pkgname in rreclist:
				rreclist.append(pkgname)

		#bb.note('setting: RRECOMMENDS_%s=3D%s' % (pkg, ' '.join(rreclist)))
		bb.data.setVar('RRECOMMENDS_%s' % pkg, ' '.join(rreclist), d)

	def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):

		#bb.note('rdepends for %s is %s' % (base, rdepends))
		rreclist =3D explode_deps(bb.data.getVar('RRECOMMENDS_' + pkg, d, True) o=
r bb.data.getVar('RRECOMMENDS', d, True) or "")

		for depend in rdepends:
			if depend.endswith('-dev'):
				depend =3D depend.replace('-dev', '')
			if depend.endswith('-dbg'):
				depend =3D depend.replace('-dbg', '')
			pkgname =3D getname(depend, suffix)
			if not pkgname in rreclist:
				rreclist.append(pkgname)

		#bb.note('setting: RRECOMMENDS_%s=3D%s' % (pkg, ' '.join(rreclist)))
		bb.data.setVar('RRECOMMENDS_%s' % pkg, ' '.join(rreclist), d)

	def add_dep(list, dep):
		dep =3D dep.split(' (')[0].strip()
		if dep not in list:
			list.append(dep)

	depends =3D []
	for dep in explode_deps(bb.data.getVar('DEPENDS', d, True) or ""):
		add_dep(depends, dep)

	rdepends =3D []
	for dep in explode_deps(bb.data.getVar('RDEPENDS', d, True) or ""):
		add_dep(rdepends, dep)

	for pkg in packages.split():
		for dep in explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, True) or "")=
:
			add_dep(rdepends, dep)

	#bb.note('rdepends is %s' % rdepends)

	def post_getname(name, suffix):
		return '%s%s' % (name, suffix)
	def pre_getname(name, suffix):
		return '%s%s' % (suffix, name)

	pkgs =3D {}
	for pkg in packages.split():
		for postfix in postfixes:
			if pkg.endswith(postfix):
				if not postfix in pkgs:
					pkgs[postfix] =3D {}
				pkgs[postfix][pkg] =3D (pkg[:-len(postfix)], post_getname)

		for prefix in prefixes:
			if pkg.startswith(prefix):
				if not prefix in pkgs:
					pkgs[prefix] =3D {}
				pkgs[prefix][pkg] =3D (pkg[:-len(prefix)], pre_getname)

	for suffix in pkgs:
		for pkg in pkgs[suffix]:
			(base, func) =3D pkgs[suffix][pkg]
			if suffix =3D=3D "-dev" and not pkg.startswith("kernel-module-"):
				pkg_adddeprrecs(pkg, base, suffix, func, depends, d)
			if len(pkgs[suffix]) =3D=3D 1:
				pkg_addrrecs(pkg, base, suffix, func, rdepends, d)
			else:
				rdeps =3D []
				for dep in explode_deps(bb.data.getVar('RDEPENDS_' + base, d, True) or =
bb.data.getVar('RDEPENDS', d, True) or ""):
					add_dep(rdeps, dep)
				pkg_addrrecs(pkg, base, suffix, func, rdeps, d)
}


python do_package_qa () {
    bb.debug(2, "DO PACKAGE QA")
    pkgdest =3D bb.data.getVar('PKGDEST', d, True)
    packages =3D bb.data.getVar('PACKAGES',d, True)

    # no packages should be scanned
    if not packages:
        return

    checks =3D [package_qa_check_rpath, package_qa_check_dev,
              package_qa_check_perm, package_qa_check_arch,
              package_qa_check_desktop, package_qa_hash_style,
              package_qa_check_dbg]
    walk_sane =3D True
    rdepends_sane =3D True
    for package in packages.split():
        if bb.data.getVar('INSANE_SKIP_' + package, d, True):
            bb.note("package %s skipped" % package)
            continue

        bb.debug(1, "Checking Package: %s" % package)
        path =3D "%s/%s" % (pkgdest, package)
        if not package_qa_walk(path, checks, package, d):
            walk_sane  =3D False
        if not package_qa_check_rdepends(package, pkgdest, d):
            rdepends_sane =3D False

    if not walk_sane or not rdepends_sane:
        bb.fatal("QA run found fatal errors. Please consider fixing them.")
    bb.debug(2, "DONE with PACKAGE QA")
}


python package_ipk_fn () {
	from bb import data
	bb.data.setVar('PKGFN', bb.data.getVar('PKG',d), d)
}


python packagedstage_stampfixing_eventhandler () {
    if bb.event.getName(e) =3D=3D "StampUpdate":
        taskscovered =3D bb.data.getVar("PSTAGE_TASKS_COVERED", e.data, 1).=
split()
        for (fn, task) in e.targets:
            # strip off 'do_'
            task =3D task[3:]
            if task in taskscovered:
                stamp =3D "%s.do_stage_package_populated" % e.stampPrefix[f=
n]
                if os.path.exists(stamp):
                    # We're targetting a task which was skipped with packag=
ed staging
                    # so we need to remove the autogenerated stamps.
                    for task in taskscovered:
                        covered =3D "%s.do_%s" % (e.stampPrefix[fn], task)
                        oe.path.remove(covered)
                    oe.path.remove(stamp)
}


python do_cleanall () {
    pass
}


python do_fetch () {
	bb.build.exec_func('base_do_fetch', d)
}


python do_package_ipk () {
	import re, copy

	workdir =3D bb.data.getVar('WORKDIR', d, 1)
	if not workdir:
		bb.error("WORKDIR not defined, unable to package")
		return


	outdir =3D bb.data.getVar('DEPLOY_DIR_IPK', d, 1)
	if not outdir:
		bb.error("DEPLOY_DIR_IPK not defined, unable to package")
		return

	dvar =3D bb.data.getVar('D', d, 1)
	if not dvar:
		bb.error("D not defined, unable to package")
		return
	bb.mkdirhier(dvar)

	tmpdir =3D bb.data.getVar('TMPDIR', d, 1)

	if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os=
.R_OK):
		os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))

	pkgdest =3D bb.data.getVar('PKGDEST', d, 1)
	bb.mkdirhier(pkgdest)

	packages =3D bb.data.getVar('PACKAGES', d, True)
	for pkg in packages.split():
		localdata =3D bb.data.createCopy(d)
		root =3D "%s/%s" % (pkgdest, pkg)
		bb.mkdirhier(root)

		lf =3D bb.utils.lockfile(root + ".lock")

		bb.data.setVar('ROOT', '', localdata)
		bb.data.setVar('ROOT_%s' % pkg, root, localdata)
		pkgname =3D bb.data.getVar('PKG_%s' % pkg, localdata, 1)
		if not pkgname:
			pkgname =3D pkg
		bb.data.setVar('PKG', pkgname, localdata)

		overrides =3D bb.data.getVar('OVERRIDES', localdata, True)
		if not overrides:
			raise bb.build.FuncFailed('OVERRIDES not defined')
		bb.data.setVar('OVERRIDES', overrides + ':' + pkg, localdata)

		bb.data.update_data(localdata)
		basedir =3D os.path.join(os.path.dirname(root))
		arch =3D bb.data.getVar('PACKAGE_ARCH', localdata, 1)
		pkgoutdir =3D "%s/%s" % (outdir, arch)
		bb.mkdirhier(pkgoutdir)
		os.chdir(root)
		from glob import glob
		g =3D glob('*') + glob('.[!.]*')
		try:
			del g[g.index('CONTROL')]
			del g[g.index('./CONTROL')]
		except ValueError:
			pass
		if not g and bb.data.getVar('ALLOW_EMPTY', localdata) !=3D "1":
			bb.note("Not creating empty archive for %s-%s" % (pkg, bb.data.expand('2=
.29.91-r0.6', localdata)))
			bb.utils.unlockfile(lf)
			continue

		controldir =3D os.path.join(root, 'CONTROL')
		bb.mkdirhier(controldir)
		try:
			ctrlfile =3D file(os.path.join(controldir, 'control'), 'w')
		except OSError:
			bb.utils.unlockfile(lf)
			raise bb.build.FuncFailed("unable to open control file for writing.")

		fields =3D []
		pe =3D bb.data.getVar('PE', d, 1)
		if pe and int(pe) > 0:
			fields.append(["Version: %s:%s-%s\n", ['PE', 'PKGV', 'PKGR']])
		else:
			fields.append(["Version: %s-%s\n", ['PKGV', 'PKGR']])
		fields.append(["Description: %s\n", ['DESCRIPTION']])
		fields.append(["Section: %s\n", ['SECTION']])
		fields.append(["Priority: %s\n", ['PRIORITY']])
		fields.append(["Maintainer: %s\n", ['MAINTAINER']])
		fields.append(["License: %s\n", ['LICENSE']])
		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
		fields.append(["OE: %s\n", ['PN']])
		fields.append(["Homepage: %s\n", ['HOMEPAGE']])

		def pullData(l, d):
			l2 =3D []
			for i in l:
				l2.append(bb.data.getVar(i, d, 1))
			return l2

		ctrlfile.write("Package: %s\n" % pkgname)
		# check for required fields
		try:
			for (c, fs) in fields:
				for f in fs:
					if bb.data.getVar(f, localdata) is None:
						raise KeyError(f)
				ctrlfile.write(c % tuple(pullData(fs, localdata)))
		except KeyError:
			import sys
			(type, value, traceback) =3D sys.exc_info()
			ctrlfile.close()
			bb.utils.unlockfile(lf)
			raise bb.build.FuncFailed("Missing field for ipk generation: %s" % value=
)
		# more fields

		bb.build.exec_func("mapping_rename_hook", localdata)

		rdepends =3D explode_deps(bb.data.getVar("RDEPENDS", localdata, 1) or "")
		rrecommends =3D explode_deps(bb.data.getVar("RRECOMMENDS", localdata, 1) =
or "")
		rsuggests =3D (bb.data.getVar("RSUGGESTS", localdata, 1) or "").split()
		rprovides =3D (bb.data.getVar("RPROVIDES", localdata, 1) or "").split()
		rreplaces =3D (bb.data.getVar("RREPLACES", localdata, 1) or "").split()
		rconflicts =3D (bb.data.getVar("RCONFLICTS", localdata, 1) or "").split()

		if not '-locale-' and not '-dbg' and not '-dev' in pkgname:
			rdepends.append('%s-locale*' % pkgname)

		if rdepends:
			ctrlfile.write("Depends: %s\n" % ", ".join(rdepends))
		if rsuggests:
			ctrlfile.write("Suggests: %s\n" % ", ".join(rsuggests))
		if rrecommends:
			ctrlfile.write("Recommends: %s\n" % ", ".join(rrecommends))
		if rprovides:
			ctrlfile.write("Provides: %s\n" % ", ".join(rprovides))
		if rreplaces:
			ctrlfile.write("Replaces: %s\n" % ", ".join(rreplaces))
		if rconflicts:
			ctrlfile.write("Conflicts: %s\n" % ", ".join(rconflicts))
		src_uri =3D bb.data.getVar("SRC_URI", localdata, 1) or d.getVar("FILE", T=
rue)
		src_uri =3D re.sub("\s+", " ", src_uri)
		ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
		ctrlfile.close()

		for script in ["preinst", "postinst", "prerm", "postrm"]:
			scriptvar =3D bb.data.getVar('pkg_%s' % script, localdata, 1)
			if not scriptvar:
				continue
			try:
				scriptfile =3D file(os.path.join(controldir, script), 'w')
			except OSError:
				bb.utils.unlockfile(lf)
				raise bb.build.FuncFailed("unable to open %s script file for writing." =
% script)
			scriptfile.write(scriptvar)
			scriptfile.close()
			os.chmod(os.path.join(controldir, script), 0755)

		conffiles_str =3D bb.data.getVar("CONFFILES", localdata, 1)
		if conffiles_str:
			try:
				conffiles =3D file(os.path.join(controldir, 'conffiles'), 'w')
			except OSError:
				bb.utils.unlockfile(lf)
				raise bb.build.FuncFailed("unable to open conffiles for writing.")
			for f in conffiles_str.split():
				conffiles.write('%s\n' % f)
			conffiles.close()

		os.chdir(basedir)
		ret =3D os.system("PATH=3D\"%s\" %s %s %s" % (bb.data.getVar("PATH", loca=
ldata, 1),
                                                          bb.data.getVar("I=
PKGBUILDCMD",d,1), pkg, pkgoutdir))
		if ret !=3D 0:
			bb.utils.unlockfile(lf)
			raise bb.build.FuncFailed("ipkg-build execution failed")

		bb.utils.prunedir(controldir)
		bb.utils.unlockfile(lf)
}


python read_shlibdeps () {
	packages =3D bb.data.getVar('PACKAGES', d, True).split()
	for pkg in packages:
		rdepends =3D explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.d=
ata.getVar('RDEPENDS', d, 0) or "")
		for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
			depsfile =3D bb.data.expand("/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6=
/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/packages-split/=
" + pkg + extension, d)
			if os.access(depsfile, os.R_OK):
				fd =3D file(depsfile)
				lines =3D fd.readlines()
				fd.close()
				for l in lines:
					rdepends.append(l.rstrip())
		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
}


python do_distclean () {
	"""clear downloaded sources, build and temp directories"""

	bb.build.exec_func('do_clean', d)

	src_uri =3D bb.data.getVar('SRC_URI', d, 1)
	if not src_uri:
		return

	for uri in src_uri.split():
		if bb.decodeurl(uri)[0] =3D=3D "file":
			continue

		try:
			local =3D bb.data.expand(bb.fetch.localpath(uri, d), d)
		except bb.MalformedUrl, e:
			bb.debug(1, 'Unable to generate local path for malformed uri: %s' % e)
		else:
			bb.note("removing %s" % base_path_out(local, d))
			try:
				if os.path.exists(local + ".md5"):
					os.remove(local + ".md5")
				if os.path.exists(local):
					os.remove(local)
			except OSError, e:
				bb.note("Error in removal: %s" % e)
}


python do_checkuri () {
	import sys

	localdata =3D bb.data.createCopy(d)
	bb.data.update_data(localdata)

	src_uri =3D bb.data.getVar('SRC_URI', localdata, 1)

	try:
		bb.fetch.init(src_uri.split(),d)
	except bb.fetch.NoMethodError:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("No method: %s" % value)

	try:
		bb.fetch.checkstatus(localdata)
	except bb.fetch.MissingParameterError:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("Missing parameters: %s" % value)
	except bb.fetch.FetchError:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("Fetch failed: %s" % value)
	except bb.fetch.MD5SumError:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("MD5  failed: %s" % value)
	except:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("Unknown fetch Error: %s" % value)
}


python base_do_fetch () {
	import sys

	localdata =3D bb.data.createCopy(d)
	bb.data.update_data(localdata)

	src_uri =3D bb.data.getVar('SRC_URI', localdata, 1)
	if not src_uri:
		return 1

	try:
		bb.fetch.init(src_uri.split(),d)
	except bb.fetch.NoMethodError:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("No method: %s" % value)
	except bb.MalformedUrl:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("Malformed URL: %s" % value)

	try:
		bb.fetch.go(localdata)
	except bb.fetch.MissingParameterError:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("Missing parameters: %s" % value)
	except bb.fetch.FetchError:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("Fetch failed: %s" % value)
	except bb.fetch.MD5SumError:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("MD5  failed: %s" % value)
	except:
		(type, value, traceback) =3D sys.exc_info()
		raise bb.build.FuncFailed("Unknown fetch Error: %s" % value)


	pv =3D bb.data.getVar('PV', d, True)
	pn =3D bb.data.getVar('PN', d, True)

	# Check each URI
	first_uri =3D True
	for url in src_uri.split():
		localpath =3D bb.data.expand(bb.fetch.localpath(url, localdata), localdat=
a)
		(type,host,path,_,_,params) =3D bb.decodeurl(url)
		uri =3D "%s://%s%s" % (type,host,path)
		try:
			if type in [ "http", "https", "ftp", "ftps" ]:
				# We provide a default shortcut of plain [] for the first fetch uri
				# Explicit names in any uri overrides this default.
				if not "name" in params and first_uri:
					first_uri =3D False
					params["name"] =3D ""
				if not base_chk_file(pn, pv, uri, localpath, params, d):
					if not bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS", d, True):
						bb.fatal("%s-%s: %s cannot check archive integrity" % (pn,pv,uri))
					else:
						bb.note("%s-%s: %s cannot check archive integrity" % (pn,pv,uri))
		except Exception:
			raise bb.build.FuncFailed("Checksum of '%s' failed" % uri)
}


python do_populate_sysroot () {
    #
    # if do_stage exists, we're legacy. In that case run the do_stage,
    # modify the SYSROOT_DESTDIR variable and then run the staging preproce=
ss
    # functions against staging directly.
    #
    # Otherwise setup a destdir, copy the results from do_install
    # and run the staging preprocess against that
    #
    pstageactive =3D (bb.data.getVar("PSTAGING_ACTIVE", d, True) =3D=3D "1"=
)
    lockfile =3D bb.data.getVar("SYSROOT_LOCK", d, True)
    stagefunc =3D bb.data.getVar('do_stage', d, True)
    legacy =3D is_legacy_staging(d)
    if legacy:
        bb.data.setVar("SYSROOT_DESTDIR", "", d)
        bb.note("Legacy staging mode for %s" % bb.data.getVar("FILE", d, Tr=
ue))

        try:
            file =3D open("%s/legacy-staging.log" % bb.data.getVar("TMPDIR"=
, d, 1), "a")
	    file.write("%s\n" % bb.data.getVar("FILE", d, True))
	    file.close()
        except:
            pass

        if bb.data.getVarFlags('do_stage', d) is None:
            bb.fatal("This recipe (%s) has a do_stage_prepend or do_stage_a=
ppend and do_stage now doesn't exist. Please rename this to do_stage()" % b=
b.data.getVar("FILE", d, True))
        lock =3D bb.utils.lockfile(lockfile)
        bb.build.exec_func('populate_sysroot_prehook', d)
        bb.build.exec_func('do_stage', d)
        for f in (bb.data.getVar('SYSROOT_PREPROCESS_FUNCS', d, True) or ''=
).split():
            bb.build.exec_func(f, d)
        bb.build.exec_func('populate_sysroot_posthook', d)
        bb.utils.unlockfile(lock)
    else:
        dest =3D bb.data.getVar('D', d, True)
        sysrootdest =3D bb.data.expand('/home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/sysroot=
-destdir//home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/sysroots/armv5te-angst=
rom-linux-gnueabi', d)
        bb.mkdirhier(sysrootdest)

        bb.build.exec_func("sysroot_stage_all", d)
        #os.system('cp -pPR %s/* %s/' % (dest, sysrootdest))
        for f in (bb.data.getVar('SYSROOT_PREPROCESS_FUNCS', d, True) or ''=
).split():
            bb.build.exec_func(f, d)
        if pstageactive:
            bb.build.exec_func("packagedstaging_fastpath", d)

        lock =3D bb.utils.lockfile(lockfile)
        os.system(bb.data.expand('cp -pPR /home/DRESEARCH/sledz/work/HydraI=
P/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/sysro=
ot-destdir//home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/* /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.6/', d))
        bb.utils.unlockfile(lock)
}


python __anonymous () {
None}


python staging_package_libtoolhack () {
	# Deal with libtool not supporting sysroots and add our new
	# staging location
        tmpdir =3D bb.data.getVar('TMPDIR', d, True)
        staging =3D bb.data.getVar('STAGING_DIR', d, True)
        fixmefn =3D  staging + "/fixmepath"
        try:
            fixmefd =3D open(fixmefn,"r")
            fixmefiles =3D fixmefd.readlines()
            fixmefd.close()
            oe.path.remove(fixmefn)
            for file in fixmefiles:
                oe_run(d, "sed -i -e s:FIXMESTAGINGDIR:%s:g %s" % (staging,=
 tmpdir + '/' + file))
        except IOError:
            pass
}


python read_subpackage_metadata () {
	data =3D read_pkgdata(bb.data.getVar('PN', d, 1), d)

	for key in data.keys():
		bb.data.setVar(key, data[key], d)

	for pkg in bb.data.getVar('PACKAGES', d, 1).split():
		sdata =3D read_subpkgdata(pkg, d)
		for key in sdata.keys():
			bb.data.setVar(key, sdata[key], d)
}


python do_setscene () {
	bb.build.exec_func('base_do_setscene', d)
}


python do_package () {
	bb.build.exec_func('insane_do_package', d)
}


python do_qa_staging () {
    bb.debug(2, "QA checking staging")

    if not package_qa_check_staged(bb.data.getVar('STAGING_LIBDIR',d,True),=
 d):
        bb.fatal("QA staging was broken by the package built above")
}


python do_distribute_sources () {
	bb.build.exec_func("do_fetch", d)

	cmd =3D bb.data.getVar('SRC_DISTRIBUTECOMMAND', d, 1)
	if not cmd:
		raise bb.build.FuncFailed("Unable to distribute sources, SRC_DISTRIBUTECO=
MMAND not set")

	try:
		dlonly =3D int(d.getVar("SRC_DISTRIBUTE_DLONLY", 1))
	except ValueError:
		raise bb.build.FuncFailed("Invalid value for SRC_DISTRIBUTE_DLONLY: expec=
ted integer.")
	dldir =3D os.path.realpath(d.getVar("DL_DIR", 1) or "")

	licenses =3D (bb.data.getVar('LICENSE', d, 1) or "unknown").split()
	urldatadict =3D bb.fetch.init(d.getVar("SRC_URI", True).split(), d, True)
	for url, urldata in urldatadict.iteritems():
		if not urldata.setup:
			urldata.setup_localpath(d)

		local =3D urldata.localpath
		if dlonly and dldir and not \
		   os.path.realpath(local).startswith(dldir + os.path.sep):
			continue

		bb.data.setVar('SRC', os.path.abspath(local), d)
		for license in licenses:
			for entry in license.split("|"):
				bb.data.setVar('LIC', entry, d)
				bb.build.exec_func('SRC_DISTRIBUTECOMMAND', d)
}


python packagestage_scenefunc () {
    import glob
    if bb.data.getVar("PSTAGING_ACTIVE", d, 1) =3D=3D "0":
        return

    bb.build.exec_func("staging_helper", d)

    removepkg =3D bb.data.expand("staging-libsoup-2.4-armv5te-angstrom-linu=
x-gnueabi", d)

    pstage_cleanpackage(removepkg, d)

    stagepkg =3D bb.data.expand("/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
6/pstage/angstromglibc/staging-libsoup-2.4-armv5te-angstrom-linux-gnueabi_2=
.29.91-r0_armv5te-linux-gnueabi.ipk", d)
    if not os.path.exists(stagepkg):
        staging_fetch(stagepkg, d)

    if os.path.exists(stagepkg):
        pstage_set_pkgmanager(d)
        file =3D bb.data.getVar("FILE", d, True)
        bb.debug(2, "Packaged staging active for %s\n" % file)

        #
        # Install the staging package somewhere temporarily so we can extra=
ct the stamp files
        #
        bb.mkdirhier(bb.data.expand("/home/DRESEARCH/sledz/work/HydraIP/OE/=
tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/tstage//us=
r/lib/opkg/info/ ", d))
        cmd =3D bb.data.expand("stage-manager-ipkg -f /home/DRESEARCH/sledz=
/work/HydraIP/OE/tmp.6/pstage/opkg.conf -force-depends -o /home/DRESEARCH/s=
ledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-=
2.29.91-r0/tstage install", d)
        try:
            oe_run(d, "%s %s" % (cmd, stagepkg))
        except RuntimeError:
            bb.fatal("Couldn't install the staging package to a temp direct=
ory")

        #
        # Grab the staging lock now so that we don't have other threads try=
 and
        # validate or install based on these stamps being valid.  This is a
        # potential issue for certain BB_STAMP_POLICY values and enough
        # concurrent threads.
        #
        lf =3D bb.utils.lockfile(bb.data.expand("/home/DRESEARCH/sledz/work=
/HydraIP/OE/tmp.6/sysroots/staging.lock", d))

        #
        # Copy the stamp files into the main stamps directoy
        #
        cmd =3D bb.data.expand("cp -dpR /home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/tstage/=
stamps/* /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.6/stamps/", d)
        try:
            ret =3D oe_run(d, cmd)
        except RuntimeError:
            bb.utils.unlockfile(lf)
            bb.fatal("Couldn't copy the staging package stamp files")

        #
        # Iterate over the stamps seeing if they're valid. If we find any t=
hat
        # are invalid or the task wasn't in the taskgraph, assume caution a=
nd
        # do a rebuild.
        #
        # FIXME - some tasks are safe to ignore in the task graph. e.g. pac=
kage_write_*
        stageok =3D True
        taskscovered =3D bb.data.getVar("PSTAGE_TASKS_COVERED", d, True).sp=
lit()
        stamp =3D bb.data.getVar("STAMP", d, True)
        for task in taskscovered:
            task =3D 'do_' + task
            stampfn =3D "%s.%s" % (stamp, task)
            bb.debug(1, "Checking %s" % (stampfn))
            if os.path.exists(stampfn):
                stageok =3D bb.runqueue.check_stamp_fn(file, task, d)
                bb.debug(1, "Result %s" % (stageok))
                if not stageok:
                    bb.utils.unlockfile(lf)
                    break

        # Remove the stamps and files we added above
        # FIXME - we should really only remove the stamps we added
        for fname in glob.glob(stamp + '.*'):
            oe.path.remove(fname)

        oe.path.remove(bb.data.expand("/home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.6/work/armv5te-angstrom-linux-gnueabi/libsoup-2.4-2.29.91-r0/tstage",=
 d))
        if stageok:
            bb.note("Staging package found, using it for %s." % file)
            installcmd =3D bb.data.getVar("PSTAGE_INSTALL_CMD", d, 1)
            try:
                ret =3D oe_run(d, "%s %s" % (installcmd, stagepkg))
            except RuntimeError:
                bb.note("Failure installing prestage package")
            finally:
                bb.utils.unlockfile(lf)

            bb.build.exec_func("staging_package_libtoolhack", d)

            bb.build.make_stamp("do_stage_package_populated", d)
        else:
            bb.note("Staging package found but invalid for %s" % file)

}


python oe_import () {
    if isinstance(e, bb.event.ConfigParsed):
        import os, sys
        bbpath =3D e.data.getVar("BBPATH", True).split(":")
        sys.path[0:0] =3D [os.path.join(dir, "lib") for dir in bbpath]

        def inject(name, value):
            """Make a python object accessible from the metadata"""
            if hasattr(bb.utils, "_context"):
                bb.utils._context[name] =3D value
            else:
                __builtins__[name] =3D value

        for toimport in e.data.getVar("OE_IMPORTS", True).split():
            imported =3D __import__(toimport)
            inject(toimport.split(".", 1)[0], imported)
}


python do_unpack () {
	bb.build.exec_func('base_do_unpack', d)
}


python package_do_pkgconfig () {
	import re

	packages =3D bb.data.getVar('PACKAGES', d, True)
	workdir =3D bb.data.getVar('WORKDIR', d, True)
	pkgdest =3D bb.data.getVar('PKGDEST', d, True)

	shlibs_dir =3D bb.data.getVar('SHLIBSDIR', d, True)
	bb.mkdirhier(shlibs_dir)

	pc_re =3D re.compile('(.*)\.pc$')
	var_re =3D re.compile('(.*)=3D(.*)')
	field_re =3D re.compile('(.*): (.*)')

	pkgconfig_provided =3D {}
	pkgconfig_needed =3D {}
	for pkg in packages.split():
		pkgconfig_provided[pkg] =3D []
		pkgconfig_needed[pkg] =3D []
		top =3D os.path.join(pkgdest, pkg)
		for root, dirs, files in os.walk(top):
			for file in files:
				m =3D pc_re.match(file)
				if m:
					pd =3D bb.data.init()
					name =3D m.group(1)
					pkgconfig_provided[pkg].append(name)
					path =3D os.path.join(root, file)
					if not os.access(path, os.R_OK):
						continue
					f =3D open(path, 'r')
					lines =3D f.readlines()
					f.close()
					for l in lines:
						m =3D var_re.match(l)
						if m:
							name =3D m.group(1)
							val =3D m.group(2)
							bb.data.setVar(name, bb.data.expand(val, pd), pd)
							continue
						m =3D field_re.match(l)
						if m:
							hdr =3D m.group(1)
							exp =3D bb.data.expand(m.group(2), pd)
							if hdr =3D=3D 'Requires':
								pkgconfig_needed[pkg] +=3D exp.replace(',', ' ').split()

	pstageactive =3D bb.data.getVar('PSTAGING_ACTIVE', d, True)
	if pstageactive =3D=3D "1":
		lf =3D bb.utils.lockfile(bb.data.expand("/home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.6/sysroots/staging.lock", d))

	for pkg in packages.split():
		pkgs_file =3D os.path.join(shlibs_dir, pkg + ".pclist")
		if os.path.exists(pkgs_file):
			os.remove(pkgs_file)
		if pkgconfig_provided[pkg] !=3D []:
			f =3D open(pkgs_file, 'w')
			for p in pkgconfig_provided[pkg]:
				f.write('%s\n' % p)
			f.close()
			package_stagefile(pkgs_file, d)

	for dir in [shlibs_dir]:
		if not os.path.exists(dir):
			continue
		for file in os.listdir(dir):
			m =3D re.match('^(.*)\.pclist$', file)
			if m:
				pkg =3D m.group(1)
				fd =3D open(os.path.join(dir, file))
				lines =3D fd.readlines()
				fd.close()
				pkgconfig_provided[pkg] =3D []
				for l in lines:
					pkgconfig_provided[pkg].append(l.rstrip())

	for pkg in packages.split():
		deps =3D []
		for n in pkgconfig_needed[pkg]:
			found =3D False
			for k in pkgconfig_provided.keys():
				if n in pkgconfig_provided[k]:
					if k !=3D pkg and not (k in deps):
						deps.append(k)
					found =3D True
			if found =3D=3D False:
				bb.note("couldn't find pkgconfig module '%s' in any package" % n)
		deps_file =3D os.path.join(pkgdest, pkg + ".pcdeps")
		if os.path.exists(deps_file):
			os.remove(deps_file)
		if len(deps):
			fd =3D open(deps_file, 'w')
			for dep in deps:
				fd.write(dep + '\n')
			fd.close()
			package_stagefile(deps_file, d)

	if pstageactive =3D=3D "1":
		bb.utils.unlockfile(lf)
}


python base_do_unpack () {
    from glob import glob

    src_uri =3D d.getVar("SRC_URI", True)
    if not src_uri:
        return
    srcurldata =3D bb.fetch.init(src_uri.split(), d, True)
    filespath =3D d.getVar("FILESPATH", True).split(":")

    for url in src_uri.split():
        urldata =3D srcurldata[url]
        if urldata.type =3D=3D "file" and "*" in urldata.path:
            # The fetch code doesn't know how to handle globs, so
            # we need to handle the local bits ourselves
            for path in filespath:
                srcdir =3D oe.path.join(path, urldata.host,
                                      os.path.dirname(urldata.path))
                if os.path.exists(srcdir):
                    break
            else:
                bb.fatal("Unable to locate files for %s" % url)

            for filename in glob(oe.path.join(srcdir,
                                              os.path.basename(urldata.path=
))):
                oe_unpack(d, filename, urldata)
        else:
            local =3D urldata.localpath
            if not local:
                raise bb.build.FuncFailed('Unable to locate local file for =
%s' % url)

            oe_unpack(d, local, urldata)
}


python base_scenefunction () {
	stamp =3D bb.data.getVar('STAMP', d, 1) + ".needclean"
	if os.path.exists(stamp):
	        bb.build.exec_func("do_clean", d)
}


python recipe_sanity_eh () {
    from bb.event import getName

    if getName(e) !=3D "ConfigParsed":
        return

    d =3D e.data

    cfgdata =3D {}
    for k in d.keys():
    #for k in ["S", "PR", "PV", "PN", "DESCRIPTION", "LICENSE", "DEPENDS",
    #          "SECTION"]:
        cfgdata[k] =3D d.getVar(k, 0)

    d.setVar("__recipe_sanity_cfgdata", cfgdata)
    #d.setVar("__recipe_sanity_cfgdata", d)

    # Sick, very sick..
    from bb.data_smart import DataSmart
    old =3D DataSmart.renameVar
    def myrename(self, key, newkey):
        oldvalue =3D self.getVar(newkey, 0)
        old(self, key, newkey)
        newvalue =3D self.getVar(newkey, 0)
        if oldvalue:
            renames =3D self.getVar("__recipe_sanity_renames", 0) or set()
            renames.add((key, newkey, oldvalue, newvalue))
            self.setVar("__recipe_sanity_renames", renames)
    DataSmart.renameVar =3D myrename
}


python package_do_package () {
	packages =3D (bb.data.getVar('PACKAGES', d, True) or "").split()
	if len(packages) < 1:
		bb.debug(1, "No packages to build, skipping do_package")
		return

	workdir =3D bb.data.getVar('WORKDIR', d, True)
	outdir =3D bb.data.getVar('DEPLOY_DIR', d, True)
	dest =3D bb.data.getVar('D', d, True)
	dvar =3D bb.data.getVar('PKGD', d, True)
	pn =3D bb.data.getVar('PN', d, True)

	if not workdir or not outdir or not dest or not dvar or not pn or not pack=
ages:
		bb.error("WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable=
 to package")
		return

	for f in (bb.data.getVar('PACKAGEFUNCS', d, True) or '').split():
		bb.build.exec_func(f, d)
		package_run_hooks(f, d)
}


python base_eventhandler () {
	from bb import note, error, data
	from bb.event import getName


	name =3D getName(e)
	if name =3D=3D "TaskCompleted":
		msg =3D "package %s: task %s is complete." % (data.getVar("PF", e.data, 1=
), e.task)
	elif name =3D=3D "UnsatisfiedDep":
		msg =3D "package %s: dependency %s %s" % (e.pkg, e.dep, name[:-3].lower()=
)
	else:
		return

	# Only need to output when using 1.8 or lower, the UI code handles it
	# otherwise
	if (int(bb.__version__.split(".")[0]) <=3D 1 and int(bb.__version__.split(=
".")[1]) <=3D 8):
		if msg:
			note(msg)

	if name.startswith("BuildStarted"):
		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
		statusvars =3D bb.data.getVar("BUILDCFG_VARS", e.data, 1).split()
		statuslines =3D ["%-17s =3D \"%s\"" % (i, bb.data.getVar(i, e.data, 1) or=
 '') for i in statusvars]
		statusmsg =3D "\n%s\n%s\n" % (bb.data.getVar("BUILDCFG_HEADER", e.data, 1=
), "\n".join(statuslines))
		print statusmsg

		needed_vars =3D bb.data.getVar("BUILDCFG_NEEDEDVARS", e.data, 1).split()
		pesteruser =3D []
		for v in needed_vars:
			val =3D bb.data.getVar(v, e.data, 1)
			if not val or val =3D=3D 'INVALID':
				pesteruser.append(v)
		if pesteruser:
			bb.fatal('The following variable(s) were not set: %s\nPlease set them di=
rectly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesterus=
er))

	#
	# Handle removing stamps for 'rebuild' task
	#
	if name.startswith("StampUpdate"):
		for (fn, task) in e.targets:
			#print "%s %s" % (task, fn)
			if task =3D=3D "do_rebuild":
				dir =3D "%s.*" % e.stampPrefix[fn]
				bb.note("Removing stamps: " + dir)
				os.system('rm -f '+ dir)
				os.system('touch ' + e.stampPrefix[fn] + '.needclean')

	if not data in e.__dict__:
		return

	log =3D data.getVar("EVENTLOG", e.data, 1)
	if log:
		logfile =3D file(log, "a")
		logfile.write("%s\n" % msg)
		logfile.close()
}


python package_name_hook () {
	bb.build.exec_func('debian_package_name_hook', d)
}


python do_package_stage () {
    if bb.data.getVar("PSTAGING_ACTIVE", d, 1) !=3D "1":
        return

    #
    # Handle deploy/ packages
    #
    bb.build.exec_func("read_subpackage_metadata", d)
    stagepath =3D bb.data.getVar("PSTAGE_TMPDIR_STAGE", d, 1)
    tmpdir =3D bb.data.getVar("TMPDIR", d, True)
    packages =3D (bb.data.getVar('PACKAGES', d, 1) or "").split()
    if len(packages) > 0:
        if bb.data.inherits_class('package_ipk', d):
            ipkpath =3D bb.data.getVar('DEPLOY_DIR_IPK', d, True).replace(t=
mpdir, stagepath)
        if bb.data.inherits_class('package_deb', d):
            debpath =3D bb.data.getVar('DEPLOY_DIR_DEB', d, True).replace(t=
mpdir, stagepath)
        if bb.data.inherits_class('package_rpm', d):
            rpmpath =3D bb.data.getVar('DEPLOY_DIR_RPM', d, True).replace(t=
mpdir, stagepath)

        for pkg in packages:
            pkgname =3D bb.data.getVar('PKG_%s' % pkg, d, 1)
            if not pkgname:
                pkgname =3D pkg
            arch =3D bb.data.getVar('PACKAGE_ARCH_%s' % pkg, d, 1)
            if not arch:
                arch =3D bb.data.getVar('PACKAGE_ARCH', d, 1)
            pr =3D bb.data.getVar('PR_%s' % pkg, d, 1)
            if not pr:
                pr =3D bb.data.getVar('PR', d, 1)
            if not packaged(pkg, d):
                continue
            if bb.data.inherits_class('package_ipk', d):
                srcname =3D bb.data.expand(pkgname + "_2.29.91-" + pr + ".6=
" + "_" + arch + ".ipk", d)
                srcfile =3D bb.data.expand("/home/DRESEARCH/sledz/work/Hydr=
aIP/OE/tmp.6/deploy/glibc/ipk/" + arch + "/" + srcname, d)
                if os.path.exists(srcfile):
                    destpath =3D ipkpath + "/" + arch + "/"
                    bb.mkdirhier(destpath)
                    bb.copyfile(srcfile, destpath + srcname)

            if bb.data.inherits_class('package_deb', d):
                if arch =3D=3D 'all':
                    srcname =3D bb.data.expand(pkgname + "_2.29.91-" + pr +=
 ".6" + "_all.deb", d)
                else:
                    srcname =3D bb.data.expand(pkgname + "_2.29.91-" + pr +=
 ".6" + "_${DPKG_ARCH}.deb", d)
                srcfile =3D bb.data.expand("/home/DRESEARCH/sledz/work/Hydr=
aIP/OE/tmp.6/deploy/glibc/deb/" + arch + "/" + srcname, d)
                if os.path.exists(srcfile):
                    destpath =3D debpath + "/" + arch + "/"
                    bb.mkdirhier(destpath)
                    bb.copyfile(srcfile, destpath + srcname)

            if bb.data.inherits_class('package_rpm', d):
		version =3D bb.data.getVar('PV', d, 1)
		version =3D version.replace('-', '+')
		bb.data.setVar('RPMPV', version, d)
                srcname =3D bb.data.expand(pkgname + "-${RPMPV}-" + pr + ".=
6" + ".arm.rpm", d)
                srcfile =3D bb.data.expand("/home/DRESEARCH/sledz/work/Hydr=
aIP/OE/tmp.6/deploy/glibc/rpm/" + arch + "/" + srcname, d)
                if os.path.exists(srcfile):
                    destpath =3D rpmpath + "/" + arch + "/"
                    bb.mkdirhier(destpath)
                    bb.copyfile(srcfile, destpath + srcname)


    #
    # Handle stamps/ files
    #
    stampfn =3D bb.data.getVar("STAMP", d, True)
    destdir =3D os.path.dirname(stampfn.replace(tmpdir, stagepath))
    bb.mkdirhier(destdir)
    # We need to include the package_stage stamp in the staging package so =
create one
    bb.build.make_stamp("do_package_stage", d)
    oe_run(d, "cp -dpR %s.do_* %s/" % (stampfn, destdir))

    pstage_set_pkgmanager(d)
    bb.build.exec_func("staging_helper", d)
    bb.build.exec_func("staging_packager", d)
    lf =3D bb.utils.lockfile(bb.data.expand("/home/DRESEARCH/sledz/work/Hyd=
raIP/OE/tmp.6/sysroots/staging.lock", d))
    bb.build.exec_func("staging_package_installer", d)
    bb.utils.unlockfile(lf)
}


python base_do_patch () {
	bb.build.exec_func('patch_do_patch', d)
}


python package_ipk_install () {
	#
	# Warning - this function is not multimachine safe (see stagingdir referen=
ce)!
	#

	pkg =3D bb.data.getVar('PKG', d, 1)
	pkgfn =3D bb.data.getVar('PKGFN', d, 1)
	rootfs =3D bb.data.getVar('IMAGE_ROOTFS', d, 1)
	ipkdir =3D bb.data.getVar('DEPLOY_DIR_IPK', d, 1)
	stagingdir =3D bb.data.getVar('STAGING_DIR', d, 1)
	tmpdir =3D bb.data.getVar('TMPDIR', d, 1)

	if None in (pkg,pkgfn,rootfs):
		raise bb.build.FuncFailed("missing variables (one or more of PKG, PKGFN, =
IMAGEROOTFS)")
	try:
		bb.mkdirhier(rootfs)
		os.chdir(rootfs)
	except OSError:
		import sys
		(type, value, traceback) =3D sys.exc_info()
		print value
		raise bb.build.FuncFailed

	# Generate ipk.conf if it or the stamp doesnt exist
	conffile =3D os.path.join(stagingdir,"opkg.conf")
	if not os.access(conffile, os.R_OK):
		ipkg_archs =3D bb.data.getVar('PACKAGE_ARCHS',d)
		if ipkg_archs is None:
			bb.error("PACKAGE_ARCHS missing")
			raise FuncFailed
		ipkg_archs =3D ipkg_archs.split()
		arch_priority =3D 1

		f =3D open(conffile,"w")
		for arch in ipkg_archs:
			f.write("arch %s %s\n" % ( arch, arch_priority ))
			arch_priority +=3D 1
		f.write("src local file:%s" % ipkdir)
		f.close()


	if (not os.access(os.path.join(ipkdir,"Packages"), os.R_OK) or
		not os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),o=
s.R_OK)):
		ret =3D os.system('ipkg-make-index -p %s %s ' % (os.path.join(ipkdir, "Pa=
ckages"), ipkdir))
		if (ret !=3D 0 ):
			raise bb.build.FuncFailed
		f =3D open(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),"w")
		f.close()

	ret =3D os.system('opkg-cl  -o %s -f %s update' % (rootfs, conffile))
	ret =3D os.system('opkg-cl  -o %s -f %s install %s' % (rootfs, conffile, p=
kgfn))
	if (ret !=3D 0 ):
		raise bb.build.FuncFailed
}


python do_recipe_sanity () {
    p =3D d.getVar("P", 1)
    p =3D "%s %s %s" % (d.getVar("PN", 1), d.getVar("PV", 1), d.getVar("PR"=
, 1))

    sanitychecks =3D [
        (can_remove_FILESDIR, "candidate for removal of FILESDIR"),
        (can_remove_FILESPATH, "candidate for removal of FILESPATH"),
        #(can_use_autotools_base, "candidate for use of autotools_base"),
        (incorrect_nonempty_PACKAGES, "native or cross recipe with non-empt=
y PACKAGES"),
    ]
    cfgdata =3D d.getVar("__recipe_sanity_cfgdata", 0)

    for (func, msg) in sanitychecks:
        if func(cfgdata, d):
            __note(msg, d)

    can_remove_others(p, cfgdata, d)
    var_renames_overwrite(cfgdata, d)
    req_vars(cfgdata, d)
    bad_runtime_vars(cfgdata, d)
}


python do_patch () {
	bb.build.exec_func('base_do_patch', d)
}


python do_runstrip () {
	import stat

	dvar =3D bb.data.getVar('PKGD', d, True)
	def isexec(path):
		try:
			s =3D os.stat(path)
		except (os.error, AttributeError):
			return 0
		return (s[stat.ST_MODE] & stat.S_IEXEC)

	for root, dirs, files in os.walk(dvar):
		for f in files:
			file =3D os.path.join(root, f)
			if not os.path.islink(file) and not os.path.isdir(file) and isexec(file)=
:
				runstrip(file, d)
}


python package_do_split_locales () {
	if (bb.data.getVar('PACKAGE_NO_LOCALE', d, True) =3D=3D '1'):
		bb.debug(1, "package requested not splitting locales")
		return

	packages =3D (bb.data.getVar('PACKAGES', d, True) or "").split()

	datadir =3D bb.data.getVar('datadir', d, True)
	if not datadir:
		bb.note("datadir not defined")
		return

	dvar =3D bb.data.getVar('PKGD', d, True)
	pn =3D bb.data.getVar('PN', d, True)

	if pn + '-locale' in packages:
		packages.remove(pn + '-locale')

	localedir =3D os.path.join(dvar + datadir, 'locale')

	if not os.path.isdir(localedir):
		bb.debug(1, "No locale files in this package")
		return

	locales =3D os.listdir(localedir)

	# This is *really* broken
	mainpkg =3D packages[0]
	# At least try and patch it up I guess...
	if mainpkg.find('-dbg'):
		mainpkg =3D mainpkg.replace('-dbg', '')
	if mainpkg.find('-dev'):
		mainpkg =3D mainpkg.replace('-dev', '')

	for l in locales:
		ln =3D legitimize_package_name(l)
		pkg =3D pn + '-locale-' + ln
		packages.append(pkg)
		bb.data.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l), d)
		bb.data.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (mainpkg, ln),=
 d)
		bb.data.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln),=
 d)
		bb.data.setVar('DESCRIPTION_' + pkg, '%s translation for %s' % (l, pn), d=
)

	bb.data.setVar('PACKAGES', ' '.join(packages), d)
}


python debian_package_name_hook () {
	import glob, copy, stat, errno, re

	pkgdest =3D bb.data.getVar('PKGDEST', d, 1)
	packages =3D bb.data.getVar('PACKAGES', d, 1)

	def socrunch(s):
		s =3D s.lower().replace('_', '-')
		m =3D re.match("^(.*)(.)\.so\.(.*)$", s)
		if m is None:
			return None
		if m.group(2) in '0123456789':
			bin =3D '%s%s-%s' % (m.group(1), m.group(2), m.group(3))
		else:
			bin =3D m.group(1) + m.group(2) + m.group(3)
		dev =3D m.group(1) + m.group(2)
		return (bin, dev)

	def isexec(path):
		try:
			s =3D os.stat(path)
		except (os.error, AttributeError):
			return 0
		return (s[stat.ST_MODE] & stat.S_IEXEC)

	def auto_libname(packages, orig_pkg):
		bin_re =3D re.compile(".*/s?bin$")
		lib_re =3D re.compile(".*/lib$")
		so_re =3D re.compile("lib.*\.so")
		sonames =3D []
		has_bins =3D 0
		has_libs =3D 0
		pkg_dir =3D os.path.join(pkgdest, orig_pkg)
		for root, dirs, files in os.walk(pkg_dir):
			if bin_re.match(root) and files:
				has_bins =3D 1
			if lib_re.match(root) and files:
				has_libs =3D 1
				for f in files:
					if so_re.match(f):
						fp =3D os.path.join(root, f)
						cmd =3D "PATH=3D" + bb.data.getVar('PATH', d, 1) + " " + (bb.data.get=
Var('TARGET_PREFIX', d, 1) or "") + "objdump -p " + fp + " 2>/dev/null"
						fd =3D os.popen(cmd)
						lines =3D fd.readlines()
						fd.close()
						for l in lines:
							m =3D re.match("\s+SONAME\s+([^\s]*)", l)
							if m and not m.group(1) in sonames:
								sonames.append(m.group(1))

		bb.debug(1, 'LIBNAMES: pkg %s libs %d bins %d sonames %s' % (orig_pkg, ha=
s_libs, has_bins, sonames))
		soname =3D None
		if len(sonames) =3D=3D 1:
			soname =3D sonames[0]
		elif len(sonames) > 1:
			lead =3D bb.data.getVar('LEAD_SONAME', d, 1)
			if lead:
				r =3D re.compile(lead)
				filtered =3D []
				for s in sonames:
					if r.match(s):
						filtered.append(s)
				if len(filtered) =3D=3D 1:
					soname =3D filtered[0]
				elif len(filtered) > 1:
					bb.note("Multiple matches (%s) for LEAD_SONAME '%s'" % (", ".join(filt=
ered), lead))
				else:
					bb.note("Multiple libraries (%s) found, but LEAD_SONAME '%s' doesn't m=
atch any of them" % (", ".join(sonames), lead))
			else:
				bb.note("Multiple libraries (%s) found and LEAD_SONAME not defined" % "=
, ".join(sonames))

		if has_libs and not has_bins and soname:
			soname_result =3D socrunch(soname)
			if soname_result:
				(pkgname, devname) =3D soname_result
				for pkg in packages.split():
					if (bb.data.getVar('PKG_' + pkg, d) or bb.data.getVar('DEBIAN_NOAUTONA=
ME_' + pkg, d)):
						continue
					debian_pn =3D bb.data.getVar('DEBIANNAME_' + pkg, d)
					if debian_pn:
						newpkg =3D debian_pn
					elif pkg =3D=3D orig_pkg:
						newpkg =3D pkgname
					else:
						newpkg =3D pkg.replace(orig_pkg, devname, 1)
					if newpkg !=3D pkg:
						bb.data.setVar('PKG_' + pkg, newpkg, d)

	for pkg in (bb.data.getVar('AUTO_LIBNAME_PKGS', d, 1) or "").split():
		auto_libname(packages, pkg)
}


python populate_sysroot_prehook () {
    bb.build.exec_func("populate_sysroot_preamble", d)
}


python package_do_shlibs () {
	import re

	exclude_shlibs =3D bb.data.getVar('EXCLUDE_FROM_SHLIBS', d, 0)
	if exclude_shlibs:
		bb.debug(1, "not generating shlibs")
		return

	lib_re =3D re.compile("^lib.*\.so")
	libdir =3D bb.data.getVar('base_libdir', d, True)
	libdir_re =3D re.compile(".*%s$" % (libdir))

	packages =3D bb.data.getVar('PACKAGES', d, True)

	workdir =3D bb.data.getVar('WORKDIR', d, True)

	ver =3D bb.data.getVar('PKGV', d, True)
	if not ver:
		bb.error("PKGV not defined")
		return

	pkgdest =3D bb.data.getVar('PKGDEST', d, True)

	shlibs_dir =3D bb.data.getVar('SHLIBSDIR', d, True)
	bb.mkdirhier(shlibs_dir)

	pstageactive =3D bb.data.getVar('PSTAGING_ACTIVE', d, True)
	if pstageactive =3D=3D "1":
		lf =3D bb.utils.lockfile(bb.data.expand("/home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.6/sysroots/staging.lock", d))

	if bb.data.getVar('PACKAGE_SNAP_LIB_SYMLINKS', d, True) =3D=3D "1":
		snap_symlinks =3D True
	else:
		snap_symlinks =3D False

	if (bb.data.getVar('USE_LDCONFIG', d, True) or "1") =3D=3D "1":
		use_ldconfig =3D True
	else:
		use_ldconfig =3D False

	needed =3D {}
	private_libs =3D bb.data.getVar('PRIVATE_LIBS', d, True)
	for pkg in packages.split():
		needs_ldconfig =3D False
		bb.debug(2, "calculating shlib provides for %s" % pkg)

		pkgver =3D bb.data.getVar('PKGV_' + pkg, d, True)
		if not pkgver:
			pkgver =3D bb.data.getVar('PV_' + pkg, d, True)
		if not pkgver:
			pkgver =3D ver

		needed[pkg] =3D []
		sonames =3D list()
		top =3D os.path.join(pkgdest, pkg)
		renames =3D []
		for root, dirs, files in os.walk(top):
			for file in files:
				soname =3D None
				path =3D os.path.join(root, file)
				if (os.access(path, os.X_OK) or lib_re.match(file)) and not os.path.isl=
ink(path):
					cmd =3D bb.data.getVar('OBJDUMP', d, True) + " -p " + path + " 2>/dev/=
null"
					cmd =3D "PATH=3D\"%s\" %s" % (bb.data.getVar('PATH', d, True), cmd)
					fd =3D os.popen(cmd)
					lines =3D fd.readlines()
					fd.close()
					for l in lines:
						m =3D re.match("\s+NEEDED\s+([^\s]*)", l)
						if m:
							needed[pkg].append(m.group(1))
						m =3D re.match("\s+SONAME\s+([^\s]*)", l)
						if m:
							this_soname =3D m.group(1)
							if not this_soname in sonames:
								# if library is private (only used by package) then do not build sh=
lib for it
								if not private_libs or -1 =3D=3D private_libs.find(this_soname):
									sonames.append(this_soname)
							if libdir_re.match(root):
								needs_ldconfig =3D True
							if snap_symlinks and (file !=3D soname):
								renames.append((path, os.path.join(root, this_soname)))
		for (old, new) in renames:
			os.rename(old, new)
		shlibs_file =3D os.path.join(shlibs_dir, pkg + ".list")
		if os.path.exists(shlibs_file):
			os.remove(shlibs_file)
		shver_file =3D os.path.join(shlibs_dir, pkg + ".ver")
		if os.path.exists(shver_file):
			os.remove(shver_file)
		if len(sonames):
			fd =3D open(shlibs_file, 'w')
			for s in sonames:
				fd.write(s + '\n')
			fd.close()
			package_stagefile(shlibs_file, d)
			fd =3D open(shver_file, 'w')
			fd.write(pkgver + '\n')
			fd.close()
			package_stagefile(shver_file, d)
		if needs_ldconfig and use_ldconfig:
			bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
			postinst =3D bb.data.getVar('pkg_postinst_%s' % pkg, d, True) or bb.data=
.getVar('pkg_postinst', d, True)
			if not postinst:
				postinst =3D '#!/bin/sh\n'
			postinst +=3D bb.data.getVar('ldconfig_postinst_fragment', d, True)
			bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)

	if pstageactive =3D=3D "1":
		bb.utils.unlockfile(lf)

	shlib_provider =3D {}
	list_re =3D re.compile('^(.*)\.list$')
	for dir in [shlibs_dir]:
		if not os.path.exists(dir):
			continue
		for file in os.listdir(dir):
			m =3D list_re.match(file)
			if m:
				dep_pkg =3D m.group(1)
				fd =3D open(os.path.join(dir, file))
				lines =3D fd.readlines()
				fd.close()
				ver_file =3D os.path.join(dir, dep_pkg + '.ver')
				lib_ver =3D None
				if os.path.exists(ver_file):
					fd =3D open(ver_file)
					lib_ver =3D fd.readline().rstrip()
					fd.close()
				for l in lines:
					shlib_provider[l.rstrip()] =3D (dep_pkg, lib_ver)

	assumed_libs =3D bb.data.getVar('ASSUME_SHLIBS', d, True)
	if assumed_libs:
	    for e in assumed_libs.split():
		l, dep_pkg =3D e.split(":")
		lib_ver =3D None
		dep_pkg =3D dep_pkg.rsplit("_", 1)
		if len(dep_pkg) =3D=3D 2:
		    lib_ver =3D dep_pkg[1]
		dep_pkg =3D dep_pkg[0]
		shlib_provider[l] =3D (dep_pkg, lib_ver)

	dep_packages =3D []
	for pkg in packages.split():
		bb.debug(2, "calculating shlib requirements for %s" % pkg)

		deps =3D list()
		for n in needed[pkg]:
			if n in shlib_provider.keys():
				(dep_pkg, ver_needed) =3D shlib_provider[n]

				if dep_pkg =3D=3D pkg:
					continue

				if ver_needed:
					dep =3D "%s (>=3D %s)" % (dep_pkg, ver_needed)
				else:
					dep =3D dep_pkg
				if not dep in deps:
					deps.append(dep)
				if not dep_pkg in dep_packages:
					dep_packages.append(dep_pkg)

			else:
				bb.note("Couldn't find shared library provider for %s" % n)

		deps_file =3D os.path.join(pkgdest, pkg + ".shlibdeps")
		if os.path.exists(deps_file):
			os.remove(deps_file)
		if len(deps):
			fd =3D open(deps_file, 'w')
			for dep in deps:
				fd.write(dep + '\n')
			fd.close()
}


python do_package_write_ipk () {
	packages =3D bb.data.getVar('PACKAGES', d, True)
	if not packages:
		bb.debug(1, "No PACKAGES defined, nothing to package")
		return

	bb.build.exec_func("read_subpackage_metadata", d)
	bb.build.exec_func("do_package_ipk", d)
}


python do_qa_configure () {
    configs =3D []
    bb.debug(1, "Checking sanity of the config.log file")
    for root, dirs, files in os.walk(bb.data.getVar('WORKDIR', d, True)):
        statement =3D "grep 'CROSS COMPILE Badness:' %s > /dev/null" % \
                    os.path.join(root,"config.log")
        if "config.log" in files:
            if os.system(statement) =3D=3D 0:
                bb.fatal("""This autoconf log indicates errors, it looked a=
t host includes.
Rerun configure task after fixing this. The path was '%s'""" % root)

        if "configure.ac" in files:
            configs.append(os.path.join(root,"configure.ac"))
        if "configure.in" in files:
            configs.append(os.path.join(root, "configure.in"))

    if "gettext" not in bb.data.getVar('P', d, True):
       if bb.data.inherits_class('native', d) or bb.data.inherits_class('cr=
oss', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class=
('nativesdk', d):
          gt =3D "gettext-native"
       elif bb.data.inherits_class('cross-canadian', d):
          gt =3D "gettext-nativesdk"
       else:
          gt =3D "gettext"
       deps =3D bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or=
 "")
       if gt not in deps:
          for config in configs:
              gnu =3D "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" =
% config
              if os.system(gnu) =3D=3D 0:
                 bb.note("""Gettext required but not in DEPENDS for file %s=
.
Missing inherit gettext?""" % config)
}


python mapping_rename_hook () {
	bb.build.exec_func('insane_mapping_rename_hook', d)
}


python emit_pkgdata () {
	from glob import glob

	def write_if_exists(f, pkg, var):
		def encode(str):
			import codecs
			c =3D codecs.getencoder("string_escape")
			return c(str)[0]

		val =3D bb.data.getVar('%s_%s' % (var, pkg), d, True)
		if val:
			f.write('%s_%s: %s\n' % (var, pkg, encode(val)))
 			return
 		val =3D bb.data.getVar('%s' % (var), d, True)
 		if val:
 			f.write('%s: %s\n' % (var, encode(val)))
 		return

	packages =3D bb.data.getVar('PACKAGES', d, True)
	pkgdest =3D bb.data.getVar('PKGDEST', d, 1)
	pkgdatadir =3D bb.data.getVar('PKGDATA_DIR', d, True)

	pstageactive =3D bb.data.getVar('PSTAGING_ACTIVE', d, True)
	if pstageactive =3D=3D "1":
		lf =3D bb.utils.lockfile(bb.data.expand("/home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.6/sysroots/staging.lock", d))

	data_file =3D pkgdatadir + bb.data.expand("/libsoup-2.4" , d)
	f =3D open(data_file, 'w')
	f.write("PACKAGES: %s\n" % packages)
	f.close()
	package_stagefile(data_file, d)

	workdir =3D bb.data.getVar('WORKDIR', d, True)

	for pkg in packages.split():
		subdata_file =3D pkgdatadir + "/runtime/%s" % pkg
		sf =3D open(subdata_file, 'w')
		write_if_exists(sf, pkg, 'PN')
		write_if_exists(sf, pkg, 'PV')
		write_if_exists(sf, pkg, 'PR')
		write_if_exists(sf, pkg, 'PKGV')
		write_if_exists(sf, pkg, 'PKGR')
		write_if_exists(sf, pkg, 'DESCRIPTION')
		write_if_exists(sf, pkg, 'RDEPENDS')
		write_if_exists(sf, pkg, 'RPROVIDES')
		write_if_exists(sf, pkg, 'RRECOMMENDS')
		write_if_exists(sf, pkg, 'RSUGGESTS')
		write_if_exists(sf, pkg, 'RREPLACES')
		write_if_exists(sf, pkg, 'RCONFLICTS')
		write_if_exists(sf, pkg, 'PKG')
		write_if_exists(sf, pkg, 'ALLOW_EMPTY')
		write_if_exists(sf, pkg, 'FILES')
		write_if_exists(sf, pkg, 'pkg_postinst')
		write_if_exists(sf, pkg, 'pkg_postrm')
		write_if_exists(sf, pkg, 'pkg_preinst')
		write_if_exists(sf, pkg, 'pkg_prerm')
		sf.close()

		package_stagefile(subdata_file, d)
		#if pkgdatadir2:
		#	bb.copyfile(subdata_file, pkgdatadir2 + "/runtime/%s" % pkg)

		allow_empty =3D bb.data.getVar('ALLOW_EMPTY_%s' % pkg, d, True)
		if not allow_empty:
			allow_empty =3D bb.data.getVar('ALLOW_EMPTY', d, True)
		root =3D "%s/%s" % (pkgdest, pkg)
		os.chdir(root)
		g =3D glob('*') + glob('.[!.]*')
		if g or allow_empty =3D=3D "1":
			packagedfile =3D pkgdatadir + '/runtime/%s.packaged' % pkg
			file(packagedfile, 'w').close()
			package_stagefile(packagedfile, d)
	if pstageactive =3D=3D "1":
		bb.utils.unlockfile(lf)
}


python patch_do_patch () {
	import oe.patch
	import oe.unpack

	src_uri =3D (bb.data.getVar('SRC_URI', d, 1) or '').split()
	if not src_uri:
		return

	patchsetmap =3D {
		"patch": oe.patch.PatchTree,
		"quilt": oe.patch.QuiltTree,
		"git": oe.patch.GitApplyTree,
	}

	cls =3D patchsetmap[bb.data.getVar('PATCHTOOL', d, 1) or 'quilt']

	resolvermap =3D {
		"noop": oe.patch.NOOPResolver,
		"user": oe.patch.UserResolver,
	}

	rcls =3D resolvermap[bb.data.getVar('PATCHRESOLVE', d, 1) or 'user']

	s =3D bb.data.getVar('S', d, 1)

	path =3D os.getenv('PATH')
	os.putenv('PATH', bb.data.getVar('PATH', d, 1))

	classes =3D {}

	src_uri =3D d.getVar("SRC_URI", True).split()
	srcurldata =3D bb.fetch.init(src_uri, d, True)
	workdir =3D bb.data.getVar('WORKDIR', d, 1)
	for url in d.getVar("SRC_URI", True).split():
		urldata =3D srcurldata[url]

		local =3D urldata.localpath
		if not local:
			raise bb.build.FuncFailed('Unable to locate local file for %s' % url)

		base, ext =3D os.path.splitext(os.path.basename(local))
		if ext in ('.gz', '.bz2', '.Z'):
			local =3D oe.path.join(workdir, base)

		if not oe.unpack.is_patch(local, urldata.parm):
			continue

		parm =3D urldata.parm

		if "striplevel" in parm:
			striplevel =3D parm["striplevel"]
		elif "pnum" in parm:
			bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', ple=
ase use 'striplevel'" % url)
			striplevel =3D parm["pnum"]
		else:
			striplevel =3D '1'

		if "pname" in parm:
			pname =3D parm["pname"]
		else:
			pname =3D os.path.basename(local)

		if "mindate" in parm or "maxdate" in parm:
			pn =3D bb.data.getVar('PN', d, 1)
			srcdate =3D bb.data.getVar('SRCDATE_%s' % pn, d, 1)
			if not srcdate:
				srcdate =3D bb.data.getVar('SRCDATE', d, 1)

			if srcdate =3D=3D "now":
				srcdate =3D bb.data.getVar('DATE', d, 1)

			if "maxdate" in parm and parm["maxdate"] < srcdate:
				bb.note("Patch '%s' is outdated" % pname)
				continue

			if "mindate" in parm and parm["mindate"] > srcdate:
				bb.note("Patch '%s' is predated" % pname)
				continue


		if "minrev" in parm:
			srcrev =3D bb.data.getVar('SRCREV', d, 1)
			if srcrev and srcrev < parm["minrev"]:
				bb.note("Patch '%s' applies to later revisions" % pname)
				continue

		if "maxrev" in parm:
			srcrev =3D bb.data.getVar('SRCREV', d, 1)
			if srcrev and srcrev > parm["maxrev"]:
				bb.note("Patch '%s' applies to earlier revisions" % pname)
				continue

		if "patchdir" in parm:
			patchdir =3D parm["patchdir"]
			if not os.path.isabs(patchdir):
				patchdir =3D os.path.join(s, patchdir)
		else:
			patchdir =3D s

		if not patchdir in classes:
			patchset =3D cls(patchdir, d)
			resolver =3D rcls(patchset)
			classes[patchdir] =3D (patchset, resolver)
			patchset.Clean()
		else:
			patchset, resolver =3D classes[patchdir]

		bb.note("Applying patch '%s' (%s)" % (pname, oe.path.format_display(local=
, d)))
		try:
			patchset.Import({"file":local, "remote":url, "strippath": striplevel}, T=
rue)
		except Exception:
			import sys
			raise bb.build.FuncFailed(str(sys.exc_value))
		resolver.Resolve()
}


--------------010609010700070900050605--
