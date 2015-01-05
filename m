Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 68493726BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:33:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2015 02:33:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646373627"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 02:33:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:33:20 +0000
Message-Id: <ac5e668fabd62f05a6c2a11f23009d82ccedef1b.1420453688.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v2 07/12] uw-imap: make libpam dependency dependent on DISTRO_FEATURES
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
X-List-Received-Date: Mon, 05 Jan 2015 10:33:40 -0000

If pam is not in DISTRO_FEATURES, we shouldn't be building it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index e1a9877..52b689e 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a6a4ddbb7cd2999f6827ee143f6fcd97"
 
-DEPENDS = "openssl libpam"
+DEPENDS = "openssl"
 
 SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.gz \
            file://quote_cctype.patch \
@@ -17,13 +17,16 @@ SRC_URI[sha256sum] = "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520
 
 S = "${WORKDIR}/imap-${PV}"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG[pam] = ",,libpam"
+
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


