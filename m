Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1431EECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:46:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web09.4869.1666954014578401966
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Oct 2022 03:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PXoOLZi4;
 spf=pass (domain: arm.com, ip: 40.107.6.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dOUr4Lg7m/+HZ7832BUlWjf371UosUn3YDZ7FAD6+VKompTJiiwgnkhNa3NczhobKI+hvxty/ima85fuDpjDQsKIaCTlCeoPCRIv30Ky+hlb+fHPVZwyZ9CxnooCYSidVWMbJEeDp9rVE+QOykcS8zMBCmvVWMz5CnARipBAdpZ0KJjir2fYllXDiv4veMmxYkcRsOlXrS2uSi1Kqa3Fix86BX60RakXvPdJMZl62oTWdcUUiII2H7Z4NrgQePZzbZhY2roqC/6qeDx3HkYsEMb8Eg6Vl8uaTSLOBz+y7YrFHOY5xPmV6Q6yoVNdtBFhFbWZ+CS8asCTjmSySs/TJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aify+NSHGu9XbXR7qwca3FkrNexYI5nFMMkYDaXUUM0=;
 b=k5RjzHtnl0/ROXNApWLY5Su5ygpHVSojW7P9W2r9UnMRdu3iZEhoc/Acg9q4rqiZwtvNHb1MRcAqKwZ9WqvTB1Rf2yf57uNaJPYUoG7MhFDsyj3+IDzhg6EqtW4if/xYaYeqr0/3ainTD0njKXix3/zXTBKLPNTJ6XGg6nW1j27cM/HKUfGunbae32u6ly8v5r7/9KPqeP4n70G1yCjDHGE0635q8ofGrl6cZ1MHfZxKOFyUQNg90m0vCkaAu5lRlYXHq1LLLNMzHGwl/5S6d+McOwNlYh20L3XYAADb+qP/iDJv5dDu2pCHZja/4jTJLX9uqWEymOAdgRpIY0Aqkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aify+NSHGu9XbXR7qwca3FkrNexYI5nFMMkYDaXUUM0=;
 b=PXoOLZi4GBEnQVqi3iAUEv1lWdyy/iV2MQXETgFXZISkXMU3jkuU1T/MEPnjzoKTXpSlUkig4hQYPPUKDf+iJ4Ztg0jnMuD0S43RArzp3tgcaoe7gIkHYLop6py2TyWB5ZUwuK5v+q2ooW3CZfAP7b6whlPtR4c3drbrU17aXR8=
Received: from DB6PR0301CA0067.eurprd03.prod.outlook.com (2603:10a6:6:30::14)
 by PAXPR08MB7318.eurprd08.prod.outlook.com (2603:10a6:102:231::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 10:46:51 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::d0) by DB6PR0301CA0067.outlook.office365.com
 (2603:10a6:6:30::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 10:46:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 10:46:50 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Fri, 28 Oct 2022 10:46:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ab2777ae10b7d22
X-CR-MTA-TID: 64aa7808
Received: from df866c0e21fb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 37FEEB4C-1661-4CC4-95EB-B62F3DFC9516.1;
	Fri, 28 Oct 2022 10:46:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df866c0e21fb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Oct 2022 10:46:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTtKOoD3fscWHzbukxEYDx4+KPOBs8Ty/flqH0LErVP5AgCfhCFBelXqKDT0mXgfB2ax+3xIzXqBpZEMy8H0bJDRlw+Q6q/bsF3HjYrJWH2QCqSb8kN8u5HT4RgSd6qMFdPbxnJRNDrB/9h3E2gsTK/8KETAwd4e2yUFeh6uNpIRWU0JWKrDxsDaa8/jrURyKANzyyGCMa4m2rRTKA/W2yVQvuK0+SlRmSUKo+gywS9bxxv8ObdNeyS/b/06oIJtquI+oWUvm9dldHQLlhhBrNSq1LXy/MXoj9vzDq/aoGe76Ka8UA3LNH5/sdLU6FIprnxO10NaCRbgsdRjNP5BlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aify+NSHGu9XbXR7qwca3FkrNexYI5nFMMkYDaXUUM0=;
 b=NpJzisC/SnHV7YxUKLuARVrlUtOuLmiedlMRHfXgFKapUB3fdHojbLBrz/j2W0PrWMupYkXL9cKCo6YAqHt/yB9nsc+ogy5isYn8m6y5PZaMXAiqMeaz0otNQ9D2ox6Mvc0s1gHSA8WN3WX00ZrmsFbHBnLLkNwkPaNGNUK890ugeEYx4jKORbkJsU72693ZO5AaJ7BnrUgTMzPTuULG5MfJCEac1D9cbjuYy7wVekpN+aNmhwoSM83L3p4mq0sITUuLLWNAmBOFxWSvY9yu5MSfFMbdz3QLSZ7mu1diPJU0KokVSkcoR/PUW1LO3vxfXEgRQfjJ8JnTtMEJS1rbWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aify+NSHGu9XbXR7qwca3FkrNexYI5nFMMkYDaXUUM0=;
 b=PXoOLZi4GBEnQVqi3iAUEv1lWdyy/iV2MQXETgFXZISkXMU3jkuU1T/MEPnjzoKTXpSlUkig4hQYPPUKDf+iJ4Ztg0jnMuD0S43RArzp3tgcaoe7gIkHYLop6py2TyWB5ZUwuK5v+q2ooW3CZfAP7b6whlPtR4c3drbrU17aXR8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5510.eurprd08.prod.outlook.com (2603:10a6:20b:109::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 10:46:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 10:46:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 1/2] cpputest: allow empty main package
Thread-Topic: [oe] [meta-oe][PATCH 1/2] cpputest: allow empty main package
Thread-Index: AQHY6qT3ZgEU39fg5EKyuZWMrFoKJK4jn8qA
Date: Fri, 28 Oct 2022 10:46:33 +0000
Message-ID: <3A2D2EBD-7D1C-4F51-8625-D3EB7426D173@arm.com>
References: <20221028081134.15749-1-peter.marko@siemens.com>
In-Reply-To: <20221028081134.15749-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5510:EE_|DBAEUR03FT058:EE_|PAXPR08MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: aec5a4ed-6c60-41ff-5e9f-08dab8d1b85e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 u7hj8VZBxy1FomkGP5IPMxyPM7Cv93xPBq0vdQm8jvOdsH09Z8xehfo6hh5Gvcnm4Wb9C4GjZmVPdr3wpqOzjIA/vIUt4h0afbWJNsVZCwIGNdl/zcPxElqgPaKbuwU4WdtKzyn2uxf+8sAlg/kjEAL77eZoYvyEIvplK7/4kh5OJLDcCaohEpyX57SdFJoZlZ2qCLkbzu5vzgxLBEcIhjvDfmzZbbC6jup58UadNPmbMY2I3aO+yCTBw91U8I4JEKBTFHl6H5qd/myGQfGZt0JStdTpFeig06wKb+zMtR9fNfcIXJh3eprkpi3sW9Mt5amAnXdspOcfwqxQhpqkrPVZcLP43xd/tMqsPY5aTvg/pBS4XjAFEYUV5DaZ9whclXl/GcXBDmcQClw4pkiUU5Ec+DiVXqJkPUACYH8qOXQLWt5MpJRk0I5pQhqNAje4DPV+4tB7Q/RW+Pgslz3/FTFc20yZnv2mbVGTCE48Q9yMXAlbBKfBCaM3IuJJL757F3r2rynabzds9BbwU0lsERuqmboVDUhmNjt61ZTSFkMdr6WfTu9akurWp8vYemTiEwgS5QRMtQKxM4JPc4glaQj+AjwX1WgvzSGKwTAKUIKmQnjFl/sJChy3Vb2C9F01+joiGtDS2yiJPvZbM6zgJ4VzWrii6R1rXVw4HItFwjEXcX31VXcFDmEJ/lR/zprVQ1X4nwqceSN4TrC8/ve0pxy/ZfSN1dnVCOMnXAmkU9C79NbhTkNVDC3QUAP20vvd66bTP6XL/z4kPTsHIqA1zsBQ2uTaTLg4Iuz1+iDM03g=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(451199015)(36756003)(2906002)(64756008)(66556008)(6916009)(66446008)(38100700002)(38070700005)(122000001)(316002)(71200400001)(5660300002)(4744005)(8936002)(41300700001)(66476007)(91956017)(4326008)(33656002)(66946007)(76116006)(8676002)(186003)(2616005)(26005)(6506007)(53546011)(86362001)(478600001)(6486002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DFF6F3086A54E4D8456B70369A4BE32@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5510
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e25a7731-4b97-4d85-9198-08dab8d1ae0b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0zI0vux/8MLa2PI2ibiv+bZ6r/qYkPp7vCZuL/mqm+KckoQ2cV1s1YYUXqRbRTPcO7Bcr8F/kSCoiF+eKBp6sKsoyXIY04eUB9Tp6lrpAYzdvMwA2ij6fLDkEuDD6IitrNy8fTSeJhto77KJ1r3HHi5IaNNk/pywmCZhF0I9X7RG6gd0JsB5NEETCkgCnQAqQLmCytOn0wpvS+x74pTyeIq/5mDMdkWDis5jJugWTmVdAc7p4Oi+MFWx747tR5nZUqy5/gt5jn0hIZJzJMkHasvsNnC7hgAkFocriIhS2s0bOLxVs/ooxJl2WXHprqbnzz/3J1t2GyHIOIKjkKigApjEsdUZFstah/y3tRsNNVyHwb/cDi1f3nM9OjHRjDfwtRycXA0FJwCBcZX3u/sHwhzPy89SmpnEdw4Se7qpFp4z1tau/uIzEoZ6AugoCjc1IITOYqSUI/m7ZC0N2s1CDPAltkwiaqBeEeCnYAqwf9PVvkR0rOPlXk3BVqaZn7YOtGGp4xPOuge9Tb3DwzPy4tM60jeHZKrjMjZY68nq5ilpvVFs8zozK/dGR+71ntA3gxtSHnVl1c2MBlREV0taQkLffJt1cU8bON1Tdt2QrrR2apaUslMWTzDFh4yrbL0BM2AQ63rbI3FRd9tP9EQ1zSxDEeikBfCid1W0Zo3wy8IsJYTtyEtc1NR+bQFCf6VpyxXdDQ1fd6WQDzM9h2Yx0PhpQcEKC3N7pnraqwDghLR9D639G83oJbWi3byZYBymnRhsd7ikO/gr5l3BG/IWAw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(2906002)(47076005)(186003)(336012)(36860700001)(6512007)(82310400005)(2616005)(82740400003)(5660300002)(36756003)(316002)(6506007)(26005)(41300700001)(53546011)(70206006)(33656002)(356005)(70586007)(6862004)(86362001)(4744005)(8676002)(8936002)(478600001)(4326008)(40460700003)(40480700001)(6486002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 10:46:50.7058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aec5a4ed-6c60-41ff-5e9f-08dab8d1b85e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7318
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 10:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99330

T24gMjggT2N0IDIwMjIsIGF0IDA5OjExLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBpVGhlIG1haW4gcGFja2FnZSBpcyBlbXB0eSBzbyBpdCB3YXMgbm90IHBv
c3NpYmxlIHRvIGluc3RhbGwNCj4gIGRldiBwYWNrYWdlIHRvIHNkayBhcyBpdCBkZXBlbmRzIG9u
IG1haW4gcGFja2FnZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5t
YXJrb0BzaWVtZW5zLmNvbT4NCj4gLS0tDQo+IG1ldGEtb2UvcmVjaXBlcy10ZXN0L2NwcHV0ZXN0
L2NwcHV0ZXN0XzQuMC5iYiB8IDIgKysNCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy10ZXN0L2NwcHV0ZXN0L2NwcHV0
ZXN0XzQuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy10ZXN0L2NwcHV0ZXN0L2NwcHV0ZXN0XzQuMC5i
Yg0KPiBpbmRleCA5MjExNDNhNzQuLjUyYzAxZjQ0ZSAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9y
ZWNpcGVzLXRlc3QvY3BwdXRlc3QvY3BwdXRlc3RfNC4wLmJiDQo+ICsrKyBiL21ldGEtb2UvcmVj
aXBlcy10ZXN0L2NwcHV0ZXN0L2NwcHV0ZXN0XzQuMC5iYg0KPiBAQCAtMTgsNCArMTgsNiBAQCBF
WFRSQV9PRUNNQUtFID0gIi1ETE9OR0xPTkc9T04gXA0KPiAgICAgICAgICAgICAgICAgIC1ERVhU
RU5TSU9OUz1PRkYgXA0KPiAgICAgICAgICAgICAgICAgICINCj4gDQo+ICtBTExPV19FTVBUWTok
e1BOfSA9ICIxIg0KPiArDQoNCkJldHRlciB0byBzdG9wIHRoZSAtZGV2IHBhY2thZ2UgZGVwZW5k
aW5nIG9uIHRoZSBtYWluIHBhY2thZ2UuDQoNCllvdSBjYW4gc2V0IERFVl9QS0dfREVQRU5ERU5D
WT3igJzigJ0gdG8gbWFrZSB0aGF0IGRpc2FwcGVhci4NCg0KUm9zcw==

