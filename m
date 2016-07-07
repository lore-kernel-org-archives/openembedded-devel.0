Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A9564601A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jul 2016 02:18:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u672I9co020118
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jul 2016 19:18:09 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 19:18:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jul 2016 22:18:04 -0400
Message-ID: <24221e26c3869173885c9d3228bf27636bf2c296.1467857744.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1467857744.git.jackie.huang@windriver.com>
References: <cover.1467857744.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] net-snmp: initscripts are located in net-snmp-server-snmp package
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
X-List-Received-Date: Thu, 07 Jul 2016 02:18:09 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

The net-snmp-server package is a meta-package requiring
net-snmp-server-snmpd and net-snmp-server-snmptrapd package.
The net-snmp-server-snmpd package provides the startup scripts
not the meta net-snmp-server package.

Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index ca98fc0..4ad5b21 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -143,9 +143,9 @@ FILES_${PN}-dev += "${bindir}/mib2c ${bindir}/mib2c-update"
 CONFFILES_${PN}-server-snmpd = "${sysconfdir}/snmp/snmpd.conf"
 CONFFILES_${PN}-server-snmptrapd = "${sysconfdir}/snmp/snmptrapd.conf"
 
-INITSCRIPT_PACKAGES = "${PN}-server"
-INITSCRIPT_NAME_${PN}-server = "snmpd"
-INITSCRIPT_PARAMS_${PN}-server = "start 90 2 3 4 5 . stop 60 0 1 6 ."
+INITSCRIPT_PACKAGES = "${PN}-server-snmpd"
+INITSCRIPT_NAME_${PN}-server-snmpd = "snmpd"
+INITSCRIPT_PARAMS_${PN}-server-snmpd = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
 
-- 
2.8.1


