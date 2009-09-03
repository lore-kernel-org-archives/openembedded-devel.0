Received: from [64.71.152.235] (helo=lirone.symas.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hyc@symas.com>) id 1Mj2BB-0005jt-Mn
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 04:36:06 +0200
Received: from [76.91.220.157] (helo=[192.168.1.29])
	by lirone.symas.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hyc@symas.com>) id 1Mj1t0-00068z-2Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 19:17:18 -0700
Message-ID: <4A9F2725.4070208@symas.com>
Date: Wed, 02 Sep 2009 19:17:09 -0700
From: Howard Chu <hyc@symas.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64;
	rv:1.9.1b5pre) Gecko/20090819 SeaMonkey/2.0a1pre Firefox/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: TI DSP updates
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
X-List-Received-Date: Thu, 03 Sep 2009 02:36:06 -0000
X-Groupsio-MsgNum: 12924
Content-Type: multipart/mixed; boundary="------------070205080704050205010605"

--------------070205080704050205010605
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

These are the changes I made to use the latest Codec engine, DSP modules, etc. 
for OMAP3530 to build. Tested and working with gstreamer-ti on an Always 
Innovating Touch Book with linux-omap_2.6.29 kernel / Angstrom...

To actually get the dmai working on the TouchBook, I also needed this patch:

violino:~/oe/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-svnr295-r43a/TAG_2_00_01_04/dmai/packages/ti/sdo/dmai/linux> 
cat /tmp/dif2
--- Cpu.c.O	2009-09-02 18:19:47.000000000 -0700
+++ Cpu.c	2009-09-02 04:30:36.000000000 -0700
@@ -106,6 +106,7 @@
       }
       else if ((strcmp(valBuf,"OMAP3EVM Board") == 0) ||
               (strcmp(valBuf, "OMAP3 EVM") == 0) ||
+            (strcmp(valBuf, "OMAP3 Touch Book") == 0) ||
               (strcmp(valBuf, "OMAP3 Beagle Board") == 0)) {
               *device = Cpu_Device_OMAP3530;
       }

The TI video decoders support MPEG4 but don't recognize XViD by default. TI 
doesn't claim that XViD is supported, but applying this patch to the decode 
module allows the decoder to recognize it, and it works with the few samples 
I've tried:

https://gstreamer.ti.com/gf/project/gstreamer_ti/tracker/?action=TrackerItemEdit&tracker_item_id=462

To get a working codec server on the Touch Book, which has 256MB of RAM, I had 
to modify the default server config:

violino:~/oe/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cs1-omap3530-10142-r4/dvsdk_3_00_01_42/cs1omap3530_1_00_01/packages/ti/sdo/server/cs> 
diff -wu server.tcf{.O,}
--- server.tcf.O	2009-07-24 15:03:14.000000000 -0700
+++ server.tcf	2009-09-01 23:21:47.000000000 -0700
@@ -33,7 +33,7 @@
   /*
    *  Specify the Base address of the bottom of the memory space where server 
ends
    */
-var BASE_ADDR_BOTTOM  = 0x88000000
+var BASE_ADDR_BOTTOM  = 0x90000000

   /*
    *  Specify the sizes of the memory segments as per the requirements

---
The resulting DSP memory map is summarized in my setup-dsplink script:

# Start Addr    Size    Description
# -------------------------------------------
# 0x80000000   227 MB   Linux
# 0x8E300000    16 MB   CMEM
# 0x8F300000     4 KB   DSPLINK (RESET)
# 0x8F301000     1 MB   DSPLINK (MEM)
# 0x8F400000     9 MB   DDRALGHEAP
# 0x8FD00000     3 MB   DDR2 (BIOS, Codecs, Applications)

modprobe cmemk phys_start=0x8e300000 phys_end=0x8f300000 
pools=20x4096,8x131072,4x829440,1x5250000,1x1429440,1x256000

chgrp video /dev/cmem

modprobe dsplinkk

modprobe lpm_omap3530

modprobe sdmak


-- 
    -- Howard Chu
    CTO, Symas Corp.           http://www.symas.com
    Director, Highland Sun     http://highlandsun.com/hyc/
    Chief Architect, OpenLDAP  http://www.openldap.org/project/


--------------070205080704050205010605
Content-Type: text/plain;
 name="dif.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dif.txt"

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 05d9a8c..b6c6357 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -2734,6 +2734,10 @@ sha256=506e07715028811b8d945c85c54ae07bc33bdd8afff1611cbb30d154ba86d04e
 md5=fcffe1618f20024fd6580f47cdc0059b
 sha256=2c1e7feec569a19d3093b136da6aa03574f94052810fe7a78cc81eb37adda24b
 
+[http://install.source.dir.com/bios_setuplinux_5_33_06.bin]
+md5=757b35272a894864e463086565056cd7
+sha256=52136fce50becd7ae711eebe8943f8a62d06d18f03f374aad8129a6e3dc7e887
+
 [ftp://ftp.gnu.org/gnu/bison/bison-2.0.tar.gz]
 md5=c17f964fd5504b88b07a183420de25e3
 sha256=31b816846903d319a6f6cd1c9aada5ff83914206cb7df69c235ae909785109a1
@@ -4302,6 +4314,10 @@ sha256=4bab529afa00cafde3bc5df2769578c88438f80c5152d4257cd0e86986f95bc4
 md5=779415872c771b580e4c6d10346b3a79
 sha256=0903c37aaa9ced2c12a9e7d4a418b7d57d5a92a0f1451afd29f70bd0da240bc8
 
+[http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-42.bin]
+md5=a1e19ef37638e977d059fd22af666301
+sha256=fc7ac2829df8d394635aa1cc704b78e93ca287111df1001e5738ae2282691219
+
 [http://downloads.sourceforge.net/cscope/cscope-15.5.tar.gz]
 md5=beb6032a301bb11524aec74bfb5e4840
 sha256=be49cda0a9d33add89cabe0dfcef436a2863a7b0b833767875e0b7a6e8b4c4d1
@@ -5262,6 +5282,10 @@ sha256=b1a0508444241c61585321eaadc32f476ef441f267636fbd0fb2f0c7ebf0fcbb
 md5=9df12389c8b955b5f8cfefe6df20b1d6
 sha256=1037b9cb872590356d055dbf8006e25d68370721e0e5b4518529495db6de70d9
 
+[http://install.source.dir.com/dsplink_linux_1_63.tar.gz]
+md5=5e1b6cfc416e077d51525c81ac490f52
+sha256=aaf421de23a656ace6d278e911882d0b5f44188cb8df5e4242201fe1ea903092
+
 [http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/ftp/dt/dt-source.tar.gz]
 md5=5776233a2d301a50b314306538257a45
 sha256=2f27fda643093e07161d128a9cc23cf30c0387f87cd911b904d84217f60a9a2a
@@ -23942,6 +23986,10 @@ sha256=fcfa98e2c8ff18e8e6d5b2ff5e94f20b719150fe7bb4a130cfa360e02df2156a
 md5=8354845032c0ce8e3da3f250505d0e21
 sha256=da26d02c1b98b95343f19ea273b3536beddd94feb2a773a6cb66efebfdff35c0
 
+[http://install.source.dir.com/ti_cgt_c6000_6.1.11_setup_linux_x86.bin]
+md5=d6d2184b5b661eceafca779bbc3204af
+sha256=4afb632e410702410a9ef25124b34d872909747f3aba128be7b6c65c9d6bb371
+
 [http://www.openzaurus.org/download/3.5.4/sources/tickypip-0.1.2.tar.gz]
 md5=5a085296b1147fe970a256a9b2d0f91f
 sha256=f3b5722c145ebeee3523b4941afdaf75d03a56f1922a9d3662dc1715aa24ca34
diff --git a/recipes/gstreamer/gst-plugins.inc b/recipes/gstreamer/gst-plugins.inc
index 5d72eb8..bd270e5 100644
--- a/recipes/gstreamer/gst-plugins.inc
+++ b/recipes/gstreamer/gst-plugins.inc
@@ -9,7 +9,7 @@ PACKAGES_DYNAMIC = "gst-plugin-*"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2"
 
-EXTRA_OECONF = "--disable-aalib --disable-shout2 --disable-sdl --disable-cdaudio --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR} "
+EXTRA_OECONF = "--disable-aalib --disable-shout2 --disable-esd --disable-sdl --disable-cdaudio --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR} "
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
diff --git a/recipes/ti/ti-cgt6x-native_6.1.11.bb b/recipes/ti/ti-cgt6x-native_6.1.11.bb
new file mode 100644
index 0000000..fe978f5
--- /dev/null
+++ b/recipes/ti/ti-cgt6x-native_6.1.11.bb
@@ -0,0 +1,22 @@
+require ti-cgt6x.inc
+inherit native
+
+# download ti_cgt_c6000_6.1.11_setup_linux_x86.bin from https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm and copy in Arago (or OE) download directory.
+
+SRC_URI	= "http://install.source.dir.com/ti_cgt_c6000_6.1.11_setup_linux_x86.bin"
+
+BINFILE = "ti_cgt_c6000_6.1.11_setup_linux_x86.bin"
+
+S = "${WORKDIR}/cgt"
+
+# Yes, the xdc stuff still breaks with a '.' in PWD
+PV = "61110"
+PR = "r1"
+
+do_stage() {
+    install -d ${STAGING_DIR_NATIVE}/${PN}
+    cp -pPrf ${S}/* ${STAGING_DIR_NATIVE}/${PN}/ 
+}
+
+AUTOTOOLS_NATIVE_STAGE_INSTALL = "1"
+
diff --git a/recipes/ti/ti-cs1-omap3530_1.0.1.42.bb b/recipes/ti/ti-cs1-omap3530_1.0.1.42.bb
new file mode 100644
index 0000000..e5f8a13
--- /dev/null
+++ b/recipes/ti/ti-cs1-omap3530_1.0.1.42.bb
@@ -0,0 +1,53 @@
+require ti-codec.inc
+require ti-cs1-omap3530.inc
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-42.bin"
+
+# Specify names of the InstallJammer binary file and the tarball it extracts
+BINFILE = "cs1omap3530_setuplinux_1_00_01-42.bin"
+
+S = "${WORKDIR}/dvsdk_3_00_01_42/cs1omap3530_1_00_01"
+
+DEPENDS="ti-codec-engine ti-dsplink-module"
+
+export CODEGEN_INSTALL_DIR
+
+# Yes, the xdc stuff still breaks with a '.' in PWD
+PV = "10142"
+PR = "r4"
+
+do_compile() {
+
+	make CE_INSTALL_DIR=${CE_INSTALL_DIR} \
+		 FC_INSTALL_DIR=${FC_INSTALL_DIR} \
+		 LINK_INSTALL_DIR=${LINK_INSTALL_DIR} \
+		 CMEM_INSTALL_DIR=${CMEM_INSTALL_DIR} \
+		 LPM_INSTALL_DIR=${LPM_INSTALL_DIR} \
+	     BIOS_INSTALL_DIR=${BIOS_INSTALL_DIR} \
+		 CODEGEN_INSTALL_DIR=${CODEGEN_INSTALL_DIR} \
+		 XDC_INSTALL_DIR=${XDC_INSTALL_DIR} \
+		 CODEC_INSTALL_DIR="${S}" \
+		 XDCARGS="prod" \
+		 clean
+
+	make CE_INSTALL_DIR=${CE_INSTALL_DIR} \
+		 FC_INSTALL_DIR=${FC_INSTALL_DIR} \
+		 LINK_INSTALL_DIR=${LINK_INSTALL_DIR} \
+		 CMEM_INSTALL_DIR=${CMEM_INSTALL_DIR} \
+		 LPM_INSTALL_DIR=${LPM_INSTALL_DIR} \
+	     BIOS_INSTALL_DIR=${BIOS_INSTALL_DIR} \
+		 CODEGEN_INSTALL_DIR=${CODEGEN_INSTALL_DIR} \
+		 XDC_INSTALL_DIR=${XDC_INSTALL_DIR} \
+		 CODEC_INSTALL_DIR="${S}" \
+		 XDCARGS="prod" \
+}
+
+do_install () {
+    install -d ${D}/${installdir}/codec-combo
+	cd ${S}
+	for file in `find . -name *.x64P`; do
+		cp ${file} ${D}/${installdir}/codec-combo
+	done
+}
+
+
diff --git a/recipes/ti/ti-dmai.inc b/recipes/ti/ti-dmai.inc
index 8e95cf1..a509982 100644
--- a/recipes/ti/ti-dmai.inc
+++ b/recipes/ti/ti-dmai.inc
@@ -2,14 +2,20 @@ DESCRIPTION = "DMAI for TI ARM/DSP processors"
 
 # NOTE: Use Brijesh' DMAI development branch. The URL *must* be updated once
 # we have stable DMAI 2.x on gforge.
-SRCREV = "265"
-SRC_URI = "svn://gforge.ti.com/svn/dmai/branches;module=BRANCH_BRIJESH_DMAI_DEV_2_xx;proto=https;user=anonymous;pswd='' \
+#SRCREV = "265"
+#SRC_URI = "svn://gforge.ti.com/svn/dmai/branches;module=BRANCH_BRIJESH_DMAI_DEV_2_xx;proto=https;user=anonymous;pswd='' \
+#		file://loadmodules-ti-dmai-dm355_al.sh \
+#		file://loadmodules-ti-dmai-dm6446_al.sh \
+#		file://loadmodules-ti-dmai-o3530_al.sh \
+#	"
+SRCREV = "295"
+SRC_URI = "svn://gforge.ti.com/svn/dmai/tags;module=TAG_2_00_01_04;proto=https;user=anonymous;pswd='' \
 		file://loadmodules-ti-dmai-dm355_al.sh \
 		file://loadmodules-ti-dmai-dm6446_al.sh \
 		file://loadmodules-ti-dmai-o3530_al.sh \
 	"
 
-S = "${WORKDIR}/BRANCH_BRIJESH_DMAI_DEV_2_xx/davinci_multimedia_application_interface"
+S = "${WORKDIR}/TAG_2_00_01_04"
 # Yes, the xdc stuff still breaks with a '.' in PWD
 PV = "svnr${SRCREV}"
 PR = "r33"
diff --git a/recipes/ti/ti-dspbios-native_5.33.06.bb b/recipes/ti/ti-dspbios-native_5.33.06.bb
new file mode 100644
index 0000000..81757fc
--- /dev/null
+++ b/recipes/ti/ti-dspbios-native_5.33.06.bb
@@ -0,0 +1,22 @@
+require ti-dspbios.inc
+inherit native
+
+# download bios_setuplinux_5_33_06.bin from https://www-a.ti.com/downloads/sds_support/targetcontent/bios/bios_5_33/bios_5_33_06/index_external.html and copy in Arago (or OE) installation directory
+
+SRC_URI	= "http://install.source.dir.com/bios_setuplinux_5_33_06.bin"
+BINFILE="bios_setuplinux_5_33_06.bin"
+
+S = "${WORKDIR}/bios_5_33_06"
+
+# Yes, the xdc stuff still breaks with a '.' in PWD
+PV = "5336"
+PR = "r2"
+
+do_stage() {
+    install -d ${STAGING_DIR_NATIVE}/${PN}
+    cp -pPrf ${S}/* ${STAGING_DIR_NATIVE}/${PN}/ 
+    chmod 755 -R ${STAGING_DIR_NATIVE}/${PN}/*
+}
+
+AUTOTOOLS_NATIVE_STAGE_INSTALL="1"
+
diff --git a/recipes/ti/ti-dsplink-module_1.63.bb b/recipes/ti/ti-dsplink-module_1.63.bb
new file mode 100644
index 0000000..35650bb
--- /dev/null
+++ b/recipes/ti/ti-dsplink-module_1.63.bb
@@ -0,0 +1,168 @@
+DESCRIPTION = "DSPLINK 1.63 module for TI ARM/DSP processors"
+
+require ti-paths.inc
+inherit module
+
+# compile and run time dependencies
+DEPENDS 	+= "virtual/kernel perl-native ti-dspbios-native ti-cgt6x-native update-modules ti-xdctools-native"
+
+# tconf from xdctools dislikes '.' in pwd :/
+#This is a kernel module, don't set PR directly
+MACHINE_KERNEL_PR_append = "a"                                                  
+PV = "1630"
+
+SRC_URI = "http://install.source.dir.com/dsplink_linux_1_63.tar.gz \
+		   file://loadmodules-ti-dsplink-apps.sh \
+		   file://unloadmodules-ti-dsplink-apps.sh"
+
+# Set the source directory
+S = "${WORKDIR}/dsplink_linux_1_63"
+	
+# DSPLINK - Config Variable for different platform
+DSPLINKPLATFORM            			?= "DAVINCI"
+DSPLINKPLATFORM_dm6446-evm 			?= "DAVINCI"
+DSPLINKPLATFORM_da830-omapl137-evm 	?= "OMAPL1XX"
+
+DSPLINKDSPCFG            			?= "DM6446GEMSHMEM"
+DSPLINKDSPCFG_dm6446-evm 			?= "DM6446GEMSHMEM"
+DSPLINKDSPCFG_da830-omapl137-evm 	?= "OMAPL1XXGEMSHMEM"
+
+DSPLINKGPPOS             			?= "MVL5G"
+DSPLINKGPPOS_dm6446-evm  			?= "MVL5G"
+DSPLINKGPPOS_da830-omapl137-evm  	?= "MVL5G"
+
+DSPLINK = "${S}/dsplink"
+export DSPLINK
+
+STAGING_TI_DSPBIOS_DIR="${STAGING_DIR_NATIVE}/ti-dspbios-native"
+STAGING_TI_CGT6x_DIR="${STAGING_DIR_NATIVE}/ti-cgt6x-native"
+STAGING_TI_XDCTOOL_INSTALL_DIR="${STAGING_DIR_NATIVE}/ti-xdctools-native"
+
+do_compile() {
+
+    # Run perl script to create appropriate makefiles (v1.60 and up)
+    (
+    cd ${DSPLINK}
+    perl config/bin/dsplinkcfg.pl --platform=${DSPLINKPLATFORM} --nodsp=1 \
+	--dspcfg_0=${DSPLINKDSPCFG} --dspos_0=DSPBIOS5XX \
+	--gppos=${DSPLINKGPPOS} --comps=ponslrm
+    )
+
+	  # dsplink makefile is hard-coded to use kbuild only on OMAP3530.
+    # we are forcing  to use kbuild on other platforms.
+	  sed -i  's/OMAP3530/${DSPLINKPLATFORM}/g' ${DSPLINK}/gpp/src/Makefile	
+
+    # TODO :: KERNEL_CC, etc need replacing with user CC
+    # TODO :: Need to understand why OBJDUMP is required for kernel module
+    # Unset these since LDFLAGS gets picked up and used incorrectly.... need 
+    # investigation
+
+    unset CFLAGS CPPFLAGS CXXFLAGS  LDFLAGS
+    
+    # Build the gpp user space library
+    cd ${DSPLINK}/gpp/src/api
+    ${STAGING_TI_XDCTOOL_INSTALL_DIR}/gmake \
+      CROSS_COMPILE="${TARGET_PREFIX}" \
+      CC="${KERNEL_CC}" \
+      AR="${KERNEL_AR}" \
+      LD="${KERNEL_LD}" \
+      COMPILER="${KERNEL_CC}" \
+      ARCHIVER="${KERNEL_AR}" \
+      KERNEL_DIR="${STAGING_KERNEL_DIR}" \
+      clean all
+
+    # Build the gpp kernel space (debug and release)
+    cd ${DSPLINK}/gpp/src
+    ${STAGING_TI_XDCTOOL_INSTALL_DIR}/gmake \
+      OBJDUMP="${TARGET_PREFIX}objdump" \
+      CROSS_COMPILE="${TARGET_PREFIX}" \
+      CC="${KERNEL_CC}" \
+      AR="${KERNEL_AR}" \
+      LD="${KERNEL_LD}" \
+      COMPILER="${KERNEL_CC}" \
+      ARCHIVER="${KERNEL_AR}" \
+      KERNEL_DIR="${STAGING_KERNEL_DIR}" \
+      clean all
+
+    # Build the gpp samples
+    cd ${DSPLINK}/gpp/src/samples
+    ${STAGING_TI_XDCTOOL_INSTALL_DIR}/gmake \
+      BASE_TOOLCHAIN="${CROSS_DIR}" \
+      BASE_CGTOOLS="${BASE_TOOLCHAIN}/bin" \
+      OSINC_PLATFORM="${CROSS_DIR}/lib/gcc/${TARGET_SYS}/$(${TARGET_PREFIX}gcc -dumpversion)/include" \
+      OSINC_TARGET="${BASE_TOOLCHAIN}/target/usr/include" \
+      CROSS_COMPILE="${TARGET_PREFIX}" \
+      CC="${KERNEL_CC}" \
+      AR="${KERNEL_AR}" \
+      LD="${KERNEL_LD}" \
+      COMPILER="${KERNEL_CC}" \
+      LINKER="${KERNEL_CC}" \
+      ARCHIVER="${KERNEL_AR}" \
+      KERNEL_DIR="${STAGING_KERNEL_DIR}" \
+      clean all
+
+    # Build the dsp library (debug and release)
+    cd ${DSPLINK}/dsp/src
+    ${STAGING_TI_XDCTOOL_INSTALL_DIR}/gmake \
+      BASE_CGTOOLS="${STAGING_TI_CGT6x_DIR}" \
+      BASE_SABIOS="${STAGING_TI_DSPBIOS_DIR}" \
+      clean all
+
+    # Build the dsp samples (debug and release)
+    cd ${DSPLINK}/dsp/src/samples
+    ${STAGING_TI_XDCTOOL_INSTALL_DIR}/gmake \
+      BASE_CGTOOLS="${STAGING_TI_CGT6x_DIR}" \
+      BASE_SABIOS="${STAGING_TI_DSPBIOS_DIR}" \
+      clean all
+}
+
+do_install () {
+    # DSPLINK driver - kernel module
+    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp
+    install -m 0755 ${DSPLINK}/gpp/export/BIN/Linux/${DSPLINKPLATFORM}/RELEASE/dsplinkk.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/ 
+
+    # DSPLINK library
+    install -d ${D}/${installdir}/dsplink/libs
+    install -m 0755 ${DSPLINK}/gpp/export/BIN/Linux/${DSPLINKPLATFORM}/RELEASE/dsplink.lib  ${D}/${installdir}/dsplink/libs
+
+    # DSPLINK sample apps
+    install -d ${D}/${installdir}/dsplink/apps
+    
+    cp ${DSPLINK}/gpp/export/BIN/Linux/${DSPLINKPLATFORM}/RELEASE/*gpp ${D}/${installdir}/dsplink/apps
+    
+    for i in $(find ${DSPLINK}/dsp/BUILD/ -name "*.out") ; do
+        cp ${i} ${D}/${installdir}/dsplink/apps
+    done
+
+    # DSPLINK test app module un/load scripts
+    install ${WORKDIR}/loadmodules-ti-dsplink-apps.sh ${D}/${installdir}/dsplink/apps
+    install ${WORKDIR}/unloadmodules-ti-dsplink-apps.sh ${D}/${installdir}/dsplink/apps
+}
+
+do_stage () {
+    install -d ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/packages
+    cp -pPrf ${S}/* ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/packages
+}
+
+pkg_postrm () {
+    update-modules || true
+}
+
+pkg_postinst () {
+    if [ -n "$D" ]; then
+        exit 1
+    fi
+    depmod -a
+    update-modules || true
+}
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+PACKAGES += " ti-dsplink-apps" 
+FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/*"
+FILES_ti-dsplink-apps = "${installdir}/dsplink/*"
+
+# Disable QA check untils we figure out how to pass LDFLAGS in build
+INSANE_SKIP_${PN} = True
+INSANE_SKIP_ti-dsplink-apps = True
+
diff --git a/recipes/ti/ti-lpm-module_2.24.bb b/recipes/ti/ti-lpm-module_2.24.bb
index 74cb7ca..0df2f3f 100644
--- a/recipes/ti/ti-lpm-module_2.24.bb
+++ b/recipes/ti/ti-lpm-module_2.24.bb
@@ -12,7 +12,7 @@ MACHINE_KERNEL_PR_append = "a"
 PV = "2241"
 
 # LPM seems to be missing from 2.24.01
-DEFAULT_PREFERENCE = "-1"
+#DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "http://install.source.dir.com/local_power_manager_1_24.tar.gz"
 


--------------070205080704050205010605--
