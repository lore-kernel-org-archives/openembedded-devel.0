Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7E2C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 16:43:55 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.53])
 by mx.groups.io with SMTP id smtpd.web08.786.1668012232901360665
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 08:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=p31Vv/Z0;
 spf=pass (domain: arm.com, ip: 40.107.13.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b1iuaKPtdz9bAdxaIIe2qYEVu9YEbH/zblNSRk32ZuLxvWHvKThXLAizg/z6vbH3PocT6zZ2Y9ng8bB/g9sWaK+XAlNGS9/m/Gf6QR2wtA05VkRkMtCF8qY8XqDmMZzcGU8tTe8sncbZ8AbOdQEvrBf2d/nUSuqWDE5t5FGB4UaPk39iMOEY3oqdcn3WS8fYR0NDIhLRlErExS1sP3sv4mWBVHNFRkdBFyRLwK+yKWA2GrzlsuduP0N3ZLpyPdcycgjaJJw2JIIYgjRTVIOBLIuQ5jHrfcuXEhNHXEu/zeHiublypQiVTEWAoCEHuQw3X7dwERNpScrpg43wCd387g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PJ26aLTJUQdPQubxjKb4mrYosfRuq3MZQY2Dd6bmMM=;
 b=HQSAeV4UXk4rnWPTIq+tDWb/b+AUdKV3TY0v12sAL8g75uQfmIXmGbJEtWg3MCvC0pVKqrZrI2F2knDhCrOJqu7jO8mKMWp56nCvubeurdgtVBepwGOvgfX9j3MaAnHzNK3dh9J8vDXOO7300ow+t77bQxB4vGI19bz+vy4qHg5/0rSzxjK38IrG3oIxtJGQkTGBQIH27RSFMNMugrvkYgZaIKTU/lZtRaM16SQNsQxDCSfMbocrbTur8E3FKXSCQMUCXSer/mBxb/KSKei2e+qSmfEQPOsLNwqQcOuvnHh0k652dMLiDkdN3BbmWqIoTprM/Kqz7lUGjjptaDDEIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PJ26aLTJUQdPQubxjKb4mrYosfRuq3MZQY2Dd6bmMM=;
 b=p31Vv/Z0ueL3Yv1URYeOAo3k4IKokJMterlVM4rB5fUeVfXR+Hyrc0Mhi/3G8KVyCfz97njd7fD84d04BSxxQW+ZNokmbga9TU51Dzv2M9Vs6gA+z4oNVo30XXhJo54MSrQVZ3nI+8mCt2KcplDS1kfUwkQAP3/6AFcFuKGZHtw=
Received: from DU2PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:10:3b::18)
 by PAXPR08MB6606.eurprd08.prod.outlook.com (2603:10a6:102:157::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 16:43:48 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::aa) by DU2PR04CA0013.outlook.office365.com
 (2603:10a6:10:3b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Wed, 9 Nov 2022 16:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 16:43:48 +0000
Received: ("Tessian outbound 6c699027a257:v130"); Wed, 09 Nov 2022 16:43:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba57d709b505bbce
X-CR-MTA-TID: 64aa7808
Received: from a17335507c36.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ACDA9535-4351-4FDA-8789-BEBC1567452B.1;
	Wed, 09 Nov 2022 16:43:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a17335507c36.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 09 Nov 2022 16:43:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8WEeI4t3LS3YbpEdUXxcUI5kPXrObGFkwIXgxiN/uJLvCeXZ29CB4o8C/qymYbJ0qdEmtZ8XJMPSJv9JXo1QpIbRNysqicb+finbvoDTk9NOgPITy2W2362YEtQa01jtCRphiR3CNFNtyxqh7YmT3YjzGxJWu4mBq0MaZW/oYZ12Ryfw+793uu9pYN8n/Y3QjNh/wU2sIUsXd0d7uoP0554upY9cVpY/mplBdRNjhkeOeqKDozrYXe//15lBKd2rsFSm6m5QDs2QAnB+mZAkSq4PCDsuJ2z4JO4u6MDOBr4GLK2YhMg2AfvL5JICScHLYL3kfopjKHbJrhi+yTXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PJ26aLTJUQdPQubxjKb4mrYosfRuq3MZQY2Dd6bmMM=;
 b=JOiCwhXceglf8F24tUUrjLGCKLWLz+b04cJ8nicWzGKONGCrY3w9hfqFSb0PGaF/YnEjbPZhtuxBFwb6UVlfu9N0/2AWWjWWuU4FbGVq7N4k6X+wHe8xcBcs7KXg6vfq+q72l7AYTNIBXih/hziWrYEJgfVHRb1Dzoc7a7Wl8CGNNMhjOP16FvCzE+iJGwvVWecrYcMguvZJReVslu5RAupNFs8nSTqu1cPJuXJyMnRF3FMXu3DHZMv50AKXOIJhpozaD4j3mvlgx6DomIB0EvplmzggEbd8UzToRhWARQfMt1hhHaViZFcn7jU7QedmE2Dl2IKShZq7BGBeQQR4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PJ26aLTJUQdPQubxjKb4mrYosfRuq3MZQY2Dd6bmMM=;
 b=p31Vv/Z0ueL3Yv1URYeOAo3k4IKokJMterlVM4rB5fUeVfXR+Hyrc0Mhi/3G8KVyCfz97njd7fD84d04BSxxQW+ZNokmbga9TU51Dzv2M9Vs6gA+z4oNVo30XXhJo54MSrQVZ3nI+8mCt2KcplDS1kfUwkQAP3/6AFcFuKGZHtw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6707.eurprd08.prod.outlook.com (2603:10a6:20b:305::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 16:43:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%4]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 16:43:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native and nativesdk
Thread-Topic: [oe] [meta-oe][PATCH] hwdata: allow to build native and
 nativesdk
Thread-Index: AQHY9B7Gyuz6ptEObUC3T3flD/vmxa42iwiAgAAO0kqAAA4zgIAAGMaAgAALuAA=
Date: Wed, 9 Nov 2022 16:43:40 +0000
Message-ID: <6DDF75A0-A98E-4E64-A718-87232BE33CDD@arm.com>
References: <20221109093534.2718027-1-f_l_k@t-online.de>
 <D7B0F690-42BF-4D57-9A34-FB8650CBB7C7@arm.com>
 <1725ECAD7BE80329.32043@lists.openembedded.org>
 <C123LR.D2SJ40BPAVYN@t-online.de>
 <9CE090EB-662D-4CCB-B3EC-D103E13575FA@arm.com>
 <JI83LR.6DI8KX778AKI@t-online.de>
In-Reply-To: <JI83LR.6DI8KX778AKI@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6707:EE_|DBAEUR03FT026:EE_|PAXPR08MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: b05e2b21-d8f8-4740-3a84-08dac2719342
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uTv1ee103po8l6UYYYoYFXH2K+JK1DZUx2Ieb8VUoBRw/uv24DDOZKrDuACOmEM2IzqDxxc6UsRD+OKiSlS5Ne1CG88b4fOw7CUC9pPOE5At2DU6bL5e650eaG5IjFs2JVPX9jxp8wUAYa5dRmNqFAfH3KEZt+E2OpUNkEMIzZBiilrPmbCi70Ae9OoaiUnbmFKTUILuieGNo8D9vMQX2tKlvMXSyqvubp5+ne5aLBsQHD0IafBtCGB3gRIaCmmSiRSA89YCzw6hbJn7sIiu3XDe2IRTXjndKMvQJKWFKdtFnRZh1eQU6JA5WabOGveJvu/6bDUO7p2xMgzRxpcGfkyO7MzpbaebDvmpdoDL/fw4p9ra0DX69qaiC4i5me82Jwe7Pmwxb0K+kUDQd+R4NKFS5d9RTDURdbqz1Y0/Xj7c05X6Bd40ajZ25Z/XLs6beFcpHM3QaXUf4Rv5g2uLKeW1s4UP2hRjm/e3SP1J9Ro9JnmB79ov7a/e4dUJcCMRgYfb28MJOyEO+djUQWvtc8Y3xZfotRu3hnaw+mjJSTp1ytV/NzuH1fS729HBv+N2VWEXEatQEb1fBVptFXhtiREfd/gaD2eza39sgpxvRw2/b6vsOL++ko6OPfSqbbmxj2vZDABLXZF6dMmUOON+HGxgRiv7b9cCOJs0tD1653pJHXFAgUZINLZUksKePGWLMwywFUTEgxM5TeAYH+OuKVgq/3B7o/vqlcF6DM3M866rJLKQ5xlj9Z1RY01g4UP8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(2906002)(53546011)(66476007)(36756003)(38100700002)(91956017)(76116006)(64756008)(26005)(6506007)(6512007)(8676002)(186003)(2616005)(4326008)(66556008)(66446008)(66946007)(33656002)(316002)(86362001)(38070700005)(6916009)(8936002)(5660300002)(71200400001)(4744005)(966005)(6486002)(478600001)(122000001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D8078F6FAF00E40980752B9153302A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6707
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ee03aded-d61b-46c5-f5a9-08dac2718e4d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EzCntFV7MRhQXIsg2mAkCqXNKgx40la6BfIoEj8/essoZAU6gMsGKEzCuHuiQvkF71855aI2N9GfbSwv4uCurOT+Hdlo8d9+QRKDZCuUKgNII6xnwjviKpiKEMwPlzrBUVphA0Qrz9zTfRe7/Zz7DNDTWcl56uDHeJIWBvJKOcn0bpXcYjP7rk2TPDb0sPH8LU3HoXcPUxjKqgiGVC3LJnBkQE99pkSkd8GpNDQ5P90RT0nLkavvY+plmt/fJXmdJGKjxwKFMYEV1lKrgOzeLXzHHhpAuhUmcHN+MYofSbhPG5btnB+pB/sY3TaMAIyeUV7oLHLz7z1BNhX4YlJhbVDjewpaajlgzt19pP8c8dqwGqC3ktrHnIEspEL3oNXmk05ztChC2w13EotkcuftdWJ7AcQc+aF6U+rxRvDhZi3HeD+04ypL/rjy82jG5hRNRRdzPitN0dmT1LeCRBDrpifWvyn/+dk2YW4iPgOf/b5BFMGsT2tVHCwn3Y+mekPlrfkMXjYGHStJzGo7cN+itokVFD2Bs1fvxKm/Vyqn9leyUVJBXY38sl74ZGw8A4LLX1hNb3fV1eQ/4C9ZSJkehvQy6uv3w/uDfVukcQ7CCsiI6E6+M5xYKHbvctLE7YcXjIEenUtLlap+CANubx0IND4tiR6kkS4FhFHhn6rgL77m2k2Vm6bf5GJJyocYuSQ3rNubqH9DHCh2eMmU7ERzNoJ14CVjJAI5Piwh439/UPc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(86362001)(36756003)(40480700001)(40460700003)(33656002)(356005)(81166007)(82310400005)(336012)(186003)(316002)(47076005)(2616005)(26005)(6506007)(6512007)(53546011)(478600001)(6486002)(966005)(5660300002)(41300700001)(83380400001)(6862004)(8936002)(70206006)(70586007)(36860700001)(4326008)(2906002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 16:43:48.4030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b05e2b21-d8f8-4740-3a84-08dac2719342
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6606
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 16:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99501

DQoNCj4gT24gOSBOb3YgMjAyMiwgYXQgMTY6MDEsIE1hcmt1cyBWb2xrIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxmX2xfaz10LW9ubGluZS5kZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+IEF0IGxlYXN0IHRoZXkgaGF2ZSBhIHBvaW50IGZvciBjb3JyZWN0bmVzcyBi
eSBjYWxsaW5nIGl0IGJ1aWxkLWRlcGVuZGVuY3kgaW5zdGVhZCBvZiBydW50aW1lLWRlcGVuZGVu
Y3kuDQo+IA0KPiBJIHRha2UgeW91ciBwb2ludCB0aGF0IHRoaXMgZGlmZmVyZW5jZSBzaG91bGRu
J3QgbWF0dGVyIGJlY2F1c2UgaHdkYXRhIGlzIGFsbGFyY2gsIGJ1dCBzaW1wbHkgcmVtb3Zpbmcg
J25hdGl2ZTogdHJ1ZScNCj4gZG9lcyBub3QgZml4IHRoZSBwcm9ibGVtLiBod2RhdGEgd2lsbCB0
aGVuIGJlIGZvdW5kLCBidXQgdGhlIGNvcnJlY3QgdmFsdWUgd2lsbCBub3QgYmUgcmVhZCBoZXJl
OiANCj4gaHdkYXRhX2RpciA9IGh3ZGF0YS5nZXRfdmFyaWFibGUocGtnY29uZmlnOiAncGtnZGF0
YWRpcicpDQo+IA0KPiANCj4gfCBSdW4tdGltZSBkZXBlbmRlbmN5IGh3ZGF0YSBmb3VuZDogWUVT
IDAuMzY0DQo+IHwgDQo+IHwgLi4vZ2l0L2JhY2tlbmQvZHJtL21lc29uLmJ1aWxkOjQ6MTogRVJS
T1I6IEZpbGUgL3Vzci9zaGFyZS9od2RhdGEvcG5wLmlkcyBkb2VzIG5vdCBleGlzdC4NCg0KVGhl
IHByb2JsZW0gaGVyZSBpcyB0aGF0IHlvdSdyZSB1c2luZyBhIHRhcmdldCBwYXRoIG9uIHRoZSBo
b3N0LCBwa2djb25maWcganVzdCB0cmVhdHMgdmFyaWFibGVzIGFyZSBsaXRlcmFsIHN0cmluZ3Mg
YW5kIGRvZXNu4oCZdCBkbyBhbnkgc3lzcm9vdCBwcm9jZXNzaW5nIG9uIHRoZW0uDQoNCndheWxh
bmQtcHJvdG9jb2xzIGRvZXMgdGhlIHJpZ2h0IHRoaW5nIGFuZCBwdXRzIHRoZSBzeXNyb290IGlu
IHRoZSBwa2dkYXRhZGlyOg0KDQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFu
ZC93YXlsYW5kLXByb3RvY29scy8tL2Jsb2IvbWFpbi93YXlsYW5kLXByb3RvY29scy5wYy5pbg0K
DQp3bHJvb3RzIHNob3VsZCBkbyB0aGlzIHRvby4NCg0KUm9zcw==

