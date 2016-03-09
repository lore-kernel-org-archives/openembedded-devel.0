Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6615F6FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62868880"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:02 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:24 +0200
Message-Id: <8a03c81f1c51a6b8632ee1636cc4f5765b66e8e8.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/38] libxklavier: fix gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:01 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
index 5e1d125..384841a 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
@@ -6,13 +6,11 @@ DEPENDS = "xkbcomp gtk+ iso-codes libxi libxml2"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-inherit gnomebase gettext
+inherit gnomebase gettext gobject-introspection
 SRC_URI[archive.md5sum] = "290ea2a8abc40f78a3a16bdae6f02808"
 SRC_URI[archive.sha256sum] = "ebec3bc54b5652838502b96223152fb1cd8fcb14ace5cb02d718fc3276bbd404"
 
 EXTRA_OECONF = "--with-xkb-bin-base=${bindir}"
-PACKAGECONFIG ??=""
-PACKAGECONFIG[introspection] = "--enable-introspection=yes, --enable-introspection=no, libgirepository"
 
 do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-- 
2.7.0


