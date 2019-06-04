Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D35F07E266
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2019 07:31:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x547V9T6019310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Jun 2019 00:31:09 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 00:31:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 4 Jun 2019 15:31:05 +0800
Message-ID: <1559633465-4558-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559633465-4558-1-git-send-email-hongxu.jia@windriver.com>
References: <1559633465-4558-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] net-snmp: split net-snmp-config to package net-snmp-dev
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
X-List-Received-Date: Tue, 04 Jun 2019 07:31:10 -0000
Content-Type: text/plain

Move net-snmp-config in which contains build path from
package net-snmp to net-snmp-dev.

It refers ubuntu, here are we got from Ubuntu 18.04
$ dpkg -c /var/cache/apt/archives/libsnmp-dev_5.7.3+dfsg-1.8ubuntu3.1_amd64.deb
drwxr-xr-x root/root         0 2018-10-15 22:16 ./usr/bin/
-rwxr-xr-x root/root     43797 2018-10-15 22:16 ./usr/bin/mib2c
-rwxr-xr-x root/root      8780 2018-10-15 22:16 ./usr/bin/mib2c-update
-rwxr-xr-x root/root     29427 2018-10-15 22:16 ./usr/bin/net-snmp-config
-rwxr-xr-x root/root      3688 2018-10-15 22:16 ./usr/bin/net-snmp-create-v3-user

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 673142b..f0acaa8 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -214,7 +214,11 @@ FILES_${PN}-lib-trapd = "${libdir}/libnetsnmptrapd${SOLIBS}"
 FILES_${PN} = ""
 FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
 FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
-FILES_${PN}-dev += "${bindir}/mib2c ${bindir}/mib2c-update"
+FILES_${PN}-dev += "${bindir}/mib2c \
+                    ${bindir}/mib2c-update \
+                    ${bindir}/net-snmp-config \
+                    ${bindir}/net-snmp-create-v3-user \
+"
 
 CONFFILES_${PN}-server-snmpd = "${sysconfdir}/snmp/snmpd.conf"
 CONFFILES_${PN}-server-snmptrapd = "${sysconfdir}/snmp/snmptrapd.conf"
-- 
2.7.4


