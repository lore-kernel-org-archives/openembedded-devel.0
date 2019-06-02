Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 796237E33A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:43:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:43:55 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:43:55 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:10 -0700
Message-Id: <20190602184318.71277-5-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 05/13] libcrypt-openssl-rsa-perl: upgrade 0.30 -> 0.31; enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:43:55 -0000
Content-Transfer-Encoding: 8bit

* Add runtime and ptest dependencies

Upstream release notes:

0.31 Mon Sep 24 2018
    - Remove default of SHA256 for RSA keys. This has caused significant
      problems with downstream modules and it has always been possible to
      do $key->use_sha256_hash()

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libcrypt-openssl-rsa-perl_0.30.bb         | 24 ------------
 .../libcrypt-openssl-rsa-perl_0.31.bb         | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 24 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
 create mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.31.bb

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
deleted file mode 100644
index 0a2ad8aa44..0000000000
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Crypt Openssl RSA cpan module"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
-
-SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
-
-SRC_URI[md5sum] = "10bca2fc6d0ba1aa329f227424ae87d5"
-SRC_URI[sha256sum] = "23e13531397af102db4fd24bcf70137add7c85c23cca697c43aa71c2959a29ac"
-
-DEPENDS += "libcrypt-openssl-guess-native openssl"
-
-RDEPENDS_${PN}="libcrypt-openssl-random-perl"
-
-EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
-
-S = "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
-
-inherit cpan
-
-do_compile() {
-    export OTHERLDFLAGS='-Wl,-rpath'
-    cpan_do_compile
-}
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.31.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.31.bb
new file mode 100644
index 0000000000..68d921c3ca
--- /dev/null
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.31.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Crypt Openssl RSA cpan module"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
+
+SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
+
+SRC_URI[md5sum] = "d33681e19d2094df7c26bc7a4509265e"
+SRC_URI[sha256sum] = "4173403ad4cf76732192099f833fbfbf3cd8104e0246b3844187ae384d2c5436"
+
+DEPENDS += "libcrypt-openssl-guess-perl-native openssl"
+
+RDEPENDS_${PN} = " \
+    libcrypt-openssl-random-perl \
+    perl-module-autoloader \
+    perl-module-carp \
+    perl-module-strict \
+    perl-module-warnings \
+    perl-module-xsloader \
+"
+
+EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
+
+S = "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
+
+inherit cpan ptest-perl
+
+do_compile() {
+    export OTHERLDFLAGS='-Wl,-rpath'
+    cpan_do_compile
+}
+
+RDEPENDS_${PN}-ptest = " \
+    ${PN} \
+    perl-module-file-copy \
+    perl-module-test \
+    perl-module-test-more \
+"
-- 
2.20.1


