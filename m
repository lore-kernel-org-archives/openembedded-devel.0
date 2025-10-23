Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57507CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:47:11 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.107])
 by mx.groups.io with SMTP id smtpd.web10.16328.1761212820413544952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=XhqiT6NJ;
 spf=pass (domain: phytec.de, ip: 52.101.66.107, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEavycaU/RIPfP3OdNGnbrdCBSWQnM6JTXiLkEYt9OHOynVbyGaTxs7OKvSKUTxaSJbLCGS1Bk0jE4o5rnRAri4jK4HGPE7muxbodmwCmQ74+gIdTwLKTl7AdbsavBfkDEg4E2vNucxMuKUTKacl0AhwLTsuUXyW5lk0yJr+WCuwahyO+xkVmNwaHJLusQnsjam40IdxDxOracpOOGil0lJQWtkWBh/dqPCk/8RyK3VeZzlrwM0TPLNts9jWRT0+iHMDgx+5MSVeIAbsM2c+kzNlq/HherJfN4pd9PGBmOZfDmkPD7uQmM87XV3IHyUgqM8UwkDm3yY4knLFgx5/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6ZnfOiI1r+l+nBfKchO2/YpIF1GmqZL/WU5WcK9EsI=;
 b=ezqBxWcIn79BwAzYAGzkM7WkJEuzAyQAbAjX/ZV2WaTImVfuxX+JEtGq0lPwBWaB63cS2Pf9BVilhsOfYyb/e4eF1x04LrN9+kv6Q3OpZ7mev/zivhsiy0ArY1tF194wYerZXibbE3H+BlgM9CVuirGqlf8RuV8DYXoY1lpqpE6KnodniNbSP9aww5+Gh7LmDernqc97bmfbJR/s0jnknEGPp7y+noxYao+9WsToJtH8dUz37GmPxJbCM/GdnVyoEYTWn5PFD5JOdEYPr+8cb2SGeZPM1ZwZ+EihxYagt8bPWXkJgZJ1PXVhT+YYpn68v8hZdHN80TBMf4MSua0IYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6ZnfOiI1r+l+nBfKchO2/YpIF1GmqZL/WU5WcK9EsI=;
 b=XhqiT6NJqWWsTFJvt0MQSqqIXXhi9jggVL5ZUUFGQ79Hrgjgs2MIR6DcedbsUPO89N1wOfBD54/3IJlIvU9r/Cj93MR/ViSLFyhVTjKB+1L7WcgeAI0usV59NrmYXpEtnv2XqAJWs4l2+Zl8PcDR5eQyTYsUN1ojlrTvAGr75MzfwX/5ZV8y72n3vCIaM8o4AVOCl37DubwGRhAvv2ueGThi0a5HW23LCSt4wROS+pz+y22MEXNhh39i68FQbOGWD27s45y9shnofFWhwHuLP8cPnQxvWHZRHRjUZfU7QbZHK6BZ/OL3/9IxFOUZLBMnbcqvVAywcmzChGc2YYDZng==
Received: from DUZPR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::14) by AS8P195MB1955.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:572::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:46:55 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::fb) by DUZPR01CA0046.outlook.office365.com
 (2603:10a6:10:469::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:47:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:46:55 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 11:46:54 +0200
From: Martin Schwan <m.schwan@phytec.de>
Subject: [PATCH 0/8] thingsboard-gateway: Make build and run succeed
Date: Thu, 23 Oct 2025 11:46:28 +0200
Message-ID: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHX5+WgC/x3NMQ6DMAxA0asgz7VEAm2lXqXq4IATPDQgO4JWi
 LsTMb7l/x2MVdjg1eygvIrJnCvcrYFhopwYZawG3/q7a32HmyxYJsnJwkw6YqLCG/3xS1ZY8Rl
 D/+jD0EXnoUYW5Si/a/D+HMcJDq4Pg3AAAAA=
X-Change-ID: 20251023-wip-thingsboard-gateway-master-7fb464bc3f12
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>,
	<upstream@lists.phytec.de>, Martin Schwan <m.schwan@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|AS8P195MB1955:EE_
X-MS-Office365-Filtering-Correlation-Id: a7760bd4-38db-40a9-1deb-08de12191a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MCs3R3hNUEs2eTRockRrUDBrcjhrMzNSQmlxKzJuY2JMRjJpeTR0SWRJbnlZ?=
 =?utf-8?B?TVY4V09GSmtJUFhuSFpoREJleGxwUmdIeDZIMmpFeG8rTWJJN0xZRktpbVVE?=
 =?utf-8?B?UWp3TG05c2dBemZLNS9SQmlsQXF4UUJ4UW1sQVovODZTUmgvVzliTU1ZQlJE?=
 =?utf-8?B?cTBsTUFBTCsrcjJIeXFVOXFpQ1RzczEzekR4Zy9zc1VPc2QvY28vR3RQT2xt?=
 =?utf-8?B?dzlXSllob1RRWGFQTDdHTUtINUNNdkRaazVlbDI4TEpoVCthZWFzWDI2bmp4?=
 =?utf-8?B?T0oyNlBvY2o0WHBvQ1ZvUWtGYjBlVDQwdzJvWUlkLzRKSGIwbTVLSDJSdWpO?=
 =?utf-8?B?Vm9ZaEd0dUd6STZVanlJdE14SFZ3R0c5d0xEdWNoSXMzMDEwd0tTSjM2TnRO?=
 =?utf-8?B?QTQwME9LWHlmR1RsVzZKNVhkNHpQYnRXU0VSQVNJRHVBM0xxU1d0alU2R3ds?=
 =?utf-8?B?WG9EUEZDdHgxQjlXaU9jL0tQRGtpd1JkQlIzZmtGWXAwQ21iRko2ZVlBbm82?=
 =?utf-8?B?OEw0Y3VRQlhVQjN3b25rZ2xOV2ZaK3pTVjVRMkFqa0tla0ZNS056YU5qTjJu?=
 =?utf-8?B?b245bkxXakdqRFJPR05SNVhaK0s1aW1uOHA0ZGEzQmVPUTJsNTByNG1iazRF?=
 =?utf-8?B?S1ZQM1N4SnN6cm8xT0M4dVk5N0dCY2VJTjR0cjRKSnJIdWhvYXF6S1RuSVlW?=
 =?utf-8?B?UHk1a1kzeWxxWlNYN2dlM0M2ZjFNdXlRYUZGQlpnSkV5QzgreE84SDV2Vlhn?=
 =?utf-8?B?ZWdYVW9RNlNOSG9xQTRLNUtiRFRKS25jSEl4Y3ZRSWpFNk50RTdQUXNVMUVF?=
 =?utf-8?B?T2hhWS94Q0g4ZVVtcnlkMEttVFdyNWN1OS92bVVsUDNlRThSOE1UV0ZDSFpB?=
 =?utf-8?B?WFk3bmdCa1JXdStBbFM1bU5ocHp0aGNGYzlWbGxzNnQvTHFBZDB6em1NSDVK?=
 =?utf-8?B?eEtjUjFSQXJaM0pPMm1lM0Jla2E5UnVGaFZsKytiZDRWRjZzS0lXTUV5VWdJ?=
 =?utf-8?B?bCtBN2REU3A1SmtQZVZNY3VGNUkySGM5eG5nQlgrRHJMYXRlN25lWHhIOUlE?=
 =?utf-8?B?TUtTTmpjSDdPOUMxd2Y2bWlqNS84QXBQelNOczlxQmp4MjRSbkF5MEYxMS85?=
 =?utf-8?B?ZHdhOUhaUUdFN2tQNTYyRDcwTXp0VVdwYUFuQ3kvdG9BVkMxNGJrQ0w3SXVr?=
 =?utf-8?B?MTVSV2xEeUtmSzhSc05Fcmt2UjF4ZE5JOVRkRVovOUtKRnRpNG53emY0M1o3?=
 =?utf-8?B?YUhZWVJIbm43bktYYWRPQkxaekt0SDFNYytBVG1pUGlsYVU3R2s3RGtaWTFL?=
 =?utf-8?B?SHdqWHFIQ3VxYjBEdWN2dDFGcHVleDFlWU4vQmFMeU1yZnlKbXBDMDRaZUhq?=
 =?utf-8?B?WXQ3dkhub05OZm0xc2pUWjYrNjB5dE9rNXhmVFAyUGppTHcySThvRzBBbTRX?=
 =?utf-8?B?NXV4K2dUcTl1c2JBWGNlbk4wdGJQemRlSnIxcE02OUZLRnU1SnFyNHJrb1g0?=
 =?utf-8?B?NndRdXlBS0FTNmd6QWMwbWNjb2psa09oQnoyeDltTW9MVXBjdS8rOS9QZU4x?=
 =?utf-8?B?dTRMQm1TYjlIeCtYSzBaMnhoOTJFSDBtcXp5SlQxZEVWc0VlMFRyZ1pGWEpX?=
 =?utf-8?B?TXd6bk50S3NadUpVeS9VUkNpNHJ6bzdSV0FmM3pBeER3eTM0TGN2VUVJaG9h?=
 =?utf-8?B?enRjL0dHTVllRGxrVjVneU1CYmZZem00dVVQWGE3bVRmbC9SVGJBMmRlWHlv?=
 =?utf-8?B?RWRzbUJ1amtqSmhidUVxQ1BFUlRBVVJjb0o0bzdMeXFMUFgwaHBVK2xXYW8z?=
 =?utf-8?B?dFJhZ3NzTTdzWGVaQUpES0tGL3RQejZ3dzNYRjJacXZkdlJBVlUrNS9ITmgr?=
 =?utf-8?B?ZDN3bzhwbVpFM1hXS3U2c0dDQWp3KzNWb3hYSE83YUkvdXBjTUt5djJsY1Zr?=
 =?utf-8?B?ODgxQ2kvcXVJNGU3U0ZrKzlKNFVVWTVDSTlubVRaQmxNTDZRV1RUbzV0QlRq?=
 =?utf-8?B?Q25ibFJiSlkwNjdXUVVTaldZZHFEYzgrbi9kYWhtNEdIc0k2Uzducm5acGlZ?=
 =?utf-8?B?UDlVMEQ0QkdLS2RhM2UrWEg5bm1ZSWtheFBQY2FqejVCa2xKYmRKNUZCa2Vi?=
 =?utf-8?Q?bjSI=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:46:55.2687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7760bd4-38db-40a9-1deb-08de12191a08
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1955
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120919

This series makes thingsboard-gateway build and run again.

I had to add several Python dependencies for thingsboard-gateway, in
order for it to properly start and run on the target. There are also
some other improvements and updates regarding its systemd service, how
it is started and its configuration files.

Regards,
Martin

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Martin Schwan (8):
      python3-mmh3: Add recipe
      python3-orjson: Add recipe
      python3-pybase64: Add recipe
      python3-pyfiglet: Add recipe
      python3-questionary: Add recipe
      thingsboard-gateway: Add missing dependencies
      thingsboard-gateway: Use configs from source repository
      thingsboard-gateway: Update systemd service

 .../thingsboard-gateway/bacnet.json                |  58 -------
 .../thingsboard-gateway/ble.json                   |  53 -------
 .../thingsboard-gateway/can.json                   |  89 -----------
 .../thingsboard-gateway/custom_serial.json         |  33 ----
 .../thingsboard-gateway/logs.conf                  |  77 ----------
 .../thingsboard-gateway/modbus.json                | 169 ---------------------
 .../thingsboard-gateway/modbus_serial.json         |  29 ----
 .../thingsboard-gateway/mqtt.json                  | 132 ----------------
 .../thingsboard-gateway/odbc.json                  |  54 -------
 .../thingsboard-gateway/opcua.json                 |  49 ------
 .../thingsboard-gateway/request.json               | 146 ------------------
 .../thingsboard-gateway/rest.json                  | 152 ------------------
 .../thingsboard-gateway/snmp.json                  | 138 -----------------
 .../thingsboard-gateway/tb_gateway.yaml            |  66 --------
 .../thingsboard-gateway.service                    |  18 ++-
 .../thingsboard-gateway_3.7.4.bb                   |  70 +++++----
 .../recipes-devtools/python/python3-mmh3_5.2.0.bb  |  11 ++
 .../python/python3-orjson-crates.inc               |  84 ++++++++++
 .../python/python3-orjson_3.10.17.bb               |  20 +++
 .../python/python3-pybase64_1.4.2.bb               |  10 ++
 .../python/python3-pyfiglet_1.0.4.bb               |  10 ++
 .../python/python3-questionary_2.1.1.bb            |  11 ++
 22 files changed, 199 insertions(+), 1280 deletions(-)
---
base-commit: a2299f5fb1f481db93f4d99cf7866f69c6a99674
change-id: 20251023-wip-thingsboard-gateway-master-7fb464bc3f12

Best regards,
-- 
Martin Schwan <m.schwan@phytec.de>


