Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7992776B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:30:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D3UhYt024291
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 20:30:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 12 Mar 2017 20:30:43 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Mar 2017 11:29:18 +0800
Message-ID: <20170313032921.8669-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170313032921.8669-1-kai.kang@windriver.com>
References: <20170313032921.8669-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] curlpp: update HOMEPAGE and SRC_URI
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
X-List-Received-Date: Mon, 13 Mar 2017 03:30:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The page of curlpp hosted on googlecode doesn' work now. So update
SRC_URI to use repo hosted on github. Update HOMEPAGE as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index c3a242a..24f2ef8 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "C++ library for client-side URL transfers"
-HOMEPAGE = "http://code.google.com/p/curlpp/"
+HOMEPAGE = "http://www.curlpp.org/"
 SECTION = "libdevel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 DEPENDS = "curl boost"
 DEPENDS_class-native = "curl-native"
 
-SRC_URI = "http://curlpp.googlecode.com/files/curlpp-${PV}.tar.gz \
+SRC_URI = "https://github.com/jpbarrette/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
     file://example21.cpp-remove-deprecated-code.patch \
 "
 
-SRC_URI[md5sum] = "ccc3d30d4b3b5d2cdbed635898c29485"
-SRC_URI[sha256sum] = "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a653bd5"
+SRC_URI[md5sum] = "ee05f248bf3bbf7f381d65cf2d0ee50f"
+SRC_URI[sha256sum] = "b72093f221a9e2d0f7ce0bd0f846587835e01607a7bb0f106ff4317a8c30a81c"
 
 inherit autotools-brokensep pkgconfig binconfig
 
-- 
2.10.1


