Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UcEvj-0003Wz-8r
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 15:06:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 May 2013 05:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,670,1363158000"; d="scan'208";a="337365722"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by fmsmga002.fm.intel.com with ESMTP; 14 May 2013 05:47:51 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 May 2013 15:47:50 +0300
Message-Id: <1368535670-26737-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-networking][PATCH] vpnc: Set RDEPENDS to perl-module-io-file instead of perl
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
X-List-Received-Date: Tue, 14 May 2013 13:06:36 -0000


Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index df90234..addd150 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -6,7 +6,6 @@ PRIORITY = "optional"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33"
 DEPENDS = "libgcrypt"
-RDEPENDS_${PN} = "kernel-module-tun perl"
 
 CFLAGS_append = ' -DVERSION=\\"${PV}\\"'
 LDFLAGS_append = " -lgcrypt -lgpg-error"
@@ -19,6 +18,7 @@ do_install () {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/vpnc/default.conf"
+RDEPENDS_${PN} = "kernel-module-tun perl-module-io-file"
 
 SRC_URI = "http://www.unix-ag.uni-kl.de/~massar/vpnc/vpnc-${PV}.tar.gz \
            file://makeman.patch \
-- 
1.7.11.7



