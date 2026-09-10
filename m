Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F64C79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 17:03:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19741.1789059815946967392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 10:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bYxrtLt+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bYxrtLt+;
 spf=pass (domain: arm.com, ip: 40.107.162.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=n6P88Igvpa8FFIju5EcDpg99x6nFFYEaChGKMkGB4hMg+ZnclVBkdjeCD4x8/b+iu8q/p882jNpXkLL/UeAWYn2hPb+5xz9F7K/pQEg+3TbKcqLoGcvArKe0uvAV52NCjF7+7hRWKhcBdn7LHslkQpSe5mNAg3P73YQm3Tw98LbjN9+LiIdLaiDDvRaXlVGg8PMssTQPeWIrZMl57Ynmp414glTVtPaeCi8v2Z13Tje9bg6Y8tximY4pZNyEqcGwP1sC6gUeLPV6LWHswgX3iTHf3P4PrWdZi+SUQ0GaJqM0o/+uOFsFkGyZMjaMho1XGTlpf1LC630gKEyjettB3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SRwVwd5kDSppX7d3YiQD1NcafGrVFDGqEhtm1NPyRQ=;
 b=lTnY/8kvDKRbDMgnS/KWTkIIR02G8WO4PSc+dMOL+m3lLUdvy9IFcrjYHa1Pza0/ZDQyPj9LpUt1IyXmkvLzAYKqFshEtBE5Ze76RX3xmGu/jU1Gn141Q+5IaXW7kKqNs4cbAMBYM8B0tpRzLHu2hnwBFm/2NtvluK/LI3WEBUzdRBbLfaZw4mVX+lYky0P6IToIbnAcCRfGsWyV1A6dLeh48d4m+ZXt24pxsdVGc/KZQrC6Ov8YTPiYsYM3ywfrJUgYhkMwqLpkjym09wP5AzHgzI84UVonBJiuBqt0vu8m2EqoqGdOBr1i34UEtWpjR/UMZDvsRsRN5e1x6IGBYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SRwVwd5kDSppX7d3YiQD1NcafGrVFDGqEhtm1NPyRQ=;
 b=bYxrtLt+ZETIay4lwV06v8CssfTKIb3daN8faLDLP4M2Ejn6biAnOAFugIrwWQEcu+t9Jixt+FptUgH4XE3Q2NtiIuexB0VeBecJ4K3P79qw0TLBbBN/wRJyYxAqtfDaKTVh8cHdWGFvFM66+iMfzUdPX9rqCAAyQMJAv7G2NLU=
Received: from AS4P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::19)
 by AS8PR08MB10313.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 17:03:28 +0000
Received: from AMS0EPF0000056C.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::6e) by AS4P250CA0029.outlook.office365.com
 (2603:10a6:20b:5e3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 17:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000056C.mail.protection.outlook.com (10.167.242.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 17:03:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGhFe+a4nHhlm4B3dW3qkKdQlu1R8O2OKzkUDgtY+uk1pEILLVNzmzXYogYnWgw/krqQTPOPv6DyAVvXLG+Y9A9n/rZDDlqwnlwyKKILrH5EO38ilNS1Uf+BS+6LvNWr37oHhoBCvIs6ohtLlZHM2ZGO+V/WBICqZ2cct/u6eqEanvZs6o5hTqA8v0dmreT5es/lGEAo9z0DtklA09x1RlmEH38cX8rqwzFeIdBPX/UGgT79cB1txmIo7hs+PQ11nxzrBZpjW6LyNjbAxoDBzmLbscInMwltr9yar+pWRkCi934XzTPNhh79m8A8wBVPQrRPP+3g9wuNePXRxEv3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SRwVwd5kDSppX7d3YiQD1NcafGrVFDGqEhtm1NPyRQ=;
 b=OvplmzU3R8TXiarAQO+daj7m/dvrySV97LVkOBJkK+fbD4z6q8DFynyluir+wunJYshmLHSB7pLxAey1SeDNZbvGyxs7tVV8LypQYKDjotAe383OyvlfIgW9XL8KrZtsmlU4xNCDhlNfeTk2ZD23wCdip6y2g9yvjssYGnaEgc4aLZzfg9ZV0FKFvae/FIxyvOqBa6LM0tV06PDgTndL2+z1rN4tUD0GJYoag5zb458njgQFpWaAAVlsh95EVS9NaNXIKhgYmoTEO+6ACD7yOeUX5Wqr6Tj9iXy4v6imKd9SNvh5E/aqBfZINVOcT4Su/+Chbur45+Wet36ZKr2iEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SRwVwd5kDSppX7d3YiQD1NcafGrVFDGqEhtm1NPyRQ=;
 b=bYxrtLt+ZETIay4lwV06v8CssfTKIb3daN8faLDLP4M2Ejn6biAnOAFugIrwWQEcu+t9Jixt+FptUgH4XE3Q2NtiIuexB0VeBecJ4K3P79qw0TLBbBN/wRJyYxAqtfDaKTVh8cHdWGFvFM66+iMfzUdPX9rqCAAyQMJAv7G2NLU=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS8PR08MB8970.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 17:02:52 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0428.004; Thu, 10 Sep 2026
 17:02:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj
	<khem.raj@oss.qualcomm.com>
Subject: Re: [oe] [meta-oe][PATCH] spdm-emu: Switch default crypto backend to
 mbedtls and update to latest tip
Thread-Topic: [oe] [meta-oe][PATCH] spdm-emu: Switch default crypto backend to
 mbedtls and update to latest tip
Thread-Index: AQHdQOnNUiALogS03U+bFizntT8vhLbICo4A
Date: Thu, 10 Sep 2026 17:02:52 +0000
Message-ID: <6D1B8712-5FB2-4145-A053-074DDA3287D8@arm.com>
References: <20260910060106.2214089-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260910060106.2214089-1-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS8PR08MB8970:EE_|AMS0EPF0000056C:EE_|AS8PR08MB10313:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e321c1-97eb-47bb-05a3-08df0f5d6f19
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|22082099003|11063799006|56012099006|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 5DyCWU76f9Fck8FTTmktgj1CUbbstydaH0GnJgIKWcjnDNxRQxaGmIOzBpYoPiAC3HDwrLW3/nTiSlZdx15ktb4OrWbczO/yJb5KhyrUbiM3R/BgLSWgI28cqyzbIFep7U3HX6LKpgv0zsy+q8TI6D7ajDgfCeSpXTNLZSBufgGXXceu72a1OqgrhR8BKySV7FSk7NRqlzR0H9BrnDjzFUeFTug+HPRBeqm/noF76FINUmoG5V6CE4mGEg9QI1O2qdoV55Ufm4HD6kPrYesh+LcPVbAOJkvpXuAvJX++Qj7xi7PRx7b+HLutgKeRXm1t71Szhx3F8LpN08+EHwYwvDS5EVldZOdIENJnCKiNsdNv6pRjdSaW6eQX8fnnXi2RDGTW8+P/hcK0h+NyGSTqnAfRD40oY+Cbg9MktVPhgMogVfeqHttZyYnm1ls+gJBma/48MVmvfQEzsYguue3znVfTmXbjyK4E1Pf9R6hUqz5RK+ls3QCbbae2E7ySMsmPqbc6BwezwrvrqwtgUSDOYgq1Ud+8rOQuUn3QRTMFOK0BzbDXRJY3ANxb1S0dI2MnBP5qL1Eqo/GMhmBNbCETXOjz5iZ55RMOdsJ+pCTai8EygCjnBTG3x/Lp493mrhhJu+57YlehfaVF0Hhzbrcr0olpr2WMAWTDnPLqDtdfJjUNDb7ldbyP8BYsBTkxauanGQRXYqaB6Kd7UMndRP7T5nrm1brxOrOMvmF4NWJ/o5o=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <13A18185354DCD4C9B034D2FEF18816C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 4pjLC8zH8Gntr67I7pPzGXaiuBGGdN1iwthvkPPCPz6A/MgOQx7V18KBrOZE92RGDX0ir/s56lEYGDIztu3ugeNCUFjTqqP5xzmO4iC1Pj4KbG+XkKcHWiym2Idz+/kRQhAHkbtuR29kVKhGW8N9XVTW14PEdd6chDJOYHQAsXkKrm3/m46F+HIuisKq+CJ+Q+T+19BPMNbbWyvW1bT0kEohpV+55JIpPnQiQ2qfgL/zl5bJrahA0qC6WjN3av5dfY41ZxVMQ7BULCD7uVIiQyZzohEhq5yOSfFd57mtgTKxPbtOIzoD0FBBy6D0yZu3Ld6esVxumy5YhGDEIAvwaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8970
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000056C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2100b7d3-a312-46fa-e308-08df0f5d59f7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|14060799003|35042699022|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	yLFEvUF59d5eoFp/dYLCe72d0GNW/Zr0ZqlTE2Hcfmi6d538sWG27jJ6c4gjnoYk0sN2u50S5Ff6TPanAsSSXm7seofxRAmC7HOm4nGuI4p58ZLoa9cMfQR5rC3TOG7O/HaS6rH1lWCWElZqV+cbCXZZV+t+mxz6gaPQu8gdiv4l2wU1hegbJTOuB9CoSGSg+qaXfr0o5blKXXv1lhITMiHm0LBusLLCF4tzOGPYQZ+EeTDDbtPG3zncaLlzueNc5t7YWaUbCeliNGq0+C9PHaY03rw/z2yHcpzgwjVRSp2OjIGKXe7/8/Dn3NrgaTZ3AS+he2d/XSjZTE9f9UwnztRLxJkKU7C0fFQ8fE4cNv/1epLBIdsm4cgxJR4IiS38vBAGaSIkM8w5zF6HfsaBtJqcjbCPpDR6Yym0f08AbDB//Y3xSUJ7vm8Pafa78thjleY+jl5cB1Z8dvkqLuPVjZr525dreRTD+VXcwkHJF/VUxCFYFtuHtyBMQjUKnog1POr0nOKUNt59QxgHQFUqCgPzVBCAgNAxVccA+Sxy9bbto7JgY5A02T3tZ4doJtVm/5AMVEGjUm7pkzxJTJsePC4FkZIkHrcFEgLJd4wtMs+bA9Aqd40dmuxT2zhMC6T3Jt3uc6iaOnredFLkAR9zaP8Ojxhoh9ZDM0/WEYMiABafUIcp2YWJYMlLgmzH6XF1lTTWhYyAUNRlgUUuRwXlgA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(14060799003)(35042699022)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZVMlInnv2ze3XX7wGte1dcRaFOKf+jU7LvWUxhm/G45a7Yp9U2cPqKyvkRdC0REUnjWKj+L8WpkDbM38t3EAA0M9SSo/2ih8o9bLpAtwNKv1i0VR6Cfx8JcK4iTbnjErdI/Gg9GINa1v5RCv0sl9x6gcVYJGttQ4PMscTA38y5fuRW7r+J4xijgV+YplFtikHyLcHrd7Ho4a6HOndXk8D7JN7oecFqKY59BNqXW8wypA6yqKMrWscLhzjh74k9o3Utu6kTnpYXoeJtosVQzU2nTw5+mWZAUy+VWA4T/hHe04vM1EfhQja1TqymArId8ryMc2ShcDYyBWWyu4qsfHJJnt0euEjRltsmUeEnQO9HdzxfOAdFp8qBp8kImkF7tdsiVfLTc5/qdEjaIApM30vAW3y8adoUB/vjASaJE70BTj+WAgfu7hcptYjp94SHtn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 17:03:27.9209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e321c1-97eb-47bb-05a3-08df0f5d6f19
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000056C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10313
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 17:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129916

T24gMTAgU2VwIDIwMjYsIGF0IDA3OjAxLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiBtYWtlIHRoZSBjcnlwdG8gYmFja2VuZCBhIFBBQ0tBR0VDT05GSUcgY2hvaWNlIGFuZCBkZWZh
dWx0IHRvIG1iZWR0bHMsDQo+IHdoaWNoIGJ1aWxkcyBmaW5lLiBvcGVuc3NsIHN0YXlzIHNlbGVj
dGFibGUgZm9yIGFueW9uZSBzdGlsbCBvbiBvcGVuc3NsDQo+IDMueCwgYW5kIHRoZSB0d28gb3B0
aW9ucyBhcmUgbWFya2VkIGFzIG11dHVhbGx5IGV4Y2x1c2l2ZS4NCg0KSGFzIGEgdGlja2V0IGJl
ZW4gZmlsZWQgdXBzdHJlYW0/ICBJdOKAmXMgaW1wb3J0YW50IHRvIG5vdGUgdGhhdCBtYmVkdGxz
IGRvZXNu4oCZdCBoYXZlIGxvbmctdGVybSBzdXBwb3J0IHVubGlrZSBPcGVuU1NMLCB3aGljaCBp
cyB3aHkgaXTigJlzIGFjdGl2ZWx5IGJlaW5nIHJlbW92ZWQgZW50aXJlbHkgZnJvbSBGZWRvcmEg
YW5kIEkgcGxhbiB0byBkbyB0aGUgc2FtZSBmb3IgT0UgaW4gdGhlIG5leHQgcmVsZWFzZSBjeWNs
ZS4NCg0KQ2hlZXJzLA0KUm9zcw==

