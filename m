Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M1Nnr-0003Du-C6
	for openembedded-devel@openembedded.org; Tue, 05 May 2009 18:47:36 +0200
Received: (qmail 5731 invoked from network); 5 May 2009 16:41:39 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 5 May 2009 09:41:39 -0700
Date: Tue, 5 May 2009 09:41:38 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090505164137.GJ7973@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [PATCH] Fix staging of binutils static libraries
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
X-List-Received-Date: Tue, 05 May 2009 16:47:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

binutils-cross: Stage libbfd/opcodes/iberty correctly, bump PR

Changes the staging path for libbfd and libopcodes to ${CROSS_DIR}/lib.
Disables staging native libiberty.a to ${STAGING_DIR_TARGET} as this doesn't
make sense to do.  Cleans up empty directories.

Signed-off-by: Nikita Shulga <nshulga@embeddedalley.com>
Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/binutils/binutils-cross.inc           |   28 +++++++++++++++++++-----
 recipes/binutils/binutils_2.14.90.0.6.bb      |    2 +-
 recipes/binutils/binutils_2.14.90.0.7.bb      |    2 +-
 recipes/binutils/binutils_2.15.94.0.1.bb      |    2 +-
 recipes/binutils/binutils_2.16.1.bb           |    2 +-
 recipes/binutils/binutils_2.16.91.0.6.bb      |    2 +-
 recipes/binutils/binutils_2.16.91.0.7.bb      |    2 +-
 recipes/binutils/binutils_2.16.bb             |    2 +-
 recipes/binutils/binutils_2.17.50.0.1.bb      |    2 +-
 recipes/binutils/binutils_2.17.50.0.12.bb     |    2 +-
 recipes/binutils/binutils_2.17.50.0.5.bb      |    2 +-
 recipes/binutils/binutils_2.17.50.0.8.bb      |    2 +-
 recipes/binutils/binutils_2.17.bb             |    2 +-
 recipes/binutils/binutils_2.18.50.0.7.bb      |    2 +-
 recipes/binutils/binutils_2.18.bb             |    2 +-
 recipes/binutils/binutils_2.19.1.bb           |    2 +-
 recipes/binutils/binutils_2.19.bb             |    2 +-
 recipes/binutils/binutils_csl-arm-20050416.bb |    2 +-
 recipes/binutils/binutils_csl-arm-20050603.bb |    2 +-
 recipes/binutils/binutils_cvs.bb              |    2 +-
 20 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/recipes/binutils/binutils-cross.inc b/recipes/binutils/binutils-cross.inc
index 384d18c..872b04a 100644
--- a/recipes/binutils/binutils-cross.inc
+++ b/recipes/binutils/binutils-cross.inc
@@ -23,12 +23,28 @@ do_stage () {
 	rmdir ${CROSS_DIR}/${libdir}64 || :
 	rmdir ${CROSS_DIR}/${prefix} || :
 
-	# We want to move this into the target specific location
-	mkdir -p ${STAGING_DIR_TARGET}/lib
-	mv -f ${CROSS_DIR}/lib/libiberty.a ${STAGING_DIR_TARGET}/lib || \
-		mv -f ${CROSS_DIR}/lib64/libiberty.a ${STAGING_DIR_TARGET}/lib
-	rmdir ${CROSS_DIR}/lib || :
-	rmdir ${CROSS_DIR}/lib64 || :
+	LIBBFD_DIR_BASE=${CROSS_DIR}/${BUILD_SYS}/${TARGET_SYS}
+	# We want to move libbfd and libopcodes to  ${CROSS_DIR}/lib
+	mkdir -p ${CROSS_DIR}/lib
+	mv -f ${LIBBFD_DIR_BASE}/lib/* ${CROSS_DIR}/lib || \
+		mv -f ${LIBBFD_DIR_BASE}/lib64/* ${CROSS_DIR}/lib
+	rmdir ${LIBBFD_DIR_BASE}/lib || :
+	rmdir ${LIBBFD_DIR_BASE}/lib64 || :
+	
+	# Adjust libbfd.la and libopcodes.la
+	for i in libbfd.la libopcodes.la; do
+	sed -i -e "s@${LIBBFD_DIR_BASE}/lib64@${CROSS_DIR}/lib@" ${CROSS_DIR}/lib/$i
+	sed -i -e "s@${LIBBFD_DIR_BASE}/lib@${CROSS_DIR}/lib@" ${CROSS_DIR}/lib/$i
+	done
+
+	# libbfd headers should be moved as well
+	mkdir -p ${CROSS_DIR}/include
+	mv -f ${LIBBFD_DIR_BASE}/include/* ${CROSS_DIR}/include
+	rmdir ${LIBBFD_DIR_BASE}/include 
+
+	# Remove empty directories
+	rmdir ${CROSS_DIR}/${BUILD_SYS}/${TARGET_SYS} || :
+	rmdir ${CROSS_DIR}/${BUILD_SYS} || :
 }
 
 do_install () {
diff --git a/recipes/binutils/binutils_2.14.90.0.6.bb b/recipes/binutils/binutils_2.14.90.0.6.bb
index eb72082..bdbbcff 100644
--- a/recipes/binutils/binutils_2.14.90.0.6.bb
+++ b/recipes/binutils/binutils_2.14.90.0.6.bb
@@ -1,7 +1,7 @@
 SECTION = "devel"
 inherit autotools gettext
 
-PR = "r5"
+PR = "r6"
 
 DESCRIPTION = "A GNU collection of binary utilities"
 HOMEPAGE = "http://www.gnu.org/software/binutils/"
diff --git a/recipes/binutils/binutils_2.14.90.0.7.bb b/recipes/binutils/binutils_2.14.90.0.7.bb
index f940c87..e58d0cc 100644
--- a/recipes/binutils/binutils_2.14.90.0.7.bb
+++ b/recipes/binutils/binutils_2.14.90.0.7.bb
@@ -4,7 +4,7 @@ inherit autotools gettext
 DESCRIPTION = "A GNU collection of binary utilities"
 HOMEPAGE = "http://www.gnu.org/software/binutils/"
 LICENSE = "GPL"
-PR = "r6"
+PR = "r7"
 
 PACKAGES = "${PN} ${PN}-dev ${PN}-doc ${PN}-symlinks"
 
diff --git a/recipes/binutils/binutils_2.15.94.0.1.bb b/recipes/binutils/binutils_2.15.94.0.1.bb
index 74a902b..b73e862 100644
--- a/recipes/binutils/binutils_2.15.94.0.1.bb
+++ b/recipes/binutils/binutils_2.15.94.0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A GNU collection of binary utilities"
 HOMEPAGE = "http://www.gnu.org/software/binutils/"
 SECTION = "devel"
 LICENSE = "GPL"
-PR = "r5"
+PR = "r6"
 
 inherit autotools gettext
 
diff --git a/recipes/binutils/binutils_2.16.1.bb b/recipes/binutils/binutils_2.16.1.bb
index 8235300..64ae34d 100644
--- a/recipes/binutils/binutils_2.16.1.bb
+++ b/recipes/binutils/binutils_2.16.1.bb
@@ -1,4 +1,4 @@
-PR = "r1"
+PR = "r2"
 
 CROSSTOOL_PATCH_URL = "http://www.kegel.com/crosstool/crosstool-0.43/patches/binutils-2.16.1/"
 SRC_URI = \
diff --git a/recipes/binutils/binutils_2.16.91.0.6.bb b/recipes/binutils/binutils_2.16.91.0.6.bb
index b251149..d2701c2 100644
--- a/recipes/binutils/binutils_2.16.91.0.6.bb
+++ b/recipes/binutils/binutils_2.16.91.0.6.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A GNU collection of binary utilities"
 HOMEPAGE = "http://www.gnu.org/software/binutils/"
 SECTION = "devel"
 LICENSE = "GPL"
-PR = "r3"
+PR = "r4"
 
 # glibc 2.3 has issues with this version
 # of binutils.
diff --git a/recipes/binutils/binutils_2.16.91.0.7.bb b/recipes/binutils/binutils_2.16.91.0.7.bb
index 76c1285..7a53dd0 100644
--- a/recipes/binutils/binutils_2.16.91.0.7.bb
+++ b/recipes/binutils/binutils_2.16.91.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/binutils/"
 SECTION = "devel"
 LICENSE = "GPL"
 DEFAULT_PREFERENCE = "-1"
-PR = "r2"
+PR = "r3"
 
 inherit autotools gettext
 
diff --git a/recipes/binutils/binutils_2.16.bb b/recipes/binutils/binutils_2.16.bb
index 9035b44..c3dd6df 100644
--- a/recipes/binutils/binutils_2.16.bb
+++ b/recipes/binutils/binutils_2.16.bb
@@ -1,4 +1,4 @@
-PR = "r10"
+PR = "r11"
 
 SRC_URI = \
     "${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
diff --git a/recipes/binutils/binutils_2.17.50.0.1.bb b/recipes/binutils/binutils_2.17.50.0.1.bb
index 76c1285..7a53dd0 100644
--- a/recipes/binutils/binutils_2.17.50.0.1.bb
+++ b/recipes/binutils/binutils_2.17.50.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/binutils/"
 SECTION = "devel"
 LICENSE = "GPL"
 DEFAULT_PREFERENCE = "-1"
-PR = "r2"
+PR = "r3"
 
 inherit autotools gettext
 
diff --git a/recipes/binutils/binutils_2.17.50.0.12.bb b/recipes/binutils/binutils_2.17.50.0.12.bb
index d24d24e..84f608b 100644
--- a/recipes/binutils/binutils_2.17.50.0.12.bb
+++ b/recipes/binutils/binutils_2.17.50.0.12.bb
@@ -1,5 +1,5 @@
 require binutils.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = \
     "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2 \
diff --git a/recipes/binutils/binutils_2.17.50.0.5.bb b/recipes/binutils/binutils_2.17.50.0.5.bb
index 1d1c3fb..041c5d7 100644
--- a/recipes/binutils/binutils_2.17.50.0.5.bb
+++ b/recipes/binutils/binutils_2.17.50.0.5.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = \
     "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2 \
diff --git a/recipes/binutils/binutils_2.17.50.0.8.bb b/recipes/binutils/binutils_2.17.50.0.8.bb
index f659b3b..1d1c3fb 100644
--- a/recipes/binutils/binutils_2.17.50.0.8.bb
+++ b/recipes/binutils/binutils_2.17.50.0.8.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = \
     "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2 \
diff --git a/recipes/binutils/binutils_2.17.bb b/recipes/binutils/binutils_2.17.bb
index 0f0b5d6..fdee8a5 100644
--- a/recipes/binutils/binutils_2.17.bb
+++ b/recipes/binutils/binutils_2.17.bb
@@ -1,7 +1,7 @@
 require binutils.inc
 require binutils-avr32.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = \
     "http://ftp.gnu.org/gnu/binutils/binutils-${PV}.tar.bz2 \
diff --git a/recipes/binutils/binutils_2.18.50.0.7.bb b/recipes/binutils/binutils_2.18.50.0.7.bb
index a89431e..d9a9cec 100644
--- a/recipes/binutils/binutils_2.18.50.0.7.bb
+++ b/recipes/binutils/binutils_2.18.50.0.7.bb
@@ -1,4 +1,4 @@
-PR = "r6"
+PR = "r7"
 
 require binutils.inc
 
diff --git a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binutils_2.18.bb
index 9367196..b746f9b 100644
--- a/recipes/binutils/binutils_2.18.bb
+++ b/recipes/binutils/binutils_2.18.bb
@@ -1,4 +1,4 @@
-PR = "r4"
+PR = "r5"
 
 require binutils.inc
 
diff --git a/recipes/binutils/binutils_2.19.1.bb b/recipes/binutils/binutils_2.19.1.bb
index c399ab8..aee5840 100644
--- a/recipes/binutils/binutils_2.19.1.bb
+++ b/recipes/binutils/binutils_2.19.1.bb
@@ -1,4 +1,4 @@
-PR = "r0"
+PR = "r1"
 
 require binutils.inc
 
diff --git a/recipes/binutils/binutils_2.19.bb b/recipes/binutils/binutils_2.19.bb
index aee5840..ef07600 100644
--- a/recipes/binutils/binutils_2.19.bb
+++ b/recipes/binutils/binutils_2.19.bb
@@ -1,4 +1,4 @@
-PR = "r1"
+PR = "r2"
 
 require binutils.inc
 
diff --git a/recipes/binutils/binutils_csl-arm-20050416.bb b/recipes/binutils/binutils_csl-arm-20050416.bb
index 2c7c207..342572d 100644
--- a/recipes/binutils/binutils_csl-arm-20050416.bb
+++ b/recipes/binutils/binutils_csl-arm-20050416.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/binutils/"
 LICENSE = "GPL"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-cvs"
 PV = "2.15.99+csl-arm+cvs20050416"
-PR = "r3"
+PR = "r4"
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_arm-linux = "-1"
diff --git a/recipes/binutils/binutils_csl-arm-20050603.bb b/recipes/binutils/binutils_csl-arm-20050603.bb
index 13759b4..8a9c0ce 100644
--- a/recipes/binutils/binutils_csl-arm-20050603.bb
+++ b/recipes/binutils/binutils_csl-arm-20050603.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/binutils/"
 LICENSE = "GPL"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-cvs"
 PV = "2.15.99+csl-arm+cvs20050603"
-PR = "r3"
+PR = "r4"
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 DEFAULT_PREFERENCE = "-1"
 #DEFAULT_PREFERENCE_arm-linux = "1"
diff --git a/recipes/binutils/binutils_cvs.bb b/recipes/binutils/binutils_cvs.bb
index 75c8886..0c2064b 100644
--- a/recipes/binutils/binutils_cvs.bb
+++ b/recipes/binutils/binutils_cvs.bb
@@ -1,6 +1,6 @@
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-cvs"
 PV = "0.0+cvs${SRCDATE}"
-PR = "r0"
+PR = "r1"
 
 require binutils.inc
 
-- 
1.6.0.4

-- 
Tom Rini


