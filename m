Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10168C3DA61
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 19:07:39 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.59])
 by mx.groups.io with SMTP id smtpd.web11.2317.1721329650438318081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 12:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fesxnsry;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fesxnsry;
 spf=pass (domain: arm.com, ip: 40.107.103.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ta/FHvnB/UhaX/wEnudDdf5a3l4+oaAD9PJzomUaeX1R6Pde3fw8cVQPWWW6mshHdUdcWXx+SvrwLcT3tq6vDYl01GOXAz0JM2pgyBthH1PZbTlSjKVe1xFy5EQchXz4sFw1mE+ri5HPXW5aAZUyOkNhtQwHWXwvgE615j6g8fugRLyM0pAUC9c1Hykf4gqIsb+58bTMRsQNWt6JVYfXGqW0/BZKQE45dSWv+/JvN6evGOSgpqiEvu2zlbaQp2kF7y2Mf76n+7Jl8++XUtE95P2vGJYWCfsyO0w4I5xuokBu+W8gDF23Jw5bRFKmzW6/eU+MEVvUavsfnz0nRLbDEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G+qE2YKDTdOJWwc39q/YgIJDw5NfIJGPUulpMl/ojA=;
 b=dBQsdvm0LPPhaPCb/F28V6M2El9mjp97370wze/dl3ufK3QfNiladIv2CxMTxFCNhYqmjLqxgYdHkZ/BZsnWpHOLd/fkpbfS0roPwVyTkfiUwJQq19xCmSnHu8In7jUex5f3nHJUfp3U+JpPLD18I2wZPbJgDr8fykcwKPMgch1c/C2Z4dKBzn4UC6vPn2fl/YzkNrM+JxBqVfxGSn6UAYNy77gSB0wnQ04JJdXeKtWEmNFMXH8yboeE4gj81PCnuW78DabnXDCITj+WdyKjjtcX7d/U9fJJcSNxngNzW30lVebzJeCKHYjtJmFNiKCkPwky9JJo9AoFCurRhqkHMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G+qE2YKDTdOJWwc39q/YgIJDw5NfIJGPUulpMl/ojA=;
 b=fesxnsryaf8EK6J2HqYNlz2UggzCMgjOzqfGXytzrAbwhIKs+/8h+DDcqlcg9Gws18ZEhRGsDlhAj/O84NWnkfn2zyxN3xb9qx/JulNSpSPDtR/Y592RvsvfeN/Aa0Z8izmlu8O/j0Y5Mt/la+dLzPNeiINEuagQDhjCarMTbr4=
Received: from DUZPR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::17) by VI0PR08MB10989.eurprd08.prod.outlook.com
 (2603:10a6:800:24f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 19:07:24 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::9) by DUZPR01CA0023.outlook.office365.com
 (2603:10a6:10:46b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Thu, 18 Jul 2024 19:07:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11 via
 Frontend Transport; Thu, 18 Jul 2024 19:07:23 +0000
Received: ("Tessian outbound 0808e8e76ea3:v365"); Thu, 18 Jul 2024 19:07:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 297043dde2879e79
X-CR-MTA-TID: 64aa7808
Received: from L8bfd42b14560.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8D51AFF5-35D0-4A1C-82B6-5466FA5EDF63.1;
	Thu, 18 Jul 2024 19:07:16 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L8bfd42b14560.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Jul 2024 19:07:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3yDhafte5qrVeB0sssnlMW1qFwbJUSnnqqp+lGYVYfLDst1d7cGFVbO9J3IkpmkpT1tMElhr176fZTbCmt0OR4lMqp9fn5/uiVShxz6eKYJ/fWre+rZvbwkots/eB55F3RMsaGQ4QNUKY2kLY/zS/ZCMVZhSWDtr1BimVQ5oSxTbTVfPo3ot+fhs1TY4qahrRl5lUSTHnQsymIlLXx1SZaJAg2GL30XBou31xOLNz5MPAGv3iX8pyxvTxJWjUegJoSsawrzcYI5HAljwNRlt1d9mnk7LHeN9fDlCVaD4ElmFAjl61rnOzphA7WC8/2UDP6Ah6QVZBfLrmfDmQXkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G+qE2YKDTdOJWwc39q/YgIJDw5NfIJGPUulpMl/ojA=;
 b=Xx9PRQdeuGRMMkkZWgCkwznZ8hrpzf9Z1EqcLv/6KFAm4iYDY7mx2S/s2l5IW3bIT/teRhQFwjNoUczTVh8VMeSIDuPmkh5zv2lVwSAUbrs/brUQN8ZdKKh2uSzy7ulaDb5j6nRk+Ya3CmAeRiI3VTEMLLR3nQwvkOuE/szTZY4Fzqgebp0yFgg4wqTc0FX26Ice9iJO1PvopV5U4sLE/ds7cyPldxOosLCuV1orRqL1yNP1Lp4no9S7GEq9B18AyAq2gAqEy+6lOtX0y6XR5Do3ts0jK/maS6SeSZrE++7Q6xLhpNyfQXEwBX8AGQMeyIMMxrgfF3fgBmIR1ZypkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G+qE2YKDTdOJWwc39q/YgIJDw5NfIJGPUulpMl/ojA=;
 b=fesxnsryaf8EK6J2HqYNlz2UggzCMgjOzqfGXytzrAbwhIKs+/8h+DDcqlcg9Gws18ZEhRGsDlhAj/O84NWnkfn2zyxN3xb9qx/JulNSpSPDtR/Y592RvsvfeN/Aa0Z8izmlu8O/j0Y5Mt/la+dLzPNeiINEuagQDhjCarMTbr4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB10102.eurprd08.prod.outlook.com (2603:10a6:800:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 19:07:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 19:07:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>
CC: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python3-incremental: improve packaging
Thread-Topic: [oe] [meta-python][PATCH] python3-incremental: improve packaging
Thread-Index: AQHa2TdffrZJ1Diwjkiw47ALeKn0nrH82OqA
Date: Thu, 18 Jul 2024 19:07:13 +0000
Message-ID: <75A61EFC-F6C3-45E4-AB59-A34B89962F4C@arm.com>
References: <20240718172321.412136-1-gudni.m.g@gmail.com>
In-Reply-To: <20240718172321.412136-1-gudni.m.g@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB10102:EE_|DU2PEPF0001E9C0:EE_|VI0PR08MB10989:EE_
X-MS-Office365-Filtering-Correlation-Id: 12abda2e-3f7a-4d33-2c8a-08dca75cdb29
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?M1c4d1lzMjBMMWIxNnJvcXNjbFJES1E2Qjl5NEpZMXFDazFYa0lvVWRvV3lm?=
 =?utf-8?B?NS94RE9FNHpFb2pnb0tWOXRaT3o2RFBXYVFmNnZ2cnJua0UzRGpMeFI3LzFh?=
 =?utf-8?B?WDlvRkdrc2dVTmRjZXhmUENJdU9LNzBRSVY3WGlpQ0VHVnV5U1pMSDZEajRP?=
 =?utf-8?B?T29NWWhwZVlSVHFoZFFlOEV1NjVvZ05kT3Q1UmQ4YzZ0M0JDbGlqK3dzc3Nk?=
 =?utf-8?B?ZEg0dThRa1JMY3JaQkUwZkFSTTJGQzBYRUt0QUpMd05jU0FRUEhyUVVqOS9j?=
 =?utf-8?B?RlYxZ2FBOTgxSGJ5azlBWjhESlRtUUlXNWdVeXVXby9uOUMzbTBtdTJvN0dY?=
 =?utf-8?B?U25aSzVXbEJCQ3F4Q3pyaTkvSGw1UVZFd0twQ3hKL1BuU2orbVU0Y3UrK2Vu?=
 =?utf-8?B?Y1pzTDRyaWxIOGFjRnNNWlAzNmE3ZFVOSzBRZFUzUzJxc2tHdUg5a0k5c1hq?=
 =?utf-8?B?YjVIS01NV1A0Y0dzazdnYkxlSVBTbXJVaGZGRHNPaXBJd2YzS3ppVHROZnU0?=
 =?utf-8?B?UU5YSjlsUzZ5T1JQK2NXbmhONEttMWhPRWhLdW9EY0tBSE00K3dnZ2VxWHly?=
 =?utf-8?B?NGNPRktEWTh4M0l2SUhzWnBrUHhGbmp0NTBDSjdjYyt0UEo3QnkyOHZMTWhW?=
 =?utf-8?B?STQ3NWloOFJxRmxLblZNRHZaT1VkNlFBT3d0cWRNaEZ1UmN4SjFxYUNBMUUx?=
 =?utf-8?B?dmRlSXptVXZ5VGFrUFA0dm5wdUZsbDhRV3VyQnk4Y3NqY3J5Uk9VamJhdy83?=
 =?utf-8?B?U0tub3RSU0Izd3BJTU1tVDVqb3RTajIwbm5ycXAwWFVNZ255Umt5dFBkOE9s?=
 =?utf-8?B?QzE4c3hsSzBkY2FSSE9IcTRiS09Zb3gxMVhVaTZuanF5djFYVjgyVlB5Tlcr?=
 =?utf-8?B?d2Y4eWVhRHlYaDZpQ2xMWXB5NDdpaHVKRWd6SlcvdlQwQmlMTDdPNlFmc2wv?=
 =?utf-8?B?Z2lkc09acTJsRXZrcFFBajJMR2JrcnYwM0xOUXpNK3RsQ1lobDZMM2xna1Mv?=
 =?utf-8?B?MkpBR05iUldOa2NlQXBDbFVOSytLWGEwbnBiUTBMQldyTUdxbXlyVWRZL3Rp?=
 =?utf-8?B?YmR1QmJ4QTFIczVibGFoblYxZldTYTN5aUU1RVQvYlhHRXZqYURNcG55b1VR?=
 =?utf-8?B?c2RENFJTRjV0ODdnc3BGN3JsYURnTk1UM0JjcEFvNk51MkdrSWdFUzh1Nmkx?=
 =?utf-8?B?SjVJVEpWTTJDTjNaY3JwMUQ5MWhsVzMyOS9JSCtudHNzczVQTGpaelJ5TTM1?=
 =?utf-8?B?ZzNoSjB4M1FKUXdWTDVoTUNISjZPUDlKOTJRQmZZWWdGUS9Xdkx1bkdmbnpG?=
 =?utf-8?B?NXVFbHdBUzJWZnBtOGhQbWhuNkZya3ovdHgwdlN6T1FYYzVaNmRiK0dRa2NO?=
 =?utf-8?B?bm4wamxSQmp0eUtrMkVxWnR0cjFtaVR1Q1h5dUdjSEJlT0swZzEyeXRGWDM1?=
 =?utf-8?B?V0pySzMrZUYvWktMM0U2ei9zcHQ0QTk1em1Cb1orOWxOakM3ZittY3VtN3Va?=
 =?utf-8?B?TnY3ejFNNmQvOGtmYTlYbExadGlBNTBkSmNKQ2ZycGg3eVBsUFBDZm1RQW5D?=
 =?utf-8?B?aEJuYUc0eGdXMkRidEN6MzdHd2t4ODBuQTEwWDhpVU1yUEpDTW11RXNjVzNv?=
 =?utf-8?B?VGtTaktNR1Vzc1pNTTRiUGx5em9WaHl0ZnF5cWJWNk1TNlhmL2ZUTkR2aURS?=
 =?utf-8?B?dTlEVjlad2dKamtGNlA3azIwUXd0ajNBSVZQWEZoSS84V0g0SFhnK1V4QUxs?=
 =?utf-8?B?aVVSRGlQT2xIbk5qM0tNSlJhMHN0U3lEL2FTODk1NEZqZGNJZ0JGcFlVRWxk?=
 =?utf-8?B?WCs1YWhLeUlZUFdaWmNkcU1FODdWYVRXK3I4WUh1cTlUL2tyL20wRXM1RkdE?=
 =?utf-8?B?VjBES1FsOG9GdXlBT0ZFWTJyeUZSeDhHZmdUTlpPekVwK0E9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7D467274A4EFD46850028DC40A540D6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10102
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ae853f85-d4a8-4183-1888-08dca75cd578
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|35042699022|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UjFWbERBYlI4aFcxSkgxSjB5QjV6Yk04ckVwck5TNzNaa3pycldZd1pqRVFw?=
 =?utf-8?B?UFh6aFB5N2dKbkpIL2o2NFVUTUdpOWZGNzQ4NXhOTzRiTXkyRi9PUW1ldFVH?=
 =?utf-8?B?VUVjM3pvd0VwNGlDeXBDSXgvYm8vb3JKNE0zNWpBOStPRVRFVHVxbW5RTDVz?=
 =?utf-8?B?QkhGZGQzYlpPOFVJVEJ5dXBUcGJPdXlpTXN0RzhrNkJnR1JHbzZSeG5Kd0t1?=
 =?utf-8?B?WkhmQlFjdFNDQk9QOWt5U1l0b2dHb0FTbjE0b3QvSHkrVnpDRWhkMjlRckY1?=
 =?utf-8?B?TVhYenJQcnRqazZ2NnlYMGpKZFp5UnhJMXdYUEQzLzVBbEttMzdldmRGMkhn?=
 =?utf-8?B?Y0FsTmpnRFJHa1lRc1RhaFIzMWxlOXV1TVYxY0NGSFpsNDhHcXZVd1U1enVH?=
 =?utf-8?B?RXNzU2s0WkdKSzJFZzBCV2dieUlvVnZlYjFOMEdUNHVZU01FYU5HMWxoTmh0?=
 =?utf-8?B?cFVKZ1N5UTVTL1R3eVBBM0tVUzh5TXFoYTkyaHltMlB4M3JoK2ZqZHdpQmc5?=
 =?utf-8?B?ekRvUU5xUkgrN0VvK01MS2pFUXVtTDZWU0lVVUx1VmlkYUpzMWNvaG54Qmkz?=
 =?utf-8?B?QWxTS3JJL1Nzd3A3UXp1MkxuS2pwd3FiNVRwTURLZkNMdjFYZ2dyTWNVbjVD?=
 =?utf-8?B?QlJjTTJDeHllUmo5TGJJM1d3N2UxUmNDc1cvRjJGR3R2ZUxMdlpNWWNvUmEx?=
 =?utf-8?B?YUQ4WkwwV2JFMHRtUkRpU3VQSFdHWnpERFAydWV4eC9qM1piOTFYRm5CME5C?=
 =?utf-8?B?ZGJRbmsvYUhuQy8yOXBFSmtyRzFjWUJXRmdxQWxmMDBJOGFqTE02U1hCcVhF?=
 =?utf-8?B?WUttNVBNM1Z6RlhaQnhIbklBOFRFTGNDcXZpdStnVG5ITWdqY2hyKzM0U0xv?=
 =?utf-8?B?NTAzVFdEK1dOeVlySEFLcmZ3TTZ0QzQ4NnVoV1FabGxBaGhqTzRtRjh3M1hU?=
 =?utf-8?B?bXJFZkludUxQajlXNnJNVFJvZW9tUXc2OFBFdnlaUkhoUWYzbm9UTWhUM29m?=
 =?utf-8?B?N3pBSzZsUklXTjl5Y09rcmRNaURURzJLNTdXSnhoNWNXaE9GMjhLTDhPOEFB?=
 =?utf-8?B?R0Q2SFFoeER1VjhOS0p4SE5PQWFzaVU1OU5IOUNQMTNacWRxQmFDK25Yd1Jp?=
 =?utf-8?B?NlM1citPa2Z3NktwYzBYMVZNOVNaaTB5cXo2ZVFaOUJWQzViZXdkdjRqeEsy?=
 =?utf-8?B?eXRtbDVFMDUxbDFaWm83Ym9rTUFyakxQZ1FybGh2WU04cUJkTEp5Mmc4SzE1?=
 =?utf-8?B?ZkpJLzlIWEVnTXR1a3dnajJTNTJlN3ZFYVNGa1FFQVdGeXVWMy9EaDcrVk4y?=
 =?utf-8?B?b25vbmJxNCsvYStSRDg4dWkxYnh6dTZwazRmV3Y4R0tFNi9oSXduRDhOQ2hK?=
 =?utf-8?B?dFRxdTd1MG9SL2EyOUNtWVQ5ZmhyMVlRT1Z2RC9mRysxenN3K1g5Z1BFamZj?=
 =?utf-8?B?UnM3ditZUFJlMGZKQVNsb0RXOVlDdHFpOXdvdkhPcVNkSUFKZXJSbktLL0dS?=
 =?utf-8?B?UDF0TU9XTmRKT2NRU3R5Q3N0dVgrUnJ6OUFqTHpaWGgxb0NoYXBZbDdUa2s0?=
 =?utf-8?B?amo1d1d6U3pHcyt2ZjA1SnlBejJwdjY1R3ExK1ZSTEs3bTRucUhYYkpoc0gy?=
 =?utf-8?B?aCs1U1owd3Fwa0ZOMUZseHhMWVVER3BCZkkzRmFjUWd1ZVplcHRCZ1Z1aVZW?=
 =?utf-8?B?eTBNbzZ1WWJSZSt4YXAyd0N6SVlpdHpaZS9LSm54ZkZaOFd0aW4zSTZ4c3No?=
 =?utf-8?B?bGJPc3BVa3pyTGxIZ1N1WXl1ZVpLZmFjWlk1enIrUDdCZkJ3dTUxdlNZMko2?=
 =?utf-8?B?QklhaEtITWZlbGE2SitHUUxENERmR1U2T2FubEhFNmRJRkFwZnNyTFhUL2Zz?=
 =?utf-8?B?UVZ3SVlrY0g5TGZjUFNCWUxaYnp6TUgrY3RUSjVHZ1d2cXFmbVowTXY2aTZp?=
 =?utf-8?Q?0Ik2cNwV7mQ1iHzQL+RyGdXfWLd5pD2Q?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(34020700016)(35042699022)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 19:07:23.5506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12abda2e-3f7a-4d33-2c8a-08dca75cdb29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10989
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 19:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111407

DQo+IE9uIDE4IEp1bCAyMDI0LCBhdCAxODoyMywgR3XDsG5pIE3DoXIgR2lsYmVydCB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8Z3VkbmkubS5nPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+IFN1bW1hcnkgb2YgY2hhbmdlczoNCj4gMS4gQ3JlYXRlIGEg
bmV3IHBhY2thZ2U6IHB5dGhvbjMtaW5jcmVtZW50YWwtdGVzdHMNCg0KQmV0dGVyIHdvdWxkIGJl
IHRvIGluaGVyaXQgcHRlc3QsIHB1dCB0aG9zZSBmaWxlcyBpbnRvIHB5dGhvbjMtaW5jcmVtZW50
LXB0ZXN0LCBhbmQgd3JpdGUgYSBydW4tcHRlc3RzIHRoYXQgZXhlY3V0ZXMgdGhlbS4NCg0KTm8g
cG9pbnQgcGFja2FnaW5nIHRlc3RzIHRoYXQgZG9u4oCZdCBnZXQgcnVuLg0KDQpDaGVlcnMsDQpS
b3Nz

