Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BA6E9A778
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 11:55:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18026.1774353349709733792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 04:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=BlTq5tVc;
 spf=pass (domain: de.bosch.com, ip: 52.101.66.40, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnrdviInG2JrqFpsPbAJgX7G4tP/5ibmstQmNjpD33+47efO6+rm18TbfX9kwIRWnb31oMhRXtrl/mqKF2pk8DZlPsDoMsUQOhligY9BzwwA4TUpRvLl08AC3myShhQ+tl0JkI8BIDXxh4S5jZ7TSv9etOlcVvoeZwgxHO5P8L8AxK5HCOxrlCLL7ahmYeOQSydqZ4mAlEarFhziLxHp6qXDbVA1S48cyLhj8tjtxZvY08VgGQbX5l2lzErChcbmor9V32+43Ns4OO4Vte3oXZFXbZDPs32JETumxDF9CY+GbTmtsYNxRdd/brIsEfBtRJRH7JEq2xmB9xAY9ayS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXu6seh75F1lEMrstucBsPXwylDdlhWixMOFfKfXtDY=;
 b=evJyp0U6PFFfOlUf2zS3UJ+r7FLeWCn4n1scvUgMm8KTMzXgjRwF1r0IfvBZJWNA+SlzWIlO9xr7SCWRd7aSYWeh7AnQejVrED9YBjrCTGld1EAbJwspbZEQf68IOo9MZNy+jH0AJ3H6YvTDlQGXqj6hjVl4/mVSp/GrIQ3NdmIR7QCyWnJeqUY39A5akDxYZUhzjfaLHpNuuBFzxa/dK81wxg+k4wNT33m5VA6QPMiu4+rh/8ePJcywJ7Kx2OvWQnzOnz3wqjrhbHLUNrUfPmxGRjuyaQxpcXTFgb+IdbSIdDGl8KBfRm4qBvMV6gxnoZ+TwbYYLgIgHUx0o1orbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXu6seh75F1lEMrstucBsPXwylDdlhWixMOFfKfXtDY=;
 b=BlTq5tVcUpOg2D//AxU1hJDQngLjmNCZy9awQrIH9HcgIUs8Uy4L+emb12PWFMoQQfTa4Q5eDkhcXmmwVObAECz4GSsMKGIc2EP7t7UWYeNK+PaHl4uPkcG21GDI1QleoZHiQOFH7YafIMwGIfDDYjJNJBWKyWxYhlwbuZONTrSW1zc6fx1hqgKAMVlE7VNlfXCuo3HJLQgbk51Sbe4nFfLFfXb6/wzPynUrp+shkk2ZTHAUdDYFaVLlmHwlJz7N3xm78EdgYE9DUfctLhdfnIUVacgX+wq57Wd1ryHBjuiqIMUEtEXMk+RkCdtIgLt1wXExCleQtBrA329EUsR6/A==
Received: from AS4PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::12)
 by DU0PR10MB5728.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:323::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 11:55:45 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::9f) by AS4PR10CA0018.outlook.office365.com
 (2603:10a6:20b:5d8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 11:55:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 11:55:44 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 24 Mar
 2026 12:55:44 +0100
Received: from GRB-C-0009M.ot.de.bosch.com (10.142.116.186) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 12:55:44 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-networking][PATCH] mbedtls: Update HOMEPAGE
Date: Tue, 24 Mar 2026 12:55:08 +0100
Message-ID: <20260324115508.1844-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.142.116.186]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|DU0PR10MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: c3393336-e589-4240-0439-08de899c47e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	6mYVNbsJaKNnq7pLIE3aAwCnEzrg5FVXJBqo7AHWo07tokpLwWqjGzLJ9L+6NWuetejTjHTg5QZ6R8Btpx2quw9+KqCXMqxJRTvROgfwirbdFHs119XIt0eFy+3F5o4pBcHyOvSPenF0cYEq2gVcHdZpP21n3GZWc7yzoaI0ma2Km+heT5WNgc8TKyYruEOFbUvX4miHjA9OmwBajvNW0/HK3YSki0CRs8dBEY/wjgXAeFZCOZojjGV8Z+AprImTdSt4Sp/tfbhLEapXtAsuD8YB0K0FX+/uj0ZClVT9YnvLxKqPwzEzM02qe4CYAvaFEj4L3jwT3wQwqzMQxD2uLgzd8520yuSXfryQ4NscCz0ouWnr3J82bawYyciFoS+el20q2NraI55uJGakS1BnwzgPrpVfbf4frO6OBdgOGkhBhPHCGaeLvI7MizD4/ds+y5BMjVHlBIAO1WYDkSrR6yzuuV6DAqqAqABLQp4MiDRRX3sAfndRpcd7+7gLP4b479jceZ4R4aFQGZlHsBvnhbGoM6pbw8cbmUILUSTs2X1EBCiLoyS7753ZPQl/XcnzWgc+9wGyeBXzrzNHnR5Mtw1/tH3lysb0ABjXMQS51tDu5s21B7gkyGq+LEVwFfGTqLSK1Y1GBYEJyoM9GG/dJ/rHBTBgHxIpVggoCUUW5aOxgo1EuwGtUVWGUTDJc7lWzxWxvb50uIwfhl82OMQE6w==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CukOF9B0+DOLgf+qNF1vBEjgQUAykTSW0vg5vdmZpqRn6lUEkqxDikYUw4HaYrp6XIjRpXR3NJDlIEA7gLJ2y9vxVRZewB8iXNhR801OhBlhMP5gwO+kTjPwwZZNopNOnLb2qDxPFZege6apljYUWX64pWXaaqC0pFbJWvVoDJsb0upqFwBLGoiXDl8euGim5AbKXrc5qpv/IkiMDEKLcLPJN4tHjz3kZ1RjnLhPLuccDcr+oB1O1eiXxwwwRuA6gqBF60sEK1PkFleH7PODD4tUJDnCn9HZERS+GkZYPUwlV1YE2TOi4N9eVMnOKdWCCHdHVQTn2QArPB2G26MaYK7Z2g+HjV5xxY7XBK2NNSTonrxAzw6yzaJ8S7fvFuu3/ptKSg0XE80HnHhHGXrz3+nI3Ja7uMGKSkmbz9Paj//xmWj7kYwfhZ94LTvBc117
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:55:44.6737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3393336-e589-4240-0439-08de899c47e8
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5728
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 11:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125556

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Mbed OS has reached its ends of life in 2024 [1], the annoucement also
includes the change of the Mbed TLS homepage. This commit updates the
HOMEPAGE variable in the mbedtls recipe to reflect the new URL.

Additionally, the BUGTRACKER variable is added, as it is a required
field [2].

[1] https://os.mbed.com/blog/entry/Important-Update-on-Mbed/
[2] https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html=
#required-variables

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb =
b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
index e6dfe43092..bc2ff8ffb5 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
@@ -15,7 +15,8 @@ understand what the code does. It features:              =
            \
    platform abstraction and threading                                \
 "
=20
-HOMEPAGE =3D "https://tls.mbed.org/"
+HOMEPAGE =3D "https://www.trustedfirmware.org/projects/mbed-tls/"
+BUGTRACKER =3D "https://github.com/Mbed-TLS/mbedtls/issues"
=20
 LICENSE =3D "Apache-2.0 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d341e026=
d"
--=20
2.34.1


