Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450F6CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:55:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2456.1778658902499188083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 00:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=E9IMFFap;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=E9IMFFap;
 spf=pass (domain: arm.com, ip: 52.101.65.37, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=amba6nwCUu6zQwvAR9OLQMh4ikZaMZmFS+/91A1c3qkuaRmHVGiYkEKOWWHpcdKGDc6s8NQjjQx53YtUw/nK3iDnCSBoSXa3ju4Zrp4jY9n9VbDLvDcHvGJl/ELN+HseR9BXpwTZzQdDvy3IpxwwxKrQt6lqoqcsjMfkyRBuWDAL1l0As05z0jgOnAXUVoRJF9/isPSpP35oQVzRUB0tG7O3t8KyaHAE2ZexpeNlUueFhyrZ9mfKPaVC0Q1Vc4qromuKw1DeLAzlH3rgFCmRXcLZjNeJkH0PkY6bGMXMOYVyKmRhs+KTaa3xcSumxpsonJwUYbYz1KI/gxjAFzy+nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lr3nE/q1CQidBtRvm+GFEg43oPRs4HVwY9flP+ClS2g=;
 b=XNSpiG/H5l9GrWRspBkrTawErpNnQ7fspRIWIEd/rwEf4HM/mAffoxCMlJN5nyPwLRlo+e9cOoogBqo313v3KBnYk1Hqu36x+a0TG6mcVUYDY3gT1GJDG0nHKxMwb8oJJQGzPl9uu9SM3r63vT9wUZmvdBywjvwUlIdng8dK2M+ux/r/g2oLNlwtU1FXz3ifkoVa3b3ZZjOQhHK//5WJY0c/wLxYA6hpR9T4nVfccVK8/InVl2hzMLPY58eYp3QbaYPOf3kaIR0dasZAjU3ip4Vg6adbm+pkoJBcSNgBzEb4Q49WD2t9OQ8dPeABEkKVYr8J1qnAqxFfNzRZjL3HSQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr3nE/q1CQidBtRvm+GFEg43oPRs4HVwY9flP+ClS2g=;
 b=E9IMFFapm/1jtGeZo6YBQjmRyw5zbo7Q2+ivtohj9fauQhV/rIbfrr762EMzTv3HCcN5wq1YFdR/xQ/E2LgGw838who1+aq1m8McKxGcCN0TW4PmdRrYHNWmc1xpzorySvDD0OPFiTDFoK7wpIazHkbj+2qRP9tYk44JdL21p/8=
Received: from CWLP123CA0112.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::28)
 by DB8PR08MB5305.eurprd08.prod.outlook.com (2603:10a6:10:112::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 07:54:54 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:401:5f:cafe::8e) by CWLP123CA0112.outlook.office365.com
 (2603:10a6:401:5f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Wed, 13
 May 2026 07:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Wed, 13 May 2026 07:54:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ojd2msB3RMP7DaQP6dkVkhy361jLZTLxqDZZBQsPWiptPgTOJQwTxnKTrOmsx04hcxkZJFOXGSVxUsl+5ZNb9jLSruP8NITHv9OUpkCQXvNoU9gXaCb4P4dCLhqtA7/ZevOdvqZH6Z3/hayJGB6LqXGJkHwSqS97BTxMfO6ZKY2tqTreP567hENZvYIDvw8PgxM1RLCIpI5HPSB9yygtngcS42iMxqSO6r19jR8JY8Mc1rva+a3TD8Fz2ntrz6k40Mytl//p1tn4TrzB5jfK7N+wPpg2GG7H8B4FC8nfrTSePSkQlJi/+p1FGFXbDkTdcF43vLRVXvkE6R2NB0q9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lr3nE/q1CQidBtRvm+GFEg43oPRs4HVwY9flP+ClS2g=;
 b=IF4Oj3ZwrX5+3Yw3uq0MqQP1V6etG5fJ2tqjPBW3MZ5543wgEk0MzBfWeQTPXbHvpaMlQxe79jtDk/ERVS9R5A29T0vyt33Hi7zJpf6n0vOgPPEBknTywOkbXo8PSbY6BQhilgOfKqfJG3BDCl8A+J/tL0OVHY0GSaY4gxWOJlvnPl7vln6zeclP9o8jTmPMi4SOQO1QQOX0jUj6EuH14oWjJvbolVQ3yYprs+C4J11KyjAAXxXPfkAuepNsO0oda/rtzwa+Nw5yShFv8qREPRszPfIQQWsQj0ZQCe/YJY8EFxkyNzW17F1rZfgrs4SUJeGNN4zLbJmE3ObPgm1Y7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr3nE/q1CQidBtRvm+GFEg43oPRs4HVwY9flP+ClS2g=;
 b=E9IMFFapm/1jtGeZo6YBQjmRyw5zbo7Q2+ivtohj9fauQhV/rIbfrr762EMzTv3HCcN5wq1YFdR/xQ/E2LgGw838who1+aq1m8McKxGcCN0TW4PmdRrYHNWmc1xpzorySvDD0OPFiTDFoK7wpIazHkbj+2qRP9tYk44JdL21p/8=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VI0PR08MB11797.eurprd08.prod.outlook.com (2603:10a6:800:313::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Wed, 13 May
 2026 07:53:50 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 07:53:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>
CC: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 2/3] libdazzle: add recipe (from oe-core)
Thread-Topic: [oe] [PATCH 2/3] libdazzle: add recipe (from oe-core)
Thread-Index: AQHc4i2xDeiTOa8p5UuHYybKRM57N7YLEaYAgABA8oCAAEREgA==
Date: Wed, 13 May 2026 07:53:49 +0000
Message-ID: <42B2C5C3-D965-4540-9A28-E7F5F8DF61F2@arm.com>
References: <20260512163727.3832144-1-ross.burton@arm.com>
 <20260512163727.3832144-2-ross.burton@arm.com>
 <CADySD0FRGBe_D3Xgdcxj-xSYjmo4qXqpQWXWDvg1LE-dBDK4sQ@mail.gmail.com>
 <b524d6f1-ba30-45ff-a061-37e5d715f9b2@gmail.com>
In-Reply-To: <b524d6f1-ba30-45ff-a061-37e5d715f9b2@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VI0PR08MB11797:EE_|AMS1EPF00000048:EE_|DB8PR08MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: f19d1d15-75d8-4134-ead4-08deb0c4eb8f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original: 
 l3418mRfm65jQ3w6c55hkKdYFyeeODdMCXKYxFcAgfme4iFBTDcyP1trORgw6NAhJxmz7Ufo1qBCmCCpiqD/vOUC1/+NrxHWq1OClZLbYsIhBBtDv9YEyUsX6QLdW3saE98e/3Q8ZAuLr7ygRQ9oU4E1025h8NVFXUkkIFmT+fcd/gQjBU0xsM+IxzKlt34lgMLxP0mNsr1jn0fmD9EMJ6WM9HYG/wYG9MQYAHGCtu7Hbk36WY//FqQ2YSvKACucMcthnOz8Gi1PNHWq+qtXc5Zrt5m4q9AgBgYyujq0Esij5RL91pL/A/G50r87dCXUYhP7Y/ZCSbFJG8+Bv3sjbgGoND+JhWw0BCpO4ZtpLRgClpZCVh4iYyqFU3gLi1Nt3e6sMV07bvnN9SzgVjADgavw04pKd6Teb9uSWdHZhGYKACYr7JTSXfgg+B60YHs9VV4jpRLW5n4X1Lko4sLYO2FxE+wkWctbRjHMKkMGZh0bEPLmbgOtv07ttq3ZJ0duUunZ4U8Z/xE16T5m3xQ6oQrf+61uRda4LFN678YYwFdG8zWti5fk1uzBBA0FWTX3GpJ8lip0mmrGq0MpnOIkX663y5gJ8CQ714tOddoWeMY6sv8dbBuOhn3EeORpEyij7a1tO8lx9EZuY++nZFAGadxOzMLSeRipAE/KnuV/dpWJC2QskzwJ60t8/1ypNyQKtEgy507IT94QdS97n2exTA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F04C71AF42F44B43BD36C8D7CFB380D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 X0KBnOUpRog1Zq+FIDGqAmNBQlkAvNFHwYTbBRUyKmdaAHGcUsasQ5iRzCEYONUpgMdHiNUwai1jd1UhgRflITfI0cHbeqv1nSU0Ul+N09+Hx9XXZfiypX08iQ2khZenCui5RjXm/sSbA7JAz6wkcs1J9IrSam1FXbl9MQfn9CtzrvBsUzDl/VWiz1DZ/gqhTfG5t4iguLoRbc5DmoT/Whs5zd5u/S9S0LGqCzkEeVY6VznsrEiC8jYE//KRoznoEhwGsU75mb3EZ9OsAgdSKcI7KHUhulSKQ9A+nYk2pOpU+lwtd8L+6She9C3gDTn6U1+3yKwtWajgQAkHNh+leg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11797
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8b13a4bd-765a-4da9-52c4-08deb0c4c4f3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|14060799003|36860700016|376014|13003099007|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	xm5I8Bc5VvF2GjEyA46SAYY0Qka57zpkdC3pJ/3xrqnw/kyS5/3a0gcY6Dzu5MZ5mUIOSvogA5OUCrWu1PJ/QFPrbpygIpYjuPZsG5OqF+U7w/1Jzn78c1Ycjje3bjTY3i6Sc8Ay7wuLcYB0ZUvh8nFgl2ca+MlU2nUshjjLbfclYQ9XJEaHLxXIybpvHQ6DxQnWDBLM5kKIsmeKNC1S1Qz6/qmJa7B6WxigZNEgXXDXjVEE2WMlgYJQ56+PIllTRZ/O3tsHN/UFnTiO2cBwa4mN3zEaZmNxQUPNmk3U/giHKAfbH4gXxrbo0rQpngW2Z6P97AppjDdpAIRQ7y1vWainEEpijXXwTGgVHOL/ao+2CYN9qbHR0FJQ0RyntgnqN1DMTQ76yi9ECv9TnNw8wOnkU2991PJvkklvDxwexZaSK6sDbLYalYd7hndTchP5/COKTnYtbHlGT4JkuTQe+0Tk2Qq2dEQ/xG8T0kYsItnXwY7E5MIbAAoxfu7jbwRJ8gayO2pr81prpO2x2pxGrM+KZSFg6yW1cs40UHUa9JHc5QMxPEbLaNexLWckcRMJNFd+DV6OgUfBHQOCL2HnmArAXT4GUqrdLQ0bf3x7Tmpsj/IXpoVR9OkHPvCIogOee8trzuDJ7CIqzAsP+Pe1gIkZ9/Koyj15eJyeYgo8fueseIkCdDnyzA7jd6WpISW/
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(14060799003)(36860700016)(376014)(13003099007)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZuNsqd1+QGgLwZa0NeKt7/jU3jasRS7prTl5KBXrAvQMSa81t7PAP5+jkRiWADvU2oVXd+T/i+LuN5RdICGAhS710s9eo9DrcooNeNcnWFR7OpXw5fK32T13g1yp4ZIcRiQR8LCwabnqe6j6cecY5VUAzK6v0WRmo1OTBRjh/qAXLqKdBqnesCwVTFr0DmWytOVFj3iGKRzfihq6MvAbmjUOFeyI8zfCjn+Ghq1NEDz0s8KcOQEVt/5maC1HCXZ3XbxOe6bo9NPa2Kh/Jl9l1hyj2d+TGtZAKToZAap+B5o7kU/t8Ud20U1DdydVcAeFViB2rh4BJo1/uF97TQQRZcPW2evaSlf31PTjtUyTUMbOfki4JufhsWslDwzNScWB4wpY4yD3N4uke8btiZu6oUy83G2ootSCMmZ5K1N6nhK5PRhzvzEWVk6+P3lv3ZdQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:54:54.4391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f19d1d15-75d8-4134-ead4-08deb0c4eb8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5305
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 07:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126958

T24gMTMgTWF5IDIwMjYsIGF0IDA0OjQ5LCBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3JhdW5AZ21h
aWwuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBPbiA1LzEzLzI2IDAxOjU2LCBBbmt1ciBUeWFnaSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4+IDMuNDQgd2FzIHJlbGVhc2VkIGlu
IDIwMjIgYW5kIHRoZSBwcm9qZWN0IGlzIGluIGFyY2hpdmVkIHN0YXRlLCBkbyB3ZQ0KPj4gcmVh
bGx5IHdhbnQgdG8gYWRkIHRoaXMgcmVjaXBlPw0KPiANCj4gDQo+IFRoZXJlIGFyZSBvdGhlciBy
ZWNpcGVzIHRoYXQgZGVwZW5kIG9uIHRoaXMuDQo+IA0KPiBTcGVha2luZyBvZiB3aGljaDogUm9z
cywgZXBpcGhhbnkgaW4gb2UtY29yZSBzdGlsbCBzZWVtcyB0byBkZXBlbmQgb24NCj4gdGhpczoN
Cj4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS90cmVlL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC40LmJiP2g9bWFzdGVyLW5leHQj
bjE3DQoNCknigJl2ZSBwYXRjaGVzIHRvIGRlYWwgd2l0aCB0aGF0IC0gdGhlIGRlcGVuZGVuY3kg
aGFzIGJlZW4gb2Jzb2xldGUgZm9yIHNvbWUgdGltZS4NCg0KUm9zcw==

