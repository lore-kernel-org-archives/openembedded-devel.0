Return-Path: <piotr.wejman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130A4CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 14:23:35 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8850.1778682209213688903
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 07:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oGvJTB1i;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oGvJTB1i;
 spf=pass (domain: arm.com, ip: 40.107.130.23, mailfrom: piotr.wejman@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yq8mzxKPyjryklHn45s5eHakCCdv2LRlnDGPye2hIqdsZBvIcMRCBhpBTi/uEC5kRTtaV8dG49h+pibp+pgsjS7Qv6h/AeelzCsOg4lKFEGXoPp46048tYdzfyBV6y77zcEmc+W9InBw69IRiWouZrVLMi0ERR8wy4467yh5vXCyXB0jU+s8Sz+Po66uZu/wbsdt2Bk6KIXfXYze9UE3VtcgG4z33cGNDBYokCuMoMOcYaItaQlPOEBxqPap8CsyHXDKnTY1hN8CTyzYXoclKbA3Ml4yKxSyQTPOakgUI9nj3OCx7ROEpcZmCjkGY4ufKbUXBSWOxgbrwT7VaP/fhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgs9/PxU77RmJdunhveQRhI69g9wYPd1T+wH5KhKcvU=;
 b=I84XpDSTscr+SvGZD2p9ssmXuqwFqR2fFPj5qVqWjD20wzjIQNk5f6gYQ9xaOrD8LuRfwcaY3AwVA1dj30UKgiYqU0dHJ6eiZH9O/SzQaYzbT7x3Se+HZ9wY/eIh8312gymNvCJL/7501zSebJ5RReezzYqY7pWGHzASlNp+JsrjkIWtTubgAx5mfQteEgnU/KjnAraySbYf6b1y51tjXsSV76sNoRkeWCldj4B7w54qT7yPOBAtRd2BeakudiPyR4yyKQpmOM/eRNsH87Kn97fbe9SYByBC1GxdlHU5D3IvewsyveIaiO7rPJ8biBlMqWUfbDW1TqaFYs6DKciIqg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tgs9/PxU77RmJdunhveQRhI69g9wYPd1T+wH5KhKcvU=;
 b=oGvJTB1i8ZI7v01NrAXWcfalKZ5IdkK7hd/Gp5+VcIUcjl24Ut8uOxSwvaU0wBuL3NPNj3YfLctXCbMFINyvinLnxnU1UizMkmD+gsboATKt4vwd1914cqlW9u/Gj9syqUvhfL3Vm09QVrhq/eEvvVZY864ALzAA0yKPcdu4mX0=
Received: from CWLP265CA0514.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::15)
 by GV1PR08MB9937.eurprd08.prod.outlook.com (2603:10a6:150:a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:23:21 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:400:18c:cafe::d) by CWLP265CA0514.outlook.office365.com
 (2603:10a6:400:18c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 14:23:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Wed, 13 May 2026 14:23:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLLcSKyffyT9cj18C6ejoVXWQsVEkn+5L/uHjrGnat75qD5i2hlAvX3oMWJu4hiPhE3z86FI1dSWr/TgJFmidFyDf36d3xHhdaf5RF0sse9zsCDMQ8axQQd60lE2hlLJ/NuOhJ0CwkyJdbwKeVjVCM/fLrIIAVJVSAwcF6dr2k3INa+bThtMPBD16F8WdB/d55A5VBrrAdefgiPXSZ/sqkkUH68ojk737DixcgeOkuO3x1c2ribREt6u/9ow3Y9Wsw8nLJvJ3lKemwj19pvQF78ihurSCGLQTwiRqoICn4/HTzkb61I6h7ULBXyQmeTEwWDQI0eHi5SakEEh2K9B0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgs9/PxU77RmJdunhveQRhI69g9wYPd1T+wH5KhKcvU=;
 b=GKFocmqc7vrIJe4nyGDbsV+c/rk1+FATefulQJpZY04NqUsVzxuAVf6fRHJL5i6mLdeLClCsE09SRQjtkUOw2z8PPchhYH8cCMCmhJtRHQ69q5a3rB/dNn17L30CUzUDNEhG5dquGgWYo0cYkIkLKeNoDqdIB+WVYyPEMtPdAydJtkSusXvIourPzoG1fE19XFvkFgndWK1T12EgUUj6219caR3qDv5y46sgd8wZ5RHqIhek3hni9v4quVbcrqr2HChwtVsbZI4xUcqORRqonyZfeQYvrRcYYeM4ZcIj307O+/jRNxwxb21Fw/L6r7FpGfYg+cgCUqqV06Ex0NCiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tgs9/PxU77RmJdunhveQRhI69g9wYPd1T+wH5KhKcvU=;
 b=oGvJTB1i8ZI7v01NrAXWcfalKZ5IdkK7hd/Gp5+VcIUcjl24Ut8uOxSwvaU0wBuL3NPNj3YfLctXCbMFINyvinLnxnU1UizMkmD+gsboATKt4vwd1914cqlW9u/Gj9syqUvhfL3Vm09QVrhq/eEvvVZY864ALzAA0yKPcdu4mX0=
Received: from AS4PR08MB8244.eurprd08.prod.outlook.com (2603:10a6:20b:51d::16)
 by AS8PR08MB7919.eurprd08.prod.outlook.com (2603:10a6:20b:53a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:22:18 +0000
Received: from AS4PR08MB8244.eurprd08.prod.outlook.com
 ([fe80::b65a:9870:ed4d:7803]) by AS4PR08MB8244.eurprd08.prod.outlook.com
 ([fe80::b65a:9870:ed4d:7803%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:22:17 +0000
From: Piotr Wejman <Piotr.Wejman@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "joe@deserted.net"
	<joe@deserted.net>, Ross Burton <Ross.Burton@arm.com>, Vincent Mailhol
	<Vincent.Mailhol@arm.com>
Subject: Re: [meta-networking][PATCH] nftables: add systemd PACKAGECONFIG
Thread-Topic: [meta-networking][PATCH] nftables: add systemd PACKAGECONFIG
Thread-Index: AQHc3X089Kjh128VGEe9pZtLG6KtX7YLZREAgACkCnc=
Date: Wed, 13 May 2026 14:22:17 +0000
Message-ID: 
 <AS4PR08MB8244BB5C3A6DBA9F709EDA078F062@AS4PR08MB8244.eurprd08.prod.outlook.com>
References: <20260506172256.1259293-1-piotr.wejman@arm.com>
 <CAMKF1sqDsN9onLMvE9rOsQ9bFLCvYnAk1V0w+Ad-GVaVmdYKuA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqDsN9onLMvE9rOsQ9bFLCvYnAk1V0w+Ad-GVaVmdYKuA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB8244:EE_|AS8PR08MB7919:EE_|AMS1EPF0000008F:EE_|GV1PR08MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: bf84a403-2711-4645-5fa3-08deb0fb2efc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|38070700021|12006099003|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original: 
 eulUGQmOi/J8kuNCgV1RfhE0kMzDAwwkFoSYvnVdObayoDwz+9ehvyBpbIsyE88Qw5keaq+c3oyC5rVy3d47NVpZmz1My7kTCKQ/B+EUJD6xF0YqiPBiifVUEeF8IN4JUhsN2ZmI7cStiLq+0TzYrG+IYdrPJhvD9/F6i9PK24aFChjf+A1NSGHCX6ypMZqem83Gp/BywG5/Pdd/EGHHKSWcH1L3hhPNyGG7jv4ltZ4tX0FtUdD9cSh2Smv7Vtwk9s8mVu7hzONC6NfPEVx1lw6oCG9b1Zs/tmZmM97ozcH6FD6DEl5jzggvkL5btrPM1mIq6/SSkATLIvc+qgp+bTFQey4Ol1r+8aWwydxJg1ONFxLyYoOQ9slflUe9gjD2qIJE+xzHxASVctQIsuiryXXWZdJ1ah7rge0aJu/u/GnHvOR8w/xNuT6RkgDJffvDrWBHeasVMfkixNzVIlgp1xdk0UkgrVthEJDPfS0u7d97Zw+FVm8qgkt/zPo/+2KJ8I6TeueYzE0uuH/lLjbRKzqN6MG64M5gRMhXKRA2Hwn7wlzyTNswqfMmkB2gkerWacH0HLN6EtJnzpJtj8iOn2+eDBqPEmQjze/jf29oedYtG9CxC6xL5XtK0lfoWBxGofzlvH5RvOhNJEW+vcqJ69P7oAhrJjeG/qL3DWdrouCSFCWUzMielStsGhQp17H7
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB8244.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(38070700021)(12006099003)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 S5b7OS/wQKbE8HAIRO45pgW5XDKx+eEiM9bEvzRBfz9wJvN+NcI0ikghPINCXqWGA5jUC3M3Xij9x+I255DaCktCrHqajJ7Gu55o8bokR5OCBf8/p8qXAHPvnnaJFCHGSPTR4L4MMIfs7Zd/24HQiXPIyz/pot9zKgq4MgdQGI1uEzLnZHgT9dvQ/dWf5ncJx3jQ9QYRxCgK7xwvll42aF4a4kbmaAAUBmv4eWbC4knzMB4piJpfqSDMXbc29zeZCMQuyZuENFreyNmYUUaqncN0E4udlSS1XYAU+O19qQkZokP3O+QTZILtRQ9lV1tpEFVE9ccLu7KlTHsOe3M2XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7919
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	013186fd-d257-42b6-f60f-08deb0fb0967
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|35042699022|1800799024|36860700016|82310400026|11063799003|13003099007|12006099003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Ake55Ln2oa+G62FgWQpEgnWNXPodqbaCazZl0k2DHOm1NRHo11x+FSK9F9gk1ezDaz3IQAncCZmWUoGcClGPrvDgTcUX8S2/QMbDqSpPu80oSjyHTJbDwR1nluYhkLx4Cr1lOc26tsxPOVmFUvxWQUoUObS6L0sNPigfA3MBWPtB+NQLr4girCq8+Wf5eWcapR5Bsok6Yc6tfzoV5UUZRJlZiAPsxGkSVZcqFlvK1/5bZJnJhhAq083n2yF1w9dE1i4a6HpmpmdbpyowvTvHjJGmIRdMUrJiV4nMt5keL+9u7UBi79VUJppSeAqMfLlDxFgIL61njF6GF3PpvlbnNFZB2e1XnuV6abhxMnt7Examtrs8VquQ0A46oFHkwrn4STTzgarP362mxPcxF9QI52dB5122iVlpQnlXjMT//kmRQSKqmXYcNfqnn2t+pFyqqrd9rxfkb/8tRohN0DWfWuIKZcnaqnvp+ApLJBu9BeAK+AMX/ZmsLk6mbW0pKZ7MRaAsZfB5OKK2ieO/IfpYb9IR5ZL19IDMEiriluWCR7FTrXe6UxPWmp+RTUMioyCNHGs83DJPeEJ749KwjvbhtPnetjKqitxcTYxkUEX/qDsiq0OOqfg+eCoC7ttk30Kee0xzgEFgd82bC+yA+3PFPJJVZJDQEfYIeDD0yOnJcx9pyFTHwotgQSdB1OWlK4N6
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(35042699022)(1800799024)(36860700016)(82310400026)(11063799003)(13003099007)(12006099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FDgRhZ241PHepsmmBCQvpDnWNwAumi9iAtDjfV/+Zh/TLU4YkAEIyF721VqlWsqzNC3Z/HpC+JBnqvw4rHHCAjjanSyBeP7GqGHHBoPr5Ouzq5QfqVQqhL92HfE12/Hdz1ke0N/myvBIz4XAyzrWNrHCU/RZrbpcmGiEbDNsDV7U4yb4VvYScta/7uB0xQ4g5GeximlJa4J2tbFDGXQVfZBnaMb9/vnXPwkKoZUJU2uGS0URRpTxbIwgDRIRMwWJAXJOxdpnrCw/9BXW+19rIQaWrxt2KHiGy58pg0Lifsa0FbTkpYmxVSCgCqltV0hiRvrnNeWRBJkYFFn7kOwnE9lLMXeBHcc06xhXh7D8wSIOL0oP3IolzrlKHjrU7URF3wIJOFvuPGHHYRSdMGBgI4jAJSAhoRWTCzMN3BslqjWu53M6Pgxzf1Y47oCCxtYl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:23:20.3749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf84a403-2711-4645-5fa3-08deb0fb2efc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9937
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 14:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126973

SGksDQoNClRoYW5rcyBmb3IgcmVwb3J0aW5nLiBJIHB1c2hlZCBhIGZpeGVkIHYyIHBhdGNoOg0K
aHR0cHM6Ly9wYXRjaHdvcmsueW9jdG9wcm9qZWN0Lm9yZy9wcm9qZWN0L29lL3BhdGNoLzIwMjYw
NTEzMTMxNDQyLjI1ODIwNjgtMS1waW90ci53ZWptYW5AYXJtLmNvbS8NCg0KUGlvdHINCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4NClNlbnQ6IFdlZG5lc2RheSwgTWF5IDEzLCAyMDI2IDY6MjEgQU0N
ClRvOiBQaW90ciBXZWptYW4NCkNjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZzsgam9lQGRlc2VydGVkLm5ldDsgUm9zcyBCdXJ0b247IFZpbmNlbnQgTWFpbGhvbA0K
U3ViamVjdDogUmU6IFttZXRhLW5ldHdvcmtpbmddW1BBVENIXSBuZnRhYmxlczogYWRkIHN5c3Rl
bWQgUEFDS0FHRUNPTkZJRw0KDQpzZWVpbmcgdGhpcyBlcnJvcg0KaHR0cHM6Ly9lcnJvcnMueW9j
dG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy85Mzg2NjQvDQoNClNlZW1zIHRvIGJlIHJlbGF0
ZWQgdG8gdGhpcyBwYXRjaA0KDQpPbiBXZWQsIE1heSA2LCAyMDI2IGF0IDEwOjI04oCvQU0gUGlv
dHIgV2VqbWFuIDxwaW90ci53ZWptYW5AYXJtLmNvbTxtYWlsdG86cGlvdHIud2VqbWFuQGFybS5j
b20+PiB3cm90ZToNCkFkZCBhIHN5c3RlbWQgUEFDS0FHRUNPTkZJRyBvcHRpb24gdG8gaW5zdGFs
bCBuZnRhYmxlcyBzeXN0ZW1kIHVuaXQgZmlsZXMuDQpXaGVuICJzeXN0ZW1kIiBpcyBwcmVzZW50
IGluIERJU1RST19GRUFUVVJFUywgdGhlIG9wdGlvbiBpcyBlbmFibGVkIGFuZA0KdGhlIHNlcnZp
Y2UgaXMgaW5zdGFsbGVkIGJ1dCBkaXNhYmxlZCBieSBkZWZhdWx0Lg0KDQpTaWduZWQtb2ZmLWJ5
OiBQaW90ciBXZWptYW4gPHBpb3RyLndlam1hbkBhcm0uY29tPG1haWx0bzpwaW90ci53ZWptYW5A
YXJtLmNvbT4+DQotLS0NCiBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1maWx0ZXIvbmZ0YWJsZXMv
bmZ0YWJsZXNfMS4xLjYuYmI8aHR0cDovL25mdGFibGVzXzEuMS42LmJiPiB8IDggKysrKysrLS0N
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZmlsdGVyL25mdGFibGVzL25mdGFibGVz
XzEuMS42LmJiPGh0dHA6Ly9uZnRhYmxlc18xLjEuNi5iYj4gYi9tZXRhLW5ldHdvcmtpbmcvcmVj
aXBlcy1maWx0ZXIvbmZ0YWJsZXMvbmZ0YWJsZXNfMS4xLjYuYmI8aHR0cDovL25mdGFibGVzXzEu
MS42LmJiPg0KaW5kZXggZDI3ZTYwYTE4ZC4uZGJlMGU4ZjlmNSAxMDA2NDQNCi0tLSBhL21ldGEt
bmV0d29ya2luZy9yZWNpcGVzLWZpbHRlci9uZnRhYmxlcy9uZnRhYmxlc18xLjEuNi5iYjxodHRw
Oi8vbmZ0YWJsZXNfMS4xLjYuYmI+DQorKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1maWx0
ZXIvbmZ0YWJsZXMvbmZ0YWJsZXNfMS4xLjYuYmI8aHR0cDovL25mdGFibGVzXzEuMS42LmJiPg0K
QEAgLTE2LDkgKzE2LDkgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3Lm5ldGZpbHRlci5vcmcvcHJv
amVjdHMvbmZ0YWJsZXMvZmlsZXMvJHtCUH0udGFyLnh6PGh0dHA6Ly93d3cubmV0ZmlsdGVyLm9y
Zy9wcm9qZWN0cy9uZnRhYmxlcy9maWxlcy8kJTdCQlAlN0QudGFyLnh6PiBcDQogICAgICAgICAg
ICINCiBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzcyOTMxYmRhODU1NmIzMTA2MzZhMmY5MDIwYWRj
NzEwZjliYWI2NmY0N2VmZTBjZTkwYmZmODAwYWMyNTMwYyINCg0KLWluaGVyaXQgYXV0b3Rvb2xz
IG1hbnBhZ2VzIHBrZ2NvbmZpZyBwdGVzdCBweXRob24zbmF0aXZlDQoraW5oZXJpdCBhdXRvdG9v
bHMgbWFucGFnZXMgcGtnY29uZmlnIHB0ZXN0IHB5dGhvbjNuYXRpdmUgc3lzdGVtZA0KDQotUEFD
S0FHRUNPTkZJRyA/PSAicHl0aG9uIHJlYWRsaW5lIGpzb24iDQorUEFDS0FHRUNPTkZJRyA/PSAi
cHl0aG9uIHJlYWRsaW5lIGpzb24gJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMn
LCAnc3lzdGVtZCcsIGQpfSINCiBQQUNLQUdFQ09ORklHW2VkaXRsaW5lXSA9ICItLXdpdGgtY2xp
PWVkaXRsaW5lLCAsIGxpYmVkaXQsICwgLCBsaW5lbm9pc2UgcmVhZGxpbmUiDQogUEFDS0FHRUNP
TkZJR1tqc29uXSA9ICItLXdpdGgtanNvbiwgLS13aXRob3V0LWpzb24sIGphbnNzb24iDQogUEFD
S0FHRUNPTkZJR1tsaW5lbm9pc2VdID0gIi0td2l0aC1jbGk9bGluZW5vaXNlLCAsIGxpbmVub2lz
ZSwgLCAsIGVkaXRsaW5lIHJlYWRsaW5lIg0KQEAgLTI3LDEwICsyNywxNCBAQCBQQUNLQUdFQ09O
RklHW21pbmktZ21wXSA9ICItLXdpdGgtbWluaS1nbXAsIC0td2l0aG91dC1taW5pLWdtcCINCiBQ
QUNLQUdFQ09ORklHW3B5dGhvbl0gPSAiIg0KIFBBQ0tBR0VDT05GSUdbcmVhZGxpbmVdID0gIi0t
d2l0aC1jbGk9cmVhZGxpbmUsICwgcmVhZGxpbmUsICwgLCBlZGl0bGluZSBsaW5lbm9pc2UiDQog
UEFDS0FHRUNPTkZJR1t4dGFibGVzXSA9ICItLXdpdGgteHRhYmxlcywgLS13aXRob3V0LXh0YWJs
ZXMsIGlwdGFibGVzIg0KK1BBQ0tBR0VDT05GSUdbc3lzdGVtZF0gPSAiLS13aXRoLXVuaXRkaXI9
JHtzeXN0ZW1kX3N5c3RlbV91bml0ZGlyfSwgLS13aXRob3V0LXVuaXRkaXIiDQoNCiBFWFRSQV9P
RUNPTkYgPSAiIFwNCiAgICAgJHtAYmIudXRpbHMuY29udGFpbnNfYW55KCdQQUNLQUdFQ09ORklH
JywgJ2VkaXRsaW5lIGxpbmVub2lzZSByZWFkbGluZScsICcnLCAnLS13aXRob3V0LWNsaScsIGQp
fSINCg0KK1NZU1RFTURfU0VSVklDRToke1BOfSA9ICJuZnRhYmxlcy5zZXJ2aWNlIg0KK1NZU1RF
TURfQVVUT19FTkFCTEU6JHtQTn0gPSAiZGlzYWJsZSINCisNCiBQRVA1MTdfU09VUkNFX1BBVEgg
PSAiJHtTfS9weSINCg0KICMgeHRhYmxlcyB3aWxsIG5lZWQgaXQgb24gbXVzbCBzZWUgaXB0YWJs
ZXMNCg==

