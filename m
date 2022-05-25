Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C66C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 10:37:25 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.58])
 by mx.groups.io with SMTP id smtpd.web09.5111.1653475040481684013
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 03:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=8OqHO0mp;
 spf=pass (domain: arm.com, ip: 40.107.22.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LeMcpAMlNbgyt4bjOl8bt7lzuEJ95WzQPKd5KpTJiixOMRIk59FiiTtZHm67vq18jCAhvC5WCecCNo3SX6zSyHNI/F2L2PiuatTn7X50nJBQXvpYsBIjwXPXGUEtvGQVluCNx8XJ8vEqcrJXcXNAL+vNlO+vlVB9yDuA7IcrYn7/dJVumhFvG0pdVSDhBMyKj4MZ0oMKfrN3CuMw9GyPyyHS74t81XA7mEVjIevWzN4aRWNAHiuOqRmPDD0w8Q7Y5NKsMJSDTKhx3lQ++zXBlKzZar4MuQzZEBpc6lA+n/koAhv4jFjNSo0meNgP3gSDFExR2+fWrTTszrnqFmbq8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgiLePEFiLQX7p4hSSEHwVst0DarGYJe7vxorasgQUM=;
 b=Sj6sgl6on987ton0T8jJXlo1BdLsuKnF8NphdJFqt9L+w2Ivd/K6EyBDnv/P87ZIiO8JwR/u6NC2p0rLnpz/XdanngIzCCwxH7GyjiF3njDSEIEmvO26QsKfb96uSn3/KgGMPKxGC+/yItqyJSV+T/jnQjQ6ECHEtLRcZxOvAmYh/LRkLwsuvpuEDo66ia3JyDi+FLK+VglOBT2dao3CTaLxqEXX4+w19BfSUziicnE+NAhIz7EJO167Lk5dvXGdtrHjRtgVPzo/zL4Jg6Gx1e4Ik5G142LYVAkLyE8YKyT2VB1ZzSAvUaAuNYFCgb6zkff48nA9qPod8Ywl50RVxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgiLePEFiLQX7p4hSSEHwVst0DarGYJe7vxorasgQUM=;
 b=8OqHO0mpBVLEf6HFrM01f/ftbIePOljSws/Ptl9lzQs+30Msd5rW7138X6tqK1CueNMMTSnP7lRUFFO3kh6NhiswDX6ni59szoFgDdd9emKvDbpHXaJ+SgMMjsKBbUPr7IMuDvefHSv6v+zu0GbVwaPeKt394dgvJnpKO2vhPY4=
Received: from AS8PR07CA0003.eurprd07.prod.outlook.com (2603:10a6:20b:451::18)
 by AM6PR08MB5143.eurprd08.prod.outlook.com (2603:10a6:20b:ed::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 25 May
 2022 10:37:16 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::a3) by AS8PR07CA0003.outlook.office365.com
 (2603:10a6:20b:451::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 25 May 2022 10:37:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 10:37:16 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Wed, 25 May 2022 10:37:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b12729f925c4346
X-CR-MTA-TID: 64aa7808
Received: from 326bc60d7162.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6582F119-13E3-4197-A7A7-AA9D48103ACC.1;
	Wed, 25 May 2022 10:37:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 326bc60d7162.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 May 2022 10:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGo7E6XrzYPhI1stN3iGPZxJ91ZTjQErPLg8AAp3WqGCT7vNwe2b6cfoocl2u4+uzWK8mn0uBhvBbL8OBpkB5d/i+IrFDh1i4H/SK1h5Xh/1w4V1jBdrT9b+dSSR3V2slxGt13wAiZfZGhZ9/5M99e8r9eSlF8d5FLJcjxh4DiP4ozBBhpzy+/CKNb33JdVdJqyKHpDmpPHVcLgUZ1uAziMrV1e1pf9SDfCRqiA6EyenidQkUzLmeZBiodNrDMq+SQ1jXMAH8CvBW5UwSARKUFZkrLIDexMmg5bUDcyq4+MueASfNnOP8imW0xVMwATe6Y9UlS9ywF1mElQT6BLIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgiLePEFiLQX7p4hSSEHwVst0DarGYJe7vxorasgQUM=;
 b=mC7UsCrKB1jDytuc8ijTfzK/aAsl1oTYmJ+db/dDfEGCB4A5DAhfT6sXCH7gmWRhC+N3pzPa6/kfAoTrkTLLNBL8Y+qyecETJpT9pWa970Nt6P/7L3V4dePkP53Ap5T7pFarlut318fYinnZBU171HWQT7lGvaOz01RNvyGXmebCi8ISzGmW+i3HFU8D+ckXWv3kYAlhvbODhgJ+VIl7YH5ZNGpyxw9UKgHOZAUaXV5Yjfv2CT1rgVcl4Y2IK0Ta11xjs23yrRfWV/GPfScuwLjftzs5fukt6mUOuTIm0JA3mAZLkt2wW/rzanhr3gMoTwzHsETrjrfrXneLnU3NQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgiLePEFiLQX7p4hSSEHwVst0DarGYJe7vxorasgQUM=;
 b=8OqHO0mpBVLEf6HFrM01f/ftbIePOljSws/Ptl9lzQs+30Msd5rW7138X6tqK1CueNMMTSnP7lRUFFO3kh6NhiswDX6ni59szoFgDdd9emKvDbpHXaJ+SgMMjsKBbUPr7IMuDvefHSv6v+zu0GbVwaPeKt394dgvJnpKO2vhPY4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB4322.eurprd08.prod.outlook.com (2603:10a6:208:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Wed, 25 May
 2022 10:37:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%9]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 10:37:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>, nd
	<nd@arm.com>
Subject: Re: [oe] [PATCH 5/7] python3-hatchling: add new recipe and build
 class
Thread-Topic: [oe] [PATCH 5/7] python3-hatchling: add new recipe and build
 class
Thread-Index: AQHYb2eOKT0y4vn2zEuujgQpaNIdza0ue+AAgADsEgA=
Date: Wed, 25 May 2022 10:37:06 +0000
Message-ID: <62ECDE0E-7D6D-4C49-A07C-DA29DA148BA7@arm.com>
References: <20220524121153.1175133-1-ross.burton@arm.com>
 <20220524121153.1175133-5-ross.burton@arm.com>
 <CAMKF1soJ-jkyxf-uGNvWK4YANcoMdk-H5VHoHpOr3WXtuB4Z4w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soJ-jkyxf-uGNvWK4YANcoMdk-H5VHoHpOr3WXtuB4Z4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c68264db-947f-4476-8b2f-08da3e3a8977
x-ms-traffictypediagnostic: 
	AM0PR08MB4322:EE_|VE1EUR03FT008:EE_|AM6PR08MB5143:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB5143A1BDAFB34B340EADF416E8D69@AM6PR08MB5143.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Z5e3Eoh/PbWoC2RLbd2FcJn0rTPzMiShCf4it1gMBME7styKLMhZwseqq0k79yzriHhlRhO5aA/01U2fmE8BqmcGRo/kn35yEvFL1CN+XFIYIy7olgkyYo05uK7CSTmfQ/6r/gNUn1qiVfNKqcixl1/38/jUYyODpKYgV/4N6/V7RZd4FzXS9szMSXD/0G/iFujruS2s4sby9DI1lpIrR1Q+a2aH8nqpxgYSomXRKTqdoN5L8nVAt+FYSl9kaDMEcbeereLsbsoiLGSvFmZIUqX+cjVR0eplvtk2XsPMZaMgXYDRiQnUK59ps92ieHoMrD9/LoU40Zq8JBTEgmbWnrQoCIezbesE96/GMSj0dm2Cl19nyi4Fprh2cNZqIR5domEssewYPoZ/cQo7wluRjr3T+A9QSDeAS9GmT+5TqNaqJ0YI2BbUxt8k1r+QIbGPKoAR5Lf50UmflZ7CTCnRKvf8EOodXRuuozAIjuaGFLDsNeeH5xcr8SeR8/cZK/C2GeU/jfTI8KzL9pKnBxIYCW4oZZBttMK+ZfsrN9iDM8DJTpVz9vOljrKv+FO514SOK8+edj/8chUMBikp70yVzLnAaE+nuX2uioZgyQCwVnVRdjT+bfRMzZhHDy9jo/lu+mkCADoMsJhy85rV5TqUK1bEapf8Pbx4/X8iQi8QmT6C0lg5jvIxJivSlGu8bZ3fZSqsjtpCRm2Eq1UrD/xAovncM0nbNdv/q0Qxo6MArGu7n9fbzDaVz6yxWwDu8EADiln+KJsvE3veVbALT4J6ZXYy4cGrLz1VSsasqu6NYaWyK2IAzKq/QLKj32osJKIaSDGt0MkftW0n41/VnOf04g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(186003)(71200400001)(6506007)(38070700005)(122000001)(36756003)(38100700002)(508600001)(6916009)(316002)(6486002)(966005)(64756008)(66446008)(53546011)(66476007)(66556008)(54906003)(66946007)(91956017)(76116006)(2906002)(2616005)(4326008)(8676002)(5660300002)(26005)(33656002)(6512007)(8936002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <949A7713252D4C4BA87F11344D6EE49F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4322
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e9801671-b10e-4ae7-15df-08da3e3a83ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HKaXtQh86tla7rpYWPX0JdnAdxK8FsZcxySxzk1l/5vR0E96UL3lQyUrk3v0zcFPRDfJssIwg6hL/asv7qXKyDSoSCCgoUVoKm+aBqpPnZwSQuX5cT6lxhU1PsHge6CnRVneOqmqQBD97i07XmFI/co29RKn3daBM4UQ90InChZAGiK8Gf7d7jbbj7lyZzCQBUPBENSS6kId0lquSJH8/lB9Y908qzdJS3M7kmr/NXmoWmseoKlatxL+/Qh/iF6hdGCS3bbxbck/CS3luInPN+4XohcqV1gyo6IWhLuPoLDtllfxlhfQMb2v02cdjG+zD0QLHrWnImPWzj1BDryKAVBQ0Q4T9JdxWcuy1P40wtFLouz8JhOw0hCdLBtSCWjPsm9dGRJGPuiS0SwMRw/RX02P0ocqhiVWchq5Hccqan9Sv97oTyV9FPt6raiqtXPQCGowTVtpbx+oY9wW94GL6JXi4qDl9DQP+tzKiokhNOHU9F8s+nl9Shte690CW5CyhEhT05rEobLj1t2UpB7zN6JbT+2cegflZhRVL9ySJPr1Sqq+6CwOfTu842Vnenu0BQ0ANuKzerKP4d8/BywRfykivdEzpJxVvE44LclZBiC/a8sITdjZ6EjLPhzZ8gIy+enG0zAQPfAPy3VHMpzbdlfbAOwTKUbi/H6oJ1E7z8DJRIIejNBDmIBB7hNrOmer/QR+ZRBWQGiCNaMmq8/19PKnEbwfpj3BFnvYSlJOYb5VPuyY5OksJS+thS3SPUdwmfms8Ke6ffq/V0a6s7Do9A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(54906003)(336012)(966005)(82310400005)(36756003)(47076005)(6512007)(33656002)(6506007)(356005)(70206006)(508600001)(2616005)(53546011)(6486002)(83380400001)(26005)(6862004)(316002)(186003)(81166007)(36860700001)(8676002)(5660300002)(2906002)(8936002)(40460700003)(86362001)(4326008)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 10:37:16.0278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c68264db-947f-4476-8b2f-08da3e3a8977
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5143
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 May 2022 10:37:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97266

U29ycnksIGZvcmdvdCB0byBzYXkgdGhhdCB0aGlzIHNlcmllcyBkZXBlbmRzIG9uIGEgcGF0Y2gg
SeKAmXZlIHNlbnQgZm9yIG9lLWNvcmUgKHRvIGFkZCBwbHVnZ3ktbmF0aXZlKS4NCg0KUm9zcw0K
DQo+IE9uIDI0IE1heSAyMDIyLCBhdCAyMTozMiwgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4gd3JvdGU6DQo+IA0KPiBJdHMgZmFpbGluZyBZUCBjb21wYXQgY2hlY2tzIHNlZQ0KPiANCj4g
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy84
OC9idWlsZHMvMTc3OA0KPiANCj4gT24gVHVlLCBNYXkgMjQsIDIwMjIgYXQgNToxMiBBTSBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEhhdGNobGluZyBp
cyB0aGUgYnVpbGQgYmFja2VuZCB1c2VkIGJ5IHRoZSBIYXRjaCB0b29sLiAgQWRkIHRoZSByZWNp
cGUNCj4+IGFuZCBhIHBlcDUxNyBidWlsZCBjbGFzcy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+PiAtLS0NCj4+IG1ldGEtcHl0aG9u
L2NsYXNzZXMvcHl0aG9uX2hhdGNobGluZy5iYmNsYXNzICB8ICA1ICsrKysrDQo+PiAuLi4vcGFj
a2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtbWV0YS1weXRob24uYmIgfCAgMSArDQo+PiAuLi4vcHl0
aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMy4wLmJiICAgICAgICAgfCAyMSArKysrKysrKysrKysr
KysrKysrDQo+PiAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykNCj4+IGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9jbGFzc2VzL3B5dGhvbl9oYXRjaGxpbmcuYmJjbGFzcw0K
Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMy4wLmJiDQo+PiANCj4+IGRpZmYgLS1naXQgYS9tZXRhLXB5
dGhvbi9jbGFzc2VzL3B5dGhvbl9oYXRjaGxpbmcuYmJjbGFzcyBiL21ldGEtcHl0aG9uL2NsYXNz
ZXMvcHl0aG9uX2hhdGNobGluZy5iYmNsYXNzDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4g
aW5kZXggMDAwMDAwMDAwMC4uYjNjYmUyMzYwMQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIv
bWV0YS1weXRob24vY2xhc3Nlcy9weXRob25faGF0Y2hsaW5nLmJiY2xhc3MNCj4+IEBAIC0wLDAg
KzEsNSBAQA0KPj4gK2luaGVyaXQgcHl0aG9uX3BlcDUxNyBweXRob24zbmF0aXZlIHB5dGhvbjMt
ZGlyIHNldHVwdG9vbHMzLWJhc2UNCj4+ICsNCj4+ICtERVBFTkRTICs9ICJweXRob24zLWhhdGNo
bGluZy1uYXRpdmUiDQo+PiArDQo+PiArUEVQNTE3X0JVSUxEX0FQSSA9ICJoYXRjaGxpbmcuYnVp
bGQiDQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91
cHMvcGFja2FnZWdyb3VwLW1ldGEtcHl0aG9uLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1jb3Jl
L3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLW1ldGEtcHl0aG9uLmJiDQo+PiBpbmRleCAyZmNm
MzQyNjBjLi44MGVjMDcyMGZkIDEwMDY0NA0KPj4gLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1j
b3JlL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLW1ldGEtcHl0aG9uLmJiDQo+PiArKysgYi9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtbWV0YS1w
eXRob24uYmINCj4+IEBAIC0xNjgsNiArMTY4LDcgQEAgUkRFUEVORFM6cGFja2FnZWdyb3VwLW1l
dGEtcHl0aG9uMyA9ICJcDQo+PiAgICAgcHl0aG9uMy1oMTEgXA0KPj4gICAgIHB5dGhvbjMtaDIg
XA0KPj4gICAgIHB5dGhvbjMtaDVweSBcDQo+PiArICAgIHB5dGhvbjMtaGF0Y2hsaW5nIFwNCj4+
ICAgICBweXRob24zLWhhdmVyc2luZSBcDQo+PiAgICAgcHl0aG9uMy1ocGFjayBcDQo+PiAgICAg
cHl0aG9uMy1odG1sMnRleHQgXA0KPj4gZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMy4wLmJiIGIvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4zLjAuYmINCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi5hNjU1MGE5NzMyDQo+PiAt
LS0gL2Rldi9udWxsDQo+PiArKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjMuMC5iYg0KPj4gQEAgLTAsMCArMSwyMSBAQA0KPj4gK1NV
TU1BUlkgPSAiVGhlIGV4dGVuc2libGUsIHN0YW5kYXJkcyBjb21wbGlhbnQgYnVpbGQgYmFja2Vu
ZCB1c2VkIGJ5IEhhdGNoIg0KPj4gK0hPTUVQQUdFID0gImh0dHBzOi8vaGF0Y2gucHlwYS5pby9s
YXRlc3QvIg0KPj4gK0xJQ0VOU0UgPSAiTUlUIg0KPj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UudHh0O21kNT1jYmUyZmQzM2ZjOTI5NzY5MjgxMmZjOTRiN2QyN2ZkOSINCj4+
ICsNCj4+ICtpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZw0KPj4gKw0KPj4gK0RFUEVORFMg
Kz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2ZSBweXRob24zLXRvbWxpLW5hdGl2ZSBweXRob24zLXBh
dGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0aG9uMy1lZGl0YWJsZXMt
bmF0aXZlIg0KPj4gK0RFUEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRob24zLWhhdGNo
bGluZy1uYXRpdmUiDQo+PiArDQo+PiArU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE0MDFkNDVkM2Rk
NmE1OTEwZjY0ZDUzOWFjYWE5NDM0ODZkNWU4YjdkZGExYTk3ZjJiMDA0MGZkZGRjNWI4NWUiDQo+
PiArDQo+PiArIyBVbnRpbCB3ZSBoYXZlIGEgcHJvcGVyIHRvb2wgdG8gaW52b2tlIFBFUDUxNyBi
dWlsZHMsIGhhdGNobGluZyBjYW4ndA0KPj4gKyMgYm9vdHN0cmFwIGl0c2VsZiBhdXRvbWF0aWNh
bGx5Lg0KPj4gK1BFUDUxN19CVUlMRF9BUEkgPSAiaGF0Y2hsaW5nLm91cm9ib3JvcyINCj4+ICsN
Cj4+ICtkb19jb21waWxlOnByZXBlbmQoKSB7DQo+PiArICAgIGV4cG9ydCBQWVRIT05QQVRIPXNy
Yw0KPj4gK30NCj4+ICsNCj4+ICtCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiDQo+
PiAtLQ0KPj4gMi4yNS4xDQo+PiANCj4+IA0KPj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4+
IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPj4g
Vmlldy9SZXBseSBPbmxpbmUgKCM5NzI0Nik6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzk3MjQ2DQo+PiBNdXRlIFRoaXMgVG9waWM6
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85MTMwOTUwMC8xOTk3OTE0DQo+PiBH
cm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtZGV2ZWwvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQoNCg==

