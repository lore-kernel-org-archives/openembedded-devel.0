Return-Path: <aehs29@gmail.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720086.outbound.protection.outlook.com [40.107.72.86])
	by mail.openembedded.org (Postfix) with ESMTP id BC4867F2B1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Sep 2019 07:13:50 +0000 (UTC)
Received: from DM6PR02CA0106.namprd02.prod.outlook.com (2603:10b6:5:1f4::47)
	by MN2PR02MB6432.namprd02.prod.outlook.com (2603:10b6:208:184::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14;
	Sun, 8 Sep 2019 07:13:50 +0000
Received: from BL2NAM02FT064.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by DM6PR02CA0106.outlook.office365.com
	(2603:10b6:5:1f4::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.17 via
	Frontend Transport; Sun, 8 Sep 2019 07:13:50 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
	smtp.mailfrom=gmail.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
	gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT064.mail.protection.outlook.com (10.152.77.119) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2241.14
	via Frontend Transport; Sun, 8 Sep 2019 07:13:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <aehs29@gmail.com>)
	id 1i6rOO-0001qH-0I; Sun, 08 Sep 2019 00:13:48 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <aehs29@gmail.com>)
	id 1i6rOI-0004vS-RP; Sun, 08 Sep 2019 00:13:42 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x887Dfus029405; Sun, 8 Sep 2019 00:13:42 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <aehs29@gmail.com>)
	id 1i6rOH-0004vP-Tp; Sun, 08 Sep 2019 00:13:41 -0700
From: Alejandro Hernandez <aehs29@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Sep 2019 00:13:28 -0700
Message-Id: <1567926808-15086-1-git-send-email-aehs29@gmail.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--10.963-7.0-31-1
X-imss-scan-details: No--10.963-7.0-31-1;No--10.963-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132124004304490006;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(376002)(39860400002)(346002)(136003)(2980300002)(199004)(189003)(8676002)(2351001)(336012)(55446002)(73392003)(48376002)(50466002)(70206006)(70586007)(82202003)(6916009)(2906002)(316002)(9786002)(5660300002)(16586007)(51416003)(76482006)(26005)(4326008)(86362001)(6306002)(36756003)(356004)(107886003)(305945005)(8936002)(81156014)(50226002)(47776003)(6666004)(2616005)(81166006)(2361001)(61266001)(426003)(476003)(486006)(498600001)(126002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR02MB6432; H:xsj-pvapsmtpgw01;
	FPR:; SPF:SoftFail; LANG:en; PTR:unknown-60-83.xilinx.com; A:1;
	MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b395297a-a410-4cbf-2102-08d7342c194c
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(5600166)(711020)(4605104)(1401327)(2017052603328);
	SRVR:MN2PR02MB6432; 
X-MS-TrafficTypeDiagnostic: MN2PR02MB6432:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <MN2PR02MB64321C1C4250F44159AF7737CFB40@MN2PR02MB6432.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-Forefront-PRVS: 0154C61618
X-Microsoft-Antispam-Message-Info: 2ImnB0hTQB+CFIsrNrYMgR+Du0SERP51Vjd1DVhgdqBc2U3HOvV5gZ5ixsAxBcaOuWR+0Fp09guVXKuvCcuqyA3ppzBYvlB+a0+hOE7bHGRgi3+ADO0UFmV+WCR74LJq+HfRJh+3EqdXkPvITMX56l6ePHDIYP5RcPl0O4yFNDPSh6lzHNkQ4ebfxewOa0X4STtlbCH14NeYgIs+0liBibECOl7RdyK/1Pvyvz9D1xixGNDm6vX+SE6OFoJOrH6KESpRKJ71P52B9gPA4rgbEbAQfhfxDi8b+OTjHMg8BefqzodIBGI9fR1kSGJNKumcDpU83tm4ypj8I0rqYvz95B62DHxxo9ZhRwMkearJ6W5FTVeDt+K7FLWPwyPwdMWaWrGXDktYw3h29ziuzs5VtZwHt7hw7gifC6Ce32SDbeU=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2019 07:13:50.2098 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b395297a-a410-4cbf-2102-08d7342c194c
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6432
Subject: [meta-oe][PATCH] remmina: Fix spice protocol dependency and configuration
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
X-List-Received-Date: Sun, 08 Sep 2019 07:13:51 -0000
Content-Type: text/plain

Spice is only compatible with x86 architectures, its dependency triggers
a build error on other archs since the build system isnt able to find a
provider for it.

Fix dependencies to only include spice when an x86 architecture is being
built, and configure the package accordingly.

Signed-off-by: Alejandro Hernandez <aehs29@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index b95c400..cd6bc14 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -3,7 +3,10 @@ HOMEPAGE = "https://remmina.org"
 SECTION = "Support"
 LICENSE = "GPLv2 & openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
-DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver spice spice-protocol libsecret"
+DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver libsecret"
+
+DEPENDS_append_x86 = " spice spice-protocol"
+DEPENDS_append_x86-64 = " spice spice-protocol"
 
 DEPENDS_append_libc-musl = "libexecinfo"
 LDFLAGS_append_libc-musl = " -lexecinfo"
@@ -17,7 +20,11 @@ S = "${WORKDIR}/Remmina-v${PV}"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
+EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF -DWITH_SPICE=OFF"
+
+EXTRA_OECMAKE_append_x86 = " -DWITH_SPICE=ON"
+EXTRA_OECMAKE_append_x86-64 = " -DWITH_SPICE=ON"
+
 
 do_install_append(){
     # We dont need the extra stuff form other desktop environments
@@ -29,5 +36,3 @@ do_install_append(){
 RDEPENDS_${PN} = "bash"
 
 FILES_${PN}_append = " ${datadir}/icons/hicolor/*"
-
-COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
-- 
2.7.4


