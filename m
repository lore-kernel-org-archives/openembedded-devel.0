Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5937C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:35:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.70])
 by mx.groups.io with SMTP id smtpd.web11.9235.1699360498705344739
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ro4N4+8M;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ro4N4+8M;
 spf=pass (domain: arm.com, ip: 40.107.6.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FI+3TSMSJJxMgGroPR+IPjVoz7tOP1qeslibANXGkh9bhVXIJkWCXGajbo3Zr/ouFV6AVNmKelYr0GOibRlUXnEEphznBjiDnB9EuWbBsVGNEmR1aUPJio293twn6K6PYtg5gyj8BLzE12hsibUP+edDsVu8Bui1APKM8AO8IAu6u+j3BxFeN7Z5HnHIVt3rw4CsG5yPDmEjHKgKQWtjdFMShxTk1U2raNEKahCVZUqKWRIFlAOGYLZOz5wt/SeUI+s+UuDonDBf8fLu1GMvC6+RUQP8eZOCrfU/DKQWq3KjypsN8OLS5Fe7Jeg+2GhGrC18GMHdzVHIRAQTBx6fgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yvn9djP29orEaep/tmIFAysrnxP187q7StT8t/AsZ0A=;
 b=hKVGCfaVGrTqrqyilMLGkIXL3AnT4gn4a+DJXSDrERdXGyQIiuSMA5+Q8vrHyDzdMA0xkfqEgZlChkr2GrwcYEHjREiRvcM2GH2efLK6Z6VcCyds2cg7cbcQ7lTIfU7+j8lYQeJys0kc1juuoSEJN/iVwI/qUhKDuac1tJhhtywD8wY21Ka9FatvEQWs8rIz57QAJ7wZRsr7DocBrn5MggBM8aEbpRpotxarI9Ih+0oGnz7iBK64G7Gee7ma0rMrsaN4I8rY6I2U/1klXupJAqs2quLHo+LaQ/HaDlkWcI5Lq/PyD+oYhjUIPyjyyXyt3zCM0CxPNHoD0UviCEMw2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yvn9djP29orEaep/tmIFAysrnxP187q7StT8t/AsZ0A=;
 b=Ro4N4+8Md1o3cW/QDtEEE/TjCpp2yeU4DQiuIc4k0Dw0ogA9YtONZB7DTBFix+XnZAvfOxRlzS5oAEQGRz2gPamFJRRKixS8VIUpC3CkbVD7gNs9ZyA8vRUCB6mvF7K5QnjnTQgH+Qjc1K2f4l3I5hufh0mX5EDCFTvCNdOEJ6o=
Received: from AS9PR06CA0027.eurprd06.prod.outlook.com (2603:10a6:20b:462::15)
 by DU0PR08MB9509.eurprd08.prod.outlook.com (2603:10a6:10:44f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 12:34:52 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:462:cafe::2e) by AS9PR06CA0027.outlook.office365.com
 (2603:10a6:20b:462::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Tue, 7 Nov 2023 12:34:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 12:34:51 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Tue, 07 Nov 2023 12:34:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09500e2f8c1ba831
X-CR-MTA-TID: 64aa7808
Received: from 14b60973c6ca.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 259A9ECE-AE6B-4A9E-A057-D6F75CE28D7F.1;
	Tue, 07 Nov 2023 12:34:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14b60973c6ca.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 Nov 2023 12:34:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mftxnBf7lI5iUso+QTkNLR+iVGG8XrvT3bG/UEJbIO5Oh6xxtyM/+SaQf9z2BEyHDHEa0qMFZM4I9R3wTREQEB8P8gW5C0+EPxfrYlNt+qyE3eK0O6ha04ejjESCiUcgTiR5+/aJgQWr25QLLARlEU0sznjxsr49wkoQgUarh+wAflFkBet42xWWk1MLCLp1F03yCRs3VdsAyvvjvQyVPE+Tw+ceGqb57sbKOf0EBbPaT1Byo6CFIoSV8YkyprIWt6CA9tTk/jPaM2Y78jxF2zC/yGXx2YRJlfd0xBlMt52FsuTR2HpX8tnXVu1TMaBb893LDHFBiR/p84g74DwACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yvn9djP29orEaep/tmIFAysrnxP187q7StT8t/AsZ0A=;
 b=Jwn1N3bHLXR26MewHEek52HiS76zp25VSt195WpoCcz3g4WtVSGeezsiENEwHUQ2xIdrQQw6uPVhkhAxXRioOBgv4MtXyccBZenqvYPDG+PeIkSIcQlF7UU6rPFkcW+xcv+W/gfopndbn33ASAVWSVNnrXZULYLKpYRlVzwvnDz43kO4SvBsG4woUn5B+1PM/EmbE4H94I4TdKjijVBeuaRyCK+VQVjVxW+HAP0HtpP0joz8pZH4V7/Qs3dv63FsDNDH7h8jsWkCYpQt1XzCiJxt/nYpjXaLvXlv2S2y+Io/irGnaIuvaJoPpuYBs5rR7Ow5vsBVc7Sj2d0dPXMNGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yvn9djP29orEaep/tmIFAysrnxP187q7StT8t/AsZ0A=;
 b=Ro4N4+8Md1o3cW/QDtEEE/TjCpp2yeU4DQiuIc4k0Dw0ogA9YtONZB7DTBFix+XnZAvfOxRlzS5oAEQGRz2gPamFJRRKixS8VIUpC3CkbVD7gNs9ZyA8vRUCB6mvF7K5QnjnTQgH+Qjc1K2f4l3I5hufh0mX5EDCFTvCNdOEJ6o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5518.eurprd08.prod.outlook.com (2603:10a6:803:13a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 12:34:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 12:34:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [AUH] libtorrent: upgrading to 1 SUCCEEDED
Thread-Topic: [AUH] libtorrent: upgrading to 1 SUCCEEDED
Thread-Index: AQHaEXbHopbB/tPdUUWlGM2/Y7lqjA==
Date: Tue, 7 Nov 2023 12:34:41 +0000
Message-ID: <443A1E56-0FAE-4197-A26F-AB33762D2BEB@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5518:EE_|AMS1EPF00000041:EE_|DU0PR08MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 711a93ff-8d14-4e1d-ac84-08dbdf8deff6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oycNzUZX7/hxYUN7gEYNTFuX7iIMw7qwHGw7PP4uRm2wsXB7UCardp2ZvddJSaUMCvNO6Z/jJi6VCmSpmRpxeUUJP3Gb6VOD7AME9wIEGjI0VbZUEx4T1vbLAsJjJI5pCRHeg3EnqDznV70ngW8d93WeLXvDVcC1PlwYvRYjk6gKHbP72xSvhBOeE2HpmcAlce5SC2O3dvru3IM0J3v8RQClifsKAekNv3GnWWBktx5Qhy/HfKQZ4qyRqwKFQIXw6vCJfpGJPUxRH0EKrkePuS5hcBfc/zN9MqMAsS37iRPzCeYF+6UzVusHtk9s2uzvZJ+oudgd7VqOtaWPOfFlKHHMXIguY/55GJMWVFyeSrtm4JoR5+TuwgoNynN+XO3xr/BakXQQEAhH9uzjJXWMr2jwA66QKZCK6Q5R+62DX9cDPwnhs08AY45jq/bzpfijmYj/P44VTFBaw0CvPs/H4UcpTiWMz5E4dMtuooNS/QpsncIDS2qA7b3PS1YfWRR2PvoETdLRGbGxkHLOL2FLqsRN7pu87K+LAcwpuL/RBL5t8lmRPe9EApD/Jf64hvbpq33poCfQrz51AcUU248En454pmmxIkIFcClEXW57M5PrpcjCAxliNcAoShP5/jG2H7V20SR+0bBDOOS5caFT8ZOD9TBalYRklHEbCmbtFVjc9fAaY2iivKQsT+S+QExE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39850400004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(71200400001)(6506007)(38100700002)(122000001)(2616005)(6512007)(86362001)(33656002)(41300700001)(4744005)(2906002)(966005)(5660300002)(4326008)(8676002)(8936002)(36756003)(6916009)(66476007)(66446008)(64756008)(66556008)(316002)(91956017)(76116006)(66946007)(478600001)(6486002)(26005)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9602C9B9B6EC1A4899489FBC6CC2D364@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5518
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1c21a738-d582-4782-ba3e-08dbdf8dea01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m7itiK/4NJAVxE214vHdoNvDVr0uN3LHNNse9If9/Dw/sfb50C7/wlOECaSAS6MG9D0c0u6Bb382Giy7ZZBzhaVx9xJ8Z4JI1kXJYdOYSOUC0reThWAsx0u3EKl0AhAjVyuA7Ef2B9tQRXZNXIyDZpI1vK87XvLkRdUzJykphtWONIJqAvRPYKX9GDWvKgZ912QSImFej1PeyXT9EA7vTX+tEZ7puHqTBzoMYTXXMWIidGbLpZp3uBSMMiIC/OLDjBESQLk/EmJyWhPM+LiJzXssPGVpPTolOgebcZR9qegmv+p4VrUXaQ6/PLzoeIZ8I84WHqyHMN7lNJPI7HFpN/c0KCJO8tCoVEDS1a2m7mxE97zaKvUq2iF4g1feUIvG3/ePBsjxwXATo67C8vtRBQBWsi6SOxL7vLVBFMJbnrIYpymHTJNSs0eVUbxnT2RDOzCvE5KQsIvojd3m31rfFPnBKnaoMNiTeUSat8SzIItNg8ySjHksKDfbC69i3THHRPtmmXIp75enqzNhVqQm0sagrssI8047S3DhhVpBhEk7yWH7TeXto8XN52avyzUp0XPnAeIFhLK4eFH6AFZ1PYZ7Srfwk3Z7EGn8fovzL70GxKyboj+bbKRuKAPdGfIl6KB8U72T7HVlohNFuEMKOXRxCabXDJeeDe0Lwfhrv7WL+ZO4b9ZW6rY50dHWBASa9IFiyWtCZ2o2o7Un5Yrn3WM6dwsnRny4hENqz40aS69xO/sdzxkIUWcuZoe8wSaRmDtfNsXPl0RozdBisTsnlw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(966005)(6486002)(478600001)(70586007)(70206006)(316002)(26005)(2616005)(6512007)(6506007)(336012)(4326008)(8936002)(8676002)(6862004)(2906002)(4744005)(5660300002)(41300700001)(36756003)(86362001)(33656002)(47076005)(36860700001)(356005)(81166007)(82740400003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 12:34:51.1891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 711a93ff-8d14-4e1d-ac84-08dbdf8deff6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9509
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 12:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106451

SGksDQoNClRoaXMgZ290IG1lcmdlZCBpbnRvIG1ldGEtb2U6ICBodHRwczovL2dpdC5vcGVuZW1i
ZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVkL2NvbW1pdC8/aWQ9MzI1OWJjNzVmNWNiZTgzNjIz
ZTM0MGVmZDQ1MTg0MTRhZTJmNzU5Mw0KDQpCdXQgdGhhdOKAmXMgYSBkb3duZ3JhZGUgdG8gYSAy
MDE2IHRhZyBiYXNlZCBvbiBBVUggdGhpbmtpbmcgcHJlLW1lcmdlLTEgaXMgYSBuZXdlciByZWxl
YXNlOg0KDQpodHRwczovL2dpdGh1Yi5jb20vcmFrc2hhc2EvbGlidG9ycmVudC90YWdzDQoNCkkg
c3VnZ2VzdCByZXZlcnRpbmcgdGhpcywgYW5kIGFwcGx5aW5nIFBldGVy4oCZcyBwYXRjaCB0byBt
YWtlIHN1cmUgdGhpcyBkb2VzbuKAmXQgaGFwcGVuIGFnYWluOg0KDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9vcGVuZW1iZWRkZWQtZGV2ZWwvMjAyMzExMDcwNzEyNDAuMTUxOTYzMS02LXBrakBh
eGlzLmNvbS8NCg0KUm9zcw==

