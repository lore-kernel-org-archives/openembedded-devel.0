Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOxj5-0006X5-Nc
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 23:01:43 +0200
Received: by dakh32 with SMTP id h32so4274938dak.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 13:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jLwHxPblNfrDOeGcKn1PCg6BgM05IAUf2aI+foMmIjE=;
	b=ouwUc6tQf4tAuvEhn4kj9EdUSo3nbzSOBT1zzRRkH0ThHfMH4+uXM9gxBVJ6r15JAF
	BAjct1WVuqZBg6Q4iWa555mdpYTtO9DVnWvBBuNcqn+VcIOrjs5ak9nsaipejKWoleNR
	Y/eh6gx3LCEFhQYSKNPkc9ZSkPu2OILZuSt03HS8NnQHyb3n3kRNkzaI4SzkOcTRFaiU
	U0n4+zLj8/yVjmCxEldxu241OOSPBc8AD8+6dSryl44Y0c5p8yalUXkUFhy+Qaoa4PZt
	GDkdilCu5glIlsWEiBnvulZBSE+QR6ONjzI421TP3/b3CvyiR4s40sfBFyJwJ3UyVNjb
	cqAw==
Received: by 10.68.227.41 with SMTP id rx9mr52546235pbc.32.1335819120779;
	Mon, 30 Apr 2012 13:52:00 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pk5sm7012726pbb.68.2012.04.30.13.51.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 13:51:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 13:51:04 -0700
Message-Id: <1335819064-29468-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1335819064-29468-1-git-send-email-raj.khem@gmail.com>
References: <1335819064-29468-1-git-send-email-raj.khem@gmail.com>
Subject: [toolchain-layer][PATCH 3/3] libgcc-4.5: Fix nativesdk build problem
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
X-List-Received-Date: Mon, 30 Apr 2012 21:01:44 -0000

We need to use BPN instead of PN so we
access libgcc and not libgcc-nativesdk

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb |   32 +++++++++++--------
 1 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
index ecef5e7..3f63931 100644
--- a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
+++ b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
@@ -4,11 +4,14 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+
 PACKAGES = "\
   ${PN} \
   ${PN}-dev \
   ${PN}-dbg \
-  libgcov-dev \
+  libgcov${PKGSUFFIX}-dev \
   "
 
 FILES_${PN} = "${base_libdir}/libgcc*.so.*"
@@ -16,31 +19,31 @@ FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
-FILES_libgcov-dev = " \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a"
-
+FILES_libgcov${PKGSUFFIX}-dev = " \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
+  "
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
 do_configure () {
 	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
 	install -d ${D}${base_libdir} ${D}${libdir}
 	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
-	mkdir -p ${B}/${PN}
-	cd ${B}/${PN}
-	chmod a+x ${S}/${PN}/configure
-	${S}/${PN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+	mkdir -p ${B}/${BPN}
+	cd ${B}/${BPN}
+	chmod a+x ${S}/${BPN}/configure
+	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 }
 
 do_compile () {
 	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
-	cd ${B}/${PN}
-	oe_runmake MULTIBUILDTOP=${B}/$target/${PN}/
+	cd ${B}/${BPN}
+	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/
 }
 
 do_install () {
 	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
-	cd ${B}/${PN}
-	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${PN}/ install
+	cd ${B}/${BPN}
+	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
 
 	# Move libgcc_s into /lib
 	mkdir -p ${D}${base_libdir}
@@ -63,5 +66,6 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
 
 BBCLASSEXTEND = "nativesdk"
 
-INSANE_SKIP_libgcc-dev = "staticdev"
-INSANE_SKIP_libgcov-dev = "staticdev"
+INSANE_SKIP_${PN}-dev = "staticdev"
+INSANE_SKIP_libgcov${PKGSUFFIX}-dev = "staticdev"
+
-- 
1.7.5.4



