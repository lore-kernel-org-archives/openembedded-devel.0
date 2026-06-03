Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCB9CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 18:18:59 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26697.1780510737787582013
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 11:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Itqzc7On;
 spf=pass (domain: ti.com, ip: 52.101.53.22, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmdEQtHc+AVNHum1PXFEA8lbLnzSvxL0Rldn6GUP3QYPSiJk/UEZcgI69RYfe+FT3QwTAyiNvJoAf7sDz4pu+BRkDIKXNTlUdk9f6Y9jVFdXKMxkIDKbEqt2VoYwr1P4l//kVjjJZCkW0sYZJt+m5iPk+2T0tFh6b3Fn+5oaTAbOUyMSCM0lGUawm0YFIAttbxg9toXHkfepq5xXoEdwzpG9pBi19baL4Vk1TVGYBtBxeTbqQXdBQ0YluVbVyJumayfyd2oeISrLz3Xao3VmgEyh57xczncq8xT4L+I1CgUJmjnGH54SdM2l0anc/WYZYS4WuvCVQWpbu1SOJCNfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOBb5ogL+LfMwmXxFr/M331QKhooSVRMT9x22L/qJTo=;
 b=DXa0phd1gm37BU9ZWH+GpNyJ1zwTt8ck7giE05zo92W/UjrWGcuwtoJTHRCGhHCcohSnmj9v+5RxBuiFJjsXjQb0ZHa7HIS8qGfXR2XZzpYsEDG4tkeTp+ZB+T+yYw/e5tLcdqrOqL+70KGHchmncIgtxfox3TqPjCGQzoA2X9bx9R0Js90FsC9/lP0zc9gWZaTdqAPsxhn+fXz8fikFGRPUq7v48ulLGfpF++3Cvc9wrafzDId7UYGd0fr0hbWO60N8SK1J21QyXdmnTrgisx0XslR2LyIBnXDdu5BahGZP0k+Z9FdZz86Yc6+qhGkZK21rd12sroMaAknzMTZPBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOBb5ogL+LfMwmXxFr/M331QKhooSVRMT9x22L/qJTo=;
 b=Itqzc7OnBZA7s7g1PKwYwEB9jnflTvO3phJFzTkRadHCWUzjnk0YWjA9MktrdlYWga7LAZinqmEGm6pC368nwYHtI5nGsfUFodNgHv0igpFGN0imL7Ouay7LZ/Z6w0l+qudIienysaUNMpFqcMbeaVr4kjLU4k8PtrMOVIHmOKo=
Received: from DS7P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::14) by
 SA6PR10MB8183.namprd10.prod.outlook.com (2603:10b6:806:444::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:18:54 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:8:25c:cafe::f) by DS7P221CA0028.outlook.office365.com
 (2603:10b6:8:25c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Wed, 3
 Jun 2026 18:18:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 18:18:53 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 13:18:52 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 13:18:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 13:18:52 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653IIqTH2279068;
	Wed, 3 Jun 2026 13:18:52 -0500
From: <a-christidis@ti.com>
To: <raj.khem@gmail.com>
CC: <reatmon@ti.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH v2] ktx-software: Version change 4.4.0 -> 5.0.0
Date: Wed, 3 Jun 2026 13:18:52 -0500
Message-ID: <20260603181852.3079775-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|SA6PR10MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f68235-449b-45ea-bd0f-08dec19c9177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1q7nfKLUYMcdATeWWR5jIa+rS1RMz2u8BKA6iz9RREf2kwpg0d0y5+iyY7rbosSCK7GGkCZJFuX+gPthd0RbOyLcdMhDaRblxlNfTqIaLWsqwC3+T15m82czjVKjcaAVjTsvwfy9YrWMaSXcUaRU1rz9SvIt0xo0bA6Mb9fBFZ0w6KRHJboyIA0OmjYz3+DfJjd4wCntuVTzX51z5m6XypPtzj2hmR4Aj2To2ak6ezrctRvR/F73rE2Nmag/F892TS7+YrZSFbJ+fo00bX5XQ7bB/5i/FZzHhdFhQkXdGvk+ZgiiiTInGKbm2b1B692HikC3C5vYRWn7Ff6SpUafKXeln+hVhrw4tnoy0Ldz52ftwXTJZh+UVGPGFu0kbUnwRtXGmgyAHwvEzFe5hn1SmZ7dAzQ7PikbOEN0FbAX+aMr7yYkVQ3NR7qltYF1vsKepu1fxhs8xzfdmVROLKYKC0HijaDsPrLJ2ZuhTTOiz95XccfvpJy8CO/7rO4w0lhkOlKnL9IdseLexaHTVkWTXNQFBYMl5q4HDzroVQIUTnpg11XIYcjPoRqz2ERfWFS/7QajJ4SKpOhKIbLy2G1deLkitwIyXQ/wP7oyktxsNJkGxO7nhys5n1763r13AqbxUPAeHfKQ//motWC26fQdLc6doiclFN2F3S/PlXpNIMj/lJNXks1coFoAh/iHEfl3YkNMFOLN/MsjAVu/FA94QDVJiImDP4pyjDqkQqOAnWc=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YgZAdAcu47Pald4QPa4Uqmpi02VRZrzntF140UZ3LxwXhib7WkDCuzTP1lGtPcb39Bo7hZAU/TgkQrvWMQfE8EhMpUi5n63faMg+NJBpBhyNe+2EKmXv3UstzX6ZpJXE5OJCX3b19i8mt2Aymqoud+L/LCIaoKH/YoqJ8d5pwDC2hRUXEpuQpZTV6w1fznh3zQfPB56UBif2I1tB3y9QLHIIrEkQ9Fufc90D4l2SJaw0cV19PpKxLn+tPV/a6+QnQnfnqQZ6aVouWzsaurEp3nrlr/vgvgD+S/HiJIHnGWUpL4WRHxHC8L3lj6lHfYNXsXpqMJ16bd9bwpT6T8gZrxAt8Jw62fv8f8MO1HrecWj5qvf7OGakN2YeZqU1+MqCSq6jl1urvfQHQUtlFJY+qFmISGsGWKYQYZWmtdBi3GlPf3PG0zZ9sIh0/QqR2XXc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:18:53.1850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f68235-449b-45ea-bd0f-08dec19c9177
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8183
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 18:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127384

From: Antonios Christidis <a-christidis@ti.com>

Major 5.0.0 version update. On top of new features, this version fixes
compilation issues with GCC 16 and C++20.

LIC_FILES_CHKSUM changed due to new copyrighted material, no new
license requirements are added.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
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


