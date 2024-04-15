Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAB9C00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:42:07 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.65])
 by mx.groups.io with SMTP id smtpd.web10.18783.1713181317517394501
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 04:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3jULaBmX;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3jULaBmX;
 spf=pass (domain: arm.com, ip: 40.107.104.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aY6ZRWakT+mNf0GWf9SCG+upwVTGi29E97Tg5NbB6YiSJbWiGLQTDE1sJdLSkt9vGmw0XW4puv1ng8Iw/UV9RLz1eAlIcnCRkH3c+59NfMyi9zrSap2ZS4kBxIp6MGPRnQ1yvEYGKewQqd07Ql8UgyHmCCHHImCS3AKRDOP4L24P54umn7Iccy9cgXJmL/FGhw9sLTu5ji4TANAjwAnYzEzUIyt2hnbL3GN0y0C+pUGsGev+Rgv9acAFJna3UOfTBBTzmqwBDeRhQNibGeI1UhhUoX/VoTI7n6x6fzfovOEfxPNIkEXDBU58q5JdQfyyNIWGnx9Pw4KvMKqKGQ+63Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjWLavaOhYlSCNlnn8OWdSUe21mB4aqBFax9SJ/81Mo=;
 b=Mbaq8UpGbblnuRB4nNcM/y4megOnNL4tLoMcm9NIxWUJMxv9UpCxETjhaTkPlo5kf5E/4T+1IeCjJLjQQunHBnpiM8EVmhfmtX7xyVlyYj3wNLIAJmLLNC2qhrcXG6fESfq3NQMydhAmQriOdr3lqEs69TA8eKaczOFr60wBPWFNCKL+lFEMm9l6VzGahFzxKwqpHfzSV6BxpMzcD6lc83JTUrmo4YI0jtNUAWK4Ip9sWF4/xDLqPx/F6fcUL4F5LmqTGMaNscAGr5oGP7tQ3mbxHotthKwaaohU9GdO7j8EOoX6UumnNcZpS+JnUGCaIxzbYjhP+beP8zevzNv99A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjWLavaOhYlSCNlnn8OWdSUe21mB4aqBFax9SJ/81Mo=;
 b=3jULaBmXq4jGLKzMcHAFE/sskL3UJIYcPmmWvjb84XUQm7HnHIRL6ca4g6hazEyL4vNp+NfmsuEAmqZoe1T8cwcqbXYtTGgF2oHtDjTLUxnYMnZxC8h9pa+lxb/wzUt4hJnIZgkeRHoWlMhzBzWRfNpyG6QDxnqAAv43weZPNGw=
Received: from AS9PR06CA0299.eurprd06.prod.outlook.com (2603:10a6:20b:45a::28)
 by AM8PR08MB6577.eurprd08.prod.outlook.com (2603:10a6:20b:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 11:41:48 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:45a:cafe::f) by AS9PR06CA0299.outlook.office365.com
 (2603:10a6:20b:45a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Mon, 15 Apr 2024 11:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Mon, 15 Apr 2024 11:41:48 +0000
Received: ("Tessian outbound caed45120527:v313"); Mon, 15 Apr 2024 11:41:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4fc7280f74960ce7
X-CR-MTA-TID: 64aa7808
Received: from 610dea4c812d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AED7D494-DFBD-40B4-B69F-41AEC521AACE.1;
	Mon, 15 Apr 2024 11:41:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 610dea4c812d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Apr 2024 11:41:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsC/itlIgFK9UNd+2sEKjpgt25jQkQSKWhj2I+SLb04dO8dsTkBbYIXFdaUKAyIXPvwDlqGsJKJzDqDu4cXWTCxPAbU1rYJ9HJ8pJ/oQPm3LrRaBkbh9PHIpvgRfzF8rimG3JJ22QRwC+445FPS1SHjFuFuTP7hrovmgXsVI2TI2OzDXUTRS+evwY4hao0CE3OD3/Bq08fhj3es2SGWn+yCWOqlMtrAPe97znCcx7VzmQWY7hzMRfTUj7ShVghOOkYu/uU3rIV9Wxx14ZgpV5E/psKEohY8rYwNAlTYgvQ3/7QaGA8gQwAoA/ao5jqrJ8I2u2JJekdAHMe50txpZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjWLavaOhYlSCNlnn8OWdSUe21mB4aqBFax9SJ/81Mo=;
 b=jNT+iss43R/5my3Iew2M/d+mfqsXEOGPLm8rWOX0ot0ecSFUu3LQMtn7GEwxJf8TaFeQvEThAW7p/Gbu0FzPUrf3va1wk+10JvBs7hVPP4OEScYLc2VuX6QvVSVwDBcPFO7fsjGrib+zop2jFnaXROJasMCMrY5l4w8V+V6er1Jq6n/2NsD6mW007PXm65wlAqJK6qcVrMQji4nXm8ViGp8XwxY/SxParp+1qWb5XNZl2POHjhs50QnXjqenvlyfWmIEI/+VO8PzefosBQQ8bmvcwdHsoYq7f81CCHrfO7JwDnw/H6OV7vL0C89SxQwTc3G2PxYK9VbL27E90OxdSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjWLavaOhYlSCNlnn8OWdSUe21mB4aqBFax9SJ/81Mo=;
 b=3jULaBmXq4jGLKzMcHAFE/sskL3UJIYcPmmWvjb84XUQm7HnHIRL6ca4g6hazEyL4vNp+NfmsuEAmqZoe1T8cwcqbXYtTGgF2oHtDjTLUxnYMnZxC8h9pa+lxb/wzUt4hJnIZgkeRHoWlMhzBzWRfNpyG6QDxnqAAv43weZPNGw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6547.eurprd08.prod.outlook.com (2603:10a6:20b:316::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 11:41:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 11:41:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] edid-decode: allow to build native variant
Thread-Topic: [oe] [meta-oe][PATCH] edid-decode: allow to build native variant
Thread-Index: AQHajmtqLULMtsVnSUq/Sp3K9VL84bFpLWUAgAAG8YCAAAKHAA==
Date: Mon, 15 Apr 2024 11:41:38 +0000
Message-ID: <3099CDAE-8DC0-4B0F-BA45-F1CF0E10ADE8@arm.com>
References: <20240414125805.2253456-1-f_l_k@t-online.de>
 <DDAA3D7E-61F0-4774-BAB1-8996BAC56833@arm.com>
 <1QEZBS.61V5422DWMEK@t-online.de>
In-Reply-To: <1QEZBS.61V5422DWMEK@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6547:EE_|AM2PEPF0001C70D:EE_|AM8PR08MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: ca855615-ae93-4310-0e82-08dc5d410900
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OwVbOMMh808H+Dj7/He/dIevaWRozSuLTFa6iHxkN2buesnl0OE3Behc4sR7h7F4DuUVz+oOOoMzFGDFvTwQ6AdUlA9md5qKdQENlhiRbUWoms98xICKy4jE1bLSGtgqnxfGEMEl8mBAnsd7XKkqBcEFNRzi1IMDPI8as+hOJd3lcITBso1MjTOOJKER5+GFy6gYiwCn8QhVJtC7V7opd1UzxWu/BCP2TmhX1wtMxx5Gp9C9ItmJLCWfOlLONqI5xXTKIrySqolj9Lag1pxhAbVlDMlgWLamSlakAUlC2Wh+oQwaCD9LuFPGft1wUYvm3de8m6+srXwvQBza/afHFQz6x7UMsHFF2XLJsRfqqQ4TjJkskYhL61F+SbIUHYMrESNnqSp8OnCVkE0HjuIoSuvguL5m0dabqQTDv11sSDSwkl3hiHNMkTd4x7BRgYCHHRcfR0Sae1y3TpEqX/RYHikqTgEP+blBd7GbAbzs+3oG60d4Gx4O4hjuhuwm0INo1BD4rTNpMSRFHVOvzhhxKBE31ofhOG4rAqXr+wWchzyMlyrOmIaPqBgmESqu5ATwtsakkjVVhzWHjfkPpZccDSx7zJGKPZSYokW6vVDgPaiyxi41iZjiDOw1oH+z433rUcamraNJWX/nrYaPv2M+bR/pWR9vMWRJof95uyiPkuMTIJCLMdppjVoYJkTjiPwU
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0C82EAD7561F84E8EC9662C035F8DA6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6547
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7bc29eb4-236d-4eed-2a9d-08dc5d41034b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Pmz6/wLUmQk/b2m5hrvfxbuFrOQwGVlb6rPE6EdiTeNe5CBYrTAMnbCSIFFMDpXoC5jLnfLMu1vMpQ1UbAOoOgLC8RvQzNCynL4GFcnvQRQDvuOv2b0UUlSZaCPma0nUA6/+EEdQR31E1k04OUlK3ixXNvwdy5R3CjSVGS/xy6fYll8f70knYT9rgNTLPKw/Fh06KGGEZykWqvtj6B81sdjtuCPDG9fwOMmE6+xGvpYGgTesW9opRGUh649pOlEepSNf+G9aj70dlszW6tO5YwZFSk+MryiuApJTnB2hqiRfV3oO94tYOIybq24jNl7AeWKCQbSA7rLGOKW3ovpDwgfxz/8KgP4aA6EMpk45S+zYSoeCdo1G8f+bwEQSkdQPu4BJYO3MbaDRSyFz3YoM0OGgpijzmoF8r7RwrKr2QHgWxDwMc4h/O7zoGUQ0RzQg8dA6V6T+x0vsUYfd1gktAiOtypBb+Rej0cbpz29MJgKQVJtAE4Ka/pGIC+4px/tSHSzJdU5K4qD7aruOWuKMbq/jBKJvjfm3De/RAwxoR5KtbbTtS4Oxf5fHErUhhS4+ExAINv/1523FWEWqSxQblhCLd/kQdsQH975Tu1iOx+/8sVugjrxhrB3dsJLPc3gxGMmmu0w/2Ltcbz7aYEo10WBmhaw0246xGEajc748yySd6eIKWBv0jS4hWVcE4I8ul1GPO/cHSG+E5J9VhKczw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 11:41:48.4398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca855615-ae93-4310-0e82-08dc5d410900
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 11:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109959

DQoNCj4gT24gMTUgQXByIDIwMjQsIGF0IDEyOjMyLCBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxp
bmUuZGU+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBBcHIgMTUgMjAyNCBhdCAxMTowNzo0NSBBTSAr
MDA6MDA6MDAsIFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPiB3cm90ZToNCj4+IFN1
cmVseSB0aGF0wrRzIGEgYnVnIGluIHRoZSBtZXNvbi5idWlsZD8gSXQgZG9lc27CtHQgd2FudCB0
byBmaW5kIGEgbmF0aXZlIGJpbmFyeS4NCj4gDQo+IA0KPiBJdHMgYWRkZWQgaGVyZSwgSSB0aGlu
ayBtb3N0bHkgZm9yIHRlc3RpbmcgcHVycG9zZToNCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9lbWVyc2lvbi9saWJkaXNwbGF5LWluZm8vLS9ibG9iL21haW4vdGVzdC9tZXNv
bi5idWlsZCNMMQ0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZW1lcnNpb24vbGli
ZGlzcGxheS1pbmZvLy0vYmxvYi9tYWluL3Rlc3QvbWVzb24uYnVpbGQjTDEwDQo+IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9lbWVyc2lvbi9saWJkaXNwbGF5LWluZm8vLS9ibG9iL21h
aW4vdGVzdC9tZXNvbi5idWlsZCNMNTkNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2VtZXJzaW9uL2xpYmRpc3BsYXktaW5mby8tL2Jsb2IvbWFpbi90ZXN0L21lc29uLmJ1aWxkI0w2
Ng0KPiANCj4gSWYgZWRpZC1kZWNvZGUgaXMgYWRkZWQgYSBzIGEgbmF0aXZlIGRlcGVuZGVuY3ks
IGFuIGFkZGl0aW9uYWwgYmluYXJ5IHdpbGwgYmUgaW5zdGFsbGVkICcvdXNyL2Jpbi9kaS1lZGlk
LWRlY29kZeKAmQ0KDQpBcmUgeW91IHN1cmUgYWJvdXQgdGhhdD8gIEFsbCBvZiB0aG9zZSByZWZl
cmVuY2VzIGFyZSBzcGVjaWZpYyB0byB0aGUgdGVzdCBzdWl0ZSAod2hpY2ggd291bGQgd2FudCBu
YXRpdmUgYmluYXJpZXMsIHVubGVzcyB0aGV5IG1ha2UgdGhlIGVmZm9ydCB0byBzdXBwb3J0IGlu
c3RhbGxhYmxlIHRlc3RzKS4gIFRoZSBkaS1lZGlkLWRlY29kZSBiaW5hcnkgaXMgYnVpbGx0IGFu
ZCBpbnN0YWxsZWQgYnkgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2VtZXJzaW9uL2xp
YmRpc3BsYXktaW5mby8tL2Jsb2IvbWFpbi9kaS1lZGlkLWRlY29kZS9tZXNvbi5idWlsZCB3aGlj
aCBkb2VzbuKAmXQgaGF2ZSBhbnkgY29uZGl0aW9uYWxzLg0KDQpSb3Nz

