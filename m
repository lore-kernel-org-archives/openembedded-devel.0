Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BEFC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 13:04:28 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.55])
 by mx.groups.io with SMTP id smtpd.web09.38157.1656680666846697704
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ftQfw9sV;
 spf=pass (domain: arm.com, ip: 40.107.13.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=afU+6hZUD065WtRQQ+D+HJnB5kQdet8W8ZWFy9/rafj3B1rdBkqWp80WViprzl1imIQVcWb43kNrgON2xazVqlWKwJCPV94p9kB42H69/BGAKv0oK5gHE8vRVjtE4z4uHaJDn7wBmzQDZgpKYFLS/Kw/ZL8JKEzKRyuZajlb9vJebj8C//3lIZ1VnH6H1eXPeDFcxcLivxWalx+wfeBGzOpevwEvBeHdG7QFRj8LvrmtoZoU9UFzbXP1KxS8fAk8s1ZKmJ3juWERk9/R+DWqxwpRMKRu0vF76MPgWh3Ni6sexuuopfGcTu59DIQFH3VmZM2Ds4HsXm4qxO5Q2fZEwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+FQA47ErelfwgEPZwFjFI+cqeu7AXQpEjjCRnHkT/E=;
 b=gIpg7LnOMjbSGrLlP+ksr1X538Mn7DKNTNJkO6/ml5WUJ4frnYITbSc9ZtcT8YGuo17pO9DoQyrDmYh77d+J7PvJwEIp+xYRBmlD1buYMF/KYXPXgkehNnYr8HtOFtx3a87MXi/jf4JTTvObdjr/14dVwnd3Sf7J5Kp+9C1AjqLWkNpdH8G9p1fS56gG4gUll+o4ctac1pME7SFSXSq/RwWwUbh98rZaP0luGJc8P2PLgaE15VSVIHF2of6x9eWqTU9w/9bxfvvBzE1EeD0iQRN/5rB0BJ5qSwT0rj7lt6jjafoqWoYdnLiNC48T0kUlqp1a33jJdg1Zndd/jdU4Ug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+FQA47ErelfwgEPZwFjFI+cqeu7AXQpEjjCRnHkT/E=;
 b=ftQfw9sVsH2lw4xfjvKE5gjMK3W9sdWowhhhWKBoHJVQr67WBLrADfHJz+ipP2shfn+Ekh8ZDfAWlcKnAJvLqaEwy5agIv+eLihiASp2SxonG8t1ZD854SELSuq/kSS1bX8DgP7jcPS24EfHC2L3D0P0VgwDtruKiaDPFZrLObg=
Received: from AM6PR10CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::39)
 by DB9PR08MB7650.eurprd08.prod.outlook.com (2603:10a6:10:30d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 13:04:21 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::ce) by AM6PR10CA0062.outlook.office365.com
 (2603:10a6:209:80::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Fri, 1 Jul 2022 13:04:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 13:04:20 +0000
Received: ("Tessian outbound 4748bc5c2894:v121");
 Fri, 01 Jul 2022 13:04:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a80968ecc0b4b675
X-CR-MTA-TID: 64aa7808
Received: from fc3c3554f0e6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5583E4DF-F8D8-49DC-8839-AC345A82663D.1;
	Fri, 01 Jul 2022 13:04:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 fc3c3554f0e6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 Jul 2022 13:04:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUzTOBSXlueP6WaUk240nGlTQMt726t8iJMrskxQa9St/6KD7wEjbpYiO1aQijdi9d1tDLScX83bxA9rCecsDeaMtxJIzJEGa7N25jZt39YfOTQ0iCj3J+pe6BRg+nihOh0cy9HFacfjJtHRco7cli1OpUrdZijDqAvYbvPQ2r9Ah9NxBOon+NqtSpoRFY5cXianGiel/h30GA5UeG5GRLh/1txG+pLAkHrA6W60cHlXyZYWbkA6Hd9ekPYIIZxfOBA1N/Y+ID5EQiCtVk7WFVDDVyzP7soQvOm1mfAPyC6thxP5bqKM70tq8xvDlojBQZxDRqZsey3r3E0D2mSOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+FQA47ErelfwgEPZwFjFI+cqeu7AXQpEjjCRnHkT/E=;
 b=LpYBRXqslW2Z2qo5ZFwye9SZptvqquuldJWkGM+m3xyiz0LearEoiP/u2XVWH4uABKKiq9W/lSiVhBgBjsqyBUS+T6rMpqfNHGh9/fV7eDM+x75pF6b9rZB8/TlNZRGVt5fkJgTlxa/EatGrT4r01ulLqShCevwTw6ziNREFqB1MDZcHjdJtyHakp04B28BzUaMpZfLkkPZ7zqP7+pohggJTb01evI0vFC6yetJwWyxS6Nj+VAC+XbsXVUJmHRcvaAAYj2Tbp9u+z8kQVFf6gNbLsJeSNyrAq77J4+2gKWySCFabt+w6aB9oOn6cVcFmOPGiF/KIrBCuvRyjlWIZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+FQA47ErelfwgEPZwFjFI+cqeu7AXQpEjjCRnHkT/E=;
 b=ftQfw9sVsH2lw4xfjvKE5gjMK3W9sdWowhhhWKBoHJVQr67WBLrADfHJz+ipP2shfn+Ekh8ZDfAWlcKnAJvLqaEwy5agIv+eLihiASp2SxonG8t1ZD854SELSuq/kSS1bX8DgP7jcPS24EfHC2L3D0P0VgwDtruKiaDPFZrLObg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB6PR0802MB2389.eurprd08.prod.outlook.com (2603:10a6:4:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 13:04:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d110:4cf0:3647:c4b9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d110:4cf0:3647:c4b9%7]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 13:04:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] maximum shebang size exceeded, the maximum size is 128.
 [shebang-size]
Thread-Topic: [oe] maximum shebang size exceeded, the maximum size is 128.
 [shebang-size]
Thread-Index: AQHYjHMTRM/PA9xxD0Se1c7J/n9FUq1pfRbD
Date: Fri, 1 Jul 2022 13:04:11 +0000
Message-ID: 
 <PA4PR08MB741180CDD9E465DCE2209916E8BD9@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: 
 <CAMKF1sr=LtPvBaH-Tj5QQ8ZB641cLgrOB4sK47DdJ1Xnug3wSA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr=LtPvBaH-Tj5QQ8ZB641cLgrOB4sK47DdJ1Xnug3wSA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4bf554df-cde2-46d7-16d0-08da5b623682
x-ms-traffictypediagnostic: 
	DB6PR0802MB2389:EE_|VE1EUR03FT034:EE_|DB9PR08MB7650:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 u7cuOiOW2WHMvyiS17slS1b+6DcL1AjyuQnUC+HoVCp5tfKAKBESEaUzjiSe5/u46NPEkwMdScNmNCTaJvyiKzbwCQHwOgpXMiixjH115j4KT+XkWzifJdz9/5VmU8oVzpXd7RoXJVyhCwv0/qighEdg6rkCNjpD49JYcWLcUubdUGByF1Ad30bvgg2GJblvbt116mzV6gBL5/mHGc3iVGfn2SQisaLgnhoyyu4CU7rnZw83KrMkPoAHG78gUgvD8xqaMQSiHLY77OtHOj0GLPWeigeskwD7ZIC+L8FvUZWVN+DlwyGkrIIihbanuhN9XxLcn8LTU46rk3ftKK4/r5NXhD+23GplyR3kcEKta0+o3dAs8Pg2E+aAt+qm3M4V9EIiLoft/mrh9CbIi+Zub/VAeafg8RHSXZp8LNIkVZKQXFzm48fGEeGdu5cS79HXQYAAj1vQ7ul9Nmii7+SEbEFZHwg6Rg5/T8mEcbuWMTqpcgHRQfuaOGY4G9szYvoqqOOS5d9hVzRfxb91InSCn9o6MHQ5nPxHoNz6A9TO1S/+v5QddU75q7soV11c4zHLbhhPFxETdBzcpNqITWQWTlM7fcSh/sAucAtZQUvrd2tbtajVl9EkUAoFRHK+sbe18a/QD/UgAqM1sCI8xnDudU24q2EHbJlyNBTL1L6hSCmsgTxY9YA4qXeIF+DRNU47/LHqE4zopxcYBtp6/1wllvNQCM2OaDBLlg6h/UMC6H7IpTubj93Zs+SyF1SGtA3a+esJMTUA1wADKz6oS+8EttmSkZ/uQTqx+e7JufkiXkcP9Y/c+3hnlATIBb3CXy5iZ4pee+fjm+Xq2u4QbotgNaRK644Kgu4FoaSfPxFR3d0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(66476007)(8676002)(66446008)(166002)(7696005)(66556008)(38100700002)(91956017)(9686003)(83380400001)(26005)(478600001)(64756008)(55016003)(6506007)(33656002)(71200400001)(76116006)(66946007)(8936002)(38070700005)(122000001)(41300700001)(5660300002)(2906002)(966005)(52536014)(316002)(110136005)(86362001)(186003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB741180CDD9E465DCE2209916E8BD9PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2389
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6001b425-cf74-483a-da93-08da5b623119
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yBAM5ZzRBNlcRcnW7uki+pq9+xZfeME8B+u/pol1oT/BwU0INKuHU7AawusSZTbBhIcetgXxOj4w30+oR7C6vu9P9/2KouIEOIJuxm40W93bCirR9pL8sizhofw4CH/ymTKB3UWtbwYWAxoz+sbOxzi4ul5QazsyR1T7vJWUJpxlATNyzfnHDZuyj0OKTDypa+dxNcuIQHCjnT/bAdYOcn+X0PWLRXm4yiKAPp7YKXJg/c6FR3G1KW2toq5ej9EU0AeAcRsXXmRNqjoxyBm7/ofkTekRrJDIG6JobEoXRtaQGi9aI3fusLwARFhDuRqfkzglZIldgUILkyh4Hv5WN2HhT0hBELmZUcrfIKy+nxovitiCPfuUmQMtP2EV/2GNzKMiP2tqwZr78AI33H3Aj2RKMeezuRESGRY8CrWyV5ZpUxS8Q/wcELdwE2pLUSd10BBMlAwYJXOV9u1e+mxoUAsG6H6xwL0UOMl8s+k06es/BaZWqnMwTy7ruuk6lSL9tVrbo0c3g/JC6um0i26T89ATQ+nCS1niFM+5xlHYj7GZTdqIIfmIeARqTHYfLGFGJe6ZKp9Bu8frEHiO9mVVdG+K3n9fMc5kb8dqzJwPOUhK8Ljpw7IjULk681dALogbB9ST+NSWrwhQfOoy5/gaPNfvHB3a5jnuI79y6OySROIFTRKIIpSPEwB7fPmlKd7g3t/BsZkpfFfASKzYbTU6Anil7t1lSccGLO+Nt8MHY3aD8tQgICbyBMrXP2fZ1/GirvY3iCe3geypxUuqDbsaGwtxYE0L/MpFKlKa1hOEt4qX0kE8Bydok6bYzTLrDmy1bamcyosEp709VBMFV93xmKKXGOOge598Hy4q3Y2AI5I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(40470700004)(36840700001)(46966006)(70586007)(110136005)(336012)(47076005)(8676002)(40460700003)(26005)(356005)(9686003)(186003)(83380400001)(40480700001)(82740400003)(316002)(55016003)(70206006)(81166007)(166002)(6506007)(33964004)(7696005)(86362001)(36860700001)(478600001)(2906002)(5660300002)(966005)(82310400005)(8936002)(33656002)(52536014)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 13:04:20.4316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4bf554df-cde2-46d7-16d0-08da5b623682
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7650
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 13:04:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97665

--_000_PA4PR08MB741180CDD9E465DCE2209916E8BD9PA4PR08MB7411eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXMgdGhhdCB3aXRoIG9lLWNvcmUgbWFzdGVyLW5leHQ/ICBUaGVyZeKAmXMgYSBzYW5pdHkgdGVz
dCBwYXRjaCB0aGVyZSB3aGljaCBpcyB2ZXJ5IHJlbGF0aXZlLiAgVGhlIHJlY2lwZSBpcyBidWdn
eSDwn5iKDQoNCkZyb206IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gb24gYmVoYWxmIG9m
IEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyYWoua2hlbT1nbWFpbC5jb21A
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCkRhdGU6IFRodXJzZGF5LCAzMCBKdW5lIDIwMjIgYXQg
MTI6MTgNClRvOiBvcGVuZW1iZWRlZC1kZXZlbCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBbb2VdIG1heGltdW0gc2hlYmFuZyBzaXplIGV4Y2Vl
ZGVkLCB0aGUgbWF4aW11bSBzaXplIGlzIDEyOC4gW3NoZWJhbmctc2l6ZV0NCkhpIEFsbA0KDQpJ
IGFtIHNlZWluZyBmZXcgYnVpbGQgUUEgZXJyb3JzIGR1cmluZyBkb19wb3B1bGF0ZV9zeXNyb290
IG9uIG5hdGl2ZQ0KcGFja2FnZXMgcHJlZG9taW5hbnRseSBwZXJsIHBhY2thZ2VzIGZhaWxpbmcg
d2l0aA0KDQptYXhpbXVtIHNoZWJhbmcgc2l6ZSBleGNlZWRlZCwgdGhlIG1heGltdW0gc2l6ZSBp
cyAxMjguIFtzaGViYW5nLXNpemVdDQoNClRoaXMgaXMgdGhlIGxpc3QgZnJvbSBtZXRhLW9lIHdv
cmxkIGJ1aWxkcw0KDQpodHRwczovL2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9CdWls
ZC8xNDc4MTAvDQoNClRoaXMgd2FzIHdvcmtpbmcgZmluZSBmZXcgd2Vla3MgYWdvDQoNCkFueSBp
ZGVhcyA/DQoNClRoYW5rcw0KS2hlbQ0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9m
IHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkg
YWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9z
ZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9z
ZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsg
eW91Lg0K

--_000_PA4PR08MB741180CDD9E465DCE2209916E8BD9PA4PR08MB7411eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCWZvbnQtc2l6
ZToxMC4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsN
Cgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1z
dHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5
cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjEN
Cgl7c2l6ZTo2MTIuMHB0IDc5Mi4wcHQ7DQoJbWFyZ2luOjcyLjBwdCA3Mi4wcHQgNzIuMHB0IDcy
LjBwdDt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5
bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1HQiIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBs
ZSIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9u
MSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtt
c28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+SXMgdGhhdCB3aXRoIG9lLWNvcmUgbWFzdGVyLW5l
eHQ/Jm5ic3A7IFRoZXJl4oCZcyBhIHNhbml0eSB0ZXN0IHBhdGNoIHRoZXJlIHdoaWNoIGlzIHZl
cnkgcmVsYXRpdmUuJm5ic3A7IFRoZSByZWNpcGUgaXMgYnVnZ3kNCjwvc3Bhbj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZx
dW90Ozttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+JiMxMjg1MjI7PC9zcGFuPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0O21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86cD4mbmJzcDs8L286cD48
L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVD
NERGIDEuMHB0O3BhZGRpbmc6My4wcHQgMGNtIDBjbSAwY20iPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCIgc3R5bGU9Im1hcmdpbi1ib3R0b206MTIuMHB0Ij48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjEyLjBwdDtjb2xvcjpibGFjayI+RnJvbToNCjwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnICZsdDtvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZn
dDsgb24gYmVoYWxmIG9mIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnICZsdDty
YWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZndDs8YnI+DQo8Yj5EYXRl
OiA8L2I+VGh1cnNkYXksIDMwIEp1bmUgMjAyMiBhdCAxMjoxODxicj4NCjxiPlRvOiA8L2I+b3Bl
bmVtYmVkZWQtZGV2ZWwgJmx0O29wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5bb2VdIG1heGltdW0gc2hlYmFuZyBzaXplIGV4
Y2VlZGVkLCB0aGUgbWF4aW11bSBzaXplIGlzIDEyOC4gW3NoZWJhbmctc2l6ZV08bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGkgQWxsPGJyPg0KPGJyPg0KSSBhbSBzZWVpbmcgZmV3
IGJ1aWxkIFFBIGVycm9ycyBkdXJpbmcgZG9fcG9wdWxhdGVfc3lzcm9vdCBvbiBuYXRpdmU8YnI+
DQpwYWNrYWdlcyBwcmVkb21pbmFudGx5IHBlcmwgcGFja2FnZXMgZmFpbGluZyB3aXRoPGJyPg0K
PGJyPg0KbWF4aW11bSBzaGViYW5nIHNpemUgZXhjZWVkZWQsIHRoZSBtYXhpbXVtIHNpemUgaXMg
MTI4LiBbc2hlYmFuZy1zaXplXTxicj4NCjxicj4NClRoaXMgaXMgdGhlIGxpc3QgZnJvbSBtZXRh
LW9lIHdvcmxkIGJ1aWxkczxicj4NCjxicj4NCjxhIGhyZWY9Imh0dHBzOi8vZXJyb3JzLnlvY3Rv
cHJvamVjdC5vcmcvRXJyb3JzL0J1aWxkLzE0NzgxMC8iPmh0dHBzOi8vZXJyb3JzLnlvY3RvcHJv
amVjdC5vcmcvRXJyb3JzL0J1aWxkLzE0NzgxMC88L2E+PGJyPg0KPGJyPg0KVGhpcyB3YXMgd29y
a2luZyBmaW5lIGZldyB3ZWVrcyBhZ288YnI+DQo8YnI+DQpBbnkgaWRlYXMgPzxicj4NCjxicj4N
ClRoYW5rczxicj4NCktoZW08bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0K
SU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRh
Y2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5
b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90
aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwNCiBvciBzdG9yZSBvciBjb3B5IHRo
ZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo8L2JvZHk+DQo8L2h0bWw+
DQo=

--_000_PA4PR08MB741180CDD9E465DCE2209916E8BD9PA4PR08MB7411eurp_--

