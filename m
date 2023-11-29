Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942C8C07CB1
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 20:26:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web10.49678.1701289604102767070
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 12:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=o+5ar+ue;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=o+5ar+ue;
 spf=pass (domain: arm.com, ip: 40.107.22.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F3cZl0Tar0OcaGqG8Wva7L6YKESkqvR5eeDdp5oumqd0yABDI0UpB0B5PdhryLgp4m4ypWPbftTOt5ZBzq9x6us3Qs/1qhJhzz8VnX/CMEt+d+VzI6RHzTIC/mOR+OlH3bf6xCGneOIFAtbPZWSgUJ1djEl+qVQc+v8TrEVVlUiB/ztOjlekS5Rfd3N60LXTf/OhFm4VluUOIIimJbKcmqKUU7O+KZQWIBCL2vSY1PKw84iTYuA7y6+LUf76/NWcnJikt5vaSmsvsN6Plb3gwvakgdKCooaIyspyL/rRhLtyPX8gBx4+5ezs7Koz0/+LNdJ93lclkqqR0Oq9fCeV6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtkWllL7R01QeHsnbfUNSEGVxPceHeYb444+SaKZIVs=;
 b=h6oy9nu8veGCfwocrD5J3ENwFx7gcbVzUI7qTGG5oOj8w3iHN66kBVUtYnRYQ0KbBqHmpQ57sBtYmBlcIXAol80Zmqc/l33fIUf+VVb7a3x2maDdVWJhGyIpiziKQIezXtFH07FO/3mS1rWJRcAwrWzH4mbLGDLce5b8kLF7c/+pqgfKAXSrJjlPeWBd9OiAf+EAqyWPd00n5Yu9XfVcjLKXWaYr6e+isvp23pCO/SVB9Gg8m4D43iIe2Dd/RYO42ft0LpHiktYIQL2qLmmDL+y8kxXZlB6G8p4XaQgskr3zybeO+jld1MNsa5uOGs9emtg0o4qCIcMCzxkqrmIP2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtkWllL7R01QeHsnbfUNSEGVxPceHeYb444+SaKZIVs=;
 b=o+5ar+ueQcDtFdul6Br4P/mMDicOwHXStgoLSR78oelN87Xjin/W9yJH0nEs1NgouBJp5DMSUQvX17rx4tGLvynUmK5gfHKDx9DqarP7+6sV4Z1aV+tdDqDN/7z/dB4coWXC1cTpetPwYeupnbAug5KFbDj3ypqEN16cDortoU0=
Received: from AS9PR06CA0411.eurprd06.prod.outlook.com (2603:10a6:20b:461::25)
 by AS8PR08MB10150.eurprd08.prod.outlook.com (2603:10a6:20b:62a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 20:26:38 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:461:cafe::34) by AS9PR06CA0411.outlook.office365.com
 (2603:10a6:20b:461::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Wed, 29 Nov 2023 20:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 20:26:37 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Wed, 29 Nov 2023 20:26:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5060020144bfeca7
X-CR-MTA-TID: 64aa7808
Received: from 03dea1b42652.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 14C482E2-2A10-4FE6-87F7-4F2A65B1DE22.1;
	Wed, 29 Nov 2023 20:26:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03dea1b42652.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Nov 2023 20:26:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr0NGiaHa+37oNP7dRs1x+n01567cFjdERo5VvJEum5f+eWer7Uvx71izw4H5boG4/0gK4NJhNzmfkU7yQJRnF97QPUGdn70wk9AkXfsbZKGcxlm1uQ2nc+14PSWHVIPYzzYNgY/r2AX8CbfFYg7bLdLhY7gihzry6v21LJNVuntlbMLXvrJgdb4jGnPfk88bSdjXQaTgo020tZk3kPClUciPA9xU33ZlLmB6t5arsgjZbFmH9/TNOhasZEzIkeQ/Mdn7IURUJMkgQxeoikSL38ZTe7KoODFkm/TjlWjohqgnF95Jcpbka3b28fSfmua+byliEn959HbKSWU1rEi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtkWllL7R01QeHsnbfUNSEGVxPceHeYb444+SaKZIVs=;
 b=EI/Mbjioyzl0H6Vsh9/kW9/5amdoFTmdpK40LvlKUavizhTqnx4HVM72+LXGCO5fqOIX7I1yDQvPtf7aBrFo8+iuAONYpWrxFlrv0N+1Z69TnFIAm6Ir9uwTA4PL99i20BQ3Z/oAnUmoFZfMnBWFqssLAzrfm3eV/xCvdX6k42JrdkArU1tytHWMnCDR9lPgWvT4gT6N18VogJuOMjF2a4uc7/mVNCQRWoM225clY0e5XDB+JYY3wLa/dqHIZspfjo8e5TOYpiH1c0lVb1m3i+u1two1AbJiqL40BY08FzVXdgT95yQVsrhOT+V9Uma0oIUTKmKQ/M6zrv8LW2LESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtkWllL7R01QeHsnbfUNSEGVxPceHeYb444+SaKZIVs=;
 b=o+5ar+ueQcDtFdul6Br4P/mMDicOwHXStgoLSR78oelN87Xjin/W9yJH0nEs1NgouBJp5DMSUQvX17rx4tGLvynUmK5gfHKDx9DqarP7+6sV4Z1aV+tdDqDN/7z/dB4coWXC1cTpetPwYeupnbAug5KFbDj3ypqEN16cDortoU0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9784.eurprd08.prod.outlook.com (2603:10a6:102:2ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 20:26:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.024; Wed, 29 Nov 2023
 20:26:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH 2/3] spice: Set meson version based
 on PV
Thread-Topic: [oe] [meta-networking][PATCH 2/3] spice: Set meson version based
 on PV
Thread-Index: AQHaIvwjGoKdFLo7w0aqw3wkzlvKBLCRvqUA
Date: Wed, 29 Nov 2023 20:26:28 +0000
Message-ID: <1AA94F28-E5DC-4F91-8029-862F0D965127@arm.com>
References: <20231129194221.5853-1-f_l_k@t-online.de>
 <20231129194221.5853-2-f_l_k@t-online.de>
In-Reply-To: <20231129194221.5853-2-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9784:EE_|AMS1EPF00000040:EE_|AS8PR08MB10150:EE_
X-MS-Office365-Filtering-Correlation-Id: 34589ac6-d409-45ea-dfea-08dbf1197d0c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zioI17BULrTG6img5pwkA3tJZ0uMloUvlOLQ2rMDz+Csuk6lFHq59u4uIfgKLIC0JVjg0l5peh3z6+mCkl4HIXs+12BE1UtD3yI9+s33J48Vfr205GHrQGI2OuWkgfLnPeoMV1SGt31gGESAtA2xabu3OIwg2/KlfUVGJ7keqndW6aeNxPfARKdQ1xNycCd+oe3V9ajg+b4XXWkh/briRkEO5ktI6gHb2TBZGeunfrVzoirZ80yBGw54VwgENt8X057ixgrZeIi9UbnHKEvgsJE+RWyXabqbyFZKjDsQpyKYs8dAi/orn2gkBv4aqXkPJfneiz86bGFbHQOkAhainKQ9tJoxJ5pYeBnGiuPvKj1IKppfUfTJmGEUswbHszf3ubPRZwScDJUeHY+Ae03Noe5d+0du3dsn8IDoLyH4yZgoCY/0axLK4QPWl50be+C8amKb9cnWI0BH+GJJ+gbeudJl0IdXZfzG0rt/r6orWiQOxqhzPq3OFApQOSyaUkO36N3A6/J75UVleHlNrYLBHoDXLzGDoJ0fjhzE55nG3Yoa9MAZKJR6jesLKDgVUhGmHQ9fYFdntI8MTE8FMZOQ7mxAeHxExMc35xR3nfio6sr308Ra/S0of+5Nsd18SFDnvEXBBEanVbQeZI2pJiDYHshDmSEHSpDNOCmvDTwi0Lg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(396003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(71200400001)(4326008)(8676002)(8936002)(6512007)(6506007)(53546011)(76116006)(66446008)(66476007)(91956017)(66946007)(316002)(64756008)(66556008)(966005)(6486002)(478600001)(6916009)(202311291699003)(4744005)(33656002)(38100700002)(41300700001)(36756003)(38070700009)(86362001)(122000001)(26005)(2906002)(2616005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <75720E8EDF3D2B4093F38483C58F9B65@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9784
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dcfc9073-6f80-4ac9-37be-08dbf11977da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aaGqTXHx6eKRVm8vCgfIrdZz6DNiDAWV8kGpR65nsqhhAKKRDT8CKbcKjogX71UUQI9rtAoHy7BEB6ljiCFsjRVYW//GLaZDd3ljDRp9p/0QrNJhl8s0VodOZhGL9vaYYx71jkAwaVw99bl3XvE0X0YIU76eBwe/WrtyolbX3qBE37xqzN7ENry7+jp4qhFiT1+9B53qMJ5iZLzNINoLzy7b9bbV+cGoiPj6Y44ymdxQ8TB8L/DFFFNTc+mwMrIjQZOtdXvBxEAuGCT3LxUI04mXSZwPIG4B6aUlVC7co2FReW3q1e7mPGpg91LZbGeTZ0xZ+fJCoLRdTMTIpxdedBhFqKksupn0uvrx1d53qmxlW9ut9lV9CjS9bH8CW6MrrG1ltK7F9/sNimCKiSJTQfRA/rI4etSu/lmP9ZokNQLdOoHvZKJQqmdK3/sX+wSXFXQPCyL7PO1BTsycmgDEDEYrgdgts0hFBBgcQmVxj+2tC472Dtu+tcLlA86F+HZfdhZwRFgwsyMykbG7jlOqwnaRySZ4ZdNrmyBaSj1TONsNEbBAv9F7Vu8ZSfLlnUaRZszHGsED0eYdjqcZlc/ezLV6xmkmCS1YJGCKkmmwakOHAOxZi5bERFL4f281yGJtJc7zV+a8WrtNC80rAnGKgIhk/bb5cWUFoTAlWd3GdJQ05H9FVPihd2VHgRpYjLyeevLItLjigiXhZ58ADlGyWgunMP31ckB16Btvd/yKw6IubgzxbgdnQWE/Mx1CvDjBnRkdr6fZzMQGUCaulSElHQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(966005)(6486002)(40460700003)(70586007)(316002)(478600001)(70206006)(6512007)(336012)(26005)(2616005)(6506007)(53546011)(41300700001)(202311291699003)(8676002)(6862004)(4326008)(8936002)(4744005)(2906002)(5660300002)(36860700001)(40480700001)(86362001)(33656002)(83380400001)(36756003)(47076005)(356005)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 20:26:37.7060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34589ac6-d409-45ea-dfea-08dbf1197d0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10150
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 20:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107149

On 29 Nov 2023, at 19:42, Markus Volk via lists.openembedded.org <f_l_k=3Dt=
-online.de@lists.openembedded.org> wrote:
> + project('spice', 'c', 'cpp',
> +-        version : run_command('build-aux/git-version-gen', meson.source=
_root() + '/.tarball-version', check : true).stdout().strip(),
> ++        version : '@version@',

https://gitlab.freedesktop.org/spice/spice/-/blob/master/build-aux/git-vers=
ion-gen?ref_type=3Dheads suggests that a better solution would be to just:

do_configure:prepend() {
	echo ${PV} > ${S}/.tarball-version
}

Ross


