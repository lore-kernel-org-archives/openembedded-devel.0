Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1Ns4d2-00017h-3d
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 02:34:49 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 2529746752
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 14:31:36 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 1038446751
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 14:31:35 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0KZG00101DPJE000@sunstrike.tait.co.nz>
	(original mail from douglas.royds@tait.co.nz)
	for openembedded-devel@lists.openembedded.org; Thu,
	18 Mar 2010 14:31:14 +1300 (NZDT)
Received: from [172.25.116.17] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0KZG00GY1EVZVEA0@sunstrike.tait.co.nz> for
	openembedded-devel@lists.openembedded.org; Thu,
	18 Mar 2010 14:31:12 +1300 (NZDT)
Date: Thu, 18 Mar 2010 14:31:11 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
To: openembedded-devel@lists.openembedded.org
Message-id: <4BA1825F.9080405@tait.co.nz>
MIME-version: 1.0
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] Renamed prefix_native, bindir_native, etc using camelCaps
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
X-List-Received-Date: Thu, 18 Mar 2010 01:34:50 -0000
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT

    - Avoids clashing with the machine override when MACHINE=native
    - bindir_cross similarly renamed for consistency

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
  classes/cross-canadian.bbclass              |    2 +-
  classes/native.bbclass                      |    4 +-
  classes/packaged-staging.bbclass            |   16 ++++++------
  conf/bitbake.conf                           |   36 +++++++++++++-------------
  conf/distro/micro.conf                      |    4 +-
  recipes/gcc/gcc-cross-sdk_4.1.2.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.2.2.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.2.3.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.2.4.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.3.1.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.3.2.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.3.3.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.3.4.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.4.1.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.4.2.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_4.4.3.bb          |    2 +-
  recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb |    2 +-
  recipes/gcc/gcc-cross-sdk_svn.bb            |    2 +-
  recipes/gcc/gcc-cross_4.1.0.bb              |    2 +-
  recipes/gcc/gcc-cross_4.1.1.bb              |    2 +-
  recipes/gcc/gcc-cross_4.1.2.bb              |    2 +-
  recipes/gcc/gcc-cross_4.2.1.bb              |    2 +-
  recipes/gcc/gcc-cross_4.2.2.bb              |    2 +-
  recipes/gcc/gcc-cross_4.2.3.bb              |    2 +-
  recipes/gcc/gcc-cross_4.2.4.bb              |    2 +-
  recipes/gcc/gcc-cross_4.3.1.bb              |    2 +-
  recipes/gcc/gcc-cross_4.3.2.bb              |    2 +-
  recipes/gcc/gcc-cross_4.3.3.bb              |    2 +-
  recipes/gcc/gcc-cross_4.3.4.bb              |    2 +-
  recipes/gcc/gcc-cross_4.4.1.bb              |    2 +-
  recipes/gcc/gcc-cross_4.4.2.bb              |    2 +-
  recipes/gcc/gcc-cross_4.4.3.bb              |    2 +-
  recipes/gcc/gcc-cross_csl-arm-2007q3.bb     |    2 +-
  recipes/gcc/gcc-cross_csl-arm-2008q1.bb     |    2 +-
  recipes/gcc/gcc-cross_csl-arm-2008q3.bb     |    2 +-
  recipes/gcc/gcc-cross_svn.bb                |    2 +-
  recipes/libtool/libtool-cross_1.5.10.bb     |    4 +-
  recipes/libtool/libtool-cross_1.5.22.bb     |    4 +-
  recipes/libtool/libtool-cross_1.5.24.bb     |    4 +-
  recipes/libtool/libtool-cross_2.2.4.bb      |    4 +-
  recipes/libtool/libtool-cross_2.2.6a.bb     |    4 +-
  recipes/libtool/libtool-cross_2.2.6b.bb     |    4 +-
  42 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/classes/cross-canadian.bbclass b/classes/cross-canadian.bbclass
index bd738ec..55f4a7d 100644
--- a/classes/cross-canadian.bbclass
+++ b/classes/cross-canadian.bbclass
@@ -17,7 +17,7 @@ INHIBIT_DEFAULT_DEPS = "1"
  STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}-nativesdk"
  STAGING_DIR_TARGET = "${STAGING_DIR}/${BASEPKG_TARGET_SYS}"

-PATH_append = ":${TMPDIR}/cross/${HOST_ARCH}/${bindir_cross}"
+PATH_append = ":${TMPDIR}/cross/${HOST_ARCH}/${bindirCross}"
  PKGDATA_DIR = 
"${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}"

  HOST_ARCH = "${SDK_ARCH}"
diff --git a/classes/native.bbclass b/classes/native.bbclass
index 6698b61..f8eea5e 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -55,8 +55,8 @@ export STRIP = "${HOST_PREFIX}strip"

  # Path prefixes
  base_prefix = "${STAGING_DIR_NATIVE}"
-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
+exec_prefix = "${STAGING_DIR_NATIVE}${prefixNative}"

  # Since we actually install these into situ there is no staging prefix
  STAGING_DIR_HOST = ""
diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 1ede25c..a145218 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -149,11 +149,11 @@ staging_helper () {
  		done
  		echo "dest root /" >> $conffile
  	fi
-	if [ ! -e ${TMPDIR}${libdir_native}/opkg/info/ ]; then
-		mkdir -p ${TMPDIR}${libdir_native}/opkg/info/
+	if [ ! -e ${TMPDIR}${libdirNative}/opkg/info/ ]; then
+		mkdir -p ${TMPDIR}${libdirNative}/opkg/info/
  	fi
- 	if [ ! -e ${TMPDIR}${libdir_native}/ipkg/ ]; then
-		ln -sf opkg/ ${TMPDIR}${libdir_native}/ipkg || true
+ 	if [ ! -e ${TMPDIR}${libdirNative}/ipkg/ ]; then
+		ln -sf opkg/ ${TMPDIR}${libdirNative}/ipkg || true
  	fi
  }

@@ -182,7 +182,7 @@ python packagestage_scenefunc () {
          #
          # Install the staging package somewhere temporarily so we can 
extract the stamp files
          #
- 
bb.mkdirhier(bb.data.expand("${WORKDIR}/tstage/${libdir_native}/opkg/info/ ", d))
+ 
bb.mkdirhier(bb.data.expand("${WORKDIR}/tstage/${libdirNative}/opkg/info/ ", d))
          cmd = bb.data.expand("${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} 
-force-depends -o ${WORKDIR}/tstage install", d)
          ret = os.system("PATH=\"%s\" %s %s" % (path, cmd, stagepkg))
          if ret != 0:
@@ -329,20 +329,20 @@ staging_packager () {
  staging_package_installer () {
  	#${PSTAGE_INSTALL_CMD} ${PSTAGE_PKG}

-	STATUSFILE=${TMPDIR}${libdir_native}/opkg/status
+	STATUSFILE=${TMPDIR}${libdirNative}/opkg/status
  	echo "Package: ${PSTAGE_PKGPN}"        >> $STATUSFILE
  	echo "Version: ${PSTAGE_PKGVERSION}"   >> $STATUSFILE
  	echo "Status: install user installed"  >> $STATUSFILE
  	echo "Architecture: ${PSTAGE_PKGARCH}" >> $STATUSFILE
  	echo "" >> $STATUSFILE

-	CTRLFILE=${TMPDIR}${libdir_native}/opkg/info/${PSTAGE_PKGPN}.control
+	CTRLFILE=${TMPDIR}${libdirNative}/opkg/info/${PSTAGE_PKGPN}.control
  	echo "Package: ${PSTAGE_PKGPN}"        > $CTRLFILE
  	echo "Version: ${PSTAGE_PKGVERSION}"   >> $CTRLFILE
  	echo "Architecture: ${PSTAGE_PKGARCH}" >> $CTRLFILE

  	cd ${PSTAGE_TMPDIR_STAGE}
-	find -type f | grep -v ./CONTROL | sed -e 's/^\.//' > 
${TMPDIR}${libdir_native}/opkg/info/${PSTAGE_PKGPN}.list
+	find -type f | grep -v ./CONTROL | sed -e 's/^\.//' > 
${TMPDIR}${libdirNative}/opkg/info/${PSTAGE_PKGPN}.list
  }

  python do_package_stage () {
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 0886587..ef519d9 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -69,16 +69,16 @@ export oldincludedir = "${exec_prefix}/include"
  #
  # These must match the various bbclass layout definitions
  #
-base_bindir_native = "/bin"
-base_sbindir_native = "/sbin"
-sysconfdir_native = "/etc"
-prefix_native = "/usr"
-bindir_native = "${prefix_native}/bin"
-sbindir_native = "${prefix_native}/sbin"
-includedir_native = "${prefix_native}/include"
-libdir_native = "${prefix_native}/lib"
-datadir_native = "${prefix_native}/share"
-bindir_cross = "/bin"
+base_bindirNative = "/bin"
+base_sbindirNative = "/sbin"
+sysconfdirNative = "/etc"
+prefixNative = "/usr"
+bindirNative = "${prefixNative}/bin"
+sbindirNative = "${prefixNative}/sbin"
+includedirNative = "${prefixNative}/include"
+libdirNative = "${prefixNative}/lib"
+datadirNative = "${prefixNative}/share"
+bindirCross = "/bin"

  #
  # Cross recipes need to know about the target layout
@@ -299,13 +299,13 @@ STAGING_DIR = "${TMPDIR}/staging"

  STAGING_DIR_JAVA = "${STAGING_DIR}/java"
  STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
-STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
-STAGING_BINDIR_CROSS  = 
"${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"
-STAGING_BINDIR_CROSS_BASEPKG = 
"${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
-STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
-STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
-STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
-STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
+STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindirNative}"
+STAGING_BINDIR_CROSS  = 
"${STAGING_DIR_NATIVE}${bindirNative}/${MULTIMACH_HOST_SYS}"
+STAGING_BINDIR_CROSS_BASEPKG = 
"${STAGING_DIR_NATIVE}${bindirNative}/${BASEPKG_TARGET_SYS}"
+STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdirNative}"
+STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedirNative}"
+STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdirNative}"
+STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadirNative}"

  # This should really be MULTIMACH_HOST_SYS but that breaks "all" and machine
  # specific packages - hack around it for now.
@@ -414,7 +414,7 @@ EXTRA_IMAGEDEPENDS = ""

  CROSS_DIR = "${TMPDIR}/cross/${BASE_PACKAGE_ARCH}"
  CROSS_DATADIR = "${CROSS_DIR}/share"
-PATH_prepend = 
"${STAGING_BINDIR_CROSS}:${STAGING_BINDIR_CROSS_BASEPKG}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/${bindir_cross}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
+PATH_prepend = 
"${STAGING_BINDIR_CROSS}:${STAGING_BINDIR_CROSS_BASEPKG}:${STAGING_DIR_NATIVE}${sbindirNative}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/${bindirCross}:${STAGING_DIR_NATIVE}${base_sbindirNative}:${STAGING_DIR_NATIVE}${base_bindirNative}:"
  export PATH

  ##################################################################
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 9885425..d055076 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -97,8 +97,8 @@ PACKAGE_SNAP_LIB_SYMLINKS = "1"
  # Collapse /usr into /
  prefix = ""
  exec_prefix = ""
-prefix_native = ""
-exec_prefix_native = ""
+prefixNative = ""
+exec_prefixNative = ""

  # Don't install ldconfig and associated gubbins
  USE_LDCONFIG = "0"
diff --git a/recipes/gcc/gcc-cross-sdk_4.1.2.bb 
b/recipes/gcc/gcc-cross-sdk_4.1.2.bb
index 6a74606..babeeef 100644
--- a/recipes/gcc/gcc-cross-sdk_4.1.2.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.1.2.bb
@@ -7,4 +7,4 @@ require gcc-package-sdk.inc

  DEPENDS += "gmp-native mpfr-native"

-EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.2.2.bb 
b/recipes/gcc/gcc-cross-sdk_4.2.2.bb
index bea9839..9118e54 100644
--- a/recipes/gcc/gcc-cross-sdk_4.2.2.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.2.2.bb
@@ -11,4 +11,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.2.3.bb 
b/recipes/gcc/gcc-cross-sdk_4.2.3.bb
index bea9839..9118e54 100644
--- a/recipes/gcc/gcc-cross-sdk_4.2.3.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.2.3.bb
@@ -11,4 +11,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.2.4.bb 
b/recipes/gcc/gcc-cross-sdk_4.2.4.bb
index 9c67c7e..d90e864 100644
--- a/recipes/gcc/gcc-cross-sdk_4.2.4.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.2.4.bb
@@ -11,4 +11,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --enable-libssp \
  		--enable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.3.1.bb 
b/recipes/gcc/gcc-cross-sdk_4.3.1.bb
index bea9839..9118e54 100644
--- a/recipes/gcc/gcc-cross-sdk_4.3.1.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.3.1.bb
@@ -11,4 +11,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.3.2.bb 
b/recipes/gcc/gcc-cross-sdk_4.3.2.bb
index bea9839..9118e54 100644
--- a/recipes/gcc/gcc-cross-sdk_4.3.2.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.3.2.bb
@@ -11,4 +11,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.3.3.bb 
b/recipes/gcc/gcc-cross-sdk_4.3.3.bb
index ed39d31..fcd0964 100644
--- a/recipes/gcc/gcc-cross-sdk_4.3.3.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.3.3.bb
@@ -11,4 +11,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.3.4.bb 
b/recipes/gcc/gcc-cross-sdk_4.3.4.bb
index 88e26c5..116ec1e 100644
--- a/recipes/gcc/gcc-cross-sdk_4.3.4.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.3.4.bb
@@ -11,4 +11,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.4.1.bb 
b/recipes/gcc/gcc-cross-sdk_4.4.1.bb
index e1b510e..03fd3a5 100644
--- a/recipes/gcc/gcc-cross-sdk_4.4.1.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.4.1.bb
@@ -10,4 +10,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.4.2.bb 
b/recipes/gcc/gcc-cross-sdk_4.4.2.bb
index e1b510e..03fd3a5 100644
--- a/recipes/gcc/gcc-cross-sdk_4.4.2.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.4.2.bb
@@ -10,4 +10,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_4.4.3.bb 
b/recipes/gcc/gcc-cross-sdk_4.4.3.bb
index e1b510e..03fd3a5 100644
--- a/recipes/gcc/gcc-cross-sdk_4.4.3.bb
+++ b/recipes/gcc/gcc-cross-sdk_4.4.3.bb
@@ -10,4 +10,4 @@ DEPENDS += "gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb 
b/recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb
index 2e4fcf2..f334027 100644
--- a/recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross-sdk_csl-arm-2007q3.bb
@@ -13,7 +13,7 @@ EXTRA_OECONF += " \
  		--disable-libgomp \
  		--disable-libunwind-exceptions \
  		--disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative} \
  		"

  #We don't want i686 linux ending up in the CFLAGS_FOR_TARGET like this: 
-isystem/OE/angstrom-tmp/staging/i686-linux/usr/include
diff --git a/recipes/gcc/gcc-cross-sdk_svn.bb b/recipes/gcc/gcc-cross-sdk_svn.bb
index 48d8a0d..30f4fa4 100644
--- a/recipes/gcc/gcc-cross-sdk_svn.bb
+++ b/recipes/gcc/gcc-cross-sdk_svn.bb
@@ -11,4 +11,4 @@ DEPENDS += "libmpc-native gmp-native mpfr-native"

  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
  		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+		--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross_4.1.0.bb b/recipes/gcc/gcc-cross_4.1.0.bb
index def0586..1685201 100644
--- a/recipes/gcc/gcc-cross_4.1.0.bb
+++ b/recipes/gcc/gcc-cross_4.1.0.bb
@@ -5,4 +5,4 @@ require gcc-cross4.inc
  require gcc-configure-cross.inc
  require gcc-package-cross.inc

-EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross_4.1.1.bb b/recipes/gcc/gcc-cross_4.1.1.bb
index e96867e..a1f63bd 100644
--- a/recipes/gcc/gcc-cross_4.1.1.bb
+++ b/recipes/gcc/gcc-cross_4.1.1.bb
@@ -7,4 +7,4 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"
diff --git a/recipes/gcc/gcc-cross_4.1.2.bb b/recipes/gcc/gcc-cross_4.1.2.bb
index 2367d19..963eca1 100644
--- a/recipes/gcc/gcc-cross_4.1.2.bb
+++ b/recipes/gcc/gcc-cross_4.1.2.bb
@@ -9,6 +9,6 @@ SRC_URI_append_fail-fast = " 
file://zecke-no-host-includes.patch;patch=1 "

  EXTRA_OECONF_append_avr32= "  --disable-libmudflap "

-EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.2.1.bb b/recipes/gcc/gcc-cross_4.2.1.bb
index 8c7f4c5..e0d1c41 100644
--- a/recipes/gcc/gcc-cross_4.2.1.bb
+++ b/recipes/gcc/gcc-cross_4.2.1.bb
@@ -7,6 +7,6 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.2.2.bb b/recipes/gcc/gcc-cross_4.2.2.bb
index cf1bf68..36c4e20 100644
--- a/recipes/gcc/gcc-cross_4.2.2.bb
+++ b/recipes/gcc/gcc-cross_4.2.2.bb
@@ -7,6 +7,6 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.2.3.bb b/recipes/gcc/gcc-cross_4.2.3.bb
index cf1bf68..36c4e20 100644
--- a/recipes/gcc/gcc-cross_4.2.3.bb
+++ b/recipes/gcc/gcc-cross_4.2.3.bb
@@ -7,6 +7,6 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.2.4.bb b/recipes/gcc/gcc-cross_4.2.4.bb
index cf1bf68..36c4e20 100644
--- a/recipes/gcc/gcc-cross_4.2.4.bb
+++ b/recipes/gcc/gcc-cross_4.2.4.bb
@@ -7,6 +7,6 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.3.1.bb b/recipes/gcc/gcc-cross_4.3.1.bb
index acd5521..5835784 100644
--- a/recipes/gcc/gcc-cross_4.3.1.bb
+++ b/recipes/gcc/gcc-cross_4.3.1.bb
@@ -7,6 +7,6 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.3.2.bb b/recipes/gcc/gcc-cross_4.3.2.bb
index 94b98b9..6c3dd7e 100644
--- a/recipes/gcc/gcc-cross_4.3.2.bb
+++ b/recipes/gcc/gcc-cross_4.3.2.bb
@@ -6,6 +6,6 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.3.3.bb b/recipes/gcc/gcc-cross_4.3.3.bb
index 94b98b9..6c3dd7e 100644
--- a/recipes/gcc/gcc-cross_4.3.3.bb
+++ b/recipes/gcc/gcc-cross_4.3.3.bb
@@ -6,6 +6,6 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.3.4.bb b/recipes/gcc/gcc-cross_4.3.4.bb
index 71cb5e6..9891b08 100644
--- a/recipes/gcc/gcc-cross_4.3.4.bb
+++ b/recipes/gcc/gcc-cross_4.3.4.bb
@@ -6,6 +6,6 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.4.1.bb b/recipes/gcc/gcc-cross_4.4.1.bb
index 11eb29d..e5cdc8a 100644
--- a/recipes/gcc/gcc-cross_4.4.1.bb
+++ b/recipes/gcc/gcc-cross_4.4.1.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.1"

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += " --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += " --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.4.2.bb b/recipes/gcc/gcc-cross_4.4.2.bb
index 11eb29d..e5cdc8a 100644
--- a/recipes/gcc/gcc-cross_4.4.2.bb
+++ b/recipes/gcc/gcc-cross_4.4.2.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.1"

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += " --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += " --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_4.4.3.bb b/recipes/gcc/gcc-cross_4.4.3.bb
index 11eb29d..e5cdc8a 100644
--- a/recipes/gcc/gcc-cross_4.4.3.bb
+++ b/recipes/gcc/gcc-cross_4.4.3.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.1"

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += " --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += " --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb 
b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
index adf7f5a..3e2271f 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
@@ -7,7 +7,7 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "--disable-multilib --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-multilib --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  #We don't want i686 linux ending up in the CFLAGS_FOR_TARGET like this: 
-isystem/OE/angstrom-tmp/staging/i686-linux/usr/include
  CFLAGS = ""
diff --git a/recipes/gcc/gcc-cross_csl-arm-2008q1.bb 
b/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
index d534574..32e65c5 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
@@ -7,7 +7,7 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "--disable-multilib --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-multilib --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  #We don't want i686 linux ending up in the CFLAGS_FOR_TARGET like this: 
-isystem/OE/angstrom-tmp/staging/i686-linux/usr/include
  CFLAGS = ""
diff --git a/recipes/gcc/gcc-cross_csl-arm-2008q3.bb 
b/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
index ef4ef30..d226e26 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
@@ -7,7 +7,7 @@ require gcc-package-cross.inc

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "--disable-multilib --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
+EXTRA_OECONF += "--disable-multilib --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative}"

  #We don't want i686 linux ending up in the CFLAGS_FOR_TARGET like this: 
-isystem/OE/angstrom-tmp/staging/i686-linux/usr/include
  CFLAGS = ""
diff --git a/recipes/gcc/gcc-cross_svn.bb b/recipes/gcc/gcc-cross_svn.bb
index 2d3c136..ae5f374 100644
--- a/recipes/gcc/gcc-cross_svn.bb
+++ b/recipes/gcc/gcc-cross_svn.bb
@@ -8,6 +8,6 @@ DEPENDS += "libmpc-native"

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += " --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} --with-system-zlib"
+EXTRA_OECONF += " --disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${prefixNative} --with-system-zlib"

  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/recipes/libtool/libtool-cross_1.5.10.bb 
b/recipes/libtool/libtool-cross_1.5.10.bb
index 1ae9c68..b813252 100644
--- a/recipes/libtool/libtool-cross_1.5.10.bb
+++ b/recipes/libtool/libtool-cross_1.5.10.bb
@@ -13,8 +13,8 @@ SRC_URI_append = " file://rpath-control.patch;patch=1 \

  S = "${WORKDIR}/libtool-${PV}"

-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
+exec_prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
  bindir = "${STAGING_BINDIR_NATIVE}"

  do_configure_prepend () {
diff --git a/recipes/libtool/libtool-cross_1.5.22.bb 
b/recipes/libtool/libtool-cross_1.5.22.bb
index 3832612..81429a3 100644
--- a/recipes/libtool/libtool-cross_1.5.22.bb
+++ b/recipes/libtool/libtool-cross_1.5.22.bb
@@ -12,8 +12,8 @@ SRC_URI_append = " file://libdir-la.patch;patch=1 \
                     file://install-path-check.patch;patch=1"
  S = "${WORKDIR}/libtool-${PV}"

-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
+exec_prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
  bindir = "${STAGING_BINDIR_NATIVE}"

  do_compile () {
diff --git a/recipes/libtool/libtool-cross_1.5.24.bb 
b/recipes/libtool/libtool-cross_1.5.24.bb
index 211e5a3..2f7f92c 100644
--- a/recipes/libtool/libtool-cross_1.5.24.bb
+++ b/recipes/libtool/libtool-cross_1.5.24.bb
@@ -9,8 +9,8 @@ SRC_URI_append = " file://libdir-la.patch;patch=1 \
                     file://install-path-check.patch;patch=1"
  S = "${WORKDIR}/libtool-${PV}"

-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
+exec_prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
  bindir = "${STAGING_BINDIR_NATIVE}"

  do_compile () {
diff --git a/recipes/libtool/libtool-cross_2.2.4.bb 
b/recipes/libtool/libtool-cross_2.2.4.bb
index 1a60b57..9c83174 100644
--- a/recipes/libtool/libtool-cross_2.2.4.bb
+++ b/recipes/libtool/libtool-cross_2.2.4.bb
@@ -17,8 +17,8 @@ DOLT_PATCH_i586 = " file://add_dolt.patch;patch=1"

  S = "${WORKDIR}/libtool-${PV}"

-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
+exec_prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
  bindir = "${STAGING_BINDIR_NATIVE}"

  do_compile () {
diff --git a/recipes/libtool/libtool-cross_2.2.6a.bb 
b/recipes/libtool/libtool-cross_2.2.6a.bb
index d3ea34a..15e74d1 100644
--- a/recipes/libtool/libtool-cross_2.2.6a.bb
+++ b/recipes/libtool/libtool-cross_2.2.6a.bb
@@ -15,8 +15,8 @@ DOLT_PATCH_i586 = " file://add_dolt.patch;patch=1"
  #SRC_URI_append_linux = "${DOLT_PATCH}"
  #SRC_URI_append_linux-gnueabi = "${DOLT_PATCH}"

-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
+exec_prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
  bindir = "${STAGING_BINDIR_NATIVE}"

  do_compile () {
diff --git a/recipes/libtool/libtool-cross_2.2.6b.bb 
b/recipes/libtool/libtool-cross_2.2.6b.bb
index d3ea34a..15e74d1 100644
--- a/recipes/libtool/libtool-cross_2.2.6b.bb
+++ b/recipes/libtool/libtool-cross_2.2.6b.bb
@@ -15,8 +15,8 @@ DOLT_PATCH_i586 = " file://add_dolt.patch;patch=1"
  #SRC_URI_append_linux = "${DOLT_PATCH}"
  #SRC_URI_append_linux-gnueabi = "${DOLT_PATCH}"

-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
+exec_prefix = "${STAGING_DIR_NATIVE}${prefixNative}"
  bindir = "${STAGING_BINDIR_NATIVE}"

  do_compile () {
-- 
1.6.3.3







=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



