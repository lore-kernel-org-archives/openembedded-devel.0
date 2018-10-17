Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id A0C8D71E4C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 06:11:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2018 23:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,391,1534834800"; d="scan'208";a="92646646"
Received: from chiron.jf.intel.com ([10.54.74.39])
	by orsmga003.jf.intel.com with ESMTP; 16 Oct 2018 23:11:47 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Oct 2018 23:11:40 -0700
Message-Id: <20181017061141.72274-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.4
Subject: [meta-perl][PATCH v2 1/2] libnet-dns-sec-perl: add recipe for 1.10
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
X-List-Received-Date: Wed, 17 Oct 2018 06:11:48 -0000

Net::DNS::SEC is installed as an extension to an existing Net::DNS
installation providing packages to support DNSSEC as specified in
RFC4033, RFC4034, RFC4035 and related documents.

It also provides support for SIG0 which is useful for dynamic updates.

Implements cryptographic signature generation and verification functions
using RSA, DSA, ECDSA, and Edwards curve algorithms.

The extended features are made available by replacing Net::DNS by
Net::DNS::SEC in the use declaration.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>

---

Changes in v2:
  Use STAGING_BASELIBDIR
---
 .../libnet/libnet-dns-sec-perl_1.10.bb             | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
new file mode 100644
index 0000000000..3fa6294f1c
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "DNSSEC extensions to Net::DNS"
+HOMEPAGE = "http://www.net-dns.org/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README;beginline=165;endline=192;md5=6ef523fa09e8c272675839e21de16bde"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/W/WI/WILLEM/Net-DNS-SEC-${PV}.tar.gz"
+SRC_URI[md5sum] = "ffa55a9898192c9d4c623cb1357eba9b"
+SRC_URI[sha256sum] = "37a47d4def72d7338f3cc7cd807ec19bd9e2ae638ae656fa536cf0314801989e"
+
+DEPENDS += "openssl"
+
+UPSTREAM_CHECK_REGEX = "Net\-DNS\-SEC\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
+
+S = "${WORKDIR}/Net-DNS-SEC-${PV}"
+
+EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_BASELIBDIR} -lcrypto'"
+
+inherit cpan ptest-perl
+
+RDEPENDS_${PN} = " \
+    libnet-dns-perl \
+    libcrypto \
+    perl-module-dynaloader \
+    perl-module-file-find \
+    perl-module-file-spec \
+    perl-module-io-file \
+    perl-module-mime-base64 \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.14.4


