Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00629C02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 20:08:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.27])
 by mx.groups.io with SMTP id smtpd.web11.98042.1738613315866070844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 12:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=jyT/acVW;
 spf=pass (domain: axis.com, ip: 40.107.159.27, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiKQlL/lSyLCCBPxenk2jK+RGBGA9QVK3EHoacTxZ66pA35i98olS6zOidxUFUdQTCnAXk7PRPDuc7eJYUcBelZWkq8/kzeOcWbGPTZkYwGO4dky7UnWOzR/y/b6oFll1kJwzZrVsAFE8r4oxmzjQWrnNJTJIB+HoNbK1rfEdKb0eaD5pY4xbux7fGfFzrnGHuqBQfG6xDqw7pTNhjiBN5KXQUsnqHLtDzMquLqlZ23PkobKbNwIX0cOOzpq/vmwO9n5SLJM+rZydKxq18FiwVrJHlKDfzqikq8VrC2hlPF9qfMx41is+PP894FWfF0ApVQLJTQVC9DNPqYSV0/AKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYvQahW8YM+C8a4+5WGEVftXDBhZJVPfs6mYOUWn5S4=;
 b=c+tYwBTschBHhPmoslnbOEwOZROiaKcwkkXPmMB8ZpASO+oz9tQKH5toQydvD922hmqc6UcfB+aiFdn0vaOqSBm/P7b/R8wX5MlMeHqGYx7WqI0mevle5XaKf19bfVFmVsacFHlahs392p3KcTMDm7780nQZ6Gnbgnr8+Qiz9JsLtCRDT/iL5/I5ZfSi6jCzALKMUPU/RdHQwrSwDqwzYIW7JtKbbQf/DpA/7CKfMgekqu4CzkuMeqe2hPLSBSzLp6MQTqg55nBw/BWwKlRMsCeH4qU2Bhqg/DY4WN6k4AdUMD3IgFeEVhiHFnMSl0YMxaNyP7T1QtJJlqO108Ac7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYvQahW8YM+C8a4+5WGEVftXDBhZJVPfs6mYOUWn5S4=;
 b=jyT/acVWSDbey0ThGJG/HLLnDnF3Yb58mgJtlb2gPChvLSQfNw69W0iEktyDa3prCI0OyjbjaMieU5uxtTGFGslHoq3yq/FxvcfZ0QriIGBtE12fBKkO9GoU+X/WL8BCem6wlqxg3TfxBrFXqnCw/QNmw1x/mR95DShOl8DgORc=
Received: from AM0PR07CA0012.eurprd07.prod.outlook.com (2603:10a6:208:ac::25)
 by VI0PR02MB10587.eurprd02.prod.outlook.com (2603:10a6:800:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Mon, 3 Feb
 2025 20:08:30 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:208:ac:cafe::74) by AM0PR07CA0012.outlook.office365.com
 (2603:10a6:208:ac::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Mon,
 3 Feb 2025 20:08:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 20:08:29 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 3 Feb
 2025 21:08:28 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 3 Feb 2025 21:08:28 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E98CD285
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Feb 2025 21:08:28 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 513K8S5p1200028
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Feb 2025 21:08:28 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 513K8S5N1200027
	for openembedded-devel@lists.openembedded.org; Mon, 3 Feb 2025 21:08:28 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] licenses/MINPACK: Remove
Date: Mon, 3 Feb 2025 21:08:23 +0100
Message-ID: <20250203200823.1199979-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250203200823.1199979-1-pkj@axis.com>
References: <20250203200823.1199979-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|VI0PR02MB10587:EE_
X-MS-Office365-Filtering-Correlation-Id: 4053b02c-4496-4b1c-7f20-08dd448e86d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?odPdp5af2QjvbMFYjDrB2po+Bl5Oe/bn6EdCxuzYvn/Fh0rS6oHp2cZqob/n?=
 =?us-ascii?Q?sOUfLA8gp/OLreLhHs3S3WQ5bZlKepV3BRUIfUMJmDw11W/hpb39l12u+Juo?=
 =?us-ascii?Q?B3G7ZthQFzG2KqNfbS1pEM/o2PDvoFNhWkG2ITfZ5A7JVCk3sh/NnUDOF7wL?=
 =?us-ascii?Q?SawV+Ya/5Mr4r+RRHkUAkc7Ec/koNZaoR8hfmuVsooNywab4bcQOvCzMoB4H?=
 =?us-ascii?Q?sV5803SqmS59idnNQ2Eekf2olQpUn2i8J1jbFBoCgvg0aGuO9TlA1tfq8Vcy?=
 =?us-ascii?Q?SZm4Bb24W9Bvm8eEi//cJQpg9DxkrYeKq3ly6LGg4XdCW3lgNqosgvm0psEO?=
 =?us-ascii?Q?+QghXOmb7V7a0K6J/85O/CyzHaZlk41q7kkqingn3EhAaXJZYvAZGxgjzo09?=
 =?us-ascii?Q?iGDDj0dPwKzLZWveqTflaNfLF+MG1hrPX5El29uVwu6y9yuoda0QrGCxiOsu?=
 =?us-ascii?Q?MWTZy/egBb+8qC7A6P7Rua/A6pU/Wvj5/8RnMM/obPYjp35oEFtM3hUYMNTn?=
 =?us-ascii?Q?6sZcOh8jHvTObXQyv7jIaRQjxCCL8vAmaFu+PlfCE2CEgAilBKO7IsZt5Y7C?=
 =?us-ascii?Q?tvHjxWFscPSIyeoxnJw1zf0cA/LfEtNvANEmYu+uOl9f5wv5xUfe984Hw4WN?=
 =?us-ascii?Q?xkbsNj9DMBNniCHC8h47DQCi5nK+Chx8b5r+V6fYvOjUu9KQ/QO6TY6PMoat?=
 =?us-ascii?Q?DrvFXxW9TRntOQJ3I+PpbtMBsrMK/3LvZDx/nypmap/CrrIMdoabLLUY4PCW?=
 =?us-ascii?Q?iKX4kHwOj1bYD5xXAKO5UZEnws4BMxajd1LIKCkYgz7dq8nT9oSyWEZ4ScwR?=
 =?us-ascii?Q?dM6x/+DTKWtJ9+exTOVggI1so0jlpRsIUiEAIBKUDKFEUFNHagAU9vSha79M?=
 =?us-ascii?Q?cjIjyAwcst+X2x0iNyPC99Vk6K7nyDO8WGzTNB5jbspDtoyM5szt7dEXLknH?=
 =?us-ascii?Q?fTZj+gxN7qoCWEoUtsa+2ua7Hci3zYhoAni2KlksOoNpINWpz0yAwUnMk6ji?=
 =?us-ascii?Q?MAlSDsnkDKGWmIeA7hoii9pL2v9H72FCLBJiYuDhokcwlL0ytHfEral/Acln?=
 =?us-ascii?Q?n1G8BQ8iRjnTG1QDxwIAB0Pj3z4MP1ovrzYAwFg0xiYtcWDEydITYsYFAabQ?=
 =?us-ascii?Q?Q72PnfiQazGcSByvZGW8BErt4EdqL0WS5c+JvMFcV/EcSgN8TG5a7I7xKT85?=
 =?us-ascii?Q?c/+7myUpUek9Fq5A92EeoQ06oeMhgUhQ73La04Y7Vq55xVMLK7s4SFMZEoZ4?=
 =?us-ascii?Q?xXwU2BY4EGPJ4RYSRIe0XspJzBIAn9anHowbjK5AtHDY5UoskDySZLrJl7JA?=
 =?us-ascii?Q?EK5qAh1u/NNjNjTfEXGFF6LudRfdbTylSzSGCwRqB+3YAyDGMVb6wJBffG6h?=
 =?us-ascii?Q?kBvvQPJBwYzgyxUFfbe2CiR/vD8rYWbhwjBW97vp62TtqR/56M3i437PN33+?=
 =?us-ascii?Q?Zj+cADi00FeEhodlE+0oMph+gyAo7ylyKja06zKHfTB9M8AENOAxzr8BzpVW?=
 =?us-ascii?Q?Yz03EGcOwn8+N2g=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 20:08:29.4193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4053b02c-4496-4b1c-7f20-08dd448e86d5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10587
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 20:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115258

The libeigen recipe, which was the only user of this license file, now
uses the Minpack license from OE-Core instead.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/licenses/MINPACK | 51 ----------------------------------------
 1 file changed, 51 deletions(-)
 delete mode 100644 meta-oe/licenses/MINPACK

diff --git a/meta-oe/licenses/MINPACK b/meta-oe/licenses/MINPACK
deleted file mode 100644
index 132cc3f33f..0000000000
--- a/meta-oe/licenses/MINPACK
+++ /dev/null
@@ -1,51 +0,0 @@
-Minpack Copyright Notice (1999) University of Chicago.  All rights reserve=
d
-
-Redistribution and use in source and binary forms, with or
-without modification, are permitted provided that the
-following conditions are met:
-
-1. Redistributions of source code must retain the above
-copyright notice, this list of conditions and the following
-disclaimer.
-
-2. Redistributions in binary form must reproduce the above
-copyright notice, this list of conditions and the following
-disclaimer in the documentation and/or other materials
-provided with the distribution.
-
-3. The end-user documentation included with the
-redistribution, if any, must include the following
-acknowledgment:
-
-   "This product includes software developed by the
-   University of Chicago, as Operator of Argonne National
-   Laboratory.
-
-Alternately, this acknowledgment may appear in the software
-itself, if and wherever such third-party acknowledgments
-normally appear.
-
-4. WARRANTY DISCLAIMER. THE SOFTWARE IS SUPPLIED "AS IS"
-WITHOUT WARRANTY OF ANY KIND. THE COPYRIGHT HOLDER, THE
-UNITED STATES, THE UNITED STATES DEPARTMENT OF ENERGY, AND
-THEIR EMPLOYEES: (1) DISCLAIM ANY WARRANTIES, EXPRESS OR
-IMPLIED, INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES
-OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE
-OR NON-INFRINGEMENT, (2) DO NOT ASSUME ANY LEGAL LIABILITY
-OR RESPONSIBILITY FOR THE ACCURACY, COMPLETENESS, OR
-USEFULNESS OF THE SOFTWARE, (3) DO NOT REPRESENT THAT USE OF
-THE SOFTWARE WOULD NOT INFRINGE PRIVATELY OWNED RIGHTS, (4)
-DO NOT WARRANT THAT THE SOFTWARE WILL FUNCTION
-UNINTERRUPTED, THAT IT IS ERROR-FREE OR THAT ANY ERRORS WILL
-BE CORRECTED.
-
-5. LIMITATION OF LIABILITY. IN NO EVENT WILL THE COPYRIGHT
-HOLDER, THE UNITED STATES, THE UNITED STATES DEPARTMENT OF
-ENERGY, OR THEIR EMPLOYEES: BE LIABLE FOR ANY INDIRECT,
-INCIDENTAL, CONSEQUENTIAL, SPECIAL OR PUNITIVE DAMAGES OF
-ANY KIND OR NATURE, INCLUDING BUT NOT LIMITED TO LOSS OF
-PROFITS OR LOSS OF DATA, FOR ANY REASON WHATSOEVER, WHETHER
-SUCH LIABILITY IS ASSERTED ON THE BASIS OF CONTRACT, TORT
-(INCLUDING NEGLIGENCE OR STRICT LIABILITY), OR OTHERWISE,
-EVEN IF ANY OF SAID PARTIES HAS BEEN WARNED OF THE
-POSSIBILITY OF SUCH LOSS OR DAMAGES.

