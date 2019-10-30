Return-Path: <mns@gomspace.com>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40094.outbound.protection.outlook.com [40.107.4.94])
	by mail.openembedded.org (Postfix) with ESMTP id 053BF7FA28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 13:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=f01rF1PnwwqY5BWmH+6JQldChly786XYj+qRE1FesqE0ZBDJ7riHj2Y3T2oL9hOqXdTsUSrIJaqLs/oZlIYGYuV6/kCkWNKZbNe6IejJP/V1uSCTV42JD5UeOzsoatAd8/kkAkunLAatfW7Q4PSONkz6AR6+Jx3YCf/ueAgrcEt0cX0U6QYQntZcVN29WTr+QGyXTTDqYRjJqNC//zA66pb8DOr5Xlfcf7KYS1e/yy1lIHnsV8VErIN2weYq/MsJInHJQvFs5I19/3by770rwESEy40L4YnVJbcgRj2CFXK2YWXDZwBFKZINRZm6ekkSEcdyj0lCkZtsRS98IbPP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=au4pJFM0KQBreAUic3ZCf5sESL/CICmr/cWH9dB83ng=;
	b=NPLfdvgsqn38jjyW3c0EQ/bRS8nzQ353MrKzaaOCRLyNLW7g/pfK1MHp6iwTAinbKTCo4j5Kg1pAabT3eRHki2YI/FbVViI15b2pDjocNzjRLTNoHZ8nZ26YFzH/dDAexEFnxQmAXWk/oA3z3kwVaF8jRWTsl36T7hnoxJ90QmmK+/QzTbpWx8ro7/SH/jnGDPHCHvQoIdywLvPyMCSemE7NpvIfovAo2Sr62KjoQ/mhmLDiqHy89xZp+FXnGElkRkAoCdMrKjBixsAIWEff6wN4c6kDVezDnJBH08ujuHsK3VEH3iY2t/4nzj/EzL/REQcqC7cUHf6HK2GMdEUpSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=au4pJFM0KQBreAUic3ZCf5sESL/CICmr/cWH9dB83ng=;
	b=ok+W/rp8S6uj1sJVHPjE4jle6jcxgfID6RPQS8W0W2Gh6Zkd8VYObmYX7LuOqwa+GWuiw7TPGCrQ26+7rA/k+m8Xk6AShl9Nc43qZYOHu7Xr7ztf7Np5rKkGsIL8Wd7TaeB5PdX3LbMPeWdI7qh0trhjp/mGZScX6DPEjqhFPkw=
Received: from AM6PR08CA0004.eurprd08.prod.outlook.com (2603:10a6:20b:b2::16)
	by VI1PR08MB3326.eurprd08.prod.outlook.com (2603:10a6:803:49::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.19;
	Wed, 30 Oct 2019 13:40:46 +0000
Received: from DB5EUR01FT003.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e02::200) by AM6PR08CA0004.outlook.office365.com
	(2603:10a6:20b:b2::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17 via
	Frontend Transport; Wed, 30 Oct 2019 13:40:46 +0000
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
	DB5EUR01FT003.mail.protection.outlook.com (10.152.4.101) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 13:40:46 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Wed, 30 Oct 2019 14:40:46 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Oct 2019 14:40:26 +0100
Message-ID: <20191030134026.19734-1-mns@gomspace.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.8.211]
X-ClientProxiedBy: Ex01.gomspace.lan (10.0.1.60) To Ex01.gomspace.lan
	(10.0.1.60)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(136003)(39840400004)(346002)(376002)(396003)(1110001)(339900001)(189003)(199004)(2616005)(336012)(476003)(126002)(21086003)(16526019)(6916009)(76130400001)(40036005)(16586007)(6666004)(2906002)(356004)(26005)(33026002)(47776003)(186003)(486006)(316002)(70206006)(70586007)(386003)(4326008)(2351001)(51416003)(105606002)(305945005)(8936002)(81166006)(1076003)(508600001)(50226002)(36756003)(5660300002)(3846002)(50466002)(7736002)(107886003)(8676002)(6116002)(86362001)(26826003)(48376002)(81156014)(53416004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR08MB3326; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b026083-e0da-400c-40a5-08d75d3ec49f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3326:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3326E5067CCDE9C71122973EC4600@VI1PR08MB3326.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1vgGI1B46N6NKoMeLozvUE5o1HsXUx1mvzbcJklprcJv+u6F1pb70XzJ7RM8VhHV82z9JT7WYPz9gKnhC6dLsB7xaohYf/OFCmuM5OPWXrnPJDwbLeOqpDI8jIMJZT/ja16mdWsPTOt9dpL3ONy5Mcy6lESs627RIRjC8yinv4s9Uf81L7mcpTQVurXqynqGGLwA6WeHv+33WbRR7FYHRCdF+ecrm35PNldp1uSpnhVieEU58La51tg7C/qrP6hWJ+KRGEk2M7+8RqMJh3gT6e129/HH/Mc7ImB6+N74/zHzHNLU9zyMglo9hVrAU9kJsWoiwRSneQTwZnUZlkT9hdz1w7C8GYA79Az6xP8OOAfy6+p1nBiP5yj2BTPCvnFruuh6Q5zhQAKiZ0TVwZ7+yWpRHr+Mjx8KJTk3U1WQk0MnT/uUZpowq//j2c9OgS3k
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 13:40:46.3400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b026083-e0da-400c-40a5-08d75d3ec49f
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3326
Cc: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH v3] libiio: add python3 packageconfig
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
X-List-Received-Date: Wed, 30 Oct 2019 13:40:48 -0000
Content-Type: text/plain

 * used for enabling python bindings - note that behavior is changed
   from 'opt-out' to 'opt-in'

 * config is used for potentially inheriting distutils3-base

 * also decapitalize packageconfig names similar to other recipes

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index e6e0eaef8..b53ba4647 100644
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
+PACKAGECONFIG ??= "usb_backend network_backend"
 
-PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
-PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
+PACKAGECONFIG[usb_backend] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
+PACKAGECONFIG[network_backend] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
+PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'distutils3-base', '', d)}
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
 
-- 
2.17.1


