Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50823CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 11:24:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14197.1762249558691135410
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 01:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@philips.com header.s=selector1 header.b=h86Pxz/T;
 spf=pass (domain: bbl.ms.philips.com, ip: 52.101.70.9, mailfrom: tgiulian@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ev7cEXH2KEVPyP3PiHwIaGdBa9om4lq3nAeUhDBGm9jlAq0HXOvZ2XPfBmjancNj0Gu/mlPYAftU11Q/6Wn/onPnGVO1YXv2QqAvzoStrXMJmB3MAP/MviHPzVGm07v2f0QNm0mA+F2AUkFI5qm1jtUHHIApD9O9RTeV8vRZ+/MjdrHTQtvxtqUVRTi8sFEhOTHb3jFj7UlrmhO2hQQzpfhh7k/eHxGUX6YINzn3i+TeCq2s7iT+JBUTZvC/tfs8m9NMlERFL86fHk7A1cHLJHfSOU2mDb3wYdu2ApIPpbqmnHR8FHd4EAiMhKi+OMZBYaEpbF+Sbq+yeV4W0YaYXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBYOkhgJzcW/6r8P9AStO9rNLEpz/n3ceeOcGTiKwFs=;
 b=GGi3bqYrIxSRJQAR+S4i/6xv0AiQLPo5KDpMZdTLVCf+/9ZpTxLxvvfVDIPFxDywSgWtrdCiFuBduP/R9Hl6NsT0yDV8nbBQ/m6nOimRZwi9QgntR+XrSGi+3wyCnnDhlCbKOeZLHpI1jSvpTIf7TY0+5jD85Ox3rYpwDOstHIecHgn6f262hFZbLbXm+5JpwxRzS4jMy/T9TRz4WhrkTTywN43QJisu91mxUQMEuMAn90kmiho1rBZmkxXbhpqHhQ4vbVaB/RoEAEUdxNOhTKvOXSzIuBI27UgwMA6fb23agn3U6QEIPHXwOQsJBDAbFp2zNWHz8z+vHcJOtj4kUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBYOkhgJzcW/6r8P9AStO9rNLEpz/n3ceeOcGTiKwFs=;
 b=h86Pxz/T8bqjNEJDN8zZp4v4pjvdUvok/ru5t57bUs1ATzLbW1zAcshTY8TmCH82gMZFk2N1EkAWXhurgvMYbSDcYGtbymG6R4IaXZaeCiO1INaXJs8dFN75azTAqffzA9HMX1WbHWlgGpdJta42e7Zmfa+bCQ9Nkeq6mfGGFtg=
Received: from CWLP265CA0483.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18a::17)
 by PR3P122MB0291.EURP122.PROD.OUTLOOK.COM (2603:10a6:102:16::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 09:30:28 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:400:18a:cafe::e7) by CWLP265CA0483.outlook.office365.com
 (2603:10a6:400:18a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 09:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 3.248.88.141)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 09:30:27 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id GBtDvkMd7tKtZGDMxv9Flp; Tue, 04 Nov 2025 10:30:27 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id GDMxvOuE3IHN7GDMxvacfQ; Tue, 04 Nov 2025 10:30:27 +0100
Received: from bbl2xbm1.bbl.ms.philips.com (bbl2xbm1.bbl.ms.philips.com [130.143.220.186])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 48D2618477E;
	Tue,  4 Nov 2025 10:30:27 +0100 (CET)
Received: by bbl2xbm1.bbl.ms.philips.com (Postfix, from userid 2462)
	id 41A02300108; Tue,  4 Nov 2025 10:30:27 +0100 (CET)
From: Timotheus Giuliani <timotheus.giuliani@philips.com>
To: openembedded-devel@lists.openembedded.org
CC: Timotheus Giuliani <timotheus.giuliani@philips.com>
Subject: [meta-oe][PATCH 1/2] fluentbit: set source directory to enable patch application
Date: Tue,  4 Nov 2025 10:30:16 +0100
Message-ID: <20251104093017.474084-1-timotheus.giuliani@philips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B7:EE_|PR3P122MB0291:EE_
X-MS-Office365-Filtering-Correlation-Id: f7cc1b15-7709-4b58-030e-08de1b84ca4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w9U/0LwzKKCXh7F3P1hMTM0AkY3duknTjYdj9zrcKp5djZEELnIKpiofyQu0?=
 =?us-ascii?Q?q4pyV8EUPKmjmF+caOOdEOkkCfzJoxxwMnjJIX8AodHxu7iwxrmuqqfPv8Pm?=
 =?us-ascii?Q?HUD+c92/JsVm+a1qR6SQ6ASoQCqcn+5wv7/b+6AUpQkpLvCqn/9adm3+udHA?=
 =?us-ascii?Q?+vyXlROmygvQfO7cIURSnGKA4bCsDNOm2ZTKcnR34M/U4xnbT9K1zIVLIatP?=
 =?us-ascii?Q?SYvckxfh1Re75YYs7MGTdAqCSfIV+D4w4DmayTSgnu4zDXPUmeIsXbtQO+HV?=
 =?us-ascii?Q?MFqVm4h9tbueOut+HzFOJRfC3SFed3LXhXolmznC1Z+0kWt8PAFJrNsurPsc?=
 =?us-ascii?Q?QBmYfvv/V67fTkpKja15L01wjJntQADok7BeNR1csqjCli7YVJiCoJd4VdLY?=
 =?us-ascii?Q?AS/Er5QlLqB517LqA5bmjDhgiZlUU6hNmguc8UnVzYf3s0nWjSU6GPY23bGv?=
 =?us-ascii?Q?3J8YD959E3HTrG949AD2zHvvvq70rADwbt8GQw7OzwhhCEyhdTe6BjDNXg8v?=
 =?us-ascii?Q?Cb6sXmuQTjSh7NNu0QLwn5q0R0xbE/LklLkVYkqclldQQatuq3Hv14cpuPfR?=
 =?us-ascii?Q?3OE0ka/L+sKsozy6RZ2KSG679Ftj/uuBr7tNIzJd7QXUCGmw1EC+OZCLn7fA?=
 =?us-ascii?Q?eHw6clBaYjZXJxgNDHfkI4obGuNSviEQef+V0HpzBNVdgOWteotoaq4G3No/?=
 =?us-ascii?Q?tQ8apeUVOVLEXkqd86IzCMjQGNIKHaWbrlb5LqALLo8IRXvNFp4Zhs03GWdK?=
 =?us-ascii?Q?szK4MABrAGPljDjqNVzVk33PMVQU24ZdtIU16bvGyEQzkE8HYEChmb0mZejj?=
 =?us-ascii?Q?TJWUR0NwnU/NKpTUJieOTq7PEwdGDUUdNzKSUW5dYH7tRPZGfYYd+o7XK8MT?=
 =?us-ascii?Q?5URGTa89AwPnR+I6jyPMxwrgcwlUUu+O5fH3Gve5BWebLwAHK9i+fM9oRkSd?=
 =?us-ascii?Q?8lciR0xgkfd5KhjRQSFc/eQumIGS6Hho9ipixVn2MsvgRmV/+7j0g2qh+Iex?=
 =?us-ascii?Q?gA1sOVumjGVxykylX3fkEzrYuwrvJ3sFUZwgGRWv9okCnfbQ27KQm4v/+hVs?=
 =?us-ascii?Q?M5H1zeYaZs9TiTv7ewWsS9Ukg5S1+8kvIsWLE+saag0NSTdp6OUi7M2pK4DS?=
 =?us-ascii?Q?qjnMG/mq7TSUIIAVT2j0KQGRMOcmodMQF07rhXrpoW9nHxpogZYrKWfnCkUI?=
 =?us-ascii?Q?krmhokEPJUmRu/tdTNfKVwlSGyK6NvE1heDUuy2K1c+L1+sicdEXJ+pQ+hAn?=
 =?us-ascii?Q?1XadmBDyzME1QGmbx/pG4e5TA2fQZGrsOwG42QdhDq4DJ8jHM++GqchMfrwO?=
 =?us-ascii?Q?3PSXHeyUgCgoNqZYGG0J4MDKOq31SPuVhsZWYSJdOcdSWR3fhgfSUra7b0Gl?=
 =?us-ascii?Q?oFKdRkx6SqKDp6nDE+GLbLagAgdTgkbIioGzrK2J9tOzY+TS2FgmglCgAY1a?=
 =?us-ascii?Q?Tr/acRG8V1anAegfc/CsPRh5dqqPjPifFSS9RyVJvLQDkXlyfkpOSglgQsL7?=
 =?us-ascii?Q?u7q6piDi6NECk1jQyGLp6huH1BS0JJP/AsBuZPB3WYX7yOdbfLp/J1yK8hnu?=
 =?us-ascii?Q?GUP64IROUNWijh+g1Fg=3D?=
X-Forefront-Antispam-Report: 
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 09:30:27.5886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cc1b15-7709-4b58-030e-08de1b84ca4a
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P122MB0291
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 11:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121293

The recipe was missing the explicit setting of the source directory
variable S, which prevented patches from being applied correctly during
the build process. This commit adds the missing S variable assignment
to point to the git checkout location at ${WORKDIR}/git, ensuring that
the do_patch task can locate the source files and apply the configured
patches successfully.
Without this setting, the build system would fail to find the source
tree in the expected location.

Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta-o=
e/recipes-extended/fluentbit/fluentbit_4.0.1.bb
index 05e4fd937f..4d82abc783 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
@@ -32,6 +32,7 @@ SRC_URI:append:libc-musl =3D "\
 # prefix tag with "v" to avoid upgrade to random tags like "20220215"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
=20
+S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "\
     aws \

