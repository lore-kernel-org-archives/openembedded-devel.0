Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BACC55173
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 19:17:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3752.1785525457669309035
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 12:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nj99OF81;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nj99OF81;
 spf=pass (domain: arm.com, ip: 40.107.162.16, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UjWrp3XggvPmu/RrORS+yTS8h+mLxOt0XVccGyBzxpQBqCZu/Zzd5amCSxXWn4M+6vq4IYOOgALmQ13C8QI09WbaGUy11V1GiAFXs0E4LpBsZd0OoQpOkR8OGDzLsX6VXJecNUqv1xiVAaD4KxNUi9U6LvAscsIzOx5prx61EfyPsPOb7J51dSY/7nJZsJAVtnc9n0XofHbSoCEkR1hg9pqzaeTuyT6MQ9hg0tamMa1NK3ONJ0lGn8t3Vd20vsMDbQxnEmYChn+6lsaCs5SQm4Q/OhVQoUfzd7WL1cnZcQ5eS6vZnoDhc8EKwHV07BRJuPsXGSHJxhjOKS7qiGn02w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUEOERvEKjlxXyvrAYXDTO3rjVHzhnP190JSMnCEBbM=;
 b=r5ZsLWKJ34lYLBJqweS2dZi+ytP3qyVpyr3L9Qew1LbqnDqiYYK+kufVKhI+IHt5cTqvPek48pLKBd7jCIJpV3GEp1T4IM47EHNjNZ7RsjXz0oNmh+ieWcZe0PyOIZnQQTcxsTW5ydiVguWRcvjkRD+NG8WYJ0honNWR1cXKIzwbXcLvgJZl5K2N5PRif2CCNIxqE9UlcJ9NwtQ45sKuN1T1rRARwSF3LNFFeT5O40OFGTQRdRp51DWmLE2wcQiJqoWWy4APzoz2hr8alaUHj5uXezZhm01lSaGaBigS845VmfeMyjf/sLCQoxgz9vwoauUANeJlb1nnu/UebOhTXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUEOERvEKjlxXyvrAYXDTO3rjVHzhnP190JSMnCEBbM=;
 b=nj99OF81o6j/Q1dc7+EOjaYyK6nNDxnJRq+GfJvMpeg2NuHjLCiPgeI9od3SDvLFWlOTQ1EZygSRLV2MA/wp4MxikOCZJv6sscaJhDYt2fLKp8D6xyIXIDsrFV1adKklml4sv3Bl+J7oVXQaTUAlgQ7dd7xkgTp/2iEEzjqOuZQ=
Received: from AS9PR06CA0509.eurprd06.prod.outlook.com (2603:10a6:20b:49b::34)
 by AS8PR08MB8395.eurprd08.prod.outlook.com (2603:10a6:20b:567::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 19:17:30 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::6b) by AS9PR06CA0509.outlook.office365.com
 (2603:10a6:20b:49b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 19:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Fri, 31 Jul 2026 19:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIyPgvmYB1IOZkAvI60FVGsmudBpMDknNPD4KOyWEB2S6wIVD5//9V5voaydtzBlfRzPW24qYNrKbIt4mrzFazKK00UufaJhOr+cCzKBrCP1AlxKf8R384FdJRWHKW7fjsBIeVjdUoyH5fXFEz07jrRIEc4kO5vKRou4YCwUjhFSc+scAELqhA8gxkozb0vBukPEHmIFHnrZDNL84HDqKMRSGyhF0gpqu+8+x+emEBsShiuuMCLwS/C/OJggd1RlPRSUZ/twWGMea28TiWr1boUlswkAnouaUHSk1WIG6kkeR6Nsa/LqEfHcawtz4Zgr3K6xJBhZO3FeMXus9CpFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUEOERvEKjlxXyvrAYXDTO3rjVHzhnP190JSMnCEBbM=;
 b=K+wXvnDh+5UPlh68dBs+k+4l+Snv3uOUuvurIZa4rY0IuKli/zuW4p1jrxURq5MdSdOzGSG+eYjxLAAibnzh4d/A4itFGUxCziXClnzKua5ushyxTvp1sA8IMOh+0dAntRBZEjJjEfXQts20LfBCsZoEuMUYQPX+z2P4cMWwkTXtZToYpf7GlHF5Wv4xRuHjITpjoPdI3xsxnGRMLFiv1npkoEhK6T/2vm3ds9mbNsCTtaWx8VH9JSBahsLU6Ou9sKZ5uMPIXr7T/2o8G+vI/hGpL6pZKVdyZ9SULn1vFeWMUHshqFir2fO/kA5ulQtcnEvX5F3FywFHP6NyFdGQ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUEOERvEKjlxXyvrAYXDTO3rjVHzhnP190JSMnCEBbM=;
 b=nj99OF81o6j/Q1dc7+EOjaYyK6nNDxnJRq+GfJvMpeg2NuHjLCiPgeI9od3SDvLFWlOTQ1EZygSRLV2MA/wp4MxikOCZJv6sscaJhDYt2fLKp8D6xyIXIDsrFV1adKklml4sv3Bl+J7oVXQaTUAlgQ7dd7xkgTp/2iEEzjqOuZQ=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV1PR08MB7377.eurprd08.prod.outlook.com (2603:10a6:150:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 19:16:26 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 19:16:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 1/4] librav1e: add missing libgit2 build dependency
Thread-Topic: [oe] [PATCH 1/4] librav1e: add missing libgit2 build dependency
Thread-Index: AQHdISD4oYrrh7Jcv0ivaw79bmAw/raH/9qA
Date: Fri, 31 Jul 2026 19:16:25 +0000
Message-ID: <3E2EEF24-EE94-4AE4-B917-37874034EAB1@arm.com>
References: <20260731191523.2153901-1-ross.burton@arm.com>
In-Reply-To: <20260731191523.2153901-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV1PR08MB7377:EE_|AM4PEPF00027A6A:EE_|AS8PR08MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 14244231-1a58-4d0d-2888-08deef385da4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 4Ef2nar4mzWAmVv7a3TGbziJsQ95pqt6pyzPxGLbB41sMSPCMWehSwVnSMMsbXrdh+8wdI7pLtQdtkQJpGYGsfA/FrAiO5NH9FnhxCfObxwOMbAeXrhO9vIHMe3KXQ+mDecwfgUoTbCU5hHq+WYTK6FBUT6gjHh6EMhYEGKUH1AzEJaOh9CFkS+YvDWR44N5vInrerXh6Zm1yUWTNW+3BAh0lhHCAr8Z9zLiUrAjlvv3028CnXoCJfh9QCd9drEo3WiBH4Ux+UQyx6iTspCBhaLecTadzXt7no4o9Izg+BKTioiGcM1UUaC6jU2H3B2AAIHhVrcPO82T3ZLCnV3WoSf0QQVqQk8XIqMa9h4oQEdN2eCou2comE+Cc7thohKn/5B2zkty/MSoMTZWxAPEdpex7IMnE0zjvjaqEtukONAsJkmWvNsEPBOxBfdMoCM/ToS7Pr3LUZ9APCt6jq8zDd1KXwyBLdFSamRhk2oZ/xKay8zZb0yGs7jTiYuWX1ivI9l2F40/8HmCbkW2biFP199Cf3wQub+V0samDP/tOj35w0+SGjPZjORJtMEjHF0XFKLhmjyat+VnAnZopaJAPRdqBbDD9OrGNk9HXOF/xW8EJ+Uz+T5U65YrT0bV4+d/EL5vq0MS8jmH5LKD7S1ICuH7XmfjR2V0HJZqTH0I1aiZHTArqpMQjNX9HwgZRcGW9YTkYeq2p8Ol4oITEnOjReJybpAvnXqpsyS3KCvpIqg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3B6EF609281994790039339CEED12E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 duGr8MPK0mVL9XEpVrccolpQVbWdgtR4q211Z7RZes/UigHZYDkDI2qjP8gGpeLwMYHaM5ioBuig8Hdg8jJs9UG8khgIOjXbOEEfo7YMU55O2eFRimSDIiusbd5I4VHOHT399SmoFq7/RkOqW3xUB9/wP55lHW7tMLej0J2WozebD7efH3ZVPrTyHczfg1DeFAgHpe0p8UMUpUialgeHii93LRyGYrM6WtoIHbJdMhkOSDzdTx1CL4ClcFf/POyoaJYiPcpWs3YidhLkLJVd2z1yfOxl9LFAGv2UA6X5DlE5zgoxH9W+5STq/3sTgfjNKxWTYFk8jpbaWvWVoBirww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7377
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f853a06a-14b2-45d2-1af7-08deef38373c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|35042699022|14060799003|4022899009|376014|36860700016|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	EG/07uS4r20D6XJTYeth2dA2uP2S0y/R/I7rWE7kUSue1Q/VyAJNJim5sA9302OV8W91jG/e2OqOLtSs25J9HuyqZdzud11bRWb7duQiInNBHL856WTo3HK+xY1UlW3f1Z6kA8gpaVWE50kNH1+CP3+8zplRsX7YgqOxFbK+OShfr3zn5gDAKqMWFbjsf+sxAUvonEvU+q6Mxm1zH0NycQL7i9uC/45rV17Bwot+QagWOJdMaNFLrvTzD3pnD4CqaVZaWoQok0s2ZJDPrrFoHTuF916umy2dMWGU7JoT/qisvIeMstL8aboA8sFMT9DTHGk30GSibfmTt6xDJ3CiUI72nb6ZSgcrWTZMOkEoinhV1A94dILGbLUwTszCNoch+2feQ2/q9qJmShyBdBuPqa8SqzHrh68F5jsz5C7uyJYJJe2lJz0zRpWFoRKTHDhTm0qXdxZgggvSmhQYnaqkwNgBB3mnN7wKwn/c3GLlG2EZLucHHVLQ+mCnhjucWGpDfda0eYBAUP1GpNhFtKXWOYLzM3VraeLNY0ZVq8IfCrfFHzLgP4pCk6s0/qfkS086cdqO3vh1OCeIfAeOy4gZe98v0zp4YO4suFc/UYalXpUcn6IZ58xW+bg13BGF5ELoOacu/RAVauNLEuzWCOLsuMuuHYg6J3eUwZrzWhEIky6T83f2/lomynlHRcLM4Xiy3lHspMVXEPqgqgOylZIEFw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(35042699022)(14060799003)(4022899009)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rKT5msXlBrVJgYRTox1GnuWuYYElgPkXg6nSqmW02Z4pkV5YcF9aBDp7eZttxJMDSrrpf97hUpxoyQgtGwRgSk/+2hnOfHyoWbBywmdcEF5jDndPpeT0LUUqDLuWlrQAjwAVNXRVnO2iM0S5DybbbHWj+DlxRebcV7cak1asYlO44R9XMMRprM0AyxaYxY49fQZOfPUW7nZe08vI1CFqBq6sixO5Badxrq+FL+CEO8DnOLTU1bbOgi2iZMhrWq7nvZ+ZCKwXgvngfxSUBFigCB5m9Qd7pXy1eftHlsMK5uMpqPL89ukp9gksnh943uUTyZ6g5NmNAThq1m/5R4PgWI8zvNdePIFvmFoVESBDGm3Y8CG4D/YZzC/BVXt/SLjSWw2jwx/GKD1S8R/ZNWQuxIaoPXTvb7pxDEIuVi1FGr2rJcch1mUJLbiEYM2c7VcK
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 19:17:30.1067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14244231-1a58-4d0d-2888-08deef385da4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8395
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 19:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128593

VGhpcyBzZXJpZXMgaXMgbmVlZGVkIHdoZW4gImNhcmdvOiBjZW50cmFsaXNlIGFudGktdmVuZG9y
aW5nIGVudmlyb25tZW50IHZhcmlhYmxlc+KAnSBpcyBtZXJnZWQgaW50byBvZS1jb3JlLg0KDQpS
b3NzDQoNCj4gT24gMzEgSnVsIDIwMjYsIGF0IDIwOjE1LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IE5vdCBzdXJlIHdoeSBhbiBBVjEgZW5jb2RlciBuZWVkcyBsaWJn
aXQyIGJ1dCB0aGF0J3MgcnVzdCdzIGRlcGVuZGVuY3kNCj4gdHJlZSBmb3IgeW91LiAgTmVlZGVk
IHNpbmNlIG91ciBjYXJnbyBjbGFzcyBub3cgc3RvcHMgdGhlIGdpdDItc3lzIGNyYXRlDQo+IGZy
b20gdXNpbmcgYSBidW5kbGVkIGNvcHkgb2YgbGliZ2l0Mi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPiAtLS0NCj4gbWV0YS1tdWx0aW1l
ZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9yYXYxZS9saWJyYXYxZV9wMjAyNTA5MDIuYmIgfCAxICsN
Cj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0
YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9yYXYxZS9saWJyYXYxZV9wMjAyNTA5MDIu
YmIgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL3JhdjFlL2xpYnJhdjFlX3Ay
MDI1MDkwMi5iYg0KPiBpbmRleCA0YzAzYzk0MTdkLi43NDA5MThiZDE4IDEwMDY0NA0KPiAtLS0g
YS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL3JhdjFlL2xpYnJhdjFlX3AyMDI1
MDkwMi5iYg0KPiArKysgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL3JhdjFl
L2xpYnJhdjFlX3AyMDI1MDkwMi5iYg0KPiBAQCAtNyw2ICs3LDcgQEAgaW5oZXJpdCBjYXJnb19j
IHBrZ2NvbmZpZyBjYXJnby11cGRhdGUtcmVjaXBlLWNyYXRlcw0KPiANCj4gcmVxdWlyZSAke1BO
fS1jcmF0ZXMuaW5jDQo+IA0KPiArREVQRU5EUyA9ICJsaWJnaXQyIg0KPiBERVBFTkRTOmFwcGVu
ZDp4ODYgPSAiIG5hc20tbmF0aXZlIg0KPiBERVBFTkRTOmFwcGVuZDp4ODYtNjQgPSAiIG5hc20t
bmF0aXZlIg0KPiANCj4gLS0gDQo+IDIuNDMuMA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdy
b3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEyODU4OSk6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEyODU4OQ0KPiBNdXRlIFRo
aXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMjA1Mzk5MzEvNjg3
NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

