Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UST8v-00084a-4T
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 16:15:44 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 14:57:45 +0100
Message-Id: <1366207065-3413-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCH] net-snmp: add -systemd packages to PACKAGES list to appease systemd.bbclass
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
X-List-Received-Date: Wed, 17 Apr 2013 14:15:47 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

ERROR: net-snmp-server-snmpd-systemd does not appear in package list, please add it
ERROR: net-snmp-server-snmptrapd-systemd does not appear in package list, please add it

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
index 81ad6ff..1e1db6a 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
@@ -61,7 +61,11 @@ do_install_append() {
 }
 
 PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-libs \
-            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
+            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd \
+            ${PN}-server-snmpd-systemd ${PN}-server-snmptrapd-systemd "
+
+SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
+                    ${PN}-server-snmptrapd-systemd"
 
 ALLOW_EMPTY_${PN}-server = "1"
 
@@ -91,9 +95,6 @@ INITSCRIPT_PARAMS_${PN}-server = "defaults"
 
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
 
-SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
-                    ${PN}-server-snmptrapd-systemd"
-
 SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
 SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
 
-- 
1.8.2



