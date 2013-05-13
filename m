Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UbsGB-0000I0-Mf
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 14:53:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2013 05:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,662,1363158000"; d="scan'208";a="312662924"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by orsmga001.jf.intel.com with ESMTP; 13 May 2013 05:34:32 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2013 15:34:31 +0300
Message-Id: <1368448471-2941-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-networking][PATCH] vpnc: Runtime dependency to perl was missing
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
X-List-Received-Date: Mon, 13 May 2013 12:53:53 -0000

Generated package contains perl script but dependecy to perl was missing.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 2ce9530..df90234 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33"
 DEPENDS = "libgcrypt"
-RDEPENDS_${PN} = "kernel-module-tun"
+RDEPENDS_${PN} = "kernel-module-tun perl"
 
 CFLAGS_append = ' -DVERSION=\\"${PV}\\"'
 LDFLAGS_append = " -lgcrypt -lgpg-error"
-- 
1.7.11.7



