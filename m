Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web09.11198.1623771682883021101
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 08:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@de.bosch.com header.s=selector1 header.b=cVv2Mt9h;
 spf=pass (domain: de.bosch.com, ip: 40.107.8.47, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhpxuW5E2o3RLL4t6aMmFV8u6IOYiBZe4R0rsnOFU4PU7mXtnOz3yEiykUAywmiTiV1DnOj7/VBJ9lRU7htra8xwhWdnvREJl13qTmQbiTLwLbX9M4aWeql4RercXAUjXW6PjK1K4teiX6UmGABhLK5Mvpqna7wQQPDyVNuIKyQwXbmAi6fnK7HL3PrIw8U4b2PYuHyf8ljYGNwbsuectrilgKyj7f8N7Z+vVksN6YPqrwtFCieuPIsPqw2zQ1EcSB1v4VK+oVIg39G5+vCGdR+/ZeFUE0FHvGzgHbcpkpI8qYPRuPWH+GCn8H7wBq/ib74nVAsxhB96tUMrwy1pOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXaBTVxd6VeyQABXuXylrsgK1NLk6jMrwqRdepAbB8E=;
 b=DivSdD49RqieLxlu7uaKTqw8CgVMXBnNrVSzy6VkNrETee2WvHxlADfrSdZO3FgJWQfJ2StJvTn7UeWikQ/2iIC6+TrAmFsIo9qGhGcTh8sJtuZfzlVF/lZ8TTX2OrYQP3PV+8AWeSUfL2eEl6miESYZWVYvrjWXe0KtKd1x1USWXjQnkC05CQ5+YSfbKaYRYHpCXLXIu6Q6Q0UO+apU05DWqOnlpJdSJ/CEGgHB700FnqW22NNYc0uQhYaiKmWKxvdzcJD8yjaOnqVZN360IlOPQ45yQPG488XIZspaNtY7uTz37TcaGkvUI+awc+hqPQq1kf//iC7WUc9diuaofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.200) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXaBTVxd6VeyQABXuXylrsgK1NLk6jMrwqRdepAbB8E=;
 b=cVv2Mt9hvG45zaGSSZXa+bkHy70cS5x93dOnuxI6SeKTzvebKNq55fm3xAsf/vMRQ5ss/vY/+194Ca+NcauvWbv+P+u2MYNHFrB90SPSo1eWFhbNQ+OPjpEm5YxRoDsZ5iRLp7w+4aCcqqyPFa3nGL3Qo3B6SaBfpI/lwHKdS/8=
Received: from PR3PR09CA0004.eurprd09.prod.outlook.com (2603:10a6:102:b7::9)
 by AM8PR10MB4769.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:356::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 15 Jun
 2021 15:41:20 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:b7:cafe::d5) by PR3PR09CA0004.outlook.office365.com
 (2603:10a6:102:b7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 15 Jun 2021 15:41:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.200)
 smtp.mailfrom=de.bosch.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.200 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.200; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.200) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:41:19 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.14; Tue, 15 Jun
 2021 17:41:08 +0200
Received: from SI-HUB2000.de.bosch.com (10.4.103.108) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:08 +0200
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:08 +0200
From: "Mark Jonas" <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <kevin.zhang3@cn.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-openwrt][PATCH 1/7] layer.conf: Add dunfell to compatible releases
Date: Tue, 15 Jun 2021 17:40:43 +0200
Message-ID: <20210615154049.173769-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615154049.173769-1-mark.jonas@de.bosch.com>
References: <20210615154049.173769-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97c3c515-9112-41c3-d63d-08d930140565
X-MS-TrafficTypeDiagnostic: AM8PR10MB4769:
X-Microsoft-Antispam-PRVS: 
	<AM8PR10MB476952747F156861A49D79E7AD309@AM8PR10MB4769.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ChYS1E3B/GHS/YnB2kbjVEBoXOqeO+3zemGR9JqdrwVDcvT49OJLPk8Y81csDWlSupIPY7A8cd4ATzcf0B91sypsctoBTa7F64dF+Z6a2gKiL9LT/8IjA21N+6/LjINGcVHI0EMkep3iCty8oOP1P3gx2W6x79BKMz9pK73g3PXH9Z6B2YILwDVq5cGKvbGYRa9IpQjzIQgcb9HrBOLHWhyll0uXNOQRb4jZHGpqchXqZIhNN2Fr1EVayG4Pm/5wc4e/Ca0hjErFI7lAFW1LRrsvAuyyqRjjtqsIet7i419ioYLe7bm5ejSvUgXYHCzppUFqVHdQryNhXeseaZNimKeTwlurBt2SgMJ4z52uo8pfiVjDpp4MkCBRW8jgPC6Dw0Mn7e2GZAPt9vwyRg40Tp66UiFotuW4fDWJaKBi9xhEaMgtiOksFf7hyHckQdUUpkEdU+oynAw9zRd1C/gv8HVgr+68DHAf5AqOZ5imVBR/jkLbRip9Z5k6nXLkgOoOEg4q5bdS1QEvo5v2HhjwROZJA0X1d+lsbe83mkz5KXJrHu7vdUXJTjBcHS+GIPgxQ8AP/QU9iyVzrLiqKc2PttDTFsyd4i0o57n3isuR5DOPmSg+bGs7OL7ju4uE5G/nZYVY56jPJze+ajmQWcyvoC14fkJ7rs6BFQAQD8sgmG/KKmvVsXHTriyZTN/xlAIH
X-Forefront-Antispam-Report: 
	CIP:139.15.153.200;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(82310400003)(2906002)(356005)(7696005)(70206006)(2616005)(86362001)(6666004)(107886003)(4326008)(498600001)(36860700001)(83380400001)(8676002)(44832011)(26005)(8936002)(110136005)(4744005)(426003)(81166007)(1076003)(54906003)(186003)(336012)(47076005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:41:19.6715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c3c515-9112-41c3-d63d-08d930140565
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.200];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4769
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Kevin Zhang <kevin.zhang3@cn.bosch.com>

We add dunfell to compatible releases so that we can build a newer
version of OpenWrt with dunfell.

Signed-off-by: Kevin Zhang <kevin.zhang3@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index d60552b..0029331 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -10,5 +10,5 @@ BBFILE_PRIORITY_openwrt-layer =3D "8"
=20
 LAYERDEPENDS_openwrt-layer =3D "core openembedded-layer networking-layer"
=20
-LAYERSERIES_COMPAT_openwrt-layer =3D "gatesgarth hardknott"
+LAYERSERIES_COMPAT_openwrt-layer =3D "dunfell gatesgarth hardknott"
=20
--=20
2.25.1

