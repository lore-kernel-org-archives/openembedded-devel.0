Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210BBC00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 10:32:41 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.85])
 by mx.groups.io with SMTP id smtpd.web08.40311.1660818759638858885
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 03:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=4CFeNt2q;
 spf=pass (domain: arm.com, ip: 40.107.1.85, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ddt2HQM6zoV9fjsicHDuHwAXOG8Ef4u3S5Fg8vkOfR6HXNm/X9uIb83O1pCQjGzJvocr2QgrT2RRffEZgwZKt2IHqhhR83LgTs5dVi4FOLR8YYZqyykT8O1MPLtQVinIkxwid/t1k3TlwD9jBAQbwjIhgqi8r+Qao1Q3Pi9IbooIG2lJHQNbvk7QYG4yqqdX08ekGUOHNOrvO6ugTpbODFJnE4SpzQuyQ/2NQ4cydgVo9pTJU1qdtKDQc61f9M6sMPYuJVRi7GlOh5gyQLa9oPc0AWr307KrB9ycje1/PvzylKaj/x3ZiYVfO90nlK4U0tJfNn3CELk2TpeBBx6qQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raVRmM3ZzpCae8tI25gRqHJtKhUBKQtuKIzauRVRVCE=;
 b=HpXLTeUgTJtTUnFmQyzZfPdek8rHGRPz4jFo4XQBoAh3EJDBXHNucAaGdl+pBOpilAtoq81hu1G5ACrHInKhfCEFpmzvnMB4xnnIXOmoMfzlV4mCTwOsENKUM2IHFkM61C0H1+U14LHdkoaRzPrP4e604faM47cSGcQv1lrZVYwNHDLz4yNcL+0hCyu6LEr12QFvcXfbg0lC0X0nUw0qGNxVbM3dPGOd4F3c1QaWt7bGvx1qFRseHQe/ExKTe0+kyg2CPcZ80XnQKucRtUHOnEY5VfhYeaK50+lNZWu9VJVOsEh1nxa1cGL1FaVRlGUG/gXRYSLPADFxLIm7PidO0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raVRmM3ZzpCae8tI25gRqHJtKhUBKQtuKIzauRVRVCE=;
 b=4CFeNt2qKHsUCg0M9jDyqDlO19KhL0bDqHd3n79kBfbV1YmOWP74JwR66CAt8Q/bCC+F4FSVwHl4eOhYQbVvLs3y+ltCme9+UDUBFwyKVmFfx6Rdfv4yq8Ykf8vDiEfVK+++CmST3iVnPBEGABWHxjAhaUGdWQXwscHQErC5bpo=
Received: from DU2PR04CA0160.eurprd04.prod.outlook.com (2603:10a6:10:2b0::15)
 by GV1PR08MB8644.eurprd08.prod.outlook.com (2603:10a6:150:85::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 18 Aug
 2022 10:32:34 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::ff) by DU2PR04CA0160.outlook.office365.com
 (2603:10a6:10:2b0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Thu, 18 Aug 2022 10:32:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 10:32:34 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 18 Aug 2022 10:32:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba49ea8a04bec2a5
X-CR-MTA-TID: 64aa7808
Received: from b97f8c580463.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A71BABEB-B0A0-4A1B-BACF-54D52CD45CD7.1;
	Thu, 18 Aug 2022 10:32:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b97f8c580463.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Aug 2022 10:32:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzbZ0pfj6XS6BaUTzd02XJ57A+en/dG1hPJscaHCbFBNpKqYlCM2p9MAb7ss9kU/ZG4cxGoruH2+cq7mm3rEDgyx3v+E+fsS2zYgBeFOjipe+q9GAzdQvG91AMmI+tPLVieejS8V3xD0fOKZgU9K7SS98axEUitLDcyVH9wBLWEKVc181P4R7y1OTBmuJPPAvC44DYRca+ogVQUoDwRYa2IDX0cJKdIyS19WYGxCY0xanHHL0RABa1yoc/UVRpnXB8nhfTJiq4c1zOromHatEw9FB+4RzYnaYkzxFpWffF0sJZzG13bc9JQt0wQ7YcdlMr3d9HWSM+NJC2vNbtO1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raVRmM3ZzpCae8tI25gRqHJtKhUBKQtuKIzauRVRVCE=;
 b=Me9TTFh5rzgajffcqv3pJEpNpJlELQbEvwIRDyIxrgtnbm66SWi2s73WpegMfespNAvg9OHHviX6C0VOZHtTxPo5DI8BEVWOS9TS/4Fin7ShfD+EFhS4wxvP2SNgOETUyU8kUx/hC6RTW+hO+UrTypZsmiVCO+BXTE3/9oCC0uJLOYRMbAvlBBGKMVRvHbXx753g52VEwwjopmlRE6VC64E268Uj33uvsPLFl4HFM/U5/S3TnIB+ImhP7eauSZRWUU1Z9O6w7Aw5rCCLGz0Armce+QjEplwmxcn1GRkG9htrVTffcawYtheNJbdL4YOOwRyaAkMnLq3BAKFx011HcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raVRmM3ZzpCae8tI25gRqHJtKhUBKQtuKIzauRVRVCE=;
 b=4CFeNt2qKHsUCg0M9jDyqDlO19KhL0bDqHd3n79kBfbV1YmOWP74JwR66CAt8Q/bCC+F4FSVwHl4eOhYQbVvLs3y+ltCme9+UDUBFwyKVmFfx6Rdfv4yq8Ykf8vDiEfVK+++CmST3iVnPBEGABWHxjAhaUGdWQXwscHQErC5bpo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7712.eurprd08.prod.outlook.com (2603:10a6:20b:513::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 10:32:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5d1d:a902:c842:14ba]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5d1d:a902:c842:14ba%6]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 10:32:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "bjohnson@blueridge.com" <bjohnson@blueridge.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Changing u-boot version in the build?
Thread-Topic: [oe] Changing u-boot version in the build?
Thread-Index: AQHYsnk+XAnR6Rx9q0O8xUteOXGBqq20aiGA
Date: Thu, 18 Aug 2022 10:32:25 +0000
Message-ID: <D9ECDD3E-40BB-4971-9B36-A114A06D0139@arm.com>
References: <fb208df3-7ee5-01be-5d2f-5d9657528764@blueridge.com>
In-Reply-To: <fb208df3-7ee5-01be-5d2f-5d9657528764@blueridge.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4d2f9364-6483-4381-2f72-08da8104f68d
x-ms-traffictypediagnostic: 
	AS4PR08MB7712:EE_|DBAEUR03FT049:EE_|GV1PR08MB8644:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EyI2Og6do0QtHX2kTf+6vGCl0FicWQgbcUtSuFeGSa35cYwGlZpZe9cIdv4OjqJRPDcXGwPFy0m++d9RxGMTppzFCNvsv+14iHl2eUx3v/pU1tKvNYWtgraqgZk8MOB7wfjQB2e4z54Xespcb1v5YRcK3hoK425Ubm+YPH+dfzxeLE5p5+8W09YbxqZrrFJu0CiLJ2HTci9aDHANZ0ulQ9cxUIIolJuf2RC1a1886oreKC/yz97zvM6S3eookvDHKFZrve8Lg7xhHU7jKmerEN5Q7/dTdi56/NigG9SZmIm9T0mgpA4Zc4ehB6tvAlKjY3r2S4aOmIYW5bQ3ICSnq3TpNCJy4KD+ZzWzl+QGAxEf3LUVHSTHM53CRd7RX7pD1MSQ6X05HMwqm+4Nj/teHwBXTKYOUpViS+l8A9ETfycC46FD1EYP+V+s2NNHs6GsHNxT/0o84dvnAOPzVYmXYtRX7ey4JVUmxDBK850+PJBhWnogExcEFHBCLzY8sqXLLFdQfbqsV1ildg6MACucdmD+vvbWqd/fimERB0iGQJNdyeL2qsHKoIYPx/oB27mtVqCUcL7tSriuGv9L2AoPI2O0KDnRkTWf8pJd1wirCWJZK82sGmSbrfOaWu8VGzvOuvwH1wKzhLErF7KI4nw/rjnjxys1IVbYRfwKdlKv1sM815da/0ldd1fOkWlw6879S6+gU22QrG2Pmza8JQXV7M0UNXWenCS5XBu0o71Gh7LOoNMeynu7vpGI2hygYCMOwGaR7CcXKHK7aS15FnUTIsuTAAb8OWkoyz5NNqqtoVY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(26005)(36756003)(6486002)(5660300002)(86362001)(6916009)(71200400001)(316002)(122000001)(8936002)(38070700005)(38100700002)(8676002)(91956017)(66446008)(64756008)(66476007)(4326008)(76116006)(66556008)(478600001)(186003)(6512007)(66946007)(41300700001)(2906002)(2616005)(33656002)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB8917CFFF79414B8964819BC89B1FFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7712
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6a69c277-0b5f-49af-9429-08da8104f18f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wNZT01j520FY1r8vAXAoZBQyAAGcMKAP7j0Kh1ZtBgnxzvGlbT2lcL7ZkSi6To5mbfn1UlG7xsgvKP/GW7Ei2VuhXbo9wldxuxccLEfBVTW6T43JOH+K8pGP2CiNmwVLwSN2KCM1Auo5EY+WNNURSO4yxnJVZ4Ig27ojNS/sxmv1Q31fyWgGwtT81oCFEoQQ+mbgBRjPp3C/5+7SkbVBRCQ0xwhfzL8MPPfMesZ1DTb/eCHUb+YBUwTkMMOwj4HR85ghbNKFpXIMgVli55frvv23o/uL0dvyNb4RE3AuKKYY9CIg5T/AxypF1NQ9thHc4jSoRWUWyXqIpyPvSBNdFqZUL3tJad/gK9AivQ9GC095jvxXVHIgMkWtQKFEKkojGXXwknhd84M8R2VasOitzWcePkrm69xs0tHWHvhdVvZSFurZ4VGzCZ8P+hWqjiAEhG9yzrvIzY6K8REwCTEiCkQwDWElyaOMZ4uiWeym9XYqoxfOhjhwAopfXPDh0XPRnC0ucW5PbFyCSwEBXwxefg3+aAH0M6An0/T8CBQCO72Xz97ZXbAuKs5XB7oBg6cY66EscUbstpZLpfXSffuV3710SqNrC3CsldyWRJTAkJRtS+vIQjwnGz6Y3VFQj/jJov2to3Ca3cRswg7/dl6OdeD2b0W4Nh72QeG2zVpYI1Qd1/J2OyD+6IuKsMp1j+sCmbZHMUuGCFZxkJX9sGpbaXvssR5rvOUlyvKb6+BxEpz3Pr4++0TjHRAtsQKXKe4guYt8fzhH3lpdUaz/wIrO5g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(36840700001)(40470700004)(46966006)(8936002)(70586007)(70206006)(81166007)(8676002)(4326008)(36860700001)(33656002)(86362001)(356005)(82740400003)(36756003)(316002)(26005)(6506007)(2616005)(5660300002)(478600001)(6512007)(41300700001)(6486002)(53546011)(40480700001)(40460700003)(6862004)(82310400005)(47076005)(2906002)(336012)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 10:32:34.2490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4d2f9364-6483-4381-2f72-08da8104f68d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8644
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Aug 2022 10:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98317

DQoNCj4gT24gMTcgQXVnIDIwMjIsIGF0IDIxOjM3LCBCcnVjZSBKb2huc29uIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxiam9obnNvbj1ibHVlcmlkZ2UuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gSSBhbSBzdHVtcGVkIGJ5IHRoZSBwcm9ibGVtIG9mIGhvdyB0
byBidWlsZCBhIG5ld2VyIHZlcnNpb24gb2YgdS1ib290IHRoYW4gdGhlIG9uZSBpbiBteSBvcGVu
ZW1iZWRkZWQtY29yZSB2ZXJzaW9uLiBUaGUgdmVyc2lvbiBzaGlwcGVkIGluIG91ciBjb3B5IG9m
IG9wZW5lbWJlZGRlZC1jb3JlIGlzIDFfMjAyMC4wMSwgYW5kIEknZCBsaWtlIHRvIGJ1aWxkIHNv
bWV0aGluZyBtb3JlIHJlY2VudC4gV2hhdGV2ZXIgSSBwdXQgaW4gZm9yIG15IFBSRUZFUlJFRF9W
RVJTSU9OIG90aGVyIHRoYW4gdGhhdCB2ZXJzaW9uIHJlc3VsdHMgaW4gYSBoYW5kZnVsIG9mIG5v
dGVzIHNheWluZyB0aGF0IHRoZSBwcmVmZXJyZWQgdmVyc2lvbiBpc24ndCBhdmFpbGFibGU6DQo+
IA0KPj4gJCBiaXRiYWtlIHUtYm9vdA0KPj4gUGFyc2luZyByZWNpcGVzOiAxMDAlIHwjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI3wgVGltZTogMDowMDoxMA0KPj4gUGFy
c2luZyBvZiAyMjk4IC5iYiBmaWxlcyBjb21wbGV0ZSAoMCBjYWNoZWQsIDIyOTggcGFyc2VkKS4g
MzQwOSB0YXJnZXRzLCAzNDggc2tpcHBlZCwgMCBtYXNrZWQsIDAgZXJyb3JzLg0KPj4gTk9URTog
cHJlZmVycmVkIHZlcnNpb24gMToyMDIyLjA0IG9mIHUtYm9vdCBub3QgYXZhaWxhYmxlIChmb3Ig
aXRlbSB1LWJvb3QpDQo+PiBOT1RFOiB2ZXJzaW9ucyBvZiB1LWJvb3QgYXZhaWxhYmxlOiAxOjIw
MjAuMDENCj4+IE5PVEU6IFJlc29sdmluZyBhbnkgbWlzc2luZyB0YXNrIHF1ZXVlIGRlcGVuZGVu
Y2llcw0KPj4gTk9URTogcHJlZmVycmVkIHZlcnNpb24gMToyMDIyLjA0IG9mIHUtYm9vdCBub3Qg
YXZhaWxhYmxlIChmb3IgaXRlbSB1LWJvb3QtZGV2KQ0KPj4gTk9URTogdmVyc2lvbnMgb2YgdS1i
b290IGF2YWlsYWJsZTogMToyMDIwLjAxDQo+PiBOT1RFOiBwcmVmZXJyZWQgdmVyc2lvbiAxOjIw
MjIuMDQgb2YgdS1ib290IG5vdCBhdmFpbGFibGUgKGZvciBpdGVtIHUtYm9vdC1lbnYpDQo+PiBO
T1RFOiB2ZXJzaW9ucyBvZiB1LWJvb3QgYXZhaWxhYmxlOiAxOjIwMjAuMDENCj4+IE5PVEU6IHBy
ZWZlcnJlZCB2ZXJzaW9uIDE6MjAyMi4wNCBvZiB1LWJvb3Qgbm90IGF2YWlsYWJsZSAoZm9yIGl0
ZW0gdS1ib290KQ0KPj4gTk9URTogdmVyc2lvbnMgb2YgdS1ib290IGF2YWlsYWJsZTogMToyMDIw
LjAxDQo+IEkndmUgdHJpZWQgdmFyaW91cyBzcGVsbGluZ3Mgb2YgdGhlIFBSRUZFUlJFRF9WRVJT
SU9OIHN0cmluZzogMToyMDIyLjA0LCAxXzIwMjIuMDQsIHYyMDIyLjA0ICh0aGUgYWN0dWFsIHRh
ZyBpbiB0aGUgdS1ib290IHJlcG9zaXRvcnkpLCAgMjAxMS4wNA0KPiANCj4gTXkgbWV0YS1vcGVu
ZW1iZWRkZWQtdmVyc2lvbiBpcyBmcm9tIHRoZSBkdW5mZWxsIGJyYW5jaCwgaGFzaCBhNjJhZDc3
OSAoaWYgSSdtIGxvb2tpbmcgYXQgdGhlIHJpZ2h0IHRoaW5nKS4NCj4gDQo+IEkgZGlkIGEgc2lt
aWxhciB0aGluZyB3aXRoIE1vZGVtTWFuYWdlciBub3QgbG9uZyBhZ28gYW5kIGRpZG4ndCBoYXZl
IGEgcmVhbCBwcm9ibGVtLCBhbmQgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQncyBzbyBkaWZmZXJl
bnQgYWJvdXQgdS1ib290LiBUaGFua3MgaW4gYWR2YW5jZSBmb3IgYW55IHN1Z2dlc3Rpb25zLg0K
DQpUaGUgc2Vjb25kIE5PVEUgc2F5cyB0aGF0IGl0IGNhbiBvbmx5IGZpbmQgMjAyMC4wMSwgYW5k
IG5vIG90aGVyIHZlcnNpb25zLCBzbyB5b3VyIGVpdGhlciBtaXNzaW5nIGEgbGF5ZXIgaW4gYmJs
YXllcnMuY29uZiBvciB0aGUgcmVjaXBlIHlvdSB0aGluayBwcm92aWRlcyB1Ym9vdCAyMDIwLjA0
IGRvZXNu4oCZdCBhY3R1YWxseS4NCg0KVGhlIGZpcnN0IHRoaW5nIHRvIHRyeSBpcyBiaXRiYWtl
LWxheWVycyBzaG93LW92ZXJsYXllZC4gIEZvciBtZSBpdCBpbmNsdWRlcyB0aGUgZm9sbG93aW5n
IG91dHB1dDoNCg0KdS1ib290Og0KICBtZXRhICAgICAgICAgICAgICAgICAxOjIwMjIuMDcNCiAg
bWV0YS1hcm0tYnNwICAgICAgICAgMToyMDIyLjA0DQoNCg0KSWYgeW91IGRvbuKAmXQgc2VlIHRo
ZSB2ZXJzaW9uIGFuZCBsYXllciB5b3UgZXhwZWN0LCB0aGVuIHRoZSBwcm9ibGVtIGlzIHdpdGgg
eW91ciBsYXllciBjb25maWd1cmF0aW9uLCBvciB0aGUgcmVjaXBlIGl0c2VsZi4NCg0KUm9zcw==

