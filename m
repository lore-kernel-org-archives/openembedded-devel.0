Return-Path: <mns@gomspace.com>
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80097.outbound.protection.outlook.com [40.107.8.97])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4807FBC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=OdylZigl7WWLXkFqigDbyQ5+op+cQqgnTWOz+QtUbuUZI0HFjxe7/KJO98NLsMWHP2CiAIVDpJPs70xsGuvSyhjovu80jPCdb/RP1wug5s2G4ZmZIwyuFPptBlvj41szFEcS47vjZcIKNCiGmLzeS1KRtiaFdVB5fg8xQepeQYdhRoIA2v5Mrx4j5+CAtLtpkfvYcgULq0m4ynOUuVWbfzjARG0v0o3yjWlwUzyVPYzMBf8ZXnu2fn9apAOfmRhIOr9D41iiACRxozSfHKXx/5ATl1nG6oYU6T75L+bXnIxRxY+QUbu596SiJPqZNt9b1QTEzwFgt5tetNuR049keg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eaTlqmWZQOK1IGsSO5oP90JoNt5MJWyBpPy8P5i71dM=;
	b=kq6N3U5NsoCLTG4c9eOfXEt+lzszdC9EXfZurGrfsmvV6/zitwQLNdCqyqwuCoSyL1IfxwDuzA6Gi66/E8FH0yWAR3r/X0aTHERhDmGDybgyZLOVV3INBvfgHRjfoG70m7ZEWRza9pRBOTWN0hCcQ/d3tmxIO4i04Jn5MZ4hmFbFDKERR5jVrLr/JcDoTTRcq1SDbUm9vx5cHLbPtVzrbiRHoLquE2fh/b5G9UFvVe2h/LNB2REdlZuhk0DQZQBEfPkp+8h9P5Ece0JdYfiAuWhuL0bb0oFrhXg2IgUM5pjVKU8ihvt8uP13iPV9+9dc7hnQu3plKQCjdrtVemur/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eaTlqmWZQOK1IGsSO5oP90JoNt5MJWyBpPy8P5i71dM=;
	b=JwQ9lJmdk49WDyTogYoSnTL0L178DMv3BxGwdSTjb3vn55xjclU2kibHwiO6KioiVWfkPaLmXvbOTkIPFbHhOqBL/sEAxE9MiopYhnK2Xi8taHqDXLMfJfVeC07g8QBfA1qda6Aze5LSTc4SjZf0Dzc9VHu3ivgAE04nIIKzUQ0=
Received: from DB7PR08CA0061.eurprd08.prod.outlook.com (2603:10a6:10:26::38)
	by DB8PR08MB4201.eurprd08.prod.outlook.com (2603:10a6:10:a3::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.25;
	Tue, 29 Oct 2019 10:21:06 +0000
Received: from HE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::206) by DB7PR08CA0061.outlook.office365.com
	(2603:10a6:10:26::38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.22 via
	Frontend Transport; Tue, 29 Oct 2019 10:21:06 +0000
Authentication-Results: spf=fail (sender IP is 79.171.149.172)
	smtp.mailfrom=gomspace.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=gomspace.com;
Received-SPF: Fail (protection.outlook.com: domain of gomspace.com does not
	designate 79.171.149.172 as permitted sender)
	receiver=protection.outlook.com; client-ip=79.171.149.172;
	helo=gomspace.com; 
Received: from gomspace.com (79.171.149.172) by
	HE1EUR01FT039.mail.protection.outlook.com (10.152.0.222) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 10:21:06 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Tue, 29 Oct 2019 11:21:05 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Oct 2019 11:20:00 +0100
Message-ID: <20191029102000.11329-1-mns@gomspace.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.8.211]
X-ClientProxiedBy: Ex01.gomspace.lan (10.0.1.60) To Ex01.gomspace.lan
	(10.0.1.60)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(376002)(39840400004)(136003)(346002)(396003)(1110001)(339900001)(189003)(199004)(50466002)(4326008)(7736002)(14444005)(305945005)(36756003)(53416004)(107886003)(2906002)(81156014)(6916009)(16586007)(81166006)(48376002)(70586007)(21086003)(86362001)(8936002)(33026002)(8676002)(51416003)(50226002)(70206006)(316002)(47776003)(26826003)(186003)(16526019)(486006)(508600001)(40036005)(386003)(26005)(6116002)(3846002)(2616005)(476003)(126002)(1076003)(356004)(6666004)(2351001)(105606002)(336012)(76130400001)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB4201; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cf93c40-1e21-451a-67e8-08d75c59b56a
X-MS-TrafficTypeDiagnostic: DB8PR08MB4201:
X-Microsoft-Antispam-PRVS: <DB8PR08MB4201C0F9AE59BA751CE88332C4610@DB8PR08MB4201.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VFJ6lJp/7xewSyPo18JaF5qawK1eM+mBnSi8OjkTzilB2vwrRVOkBlhze8UqfqffSzWg2iQjZf8QjS100JOSQwyONqp1N39f46VN55v1XbN1elyClYFG937SMiGIXpkGnDBU0E5H86BSpOkIg2V6jSu5XIsw+8F3DMqgXEHrdxIK0hzCUmGaOopdHMnEi36LUiLQZIfmgYtiZgWzU1HJqwuyIeP0J3FYj+zvO5RTrkmEX3h7Br4R9Q8soGdQlwE+imrlM+XvePOXVSQyGGvzj3hRhj4bHZxvrCyYXQe+dPHQtKK/SaP5mYGKiWaLlxpteIB1qbzoKOccGRYhOrEtnbMDHC39m7KhTgiyNl9ewfRc2ig37e+DuRcWKXeef9daBo5m48+wzb+tpjO7oqHeiXRuc185fcfz6lDg25wG5mw/9M7eiSAWRGr3EDG+o4Dz
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 10:21:06.0547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf93c40-1e21-451a-67e8-08d75c59b56a
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4201
Cc: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH v2] libiio: Conditionally inherit distutils3-base
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
X-List-Received-Date: Tue, 29 Oct 2019 10:21:08 -0000
Content-Type: text/plain

 * inherit only when libiio-python3 is build.

 * also add PACKAGECONFIG variant that allows python bindings to be
   enabled and disabled. It adheres to the current CMake logic and
   defaults to an 'out-out' approach.

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index e6e0eaef8..ec3a39de1 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-inherit cmake python3native systemd distutils3-base
+inherit cmake python3native systemd
 
 DEPENDS = " \
     flex-native bison-native libaio \
@@ -25,10 +25,13 @@ EXTRA_OECMAKE = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
 "
 
-PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
+PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND PYTHON_BINDINGS"
 
 PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
 PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
+PACKAGECONFIG[PYTHON_BINDINGS] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'distutils3-base', '', d)}
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
 
-- 
2.17.1


