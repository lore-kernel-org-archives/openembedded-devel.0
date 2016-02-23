Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AF67D77347
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676964"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:53 +0200
Message-Id: <d84847598452dd08752c31f5a52242e6dac4dbd0.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/34] media-service-demo: remove the recipe
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:28 -0000

It hasn't been updated in years, and depends on pygtk,
which is obsolete and incompatible with pygobject 3.x
(and so is no longer provided).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../dleyna/media-service-demo_git.bb                   | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb b/meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb
deleted file mode 100644
index f7457fd..0000000
--- a/meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "demonstration UI for dleyna"
-HOMEPAGE = "https://01.org/dleyna/"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://src/media-service-demo.py;beginline=3;endline=21;md5=2faa3862e32422b3c38a1501539aa8b4"
-
-SRCREV = "f4440e104f0d13e454234184c2c6eba982725baf"
-PV = "0.0+git${SRCPV}"
-
-SRC_URI = "git://github.com/01org/media-service-demo.git"
-
-S = "${WORKDIR}/git"
-
-inherit distutils
-
-RDEPENDS_${PN} = "media-service-upnp python-dbus python-gst python-pygtk \
-                  python-crypt python-netclient python-dateutil"
-- 
2.7.0


