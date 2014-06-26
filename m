Return-Path: <Lauren.Post@freescale.com>
X-Greylist: delayed 927 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Jun 2014 15:07:27 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(dns-bn1lp0143.outbound.protection.outlook.com [207.46.163.143])
	by mail.openembedded.org (Postfix) with ESMTP id 16F616028A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 15:07:27 +0000 (UTC)
Received: from BN3PR0301CA0076.namprd03.prod.outlook.com (25.160.152.172) by
	DM2PR03MB560.namprd03.prod.outlook.com (10.141.83.19) with Microsoft
	SMTP Server (TLS) id 15.0.954.9; Thu, 26 Jun 2014 14:51:59 +0000
Received: from BL2FFO11FD060.protection.gbl (2a01:111:f400:7c09::173) by
	BN3PR0301CA0076.outlook.office365.com (2a01:111:e400:401e::44) with
	Microsoft SMTP Server (TLS) id 15.0.969.15 via Frontend Transport;
	Thu, 26 Jun 2014 14:51:58 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD060.mail.protection.outlook.com (10.173.161.188) with
	Microsoft SMTP Server (TLS) id 15.0.969.12 via Frontend Transport;
	Thu, 26 Jun 2014 14:51:58 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s5QEpv5Q023669;
	Thu, 26 Jun 2014 07:51:57 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Jun 2014 09:37:45 -0500
Message-ID: <1403793465-6376-1-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <Lauren.Post@freescale.com>
References: <Lauren.Post@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(76482001)(50466002)(4396001)(77982001)(20776003)(47776003)(50226001)(15202345003)(33646001)(48376002)(36756003)(105606002)(15395725005)(95666004)(104016002)(84676001)(87936001)(104166001)(87286001)(85852003)(83072002)(21056001)(81156004)(92566001)(64706001)(77156001)(92726001)(80022001)(31966008)(6806004)(74662001)(79102001)(74502001)(83322001)(81342001)(19580395003)(19580405001)(89996001)(69596002)(46102001)(68736004)(44976005)(97736001)(85306003)(93916002)(86362001)(106466001)(575784001)(88136002)(99396002)(62966002)(107046002)(76176999)(50986999)(102836001)(26826002)(15975445006)(81542001);
	DIR:OUT; SFP:; SCL:1; SRVR:DM2PR03MB560;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BL:0; ACTION:Default; RISK:Low; SCL:0; SPMLVL:NotSpam;
	PCL:0; RULEID:
X-Forefront-PRVS: 02543CD7CD
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=Lauren.Post@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] cpuburn-neon: Upgrade to 2014066 version to fix build break
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
X-List-Received-Date: Thu, 26 Jun 2014 15:07:36 -0000
Content-Type: text/plain

Replace SRC_URI with new location, md5sum and new name since previous download
will not work.  Without this fix cpuburn-neon has a broken build.

Signed-off-by: Lauren Post <lauren.post@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...n-neon_20120610.bb => cpuburn-neon_20140626.bb} |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-benchmark/cpuburn/{cpuburn-neon_20120610.bb => cpuburn-neon_20140626.bb} (72%)

diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb
similarity index 72%
rename from meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
rename to meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb
index 8ec5e95..ed1f1ee 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb
@@ -8,17 +8,18 @@ DL_DIR_append = "/${PN}-${PV}"
 COMPATIBLE_MACHINE = "(${@bb.utils.contains("TUNE_FEATURES", "neon", "${MACHINE}", "Invalid!", d)})"
 
 SRC_URI = "http://hardwarebug.org/files/burn.S;name=mru \
-           http://github.com/downloads/ssvb/ssvb.github.com/ssvb-cpuburn-a8.S;name=ssvb"
+           https://github.com/ssvb/cpuburn-arm/raw/master/cpuburn-a8.S;name=ssvb"
+
 SRC_URI[mru.md5sum] = "823abc72c2cd448e87df9bc5355a4456"
 SRC_URI[mru.sha256sum] = "01d9fc04f83740c513c25401dcc89c11b2a5a6013e70bfca42b7b02129f88cd2"
-SRC_URI[ssvb.md5sum] = "0acc570d943c41c7f8602b9ff6fa111d"
-SRC_URI[ssvb.sha256sum] = "bfddd3226a499ffdf71bb58c05ccdc6dac5bb2c2c3bdb10ac610ee0b60aac087"
+SRC_URI[ssvb.md5sum] = "ba0ef2939a3b3b487523448c67544e94"
+SRC_URI[ssvb.sha256sum] = "ce42ebdc71c876a33d9f7534355ef76cefa0d00ddb19ad69cf05a266c861d08d"
 
 S = "${WORKDIR}"
 
 do_compile() {
     ${CC} ${CFLAGS} ${LDFLAGS} burn.S -o burn
-    ${CC} ${CFLAGS} ${LDFLAGS} ssvb-cpuburn-a8.S -o burn-neona8
+    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a8.S -o burn-neona8
 }
 
 do_install() {
-- 
1.7.9.5


