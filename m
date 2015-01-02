Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1791C7278D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 09:32:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2015 01:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,683,1413270000"; d="scan'208";a="645538411"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2015 01:32:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jan 2015 09:32:01 +0000
Message-Id: <3f651d7b200c06d29a1e236f613d2f8f745a5a03.1420190530.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420190530.git.paul.eggleton@linux.intel.com>
References: <cover.1420190530.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420190530.git.paul.eggleton@linux.intel.com>
References: <cover.1420190530.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 06/11] uw-imap: make libpam dependency dependent on DISTRO_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Jan 2015 09:32:23 -0000

If pam is not in DISTRO_FEATURES, we shouldn't be building it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index e1a9877..867c2d0 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a6a4ddbb7cd2999f6827ee143f6fcd97"
 
-DEPENDS = "openssl libpam"
+DEPENDS = "openssl"
 
 SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.gz \
            file://quote_cctype.patch \
@@ -17,13 +17,17 @@ SRC_URI[sha256sum] = "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520
 
 S = "${WORKDIR}/imap-${PV}"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG[pam] = ",,libpam"
+
+#EXTRA_OEMAKE = "CC='${CC}' ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'PAMLDFLAGS= CHECKPW=psx', d)}"
 EXTRA_OEMAKE = "CC='${CC}'"
 
 HEADERS = "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h c-client/osdep.h"
 
 do_compile() {
     echo "SSLINCLUDE=${STAGING_INCDIR} SSLLIB=${STAGING_LIBDIR}" > ${S}/SPECIALS
-    oe_runmake lnp
+    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'lnp', 'slx', d)}
 }
 
 do_install() {
-- 
1.9.3


