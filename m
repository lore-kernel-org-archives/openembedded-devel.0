Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF925C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 08:28:13 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.80])
 by mx.groups.io with SMTP id smtpd.web09.3812.1650961686505199848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=d8secVPm;
 spf=pass (domain: arm.com, ip: 40.107.104.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MuNgdpFGqW/2G8KZol42S0Z8jqAaBI0HwH3lSUkca6wGiTeydXoNqGfsDLNtBJ2OF9W5PaBbcU4gm3Bd3/HiZUvNChTM5zmmiSLugf6AjEoWl9Cbh+mdzdUDXENGw5FqyMtpIv0e8rX8+GOMp1VvkSZy9TqbWvjnv3m3fR2zOiGjUutyj7/Iu5aIfjwS4vtfNPpasImZwAJwi9rizcnko2SQ4Iuxz4g7Sb49hqZg7pJ3QqP2mCc0JdsDchPAIHZ9WntD6nGEA8+wVuKt/2NyhHOgzklx++FcT1SC8Vxin7KH6cOqUUCq9FyYWJWRlFD79RYBULDkki/S784sH0kNFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKVW8XurymRAEulkoSaB29O2DsAIFOp20we8KY0utBI=;
 b=ZvUlv99BPS0a8AxcXoHBhk+mcVW4Yn3/305PYkMp5dLmE+N1v9vdl5W329rC1diHUNRnDlaYtA4XmNS3X4d1pvgo+VmGgmXBsBfCMTd60OTXDt43VtK5H/OOgRwByZVD7um0h00Ytks3mJl95h98K1UGPhl9upjgDzmVV8e66zJmApi40j6DZODGHVi69HJwUO+kc3jkG3CEp91mHaQkc4LeN6SssaECxcL3H2x+8MRkoEF5T5Xjq25Fy1rPj/4PJ1dT0s8Nh16jSov38moQY1UVBrayYl7H92IDGO+0H6h7BtJ7d8Wogt7mN0Tw2pvXttTV28/8A/JF6LOjfbzfAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKVW8XurymRAEulkoSaB29O2DsAIFOp20we8KY0utBI=;
 b=d8secVPmD30u4LnQ6HrpHX5mA1PwIAPuIuPCjITYHNqQJAAW7QYFnRdnHwwrELhE6JTaphYuFE2NeHas2XHXXb2sqTj++j55iZ+vzwLMN2KXHy7X0QlSAgWZMKl+BiL2zIBGrMkiFCT8qY5CGMcacyR02cllu1XYVZO5RrMJR7c=
Received: from AM6P195CA0059.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::36)
 by PR3PR08MB5770.eurprd08.prod.outlook.com (2603:10a6:102:87::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 08:28:02 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::7b) by AM6P195CA0059.outlook.office365.com
 (2603:10a6:209:87::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Tue, 26 Apr 2022 08:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 08:28:02 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Tue, 26 Apr 2022 08:28:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11085dbbcd0413f5
X-CR-MTA-TID: 64aa7808
Received: from f5bd9fdf16f6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B789EBD3-CE1D-47F6-A1F3-6A4885F1C7BA.1;
	Tue, 26 Apr 2022 08:27:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f5bd9fdf16f6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Apr 2022 08:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VApIUobJAmA4PBH0jiyT6kxzl+c3RRfkziZ1PxtxntMEqDOCtCfmqHrd2DWHU1+o7nly3OPV6TVtL0Feb7EhFYAO/eQxLiMN5Ny4GVzxP8tKCOyNNRAd2HAkAaHfwgWFcpB8DP3QxB6QEL0ChXZBY90NHQ9fZZvS+rDW1hCIeV88Ai1bNRCJLuxnPe9NEVfFhh71g+T7RQwQP9aOICvgOUgyLKUoZ2Ml1OWQ4Vs/z/WjavFyXtXHr2hISdzitsIscinuKJd8aPJxPLdVs8rVl1bEebp6s01gKv5FjAs1XPjlF8RWrZp4k+BveS9lDuIbfy8qlgFr6/v25dFc1RRvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKVW8XurymRAEulkoSaB29O2DsAIFOp20we8KY0utBI=;
 b=iQYSPV7vchmsk7b3I/5XKuhy9PvCBlWnhPg4sFymSGErREJj13a5TywH3FB51QYUT0/tX0lctDUeHasuaIE1xSKrfLPSoRklpirop3r72w/gLJMz1gXNjhbKpAUlkGYnZJt63hOu0SeDTCrXhk87wnejllCFT0qnP5x/hzD99Y/+Rrp9INUztxZZJwEOXe37XIB+vy2aRmM/9+tlIV1uE1WOw0IP6IuU280wutzi9E6/uHt7r2u07WdC1uIbiA89WikvdQwMPFcFTkWZ/Y95YlV5A1nItHC5KsYnZp6vTUa1C0xgadi6WLrwWE46y97sqQziFxo+6jFcySQue9skwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKVW8XurymRAEulkoSaB29O2DsAIFOp20we8KY0utBI=;
 b=d8secVPmD30u4LnQ6HrpHX5mA1PwIAPuIuPCjITYHNqQJAAW7QYFnRdnHwwrELhE6JTaphYuFE2NeHas2XHXXb2sqTj++j55iZ+vzwLMN2KXHy7X0QlSAgWZMKl+BiL2zIBGrMkiFCT8qY5CGMcacyR02cllu1XYVZO5RrMJR7c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM6PR08MB4615.eurprd08.prod.outlook.com (2603:10a6:20b:90::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 08:27:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:27:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@windriver.com" <hongxu.jia@windriver.com>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH V2] cdrkit: add new option
 -eltorito-platform for genimageiso
Thread-Topic: [oe] [meta-oe][PATCH V2] cdrkit: add new option
 -eltorito-platform for genimageiso
Thread-Index: AQHYWUEy5swNNBSd50Cmjd8x36YIY60B28mR
Date: Tue, 26 Apr 2022 08:27:52 +0000
Message-ID: 
 <PA4PR08MB7411247A4FC9C44AD8947FA0E8FB9@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: 
 <CAMKF1soPGSypVZQav130t6HDdpobvomzf2XLQcVpKy2o6ZJDmw@mail.gmail.com>
 <20220426074207.451383-1-hongxu.jia@windriver.com>
In-Reply-To: <20220426074207.451383-1-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9151d078-2bf1-4215-952c-08da275eade5
x-ms-traffictypediagnostic: 
	AM6PR08MB4615:EE_|VE1EUR03FT049:EE_|PR3PR08MB5770:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB57703B4FEC6182BCF5ABAB88E8FB9@PR3PR08MB5770.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Mwvv0YgEXo8g09ASgHOCnD0hXTEYGpHKOTGPQbGALVd+CN2h67qpia0EF2PwXomY5ZzMumxBoYa/W4v9WDAa6PsOXPgHB5D/dgLMdRCsA7q/nQ4YQR50fbJfa/oAkA7CsD+Zv+31ttOp1RiWgyiDedP6RVVajOykh1menSDfEkveG6MW6Wtwv8596E9TEmG+/gJljXSyri1A1cZ1PeYRZBh8TWJqSbb0S4p44FUym4NczS0Z/rEY9FHEMP9Ed8l/UlBVbTpKK5T1pB14djau0FD5vOyJC6Zk1xCHLnSaoLILq2ym1r4HkSqAqF/gjKe8zGQN3cFduR1hU3i5rmuenoWg6PnHgBe4YJQLXC7+BKXqbhApn39arzy49DBAwo7Lk6iFE2pFmLQ7luu6HEAMk+NraedZ8r5rSYs6v0HwfRqh5qBdJzGcXyhihb7iNNwWWdQ56EHbgtXYJyEZKCcbOn7F1WwTAWQ0wRcLkwQIKoYhCk6r7FjBm1WVitQrj396Nzyj7qW0p1m/k7XI0u9OmZQstk2mUbkWWPdZ38EhjkIzG7FC8Nzhx8sFtbDxCxjNz1QXQqo55YoERRUDW2wVohayJZaJ7kGvsGaJ+yEcXzvu0FRBUSUQLozpBeeTAzlJ16t+QTxzdzHOVnljSMuS2AxG0WS8ooxTCjldC+IrQt5l9amuaqR4z6fiRGK2Cmfdzc9gx/RR4J5mTSpsNymSsheCY/ROMpq38cRMdvOIDaPikY2XG4VTAvumlqwy8JaFg4kRrVHVD0TuIgaQYgqHjQ9wH4YNph5biY7qsl5hUVuSBpAYgCT0lRy/fwKAQvUgTYbPtQhD28jqfWP3vBn/hQbNvsyZxdWIWW834YiActo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(166002)(2906002)(64756008)(122000001)(38070700005)(55016003)(38100700002)(71200400001)(52536014)(966005)(33656002)(110136005)(8936002)(8676002)(4326008)(66446008)(66476007)(30864003)(76116006)(66556008)(91956017)(316002)(186003)(86362001)(7696005)(6506007)(26005)(83380400001)(9686003)(508600001)(5660300002)(21314003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411247A4FC9C44AD8947FA0E8FB9PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4615
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	73396344-9df4-4b2f-a617-08da275ea80c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jMKOE6XSBa5zYTMGxDKHCI3fIp5LA5ldkT9QvKpPSOoc3GNtjYNBSNMW1dSsqCyb8ECVRLSmHOzcb9JxjlA6iVI32vx98iZl0gd7kF5L3u8IT9Jn6HHvFXyyx62XKH1EdWMKUVuYK3YoP3OH5RuT9Hv6AvVmlcYDHh7YwtApPUtN2yO5S9Er7DIZuJB9UGZHZ9Kk4sZOqR34K1hKbEfhogGa93sa/LkLGQMH5utBjQM10SBxjV1T0dicpHFVd41QY5xh3JhiwfndGHDToBbzJ+kMK2N9PdpF/MoKbcxioMKDnjAKQVx66aHf8QMdgApmCjQt35TPCc9EgQuf1sjUCq0RJEPg1+MSMPGsY5dxOJBb18VCz+vzN07Njgqtkz8cU2UBt235BzyRMBRWwE5R+XCH4sdv/i4UCBRxRO7+YL8DTCUvUyCyeEWlk66g9ebNVzx/EODJThatiYhgMyth+ywGwMCMP3lxpwwm37mb/i2jP6Hzv+q5vQnltZSwEb9AM1yGSvK3CD+o3RaFFhQlqmTAjiFLEC0SfXni3JFaW1fcQ13z1Rohy1PFqMXJSKAsYx5Sm4VGPt/H0hiYMflVkQqYyxgn1meuQaxgLgBeAJIKUaIjc2C26Mq90CIx8IK5AiPfsuIWM28+b2P1yxPe2xV0n8OM69QwyS2PlURFgIiquz9HLk2tuqIVcooR8KPPWrPVbC55PdY16EJwhl8V3JRM8SQ0K2edXnTDB0ZIaCuuAwynVGwhvfB0fg7FajHuPwmule7pnOjz/1cR4X5lwfXOCjS8EW6WO37SkckDJDyYQFmq4jrNTHvw8pMYi1/e0bvzZq2+i3/fPfFUAwu67Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(47076005)(83380400001)(508600001)(110136005)(86362001)(6506007)(336012)(7696005)(5660300002)(52536014)(8936002)(2906002)(30864003)(55016003)(33656002)(356005)(81166007)(26005)(4326008)(70206006)(9686003)(8676002)(70586007)(166002)(36860700001)(40460700003)(316002)(966005)(82310400005)(21314003)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:28:02.2853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9151d078-2bf1-4215-952c-08da275eade5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5770
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 08:28:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96795

--_000_PA4PR08MB7411247A4FC9C44AD8947FA0E8FB9PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Have you carefully examined the license of the files that you=92re copying =
from mkisofs: the cdrkit fork exists specifically because cdrtools relicens=
ed to CDDL[1] which is GPL-incompatible.

Also, are we going to be carrying this forever, or is upstream cdrkit going=
 to merge the same code?

Ross
[1] https://lwn.net/Articles/195167/

From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of hongxu via lists.openembedded.org <hongxu.jia=
=3Dwindriver.com@lists.openembedded.org>
Date: Tuesday, 26 April 2022 at 08:42
To: raj.khem@gmail.com <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [meta-oe][PATCH V2] cdrkit: add new option -eltorito-platform=
 for genimageiso
Mkisofs/genimageiso now correctly supports El Torito multi boot entries by
introducing a Boot Dection Header before a list of alternate boot entries.

New option -eltorito-platform allows to set the El Torito platform id
for a boot entry or for a list of boot entries. Supported values for
the parameter are:
-   x86 the standard value vor x86 based PCs
-   PPC the Power PC platform
-   Mac The Apple Mac platform
-   efi EFI based boot for PCs
-   #   an arbitrary numerical value

Port implement from cdrtools:
https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515dbfca696=
8ca2296fd7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../cdrkit/cdrkit_1.1.11.bb                   |   1 +
 ...001-add-new-option-eltorito-platform.patch | 335 ++++++++++++++++++
 2 files changed, 336 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-op=
tion-eltorito-platform.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/r=
ecipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index dd0405c95..757f99d1f 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.=
orig.tar.gz \
            file://0001-define-__THROW-to-avoid-build-issue-with-musl.patch=
<file:///0001-define-__THROW-to-avoid-build-issue-with-musl.patch> \
            file://0002-Do-not-use-rcmd-on-build-with-musl.patch<file:///00=
02-Do-not-use-rcmd-on-build-with-musl.patch> \
            file://0001-genisoimage-Add-missing-extern-definition.patch<fil=
e:///0001-genisoimage-Add-missing-extern-definition.patch> \
+           file://0001-add-new-option-eltorito-platform.patch<file:///0001=
-add-new-option-eltorito-platform.patch> \
            "
 SRC_URI:append:class-nativesdk =3D " \
            file://0001-install-netscsid-to-bin-for-nativesdk.patch<file://=
/0001-install-netscsid-to-bin-for-nativesdk.patch> \
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-el=
torito-platform.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-ne=
w-option-eltorito-platform.patch
new file mode 100644
index 000000000..dac3328a4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-eltorito-=
platform.patch
@@ -0,0 +1,335 @@
+From 5a2d571f3687910260c45841725f2deb84c8f12e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 25 Apr 2022 18:18:00 +0800
+Subject: [PATCH] add new option -eltorito-platform
+
+Mkisofs now correctly supports El Torito multi boot entries by introducing
+a Boot Dection Header before a list of alternate boot entries.
+
+New option -eltorito-platform allows to set the El Torito platform id
+for a boot entry or for a list of boot entries. Supported values for
+the parameter are:
+-   x86 the standard value vor x86 based PCs
+-   PPC the Power PC platform
+-   Mac The Apple Mac platform
+-   efi EFI based boot for PCs
+-   #   an arbitrary numerical value
+
+Upstream-Status: Inappropriate [port from cdrtools]
+https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515dbfca69=
68ca2296fd7
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ genisoimage/eltorito.c    | 73 +++++++++++++++++++++++++++++++++++++--
+ genisoimage/genisoimage.c | 47 +++++++++++++++++++++++++
+ genisoimage/genisoimage.h |  8 +++++
+ genisoimage/iso9660.h     | 33 ++++++++++++++++--
+ 4 files changed, 157 insertions(+), 4 deletions(-)
+
+diff --git a/genisoimage/eltorito.c b/genisoimage/eltorito.c
+index d52e17e..a804988 100644
+--- a/genisoimage/eltorito.c
++++ b/genisoimage/eltorito.c
+@@ -56,6 +56,7 @@ static unsigned int bcat_de_flags;
+ void  init_boot_catalog(const char *path);
+ void  insert_boot_cat(void);
+ static        void    get_torito_desc(struct eltorito_boot_descriptor *bo=
ot_desc);
++static        void    fill_boot_shdr(struct eltorito_sectionheader_entry =
*boot_shdr_entry, int arch);
+ static        void    fill_boot_desc(struct eltorito_defaultboot_entry *b=
oot_desc_entry,
+                                                                          =
      struct eltorito_boot_entry_info *boot_entry);
+ void  get_boot_entry(void);
+@@ -282,7 +283,14 @@ get_torito_desc(struct eltorito_boot_descriptor *boot=
_desc)
+        struct directory_entry  *de2;   /* Boot catalog */
+        int                     i;
+        int                     offset;
++      int                     arch =3D 0;
++      int                     nentries =3D 0;
+        struct eltorito_defaultboot_entry boot_desc_record;
++      struct eltorito_sectionheader_entry boot_shdr_record;
++#ifdef __needed__
++      struct eltorito_section_entry boot_section_record;
++#endif
++      struct eltorito_sectionheader_entry *last_section_header =3D 0;
+
+        memset(boot_desc, 0, sizeof (*boot_desc));
+        boot_desc->type[0] =3D 0;
+@@ -311,13 +319,22 @@ get_torito_desc(struct eltorito_boot_descriptor *boo=
t_desc)
+        set_731(boot_desc->bootcat_ptr,
+                (unsigned int) get_733(de2->isorec.extent));
+
++      /*
++       * If the platform id for the first (default) boot entry has not be=
en
++       * explicitly set, we default to EL_TORITO_ARCH_x86
++       */
++      if ((first_boot_entry->type & ELTORITO_BOOT_ID) =3D=3D 0) {
++              first_boot_entry->boot_platform =3D EL_TORITO_ARCH_x86;
++      }
++      arch =3D first_boot_entry->boot_platform;
++
+        /*
+         * we have the boot image, so write boot catalog information
+         * Next we write out the primary descriptor for the disc
+         */
+        memset(&valid_desc, 0, sizeof (valid_desc));
+        valid_desc.headerid[0] =3D 1;
+-      valid_desc.arch[0] =3D EL_TORITO_ARCH_x86;
++      valid_desc.arch[0] =3D arch;  /* Platform id for the default boot *=
/
+
+        /*
+         * we'll shove start of publisher id into id field,
+@@ -351,8 +368,17 @@ get_torito_desc(struct eltorito_boot_descriptor *boot=
_desc)
+                current_boot_entry !=3D NULL;
+                current_boot_entry =3D current_boot_entry->next,
+                offset +=3D sizeof (boot_desc_record)) {
++              int newarch =3D arch;
+
+-              if (offset >=3D SECTOR_SIZE) {
++              if (current_boot_entry->type & ELTORITO_BOOT_ID)
++                      newarch =3D current_boot_entry->boot_platform;
++              else
++                      current_boot_entry->boot_platform =3D arch;
++
++              /*
++               * El Torito has no such limitation but we currently have..=
.
++               */
++              if (offset >=3D (SECTOR_SIZE - sizeof (boot_desc_record))) =
{
+ #ifdef        USE_LIBSCHILY
+                        comerrno(EX_BAD,
+                        "Too many El Torito boot entries\n");
+@@ -362,12 +388,53 @@ get_torito_desc(struct eltorito_boot_descriptor *boo=
t_desc)
+                        exit(1);
+ #endif
+                }
++
++              if (current_boot_entry =3D=3D first_boot_entry) {
++                      ;
++                      /* EMPTY */
++              } else if ((current_boot_entry =3D=3D first_boot_entry->nex=
t) ||
++                          (arch !=3D newarch) ||
++                          (current_boot_entry->type & ELTORITO_SECTION_HE=
ADER)) {
++                      if (last_section_header)
++                              set_721(&last_section_header->entry_count, =
nentries);
++                      nentries =3D 1;
++                      last_section_header =3D (struct eltorito_sectionhea=
der_entry *)
++                                                      (de2->table + offse=
t);
++                      fill_boot_shdr(&boot_shdr_record, newarch);
++                      memcpy(de2->table + offset, &boot_shdr_record,
++                                              sizeof (boot_shdr_record));
++                      offset +=3D sizeof (boot_desc_record);
++              } else {
++                      nentries++; /* Add entry to this section header */
++              }
++              /*
++               * This works because a section entry has the same essentia=
l
++               * layout as a default entry (and we do not populate the
++               * selection criteria fields).
++               */
++
+                fill_boot_desc(&boot_desc_record, current_boot_entry);
+                memcpy(de2->table + offset, &boot_desc_record,
+                                        sizeof (boot_desc_record));
+        }
++
++      if (last_section_header) {
++              set_721(&last_section_header->entry_count, nentries);
++              last_section_header->header_id[0] =3D EL_TORITO_SHDR_ID_LAS=
T_SHDR;
++      }
++
+ }/* get_torito_desc(... */
+
++static void
++fill_boot_shdr(boot_shdr_entry, arch)
++      struct eltorito_sectionheader_entry *boot_shdr_entry;
++      int                 arch;
++{
++      memset(boot_shdr_entry, 0, sizeof(struct eltorito_sectionheader_ent=
ry));
++      boot_shdr_entry->header_id[0] =3D EL_TORITO_SHDR_ID_SHDR;
++      boot_shdr_entry->platform_id[0] =3D arch;
++}
++
+ static void
+ fill_boot_desc(struct eltorito_defaultboot_entry *boot_desc_entry,
+                                        struct eltorito_boot_entry_info *b=
oot_entry)
+@@ -678,7 +745,9 @@ get_boot_entry()
+        if (!first_boot_entry) {
+                first_boot_entry =3D current_boot_entry;
+                last_boot_entry =3D current_boot_entry;
++              current_boot_entry->boot_platform =3D EL_TORITO_ARCH_x86;
+        } else {
++              current_boot_entry->boot_platform =3D last_boot_entry->boot=
_platform;
+                last_boot_entry->next =3D current_boot_entry;
+                last_boot_entry =3D current_boot_entry;
+        }
+diff --git a/genisoimage/genisoimage.c b/genisoimage/genisoimage.c
+index 9089081..84ac3c2 100644
+--- a/genisoimage/genisoimage.c
++++ b/genisoimage/genisoimage.c
+@@ -271,6 +271,8 @@ struct rcopts {
+        char            **variable;
+ };
+
++static int get_boot_platid(char *opt_arg);
++
+ struct rcopts rcopt[] =3D {
+        {"PREP", &preparer},
+        {"PUBL", &publisher},
+@@ -404,6 +406,7 @@ struct ld_option {
+
+ #define       OPTION_ALLOW_LEADING_DOTS       1070
+ #define       OPTION_PUBLISHER                1071
++#define       OPTION_PLATFORM                 1072
+
+ #ifdef                JIGDO_TEMPLATE
+ #define       OPTION_JTT_OUTPUT               1101
+@@ -528,6 +531,8 @@ static const struct ld_option ld_options[] =3D
+        'b', "FILE", "Set El Torito boot image name", ONE_DASH},
+        {{"eltorito-alt-boot", no_argument, NULL, OPTION_ALT_BOOT},
+        '\0', NULL, "Start specifying alternative El Torito boot parameter=
s", ONE_DASH},
++      {{"eltorito-platform", required_argument, NULL, OPTION_PLATFORM},
++      '\0', "ID", "Set El Torito platform id for the next boot entry", ON=
E_DASH},
+        {{"sparc-boot", required_argument, NULL, 'B'},
+        'B', "FILES", "Set sparc boot image names", ONE_DASH},
+        {{"sunx86-boot", required_argument, NULL, OPTION_SUNX86BOOT},
+@@ -1558,6 +1563,9 @@ int main(int argc, char *argv[])
+                         */
+                        new_boot_entry();
+                        break;
++              case OPTION_PLATFORM:
++                      get_boot_platid(optarg);
++                      break;
+                case OPTION_BOOTALPHA:
+                        use_alphaboot++;
+                        /* list of pathnames of boot images */
+@@ -3829,3 +3837,42 @@ e_malloc(size_t size)
+      memset(pt, 0, size);
+        return (pt);
+ }
++
++static int
++get_boot_platid(char *opt_arg)
++{
++      long    val;
++      char    *ptr;
++
++      use_eltorito++;
++      if (streql(opt_arg, "x86")) {
++              val =3D EL_TORITO_ARCH_x86;
++      } else if (streql(opt_arg, "PPC")) {
++              val =3D EL_TORITO_ARCH_PPC;
++      } else if (streql(opt_arg, "Mac")) {
++              val =3D EL_TORITO_ARCH_PPC;
++      } else if (streql(opt_arg, "efi")) {
++              val =3D EL_TORITO_ARCH_EFI;
++      } else {
++              val =3D strtol(opt_arg, &ptr, 0);
++              if (*ptr || val < 0 || val >=3D 0x100) {
++                      comerrno(EX_BAD, "Bad boot system ID.\n");
++              }
++      }
++
++      /*
++       * If there is already a boot entry and the boot file name has been=
 set
++       * for this boot entry and the new platform id differs from the
++       * previous value, we start a new boot section.
++       */
++      if (current_boot_entry &&
++          current_boot_entry->boot_image !=3D NULL &&
++          current_boot_entry->boot_platform !=3D val) {
++          new_boot_entry();
++      }
++      get_boot_entry();
++      current_boot_entry->type |=3D ELTORITO_BOOT_ID;
++      current_boot_entry->boot_platform =3D val;
++      return (1);
++}
++
+diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h
+index 82c859b..1170d89 100644
+--- a/genisoimage/genisoimage.h
++++ b/genisoimage/genisoimage.h
+@@ -299,6 +299,14 @@ struct eltorito_boot_entry_info {
+        int             boot_info_table;
+        int             load_size;
+        int             load_addr;
++
++#define       ELTORITO_BOOT_ID    1
++#define       ELTORITO_SECTION_HEADER 2
++      int     type;
++      /*
++       * Valid if (type & ELTORITO_BOOT_ID) !=3D 0
++       */
++      int     boot_platform;
+ };
+
+ extern int    goof;
+diff --git a/genisoimage/iso9660.h b/genisoimage/iso9660.h
+index c74c2a9..61b6fc0 100644
+--- a/genisoimage/iso9660.h
++++ b/genisoimage/iso9660.h
+@@ -62,6 +62,7 @@ struct iso_volume_descriptor {
+ #define       EL_TORITO_ARCH_x86      0
+ #define       EL_TORITO_ARCH_PPC      1
+ #define       EL_TORITO_ARCH_MAC      2
++#define       EL_TORITO_ARCH_EFI      0xEF
+
+ #define       EL_TORITO_BOOTABLE      0x88
+ #define       EL_TORITO_NOT_BOOTABLE  0
+@@ -159,10 +160,15 @@ struct eltorito_boot_descriptor {
+ };
+
+ /* Validation entry for El Torito */
++/*
++ * headerid must be 1
++ * id is the manufacturer ID
++ * cksum to make the sum of all shorts in this record 0
++ */
+ struct eltorito_validation_entry {
+        char headerid                   [ISODCL(1,    1)]; /* 711 */
+        char arch                       [ISODCL(2,    2)];
+-      char pad1                       [ISODCL(3,    4)]; /* 711 */
++      char pad1                       [ISODCL(3,    4)]; /* 721 */
+        char id                         [ISODCL(5,   28)]; /* CD devel/man=
*/
+        char cksum                      [ISODCL(29,  30)];
+        char key1                       [ISODCL(31,  31)];
+@@ -173,7 +179,7 @@ struct eltorito_validation_entry {
+ struct eltorito_defaultboot_entry {
+        char boot_id                    [ISODCL(1,    1)]; /* 711 */
+        char boot_media                 [ISODCL(2,    2)];
+-      char loadseg                    [ISODCL(3,    4)]; /* 711 */
++      char loadseg                    [ISODCL(3,    4)]; /* 721 */
+        char sys_type                   [ISODCL(5,    5)];
+        char pad1                       [ISODCL(6,    6)];
+        char nsect                      [ISODCL(7,    8)];
+@@ -181,6 +187,29 @@ struct eltorito_defaultboot_entry {
+        char pad2                       [ISODCL(13,  32)];
+ };
+
++/* El Torito section header entry in boot catalog */
++struct eltorito_sectionheader_entry {
++#define    EL_TORITO_SHDR_ID_SHDR      0x90
++#define    EL_TORITO_SHDR_ID_LAST_SHDR 0x91
++      char header_id          [ISODCL(1,    1)]; /* 711 */
++      char platform_id        [ISODCL(2,    2)];
++      char entry_count        [ISODCL(3,    4)]; /* 721 */
++      char id             [ISODCL(5,   32)];
++};
++
++/* El Torito section entry in boot catalog */
++struct eltorito_section_entry {
++      char boot_id            [ISODCL(1,    1)]; /* 711 */
++      char boot_media         [ISODCL(2,    2)];
++      char loadseg            [ISODCL(3,    4)]; /* 721 */
++      char sys_type           [ISODCL(5,    5)];
++      char pad1           [ISODCL(6,    6)];
++      char nsect          [ISODCL(7,    8)];
++      char bootoff            [ISODCL(9,   12)];
++      char sel_criteria       [ISODCL(13,  13)];
++      char vendor_sel_criteria    [ISODCL(14,  32)];
++};
++
+ /*
+  * XXX JS: The next two structures have odd lengths!
+  * Some compilers (e.g. on Sun3/mc68020) padd the structures to even leng=
th.
+--
+2.27.0
+
--
2.27.0
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_PA4PR08MB7411247A4FC9C44AD8947FA0E8FB9PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Have you carefully examined the license of the files that you=92re =
copying from mkisofs: the cdrkit fork exists specifically because cdrtools =
relicensed to CDDL[1] which is GPL-incompatible.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Also, are we going to be carrying this forever, or is upstream cdrk=
it going to merge the same code?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">[1] https://lwn.net/Articles/195167/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">openembedded-devel@=
lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on=
 behalf of hongxu via lists.openembedded.org &lt;hongxu.jia=3Dwindriver.com=
@lists.openembedded.org&gt;<br>
<b>Date: </b>Tuesday, 26 April 2022 at 08:42<br>
<b>To: </b>raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br>
<b>Cc: </b>openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject: </b>[oe] [meta-oe][PATCH V2] cdrkit: add new option -eltorito-p=
latform for genimageiso<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">Mkisofs/genimageiso now correctly supports El Torito multi boot=
 entries by<br>
introducing a Boot Dection Header before a list of alternate boot entries.<=
br>
<br>
New option -eltorito-platform allows to set the El Torito platform id<br>
for a boot entry or for a list of boot entries. Supported values for<br>
the parameter are:<br>
-&nbsp;&nbsp; x86 the standard value vor x86 based PCs<br>
-&nbsp;&nbsp; PPC the Power PC platform<br>
-&nbsp;&nbsp; Mac The Apple Mac platform<br>
-&nbsp;&nbsp; efi EFI based boot for PCs<br>
-&nbsp;&nbsp; #&nbsp;&nbsp; an arbitrary numerical value<br>
<br>
Port implement from cdrtools:<br>
<a href=3D"https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a=
515dbfca6968ca2296fd7">https://github.com/jobermayr/cdrtools/commit/a50804f=
d61d75eb689a515dbfca6968ca2296fd7</a><br>
<br>
Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
---<br>
&nbsp;.../cdrkit/cdrkit_1.1.11.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&nbsp;...001-add-new-option-eltorito-platform.patch | 335 +++++++++++++++++=
+<br>
&nbsp;2 files changed, 336 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-add-n=
ew-option-eltorito-platform.patch<br>
<br>
diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/r=
ecipes-multimedia/cdrkit/cdrkit_1.1.11.bb<br>
index dd0405c95..757f99d1f 100644<br>
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<br>
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<br>
@@ -11,6 +11,7 @@ SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_$=
{PV}.orig.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///0001-define-__THROW-to-avoid-build-issue-with-musl.patch">
file://0001-define-__THROW-to-avoid-build-issue-with-musl.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///0002-Do-not-use-rcmd-on-build-with-musl.patch">file://0002-Do-n=
ot-use-rcmd-on-build-with-musl.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///0001-genisoimage-Add-missing-extern-definition.patch">
file://0001-genisoimage-Add-missing-extern-definition.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le:///0001-add-new-option-eltorito-platform.patch">file://0001-add-new-opti=
on-eltorito-platform.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI:append:class-nativesdk =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///0001-install-netscsid-to-bin-for-nativesdk.patch">file://0001-i=
nstall-netscsid-to-bin-for-nativesdk.patch</a> \<br>
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-el=
torito-platform.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-ne=
w-option-eltorito-platform.patch<br>
new file mode 100644<br>
index 000000000..dac3328a4<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-eltorito-=
platform.patch<br>
@@ -0,0 +1,335 @@<br>
+From 5a2d571f3687910260c45841725f2deb84c8f12e Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
+Date: Mon, 25 Apr 2022 18:18:00 +0800<br>
+Subject: [PATCH] add new option -eltorito-platform<br>
+<br>
+Mkisofs now correctly supports El Torito multi boot entries by introducing=
<br>
+a Boot Dection Header before a list of alternate boot entries.<br>
+<br>
+New option -eltorito-platform allows to set the El Torito platform id<br>
+for a boot entry or for a list of boot entries. Supported values for<br>
+the parameter are:<br>
+-&nbsp;&nbsp; x86 the standard value vor x86 based PCs<br>
+-&nbsp;&nbsp; PPC the Power PC platform<br>
+-&nbsp;&nbsp; Mac The Apple Mac platform<br>
+-&nbsp;&nbsp; efi EFI based boot for PCs<br>
+-&nbsp;&nbsp; #&nbsp;&nbsp; an arbitrary numerical value<br>
+<br>
+Upstream-Status: Inappropriate [port from cdrtools]<br>
+https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515dbfca69=
68ca2296fd7<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
+---<br>
+ genisoimage/eltorito.c&nbsp;&nbsp;&nbsp; | 73 +++++++++++++++++++++++++++=
++++++++++--<br>
+ genisoimage/genisoimage.c | 47 +++++++++++++++++++++++++<br>
+ genisoimage/genisoimage.h |&nbsp; 8 +++++<br>
+ genisoimage/iso9660.h&nbsp;&nbsp;&nbsp;&nbsp; | 33 ++++++++++++++++--<br>
+ 4 files changed, 157 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/genisoimage/eltorito.c b/genisoimage/eltorito.c<br>
+index d52e17e..a804988 100644<br>
+--- a/genisoimage/eltorito.c<br>
++++ b/genisoimage/eltorito.c<br>
+@@ -56,6 +56,7 @@ static unsigned int bcat_de_flags;<br>
+ void&nbsp; init_boot_catalog(const char *path);<br>
+ void&nbsp; insert_boot_cat(void);<br>
+ static&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; g=
et_torito_desc(struct eltorito_boot_descriptor *boot_desc);<br>
++static&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; f=
ill_boot_shdr(struct eltorito_sectionheader_entry *boot_shdr_entry, int arc=
h);<br>
+ static&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; f=
ill_boot_desc(struct eltorito_defaultboot_entry *boot_desc_entry,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_boot_entry_info *boot_entry);<br>
+ void&nbsp; get_boot_entry(void);<br>
+@@ -282,7 +283,14 @@ get_torito_desc(struct eltorito_boot_descriptor *boot=
_desc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct directory_entry&nbsp; *d=
e2;&nbsp;&nbsp; /* Boot catalog */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; offset;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; arch =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; nentries =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_defaultboot_ent=
ry boot_desc_record;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_sectionheader_entry boot_s=
hdr_record;<br>
++#ifdef __needed__<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_section_entry boot_section=
_record;<br>
++#endif<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_sectionheader_entry *last_=
section_header =3D 0;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(boot_desc, 0, sizeof (*b=
oot_desc));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_desc-&gt;type[0] =3D 0;<br=
>
+@@ -311,13 +319,22 @@ get_torito_desc(struct eltorito_boot_descriptor *boo=
t_desc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_731(boot_desc-&gt;bootcat_p=
tr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; (unsigned int) get_733(de2-&gt;isorec.extent));<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If the platform id for the first (=
default) boot entry has not been<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * explicitly set, we default to EL_T=
ORITO_ARCH_x86<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((first_boot_entry-&gt;type &amp; ELTOR=
ITO_BOOT_ID) =3D=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; first_boot_entry-&gt;boot_platform =3D EL_TORITO_ARCH_x86;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arch =3D first_boot_entry-&gt;boot_platfor=
m;<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we have the boot image,=
 so write boot catalog information<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Next we write out the p=
rimary descriptor for the disc<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;valid_desc, 0, size=
of (valid_desc));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_desc.headerid[0] =3D 1;<b=
r>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_desc.arch[0] =3D EL_TORITO_ARCH_x86;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_desc.arch[0] =3D arch;&nbsp; /* Plat=
form id for the default boot */<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we'll shove start of pu=
blisher id into id field,<br>
+@@ -351,8 +368,17 @@ get_torito_desc(struct eltorito_boot_descriptor *boot=
_desc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; current_boot_entry !=3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; current_boot_entry =3D current_boot_entry-&gt;next,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; offset +=3D sizeof (boot_desc_record)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int newarch =3D arch;<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (offset &gt;=3D SECTOR_SIZE) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (current_boot_entry-&gt;type &amp; ELTORITO_BOOT_ID)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; newarch =3D current_b=
oot_entry-&gt;boot_platform;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry-&g=
t;boot_platform =3D arch;<br>
++ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * El Torito has no such limitation but we currently have...<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (offset &gt;=3D (SECTOR_SIZE - sizeof (boot_desc_record))) {<br>
+ #ifdef&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USE_LIBSCHILY<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; comerrno(E=
X_BAD,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Too =
many El Torito boot entries\n&quot;);<br>
+@@ -362,12 +388,53 @@ get_torito_desc(struct eltorito_boot_descriptor *boo=
t_desc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(1);<b=
r>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (current_boot_entry =3D=3D first_boot_entry) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* EMPTY */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else if ((current_boot_entry =3D=3D first_boot_entry-&gt;next) ||<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (arch !=3D newarch) ||<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (current_boot_entry-&gt;type &amp; ELTORITO_SECTION_HEADER)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (last_section_head=
er)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; set_721(&amp;last_section_header-&gt;entry_count=
, nentries);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nentries =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; last_section_header =
=3D (struct eltorito_sectionheader_entry *)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; (de2-&gt;table + offset);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_boot_shdr(&amp;b=
oot_shdr_record, newarch);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(de2-&gt;table =
+ offset, &amp;boot_shdr_record,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof (boot_shdr_record));=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset +=3D sizeof (b=
oot_desc_record);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nentries++; /* Add en=
try to this section header */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * This works because a section entry has the same essential<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * layout as a default entry (and we do not populate the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * selection criteria fields).<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; */<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; fill_boot_desc(&amp;boot_desc_record, current_boot_entry);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; memcpy(de2-&gt;table + offset, &amp;boot_desc_record,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sizeof (boot_desc_record));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (last_section_header) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; set_721(&amp;last_section_header-&gt;entry_count, nentries);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; last_section_header-&gt;header_id[0] =3D EL_TORITO_SHDR_ID_LAST_SHDR;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+ }/* get_torito_desc(... */<br>
+ <br>
++static void<br>
++fill_boot_shdr(boot_shdr_entry, arch)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_sectionheader_entry *boot_=
shdr_entry;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arch;<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(boot_shdr_entry, 0, sizeof(struct e=
ltorito_sectionheader_entry));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_shdr_entry-&gt;header_id[0] =3D EL_TO=
RITO_SHDR_ID_SHDR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_shdr_entry-&gt;platform_id[0] =3D arc=
h;<br>
++}<br>
++<br>
+ static void<br>
+ fill_boot_desc(struct eltorito_defaultboot_entry *boot_desc_entry, <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct eltorito_boot_entry_info *boot_entry)<br>
+@@ -678,7 +745,9 @@ get_boot_entry()<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!first_boot_entry) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; first_boot_entry =3D current_boot_entry;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; last_boot_entry =3D current_boot_entry;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; current_boot_entry-&gt;boot_platform =3D EL_TORITO_ARCH_x86;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; current_boot_entry-&gt;boot_platform =3D last_boot_entry-&gt;boot_pla=
tform;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; last_boot_entry-&gt;next =3D current_boot_entry;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; last_boot_entry =3D current_boot_entry;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+diff --git a/genisoimage/genisoimage.c b/genisoimage/genisoimage.c<br>
+index 9089081..84ac3c2 100644<br>
+--- a/genisoimage/genisoimage.c<br>
++++ b/genisoimage/genisoimage.c<br>
+@@ -271,6 +271,8 @@ struct rcopts {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **variable;<br>
+ };<br>
+ <br>
++static int get_boot_platid(char *opt_arg);<br>
++<br>
+ struct rcopts rcopt[] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;PREP&quot;, &amp;prepare=
r},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;PUBL&quot;, &amp;publish=
er},<br>
+@@ -404,6 +406,7 @@ struct ld_option {<br>
+ <br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_ALLOW_LEADING_DOTS&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1070<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_PUBLISHER&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 1071<br>
++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_PLATFORM&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 1072<br>
+ <br>
+ #ifdef&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; JIGDO_TEMPLATE<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_JTT_OUTPUT&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11=
01<br>
+@@ -528,6 +531,8 @@ static const struct ld_option ld_options[] =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'b', &quot;FILE&quot;, &quot;Se=
t El Torito boot image name&quot;, ONE_DASH},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;eltorito-alt-boot&quot;=
, no_argument, NULL, OPTION_ALT_BOOT},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '\0', NULL, &quot;Start specify=
ing alternative El Torito boot parameters&quot;, ONE_DASH},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;eltorito-platform&quot;, required_=
argument, NULL, OPTION_PLATFORM},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '\0', &quot;ID&quot;, &quot;Set El Torito =
platform id for the next boot entry&quot;, ONE_DASH},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;sparc-boot&quot;, requi=
red_argument, NULL, 'B'},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'B', &quot;FILES&quot;, &quot;S=
et sparc boot image names&quot;, ONE_DASH},<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;sunx86-boot&quot;, requ=
ired_argument, NULL, OPTION_SUNX86BOOT},<br>
+@@ -1558,6 +1563,9 @@ int main(int argc, char *argv[])<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_boot_e=
ntry();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; case OPTION_PLATFORM:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_boot_platid(optar=
g);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; case OPTION_BOOTALPHA:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_alphab=
oot++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* list of=
 pathnames of boot images */<br>
+@@ -3829,3 +3837,42 @@ e_malloc(size_t size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(pt, 0, size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (pt);<br>
+ }<br>
++<br>
++static int<br>
++get_boot_platid(char *opt_arg)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long&nbsp;&nbsp;&nbsp; val;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp; *ptr;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_eltorito++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (streql(opt_arg, &quot;x86&quot;)) {<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D EL_TORITO_ARCH_x86;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (streql(opt_arg, &quot;PPC&quot;=
)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D EL_TORITO_ARCH_PPC;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (streql(opt_arg, &quot;Mac&quot;=
)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D EL_TORITO_ARCH_PPC;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (streql(opt_arg, &quot;efi&quot;=
)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D EL_TORITO_ARCH_EFI;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; val =3D strtol(opt_arg, &amp;ptr, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (*ptr || val &lt; 0 || val &gt;=3D 0x100) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; comerrno(EX_BAD, &quo=
t;Bad boot system ID.\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If there is already a boot entry a=
nd the boot file name has been set<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * for this boot entry and the new pl=
atform id differs from the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * previous value, we start a new boo=
t section.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (current_boot_entry &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry=
-&gt;boot_image !=3D NULL &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry=
-&gt;boot_platform !=3D val) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_boot_entry();<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_boot_entry();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry-&gt;type |=3D ELTORITO_=
BOOT_ID;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry-&gt;boot_platform =3D v=
al;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (1);<br>
++}<br>
++<br>
+diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h<br>
+index 82c859b..1170d89 100644<br>
+--- a/genisoimage/genisoimage.h<br>
++++ b/genisoimage/genisoimage.h<br>
+@@ -299,6 +299,14 @@ struct eltorito_boot_entry_info {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_info_table;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; load_size;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; load_addr;<br>
++<br>
++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ELTORITO_BOOT_ID&nbsp;&nbsp;&=
nbsp; 1<br>
++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ELTORITO_SECTION_HEADER 2<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp; type;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Valid if (type &amp; ELTORITO_BOOT=
_ID) !=3D 0<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp; boot_platform;=
<br>
+ };<br>
+ <br>
+ extern int&nbsp;&nbsp;&nbsp; goof;<br>
+diff --git a/genisoimage/iso9660.h b/genisoimage/iso9660.h<br>
+index c74c2a9..61b6fc0 100644<br>
+--- a/genisoimage/iso9660.h<br>
++++ b/genisoimage/iso9660.h<br>
+@@ -62,6 +62,7 @@ struct iso_volume_descriptor {<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_x86&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 0<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_PPC&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_MAC&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 2<br>
++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_EFI&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 0xEF<br>
+ <br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_BOOTABLE&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 0x88<br>
+ #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_NOT_BOOTABLE&nbsp; =
0<br>
+@@ -159,10 +160,15 @@ struct eltorito_boot_descriptor {<br>
+ };<br>
+ <br>
+ /* Validation entry for El Torito */<br>
++/*<br>
++ * headerid must be 1<br>
++ * id is the manufacturer ID<br>
++ * cksum to make the sum of all shorts in this record 0<br>
++ */<br>
+ struct eltorito_validation_entry {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char headerid&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 711 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char arch&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 711 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 721 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char id&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp; 28)]; =
/* CD devel/man*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char cksum&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(29,&nbsp; 30)];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char key1&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(31,&nbsp; 31)];<br>
+@@ -173,7 +179,7 @@ struct eltorito_validation_entry {<br>
+ struct eltorito_defaultboot_entry {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_id&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 711 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_media&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char loadseg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 711 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char loadseg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 721 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sys_type&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp;&nbsp; 5)];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(6,&nbsp;&nbsp;&nbsp; 6)];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char nsect&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(7,&nbsp;&nbsp;&nbsp; 8)];<br>
+@@ -181,6 +187,29 @@ struct eltorito_defaultboot_entry {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad2&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(13,&nbsp; 32)];<br>
+ };<br>
+ <br>
++/* El Torito section header entry in boot catalog */<br>
++struct eltorito_sectionheader_entry {<br>
++#define&nbsp;&nbsp;&nbsp; EL_TORITO_SHDR_ID_SHDR&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 0x90<br>
++#define&nbsp;&nbsp;&nbsp; EL_TORITO_SHDR_ID_LAST_SHDR 0x91<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char header_id&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 711 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char platform_id&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char entry_count&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 721 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp; 32)];<br>
++};<br>
++<br>
++/* El Torito section entry in boot catalog */<br>
++struct eltorito_section_entry {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 7=
11 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_media&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char loadseg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 7=
21 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sys_type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp;&nbsp; 5)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(6,&nbsp;&nbsp;&nbsp; 6)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char nsect&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; [ISODCL(7,&nbsp;&nbsp;&nbsp; 8)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char bootoff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(9,&nbsp;&nbsp; 12)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sel_criteria&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; [ISODCL(13,&nbsp; 13)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char vendor_sel_criteria&nbsp;&nbsp;&nbsp;=
 [ISODCL(14,&nbsp; 32)];<br>
++};<br>
++<br>
+ /*<br>
+&nbsp; * XXX JS: The next two structures have odd lengths!<br>
+&nbsp; * Some compilers (e.g. on Sun3/mc68020) padd the structures to even=
 length.<br>
+-- <br>
+2.27.0<br>
+<br>
-- <br>
2.27.0<o:p></o:p></span></p>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_PA4PR08MB7411247A4FC9C44AD8947FA0E8FB9PA4PR08MB7411eurp_--

