Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DF6C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 11:31:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web10.34155.1702467086858413324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 03:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HPa3ONjR;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HPa3ONjR;
 spf=pass (domain: arm.com, ip: 40.107.21.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dB3EYNVzC2TBZBtBpKOG+vROReprVvIxIkpEJdfM9lTGJyjusAjAzL+Yc26RVE2RFD6lNSmYEMMbaaeVA49npUipZZ0KxeVlRvbdkGXgEQS/GwnN7u9JmpOhHa0NBOXabDiINHC/fiRtey+7kwGvZXBSH7meCV353M1/pcWkHQ9RwZc4XEHztJ5iohhTqoiE/nMu+NU/n11cUnrrBHH4+o8MFqYkN+6BBTNJNG4w38e9LNXRtI5Q48ULGkaVSzU3wLDQLMiKO2Q4I6eaeELMUtKrVVFiDbQdqk2leWyI73SlSzKlYS99VWT8pknInq3LKX17m4QrhH4IvV8L6ReqeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9L9B6vRh+6V7GwhcA/0/ixM9c9JxLPXYri3FAneT+Q=;
 b=JudWThB29FnVCeRUZtYaPxAW6ZV8OEIqXClOBG+lZujTMltJPU2M35Dys0lsZxL59Rf2hkDVV/GnmHwp+gs36KZQgiTGHdN1H/3BW9nEtvAXEt8w5GdY4hJhzwKh6gsUjHvFVXiz2BCNamcRqiHFzoCj2xiQlwd3sGIr3bm/+iLVavEKKmY6vTtVuLojMNpeHJpMYqjsqIArWbdI/AqTPI58ic7voK3TTuuz3AQqOsu06Dirm3w04des4rdrFfUKEvxGbbBTHYrRUE7gVcsa2Vy7PRnE5AKsgzQ6CtaX9p2qVOEe/WjNdnN8FnWlchwWbBD68sha3wSL29j4te0aEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9L9B6vRh+6V7GwhcA/0/ixM9c9JxLPXYri3FAneT+Q=;
 b=HPa3ONjRQpLSdYiUigB7t4PTE+86sHGqW2dF8e6Rdci15XiX+mrf8CJHCzMt23EAFBiw2lTp5IO/3L6yomjKguU4VcjLyIabzCLVjo2OV9o5BmkaV7NZAja3Ly/muwGhMo0FkcK0cXnb7HbGDOeHw70ysbVVrikNNrK23BReMwg=
Received: from AS4P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::12)
 by VI1PR08MB10219.eurprd08.prod.outlook.com (2603:10a6:800:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 11:31:20 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::ba) by AS4P195CA0015.outlook.office365.com
 (2603:10a6:20b:5e2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 11:31:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 11:31:20 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Wed, 13 Dec 2023 11:31:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5642e709263a61e
X-CR-MTA-TID: 64aa7808
Received: from 117e6d18f30f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8F60366B-9317-46A2-AA02-A1F177CC7BD0.1;
	Wed, 13 Dec 2023 11:31:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 117e6d18f30f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Dec 2023 11:31:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAiscUhbn1FC1RVZ4FY/tSk4WW0SLnaPKUuVxoXMvdQXzvfV1lK6ZgFIpVqqilOwm4e2g1TMOumNBMvwiDjB7+U1ka4viMSqORb1SyXFV2lunA7vJ9OUmjBRiyDEp8Cwu6OQMfnrhUInEIsimrYt5I5pRDcDHAs4wpc9FjoJxDvoe4fhNi/TpBmv+2Ts86F+vFm4OB/rR5KEnR6TaJSRMnUEJ9lv0k/H+hk6914MnyMQliPmL979eVt2V1VP2vJccdCAzbSz2uxfxH5m3QJ86t2WcVf+WELlZdkiJ30XDhlRizS83ZNzeE/ZZR1y2J/n1OMY4kC2yBYNtNok59l0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9L9B6vRh+6V7GwhcA/0/ixM9c9JxLPXYri3FAneT+Q=;
 b=bWlguNnqPw4ntgVI8UDXd9mX1EgZctKomIt6FyWBIbvPdDGR6sRxLmQtjVb9ieGJpOn0JjU2fftzufgL/FrpACRe+ONISMtl/xxWM+84f8hASxXy1CPFs/jGVzn4fXymiB7+7hcIjZxG5JKaR5oywcBwIFZ6pum7Oxtix3QvQ698eU0sjdzL0ZeD9pT4ggupiYXyF5zGE8dySicufFFAuRQP1TLnj6xBZ/yXv96jEPMsHl5KU5rHGdyaemb91AiQSsg4/tTxJQopltgmsEpme6NI3SKLGsOdWKsKZ2ElEqnBV+FRfij+7gWEPbSrIIyopn62CkwxUv6LMXBKnPbH8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9L9B6vRh+6V7GwhcA/0/ixM9c9JxLPXYri3FAneT+Q=;
 b=HPa3ONjRQpLSdYiUigB7t4PTE+86sHGqW2dF8e6Rdci15XiX+mrf8CJHCzMt23EAFBiw2lTp5IO/3L6yomjKguU4VcjLyIabzCLVjo2OV9o5BmkaV7NZAja3Ly/muwGhMo0FkcK0cXnb7HbGDOeHw70ysbVVrikNNrK23BReMwg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5582.eurprd08.prod.outlook.com (2603:10a6:800:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 11:31:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 11:31:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
Subject: Re: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder
 aarch64
Thread-Topic: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error
 builder aarch64
Thread-Index: AQHaLNobhA1bLkdDrECy1oZrw4/DPrCmzG2AgABJkYA=
Date: Wed, 13 Dec 2023 11:31:11 +0000
Message-ID: <45C353E1-7C45-4BC4-A5A4-1697BA14E6E4@arm.com>
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
 <170245126382.133993.15578168101766633828.b4-ty@gmail.com>
In-Reply-To: <170245126382.133993.15578168101766633828.b4-ty@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5582:EE_|AM3PEPF0000A792:EE_|VI1PR08MB10219:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e734b88-4e04-45eb-6fca-08dbfbcf0761
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QG1SxF0vDy2LKCoNIzEXHwjFrrfkbQFQq6zo83S4mrSdZsAsEW1R2uHF1PUup3OjiDy/gXnrfaef2wSFHAux8RLA7tKLiXN6oeuLOdGESMYOIsR8C8JbZ7buntRuOrkLHHcCyBaoAwoicWQKWqa/gwnSfiR3UwL+OvzgiPM1FDgDzY9VULCkZIme88VFJT01pWSbmlTbnY2UUbWeOU3XAppXw8TpkHgFrYwnqlMyD7wTyaBJHm7O/4BCzAAC5iwCzYPtGERDB5fC302lXGW2drZ3Mf3WNVROXxPcUugkvSHiA2WbXvZ5ZL9og4/Fd4da1hfTetk1PTknimCAnyq9wctUBsmxonwYy9y4HJg4AUiA/DdUclHbhkMkFRDVTcYsxjM/L2Dzhf/mboWNEQvRNhdHzmRRCd7zmuHvlyXzSzzA45skAe2T/aNDr982G+IOsXUJUzuPN0CMMOrvSzEMG7pwBWqs9qvBigV+YzBKMC/Fy1kRRUeSqIURuttDWfuF/RqYO0gmnpd27lKPhB+JaHaIq+3F297rEaz1TS7t3i/bnFla0GOtSJfUVcEadDVD+9vC87S1yCztZBIn7MkDUl+kdyb59SW978jS5qcVaAhrOuhoKCiwt7HOlOyuBaEVWZqh3xc0yEHpT955BUY76Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39850400004)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2616005)(83380400001)(71200400001)(26005)(38100700002)(5660300002)(122000001)(8936002)(316002)(6916009)(41300700001)(54906003)(64756008)(66446008)(8676002)(4744005)(4326008)(2906002)(66476007)(478600001)(53546011)(66556008)(6512007)(66946007)(91956017)(6486002)(76116006)(6506007)(36756003)(33656002)(86362001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <008CF9A7AD84724888B4A5C5726A81A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5582
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2f88cdd0-1c4d-4967-016d-08dbfbcf0218
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ujNKbx5brJ58eWxAfLIxsIWxGILU5AMaVBTvbo4fGGrTSqq7kg+bvaTn8XKbHf1Ae/qbwI2lbi+RdOL79absdmHhm6EKuNwnhEW1CAssRi/xln841bTFUfzF32U+DSA0ho5A2VvUmBwvp90ofZNSpgKbi3xv1WbMDufoa5yLPfq4jYuLZfJK1YnPNRttalYRBAC04CrAHf9bGiqgeciliWbzIFnSlxmD9uLVHvxKGOGTciFUUpzbDuu0R9j8aS+hfunEqrGZFiPCtU9uFwO32vqNaJCLCf0ww7QmA+5+bauolnExIScsKR0RalVAhxqMuECsGVIrlJo3yKGzDHGoZXrUf1nQ0QtB4zsBrcrr41sYXtbFSlUvMM4AF7uKbIl1f9m3GlYU8hU/p/OJeTkCjpe3jN7MN8QW1L4mbEFa0VSFm9gFp6Yk7KhcvotJt6cHl+E1uZuMf0PWIMpXbVRE3TuAqHxZtPfOb8vNelGN9s3qPzQnZ+/9u2vz8Lwbdkm3z/I55/jJd7epWtLrY++EV28+Qmnw5E+uk9bhf6u1czFyX08NgNficQ5mxjYSl3SoJkZOy4hl4CfIhDcW4V70ZSAkXgnkUX/vR8uOm3lHV02e6+vQYu9U+zH4/HBKIv1kvr3UZQRx2W1fUs0S1lRuUQK/EYK16cIPmhcSt383HUxP15IrGDmLdqzUKzEOuG6IyT4CdoZJLSHMZs9AIRgN+Yknfv1z7wxJfjWN5AePtlG84ktLBcNEapV2ZpnC+K7Z
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(26005)(336012)(83380400001)(53546011)(107886003)(6506007)(6512007)(2616005)(36860700001)(47076005)(8676002)(6862004)(5660300002)(4326008)(8936002)(41300700001)(2906002)(4744005)(316002)(6486002)(478600001)(54906003)(70206006)(70586007)(33656002)(36756003)(86362001)(356005)(81166007)(82740400003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 11:31:20.3216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e734b88-4e04-45eb-6fca-08dbfbcf0761
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10219
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 11:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107392

On 13 Dec 2023, at 07:07, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
>=20
>=20
> On Tue, 12 Dec 2023 17:38:04 +0800, liezhi.yang@windriver.com wrote:
>> Fixed do_configure error when build on aarch64 host:
>> error: cannot guess build type; you must specify one
>>=20
>>=20
>=20
> Applied, thanks!
>=20
> [1/1] minifi-cpp: Fix do_configure error builder aarch64
>      commit: adecc463a3c090e5a9c54875a42047a427384f71

I stand by my comment that patching the config.guess is the wrong thing whe=
n we explicitly have a command whose job is to install updated config.guess=
 files.

Ross=

