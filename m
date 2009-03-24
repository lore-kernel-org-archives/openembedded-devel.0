Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lm1ZY-0002rV-J4
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 09:01:21 +0100
Received: by wa-out-1112.google.com with SMTP id n7so1403968wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:mime-version:content-type:content-transfer-encoding
	:message-id; bh=3D4orVpOhwUC2pHi9E8ZrvBA0ovVXN1zawud4+Q6TEI=;
	b=LfVXdzNvMiKl5MKZfLeQajfXVQShkdFZ3OutKCHe516iIWGGjlqy4Jcv1dJlU+L0F3
	I5JeydKtllKT8aT4Yv+3M7SnbusH3Imhvh3fJwJjBnEGnbG6PEDtZtyoRWut6D0DtPoV
	5gA8l1tfJpJB3AoSxZjOlN4OZm4AemzKNwR7s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	b=iWTuehKbbJpLeuhTk9C8bXLPsLdQimpSeD62SgNeBgALgp/sPS2vYqSY3wcnHVdL3Y
	cDxvCp331DxSy1q74F+IZRe6T1oJ4RzimSjGTfXdUVPt71ZrOKj/UNSrZVMd5dbs9g0n
	mz4NtHjJIWe+cY7dVPshY3+sZ7xqgVC3hM6R8=
Received: by 10.115.108.1 with SMTP id k1mr5439698wam.0.1237881593167;
	Tue, 24 Mar 2009 00:59:53 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-12-154.dsl.pltn13.sbcglobal.net
	[71.146.12.154])
	by mx.google.com with ESMTPS id k14sm6143793waf.23.2009.03.24.00.59.51
	(version=SSLv3 cipher=RC4-MD5); Tue, 24 Mar 2009 00:59:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Mar 2009 00:59:26 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-11-generic; KDE/4.2.1; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200903240059.33172.raj.khem@gmail.com>
Subject: [PATCH] [RFC] Add new distutils-native-base class so solve PYTHON_DIR problem for native packages
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
X-List-Received-Date: Tue, 24 Mar 2009 08:01:21 -0000
X-Groupsio-MsgNum: 8645
Content-Type: multipart/signed; boundary="nextPart3416167.XyDWgkZJtl";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3416167.XyDWgkZJtl
Content-Type: multipart/mixed;
  boundary="Boundary-01=_fLJyJil6YMLUSjr"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_fLJyJil6YMLUSjr
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi

I bumped into this problem today. I parsed dependencies for libxml2-native =
and it was pulling all sort of packages=20
which are really meant for target packages e.g. it was pulling in python al=
ong with python-native and then this inturn
was pulling in other packages.

This is because we inherit from distutils-base class in the native recipes =
of libxml2 and same is case with rpm-native

The native recipes infact need less than what distutils-base provides, so I=
 divided this class into=20

distutils-common-base which is inherited by distutils-base class and distut=
ils-native-base class (new)

Now we can use distuitls-native-base class for the native packages who need=
 variables like PYTHON_DIR

I fixed zope-native rpm-native and libxml-native recipes. They needed a bit=
 of restructuring.

Now I get correct build deps for these packages.

OK for .dev ?

=2D-=20
Khem Raj


--Boundary-01=_fLJyJil6YMLUSjr
Content-Type: text/x-patch;
  charset="us-ascii";
  name="diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
	filename="diff"

diff --git a/classes/distutils-common-base.bbclass b/classes/distutils-comm=
on-base.bbclass
new file mode 100644
index 0000000..4bcef68
=2D-- /dev/null
+++ b/classes/distutils-common-base.bbclass
@@ -0,0 +1,28 @@
+EXTRA_OEMAKE =3D ""
+RDEPENDS +=3D "python-core"
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+def python_dir(d):
+	import os, bb
+	staging_incdir =3D bb.data.getVar( "STAGING_INCDIR", d, 1 )
+	for majmin in "2.6 2.5 2.4 2.3".split():
+		if os.path.exists( "%s/python%s" % ( staging_incdir, majmin ) ): return =
"python%s" % majmin
+	raise "No Python in STAGING_INCDIR. Forgot to build python-native ?"
+
+PYTHON_DIR =3D "${@python_dir(d)}"
+
+PACKAGES =3D "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
+
+FILES_${PN} =3D "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
+
+FILES_${PN}-dev +=3D "\
+  ${libdir}/pkgconfig \
+  ${libdir}/${PYTHON_DIR}/site-packages/*.la \
+"
+FILES_${PN}-dbg =3D "\
+  ${libdir}/${PYTHON_DIR}/site-packages/.debug \
+  ${libdir}/${PYTHON_DIR}/site-packages/*/.debug \
+  ${libdir}/${PYTHON_DIR}/site-packages/*/*/.debug \
+"
diff --git a/classes/distutils-native-base.bbclass b/classes/distutils-nati=
ve-base.bbclass
new file mode 100644
index 0000000..2703fe0
=2D-- /dev/null
+++ b/classes/distutils-native-base.bbclass
@@ -0,0 +1,3 @@
+DEPENDS  +=3D "${@["python-native", ""][(bb.data.getVar('PACKAGES', d, 1) =
=3D=3D '')]}"
+
+inherit distutils-common-base
diff --git a/recipes/rpm/rpm-4.4.2.3.inc b/recipes/rpm/rpm-4.4.2.3.inc
new file mode 100644
index 0000000..155e6f6
=2D-- /dev/null
+++ b/recipes/rpm/rpm-4.4.2.3.inc
@@ -0,0 +1,97 @@
+DESCRIPTION =3D "The RPM Package Manager."
+HOMEPAGE =3D "http://rpm.org/"
+LICENSE =3D "LGPL GPL"
+PR =3D "r15"
+
+SRC_URI =3D "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
+           file://external-tools.patch;patch=3D1 \
+	   file://cross_libpaths.patch;patch=3D1 \
+	   file://rpmconfigdir.patch;patch=3D1 \
+	   file://weakdeps.patch;patch=3D1;pnum=3D0 \
+	   file://tagsbackport.patch;patch=3D1;pnum=3D0 \
+	   file://missingok.patch;patch=3D1;pnum=3D0 \
+	   file://extcond.patch;patch=3D1;pnum=3D0"
+
+inherit autotools gettext
+
+S =3D "${WORKDIR}/rpm-${PV}"
+
+ARM_INSTRUCTION_SET =3D "arm"
+
+acpaths =3D "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
+
+PACKAGES +=3D "python-rpm"
+FILES_python-rpm =3D "${libdir}/python*/site-packages/rpm/_*"
+
+# Handle the db MUTEX settings here, the POSIX library is
+# the default - "POSIX/pthreads/library".
+# Don't ignore the nice SWP instruction on the ARM:
+# These enable the ARM assembler mutex code, this won't
+# work with thumb compilation...
+ARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
+MUTEX =3D ""
+MUTEX_arm =3D "${ARM_MUTEX}"
+MUTEX_armeb =3D "${ARM_MUTEX}"
+EXTRA_OECONF +=3D "${MUTEX}"
+
+export varprefix =3D "${localstatedir}"
+
+do_configure_prepend (){
+	export EXTRA_OECONF=3D"--with-python \
+		--with-python-incdir=3D${STAGING_INCDIR}/${PYTHON_DIR} \
+		--with-python-libdir=3D${libdir}/${PYTHON_DIR} \
+		--without-apidocs \
+		--without-selinux \
+		--without-lua \
+		--without-dmalloc \
+		--without-efence"
+}
+
+do_configure () {
+	rm ${S}/popt/ -Rf
+	rm ${S}/db/dist/configure.in -f
+	cd ${S}/db/dist/aclocal
+	rm libtool* -f
+	for i in `ls *.ac`; do
+	    j=3D`echo $i | sed 's/.ac/.m4/g'`
+	    mv $i $j
+	done
+	cd ${S}/db/dist/aclocal_java
+	for i in `ls *.ac`; do
+	    j=3D`echo $i | sed 's/.ac/.m4/g'`
+	    mv $i $j
+	done
+	cd ${S}
+	autotools_do_configure
+	cd ${S}/db/dist
+	. ./RELEASE
+	# Edit version information we couldn't pre-compute.
+	sed -i -e "s/__EDIT_DB_VERSION_MAJOR__/$DB_VERSION_MAJOR/g"  configure
+	sed -i -e "s/__EDIT_DB_VERSION_MINOR__/$DB_VERSION_MINOR/g"  configure
+	sed -i -e "s/__EDIT_DB_VERSION_PATCH__/$DB_VERSION_PATCH/g"  configure
+	sed -i -e "s/__EDIT_DB_VERSION_STRING__/$DB_VERSION_STRING/g"  configure
+	sed -i -e "s/__EDIT_DB_VERSION_UNIQUE_NAME__/$DB_VERSION_UNIQUE_NAME/g"  =
configure
+	sed -i -e "s/__EDIT_DB_VERSION__/$DB_VERSION/g"  configure
+	cd ${S}/db3
+	${S}/db3/configure \
+		    --build=3D${BUILD_SYS} \
+		    --host=3D${HOST_SYS} \
+		    --target=3D${TARGET_SYS} \
+		    --prefix=3D${prefix} \
+		    --exec_prefix=3D${exec_prefix} \
+		    --bindir=3D${bindir} \
+		    --sbindir=3D${sbindir} \
+		    --libexecdir=3D${libexecdir} \
+		    --datadir=3D${datadir} \
+		    --sysconfdir=3D${sysconfdir} \
+		    --sharedstatedir=3D${sharedstatedir} \
+		    --localstatedir=3D${localstatedir} \
+		    --libdir=3D${libdir} \
+		    --includedir=3D${includedir} \
+		    --oldincludedir=3D${oldincludedir} \
+		    --infodir=3D${infodir} \
+		    --mandir=3D${mandir} \
+		    ${EXTRA_OECONF} \
+		    --with-pic
+
+}
diff --git a/recipes/zope/zope-3.3.1.inc b/recipes/zope/zope-3.3.1.inc
new file mode 100644
index 0000000..18806b9
=2D-- /dev/null
+++ b/recipes/zope/zope-3.3.1.inc
@@ -0,0 +1,47 @@
+DESCRIPTION =3D "A full fledged pluggable content management system with i=
ntegrated web server and much more."
+SECTION =3D "console/network"
+PRIORITY =3D "optional"
+DEPENDS =3D "python"
+RDEPENDS =3D "python-core python-shell"
+LICENSE =3D "ZPL"
+PR =3D "r9"
+
+SRC_URI =3D "http://www.zope.org/Products/Zope3/${PV}/Zope-${PV}.tgz"
+S =3D "${WORKDIR}/Zope-${PV}"
+
+do_configure() {
+	./configure --with-python=3D${STAGING_BINDIR_NATIVE}/python --prefix=3D${=
prefix} --force
+}
+
+do_compile() {
+	oe_runmake HOST_SYS=3D${HOST_SYS} BUILD_SYS=3D${BUILD_SYS} STAGING_INCDIR=
=3D${STAGING_INCDIR}
+}
+
+do_install() {
+	install -d ${D}${libdir}/${PYTHON_DIR}
+	oe_runmake install prefix=3D${D}${prefix} HOST_SYS=3D${HOST_SYS} BUILD_SY=
S=3D${BUILD_SYS}
+	mv ${D}${libdir}/python/* ${D}${libdir}/${PYTHON_DIR}=20
+	rm -rf ${D}${libdir}/${PYTHON_DIR}/twisted
+	rm -rf ${D}${libdir}/${PYTHON_DIR}/zope/app/twisted
+}
+
+PACKAGES =3D+ "python-zopeinterface python-zopeinterface-dbg"
+
+FILES_${PN} =3D "${prefix}"
+FILES_${PN}_doc =3D "${prefix}/doc"
+FILES_${PN}-dbg +=3D "\
+${libdir}/${PYTHON_DIR}/BTrees/.debug \
+${libdir}/${PYTHON_DIR}/persistent/.debug \
+${libdir}/${PYTHON_DIR}/zope/proxy/.debug \
+${libdir}/${PYTHON_DIR}/zope/thread/.debug \
+${libdir}/${PYTHON_DIR}/zope/security/.debug \
+${libdir}/${PYTHON_DIR}/zope/hookable/.debug \
+${libdir}/${PYTHON_DIR}/zope/app/container/.debug \
+${libdir}/${PYTHON_DIR}/zope/i18nmessageid/.debug \
+${libdir}/${PYTHON_DIR}/ZODB/.debug"
+FILES_python-zopeinterface-dbg +=3D "${libdir}/${PYTHON_DIR}/zope/interfac=
e/.debug "
+
+FILES_python-zopeinterface =3D " ${libdir}/${PYTHON_DIR}/zope/__init__.py*=
 \
+	${libdir}/${PYTHON_DIR}/zope/interface/*.* \
+	${libdir}/${PYTHON_DIR}/zope/interface/common"
+
diff --git a/classes/distutils-base.bbclass b/classes/distutils-base.bbclass
index a08414a..2e151de 100644
=2D-- a/classes/distutils-base.bbclass
+++ b/classes/distutils-base.bbclass
@@ -1,29 +1,5 @@
=2DEXTRA_OEMAKE =3D ""
 DEPENDS  +=3D "${@["python-native python", ""][(bb.data.getVar('PACKAGES',=
 d, 1) =3D=3D '')]}"
 RDEPENDS +=3D "python-core"
=20
=2Dexport STAGING_INCDIR
=2Dexport STAGING_LIBDIR
+inherit distutils-common-base
=20
=2Ddef python_dir(d):
=2D	import os, bb
=2D	staging_incdir =3D bb.data.getVar( "STAGING_INCDIR", d, 1 )
=2D	for majmin in "2.6 2.5 2.4 2.3".split():
=2D		if os.path.exists( "%s/python%s" % ( staging_incdir, majmin ) ): retur=
n "python%s" % majmin
=2D	raise "No Python in STAGING_INCDIR. Forgot to build python-native ?"
=2D
=2DPYTHON_DIR =3D "${@python_dir(d)}"
=2D
=2DPACKAGES =3D "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
=2D
=2DFILES_${PN} =3D "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
=2D
=2DFILES_${PN}-dev +=3D "\
=2D  ${libdir}/pkgconfig \
=2D  ${libdir}/${PYTHON_DIR}/site-packages/*.la \
=2D"
=2DFILES_${PN}-dbg =3D "\
=2D  ${libdir}/${PYTHON_DIR}/site-packages/.debug \
=2D  ${libdir}/${PYTHON_DIR}/site-packages/*/.debug \
=2D  ${libdir}/${PYTHON_DIR}/site-packages/*/*/.debug \
=2D"
diff --git a/classes/distutils-common-base.bbclass b/classes/distutils-comm=
on-base.bbclass
index 4bcef68..068eac4 100644
=2D-- a/classes/distutils-common-base.bbclass
+++ b/classes/distutils-common-base.bbclass
@@ -1,5 +1,4 @@
 EXTRA_OEMAKE =3D ""
=2DRDEPENDS +=3D "python-core"
=20
 export STAGING_INCDIR
 export STAGING_LIBDIR
diff --git a/recipes/libxml/libxml2-native.inc b/recipes/libxml/libxml2-nat=
ive.inc
index c8182de..1cfa9f7 100644
=2D-- a/recipes/libxml/libxml2-native.inc
+++ b/recipes/libxml/libxml2-native.inc
@@ -5,10 +5,10 @@ FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,=
1))}/libxml2-${PV}"
 SRC_URI =3D "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz"
 S =3D "${WORKDIR}/libxml2-${PV}"
=20
=2Dinherit distutils-base autotools native pkgconfig
+inherit autotools native pkgconfig distutils-native-base
=20
 do_configure_prepend () {
=2D	EXTRA_OECONF =3D "\
+	export EXTRA_OECONF=3D"\
 	--with-python=3D${PYTHON_DIR} \
 	--without-debug \
 	--without-legacy \
diff --git a/recipes/rpm/rpm-4.4.2.3.inc b/recipes/rpm/rpm-4.4.2.3.inc
index 155e6f6..8de8266 100644
=2D-- a/recipes/rpm/rpm-4.4.2.3.inc
+++ b/recipes/rpm/rpm-4.4.2.3.inc
@@ -12,7 +12,7 @@ SRC_URI =3D "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.=
4.2.3.tar.gz \
 	   file://missingok.patch;patch=3D1;pnum=3D0 \
 	   file://extcond.patch;patch=3D1;pnum=3D0"
=20
=2Dinherit autotools gettext
+#inherit autotools
=20
 S =3D "${WORKDIR}/rpm-${PV}"
=20
diff --git a/recipes/rpm/rpm-native_4.4.2.3.bb b/recipes/rpm/rpm-native_4.4=
=2E2.3.bb
index 935d077..287383c 100644
=2D-- a/recipes/rpm/rpm-native_4.4.2.3.bb
+++ b/recipes/rpm/rpm-native_4.4.2.3.bb
@@ -1,5 +1,6 @@
=2Drequire rpm_${PV}.bb
=2Dinherit native
+inherit native distutils-native-base
+
+require rpm-${PV}.inc
=20
 DEPENDS =3D "beecrypt-native gettext-native zlib-native file-native popt-n=
ative python-native"
=20
diff --git a/recipes/rpm/rpm_4.4.2.3.bb b/recipes/rpm/rpm_4.4.2.3.bb
index 6bdd0ed..3e67378 100644
=2D-- a/recipes/rpm/rpm_4.4.2.3.bb
+++ b/recipes/rpm/rpm_4.4.2.3.bb
@@ -1,98 +1,4 @@
=2DDESCRIPTION =3D "The RPM Package Manager."
=2DHOMEPAGE =3D "http://rpm.org/"
=2DLICENSE =3D "LGPL GPL"
=2DDEPENDS =3D "zlib beecrypt file popt python sed-native"
=2DPR =3D "r14"
=2D
=2DSRC_URI =3D "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
=2D           file://external-tools.patch;patch=3D1 \
=2D	   file://cross_libpaths.patch;patch=3D1 \
=2D	   file://rpmconfigdir.patch;patch=3D1 \
=2D	   file://weakdeps.patch;patch=3D1;pnum=3D0 \
=2D	   file://tagsbackport.patch;patch=3D1;pnum=3D0 \
=2D	   file://missingok.patch;patch=3D1;pnum=3D0 \
=2D	   file://extcond.patch;patch=3D1;pnum=3D0"
=2D
=2Dinherit autotools gettext distutils-base
=2D
=2DS =3D "${WORKDIR}/rpm-${PV}"
=2D
=2DARM_INSTRUCTION_SET =3D "arm"
=2D
=2Dacpaths =3D "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
+inherit distutils-base gettext
=20
=2DPACKAGES +=3D "python-rpm"
=2DFILES_python-rpm =3D "${libdir}/python*/site-packages/rpm/_*"
=2D
=2D# Handle the db MUTEX settings here, the POSIX library is
=2D# the default - "POSIX/pthreads/library".
=2D# Don't ignore the nice SWP instruction on the ARM:
=2D# These enable the ARM assembler mutex code, this won't
=2D# work with thumb compilation...
=2DARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
=2DMUTEX =3D ""
=2DMUTEX_arm =3D "${ARM_MUTEX}"
=2DMUTEX_armeb =3D "${ARM_MUTEX}"
=2DEXTRA_OECONF +=3D "${MUTEX}"
=2D
=2Dexport varprefix =3D "${localstatedir}"
=2D
=2Ddo_configure_prepend (){
=2D	EXTRA_OECONF =3D "--with-python \
=2D		--with-python-incdir=3D${STAGING_INCDIR}/${PYTHON_DIR} \
=2D		--with-python-libdir=3D${libdir}/${PYTHON_DIR} \
=2D		--without-apidocs \
=2D		--without-selinux \
=2D		--without-lua \
=2D		--without-dmalloc \
=2D		--without-efence"
=2D}
=2D
=2Ddo_configure () {
=2D	rm ${S}/popt/ -Rf
=2D	rm ${S}/db/dist/configure.in -f
=2D	cd ${S}/db/dist/aclocal
=2D	rm libtool* -f
=2D	for i in `ls *.ac`; do
=2D	    j=3D`echo $i | sed 's/.ac/.m4/g'`
=2D	    mv $i $j
=2D	done
=2D	cd ${S}/db/dist/aclocal_java
=2D	for i in `ls *.ac`; do
=2D	    j=3D`echo $i | sed 's/.ac/.m4/g'`
=2D	    mv $i $j
=2D	done
=2D	cd ${S}
=2D	autotools_do_configure
=2D	cd ${S}/db/dist
=2D	. ./RELEASE
=2D	# Edit version information we couldn't pre-compute.
=2D	sed -i -e "s/__EDIT_DB_VERSION_MAJOR__/$DB_VERSION_MAJOR/g"  configure
=2D	sed -i -e "s/__EDIT_DB_VERSION_MINOR__/$DB_VERSION_MINOR/g"  configure
=2D	sed -i -e "s/__EDIT_DB_VERSION_PATCH__/$DB_VERSION_PATCH/g"  configure
=2D	sed -i -e "s/__EDIT_DB_VERSION_STRING__/$DB_VERSION_STRING/g"  configure
=2D	sed -i -e "s/__EDIT_DB_VERSION_UNIQUE_NAME__/$DB_VERSION_UNIQUE_NAME/g"=
  configure
=2D	sed -i -e "s/__EDIT_DB_VERSION__/$DB_VERSION/g"  configure
=2D	cd ${S}/db3
=2D	${S}/db3/configure \
=2D		    --build=3D${BUILD_SYS} \
=2D		    --host=3D${HOST_SYS} \
=2D		    --target=3D${TARGET_SYS} \
=2D		    --prefix=3D${prefix} \
=2D		    --exec_prefix=3D${exec_prefix} \
=2D		    --bindir=3D${bindir} \
=2D		    --sbindir=3D${sbindir} \
=2D		    --libexecdir=3D${libexecdir} \
=2D		    --datadir=3D${datadir} \
=2D		    --sysconfdir=3D${sysconfdir} \
=2D		    --sharedstatedir=3D${sharedstatedir} \
=2D		    --localstatedir=3D${localstatedir} \
=2D		    --libdir=3D${libdir} \
=2D		    --includedir=3D${includedir} \
=2D		    --oldincludedir=3D${oldincludedir} \
=2D		    --infodir=3D${infodir} \
=2D		    --mandir=3D${mandir} \
=2D		    ${EXTRA_OECONF} \
=2D		    --with-pic
=2D
=2D}
+DEPENDS =3D "zlib beecrypt file popt python sed-native"
+require ${PN}-${PV}.inc
diff --git a/recipes/zope/zope-3.3.1.inc b/recipes/zope/zope-3.3.1.inc
index 18806b9..b06174c 100644
=2D-- a/recipes/zope/zope-3.3.1.inc
+++ b/recipes/zope/zope-3.3.1.inc
@@ -1,8 +1,6 @@
 DESCRIPTION =3D "A full fledged pluggable content management system with i=
ntegrated web server and much more."
 SECTION =3D "console/network"
 PRIORITY =3D "optional"
=2DDEPENDS =3D "python"
=2DRDEPENDS =3D "python-core python-shell"
 LICENSE =3D "ZPL"
 PR =3D "r9"
=20
diff --git a/recipes/zope/zope-native_3.3.1.bb b/recipes/zope/zope-native_3=
=2E3.1.bb
index 970df6d..70d19e9 100644
=2D-- a/recipes/zope/zope-native_3.3.1.bb
+++ b/recipes/zope/zope-native_3.3.1.bb
@@ -1,9 +1,6 @@
=2Drequire zope_${PV}.bb
=2Dinherit native
+inherit native distutils-native-base
=20
=2DDEPENDS =3D "python-native"
=2D
=2Dinherit distutils-base
+require zope-${PV}.inc
=20
 export BUILD_SYS
 export HOST_SYS
diff --git a/recipes/zope/zope_3.3.1.bb b/recipes/zope/zope_3.3.1.bb
index 05df3dd..cf81b15 100644
=2D-- a/recipes/zope/zope_3.3.1.bb
+++ b/recipes/zope/zope_3.3.1.bb
@@ -1,49 +1,5 @@
=2DDESCRIPTION =3D "A full fledged pluggable content management system with=
 integrated web server and much more."
=2DSECTION =3D "console/network"
=2DPRIORITY =3D "optional"
=2DDEPENDS =3D "python"
=2DRDEPENDS =3D "python-core python-shell"
=2DLICENSE =3D "ZPL"
=2DPR =3D "r8"
=2D
=2DSRC_URI =3D "http://www.zope.org/Products/Zope3/${PV}/Zope-${PV}.tgz"
=2DS =3D "${WORKDIR}/Zope-${PV}"
+RDEPENDS =3D "python-shell"
=20
 inherit distutils-base
=20
=2Ddo_configure() {
=2D	./configure --with-python=3D${STAGING_BINDIR_NATIVE}/python --prefix=3D=
${prefix} --force
=2D}
=2D
=2Ddo_compile() {
=2D	oe_runmake HOST_SYS=3D${HOST_SYS} BUILD_SYS=3D${BUILD_SYS} STAGING_INCD=
IR=3D${STAGING_INCDIR}
=2D}
=2D
=2Ddo_install() {
=2D	install -d ${D}${libdir}/${PYTHON_DIR}
=2D	oe_runmake install prefix=3D${D}${prefix} HOST_SYS=3D${HOST_SYS} BUILD_=
SYS=3D${BUILD_SYS}
=2D	mv ${D}${libdir}/python/* ${D}${libdir}/${PYTHON_DIR}=20
=2D	rm -rf ${D}${libdir}/${PYTHON_DIR}/twisted
=2D	rm -rf ${D}${libdir}/${PYTHON_DIR}/zope/app/twisted
=2D}
=2D
=2DPACKAGES =3D+ "python-zopeinterface python-zopeinterface-dbg"
=2D
=2DFILES_${PN} =3D "${prefix}"
=2DFILES_${PN}_doc =3D "${prefix}/doc"
=2DFILES_${PN}-dbg +=3D "\
=2D${libdir}/${PYTHON_DIR}/BTrees/.debug \
=2D${libdir}/${PYTHON_DIR}/persistent/.debug \
=2D${libdir}/${PYTHON_DIR}/zope/proxy/.debug \
=2D${libdir}/${PYTHON_DIR}/zope/thread/.debug \
=2D${libdir}/${PYTHON_DIR}/zope/security/.debug \
=2D${libdir}/${PYTHON_DIR}/zope/hookable/.debug \
=2D${libdir}/${PYTHON_DIR}/zope/app/container/.debug \
=2D${libdir}/${PYTHON_DIR}/zope/i18nmessageid/.debug \
=2D${libdir}/${PYTHON_DIR}/ZODB/.debug"
=2DFILES_python-zopeinterface-dbg +=3D "${libdir}/${PYTHON_DIR}/zope/interf=
ace/.debug "
=2D
=2DFILES_python-zopeinterface =3D " ${libdir}/${PYTHON_DIR}/zope/__init__.p=
y* \
=2D	${libdir}/${PYTHON_DIR}/zope/interface/*.* \
=2D	${libdir}/${PYTHON_DIR}/zope/interface/common"
=2D
+require ${PN}-${PV}.inc

--Boundary-01=_fLJyJil6YMLUSjr--

--nextPart3416167.XyDWgkZJtl
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknIkt8ACgkQHnJKy6V6em5dYwCeLPqweknji+zfgWjh2sNgXQxj
9A0An3QUcKmwc1XL2+QcbwqH2aSeyKt0
=6U++
-----END PGP SIGNATURE-----

--nextPart3416167.XyDWgkZJtl--
