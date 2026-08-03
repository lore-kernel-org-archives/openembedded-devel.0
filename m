Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C166C5518E
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 09:43:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39706.1785750177001354286
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 02:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CG3YSH2q;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CG3YSH2q;
 spf=pass (domain: arm.com, ip: 40.107.130.26, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MbJZCZC8IH5DbwCekh5726opfw9Oni4dfcD8FVF1QOK8Nv2mCYTHphFEQDWmZSzsEhKFkMB2hh+P2Zky8jymjAyQpWSxD+padyB5D6279a3+w0sfXxidBe8Rh0TUFeIYWafFRcvGLubWve97NlEBp3OrEDPHPNPuTpyNJ2YxTeoYXv9c4wmqKFAKVcYxxh/MPsv84rWQtKPemFI30WPnYj4NtenJdV5+JYvS83gYS7+UcqQfxZGYjyRRMYe3suLtEyK9KIKZUB9Xb4mtXY1IBdP8KjBT9q86gGifbQYVrIoqExeyRtFDJeWqi0pAkLqtQmRyke2LiZop2IR1yiKo8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPcbKHnIsnlbSgb5ab8OU3qAJ2PEad5ArY9YBhoR4u8=;
 b=ODJqgil8KPiF8pqNUHcpbADSBpPFkWoBnvpzuYAFbIuZaTWMyHe41CWNWVIikW7WQV/mJm8yNYc2pWZTrEDJDJRxVqPov3bJGQGn1P0Tn0aKFXNdG8TcCIGuivx8eW90OEBPTip8NSQrxSoiy4rTfXP/wZ8AwFYh54rkqkWLHVAlHIk5ucll0YfST+TT00BAQJ8epCy4Z4YL5/I9h/Sell2EX+GH4S6U0sG36ub3prilinviiTqk6+hXIqERdw2rImhfxUX60gb9irxgDF+CVF5/BQaRJL4Q1Mfa9v01nQZ+oVmIJYnufgxpKvVyf0gU+3+f7e87Zq9rCEMEPBEQHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPcbKHnIsnlbSgb5ab8OU3qAJ2PEad5ArY9YBhoR4u8=;
 b=CG3YSH2qZ3HnhXE/vsh9+hYZSuc5ym7OCaWZcTatEl/aZoIYcbajQa2yFp2tkJV99aaz5nSxkKfWurgQHcnwHF1PdgLyikyvdHwhzQHe1YkZU2593vPpREFPDgfJYCp4Qbqm5ocz6Z0ORr45n8erDrTylMrJu2bDoKRc1gOJOPM=
Received: from AS4P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::17)
 by AS4PR08MB7553.eurprd08.prod.outlook.com (2603:10a6:20b:4fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 09:42:50 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::4e) by AS4P191CA0026.outlook.office365.com
 (2603:10a6:20b:5d9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 09:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 09:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyRncajXvnM3z7TDOFc11Qgg6U+E2wKtmWrZCrWEk3fvLHy1hpMQ3sFV95hj7039UGOJbb+Ztw2ZMgjE9K1qdlCyQm9B6IBtAg4oAV0ksMLV0VjGqT4sJeLpggQ9qX4YRJB0h5CGDDBFy1q3j+KW334kXpM72hTEOH1Y6lXxjzWk+PbO16aWQWI2AJ9vraRkUp+i2/PeBjnxp5qiZkMKZ6mXRsmA/EtTs9B5w2Na2Wp2N+MjDjmq7l9sLAYW1ujyE4OsvEWIzqfbvcshSzDOib+qAFO2fQlZtXNA44Y5YgBbDxi6PYTW1PH3Hf5uwLY5fjAY2mbJ+Ja/igdPC+7CSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPcbKHnIsnlbSgb5ab8OU3qAJ2PEad5ArY9YBhoR4u8=;
 b=E9R4ZI5zFtiIDezyUivRr3rA/iDmAwcsqCWeeRTo5IQqClN37J87WmmQ+yQob9XTOnwggWNUH3lezz4Zk62GjflxS8b+v6KGEWtGQv11pORF3anSygIDYoRAqbg7d2lDW31Wbfz4Yq1GFVQ9QH/m2cBMDptKtHJwRV0VNC+07JxA7Fz/rzpAWpmKNsZACXd1hL8x+R3F2GP7RctdyyyMB0j8QAuJ0QOlMYVzVsXfaZASdO6zgpuTEVbaI8//WHBpq6huJDFnY5ONRedrtdvrp9/L4uUoNCkUoB14d+4XGD89vEhMQicVkGCFVL+1eEQmuMUEd7bVstb/s2RQ03UtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPcbKHnIsnlbSgb5ab8OU3qAJ2PEad5ArY9YBhoR4u8=;
 b=CG3YSH2qZ3HnhXE/vsh9+hYZSuc5ym7OCaWZcTatEl/aZoIYcbajQa2yFp2tkJV99aaz5nSxkKfWurgQHcnwHF1PdgLyikyvdHwhzQHe1YkZU2593vPpREFPDgfJYCp4Qbqm5ocz6Z0ORr45n8erDrTylMrJu2bDoKRc1gOJOPM=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU4PR08MB11214.eurprd08.prod.outlook.com (2603:10a6:10:576::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 09:42:17 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 09:42:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 1/4] librav1e: add missing libgit2 build dependency
Thread-Topic: [oe] [PATCH 1/4] librav1e: add missing libgit2 build dependency
Thread-Index: AQHdISD4oYrrh7Jcv0ivaw79bmAw/raK9DyAgAEiNIA=
Date: Mon, 3 Aug 2026 09:42:17 +0000
Message-ID: <D7F605D4-3EBF-44CA-835E-2BB56852AFD6@arm.com>
References: <20260731191523.2153901-1-ross.burton@arm.com>
 <CAMKF1srKU837wk=mG=_0zTHLDjZGH=3Gcbprok-BrsK6VG5a5A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srKU837wk=mG=_0zTHLDjZGH=3Gcbprok-BrsK6VG5a5A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU4PR08MB11214:EE_|AM2PEPF0001C715:EE_|AS4PR08MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 77919903-61aa-4fe5-c2af-08def1439586
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 0SzmOV2mBuJHRL1OfEEsKKhmIGETubYGKWKOuR/hZXx9qUWAlCc7bmFPOuJpai26tCaFhA733xXEUYVHAfhx1NBInfK/yKjj5leh4oTa3cBFBX03ROHEKbnAXlZm7PXKVvR/064sWZUs1kWBdV3vycOZqrCyQ8ItgiQpjgwNv70LrFc+mlEPBSbk4EKL6qJtV2gZhFij2p1fMMOjlzZIXWyL924CG1ZYWlphJiXmhebMdSDz+rjYtwtSwupR+7mmzl+hBoWBZTjtempT9yN7E6hWhfoQ3aMkByHpByj/MBs7LEv5+7efTiCZ68DEejUhObOQLabCdm47IOSUrunuxZgoDIKvPFQpbSs/M/H/wyGA8Kre5QmJuOP3VBEUcLfQk6a5HW8fqjztVUpPsDN6Rh+M2QOo1E/mTNbAsvLGnzyoOfIGFZOuCAsGY9UDZwG8IlRBoerbK4X+Jl1fIFfuxwLtS96dvzV4tkQkjISv+KavUgs9UYYxBZtABamzi9FkUIzKZ7J9OvhrDnoYrs7KuWWTCS1e7kCBJo0xXdS/zDK4nrDfcoCvBmu7Wi+FO26Y3iX33zaiI6qtNcr/ZZW7n9JbJ9wZMylSymmfY7zYes1K8ySjGmAScKeRUwDJn2/0IWBat3qAMxZfcfU/oxXDV0UHmg//SoXLyYLcFii/FM1OFiOTX2kwIzKgYrd5PthPfiFDZhHrvbUn8mtMc4KR31E2kZC0y3fvBem9EQOeayM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E40CEAD63B8A0A42A6554DFCEE89C129@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 bQhcZ+XHtoyzGemckhZVpPKWZ/2L6z9hgIIdSGpb1NoRUuSgKsKqFTV3TfHzHzV0sYE2BRrpOTpJnrkkhBWsfPsjGvwAjxKc7ZvmR+kOOrrMLcGOpYmi14Ih1Weg0GqwjT4Jp+jWUQ3fuVhDggNESZEklEuS9BM1ujr04slVEJWUIOn7aL9Ryz9R+2h0H6qtYRKHC0aPsm13iqzxuM8uKCgamM5snCSZwrRz3sA2E6IeUs/Kq0HzExDOo47xHEeV4rbbzQHTVzLtKWnvx4ae79qyy3uq4jP7NSFGTyWbT2iVl1ed5kaIvxre7zwttca2PMzq9PN/JDXnaD6lKs662g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11214
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b4bb68ae-67b7-4740-93c4-08def14381c5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|35042699022|376014|1800799024|14060799003|4143699003|56012099006|11063799006|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+jLnCZY5YHvyi3fsEctPZFOAMBknIMX/z/431Xv+3AxSbhUgOiD9RRL6/zrvFfHwhdszgfuUEE+EYlwVU6ilPjMJr9iWsi0Rem+zkuFBDCsH8n3YSYHyjgp40OMqJQbExKPKjh3h87kbuLc41rq+zgr8FD8MqquaVxRSZj1aagnBOcr9DnQoDjlRcCCla7rFHjwMdMf6T2FombYClbe25iYP/Xhlf9mgB7GQwvAsCO39JFmfmMCnQXwOyQJ9hyyLNEJb4gad2JT5ziIEKzolK4TQJdv3tqzZE5E6LGgkbyU8OQCWNpDtgwRlwuPtQoV3ZwaL0XJbcA7NI/JC0KUktN4nPA6OdshaDUMkxQ/9oXvrZ6ohCfTxIG4A9WZB2Zsue+Jj+coimCZcI1jPKSeQM7vM/ocVAFY9/HC0uaW6FabSeXn45NOFMuH1AciU1Ze10LY4L3QDZoHRXIeceJx01pVjpILYTnBRD58TkkSa59UIpsIStxfDEcTSKvtDxD+Wxa1SBvRqXxSY1njTOiIQ1ffdfbIeFfr18UzG65gIVklsrH1VzcBpPEJew4Xi+7cXPaLmhFIyHh50Vw8vXJdVl4GiM04RHhdiDAutlPnUhTzwwjT8CQvTPVnZQPoKyDPRc/rnO5K8MdqfP+uFWMtzviOgnSWi5uM2osess7cyb04ocSbTril4Xnrc5EJEUWvB/gguF3hVGWJKeLxL6cZrVw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(35042699022)(376014)(1800799024)(14060799003)(4143699003)(56012099006)(11063799006)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nDMqRMX14EHOXZxMeJEsTjAYlzvvY/TzRuK7KY9l1pN+X+hcVkak6R69Xed4doSRWa1JQ/6zLqLVP4yaU9pR4KEoJsC1doAdqoLH3yW0GlyHPxfdqnZ0ZZngB4zYM8vJC6Q++6zwvU2CIUiduoPMQgEY75ctzXnzDg9VplDclGUTqYZ4Lezt+cnjlfREg99/CR/jxQCBymUWmf9M6hcF+Pj/TaPfV/Eqwv9lF3YxIerriqpyHVVQpRutEGbValyWjmKEPswkbs+GXJONb5KC6e18AtptjdjJ2pCkeTBgafTZ3VkSA7vC4pSvEJufP1YN/+zCJsZmk64ki0KAOhqcBDF56M+asPMzAG8uPaUu/4FMDSXwNBpXFlDdhbnG8PVYCuWlAPnwcFgyVyn+ja1aJ9tK1WIgwzpa+l4w7yL1qer0glzyAt7RsvPexBVNXDb6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:42:50.6572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77919903-61aa-4fe5-c2af-08def1439586
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7553
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 09:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128675

T24gMiBBdWcgMjAyNiwgYXQgMTc6MjMsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gZmFpbHMgb24gbWFzdGVyLW5leHQgd2l0aCBodHRwczovL2Vycm9ycy55b2N0
b3Byb2plY3Qub3JnL0Vycm9ycy9EZXRhaWxzLzk1ODM1OS8NCj4gdGhpcyBpcyBvbiBhcm02NCBi
dWlsZCBob3N0DQoNCkRpZCByYXZpMWUgd29yayBvbiB0aGF0IGhvc3QgYmVmb3JlIHRoZSBwYXRj
aD8gIEkgY2Fu4oCZdCBtYWtlIGl0IGJ1aWxkIGF0IGFsbCwgYXMgaXTigJlzIG1peGluZyBob3N0
IGFuZCB0YXJnZXQgcGF0aHMgZHVyaW5nIHRoZSBidWlsZC4NCg0KUm9zcw==

