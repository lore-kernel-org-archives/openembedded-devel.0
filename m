Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD5BC982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 15:14:59 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14083.1789830886508022717
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 08:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=odFnk/vL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=odFnk/vL;
 spf=pass (domain: arm.com, ip: 52.101.66.7, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XyUgdGvSly/MQxkof/iSKyjQuX+WiHNXg7gSRUbFjhgwxWhyKO28J7JS7gPDpEM/hYR8T6rmjw937YOWIBPl9wfemVz7CpHVSvlFtEWU5w4IXrG7Rz6tcRHYIPCse2ZUohhYB9kX+z/2+rLx/rUo/2RkqoU0058XvqHsWkJicejZhdBn7mXP5YdO6i43f7lSTRxCnsOqJksboUV92D3dp1shqTlZL92CJ0kGqaFAZHjteAdjfTCSrvgfKjUBEXBxB4/XIXNtRhwXdCA9Rhm6lwhXP0bXrD9KGXwvCvyBFveILe9dpk9RPNg0epRE+ef1pvPd+BEBwJpDZ3nKJf/uBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcNL3FPuqUSBkGYIRl+PQEPo0LHCKe7OHEJXT2Y4glA=;
 b=Y3WQvBaV80Vc7FBVXKAy8zillLwxoojdApyhpiSJfUtR8q9seXEDXME2T4N4simNy3Nrv6KD7vtJDFVion3YmxPJwCSbMmffhWZreGIduGGPuORqJS0XnDJVl0+ZxV+ly2jdc9Q8a4xsnTuH28zLexh1TCzUL+jBeFO0yUaac1HXdoDefHLxmMJZmAWsj9lPrtm528VAYmJCx0IkuqYkdFGDLs+aL9JI8lU3TbgdSJx7NQvAHJ9WFjuOkINei6AY8IPFXk/2tcSyFlLH1SIEUb/yhx0q/gROiSsI+jm6A1jYR4oL5I8mkzXRJcuAvHK3BIigGijBujWA11WK3g+55w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcNL3FPuqUSBkGYIRl+PQEPo0LHCKe7OHEJXT2Y4glA=;
 b=odFnk/vLtgawdxqH+y0+d+HWrQ5XBNSeYEnjcDXTibOe6D35xwyX+RMZALLopTmldNJB7OWCwkUl7kY6j9WD/49qRdjkFWTZ9monlMR/mHCqS/yjbSI6EEqVCv0H8q33LuICKiumXtBwAktldA4ql32Byz9rDU+pv8KzM5o0m0c=
Received: from DB9PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:1d9::22)
 by AS8PR08MB7371.eurprd08.prod.outlook.com (2603:10a6:20b:447::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Sat, 19 Sep
 2026 15:14:41 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::89) by DB9PR02CA0017.outlook.office365.com
 (2603:10a6:10:1d9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.15 via Frontend Transport; Sat,
 19 Sep 2026 15:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Sat, 19 Sep 2026 15:14:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWN9A7QnXLp7wEKNnanLt77k8/HnWEQIuPCadRuk04kc+5Wvwha81PgUqXsZO1vdSyL48BkHXME6BRgRSHsWEhEsjACqF2hsi8ZLO34fT25JU0q/NbJcV5vxZslKjzyOSY93M2HHafcqN7iQB8amVvGwLYXM3vsGBAthO6aIs7YHp3VER8ZYcKB6Z8kP+pY5nYhPn4Z1HcQd5K+W5mAxVOVzbbZqwD3ofkedOmOgL+sCHO4F7XiOuGqASW0mZgPxePCpsIOsRxl4bSOkEsoyL6NEhp1Vp8D59UuH69ryNWukQM9ERu0RSK/RSSr+jBGw6uJE2xDUlBMlFdY9FKdpNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcNL3FPuqUSBkGYIRl+PQEPo0LHCKe7OHEJXT2Y4glA=;
 b=hFN2m+KpGVDkLe5ZXHXKfPbyBpenpkQI4N2GMLSSlh0aATY7NJV9C3gYNHoKXjuucYUuXwzGfGe8uiOR4q2F+x9w1M6j8xmOX72kon87cpe07b+9et2uMi66VN8Qb5Jn1QsU/L79WcqzMyz6ppDRo13tTo/CJvD8AH5JERm9/lO5+gSS7u2rg4OzWheDvfUVYNYqtryLNIyh4aYkTy1i0LQo5W739Cxj1C+EXU7XKMm5s+uoraoChmzNJuH5ypapYJ61kPnxKLrvCUn995CE6zgelt5umC4jsrvAMcPMHrujeaKNOWrFISImMsvl3kwMVtGX2EU3BXgTjqgYv2jQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcNL3FPuqUSBkGYIRl+PQEPo0LHCKe7OHEJXT2Y4glA=;
 b=odFnk/vLtgawdxqH+y0+d+HWrQ5XBNSeYEnjcDXTibOe6D35xwyX+RMZALLopTmldNJB7OWCwkUl7kY6j9WD/49qRdjkFWTZ9monlMR/mHCqS/yjbSI6EEqVCv0H8q33LuICKiumXtBwAktldA4ql32Byz9rDU+pv8KzM5o0m0c=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS2PR08MB9893.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Sat, 19 Sep
 2026 15:14:07 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.004; Sat, 19 Sep 2026
 15:14:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joaohf@gmail.com" <joaohf@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] boardid: add recipe
Thread-Topic: [oe] [meta-oe][PATCH] boardid: add recipe
Thread-Index: AQHdSB924dJmCwCd50e1bGtsmpA1vrbWArsA
Date: Sat, 19 Sep 2026 15:14:07 +0000
Message-ID: <FBDF528D-7B0F-421D-9E64-5FF49E327719@arm.com>
References: <20260919101028.2828097-1-joaohf@gmail.com>
In-Reply-To: <20260919101028.2828097-1-joaohf@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS2PR08MB9893:EE_|DB5PEPF00014B94:EE_|AS8PR08MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 91724c76-01f0-42f9-8201-08df1660ba6c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|11063799006|56012099006|38070700021|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original: 
 6XlusyXJ2oYbjh3zr+zAPOyanFDBKwaaBhIpG1+3k1uhmA/+6RD4BlmMLCYvplzx2oQi4/0HpBtjTSXLwY5CMG5+OyZQ1A70oOAJayjEh8O9C4Fvd5bG7lCmS0mGld1oH+HkAV6zP0ZTqG1MN/Kc1YJdY3gtAEzQhi1cKgl6JIN6dSeoIy7SgR9sqMdBMySENrbaaR+xYlq64jlD3Pvkrh5LhVrZn2tSgvusIuKwiSyEYPUo7jYXAaAdcrVhYmrKFX2f6Nu+yHee7/pzYBLAzeHS8aab5U/vqcif37JsSDkO2d/bFOltT3AhTapyl5XezJQyRneIRNc+bKsezPrQoEQuU/ZFjJVop87j0fpKOdxu8q3+2LhOasI81LBzUItsCr5fb6gu3c7REbnTg8YW0foHoZo0zFvfW+3I1GpfrRgoIsO9VgFzDrKLRUWVC98yngDiPhvjXy/BR7KW2dhnZQfQLP03tat3p8eb9RsL4stC/n3NWZ5FwJ0qEL7nIYyaSXlRkQCYEp1j1+x6fCssFsal0ZecV5oT5EqmUI+UMqGKJwD9Mz0geKmr73dFWCE/zSY9SJL8dyGalJ+bE3q/7PMPzmv9onq8rdhVSKs3jvqpWvXgC4E2Uh9aZyeCUzF5uHNwRlDjgWiMNdDqx1mgPRnCY7VWBreJ6+bOcb3FyM+n5YBdyN9Uhnw/ywGkufE07f0Xn90EbWnQguJxt4YDFh6uSMe121qJ4pi4fEAA5YI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(11063799006)(56012099006)(38070700021)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <271C357EBCB0BC4AA99A4B9BCD45163F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 w61BDI/4g6OwMWIMc/ZT3TLBFJCd/sJ3fHc0rfLGXrFB6HijmOCGm4NxpyR2trKfULpJqjju3EF3RIhD0DHUquiCHQlBF5n+dkJ6v/APR/yEPDHUlnYzoh99DIlImXg42139bsA60OssMw9IKAZMiT7cofIKFKxtHw9JDayAyRJ4u06SHJ2mg1MKqp2fm7aWgq6tcmBFXa0DHVVbiEBVJr8+zkFxqLeDdA4Isny8lnis2+E/YAdwAL1oX6i0+pnmRnJic+DJiL8s7KQChILp8QCpEYBeWV8wbsDXzGnNxM3Qddtwk6pYqptF48PdAkub8RhlI4u8wkepGmZd08817Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9893
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	72abb624-9358-413d-943c-08df1660a691
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|23010399003|82310400026|36860700016|35042699022|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	MrJC1M/DkctINge9gZkYKt0bhARSt4VBx9yMyZeeHiD4SKKsZACyb9P/88hIam3fe0f7K413Xhh63L1FZgiN1nSrfMX7NK2REBOdQTsPxlSv8ATWYZDoC65JNEyQWRgbtTWTocnFpXyHOTxjH6IYE59I1XBIT2dtURFz6l4L0hzOjhP3OX9Uq+lbOFkl1/TLTfJQZ2rzNvdfWxPafF03BHBmm+wkhEoW5j+10oG/WrH/v/y7P2SJN+1mO5tqyfhxJgrj9imGJv2TZswel94FPrwP90AAS/YijCp2/hSoy8mbt/WB+WcsEwHowtMGJpglsqr6HcLb7Kk5JBiA03h0pAmq1Nc0BQ2fEswolX3gMqWD2xTlGiovV6J9rBSz4Ru9MZPmSWsLnaj2fO1oNXpDPvbvRUe4AOt8onZ5A7Y1x8sNRHVlTihxIlsoivJaPRjBiEjkvpGOReTNwvD4zQtZj0o5ovZz4VTl87fc53HDxvQ0MLFqXr2a+SwSKLt76MSVwSlu5TyuArPu54S9uKWoPFLqJZTYEzjLpaZnjVGQMViZr1IQpbekPPCOM+xjhM5Vn8BF5fldJVBrxkasGkeEGYHpwXgAJKDOo8ftlWGovyJELg4q6KFihgkqrdY+MIJi2pYYktORurPRz4j/DemVeZszXjkRqs9EXk8QaMONzGhKYBz/QhXgIanb3XQjj1H5r5Le2CnoWiIhUOSrRDGTJg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(23010399003)(82310400026)(36860700016)(35042699022)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VNEXXvhREJJpXu91qjR/LxdVRZOy1ow2uw3njk6YqxJLowkDd/mEqmye13PbLFMps+mMjdOpu2z2wSl/7TvfQZsP5AXz0wOWjYC9jdP/ZQ88NCGceThG/S0YtIVON+AKQAZrNn/t9OICrelDz7vU9YXgJrYdtKfF9Mov2EL5y4qbhwnPolNexAgBwamC/HV/jUHXH7Y5jj5eZcHZD8PKrsATL71Rnt3FhWGkLwh9h+r177z7ALrJOP3Tn5OJZDzAZ+K6zFI/ESrDFqk1AasjKWRuOblq990TLjysjnDIVeG4UrpsO8Qlwoi8XCh0lOQzOjytQsOCy80uoqj9BtonfALJQOUym4f+xsSq4w89I/vh9u+9aCA3zJB0qjKf7OMlJQYuQLhm+ZHhFfRdV0HzGYqeGPbOCp3pk6CUt1yqZv0U48ffXC6boYTPfTjMP0e9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 15:14:40.9734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91724c76-01f0-42f9-8201-08df1660ba6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7371
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130117

T24gMTkgU2VwIDIwMjYsIGF0IDExOjEwLCBKb8OjbyBIZW5yaXF1ZSBGZXJyZWlyYSBkZSBGcmVp
dGFzIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxqb2FvaGY9Z21haWwuY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiArU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL25l
cnZlcy1wcm9qZWN0L2JvYXJkaWQvO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIg0KDQpQYXNz
IHRhZz12JHtQVn0gdG9vIGhlcmUsIHNvIHRoYXQgdGhlIFNSQ1JFViBpcyB2YWxpZGF0ZWQgYWdh
aW5zdCB0aGUgdGFnIG5hbWUuDQoNCj4gK1BWID0gIjEuMTUuMCINCg0KVGhpcyBpcyB0aGUgZGVm
YXVsdCwgYXMgdGhlIHZlcnNpb24gaW4gdGhlIGZpbGVuYW1lIHNldHMgUFYuICBZb3UgY2FuIHJl
bW92ZSB0aGlzLg0KDQo+ICtkb19jb25maWd1cmUgKCkgew0KPiArIDoNCj4gK30NCg0KUmVtb3Zl
LCB0aGUgZGVmYXVsdCB3aWxsIHRyeSB0byBkbyBhIGNsZWFuIGlmIG5lZWRlZC4NCg0KPiArZG9f
Y29tcGlsZSAoKSB7DQo+ICsgb2VfcnVubWFrZQ0KPiArfQ0KDQpUaGlzIGlzIHRoZSBkZWZhdWx0
LCBzbyB5b3UgY2FuIHJlbW92ZSB0aGlzIHRvby4NCg0KQ2hlZXJzLA0KUm9zcw==

