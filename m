Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6ECC10F04
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 23:21:22 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.89])
 by mx.groups.io with SMTP id smtpd.web11.10140.1701386475873125922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 15:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1PMs2zJH;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1PMs2zJH;
 spf=pass (domain: arm.com, ip: 40.107.241.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NGrIwGObmX8V1HJrRfuq/zpDRKFAynB9BqIc8jIQ3FVdnDiGt22ES5ZorPyVwdGOlC0SmPI4ax7iKrQYuXwAv0WUBTknH309Lt+umj3iACatRiIv155pDR6DcByMw0JWikt8C1nQ2Sc5w8je6wZsa46dceXlUQMxY8/mYgDLe8KdHj0c49b1nF8AcbaM79OElRzjl+jsndBYxXnOsg+inLJK7ml4GGnStLO9YCF1Ah8bJ62UO88vKSW/VRMpq2A8xltjZgLcNB2pssFdAkBwmd4QGUqT8BuNwI9/yDWWxKWACsjOOqYfFT9p3/a9nTaKZ7Nb8sb6/NKq6XTSgvmzQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afiv0DBu3v8BSJ0+4AOnuLepMJIt3XDt5BQKmQ+w6i4=;
 b=X+NfKQoz4lYmV3AeANPYAv4ljvCqo+TibZN410H8KunsyktdZWR2X5DetmJAMhvRnp5Ps7pUMAyCyCT1pYtfA8wPi+92y2lOICVBvs+VtaQt86aOauQZn+iSZWyWBmzR9CE/4/IkvuVjo3+fuq2jnyulk6/HV8BkX5y6VHVZ/7NLo8Osf4sG/tw0qZmD/Cwc8+i6HyeXESG++rLA3lHLqwI8WJQRTOJzHCIHjTT9HaisypwHCn4GFI9Y31yYkE5M8pHsfe+XsSr6vVZmB3Ul1Yy4uCNalvUo5IhdUcktgURnIqU3myRarZr1W/IWWm+uqx+uX99UYoLQPAI7pUw8kw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afiv0DBu3v8BSJ0+4AOnuLepMJIt3XDt5BQKmQ+w6i4=;
 b=1PMs2zJHcVvmel4+9jBOsuRIomVFjztc8pVl/GShoKyi+94UkRcICuJG25PZPGlnkiWAptYyIFsITAyHMdoDcoCquTvVfzSXfd3Jar90OgtHuC6FbE9MGFi1HX6klUctiFVZyfPixrgbrxtc/CRFLpMVXvMwQ7cU1tA9tVm7GnU=
Received: from AS8P189CA0037.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::31)
 by GV1PR08MB7852.eurprd08.prod.outlook.com (2603:10a6:150:5f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 23:21:06 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:458:cafe::ce) by AS8P189CA0037.outlook.office365.com
 (2603:10a6:20b:458::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.26 via Frontend
 Transport; Thu, 30 Nov 2023 23:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 23:21:05 +0000
Received: ("Tessian outbound e243565b0037:v228"); Thu, 30 Nov 2023 23:21:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7e383f0a8082eff
X-CR-MTA-TID: 64aa7808
Received: from d088a0322416.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E25AA9F6-2F16-418F-B64A-EC2608655132.1;
	Thu, 30 Nov 2023 23:20:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d088a0322416.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Nov 2023 23:20:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+NXS4+7MVVIWPcpqbUYPJKeiJXpcwJC2FAoUgvb8W5PoirHtAfLvIYA2RPpYnFop5iM8m6klBtxsBbdX3Vgb1EY3B8Q3YrUf8OHPYuBSnMnMLSFu/fIeLT3c6msTAJVvzlTbxIDuDa7eXjH5Z+Au2MNdaYMJVYm3OUN9Ejy4jfyEtx//ohBRAO4FVgH2Y3+zQA/Y0hm2xg7eKWVQc4nLfGLMzVro8drVfBu4C9CkT9HSi89LnzbhEKWzOdb49XRaFHSW4xxasiLSG2Z+ybaxv1B5f2UKT3ATE6OdJ+K0KnQW5tQual4g/bu9IAiwrgBIVb4e5dB9DLFSyv1HXJcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afiv0DBu3v8BSJ0+4AOnuLepMJIt3XDt5BQKmQ+w6i4=;
 b=IA368vZ7xpbPgqikgPez/UN2o6tAOXwHgF4TebTCFohb6kH2fBJKYM+X4XZ61nZlJGzbul1KfBrYsqIIS9iPnGL2XGYlG7QZRB2mM2ZrjD8dBwPQMZu7z8/ougwe9+arS9DhVTzWuH+yT2UfW7nKVlbc2aaj/BEsICMG216nTPxJuB/gCGnCUUmvaSFzNyyrj67cVhGbPnQOpji2WZZg/ApckoBaiIK2jNF5PMUbSPU1WK3IkCH7TXcKJyOoz9pEmI9xF7y5xS3WqBFmsIm3hNQl852hM80V+N7fLh6J2LRsJfxjhtB5+6nhJ4o9FfO0rwAWWam4Y36tf4V+KaK3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afiv0DBu3v8BSJ0+4AOnuLepMJIt3XDt5BQKmQ+w6i4=;
 b=1PMs2zJHcVvmel4+9jBOsuRIomVFjztc8pVl/GShoKyi+94UkRcICuJG25PZPGlnkiWAptYyIFsITAyHMdoDcoCquTvVfzSXfd3Jar90OgtHuC6FbE9MGFi1HX6klUctiFVZyfPixrgbrxtc/CRFLpMVXvMwQ7cU1tA9tVm7GnU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8202.eurprd08.prod.outlook.com (2603:10a6:10:39d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 23:20:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 23:20:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libpwquality: upgrade 1.4.4 -> 1.4.5
Thread-Topic: [oe] [meta-oe][PATCH] libpwquality: upgrade 1.4.4 -> 1.4.5
Thread-Index: AQHaI9NNO1SfPA97Mkexc3KiRONXcLCTgAuA
Date: Thu, 30 Nov 2023 23:20:57 +0000
Message-ID: <8DB927BF-16D5-4A87-AA2E-D8FBC39C0A79@arm.com>
References: <20231130212143.3192153-1-alperyasinak1@gmail.com>
In-Reply-To: <20231130212143.3192153-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8202:EE_|AMS0EPF0000019D:EE_|GV1PR08MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 6508f9a6-85e4-49c8-2d69-08dbf1fb06e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TBZzjaCmT4V2uM7gubxskXfdwp5iNa5GyxRXFcPm4E9DfDGgWEkdhg5k2i9FWzzwc+zwT9nptW8Cm+EsaBj2LMrR33yCZuBsdUaFWg9kDtw8efXl4f3HinW5mm930MXy7Jn6ChQkkkW94puC3C39yLqhLFNNJ1Sha/OjdBYY/bpzjGJSPMRGtTq5G3uIVRoEolFAJZT3p0w7d3dufJWbc80+ac682i20fxi67kCk9qv/3bVADmZOeOc3bNkT1GTJkLmLhNl4p/i6ARXA5RTpI3CgvKpPmdBVRaNxAy2kSsHnD8MffgIzYVMYiZsW8YQ7092cYJIN4WTOywo8pxU6jUyyCnLQsfwtgQtxHik7ivSJUGFwS9zo1Wsig8aXg+yCOMrpUkyZk5L7TxAw2+lzfYic3igHCxRuvTdWxr/Bw7uIV3ELBmpJSvNewO3AfS5MVSlOPrgijzPdcmoYfUbn0lCrQafS8hIWtVDhCg2bP3nFVP5ZFpSO44CHrOPSlojfx+cz3sOXeu1rh9D6LD+EvIJ+zsLV1PVS4k6QYFK6RMp1aH/GtUV2jkKsO2ovlstRVbon3thzjr5PbnL1mraJA54ON51Kr+opTAOl4IQuWIsFUedd7Fp7+L2y7Xs5CnzQ0PhNTzXvLRn+5lVZzQXbig==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(71200400001)(64756008)(66446008)(66946007)(316002)(76116006)(66476007)(91956017)(66556008)(478600001)(6916009)(6486002)(5660300002)(41300700001)(38070700009)(36756003)(33656002)(2906002)(558084003)(8936002)(8676002)(86362001)(26005)(38100700002)(2616005)(122000001)(4326008)(6506007)(53546011)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB4797DDA4E79E4699800B58E92BC9E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8202
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9eae21a4-238d-45ec-426c-08dbf1fb01db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wOmTyg6P0NIeVXs0Yx4Xks5A0jDGMvR2bnHfpnYCcTAsI5ymLFqZtNwB+wYr78UNMfqoJ1807SIil3+sruwjZ6Z/hyGQx8+0exGIDBxCQAWlwYm1cxlsQWwBzgqEK+/4h0gag0o3XIo1oPR0lmONbkw5VucX7QzT+eSP4DPOgac45N++ym37BKe4KjTsKDEgEx/pPE9f+rGfnV5htYHJijBLbpRg+ApaU+HJoYD21dTQRJ82WsIuv+5RkoEo8ZnE3uXugNdkSnyP0F8ToVVj6k/R7CsaqueAltMJYF6drmdns8wID/manqBEGUQLdozHRxm1kVZVdUZWTIoue9PrAXLItGzyAaurvN5T8OYDR4TcDvbHK9x+yPNM/encbFq8SEpMtggARIvRfeTXmKcf5m/QPCiO/hQH4JxM5pfrG8oHuVeRqwchF2ttziJiSkVk0LQZZnQ0QiErmXMBU7tnpJn/AE/zC7CWJwvYlbaMqY6xv75VGvI52NKPtp20+JJI+BRJWW0NCkGb72TtAG8II7wk/PYYh2h2Gyr7+q0omhpTDD45lQeDbjhYozZXmJqj8Km31cPFspLeK14g8s8hhyDzWON1pMjv8KRcqBcjLGJGLRC0emNeMuHdQN1YSTBWNG2XegE1rSt7/mBsbQoKgwQZ3g1WUNjLTrrOlsQPd6+Q04egxWfzA9qreYcYUsM96U4y5sun3LUUUyiuFxcpDPEPEmLuKPVw+ORd/ck6X6+2Wrq5a9hES8uuhcorpDbT
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(451199024)(82310400011)(64100799003)(1800799012)(186009)(46966006)(40470700004)(36840700001)(40460700003)(2616005)(336012)(26005)(6506007)(6512007)(53546011)(8936002)(8676002)(6862004)(4326008)(316002)(86362001)(70586007)(6486002)(40480700001)(478600001)(70206006)(36860700001)(81166007)(356005)(47076005)(82740400003)(36756003)(33656002)(41300700001)(4744005)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 23:21:05.7463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6508f9a6-85e4-49c8-2d69-08dbf1fb06e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7852
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 23:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107180

T24gMzAgTm92IDIwMjMsIGF0IDIxOjIxLCBBbHBlciBBayB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8YWxwZXJ5YXNpbmFrMT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiAraW5oZXJpdCBhdXRvdG9vbHMtYnJva2Vuc2VwIGdldHRleHQgc2V0dXB0b29s
czMtYmFzZQ0KDQpJ4oCZZCBhbHNvIHRyeSB3aXRob3V0IC1icm9rZW5zZXAgYW5kIHNlZWluZyBp
ZiBpdCB3b3JrcyBub3cuIElmIGl0IHN0aWxsIGRvZXNu4oCZdCB0aGVuIGZpbGluZyBhIGJ1ZyB1
cHN0cmVhbSB3b3VsZCBiZSBzZW5zaWJsZS4NCg0KUm9zcw==

