Return-Path: <Lauren.Post@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0239.outbound.protection.outlook.com [207.46.163.239])
	by mail.openembedded.org (Postfix) with ESMTP id B5DF960559
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 17:27:29 +0000 (UTC)
Received: from BLUPR03CA028.namprd03.prod.outlook.com (10.141.30.21) by
	DM2PR03MB557.namprd03.prod.outlook.com (10.141.82.152) with Microsoft
	SMTP Server (TLS) id 15.0.954.9; Fri, 27 Jun 2014 17:27:28 +0000
Received: from BY2FFO11FD018.protection.gbl (2a01:111:f400:7c0c::137) by
	BLUPR03CA028.outlook.office365.com (2a01:111:e400:879::21) with
	Microsoft SMTP Server (TLS) id 15.0.974.11 via Frontend Transport;
	Fri, 27 Jun 2014 17:27:27 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD018.mail.protection.outlook.com (10.1.14.106) with Microsoft
	SMTP Server (TLS) id 15.0.969.12 via Frontend Transport;
	Fri, 27 Jun 2014 17:27:27 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s5RHRQJT023509;
	Fri, 27 Jun 2014 10:27:26 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Jun 2014 12:13:16 -0500
Message-ID: <1403889196-11872-1-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <lauren.post@freescale.com>
References: <lauren.post@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(104016002)(107046002)(85306003)(48376002)(81542001)(74502001)(62966002)(83072002)(92726001)(105606002)(95666004)(64706001)(81156004)(36756003)(50466002)(33646001)(85852003)(77156001)(102836001)(229853001)(81342001)(87286001)(20776003)(31966008)(26826002)(47776003)(74662001)(87936001)(15202345003)(79102001)(106466001)(80022001)(68736004)(83322001)(19580405001)(6806004)(19580395003)(84676001)(44976005)(15395725005)(15975445006)(21056001)(4396001)(69596002)(104166001)(89996001)(92566001)(99396002)(97736001)(86362001)(88136002)(46102001)(77982001)(575784001)(50986999)(76176999)(76482001)(50226001)(93916002)(2351001);
	DIR:OUT; SFP:; SCL:1; SRVR:DM2PR03MB557;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BL:0; ACTION:Default; RISK:Low; SCL:0; SPMLVL:NotSpam;
	PCL:0; RULEID:
X-Forefront-PRVS: 0255DF69B9
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=Lauren.Post@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3] cpuburn-neon: Upgrade to version 20140626
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
X-List-Received-Date: Fri, 27 Jun 2014 17:27:33 -0000
Content-Type: text/plain

Previous location is no longer accessible and breaks builds that include
cpuburn-neon.  This updates the location to fix the build breaks

Signed-off-by: Lauren Post <lauren.post@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

---
 ...n-neon_20120610.bb => cpuburn-neon_20140626.bb} |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-benchmark/cpuburn/{cpuburn-neon_20120610.bb => cpuburn-neon_20140626.bb} (69%)

diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb
similarity index 69%
rename from meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
rename to meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb
index 8ec5e95..14e3fc4 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb
@@ -8,17 +8,18 @@ DL_DIR_append = "/${PN}-${PV}"
 COMPATIBLE_MACHINE = "(${@bb.utils.contains("TUNE_FEATURES", "neon", "${MACHINE}", "Invalid!", d)})"
 
 SRC_URI = "http://hardwarebug.org/files/burn.S;name=mru \
-           http://github.com/downloads/ssvb/ssvb.github.com/ssvb-cpuburn-a8.S;name=ssvb"
+           https://raw.githubusercontent.com/ssvb/cpuburn-arm/dd5c5ba58d2b0b23cfab4a286f9d3f5510000f20/cpuburn-a8.S;name=ssvb"
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


