Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDD6CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:24:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web10.279326.1697628282940395829
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 04:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iYXx/Umm;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iYXx/Umm;
 spf=pass (domain: arm.com, ip: 40.107.20.79, mailfrom: luca.fancellu@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpxVb+uxaAhYNfXcgLr6x6uKcMiWhBNWQ4Kpq8Q/lpA=;
 b=iYXx/UmmRiqOa67Fao6+sNJveiGdYGajdeE0p+qN8pkVM/2SvHmnnPc3a7lSRRtNvvYtfc2dfajwepUv3RYvqvF69GRoGuPOt5BhNI9/HXzhaM8y7k14/HF0QKVX2jXOYlgTABQK/PhqwRDF54cunb4VoRPYsKtVGMOp+sSLjzk=
Received: from DU2PR04CA0348.eurprd04.prod.outlook.com (2603:10a6:10:2b4::9)
 by AS8PR08MB6423.eurprd08.prod.outlook.com (2603:10a6:20b:318::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Wed, 18 Oct
 2023 11:24:39 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::5d) by DU2PR04CA0348.outlook.office365.com
 (2603:10a6:10:2b4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 11:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 11:24:39 +0000
Received: ("Tessian outbound 470906b1fe6c:v215"); Wed, 18 Oct 2023 11:24:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d3fec62c82e5694
X-CR-MTA-TID: 64aa7808
Received: from 8740d596e650.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D2C55ECF-63DE-490C-9DCB-EB81FC87402D.1;
	Wed, 18 Oct 2023 11:24:28 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8740d596e650.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Oct 2023 11:24:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfRZwIQK4DcVOfvydzYa/utVKxA2QoggEVfezIwo/bptvYn0RRk7uLeSryS8kSy6KIp0AYLwPyE3N6f0HR0HSOFW7k4rCJuDG6WIpONK0aPyRnItxJA9AQ5Vqn2+379QBcOK9Hx4RezO8B2+ZDaxSKgWgfzEduYtQ/GR0Mspsled/V+GZopc+BLqCGZcIPMRnkmJ8WPsOWG6f0dnjKGwFpQJnwXz1RPwofN8YMQitseRZ/pYsUrEXwkWvqS/HBtzV9dzJXjhokwHuSRjMRzC3tQiU9PFVAnz1ALo9gCVKok/+zdZX+DHU2JQW3zi83bjMUJa8HJNRQycKoReOxPlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpxVb+uxaAhYNfXcgLr6x6uKcMiWhBNWQ4Kpq8Q/lpA=;
 b=dl8hWgojF0Gi9kKFE7PdaXqcrMnsopEXgCopLD6JbAK6OEjOpxv3/6OM2KGFiflFD5HjJ4XZ3v0w3NWfOcuuuugrM0ROflWcys+KbHcp9Ee7NbIAnzYAFgjbp+NVPOJMLbpAIQ0prktTSbXg+dC5scyIRm2C4qcO6epoEV4l3/zLYQC87Vy5m3f/hNwthyTUIh7HMbEYcOOk57DCOAC85/ffwfhheEz4LT1j5Yjnx3Hy3MEHR9lBmBvXopksRUpDbA9NuT+wm7RlX4Ha1hvbL/LKLBQ0644IwRJFdF4zz5zBGvp1zwohWLkazG5FDNz6dF/5ixKslxMDnkk1rPNeGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpxVb+uxaAhYNfXcgLr6x6uKcMiWhBNWQ4Kpq8Q/lpA=;
 b=iYXx/UmmRiqOa67Fao6+sNJveiGdYGajdeE0p+qN8pkVM/2SvHmnnPc3a7lSRRtNvvYtfc2dfajwepUv3RYvqvF69GRoGuPOt5BhNI9/HXzhaM8y7k14/HF0QKVX2jXOYlgTABQK/PhqwRDF54cunb4VoRPYsKtVGMOp+sSLjzk=
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB9621.eurprd08.prod.outlook.com (2603:10a6:20b:61a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Wed, 18 Oct
 2023 11:23:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%7]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 11:23:18 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Diego Sueiro
	<Diego.Sueiro@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [oe] [PATCH 1/2] linuxptp: Drop unneeded downstream patches
Thread-Topic: [oe] [PATCH 1/2] linuxptp: Drop unneeded downstream patches
Thread-Index: AQHaAX00WZLIg4SeS0m0RqZrOVQJ6rBPNwiAgAAw7YA=
Date: Wed, 18 Oct 2023 11:23:18 +0000
Message-ID: <F773E6FB-4AFE-41BD-8EDE-F855442970D7@arm.com>
References: <20231017133214.1562048-1-luca.fancellu@arm.com>
 <20231017133214.1562048-2-luca.fancellu@arm.com>
 <CAMKF1spNBkb9jwMjA2F_w36=djB4Bi44qjZed4NCt3k5E_Yd8A@mail.gmail.com>
 <178F264F8E2E3E99.8679@lists.openembedded.org>
In-Reply-To: <178F264F8E2E3E99.8679@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM6PR08MB3749:EE_|AS8PR08MB9621:EE_|DBAEUR03FT033:EE_|AS8PR08MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c05c012-ec11-405b-5556-08dbcfccd133
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rU7uWTM787HDqbFT4IxbHL8FmRvfx7ElGLhH7NfumBgRklgGeCsXjfbzB6Wze4XzEqUxIaCNeQk3GECXYkG3FljzUcQM7MlXMVm9vGNsk8IZcqGxR+VNlb9RDXEHTgrjIVsXVnC36rz8F/ZzLRWf2elnSLbK2WoziyWpSmd0Ju7/VTOHKYPUE5MztH+CifeSAUaOSbgwqJodnQhkBsDmjZaWcP3KRhjJTpmtYCYl8yGgEqPNzVUhE/cxJHaJq6OvF50gKJClhl0o8bQ0U0RzDwKvIIHA0uO1ZtAuFlUfxZCA+/riolOcJGeWNpUXvY8LOMB1yl6tIWabULoKx3cQjB4gZDF/FIkxRhDUILqlb3NcnRCrcqJ/jJwZ0N9sA5FacOYpZPPAQnlkTfTvJJnC8X7JHgytDRuwYKfkIXiI2G6VG0ZxyN9mGj6uuEtqhuUNo43We1X7MKU/8XopxhWjqnuF4QStGCLMl+l8hb8p8/NI/YGH/vclO8kf7GlDEsxgJ57VEj0Enn3fWMb4C9y7G3eUZRmnln5k75gIf4rmL/p1LWQFnlUDl+QR8kAGGVBWKT9JBbzpH0qvemivTpwukpOT6wQwB9L1pqmA8+HGttwDYJATkLl2RX+3xJ5bvLN+V8RgH1Tg8cUGzqtU+9ykbg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(396003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(966005)(66446008)(91956017)(64756008)(66556008)(4744005)(33656002)(478600001)(54906003)(66946007)(66476007)(71200400001)(6916009)(2616005)(6506007)(76116006)(8936002)(8676002)(5660300002)(6512007)(2906002)(41300700001)(86362001)(4326008)(36756003)(316002)(38100700002)(38070700005)(83380400001)(122000001)(53546011)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <61AACB76A2974D4B91F2BF761FA17C70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9621
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8f33d38b-4e03-466f-4128-08dbcfcca0ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dVtiAtK2eo4LEvRsUYKT+SDWvF6DSnWV43GtRXHwJ2SHG7NR2LMN6lwlULkfQigbawC+GBdP0k8k/PBCQ0vHfaSLYaI1EhjKtQnxQoloJzSvqV2AjJvyPqmE50ZwiNCci1wjeG5P2cIjuYWMQXriSS5USDR76iFT7djNF6N6D7NteDEC2e3tsLG/eU95S4EQhtnosaE+z7doSXDPnDYa3eDVZH4C6MYGDA/1BCxyZyKT+JqxPVWGH7pnSoSCwUJCzIatBqjHItz4pCQ6Q6jq5/8MGe2Aw6Q1JX7/2Iqv9QNlsWCps+VOSsNolIbYMN+eA9nICmFbPUPVGizOKDXpg5bGxAs+6NKDU3rP6MSxDgABiMJsKbrntaARz4qJ3qXPfgb1K3OZyRW7CIhjqhQpNYyzyGPd35clr23vcbSveKbxHYDkW2PpUY3Ep6wcR0EOF9gTZhUwMkrPq7hVr+/5VX2eB1zgPyAI7thmWwv2z5dXPO4T2FsRouE93s3PxElAphA7WVVJfaCdhCPsq0xOYe3qhNxXKRWvLcoeWH22oihHAi682r1FBlolMxZohcHVV5PxYo2wQFmRMKoFhAeofEcvfH2h5mQEG6KZdy/PcjzC2t//6F/YkCylXIM9QbyjMsfjtdH9rMPqx5L4cjsenOl/EI4XiVHysUsxSZqYLs0cxFp7fjBPmOtvm3PlSlNCKzKQUCq+ckUr7pNzeM4YZrZglTK41A+6mN3G60RcZkM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(83380400001)(336012)(6506007)(36860700001)(53546011)(6512007)(2616005)(82740400003)(81166007)(356005)(26005)(33656002)(478600001)(6486002)(966005)(47076005)(41300700001)(316002)(70586007)(70206006)(40460700003)(54906003)(5660300002)(86362001)(4744005)(40480700001)(2906002)(36756003)(8936002)(8676002)(6862004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:24:39.2825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c05c012-ec11-405b-5556-08dbcfccd133
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6423
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 11:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105574

DQoNCj4gT24gMTggT2N0IDIwMjMsIGF0IDA5OjI4LCBsdWNhIGZhbmNlbGx1IHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxsdWNhLmZhbmNlbGx1PWFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAxOCBPY3QgMjAyMywgYXQgMDU6NDAsIEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdyb3RlOg0KPj4gDQo+PiBTZWVpbmcgYSBidWls
ZCBmYWlsdXJlIC0gaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWls
cy83Mzk5NTkvDQo+IA0KPiBIaSBLaGVtLA0KPiANCj4gVGhhbmtzIEnigJlsbCBpbnZlc3RpZ2F0
ZSBvbiB0aGVtIGFuZCBJ4oCZbGwgbGV0IHlvdSBrbm93Lg0KDQoNCkhpIEtoZW0sDQoNCkkgd2Fz
IGFibGUgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSBidWlsZGluZyB3aXRoIGNsYW5nLCBJ4oCZdmUg
cHVzaGVkIGEgdjIsIEnigJl2ZSB0ZXN0ZWQgd2l0aCBib3RoIGNsYW5nIGFuZCBnY2MuDQoNCkhv
cGUgdGhpcyBvbmUgd29ya3MhDQoNCkNoZWVycywNCkx1Y2ENCg0K

