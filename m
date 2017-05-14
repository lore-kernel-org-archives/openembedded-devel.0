Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 145EB60119
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 May 2017 06:37:35 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 May 2017 23:37:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,337,1491289200"; d="scan'208";a="100157523"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga005.jf.intel.com with ESMTP; 13 May 2017 23:37:35 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 May 2017 14:37:44 +0800
Message-Id: <1494743864-167898-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe] [PATCH] libdbus-c++: remove PNBLACKLIST
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
X-List-Received-Date: Sun, 14 May 2017 06:37:39 -0000

This recipe has been tested against meta-openembedded master branch
and the build failure was unable to reproduce.

The build issues encountered earlier could have been fixed by
some other dependencies.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
index 4412716..9b053fe 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -27,5 +27,3 @@ PACKAGE_BEFORE_PN = "${PN}-tools"
 FILES_${PN}-tools = "${bindir}"
 
 BBCLASSEXTEND = "native"
-
-PNBLACKLIST[libdbus-c++] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130644/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.7.4


