Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5471D76D28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:53:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 31 Aug 2015 06:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,441,1437462000"; d="scan'208";a="794618409"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 31 Aug 2015 06:53:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Aug 2015 16:55:14 +0300
Message-Id: <1441029314-30207-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] nautilus3: update the checksums to match the .xz compressed tarball
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
X-List-Received-Date: Mon, 31 Aug 2015 13:53:42 -0000

Previously the default was .bz2

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
index 586d1d9..a1b3b7b 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
@@ -20,8 +20,8 @@ BPN = "nautilus"
 inherit gnome
 
 SRC_URI += "file://no-try-run-strftime.diff"
-SRC_URI[archive.md5sum] = "ecd100ed94431363fa68b217351649c0"
-SRC_URI[archive.sha256sum] = "584e97d3eb093ee16a779809b679150a636bcd4a3767fb604993013b523d2df1"
+SRC_URI[archive.md5sum] = "12314328b59aa1dfd83619f718b81bd5"
+SRC_URI[archive.sha256sum] = "c482d6e7babcc238304cf55586cdf7e2b2806025214a143ed355f0d89b33b154"
 
 EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb --enable-nst-extension"
 export SYSROOT = "${STAGING_DIR_HOST}"
-- 
2.1.4


