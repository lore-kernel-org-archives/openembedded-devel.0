Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0118.outbound.protection.outlook.com [157.56.110.118])
	by mail.openembedded.org (Postfix) with ESMTP id 67D7565CD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2015 08:45:29 +0000 (UTC)
Received: from CO2PR03CA0040.namprd03.prod.outlook.com (10.141.194.167) by
	BY1PR03MB1370.namprd03.prod.outlook.com (25.162.109.28) with Microsoft
	SMTP Server (TLS) id 15.1.154.19; Thu, 30 Apr 2015 08:29:56 +0000
Received: from BN1AFFO11FD052.protection.gbl (2a01:111:f400:7c10::193) by
	CO2PR03CA0040.outlook.office365.com (2a01:111:e400:1414::39) with
	Microsoft SMTP Server (TLS) id 15.1.125.19 via Frontend Transport;
	Thu, 30 Apr 2015 08:29:56 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD052.mail.protection.outlook.com (10.58.53.67) with Microsoft
	SMTP Server (TLS) id 15.1.154.14 via Frontend Transport;
	Thu, 30 Apr 2015 08:29:54 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t3U8ToOm014822;
	Thu, 30 Apr 2015 01:29:51 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Apr 2015 16:29:48 +0800
Message-ID: <1430382588-11298-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(77096005)(450100001)(50466002)(46102003)(47776003)(50986999)(92566002)(86362001)(107886002)(110136002)(50226001)(36756003)(77156002)(104016003)(62966003)(229853001)(19580405001)(2351001)(105606002)(106466001)(85426001)(6806004)(87936001)(86152002)(48376002)(33646002)(19580395003)(5001960100002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1370;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR03MB1370;
X-Microsoft-Antispam-PRVS: <BY1PR03MB137002EEED0040FB88E1824684D60@BY1PR03MB1370.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR03MB1370; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR03MB1370; 
X-Forefront-PRVS: 056297E276
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2015 08:29:54.8846 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1370
Subject: [meta-browser][PATCH] firefox_10.0.11esr: ${PN} usage in SRC_URI Should use ${BPN} instead to avoid breaking multilib
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
X-List-Received-Date: Thu, 30 Apr 2015 08:45:30 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

    fix the following warning:
    |WARNING: Unable to get checksum for lib32-firefox SRC_URI entry mozilla-lib32-firefox.png: file could not be found
    |WARNING: Unable to get checksum for lib32-firefox SRC_URI entry mozilla-lib32-firefox.desktop: file could not be found

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 recipes-mozilla/firefox/firefox_10.0.11esr.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index cd303ff..f89da58 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -8,8 +8,8 @@ LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
 
 SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
-           file://mozilla-${PN}.png \
-           file://mozilla-${PN}.desktop \
+           file://mozilla-${BPN}.png \
+           file://mozilla-${BPN}.desktop \
            file://fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch \
            file://fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch \
            file://fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch \
-- 
1.9.2


