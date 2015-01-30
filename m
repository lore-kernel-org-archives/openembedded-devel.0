Return-Path: <ting.liu@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0116.outbound.protection.outlook.com [65.55.169.116])
	by mail.openembedded.org (Postfix) with ESMTP id 0910E6076E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 08:20:51 +0000 (UTC)
Received: from BN3PR0301CA0011.namprd03.prod.outlook.com (25.160.180.149) by
	BY1PR0301MB1191.namprd03.prod.outlook.com (25.160.195.15) with
	Microsoft SMTP
	Server (TLS) id 15.1.75.20; Fri, 30 Jan 2015 08:20:51 +0000
Received: from BN1AFFO11FD005.protection.gbl (2a01:111:f400:7c10::197) by
	BN3PR0301CA0011.outlook.office365.com (2a01:111:e400:4000::21) with
	Microsoft
	SMTP Server (TLS) id 15.1.75.20 via Frontend Transport; Fri, 30 Jan 2015
	08:20:50 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD005.mail.protection.outlook.com (10.58.52.65) with Microsoft
	SMTP Server (TLS) id 15.1.75.11 via Frontend Transport;
	Fri, 30 Jan 2015 08:20:50 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t0U8KjBL011221;
	Fri, 30 Jan 2015 01:20:48 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Jan 2015 16:20:45 +0800
Message-ID: <1422606045-7713-2-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1422606045-7713-1-git-send-email-ting.liu@freescale.com>
References: <1422606045-7713-1-git-send-email-ting.liu@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; gmail.com; dkim=none (message not
	signed) header.d=none;gmail.com; dmarc=none action=none
	header.from=freescale.com;
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(106466001)(110136001)(229853001)(87936001)(105606002)(104016003)(2351001)(50466002)(48376002)(6806004)(62966003)(77156002)(19580405001)(33646002)(19580395003)(50226001)(86362001)(76176999)(50986999)(46102003)(85426001)(77096005)(15975445007)(2950100001)(47776003)(92566002)(86152002)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1191;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BY1PR0301MB1191;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY1PR0301MB1191; 
X-Forefront-PRVS: 04724A515E
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1191; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2015 08:20:50.5203 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1191
Subject: [meta-oe][PATCH 2/2] rng-tools: Fixes for latest OE layouts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Jan 2015 08:20:57 -0000
Content-Type: text/plain

From: Gary Thomas <gary@mlbassoc.com>

The current recipe has a few installation errors:
  * The manipulation of configurable paths drops a '/'
  * The init script defaults are placed in the wrong file
  * Finer control over init script start/stop
  * The default device is non-standard

This patch fixes these little nits and makes the package usable again.

Based on the original patch:
http://patchwork.openembedded.org/patch/41049/

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta-oe/recipes-support/rng-tools/files/default  | 3 ++-
 meta-oe/recipes-support/rng-tools/rng-tools_4.bb | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/rng-tools/files/default b/meta-oe/recipes-support/rng-tools/files/default
index ab7cd93..7aede9b 100644
--- a/meta-oe/recipes-support/rng-tools/files/default
+++ b/meta-oe/recipes-support/rng-tools/files/default
@@ -1,2 +1,3 @@
 # Specify rng device
-RNG_DEVICE=/dev/hwrng
+#RNG_DEVICE=/dev/hwrng
+RNG_DEVICE=/dev/urandom
diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
index 0b40fc5..b3d880f 100644
--- a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
+++ b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
@@ -24,13 +24,13 @@ do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d "${D}${sysconfdir}/init.d"
         install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},' \
+        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
             ${D}${sysconfdir}/init.d/rng-tools
 
         install -d "${D}${sysconfdir}/default"
-        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default
+        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/rng-tools
     fi
 }
 
 INITSCRIPT_NAME = "rng-tools"
-INITSCRIPT_PARAMS = "defaults"
+INITSCRIPT_PARAMS = "start 30 S . stop 30 0 6 1 ."
-- 
1.9.1


