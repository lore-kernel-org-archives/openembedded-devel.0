Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2E32F7680C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 11:01:55 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so26229176wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wTsKPpmKY27orFIItMSKEYJCO+qNBIJ5FZ3d9hiX9Ds=;
	b=jmumJDnfF+ybhj0dz9Mind/aQ0HQpIn/XpsLyeNn6uX6eUpeHskhqgDt8G8LiuxlSb
	Inq9p6oN/1RAgIuy0GDztRvYwPGiLhiJ2MUUkkexqSCzbNhKUu82y1OMySF6mTSLYPZi
	hjQSyTdT9MLQgLpKG/Q9SzT2VHSpEaNdVqAsrRRy2tFAw55zLo25tUpDulqHhx78ayU/
	phSHn/1E/yVD4ST57rhJ/RHrif7qIQ/8mb4zTibvpJYaMGmL5YIE4yzZ1PQl5QjlN4sA
	m4Ao5dMq11vPIVm9R63J6qdqqJjUptJ3qwRKZyuRUnBG876MpdMcIg+r3zgt9bjhc3tU
	t46g==
X-Received: by 10.194.62.137 with SMTP id y9mr22923708wjr.136.1445598115650;
	Fri, 23 Oct 2015 04:01:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ld5sm22072988wjc.18.2015.10.23.04.01.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Oct 2015 04:01:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2015 13:02:24 +0200
Message-Id: <1445598144-13085-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][meta-networking] snort: fix indentation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Oct 2015 11:01:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/snort/snort_2.9.6.0.bb    | 79 +++++++++++-----------
 1 file changed, 39 insertions(+), 40 deletions(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
index 65dc524..e15f7be 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
@@ -6,14 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
 DEPENDS = "libpcap libpcre daq libdnet util-linux"
 
-
 SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
-            file://snort.init \
-            file://disable-inaddr-none.patch \
-            file://disable-dap-address-space-id.patch \
-            file://0001-libpcap-search-sysroot-for-headers.patch \
-            file://not-hardcoded-libdir.patch \
-            file://m4-oom-during-configure.patch \
+    file://snort.init \
+    file://disable-inaddr-none.patch \
+    file://disable-dap-address-space-id.patch \
+    file://0001-libpcap-search-sysroot-for-headers.patch \
+    file://not-hardcoded-libdir.patch \
+    file://m4-oom-during-configure.patch \
 "
 
 SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
@@ -25,17 +24,17 @@ INITSCRIPT_NAME = "snort"
 INITSCRIPT_PARAMS = "defaults"
 
 EXTRA_OECONF = " \
-	--enable-gre \
-	--enable-linux-smp-stats \
-	--enable-reload \
-	--enable-reload-error-restart \
-	--enable-targetbased \
-	--disable-static-daq \
-	--with-dnet-includes=${STAGING_INCDIR} \
-	--with-dnet-libraries=${STAGING_LIBDIR} \
-	--with-libpcre-includes=${STAGING_INCDIR} \
-	--with-libpcre-libraries=${STAGING_INCDIR} \
-	"
+    --enable-gre \
+    --enable-linux-smp-stats \
+    --enable-reload \
+    --enable-reload-error-restart \
+    --enable-targetbased \
+    --disable-static-daq \
+    --with-dnet-includes=${STAGING_INCDIR} \
+    --with-dnet-libraries=${STAGING_LIBDIR} \
+    --with-libpcre-includes=${STAGING_INCDIR} \
+    --with-libpcre-libraries=${STAGING_INCDIR} \
+"
 
 # if you want to disable it, you need to patch configure.in first
 # AC_CHECK_HEADERS([openssl/sha.h],, SHA_H="no")
@@ -57,28 +56,28 @@ do_install_append() {
 }
 
 FILES_${PN} += " \
-	${libdir}/snort_dynamicengine/*.so.* \
-	${libdir}/snort_dynamicpreprocessor/*.so.* \
-	${libdir}/snort_dynamicrules/*.so.* \
-	"
+    ${libdir}/snort_dynamicengine/*.so.* \
+    ${libdir}/snort_dynamicpreprocessor/*.so.* \
+    ${libdir}/snort_dynamicrules/*.so.* \
+"
 FILES_${PN}-dbg += " \
-	${libdir}/snort_dynamicengine/.debug \
-	${libdir}/snort_dynamicpreprocessor/.debug \
-	${libdir}/snort_dynamicrules/.debug \
-	"
+    ${libdir}/snort_dynamicengine/.debug \
+    ${libdir}/snort_dynamicpreprocessor/.debug \
+    ${libdir}/snort_dynamicrules/.debug \
+"
 FILES_${PN}-staticdev += " \
-	${libdir}/snort_dynamicengine/*.a \
-	${libdir}/snort_dynamicpreprocessor/*.a \
-	${libdir}/snort_dynamicrules/*.a \
-	${libdir}/snort/dynamic_preproc/*.a \
-	${libdir}/snort/dynamic_output/*.a \
-	"
+    ${libdir}/snort_dynamicengine/*.a \
+    ${libdir}/snort_dynamicpreprocessor/*.a \
+    ${libdir}/snort_dynamicrules/*.a \
+    ${libdir}/snort/dynamic_preproc/*.a \
+    ${libdir}/snort/dynamic_output/*.a \
+"
 FILES_${PN}-dev += " \
-	${libdir}/snort_dynamicengine/*.la \
-	${libdir}/snort_dynamicpreprocessor/*.la \
-	${libdir}/snort_dynamicrules/*.la \
-	${libdir}/snort_dynamicengine/*.so \
-	${libdir}/snort_dynamicpreprocessor/*.so \
-	${libdir}/snort_dynamicrules/*.so \
-	${prefix}/src/snort_dynamicsrc \
-	"
+    ${libdir}/snort_dynamicengine/*.la \
+    ${libdir}/snort_dynamicpreprocessor/*.la \
+    ${libdir}/snort_dynamicrules/*.la \
+    ${libdir}/snort_dynamicengine/*.so \
+    ${libdir}/snort_dynamicpreprocessor/*.so \
+    ${libdir}/snort_dynamicrules/*.so \
+    ${prefix}/src/snort_dynamicsrc \
+"
-- 
2.6.2


