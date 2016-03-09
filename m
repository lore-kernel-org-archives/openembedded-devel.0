Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFB26FF23
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869171"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:15 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:36 +0200
Message-Id: <4d84790d6adcbde09a1a77ab66c90279180c89ce.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/38] telepathy-glib: fix gobject introspection support
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:14 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
index e6938f1..01c6e37 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "ae0002134991217f42e503c43dea7817853afc18863b913744d51ffa02
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext gobject-introspection
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
-- 
2.7.0


