Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25CE678369
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 01:40:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6S1eExU020645
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 18:40:15 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 27 Jul 2017 18:40:13 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jul 2017 09:39:26 +0800
Message-ID: <1501205966-179976-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-openembedded][PATCH] net-snmp: fix engineBoots value on SIGHUP
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
X-List-Received-Date: Fri, 28 Jul 2017 01:40:14 -0000
Content-Type: text/plain

Store the incremented engineBoots value on SIGHUP.
And don't reset engineBoots to 1 when oldEngineIDLength is 0.
For the first run, the oldEngineIDLength is 0.
When we say first run of the daemon, we talk about the
first run ever on the machine, not only first run of every boot.

Signed-off-by: Marian Florea <marian.florea@windriver.com>
Reviewed-by: Wenkuan Wang <Wenkuan.Wang@windriver.com>
Reviewed-by: Zhaolong Zhang <Zhaolong.Zhang@windriver.com>
Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...nmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch | 45 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
new file mode 100644
index 0000000..efe8038
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
@@ -0,0 +1,45 @@
+From e47c60dc7f649959f63e56bc62355de4bdfd73f4 Mon Sep 17 00:00:00 2001
+From: Marian Florea <marian.florea@windriver.com>
+Date: Thu, 20 Jul 2017 16:55:24 +0800
+Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
+
+Upstream-Status: Pending
+
+Signed-off-by: Marian Florea <marian.florea@windriver.com>
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ agent/snmpd.c    | 1 +
+ snmplib/snmpv3.c | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/agent/snmpd.c b/agent/snmpd.c
+index 056048a..12a7ea1 100644
+--- a/agent/snmpd.c
++++ b/agent/snmpd.c
+@@ -1246,6 +1246,7 @@ receive(void)
+ 	    snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
+ 		     netsnmp_get_version());
+             update_config();
++            snmp_store(app_name);
+             send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
+ #if HAVE_SIGHOLD
+             sigrelse(SIGHUP);
+diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
+index 435cafd..6ad8208 100644
+--- a/snmplib/snmpv3.c
++++ b/snmplib/snmpv3.c
+@@ -984,9 +984,9 @@ init_snmpv3_post_config(int majorid, int minorid, void *serverarg,
+     /*
+      * if our engineID has changed at all, the boots record must be set to 1 
+      */
+-    if (engineIDLen != oldEngineIDLength ||
++    if (oldEngineIDLength != (size_t)0 && (engineIDLen != oldEngineIDLength ||
+         oldEngineID == NULL || c_engineID == NULL ||
+-        memcmp(oldEngineID, c_engineID, engineIDLen) != 0) {
++        memcmp(oldEngineID, c_engineID, engineIDLen) != 0)) {
+         engineBoots = 1;
+     }
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 2d6887e..af6fd1b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://0002-configure-fix-a-cc-check-issue.patch \
            file://0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch \
            file://0004-configure-fix-incorrect-variable.patch \
+           file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
-- 
1.9.1


