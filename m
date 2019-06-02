Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2FA77E51F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:44:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:44:18 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:44:18 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:17 -0700
Message-Id: <20190602184318.71277-12-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 12/13] libxml-libxml-perl: enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:44:16 -0000
Content-Transfer-Encoding: 8bit

Enable ptest and add ptest dependencies

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libxml/libxml-libxml-perl_2.0134.bb       | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index 9753520ae4..6fabf26840 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -35,7 +35,7 @@ SRC_URI[libxml.sha256sum] = "f0bca4d0c2da35d879fee4cd13f352014186cedab27ab5e191f
 
 S = "${WORKDIR}/XML-LibXML-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2 LIBS=-L${STAGING_LIBDIR}"
 
@@ -45,3 +45,27 @@ CFLAGS += " -D_GNU_SOURCE "
 BUILD_CFLAGS += " -D_GNU_SOURCE "
 
 FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
+
+RDEPENDS_${PN}-ptest += " \
+    liburi-perl \
+    perl-module-encode-byte \
+    perl-module-encode-unicode \
+    perl-module-locale \
+    perl-module-perlio-scalar \
+    perl-module-test-more \
+"
+
+do_install_prepend() {
+	# test requires "-T" (taint) command line option
+	rm -rf ${B}/t/pod.t
+	# this only applies to author build
+	rm -rf ${B}/t/pod-files-presence.t
+}
+
+do_install_ptest() {
+	cp -r ${B}/t/data ${D}${PTEST_PATH}/t/
+	cp -r ${B}/t/lib ${D}${PTEST_PATH}/t/
+	cp -r ${B}/example ${D}${PTEST_PATH}
+	cp -r ${B}/test ${D}${PTEST_PATH}
+	chown -R root:root ${D}${PTEST_PATH}
+}
-- 
2.20.1


