Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 507976C49A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:40:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2018 07:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,257,1539673200"; d="scan'208";a="251220020"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.31.112])
	by orsmga004.jf.intel.com with ESMTP; 20 Nov 2018 07:40:42 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 16:40:41 +0100
Message-Id: <20181120154041.9420-1-raphael.kubo.da.costa@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][sumo][PATCH] nodejs: Enable system ICU support
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
X-List-Received-Date: Tue, 20 Nov 2018 15:40:42 -0000
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Latest Chromium needs it during build

(cherry picked from commit d7d0cc5227d0dc7d3ff91ded9da841d65c3f3632)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
index 8930cd902..132ee0f2b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=270f7477a1705f7cd3e29d3d4512915d"
 
-DEPENDS = "openssl10 zlib"
+DEPENDS = "openssl10 zlib icu"
+
+inherit pkgconfig
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
@@ -44,7 +46,7 @@ do_configure () {
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --without-intl --without-snapshot --shared-openssl --shared-zlib \
+   ./configure --prefix=${prefix} --with-intl=system-icu --without-snapshot --shared-openssl --shared-zlib \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
                ${ARCHFLAGS}
-- 
2.19.1


