Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NbrCL-0007Zg-P6
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 08:59:57 +0100
Received: by gxk27 with SMTP id 27so3827603gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2010 23:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=7eWG0d9xRaUemUFK76h8VI+o3553WC28DOLkrqgLd1k=;
	b=IBVMz+9Wa8lMu6F4RGH/mFF0+1YdxeDiM0MyEzFzn9pgp3/2V/CeZ+Cva+t4RDTmWx
	7qF+sG/Yl4WqT+8+WnIUbKZZeKZTifR/IE3JbksyNQj0w9vM1/BV1kVsZbJiGyZoq99o
	cLPfqNbogthPhmCed5NQcQS6Hce+Xkhb0IjuA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YljXi2NOMguQgjmLysRLVuDzmeN0ZhaU47KmLIPT1HFU0zCHJ3dF2vLraskeZgtaH2
	OceASKNAEZJF6+mqm6R7jS4wPknVyiJBM1ZxWEOtvbuuifNSTODTH9+fgwkG3nFV5v1f
	2X7zjM04nf6jyuLNZMV+XWOUiIu5zHskSwOSk=
Received: by 10.91.55.39 with SMTP id h39mr3546652agk.77.1265011047201;
	Sun, 31 Jan 2010 23:57:27 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 7sm1616019yxg.50.2010.01.31.23.57.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 31 Jan 2010 23:57:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2010 23:57:16 -0800
Message-Id: <1265011036-9086-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH][RFC] gcc: Restructure package creation.
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
X-List-Received-Date: Mon, 01 Feb 2010 08:00:01 -0000

Hi,

Inspired by a discussion with RP on IRC this patch does following.

* Package most of target libraries during gcc-cross recipes
  and not during gcc target recipe.

* Do not build and package libraries like libstdc++ and others
  twice (once during cross compile and then during target gcc compile)

More libraries that can be built in cross gcc recipe should be packaged
there. These changes can be done after this patch.

Comments ?

-Khem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-configure-cross.inc  |   25 ++++++--
 recipes/gcc/gcc-configure-target.inc |    9 ++-
 recipes/gcc/gcc-package-cross.inc    |  107 ++++++++++++++++++++--------------
 recipes/gcc/gcc-package-target.inc   |   93 +++++++++---------------------
 4 files changed, 118 insertions(+), 116 deletions(-)

diff --git a/recipes/gcc/gcc-configure-cross.inc b/recipes/gcc/gcc-configure-cross.inc
index 1c37de8..595d63a 100644
--- a/recipes/gcc/gcc-configure-cross.inc
+++ b/recipes/gcc/gcc-configure-cross.inc
@@ -29,11 +29,10 @@ do_stage_append () {
 	done
 
 	# Fix a few include links so cross builds are happier
-	if [ ! -e ${STAGING_INCDIR}/c++ ]; then
-		mkdir -p ${STAGING_INCDIR}
-		mkdir -p ${CROSS_DIR}/${TARGET_SYS}/include/c++
+	if [ ! -e ${STAGING_DIR_TARGET}/${target_includedir}/c++ ]; then
+		mkdir -p ${STAGING_DIR_TARGET}/${target_includedir}/c++
 		ln -sf ${CROSS_DIR}/${TARGET_SYS}/include/c++ \
-			${STAGING_INCDIR}/
+			${STAGING_DIR_TARGET}/${target_includedir}/c++/
 	fi
 
 	# We probably don't need these
@@ -47,9 +46,25 @@ do_stage_append () {
 	done
 
 	#fix up libsupc++ and libstdc++ la files
-	for d in lib lib/nof; do
+	libdirs="lib"
+	if [ -e lib/nof ]; then
+		libdirs="$libs lib/nof"
+	fi
+	for d in ${libdirs}; do
 		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L${CROSS_DIR}/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CROSS_DIR}/${TARGET_SYS}/$d/libsupc++.la || true
 		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L${CROSS_DIR}/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CROSS_DIR}/${TARGET_SYS}/$d/libstdc++.la || true
 	done
+	# stage shared libgcc and libstdc++ in target staging area.
+	if [ -e ${CROSS_DIR}/${TARGET_SYS}${target_base_libdir}/libgcc_s.so ]; then
+		mkdir -p ${STAGING_DIR_TARGET}${target_base_libdir}
+		cp -d ${CROSS_DIR}/${TARGET_SYS}${target_base_libdir}/libgcc_s.so* \
+		${STAGING_DIR_TARGET}${target_base_libdir}
+
+	fi
+	if [ -e ${CROSS_DIR}/${TARGET_SYS}${target_base_libdir}/libstdc++.so ]; then
+		mkdir -p ${STAGING_DIR_TARGET}${target_prefix}${target_base_libdir}
+		cp -d ${CROSS_DIR}/${TARGET_SYS}${target_base_libdir}/libstdc++.so* \
+		${STAGING_DIR_TARGET}${target_prefix}${target_base_libdir}
+	fi
 }
 
diff --git a/recipes/gcc/gcc-configure-target.inc b/recipes/gcc/gcc-configure-target.inc
index 04045aa..d0ec9f4 100644
--- a/recipes/gcc/gcc-configure-target.inc
+++ b/recipes/gcc/gcc-configure-target.inc
@@ -2,5 +2,10 @@ require gcc-configure-common.inc
 
 EXTRA_OECONF_PATHS = " \
     --with-local-prefix=${prefix}/local \
-    --with-gxx-include-dir=${includedir}/c++/${BINV}"
-
+    --with-gxx-include-dir=${includedir}/c++/${BINV} \
+    --disable-libstdc++-v3 \
+    --disable-libgfortran \
+    --disable-libssp \
+    --disable-libobjc \
+    "
+TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 6c4f9bb..9b74c94 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -2,7 +2,8 @@ INHIBIT_PACKAGE_STRIP ?= ""
 OLD_INHIBIT_PACKAGE_STRIP := "${INHIBIT_PACKAGE_STRIP}"
 INHIBIT_PACKAGE_STRIP = "1"
 
-PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
+PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran objc libmudflap \
+	    libgcc-dev libstdc++-dev libmudflap-dev objc-dev"
 
 # Called from within gcc-cross, so libdir is set wrong
 FILES_libg2c = "${target_libdir}/libg2c.so.*"
@@ -11,63 +12,83 @@ FILES_libssp = "${target_libdir}/libssp.so.*"
 
 FILES_libgfortran = "${target_libdir}/libgfortran.so.*"
 
-FILES_libgcc = "${target_base_libdir}/libgcc_s.so.1"
+FILES_libgcc = "${target_base_libdir}/libgcc*.so.*"
+
+FILES_libgcc-dev = "${target_libdir}/gcc/${TARGET_SYS}/${BINV}/libgcc_s.so"
 
 FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
+FILES_libstdc++-dev = "\
+	${target_includedir}/c++/* \
+	${target_libdir}/gcc/${TARGET_SYS}/${BINV}/libstdc++.a \
+	${target_libdir}/gcc/${TARGET_SYS}/${BINV}/libsupc++.a \
+	${target_libdir}/gcc/${TARGET_SYS}/${BINV}/libstdc++.so"
+
+RDEPENDS_append_libstdc++-dev = " libgcc-dev libc-dev g++ libstdc++"
+
+# We don't care about GNU_HASH in objc, so mask all errors
+INSANE_SKIP_objc = "True"
+FILES_objc = "${target_libdir}/libobjc*.so.* \
+"
+FILES_objc-dev = "${target_libdir}/libobjc*.so \
+  ${target_libdir}/libobjc*.la \
+  ${target_libdir}/libobjc*.a \
+"
+
+FILES_libmudflap = "${target_libdir}/libmudflap*.so.*"
+FILES_libmudflap-dev = "\
+  ${target_libdir}/libmudflap*.so \
+  ${target_libdir}/libmudflap*.a \
+  ${target_libdir}/libmudflap*.a \
+"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 
-	# Move libgcc_s into /lib
-        mkdir -p ${D}${target_base_libdir}
-        if [ -f ${D}${target_base_libdir}/libgcc_s.so.? ]; then
-                # Already in the right location
-                :
-        elif [ -f ${D}${prefix}/lib/libgcc_s.so.? ]; then
-                mv -f ${D}${prefix}/lib/libgcc_s.so* ${D}${target_base_libdir} || true
-
-        elif [  -f ${D}${prefix}/*/lib/nof/libgcc_s.so.? ]; then
-                mv -f ${D}${prefix}/*/lib/nof/libgcc_s.so* ${D}${target_base_libdir}
-        else
-                # Look for .../${TARGET_SYS}/lib/libgcc_s*
-                # (or /lib64/, on x86_64)
-                mv -f ${D}${prefix}/*/${target_base_libdir}/libgcc_s.so* ${D}${target_base_libdir} || true 
-        fi
-
-
-
-	# Move libstdc++ and libg2c into libdir (resetting our prefix to /usr
-        mkdir -p ${D}${target_libdir}
-
-        if [ -f ${D}${prefix}/*/lib/nof/libstdc++.so ]; then
-
-           mv -f ${D}${prefix}/*/lib/nof/libstdc++.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/nof/libg2c.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/nof/libgfortran*.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/nof/libssp*.so* ${D}${target_libdir} || true 	
-
-        else
-           # Look for .../${TARGET_SYS}/lib/lib* (or /lib64/ on x86_64)
-           mv -f ${D}${prefix}/*/${target_base_libdir}/libstdc++.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/${target_base_libdir}/libg2c.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/${target_base_libdir}/libgfortran*.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/${target_base_libdir}/libssp*.so* ${D}${target_libdir} || true
-        fi
-
+	mkdir -p ${D}${target_includedir}/c++/${BINV}
+	mv -f ${D}${STAGING_DIR_TARGET}/${target_includedir}/c++/* ${D}${target_includedir}/c++/${BINV}
+	# Remove precompiled c++ headers as they are really big
+	rm -rf ${D}${target_includedir}/c++/${BINV}/bits/*.gch
 
+	# Move target libraries into libdir (resetting our prefix to /usr
+	tmp_ifs="$IFS" # save default Internal File Separator
+	IFS=',' # set IFS to ','
+	multilib_dirs="," # default is /lib
 
+        if [ -d ${D}${prefix}/${TARGET_SYS}/lib/nof ]; then
+	   multilib_dirs="${multilib_dirs},nof"
+	fi
+	for multilib in ${multilib_dirs}; do
+	   mkdir -p ${D}${target_prefix}${target_base_libdir}/${multilib}
+	   mkdir -p ${D}${target_base_libdir}${multilib}
+	   mkdir -p ${D}${target_libdir}/gcc/${TARGET_SYS}/${BINV}${target_base_libdir}${multilib}
+	   mv -f ${D}${prefix}/${TARGET_SYS}${target_base_libdir}${multilib}/libgcc*.so* ${D}${target_base_libdir}/${multilib} || true
+           mv -f ${D}${prefix}/${TARGET_SYS}${target_base_libdir}${multilib}/libstdc++.so* ${D}${target_libdir}${multilib} || true
+           mv -f ${D}${prefix}/${TARGET_SYS}${target_base_libdir}${multilib}/libg2c.so* ${D}${target_libdir}${multilib} || true
+           mv -f ${D}${prefix}/${TARGET_SYS}${target_base_libdir}${multilib}/libgfortran*.so* ${D}${target_libdir}${multilib} || true
+           mv -f ${D}${prefix}/${TARGET_SYS}${target_base_libdir}${multilib}/libssp*.so* ${D}${target_libdir}${multilib} || true 	
+	   mv -f ${D}${prefix}/${TARGET_SYS}${target_base_libdir}${multilib}/libstdc++.a ${D}${target_libdir}/gcc/${TARGET_SYS}/${BINV}${target_base_libdir}/${multilib} || true
+	   mv -f ${D}${prefix}/${TARGET_SYS}${target_base_libdir}${multilib}/libsupc++.a ${D}${target_libdir}/gcc/${TARGET_SYS}/${BINV}${target_base_libdir}/${multilib} || true
+	   ln -s ${target_base_libdir}${multilib}/libgcc_s.so.1 ${D}${target_libdir}/gcc/${TARGET_SYS}/${BINV}/${multilib}/libgcc_s.so || true
+	   #mv -f ${D}${prefix}/${TARGET_SYS}${target_base_libdir}${multilib}/libgcc_s.so ${D}${target_libdir}/gcc/${TARGET_SYS}/${BINV}${target_base_libdir}/${multilib} || true
+	   #mv -f ${D}${prefix}${target_base_libdir}/gcc/${TARGET_SYS}/${BINV}/libgcc*.a  ${D}${target_libdir}/gcc/${TARGET_SYS}/${BINV}${target_base_libdir}/${multilib} || true
+
+        done
        # Manually run the target stripper since we won't get it run by
        # the packaging.
        if [ "x${OLD_INHIBIT_PACKAGE_STRIP}" != "x1" ]; then
-               ${TARGET_PREFIX}strip ${D}${target_libdir}/libstdc++.so.* || true
-               ${TARGET_PREFIX}strip ${D}${target_libdir}/libg2c.so.* || true
-               ${TARGET_PREFIX}strip ${D}${target_base_libdir}/libgcc_s.so.* || true
-               ${TARGET_PREFIX}strip ${D}${target_libdir}/libgfortran*.so* || true
+           for multilib in ${multilib_dirs}; do
+               ${TARGET_PREFIX}strip ${D}${target_libdir}/${multilib}/libstdc++.so.* || true
+               ${TARGET_PREFIX}strip ${D}${target_libdir}/${multilib}/libg2c.so.* || true
+               ${TARGET_PREFIX}strip ${D}${target_libdir}/${multilib}/libssp.so.* || true
+               ${TARGET_PREFIX}strip ${D}${target_libdir}/${multilib}/libgfortran*.so* || true
+               ${TARGET_PREFIX}strip ${D}${target_base_libdir}/${multilib}/libgcc_s.so.* || true
+	   done
 	fi
+	IFS="$tmp_IFS"
      
        # Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
        # gfortran is fully backwards compatible. This is a safe and practical solution.
-       if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
+       if [ -n "${FORTRAN}" ]; then
               currdir="$PWD"
               cd ${CROSS_DIR}/bin/
               ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc
index 0676b53..b9568a9 100644
--- a/recipes/gcc/gcc-package-target.inc
+++ b/recipes/gcc/gcc-package-target.inc
@@ -4,13 +4,7 @@ PACKAGES = "\
   cpp cpp-symlinks \
   g77 g77-symlinks \
   gfortran gfortran-symlinks \
-  objc objc-dev \
   gcov gcov-symlinks \
-  libmudflap libmudflap-dev \
-  libgcc-dev \
-  libstdc++-dev \
-  libg2c-dev \
-  libgfortran-dev \
   ${PN}-doc \
 "
 
@@ -20,7 +14,7 @@ FILES_${PN} = "\
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/*.a \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include* \
 "
 FILES_${PN}-symlinks = "\
@@ -54,16 +48,10 @@ FILES_cpp-symlinks = "${bindir}/cpp"
 FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov"
 FILES_gcov-symlinks = "${bindir}/gcov"
 
-FILES_libgcc = "${base_libdir}/libgcc*.so.*"
-FILES_libgcc-dev = "${base_libdir}/libgcc*.so"
-
-# Called from within gcc-cross, so libdir is set wrong
-FILES_libg2c = "${target_libdir}/libg2c.so.*"
-FILES_libg2c-dev = "\
-  ${libdir}/libg2c.so \
-  ${libdir}/libg2c.a \
-  ${libdir}/libfrtbegin.a \
-"
+#FILES_libgcc = "${base_libdir}/libgcc*.so.*"
+#FILES_libgcc-dev = "\
+#	${base_libdir}/libgcc*.so \
+#	${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcc_s.so"
 
 FILES_g++ = "\
   ${bindir}/${TARGET_PREFIX}g++ \
@@ -74,36 +62,6 @@ FILES_g++-symlinks = "\
   ${bindir}/g++ \
 "
 
-FILES_libstdc++ = "${libdir}/libstdc++.so.*"
-FILES_libstdc++-dev = "\
-  ${includedir}/c++/${BINV} \
-  ${libdir}/libstdc++.so \
-  ${libdir}/libstdc++.la \
-  ${libdir}/libstdc++.a \
-  ${libdir}/libsupc++.la \
-  ${libdir}/libsupc++.a \
-"
-
-FILES_libgfortran-dev = "${libdir}/libgfortran.a \
-                         ${libdir}/libgfortran.so \
-                         ${libdir}/libgfortranbegin.a"
-
-# We don't care about GNU_HASH in objc, so mask all errors
-INSANE_SKIP_objc = "True"
-FILES_objc = "${libdir}/libobjc*.so.* \
-"
-FILES_objc-dev = "${libdir}/libobjc*.so \
-  ${libdir}/libobjc*.la \
-  ${libdir}/libobjc*.a \
-"
-
-FILES_libmudflap = "${libdir}/libmudflap*.so.*"
-FILES_libmudflap-dev = "\
-  ${libdir}/libmudflap*.so \
-  ${libdir}/libmudflap*.a \
-  ${libdir}/libmudflap*.a \
-"
-
 FILES_${PN}-doc = "\
   ${infodir} \
   ${mandir} \
@@ -118,20 +76,20 @@ do_install () {
 	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
 
 	# Hack around specs file assumptions
-	test -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs && sed -i -e '/^*cross_compile:$/ { n; s/1/0/; }' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs
-
+	test -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs && \
+	sed -i -e '/^*cross_compile:$/ { n; s/1/0/; }' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs
 	# Move libgcc_s into /lib
-	mkdir -p ${D}${base_libdir}
-	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
-		mv ${D}${libdir}/nof/libgcc_s.so.* ${D}${base_libdir}
-	else
-		mv ${D}${libdir}/libgcc_s.so.* ${D}${base_libdir} || true
-	fi
-	rm -f ${D}${libdir}/libgcc_s.so || true 
-	ln -sf `echo ${libdir}/gcc/${TARGET_SYS}/${BINV} \
-		| tr -s / \
-		| sed -e 's,^/,,' -e 's,[^/]*,..,g'`/lib/libgcc_s.so.1 \
-		      ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcc_s.so
+	#	mkdir -p ${D}${base_libdir}
+	#	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
+	#	mv ${D}${libdir}/nof/libgcc_s.so.* ${D}${base_libdir}
+    #else
+	#		mv ${D}${libdir}/libgcc_s.so.* ${D}${base_libdir} || true
+	#fi
+	#rm -f ${D}${libdir}/libgcc_s.so || true
+	#ln -sf `echo ${libdir}/gcc/${TARGET_SYS}/${BINV} \
+	#	| tr -s / \
+	#	| sed -e 's,^/,,' -e 's,[^/]*,..,g'`/lib/libgcc_s.so.1 \
+	#		${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcc_s.so
 
 	# We don't need libtool libraries
 	rm -f ${D}${libdir}/libg2c.la &>/dev/null || true
@@ -154,17 +112,20 @@ do_install () {
 	rm -f ${TARGET_ARCH}-*${TARGET_ARCH}-*
 
 	# Symlinks so we can use these trivially on the target
-	ln -sf ${TARGET_SYS}-g77 g77 || true
-	ln -sf ${TARGET_SYS}-gfortran gfortran || true
+	if [ -n "${FORTRAN}" ]; then
+	    ln -sf ${TARGET_SYS}-g77 g77
+	    ln -sf ${TARGET_SYS}-gfortran gfortran
+	    ln -sf g77 f77
+	    ln -sf gfortran f95
+	fi
 	ln -sf ${TARGET_SYS}-g++ g++
 	ln -sf ${TARGET_SYS}-gcc gcc
-	ln -sf g77 f77 || true
-	ln -sf gfortran f95 || true
 	ln -sf g++ c++
 	ln -sf gcc cc
+	mkdir -p ${D}${base_libdir} ${D}${bindir}
 	ln -sf ${bindir}/${TARGET_SYS}-cpp ${D}${base_libdir}/cpp
 	ln -sf ${bindir}/${TARGET_SYS}-cpp ${D}${bindir}/cpp
 
-	# Remove precompiled c++ headers as they are really big
-	rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/*.gch
+	# Remove c++ headers we already have them in libstdc++-dev
+	rm -rf ${D}${includedir}/c++
 }
-- 
1.6.5



