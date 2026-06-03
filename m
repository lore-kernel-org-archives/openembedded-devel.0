Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A47BCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 19:21:09 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28389.1780514466441201678
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 12:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=V0V41SY1;
 spf=pass (domain: ti.com, ip: 40.93.201.37, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaulQ3Nhffl+DfwtUKKy25Rl5eh3u9+cELoccm+pVNvI49GGp+pLo1LL3BGVHyQ7caeqh4V8SDeeXzoUt0PuugX6UddFVdchAI3rhjCSr+sj4K1wBmAYgvsxqPNzB5ehH8AcTIJEefuSQGS4C0Y/mNNKV4lzRBM/hL/AIbvp3wJ2nstHpI4FfFYpMHFcidofhwlabfAtjNby4CARueCEBOSroFCEeCirFLlupDMIk0GDPBrrLuzcYY3hP8a41BdpWxnyXYJQaB5QN38HCVmOZOb34Cq+cSwjISL3rwV9t8N/ARwLMWI7hzEjNb1w/Y1LtA2HWxyD8NLBK03QZ7am3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkD/VUGgOn89dhQSQ18lsxCbrCCjE6fYLuURF61sBX4=;
 b=QLgUqVFCy10Od2g51m6rPvCyshMEIQIUE9eJxx3m5wV02NMvjTHPuSnth21+Kv86OgAJgY0gKDkAsJqJ8chWfIYcTHW1C7WOkYbxVxlZC2oXi0MYGmxCho+E1ve9CB+7MhtVj/6viLCPvuh3IdwT24dOQ2sR0d6J40vsHJrbbohTAvy00iTPP9fF4ekLQU9SrpzgTZ18Rywh4gx21jBzTfIp4XLfS+a+OwqwOGQwi9kLS1N2umphsOi7sHdOjgYXjf9rwDsj08L19JUoTYvTJ/IPxy5Itc0SB/MT+URAxqCMIe+ZaXrPtbsOgcBcn6EsWNFYnutAGz9tn4+JIy9dPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkD/VUGgOn89dhQSQ18lsxCbrCCjE6fYLuURF61sBX4=;
 b=V0V41SY18JKKuMIfhpQ6Y7BzH0f8lvkLG3C+Y9uLgpECFIRKeg6PIF1YXSLwlO6SLv6ZJl9n6TwcFVYKbGYbYL4qFMuEGnFVVGeh2O/rSI4M1YJJ4hEMIThM8AnDGOqSh507Hr4TAG7KxXjPZ7y3fERff0Bnyx1E2PC4E9rrSU0=
Received: from CH2PR12CA0017.namprd12.prod.outlook.com (2603:10b6:610:57::27)
 by CH0PR10MB5210.namprd10.prod.outlook.com (2603:10b6:610:ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:21:02 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::2d) by CH2PR12CA0017.outlook.office365.com
 (2603:10b6:610:57::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 19:21:02 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:21:01 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:21:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 14:21:01 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653JL1vU2369369;
	Wed, 3 Jun 2026 14:21:01 -0500
From: <a-christidis@ti.com>
To: <raj.khem@gmail.com>
CC: <reatmon@ti.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH v3] ktx-software: Version change 4.4.0 -> 5.0.0
Date: Wed, 3 Jun 2026 14:21:01 -0500
Message-ID: <20260603192101.3085843-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|CH0PR10MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 856ca02f-c3da-44b8-52bc-08dec1a5400d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	TKGcgpPIXsifOQI3XW/PP4e8TiOV7dADUw6vHewSmjiv9JZMfBhnFFzLRc0ingFxUJh8eCVhLnVSWgA3RAamUM3mWLqJZADb9YIYq5tJFVJ8+F6mvFN3xH4iK88yYG8QQzR4Xj6CkCT9h3d+qwW1GPGIMdFCv2i4Ow0G3DB0fP9xxSHtGMAbbS34pTObzuyr9rpkKV2ar6YinHN8xX2EVNaAt603tvoIVAxjqM+M5JuHSpHGaANmAzVRuK84yDhyR8c3u1kU7UlzgjhHUm9j0K6OwGnzQbG3iIOs4zSQ8bGW67VIgF1mh/evkV3RWpEkfHoIc30CUM8XdugAHVA7H4oKHZg5tyTzYtX1SWhMrM4T6JFiHlrGBpL81vsMxKpmh10A83qp/9+wgi4xFPop3CCSdKmcH3af4kR+20f/LODbQtmHkDAi6qSaH/tfRyaZFuZwG/8wOlKJaKzAJpWCyzwfwZNAFa9Ts8DyW9wWdB/9aBxZ5IkVn5ngF4BscFBEBolM/h151mGsy+cJSuw+zDQ44x98kli5/qVM7lJZ0ijl9C9N5mm24jL/pZwK9KNAe8u2fv7igvNcpJmodFu9l2RmA536Ulf2F63wLU6Lxqy+6IjBfoDAuMudV2/5Mbu4daTinZ+sOSlvx2S9Sse6ufGbpej75OQWpatm3LnzvO/uocPnhXZX91+DdEnUhWqK/9nIL5FDqt0UdIXzCEv+2D9b6cynHuxr1BHGpKwNwDs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BZFXCrYi4PMYKM3SNkFxjmPozFILpW8KFYX6fHUueWWwpSvp5XGjRhQ0CAFfLKl6nMSFBiULwukJ4rqYcSKCE5ii4uVFJIImcuLrSBwzZcu2fpV2NSaG3+2D+jfRXp5bmJplZgqux2qQ+QokhVjuoZKPubUV2LZU/ViCCbGifyGaJdH0ssHubE2KGdTo96SNC5MfCPApY+9zgjBdBDWeaOfiP/kEUXXSXcrFiXRiClAc1OvMfYPs+Z9FXaltFrOUakM4NLtwJ/vizWf4hAf1dDN12WG5w4wfCQrCmtuLpX4eZTDakVKQI3HuRYqHN7YP1/Geuh3El0UuR++gfeK59fzRU1fPzh+n/n9xQ54evR1akFzpp41FvVugRo556VoZkINWxfN0wf1cEyJ38wapiLDAcplACnS3n+SlC8DblR4hDy4xiw8tAv7Ou0OKwZYn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:21:02.0647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 856ca02f-c3da-44b8-52bc-08dec1a5400d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5210
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 19:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127385

From: Antonios Christidis <a-christidis@ti.com>

Major 5.0.0 version update. On top of new features, this version fixes
compilation issues with GCC 16 and C++20.

License-Update: Due to new copyrighted material, no new license.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v3:
- Use of License-Update tag
v2:=20
- Add reasoning for why LIC_FILES_CHKSUM changed

 .../{ktx-software_4.4.0.bb =3D> ktx-software_5.0.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ktx-software/{ktx-software_4.4.0.bb =3D> k=
tx-software_5.0.0.bb} (85%)

diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb b/=
meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
similarity index 85%
rename from meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
rename to meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
index ae4caeb89c..8db0c79b87 100644
--- a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
+++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
@@ -6,10 +6,10 @@ LICENSE =3D "Apache-2.0 & BSD-1-Clause & BSD-2-Clause & B=
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
+SRCREV =3D "6269d2752ed04446c2d4749f54f3aad4f94555b5"
=20
 inherit cmake
=20
--=20
2.34.1


