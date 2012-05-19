Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1SVtMJ-0003wG-TI
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 May 2012 01:46:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2012 16:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145965660"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2012 16:35:24 -0700
Received: from localhost.localdomain (unknown [10.237.105.40])
	by linux.intel.com (Postfix) with ESMTP id 25EAA2C8001;
	Sat, 19 May 2012 16:35:23 -0700 (PDT)
From: mihai lindner <mihaix.lindner@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2012 02:34:11 +0300
Message-Id: <1337470451-25226-1-git-send-email-mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH] xf86-video-intel: recipe upgrade from 2.18 to 2.19
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 May 2012 23:46:52 -0000

Signed-off-by: mihai lindner <mihaix.lindner@linux.intel.com>
---
 .../{xf86-video-intel_2.18.0.bb => xf86-video-intel_2.19.0.bb}   |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.18.0.bb => xf86-video-intel_2.19.0.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
index 637e11c..e9e43ff 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
@@ -9,7 +9,7 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess"
@@ -22,5 +22,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "34f3987ffe86e30c57abc33b7f8030e9"
-SRC_URI[sha256sum] = "dce63e33ccfada39ef1e1e6768dfd8edd4c525670dfe56d1c42b2f9570039ffc"
+SRC_URI[md5sum] = "f397bddfc88d4c9b30b56526c1e02e8e"
+SRC_URI[sha256sum] = "32133d61b14ce3b45b83a60e4ed8eb75159259d708f056144250aaeabf16e4bc"
-- 
1.7.10



