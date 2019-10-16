Return-Path: <mns@gomspace.com>
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80119.outbound.protection.outlook.com [40.107.8.119])
	by mail.openembedded.org (Postfix) with ESMTP id C7CE77DE8F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:01:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=P8AjN+VKa3bV7ZqykZ/1lxwmmNuhUGjhVD81ur0oIiv1gXL6SuZ/38ljQbfqINsnoQurMp7Do1rZ9+kSHJU09/nSs29x+toWp4qQMnBuYhA+wAc3rDlL+0KnJhNh3aZbxlQDeMLpMvHtlgHlVv/gE/+UOXhfSgv/L/Pe+OQ6pqYzJfNXMU8Cb7YFp/eXpnm8UAVRYOKbWT/XSF2XPKXWgf5xURoNq5WLTta7pr1MbGc4Fokk7Ldd3nSbWDacNmSK5dFghBD3x5z365vRsdePYJrn+PARR98aC29qlu7TlhqTz/NYfIXnPA1jH20pVW2qgYnxXj4mVlnX7SeamSotKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PxFZrS4V6f0zqJhzgV6IXzp0S3KpWry+gYwLsHnsC/w=;
	b=fcAa4iEOBeyDRUPmp9BHHr9m/ZHo5LWcRlo2O07cAKPGKcuCRSknGxLwsJtLA9fr7oeKqE/tqCCDwq44VQkS2zsoBr9020tJag2bdPL+MiwkEPrDInfzsUy2Z4xEzKk5768/ytA/Hdp6vzTP+kNLQlZbc3ZMgM5lh5FsYRSSbTbqgdbuJgtACMHxyZ7KG9WOnhITIev1v0ClCp8Og9WhkfMr/YO+WwScZnmTCRWUrSUef0bQ7VZAUdMF6OzP2sB4FS8WQ2Z4E4dO0fdKA/3mJqYUviUpSuxcooDVl304ITzdVZYmi81BMh0O2LvQkT6w3QcZ5VyGywUN16M+VTQ6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PxFZrS4V6f0zqJhzgV6IXzp0S3KpWry+gYwLsHnsC/w=;
	b=ODeAUnZvnioBXfobN9dlWfUK/bRo8L0bizToiRox4NTBXglmhys5WJSdTb3QC6FbGZCPfQVBQX/Y0ZIGYJWa/w5vkeo+KBJpVzxsLroi6IhrvEZvg9VftFrv7BQF2l4+xCT0krlmqDa89Ea91+q8Fj5Yq/TN3nNS1LtXXLGlL4w=
Received: from VE1PR08CA0032.eurprd08.prod.outlook.com (2603:10a6:803:104::45)
	by DB8PR08MB4042.eurprd08.prod.outlook.com (2603:10a6:10:a4::31) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19;
	Wed, 16 Oct 2019 11:01:11 +0000
Received: from HE1EUR01FT026.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::209) by VE1PR08CA0032.outlook.office365.com
	(2603:10a6:803:104::45) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via
	Frontend Transport; Wed, 16 Oct 2019 11:01:10 +0000
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
	HE1EUR01FT026.mail.protection.outlook.com (10.152.0.158) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.20.2347.16 via Frontend Transport; Wed, 16 Oct 2019 11:01:10 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Wed, 16 Oct 2019 13:01:09 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Oct 2019 13:00:55 +0200
Message-ID: <20191016110057.11406-1-mns@gomspace.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.8.211]
X-ClientProxiedBy: Ex01.gomspace.lan (10.0.1.60) To Ex01.gomspace.lan
	(10.0.1.60)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(136003)(39840400004)(396003)(376002)(346002)(1110001)(339900001)(189003)(199004)(47776003)(5660300002)(40036005)(76130400001)(26005)(186003)(7736002)(305945005)(86362001)(16526019)(1076003)(336012)(6666004)(356004)(70586007)(33026002)(48376002)(70206006)(50466002)(36756003)(8936002)(316002)(21086003)(508600001)(2351001)(3846002)(6116002)(6916009)(16586007)(2906002)(386003)(26826003)(126002)(476003)(2616005)(486006)(53416004)(107886003)(50226002)(81156014)(51416003)(8676002)(81166006)(4326008)(105606002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB4042; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b8af0b5-494a-40c3-1fee-08d7522826f4
X-MS-TrafficTypeDiagnostic: DB8PR08MB4042:
X-Microsoft-Antispam-PRVS: <DB8PR08MB4042A7120856ED6A8ECB6BABC4920@DB8PR08MB4042.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-Forefront-PRVS: 0192E812EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XWTNukjGqMv+IqrNqugZe/a/Ap7EWoJ9AhqP2ksvdMCwaBhiPjLnbTJsWgjAkMkT1gdSmKgzDA2acjCJTh+UDvE6a+DuKPrV71Z9PtO94fkNt6ozx/hqHHfFm3SX+YZRoEV9WTHeTm4lxmHTas/o6bh/A3qOpN9qbz+eYfW+7xLbmNT/pJbzAwL1j4ExWiP+4MhUhoeQ87d9ODoCoiy8H9cPwQSRZdze5FzZLlmHnkj8pCXbx89vGfMWz7IziL2o/E7U6brn8y0049Jx2vyua2YlzqyrBd9ysaHWyGnhbkYM91dG5IO9/fLXQUv1tSZdyLUPgdBx4rPo6lx4h49uhXnlWXFm92XYLPQcCH4m5Qd8XRNH0y65ifIcwgJcBwWIMqkaDMaFZ6VUbp6gympqb1tVGrr9jTr7QNNlszrDUko=
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 11:01:10.0696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8af0b5-494a-40c3-1fee-08d7522826f4
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4042
Cc: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH 1/3] Revert "libiio: fix build of python bindins"
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
X-List-Received-Date: Wed, 16 Oct 2019 11:01:13 -0000
Content-Type: text/plain

This reverts commit b0caf1fb82b90a6b123ba4463a8405568eda0389.

 * bindings are build through the variant 'libiio-python' and is not
   intended installed as part of just 'libiio'

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index cc0efccf9..5d422520b 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -24,11 +24,10 @@ EXTRA_OECMAKE = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
 "
 
-PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND PYTHON_BINDINGS"
+PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
 
 PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
 PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
-PACKAGECONFIG[PYTHON_BINDINGS] = ",,python"
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
 
-- 
2.17.1


