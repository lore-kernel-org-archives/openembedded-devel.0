Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TOPPi-0008OQ-S7
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 10:55:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Oct 2012 01:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,599,1344236400"; d="scan'208";a="207060473"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.85])
	by orsmga001.jf.intel.com with ESMTP; 17 Oct 2012 01:42:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 09:42:17 +0100
Message-Id: <a342d0a0fb29da8b8c3817353bb9d5acd712f463.1350463306.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1350463306.git.paul.eggleton@linux.intel.com>
References: <cover.1350463306.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1350463306.git.paul.eggleton@linux.intel.com>
References: <cover.1350463306.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/4] libnice: tidy up meta variables
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
X-List-Received-Date: Wed, 17 Oct 2012 08:55:43 -0000

* Add SUMMARY
* Fix typo in DESCRIPTION
* Set LICENSE to a parsable form

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 1e42cad..48ca0a5 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -1,14 +1,15 @@
-DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactice Connectivity Establishment standard (ICE)."
+SUMMARY = "Interactive Connectivity Establishment library"
+DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactive Connectivity Establishment standard (ICE)."
 HOMEPAGE = "http://nice.freedesktop.org/wiki/"
 SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
 
-LICENSE = "LGPLv2.1 MPLv1.1"
+LICENSE = "LGPLv2.1 & MPLv1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
                     file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
 "
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "glib-2.0 gstreamer"
 
-- 
1.7.9.5



