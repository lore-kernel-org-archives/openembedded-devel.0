Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 774F57E33A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:43:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:43:59 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:43:59 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:11 -0700
Message-Id: <20190602184318.71277-6-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 06/13] libcrypt-openssl-random-perl: upgrade 0.11 -> 0.15; enable ptest
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
X-List-Received-Date: Sun, 02 Jun 2019 18:43:58 -0000
Content-Transfer-Encoding: 8bit

* Add EXTRA_CPANFLAGS to fix "undefined symbol: RAND_seed"
* Add DEPENDS on libcrypt-openssl-guess-perl-native
* Add runtime and ptest dependencies

Upstream release notes:
0.15  2018-04-22 rurban
        - fix mingw hints for pkg-config support (akiym, PR #7)

0.14  2018-04-17 rurban
        - add library paths to LIBS from Crypt::OpenSSL::Guess (akiym, PR #6)

0.13  2018-04-14 rurban
        - move Crypt::OpenSSL::Guess to configure dependency. (grinnz, PR #4)

0.12  2018-04-13 rurban
        - use Crypt::OpenSSL::Guess to resolve OpenSSL include path,
          fixes MacOS's homebrew OpenSSL installation problem. (akiym, PR #3)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libcrypt-openssl-random-perl_0.11.bb      | 15 --------
 .../libcrypt-openssl-random-perl_0.15.bb      | 34 +++++++++++++++++++
 2 files changed, 34 insertions(+), 15 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.11.bb
 create mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.11.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.11.bb
deleted file mode 100644
index 8456e313df..0000000000
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.11.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Crypt Openssl Random cpan module"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=089c18d635ae273e1727ec385e64063b"
-
-SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Random-${PV}.tar.gz "
-SRC_URI[md5sum] = "5d71337503e0356ce1ce1481504e5885"
-SRC_URI[sha256sum] = "bb8c81c6a39b9b13a22d818ee9a746242f136f0fadceb6b9776ae615e7524c7a"
-
-S = "${WORKDIR}/Crypt-OpenSSL-Random-${PV}"
-
-DEPENDS += " openssl \
-"
-inherit cpan
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb
new file mode 100644
index 0000000000..a2ebb8c7a1
--- /dev/null
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Crypt::OpenSSL::Random - OpenSSL/LibreSSL pseudo-random number generator access"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=089c18d635ae273e1727ec385e64063b"
+
+SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Random-${PV}.tar.gz "
+SRC_URI[md5sum] = "bcde8d5a822c91376deda3c4f0c75fbe"
+SRC_URI[sha256sum] = "f0876faa1ba3111e39b86aa730c603211eff2905e460c72a57b61e8cf475cef4"
+
+S = "${WORKDIR}/Crypt-OpenSSL-Random-${PV}"
+
+DEPENDS += " \
+    openssl \
+    libcrypt-openssl-guess-perl-native \
+"
+
+EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -L${STAGING_BASELIBDIR} -lcrypto'"
+
+inherit cpan ptest-perl
+
+RDEPENDS_${PN} += "\
+    perl-module-exporter \
+    perl-module-strict \
+    perl-module-vars \
+    perl-module-xsloader \
+"
+
+RDEPENDS_${PN}-ptest += "\
+    perl-module-file-copy \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


