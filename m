Return-Path: <aehs29@gmail.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
	by mail.openembedded.org (Postfix) with ESMTP id B19767EC95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 21:41:07 +0000 (UTC)
Received: from CY4PR02CA0044.namprd02.prod.outlook.com (2603:10b6:903:117::30)
	by SN6PR02MB4559.namprd02.prod.outlook.com (2603:10b6:805:b0::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15;
	Wed, 4 Sep 2019 21:41:00 +0000
Received: from BL2NAM02FT060.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by CY4PR02CA0044.outlook.office365.com
	(2603:10b6:903:117::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13 via
	Frontend Transport; Wed, 4 Sep 2019 21:41:00 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
	smtp.mailfrom=gmail.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
	gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT060.mail.protection.outlook.com (10.152.76.124) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2241.14
	via Frontend Transport; Wed, 4 Sep 2019 21:40:59 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <aehs29@gmail.com>)
	id 1i5d1P-0004Aw-43; Wed, 04 Sep 2019 14:40:59 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <aehs29@gmail.com>)
	id 1i5d1J-00080m-WA; Wed, 04 Sep 2019 14:40:54 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <aehs29@gmail.com>)
	id 1i5d1J-00080j-9D; Wed, 04 Sep 2019 14:40:53 -0700
From: Alejandro Hernandez <aehs29@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Sep 2019 14:40:51 -0700
Message-Id: <1567633251-7502-1-git-send-email-aehs29@gmail.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--13.916-7.0-31-1
X-imss-scan-details: No--13.916-7.0-31-1;No--13.916-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132121068599837034;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(199004)(189003)(6306002)(336012)(9786002)(426003)(73392003)(26005)(126002)(76482006)(2906002)(107886003)(50466002)(2616005)(16586007)(70206006)(48376002)(70586007)(316002)(356004)(305945005)(50226002)(66574012)(2351001)(81166006)(6916009)(82202003)(61266001)(81156014)(8676002)(47776003)(2361001)(498600001)(55446002)(51416003)(486006)(476003)(4326008)(5660300002)(8936002)(86362001)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4559; H:xsj-pvapsmtpgw01;
	FPR:; SPF:SoftFail; LANG:en; PTR:unknown-60-83.xilinx.com; A:1;
	MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64ebe62f-cd79-4818-ed3f-08d7318093a9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(5600166)(711020)(4605104)(1401327)(2017052603328);
	SRVR:SN6PR02MB4559; 
X-MS-TrafficTypeDiagnostic: SN6PR02MB4559:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <SN6PR02MB455985E42B29A09937D4D932CFB80@SN6PR02MB4559.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-Forefront-PRVS: 0150F3F97D
X-Microsoft-Antispam-Message-Info: zkr8aFSaBa3EVLKvsJ+DIM6kRtBdBuwMoDMRcYhd0YpQpgFnaWfc2HKyS+wzzJOctqcBqYjfl+Uqgfcw5MJcz+KFSEXdp3+tHWdB7Vk8cQnkv9GWdNUKXoYsL+tZSuc7nkEuMJPQKF4BtqCbONpUMVWLiKC/wKZ5ZzbQl6lcJi5N0ZJr1gcrbAO7Jx8yE5GeIaBIvFQP6z4GUFDi9b40Ptyua/Y1lV5IS50Tdjb2gW5e7YKZ3EzCcGTboADIHl800w81okxt3hBAXB8gp38Fcez3C1eqMUOVGz1veuXs163D7FvwtyBZsgYcQLBe27JK4IWQtI2egJGxI5/r/UxcsbhtOS6tKdkBVoN+V7fn+kemAE4GUVWmFj9cQZw/PFX4pJ+hlvC0/DijoBkhMVY4AIWeV8Dsgfthn7cNg1gbfdo=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2019 21:40:59.7445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ebe62f-cd79-4818-ed3f-08d7318093a9
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4559
Subject: [meta-oe][PATCH] remmina: Add recipe for the remmina remote desktop client
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
X-List-Received-Date: Wed, 04 Sep 2019 21:41:08 -0000
Content-Type: text/plain

Remmina has become one of the most widely used RDP clients,
it uses freeRDP 2.0 as a backend and also supports multiple
network protocols like RSP, VNC, SPICE, NX, and SSH.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/remmina/remmina_1.3.6.bb

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
new file mode 100644
index 0000000..81514fa
--- /dev/null
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "A feature rich Remote Desktop Application written in GTK+"
+HOMEPAGE = "https://remmina.org"
+LICENSE = "GPLv2 & openssl"
+SECTION = "Support"
+
+SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
+"
+
+S = "${WORKDIR}/Remmina-v${PV}"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
+
+
+SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
+SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea556af1a"
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
+
+DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver spice spice-protocol libsecret"
-- 
2.7.4


