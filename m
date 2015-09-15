Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6B772A78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 09:07:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2015 02:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,534,1437462000"; d="scan'208";a="769284501"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2015 02:07:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Sep 2015 12:09:20 +0300
Message-Id: <1442308160-4744-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442308160-4744-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1442308160-4744-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] gimp: disable webkit dependency in the recipe
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
X-List-Received-Date: Tue, 15 Sep 2015 09:07:31 -0000

gimp (optionally) depends on a very old version of webkit-gtk (1.6.x)
for browsing help, and oe-core no longer provides that version.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
index 7d52cf1..efeb575 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
@@ -9,9 +9,6 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
 inherit gnome gtk-doc
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[helpbrowser] = "--with-webkit, --without-webkit, webkit-gtk"
-
 SRC_URI = " \
     http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
     file://0001-configure-ac-do-not-check-for-freetype-config.patch \
@@ -20,6 +17,7 @@ SRC_URI[md5sum] = "233c948203383fa078434cc3f8f925cb"
 SRC_URI[sha256sum] = "d82a958641c9c752d68e35f65840925c08e314cea90222ad845892a40e05b22d"
 
 EXTRA_OECONF = "--disable-python \
+                --without-webkit \
                 --without-wmf"
 
 do_configure_append() {
-- 
2.1.4


