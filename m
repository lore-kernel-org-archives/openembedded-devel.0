Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EE7C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 13:52:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web10.2544.1705499577071440758
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 05:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lEfBlLw/;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lEfBlLw/;
 spf=pass (domain: arm.com, ip: 40.107.21.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JFVE/JtcYqZ/GiWu3foIZ3B3QPIXTq/Kzrp3ZPJ29+IJH2g85U9rMI+V/R/EtQmy+1vpl6LMENMsRAzGybI7aCZirX5hD7F6ZDGEGYtpmv+0O6r+syFnmei7fezY3OSRQceVVicFiShVkZxP7W48Kvrap1KG4IuLncUDK0EJltswab8C2574eU6JaLBSZYgsu5+kelEjYLPo9iHqInhOXkbmqXqMu1F3JBUBMLM+chEjVkupWXUavsP5DrsnzMwL6ZiRUTJOGiYE3I5+7/RySdsDdoYsYcZBTJcazUdpxQNzwV1gT7n6gvOa8op6w3R7HDw/8LgyLJOK/tF1xBkaxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC7NdU1KNS/mPNSm12Mi6R27VkG1jotoP2MiQwJr6Kc=;
 b=YqYtA3Baj+VD9TgYUKsOJD9/QajxuClqoTe9OOrZoKP5YoLQIU3x1BuKmSoZGi6dhKHRt1APFey/vqbSM2EXfulezNaefCmwzhTDcBPLvYevNAGxuJom/q411wDkZxvrHHXYqkx4GEIDx5EaSDrDufrfyHEJYqyGeW7m0COlTrNYxGvU6nZoOQJtZ70xjC6CIPNOTqrGkkVcq9gQUMnayYOXLkO3LReTSUI6kbgzxCFJo9Li7aeZkI4CLiCsCjFqW7ierB5wpkEABZQQXqMAafZaYhnEgAPx5+sRepCSCYcyHFw6eqwQD8vi0Dmg5I/tuKtZLNjgF5nqzwiKQFy6zA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pC7NdU1KNS/mPNSm12Mi6R27VkG1jotoP2MiQwJr6Kc=;
 b=lEfBlLw/QE7T09l3ciazKJivKWqk4R+oPcF4CmtdR07ciumuxczpQBFJQCEZG/MB4t4hANdFfnksl7NY5Hf24swjPodv4mbZ54NzQGuSau8jPu7BMy/vCC7pwo9Tgvk2Bq3rNt71YGUgO91PnDfo4ELXXzEZayp425Xb+65Uobg=
Received: from DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) by GV1PR08MB7362.eurprd08.prod.outlook.com
 (2603:10a6:150:21::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Wed, 17 Jan
 2024 13:52:52 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::b7) by DUZPR01CA0028.outlook.office365.com
 (2603:10a6:10:46b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Wed, 17 Jan 2024 13:52:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 13:52:50 +0000
Received: ("Tessian outbound 1076c872ecc6:v228"); Wed, 17 Jan 2024 13:52:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ffbf3bac2039091
X-CR-MTA-TID: 64aa7808
Received: from 8731931720cb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 083443EB-B136-41C6-98E3-A633012A0B0E.1;
	Wed, 17 Jan 2024 13:52:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8731931720cb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jan 2024 13:52:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISooa0J989t38RZNEq0h5Gu4OVzAcEIyE90Y3KPgoN+s9+Q+I6XcQUWOT6Qo001CVYKYYts4gOV0+3Q7SM6v/Yju6TGXr3FwA9JuyAy39cVjRLf+hM9WYV5smODwn2WZlFFY8ked1RC1Q67qbie58Ln7WgzHkX3TEaRWyErOAD81pj7Q7MqUCGTctS/z0Qelmr01QWHtcYN/VpIIEWnyHMImPd0ks3wRHr8sufeIVE6bYU//FvAegZpCiz0H1cStppT++IjVAat4tOrZmMeUWbI5a9nUfgPrKZK0h3+zc56aeJfKbRS31l26rwANW1ek68e/owyXm1F8aCMTxmp7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC7NdU1KNS/mPNSm12Mi6R27VkG1jotoP2MiQwJr6Kc=;
 b=DF8u5HkOhA07WRCvBQfxKOal9XqvHs7jcAzMH6kVp+4naHJMKZBBX4J+u39W7xLryEfYZ8TKfUzZFqzuainaCIIRoN/p/RI7U2lD53IZhdTzvoAAa4ijzEF0DG70a+ticev9N8zFTcCR6WWB0R7ao3lex0Er8ezGPxoJNdP4BeNs+lCJ+atsyy0HekfwtWax5ACPgGgdzk/1BByxZMrnE1AtmvBHL1LjNE01ubL3/m6h/tXZNdvl4thibk7RhIGTz2VlE5gThm+mEzumvBlWyxUyT0Slq5FMxuj67+KFfocMwd6sH1qhNK6kZFHsoKtUmfCKx2vOQ7Tb4RaEfULd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pC7NdU1KNS/mPNSm12Mi6R27VkG1jotoP2MiQwJr6Kc=;
 b=lEfBlLw/QE7T09l3ciazKJivKWqk4R+oPcF4CmtdR07ciumuxczpQBFJQCEZG/MB4t4hANdFfnksl7NY5Hf24swjPodv4mbZ54NzQGuSau8jPu7BMy/vCC7pwo9Tgvk2Bq3rNt71YGUgO91PnDfo4ELXXzEZayp425Xb+65Uobg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5664.eurprd08.prod.outlook.com (2603:10a6:800:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 13:52:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 13:52:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [ANNOUNCEMENT] New layer for parallel installable PHP
 versions and misc modules
Thread-Topic: [oe] [ANNOUNCEMENT] New layer for parallel installable PHP
 versions and misc modules
Thread-Index: AQHaSSlHUOkHy207g0S8+kTL4Nh8UbDd8vyAgAAKwQCAAAjEgA==
Date: Wed, 17 Jan 2024 13:52:41 +0000
Message-ID: <C51F7126-E575-4A46-A9D6-8E6C3AA46B32@arm.com>
References: <415ef717-ab15-4bcf-a8d2-2e8d8fb37a25@gmail.com>
 <F9845F01-2233-416E-B0A3-97EF5E48FB0A@arm.com>
 <59f016c0-2513-4a45-b3de-010648ab48b5@gmail.com>
In-Reply-To: <59f016c0-2513-4a45-b3de-010648ab48b5@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5664:EE_|DB5PEPF00014B93:EE_|GV1PR08MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: cd05ac78-331d-4dd0-9a23-08dc17639832
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wl5A0PkhKmghEsu2brvNWKm+cH3m1pZJ88XYR+9T17FGUqiuBqF03VCI8Dn09xYA/FSdyx/rL04C316Ha781eqHKbkGxADllmF0ZW+9o1dgajIoYTvr6MUoyJVGRzOfPAGXGbZT/1t+MDvvtvSk+WXQ6i2IymfhUy4kJ4C5uQ835gyC21f2EQn2eFHAjPg7m+itKMZabxho2mzUr0GRW1J3ckqQPyEEMnZFaL1PIjbk30O90DEAbvA85TQPMpMD3Zc50NvSdbeXmJlUEoIoNTHu/DkOaoFFL7jnf8NCw2UrAkuPbpQfEO8LTFrSzZOsVZDMRCu9DWhh0NTjxVBqchHZU8NU70VI1c3woN9rp2aL5wADFNKQg0AEZ5Dx25gJdyIJBYIuGKuhY+K9AnbrLAnERUSsuDiZ+pvo8NtZdpltvBXRx2b+TfUQzSL0IQggSuhIQDtKR5kckWD3nX/H2S4pYMmAQOY3efsvTiGC/J7BUb6u6iPS9QVfdVZ0MLGvnpL/rJL+tPrk/4nMrvZ5+qORG0v3FzwDjce60I/uopus0cDAK4ij8flcVrrxsmoUfxkkx8PE/m3thyqOSSX2KHX3khDMXmRR74K9nBDUvjix+2uDXb+1tZmQWUDn8X5xjQ8j18TUFU9Z5In7LFOvR5g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(136003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(122000001)(33656002)(86362001)(8676002)(71200400001)(6512007)(2906002)(53546011)(6506007)(2616005)(91956017)(4326008)(26005)(66446008)(8936002)(76116006)(66556008)(64756008)(66476007)(316002)(6916009)(66946007)(478600001)(966005)(5660300002)(6486002)(4744005)(41300700001)(36756003)(38100700002)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4DB2B5CB1AFAD40B4CD4490C8739EAC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5664
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	79315552-97e5-48ab-cd1e-08dc1763932f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j3V9dq/Jf9Aq0N2kv8+F2IFNu5nbzCERE3VIqt4h8KT2aQUsZGGqOz0JYCR+NWmzUFEKruN9O3haSZZdBwoeWa1vgd69XRTXkENzLtLJiKm4EuQVD2MSUjsWYUyKHuhF5aeV2MuNjASRVt3ekrhepgwFFqz6hUDMXTubmP6g5rQtt34kJq/hLWi/KhFeuZFBc6Y7xAr0BYDf7qFu76c1nlq0dSsrtG7qjOdaLbuZs+RmxuGsOQUteYTT/bpoc3Yw0o+lIhyvg5B8m5yQUTDQjcqSwDuq8Jvoojx+VZa6L0Hpn7Yqk0qTugM5yBPfwdMtvgG0h3qOaHoDk2gkQbI7U+bEs/kG4mNRVDxvaKkYAsyQenohimGXImiJgTVC8VynbYAvaUf09+v/Yi+eBGNMRozIaUz7KeHOBj/29FYGpHYxc7zow/hWwTasUI2etwkJynMw2TZrGUuNMOC2PFjYsCZMiGm+yNBcmmgscoqcwT1gfSyOghf998YTknxNH6oijetWmgldf9RPUhiee5BJncKzZLK2QvWtNhnzDiM6Jm9hr20u1W4TWEsgbEEJTJ0TwzI8T7pUwd8Mk1g2p+HNB2DBUrt+6eyd1UCh6gsfQKCKA5PlfYeVkKh+I368/R6sRx2a/Cfl4RE/lNICas/ksTjtWZtOlrU6lm9uVMDKlegbsqyWbW9buETGd71w2r3QiG/43ogTz6Wo57gXmKLIbFejy3gO4haHjm4nATdSU4M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(6512007)(6506007)(2616005)(336012)(26005)(53546011)(36860700001)(47076005)(5660300002)(4326008)(6862004)(966005)(4744005)(41300700001)(6486002)(2906002)(478600001)(70206006)(70586007)(8936002)(8676002)(316002)(81166007)(86362001)(33656002)(82740400003)(356005)(36756003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 13:52:50.2422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd05ac78-331d-4dd0-9a23-08dc17639832
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7362
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 13:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108332

T24gMTcgSmFuIDIwMjQsIGF0IDEzOjIxLCBCw7ZzesO2cm3DqW55aSBab2x0w6FuIDx6Ym9zem9y
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiAyMDI0LiAwMS4gMTcuIDEzOjQyIGtlbHRlesOpc3Nl
bCwgUm9zcyBCdXJ0b24gw61ydGE6DQo+PiBPbiAxNyBKYW4gMjAyNCwgYXQgMDk6NDAsIFpvbHRh
biBCb3N6b3JtZW55aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8emJvc3pvcj1nbWFpbC5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pj4gVGhlc2UgcmVjaXBlcyBhcmUg
bm93IHB1YmxpYyBhdCBodHRwczovL2dpdGh1Yi5jb20vemJvc3pvci9tZXRhLXBhcmFsbGVsLXBo
cA0KPj4gQ2FuIHlvdSBzdWJtaXQgdGhlIGxheWVyIHRvIHRoZSBMYXllciBJbmRleCBhdCBodHRw
czovL2xheWVycy5vcGVuZW1iZWRkZWQub3JnLz8NCj4gDQo+IERvbmUuDQoNCkFuZCBhcHByb3Zl
ZC4gVGhhbmtzIQ0KDQpSb3Nz

