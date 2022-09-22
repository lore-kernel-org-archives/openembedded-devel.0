Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66B0C54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 11:25:45 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.81])
 by mx.groups.io with SMTP id smtpd.web09.5994.1663845939561673687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 04:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=QoVwoR/+;
 spf=pass (domain: arm.com, ip: 40.107.2.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ki3eYLk2mBYGBlnSyFbIYDaPN0OBKGstP6kxrhBviPz5G7usJEYCj6s3JpkTXY/HHTERUCVz+sYXB0Rg2IRyOONMvBKTvQ7UHTlQLc5zDJkmNBcbbuN1u6Uo+UF6wa6SwON4irGrTjwtQSpJm5PPnxDL7W9II1s1ibkQtWpKnRnfS1BTNcDimS2Bjty7zFt37f2nkvn2Y+OIr/fQEMYtkxE/tU21v1rA3o9n/vvvDHCF2lQ1W+93bAqKN2CrEwJuVaWTMF0TsE0LtwxxoZHcwZv7IHsf6lnihwt+DMbKr5Qyx3+nfsvTZSFCmEwuooRt7+uOYsue3OlfCUaejUz4ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkTH28JQZz/IovuU3yq57mqOUzARVSw2uWN3dIz7tX0=;
 b=OvF3TxB0kg2aNPJyDvNKlOPess+DCTaNTVZJNDKR0Ti4nzZ5WQsBH+BmIdVOqBdHuL1SkTDE29/g+7bQIHxaGPHicvbOeH5y1gbIOcVFjtoNiI5+GqXP9POcqSyQqZvLEhslyPDzhiwSH0NN9EoSzSxLB+cx+AD5MuNCIwBs+ckFXs7sFOaq0XlCJ3MZW9QrqcfxDlZYFbxthP6SS3fzqLFV/adl3AjFbA/SEBivh4KX6DIzIQHjjMeKfavEYNNGYn48Nkp+yYFm1QV5I5YKOp5co8c75K+UwP1CO3sRDcPpu3tJ4uoJYAjiFT1tU3sptyxlw16gZxDSkFphu5STag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkTH28JQZz/IovuU3yq57mqOUzARVSw2uWN3dIz7tX0=;
 b=QoVwoR/+ea++j4VlQVTzb4e6b6+u0AXEuy0V/rhxyD5gCKIoyr6rZ+1FdiKZ5toQhXrFdywN5mDMJylgdvK9X+nnVUfss8+afSMiXFC+jm6PyRqL4zi7/kEt35iSo+Wqf0EYxM79rAxeSh9A/mrKFfSey/iu0Odd55l4Gf2mkVA=
Received: from DB8PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:10:110::39)
 by DB4PR08MB8101.eurprd08.prod.outlook.com (2603:10a6:10:387::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 11:25:35 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::3) by DB8PR04CA0029.outlook.office365.com
 (2603:10a6:10:110::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 11:25:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 11:25:35 +0000
Received: ("Tessian outbound ee41cdb23966:v124");
 Thu, 22 Sep 2022 11:25:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e7d778a390e2731
X-CR-MTA-TID: 64aa7808
Received: from 9856bbce3342.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70E46022-1882-43E7-89E6-41B9E45CFE52.1;
	Thu, 22 Sep 2022 11:25:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 9856bbce3342.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Sep 2022 11:25:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5GahFNmDoeM7fvbb2sIk4z3QhUFSAActqAUCzAfn+5pLLObQFpLwaoXVf0+NXTxqTFu2YdzBmKqi8BzAsm4S+Hhm4/y8cUvMGHPzR3RVAtma3Jv8xXrLR+znMDYy17Mxm46DX3knfPz/16opw5B+HBY7SyV2u8Ikf8ZCjex4SJRGfMC8vDsgZx+GUnfQLF4Uos6MLXNHWYhlh9o8hLri3M+R8NTOPFxp4aUbk9ZQvUX8eBZo5JMvkgXiKIwFVsWhfSfLbQTcX8Cosk5jbO1iuXO8WPDrTCkrgV2cSQjKwX72qqC0YsENwDY3RCwkPq/gm7skEIdR6HDzSiJItXxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkTH28JQZz/IovuU3yq57mqOUzARVSw2uWN3dIz7tX0=;
 b=NK0abpTFPEt3EXE2ILZXK+3TjXxT1gTn7Xp8F0DFJrQQjHLl/06yxpyGTb4+MYzmMWZ+TRASbM+JZAjI+IuChiPuaZPpg/JLVPWZ+2Kzl3no0nC0/kSXuZWgeQyYEiuEkAQS/obiHQdbCdwBWqqydJJZrY7Q5zRN8PQpXySSfpcLfwSKrazFUajpv2ig30coHjkFRzTpK7bAwZ2c7zRvAl4bRICwxhjnxfU648Eegub1tvl7iJ63b5mXVF7dYlSpVuqn+tg6+oE4VDhFgMcb9bb5bxwaUzP525tPN1YSBjeWhL9WCETnrm994+R+SsCPxE+Z85FoQt/UFLpKmb/z1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkTH28JQZz/IovuU3yq57mqOUzARVSw2uWN3dIz7tX0=;
 b=QoVwoR/+ea++j4VlQVTzb4e6b6+u0AXEuy0V/rhxyD5gCKIoyr6rZ+1FdiKZ5toQhXrFdywN5mDMJylgdvK9X+nnVUfss8+afSMiXFC+jm6PyRqL4zi7/kEt35iSo+Wqf0EYxM79rAxeSh9A/mrKFfSey/iu0Odd55l4Gf2mkVA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5825.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 11:25:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553%4]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 11:25:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mingli.yu@windriver.com" <mingli.yu@windriver.com>
CC: Khem Raj <raj.khem@gmail.com>,
	=?utf-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 1/2] mariadb: Use qemu to run cross-compiled
 binaries
Thread-Topic: [oe] [meta-oe][PATCH 1/2] mariadb: Use qemu to run
 cross-compiled binaries
Thread-Index: AQHYzlej+4oM4DZ+qkSMZqz4HaRy+K3rT1QA
Date: Thu, 22 Sep 2022 11:25:25 +0000
Message-ID: <647C21FD-1AD1-4955-AB61-C3C5195CC7CF@arm.com>
References: <20210706065549.187176-1-zboszor@gmail.com>
 <CAMKF1srZS52Vt+YRVi-7WCzYOjBWAJH3Cy8PZCc2B8XgTgO2Xw@mail.gmail.com>
 <a524ac55-d370-24e6-a7f7-9af76acd8de8@windriver.com>
In-Reply-To: <a524ac55-d370-24e6-a7f7-9af76acd8de8@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5825:EE_|DBAEUR03FT022:EE_|DB4PR08MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 27eee171-92b6-4b60-fc57-08da9c8d2b31
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 f9A08/urCTr5LQlJ19yQrpE6uabubjgZISnrHfr2X8pmMivfOLT0lIAFWuTaTBlfaWWaUAwhdPjF5pnb6HDIf7Tq8sezXN5ef4GJYP1Kyl2TmckIJexaxhGkx5LLUT6Rt7tQ/ZtLEBQ//pir3LPqqC/+U8vw5Lx/51Dutob8pKhq8cn93ZAMesSiqHUvqJEw8wem69v8W9HhNAW3MSn94B2V8GSxK8LWXqRwPiOwRsLUnGp3derMJLHP5B63BWSPqOAlgFqH3CmuKEQbA1zoV0NkpaKDWDq2oH8FkI//7jmGV4Zr4G/S1jFT8ofPj9SNndFghtujMtoBOG6cBmtVhEx7j7YHv6tlpEDXul0xxMt+dRGQbNoQm/AceE0Mz0Yhf5w5Vg9GvStk+dYXBZoJzkT8ofuB3QhnNZvK5D/tZSagKAZ0A47cqlVNuaD80oKC4kMgQnerr6plb6H/41c35znlGgrwIr0Mwo5A/cN+rSJUPMboRggGkcziQu1jFPyHHON/yslblHM52P6Zr3q8uazlhEwvJZKLYCtSG8YYqtxK2KufOxAnndr4RqXkGcxyPLlPQ/78vICmqRpsoOZmCTHwXAcY/t8rYq9I3YnUysB2ShpwKc3ry+Chdqr+NkwCX/VJL8RNqrMGuqEl5J65JJIvEyyTDT0omEMYYCYMVpVpSE6yRc86xLnMuZMq14aCWre3Cz06ylUfzpp7yIt3NfXtosTSDJk0NhqKwH4jNxqUr6q+B/LDsSQK/eg4nUf7pDuVGYQxm0YYMcIGm8COmQwlhtT1qUowe/7z36ByJEQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199015)(33656002)(36756003)(54906003)(316002)(6916009)(86362001)(38070700005)(4744005)(122000001)(6512007)(186003)(38100700002)(2616005)(71200400001)(6486002)(53546011)(76116006)(6506007)(66446008)(66946007)(66556008)(64756008)(66476007)(478600001)(8676002)(91956017)(26005)(4326008)(8936002)(41300700001)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <46FD5794F2845C43AA34E00900066D33@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5825
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f409523f-6f08-40ce-a071-08da9c8d251b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jqghl/0VMTxPUk33wXBNWQbHH1cyBhQCByAsdI6k+Oliw+wK8iT60/bDtcInALjzMeFfotRVtAIuh4x+Ld9HiGlleE2amAirp30SEpSsqVheXpCG/q27ZtGOz5YKPxaR4+YAAEpMuN+e5jORj8tox6nDhTOt4F0t4HMzDwY9/d22slLX5prIcaLPXg9GYqDO3wOG1DQ8nH+ekriK35L4Ge4koAmuX5HV1EwHf7z8so9uJpoEskNZO5O+MJj+q0G5K8kw7UbqRr4y7l9UExIs4QbotQdMdhjjPTH12U2m8fxo1pRPQrWkEDWuCosNTRvSyS5jzkRJX9MR7n1mAAlvlWJEw89J3+CXDQzZZdeUW9MyXOUOSC1Ea1GpuD0TBadCA6Qaq6k5nnIwHeuxcrBtUyipvSAQSR9fd5UP2YQIT2IU9c0lswyWJZfPiA8Sd3VfHhSCxvJ1q1OqQcPPA75SZR4ZpMty6zQUZTcY3lUgqrl+pl0u4XKFI9/jUyOtPrYWQoCDsXpwAzIyd/UThA1Ox75PyoExDihGn0fDvLZ4bbfcv/IPrazAZeKcSa2cJYeNClniMdeiNNReS8tG5Bk+mKsfmreECevOk6W0IaAzZ3yXJnfHUzpSkd/THBMD82jNml+BLEeGIlJfR5Qr2fBB5m8M8GgiAskJIs3nUYWXNYmnSmpHfOetxufHMCNuiGigHNYAc9qO0/90NULWkMINRh37sWxY8cfehfo8JHA8l9dH8lPvbQp1WS9mnK2Ckj+p067uVcQy6n+E2QfJ3mPYTw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(186003)(47076005)(2616005)(36756003)(336012)(2906002)(8676002)(4326008)(41300700001)(5660300002)(40460700003)(4744005)(6512007)(6862004)(82740400003)(26005)(8936002)(356005)(53546011)(6506007)(81166007)(86362001)(82310400005)(36860700001)(33656002)(40480700001)(316002)(54906003)(478600001)(6486002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 11:25:35.5364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 27eee171-92b6-4b60-fc57-08da9c8d2b31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 11:25:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98925

T24gMjIgU2VwIDIwMjIsIGF0IDA4OjQ3LCBZdSwgTWluZ2xpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxtaW5nbGkueXU9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gfCBJbGxlZ2FsIGluc3RydWN0aW9uIChjb3JlIGR1bXBlZCkNCg0KVGhpcyBpcyBf
ZXhhY3RseV8gd2h5IHVzaW5nIHFlbXUtdXNlciBpbiBhIGJ1aWxkIGlzIGEgX3RlcnJpYmxlXyBp
ZGVhLg0KDQpQbGVhc2UsIHNvbWVvbmUgcmV2ZXJ0IHRoaXMgcGF0Y2ggZnJvbSAyMDIxLiAgWWVz
LCBDTWFrZSBpcyB0ZXJyaWJsZSBhbmQgZG9lc27igJl0IHN1cHBvcnQgZWFzaWx5IGJ1aWxkaW5n
IG5hdGl2ZSB0b29scyBmb3IgdXNlIGF0IGJ1aWxkIHRpbWUsIHNvIHdlIG5lZWQgdG8gYnVpbGQg
YSBtaW5pYXR1cmUgbmF0aXZlIHBhY2thZ2Ugb3IgdG8gaGFuZC1jb21waWxlIHRoZSBiaW5hcmll
cyB3aGljaCBhcmUgbmVlZGVkLiBQbGVudHkgb2YgcHJpb3IgYXJ0IGFjcm9zcyBvZS1jb3JlIGZv
ciB0aG9zZS4NCg0KQm90aCBvZiB0aG9zZSBzb2x1dGlvbnMgYXJlIGJldHRlciB0aGFuIGJ1aWxk
aW5nIHRoZSBiaW5hcmllcyBmb3IgdGhlIHRhcmdldCBhbmQgdGhlbiBqdXN0IHNheWluZyBMT0wg
T0ggV0VMTCB3aGVuIHFlbXUgZG9lc27igJl0IHdvcmsuDQoNCk1pbmdsaeKAmXMgcHJvYmxlbSBp
cyBhbG1vc3QgY2VydGFpbmx5IHRoYXQgdGhlIHRhcmdldCB0dW5lIGlzIHVzaW5nIChyZWxhdGl2
ZWx5KSBuZXcgYW5kIHNoaW55IHg4NiBpbnN0cnVjdGlvbnMgKGZvciBleGFtcGxlLCBnbGliYyBs
aWtlcyB0byB1c2UgU1NFIHdoZW4gaXQgY2FuKSwgd2hpY2ggcWVtdS11c2VyIGNhbuKAmXQgZW11
bGF0ZS4NCg0KUm9zcw==

