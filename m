Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3652DCD5BD1
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 22:23:42 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7450.1780439020677852653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 15:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nlZ+NUCJ;
 spf=pass (domain: ti.com, ip: 52.101.61.52, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhXfRlmi8u1G4HbZxe8g8tQr2KHpiDkw0mSJZIin5zsgvYhbTeudfaQQgrARZy8UbeaJRMdIF1GJYuGrRg1yUE8A/gXpYXGmq5HKBnAW2uOH9ujMDFc2DWIAkJ25JN+sMtsrPpQAkk0sJGZtZ+veLNmdO6qQ7+I2GxeOPwnbtRDad1NZlO04iLkF3yN6FI3aqcsxJNOrK9hTdae5Swy7peEv1mrtFH5Z7IAIxVfIdAD8l8Mdq4wjCUs6PsA8TA5lYIc41tbM7quD6mxdYczzt4De3CkpSQOrk7TkVKHa1SG3ZSEv0Dnia+p5ZfjW0p5FNdHbrgqCoo0Z6wLD5Mreyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQzH/+ewpIBEoShd3HH6VbCw28qaw0LTlhXsDNYB+BI=;
 b=xyUR0Ovkn8CFCINWXZz2ZEGTMffEVrYLpzn5piulIqgTMGCmLhAOO5tSdj5QUkAwXb/GJPvFhp11i7Ft/uH3Hj/uzUWsLJpxmdjhxlTe/jsfmP1zysesW2V35t+5S/hhotwe4qpCVnVNIImAUsm2axkPaA6A1pcsKGIErJeGSeOyOuU0Ap5OmP1jxuIi9zVJUBCnPGv5vstpRLz1hb/i1D8w7TR0hA3Cy07iDfkcDzoP0NSUh+QYspk7gF9LpffxwN3Dy4FpsVqrKIohRZRRTYfvAuLilt9MMOMy7q4mJumhGQVKWzieedyMSoy6Zvp/RCc/W1K55TKx/w9XwlfMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQzH/+ewpIBEoShd3HH6VbCw28qaw0LTlhXsDNYB+BI=;
 b=nlZ+NUCJCvB9VrrRZ0dlJ1BFJMciUtze6FrPjXUsEY7xMBkW67ijv5Rn+IhT0IqjnffYKYNf5Ev3iYr6nwoyNTlcqXoFpJcWEtscvw/tz60yMFsGtmi4a1sJ8S835pW8wQzpYVh9vi6Qbs/WmY3GuNNFmVOf+zKz7Vu17zTcdtU=
Received: from MW4PR04CA0104.namprd04.prod.outlook.com (2603:10b6:303:83::19)
 by CO1PR10MB4595.namprd10.prod.outlook.com (2603:10b6:303:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 22:23:37 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::d) by MW4PR04CA0104.outlook.office365.com
 (2603:10b6:303:83::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 22:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 22:23:36 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 17:23:36 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 17:23:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 17:23:36 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652MNaZA448552;
	Tue, 2 Jun 2026 17:23:36 -0500
From: <a-christidis@ti.com>
To: <raj.khem@gmail.com>
CC: <reatmon@ti.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH] ktx-software: Version change 4.4.0 -> 5.0.0
Date: Tue, 2 Jun 2026 17:23:36 -0500
Message-ID: <20260602222336.3053573-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|CO1PR10MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: a9476104-fce1-445a-283f-08dec0f59745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	t537nxY4e+sh+wkQ4qyRDXArK519xtZNBQ4pck81LUTWbPErEgf6r00IljKAjr4zqk4V4B3n+bhrdE5AJsiDAM3+cNh/pkU6ZtefuWUV06Y8vYrf83YcXM2pTdcCB5uXrZnJuXTkd9Qpf9kSrJvX3FrkEwaqXP+nFD71wtaVTw3dclCtXdK1vsBaDJ1n9lrhDk2MpQyty+TcNx/q9QJ8BlbySoD4ZV6fKDZuoQ45PSqg5PPZuI53ompZfdSzrVVPNNYdpE76b69jhUH52CIL3F9g9S4Di6JFFC8OWQ2a0DOvaFMI3bL6mvNuWUzWnrKzmNX/wnMq77i4h430QH3y3/T2UxiIIrqSkJ5fQf4gi0VjghsaoPr6+chL8b3roTEPzc69F8QmWMh30UkljSj+kyvqG35kEca52FFXj7be/B49R5muQwLZbmQt60sHbUSAVzHig4VEZICFBxizVNxSTeW18IgHXfADqmWL725KkdKMLqWjOVv+vIbTA0/cdnPASyAI++Fv/jcNCo9kL9P8Kn4p/EeyVE0RvlAi5+aA8LSXuAcq4LhZfzS7VXdDoz0wmpM2/GsjA+ikfIalR5sOp/ZEu+gWT50LOGKIhFT3ko1jlZKCrkhv2L3Zwseo1VmwXPJ42NbTS+9uk/NfethZB7ILXMGgwHxtejSzW9dAkRCiSYmBsUY0UCvDBex1ZT2oHLo+XWaivlndLReY58Gc0AYsWNiUB3dtK+La2MqbTzQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/OiJXQFTnEufCHOVE7Qz4DFPyUhp2R3vpUuiNe/bQ8VPwpNtDxQ1/IBwlr1GeIgYhnVxhcn12SYGr5LztgsfsRcn7x2EbcGqJHwimCyCsuoJV5o5nQDtMIJOd8uQPmCItFlLGiXktGLbhLhPG/5vF+SCFOJurCrQepB7smi9Kw1vJSKRcAmc6hBlEr2Mkfl4S4n0cvfK4PYZow759F4YmMC5jo3cwOwDw31HgSUtEfMqEKbGKI6zeIBio/C1otFpDSiI8MOhkQTaiOpCL1lwZc8gy5Lts5+P9JTF/jgculABTZF6nkwcyS2j4SZfoQEUtNBADGgyGcARdzcplGoro2CXRUIvC8AQxY1V3SFneihySnyPCGu4hvkgqlQir/IsKvqW756FsOIx3BbW73zgAXKhssAVWGR0jpJSpmUAeTA8NWM+5SXqKUs8eJ6oQGbT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 22:23:36.9309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9476104-fce1-445a-283f-08dec0f59745
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4595
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 22:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127372

From: Antonios Christidis <a-christidis@ti.com>

Major 5.0.0 version update. On top of new features, this version fixes
compilation issues with GCC 16 and C++20.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../{ktx-software_4.4.0.bb =3D> ktx-software_5.0.0.bb}         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ktx-software/{ktx-software_4.4.0.bb =3D> k=
tx-software_5.0.0.bb} (84%)

diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb b/=
meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
similarity index 84%
rename from meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
rename to meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
index ae4caeb89c..ba9eaf2def 100644
--- a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
+++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
@@ -6,10 +6,11 @@ LICENSE =3D "Apache-2.0 & BSD-1-Clause & BSD-2-Clause & B=
SD-3-Clause & BSL-1.0 \
 	   & CC-BY-3.0 & CC-BY-4.0 & CC0-1.0 & Zlib & MIT & HI-Trademark & fmt & =
\
 	   Kodak & PNGSuite & ETCSLA & Cesium-Trademark-Terms"
=20
-LIC_FILES_CHKSUM =3D "file://REUSE.toml;md5=3D45910de791d599e6ba472f6fa506=
f391"
+LIC_FILES_CHKSUM =3D "file://REUSE.toml;md5=3D9f87c97ba36aab42411bf93c094a=
61f2"
=20
 SRC_URI =3D "git://github.com/KhronosGroup/KTX-Software.git;protocol=3Dhtt=
ps;branch=3Dmain;lfs=3D0"
-SRCREV =3D "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
+
+SRCREV =3D "6269d2752ed04446c2d4749f54f3aad4f94555b5"
=20
 inherit cmake
=20
--=20
2.34.1


