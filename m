Return-Path: <gshastri@juniper.net>
X-Greylist: delayed 4675 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Apr 2015 20:51:53 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0135.outbound.protection.outlook.com [157.56.111.135])
	by mail.openembedded.org (Postfix) with ESMTP id 39C697391D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 20:51:53 +0000 (UTC)
Received: from CO2PR05CA013.namprd05.prod.outlook.com (10.141.241.141) by
	BL2PR05MB132.namprd05.prod.outlook.com (10.242.198.27) with Microsoft
	SMTP Server (TLS) id 15.1.118.21; Wed, 1 Apr 2015 19:18:04 +0000
Received: from BY2FFO11FD046.protection.gbl (2a01:111:f400:7c0c::131) by
	CO2PR05CA013.outlook.office365.com (2a01:111:e400:1429::13) with
	Microsoft
	SMTP Server (TLS) id 15.1.130.23 via Frontend Transport; Wed, 1 Apr 2015
	19:17:58 +0000
Authentication-Results: spf=softfail (sender IP is 66.129.239.17)
	smtp.mailfrom=juniper.net; lists.openembedded.org;
	dkim=none (message not signed) header.d=none;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
	juniper.net discourages use of 66.129.239.17 as permitted sender)
Received: from P-EMF03-SAC.jnpr.net (66.129.239.17) by
	BY2FFO11FD046.mail.protection.outlook.com (10.1.15.170) with Microsoft
	SMTP Server (TLS) id 15.1.136.16 via Frontend Transport;
	Wed, 1 Apr 2015 19:17:58 +0000
Received: from magenta.juniper.net (172.17.27.123) by P-EMF03-SAC.jnpr.net
	(172.24.192.21) with Microsoft SMTP Server (TLS) id 14.3.146.0;
	Wed, 1 Apr 2015 12:17:57 -0700
Received: from gshastri-desktop.juniper.net
	(gshastri-desktop.englab.juniper.net [10.92.9.56])	by
	magenta.juniper.net (8.11.3/8.11.3) with ESMTP id t31JHvD11511	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 1 Apr 2015 12:17:57 -0700
	(PDT)	(envelope-from gshastri@juniper.net)
From: Gaurang Shastri <gshastri@juniper.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 1 Apr 2015 12:21:39 -0700
Message-ID: <1427916099-30314-1-git-send-email-gshastri@juniper.net>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:66.129.239.17; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(36756003)(92566002)(46102003)(33646002)(77096005)(16796002)(2351001)(6806004)(87936001)(50986999)(62966003)(77156002)(15975445007)(50226001)(110136001)(19580395003)(105596002)(86362001)(50466002)(107886001)(48376002)(450100001)(106466001)(19580405001)(47776003)(53416004)(575784001)(229853001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR05MB132;
	H:P-EMF03-SAC.jnpr.net; FPR:; SPF:SoftFail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR05MB132;
X-Microsoft-Antispam-PRVS: <BL2PR05MB132E0DD061CEA2FABADA20AD5F30@BL2PR05MB132.namprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BL2PR05MB132; BCL:0;
	PCL:0; RULEID:; SRVR:BL2PR05MB132; 
X-Forefront-PRVS: 053315510E
X-OriginatorOrg: juniper.net
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2015 19:17:58.1823 (UTC)
X-MS-Exchange-CrossTenant-Id: bea78b3c-4cdb-4130-854a-1d193232e5f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bea78b3c-4cdb-4130-854a-1d193232e5f4;
	Ip=[66.129.239.17]; Helo=[P-EMF03-SAC.jnpr.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR05MB132
Subject: [[meta-filesystems][Add xorriso support]] Add xorriso tool support
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
X-List-Received-Date: Wed, 01 Apr 2015 20:51:56 -0000
Content-Type: text/plain

xorriso copies file objects from POSIX compliant filesystems into
Rock Ridge enhanced ISO 9660 filesystems and allows session-wise
manipulation of such filesystems.

Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
---
 .../recipes-utils/xorriso/xorriso_1.3.8.bb         |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb

diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
new file mode 100644
index 0000000..93914b4
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
@@ -0,0 +1,17 @@
+DESCRIPTIONS = "xorriso copies file objects from POSIX compliant filesystems into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise manipulation of such filesystems"
+
+inherit autotools
+
+DEPENDS += "attr zlib"
+
+SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "a0fc534ef8f9589282a189f0e6cdf952"
+SRC_URI[sha256sum] = "901204634651533f7cbd105eab560534702458258529aac4b2f0fc946992107e"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE = "GPLv3"
+
+EXTRA_OECONF = "--disable-libacl"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.9.5


