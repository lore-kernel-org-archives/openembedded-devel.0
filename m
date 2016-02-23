Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 13D4177388
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751677002"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:37 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:20:01 +0200
Message-Id: <65169844259d72b840b708e38ddebc9fbfa80af2.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/34] libgee: fix gobject introspection support
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:37 -0000

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


