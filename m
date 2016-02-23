Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F371C77381
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676992"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:34 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:58 +0200
Message-Id: <9bddf52c6567fc5e14b6c2658c8815dc1fe46b88.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/34] modemmanager: fix vala support
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:34 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
index f251270..b855b44 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-inherit gnomebase gettext systemd
+inherit gnomebase gettext systemd vala
 
 DEPENDS = "glib-2.0 libgudev dbus-glib"
 
-- 
2.7.0


