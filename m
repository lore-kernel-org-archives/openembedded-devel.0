Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7E74078889
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 09:29:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jan 2018 01:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,421,1511856000"; d="scan'208";a="13446843"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 27 Jan 2018 01:29:20 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jan 2018 01:29:02 -0800
Message-Id: <20180127092903.17475-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180127092903.17475-1-timothy.t.orling@linux.intel.com>
References: <20180127092903.17475-1-timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 2/3] libio-socket-ssl-perl: upgrade from 2.052 -> 2.054
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
X-List-Received-Date: Sat, 27 Jan 2018 09:29:19 -0000

Changes:

2.054 2018/01/22
- added missing test certificates to MANIFEST

2.053 2018/01/21
- small behavior fixes
  - if SSL_fingerprint is used and matches don't check for OCSP
  - Utils::CERT_create - small fixes to properly specific purpose, ability to
    use predefined complex purpose but disable some features
- update PublicSuffix
- updates for documentation, especially regarding pitfalls with forking or using
  non-blocking sockets. Spelling fixes.
- test fixes and improvements
  - stability improvements for live tests
  - regenerate certificate in certs/ and make sure they are limited to the
    correct purpose. Checkin program used to generate certificates.
  - adjust tests since certificates have changed and some tests used
    certificates intended for client authentication as server certificates,
    which now no longer works

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...{libio-socket-ssl-perl_2.052.bb => libio-socket-ssl-perl_2.054.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.052.bb => libio-socket-ssl-perl_2.054.bb} (91%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.052.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.054.bb
similarity index 91%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.052.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.054.bb
index e4fc49344..ea78bc4e0 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.052.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.054.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "26c9bcdfb4ba8763ef89264f21326a48"
-SRC_URI[sha256sum] = "e4897a9b17cb18a3c44aa683980d52cef534cdfcb8063d6877c879bfa2f26673"
+SRC_URI[md5sum] = "e1b412e28d107c716e7ca637e2b7f8bd"
+SRC_URI[sha256sum] = "02ea04e9a336a7d3ca9aa604c0c5b5aaf3efa513cefecfc73cc79ceeb5131e4b"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.13.6


