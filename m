Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UcAP9-0002LA-UV
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 10:16:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2013 00:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,667,1363158000"; d="scan'208";a="302122501"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2013 00:58:00 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 May 2013 10:57:59 +0300
Message-Id: <1368518279-8029-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-networking][PATCH v2] vpnc: Runtime dependency to perl was missing
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
X-List-Received-Date: Tue, 14 May 2013 08:16:46 -0000


Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
This version now properly rdepends on perl-module-io-file instead of
just the perl package.

Cheers,
Jukka

 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 2ce9530..a73cd13 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33"
 DEPENDS = "libgcrypt"
-RDEPENDS_${PN} = "kernel-module-tun"
+RDEPENDS_${PN} = "kernel-module-tun perl-module-io-file"
 
 CFLAGS_append = ' -DVERSION=\\"${PV}\\"'
 LDFLAGS_append = " -lgcrypt -lgpg-error"
-- 
1.7.11.7



