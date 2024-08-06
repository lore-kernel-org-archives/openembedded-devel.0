Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47603C52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:40:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web10.11970.1722962431385648618
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rUX8Feod;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rUX8Feod;
 spf=pass (domain: arm.com, ip: 40.107.20.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JFhg9+teugsp8flqSMiOSQE/GTdreyR7R+SSxg2ue30yuoYFyTMCqFrA820xSlrDGSYA0ypG9Qi7f86TwzsqzdNn5vk8wdASxbR6b3xltIbNwPt+20dwxO6gsNy7TmGocRchTpkz3f4GdoQYUsYwwAJRqsZNTXLZPexwdP5qjY+UqR+Po+2GHZeEBNOt9wSckefRJyHpJjmQOiHPw8H3lpG8C1Sp9+nJ8Jj+cNweWia/KuwWItowQ3V50S4lDvsg6YmvhijL5dYLMIyfUv3atTcNlzKccSrsqtgQcOaWQgkpLy5ivaj2Gg6eMyCghDV6yZfwV5mjBe779L8OnjsfIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESjCtkwFIkp2KxcTgPFvUw4VpkAAbOI245IAt6luz1g=;
 b=e/5VeoHjCQo4PzMdH5JFZz6anqwV6+dKST/T3TjjtuKi1BFVpTqDMuTVEEkUEfxtNs/e3821+gH/YRefaXzPg1nbEBJD0ol3meMSnG01SPqaZwOMxz5/0QaegPXOPsBBtY96MsxM6ZCmp/yaFpCm+kTBPDYh2AxWkATojPGL9OqrjXmcn/cFX/W7R3vdqDWCjBw4JuN4NZWn6keUhRUF+DhBGNy/kN6bSKoGrVjRjWIJMWy5Qohwwtzrtag83nObcl9WHNIvQArZXrkzjpp/wIB7/ZKnGFnUn8UnV6n93BGJGE9IDPCwGxwg0Qw4yMuHJpLVt8nlRwNbNa5ZXWphKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESjCtkwFIkp2KxcTgPFvUw4VpkAAbOI245IAt6luz1g=;
 b=rUX8FeodC3LRq21DCV1gSc8IE4eFANo6co0Csa1wLjqNh1mbB54ud98q9MoFo3GIIi7zW2/FVK5QSt6n77aChaPWCakY7bgm60q+d/pklI047lRYyp5m6EP8pHgqiSW9VJjAfg3mQo4d4yYM7xb8sODEk+xpbVk3XkketQjx5Ko=
Received: from AS9PR05CA0105.eurprd05.prod.outlook.com (2603:10a6:20b:498::20)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 16:40:27 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:498:cafe::5e) by AS9PR05CA0105.outlook.office365.com
 (2603:10a6:20b:498::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28 via Frontend
 Transport; Tue, 6 Aug 2024 16:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8
 via Frontend Transport; Tue, 6 Aug 2024 16:40:27 +0000
Received: ("Tessian outbound 8c571f88e7a5:v365"); Tue, 06 Aug 2024 16:40:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9850d3a38e0cf9d0
X-CR-MTA-TID: 64aa7808
Received: from L9a8ce5eed9db.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CE4E5AE2-C0A6-43CC-B948-46D80B1475EF.1;
	Tue, 06 Aug 2024 16:40:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9a8ce5eed9db.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Aug 2024 16:40:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RovWekBdSLFTZKh8RXbrVKmq6A8no4W7AFCWOQyRvvNUPlg5dGxqPH3MCXcgP1FP1VKwDFZ6cwvGbpHIG0VB1VIOQ3Nk41MQBksHEuTSGcxs83cndbNbBdRZeptrwWR96YmbcB2MqzWJsqJvwkqFOiNPwzQCpcr9XZL5mFqzfpGVR0oJbHtWKT9eqAl256AjwFVSiYYJupWEup587Y71AbAwiX6Q/dFFXegAhkjH2CZE2uBzD2hYmkDrRuawJGUsaTL79s0ogw6yoP54SgrBqJnTlp/SgcgOCMsH+4AZ/dC1aJypr1MNVUXkNU78AN59Jty18La9EbOIh2r39Hg5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESjCtkwFIkp2KxcTgPFvUw4VpkAAbOI245IAt6luz1g=;
 b=I2B0frmbGiFYgllDKCaciaac3RSNVtonja3kynFZ1y7ffVUbZ/2SUPyWDaWLWljwdNmj50XyLdDJuK8IjokoBz3Pqk1/6WS1nwqnp6cY4Bgqh3I4/MPudlcKCsJobiUe0kw6yJU2ruUOPhor5tywtBH1L4Wn8IRZdrUlKhuLrtIo18NPZ4s14OL83OrppJpunLg1S0FUdUrLrRV+8UTL2/UGr7ykQraTdj2qO8/N1IgKHzmq6IGegOqh/7uCC6wcK3VBqNUjo1lMC5M1nHdECuzvwpDWgETjOnVJ+hIv9UpIPnpDPzZi+fPD7LToNOpW7c0oR3eBpx+oRIxrGN5dsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESjCtkwFIkp2KxcTgPFvUw4VpkAAbOI245IAt6luz1g=;
 b=rUX8FeodC3LRq21DCV1gSc8IE4eFANo6co0Csa1wLjqNh1mbB54ud98q9MoFo3GIIi7zW2/FVK5QSt6n77aChaPWCakY7bgm60q+d/pklI047lRYyp5m6EP8pHgqiSW9VJjAfg3mQo4d4yYM7xb8sODEk+xpbVk3XkketQjx5Ko=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7529.eurprd08.prod.outlook.com (2603:10a6:20b:4f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 16:40:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 16:40:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH][meta-python 1/7] python3-importlib-metadata: add
 from openembedded-core
Thread-Topic: [oe] [PATCH][meta-python 1/7] python3-importlib-metadata: add
 from openembedded-core
Thread-Index: AQHa6B86HJftlnhjjk6Tq//fWY6G4LIablkA
Date: Tue, 6 Aug 2024 16:40:18 +0000
Message-ID: <31D0E9BC-2BDE-4219-AE1D-FDFC65528FEC@arm.com>
References: <20240806163918.2186435-1-ross.burton@arm.com>
In-Reply-To: <20240806163918.2186435-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7529:EE_|AMS0EPF000001B4:EE_|AM8PR08MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: e614cef9-6939-4a11-90ed-08dcb6367a4a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?NsNKq6BhEVbBshq/OdCyNeIxzP3Xzc7wOR6QM10rnBZUR0+y1AUYAzlLcs61?=
 =?us-ascii?Q?un8tZPnwXDeBB0Ia7QOlwjR8wYk5FrI6UVCh83AVOV/DlDOAENvaqBnXWJ1A?=
 =?us-ascii?Q?Jthpj19FnaGyjmuKnBFPD2+vauDxcRf7QL95MCncV71MYThyKCBS3N9zwQF/?=
 =?us-ascii?Q?rGFhFKmIUTPdGBGmKDYw1UW0huKaFDBkBhdQ3faJnzajwOWIOkgt0621SEnd?=
 =?us-ascii?Q?BfFQ5P41ai7JXE7bG73IiygnR18goFVGUbnShV2vPZMTwZ64l0CByufH/ipV?=
 =?us-ascii?Q?dQikbCle5keJBjWJm93vxyZYkJuveXWWk7t4Un3T9awEK3G9QJXHL96lJYPo?=
 =?us-ascii?Q?PSeV9lTGGLYYMf5ZgNFt0Ul6YVlsn5dSzpfcEHFkqLfzKlYIUlGnBQM/L2PE?=
 =?us-ascii?Q?cYI+5hKFp/o7X2K6TG2R71euO2z9nu1vuhq+HBMIr8dS/GBdL5Zn+dnaZji+?=
 =?us-ascii?Q?iGzgRzoIvAIq2RQJSyCGg8wqVSouganonQzQLlGfVw7JFTurOD/spAGj/Avp?=
 =?us-ascii?Q?b+9MXesgcsy8HzNtGWVaoWS79UPoz6/OaToHXd/fPpvZlxmhq/w7x9+IjRE0?=
 =?us-ascii?Q?gxmD1x2U/2iL9o8cbuhYvcrsLudaiWwa7fBi93Nb010HZrPvW9GNNEVKPnzs?=
 =?us-ascii?Q?atv4KsYSTLA8+ogMYSH8jsLRtAvghSoGhUzphFaAWr9HANTKH7QB1/66NrxF?=
 =?us-ascii?Q?1aMFec87/ywjRN7JL/CzUpxiZ/+VQdZ2mlI4m1yNhnC5qoMQDS/en6HClAVH?=
 =?us-ascii?Q?LN0DXpyUzy5Ka258N+kOQf8n/T18lziaUQZXhrWHrngwLIuMkV4kj1BQ5sHf?=
 =?us-ascii?Q?u6fpYCAgMyZxkXpF3oPJwDu72j2HWdkICFeuIUzSyiZacbWyj8nMhrmNKq9h?=
 =?us-ascii?Q?0SqsjRi1l9JQj08c10QfG8YVb79XZyPZxOAyqddkisant9OnaxBd4U+Hya3X?=
 =?us-ascii?Q?LX5tahwveI8s5DudkpysT6Cb7/QAmiTxN3PH4yvg/k/1XSeI2PTG/pO2kFsA?=
 =?us-ascii?Q?0sQdpdZwDN+hA+jQuYp7KoJHH5yDYyi19xo+yeNMiiUNvgfzwVFZAQOJMaWB?=
 =?us-ascii?Q?lyKR/tZ5bZsYO5yx0LG66cZnmGC+JAWvOjZHNoKcJ43eouSqK98ZDiqe25cU?=
 =?us-ascii?Q?o8JWDOBF7X8GQY9gCdQGODIabkMDkgrt+OpawneeQCWohf6Tg0sDLcemV4VL?=
 =?us-ascii?Q?pxzj1rbGTriOBoN+STht0FZoxZa0QaR9t9VBXrrLVi37+JQYOlaeSwATJ7wX?=
 =?us-ascii?Q?qt4XqpoHDg8Tb5UMlfwCZsfPlBU6c+Sp7wObTfBRy3SoowUvcbgbaTouV1v7?=
 =?us-ascii?Q?thAyx8WVeJW0sLgKtVlfLyp/hRej6bfqnLuulvLwCxYNXkihDBCDal1iYLef?=
 =?us-ascii?Q?vlAyDxA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B28B6DC82DA9D7468ADAEC0E529BB067@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7529
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ed5f9a6-87de-4411-8620-08dcb63674ff
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|4022899009|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ui41Q8hn0MnXk4sgHtPQ7+oF+7iZrverDcerN3rKHL74ziMYdS+82OrJ2ko4?=
 =?us-ascii?Q?/0nB7p+zozYL9dSrcr71fOMC1BnRaqBW0usHYT2nDtkErU+k/Wm6jH/OoQF1?=
 =?us-ascii?Q?+usyO7M6NvpcgBvyc+hnuDMoF9/iDPF6FEvQpwgB48FLBucHur7dqIfnRX8N?=
 =?us-ascii?Q?yjuSOwbRc26qXhXzvQ/eF7+J8tl5N4eApBc14mAM0azS4qoJX6yj+QZY/+HZ?=
 =?us-ascii?Q?UIqB8Z3Sb0sGy3M1GSp41STFqRlXBiGp+F1MESMXlahhU3L0uDgPtupsx+cM?=
 =?us-ascii?Q?U8SiqhvXHTMo1dh4GVIrF7qQ4CRGAwNHxQCbG1KO6H8KsyKcOLCvpu46oRuU?=
 =?us-ascii?Q?qDLTcOLXU1c3v/BPEhT2aAIsFJKUDKXUEeK0l6jRW70bSD8LtUy3IqUv/IPK?=
 =?us-ascii?Q?tlyuy055PsNXHTd3Juy9d14KWng0MSP5bobzFfWAqNDB4zkbLauv1djOhxdW?=
 =?us-ascii?Q?uutjhHRVNcpvQgL1kipPXb1xSIb5rQRx00O/Jel53V8pAmHTcxh/BG7DMOZC?=
 =?us-ascii?Q?uXNh5sF9xeNjxczaSSBALGzQ87foSxv4HcmzHwVzDeW13y4HbGs7sT1X50Ee?=
 =?us-ascii?Q?j/8OUJLSIaKIoOpHdt5hJAf6pA4XSjOW5ESOWE4NY447BBbLr1MWv4ikQzpp?=
 =?us-ascii?Q?ihpsToqMUlHfBPBZuqdfW1GMVC9C4RMyzPvekZt+knCu68bXJb9iaqyp2XPg?=
 =?us-ascii?Q?UIwypPcklsvF9R8y9DDi1mPR/yp05t7e2BI+epUYn858Wp2Mnndd0S3ovl/R?=
 =?us-ascii?Q?uJfUJzUzR6HrVT7ipg9SnYtSXt6Z/689TjXCGx8vOFjVPvM1R3Sf9kg2skzs?=
 =?us-ascii?Q?HeWlH6T2Jx4lWP/c9i07pXtqgSS04FnR+wkmOBq45DKt/d5rIzA/u5Q1H9bi?=
 =?us-ascii?Q?AIBCkA8Uqcdv4Q78muVeFDS8cvA9uRCDTfW7JXacjCjtFul+/yQVszs6BuT2?=
 =?us-ascii?Q?BBhMprgnGYNiHmRXOcckG8nQ7YmZ4kYqH5q+G4E3bO97htSW2hMQoljMxcE6?=
 =?us-ascii?Q?ujLZAsHUU4rSaW608MSoPs9yKHb8tUQjon5GRd0UWPjmdsGFfErlRqkQ7dEA?=
 =?us-ascii?Q?tzV8DS847toTVH37wJGDAxyfrCuCbqliWUjmhCVgh5AHDZD5QIJH9z/kcW6w?=
 =?us-ascii?Q?i9I6e3mHdr+gtiVgzrzuzeGoiLpiLHq4zOCTKEwTx2cJb9z29UKbCpOiyP3m?=
 =?us-ascii?Q?SkDnjQCpVfU1DgEDSpiwNR1Fg4Ureu6hQ1DnwuM55yJJ6ErnAbSK4FoV8Vue?=
 =?us-ascii?Q?cz14YoTjxPQc8qv4YH66k2me8yBQNuIPLkMfN8rmpmBSf6zBDqdV3F53YL2j?=
 =?us-ascii?Q?FHiwyfMj7DwD/aL0+Kq7NAERbPtIyT9Zt15q51vFXU/R4kKBR0fkr+/AMFMI?=
 =?us-ascii?Q?ZZokIkSwxuJc3FjhzaQA3cjWtQvXSvb2zfCuDJ68dkGMAq56XA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(4022899009)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 16:40:27.5495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e614cef9-6939-4a11-90ed-08dcb6367a4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 16:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111593

Obviously these should be merged in conjunction with the oe-core removals, =
which are currently under review.

Ross

> On 6 Aug 2024, at 17:39, Ross Burton via lists.openembedded.org <ross.bur=
ton=3Darm.com@lists.openembedded.org> wrote:
>=20
> This recipe is being removed from oe-core, so add to meta-python.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> .../python3-importlib-metadata_8.2.0.bb       | 20 +++++++++++++++++++
> 1 file changed, 20 insertions(+)
> create mode 100644 meta-python/recipes-devtools/python/python3-importlib-=
metadata_8.2.0.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-importlib-metada=
ta_8.2.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadat=
a_8.2.0.bb
> new file mode 100644
> index 0000000000..3e1c7a7d6b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.2.=
0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Read metadata from Python packages"
> +HOMEPAGE =3D "https://pypi.org/project/importlib-metadata/"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +PYPI_PACKAGE =3D "importlib_metadata"
> +UPSTREAM_CHECK_REGEX =3D "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
> +
> +SRC_URI[sha256sum] =3D "72e8d4399996132204f9a16dcc751af254a48f8d1b20b9ff=
0f98d4a8f901e73d"
> +
> +S =3D "${WORKDIR}/importlib_metadata-${PV}"
> +
> +DEPENDS +=3D "python3-setuptools-scm-native"
> +RDEPENDS:${PN} +=3D "python3-zipp"
> +RDEPENDS:${PN}:append:class-target =3D " python3-misc"
> +RDEPENDS:${PN}:append:class-nativesdk =3D " python3-misc"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111586): https://lists.openembedded.org/g/openembedde=
d-devel/message/111586
> Mute This Topic: https://lists.openembedded.org/mt/107754127/6875888
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
oss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


