Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1ObELX-0002vl-OR
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 17:03:35 +0200
Received: (qmail invoked by alias); 20 Jul 2010 15:02:53 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp045) with SMTP; 20 Jul 2010 17:02:53 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18FSKAv4GQFaFNA9VVfQnBgULw968nrhFJjHxs/It
	+sO36+s6vE28Yn
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jul 2010 16:54:41 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201007201654.41292.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,URI_NOVOWEL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] omap3/powervr-drivers: Cleanups & fixes
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
X-List-Received-Date: Tue, 20 Jul 2010 15:03:36 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=46rom ee328e5f8b905ec8a2c3de1664679ff1c442e7fa Mon Sep 17 00:00:00 2001
=46rom: Andreas Mueller <schnitzeltony@gmx.de>
Date: Tue, 20 Jul 2010 16:15:37 +0200
Subject: [PATCH] omap3/powervr-drivers: Cleanups & fixes

1. Merge omap3-sgx-modules -> libgles-omap3:
      Reduce memory & built time consumption.
      Note: By 'inherit module' all libgles packages
      get machine specific.
2. Work around the missing (??) function omap_rev_lt_3_0()
      Reading the comment leads to the following
      interpretation: return true for SGXVersion less than
      3.x.
3. Make kernel modules buildable for kernel 2.6.33
      (fix-1.4.14.2616-for-kernel-gt-2.6.32.patch)
4. Install script 'cpu-sgx-rev' returning the SGX version
      supported by CPU (2.x / 3.x / 5.x)

Tested on gumstix / kernel 2.6.33-r80 (git/www.sakoman.com)
under xfce / all demos.

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
=2D--
 recipes/powervr-drivers/files/99-bufferclass.rules |    7 ++
 recipes/powervr-drivers/files/cputype              |    5 ++
 recipes/powervr-drivers/files/rc.pvr               |   70 ++++++++++++++++=
++++
 recipes/powervr-drivers/files/sample.desktop       |    8 ++
 recipes/powervr-drivers/libgles-omap3.inc          |   44 ++++++++++--
 .../0001-Compile-fixes-for-recent-kernels.patch    |   28 ++++++++
 ...mpile-fixes-for-recent-kernels_3.01.00.06.patch |   37 ++++++++++
 recipes/powervr-drivers/libgles-omap3/cpu-sgx-rev  |   12 ++++
 .../fix-1.4.14.2616-for-kernel-gt-2.6.32.patch     |   46 +++++++++++++
 .../powervr-drivers/libgles-omap3_3.01.00.02.bb    |   10 ++-
 .../powervr-drivers/libgles-omap3_3.01.00.06.bb    |    6 ++-
 .../0001-Compile-fixes-for-recent-kernels.patch    |   28 --------
 .../omap3-sgx-modules_1.4.14.2514.bb               |   36 ----------
 .../omap3-sgx-modules_1.4.14.2616.bb               |   38 -----------
 14 files changed, 262 insertions(+), 113 deletions(-)
 create mode 100644 recipes/powervr-drivers/files/99-bufferclass.rules
 create mode 100755 recipes/powervr-drivers/files/cputype
 create mode 100755 recipes/powervr-drivers/files/rc.pvr
 create mode 100644 recipes/powervr-drivers/files/sample.desktop
 create mode 100644 recipes/powervr-drivers/libgles-omap3/0001-Compile-fixe=
s-for-recent-kernels.patch
 create mode 100644 recipes/powervr-drivers/libgles-omap3/Compile-fixes-for=
=2Drecent-kernels_3.01.00.06.patch
 create mode 100755 recipes/powervr-drivers/libgles-omap3/cpu-sgx-rev
 create mode 100644 recipes/powervr-drivers/libgles-omap3/fix-1.4.14.2616-f=
or-kernel-gt-2.6.32.patch
 delete mode 100644 recipes/powervr-drivers/omap3-sgx-modules/0001-Compile-=
fixes-for-recent-kernels.patch
 delete mode 100644 recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
 delete mode 100644 recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb

diff --git a/recipes/powervr-drivers/files/99-bufferclass.rules b/recipes/p=
owervr-drivers/files/99-bufferclass.rules
new file mode 100644
index 0000000..780423b
=2D-- /dev/null
+++ b/recipes/powervr-drivers/files/99-bufferclass.rules
@@ -0,0 +1,7 @@
+# Give everyone access to bufferclass nodes and make a compatibility symli=
nk for the first one
+SUBSYSTEM=3D=3D"bccat", MODE=3D"0666"
+KERNEL=3D=3D"bccat0", SYMLINK+=3D"bc_cat", MODE=3D"0666"
+
+# Give everyone access to v4l nodes
+SUBSYSTEM=3D=3D"video4linux", MODE=3D"0666"
+
diff --git a/recipes/powervr-drivers/files/cputype b/recipes/powervr-driver=
s/files/cputype
new file mode 100755
index 0000000..9dc2b49
=2D-- /dev/null
+++ b/recipes/powervr-drivers/files/cputype
@@ -0,0 +1,5 @@
+#!/bin/sh
+devmem2 0x4800244c | \
+grep 'Value at address' | \
+sed -e 's/.*): //' | \
+sed -e 's/0x5C00/OMAP3503/' -e 's/0x1C00/OMAP3515/' -e 's/0x4C00/OMAP3525/=
' -e 's/0xC00/OMAP3530/'
diff --git a/recipes/powervr-drivers/files/rc.pvr b/recipes/powervr-drivers=
/files/rc.pvr
new file mode 100755
index 0000000..b84225e
=2D-- /dev/null
+++ b/recipes/powervr-drivers/files/rc.pvr
@@ -0,0 +1,70 @@
+#!/bin/sh
+PATH=3D$PATH:/usr/sbin
+
+BITSPERPIXEL=3D"$(fbset | grep geom | awk '{print $6}')"
+YRES=3D"$(fbset | grep geom | awk '{print $3}')"
+
+CPUTYPE=3D"$(cputype)"
+
+if [ "$1" =3D "" ]; then
+	echo PVR-INIT: Please use start, stop, or restart.
+	exit 1
+fi
+
+if [ "$1" =3D "stop" -o  "$1" =3D "restart" ]; then
+	echo Stopping PVR
+	rmmod bufferclass_ti
+	rmmod omaplfb 2>/dev/null
+	rmmod pvrsrvkm 2>/dev/null
+fi
+
+if [ "$1" =3D "stop" ]; then
+	exit 0
+fi
+
+# Set RGBA ordering to something the drivers like
+if [ "$BITSPERPIXEL" =3D "32" ] ; then
+	fbset -rgba 8/16,8/8,8/0,8/24
+fi
+
+# Try to enable triple buffering when there's enough VRAM
+fbset -vyres $(expr $YRES \* 3)=20
+
+if [ $CPUTYPE =3D "OMAP3530" ]; then
+	echo Starting PVR
+	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+	modprobe omaplfb
+	modprobe bufferclass_ti
+
+	pvr_maj=3D`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
+        bc_maj=3D`grep "bc" /proc/devices | cut -b1,2,3`
+
+	if [ -e /dev/pvrsrvkm ] ; then=20
+		rm -f /dev/pvrsrvkm
+	fi
+
+	mknod /dev/pvrsrvkm c $pvr_maj 0=20
+	chmod 666 /dev/pvrsrvkm
+
+	touch /etc/powervr-esrev
+
+	SAVED_ESREVISION=3D"$(cat /etc/powervr-esrev)"
+
+	devmem2 0x48004B48 w 0x2 > /dev/null
+	devmem2 0x48004B10 w 0x1 > /dev/null
+	devmem2 0x48004B00 w 0x2 > /dev/null
+
+	ES_REVISION=3D"$(devmem2 0x50000014 | sed -e s:0x10205:5: -e s:0x10201:3:=
 -e s:0x10003:2: | tail -n1 | awk -F': ' '{print $2}')"
+
+	if [ "${ES_REVISION}" !=3D "${SAVED_ESREVISION}" ] ; then
+		echo -n "Starting SGX fixup for"
+		echo " ES${ES_REVISION}.x"
+		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
+		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin=09
+		echo "${ES_REVISION}" > /etc/powervr-esrev
+	fi
+	/usr/bin/pvrsrvinit
+else
+	echo No SGX hardware, not starting PVR
+fi
+
diff --git a/recipes/powervr-drivers/files/sample.desktop b/recipes/powervr=
=2Ddrivers/files/sample.desktop
new file mode 100644
index 0000000..eea5e7c
=2D-- /dev/null
+++ b/recipes/powervr-drivers/files/sample.desktop
@@ -0,0 +1,8 @@
+[Desktop Entry]
+Name=3DNAME Demo
+Comment=3DOGLES Demo
+Exec=3DEXEC
+Icon=3Dstar
+Type=3DApplication
+Categories=3DDemos;
+
diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-dr=
ivers/libgles-omap3.inc
index d183486..e515125 100644
=2D-- a/recipes/powervr-drivers/libgles-omap3.inc
+++ b/recipes/powervr-drivers/libgles-omap3.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "libGLES for the omap3"
 LICENSE =3D "proprietary-binary"
=20
=2DPR =3D "r6"
+PR =3D "r7"
=20
 COMPATIBLE_MACHINE =3D "(dm37x-evm|am37x-evm|am3517-evm|beagleboard|cm-t35=
|igep0020|omap3-pandora|omap3-touchbook|omap3evm|omapzoom|omapzoom2|overo|p=
almpre)"
=20
@@ -18,14 +18,12 @@ PROVIDES +=3D "virtual/egl"
 #  http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxs=
dk/latest/index_FDS.html
 # 3. put the OMAP35x_*.bin file in $DL_DIR, i.e. downloads/
 #  mv OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin ./downloads/
=2D# 4. make the checksum file in ./downloads/ directory:
=2D#  cd ./downloads/
=2D#  md5sum OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin > OMAP35x_Graph=
ics_SDK_setuplinux_3_01_00_06.bin.md5
 #=20
 # voila!
=20
 SRC_URI =3D "http://install.source.dir.local/OMAP35x_Graphics_SDK_setuplin=
ux_${SGXPV}.bin \
 		   file://cputype \
+		   file://cpu-sgx-rev \
 		   file://rc.pvr \
 		   file://sample.desktop \
 		   file://99-bufferclass.rules  \
@@ -37,7 +35,7 @@ S =3D "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
 TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
 require ../ti/ti-eula-unpack.inc
=20
=2DBINLOCATION ?=3D "${S}/gfx_rel"
+BINLOCATION ?=3D "${S}/gfx_rel_es${PREFERRED_SGX_VERSION}"
 ES2LOCATION ?=3D "${S}/gfx_rel_es2.x"
 ES3LOCATION ?=3D "${S}/gfx_rel_es3.x"
 ES5LOCATION ?=3D "${S}/gfx_rel_es5.x"
@@ -72,6 +70,8 @@ TARGET_CC_ARCH +=3D " ${TARGET_LINK_HASH_STYLE} -Wl,-rpat=
h-link,${BINLOCATION} -L$
 -L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGING_DIR_TARGET}${li=
bdir}"
 PARALLEL_MAKE =3D ""
=20
+inherit module
+
 do_compile() {
 	export X11ROOT=3D"${STAGING_DIR_HOST}/usr"
 	export TOOLCHAIN=3D"${TOOLCHAIN_PATH}"
@@ -128,7 +128,28 @@ do_compile() {
 			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/tra=
iningcourses/raw || true=09
 		done
 	done
+=09
=20
+	# Modules:=09
+	# Fix unknown omap_rev_lt_3_0() in bc_cat.c version dependendent
+	filename_ugly=3D${S}/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_ca=
t.c
+	# omap_rev_lt_3_0() : Interpret as 'version less than 3'
+
+	# We're using 5.x fixed (see below)
+	#if [ '${PREFERRED_SGX_VERSION}' =3D '2.x' ]; then
+	#	sed -i s:'width_align =3D omap_rev_lt_3_0() ? 32 \: 8':'width_align =3D=
 32':g ${filename_ugly}
+	#else
+	#	sed -i s:'width_align =3D omap_rev_lt_3_0() ? 32 \: 8':'width_align =3D=
 8':g ${filename_ugly}
+	#fi
+=09
+	# The old implementation of used fixed version 5.x for kernel modules=20
+	# (see Makefile.KM and TI_PLATFORM=3Domap3630 from omap3-sgx-modules)
+	# Is that intended?
+	sed -i s:'width_align =3D omap_rev_lt_3_0() ? 32 \: 8':'width_align =3D 8=
':g ${filename_ugly}
+
+	# taken from module.bbclass (to have exactly the same conditions as in ol=
d omap3-sgx-modules)
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+	oe_runmake -C ${S}/GFX_Linux_KM ${MODULE_MAKE_FLAGS} BUILD=3D${PVRBUILD} =
TI_PLATFORM=3Domap3630
 }
=20
 do_install () {
@@ -138,6 +159,7 @@ do_install () {
=20
 	install -d ${D}${bindir}/
 	install -m 0755 ${WORKDIR}/cputype ${D}${bindir}/
+	install -m 0755 ${WORKDIR}/cpu-sgx-rev ${D}${bindir}/
=20
 	install -m 0755 ${BINLOCATION}/*_test ${D}${bindir}/
 	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
@@ -208,6 +230,12 @@ do_install () {
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/99-bufferclass.rules ${D}${sysconfdir}/udev/ru=
les.d/
=20
+	# Modules
+	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+	cp ${S}/GFX_Linux_KM/pvrsrvkm.ko \
+	   ${S}/GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb.ko  \
+	   ${S}/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
+	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
 }
=20
 PACKAGES =3D+ "${PN}-rawdemos \
@@ -229,7 +257,7 @@ FILES_${PN}-x11wsegl =3D "${libdir}/libpvrPVR2D_X11WSEG=
L.so* ${libdir}/*/libpvrPVR
=20
 CONFFILES_${PN} =3D "${sysconfdir}/powervr.ini"
=20
=2DFILES_${PN} =3D "${sysconfdir} ${libdir}/lib*.so.* ${libdir}/ES*/* ${bin=
dir}/pvrsrvinit ${bindir}/cputype ${bindir}/*/*"
+FILES_${PN} +=3D "${sysconfdir} ${libdir}/lib*.so.* ${libdir}/ES*/* ${bind=
ir}/pvrsrvinit ${bindir}/cputype ${bindir}/cpu-sgx-rev ${bindir}/*/*"
 FILES_xserver-kdrive-powervrsgx =3D "${bindir}/Xsgx"
 FILES_${PN}-tests =3D "${bindir}/*"
 FILES_${PN}-dbg =3D "${libdir}/.debug/* ${bindir}/.debug/* \
@@ -246,8 +274,6 @@ FILES_${PN}-rawtrainingcourses =3D "${bindir}/SGX/train=
ingcourses/Raw/*"
 FILES_${PN}-x11trainingcourses =3D "${bindir}/SGX/trainingcourses/X11/*"
 RRECOMMENDS_${PN}-x11trainingcourses =3D "${PN}-x11wsegl"
=20
=2D# The libs need the kernel-modules
=2DRRECOMMENDS_${PN} =3D "omap3-sgx-modules"
=20
 # The initscript calls fbset, cputype calls devmem2
 RDEPENDS_${PN} +=3D "fbset devmem2"
@@ -278,3 +304,5 @@ rm -f /etc/powervr-esrev
 ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0=20
 ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
 }
+
+
diff --git a/recipes/powervr-drivers/libgles-omap3/0001-Compile-fixes-for-r=
ecent-kernels.patch b/recipes/powervr-drivers/libgles-omap3/0001-Compile-fi=
xes-for-recent-kernels.patch
new file mode 100644
index 0000000..7ac0970
=2D-- /dev/null
+++ b/recipes/powervr-drivers/libgles-omap3/0001-Compile-fixes-for-recent-k=
ernels.patch
@@ -0,0 +1,28 @@
+From ef693358e658a7cbab4d2696108d9d4240ab8096 Mon Sep 17 00:00:00 2001
+From: Mike Rapoport <mike@compulab.co.il>
+Date: Wed, 2 Dec 2009 10:13:15 +0200
+Subject: [PATCH] Compile fixes for recent kernels
+
+---
+ .../3rdparty/dc_omap3430_linux/omaplfb_linux.c     |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_lin=
ux.c b/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
+index 935f78b..4d41829 100755
+--- a/GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
++++ b/GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
+@@ -57,7 +57,11 @@ extern int omap_dispc_request_irq(unsigned long, void (=
*)(void *), void *);
+ extern void omap_dispc_free_irq(unsigned long, void (*)(void *), void *);
+ extern void omap_dispc_set_plane_base(int plane, IMG_UINT32 phys_addr);
+ #else
++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,32)
++#include <plat/display.h>
++#else
+ #include <mach/display.h>
++#endif
+ #include <linux/console.h>
+ #include <linux/fb.h>
+ #endif
+--=20
+1.6.4.4
+
diff --git a/recipes/powervr-drivers/libgles-omap3/Compile-fixes-for-recent=
=2Dkernels_3.01.00.06.patch b/recipes/powervr-drivers/libgles-omap3/Compile=
=2Dfixes-for-recent-kernels_3.01.00.06.patch
new file mode 100644
index 0000000..3852351
=2D-- /dev/null
+++ b/recipes/powervr-drivers/libgles-omap3/Compile-fixes-for-recent-kernel=
s_3.01.00.06.patch
@@ -0,0 +1,37 @@
+--- a/GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c.ol=
d	2010-03-05 10:47:58.000000000 +0100
++++ b/GFX_Linux_KM/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c	20=
10-07-20 12:50:50.000000000 +0200
+@@ -45,10 +45,14 @@
+ #include <asm/io.h>
+=20
+ #if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,26))
++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,32)
+ #include <plat/display.h>
+ #else=20
++#include <mach/display.h>
++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,32) */
++#else=20
+ #include <asm/arch-omap/display.h>
+-#endif=20
++#endif /* (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,26)) */
+ #else
+ #if !defined (CONFIG_OMAP2_DSS)
+ #define DISPC_IRQ_VSYNC 0x0002
+@@ -56,12 +60,16 @@
+ extern void omap_dispc_free_irq(unsigned long, void (*)(void *), void *);
+ extern void omap_dispc_set_plane_base(int plane, IMG_UINT32 phys_addr);
+ #else
++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,32)
+ #include <plat/display.h>
++#else
++#include <mach/display.h>
++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,32) */
+ #include <linux/console.h>
+ #include <linux/fb.h>
+ static omap_dispc_isr_t *pOMAPLFBVSyncISRHandle =3D NULL;
+-#endif
+-#endif
++#endif /* !defined (CONFIG_OMAP2_DSS) */
++#endif /* defined (SUPPORT_TI_DSS_FW) */
+=20
+=20
+=20
diff --git a/recipes/powervr-drivers/libgles-omap3/cpu-sgx-rev b/recipes/po=
wervr-drivers/libgles-omap3/cpu-sgx-rev
new file mode 100755
index 0000000..435b6a6
=2D-- /dev/null
+++ b/recipes/powervr-drivers/libgles-omap3/cpu-sgx-rev
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# grabbed from http://processors.wiki.ti.com/index.php/GSG:_AM35x_and_OMAP=
35x_Rebuilding_the_Software#How_to_check_for_SGX_core_revision
+
+devmem2 0x48004B48 w 0x2 > /dev/null
+devmem2 0x48004B10 w 0x1 > /dev/null
+devmem2 0x48004B00 w 0x2 > /dev/null
+devmem2 0x50000014 | \
+grep 'Value at address' | \
+sed -e 's/.*): //' | \
+sed -e 's/0x10205/5.x/' -e 's/0x10201/3.x/' -e 's/0x10003/2.x/'
+
diff --git a/recipes/powervr-drivers/libgles-omap3/fix-1.4.14.2616-for-kern=
el-gt-2.6.32.patch b/recipes/powervr-drivers/libgles-omap3/fix-1.4.14.2616-=
for-kernel-gt-2.6.32.patch
new file mode 100644
index 0000000..aee4457
=2D-- /dev/null
+++ b/recipes/powervr-drivers/libgles-omap3/fix-1.4.14.2616-for-kernel-gt-2=
=2E6.32.patch
@@ -0,0 +1,46 @@
+--- a/GFX_Linux_KM/services4/system/omap3430/sysutils_linux.c.old	2010-07-=
15 14:29:21.000000000 +0200
++++ b/GFX_Linux_KM/services4/system/omap3430/sysutils_linux.c	2010-07-15 1=
4:35:24.000000000 +0200
+@@ -31,6 +31,12 @@
+ #include <linux/spinlock.h>
+ #include <asm/bug.h>
+=20
++#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,32))
++#include <linux/semaphore.h>
++#include <linux/resource.h>
++#include <plat/omap-pm.h>
++#else
++
+ #if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,31))
+ #include <linux/semaphore.h>
+ #include <plat/resource.h>
+@@ -48,6 +54,7 @@
+ #endif
+ #endif
+ #endif
++#endif
+=20
+ #include "sgxdefs.h"
+ #include "services_headers.h"
+--- a/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c.old	2010-03-=
05 10:47:57.000000000 +0100
++++ b/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2010-07-15 1=
4:35:12.000000000 +0200
+@@ -32,6 +32,12 @@
+ #include <asm/bug.h>
+ #include <linux/platform_device.h>
+=20
++#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,32))
++#include <linux/semaphore.h>
++#include <linux/resource.h>
++#include <plat/omap-pm.h>
++#else
++
+ #if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,31))
+ #include <linux/semaphore.h>
+ #include <plat/resource.h>
+@@ -48,6 +54,7 @@
+ #include <asm/arch/resource.h>
+ #endif
+ #endif
++#endif
+ #endif
+=20
+ #if	(LINUX_VERSION_CODE >  KERNEL_VERSION(2,6,27)) && \
diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb b/recipes/=
powervr-drivers/libgles-omap3_3.01.00.02.bb
index 3b68c18..14b5b07 100644
=2D-- a/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb
+++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb
@@ -1,8 +1,10 @@
=2DBINLOCATION =3D "${S}/gfx_rel_es3.x"
+PREFERRED_SGX_VERSION =3D "3.x"
=20
 require libgles-omap3.inc
=20
=2DPR =3D "r7"
+SRC_URI +=3D "file://0001-Compile-fixes-for-recent-kernels.patch \
+           "
+PR =3D "r8"
=20
 # download required binary distribution from:
 # http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsd=
k/latest/index_FDS.html
@@ -11,3 +13,7 @@ PR =3D "r7"
 SGXPV =3D "3_01_00_02"
 IMGPV =3D "1.4.14.2514"
 BINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+SRC_URI[md5sum] =3D "7e07019aa76dcdebaa8958df0f89bbe6"
+SRC_URI[sha256sum] =3D "151d7ce8cbf192a3f0c7e232a5b958cde224309be9ec74ca40=
031be7d27fa265"
+
diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb b/recipes/=
powervr-drivers/libgles-omap3_3.01.00.06.bb
index bb7994f..818a2f6 100644
=2D-- a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
+++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
@@ -1,4 +1,4 @@
=2DBINLOCATION =3D "${S}/gfx_rel_es3.x"
+PREFERRED_SGX_VERSION =3D "3.x"
=20
 ES2LOCATION =3D "${S}/gfx_rel_es2.x"
 ES3LOCATION =3D "${S}/gfx_rel_es3.x"
@@ -6,6 +6,10 @@ ES5LOCATION =3D "${S}/gfx_rel_es5.x"
=20
 require libgles-omap3.inc
=20
+SRC_URI +=3D "file://fix-1.4.14.2616-for-kernel-gt-2.6.32.patch \
+            file://Compile-fixes-for-recent-kernels_3.01.00.06.patch \
+           "
+
 # download required binary distribution from:
 # http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsd=
k/latest/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
diff --git a/recipes/powervr-drivers/omap3-sgx-modules/0001-Compile-fixes-f=
or-recent-kernels.patch=20
b/recipes/powervr-drivers/omap3-sgx-modules/0001-Compile-fixes-for-recent-k=
ernels.patch
deleted file mode 100644
index 53b1f27..0000000
=2D-- a/recipes/powervr-drivers/omap3-sgx-modules/0001-Compile-fixes-for-re=
cent-kernels.patch
+++ /dev/null
@@ -1,28 +0,0 @@
=2DFrom ef693358e658a7cbab4d2696108d9d4240ab8096 Mon Sep 17 00:00:00 2001
=2DFrom: Mike Rapoport <mike@compulab.co.il>
=2DDate: Wed, 2 Dec 2009 10:13:15 +0200
=2DSubject: [PATCH] Compile fixes for recent kernels
=2D
=2D---
=2D .../3rdparty/dc_omap3430_linux/omaplfb_linux.c     |    4 ++++
=2D 1 files changed, 4 insertions(+), 0 deletions(-)
=2D
=2Ddiff --git a/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c b/serv=
ices4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
=2Dindex 935f78b..4d41829 100755
=2D--- a/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
=2D+++ b/services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
=2D@@ -57,7 +57,11 @@ extern int omap_dispc_request_irq(unsigned long, void=
 (*)(void *), void *);
=2D extern void omap_dispc_free_irq(unsigned long, void (*)(void *), void *=
);
=2D extern void omap_dispc_set_plane_base(int plane, IMG_UINT32 phys_addr);
=2D #else
=2D+#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,32)
=2D+#include <plat/display.h>
=2D+#else
=2D #include <mach/display.h>
=2D+#endif
=2D #include <linux/console.h>
=2D #include <linux/fb.h>
=2D #endif
=2D--=20
=2D1.6.4.4
=2D
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb b/rec=
ipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
deleted file mode 100644
index 6f6e073..0000000
=2D-- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
+++ /dev/null
@@ -1,36 +0,0 @@
=2DDESCRIPTION =3D "Kernel drivers for the PowerVR SGX chipset found in the=
 omap3 SoCs"
=2DLICENSE =3D "GPLv2"
=2D
=2DPR_append =3D "a"
=2D
=2D# download required binary distribution from:
=2D# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfx=
sdk/latest/index_FDS.html
=2D# see libgles-omap3.inc for detailed installation instructions
=2D
=2DTI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
=2Drequire ../ti/ti-eula-unpack.inc
=2D
=2DSGXPV =3D "3_01_00_02"
=2DIMGPV =3D "1.4.14.2514"
=2DBINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
=2D
=2DSRC_URI =3D "http://install.source.dir.local/OMAP35x_Graphics_SDK_setupl=
inux_${SGXPV}.bin \
=2D           file://0001-Compile-fixes-for-recent-kernels.patch \
=2D"
=2DS =3D "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}/GFX_Linux_KM"
=2D
=2Dinherit module
=2D
=2DPVRBUILD =3D "release"
=2D
=2DPACKAGE_STRIP =3D "no"
=2D
=2DMAKE_TARGETS =3D " BUILD=3D${PVRBUILD}"
=2D
=2Ddo_install() {
=2D	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
=2D	cp ${S}/pvrsrvkm.ko \
=2D	   ${S}/services4/3rdparty/dc_omap3430_linux/omaplfb.ko  \
=2D	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
=2D	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
=2D}
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb b/rec=
ipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
deleted file mode 100644
index 202c8e6..0000000
=2D-- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
+++ /dev/null
@@ -1,38 +0,0 @@
=2DDESCRIPTION =3D "Kernel drivers for the PowerVR SGX chipset found in the=
 omap3 SoCs"
=2DLICENSE =3D "GPLv2"
=2D
=2DPR_append =3D "b"
=2D
=2D# download required binary distribution from:
=2D# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfx=
sdk/latest/index_FDS.html
=2D# see libgles-omap3.inc for detailed installation instructions
=2D
=2DTI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
=2Drequire ../ti/ti-eula-unpack.inc
=2D
=2DSGXPV =3D "3_01_00_06"
=2DIMGPV =3D "1.4.14.2616"
=2DBINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
=2D
=2DSRC_URI =3D "http://install.source.dir.local/OMAP35x_Graphics_SDK_setupl=
inux_${SGXPV}.bin \
=2D"
=2DS =3D "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}/GFX_Linux_KM"
=2D
=2Dinherit module
=2D
=2DPVRBUILD =3D "release"
=2D
=2DPACKAGE_STRIP =3D "no"
=2D
=2DMAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3Domap3630"
=2D
=2Ddo_install() {
=2D	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
=2D	cp ${S}/pvrsrvkm.ko \
=2D	   ${S}/services4/3rdparty/dc_omap3430_linux/omaplfb.ko  \
=2D	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
=2D	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
=2D}
=2D
=2DSRC_URI[md5sum] =3D "7aa37ca72f34011d353e72cc67f8aac1"
=2DSRC_URI[sha256sum] =3D "02276bc728699c36b0d2411c60f23030aa066ca6b8ed5adb=
7a40204563a227fb"
=2D-=20
1.5.3.4


