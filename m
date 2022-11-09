Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8DEC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:33:21 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.40])
 by mx.groups.io with SMTP id smtpd.web09.3981.1668004394481764982
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sqU9CDMP;
 spf=pass (domain: arm.com, ip: 40.107.104.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=leShCm1jDMGOVqd1BH/OERp6fajNvvgy1UbpO7Bm6FT3lm1vh7XDDC+E7MbzN9FuL5OkmMRRaZ0pXlq5xBKk5UrhfTrpF2wM/QrSHiHB8q4RsFoYI3y7fqeRTVK56hPZyH1SJ2MM/E06HYe3Nee6fcue2SCNlf1yJaswD+ldZdKBf1KqRJI5etHlKp/JA69QzG6nOkkyU7bnDNIqbx1++npQRsgpvcktk0nM5AJmH52paFxAf7fG54pAji6+usS1bdPeva/QR+WCfRhSPr0VQNyBvEvXUxoKoVx45QGSUXrRm+79cVSx+KZrWzlh/8aTb/aZD7RGVadZL7iU27kcAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrI0qY81IKXgN9aFp19TKfnVsgvU9ObYFolGm9i/M0w=;
 b=E1M6p/l8ymHOy0T5YzpfshvjjRtOUbWc7u5wPoiprl8xx9p7dpTvTL20uReE36EwwlyY+EShyERrrpV8bf+isydMcxx3OwdzCMCqScZPjNQ2Ubq3NoFpd91WqylhaG0F92iK/jV9mfHKq9wZBfE5TStvXa/XlSBzBtSKKMKIsBe3uF1SVhg21UpjRsPCanjnF6B3cUcxsFmjwiPGCke7TwatZgz0x5nX82vIti06S4N1RhDXrCMG+fWNuj2KBrdPaI3Fp87jxMAMYBsKEW4L9Bop8N2S32f7dQ/Hz7+nJzjzz1qd1aaSbmxM1UgKSuFhjDWS4LEj1KPrk1E14Sp2sQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrI0qY81IKXgN9aFp19TKfnVsgvU9ObYFolGm9i/M0w=;
 b=sqU9CDMPooSSqizLQFnN/7+LXgi47GiYQgZFT8DSBXbGdG2hPI6pkA5r+9JzKfB8z4qSJA6i9TC06QVO1qE8bPOgyklwTQcFdPNPGXxgkrrjhIIn5im06tsMRClX/uECUt+zSiQ13iqZQ8jkvJr+B97wfzGACjufA1hS37RRG0I=
Received: from AS9PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::17) by PAVPR08MB9843.eurprd08.prod.outlook.com
 (2603:10a6:102:31f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 14:33:10 +0000
Received: from AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::aa) by AS9PR01CA0009.outlook.office365.com
 (2603:10a6:20b:540::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 14:33:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT065.mail.protection.outlook.com (100.127.140.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 14:33:09 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Wed, 09 Nov 2022 14:33:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b38d948bc5ba460
X-CR-MTA-TID: 64aa7808
Received: from cc775c4d4868.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D93FD140-6806-4039-8233-B68FD746B709.1;
	Wed, 09 Nov 2022 14:33:02 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc775c4d4868.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 09 Nov 2022 14:33:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzawPO2sn0/Mxxn4HEdtGYafSb03YoFgFpLVAOh7c9ZBJtVhUjhkeOduR4HTY8dax13pEKjis0IGgwTzaESOOqoGFJq+vs1kG5JFUzm275SHtvDB1iSWDQTS1+p+L7KN5CuHDBWsMti9kNzyEkoGdQtIwy3LXFI1RLOPCk4dhV/a3Lz5LZh0+IOMsI+khWXBHAxCLgTEE89meEd5q9LXPr6i4XGatJ5v9zQlHDD+yikYgKrPUSxFCrxhc1wM/4OeICv1YsqY46NkgUZYnEH4X7lsZD9dpDo2VWlsadIFBT9deU02USGD67OzAa5PAXkc9yaeXFR+lS61FVpQIrbuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrI0qY81IKXgN9aFp19TKfnVsgvU9ObYFolGm9i/M0w=;
 b=g3wPXk5cSHxXmTeIriboP42xp7KWL9GF17XnmxS5N1vcDr/W4gfH8tzS1mCFHxWMAyJtANidOESkgjwg18H1f7hmAN4cFkq/VvGEAGKKkDJddiCQXkRvEqsICzbXPwVlKW0+bC+9wa9MyI3UJAlgjqU1Qy+kLST83T/+gEzY2Q2HuCHYyYejsD9p50EF75dG0C/xJVqH1YWJR04XqZaIeEv/V5h6BL5gcKbj91LPl6GW9OUULcUjfOoDgOQGJieK5uyWO5uqk4KmbowDcJhEnVRCmahPT8lCkFluKbD8Iy/3Sh+1wGdO7oZuXDOUcZrXBeuBE6EH3NPwTJTPN/Rl1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrI0qY81IKXgN9aFp19TKfnVsgvU9ObYFolGm9i/M0w=;
 b=sqU9CDMPooSSqizLQFnN/7+LXgi47GiYQgZFT8DSBXbGdG2hPI6pkA5r+9JzKfB8z4qSJA6i9TC06QVO1qE8bPOgyklwTQcFdPNPGXxgkrrjhIIn5im06tsMRClX/uECUt+zSiQ13iqZQ8jkvJr+B97wfzGACjufA1hS37RRG0I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8375.eurprd08.prod.outlook.com (2603:10a6:10:408::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 14:33:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%4]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 14:33:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native and nativesdk
Thread-Topic: [oe] [meta-oe][PATCH] hwdata: allow to build native and
 nativesdk
Thread-Index: AQHY9B7Gyuz6ptEObUC3T3flD/vmxa42iwiAgAAO0kqAAA4zgA==
Date: Wed, 9 Nov 2022 14:33:01 +0000
Message-ID: <9CE090EB-662D-4CCB-B3EC-D103E13575FA@arm.com>
References: <20221109093534.2718027-1-f_l_k@t-online.de>
 <D7B0F690-42BF-4D57-9A34-FB8650CBB7C7@arm.com>
 <1725ECAD7BE80329.32043@lists.openembedded.org>
 <C123LR.D2SJ40BPAVYN@t-online.de>
In-Reply-To: <C123LR.D2SJ40BPAVYN@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8375:EE_|AM7EUR03FT065:EE_|PAVPR08MB9843:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef17b22-0538-476b-d36c-08dac25f532a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8U8l0lRJDhREzj5OcqFd4qPG07CV+MhUCj65isQniLym2KZ48iB02DCc9f76b+zq3SUos7lasv8179KH0j6dK4Jn+6rnRY/K0rqNuGmJNxIvZ8slvgpcMVcAXuv8nC+4NjSqZJ7iBgMGli5nkkzaHYtubnm0q8yZKc99RLomn0QRC2Efu+R/jdH8vydw1Zlt4k1BQLTcBie9GYpaGlI69XIgUTcRn0JXt/1uQI44VRpLRHFJq2sSOyGmIvxiEdU9zQsRmuY2dBpxVhCsx5W1elxv6JuAD6BlA7CiFJbsXk5ibnln9zRj81wv31ZDuGGl5UKUukRdrPKqxfvJt4dlIueOxhkmE/BwI3ZWzlAp2493p3Hc6uS9o8UO7+9Fw3mzLHG1nsW2u4xnK6RwJJy+g6sjJ6/nqUTI4gzz44VLSwdUo3tiQKkCw6pxXx+xlA3UUs61e+PFYqQeENGmkzfkhL5jxqqpUObGVGlO0JhedpMyMjJz6T3HTJc4KY4UswXgROoO0mUK9s18D/QCaiQhZQxsJHs7mQGwKx48+/32vzPa+qoMDMTDPirlAGrhX48PSCAEirbftOk9lTiYFKt8UkjEftDx/wPwD+9tJK30yUCS6By1JPBZyoQG8AXRjdokAG+l/e/YBeJu0dpev40B3a0DSfoVozYiO6Hsmwe+836KupTAUGVhrFNEnJwQcKVKyOvMR0q8K/BgZTc7c39Eag1GiOhU/hcerkyM6olEpyicLglo+KfBq4+FvpCf6nkzdqnnWJnMobtYNINPPJPQsji/EskrSpt9+qcd+UWo+gQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(478600001)(8676002)(2906002)(38100700002)(33656002)(66446008)(316002)(76116006)(41300700001)(4326008)(66476007)(64756008)(5660300002)(71200400001)(6486002)(66556008)(4744005)(66946007)(91956017)(83380400001)(38070700005)(8936002)(26005)(6506007)(86362001)(6916009)(186003)(6512007)(2616005)(53546011)(122000001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C118882600191147B00D36CCEFE1555D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8375
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f7cf7e12-9d46-4fa6-e706-08dac25f4e1b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hpVDnzx/c7F8agRvugDrK4IBYJbVHlShHcXuS+FyFh1EYrtrUuj10hsObXBg4tOx7tInvHr0m9rSi44+D0n20I7vlOPwP1gWICHKHTyvnMMy71TyS6ecYUA0sov/7NACsJ0+Cu6oJD3qnU8EUmIpST1jQgtco4hlh/lTuqFRiA6ouSxRLdGNXLGpuaX47/iiO6H4DTqpzwUqgO/n4nLh6NGbzrZTTu3gDXmSKRsaegATHBbmVUXtEFSPMIdxlLTNuHietCz8uambkId6zldX1kL9gq85/otyJosxU79ohpMuj8MJ4ga52pe0YgKStdlI9Tgl5MDwz9Dr1kVBcYYc9tYSdYGKv0vUETnGrLyjHg7sxSDLCaCsq9sKwLP7vnLEfSHil82SNjJxmdd8o8WuVY9feeEVUiOhujOLq9zKuA3JZq54twFnU45+HJ814fiM67SpmfMsda6nkxSQycvIjYhkZVgnRzD6JkAKj+ypQe+6q3fNM0rcyCawvVcJkRz7AMyNF4YwNeNNrCyplFr5LYSnSLEHgW6zNzjnhtEnMziN1Gx9xM+vjBc/q336tnrM2HmYhY2+roppNz3V3DGZIhQqWg/jU63hShYRHlXMkBuWYeJPaf1ufIPWvRBVyjtzygiwvIvottipSUW9S4Hj4S28PlINu01xCeoiwLI8dhrG4zwrllh1UdqXpqpNM+2HuxKwjE43MeAGFVu59IJGgX82PE3xmaC/RlG+NPQlRo8a+DYZbFjvkFYq7MQIvX9lvhCb0piXCy2r64RVGDMJrg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(82310400005)(36756003)(6486002)(41300700001)(8676002)(5660300002)(6506007)(8936002)(6862004)(70206006)(4744005)(4326008)(40480700001)(356005)(33656002)(70586007)(316002)(53546011)(81166007)(47076005)(2906002)(336012)(26005)(478600001)(83380400001)(40460700003)(36860700001)(86362001)(6512007)(186003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 14:33:09.8718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef17b22-0538-476b-d36c-08dac25f532a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9843
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 14:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99499

On 9 Nov 2022, at 13:41, Markus Volk via lists.openembedded.org <f_l_k=3Dt-=
online.de@lists.openembedded.org> wrote:
>=20
> | Dependency gbm found: YES 22.2.2 (cached)
> | Checking for function "gbm_bo_get_fd_for_plane" with dependency gbm: YE=
S
> | Found CMake: /home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/w=
lroots/0.15.1-r0/recipe-sysroot-native/usr/bin/cmake (3.24.2)
> | Build-time dependency hwdata found: NO (tried pkgconfig and cmake)
> |=20
> | ../git/backend/drm/meson.build:6:1: ERROR: File /usr/share/hwdata/pnp.i=
ds does not exist.
> |=20
> | A full log can be found at /home/flk/poky/build-intel/tmp/work/corei7-6=
4-poky-linux/wlroots/0.15.1-r0/build/meson-logs/meson-log.txt
> | ERROR: meson failed
> | WARNING: exit code 1 from a shell command.
>=20
> With DEPEND on hwdata instead of hwdata-native it fails like this.

I call that a bug in wlroots.  It should be looking in the sysroot.

Ross


