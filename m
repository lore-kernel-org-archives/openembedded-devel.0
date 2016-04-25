Return-Path: <bruno.bottazzini@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D35060043
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 16:42:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2016 09:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,533,1455004800"; d="scan'208";a="952552530"
Received: from bottazzini-thinkpad-t430.bz.intel.com ([10.218.102.60])
	by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2016 09:42:21 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2016 13:42:17 -0300
Message-Id: <1461602537-19434-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.7.1
Subject: [meta-oe] libmicrohttpd: update to 0.9.49
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
X-List-Received-Date: Mon, 25 Apr 2016 16:42:33 -0000

Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
---
 .../{libmicrohttpd_0.9.34.bb => libmicrohttpd_0.9.49.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.34.bb => libmicrohttpd_0.9.49.bb} (82%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
similarity index 82%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
index e3c833b..7b29065 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
@@ -6,10 +6,10 @@ SECTION = "net"
 DEPENDS = "libgcrypt gnutls file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2947eee13c2c8affb95023a0cb6fda0c"
-SRC_URI[sha256sum] = "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be421a040be1b25a88"
+SRC_URI[md5sum] = "3209aa2ac6199b874a6325342b86edbc"
+SRC_URI[sha256sum] = "9407d8252548ab97ace3276e0032f073820073c0599d43baff832902a8dab11c"
 
-inherit autotools lib_package
+inherit autotools lib_package pkgconfig
 
 # disable spdy, because it depends on openssl
 EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../ --disable-spdy"
-- 
2.7.1


