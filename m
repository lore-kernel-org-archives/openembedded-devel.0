Return-Path: <heikki.sarkanen@tamtron.fi>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0120.outbound.protection.outlook.com [157.56.112.120])
	by mail.openembedded.org (Postfix) with ESMTP id F31D173A6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 15:49:48 +0000 (UTC)
Received: from heikki-HP-Compaq-6000-Pro-SFF-PC.tamtrongroup.local
	(194.215.174.189) by HE1PR03MB1004.eurprd03.prod.outlook.com
	(25.162.248.142) with Microsoft SMTP Server (TLS) id 15.1.99.14;
	Tue, 10 Mar 2015 15:49:46 +0000
From: Heikki Sarkanen <heikki.sarkanen@tamtron.fi>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Mar 2015 17:47:10 +0200
Message-ID: <1426002430-18540-1-git-send-email-heikki.sarkanen@tamtron.fi>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [194.215.174.189]
X-ClientProxiedBy: AM2PR03CA0023.eurprd03.prod.outlook.com (25.160.207.33) To
	HE1PR03MB1004.eurprd03.prod.outlook.com (25.162.248.142)
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR03MB1004;
X-Microsoft-Antispam-PRVS: <HE1PR03MB100492D526C203CEE5667CD8AB180@HE1PR03MB1004.eurprd03.prod.outlook.com>
X-Forefront-Antispam-Report: BMV:0; SFV:NSPM;
	SFS:(10019020)(6009001)(77156002)(110136001)(40100003)(122386002)(86362001)(33646002)(450100001)(66066001)(92566002)(47776003)(36756003)(50466002)(62966003)(87976001)(19580395003)(19580405001)(42186005)(46102003)(48376002)(2351001)(74482002)(50226001)(229853001)(50986999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR03MB1004;
	H:heikki-HP-Compaq-6000-Pro-SFF-PC.tamtrongroup.local; FPR:;
	SPF:None; MLV:sfv; LANG:en; 
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5001009); SRVR:HE1PR03MB1004; BCL:0;
	PCL:0; RULEID:; SRVR:HE1PR03MB1004; 
X-Forefront-PRVS: 051158ECBB
X-OriginatorOrg: tamtron.fi
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2015 15:49:46.1749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB1004
Subject: [meta-qt5][PATCH] qt5: fix current git version
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
X-List-Received-Date: Tue, 10 Mar 2015 15:49:50 -0000
Content-Type: text/plain

Bitbake doesn't detect lower git version:
NOTE: preferred version 5.4.0+git% of qtbase-native not available (for item qtbase-native)
NOTE: versions of qtbase-native available: 5.4.1 5.4.1+gitAUTOINC+a782369071

Signed-off-by: Heikki Sarkanen <heikki.sarkanen@tamtron.fi>
---
 conf/distro/include/qt5-versions.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index c61bb6f..d367676 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,5 +1,5 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.4.1", "5.4.0+git%"
+# possible values now "5.4.1", "5.4.1+git%"
 
 QT5_VERSION ?= "5.4.1"
 
-- 
1.9.1


