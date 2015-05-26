Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A02FB6AC12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 14:14:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2015 07:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,498,1427785200"; d="scan'208";a="576947126"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site.fi.intel.com)
	([10.237.68.48])
	by orsmga003.jf.intel.com with ESMTP; 26 May 2015 07:14:39 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 May 2015 17:13:13 +0300
Message-Id: <1432649594-15473-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] gstreamer: fix the path to a required include in gst-plugins-gl
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
X-List-Received-Date: Tue, 26 May 2015 14:14:41 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index 90efbcc..6859f33 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -1,4 +1,4 @@
-require recipes-multimedia/gstreamer/gst-plugins.inc
+require gst-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-- 
2.1.4


