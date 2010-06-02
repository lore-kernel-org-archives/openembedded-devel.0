Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJuj3-00030e-Nf
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:39:51 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so2440042pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=4mC9ipQtBF2VPGvlGLuUqLqb5OQDC8RMfVoCCw40quo=;
	b=IaJl1os9PU6wQQSLNGGoJrh0p7x8cThFQtMcaJspxNH69iBnD4HHoLHFe9sz1Suq+x
	LdHRjFfAsbFRd+6y8xnvHJ6gZhXmOquA+VwMEmlfRtfvQ4pStO+Gqlmi2Kk/8+NyJE08
	eY3icLImIBlV3ZvDx1Cif5MBLLGJfpjYXXEjw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=x/4zEqHbpDvJ8tT4+hWiERRZ0byAK8QDOt+p0rev7hEa6sffN+VjkxLQdP5y2J7tCa
	2Qqmx6dHXuit1jtO3zb62CRjExkbRXqWYwn/mJtn7dQa5ykSzXUFwpC3eeYUBeQWhS95
	CrvxTrZUoKtkSs4cGTSZ7vFifVd2Ru10YbWIQ=
Received: by 10.142.152.5 with SMTP id z5mr5554044wfd.266.1275510932532;
	Wed, 02 Jun 2010 13:35:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:46 -0700
Message-Id: <1275510896-30845-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/16] db_5.0.21: Add recipes for target and native packages.
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
X-List-Received-Date: Wed, 02 Jun 2010 20:39:51 -0000

* Get rid of old style staging.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/db/db-native_4.2.52.bb             |    1 -
 recipes/db/db-native_5.0.21.bb             |    2 +
 recipes/db/db4-native.inc                  |   13 ----
 recipes/db/db4.inc                         |   13 ----
 recipes/db/db5.inc                         |   83 ++++++++++++++++++++++++++++
 recipes/db/db_4.2.52.bb                    |    2 +-
 recipes/db/db_4.3.29.bb                    |    2 +-
 recipes/db/db_5.0.21.bb                    |   15 +++++
 recipes/db/files/db5-arm-thumb-mutex.patch |   38 +++++++++++++
 9 files changed, 140 insertions(+), 29 deletions(-)
 create mode 100644 recipes/db/db-native_5.0.21.bb
 create mode 100644 recipes/db/db5.inc
 create mode 100644 recipes/db/db_5.0.21.bb
 create mode 100644 recipes/db/files/db5-arm-thumb-mutex.patch

diff --git a/recipes/db/db-native_4.2.52.bb b/recipes/db/db-native_4.2.52.bb
index 9f307d6..4ff80fd 100644
--- a/recipes/db/db-native_4.2.52.bb
+++ b/recipes/db/db-native_4.2.52.bb
@@ -1,5 +1,4 @@
 require db_${PV}.bb
 require db4-native.inc
-
 SRC_URI[md5sum] = "8b5cff6eb83972afdd8e0b821703c33c"
 SRC_URI[sha256sum] = "f4bddd8d1b4cde0daf5e13e3493ed62a25b736b0bf258e1d929e47bc6a82a28c"
diff --git a/recipes/db/db-native_5.0.21.bb b/recipes/db/db-native_5.0.21.bb
new file mode 100644
index 0000000..0e6381b
--- /dev/null
+++ b/recipes/db/db-native_5.0.21.bb
@@ -0,0 +1,2 @@
+require db_${PV}.bb
+require db4-native.inc
diff --git a/recipes/db/db4-native.inc b/recipes/db/db4-native.inc
index cc83d86..7fd753d 100644
--- a/recipes/db/db4-native.inc
+++ b/recipes/db/db4-native.inc
@@ -13,16 +13,3 @@ do_package() {
 }
 
 PACKAGES = ""
-
-do_stage() {
-         # The .h files get installed read-only, the autostage
-         # function just uses cp -pPR, so do this by hand
-         rm -rf ${STAGE_TEMP}
-         mkdir -p ${STAGE_TEMP}
-         oe_runmake DESTDIR="${STAGE_TEMP}" install_include
-         cp -pPRf ${STAGE_TEMP}/${includedir}/* ${STAGING_INCDIR}/.
-         rm -rf ${STAGE_TEMP}
-         oe_libinstall -so -C .libs libdb-${PVM} ${STAGING_LIBDIR}
-         ln -sf libdb-${PVM}.so ${STAGING_LIBDIR}/libdb.so
-         ln -sf libdb-${PVM}.a ${STAGING_LIBDIR}/libdb.a
-}
diff --git a/recipes/db/db4.inc b/recipes/db/db4.inc
index 12d4ad2..73d339d 100644
--- a/recipes/db/db4.inc
+++ b/recipes/db/db4.inc
@@ -81,16 +81,3 @@ do_install_append() {
 		mv "${D}/${prefix}/docs" "${D}/${docdir}"
 	fi
 }
-
-do_stage() {
-	# The .h files get installed read-only, the autostage
-	# function just uses cp -pPR, so do this by hand
-	rm -rf ${STAGE_TEMP}
-	mkdir -p ${STAGE_TEMP}
-	oe_runmake DESTDIR="${STAGE_TEMP}" install_include
-	cp -pPRf ${STAGE_TEMP}/${includedir}/* ${STAGING_INCDIR}/.
-	rm -rf ${STAGE_TEMP}
-	oe_libinstall -so -C .libs libdb-${PVM} ${STAGING_LIBDIR}
-	ln -sf libdb-${PVM}.so ${STAGING_LIBDIR}/libdb.so
-	ln -sf libdb-${PVM}.a ${STAGING_LIBDIR}/libdb.a
-}
diff --git a/recipes/db/db5.inc b/recipes/db/db5.inc
new file mode 100644
index 0000000..599093e
--- /dev/null
+++ b/recipes/db/db5.inc
@@ -0,0 +1,83 @@
+# Version 5 of the Berkeley DB from Oracle
+#
+# At present this package only installs the DB code
+# itself (shared libraries, .a in the dev package),
+# documentation and headers.
+#
+# The headers have the same names as those as v3
+# of the DB, only one version can be used *for dev*
+# at once - DB3 and DB5 both be installed on the
+# same system at the same time if really necessary.
+
+
+DESCRIPTION = "Berkeley DB v5."
+HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
+SECTION = "libs"
+LICENSE = "BSD"
+VIRTUAL_NAME ?= "virtual/db"
+CONFLICTS = "db3 db4"
+
+SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
+
+inherit autotools
+
+# Put virtual/db in any appropriate provider of a
+# relational database, use it as a dependency in
+# place of a specific db and use:
+#
+# PREFERRED_PROVIDER_virtual/db
+#
+# to select the correct db in the build (distro) .conf
+PROVIDES += "${VIRTUAL_NAME}"
+
+# bitbake isn't quite clever enough to deal with db,
+# the distribution sits in the expected directory, but all
+# the builds must occur from a sub-directory.  The following
+# persuades bitbake to go to the right place
+S = "${WORKDIR}/db-${PV}/dist"
+B = "${WORKDIR}/db-${PV}/build_unix"
+
+# The executables go in a separate package - typically there
+# is no need to install these unless doing real database
+# management on the system.
+PACKAGES += " ${PN}-bin"
+
+# Package contents
+FILES_${PN} = "${libdir}/libdb-5*so*"
+FILES_${PN}-bin = "${bindir}/*"
+# The dev package has the .so link (as in db3) and the .a's -
+# it is therefore incompatible (cannot be installed at the
+# same time) as the db3 package
+FILES_${PN}-dev = "${includedir} ${libdir}/*"
+
+EXTRA_OECONF = "${DB5_CONFIG}"
+
+# Override the MUTEX setting here, the POSIX library is
+# the default - "POSIX/pthreads/library".
+# Don't ignore the nice SWP instruction on the ARM:
+# These enable the ARM assembler mutex code, this won't
+# work with thumb compilation...
+ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
+MUTEX = ""
+MUTEX_arm = "${ARM_MUTEX}"
+MUTEX_armeb = "${ARM_MUTEX}"
+EXTRA_OECONF += "${MUTEX}"
+
+# Cancel the site stuff - it's set for db3 and destroys the
+# configure.
+CONFIG_SITE = ""
+do_configure() {
+	( cd ${WORKDIR}/db-${PV}/dist ; gnu-configize ) 
+	oe_runconf
+}
+
+
+do_install_append() {
+	# The docs end up in /usr/docs - not right.
+	if test -d "${D}/${prefix}/docs"
+	then
+		mkdir -p "${D}/${datadir}"
+		test ! -d "${D}/${docdir}" || rm -rf "${D}/${docdir}"
+		mv "${D}/${prefix}/docs" "${D}/${docdir}"
+	fi
+}
diff --git a/recipes/db/db_4.2.52.bb b/recipes/db/db_4.2.52.bb
index 3b9bab8..5f135ed 100644
--- a/recipes/db/db_4.2.52.bb
+++ b/recipes/db/db_4.2.52.bb
@@ -1,4 +1,4 @@
-PR = "r8"
+PR = "r9"
 
 #major version number
 PVM = "4.2"
diff --git a/recipes/db/db_4.3.29.bb b/recipes/db/db_4.3.29.bb
index c5ecfde..1e54203 100644
--- a/recipes/db/db_4.3.29.bb
+++ b/recipes/db/db_4.3.29.bb
@@ -1,4 +1,4 @@
-PR = "r10"
+PR = "r11"
 
 # major version number
 PVM = "4.3"
diff --git a/recipes/db/db_5.0.21.bb b/recipes/db/db_5.0.21.bb
new file mode 100644
index 0000000..cfa0154
--- /dev/null
+++ b/recipes/db/db_5.0.21.bb
@@ -0,0 +1,15 @@
+PR = "r0"
+
+# major version number
+PVM = "5.0"
+
+#configuration - set in local.conf to override
+# All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
+DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-statistics --disable-verify --enable-compat185"
+
+require db5.inc
+
+SRC_URI += "file://db5-arm-thumb-mutex.patch"
+
+SRC_URI[md5sum] = "9a749fd2e98fe15840493ddc34cc66d8"
+SRC_URI[sha256sum] = "061a31a962e992dd1eae5f1e3193241d497a18968e750707526d104b53ab3cc4"
diff --git a/recipes/db/files/db5-arm-thumb-mutex.patch b/recipes/db/files/db5-arm-thumb-mutex.patch
new file mode 100644
index 0000000..51b8882
--- /dev/null
+++ b/recipes/db/files/db5-arm-thumb-mutex.patch
@@ -0,0 +1,38 @@
+Index: db-5.0.21/../dbinc/mutex_int.h
+===================================================================
+--- db-5.0.21.orig/../dbinc/mutex_int.h	2010-03-30 10:36:09.000000000 -0700
++++ db-5.0.21/../dbinc/mutex_int.h	2010-05-22 12:07:38.281286337 -0700
+@@ -474,6 +474,25 @@ typedef unsigned char tsl_t;
+ 
+ #ifdef LOAD_ACTUAL_MUTEX_CODE
+ /* gcc/arm: 0 is clear, 1 is set. */
++#if defined __thumb__
++#define	MUTEX_SET(tsl) ({						\
++	int __r, __p;							\
++	asm volatile(							\
++		".align	2\n\t"						\
++		"bx	pc\n\t"						\
++		"nop\n\t"						\
++		".arm\n\t"						\
++		"swpb	%0, %2, [%3]\n\t"				\
++		"eor	%0, %0, #1\n\t"					\
++		"orr	%1, pc, #1\n\t"					\
++		"bx	%1\n\t"						\
++		".force_thumb"						\
++	    : "=&r" (__r), "=r" (__p)					\
++	    : "r" (1), "r" (tsl)					\
++	    );								\
++	__r & 1;							\
++})
++#else
+ #define	MUTEX_SET(tsl) ({						\
+ 	int __r;							\
+ 	__asm__ volatile(						\
+@@ -484,6 +503,7 @@ typedef unsigned char tsl_t;
+ 	    );								\
+ 	__r & 1;							\
+ })
++#endif
+ 
+ #define	MUTEX_UNSET(tsl)	(*(volatile tsl_t *)(tsl) = 0)
+ #define	MUTEX_INIT(tsl)         (MUTEX_UNSET(tsl), 0)
-- 
1.7.0.4



