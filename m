Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UGPJn-0000FL-Oh
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Mar 2013 08:44:49 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Mar 2013 00:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,849,1355126400"; d="scan'208";a="271196164"
Received: from unknown (HELO localhost.localdomain) ([10.237.72.58])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2013 00:26:57 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2013 09:26:54 +0200
Message-Id: <1363332414-10484-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH] wpa_supplicant: Location of systemd services files changed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2013 07:45:01 -0000


Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
index 23dcc82..91ee4ad 100644
--- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
@@ -8,7 +8,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 do_install_append () {
     install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${S}/systemd/*.service ${D}${systemd_unitdir}/system
+    install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}${systemd_unitdir}/system
 }
 
 # systemd.bbclass does not catch all multiple-instance-service-files
-- 
1.7.11.4



