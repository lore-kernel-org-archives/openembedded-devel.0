Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB6CECE577
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.121])
 by mx.groups.io with SMTP id smtpd.web10.32313.1725809679183516956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=kPysXIWt;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ym5ZPJYJHKuQHQhMj0/zGjJUSM/OE7m+N+HrKi8YnaLcE1kD37eFCdNjow7tnO7H5xZrkL5k+F4AoatZrXnkjYtUJYSgoHHltol90N9CtA1ZqeOK/cd0mgiABq+7nBZ+0+rbrunrnfMhvDXxBrkTzORxmmmhRVlJjfwfqtH/7Jhs577ndf4app42UIi40asaOcg3dv1cOBJhczS/S/KSLynKWgzkUWBc7Rgao00+RdzgFBT+KnMfKfplqpcihLJDK+cVp45pVOI9lCUWebINu3WDXayhakJgm/ozKgBjiNVO2c2tZmfGArwNhU4TCsZVi/kHkKi71RXA5BoWcXeeiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZNMf7ZEn9teW0uqZCsDNtRbZxK9mkBwy9gRIpnPpoA=;
 b=lOohyhdq75E6glQHHjlM6mjsFiN1lQRahUBSLShXJTGo2AOd8a8la4/QMoYcKGUK3EzKwsU2uFsK3Woyh7l4oEwnoKm9NqqeCFLefW7zT+GLFRlC6+3SrfO52DEhufQSCKUvtailctWtXYODIIyQdRORK5BP6LNbnasdKTgY7TxplX8wcDVJqodzNpw6ID16vsYc12/umnKZWD8NFjjJ5AoMc2LVml8OIqZ3dFL7VgBDa/zDsOSP5lCrGlIHtjPdLjrDCsag8BWpA3O9Mih6UyhU4XYS9QCzLEayGL7nM8PQTxWoD9o+aowulBxbI8JvP4sedHVMb73XdeD9M7ZwWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZNMf7ZEn9teW0uqZCsDNtRbZxK9mkBwy9gRIpnPpoA=;
 b=kPysXIWt4ThDrAeqOp7Qzf38fMKc1QBnxpov6HrPzkimi+CHDp0QNg0Hv6swgUTun0gJv6alc3Wb620+VxjeVSZ1EVdO2PnvrZLrvsiwjcbgDAedkWms49bKpCwj6kgfd4WBXkdkaRWJnc/2yLxoBCfJdpgpZOKcTx6LWVEsDXaO4q4CKvygkKZvqoso4yBBbIOjMcS+akvLPXFwkqZ12VWqnvmF7lqGDGb/8RYA4pwnQLlp0qyC2rtTzQFJ7UM4j3J0lc1u8tFegfc5FIDaRuSu6lLLB2ph1SNDBAAgq/xew+RPXBu+Hk0eb0HekxIV4xZNrNf4ADHDVxKdJq1ujw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7472.eurprd06.prod.outlook.com (2603:10a6:102:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:37 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:37 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 18/19] python3-smbus2: Fix LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 15:34:07 +0000
Message-ID: <20240908153408.4114753-18-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: d3822f2b-bef8-4458-a059-08dcd01bbf62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZNnvwL/+3k0fJWBB+sr829W2NiV76gaAWuVE4aqWLXOp31ufmpK16WCMWK6N?=
 =?us-ascii?Q?sJNDVTppyaJrSW/bNPGn7DdF4LY3BnT+dUft+FqZVZhDHeCGtMR188vI5sLO?=
 =?us-ascii?Q?l93sih9WEShej11Udt6da8MrY7qggOCvu404b0SkAfsJtA2zfvtbQglLid4B?=
 =?us-ascii?Q?MDXLBX4hoK2XP9dOI7eA32ANsNCOjquH1wg3MAAhiYlGKVElz637ffAW9YWy?=
 =?us-ascii?Q?BGBXMHFSrExxIHtHq3zxtYJUmLt675s4RUihYleTcq1Vg4GOl6J2FXUMyoLx?=
 =?us-ascii?Q?Sbb7zPDHF1s611FJ7bKSWWE4UQSDdG9Mma6NDTYPwTEkvErA5D0Od52Y/rrH?=
 =?us-ascii?Q?GV+O0lcMs9NV18XP2r0N2x/U6l44RLHO5Jyuxm4XHafl6moPFe9bMJsaJJZ2?=
 =?us-ascii?Q?UmSkU0FpIy3U2odti1Hu95RaHItiSuTuXbKl3RryDYphjoNSn8DUZv4CwD8k?=
 =?us-ascii?Q?JOV0opC3NWk9gmzsAtQVPbG3pwxROT3MkQpdIUTegxDWieHuE7yqlhjWM5Xq?=
 =?us-ascii?Q?zD6uFjdzjb000bFxNdo27A/s0DyRilioFkYrk+tg2ChhOu/B416HULjgDV9v?=
 =?us-ascii?Q?iC1DNTcESb58rxlXIOzZ76T8g14pMx9YWiFKs7eFlbHUIkBnqn6F4t33OKiX?=
 =?us-ascii?Q?5Dmp51TJ0m2RMiOrT0TzgL/zD0vJBbdwDmGfwQNRKAsA59BurekpTCeOGuaB?=
 =?us-ascii?Q?tSLNVuPkquw2mwG9sSCdouRdt2aumgrIZ/jr+B72hwcSXfGZhVnrps2egM0v?=
 =?us-ascii?Q?0QRK98d71VXy0lik7cscc2W5cNaQkDPI+2vnrpiP/OMKtslBWmRt04NynPRx?=
 =?us-ascii?Q?b94H6gAeVxzfVWGiC42zBZyg1oUNpFVCOwkFyMhNK68+rVpgzHWhgA6imYCl?=
 =?us-ascii?Q?tH2HunaJVLYVpYx/34Aeb1L8S2sudf1zen+4rpRtzDj5kyUKN4SUO36PysuD?=
 =?us-ascii?Q?HkN4pp0ICCEt5iZvU5pLoRV2pL0Ait7PZqeS1mNzOkb7O9r7XcvkCI2xFzif?=
 =?us-ascii?Q?9yUkxpro30FsoujmUhV6VnCL2OPB45KJJ82tGSW11eFa6PkC5D9nNl2+f+JM?=
 =?us-ascii?Q?Onk4mnktBjXbZag8+TJgCX8kOH3/YIrH099B3Igwn9fpE7QEfUvAkfhrITe2?=
 =?us-ascii?Q?kJ/2FO5KHb6HbZmxMWyg0uBZ82qoRXOWW6NEDynA8ncWRIBmZjqlUCSZIMvM?=
 =?us-ascii?Q?Y/PJdYGD6F1tkR9S5WFBvjyG4+Gn9gTTEXjR/yZqZYYSar68s5fXiLjvk23G?=
 =?us-ascii?Q?Z3dQ2xvTgoMThC/nLZvWREzM9pAVB+ipYcudt5YUFMNM9IpjAWfyLUKo5SOV?=
 =?us-ascii?Q?/1AomonNl0atfwuZm2sFL78DHKMOin0QecACIG+SOw7rWBmQ8WW3PJrqDFxV?=
 =?us-ascii?Q?6AMpv7kC6Ps7njcJY1mCGFUFNMrTCAak2DLedYzzf63CAgoWog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y9Bw9ct7Ns9sxd6/DmvigFnGmFg5QxkWOAjgruaJ/IerY4pRT5IAwhqn9f66?=
 =?us-ascii?Q?AJR5rGAEGqpOvBiJrA+4F/iUYsDx6+wWsQLyYe4tvXlYoMkOjoW+HYnehacA?=
 =?us-ascii?Q?Bb9XhjGyP+PUz5NiNJUPG3LmWU/U0nA6Y4l6bQnVYo1Jco+XfdVYoC1gmhSb?=
 =?us-ascii?Q?cY1Q5SRl7Jhk2Jhk10nXLwFAOd+4k/WTavLSTp4b3WR2HqhlhdrZeLBz4skk?=
 =?us-ascii?Q?lsbegObqHBuIJngDV5tHJAeZpJ5bB9+x6G6oNPXFyg+gjZsC33dMeDwNwn8v?=
 =?us-ascii?Q?7H2c4du5MFafqgkWf19EIObWr4dEM2NEJMa40V//Z892uJOm3AemfqMhtCos?=
 =?us-ascii?Q?3I2gDL1zXOsNtq0P3bHhzW8Lqw4K0/n2XXlU2aeMbiYvvW3XZAf11gb5uXbR?=
 =?us-ascii?Q?tDenOPvQsj9dMq//hV0gUyl94q7LlKBTPElGdFHZiAbz58quFaSra+FReVEj?=
 =?us-ascii?Q?vAnx8Rn42IF4NAzrIXiPYa58iNVMpbjliWr+DX6YcsiXA8x/enNwLxI3VQs/?=
 =?us-ascii?Q?RriCooB1ErsPe5VaYeudhhl+53czeJXopWGFI/EO5y5xLkhGhWXY4WluTlwK?=
 =?us-ascii?Q?t2bMcUS5RJS0VKfrNUEo3LRZliOVNx7h5+JttPoeIddXlqJFkJvflzCvaBL+?=
 =?us-ascii?Q?z3yiRHb8IlnlnfoaLNk/M7F4quFIJFjb1qBylKwF7PoDIIgph790yUChvPqE?=
 =?us-ascii?Q?jy9Ex0we3GduqlkqT/KlNADzE08gDJjeBiwFEolIUUMmOiLFASCGTXVwEwFW?=
 =?us-ascii?Q?R+3z2EmEADLkW6a9Ooj+CX+AQ006pBtEMwmD9tv3n6/wut76PqPWsp+htLrQ?=
 =?us-ascii?Q?1YP3SAtQbjyzLFhDVN/57Sb12zhjxR/AtC6SuoBKlguKIcZN7V2l78GcLIk8?=
 =?us-ascii?Q?wVgcGAOk6jQeFjAoKWj7/5Y2a7a8zEQAz1MHyz899c9qkLum0fhbgkLMK8Rq?=
 =?us-ascii?Q?TMYDm7S43d2GCBqwQuxuA4LLNcINy/mSZ293TMU764fLvCPhfPkKr5JgwXeI?=
 =?us-ascii?Q?aGU6LByVU0tcRf27ioPxBaQhG8y6zycfilBRW92M55wnOSxZgGUUkwfwFzvN?=
 =?us-ascii?Q?3Pedu6lQ99ccE6+AplUU7+QwIn8C5PLuSkbYX5j651RfPiF4bWokicZfe0/a?=
 =?us-ascii?Q?+62V226UKaWeYvTryzi25C92V9sZ6bx2Z0bYQJmpDvzrsca0YIdyzO+/ijQ4?=
 =?us-ascii?Q?sg6zt6NINFtILyXGaw/4m2wUQ065FaRFUSXYe+9wvB4BpNSlwBTYyWkjk13J?=
 =?us-ascii?Q?3qHIg4sPnZHm41yug7lhOtyhtfGBIF7epMcVVArxqP6ADx7Biynx8L3gqyrD?=
 =?us-ascii?Q?OJpgGtRYY0G/3hFLW0W83TLjEuKTyiz0sncDxNMdnXqeK5ghBykvlv0HGqEy?=
 =?us-ascii?Q?bmsah7EB4cjVsed6XK/1hZ/EujptDgUK6GvTGOGKgtAO23ths6b453rXvHp1?=
 =?us-ascii?Q?MAX7ZwsLZF6hdbp6ciQMH/ApdpnztxKXwR9bNAbRh9WooWsg7+9uONJ0COMh?=
 =?us-ascii?Q?8kOZSOKSGFWT24icu7xXwqGQEAmQre5ssXYulSumkWxXGwty/Zp5JabGEcf1?=
 =?us-ascii?Q?TmS89rSFr0Q5tIlhWWUMPI/048sLkj57scA8lFkrQFeAlRHkO68GMZ9bLhTN?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3822f2b-bef8-4458-a059-08dcd01bbf62
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:37.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh+GbbSIdLFjHGbjvDuBvA1r7tDDdc9GMjoLruxUQfnzPAcx5IxS69I98twsK+7QN1BPnxN7p2CGpySachi5Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112158

Change the reference to the MIT license containing LICENSE file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb b/=
meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
index b54cdb005..779562d04 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Drop-in replacement for smbus-cffi/smbus-pytho=
n in pure Python"
 DESCRIPTION =3D "smbus2 is a drop-in replacement for smbus-cffi/smbus-pyth=
on in pure Python"
 HOMEPAGE =3D "https://github.com/kplindegaard/smbus2"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2a3eca2de44816126b3c6f33811a9fb=
a"
=20
 inherit pypi setuptools3
=20
--=20
2.39.2


