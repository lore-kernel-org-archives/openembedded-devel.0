Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214E1C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 12:45:20 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.50])
 by mx.groups.io with SMTP id smtpd.web10.99440.1701780314497594580
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 04:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yYi0ZfC8;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yYi0ZfC8;
 spf=pass (domain: arm.com, ip: 40.107.241.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Q38wkrbeVas2UpBHCeogS+CqbtXcOsmjbTHv9FCVaQVyq334X7Dy5L9vQB3cVIPD0rlnyZfit/25F2Zmcwdl/NR7xZAULerUntnwMSWnUABzlE+tIomhZy0CeoEDOw9x1m4q9yw3hDYXEYdlp3jb9IvsqSQcX/JnaUDrLSuztUaCWP68cegd9xOBgHRsp4I8EN4pgciXnYmsMG1U6CV01IdkiKQgggzpPqDbOZ3oTTHCHl4GdaBNiO4Q/MkvWHs7LSDCtHDmV8/HxYzzC6GXjoZJ13oUyW6mSE55ceXIj5v3I6plEs7kd36j62wUYrbuDnOe0koMmxyn27Y514oFsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbPxECAtBIkfs2qxOZlzyVEgDwwYQsK93c7C0bg9JB8=;
 b=Fxzr0VVEnq0Hnbt76qTj3b5mzgRI/a1dxNxsT9PBftrNyPLMHo+Jz/54sMShmU3uBi0pIe5JNEl8eYj3tu+mX3daKowrg7DnrwJNHk/AkvIhh1nuLroBw70CUXKZsRz4087vCnFETLDQwDFFcMAhsD/iNUwF1bAs6RDcb3qv3GfrEqT2v8QutVZjlVxDFNDkLwasA2jCHqVga8Ftf9eybuEw0PE3CtWwfLTq9tRzoQUFmr12PLSXFJ938e0wDpB7R9Hb3+gK/5MZeRAFU+EDAYM2X1IjAr01NcsGUCzZTrgSX+w5qjbWa5KHLK6mKMaCIMFb6uELEZVQ9CwVrH4MTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbPxECAtBIkfs2qxOZlzyVEgDwwYQsK93c7C0bg9JB8=;
 b=yYi0ZfC8Ndkm2MfPO39punIRDhEXtVDXs3zEbqGR/iHxWaUcg07LcRTrVFEjNEr/IALpM+ZQBqgm8clYV40z57afCt8SzHGHNhEZQ67nzLKipyCmKgnuxuT7FUPQsFtGrvzzn1omvOTK8053i+BVZPVNljC0cH3jtC7g5T/7iJM=
Received: from AM6PR10CA0095.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::36)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 12:45:10 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:209:8c:cafe::45) by AM6PR10CA0095.outlook.office365.com
 (2603:10a6:209:8c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Tue, 5 Dec 2023 12:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 12:45:09 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Tue, 05 Dec 2023 12:45:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4575556da69175ab
X-CR-MTA-TID: 64aa7808
Received: from 8f70495a75b9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4A699F24-C52A-450E-BF8D-5BA9F7C0A2AC.1;
	Tue, 05 Dec 2023 12:45:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f70495a75b9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 05 Dec 2023 12:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zc+2vtNYHF8Z3FXTmYFrNw4iS5e1Wc5mys1IBi9r2dyY52RKzpwM3i3RvxLilIQSU1xMQ6FLsWkOVSzfqWMZ7FfC58QCMlv4/SZCAhr9NJo99MNVLuXJzS/aDlWOb5lfY8toMXF29NcHd5p9YRDLrriZF5DPWeZBE9bDC60HL4O4pQjqA5qXsREYza6T7i5M402f4CF5pNiXwyqaijx3Zwh+MiSbdLa6R9SUzVx9xK6BBKxZ9XpE9YUtjIsi0FHhMl1SMgQI9NPGr0HaZsj9+nmmQQRDPI54mrxsQQCdCbCVjLyDj8s9kSAjKwv4hS+pXrTKaAC0tyq9Di0OsDudXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbPxECAtBIkfs2qxOZlzyVEgDwwYQsK93c7C0bg9JB8=;
 b=fc5C7xZqe61xbkHnCQO/gJHHkcmMLV6w0ZOqZuwg35MDPAks1/s6LViZWLdDfwexSo+eyKemkXQiRFgdlDnzqeJFHte17xRd4QOm+F+qV/ECrjtzno6WxF/WrScJcI3SGSVgzMAZq8COUpxNo3hJwD2uNU/82cRcx+eCjTx4IC9dPhktaEGllD8MaefLqgPMD9TUkqsvm5lSbEV7O7QxhuHQhBR7fp5V17iL/2+7Giu2m5pIb775Nb9tchnXx5rp6KyAxIVyke+8VuzgZ9sXYglLBB9/KXeuLnGEnSOIW3I9MAlnQzDmWma33Tqnx+DWxJFX+uZjxcBWfgjGKxhcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbPxECAtBIkfs2qxOZlzyVEgDwwYQsK93c7C0bg9JB8=;
 b=yYi0ZfC8Ndkm2MfPO39punIRDhEXtVDXs3zEbqGR/iHxWaUcg07LcRTrVFEjNEr/IALpM+ZQBqgm8clYV40z57afCt8SzHGHNhEZQ67nzLKipyCmKgnuxuT7FUPQsFtGrvzzn1omvOTK8053i+BVZPVNljC0cH3jtC7g5T/7iJM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB8937.eurprd08.prod.outlook.com (2603:10a6:10:43c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 12:45:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 12:45:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: alper ak <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 4.1.1
Thread-Topic: [oe] [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 4.1.1
Thread-Index: AQHaJutyVC1ebH+Tz0eB/ug97A8uh7CZkOMAgAEQLICAAALDAA==
Date: Tue, 5 Dec 2023 12:44:59 +0000
Message-ID: <BF5E8EA3-C6DB-46A5-AF50-5FE7F1941536@arm.com>
References: <20231204195224.45946-1-alperyasinak1@gmail.com>
 <B6E6AE3E-3980-48FC-8E44-2863A20B1DEF@arm.com>
 <CAGpma=6mvgaY9yBR8skAEAw2PJ-i-OQ9OMCw5oyaL7PSh05HhQ@mail.gmail.com>
In-Reply-To: 
 <CAGpma=6mvgaY9yBR8skAEAw2PJ-i-OQ9OMCw5oyaL7PSh05HhQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB8937:EE_|AMS0EPF000001A8:EE_|AS8PR08MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f36cc3d-2a33-467b-9ef2-08dbf590042c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bWhrz9iFurrucqsE1C1CFOoRfwimZvWPBLtMxGV2nEx2UEsdAAt8rLuTBRwpryFry3LtofuZlJeSEtebFD1JHH2Obn+MRrnEuYKm/jWTdEUkmTR1eFLpZviSm3K9h+TxniL2gfFeq+sHJ7q/zPAWQ8zUdFsdrFS3J78naR0U7vvovHUeY4bcPV+w9rdJ6tqdaSpNAnOO+cV4zK0iD2gZ2CAQgT491LZoMwqvwDq1BHZcIJ5DuMsAKSlB0QY4fWJbzWh0V5Ma5WR/ig/UfZU70DmNZSr0zFyZ9jPbDF1/F/VxV0+gk38fhLt8asKXJxvd5LRNM02mRgGnMuagTUF+LHMJcvo5YIaUyW00YIZBLSSxhamvaAud3keGivdJDrh0EZbzVHhFk2Wpr6cMKTUiE2peZPRR4DXiNRNnR+S7Ue6owh+VOvH4B+RGVdD+vOqJlwSbfmHuoFqznu4hH4VnvpfM+XS/a+qZOCn/aEz9BTPtHLABoynEYmh2nJALpVRXLZZhJIAnI6tFkZZR3H4H6I9U44DwwyV9aaKBFoN5O+U1G8RA5bfbvezmQPPqj5Bf0ICE0xCyFu32EqQ+/LZ72S42Ng6m+434RfGiBaNe00bvHPoHfA2RBo9oapkWyuAIhdbR/BZUbWofO9MufsFRXKlvvOivHfco2lZtc1GTytInidhNSWxZt/JfPKb2xJuG
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(346002)(366004)(376002)(136003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(33656002)(2906002)(5660300002)(83380400001)(71200400001)(6512007)(53546011)(38070700009)(122000001)(26005)(6506007)(2616005)(36756003)(66946007)(478600001)(91956017)(76116006)(6486002)(41300700001)(64756008)(66446008)(66476007)(8676002)(4326008)(86362001)(8936002)(6916009)(66556008)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <18D217336C8C9E4EAB4559651FEC5CBD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8937
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	710d6eda-d6c9-4016-43c0-08dbf58ffe12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sJvzKVrRXw/N1Okd4HifZts5uhJ6CVxt5UIPtTL3yBervT9rGvPX12XbCgt7JRtOLvmlcBVdtcEZ3tDTN5QMYcj3qSxOU/xeUCl5i+0dil/W/DNKNTbVynu1NqRc3mbn6M87mzuaXpNmhLWnSYAAqCwYRtVn6VibI1tjxifo5+xuf6gmxKAhE8vRBWtCUyQOVyDEwxBDoGrRswXt4sFiQfRSLWouXjQlAdnbC9uE5/HxiwFO+uJi5Z6nz3JhkV6i3jIy7dslpwq4m51X/au/Bp6QVlCAr8uj48G/ODenhwc0RZbotUEFMg52zVgXKRe3COfFYi5OIxSoi81tYnvUV+I45V2swjOCvAnDSSbkV8Hw4ZLGQDWCr9twqd6FZgrGHrRzHMxKbYCvZrd6nNgyR50LzcuQg1wio7TnVRBrA3sy1k0FS5F0raC+xXFpw1IkAbrJ3skHiAf7SWJmrC9AV/tQlZx0JeLrBUS9F893HfTtR2ndBcWTo25eklu5xRwTjYJnRbRn+THDNDU9lHeUQKrVV570nNc9mMitZSfP9c1dFNjE+oAlhsPUfyyfifzL/mCBJeoESEYQdHEZ5QKhnWPBkTEokadpA02mlJKtGAUpYqEgAiS4Don32CX0ixLhdFgcFECnQISGmtkuSBWh+SoGoyrgP8ZkhQvupPzBzGohvY30rens/O31zlks9eG76y7deBus2svH1YDgNMJHJ3BEfHDdhk/jZ/oFGuP3ER7F5un3/lTqm+nLeoeCdP0YimYrQWPaovxBTH8yFqziYQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(36860700001)(40480700001)(6512007)(53546011)(6506007)(478600001)(6486002)(81166007)(356005)(70586007)(70206006)(316002)(26005)(2616005)(83380400001)(47076005)(6862004)(4326008)(8676002)(8936002)(336012)(82740400003)(40460700003)(5660300002)(33656002)(2906002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 12:45:09.6561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f36cc3d-2a33-467b-9ef2-08dbf590042c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 12:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107223

T24gNSBEZWMgMjAyMywgYXQgMTI6MzQsIGFscGVyIGFrIDxhbHBlcnlhc2luYWsxQGdtYWlsLmNv
bT4gd3JvdGU6DQo+IFRoZSByZWFzb24gSSBkZWxldGVkIGl0IGlzIGJlY2F1c2UgdGhlcmUgaXMg
YSBsaW5lIGluIENNYWtlTGlzdHMudHh0DQo+IGxpa2UgInNldChDTUFLRV9JTlNUQUxMX1JQQVRI
ICIke0NNQUtFX0lOU1RBTExfUFJFRklYfS9saWIiKSIgYW5kIHRoYXQNCj4gc2V0cyB0aGUgcnVu
cGF0aC4gSWYgImZvby5zbyIgaXMgbm90IHByZXNlbnQgaW4gdGhlIHJ1bnBhdGgsIGFzIGZhciBh
cw0KPiBJIGtub3csIGV2ZXJ5IHNoYXJlZCBsaWJyYXJ5IGlzIHNlYXJjaGVkIGluIHRoZSBmb2xs
b3dpbmcgbG9jYXRpb25zOg0KPiBycGF0aCAtPiBMRF9MSUJSQVJZX1BBVEggLT4gcnVucGF0aCAt
PiBsZC5zby5jb25mIC0+IC9saWIgYW5kIC91c3IvbGliDQo+IGJ5IGRlZmF1bHQuIEkgZG9uJ3Qg
dGhpbmsgdGhlcmUncyBhbnkgcG9pbnQgaW4gZGVsZXRpbmcgdGhlIHJ1bnBhdGguDQoNClR5cGlj
YWxseSB3ZSBkb27igJl0IGxpa2UgcnBhdGhzIGluIGJpbmFyaWVzIGF0IGFsbCwgdW5sZXNzIHRo
ZXJl4oCZcyBhIGdvb2QgcmVhc29uLiAgVGhlcmUgaXMgbG9naWMgaW4gdGhlcmUgdG8gb25seSBz
ZXQgdGhlIFJQQVRIcyBpZiB0aGUgdGFyZ2V0IGlzbuKAmXQgYSDigJxzeXN0ZW3igJ0gZGlyZWN0
b3J5LCBidXQgaWYgdGhlIHNhbml0eSBjaGVja2VyIGRpZG7igJl0IHN0YXJ0IHRocm93aW5nIHdh
cm5pbmdzIHRoZW4gbWF5YmUgdGhlIG5lZWQgZm9yIHRoZSBSUEFUSCByZW1vdmFsIGhhcyBnb25l
Lg0KDQo+IEkgdGhvdWdodCB0aGUgdXNlciBzaG91bGQga25vdyBldmVyeSBvcHRpb24uDQoNCk5v
OiBzb21lIHBhY2thZ2VzIGhhdmUgYSBfbG90XyBvZiBvcHRpb25zIGFuZCB3ZSBtYXkgd2FudCB0
aGVtIGFsd2F5cyBvbiBvciBhbHdheXMgb2ZmLCBvciBoYXZlIHdheXMgdG8gY29udHJvbCB0aGVt
IGltcGxpY2l0bHkgd2l0aG91dCBhbiBleHBsaWNpdCBQQUNLQUdFQ09ORklHLg0KDQo+ICJEb2Nz
IHNob3VsZCBiZSBndWFyZGVkDQo+IG9uIHRoZSBhcGktZG9jdW1lbnRhdGlvbiBESVNUUk9fRkVB
VFVSRSIsIEkgZG9uJ3QgdW5kZXJzdGFuZCBleGFjdGx5DQo+IHdoYXQgdGhpcyBtZWFucy4gDQoN
Ckxpa2UgdGhpcyAobWFkZSB1cCBleGFtcGxlKToNCg0KUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJi
LnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnYXBpLWRvY3VtZW50YXRpb24nLCDi
gJhkb2NzJywgJycsIGQpfeKAnQ0KUEFDS0FHRUNPTkZJR1tkb2NzXSA9IOKAnC1EZG9jcz10cnVl
LC1EZG9jcz1mYWxzZSxkb3h5Z2VuLW5hdGl2ZeKAnQ0KDQpDaGVlcnMsDQpSb3Nz

