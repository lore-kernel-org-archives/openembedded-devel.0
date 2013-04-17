Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1USUVw-0001Sp-LH
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 17:43:24 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 16:25:35 +0100
Message-Id: <1366212335-4106-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCH v2] net-snmp: set correct SYSTEMD_PACKAGES
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
X-List-Received-Date: Wed, 17 Apr 2013 15:43:25 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
index 81ad6ff..244f0d8 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
@@ -91,8 +91,8 @@ INITSCRIPT_PARAMS_${PN}-server = "defaults"
 
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
 
-SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
-                    ${PN}-server-snmptrapd-systemd"
+SYSTEMD_PACKAGES = "${PN}-server-snmpd \
+                    ${PN}-server-snmptrapd"
 
 SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
 SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
-- 
1.8.2



