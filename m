Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8B2C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 15:23:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.49])
 by mx.groups.io with SMTP id smtpd.web11.19790.1704295399250521445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 07:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0AYBHh0v;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0AYBHh0v;
 spf=pass (domain: arm.com, ip: 40.107.21.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bNzIdYzvPRJuMWAPce+esgXetilRGB2RhDgvVr7sMz2PAM8LtvXxddzBNovi/Ky8oCjYBwSdCL4D/xNvtok71YECyfXoxeju0pIqfCghJB1wIE0aSHfuskvPwRuZF1X3CA0/bE7Umb+s6AeScu/9lFV+sHvk4qjqfsrDe+hiQj8ahtaToryOSXYtCn7P9SAVslsT98Fa7XfHc0pMqrnQkv9WToqFbY1n277l1liXSB/suO1fd6cLn0DWNXfGJdap21b350aLVBCStIPntfC+PBSp2giix4Z5jtBUGwYRLyUn55G0O/7oePJ0KUGQhf0wH1efs38MIilkpQRwNW2jfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUhk/2D4257C16TwEvu1MyWc2LSPt3Xl9gUf8kE5W+g=;
 b=Szqd+vBM7YVPnXcm1yec7b6FZzvz3jb33NKpBMpUR/PvMECuPboNWVym419zVQlwwtihuADtn9hVu4GBRUUhEWXP6zyVvtr+UPI+vrpgXpHVRAhzJAjcAc0dzRdl3WV4hDVZEg2McTCvvVTqhgJ6kugkQ+z0E5GD8bzrFbt2gn24FCyvGv3KBDIXcRe1jRe5DXr2xZYEalXogKhIrA+ZHpZ/OADodAIQbhYYWIghqILiZ/bKyj6V3eqYTr3WTbpn7qlUKwVs7+NfUuSrXAxd35LsRFKC4ZrU4WhZka40kVX7I0LLwIBigzE/EE/3wFeQPuiBh/9z88by8b0KgM8xVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUhk/2D4257C16TwEvu1MyWc2LSPt3Xl9gUf8kE5W+g=;
 b=0AYBHh0vHFFh+GWMabvB2RiWodprbwn3IVFqQlNTxE+o+Eq6LLiPIue6HssJemQZpRTpkt/jLHebO1q0uU4PynyyTSTKtOhSmGKjAGpAsEtEDZzQc0R5ifdz9/iNsxSjkRWKwKHBCG1Ewqv5a4v7BBQWWVCE43UWguHLO1CTrWA=
Received: from AS4P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::20)
 by DBBPR08MB10604.eurprd08.prod.outlook.com (2603:10a6:10:536::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 15:23:12 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::45) by AS4P189CA0005.outlook.office365.com
 (2603:10a6:20b:5d7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13 via Frontend
 Transport; Wed, 3 Jan 2024 15:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.9 via Frontend Transport; Wed, 3 Jan 2024 15:23:12 +0000
Received: ("Tessian outbound 52fd419df13e:v239"); Wed, 03 Jan 2024 15:23:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fdef286b26f022be
X-CR-MTA-TID: 64aa7808
Received: from a4d7c4ae7eb9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2CA5AC75-75BC-48E7-921E-D797E7A51849.1;
	Wed, 03 Jan 2024 15:23:04 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4d7c4ae7eb9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 03 Jan 2024 15:23:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqlbcBgNedblOEuCHntpn4pOBROW0nRJjWR1Q2G+vkp5TsO9XQDfFLdNE1gJY0Vn9+MoZ9FDSDiCoaYCmwlR5Dsl4NY5ltvt5Az7YEOIMd1nTHJtmknXJsQ11rrSBtGakRAA84/5RN4/MuLKs2ib4wF5+Q+d9JFD3IPT69gpvs6OpEHMKBNuY77spKEz5NxHPb1zUXbWvbN/nK0vzFTxxsWPOzIoPGHRGxl+GkxMlRNqK5FMqStZJNUgYTkK2oUbqbYgFBU8HAP2Z+Rr7PKxWDuL2LsAKc0bY9obzY0J/YhZc01qjkCtuQfBD2wy9kwSf8eJdGFeQbYAqAxzXfWrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUhk/2D4257C16TwEvu1MyWc2LSPt3Xl9gUf8kE5W+g=;
 b=ElXznCjjEuZcWg+O8EOQ6Ay5xVO+PdJXWjbTHo2dX0SCxNWtOx6H+nqkXpEaYIpjiALUnYrna7FRR09Zk+o/BZkIJlWbfC9snvcsynn1Ig/R+mPJ7fMT75wf1n7Khi3d2ZSICEobSTcqXx0SibHDt/+AutGJ/OhNOszolWbmB+bLNc7GuXQe2iwmMbA4cQWvDshY/2mAh5Jo+nQhUlDfptl+2p3uliqi8TCyWEJFDe+6dkNyO5QWu9lwfkjf/w8IYUBNTnV6qrtzZpzl0pBlQPP05zGukUNWbRd5xrx64kNteWRsr1QWv+JciYdKzjy2QutgkE3Jo9g3Zt83UTBPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUhk/2D4257C16TwEvu1MyWc2LSPt3Xl9gUf8kE5W+g=;
 b=0AYBHh0vHFFh+GWMabvB2RiWodprbwn3IVFqQlNTxE+o+Eq6LLiPIue6HssJemQZpRTpkt/jLHebO1q0uU4PynyyTSTKtOhSmGKjAGpAsEtEDZzQc0R5ifdz9/iNsxSjkRWKwKHBCG1Ewqv5a4v7BBQWWVCE43UWguHLO1CTrWA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6004.eurprd08.prod.outlook.com (2603:10a6:20b:285::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 15:23:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 15:23:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 8/9] flatpak: do not rely on executables from the
 host
Thread-Topic: [oe] [PATCH 8/9] flatpak: do not rely on executables from the
 host
Thread-Index: AQHaNOk//GjSOmzu0k6aEp5kKpbHTrC1c40AgAAIM4CAEsvcAA==
Date: Wed, 3 Jan 2024 15:23:03 +0000
Message-ID: <073780F7-1273-48C2-99BC-C1C52F463F46@arm.com>
References: <20231222151108.645675-1-alex@linutronix.de>
 <20231222151108.645675-8-alex@linutronix.de>
 <C1S26S.CLJ4310DALJ63@t-online.de>
 <CANNYZj-LjuV2uX2N-_DuyoUT56EEXVb2tEw+WTdL8_VcSW+5fA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-LjuV2uX2N-_DuyoUT56EEXVb2tEw+WTdL8_VcSW+5fA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6004:EE_|AM1PEPF000252DA:EE_|DBBPR08MB10604:EE_
X-MS-Office365-Filtering-Correlation-Id: bf19a883-02e5-4fd4-4c6e-08dc0c6fe616
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 msH2S6xeEPJfPurOMQEaSi50m+jI8ukNrsG4k6JFRWkmX51leRrz/Ns1f2/slhSzPK7PrASUR6NbdGiXmcAZGoxU1bijx2WyiIbX798RtEfouYvvtrNdRdAkwzubnOd5nGF1iCuBpAVq3D032Uo1HLA5oNDNHcC3N/DUKxDwDGKzF0d6Gi0+WIZgt3iCwXcQ6PtpbGrr4N+dTiioSwIS3+swu1c12j+Nup9NC8b866L7xs23IhtncVK40WskxWW7a/j529I/E00WKwaQpo7cYKNz2QOChlVxkRhdL5dZ1EzfoJq7wadthX4M2zRZbty4fEVFW0ScSUK/COMmzQvu6FiE+uaJ6uZ+Qr4zqsSrFUcYDLI/J+4VPlP737iwXXpV3iMzOhLATlUrwegSEyX48XsHg8dViL+XBga41t7IoS+eK+9YCdehpgSEtFRShgz58hNpWfGVtb6pon9wPuZBATrJWbGhGxGvpxxZXRMZ7uU0s1SjBnjJN+R0P1h4RHBVnHIuoj875H4Cmc1FUR+ecFyS0vS48moMyYOuyI7GHwNg0h8oqN4/9VM3irxeAjH92EIJOsJLKl1mkFfNJz3PbQpb9z9WodjpaXtleybRA+Jgmmzl4EYgoVRnKSA3aB450MwPMPpTuHwac+J+cs65ydbw3BDBeBnG6BA9+xV819HrwfEyqDoxjKi8UJWSNaiR
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(4326008)(6486002)(91956017)(66556008)(66446008)(6916009)(64756008)(66476007)(66946007)(316002)(8676002)(8936002)(83380400001)(53546011)(6512007)(6506007)(478600001)(71200400001)(966005)(26005)(2616005)(76116006)(4744005)(5660300002)(2906002)(41300700001)(33656002)(38070700009)(36756003)(122000001)(38100700002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <16577F8F0E9E4044977AC4CFCAF40651@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6004
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d3a13269-b0ce-4905-19fc-08dc0c6fe0bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9V9S7DEYvwUuv6j7MtO7YpWHYYXnMXqj9cXWTCc5KKu9IVNVWZklL7W3nHFLu2qOzdT/ZT9unnnqLG3s6JKvlj9th6nriW1Ur+7RuZEYWG2SfxUQrA2sf+49rF3NXk7UnRUj3qEIuhZDhaU/l1KgsdAGCzrKt/Ou9CW3qfMl4BnCZAyeH3x3n2MpEA9NeQC0HSP6j3xtPGEPsFNQR26uvtY42dX1Jf2GREXVGE9goF5ASEaUbjgYVrv3ku6gEwCoZjRjmdU7qI6TmSZxrxZyqbwFRydKjABe/RDp3UV3hX06nyfkA5CVoTkQI3WTm75GFTuu90uzrECAUr2s/iY2u8YfA7zyeBec/ezHT/CrNYBwniIxyi0le6iXUvjjX3f8ZA8xjKBhKHTmbgqIsUlR92h+hTe6+gXmr/UYt2RUXb6GoGEhLgYBMHmHQpfk1Fy3rmWIo2xjkoT3J1yQNzZ0Cqm/sMEj15jGbWlEjotXuxwzW6ru2FHa0xKoDZA7BeFEETbh20ne08ylo9SuMAIXUMKs/ZHYxPQfNpGNQIPEdhinMaDwFpsdAWOXzIsFBUQVv//cAjCswsCrbgS6J0JsoMFeaTsQudBCL/b4BiD4cFmO+w8fOOM/jTR4xhm8I27Z6Rxpf06RPCqlXbXpEdZ/jErr3LkNB0cghsVKJG/6PTCAtVVZUCLDVTHR5ADyYuaY7GXMGp5o6nKH/Z7jElhRSlmDWv4AMEbhiuNbzyCPPEObtH2aepgONb1mz/MIYE7F+3CUSZQGXaP27mi/PxgzxQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(82310400011)(1800799012)(451199024)(64100799003)(186009)(36840700001)(46966006)(40470700004)(47076005)(83380400001)(82740400003)(26005)(81166007)(356005)(4744005)(41300700001)(316002)(8676002)(2616005)(8936002)(2906002)(5660300002)(6862004)(4326008)(36860700001)(966005)(336012)(478600001)(70206006)(6506007)(6512007)(70586007)(6486002)(53546011)(86362001)(33656002)(36756003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 15:23:12.0267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf19a883-02e5-4fd4-4c6e-08dc0c6fe616
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10604
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 15:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108033



> On 22 Dec 2023, at 16:20, Alexander Kanavin via lists.openembedded.org <a=
lex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> On Fri 22. Dec 2023 at 17.50, <f_l_k@t-online.de> wrote:
>=20
> -EXTRA_OEMESON +=3D "-Dsystem_dbus_proxy=3D${bindir}/xdg-dbus-proxy -Dsys=
tem_bubblewrap=3D${bindir}/bwrap"
>=20
> My understanding was that these were runtime dependencies and setting the=
 paths would ensure that target flatpak can find them
>=20
> No, it actually tries to find these at build time on the host, and run th=
em, checking if the versions are correct. Which is of course a bogus check,=
 because they would be provided by the host distro, and not match what is g=
oing to be in the target image:=20
> https://github.com/flatpak/flatpak/blob/main/meson.build#L254
>=20
> If they're unset, then flatpak instead falls back to internal helper bina=
ries that it installs into libexec:
> https://github.com/flatpak/flatpak/blob/main/meson.build#L351

This should be in the commit message. :)

Ross=

