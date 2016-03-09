Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D50B871633
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869079"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:07 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:29 +0200
Message-Id: <74fb5bfabbd8537a5386157fc3f8f79a4bf7f23e.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/38] media-service-demo: remove the recipe
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:07 -0000

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


