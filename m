Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC4386FF3D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 08:11:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u458BobU002088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 May 2016 01:11:51 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 5 May 2016 01:11:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 May 2016 16:04:03 +0800
Message-ID: <1462435443-4027-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] curlpp: fix recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 May 2016 08:11:52 -0000
Content-Type: text/plain

Fix curlpp recipe to make it succeed to build.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-support/curlpp/curlpp_0.7.3.bb         | 60 ----------------------
 1 file changed, 60 deletions(-)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index b3231fb..5663f0e 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -16,63 +16,6 @@ SRC_URI[sha256sum] = "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a
 
 inherit autotools-brokensep pkgconfig binconfig
 
-EXTRA_OECONF = "--prefix=${STAGING_DIR} \
-		--with-boost=${STAGING_DIR} \
-		"
-
-do_install() {
-	install -d ${D}/${includedir}/curlpp
-	cp -r include/curlpp/* 					${D}${includedir}/curlpp
-
-	install -d ${D}${includedir}/utilspp
-	cp -r include/utilspp/* 				${D}${includedir}/utilspp
-
-	install -d ${D}/${libdir}
-	install	-m 664 src/curlpp/.libs/libcurlpp.a		${D}/${libdir}
-	install	-m 664 src/curlpp/.libs/libcurlpp.lai		${D}/${libdir}/libcurlpp.la
-
-	install	-m 775 src/curlpp/.libs/libcurlpp.so.0.0.2	${D}/${libdir}
-
-	install	-m 664 src/utilspp/.libs/libutilspp.a		${D}/${libdir}
-	install	-m 664 src/utilspp/.libs/libutilspp.lai		${D}/${libdir}/libutilspp.la
-
-	install	-m 664 src/utilspp/.libs/libutilspp.so.0.0.0	${D}/${libdir}
-
-	install -d ${D}/${libdir}/pkgconfig
-	install	-m 664 curlpp.pc				${D}/${libdir}/pkgconfig
-
-	install -d ${D}/${bindir}
-	install	-m 755 curlpp-config 				${D}/${bindir}
-
-	install -d ${D}/${includedir}/curlpp
-	install -d ${D}/${includedir}/curlpp/internal
-	install -d ${D}/${includedir}/utilspp
-	install -d ${D}/${includedir}/utilspp/functor
-	install -d ${D}/${includedir}/utilspp/singleton
-
-	install	-m 664 include/curlpp/config*			${D}/${includedir}/curlpp
-	install	-m 664 include/curlpp/*.h*			${D}/${includedir}/curlpp
-	install	-m 664 include/curlpp/*.inl			${D}/${includedir}/curlpp
-
-	install	-m 664 include/curlpp/internal/*.h*		${D}/${includedir}/curlpp/internal
-	install	-m 664 include/curlpp/internal/*.inl		${D}/${includedir}/curlpp/internal
-
-	install	-m 664 include/utilspp/*.h*			${D}/${includedir}/utilspp
-	install	-m 664 include/utilspp/*.inl			${D}/${includedir}/utilspp
-
-	install	-m 664 include/utilspp/functor/*.h*		${D}/${includedir}/utilspp/functor
-	install	-m 664 include/utilspp/singleton/*.h*		${D}/${includedir}/utilspp/singleton
-	install	-m 664 include/utilspp/singleton/*.inl		${D}/${includedir}/utilspp/singleton
-	install -m 755 curlpp-config				${D}/${bindir}
-}
-
-pkg_postinst_${PN}() {
-	ln	-sf	libcurlpp.so.0.0.2			/usr/lib/libcurlpp.so.0
-	ln	-sf	libcurlpp.so.0.0.2			/usr/lib/libcurlpp.so
-	ln	-sf	libutilspp.so.0.0.0			/usr/lib/libutilspp.so.0
-	ln	-sf	libutilspp.so.0.0.0			/usr/lib/libutilspp.so
-}
-
 PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.* \
@@ -86,6 +29,3 @@ FILES_lib${BPN}-dev = "${includedir} \
 FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 BBCLASSEXTEND = "native nativesdk"
-
-# http://errors.yoctoproject.org/Errors/Details/35129/
-PNBLACKLIST[curlpp] ?= "BROKEN: QA Issue: curlpp.pc failed sanity test (tmpdir)"
-- 
2.8.1


