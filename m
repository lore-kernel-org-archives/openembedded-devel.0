Return-Path: <jeffrey.pautler@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D924C4167D
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 16:14:36 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.106])
 by mx.groups.io with SMTP id smtpd.web11.31623.1699632873897755915
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 08:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=AHaxGNJB;
 spf=pass (domain: ni.com, ip: 40.107.94.106, mailfrom: jeffrey.pautler@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+6IjNLan36jnxGr+OB5dgpFhdiuRNz1lnFdtz45qHjwfJJtoxzv7918MltE+sqVBJrJXtViJxLenszqGG8CaQhf3C3Kr/WJExBz+30lwCnAguIPIfpF9JXySzJ94CrxPNOCAVWMNvkBzt7Jx+lGKH6G2ZRDB0dIQ2pu+JB04W1G+SOoezJzkmHJ9u+9fbTVwUsiuHh8o/twWXJBlgBms63YVx2vZuZRUsb+86+VHS79nnmsY54QFQLyp0QdMEP+k2Wz9hRUwXFTVT0g2UUEHPQIMPFdHUJflQPm3suMA4GHCkKLwmJFQmzCM+xXk5reaF0qwpovhHgAQ4KIEWOhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiMqkf179pjxmCnW0hcPa0GAajJS+kYolfBNIu39+4o=;
 b=L/XSfUv9V5QtkGqUPMrRpTcMjpor/Pvbcb+MQGHw4xKjGSHHxwRGl+za2NH9RKKrhfA6L2FmEryigtaT3q3P0BNdG9K6ERnAdjO4B+H9vAuFPWGeOoAFN8V5B5gN/jdmo+wfJ+HiM+zkn8tk8/F264bDdSGmA2Gc7wVTjqPvtSGw8+BLf82bANMsx5GPCmXQY7tJ54NQ+ndFhm62Z+U9jKWD5f3HYUiI+jFzzHZFLSiEjacnbIdO9sTzN92jC/N5rAK14J5mKcYLudrRG35E3Y7DXxA7G9EorEwlNzJqRlv6lw1VRLnY8QwPbmtMRr6FU75spO2GjPYULhT5jWOJwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiMqkf179pjxmCnW0hcPa0GAajJS+kYolfBNIu39+4o=;
 b=AHaxGNJBMr4yCXWn3mdEsKNrXEe5JSuWnuL+Z4Ov2i0bHtFw+cj50km/z+fOXJgVYhdG765Mc5Osrk8cuIkugzywcL4b4CY7FkMUVR12BzTTr+1XQlfUeCMK+wYLQV4Q3MA6ReTcyk2Q7M9ItOxqZ8lM5nKhZc5UbzbXQMf13AI=
Received: from DM6PR10CA0032.namprd10.prod.outlook.com (2603:10b6:5:60::45) by
 BL0PR04MB6577.namprd04.prod.outlook.com (2603:10b6:208:1c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Fri, 10 Nov
 2023 16:14:30 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::78) by DM6PR10CA0032.outlook.office365.com
 (2603:10b6:5:60::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21 via Frontend
 Transport; Fri, 10 Nov 2023 16:14:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 16:14:28 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Fri, 10 Nov 2023 10:14:28 -0600
Received: from jeff-mint.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.25 via Frontend Transport; Fri, 10 Nov 2023 10:14:28
 -0600
From: Jeffrey Pautler <jeffrey.pautler@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Jeffrey Pautler <jeffrey.pautler@ni.com>
Subject: [meta-webserver][PATCH] apache2: add vendor to product name used for CVE checking
Date: Fri, 10 Nov 2023 10:14:04 -0600
Message-ID: <20231110161404.2362635-1-jeffrey.pautler@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|BL0PR04MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: f79c4872-e163-40a2-dd99-08dbe2081d87
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j4tbvr0hhvdG/TnrFvvdm3ALLN5vYz26MAkQs2ZiqcfNidu0mlblf+xWIfzltUDnTP3cTFqksNVwJrYfvZ3W1OjaO012XYIzFapj3Y5zdv3gXDu9O9b6HOwfvejuWfq6tGt47ORtLc0MK6f1YFs+0Q4Bxpn34FgChahoKEBmX4LI7Mv7PdhSpjY7X5q0yXhD/JsJUwF8SY93SGjFBCXNufPEfBknM5g8LlMuhrjyvi7C0FzU68wOuoIahT01cahMpSyud5cPebXuHWhIhkGlGLVWjlmD2kNwOnrTGIK36LqnbYoZqtKrG9KRfTPflIvZPDIdttiZbapKCet051cOhAsRjVjQY9kaikHhEyYfotlj3H3DwO0nIGKu0wEBhlhnRsiah1OSn9yTkxrFL2wYFcg0CDMOnZiv2H76LSqrxjASB4E7UrKtjEM2uBd3F4cV0NC6xIIa4YQGukJYqu9di1cVhpkDPsrKR00UeXkRc7nmcV6ubf8E30vndICuMgbN59ezuBdkbrrm9NCnqQJbGvfqgjm7ToB5aUqnJ6Q6YqkadcvXzypDx+06SEcDChHj/HmRZ2P+u3fxR/gh889VUYjV3Z0UM9XOCi9Ew+QiuU2mKHQKJ+SNogJRm003EZV+y8HXOEJuS+O7FLvrPBXpsU4VGEvsLGxv1VRWWhTJvGgv8rieFVh3cCxgjP3hHmEAZ747J0p7Gn5Sts08CKIPW4M7b2S4NLthpHt1OzaedYwVRzOBvVvWdhqSli8+IhCZ9ITs5Zrb0ViK5ZQRyIrsMw==
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(346002)(39850400004)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(40470700004)(46966006)(356005)(316002)(478600001)(70206006)(4326008)(8936002)(8676002)(6666004)(47076005)(70586007)(5660300002)(44832011)(83380400001)(41300700001)(36860700001)(6916009)(26005)(2906002)(336012)(2616005)(82740400003)(86362001)(36756003)(40480700001)(81166007)(1076003)(40460700003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 16:14:28.5334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f79c4872-e163-40a2-dd99-08dbe2081d87
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 16:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106549

This recipe sets the product name used for CVE checking to
"http_server". However, the cve-check logic matches that name to all
products in the CVE database regardless of vendor. Currently, it is
matching to products from vendors other than apache. As a result,
CVE checking incorrectly reports CVEs for those vendors' products for
this package.

Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.57.bb
index 00f8aaa41..bbc1c6c48 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
@@ -36,7 +36,7 @@ inherit autotools update-rc.d pkgconfig systemd update-al=
ternatives
=20
 DEPENDS =3D "openssl expat pcre apr apr-util apache2-native "
=20
-CVE_PRODUCT =3D "http_server"
+CVE_PRODUCT =3D "apache:http_server"
=20
 SSTATE_SCAN_FILES +=3D "apxs config_vars.mk config.nice"
=20
--=20
2.34.1


