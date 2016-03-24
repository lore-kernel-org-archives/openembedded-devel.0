Return-Path: <Catalin.Enache@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA7526080F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 17:35:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2OHZIAu004330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 10:35:18 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Mar 2016 10:35:17 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Mar 2016 19:37:03 +0200
Message-ID: <1458841023-26902-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] net-snmp: fix some invalid paths
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
X-List-Received-Date: Thu, 24 Mar 2016 17:35:22 -0000
Content-Type: text/plain

Because the package is not built in place @srcdir@ is
an absolute path to the source directory instead of ".".

Because of this some target scripts like  net-snmp-create-v3-user
and net-snmp-config that are using thisvariable in their *.in
files (NSC_SRCDIR=@srcdir@) contain invalid paths.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 06f3707..63e0fc7 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -78,6 +78,10 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
+    sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
+        -i ${D}${bindir}/net-snmp-create-v3-user
+    sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
+        -i ${D}${bindir}/net-snmp-config
 }
 
 do_install_ptest() {
-- 
2.7.4


