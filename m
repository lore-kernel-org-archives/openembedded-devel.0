Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOxj0-0006Wo-PI
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 23:01:39 +0200
Received: by pbbrq2 with SMTP id rq2so3528955pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 13:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JRZHnxhwzmRSzoIt+0crJWA2suaAx3GAfsGd9ZiEOqs=;
	b=geXy6Isrnj2lZIHFIkLWJ8KwMG548me2bMywFDlMmwHWxf9pkq9sKsq7AktPfCd0ST
	cme+Up1lbHVYxYyYQkqv//nxv3PmYB9V3Nr2ZoqBsSjVxwDW5yUWkiktX7W85FcwkveV
	DtZHtBO13vDKgVPtMfp9L3JvLTELsIpw/5s74HuasCGV13qIry/fSwNY9z7ozzZ6afx8
	xJV9KvJtsSvhajxQI/ZGOLu6TqbOv6siEmm94sm1VJDLXTpzONAfhuCNrjUCDE34ptDJ
	bNBByJ7raH0TJ4eqrhI8DM9j86OmpMYlVjUP5T6KhGjGh0UItOcga4unpI+ge+LZK1w8
	jzYA==
Received: by 10.68.240.135 with SMTP id wa7mr51285321pbc.7.1335819115671;
	Mon, 30 Apr 2012 13:51:55 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pk5sm7012726pbb.68.2012.04.30.13.51.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 13:51:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 13:51:02 -0700
Message-Id: <1335819064-29468-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [toolchain-layer][PATCH 1/3] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Mon, 30 Apr 2012 21:01:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb |   47 +++++++++++++++-----
 1 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
index 1579c8b..ecef5e7 100644
--- a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
+++ b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
@@ -1,33 +1,46 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 
-
 INHIBIT_DEFAULT_DEPS = "1"
+
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
 PACKAGES = "\
   ${PN} \
   ${PN}-dev \
+  ${PN}-dbg \
+  libgcov-dev \
   "
 
 FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
+FILES_libgcov-dev = " \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a"
 
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
+FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
-do_install () {
+do_configure () {
 	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
-
-	# Install libgcc from our gcc-cross saved data
 	install -d ${D}${base_libdir} ${D}${libdir}
-	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${D}
+	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
+	mkdir -p ${B}/${PN}
+	cd ${B}/${PN}
+	chmod a+x ${S}/${PN}/configure
+	${S}/${PN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+}
+
+do_compile () {
+	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	cd ${B}/${PN}
+	oe_runmake MULTIBUILDTOP=${B}/$target/${PN}/
+}
+
+do_install () {
+	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	cd ${B}/${PN}
+	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${PN}/ install
 
 	# Move libgcc_s into /lib
 	mkdir -p ${D}${base_libdir}
@@ -36,7 +49,19 @@ do_install () {
 	else
 		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
 	fi
+
+	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
+	# so that cross-gcc can find it in the sysroot
+
+	mv ${D}${libdir}/gcc/* ${D}${libdir}
+	rm -rf ${D}${libdir}/gcc/
 }
 
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_package"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
+
 BBCLASSEXTEND = "nativesdk"
 
+INSANE_SKIP_libgcc-dev = "staticdev"
+INSANE_SKIP_libgcov-dev = "staticdev"
-- 
1.7.5.4



