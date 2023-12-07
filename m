Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA062C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 10:59:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web11.80967.1701946781337445293
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 02:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NPjRELWh;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NPjRELWh;
 spf=pass (domain: arm.com, ip: 40.107.20.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZMTBh2s9pyVRHQTl5+tjOUBScPvkpfrXdS2L0Vi8JSvp4nqWaXMQAAkm6kJUR2p/1N6ISZK0npmdVWYtBv8inrYf8uMK9if6bZD8YFzUJ0w2FgMcdy1Brc/0JDDGGcL8CJnwXjNWQNGvTT+JnjINmjg6zoqMYbAMBQAIRYm7r+d51gH/BgEWeo6x+nkp9SVF5nBQQsUvvX/CJtYySePpj9x4SKJlHNG3/bekAIkFebeVLyZYEvqwKOmQAFEGoi4q1ng7nUw8mAqqsLOdME/srsycFeBgb4JNGz69yEbGToKsggy3nQ7wJifRAHi9CCBN3WwHGxZUMvOcIHdi7hnljg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjEs1AIuWFmMYIsFQoJR8IQ0ZmOfnOC6t1CbLxfQRug=;
 b=aCmxhzKOwdy6f1yGR+VlNNrJLTpiJ+9NqCPBVeSy+gYYf9opsB5WRcWffomWREriPyg77/+hF/CPUkfrqdy0S+nH/ryGcYZ2A34YwTNmR0Z4uVvoEeB3UC2CQskMXPa97blICCEhFztghvrioGB0a99iHNY2ALRHd2tcDcLsKgIFJxfG0SoqmaSNA0rWRgaLAeGhcgzvJd6N7wxau/7bBasD/J2lqJnShci+MVjCpOO9APO9Pn+8JQt9IZdli/J/6K8QM5tDgufqKRMAsoKgZLll7gnlbHRWjMf7s0QZMAJl6JFnsJsXUBe+brDxkWNOAnsl7ao+TpgUlYDDhEEbIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjEs1AIuWFmMYIsFQoJR8IQ0ZmOfnOC6t1CbLxfQRug=;
 b=NPjRELWh4zkAE480napPEpySfH6Re/IkPek7ZJryGIJNWDb5ptRn6DHAhBAXaVsiWG44T1DMe15gesGmcpg4gHDQJCDHyFuTiFPBMbA0CK2iq0+6zfqlkgOyb1EWvsaXe25Vx8dNAEUjKDu26NlLbr+QoyDXCXDJyP7PiYA8bf0=
Received: from AS8PR04CA0125.eurprd04.prod.outlook.com (2603:10a6:20b:127::10)
 by PA6PR08MB10662.eurprd08.prod.outlook.com (2603:10a6:102:3ca::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 10:59:38 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:127:cafe::1) by AS8PR04CA0125.outlook.office365.com
 (2603:10a6:20b:127::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 10:59:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 10:59:36 +0000
Received: ("Tessian outbound 385ad2f98d71:v228"); Thu, 07 Dec 2023 10:59:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bac373c7e86b04aa
X-CR-MTA-TID: 64aa7808
Received: from b9d77af242b9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 872F7A11-798B-42D1-AA12-5845D098FABC.1;
	Thu, 07 Dec 2023 10:59:28 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9d77af242b9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 Dec 2023 10:59:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W598eJMmxaKVsX0NfHMdgsQPRFt5Lg/lPaLE42yUNj1FdGJoF3Clnx5vA1b4ENwOEJsuBSCqkJfrJNA4ure/wiLaJdHsU/MA8wlbXopIPbaW/LVjjZeu7iSOOjOivl9zKcd6pJtH6SFMfwzhGWcAzarfX0Rk0/0RZ1wDXQVQfKJxuoX2EouUiVqDkCC8hWWdoC51XGZ0JJ/LiqTdmNHy8b0/cfo4s4kgKvQzT7ooWW5O85Pyr28PN9Aj56tpfjRsRwPQ8i8SEepuGABWKWHVvvApJj+iOkAQ0XwOUqseyUnN5QYsdadD+1iaTLhes5HEpaZXQLOprfhYW2+Ly3N20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjEs1AIuWFmMYIsFQoJR8IQ0ZmOfnOC6t1CbLxfQRug=;
 b=QYf9zTIEL6BFAvIx/MvMtBiabDou6wUtrkcouywg3sJ+cYVsnpG498COD36rN1+bpd3E57tU5RukvI7PuB12B7/USV0DTzn50CFAEzITxbb0OSsp/6t3hR5GiPzgH59h21GmvhU0rhU2H9+bpLP8Es1hn1aSGddJeOmy1mtC+LfaB7cpaxlCybAkfzUOciS307xyalFpT7NUXdVpqK/xyb1eB38FvQSx9LP6lHDy/NlH/iPWg5lm8nou1GlC2zCv4bu7cGO/dSoZJMtSm6w3XnAyMdigc9imJDi74s6zZiDLmwVDMEH7jDLfE7RptjPkrkcNnwTaimWYZb7cO1YziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjEs1AIuWFmMYIsFQoJR8IQ0ZmOfnOC6t1CbLxfQRug=;
 b=NPjRELWh4zkAE480napPEpySfH6Re/IkPek7ZJryGIJNWDb5ptRn6DHAhBAXaVsiWG44T1DMe15gesGmcpg4gHDQJCDHyFuTiFPBMbA0CK2iq0+6zfqlkgOyb1EWvsaXe25Vx8dNAEUjKDu26NlLbr+QoyDXCXDJyP7PiYA8bf0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9103.eurprd08.prod.outlook.com (2603:10a6:20b:5ff::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 10:59:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 10:59:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] xkeyboard-config: add recipe
Thread-Topic: [oe] [meta-oe][PATCH] xkeyboard-config: add recipe
Thread-Index: AQHaKIXMjkP4kBl9GEWEQa31o269uLCdp8sA
Date: Thu, 7 Dec 2023 10:59:26 +0000
Message-ID: <AAFE8465-9191-4156-969E-F20148A488C8@arm.com>
References: <20231206204640.459279-1-alperyasinak1@gmail.com>
In-Reply-To: <20231206204640.459279-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9103:EE_|AM2PEPF0001C70C:EE_|PA6PR08MB10662:EE_
X-MS-Office365-Filtering-Correlation-Id: da972d2b-64c8-4349-b463-08dbf7139a42
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 T+VJkbrnCT5LB4HbVUjyHrh9CxQT9P1EGI+On9p/A30j3f01FMV7DpFRSMWAfwvMO13Mu0eIuqVOPb2a/ocwVSHrRHgEQ9xG0/p+5sHWM6m6f60dG3avMyt/K3noPpBNxz8HwqjbL5J8S7x/ZZtCU1uJ1RY7DFLuc5YmWKdGbPQmVyCZVozFAFvqiTIrWzS58UG5DmGN6DsffriFBlwf4FIHvhQIYkmi++htMq9DA/1SEzgWgGMGYyKb3SeNr6YhPtJbfGHE3ywP39xK6H/dEj/wNvDEY9Wfgfw3eA3My02T6BUIjZ4/xih/SOhc7M9Mvshu2xLKDE2pLnTBphCOJz6fiFX3MR/SfHPrZvGy8CoQXsVt4gAjfkvEowh2yORrmItMlO8JWTD3cIM841t70snrfPsrxWupICdF78RPu0AwPjKcJPdRpRgPNQoHLBFwaECAFU7kToicOfeB08f0g8Nj7OHi8hDxX5ztbeoPCqh5Hc2XaOaVtP7W5MMFjgXka2jW+c4/JVP0Z5zVIDl1jlXx1mm8d6rNYL01qGDOmCpSQ3FNcVSzznSsu2PLeO/KzeXzOemnIOe3vldaGCe+dLdsCnBtBvfxiYagFCF9GtgPJG/kCPrYqphMpR5kvfWiMWa8zHeedHviPEdvx+8ujJL3NDloOXwiom+ufq+f1x8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6506007)(53546011)(26005)(6512007)(122000001)(316002)(8936002)(4326008)(8676002)(38100700002)(6916009)(76116006)(66946007)(64756008)(66556008)(66446008)(66476007)(91956017)(83380400001)(71200400001)(2616005)(966005)(478600001)(6486002)(5660300002)(36756003)(33656002)(86362001)(66899024)(41300700001)(38070700009)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DBCEA689FF93E345BF60D566FFE80AF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9103
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47fabe1b-6cef-4047-294d-08dbf7139417
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0o3qP9Xub+hmXnzx/3PAztodzisxz8zSyF2Gl7a2Kk9Hk6Eyxdez44nEIkcspY0X1yDejmOTjUw0hROIix6T8Ah2W1jjVsbQvb7t1xqiDnsQ9A+0zRCAa5AFQ0bUlKWUF0/xywxCT8yVT25x7n2+LLaNvFRCn4GPVlMs7hJXznghEgR3u0LvlCSqh3XS62F3AXKGpTIBzpzCc5qqva9esbwApkAyRxkHV0AFvikkbnMXDEe2+5xUPlyrt3RLHBtzADiQPiteKlZgfDxtLGDrFevaugwjuQs8OEDX0QONL3zFLps5aHgRpvOZPsqJg+Slzm+Qs8lLlHtQ9mUuH/TcA4HnSrh4MXIUFtDnEArPL0UV1dlpsxWjUq2nh/fwoaa4Cr7qKu8aL3DNiSh592VCIgaR9YSa7bvAGZPrhRI1fIVLnATMeBt7MC+jiCYyI4icPbAUpbuUPrFSk2b6CW1czYalhunyTyk55NDgqrLhhPJlCeSKpW89QBiT11J9BTzDYdm8kOTXIgk9iPiDq+ZOQ7AdjI9XbP3D/5DFWj1y5voTEvxcLNRG509fVnNi8PoCxbNg9J/TwSpHGYab+nzISaV3/Ue6xPWnZ+VAiQOtlj4bThfxgM6SuiArVBADtCvs0JYR+4iqZ0cSWghDJghPBZ/b61VHNtwS+mBu/+2qkBfqyzLITfEDjIhlboQA0TNMftGL07txZLmSybbQS+bOkrfRvxHNFcI7ROQ2zTXZrRcm8nUYpjwmGMKyIPAeqoOhf6F1vwBz7sczW13suwTc0A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(36860700001)(966005)(83380400001)(6512007)(82740400003)(40480700001)(336012)(26005)(2616005)(70206006)(70586007)(316002)(6506007)(81166007)(53546011)(6862004)(6486002)(47076005)(356005)(478600001)(8936002)(86362001)(4326008)(8676002)(5660300002)(40460700003)(33656002)(66899024)(41300700001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 10:59:36.6934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da972d2b-64c8-4349-b463-08dbf7139a42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10662
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 10:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107277

This recipe is already in oe-core.

Ross

> On 6 Dec 2023, at 20:46, Alper Ak via lists.openembedded.org <alperyasina=
k1=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> The X Keyboard (XKB) Extension essentially replaces the core protocol
> definition of a keyboard. The extension makes it possible to specify
> clearly and explicitly most aspects of keyboard behaviour on a per-key
> basis, and to track more closely the logical and physical state of a
> keyboard. It also includes a number of keyboard controls designed to
> make keyboards more accessible to people with physical impairments.
>=20
> There are five components that define a complete keyboard mapping:
> symbols, geometry, keycodes, compat, and types; these five components
> can be combined together using the 'rules' component of the database
> provided by this project, xkeyboard-config.
>=20
> The complete specification for the XKB Extension can be found here:
>=20
>  http://xfree86.org/current/XKBproto.pdf
>=20
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
> .../xorg-data/xkeyboard-config_2.40.bb                | 11 +++++++++++
> 1 file changed, 11 insertions(+)
> create mode 100644 meta-oe/recipes-graphics/xorg-data/xkeyboard-config_2.=
40.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-data/xkeyboard-config_2.40.bb =
b/meta-oe/recipes-graphics/xorg-data/xkeyboard-config_2.40.bb
> new file mode 100644
> index 000000000..ec511c4f9
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-data/xkeyboard-config_2.40.bb
> @@ -0,0 +1,11 @@
> +require xorg-data-common.inc
> +
> +SUMMARY =3D "The X Keyboard (XKB) Extension essentially replaces the cor=
e protocol definition of a keyboard"
> +
> +inherit meson
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8fc8ae699974c360e2e2e883a63ce=
264"
> +
> +SRC_URI[sha256sum] =3D "7a3dba1bec7dc7191432da021242d17c9cf6c89690e6c57b=
0de048ff8c9d2ae3"
> +
> +FILES:${PN} +=3D "${datadir}/X11/xkb"
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107267): https://lists.openembedded.org/g/openembedde=
d-devel/message/107267
> Mute This Topic: https://lists.openembedded.org/mt/103021795/6875888
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
oss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


