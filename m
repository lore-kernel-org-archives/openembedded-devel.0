Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 330A17E33A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:43:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:43:49 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:43:49 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:09 -0700
Message-Id: <20190602184318.71277-4-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 04/13] libcrypt-openssl-guess-perl: rename from libcrypt-openssl-guess; enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:43:48 -0000
Content-Transfer-Encoding: 8bit

We follow Debian naming and this module snuck in misnamed.

Add PROVIDES "libcrypt-openssl-guess" for backwards compatibility.

Add runtime and ptest dependencies.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...bb => libcrypt-openssl-guess-perl_0.11.bb} | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-guess_0.11.bb => libcrypt-openssl-guess-perl_0.11.bb} (60%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess_0.11.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.11.bb
similarity index 60%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess_0.11.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.11.bb
index 21be047206..57df78b4e1 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess_0.11.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.11.bb
@@ -10,12 +10,28 @@ SRC_URI[sha256sum] = "aa6b18e38cb852cbad80a58cd90c395b40819d4d01e0ab37e770314909
 
 DEPENDS += "openssl"
 
-RDEPENDS_${PN}="perl-module-config perl-module-exporter perl-module-symbol perl-module-file-spec"
+RDEPENDS_${PN} = "\
+    perl-module-config \
+    perl-module-exporter \
+    perl-module-extutils-mm \
+    perl-module-extutils-mm-unix \
+    perl-module-file-spec \
+    perl-module-symbol \
+    perl-module-strict \
+    perl-module-warnings \
+"
 
 EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
 
 S = "${WORKDIR}/Crypt-OpenSSL-Guess-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 BBCLASSEXTEND = "native"
+
+# for backwards compatibility
+PROVIDES_${PN} += "libcrypt-openssl-guess"
+
+RDEPENDS_${PN}-ptest += "\
+    perl-module-test-more \
+"
-- 
2.20.1


