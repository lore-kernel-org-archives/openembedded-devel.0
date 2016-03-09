Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D57006018C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869045"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:06 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:28 +0200
Message-Id: <cd9a9d87977d9bc2b113d6b6b05fec7ae43ccfdb.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/38] rygel: fix gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:06 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
index 663f55e..5cb7d43 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
@@ -17,9 +17,9 @@ GNOME_COMPRESS_TYPE = "xz"
 SRC_URI[archive.md5sum] = "9fbe4fb53b6cfa2f3f3723b7649a2215"
 SRC_URI[archive.sha256sum] = "9ea23df7186caac5f1aad3137edf6d507d339b9a469fc3133df4043fa66b61f5"
 
-inherit gnomebase vala
+inherit gnomebase vala gobject-introspection
 
-EXTRA_OECONF = "--disable-introspection --disable-tracker-plugin --with-media-engine=gstreamer"
+EXTRA_OECONF = "--disable-tracker-plugin --with-media-engine=gstreamer"
 
 PACKAGECONFIG ?= "external mpris mediathek ruih media-export gst-launch gtk+3"
 PACKAGECONFIG[external] = "--enable-external-plugin,--disable-external-plugin"
-- 
2.7.0


