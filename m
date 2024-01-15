Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D4AC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 10:44:25 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.83])
 by mx.groups.io with SMTP id smtpd.web11.75516.1705315463497418978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 02:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nqoX/2Rx;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nqoX/2Rx;
 spf=pass (domain: arm.com, ip: 40.107.14.83, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MzAIJf5ZFd6NcF4o0AdInAz0vUjjonT9FlytOo3bBEHAXaooWKIa8V9HPpWiktf9/xMpk2gZqPkJZ5tl/MSjSg4m3vpXtTp22H3fOkQA6Wk+n54ibyZXCKTVzTKfDe6VZElklYEkRdIjbAeI+JTBVRZKxfGcM8/VSwjAxqdslu5z0fWSh76TlMiCasRI733XE9WtaRl8SlyB5x4bhhdbOGAbMXaaj/7mjKcMW499GPv6tsK8kY9zL4RhXRLeBL0ditlPOxu4IayhSmSYkDcTJkv9Fkv1ymnf1l3A6Wpb7ICkYNX7qF40j352Z5T4MGC90EtDanU4mA/1//lnoA1UmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB28Sp0YtCCoX6d5ZASgMtjdhGwiwXWhhDj+RBYs3kM=;
 b=dnQHV7Qs1ZDuEvSS9MyD8dh/koHHGFB2VfEVWBgSHdk29fEXbUShGmv/QNX7AL+8WpO3zXIeLaLAMxXR19k1LwT7BDRbQsYkfBXSuURgK+yWk6d+a9VbGqhLFnbaf4vvO4/WkAE/7jAbt8aHQV48gGxYFoycItsmnNG9uTxHZi6rP04vy5DAmW7vSQXdIGu0AMUhxOINFkgkvY52jbbkijtNdO99x2DhpeHSBliFHOAlMYkweWBxCGtEoy2su9Q5o7OEje+RY7MvGMDrG1YWxaQJsgsQFom3IfFgPbuWVSFucluiRQSxq7TbOzGb06G1Gw1oB2HeVsa2s+g+TxB+yQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB28Sp0YtCCoX6d5ZASgMtjdhGwiwXWhhDj+RBYs3kM=;
 b=nqoX/2Rxs9gdj7tarGwCrTY0gJt8Fp120DwFEnWJ00z5EPOc7skhow/2h4vBfy9S5+BwTkUb63RbmCq72DzXRt4Gj4XMZ1DkYNEO0gG1/ayDA6C2DMvc6Oqoecpq/rzobp8PJGm+//eMKDqZq1MBflWU3CCb3Q5KfRKHDlynSLQ=
Received: from DUZPR01CA0314.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::21) by DB9PR08MB6362.eurprd08.prod.outlook.com
 (2603:10a6:10:25a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Mon, 15 Jan
 2024 10:44:19 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::a7) by DUZPR01CA0314.outlook.office365.com
 (2603:10a6:10:4ba::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26 via Frontend
 Transport; Mon, 15 Jan 2024 10:44:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 10:44:19 +0000
Received: ("Tessian outbound a064b9944658:v228"); Mon, 15 Jan 2024 10:44:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9cb6b44f1cab04fa
X-CR-MTA-TID: 64aa7808
Received: from 252efd6a3615.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D6C7B297-A29F-4919-9B71-B6386112DDAC.1;
	Mon, 15 Jan 2024 10:44:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 252efd6a3615.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jan 2024 10:44:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/XWG6LmahasFbREwI0XAHnyAfnT4k0UKaZxcmheE64wURq4sOt09zWwkEWaWk+Uou4ov0SEX6LAikz+ThMw71J4eLw/2itOS/n9p7qVcvBrDNC0r6q216hQq+Yj8mY1bPGR8tAHnI+IcEM7eOB3IwzRSx7cA2JfQA5ipEqVoWGUCRroJ6gKSXCP5Ov7bAGuKhdFy+/B35ArH92Z3FcMXykLQFEDejqsgZ94hBpkW/7952SQggp1r3Il1by4E+a9eg0l5XS62RbwOly434knfsghPKSZaoPWUJT50ah05XBvc/3uH+KeCm0NWO+MR8nRVbr26XnDFSxLocdxCzZAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB28Sp0YtCCoX6d5ZASgMtjdhGwiwXWhhDj+RBYs3kM=;
 b=i1H50w95B2CpD6/od4MMYuvGBGdHmnnabA94OTSWhkWRX1kvEY7Ci6ez0A9kVm++BJkk79smiIQWpRweNUKUGYrRyn5bA8aecdavTVu/Y0wW4nNxWmezQa3ka57cQ7btOEXPXJ+dCIMS4kQbwnbh9/8YWDh+ZvG26Ops7/5ta0iLenYSlwB95pgza+XiULvRUVMuuLSilbzFWxZPDIEbMqoG01u8qzW/OVp5gwXvPFufOHjKAxc1xGXFKBJ6BwDaZ/vXN2FALyx0Nqfpy7ZMBe6JT9qDxblNEa8Oc9lurbSzLo0hqBP3dTCfLxZURXjBdUDFgNImixmzHOleyXNQEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB28Sp0YtCCoX6d5ZASgMtjdhGwiwXWhhDj+RBYs3kM=;
 b=nqoX/2Rxs9gdj7tarGwCrTY0gJt8Fp120DwFEnWJ00z5EPOc7skhow/2h4vBfy9S5+BwTkUb63RbmCq72DzXRt4Gj4XMZ1DkYNEO0gG1/ayDA6C2DMvc6Oqoecpq/rzobp8PJGm+//eMKDqZq1MBflWU3CCb3Q5KfRKHDlynSLQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7614.eurprd08.prod.outlook.com (2603:10a6:10:31c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 10:44:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7181.019; Mon, 15 Jan 2024
 10:44:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: alper ak <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-multimedia][PATCH] gerbera: upgrade 1.12.1 -> 2.0.0
Thread-Topic: [oe] [meta-multimedia][PATCH] gerbera: upgrade 1.12.1 -> 2.0.0
Thread-Index: AQHaR5vWyU7i9PHkHUuwTwQVRwBr17DasEaA
Date: Mon, 15 Jan 2024 10:44:09 +0000
Message-ID: <DC50EBB8-5524-40C5-8E8E-7393E1A657A1@arm.com>
References: <20240115101526.680868-1-alperyasinak1@gmail.com>
In-Reply-To: <20240115101526.680868-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7614:EE_|DU6PEPF0000B61C:EE_|DB9PR08MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c65076f-ffd4-4b36-0002-08dc15b6ed98
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 T7uxTmUGggkMI1zEJiUE1Yoz6VSCvhWYX1A62ahdhdpkXQAe0L+9S3vtpUnlXFULztCqxrv3i3qqRHfh7XWmYnJLoZLvcl2aK7OXfzn5zs6OUFjnshwAl0Dyxaai+m1M4EFq2E82Dt0XlrK40492O/BUIIwwfjYbNha9/elzXRV+Ivu/BjFS+G9ib9xPTME3u/xmTbob9Mgw4TopPn6drEST9SbQzTAqHok23oE5IYoTTBzeGUvo9sQTAZjSqsOad1NI3UlqeFmGcDI8UJ4DjZdlXxErNfa7KySMU5cpC6qb13Q+bsf5+LDpOup76zPIDJuhLl6ayz8FqsOiRES/W8sh+TogI6ZBCfdchmFBNnNju+A8Dfwrd9CoRwt9AeJTtcTuFqVIPvb6s4DzJ2RqjdYqJnjV4kCqW24qSCrdXGQehM93cpvvSUGscJ/hOhrC/B61AUgfIR3c4zwQxfqoXmzskLx6ZW09LHb2OriK9vshQGgmreAO8XNvQdQwBpidgpTNe7a9j+jJJ6YspN0EBWqj38Nm0qAZ3hZmmm4LKbrLRR1nTLbfuzBenzMOYUOn2DowMIcNXrqu+P4mQAnabBJQ06C5dzk+bvb/MwbbH9p7zGdK9ynhkuveq4IcgnHUHBdXe4CUbppbfhBP1v5pjQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(86362001)(122000001)(38100700002)(2616005)(36756003)(33656002)(38070700009)(71200400001)(6506007)(6512007)(64756008)(316002)(966005)(53546011)(6486002)(91956017)(66446008)(66556008)(66476007)(66946007)(76116006)(6916009)(4744005)(2906002)(8676002)(8936002)(5660300002)(4326008)(478600001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2831B2CE1C5F7B4D98FAEA95004A4AC4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7614
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8e8606a0-9c3c-4b8a-2439-08dc15b6e7d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HL1ilSabmZK6fqVeRJH3zRC41jL7GcZmcrnudSkvu4vR2hyE/bHnlgJnobZrz7TXVr2QD2+BYDX/aDsHm49dsKzxDzkY3v6Wxf05zEbRbS1xOVhs57eXEqA2KR0iHSWrH7al1V2Sr0DVlee+xI7RccgIcJnnEA1DgV9v7V9zT9NXj7hz1NLtlzLhpjuTamkdzEAPipYFEpSlqzPZd7uLy+P/e05AIDb32oxE5AAwULJGSKYfJRHaBcH4ZA7QdN28MNiKq9eeWs1t4WtYSoLqUvwGKZyoH9+UOm3+MSr70yc+TpWDxiIOy1+1TYa3Do11jo3xRGE+86dGlycsGzEFtHx8g9DvULSU3J9N+5EOIWaexdBpE8e84YAk7kle+ZalS2b4mhqaI+mIxhQduD7TgRnoZ0Cf3KFSTn/nI8SrXEEYSLKXzUGCKPUPGjhrHtBOzqBYGUTGRUUU0DnyJmROtFo+pKr9PMrDc6TNxx6TUqZM/dcFn7JcIbj3wfT/mcSMqnwGzsLGWBCAuM/LWGSbu9aslZ/aSZz3YTAnKtpRk9wXq0Gik/VdjWdp9b1q87T37/s+Q0pzThBYYbSKE9yOYJLRobAtS1pov0exWcPBnjsPDJ5zT9d1NjrrJg2w0NgM1EHYcuPynr7Nm7hgXUqvRrsMeKnUKSMo5Lzt8RN+01fgwBfQn7ltz6XfQewDdeEt4UreD7FGWSr/XJlLbE4cHg/bxZCp7XSmrpYlO/Yfsos=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(186009)(82310400011)(1800799012)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(2616005)(26005)(53546011)(6512007)(336012)(478600001)(82740400003)(81166007)(356005)(36756003)(33656002)(86362001)(6862004)(4326008)(5660300002)(4744005)(2906002)(41300700001)(36860700001)(47076005)(6506007)(70586007)(70206006)(316002)(6486002)(966005)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 10:44:19.4160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c65076f-ffd4-4b36-0002-08dc15b6ed98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6362
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 10:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108281

T24gMTUgSmFuIDIwMjQsIGF0IDEwOjE1LCBBbHBlciBBayB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8YWxwZXJ5YXNpbmFrMT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiArZG9faW5zdGFsbDphcHBlbmQoKSB7DQo+ICsgICAgaW5zdGFsbCAtZCAke0R9
L3Jvb3QvLmNvbmZpZy8NCj4gK30NCj4gKw0KPiArRklMRVM6JHtQTn0gKz0gIi9yb290Ly5jb25m
aWcv4oCcDQoNCkkga25vdyBpdCB3YXMgdGhlcmUgYmVmb3JlLCBidXQgcmVtb3ZlIHRoaXMgYmVj
YXVzZSBpdOKAmXMgbm9uc2Vuc2UuDQoNCj4gK0VYVFJBX09FQ01BS0UgPSAiLURXSVRIX0pTPUZB
TFNFIC1EV0lUSF9NQUdJQz1GQUxTReKAnQ0KDQoNCkFnYWluIEkga25vdyB0aGlzIHdhcyB0aGVy
ZSBiZWZvcmUsIGJ1dCBsaWJtYWdpYyBpcyBwYXJ0IG9mIOKAmGZpbGXigJkgc28gYWRkIHRoaXMg
YXMgYSBQQUNLQUdFQ09ORklHLiAgQWxzbyB0aGUgSlMgaW1wbGVtZW50YXRpb24gaXMgZHVrdGFw
ZSB3aGljaCB3ZSBoYXZlIGEgcGFja2FnZSBvZiwgc28gdGhhdCBjYW4gYmUgYSBQQUNLQUdFQ09O
RklHIHRvby4NCg0KSXTigJlzIHVzZWZ1bCB0byBhdCBsZWFzdCBjb25zaWRlciB0aGUgZGVmYXVs
dHMgaW4gYSBwYWNrYWdlIHdoZW4gd3JpdGluZyB0aGUgUEFDS0FHRUNPTkZJR3MsIHNvIGFjY29y
ZGluZyB0byBodHRwczovL2dpdGh1Yi5jb20vZ2VyYmVyYS9nZXJiZXJhL2Jsb2IvbWFzdGVyL0NN
YWtlTGlzdHMudHh0I0wyOCB3ZSBzaG91bGQgZW5hYmxlIHRoZSBtYWdpYyBQQUNLQUdFQ09ORklH
IGJ5IGRlZmF1bHQuDQoNClJvc3MNCg0K

