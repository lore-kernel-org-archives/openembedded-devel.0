Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A41BCD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 20:48:13 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30221.1780519689670120228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 13:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fBudnbXP;
 spf=pass (domain: ti.com, ip: 52.101.62.59, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KC97wmQ/MaScqq2mIZ3ZPTpGQBuo5Ffy1aD7+lv+8Ev8rUtgA9fHystiptgXZd2O/J3bsCuqYjfaO04eC5fFE9ipOf3HrpGQ4PHm1VLS4MmgvZlMTS3fDdRsqmAa3WW1B99tIOrRiN+orx3w9ld1jvPVXOqrqE9sE/KdvQyAbnHWh4RTgh32EPABoqrdsc4EWLgmp9Vuw1AbXRq5JiObQlUcrgFTfNr+q3Iu31Xxa4krG6Be8g5MIh+KhErRpDb3DgHs+glzg5KKiHFdYTYMrbF1j9znv3Bn6FekjwSYyZM9f+oKMVUlkMRHtaaKlfbIlGz9dD1whDO59JqhS9251Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtKE4N3HhrZQml7+PIUpQaMs/jQpYfPARtsoX+9U3Lw=;
 b=pTmBtKuHkqcOOZB51Sn3A3JlqXQbjSrikfvxT+BPI3J+ACwAsaqWM7HI4fBnfcGGWIUa/91b6Q7LTBIbP1SJ1WurS2teDMfH1u7u2jtGxFtfXRe8Te/oMBUixvARbqaLoZ5LNoW55bhyfS/b4e6NuYIEWcmuJi8jxTMWEuQwjGLm9g3VXLd5YFJvkJqjIh0R3CYw5vcKuezsNXceIyqHga6eIOjYSH4x0gbaEMf1CAOUh+0xJJxfhauxsdOzhlu3CDoGQqwjVG9kcd8YRtaCCjhtiJe2F5TyOw5PHld0ILKcnkofMNdOOUMHib4JnJfH6379uoG8x6gDi0X9mD9MxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtKE4N3HhrZQml7+PIUpQaMs/jQpYfPARtsoX+9U3Lw=;
 b=fBudnbXP6VGz6c2uAmOGOMe1ON9uau+7BNmMTdREB0Y0jQYhdhD+WMUIUoFwt6cSYYEhHdaX7omrfoz1NqNURnkYzOauwfzSAzi/TJWTl11QoN/18Db6H5pDTtA/EDfaVBNV5ySPB2YGXnI2j6RAC4y2TWY9veLAwQycILWLRlU=
Received: from BN0PR04CA0204.namprd04.prod.outlook.com (2603:10b6:408:e9::29)
 by CH4PR10MB8121.namprd10.prod.outlook.com (2603:10b6:610:247::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Wed, 3 Jun 2026
 20:48:02 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::2) by BN0PR04CA0204.outlook.office365.com
 (2603:10b6:408:e9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 20:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Wed, 3 Jun 2026 20:48:00 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 15:47:36 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 15:47:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 15:47:36 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653Kla2F1956615;
	Wed, 3 Jun 2026 15:47:36 -0500
Message-ID: <2e3fc2d3-4358-4fc3-addf-16829b04fcc7@ti.com>
Date: Wed, 3 Jun 2026 15:47:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][master][PATCH v3] ktx-software: Version change 4.4.0 ->
 5.0.0
To: Khem Raj <raj.khem@gmail.com>
CC: Ryan Eatmon <reatmon@ti.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
References: <20260603192101.3085843-1-a-christidis@ti.com>
 <CAMKF1soJDCcwa4LjXYTdK1PDr5LiO3P5HHzyfFdyfVrdprGO6w@mail.gmail.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <CAMKF1soJDCcwa4LjXYTdK1PDr5LiO3P5HHzyfFdyfVrdprGO6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|CH4PR10MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: b776a4e5-94b0-4721-c05b-08dec1b16660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|13003099007|18002099003|22082099003|4143699003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	h8NH8cw1qsZWLuxiSw8XQ63ThoCRD/vo0JawkJmpRXEza9j8yMzi2hkysnhlpu5dt5HV5d2SgGgr+Fw6Rl73EBWp4aLhLqw5lJ51WNI0Sv7adQZUenmMYPmyWCWGUs62RQhjok3h9qA0Oe8bf7FZOFgsdDXeJ7m2/Ly+w2omVRJbG4zNRK57rBX7zrRpDFNWsg1EOMTpwoBnwBz4SCZxBjI1MGhtOkDNd2FuPKiDbUm72ViirdJgDqQ4m9BW4fIYtPg6iRPu9cWfRx+IGat0hg2dmulQvcVQEeXVToDvRrdSJagMYnn3yPHtRxmV+PUHWhI/uqiah1WU7IS6Uks12U1xs+teNSrE7U//JKikzD8ojU6vWH3LJj1eB6FivHsjv/hIzV5lVnmiP/cmebA/UcZy1+lt66EU+vhOeE85uVqWIxQ1fQFVkJ1kaqsKrnrtoLWPueh48a3zPVTv152FHSyvrBNHYIrcPSxHI5NwyfXw7UHt2825Yfbcl4H2lTFt7V/SKWHo97RzzBjf2RgmD7IPBXyeHbnAmNPmDSgx3nsHf+bGlMlXjOoJth40fQwxCLn+O6ySO/7fSo52SeFKOTrRnSF2uvkUDNDXYZk6zOV8BEXzDzwMvHJMOIZh+mhtjnEsB3chF+WDYJGhBNQKYZfzslexEhpw/Ds1xa9M5eM+WuAexkPh+Laj2t9hh6b4
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(13003099007)(18002099003)(22082099003)(4143699003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AFgqx0YEV+Kl/ZLwwxFGxibtteE2BIMky/u58GOQvtYK5d2R0P6YI0joFkkozK0cSzBQELNP8MF4VC3jD54hwFUWqUHdLzH4uVGArP1UcfFpXfZawkWOLMoRLVWRu4THjjC55JpCK/zPyW07hc8G/qXb37SPJPxB/gKi7XbdEB8v46BhxhV5HMq8IwjfXxJyMeJNwsnKjNozrw0rFc3jlEhCs/DmopW5vq9aH+MA2NoYWkcCaUG5vdhMTU/ZXbgcQ1AYe9FzLnQdx+XCR7D9aWu09DyIRB1n9faJH634HAqf4y25RMRtlNXVsABlFXFknEPiBIk+wMr0g9vSiGs+zLpBE6wC/vHBy4cz504TuYDkgkI4JxQV6woga9IqXz9tGNMA8OKgEPmGBLusmBV56xm2YpIKOL62PuYcHa85Fh+NAC4S+YLFPlR28WaVja35
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 20:48:00.2967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b776a4e5-94b0-4721-c05b-08dec1b16660
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 20:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127387

Dear Khem Raj,


Below is the diff. There are changes in copyrighted content (both new=20
content added and old content changing paths) alongside which licenses=20
go hand in hand.

However, there are no new licenses being added.


diff --git a/KTX-Software-4.4.0/REUSE.toml b/KTX-Software-5.0.0/REUSE.toml
index 82ec6ae..50710a0 100644
--- a/KTX-Software-4.4.0/REUSE.toml
+++ b/KTX-Software-5.0.0/REUSE.toml
@@ -12,61 +12,61 @@ SPDX-FileCopyrightText =3D "2015-2022 The Khronos=20
Group Inc."
 =C2=A0SPDX-License-Identifier =3D "Apache-2.0"

 =C2=A0[[annotations]]
-path =3D ["tests/srcimages/ccwn2c08.png", "tests/srcimages/g03n2c08.png",=
=20
"tests/srcimages/tbrn2c08.png", "tests/srcimages/tbyn3p08.png",=20
"tests/srcimages/tm3n3p02.png"]
+path =3D "tests/resources/input/exr/Desk.exr"
 =C2=A0precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "1996, 2011 Willem van Schaik"
-SPDX-License-Identifier =3D "LicenseRef-PNGSuite"
+SPDX-FileCopyrightText =3D "Copyright (c) 2004, Industrial Light & Magic,=
=20
a division of Lucasfilm Entertainment Company Ltd."
+SPDX-License-Identifier =3D "BSD-3-Clause"

 =C2=A0[[annotations]]
-path =3D "tests/srcimages/kodim17.png"
+path =3D "tests/resources/ktx2/Desk_uastc_hdr4x4_zstd_15.ktx2"
 =C2=A0precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "Eastman Kodak Company"
-SPDX-License-Identifier =3D "LicenseRef-Kodak"
+SPDX-FileCopyrightText =3D "Copyright (c) 2004, Industrial Light & Magic,=
=20
a division of Lucasfilm Entertainment Company Ltd."
+SPDX-License-Identifier =3D "BSD-3-Clause"

 =C2=A0[[annotations]]
-path =3D "tests/srcimages/color_grid.png"
+path =3D "tests/resources/ktx2/Desk_uastc_hdr6x6i.ktx2"
 =C2=A0precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "Unknown"
-SPDX-License-Identifier =3D "Apache-2.0"
+SPDX-FileCopyrightText =3D "Copyright (c) 2004, Industrial Light & Magic,=
=20
a division of Lucasfilm Entertainment Company Ltd."
+SPDX-License-Identifier =3D "BSD-3-Clause"

 =C2=A0[[annotations]]
-path =3D "tests/srcimages/camera_camera_BaseColor_16bit.png"
+path =3D "tests/resources/input/png/kodim17.png"
 =C2=A0precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "UX3D"
-SPDX-License-Identifier =3D "CC0-1.0"
+SPDX-FileCopyrightText =3D "Eastman Kodak Company"
+SPDX-License-Identifier =3D "LicenseRef-Kodak"

 =C2=A0[[annotations]]
-path =3D "tests/srcimages/FlightHelmet_baseColor.png"
+path =3D "tests/resources/input/png/color_grid.png"
 =C2=A0precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "Microsoft"
-SPDX-License-Identifier =3D "CC0-1.0"
+SPDX-FileCopyrightText =3D "Unknown"
+SPDX-License-Identifier =3D "Apache-2.0"

 =C2=A0[[annotations]]
-path =3D "tests/srcimages/CesiumLogoFlat_palette.png"
+path =3D "tests/resources/input/png/FlightHelmet_baseColor.png"
 =C2=A0precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "Analytical Graphics"
-SPDX-License-Identifier =3D "CC-BY-4.0 WITH=20
LicenseRef-Cesium-Trademark-Terms"
+SPDX-FileCopyrightText =3D "Microsoft"
+SPDX-License-Identifier =3D "CC0-1.0"

 =C2=A0[[annotations]]
-path =3D ["tests/testimages/hi_mark.ktx", "tests/testimages/hi_mark_sq.ktx=
"]
+path =3D ["tests/resources/ktx/hi_mark.ktx",=20
"tests/resources/ktx/hi_mark_sq.ktx"]
 =C2=A0precedence =3D "aggregate"
 =C2=A0SPDX-FileCopyrightText =3D "HI Corporation"
 =C2=A0SPDX-License-Identifier =3D "LicenseRef-HI-Trademark"

 =C2=A0[[annotations]]
-path =3D "tests/srcimages/Iron_Bars/**"
+path =3D "tests/resources/input/jpg/Iron_Bars/**"
 =C2=A0precedence =3D "aggregate"
 =C2=A0SPDX-FileCopyrightText =3D "Katsuagi https://3dtextures.me"
 =C2=A0SPDX-License-Identifier =3D "CC0-1.0"

 =C2=A0[[annotations]]
-path =3D ["tests/srcimages/GoldenGateBridge3/**",=20
"tests/srcimages/Yokohama3/**"]
+path =3D ["tests/resources/input/jpg/GoldenGateBridge3/**",=20
"tests/resources/input/jpg/Yokohama3/**"]
 =C2=A0precedence =3D "aggregate"
 =C2=A0SPDX-FileCopyrightText =3D "Emil Persson http://www.humus.name"
 =C2=A0SPDX-License-Identifier =3D "CC-BY-3.0"

 =C2=A0[[annotations]]
-path =3D ["tests/testimages/skybox.ktx2",=20
"tests/testimages/skybox_zstd.ktx2"]
+path =3D ["tests/resources/ktx2/skybox.ktx2",=20
"tests/resources/ktx2/skybox_zstd.ktx2"]
 =C2=A0precedence =3D "aggregate"
 =C2=A0SPDX-FileCopyrightText =3D "HDRIHaven"
 =C2=A0SPDX-License-Identifier =3D "CC0-1.0"
@@ -96,57 +96,9 @@ SPDX-FileCopyrightText =3D "2017-2020 Mark Callow"
 =C2=A0SPDX-License-Identifier =3D "Apache-2.0"

 =C2=A0[[annotations]]
-path =3D ["external/basisu/Docs/**", "external/basisu/Test/**",=20
"external/basisu/jenkins/**", "external/basisu/.gitattributes",=20
"external/basisu/.gitignore", "external/basisu/.gitmodules",=20
"external/basisu/.pylintrc", "external/basisu/README.md",=20
"external/basisu/Utils/Example/README.md"]
+path =3D "external/lodepng/**"
 =C2=A0precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "2020-2021 Arm Limited"
-SPDX-License-Identifier =3D "Apache-2.0"
-
-[[annotations]]
-path =3D "external/basisu/.gitrepo"
-precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "2021 Mark Callow"
-SPDX-License-Identifier =3D "Apache-2.0"
-
-[[annotations]]
-path =3D "external/basisu/Source/stb_image**.h"
-precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "2017 Sean Barrett"
-SPDX-License-Identifier =3D "MIT"
-
-[[annotations]]
-path =3D "external/basisu/Source/tinyexr.h"
-precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "2014-2019 Syoyo Fujita and many contributors"
-SPDX-License-Identifier =3D "BSD-3-Clause"
-
-[[annotations]]
-path =3D "external/basisu/Source/wuffs-v0.3.c"
-precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "2022 The Wuffs Authors."
-SPDX-License-Identifier =3D "Apache-2.0"
-
-[[annotations]]
-path =3D "external/basisu/**"
-precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "2019-2020 Binomial LLC"
-SPDX-License-Identifier =3D "Apache-2.0"
-
-[[annotations]]
-path =3D ["external/basisu/apg_bmp.**", "external/basisu/CMakeLists.txt",=
=20
"external/basisu/webgl/transcoder/CMakeLists.txt"]
-precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "2019 Anton Gerdelan"
-SPDX-License-Identifier =3D "Apache-2.0"
-
-[[annotations]]
-path =3D "external/basisu/basisu_astc_decomp.**"
-precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "2016 The Android Open Source Project"
-SPDX-License-Identifier =3D "Apache-2.0"
-
-[[annotations]]
-path =3D "tools/imageio/png.imageio/lodepng.**"
-precedence =3D "aggregate"
-SPDX-FileCopyrightText =3D "2005-2019 Lode Vandevenne"
+SPDX-FileCopyrightText =3D "2005-2025 Lode Vandevenne"
 =C2=A0SPDX-License-Identifier =3D "Zlib"

 =C2=A0[[annotations]]
@@ -161,6 +113,12 @@ precedence =3D "aggregate"
 =C2=A0SPDX-FileCopyrightText =3D "2019-2020 The Khronos Group Inc"
 =C2=A0SPDX-License-Identifier =3D "Apache-2.0"

+[[annotations]]
+path =3D "external/SDL_gesture/SDL_gesture.h"
+precedence =3D "aggregate"
+SPDX-FileCopyrightText =3D "1997-2022 Sam Lantinga <slouken@libsdl.org>"
+SPDX-License-Identifier =3D "Zlib"
+
 =C2=A0[[annotations]]
 =C2=A0path =3D "cmake/modules/FindVulkan.cmake"
 =C2=A0precedence =3D "aggregate"

On 6/3/26 2:34 PM, Khem Raj wrote:
> Can you show the diff between old and new text file
>
> On Wed, Jun 3, 2026, 9:21=E2=80=AFPM <a-christidis@ti.com> wrote:
>
>     From: Antonios Christidis <a-christidis@ti.com>
>
>     Major 5.0.0 version update. On top of new features, this version fixe=
s
>     compilation issues with GCC 16 and C++20.
>
>     License-Update: Due to new copyrighted material, no new license.
>
>     Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>     ---
>     v3:
>     - Use of License-Update tag
>     v2:
>     - Add reasoning for why LIC_FILES_CHKSUM changed
>
>     =C2=A0.../{ktx-software_4.4.0.bb <http://ktx-software_4.4.0.bb> =3D>
>     ktx-software_5.0.0.bb <http://ktx-software_5.0.0.bb>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 4
>     ++--
>     =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>     =C2=A0rename
>     meta-oe/recipes-graphics/ktx-software/{ktx-software_4.4.0.bb
>     <http://ktx-software_4.4.0.bb> =3D> ktx-software_5.0.0.bb
>     <http://ktx-software_5.0.0.bb>} (85%)
>
>     diff --git
>     a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
>     <http://ktx-software_4.4.0.bb>
>     b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
>     <http://ktx-software_5.0.0.bb>
>     similarity index 85%
>     rename from
>     meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
>     <http://ktx-software_4.4.0.bb>
>     rename to
>     meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
>     <http://ktx-software_5.0.0.bb>
>     index ae4caeb89c..8db0c79b87 100644
>     --- a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
>     <http://ktx-software_4.4.0.bb>
>     +++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
>     <http://ktx-software_5.0.0.bb>
>     @@ -6,10 +6,10 @@ LICENSE =3D "Apache-2.0 & BSD-1-Clause &
>     BSD-2-Clause & BSD-3-Clause & BSL-1.0 \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0& CC-BY-3.0 & CC-BY-4.0 & CC=
0-1.0 & Zlib & MIT &
>     HI-Trademark & fmt & \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kodak & PNGSuite & ETCSLA & =
Cesium-Trademark-Terms"
>
>     -LIC_FILES_CHKSUM =3D
>     "file://REUSE.toml;md5=3D45910de791d599e6ba472f6fa506f391"
>     +LIC_FILES_CHKSUM =3D
>     "file://REUSE.toml;md5=3D9f87c97ba36aab42411bf93c094a61f2"
>
>     =C2=A0SRC_URI =3D
>     "git://github.com/KhronosGroup/KTX-Software.git;protocol=3Dhttps;bran=
ch=3Dmain;lfs=3D0
>     <http://github.com/KhronosGroup/KTX-Software.git;protocol=3Dhttps;bra=
nch=3Dmain;lfs=3D0>"
>     -SRCREV =3D "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
>     +SRCREV =3D "6269d2752ed04446c2d4749f54f3aad4f94555b5"
>
>     =C2=A0inherit cmake
>
>     --=20
>     2.34.1
>

