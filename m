Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122E0C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 16:49:15 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.51])
 by mx.groups.io with SMTP id smtpd.web11.1389.1702399747920323107
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 08:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=B3EDcBlg;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=B3EDcBlg;
 spf=pass (domain: arm.com, ip: 40.107.14.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ed0MElR/IaBhnLlyAvneD3vby/RIINLRTywDt+1Yw5I6eWSlk5JKpA1iNS0DSzBfBRNamKaeD/PVyWR8PEx2vNwibvHwSJfTpmcJtWvQcMlHI/lAQXYfbclIOyqLREDZshH0duM3fMjwd91yzjSUBydhj+2PVW8TUqHbGgWXoHBFPjUxoNfkctJHgXqjuz9M0fesSwoFDS5Znyuz0XkBt78hZUSf5brGrDYcEBkZnRpg9nNbkv6Wytvx1v7pbZoDMGgqDqU2ceYS/LoUREVg9kAHCF43mE51A3nXWtQjWXKMn7FM6aEvls8A7Q14qzRZeVvd1XCO55SlFoyFGXwVbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQcH2/sJqwPvfxDpIlr8pfGRccbBJ8iGQetvol021ec=;
 b=TunXVsD2EVV5YntkCf24rb/UVjQxFCso26mBpIbT9gYAk604FyGJMgsXaRi/ufOohNvsZrlMT9tgjTSEjojIszA84vcFdYvqbpkxcMtOqlJIwEoiFH3qat0VjeaVoFzzpvTUYh5uSw8D3+plfsr+mAvSGB7LQH6z4g2OxtDW7j4vuVI1uWn61QIFdGqMFyakKe1DObZIVjNGUhOZEzsldxDAafDfYb39HaYtQxnfEK5tb2C2AyP4ATNdQxkS9QZULvsRwWDtra9GZQYtG6Z0LbZqE0VkXPUKTjGNvFd8GPddHr/R71bXvroXeCplNZ1kv/7n8zngpVTSEkWz2S1Z5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQcH2/sJqwPvfxDpIlr8pfGRccbBJ8iGQetvol021ec=;
 b=B3EDcBlgdCDWddEKKavdgtvhroOI+a1DpZjn3wcMKC+TKR7e9RK/DXAfd01y6OkNVvMkr0GDk2I4TGFMkdZZs5OYhXuTZkh5erctcYmx8uD7nsHMZwQHkqIbtaK0iSe4RBYPYTj2//TlQKZM8BZRVJXRrOhSqRigl1G3POtOD1M=
Received: from AS9PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:20b:492::13)
 by DU0PR08MB8139.eurprd08.prod.outlook.com (2603:10a6:10:3ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 16:49:02 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:492:cafe::60) by AS9PR05CA0275.outlook.office365.com
 (2603:10a6:20b:492::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 16:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 16:49:01 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Tue, 12 Dec 2023 16:49:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: adf39d9cddad3382
X-CR-MTA-TID: 64aa7808
Received: from bf36559edd42.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C2CDC15A-1E10-47D8-9FB5-52CF1BAB8C3F.1;
	Tue, 12 Dec 2023 16:48:54 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf36559edd42.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Dec 2023 16:48:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHwGKHH6414DSs1ZLEv0uIokwCAPUPtMeI4JSU9hHz1meX2Qx4TC8TCDkrPduw/HOQGbBbxBiuwu5SIuOe9DjpLx/goreTwP6lMBjVdXJ18ZwGlkTiFUfuADkbEPTlUq2iAeMUOkwnl/BhjJvgicMK97/P2WsFcaT15K+4gloFGfggCuKCYsRZClof3DRJ4iFUIK9rG6rknwzotWktVLvZH4L8mm40OWdT0Rpbg0FZTWMTxinh24C/Mqsw0a8q66BWcanxAt6ZxNsKXPl/cpe6uihxfQcZALWJ46sXhGIIL5JApcGzXy4KJISyekrNPajr7ANdXzbmDbUIQi8HfpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQcH2/sJqwPvfxDpIlr8pfGRccbBJ8iGQetvol021ec=;
 b=GqLRz7rbrsmr1caLDv0sLxHWtv+cVcAIAuAEETrcPMnDAmsGE3tyxxrJRlxH3uANEZKKhXGD8KIkNb9xbbM/IdghgMde3R6jvCdwcpmN9RKyff7VafRvwFCPrVSrbKPW8b+SWE7ymgz0HY4EEfjF2p+00zhPMeOmNsGeXjlCgUGuOKymMzse6m6aaDWaGMPDHOuP0E7jcdZ5s/WnXWeOQ61QFxZ4MmLofiNBC/eGLwp1nlDzFpnHZv3htQDF33elVxdaBmtFwiDYEBt6L5mLt4pit0FlBZ89/Y+yHMkK3UmyfyK/Q41y15ubKY6usQ3hKM6iuGbQS/PPXgDlrH+7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQcH2/sJqwPvfxDpIlr8pfGRccbBJ8iGQetvol021ec=;
 b=B3EDcBlgdCDWddEKKavdgtvhroOI+a1DpZjn3wcMKC+TKR7e9RK/DXAfd01y6OkNVvMkr0GDk2I4TGFMkdZZs5OYhXuTZkh5erctcYmx8uD7nsHMZwQHkqIbtaK0iSe4RBYPYTj2//TlQKZM8BZRVJXRrOhSqRigl1G3POtOD1M=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AM0PR08MB5490.eurprd08.prod.outlook.com (2603:10a6:208:184::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 16:48:51 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::1fc5:537:c01c:c887]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::1fc5:537:c01c:c887%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 16:48:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Robert Yang <liezhi.yang@windriver.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder
 aarch64
Thread-Topic: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error
 builder aarch64
Thread-Index: AQHaLNobhA1bLkdDrECy1oZrw4/DPrCl2qqAgAABwIA=
Date: Tue, 12 Dec 2023 16:48:51 +0000
Message-ID: <A4B1763A-59C1-456B-9734-569475DF2174@arm.com>
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
 <04DE494E-01A3-41BF-9E0D-591DF8ED739E@arm.com>
In-Reply-To: <04DE494E-01A3-41BF-9E0D-591DF8ED739E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AM0PR08MB5490:EE_|AMS0EPF000001A7:EE_|DU0PR08MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: d55d62d6-25e1-4c45-f4eb-08dbfb323e90
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tpJCTb199nNleSPCNpD+wbw1K/F3r/3y5JyeDh1mEnWlBbQlTuxFN5Iy3D3zMTHA0j75/Mqc2/2Pp6R84Wlf9OEvgDkANyfaVGHLeCevwbW+wr4MpZ4mOUGJWeO5PQwwovQP5CdKt4hU9KZXISauLhGpkYA471W0BSP/Ugfbe/xWgEc+/Ga5twyvdQ4SNY9dwcCA6Jz+/ZchaIpzE1DEq9lQGb3RKYZyqogA31f7yNmKQsw6mLi/VNmuurwp/sEN3y5C4aGvAKzHlyLS6phb1UdePO9ZO/2eL2l/Zpyn0DDFky+pVIHsGy/qpB+KAF51XdT4a+HMMTeioyF8CZEWcuGCqsWcpxVlha2Z5zAxHWFBNIQAA3/f4gKaFvy0OTo6HRYOhuDwAnadqhjKZ/Ti93044zsYvzCz+hfmx0uKs2rlP6mg4FxQnG/vV5b6jK+kdq+bL4Rb/yoesxvM31RmmtGrfBhTm4GWvjwqHUy3DrmG0CqV9a7H32mlPaCIvil1tMfY9gfWxzzJL2RUKFVZgqlhfGRqek4Nqz7HMtzf2gXi9LIx23Q1/fmtB1mhJyrnU42JhbI7kWYbybeggGAatx7SGIcfALsTPINBHibsq44foq/aqaUCcAY70Sh2Jalj
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(122000001)(38100700002)(8676002)(71200400001)(316002)(8936002)(86362001)(36756003)(64756008)(66446008)(66556008)(33656002)(66476007)(91956017)(76116006)(6916009)(54906003)(66946007)(478600001)(6486002)(38070700009)(966005)(2906002)(6512007)(4744005)(26005)(6506007)(53546011)(5660300002)(2616005)(83380400001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <435F01757CFCB74B814039DC47E0805A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5490
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d3c8a9d3-fabd-4db9-159e-08dbfb323858
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wTFBOOdm+X0FpCHcJ7DDPC6zNQt5R+9L2WJSXmBG+QByMUUI76GX356y2u2HvT9dnrQLh8c5wPww0e+Ql3uONc1UpsJWTF8ZVhnbBuJPeyEQdEzL8eYApBs8k4C1zcdkKj8dPLErfSTRhY2MLU0sIrz51YvyNAfWSnYbm85g/HzrVg0Pl5Xk6lhJY7uKjztVN0PB78MqtEhMObZWVK+DHliCbrmWmac24Sjw/3qrY7b0p9I28xmdgpR52uLteKz8vsTjBoGtuNhL/DBowKy7yLe5u6JrvznKXrwggNq3NWc7c9ywMToT4xfZPU7rZLIZ/z+4M0tP6NLH+1PqlVz5FRDPT8O3v5uT2gkwDIxqLhj9u9yoOfGWeUWWTktyBFXsK+jGN7QEsjeZK5oKkNu9+pK6PVsK+oOfvfSc4GENvtfIoUfN7/GOsLINzopzFc4NI02r7ah8oWG5P4KlwAIFVJzYsYFdFZqsm/Iph4ZkpMHjb3WIwBs31fxvFEKjZLSqhsIvydVy1nxkdi3EGyVnzuswv3NitaBKTMgc0kMyGCewx8ak7Cz3GaYBQ+wAsTNSyazePYGrvuhBfkFEMwwRDBrwExC7XG/u68rHuwMi8xP9iALFTw2QFQx2AeBSy9HYN5zfWPzFfm2aBUUoHqEjLUa4HGfh7lgXovxXi76+3ibICVvae7N3488Vhl5ELt9kLsacSIsyJujV4I0NMv0FxAcE2VEe2n8fn9Pp4N0dinE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(36840700001)(40470700004)(46966006)(6862004)(8936002)(41300700001)(8676002)(2906002)(4326008)(5660300002)(4744005)(478600001)(36860700001)(6486002)(966005)(53546011)(107886003)(83380400001)(26005)(336012)(2616005)(33656002)(40480700001)(47076005)(6512007)(6506007)(82740400003)(54906003)(316002)(70586007)(70206006)(86362001)(36756003)(81166007)(356005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 16:49:01.9055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d55d62d6-25e1-4c45-f4eb-08dbfb323e90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8139
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 16:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107337

T24gMTIgRGVjIDIwMjMsIGF0IDE2OjQyLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gQWxzbyB0aGlzIGlzIGEgaHVnZSByZWQgZmxhZyBhcyBpdCBtZWFucyB0aGlzIHJlY2lw
ZSBpcyBlbWJlZGRpbmdzIGl0cyBvd24gY29weSBvZiB0aGUgdXVpZCBsaWJyYXJ5IGluc3RlYWQg
b2YgdXNpbmcgdGhlIHN5c3RlbSBsaWJyYXJ5Lg0KDQpPSCBERUFSIEdPRCBOTy4NCg0KaHR0cHM6
Ly9naXRodWIuY29tL2FwYWNoZS9uaWZpLW1pbmlmaS1jcHAvdHJlZS9tYWluL3RoaXJkcGFydHkN
Cg0KSWYgSSB3ZXJlIGFuIE9TViBJ4oCZZCBiZSBCQk1BU0tpbmcgdGhhdCByZWNpcGUgb3V0IGJl
Y2F1c2UgaXTigJlzIGdvaW5nIHRvIGJlIGNhcnJ5aW5nIGFuIGltcHJlc3NpdmUgbnVtYmVyIG9m
IENWRXMuDQoNClJvc3M=

