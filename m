Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70A4C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 20:33:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web11.72380.1738528395847342855
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 12:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oMtq1ruX;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oMtq1ruX;
 spf=pass (domain: arm.com, ip: 40.107.21.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d2rHF3dsn8nD9N5KKxEKroqkR9nNjF7rXqTowrzz8ZV30NFkxnxxMuNwCXe4W7bybwYeR7K+Gsm6+rA5YVvfdo6zyPDR51M8O5tVPpB9zU/l1nXRa0cOgJGeffCFX/oUtvYrcvRDleanRIKsfYQSpdIyf9EZfFXJlEA1nOhJeQ8NMoipEZfCbI5y9BuoviWOCYdYqPV0gVh11kwdZNp03xRXilpT9b2zX/QYxkHa/EcjXkynU19ybLg8ziVu7hZMWfGPypXdPDzuNC89yUf9hL3JSE1tN6RQQs7dJ71QSQfBdVcllHcVDUc+xYgDjWOKFru237HwfhRRQkYWnq9/Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTHd1gF9NmAFZSXnmwsdbIAMMZ1W5Hii+gjmWOcK/lg=;
 b=eMF0BjMQSf5XMotpUhomfbOEr2KYV1ppRtY5QQs5Pe5/N71UxPxrSSsnoA1Op3cOIV9xfxhDOQ+4Pw5Gspblc997yCtoWFNny5lFDG8Fpq5iHN4INZWUi3ZE/LBdHyS9V8tGpKRqULx65/Gt9oJK6OyfUKn3W3q9ESvPOdIQuPgUWAOggd9JdAb78dwRudid++FmGUxsMYMiEMw/2shEgbaLmt+MTxxFIJmHSbzGr57dFtAzYj8vts7NbhvIaHrsr6bMGXYeTaecBAqtAiz7lWoRS5TK6fyjHjUGvnRlxhJXDwh7ETa8GjRvUfPupkUU8hinZiFTk86vNb4wKU8//Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTHd1gF9NmAFZSXnmwsdbIAMMZ1W5Hii+gjmWOcK/lg=;
 b=oMtq1ruXFwJapaBaGcK8SnXILmIpCy1hcvwkajaYIgCwOe1iJD+1oSyuiqa1/1lCoP9ONJJ5am3w9prcTx5jVOwdA2MsSQXrLPlKfFdS1HhKRL0W0LJnY+UWXw+ZOyv3e9UaJ0GYyr6ydg10eMM8NmA9ykQpdpEhtNwovw6D/jg=
Received: from AM0PR02CA0097.eurprd02.prod.outlook.com (2603:10a6:208:154::38)
 by VI0PR08MB11020.eurprd08.prod.outlook.com (2603:10a6:800:256::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Sun, 2 Feb
 2025 20:33:11 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:208:154:cafe::a7) by AM0PR02CA0097.outlook.office365.com
 (2603:10a6:208:154::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Sun,
 2 Feb 2025 20:33:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Sun, 2 Feb 2025 20:33:10 +0000
Received: ("Tessian outbound f834169b9670:v560"); Sun, 02 Feb 2025 20:33:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea71c64573e5bb6a
X-TessianGatewayMetadata: 0dszFG91n+0sE3J0xONiOsLqyLuLuLTPtnNw+139h59eFON8bHoqDzj4x1jWRtVrcCki4SgzPfdCaDRNpCiu3AjVZO0iPmT/ITMmyS6XiZcnh3kyZsvjwVuxa3IwGRJN93tfZWUZYIPhhLNIqHQL9xNeTdXJCoGPclJ6EWsZvnI=
X-CR-MTA-TID: 64aa7808
Received: from Lef98c90d803f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2871E9EB-DB89-4E8D-A470-B706C3A23B1D.1;
	Sun, 02 Feb 2025 20:33:03 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lef98c90d803f.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Sun, 02 Feb 2025 20:33:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLAAmGe0NLeK4pMyXSF/4H1YuADZU98t/8jKtc4xr1wNOcNtvyl97+LmfqZSFZ9gGBkEK1cNdSArox6jVTQuOtPvWPyUZy7B1dp6nlOQCeRdv5tuDFs/pFDz8BHVTOdvT2hScYy1enb5mphBjEfVmyUmm1Nhxq8qyUG4wXVc0xsahKe54/pXTQDZLAmLPsPyB7nn5yGYH0JgM30R9ewXnG/EXio6eLXyepI3rxeB9QvegqtuYITjWQSpGL4iwknr3JZxrA6J3prBUsV5RRKaWIzFOWI8fcqiAUBdZJraE4FlaKKbx4dtNp3szR/K4mFbBaBa1BXaKhyrUxH0XrFDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTHd1gF9NmAFZSXnmwsdbIAMMZ1W5Hii+gjmWOcK/lg=;
 b=DHc9bRRUDJaS4L5lS3DBfDfE4IMAAdpeSM6nH+THs7RZAa0fmnl1BymC2SnCuvpEIFtRRbO7/KvYVmjvpfxwk0Vsf67cF/OAxFvwZ5pC1aQonULOaI4cH6RiXfjcPRbqW2jyZ1fzZchm9IohgcC+A90zky7PqSPCBsoGAg+JOP4Kxuxn2e9DLKjXkG+hK4tive13j3EWxxh1osqzVcarIe6/k0h1AcwrCPAQ/fBtAE5b2wM6RCNg7/bxnlAKmbi4xAiJNL3pr2PpW4BIYdrNvv+UUQexqevEvIkP0xsY2pW10TIZkP2aG6VtfDNlukFIllcMFrq6MIARvrLAQrZXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTHd1gF9NmAFZSXnmwsdbIAMMZ1W5Hii+gjmWOcK/lg=;
 b=oMtq1ruXFwJapaBaGcK8SnXILmIpCy1hcvwkajaYIgCwOe1iJD+1oSyuiqa1/1lCoP9ONJJ5am3w9prcTx5jVOwdA2MsSQXrLPlKfFdS1HhKRL0W0LJnY+UWXw+ZOyv3e9UaJ0GYyr6ydg10eMM8NmA9ykQpdpEhtNwovw6D/jg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6686.eurprd08.prod.outlook.com (2603:10a6:102:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Sun, 2 Feb
 2025 20:33:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 20:33:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] capnproto: remove binary checking from
 target cmake file
Thread-Topic: [oe] [meta-oe][PATCH] capnproto: remove binary checking from
 target cmake file
Thread-Index: AQHbdaWMA1EAJgDR4ECkNqWuzqrJFrM0d/eA
Date: Sun, 2 Feb 2025 20:33:02 +0000
Message-ID: <D0A3556C-EE0D-409C-9DD1-229006AEA692@arm.com>
References: <20250202190608.1521989-1-skandigraun@gmail.com>
In-Reply-To: <20250202190608.1521989-1-skandigraun@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6686:EE_|AMS0EPF000001A4:EE_|VI0PR08MB11020:EE_
X-MS-Office365-Filtering-Correlation-Id: f8cab065-efa7-4590-0202-08dd43c8cf61
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?gmZ/eHE827WWC05rJvUcIFBhha843PDPzOwKCUDuQqWZmzgLGKcHeHJc+dh0?=
 =?us-ascii?Q?pnZn9RsxfHLZjMeARBxbJaoQ3VJcz89n0u9mqG0OXq3lb/FeZdwlb6ogbKmn?=
 =?us-ascii?Q?hoXd/c7HS35Bdw+fRAZAnOjbgOLPYeQyp30fLlguxSrUz74rDdhRoKM69DEk?=
 =?us-ascii?Q?kgofZTcF1TiIv0HQ+jnUdZN6pHHE88kU5A8zG5jvPmke0bLpa0h+pwlMN4nE?=
 =?us-ascii?Q?No986qy3V5XmDgL0wUf2K0G6fyYwEtDkE9Zfw9mTRZX97sbdl2Hvub1si0s7?=
 =?us-ascii?Q?WXGVvMENxGIBYTNY15aJGDTYlk2qJFwUDPrY3WXsZ8ZhAO7wDR+mipH81HWY?=
 =?us-ascii?Q?7EbsorpXANFSFMsHrAQLkrvvsze0rT3McjIFu/bUAIODoqZe0gOK2CjbRn58?=
 =?us-ascii?Q?utb0eioYDFzSGL4LgSZvVjkTr/OAvuxu4iLHCQLZ2pQNTt2f5oabr+k+NGgr?=
 =?us-ascii?Q?rNSrbXK8k4LIYQfUVvJfqQ594H5ugqMeiJaQkvD0Xg+ey3BkiX5QZmJtbqLH?=
 =?us-ascii?Q?V3HRX+bOQ8FpF0w6ZHLeJ6aSBH0K4mgkC0NdMNv7vOZ0GIwsSxDUq/kRfvs7?=
 =?us-ascii?Q?mPXgEACmHQCAEI01UX8bakIsgR0gBpjr8dnjtZWEykR4DvqEbY6nXkMT7aFu?=
 =?us-ascii?Q?oG+4GQkSpiixE5fZKhTfRTbqHj5/vkiYr/ob2YbIsMKM0l4D9hf7t8sBlmHy?=
 =?us-ascii?Q?Xdf7cbXZImaWCznw36HP39PeN8IZJYKMuzUVdi4+sWE1IE9iH1n0X8fSOjn/?=
 =?us-ascii?Q?e6iqN2VC+8GfZgCRY2uhS8vTeCYON2ZXiQs2d9rSgqFNxNupaMH4SB3vouRj?=
 =?us-ascii?Q?TEfWfMRlu5ZLr+AXF2GdNh177TFDCIxe+4Nu/moG6QjglT3EEDuQ3vD6d1cE?=
 =?us-ascii?Q?NyIdAMpxUK5BnXyQPNvk9vEzpGQchAiy69VKAKIE6Hn+Flb1kSTcxE+wdqDI?=
 =?us-ascii?Q?u8PaUlP+I7LSb7plk38W4Hz86aHl1ByVjSf6Z7OuUJytC3z2LgGKli2QAaQE?=
 =?us-ascii?Q?3JD1pqea6wckT0tP/DIUS/KtaTHtwaABsq95NoC546aY7nvspx0R0yMZj6It?=
 =?us-ascii?Q?GPSNLZ8yJjJMCdpGFyeEMWRwIMJUeRmtBnPesElZXg4Gyu3BAr6Wx1sUzlmX?=
 =?us-ascii?Q?db4/WvqV1KiwWYj34zYtON3NeV5JAevxazUGc7bG+HbIwTqQTanwbEkgfJWS?=
 =?us-ascii?Q?Nx8Zo8dHRisIgR0FlaqTnJtlEot53D6Fv+JB5RysZDgCNbQ5PchmIZL7rkcp?=
 =?us-ascii?Q?/AgIZp138n1iMDLH+FOrBasOvm+/KPgtBisOTCv0FR0nKfE9nPIGemqqNl83?=
 =?us-ascii?Q?vvVHNdD8RsPQLujePWpQdcYr5mWj4DoY8u4zaKXcSxlxqJjWNBRZ5dnh4tna?=
 =?us-ascii?Q?3GP4BNk+L/PkOQwfNFyB74zQueRqnzgiQ7Jgpgy8Uad5BCZwjw2J3vB3CFpA?=
 =?us-ascii?Q?y+qiN+s3+dYcPtU5nQDxZw218PKFdLNe?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CE76C52BFBCAA546B40B3FC7DC32FFB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6686
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d1e79853-b904-4ef0-dd90-08dd43c8ca2d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|82310400026|36860700013|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mrRs2WYTNXZufgfhidCNlD8DXCoW3kJmVLhO1xk+MNBedCelK5vJy+/biLPK?=
 =?us-ascii?Q?0q1aoQJ0v6nKv4Mo6OX4G9majO7zDSR2Twpj0dvSK+2dPIO5CVE5Jae3QG76?=
 =?us-ascii?Q?sochQCpYuqvNifORy79prM0QVvuRg95cTzWHKq2T9zOrUXV/tB+66OZnCV87?=
 =?us-ascii?Q?wZBhOdG81XOWau+yZHAlooVKu2dM/Wvk6CWkpvdNDIG9yrmsTXg32P4VHd+F?=
 =?us-ascii?Q?LMZmVDORTIAi9QHJjLWkr9T3y+z2BYhsi8q8uRASQiR5kBKIEJvsjBPYPjlS?=
 =?us-ascii?Q?TOcrLA/naXGBGvfAVbLlN0gUDk8sAZ+KcXtgd2f3BW2ysI5/SEGTJoSUmXoY?=
 =?us-ascii?Q?jS7FBUZnTVqxrSgrCpXgfetrqQvA7mhibfMgTEFZLopjgPQqLIlvga2rEhQp?=
 =?us-ascii?Q?1JFM6mlJahC0eN3DONEPyG9qOjM4kfgLETs+XgsFhw/E9WvQ+n85SodGIpBU?=
 =?us-ascii?Q?a/acI4IQDgNCNdTKEiXzIBVhROAFcvEzz6F0YD32+igw/nVnEBAAUEbxTZEO?=
 =?us-ascii?Q?guMu1LPT2vq+0LpNZ67Q1T/3uTPQzL+uTKzKrcFX6KCOYIBubEMqy7rvqNjU?=
 =?us-ascii?Q?Vdu2ewTTEyj3JaD/PwzohkQ1BTy2zEPpavYHHO1LHe5efDohblN1Eq9mFPOM?=
 =?us-ascii?Q?/b9oCYZ/4nDOJ+t08r+0BJ/F8IpgjTIAVkwl4ibs9/O/Eta8S0YHyi9Pqvdd?=
 =?us-ascii?Q?azEQTpiTA2fyHR5TnFCHGO88qV6m3lt5Z0EwCX/tvx9LqvL2Yk6yXvUZSo/a?=
 =?us-ascii?Q?niq41Kd2miF2psi+aCZ0oU00vz7Lx+ZYWKHrKEsIf2Ni4MUL7eK4oCIxiXKh?=
 =?us-ascii?Q?weQLean5t2HCUaiv2P34qqkVAwY2mUKAZvJBF88pf7mQFR50B7WTQo02nYEk?=
 =?us-ascii?Q?0/ZBRasm6ZZEatkPsECSSOHhn5O5D77LBgZgho72Yul2W9Pkvdtvxx/HboDk?=
 =?us-ascii?Q?/wxf+vese5AWQKh4tEfdFAfdJFEstFUw+RV7GYoEiIXBbuNs0YIgmyQivZcs?=
 =?us-ascii?Q?XCHiVzREiffslfKBSfZiYWlhIx4eSe0ghRAWIu0RENjOgO6ZUOzAg6UHRnOL?=
 =?us-ascii?Q?8qPFYJlIKHQFPs9X9OBYBryGgEKDSpVF/tqpboZp/oqNp3Q+iqbkIsq+CqNh?=
 =?us-ascii?Q?zAf876/EBR6MrvuSfrwOn7n//HhhLSrZkUKEJYykeeoscK1YlXxQr6BBzuat?=
 =?us-ascii?Q?jajOEoh6ndH9AaxCeDie8LDNtZrmn6M159gcCeBkzFe/oos9hlBckQPzQLR6?=
 =?us-ascii?Q?vLtZTKTDrL90sxPx6owCjOtwEVhO5cTQ1tJ8ivfUTiRjoi667W42wwNdaqUC?=
 =?us-ascii?Q?6H/RVLrn0UL87D4wuvSSg5oPoebbxsaAGNv198FP+LVLTRaJlp0cN8X+RLRb?=
 =?us-ascii?Q?7Y+E2mUxU7BUsV0rIbSBEaUR9A17LD7O17Mhm4/7Znz6RHRdrR08gv40BEXc?=
 =?us-ascii?Q?SHKZTG4CMYcmLVuO4/Sfg9h51bLxCzkYRinpm8pbj0OuloRFJRGUeOA6T85u?=
 =?us-ascii?Q?loQlGmeIyz/MHCY=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(36860700013)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2025 20:33:10.7614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8cab065-efa7-4590-0202-08dd43c8cf61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 20:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115219

On 2 Feb 2025, at 20:06, Gyorgy Sarvari via lists.openembedded.org <skandig=
raun=3Dgmail.com@lists.openembedded.org> wrote:
> +do_install:append:class-target() {
> +  # delete lines checking files in bindir, e.g. this:
> +  # list(APPEND _cmake_import_check_files_for_CapnProto::capnp_tool "${_=
IMPORT_PREFIX}/bin/capnp" )
> +  sed -i "/.*_cmake_import_check_files_for_CapnProto.*bin\/.*/d" ${D}${l=
ibdir}/cmake/CapnProto/CapnProtoTargets-noconfig.cmake
> +}

A sed like this is incredibly fragile and will silently stop working if the=
 cmake files changes. I recommend using a patch instead, as they fail fast =
instead of silently.

Ross


