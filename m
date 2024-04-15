Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51115C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:08:07 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.84])
 by mx.groups.io with SMTP id smtpd.web11.18384.1713179281044891583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 04:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lHk6OiUr;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lHk6OiUr;
 spf=pass (domain: arm.com, ip: 40.107.249.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FZCd3gQotEvVyQrtnzaKjRmXO8K51HO96q3LL60UlxET/X7q2B+04g8ZrNDCx9C6Se1FyHV++Il7G2t7z5NU8nsfWycQseE1BW8fDzIFQ54aY8DpM/o4bs3q1dQDqdN9PKukukKjXg9tPeZaYl6pgx5V8H1ga1WC/lcgXdgW9lFY0klTn39HypU3TLe50P7vRWRLzHDxSNU3swpGigGE4nbZ4kz1MIyRdO0wxJ6c2m7N54NFKmGyhVntyrydIvNikxKLY/eVhJQAnAcomAgdWPV4KYGIVhZtQzhxUM0fnq1WURLHm5gNN1/M9XIasMcxZIcydBi08LXSOisBvl2/dQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6sA9BiYQscQQYy4ShT4WY5nK08uhqb3Vi3a7+cg2No=;
 b=YtNGCohLxDhaB+2AOy88UNcexN7Rw1OrRrbyNA1i2aA/j4UZzTIA5VY3x/yB27otTGAT39MYGSmHNTIz3aY/T/Wvp8TQ9josEIZ5ZviTNPtDbM+sCbQS0Wa92WAz23iFnWrBmCbk/ZWHd/F6bZ1hSw2KxibXpPgGLrR2OPsd04Qf2q2c+Q9fpV2BeERT34tD3t8Q5pWkS79+78w7FrFo64Z7ECCXRA4pw57kFqRkd8f0G3HROBHX4q/DzqKkgyEsKr2qt9S3NM3AYXLFxyMiVFwpPQZ6d4pq4nrbiVenOTchqxRtDUCMRft+pzOARA/9d5byaG91xlSyQvezy8UnAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6sA9BiYQscQQYy4ShT4WY5nK08uhqb3Vi3a7+cg2No=;
 b=lHk6OiUrZ3MbXITTxr4NP82N5Pgw19Ac6ugIJncnmQZKZNlicaM3ZDAWsehBRc7H+yf18lDkTRsHMycMNldwNXkzT7EDKiOp0YXW1hqXo4ZOTU+5NLZqdlpYgM3BQ2Wr0T/1LTYGqgRD5Tk1U9oKeBhgdZ49rI9jFGhD8kBaZqA=
Received: from DB8PR09CA0001.eurprd09.prod.outlook.com (2603:10a6:10:a0::14)
 by DB4PR08MB8005.eurprd08.prod.outlook.com (2603:10a6:10:38f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 11:07:57 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::9f) by DB8PR09CA0001.outlook.office365.com
 (2603:10a6:10:a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Mon, 15 Apr 2024 11:07:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Mon, 15 Apr 2024 11:07:57 +0000
Received: ("Tessian outbound f1e9a43166b5:v313"); Mon, 15 Apr 2024 11:07:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5d22f01ef587127
X-CR-MTA-TID: 64aa7808
Received: from 424a1e083e9e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BAB7C375-FA97-4F04-93F0-3752FDBD90F6.1;
	Mon, 15 Apr 2024 11:07:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 424a1e083e9e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Apr 2024 11:07:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKcR4k5NOnup6ATzZubRu9o3dlFfOap2xBtcypcBzj4/GXoj0iosZy0TG7SXu7GbyMqSpcIstGWhrwY2qvC61uJ9gQ6uhk7U97XaRHHwt22geW/6DpPfmCvGbzkEaE2YTKtVyEoEEBQtpgCTij10sxhZE7dwNhJwcVDJKinalOksE/VMpfX8Urbm17qwfsrEQAksP6TU/NCysgw6kysxL+y0/L4wyy9NWpJlIlPLGrcbhLUoCs3ORaD9oC6Q3qThb65Xx1FpvDWbfuKDwU89kiLWx5u5V/WxBmXca4habeV1uwtCP0qKLEJOXLitWHWgJEEf6pba6vhH/bqX5Cfqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6sA9BiYQscQQYy4ShT4WY5nK08uhqb3Vi3a7+cg2No=;
 b=RJBxrzLp89yWqVP345P2Alm1gj+/EKK6q8QUNwKO44aHKMja8ZoTDzrl+U14c7RlB4Va0T9NJhIe4yXP0rv2VKYylbYzKWkRJaZgy6eh75yTNGMLV99Ot2hLOuYhQoznIzf6eiMzsNO/MKtJBWHZw4l0DJ0QSQ6cy88u6PsP8cAoZiznKG9/WOqWSAW8SU+pcojBQyC7v6Ek8KZJu3VKnMnthSzCmpI53e7sJ9/ccnhZsM4/hTk3GCy17A/2DHYQPELk+bK6xJ66pHESe0LyOYmMXY7jRfGKbB9ox1c8M1Uyb1NQkZ3GWXWQ11c/Us3sWkQWqfsArigJOwS39SywNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6sA9BiYQscQQYy4ShT4WY5nK08uhqb3Vi3a7+cg2No=;
 b=lHk6OiUrZ3MbXITTxr4NP82N5Pgw19Ac6ugIJncnmQZKZNlicaM3ZDAWsehBRc7H+yf18lDkTRsHMycMNldwNXkzT7EDKiOp0YXW1hqXo4ZOTU+5NLZqdlpYgM3BQ2Wr0T/1LTYGqgRD5Tk1U9oKeBhgdZ49rI9jFGhD8kBaZqA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6027.eurprd08.prod.outlook.com (2603:10a6:10:20c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 15 Apr
 2024 11:07:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 11:07:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] edid-decode: allow to build native variant
Thread-Topic: [oe] [meta-oe][PATCH] edid-decode: allow to build native variant
Thread-Index: AQHajmtqLULMtsVnSUq/Sp3K9VL84bFpLWUA
Date: Mon, 15 Apr 2024 11:07:45 +0000
Message-ID: <DDAA3D7E-61F0-4774-BAB1-8996BAC56833@arm.com>
References: <20240414125805.2253456-1-f_l_k@t-online.de>
In-Reply-To: <20240414125805.2253456-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6027:EE_|DU2PEPF00028CFE:EE_|DB4PR08MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e065eb-ce2b-4043-e6e0-08dc5d3c4e45
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 x5/L3VdhhFS5numswKmCjDFZkfTAF0ppiwxWeH9KOaIaDq59cVzRdKaCo3z4LjVcCeE2WONyd4yoxUhcm/c4MYY2NmxhbP12kcNMgOoIKY0FmkTLkl+688xGDENJzb5n2uwYTgoLfQ2saC51HJitTgFoIaajOumryIM/meNWaZPrhaLVZCG1V6Gix1KTr6El+tdHZfp8f8S5aCxrMnTM6o+hqKELvHxnxHbD6l7MxwijDruWg2gNNFsKfGeB3eCEHniVQo0SooPqiyBntLnf04PwIxcvO4JADuGdqdsfTFMAF1D4raDaV8r9YjrFoTPP3HYJG6/leeyfMpuYnTnZ3KN8Dc5P5knqFqtvxE9YG90J0DKDGHWrTxtkDBBxpCcgXVqV9oJlbTqjgnsx9JHvZuCQFHuLzecUz7ffadmRV3Fo9rkf0/egINov5dqVR97sYJNBWIo9vBnlX+1J5cv7jfae8c5P+qbj9Q2RBryFnl/v7J7Z3Z5ApphS1wOnQpr+hkX/d43cNK5n+XkWyUhytlIpUrnK/+AfLe6lolGReaNh2UmlAhOemp4DlHv0YP5Dn6WQjB6gX6VUGcwcIqRVhaz9oUW90e1Pz7/uAYCO8lY6iTIvUFkVCeN0O8AoOGrLKpTumfpVmtYeQvbD0xAOuHFUrVuFwF6g3CDV01Pf44mrGnbMC8Y20By7R5u6lMhXMXjHjKEzU1nTkThpiYQEtt6sg5zPVbroYOJCNAIVLT8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <648D9B474ECB9347B6FBCECB1C6D4574@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6027
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	011688c8-9dd4-443f-d1cf-08dc5d3c474c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hSwm+FASWf9Z5VMWWzIxEa5A9LRASwx9/3v2cSpFcJno7Sh88aQA6zYOagbSKu3Juh0iWCLJa4DS/lRzybU7hxThtzAUKG5iqztepnEQ/5/fixniCucI6OcDEDYXXU78JV3+zqDx4gijyTmb7L7AuCeseyQ+KDTT9RHHWkujxFaSYHUhQiqhX5tq9wfpqMieEG4YXLp/3iwRAqDM/2K2hhZsk+ccFr5rAqbvgqe8A0OaWl7iGzQYpVbmw9ZudBz5zHfir4dz34+xmyxbGdgEA599PHdzrWIeMlUuyv3a4Srq8SBvg/lDNn1NIKSZcuACEVZA9xU2464zPnkJfyIkSrIK83CfaTekGEoYORF3eh0OmQArIorouWSqkIfCGeV1YNZVJls3IRch7stQpAki2LjQVJD7qDixUC0NANreT0fkAmEnoaofeGxd+Ow8YU09V4BdPqeEKEibmYs1IxmCxjQ3w61UV+l5I9Ga6S3Ebg5iXK+ZPy1WnLEarf03OcoYwCIrx2YTOtpy2q5vFUlvH0uR3LhA26P1FXnyxnTLSa7DuYAtZu7Ox9+7ZjzzM0RsuR7ZO2Ko6Tbak/Ys8YxpDgdtZFBsxPlVjrObFXTe6hEvsSrr0e3Z8l1L6/1V7Fqak4m/V+6XnDKMcLc4W5dk+e30seNwlGxpjSk3zHBf03GeVhS1YkzO/WzMCMiZTmbBF2wvsxrqBtBHRDF3RjKaLbCvd/+YzLBfmL13gUIueKksWa0eCOBVt3rpterTpDN4
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 11:07:57.2392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e065eb-ce2b-4043-e6e0-08dc5d3c4e45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 11:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109955

T24gMTQgQXByIDIwMjQsIGF0IDEzOjU4LCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBUaGlzIGlzIGEgcmVxdWlyZW1lbnQgZm9yIGxpYmRpc3BsYXktaW5mbyBhbmQgZml4
ZXM6DQo+IFByb2dyYW0gZWRpZC1kZWNvZGUgZm91bmQ6IE5PDQoNClN1cmVseSB0aGF04oCZcyBh
IGJ1ZyBpbiB0aGUgbWVzb24uYnVpbGQ/ICBJdCBkb2VzbuKAmXQgd2FudCB0byBmaW5kIGEgbmF0
aXZlIGJpbmFyeS4NCg0KUm9zcw==

