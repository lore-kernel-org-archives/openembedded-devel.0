Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1KNS5N-0003MJ-Qu
	for openembedded-devel@openembedded.org; Mon, 28 Jul 2008 14:44:22 +0200
Received: (qmail 3229 invoked by uid 813007); 28 Jul 2008 12:42:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 28 Jul 2008 12:42:47 -0000
To: openembedded-devel@lists.openembedded.org
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
Date: Mon, 28 Jul 2008 14:43:01 +0200
MIME-Version: 1.0
Message-Id: <200807281443.01985.openembedded@haerwu.biz>
Subject: Re: [RFC] changing staging layout based on MULTIMACH_TARGET_SYS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 28 Jul 2008 12:44:22 -0000
X-Groupsio-MsgNum: 5625
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_V7bjI+gJwjkk2y/"

--Boundary-00=_V7bjI+gJwjkk2y/
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 24 of July 2008 11:14:40 Koen Kooi wrote:

> * In an ideal world we would use a single compiler version for all
> subarchs, but for arm we use 4.2.4 for armv4, armv4t, armv5te and
> armv6, but 4.3.1 for armv7a. C++ apps don't like that

I just ended Poky build for armv4t/5te/6/7a with gcc 4.3.1 and poky-
image-sato got built for each architecture.

> Richard and I have been talking about this for a while now and the
> change landed in Poky last week.

> I'd like to apply this right after the toolchain build order changes
> to minimize the number of full rebuilds people have to do.

> Comments, objections?

+1 from me as this helps to get ARM builds more sane.

It will also break some recipes which works fine now. Thats due to fact 
that some stuff (like distutils from Python) use ARCH to create paths. 

Attached patch is fast hack to make Python buildable after staging 
changes. Would be nice if someone (Mickeyl?) would review it.


--Boundary-00=_V7bjI+gJwjkk2y/
Content-Type: text/x-patch;
  charset="iso-8859-1";
  name="python-distutils-hack.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="python-distutils-hack.patch"

diff --git a/trunk/meta-extras/packages/python/python-native_2.5.1.bb b/trunk/meta-extras/packages/python/python-native_2.5.1.bb
index ea6e257..21e5c79 100644
--- a/trunk/meta-extras/packages/python/python-native_2.5.1.bb
+++ b/trunk/meta-extras/packages/python/python-native_2.5.1.bb
@@ -4,15 +4,19 @@ LICENSE = "PSF"
 SECTION = "devel/python"
 PRIORITY = "optional"
 DEPENDS = ""
-PR = "ml1"
+PR = "ml3"
 
 EXCLUDE_FROM_WORLD = "1"
 
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
-           file://bindir-libdir.patch;patch=1 \
-           file://cross-distutils.patch;patch=1 \
-           file://dont-modify-shebang-line.patch;patch=1 \
-           file://default-is-optimized.patch;patch=1"
+SRC_URI = "\
+  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+  file://bindir-libdir.patch;patch=1 \
+  file://cross-distutils.patch;patch=1 \
+  file://dont-modify-shebang-line.patch;patch=1 \
+  file://default-is-optimized.patch;patch=1 \
+  file://catchup-with-swig.patch;patch=1 \
+  file://fix-staging.patch;patch=1 \
+"
 S = "${WORKDIR}/Python-${PV}"
 
 inherit autotools native
@@ -22,12 +26,8 @@ exec_prefix = "${STAGING_DIR_NATIVE}/${layout_exec_prefix}"
 
 EXTRA_OECONF = "--with-threads --with-pymalloc --with-cyclic-gc \
                 --without-cxx --with-signal-module --with-wctype-functions"
-EXTRA_OEMAKE = 'BUILD_SYS="" HOST_SYS=""'
-
-#do_configure() {
-#	# the autofoo stuff is too old to allow regenerating
-#	oe_runconf
-#}
+EXTRA_OEMAKE = 'BUILD_SYS="" HOST_SYS="" STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR}'
 
 do_stage_append() {
 	install -m 0755 Parser/pgen ${STAGING_BINDIR_NATIVE}/
diff --git a/trunk/meta-extras/packages/python/python-scons-native_0.97.bb b/trunk/meta-extras/packages/python/python-scons-native_0.97.bb
index 31bce55..45eeee1 100644
--- a/trunk/meta-extras/packages/python/python-scons-native_0.97.bb
+++ b/trunk/meta-extras/packages/python/python-scons-native_0.97.bb
@@ -4,6 +4,8 @@ DEPENDS = "python-native"
 RDEPENDS = ""
 
 do_stage() {
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        STAGING_INCDIR=${STAGING_INCDIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_LIBDIR}/.. --install-data=${STAGING_DATADIR} || \
         oefatal "python setup.py install execution failed."
diff --git a/trunk/meta/classes/distutils.bbclass b/trunk/meta/classes/distutils.bbclass
index 7a18e71..ef761be 100644
--- a/trunk/meta/classes/distutils.bbclass
+++ b/trunk/meta/classes/distutils.bbclass
@@ -1,12 +1,16 @@
 inherit distutils-base
 
 distutils_do_compile() {
+	 STAGING_INCDIR=${STAGING_INCDIR} \
+	 STAGING_LIBDIR=${STAGING_LIBDIR} \
          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
          ${STAGING_BINDIR_NATIVE}/python setup.py build || \
          oefatal "python setup.py build_ext execution failed."
 }
 
 distutils_stage_headers() {
+	 STAGING_INCDIR=${STAGING_INCDIR} \
+	 STAGING_LIBDIR=${STAGING_LIBDIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/python setup.py install_headers --install-dir=${STAGING_INCDIR}/${PYTHON_DIR} || \
         oefatal "python setup.py install_headers execution failed."
@@ -14,6 +18,8 @@ distutils_stage_headers() {
 
 distutils_stage_all() {
         install -d ${STAGING_DIR_HOST}${layout_prefix}/${PYTHON_DIR}/site-packages
+	STAGING_INCDIR=${STAGING_INCDIR} \
+	STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${STAGING_DIR_HOST}${layout_prefix}/${PYTHON_DIR}/site-packages \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/python setup.py install --prefix=${STAGING_DIR_HOST}${layout_prefix} --install-data=${STAGING_DATADIR} || \
@@ -22,6 +28,8 @@ distutils_stage_all() {
 
 distutils_do_install() {
         install -d ${D}${libdir}/${PYTHON_DIR}/site-packages
+	STAGING_INCDIR=${STAGING_INCDIR} \
+	STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/python setup.py install --prefix=${D}/${prefix} --install-data=${D}/${datadir} || \

--Boundary-00=_V7bjI+gJwjkk2y/--
