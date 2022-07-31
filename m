Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10A5C00140
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 19:18:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.75])
 by mx.groups.io with SMTP id smtpd.web10.16325.1659295130780690398
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jul 2022 12:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=1v9pf9Ho;
 spf=pass (domain: arm.com, ip: 40.107.20.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BMjwCvT2/FakLBvKZOlKRB/eedG5m3/mOtA2R+oNwQ5XOEFUO1mshyUvrcLK9FwwuvuZKR/tJaoKqty1DBl8hcnbs0Xb2zqXfle570xzIY0rDAYgsQLEWqBlirk5A2NZWmsH3NccZOcwqTkbp9G5E9y4VMuTexlXpiaYHuKqdYYc62KtmDjWYIeimPioHLL2iuwiKc6wALIkzBQ8/qrVEjclnGCpIUYFe9wkYlpKEZSZm6hsOsv0qRqrYkUAoP9Vnkl0xAU1jOg2nuoDwhdyoE3ZomwVsuv7ZnkFFYWG3P3sq3Eb3eEVZA+cPbI3i9r88+tzCaBeGb8RhYTGALj+uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmIxFY1lK3vu02O0UzrHJZOi29RvnggHTAfhbAQGL9E=;
 b=F3lGbQ5lc3jFSp3jaNMJ/KTJUYdSFzoQlAa+pbtV6uV6LCtUes1tA8nGsX4fXMMylVLxfLEelpvf+ry9+40O5mbbOxqybvh2RwO7cOxl4rPi9DYzuLWLfwaowVuiw2G99UzWUOEztLdBcFwFZOfA86wyjngkYs9HCvnuG9/WSKIhrJm+94Xj+IMUDHiHcyOpj6YW4ApH1vaDoLV6kH2exyO/8tVhcT1MJdA/5DlgKtXUSrsi8UEW5+2TbW6VfhUGnWEkhbUAsq+zyHNnervFVJEt7eUOaPlSqNjm16b57mi/pobp9s82OLxahV4W9OnNDk/ECeyDeM6opVd0F9FGjw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmIxFY1lK3vu02O0UzrHJZOi29RvnggHTAfhbAQGL9E=;
 b=1v9pf9Ho/oU5T/7OMyF0u4vy8TV5DwqkFCPJnupmtd+FBHYp3s2k+pRTVQPR77gVC6GVQLUNyED9vCb4b4Lryv8+0xc0itVdu6dGaf0zOwQF6ZyG/+vesxdso8PO5uRjUKhPj4XV7RnMHWXppQ7vAMOZBtbq7C80J9BaxPB2AMw=
Received: from AM5PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:203:51::24) by VI1PR08MB5424.eurprd08.prod.outlook.com
 (2603:10a6:803:136::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sun, 31 Jul
 2022 19:18:45 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::72) by AM5PR0701CA0014.outlook.office365.com
 (2603:10a6:203:51::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.13 via Frontend
 Transport; Sun, 31 Jul 2022 19:18:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Sun, 31 Jul 2022 19:18:44 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Sun, 31 Jul 2022 19:18:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79a9ef798188a42d
X-CR-MTA-TID: 64aa7808
Received: from c3b704c49a37.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BE80757F-A36C-432A-897A-DA1CB22FF2FA.1;
	Sun, 31 Jul 2022 19:18:37 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 c3b704c49a37.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 31 Jul 2022 19:18:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JETKzFavX/UrnVec1xZYAewThmcRxxOIGCaegySdCauItoe6iR4ptqAPBllHlHk6BZC6e5tTBChuubMnrHOu4UTaAPW2cKkVNVVTijr0TZ6kkd9x96/0ZPMXSkriAzdL6A9Sn5mC3fBwQrjg972irXdHk7ZDr7aOo7jz8nA/NMc5wvCvFb1CWy3wCLMcwYC7LcoD3gLMRanKqejBOQynIwOv2VkCosTC74qFNWhVeoC1bsYdsBHrmt5Eyn1b23jrv6IeLNEIRrX+OtWJnvEtUeO3d2EW0WPrXXmzT7g/fj70m8dak9A1LaBxJLxIBQKIPZ1ImZBMJEm5aiJDZ4cWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmIxFY1lK3vu02O0UzrHJZOi29RvnggHTAfhbAQGL9E=;
 b=boqEQk6R+X+Fd7TWoQGPvISfVPWzaqGY4wZ4mNlI9LUqhhk0qsHPVLUMJoJxlhu45y2XL+Ik9BoBTmcWu6LocJ/BxQHBuaC1vZa9ECRntS+rwxd2vGNFlY/uf+waD9Li/EtWtgGtD7dnVjv7L6EHbOEY3kYXfi4q/kzjVNUzQzm7SwkSBitfIxX5vYEdlRicI6Os4x/bhf4byj0PWMOF2K+LxYuX0BueLTSVvSxlWYJQUUDUmOOvFBKDv4NO9dSPiQAmSWEzpsBNZdfVgWVgEywH6wD673+OTyciM86d+0tWFuXgbvDJ494JHEFwFHdf66r5mnLxP91DFUreaymn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmIxFY1lK3vu02O0UzrHJZOi29RvnggHTAfhbAQGL9E=;
 b=1v9pf9Ho/oU5T/7OMyF0u4vy8TV5DwqkFCPJnupmtd+FBHYp3s2k+pRTVQPR77gVC6GVQLUNyED9vCb4b4Lryv8+0xc0itVdu6dGaf0zOwQF6ZyG/+vesxdso8PO5uRjUKhPj4XV7RnMHWXppQ7vAMOZBtbq7C80J9BaxPB2AMw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB4365.eurprd08.prod.outlook.com (2603:10a6:803:fb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Sun, 31 Jul
 2022 19:18:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::29f3:60b1:981a:c24b]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::29f3:60b1:981a:c24b%7]) with mapi id 15.20.5482.014; Sun, 31 Jul 2022
 19:18:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vince@underview.tech" <vince@underview.tech>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-multimedia][PATCH] vlc: add virtual/vlc alias
Thread-Topic: [oe] [meta-multimedia][PATCH] vlc: add virtual/vlc alias
Thread-Index: AQHYo7w3CerewGuLFEC9Nmdin2iiMq2XTtCAgAAfOQCAAW8igA==
Date: Sun, 31 Jul 2022 19:18:32 +0000
Message-ID: <F4C16675-96FC-493B-8B2A-601C47ADB641@arm.com>
References: <20220730022855.50524-1-vince@underview.tech>
 <8D884F32-A736-495B-B9A0-AB06F11DE265@arm.com>
 <CAPQx_gMv2y3L519Q=+a3ckLdsVfD=QDf-X6c+AUGUYb_Ed0zaw@mail.gmail.com>
In-Reply-To: 
 <CAPQx_gMv2y3L519Q=+a3ckLdsVfD=QDf-X6c+AUGUYb_Ed0zaw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1da4a48f-1fad-4a9d-38ce-08da73297c4d
x-ms-traffictypediagnostic: 
	VI1PR08MB4365:EE_|VE1EUR03FT038:EE_|VI1PR08MB5424:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 eQFeIN/aY22lAEBA2wILCPrDfY/7EEeeq/B/6xRVtwt8aEPouh7k4UOv75DKGyoBp2NPjwh+e3/qPbMv47luhAOJGDitYF991AAx+V+Ecg5BINBiA+26ywYBY3YH2Hw+cQdrXWysCyIIluD1uSyOTG41PTtYeJzapey3Kli2dlDAx2dpH9XEcv820wmxv1S4+LziW9JDshkFChyIJeXuEF3zsvaW+rprgFwTtFyL8XLlGAI5+JplshsfjtkCpS87ApSlYeaEdYK8T7BKbIjOBrgcOmuNKeGT3FMT+VmMq3LMNCecwTHdnTjnDL2Iyv599sY8HMDcy3DXkN8qIJJXZAbDLiHggakBDLSK05numwvoeXmsewlquFFCwCdPy2WKlKvfYwdgycixyL0fiJBAEE647GttVQ+74EMIWYeLAGWlFexvqdeTO0eoR+++uE3EuPmQ16k8eWXDjnF9WnCJohJ19otOmrWIIr1WYeVsN20FDaSYZre+KUoRXRJQrPYi2BGWv60dN3xnHzeP+jWFvwMa9w4syLzIqIcrd1BQuG2d4AIiV++8a/GFltrFBf7kw3iArWvRS6OcKrTNKfg7GQqoJglMAMgVu/9Pe+UPTEmrmgRFZVIx9onUeTBxtCPWtvo4IdtZLVvuPiZeJWW2oo38lwPuMJqdwz1v0tBBcQwGR3b3VswRNhaLUJOH2BMnZJnrAt0AdajKIr3wgK3vrp5LyXv87X6nol+cp6SmarpkN6INOE0/o2ureZlUbOIVGSOpeqnUtul1SptPlDWAJFUYLC4yZ76meHZDVvxtPr0AMgRfK+4BIblU1RCxpAA65saJtBKXL7AQ2JoOEiSnHeHmmIf9VpTxCt6+7RdQQ+I=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(346002)(39850400004)(136003)(76116006)(38070700005)(66556008)(66446008)(66476007)(66946007)(64756008)(91956017)(478600001)(33656002)(6486002)(8936002)(966005)(5660300002)(2616005)(186003)(71200400001)(8676002)(4326008)(4744005)(53546011)(6506007)(316002)(36756003)(2906002)(38100700002)(6916009)(6512007)(86362001)(41300700001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F689409FB6D914CB7AB35B89E7B43F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4365
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8a388013-47b1-4996-b6a6-08da73297542
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nmw3c25O4ljMMA5SZ3imD7hiv86ql54ORpS7cTGpayy8CmF9ITc6/VfNLh8m/c2fbtHSN4qCf45z2sFFlHlDe7czs9/7cljjWI/gs4780/HEcS9VB0ebT+ub9sbiuGm9DpumJEdRJyGe4ew8FkoIFEl73R3jI9Ad3n9fbJ4OY0KiuUJZNcpNDlxJdAekCe541yNvdiggTn0lYJFtv4yj5IGS/0+jYs2P3u4t5zIMML0OYDE+gol7qFT/ZGyAX1Bv2b+KHS+w/nP6R8m7uy7FhPVevX5zGroMVC29ypSJdYAZYRiorOPNC3uVpPJMVO3O/sipQfpw/3x8ZfcOaGIHZ9aNwnpcOv5nJWEgQ6AwxNyBJ3UMwo4fXNBVnBt3s2pZqi6fTsj+Q802+pNVNVmPvBrgpS/lh8nQ7I8FSy+xHyxSOKIDv+DPdcJ0OFDvD4NGPXJm2mhmJU9MlMfdeCsMhu9nmwGMAkuv6CpM7+HMR+XHAamBYvBIj8ZnQlwEoZkAh0ZI+sYFfLl6pkO5FUnHqRmds/cO2z/re4UVo1AjLwkK70VIILjqnYd8YxwB/FP7tSRKUUXY7DOhyyHDbODc2F6IOJf9BNik5UhctYaFoSG8om9FZ6nOyPTTZ/RDwl5JrWEz69Lqgv2wa7uBzw5iDTrmb9tNHG/FZj6gJyRyOEN9v6qdbE66zUWQdFJ2BNc9nMKn75deSO0ckaAJrzek6IoOJNVYk1Z6bi+ZxgBWNJKG7zwUO/dm5zBNSWkedE3bm0ApQ9JBDTBwm2Cu9AUYPHN+TuTs+Cb9xkO1NBqu1yYFOtGJtEoqpd9W3mEabRpK
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(396003)(136003)(376002)(46966006)(36840700001)(5660300002)(6862004)(8676002)(8936002)(33656002)(478600001)(6486002)(966005)(4326008)(70206006)(70586007)(86362001)(6512007)(36860700001)(26005)(40480700001)(47076005)(336012)(186003)(2616005)(82740400003)(41300700001)(81166007)(356005)(2906002)(4744005)(6506007)(53546011)(82310400005)(36756003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2022 19:18:44.1541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1da4a48f-1fad-4a9d-38ce-08da73297c4d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5424
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Jul 2022 19:18:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98067

DQo+IE9uIDMwIEp1bCAyMDIyLCBhdCAyMjoyNCwgVmluY2VudCBEYXZpcyBKciB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8dmluY2U9dW5kZXJ2aWV3LnRlY2hAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBIZXkgYWdhaW4gUm9zcyBzb3JyeSBJIGtub3cgSSBhbHJlYWR5
IHNlbnQgdGhpcyBtZWFudCB0byBoaXQgcmVwbHkgYWxsLg0KPiANCj4gTWVhbnQgdG8gc2F5IGZv
ciBsYXllcnMgdGhhdCBjb250YWluIHJlY2lwZXMgdGhhdCBjbG9uZSBkaWZmZXJlbnQgaW1wbGVt
ZW50YXRpb25zIG9mIFZMQyBhbmQgd2FudCB0byBhbGxvdyB0aGUgYWJpbGl0eSB0byBzZWxlY3Qg
YW4gaW1wbGVtZW50YXRpb24uIFdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBQUk9WSURFUyA9ICJ2aXJ0
dWFsL3ZsYyIgaGVyZSB2ZXJzdXMgbXVsdGlwbGUgZGlmZmVyZW50IGxheWVycyBwcm92aWRpbmcg
YmJhcHBlbmQgZmlsZXMgdGhhdCBhZGQgdGhlIFBST1ZJREVTIHZhcmlhYmxlLg0KPiANCj4gV29y
a2luZyBpbiBQUiB3ZXJlIHdlIHdhbnQgdG8gYWxsb3cgZWl0aGVyIHVwc3RyZWFtIGltcGxlbWVu
dGF0aW9uIG9mIFZMQyBvciByYXNwYmVycnkgcGkgZGlzdHJvIGltcGxlbWVudGF0aW9uLg0KPiAN
Cj4gaHR0cHM6Ly9naXRodWIuY29tL2FnaGVyemFuL21ldGEtcmFzcGJlcnJ5cGkvcHVsbC85ODUN
Cg0KSSBzdGlsbCBkb27igJl0IHNlZSB0aGUgbmVlZDogbWV0YS1yYXNwYmVycnlwaeKAmXMgdmxj
LXJwaSBjYW4gUFJPVklERSB2bGMgYW5kIHNldCBQUkVGRVJSRURfUFJPVklERVIuDQoNClJvc3MN
Cg0K

