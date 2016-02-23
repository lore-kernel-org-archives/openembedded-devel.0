Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5A43E77344
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676917"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:48 +0200
Message-Id: <e343b3d201cf86fe492d1db656cbac6f9576dfdd.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/34] libxklavier: fix gobject introspection
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:23 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
index 5e1d125..e93c378 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
@@ -11,8 +11,6 @@ SRC_URI[archive.md5sum] = "290ea2a8abc40f78a3a16bdae6f02808"
 SRC_URI[archive.sha256sum] = "ebec3bc54b5652838502b96223152fb1cd8fcb14ace5cb02d718fc3276bbd404"
 
 EXTRA_OECONF = "--with-xkb-bin-base=${bindir}"
-PACKAGECONFIG ??=""
-PACKAGECONFIG[introspection] = "--enable-introspection=yes, --enable-introspection=no, libgirepository"
 
 do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-- 
2.7.0


