Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE2BC47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 12:50:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web10.13935.1706532611041612804
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jan 2024 04:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MKixWpZg;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MKixWpZg;
 spf=pass (domain: arm.com, ip: 40.107.21.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CcM62nlD6Wx50+fQCloSV3xhlWf+tkkqxHoq68ghky3twovWZ41Uo/zWzTI21buKaY6zaSzAgO9496jmdmXVVjt5gnszqflB+5ueLrue7xS7nriuBV4VMsvuellgNWjv000MVlbnCGBccl72Ot8njk3YbpVc7uJfcB1Ce9Fv7rB01roNGo7JocshHsYudgfmi6h5vA6Lycs2dfeIkjuTq4czWMvOdca401/G7EuGPikVFpM/7IHD/24la4nsNyK72HdarU7xPzJW42Gh5szK0c1C0UzIwUtUzDN3XAV2LJfGqVCHvc5Hy6CgLI+yE5Cs3vgPNdbsW8AtuEODV9coeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CjnpKBK8fiTM8nmoNthM8tqAwFjLTY/r1ELbIfodbg=;
 b=XEJ+GJj1S+svVNjSukRixqp5q9XnaaAJpL9iHkrI+YWrFZbIRt9/3QT7lnXiNl2/K8ckszK9oObMC52spGVTbs+QfBd026aYAH7/BNNhrgIJXUPYosMULObHiO8GdV7nB69Kl9W5IOhfUQiOp9RCaQLSxmYEt99bvgg4CeW0a1EECul4kjzHi1oOPLya2S/iifP+8h1jOhr2r+rOGaXhCmtKVV5VxV0nHxIoaqoP8ioyQt319OAeCRSTi/0lmo3q+uWECz4EacjB+IV72t/peLx3dUxpov9khYg0UU8MmIxSprvPtccnHKGKK5k3MMIk2ZNk7Er2W5ZA6lA1wJoQAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CjnpKBK8fiTM8nmoNthM8tqAwFjLTY/r1ELbIfodbg=;
 b=MKixWpZgovmbKcQ6VVvpxB21LsHttPiOvDSWJcEkwbz/ZNeRQqpe6ZA5MCnIVuGK3I98r9+KftCZ4rwKFbIhlvPsgefp9sUX83QhfA4Uow8J5ehD1eGDck3pc9dqoBPLltC/Lf3wfD/anbuIpbzybdP9x50qFw/2Unr4vUSryRg=
Received: from AM8P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::33)
 by GV1PR08MB8641.eurprd08.prod.outlook.com (2603:10a6:150:82::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.28; Mon, 29 Jan
 2024 12:50:07 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:218:cafe::28) by AM8P189CA0028.outlook.office365.com
 (2603:10a6:20b:218::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 12:50:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 12:50:06 +0000
Received: ("Tessian outbound a064b9944658:v228"); Mon, 29 Jan 2024 12:50:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49a1a5732128fc75
X-CR-MTA-TID: 64aa7808
Received: from 925e7d15c7b3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4BBE09FB-2AA3-423E-80D9-9A7147F12556.1;
	Mon, 29 Jan 2024 12:50:00 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 925e7d15c7b3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 29 Jan 2024 12:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFNKwzvUYwV+SDs6yT2li/ZwdjiYhA7DmgyuB+avJOIRCDAr23baUBzjre4RGVbL6OepiEk9T+R8cxeFYYKUQEul0KDsbgUgl9SJjRa47kDc9lRy7VY8k3vBT7IqG6sdeihqCcwYN2nhm5g0ZptwiM1r+mgLdNHiQ6oeiUGL81rPbZe/ZimDAXrt8brxXIP/M5AeZK16oWhy3yFweJ2Inn+0HXLM80IQOYhDIXzRPslUKxJJXzPV4mLTFCMpz68SwAfY51Q8VntcGBwA+mcW8ZMIRat/dmOMOXM+/NkhLd30EMhVFxgtSx/Q7S3U6NXFeTYyI89RHuveyA52Rf3OyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CjnpKBK8fiTM8nmoNthM8tqAwFjLTY/r1ELbIfodbg=;
 b=DYlqF7nVMsVfL+8BOZPxegvsrqaI5JkYnvgHMgR0w2y5TpAAJCK40oFC6wyoc5iH49zUZuEgc8GU5hlHip7TkrYfYVVAc6C5Q13SDweby56khbmyS+Ia93E0YGgiK1E0ZYSL+MYs53k2R6Xqrd4SwCav+B0IHXrumSQpOmtHv9c6japbjR9n0vvPS/CSwGR4vbBvC3Uyr/FNi8tS33GnJFl7qBIZg2nLfZDWKWu5HX7bGPi26Z3x4soGV9V8C+cGfhqW2lUfa8VFQmmhhIAmQJ6mY56E4RWqt3z8Fb5IL9j5GH4WSoW68CDFn8cv4QnyB3JGR+6fWE0jSWQY+wlvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CjnpKBK8fiTM8nmoNthM8tqAwFjLTY/r1ELbIfodbg=;
 b=MKixWpZgovmbKcQ6VVvpxB21LsHttPiOvDSWJcEkwbz/ZNeRQqpe6ZA5MCnIVuGK3I98r9+KftCZ4rwKFbIhlvPsgefp9sUX83QhfA4Uow8J5ehD1eGDck3pc9dqoBPLltC/Lf3wfD/anbuIpbzybdP9x50qFw/2Unr4vUSryRg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10034.eurprd08.prod.outlook.com (2603:10a6:20b:64b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 12:49:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 12:49:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ranjitsinh.rathod@kpit.com" <ranjitsinh.rathod@kpit.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libcroco: Delete the recipe
Thread-Topic: [oe] [meta-oe][kirkstone][PATCH] libcroco: Delete the recipe
Thread-Index: AQHaGFvWAKdzLhrGg0WfreOti2WVBrDLQjWAgCXanoCAABW9AA==
Date: Mon, 29 Jan 2024 12:49:58 +0000
Message-ID: <CDDBBEEB-62E5-49E5-9C40-067A75A2B31E@arm.com>
References: <17414.1700118550683682863@lists.openembedded.org>
 <15134.1704446875517746436@lists.openembedded.org>
 <MA0PR01MB91748F5FDA28E9AEE745E56D8F7E2@MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <MA0PR01MB91748F5FDA28E9AEE745E56D8F7E2@MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10034:EE_|AM1PEPF000252E0:EE_|GV1PR08MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c99842-6e00-4caa-378e-08dc20c8d1fe
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 y81u6gkUsJrLuKvGGirOJ6Hz60Sn+AjLYFy/e48Z0a0pbpG6vqljQj8hW9ik+LVFUziXGkqUkcX67ywmi5P4yQSnEWOXwLYF18/i4nACrR2FcQYyBnvx8ztiromx76CCcQtHYJ3yw8Erj8GDj7uauHe2AKA2WbIgv2frtU0kpz/1cnNuNF10bSobMXbQ5VkKGsFXJmL9BDlEvl8V6/AUKqSs1wpF8BluMu3/6eItUz7wEda57ykvTdpejzndcNn+/RCNIUv1b7iNMiGjQA5XjCcr4QlcBiURa3UEksjmc/oqYZcxvlodrb0fFSx2ByXJSBwkXc0rWsQ16FdHAY6GNziOzTpB1gw3UtbD8aW80jDNl1XNHc2BtPt1x62PtGT/dncAjoNvB7NrgTj1Zb9vx+ZbAo4iZ84g1qk+VeqAT/+J63tO1AbtFU9lr0ezC3pcguVspIk8mLW69Pl8iTjtrdQ/j7cquUEg7BhR2xYuVDPretxT7z1OJAwAb0mtCmPmLMjHo1Hf23dNFUXLetpiF48eOfbA6pBhYDbNxHPCd4Uno96tlG38+18VFZ1edZxNhbsfOaTYEutEQjgb6kUDfN8Np+5L1Hc9rOOPwLFuXhGH80mulD5KXVSCexqW7Mz5pBnf9m/vEhtSiEZMV7QXhw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(26005)(83380400001)(6512007)(6506007)(53546011)(33656002)(36756003)(86362001)(38070700009)(5660300002)(8676002)(41300700001)(4326008)(8936002)(2616005)(38100700002)(122000001)(76116006)(66946007)(66446008)(66476007)(6916009)(64756008)(66556008)(6486002)(4744005)(71200400001)(478600001)(316002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F13E0C84CA86B046886E0B833C34414D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10034
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0a144ca3-479c-4fee-fa1c-08dc20c8cd18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SFXMS2DyjPWRfYMQ7oLEcSZ5oLwZoKMC137GeWJArf21MkxrX186PXN0lCazrH1jnUQXE+qobqRsuDy4MB0RRR6yrk0Nnqo4ogIUekwId3Nu/vMHYYq3/aZHUHXBF+RXj6+mP/e6XKK9/93uCyijOvgIy89s5WSNhDAg5QXtDrWrxN8q++pLgdkXoHAM9GK4P5Ud6jNfNdg5ykUX38XArSytFHhDAjShEil7hrPU2VUJ0UPtzm0kSz7Q1Z1APqLPcEvHpw1RNuI92sFSyGfYOvWUSVicrDX6JzBmaCbjraVB4hQOemJANYWWErkl48teNMANhhloIwTJPTIirWnHijkxPa4HvY1UaqIC27C90UXbjHWSDhTLIJ4347h+I7qJ/zM6E6B4JL4s4ta7FWvXiAOvTi+u+qD3JPgemUJB0ND8TJO7oxuWEJybB28J3q4kC/t8acyzIuZEH7Faz+UpwduI8LzHhkgWSURNqZzVN7zLtDmI1ehl061s1s733JXcsKqODnyVZ+JE6HVD5Wb80h4jhs4wBacRzEI1oIj0IrFZTeIvOcMYjFljllfsLOOSEX3AvTn20+ScQwbox5NqWCVf9xwIxHkA+h5ygYMhh55t+JPd6OizdtLnHU67FaLPu8ITgRX0c8x9tHSeKpPVZAd4/9XBHdCSVgpQp0g6dvUQq58Y5Mg4W+yDKIWl03bnQNl74uTke6ZroZLEFLIWOW/OKBWknr5FLR7Bz94lDdOWetPw5FsaSi2wvoP3LD8n
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(26005)(83380400001)(6512007)(6506007)(336012)(33656002)(36756003)(86362001)(82740400003)(356005)(5660300002)(8676002)(81166007)(41300700001)(4326008)(6862004)(8936002)(36860700001)(2616005)(47076005)(70206006)(70586007)(6486002)(4744005)(478600001)(316002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 12:50:06.7945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c99842-6e00-4caa-378e-08dc20c8d1fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8641
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 12:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108486

On 29 Jan 2024, at 11:31, Ranjitsinh Rathod via lists.openembedded.org <ran=
jitsinh.rathod=3Dkpit.com@lists.openembedded.org> wrote:
>=20
> Hi Armin,
>=20
> Can you please check this and see if you can apply this commit in meta-op=
enembedded kirkstone branch?

It would be unusual to delete a recipe from a stable branch.  Can you expla=
in why this should happen?

Ross=

