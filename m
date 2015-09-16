Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4003376E70
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:34:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2015 07:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,539,1437462000"; d="scan'208";a="770276940"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2015 07:34:29 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Sep 2015 17:35:58 +0300
Message-Id: <1442414158-15694-6-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
References: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [meta-oe][PATCH 5/5] xfce4-settings: recommend adwaita, not gnome-icon-theme
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Sep 2015 14:34:31 -0000

RRECOMMEND adwaita-icon-theme instead of gnome-icon-theme (as latter
is removed from oe-core).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 25fa292..1a7fcb5 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -30,6 +30,6 @@ FILES_${PN} += " \
     ${datadir}/xfce4 \
 "
 
-RRECOMMENDS_${PN} += "gnome-icon-theme"
+RRECOMMENDS_${PN} += "adwaita-icon-theme"
 RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','alsa','libcanberra-alsa','',d)}"
 RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','pulseaudio','libcanberra-pulse','',d)}"
-- 
2.1.4


