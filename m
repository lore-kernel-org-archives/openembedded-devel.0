Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D39CA7E426
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:44:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:44:12 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:44:12 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:15 -0700
Message-Id: <20190602184318.71277-10-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 10/13] libhtml-parser-perl: enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:44:11 -0000
Content-Transfer-Encoding: 8bit

Add runtime and ptest dependencies

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libhtml/libhtml-parser-perl_3.72.bb       | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index e202de05a7..a4c69c97b8 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -16,10 +16,30 @@ S = "${WORKDIR}/HTML-Parser-${PV}"
 
 EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 do_compile() {
     export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
     cpan_do_compile
 }
+
+RDEPENDS_${PN} += "\
+    perl-module-exporter \
+    perl-module-strict \
+    perl-module-vars \
+    perl-module-xsloader \
+    libhtml-tagset-perl \
+"
+
+RDEPENDS_${PN}-ptest += "\
+    liburi-perl \
+    perl-module-config \
+    perl-module-file-spec \
+    perl-module-filehandle \
+    perl-module-io-file \
+    perl-module-selectsaver \
+    perl-module-test \
+    perl-module-test-more \
+"
+
 BBCLASSEXTEND = "native"
-- 
2.20.1


