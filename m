Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B552965CBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 13:56:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 21 Jul 2016 06:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,399,1464678000"; d="scan'208";a="1021303959"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.185])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2016 06:56:29 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2016 16:55:54 +0300
Message-Id: <1469109354-13524-1-git-send-email-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [meta-xfce][PATCH] xfce4-terminal: add dependency on vte9-termcap
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
X-List-Received-Date: Thu, 21 Jul 2016 13:56:29 -0000

xfce4-terminal requires vte9-termcap to be installed at run time
to be fully functional.

The patch adds vte9-termcap to xfce4-terminal's RDEPENDS.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
index 22b81af..98ffec2 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
@@ -2,6 +2,7 @@ SUMMARY = "Terminal emulator for the Xfce desktop environment"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0 gtk+ vte9 libxfce4ui"
+RDEPENDS_${PN} += "vte9-termcap"
 
 inherit xfce-app
 
-- 
2.5.5


