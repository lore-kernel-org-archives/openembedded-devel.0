Return-Path: <julian.haller@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8634DC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 15:12:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.131])
 by mx.groups.io with SMTP id smtpd.web09.6317.1647011554323855337
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 07:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=a+L+LDuM;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.21.131,
 mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp6Xs59pM8UMbiR24xaSmuAx8vGuctnv2IV+mCvuoWAr4D5wu4ZZ6E/IeX8WymxW0idjOlcLbrc7xfNyOdjgrWNlBBpLhh7+19d5JamyDe7VKh6NTYGlpjvkhvMAGBQfTfTlIFoLXAMBEDGq6vt5SVg981tm9NgoGQyzQSafKo7MI8XiuIDB7/Qg3GCVlMSfplUcwg5YJCa3Af0tFnlXiyYOPIRk/W1Of3QgkUakKRsUx+5CyXm/QkpbcEhPB5SWpaNRu2bNQ4RpHg1yU5zmSTedtBMHftLaeCI3YiaiZ8lJUXkdX9FPNCaKL6AQ/9Ew+yFiXvZXsHQ5sylstwS6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaK+918toQDi3qlZiVfCF41Dv9gxPZDrvvyI48UI/dM=;
 b=nhi8EdSz53KMNabgtmI3kbpsoUt0PHQhy0O39G/JF6Ju1liriGJUNNQQ+uddjGPvMzYRzavEbWs3vYoQ8i95KeN6b426A1o6LI7OBJfmLXtVA7D1Vi1mbxyyVYDUnjAJeKogyzTIDc0bpSANkbM8suCSPEeq+x1WJXVP8IJUw1j2KQ9GR86zBYXbZ3lGUKg8nK/FVoicdkDrxSaLnm76y79ctv3AUJQAxGMXhfRI5TkJH/CzzhHIdmX56awEEgd9aTglPzhuPu+VcVKRyK9YyUM934DiUH5BRWnwJ5FZ4JxT9GzGRqvli07Xv6QAEQ4kjGn+7xzqtwhRI9llhZkqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=bbl.ms.philips.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaK+918toQDi3qlZiVfCF41Dv9gxPZDrvvyI48UI/dM=;
 b=a+L+LDuM/MQmewI+beosIKLSZ2bkJbWpaw/d4oPuSczl0kfq9lbo+uwnWJT2BjgI6YES4OYLkiN+tiZQeguF6nNYc6RSiv+9dvEKtTTx819XVIw5hZKWxG/N79PQYJP1T6iIiooly5NflfoMzyf3MhlsRiBAA+wjjtiEorxLMd8=
Received: from DU2P251CA0002.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::11)
 by AM0P122MB0147.EURP122.PROD.OUTLOOK.COM (2603:10a6:208:14c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.29; Fri, 11 Mar
 2022 15:12:31 +0000
Received: from DB5EUR01FT011.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::71) by DU2P251CA0002.outlook.office365.com
 (2603:10a6:10:230::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Fri, 11 Mar 2022 15:12:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bbl.ms.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com;
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 DB5EUR01FT011.mail.protection.outlook.com (10.152.5.3) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 15:12:30 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id SWRxnFN8ATYquSgwQnIZyC; Fri, 11 Mar 2022 16:12:30 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id SgwQnr2hpK8w9SgwQnYtqJ; Fri, 11 Mar 2022 16:12:30 +0100
Received: from bbl2xbm1.bbl.ms.philips.com (bbl2xbm1.bbl.ms.philips.com
 [130.143.220.186])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 6B34E183A1A;
	Fri, 11 Mar 2022 16:12:30 +0100 (CET)
Received: by bbl2xbm1.bbl.ms.philips.com (Postfix, from userid 1876)
	id 67EC5758071B; Fri, 11 Mar 2022 16:12:30 +0100 (CET)
From: jhaller@bbl.ms.philips.com
To: openembedded-devel@lists.openembedded.org
CC: Julian Haller <julian.haller@philips.com>
Subject: [meta-oe][PATCH] nlohmann-json: Set CVE_PRODUCT according to NVD
Date: Fri, 11 Mar 2022 16:12:16 +0100
Message-ID: <20220311151216.794065-1-jhaller@bbl.ms.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: julian.haller@philips.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dcc15c9a-962e-4346-ac52-08da03719002
X-MS-TrafficTypeDiagnostic: AM0P122MB0147:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0P122MB014782B8296CD92ACF1E6285C40C9@AM0P122MB0147.EURP122.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S5GlJrSB7RT6jSrtT8xeJzmBhT6HmORkoS40hVATHcGpwRg8fWnSOcjwQKpjh1FJmvMYaFkUn/ncsNP61rPPKGdj1R6YqQbpco6ImGelAitgNetLQ01nI4a8WDvOK1WMQEwsuJB6qmr4Z/w1nZeKbPbbRr7tvNaeZ3TGL1RZpfzyIH++FYjUBmm16ecSw7ZQdZt0wUVCuWoPmlBxQOKK5Dj6NIbbfb7f1v83C5B896PRP8FmQZNA29/wooqBLOf770RwQ6Moe6/IPXsYb/Dl9gP8DfcDq3duP+Kaddpn0Yj00vL3fyCT4mKycRLB00QgsuFzxLCFhbcL+cPx+TciHB8GZIM+al9ruQ2YnGb4wbQYxSCyCd5VeEGKC9JvaOLG4kPA2dPd4/iVDYJkq2wueUIf58dxMXwcrzffvkmM8efJ8+2fjhLRET+R3KI4b66NGcaPGOnfvDrMczq/HxmRE05Q/NX0XVKVT4Fw7klcj8z51ERk77DB0QmVqpuaElWHMUCrjzjN2DVuPBC+qRNe63fyauBOrlgwbffKk/DLEe3Y05GCF+ZXRwdH2WchYTcN2gy2e0v4J4QT+ZSrLpHpb28rQOnSjK85UyelijNhUDWYAW/8fYO4wws4dcFpg9NeWqU56w7LZxinjFsTE+5eVltM/mqGtNC3aefANuD6SU2cWS4GNKEfQ+jn9IhaKzOgSRAahMoxK9qIpeB5MbrT1AhTOOSdn2pIHtczVOg4+gd5DeDO/ZkFLuu4BGbA9MW3y4+W39GylYp1WSKMt3H2VQ==
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(1076003)(2616005)(508600001)(966005)(336012)(82310400004)(107886003)(26005)(186003)(9686003)(6266002)(6666004)(356005)(7636003)(7596003)(36860700001)(8936002)(4744005)(70206006)(86362001)(82960400001)(2906002)(316002)(42186006)(40460700003)(6916009)(70586007)(5660300002)(83380400001)(4326008)(47076005)(8676002);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:12:30.8003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcc15c9a-962e-4346-ac52-08da03719002
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT011.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P122MB0147
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 15:12:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95952

From: Julian Haller <julian.haller@philips.com>

NVD uses 'json-for-modern-cpp' as product name for nlohmann-json. See
https://nvd.nist.gov/products/cpe/detail/394565?namingFormat=3D2.3&orderBy=
=3DCPEURI&keyword=3Djson-for-modern-cpp&status=3DFINAL

Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb=
 b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
index a69c5c7e58..0cf6fd36bc 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
@@ -4,6 +4,8 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3Df969127d7b7ed0a8a63c2bbeae0=
02588"
=20
+CVE_PRODUCT =3D "json-for-modern-cpp"
+
 SRC_URI =3D "git://github.com/nlohmann/json.git;nobranch=3D1;protocol=3Dht=
tps \
            "
=20
--=20
2.25.1


