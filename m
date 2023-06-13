Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD34EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 21:17:01 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.63])
 by mx.groups.io with SMTP id smtpd.web10.2686.1686691020650489244
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 14:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ai5Hw0Mx;
 spf=pass (domain: arm.com, ip: 40.107.241.63, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3dxUZeXVQqX4j0HK2qjfp6gODIlipz65+hbacRv/sk=;
 b=ai5Hw0MxPAFLONZmzX0kbemx0KP6+CUVaWk+wTidt4ywz6SjZGS5NdpR+c6lRttq8Hm1r53NzFBuhXpXgKiUY6YYDv7VNl5Tfjwp/DmniorW8E1fvyqGOutsas05YzGOKNYzsrjnmlIjWurifk4xdFRWsuelZUwqu63L/6C/4L0=
Received: from DB8PR06CA0066.eurprd06.prod.outlook.com (2603:10a6:10:120::40)
 by VI1PR08MB5470.eurprd08.prod.outlook.com (2603:10a6:803:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 21:16:56 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::50) by DB8PR06CA0066.outlook.office365.com
 (2603:10a6:10:120::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.36 via Frontend
 Transport; Tue, 13 Jun 2023 21:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.22 via Frontend Transport; Tue, 13 Jun 2023 21:16:56 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Tue, 13 Jun 2023 21:16:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2691657e0213f155
X-CR-MTA-TID: 64aa7808
Received: from 4da064200f5c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 057690EB-5110-4E9F-8D2A-8A1D14190740.1;
	Tue, 13 Jun 2023 21:16:50 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4da064200f5c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Jun 2023 21:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALxk1dzjtIRrDBHHuI83QaLehrZ7HnliPPX19RUhfGfZ2iUiaVU18CBV8YGrc+1cKQAfGylgznBpNeT5PZWx+CAXPSoSmlMwH4SAV6zNd9p0MpLhVey1G7l3N1aCCIMv9ciVsNBuMV5HsalFQk5FSOt3iNnUwSqK0wgAAuInxqIjw1QlOpUWjdAMpibJ09C/pJO7WKRDjom78TRRK+WOROupuPqP73AkXxvErk8hGdGKSpABEQa/uS3R+LO1PvrLUOiagxq/qDo3fhuMWxCiTMufmR8jUJJedXJ9kG68W/EFedipw5n9iZgt3S36Xz+PZq/MS1ze6fB3ySkMggmcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3dxUZeXVQqX4j0HK2qjfp6gODIlipz65+hbacRv/sk=;
 b=G8IULdJZLoC7gb3qtJ028zE3t4mOVjDGRwzATa6jDnWXYm3G6TewmXdS+uYhj2+Pk+dvAsWZs6ULTWCwyMKyoUW2Qz6cY54uPpYrn2FrzdiueZSPQMm8kD3O1Sw/LIIyEv0gZVLU/oWqsyyJo9uFZfz6e/D+b2ERRT+1fTBViRvzZtDQzPuO/Af2qk2cCbokMbWFG6Sk0zgbYMM0g6M5S5cgMH6PBI4IO6JxTP3w6MV6FgQbHu/1GtUwRaSH7ujxgZ96yICCG0NN6W9ZWHB0VpBAXL+SYo/l4dUdbWWnRAwY78yaQhCHqsAtCc3Yd+Vj6lGSoCdLfsK89gIjSic3Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3dxUZeXVQqX4j0HK2qjfp6gODIlipz65+hbacRv/sk=;
 b=ai5Hw0MxPAFLONZmzX0kbemx0KP6+CUVaWk+wTidt4ywz6SjZGS5NdpR+c6lRttq8Hm1r53NzFBuhXpXgKiUY6YYDv7VNl5Tfjwp/DmniorW8E1fvyqGOutsas05YzGOKNYzsrjnmlIjWurifk4xdFRWsuelZUwqu63L/6C/4L0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9506.eurprd08.prod.outlook.com (2603:10a6:102:314::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 21:16:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 21:16:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "beniaminsandu@gmail.com" <beniaminsandu@gmail.com>
CC: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] mbedtls: add support for
 v3.x
Thread-Topic: [oe] [meta-networking][kirkstone][PATCH] mbedtls: add support
 for v3.x
Thread-Index: AQHZnhESWVTTN1LZIU6FXN5J6DnJM6+JE5EAgAAD6QCAACUPAA==
Date: Tue, 13 Jun 2023 21:16:46 +0000
Message-ID: <40DE68FC-77A5-4FA3-9AEE-A2557E9EC880@arm.com>
References: <20230613160621.100974-1-beniaminsandu@gmail.com>
 <b5aa26cd-11d5-f9e3-1b4c-2d51d600f9ab@gmail.com>
 <CABQJdOEWXKkkZnHVcfWOgR2gg6Exx5dbijWAHwGq9=if0B1WHw@mail.gmail.com>
In-Reply-To: 
 <CABQJdOEWXKkkZnHVcfWOgR2gg6Exx5dbijWAHwGq9=if0B1WHw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9506:EE_|DBAEUR03FT037:EE_|VI1PR08MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: a5227f55-aee1-4693-0bf9-08db6c5384b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 N/1UbnaaUlbZetaL2X65mETzfcZUR0PWXcdKzvZAAk2m1hgQV3d5gwUClHnDAWew1PQSl2NfZ5kPYkrKzS5a0yXRMo7um5xExLBGiIGU45TYi7TdxNuCaLtt19GnF5j80IgUyGw47ck0XLhjW33dyWhpXkOuCNuR8I53i3kqUg8djtHm7oFM6tzZ9DBXkVj0QL5Yi1VrozLv2KuNrnwSgtm7HsUoUEfgp1prAZ/ARr61nWASt3Dqd1gPQWnlWKEMO7/S/WGGFnmrFFvBONkzFhWAQHSHHAtdEtkUwnTK9ZW38ktfEoPEsHOhXQ5wytxGZMWwxYuRFqgsrAwIFCPiwSTS9YnOgpuqY9F2u9MbkXVNyYLa8GWFYRQEZpLDZwKR6XUqosQiRI8lh4CRGLGaIWEUDe2ERN879/ZeAtKUyHB66iHKtPwyB3dujRjQIRwTRnbmlSyBdoBXYf6p0D6xCoPtX6gj1vxArUSbT8gU+S3WVtB97Csadw7dHmAzMrtonyZetpjXNl2MU7WwFT35k/VFJZkX/1i/hC4+eXDrUlr3ItleGdNXQ0FL4+CxUSgdjfmWpj5I+ZkUEoMUXkgJT8T19jtv0uHsZifzzCTLq6y3FGD6201z/61ufBI68thNmTmZS1koS3wVHgAuyVHArg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(66556008)(122000001)(4326008)(41300700001)(36756003)(316002)(66946007)(64756008)(66476007)(38070700005)(38100700002)(33656002)(6486002)(6512007)(53546011)(26005)(71200400001)(6506007)(6916009)(66446008)(76116006)(91956017)(478600001)(2906002)(86362001)(5660300002)(8936002)(8676002)(4744005)(54906003)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <886498F6DA546047979CBA4DD3DACD43@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9506
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0dc3641c-019e-44a7-36e5-08db6c537eda
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sh4AseG2h2K/CCk1t9cpO3QgQoy/VfK4dvTXYRQvzGA9Db2umzJrYfvPanSI3OAwzMA3KWNUk/tKJ08gK2EJ/HMiq4Uioz9nV6U55NhJYnolZrEeaC4RCw5JH5OvkdhuX6K2M1oZ4/JRgeDItLhePEZvLd7eYyLIDP7gTlRstsV6RhL2EApmtmX/TcktRYouziCVI+w4eUH20qmAy2driXRxUbcSB33VUaY4PIWYDi2/nlg7iHW5lJsIKqneJNmE4EJ72V8r9ZHe6m+U1p7Qu2iCZ1ICixRpWzJ7QJZ4Qh0fjGbiM+G6IGtunid8Kmu+vztn6e3wsqjMTLMcGurKpeuUVTfA7FFKP9Fft0dAduFheKgjb0mEQTAALsEbkktuyWRTSOg5mVYG9Xt5CbgUWzNU2iuYbJGP9eaVZIEsaGPYqkw1OAc2O0IhRDiiQCVEib6D58ZsSrtSWhXyEuwXC4ERB1ssiP7Nt4I0hDs23+ccXCwCIreTdG2JWzhiV3Fv1lSjPhIPVgYXpmlTktXIsMVMrz5cf5wUGu7q/kjYqWYywfaEjuMm7aI3cJ/ZIgs8CWNnRFruBkS+DAsORjZtP5fLU6OXsqxR3vhPCPUvSVRhMNRFm2ombDXY71GfLpAX0NUPGRs2Cpwchh73ZGqjWwPTFvlqCUQ9WMEVDKIQDdeZKbYfMx+oEo0rsaoQkaT0aMp2JIXrBm8w3CrJN51xxCLhJgZtd3TR0IxIOc9/bzOAk/Nbi+ivS+LmV/vwvVJe
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(5660300002)(8676002)(6862004)(2906002)(8936002)(4744005)(70206006)(70586007)(54906003)(6486002)(4326008)(6506007)(6512007)(26005)(53546011)(316002)(186003)(41300700001)(36860700001)(82740400003)(356005)(336012)(47076005)(2616005)(40460700003)(478600001)(40480700001)(33656002)(86362001)(36756003)(82310400005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 21:16:56.7116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5227f55-aee1-4693-0bf9-08db6c5384b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5470
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 21:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103277

On 13 Jun 2023, at 20:03, Beniamin Sandu via lists.openembedded.org <beniam=
insandu=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> Thanks for the feedback, I was about to follow up with a similar patch
> on the master branch.
>=20
> Is there any chance we can include it on kirkstone too after it gets on m=
aster?

Stable policy is it goes master -> mickledore -> kirkstone.

Ross=

