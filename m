Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C581E787C2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169349"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:22 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:08 -0800
Message-Id: <3817f7ffeb99d5e952ed80031b5c54586f20cfc1.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 08/12] libnet-dns-perl: upgrade 1.13 -> 1.14
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:20 -0000

* Fix RDEPENDS

Changes:

**** 1.14 Dec 15, 2017

Fix rt.cpan.org #123702

        'use base' should not be used in packages with several
        subpackages defined

Fix rt.cpan.org #123676

        Net::DNS::Nameserver malformed message on big axfr

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libnet/{libnet-dns-perl_1.13.bb => libnet-dns-perl_1.14.bb}     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.13.bb => libnet-dns-perl_1.14.bb} (77%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.13.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.14.bb
similarity index 77%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.13.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.14.bb
index da274efdf..efaa7f7b1 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.13.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.14.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ed0c4c22daaf88c4071bae13b6f71f99"
-SRC_URI[sha256sum] = "7ec76663365f2f96de46fe07bd6c9d45ab21171ae83954e8d1b816428b518c36"
+SRC_URI[md5sum] = "0da1099c0a3548d36ea9e31d5bb9e122"
+SRC_URI[sha256sum] = "83c38a594eeb2c85d66e60047a0f5b403f34bd92a5d13606f02e828d450299fc"
 
 S = "${WORKDIR}/Net-DNS-${PV}"
 
@@ -18,6 +18,8 @@ EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}
 
 inherit cpan
 
+RDEPENDS_${PN} = "perl-module-integer"
+
 do_compile() {
     export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
     cpan_do_compile
-- 
2.13.6


