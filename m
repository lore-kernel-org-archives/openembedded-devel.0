Return-Path: <aehs29@gmail.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
	by mail.openembedded.org (Postfix) with ESMTP id CB0CF7E26B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 22:58:08 +0000 (UTC)
Received: from CY4PR02CA0037.namprd02.prod.outlook.com (2603:10b6:903:117::23)
	by BL0PR02MB4547.namprd02.prod.outlook.com (2603:10b6:208:4a::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19;
	Wed, 4 Sep 2019 22:58:07 +0000
Received: from CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by CY4PR02CA0037.outlook.office365.com
	(2603:10b6:903:117::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via
	Frontend Transport; Wed, 4 Sep 2019 22:58:07 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.100)
	smtp.mailfrom=gmail.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
	gmail.com discourages use of 149.199.60.100 as permitted sender)
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT021.mail.protection.outlook.com (10.152.75.187) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2241.14
	via Frontend Transport; Wed, 4 Sep 2019 22:58:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:43162
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <aehs29@gmail.com>)
	id 1i5eE0-0003UR-Kx; Wed, 04 Sep 2019 15:58:04 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <aehs29@gmail.com>)
	id 1i5eDv-0003vP-Gm; Wed, 04 Sep 2019 15:57:59 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x84Mvwo2002298; Wed, 4 Sep 2019 15:57:58 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <aehs29@gmail.com>)
	id 1i5eDu-0003vL-Bj; Wed, 04 Sep 2019 15:57:58 -0700
From: Alejandro Hernandez <aehs29@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Sep 2019 15:57:57 -0700
Message-Id: <1567637877-16295-1-git-send-email-aehs29@gmail.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--13.916-7.0-31-1
X-imss-scan-details: No--13.916-7.0-31-1;No--13.916-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132121114869583026;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(376002)(396003)(136003)(2980300002)(189003)(199004)(9786002)(6306002)(36756003)(107886003)(76482006)(4326008)(66574012)(51416003)(82202003)(26005)(81156014)(2906002)(356004)(81166006)(50226002)(8936002)(5660300002)(8676002)(498600001)(305945005)(61266001)(73392003)(336012)(426003)(486006)(50466002)(47776003)(126002)(2616005)(476003)(316002)(16586007)(6916009)(48376002)(70206006)(70586007)(86362001)(2361001)(55446002)(2351001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4547; H:xsj-pvapsmtpgw02;
	FPR:; SPF:SoftFail; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fa278f9-6760-4789-adc5-08d7318b598e
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(5600166)(711020)(4605104)(1401327)(2017052603328);
	SRVR:BL0PR02MB4547; 
X-MS-TrafficTypeDiagnostic: BL0PR02MB4547:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <BL0PR02MB45478C7DF8B5A3E1C2DE8909CFB80@BL0PR02MB4547.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-Forefront-PRVS: 0150F3F97D
X-Microsoft-Antispam-Message-Info: zQ0GNryjkiPSHx6X2Rnigk11VIERCinzqqbMBLa++vzAwBzL3f3gcceJ7UPwo6aG16pQfv+qAvQPGuZAmT2d93d3tlejH1LYvCmph0tA/BGXYLzmwGpPOWI7OgFiMHAMjwTI7EgfrsPRg06/lVYMFn0j8M72SuSS+YYK4cI3kzcU6AZLxS8y/JSnzm3bLf2y+IVS63r2G+2l+s6xsPiFKjsPGnypdZXX8ND87MLORg0kOBEKkFGnu4V8IK6vviAjFMp8mjE3sjtFzu+8XE5wbPfxYv/V1U01XBoL4J8qyhQkPpXlmTskM7zE8ON2GrQFQDK+XoncioiPWiKU9Fx0xMKqJNpOoB7e6BNZ3vhfI5pExN9SxpwyllHxm2SYJxiCcZoF2s0fj5HZYo8ShTuBMKUCzAcjB+8j9+maQOZfQ1g=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2019 22:58:06.7551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa278f9-6760-4789-adc5-08d7318b598e
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4547
Subject: [meta-oe][PATCH v2] remmina: Add recipe for the remmina remote desktop client
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
X-List-Received-Date: Wed, 04 Sep 2019 22:58:09 -0000
Content-Type: text/plain

Remmina has become one of the most widely used RDP clients,
it uses freeRDP 2.0 as a backend and also supports multiple
network protocols like RSP, VNC, SPICE, NX, and SSH.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/remmina/remmina_1.3.6.bb

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
new file mode 100644
index 0000000..a14a259
--- /dev/null
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "A feature rich Remote Desktop Application written in GTK+"
+HOMEPAGE = "https://remmina.org"
+SECTION = "Support"
+LICENSE = "GPLv2 & openssl"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
+DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver spice spice-protocol libsecret"
+
+SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
+"
+SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
+SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea556af1a"
+
+S = "${WORKDIR}/Remmina-v${PV}"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
+
+do_install_append(){
+    # We dont need the extra stuff form other desktop environments
+    rm -rf ${D}/${datadir}/xsessions
+    rm -rf ${D}/${datadir}/metainfo
+    rm -rf ${D}/${datadir}/gnome-session
+}
+
+RDEPENDS_${PN} = "bash"
+
+FILES_${PN}_append = " ${datadir}/icons/hicolor/*"
-- 
2.7.4


