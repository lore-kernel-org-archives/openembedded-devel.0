Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 578F46FF23
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869181"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:16 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:37 +0200
Message-Id: <dd593e4682bf325dd54997c380b94822d463bfdd.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/38] libgee: fix gobject introspection support
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:15 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb b/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
index 0a2a052..bf9705c 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libgee is a collection library providing GObject-based interfaces
 and classes for commonly used data structures."
 HOMEPAGE = "http://live.gnome.org/Libgee"
 SECTION = "libs"
-DEPENDS = "glib-2.0 gobject-introspection-stub"
+DEPENDS = "glib-2.0"
 
 BBCLASSEXTEND = "native"
 LICENSE = "LGPLv2.1"
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 PE = "1"
 
-inherit autotools vala pkgconfig
+inherit autotools vala pkgconfig gobject-introspection
 do_configure_prepend() {
     MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
     for i in ${MACROS}; do
-- 
2.7.0


