Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 96A687318D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:49 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869302"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:46 +0200
Message-Id: <ac87a1566039bddf7a44c41c523e6b29e10a3b13.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 30/38] udisks2: fix gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:49 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
index 031b0e8..d273948 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
@@ -11,11 +11,11 @@ SRC_URI = "http://udisks.freedesktop.org/releases/udisks-${PV}.tar.bz2"
 SRC_URI[md5sum] = "73632501002e6de8244f831e38b2b98e"
 SRC_URI[sha256sum] = "2cfcf560447ea44cba2a683342c7062aaaf35e4eb554bed64ac2dd55a70a5fb6"
 
-inherit autotools systemd gtk-doc
+inherit autotools systemd gtk-doc gobject-introspection
 
 S = "${WORKDIR}/udisks-${PV}"
 
-EXTRA_OECONF = "--disable-introspection --disable-man"
+EXTRA_OECONF = "--disable-man"
 
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
-- 
2.7.0


