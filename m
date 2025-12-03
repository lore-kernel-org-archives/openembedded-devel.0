Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68797D12D42
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 11:09:46 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12578.1764760179725206936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 03:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lrgIpxU8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lrgIpxU8;
 spf=pass (domain: arm.com, ip: 52.101.65.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yiaCOEDGuQSwph+4X9C71gBn1bDUNKFmk1+JqRJbDBYCqsdxnx05PlV+DFCCWE3I+kcqBYEp6jIFUWo5FDmeNdpDiLWioEVtPi5VHNAXLrk200DxX4lU3MaIvqLujtbjmDTZVQ/ZEdGKJmsKqVmI12cQ5bASxrI0pMUYv01jsdPw63Ysh3ZOW9mkOBh64w7cHvjCS3HthfyPp9jKrxhPuxEPrdx/Krm8iqq4ty6l1xp4/oC2GdO+KgLk/IgZgIOlR0WG92BvRKtHYWbW+MjUo9/S9xKMPUMB7hC4hs2HEI+ZM2pVQaAWje/R74jHPLhbIIgKp3ab+aJvfyB9FMTJ2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzIFAitKoiqGkrAXozo8YSYBxhRNWhFXFpVEEhKYpaY=;
 b=wReyerVMqiNzBF0Xc6jlVx4xwj0hLKnoNLVWAKJFBidUSredcHSi9Kil8JXZD4HDPDBsnTnqc3uwBn7lZoApfeS66Ezy4V4L01foRmoYPYKnmw+28x9Dxah7aHW4eAcO0R5UK7SjZyxj1LbwNr/zsl0UT68m1MOdhsf0nDPHahgYhRRcwIHucFI5d9iwIGUL8H+c9PXY61Lcw6ADDFTndSN9vyMKtkmCe2P+7l5ktlQJFfZ0l5MdHCkx7JheQ7yruaFwZUVc0unEUi+1/r9HQhVht78b5TSAUtap3YHOZjY2YD1U/w0nYnZB1geGqr4TssINuDem56dNlOphytCtsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzIFAitKoiqGkrAXozo8YSYBxhRNWhFXFpVEEhKYpaY=;
 b=lrgIpxU8ObsyjUvtu/Sh19LpEntVdt9F9VDhf+UOALuB3s3jH/r8qx3TkjgiDWJ0MrZPlBnchWId16jbLrpQPPepzRAlLc6YCiF26XNy2F1ZfTMS/3u2h1AmDe8nZnmhnzOkmgnVZM863Evd2B/mni8fsI5Z/DbTZNLT40lpjj4=
Received: from AS4P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::8)
 by GV1PR08MB10729.eurprd08.prod.outlook.com (2603:10a6:150:164::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 11:09:33 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::e4) by AS4P195CA0001.outlook.office365.com
 (2603:10a6:20b:5e2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 11:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.0 via
 Frontend Transport; Wed, 3 Dec 2025 11:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kh+NcnFiuISOMJP1oLDISM2KMo9mQDmH5K1slUqqY9ht8fznLi+fGI8SH9Z+haNF09abX7uH8m1zhEECWNizfdGJbyESY2dUwaU0kTj7S9Fw47zIwFUDfg0oTAe2H0xC3T7CLRWXmQIqqpteHA3VIRjuS1fiQLW9pmak5VUYVDyjcK5D+FffhNvQGNUel8KjpncUnC97OqHf9xmHCz6RB4pqUeCQ0omiaIIUMpqF1ZCXqKiReal9vziJsZK3d0vp5+hVtq/sM6/By41CA2p3CVCXQP+Q6JJqc0bBBQoi2ItqnEwiIFpEqPQgFS4TcWPQTulPQvP4a+CQXE2STNoLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzIFAitKoiqGkrAXozo8YSYBxhRNWhFXFpVEEhKYpaY=;
 b=p7x6gbBkzt6/+gCpmDwkBoUfVUChVA6fo9W37MiUcfOTMAvr59Sz/4ltzM4piK2T2/PtRsicjBprUK2Xag36rT/S9qLuvUYlPL9IQEdgIzbl5g61X7tJ1SmiMP9pZH/KGFM+0iuX3xV5SBR/TBg+dQ2Ui3cDpZzM8sKcGQImOkaVgalgt87GFo5Sj7NkXIywftglGa830LBABOIyHELwWNlEXFh+9PfbBOwHl8/5XSx5tS6RXP+P1e/MYUf+KY0xPtBNO5iEpQAwG8U27+nd2dA8HlrP4k0XWIzhwgiStdDVEHamhJ2+NMpTgs+z7MhuwdInHzgcEQcUytDwpuCS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzIFAitKoiqGkrAXozo8YSYBxhRNWhFXFpVEEhKYpaY=;
 b=lrgIpxU8ObsyjUvtu/Sh19LpEntVdt9F9VDhf+UOALuB3s3jH/r8qx3TkjgiDWJ0MrZPlBnchWId16jbLrpQPPepzRAlLc6YCiF26XNy2F1ZfTMS/3u2h1AmDe8nZnmhnzOkmgnVZM863Evd2B/mni8fsI5Z/DbTZNLT40lpjj4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA1PR08MB11621.eurprd08.prod.outlook.com (2603:10a6:102:555::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 11:08:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 11:08:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libmng: correct version of libmng
Thread-Topic: [oe] [meta-oe][PATCH] libmng: correct version of libmng
Thread-Index: AQHcZDPCfxU1fIRu4E6G7zvQUfZljbUPwduA
Date: Wed, 3 Dec 2025 11:08:29 +0000
Message-ID: <FA59CAA8-D404-4977-A8A2-FF02AA4E9BD5@arm.com>
References: <20251203090342.2024473-1-changqing.li@windriver.com>
In-Reply-To: <20251203090342.2024473-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA1PR08MB11621:EE_|AM4PEPF00025F9A:EE_|GV1PR08MB10729:EE_
X-MS-Office365-Filtering-Correlation-Id: da02ea2d-97f8-4edc-f4ad-08de325c6f6a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y1FYQjVxTTdjUWxFSEFqWUh6bUJXMGhpRytXL0dZU016OHF5dTRCQkpJYWlo?=
 =?utf-8?B?aHVibTRaNEJHTi9LQUwxcXVBYTJIQ0Z3ZjlxcUFzSnFibHNXaGtKK2FyWmly?=
 =?utf-8?B?OG9GL0N6eGVoV1MvNWZOQ1hINitYbEJTRzdoUDhvaUlTTFpWbEg3cU9ZbitY?=
 =?utf-8?B?OTdnbTZod3E4cUxsYTl1UFF5WGtFbFBldWtWVE9CTUtIdFJUQnJOOXYxTGtG?=
 =?utf-8?B?b29vMndXdlU5bDhaNGRlREM1L2RGRTM1c1E3REMvNDJJME5qUkVrUWtGQlRI?=
 =?utf-8?B?MWRBZlRoN0ZocHFKc0IyRmZUZUE4K2paeG8rc1JTaWovQXhyMi9BOG9UV2xi?=
 =?utf-8?B?ME9FWTZ2UXEzZDdlbytHMnRpOGN3YmozdU13T0huVllNbVdETVVWNk96YWlw?=
 =?utf-8?B?dHVOUjRyVjROK21uaWJ1Q2ZMRjBrUzhZMERaNzlMNkI1QkVjR0dnc1FhL21E?=
 =?utf-8?B?VGQvaGl4REVTQjdWWWFHeTB4alZPeVl2cERhbnlwNUdUbGNURHZLRlc2Qlpj?=
 =?utf-8?B?MTloaHd5QXdhd1lDVVh6WWk2TDIvRUNyS3NldVpZaWtZUjBBa1lNaG95UUZG?=
 =?utf-8?B?VTR5bndQZTI2VnhMaWRWZm9VWkxRSWRBUUlKMWJoT3lVb1N4aEQwMkVUKzlQ?=
 =?utf-8?B?Nzk5cXBWcDNOZ21kQ1pPeHNTNDJpQmxiVUtUcjZCVGQ0NTJWcURPaGVtYVRG?=
 =?utf-8?B?U1ViNnhJdTBuMUdiWU5mU0U0cTE1MnNPYUtuSzhMT1MrVW1CUVhsbkJxK000?=
 =?utf-8?B?ZVdsU2tOWE93dVY4VmpFOEJIZ3Y0TGRPNGVLcE8xMVgwclJCb1pIY1lnUkRz?=
 =?utf-8?B?ajNTejc0VGkzcVVNMG8wNzZkNVQ4ZUV0dWpBaW0vUVVBanV4amFjV0V3UW1G?=
 =?utf-8?B?VHl2YXhFd0g0SWsxTWZvS0NYZkF1dGNmcFU4Y3loMFRHVDhSRmd3bFFEK1p5?=
 =?utf-8?B?NEFBRmNjZys2UU5vTFpCSXNNeUd4NHAzWWpoTnZBVjQwRmhhOGRDWXFjdmlS?=
 =?utf-8?B?OGNXRGJTRnlGMnB5dzU1SmZOaXp6UCtyeEJvU2VXVHZKRkZ4YW1Qd3JoeXRv?=
 =?utf-8?B?N0lBbU1hbmRUWHN2THlZLzBXdW82dHQzSGxIbzJDdHA1citka0Q4T0VwbWVU?=
 =?utf-8?B?cFZsaFExUDl1NnNEWmZzY2NmbzBObWM4ZDR1OFlDdEJ0ZU85Q08zaDF6REhK?=
 =?utf-8?B?TFowT0k1bTAvSUdLRUJmVTl3UzRpSUthRWpIdDFoM1VaZnlld3FlOVVxaGZw?=
 =?utf-8?B?Qm5NNDBCMlFSL3JEMmVrMVJ0ekM3dGRVMjFoNVN4SFVCeTU2UlZmVGQrYmcv?=
 =?utf-8?B?QldLK2VWSE83blFsbHkzWWh0VFBGZmVqdVp5R2ZndUdqZnhWcmhkZWovMEFI?=
 =?utf-8?B?ZXN5SnlaTTJkd2R3dWI3WGYwUXVudDdWNG1WSGlOUTY4ZDBoUGxMeG50MmNx?=
 =?utf-8?B?Tk1VZld1YnVEWU9ia3pxTThwZkJBcHpjTGVBdHN5dFIzMFkxOHBocEJnQ3lB?=
 =?utf-8?B?a0gvWmplQUVsM21IM3h6RTQvc1RrQUw3S3UwUVhmQ29lZnBBN0ZBaTRlTkxF?=
 =?utf-8?B?RWNQSDFkTndwdGdkNm9IM25qR2M3MFU4eFBUaEFURnpRNE0rS1VCZlpydW1Z?=
 =?utf-8?B?QnpoeUZmQTF0ZGt0Tjk4VG1MRGVOMDR0L0cwbzJxd1hYeTJteHNBWWwveUVQ?=
 =?utf-8?B?VXpFcVovSnFDS3VnQm1CMXRPU2h3KzZZK1ZtOEtMSkk0T2l1WDJiRSt4VUVk?=
 =?utf-8?B?TWE2bFBzbmRpY2FtbGFXbEVIM2ZSMDBCTjFLMS9kL0N5QzNCU0JIbE95dFZ1?=
 =?utf-8?B?R0xHNFdqRUFTUlFYbEtOZmJEb2w0NzdhSSttN0pTeTNXc1dKQ1g1MTNKa0Fs?=
 =?utf-8?B?cEpiZkRSTFJQOXk2SjNIbDdyNW9JTWVtZmxDZ3Q0MFZleVRnZWZxYmVUcmQy?=
 =?utf-8?B?UHJMLy9jRlJndVFZelNLRW1oay9NeFplMGJwa3plemlHV2VHQlRheUJPNFBz?=
 =?utf-8?B?cjRlWlBTL2tLM3p1RzhBR1RFVlBMLzFhaUhWWkJWaThBb040blc2dEZjTGht?=
 =?utf-8?Q?kx3MAV?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7919895983C39F4DB4156AB307D698A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR08MB11621
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c2278073-62d1-472a-d383-08de325c49fd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|35042699022|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TUc4TUJybHlHamIrZHpxeUhqV2x1d0dyL1hyU2Fxdmh2UlRTQ3VaY0pYVE5M?=
 =?utf-8?B?NWVIZnc2K29GZHlEVUFockhwbHNBQVFLbVdaM2xoZDN5anRUaHJzYlcxQmRo?=
 =?utf-8?B?RHVJYWREQVAzZGFwQlZxQUhmYTVUdzhZTi9sOVhCNXV2OW5nU3JDZzhaWTI3?=
 =?utf-8?B?cWZ5UTRIazFseCtBRjlSVXh2cVRYNTJOY2dvUDBQd3hURThhRDk4MVRlMWhU?=
 =?utf-8?B?YVpnOUNNa09jSTBjMXMyRjhNMFNyd1BXKzlZWmVyVVFwQWp4TnRKTFV0VEUx?=
 =?utf-8?B?NTF3R3lTeTQzeXY2V29MOW0wUFVvWXN0ZitHd0NzdzIrNXlOWkhZWlFqaTk0?=
 =?utf-8?B?VDNMcHVZVDMwcmhpRzZFZnBxUnhqekxpYnliN1Zsemw5eVlQUURLQ2U2ZFJB?=
 =?utf-8?B?SmxrcUw2OEVNRlM2RStCbkppd2djMzA2UThsNzFSRVZwUm81U1NsQVFDRVJ2?=
 =?utf-8?B?bElwOEN5TE1LeWlSY3c5KzJCSGdiNlVBYklhQzBGZWFlT2podTJvYS8vV0FM?=
 =?utf-8?B?QTg3ZkNrSEZNU3BwSUxOclZxd3NVd284dmZ2QktjSHBubDNUQURvWEh6MEtm?=
 =?utf-8?B?OFpSRVBNcHFFQ2hYSW9CTlFtUGtpa0ZqSm1odThFMHVDbHR1dnhUVnVLNXBi?=
 =?utf-8?B?WnhSb05LNi8rM2dUVHRUUGhPK2xJNUN6T21hVGFFbE1kNk9zb0pURXRqaEt3?=
 =?utf-8?B?aU5CQVJSVkxJSzBsd0pXY3BwQXhCdGhwUVVlZllNVzc2QnFrOTJ4WHd0WFFW?=
 =?utf-8?B?YlJ2R3YxUUs5RFFxQUN2TGliSUZCUGlFeGRqYXFLSFFZMGhtWnBQTnpjSlNV?=
 =?utf-8?B?NDdwcmNlNSs1RmFEYXFHMS9iSCtPaHY0OUplV2pqRWV4MEZOZXZPOVZtaDlX?=
 =?utf-8?B?QmxjVWMzQ2hrYmlxOU54RG01RkM5M0xkOGZZQlYwVlYzdHBpSndnUjVoeWxU?=
 =?utf-8?B?SHVTMXlwN01uSTZqb2NQbHA2WkQwWFphTE1SMVlqRFM3eFhwbDVad2Vuc0ZG?=
 =?utf-8?B?V2ZBSmhlYkpOUW9PMlBHWWlHZVlVVlZxaG5sb1RhSVNmalAxOThYYnRONDNE?=
 =?utf-8?B?ajBTTkI4dU9scXVITkgwZExJV2M2a3JGVVYzZnRuVFpmZFdhYU1UZDd1TmxX?=
 =?utf-8?B?TTZkd3dKemxCY1NpSXZodTFKNjFHbkVrTFc1bWFqcnJUdVd0aUxvVXRRWHRv?=
 =?utf-8?B?QjVvQWI0WEY1eVF6MndaRlZQaVVHTkJkU252WHpnZ2dhVEk5ZlQ2U2krSlBL?=
 =?utf-8?B?OXZaTHIyZERwa2ZMZ2taV09nem54bTBjakd3ZXY3ZFBSbTJsNS9OdWVWK1lS?=
 =?utf-8?B?blRYN0VqWXlQK1NxUjZQcUJWRTdoYVJtNWY3RDZtK1RWakI5MFRjYllzRFNq?=
 =?utf-8?B?QVp4L1lxUlIrNzlEU2NOVWpsci9hUlU0dGN3alpaYVhSQ240MUNScDQ3Rkxo?=
 =?utf-8?B?c0V6TFlQTUpUcDVweGppTUhqL1J5OW92REE5Yk1WcUhsb3lScWxKL21sUHR0?=
 =?utf-8?B?L3BCN013V3lra2NFdlY3MUlROUcvQ3dTZ1RmbmFxTnNVMm1hL1QwSUplRHZ4?=
 =?utf-8?B?RXBvZitWMkpPOGZwNHdTQzBHanROckV5Kzd1a3pFcVhjMW1tV0t0cXFGRjd4?=
 =?utf-8?B?akN3dWJqT0JYRG5sbzR0NDAyR096OWdzT3ppRzhDSEwzUnRPSERmMnN1QVBn?=
 =?utf-8?B?dE1WNHZJbkdHajdiL2JQOEFhUERWY0lMRXBzYjdtK09ZcG5SNGdzRVczMGpD?=
 =?utf-8?B?d2E2OTE1OVRkcStnVytZdjdqSEV0RkVZUjYweXFiTE1oZi85Z1lyb0dXWVpm?=
 =?utf-8?B?bEFJejRyVDlyTlhyMjhqaXlYZ2xqWGlUTGFOd2tKMWduWDhQWGlQNnRxS2tB?=
 =?utf-8?B?RVlCMmdVdkExVy9sMWVkSFpCUDZCS0t6eWkydDZ1QnpReis2YklGMVo3NFh6?=
 =?utf-8?B?Vm84UG5mZWtkYTFaWjJ5bzNvMnVUbjJISjVuL1puUWs2QXVIcFpDVFFWalp1?=
 =?utf-8?B?dTFKWjNHREhrUFN1WXVhQUNXQTZvZWIzazlWK29aZjVTVkZsem84SFdHTGRF?=
 =?utf-8?B?MTZPMURJNHpyZUJTVytQSnBPM1NCeGdJZmNhTDhGbjFMeGN3M3dGME5zWThw?=
 =?utf-8?Q?XRYo=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(35042699022)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 11:09:32.0406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da02ea2d-97f8-4edc-f4ad-08de325c6f6a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10729
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 11:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122276

T24gMyBEZWMgMjAyNSwgYXQgMDk6MDMsIENoYW5ncWluZyBMaSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Y2hhbmdxaW5nLmxpPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2
ZXIuY29tPg0KPiANCj4gQ3VycmVudCB2ZXJzaW9uIGlzIDIuMC4zLCB0aGUgbGFzdHJlbGVhc2Ug
b2YgbGlibW5nIGlzIGluIDIwMTUsDQo+IGFkZCBhIHBhdGNoIHRvIGZpeCBpdA0KDQpMYXN0IHJl
bGVhc2UgYSBkZWNhZGUgYWdvLCBmb3IgYSBpbWFnZSBmb3JtYXQgdGhhdCB3YXMgZGVzaWduZWQg
dG8gcmVwbGFjZSBHSUYsIGJ1dCBubyBicm93c2VycyBhY3R1YWxseSBzdXBwb3J0LCBhbmQgaGFz
IGJlZW4gc3VwZXJzZWRlZCBieSBBUE5HIHdoaWNoIGlzIHN1cHBvcnRlZCBieSBhbGwgYnJvd3Nl
cnMgYW5kIGEgVzNDIFJlY29tbWVuZGF0aW9uPw0KDQpTb3VuZHMgbGlrZSB0aGUgZm9sbG93LXVw
IHBhdGNoIHRvIHRoaXMgY2xlYW51cCBzaG91bGQgYmUgdG8gZGVsZXRlIHRoZSByZWNpcGXigKYN
Cg0KUm9zcw==

