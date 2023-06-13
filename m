Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00416EB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 16:45:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.66])
 by mx.groups.io with SMTP id smtpd.web11.18621.1686674713103962608
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 09:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ohh+x2Tk;
 spf=pass (domain: arm.com, ip: 40.107.21.66, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LijrnbQepAs+Y9ZUhj05KsQy+cx/md35ncvTJqMZmgg=;
 b=Ohh+x2TkQf7mOdpizeGNCvibilTUQz9F/HlaYdi2jRvSX/VoNXRbofQBPW2rJnhzEq8R/BzgdKFI4DiawNR2CspF5NCwF2IzyGh1ViUQ6melqe2pqvGFZiFNg+zYQ84UspVcFtvSeRi8HflbjW7OXSPQXURr2g9NQ04l6Z3xhhk=
Received: from AM0PR10CA0070.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::23)
 by DBAPR08MB5829.eurprd08.prod.outlook.com (2603:10a6:10:1a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 16:45:08 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::d5) by AM0PR10CA0070.outlook.office365.com
 (2603:10a6:208:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.35 via Frontend
 Transport; Tue, 13 Jun 2023 16:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Tue, 13 Jun 2023 16:45:08 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Tue, 13 Jun 2023 16:45:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bc45e89ac0cfb76
X-CR-MTA-TID: 64aa7808
Received: from 9bc1c13fa4cd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 80210E63-D62D-42DD-B34F-3D3914687B2F.1;
	Tue, 13 Jun 2023 16:45:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9bc1c13fa4cd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Jun 2023 16:45:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HH0WPYpPGogCuOjxcZHLPAI8gaADXY9YXdPnz5Up3fQGFvQJsma2zT1WcrqL0zs360GlWGOlnbJclXLGl+dOgDuSi4f3cVZWLg+BP33I0qvnqxsg51tby167+vGu650iQcYbwcxUJXYRFcZY2s/jJgCaeD01YAYBhLl6T6/f7S0HTtTLWQENu1P/FzM38RbiTlcDoKHSZOnvyOFgZ9CdSzdL7QDcBugv4qUAjZf/dU4kGm6ep98Wfgw1NGXHRig1H9GOUd4WOYHnpNrg+VyiZhLnu9ha06YWU82cq0SklsJweU4NEaAq7Xg10OaDTB6D7U83qmIj+DI5SWhJb6SmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LijrnbQepAs+Y9ZUhj05KsQy+cx/md35ncvTJqMZmgg=;
 b=X3FIXQ0a//W9FqqvNejeUP3P03pSlxQVhYWe7yfJnSNuVU2gea+RABk7GxE5xu5zAS5Cb7bjsq9cNGLduFRrV7+PG0nWn+AA3phwKSx1yLUUlJxtf15t/MKoRC740hCZJv1PqLmHLVTMHulC2cGiMbJoe4u9KDrWSjVmegcXd+Nc3n+b2a9CS6+6lVslfOE2N8iY1OcARZn1P531im4ZJEICMpHSVGS22ew2JtbAX69rwJuXUs1NM9AHP7hyR6H6R6wmrrf4ResTMM0WgHxfLAqvKrEyLdelyNj8yYnwrGEOoxnFx3Qkn/XU3tva9zWQTY1mKw4he7uErIpFr+yG7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LijrnbQepAs+Y9ZUhj05KsQy+cx/md35ncvTJqMZmgg=;
 b=Ohh+x2TkQf7mOdpizeGNCvibilTUQz9F/HlaYdi2jRvSX/VoNXRbofQBPW2rJnhzEq8R/BzgdKFI4DiawNR2CspF5NCwF2IzyGh1ViUQ6melqe2pqvGFZiFNg+zYQ84UspVcFtvSeRi8HflbjW7OXSPQXURr2g9NQ04l6Z3xhhk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5642.eurprd08.prod.outlook.com (2603:10a6:102:8b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Tue, 13 Jun
 2023 16:44:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 16:44:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "beniaminsandu@gmail.com" <beniaminsandu@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] mbedtls: add support for
 v3.x
Thread-Topic: [oe] [meta-networking][kirkstone][PATCH] mbedtls: add support
 for v3.x
Thread-Index: AQHZnhESWVTTN1LZIU6FXN5J6DnJM6+I8JgA
Date: Tue, 13 Jun 2023 16:44:59 +0000
Message-ID: <9ED09301-422B-48F3-84F6-1D7F23B5C29A@arm.com>
References: <20230613160621.100974-1-beniaminsandu@gmail.com>
In-Reply-To: <20230613160621.100974-1-beniaminsandu@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5642:EE_|AM7EUR03FT058:EE_|DBAPR08MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca162bf-52b9-49c6-e4df-08db6c2d8c1b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GBFE+A6/EAmK9EGk5ddNxJ1G991kpNZHpc5WDRP//JUZMHqpzHs8O/+Op3AzzBgg0rVpAz0FYBTH+xZ3IPiP3rPg+KdgmnpJyr5ZRIJKnqMIcnf4X9aYr/ynn8lVbv1xGSD4sWdR6EwU0j6Lc3ugFQ10GIIGbcpSx93ZoqP0WVvbNQpCPkP9FPJiBS0f7MkNAq61b5VOet2GLFaUq55dWexQF5I2GI2pjQsQR4Qi2SOx/+WxValDGbxBSc1ihUyN8UzJFcrP4UDeytiJ5xvX+Q4g3b8bTvn7R1jyRhjOFkE75K5i/Jpx99Qtxw4bt9B3bTef8IsGxKMb2wmvQEASqTUPugujoZXRnPMWwjJKB/2Tk7Msjgn3UBAilz632o+6KnCzsSYmKth32QdG9NvXyCKL5QTLjZKEs9eIuWdfwxGV1N3zIlK4d16RY2l/0j23Ez2FxY8RoYHFnkrpo7bJzmCjwhXeu5ov/JYeJlm5Fn1FAba3Q6lnab+G+AMxcsbUWmtY/ewIgL2TdMz8SFN8W4buTbnHFlcwUtOjb9bpMq4uoR/xPwrspOMYo0ih4Npm47+hFum1PdhZG80kjoWGB/38ueUVeVTYLPOP2bz+Xbn/ezoxzzEu3UczZhg2nFJd2Xjf8QJnj+33s/oypkDIWA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199021)(478600001)(71200400001)(91956017)(64756008)(122000001)(6916009)(66556008)(66946007)(66446008)(36756003)(76116006)(66476007)(4326008)(4744005)(5660300002)(8676002)(8936002)(86362001)(33656002)(41300700001)(38070700005)(2906002)(316002)(83380400001)(38100700002)(26005)(53546011)(6512007)(6506007)(186003)(6486002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F5CFB8E70746A4198D82C5B764290D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5642
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d6bb1653-00d1-454a-ea49-08db6c2d8697
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tGFJw6vWtpdinAZ9C+cZJnRjWs5paMV+g/hAUktu6g8coIcb5k4AAWN6TxEuPhnoI/+HpfSoyfj7cp7Ih8bgDQxgCeH9y8EfIoxqhSyyg2Ee6mDUCbZR0kRfrdn4i7RMXxkk5QIqlQVd0L5aWXFwIz5jQl4C7bxzOgIf1sOElVu2pOeeMXnjFkR5H1mn4WFj56x8ZCN9shcmGRDRwH/ddW6WLPtyD+Xi03kQN4SSidzdDKH34Uac5drs0t8QHMSihkNA+bqDWFCW0ysT7ehzw4f6j04IGC7OGY3HWw66IOgBdqGFOlVlXdYTmI5FShi2q4JQMweAiro2pO7CAOJEQ9A6jXQsH0dMfzJDQmZfPo6L910vdQHYdlgxhKpfSqNkngZ+To+hQRrKfy3G8ojI6l6Arif08kX5FZINhWBHAKaV0yZ1kGG8b+JXUfHz7Qi2AdWao+VrIgQQkdmMl2hVQM0RLIfGHeWvYLRXu1LbqAw5GxdVrVyD78a+GMwZrZWEaE1AS0cl0Hk9/srF1Pm1YYGmUrK/qrDBDm6xmxjT799dLl4h3+dBghRHhwsazDhA+Vz6efl054OTnKxx2FCq8wKiUyoFiS1RyHTxhYCHX46kvbFfaKxFihky8s6ElPs9plEqxHRWo49oXcGrfXtZVZBNwlrL2lh80pePeOrGfEBI8si0Jv9KceB8ivQGP/gFmMfkXH4XsWtyvInN5rKqNSIV9gqUjbsbeaoWTAE+Zcg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(5660300002)(4326008)(316002)(8936002)(4744005)(41300700001)(70206006)(70586007)(2906002)(6862004)(8676002)(336012)(2616005)(53546011)(186003)(6512007)(6506007)(47076005)(83380400001)(26005)(36860700001)(86362001)(82740400003)(478600001)(356005)(81166007)(40460700003)(6486002)(40480700001)(36756003)(82310400005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 16:45:08.2554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca162bf-52b9-49c6-e4df-08db6c2d8c1b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5829
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 16:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103272

On 13 Jun 2023, at 17:06, Beniamin Sandu via lists.openembedded.org <beniam=
insandu=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> +# Export source files/headers needed by Arm Trusted Firmware
> +sysroot_stage_all:append() {
> + sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-=
source/library"
> + sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mbedtls-=
source/include"
> +}

You might be able to delete this: the canonical TF-A recipe fetches its own=
 copy of the mbedtls source.

Ross=

