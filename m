Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD9DB6022F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 16:35:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2LGZLCD010354
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 09:35:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 21 Mar 2017 09:35:20 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Mar 2017 00:35:11 +0800
Message-ID: <20170321163511.19398-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] curlpp: 0.7.3 -> 0.8.1
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
X-List-Received-Date: Tue, 21 Mar 2017 16:35:21 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade curlpp from 0.7.3 to 0.8.1. The main difference between 0.7.x
and 0.8.0 is that it replaces autotools with cmake, see
https://github.com/jpbarrette/curlpp/releases/tag/v0.8.0

The homepage of curlpp on googlecode is obsoleted, so update it and use
soure code repo on github.

Remove dependency boost which is dropped by upstream. And remove extra
CXXFLAGS which has been fixed by upstream.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../curlpp/{curlpp_0.7.3.bb => curlpp_0.8.1.bb}       | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)
 rename meta-networking/recipes-support/curlpp/{curlpp_0.7.3.bb => curlpp_0.8.1.bb} (47%)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
similarity index 47%
rename from meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
rename to meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index c3a242a..340f57d 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -1,25 +1,19 @@
 SUMMARY = "C++ library for client-side URL transfers"
-HOMEPAGE = "http://code.google.com/p/curlpp/"
+HOMEPAGE = "http://www.curlpp.org/"
 SECTION = "libdevel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-DEPENDS = "curl boost"
+DEPENDS = "curl"
 DEPENDS_class-native = "curl-native"
 
-SRC_URI = "http://curlpp.googlecode.com/files/curlpp-${PV}.tar.gz \
-    file://example21.cpp-remove-deprecated-code.patch \
-"
+SRC_URI = "git://github.com/jpbarrette/curlpp.git"
 
-SRC_URI[md5sum] = "ccc3d30d4b3b5d2cdbed635898c29485"
-SRC_URI[sha256sum] = "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a653bd5"
+SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
 
-inherit autotools-brokensep pkgconfig binconfig
+S = "${WORKDIR}/git"
 
-EXTRA_OECONF = "--with-boost=${STAGING_DIR_HOST}${prefix}"
-# Upstream is currently working on porting the code to use std::unique_ptr instead of the
-# deprecated auto_ptr.  For now, ignore the issue.
-CXXFLAGS += "-Wno-error=deprecated-declarations"
+inherit cmake pkgconfig binconfig
 
 do_install_append () {
     sed -i 's,${STAGING_DIR_TARGET},,g' ${D}${libdir}/pkgconfig/curlpp.pc
@@ -30,7 +24,6 @@ PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
 
 FILES_lib${BPN}-dev = "${includedir} \
-    ${libdir}/lib*.la \
     ${libdir}/pkgconfig \
     ${bindir}/*-config \
 "
-- 
2.10.1


