Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbEL4-000656-1m
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 18:43:54 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Nov 2012 09:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,293,1352102400"; d="scan'208";a="220730124"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.187])
	by azsmga001.ch.intel.com with ESMTP; 21 Nov 2012 09:29:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2012 17:29:30 +0000
Message-Id: <1eef087d214b6c6ff27b60dff5511acfc2a3925e.1353518890.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353518890.git.paul.eggleton@linux.intel.com>
References: <cover.1353518890.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353518890.git.paul.eggleton@linux.intel.com>
References: <cover.1353518890.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 2/2] ntp: make servers configurable and default to none configured
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
X-List-Received-Date: Wed, 21 Nov 2012 17:43:54 -0000

People can't blindly use pool.ntp.org, especially if they are building
for a product or something that could be used in a product, so at least
try to get people to do the right thing and not use pool.ntp.org by
default.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-support/ntp/ntp.inc |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index d20bc2e..b54608a 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -33,12 +33,22 @@ PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --without-openssl --without-crypto, \
                           openssl"
 
+# This should be set in the distro configuration
+NTP_SERVERS ??= ""
+
+python __anonymous() {
+    if not d.getVar("NTP_SERVERS", True):
+        raise bb.parse.SkipPackage("Please set NTP_SERVERS in order to build ntp - see http://www.openembedded.org/wiki/NTP for details")
+}
+
 do_install_append() {
 	install -d ${D}/${sysconfdir}/init.d
 	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
 	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
+
+	sed -i "s/pool.ntp.org/${NTP_SERVERS}/g" ${D}/${sysconfdir}/ntp.conf ${D}/${sysconfdir}/network/if-up.d/ntpdate
 }
 
 PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
@@ -71,7 +81,7 @@ else
         if ! grep -q -s ntpdate /var/spool/cron/root; then
                 echo "adding crontab"
                 test -d /var/spool/cron || mkdir -p /var/spool/cron
-                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
+                echo "30 * * * *    /usr/bin/ntpdate -b -s -u ${NTP_SERVERS}" >> /var/spool/cron/root
         fi
 fi
 }
-- 
1.7.9.5



