Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC7060746
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 08:33:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6J8XT1p002314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 01:33:29 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jul 2016 01:33:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2016 16:20:38 +0800
Message-ID: <20160719082038.3002-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] curlpp: fix QA issue for cav-octeon3
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
X-List-Received-Date: Tue, 19 Jul 2016 08:33:29 -0000
Content-Type: text/plain

Modify the curlpp.pc file in do_install_append to avoid the following QA error.

  ERROR: QA Issue: curlpp.pc failed sanity test (tmpdir)

The problem occurs only for tunes which set baselib to 'lib32', and in OE,
we only have two tunes which set such value.

  BASE_LIB_tune-octeon2 = "lib32"
  BASE_LIB_tune-octeon3 = "lib32"

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index 78b9432..bbba576 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -20,6 +20,10 @@ inherit autotools-brokensep pkgconfig binconfig
 # deprecated auto_ptr.  For now, ignore the issue.
 CXXFLAGS += "-Wno-error=deprecated-declarations"
 
+do_install_append () {
+    sed -i 's,${STAGING_DIR_TARGET},,g' ${D}${libdir}/pkgconfig/curlpp.pc
+}
+
 PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.* \
-- 
2.8.3


