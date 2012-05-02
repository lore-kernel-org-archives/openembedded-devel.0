Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPWHg-0007Xj-3l
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 11:55:44 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so330147wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=z7CPh7DpRibba8l3dtBOu1f+utTx27HuNNoRSaBoBAM=;
	b=K++p1e6d36lg3KGgVVwQ/HG+0215sDdITx9ZhX8GjTzdWFpOs3/dCEoA1lw44H/OdL
	aeNtXHGM391orgELYmREw5AHWVif8pWe+CjlBDqV1LHBQexCRf8UXZ9xZr6iR7dj/7Ak
	3vdUNV1qU1I1GkiDOWdJ1mdZn7jx78lnPdkgnoF4bBvcD4iOzG73qafyVYp+lb8Gh6+d
	eXfKAWe5InLtnZ7cZj3cgfA3Xaxd+apijQULVyIT2pZI8mjqTpVeQvxhmeVIFr5Y2tv5
	hSm4CBr0qDEw4jRRNVZFNjXb3z5NoBehmMBbji5QHG2yeL9gf5f9GGZidUprB89NlJT+
	rjIA==
Received: by 10.216.137.97 with SMTP id x75mr1292425wei.25.1335951962203;
	Wed, 02 May 2012 02:46:02 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm43149214wib.6.2012.05.02.02.46.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 02:46:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2012 11:45:30 +0200
Message-Id: <1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk11IeKNxDgEoEXe6Msb4x8977b/amR5sPD0dL69IQIW74aICJpQifwptxHM8Q6aQoFsCnz
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 09:55:44 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Tested-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb |   47 +++++++++++++++-----
 1 file changed, 36 insertions(+), 11 deletions(-)

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
1.7.10



