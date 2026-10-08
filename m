Return-Path: <t.schmelzer@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41550CA600E
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 10:06:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12209.1791454014498178801
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 03:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=aQo0vBbJ;
 spf=pass (domain: phytec.de, ip: 52.101.83.84, mailfrom: t.schmelzer@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4UPDMKdP8ll43nXrZyMdneJzKaLEgHwj5ORhs3cWA+C1q8uiNfOZICe2hGgtaxR0ihXE5Zur9b9Vtiw3+eAT/ddzulVyKliw+E9ETRobJoZaREok4f8D0OmcY2bv0cRi8mhWPBnn2gaOe6hQUbjHvDfq8YZHJ1QO11Zho2LwuuegeFhcrcqQs3NOdP/CXfa4XTb0aRGcPvxaeNlOjR8HSPXhfOc6nV7SryM9WTi33JxqJeOJwQ7JZfPujZfaWTQIrQgm+Aqw2N0oyTlXbmnp3vmt4nnCsCzhaxWeKh5yiPBeV3lqPQRQ4/IepFY68plKaN9pBvppq3vrZMrqvXTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYADv8rdOnc4yDPcQT4Gwf6NfFI0JcfoTnEOkuC6nA0=;
 b=naCPKQ0b2QKjQM6iAaKyljz5hFghoHWEgwmhX2NvDVmzho5KKqTXxV07/PSft/3SCbraBTw8512avZgT2EgPGAK1uBEpu3ykFPp6h1nBE5+sQGEQVOuT1GmaKebLok3iHGXZA4BTvMuvAQo5FOrvCOGjdUVpDVnCyuGcVWLIOmU4DOVu9H62niWGqQNx7OkPFDq1yvyzK+upsVs6IMIVWHDJ+vOE5KCBgZcfJRamMg80OJwnvgKeGclUdincnzU4cAHDeC2RCXcP8WmJMs4PMYqo98y8tz5fhZnmzo/A0fMg8O4ub1Sxp74hTmbsjXML06slvLA9IluqBsJMMyXqWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYADv8rdOnc4yDPcQT4Gwf6NfFI0JcfoTnEOkuC6nA0=;
 b=aQo0vBbJ6G9QCVLPJeMd6XbPsUx6aoQSMHVOrfQNoaAH7OBTT3rhkJo1Q34I0PqFMpkE3WLkQhZ+5P5OYRowG/7mRJVleRqz4CQ3Y2S0u9rfN5ilhby0fnqn70muDAutOIOIH7RnFpPjwPG4bjsRSYBZJZXK/3p8t3PZVybyZl+idbF+hncOTiXmWF6SSZIl6htjEO6G+syz4tiUiiQANCbABy3pwdlQki9Ka7451SB6p60OXGu2GFPoNyhRjJtNOC9AjCov11brdzf6AFV30U6AHlzX9jo1YX7rj83Aqxz6UfMkcmRT+KzlEVrPQpGyLFGZWSoE3PsltFumtNsKXw==
Received: from DUZPR01CA0341.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::11) by GV2P195MB2114.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:150:b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 8 Oct
 2026 10:06:48 +0000
Received: from MAD0EPF000008BA.eurprd04.prod.outlook.com
 (2603:10a6:10:4b8:cafe::6a) by DUZPR01CA0341.outlook.office365.com
 (2603:10a6:10:4b8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Thu, 8
 Oct 2026 10:06:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008BA.mail.protection.outlook.com (10.167.241.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 10:06:47 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 12:06:41 +0200
From: Thorsten Schmelzer <t.schmelzer@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [meta-oe][PATCH 5/5] lvgl-demo-fb: update defconfig
Date: Thu, 8 Oct 2026 12:06:26 +0200
Message-ID: <20261008100626.2259941-6-t.schmelzer@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008100626.2259941-1-t.schmelzer@phytec.de>
References: <20261008100626.2259941-1-t.schmelzer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BA:EE_|GV2P195MB2114:EE_
X-MS-Office365-Filtering-Correlation-Id: a539f0dd-a162-41df-ce35-08df2523dd7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|42112799006|23010399003|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ixmR49c1HRwJDmxkV9L0UszOeBq2ixlZwe07KIKYbF6xDKSmctVLR2NN23mqgl1EGUMtfz1rDZbqHCqS1ZkiWf3euOvF3aWZ1otwgzsA3pkmjylRONoh17ECwQnRDBPyO73nfF3jvq8OmRSJM2haRU0a3lBSMRuhCNAekquVmRTYlb9SKdyH/WGr5MfIx6mwzCyB91L0WzXV96epQAzdYSeKmZI5ED3dKYxdgjpji8aucO9D6O6FNniJN95Um+qTRMpvJDTfX9xWISDh3v846J5q4UQE2K1f4t+6xss3W79v2b7+LzXexBO+GFYwV0QQOssblsUk9aUxoGJzIrcB5jdM+OwGfeFn8kgM3S3t5oV7UUpi+YXejanfdhO3Fa3ziQNEr1GAgbHGj7JYApegme95bfbIPoV8JNPkDejnJURxApQOyGiKT6PEZt7wTpgDMJwGJRVOeXkOoxgy6QgA5XQ5diSh/my59RRdg6C2f/0AQcpQRQ9EB7FXLE/MIOfULTPJGvTMbHVn5bNvKuRXbFt0Eao37MM06VnejfLk6D/6UjLT314pMbezNe4pEWjA9gToXSJ97e+wCeK9eokwOyH73k+DLoEgvyBgl7Ssr0hWI1cRfVXory2ZJEYGfWDms+W7ZN/w1xUucz56PAUFZGZ7eo+eA8Crwbqli84KbD74vovVha9n0Jd1ugXC60U/UScww5Aeq4AFL8gI1KcOBQ==
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(42112799006)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rkI8cMWsl3E+yr98Y2iZEInlBFTSu2B/1o4jO1jrAUfcVTUYE5UWTxB/KM/aMuhoYKNo0ulIz7Az0aPnDWWH1MntQittgDItXcsZxx14uJfMWuw5LlYa/sD8XVw60e5R5fEOSJG1KFoOPkkfrhITlyd9YTf4vBJBVdxT0JS19pUGdf9QieEc+tDHxJm6Attnd9FfmVhxfdJyTHI4GxNVJG76UpY5jpsnPE5ApvFvX44EiZn5l1KidinVmoS/EpiNCXEqveAIq+z9Y9oawkrmg+No7znLnFx44X8311PW8B/c/Qnh6T7kUNzvaGGVk0Jdy3TPhkOoUlVFm23iBAGmP2kLZM65zMstGCETAyeBE9l440wdm0moRB/+EOaHyoc4qCu7+LyCK5wCLI1hRJbg3WO1GOjqxCj0JEVp+zsEwklk39G1sYapPC0AddX9Yw5Z
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:47.9302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a539f0dd-a162-41df-ce35-08df2523dd7e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB2114
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 10:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130669

Update the defconfig to use more linux default settings. Most
settings are imported from the get_started.defconfig from the source
repository. This includes the following changes:
- use libc based malloc, string, sprintf
- use OS based pthread implementation
- include fonts
- include performance monitor
- remove CONFIG_LV_MEM_SIZE_KILOBYTES, not necessary when using libc
  memory management
- set refresh period to 16 ms (60 FPS max)
- increase LV_DRAW_LAYER_SIMPLE_BUF_SIZE and LV_DRAW_THREAD_STACK_SIZE

Signed-off-by: Thorsten Schmelzer <t.schmelzer@phytec.de>
---
 .../lvgl/lvgl-demo-fb/defconfig               | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb/defconfig b/meta-oe=
/recipes-graphics/lvgl/lvgl-demo-fb/defconfig
index 9d4ffa9b40c9..f85f5895a438 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb/defconfig
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb/defconfig
@@ -1,6 +1,35 @@
+CONFIG_LV_USE_CLIB_MALLOC=3Dy
+CONFIG_LV_USE_CLIB_STRING=3Dy
+CONFIG_LV_USE_CLIB_SPRINTF=3Dy
+CONFIG_LV_OS_PTHREAD=3Dy
 CONFIG_LV_COLOR_DEPTH_32=3Dy
-CONFIG_LV_MEM_SIZE_KILOBYTES=3D256
 CONFIG_LV_USE_LOG=3Dy
 CONFIG_LV_LOG_PRINTF=3Dy
-CONFIG_LV_USE_FONT_COMPRESSED=3Dy
+CONFIG_LV_FONT_MONTSERRAT_8=3Dy
+CONFIG_LV_FONT_MONTSERRAT_10=3Dy
+CONFIG_LV_FONT_MONTSERRAT_12=3Dy
+CONFIG_LV_FONT_MONTSERRAT_16=3Dy
+CONFIG_LV_FONT_MONTSERRAT_18=3Dy
+CONFIG_LV_FONT_MONTSERRAT_20=3Dy
+CONFIG_LV_FONT_MONTSERRAT_22=3Dy
+CONFIG_LV_FONT_MONTSERRAT_24=3Dy
+CONFIG_LV_FONT_MONTSERRAT_26=3Dy
+CONFIG_LV_FONT_MONTSERRAT_28=3Dy
+CONFIG_LV_FONT_MONTSERRAT_30=3Dy
+CONFIG_LV_FONT_MONTSERRAT_32=3Dy
+CONFIG_LV_FONT_MONTSERRAT_34=3Dy
+CONFIG_LV_FONT_MONTSERRAT_36=3Dy
+CONFIG_LV_FONT_MONTSERRAT_38=3Dy
+CONFIG_LV_FONT_MONTSERRAT_40=3Dy
+CONFIG_LV_FONT_MONTSERRAT_42=3Dy
+CONFIG_LV_FONT_MONTSERRAT_44=3Dy
+CONFIG_LV_FONT_MONTSERRAT_46=3Dy
+CONFIG_LV_FONT_MONTSERRAT_48=3Dy
+CONFIG_LV_FONT_MONTSERRAT_28_COMPRESSED=3Dy
+CONFIG_LV_USE_SYSMON=3Dy
+CONFIG_LV_SYSMON_PROC_IDLE_AVAILABLE=3Dy
+CONFIG_LV_USE_PERF_MONITOR=3Dy
 CONFIG_LV_USE_DEMO_WIDGETS=3Dy
+CONFIG_LV_DEF_REFR_PERIOD=3D16
+CONFIG_LV_DRAW_LAYER_SIMPLE_BUF_SIZE=3D262144
+CONFIG_LV_DRAW_THREAD_STACK_SIZE=3D65536

