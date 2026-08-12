Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3FCC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 12:26:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6858.1786537582972320336
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iHb7GeAF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iHb7GeAF;
 spf=pass (domain: arm.com, ip: 52.101.83.25, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bCUWRUFZgW7FvYM+Jie1iH2sql6K2L7RWHG4IKe19sKUaZ91vpPXBf2DumMPgiYRXRfsmR4ywwFaGOYOV0hNwXOOETNX2PpPsVTd4JHPlOTBf/y79Z1UWrN9muOk/NAm8I1z23LyVv5WSj3U2fwg8n1JRhY5qg0G0wMB5UshfHEbyM43uug/zXMIvCBqKBU8ZFf7J/nFb0Ks2/uOK3iVLCX2KyWNg4mQcb3ovUxjREci5G6hAhiz1jv5rEuIm8g2F9S08JsAAqJQLNE/NA+M9VjiKQmBMDub4PXfu2Gs3BqO7oUps8u0CLJk/Lf3ckKjNGewBYkQmKJbzbhc8vaguA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9MGydqJ8BlNszsdpnEItOUTfhAB/NQVOM8nw5WjBFc=;
 b=tb6yWj3ECFLqlumUjGFJCsfuUdwKy9vmSPb6JfrRq599eRcdJKe826/CNv1QPtP4RpeXzPURrd0lDnPDsqxYJwg/ZBrwn9VaLINikzWc+v/L8WfnSB6HG2OaHkLlV8Df+Uj0dwjNO8+LSDYWMUgLWuXMJbu1RHOgGic/2TI0JH2tOaFm5C24OX54oKDw7poXLf1z8CDnW/uonsDgCqVkDmQEFvLWomIqx68NtBzC9XiVLHMTHp2TXNcym9yiLir+8Qo53Ss8fS1J7/TrRz1ZwZ0+2ZdED+RTFu158RK1V0dIU960uH81QcztaagTYWMogVVUIApCcNNLtpbDdp3dWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9MGydqJ8BlNszsdpnEItOUTfhAB/NQVOM8nw5WjBFc=;
 b=iHb7GeAFDnwKGzWT16eDRD7CrpaYcSMS20wIQi80X+rZAq1kkX4hOkCW2xp1PrPmkDXvGCQ4v0ikE4XXGWipXUrhVwhnZN3sJxR7FdbDQ2sGPr4SZ4dpLNPrmwDJO3P4LYQzIp9upBpRDno3q54eBu+YKFEjG/a9HTvNgP+rDWg=
Received: from AS9P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::10)
 by DB9PR08MB9777.eurprd08.prod.outlook.com (2603:10a6:10:462::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 12:26:17 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:46d:cafe::ac) by AS9P194CA0010.outlook.office365.com
 (2603:10a6:20b:46d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Wed,
 12 Aug 2026 12:26:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Wed, 12 Aug 2026 12:26:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kdamxl+WvjQK/TKO4cXBcS5avOw6romP4ByQzKV7vU28/TyhO9FJ/ehaHzo6sRXKGyT7kDVV/ZJRPF9Lglp+vXNjjajkdSX7m52fzlxf/G6rPVLNztojP5wXBc0OhyehEs7cMoBoNs6g7/6ay9NveMDi9WBEe1zfOXDP3OMoOnbI55ikg2AQG2f/6wUjeuL52xpPIgkeAJxaJ7vz3oIHxRvdZfyIIgCKzXzFKkZ+A8GKZ/RWWXxwR9IHxvq6bL3N53zBNJ8DfNxzG3dCrBGoJ1jK3ft+8Nc9OAnG7tebaxqpy/q98/GP4DLHeDXZj63M+nEu+91eJsYmpKeognf1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9MGydqJ8BlNszsdpnEItOUTfhAB/NQVOM8nw5WjBFc=;
 b=Xf8U8AO2P4Mh62CtxXKFCGuP8+VBWRoNhvzgS0bIH4o5becrfWy2SkVR6+wIv8zyobr5Yb3dK0ecxerIvNq7ezZaslDNip0L2wRhfDhg6ZiZW5sINqwH1E2ZK3jiBNJdaKpOCmgYk2+kPUivfP1dQe56Fvr7JZecBZ4S1M1HXbk6BZJ3LSlgFg//sLI7DOexhJiI9yoMOI35CzYVN63fo1F61Vk3SfGmpUHnUkH2kG65i1a9EtFyNcq9sy7N8S//BxwLbCyzScGj+qYmderkztNZt9zAxyxhYrDmoqGZUWW/KIU1OMj/fzZnlR5fMRhbidy1NvsMm8C+Qgwp38t8zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9MGydqJ8BlNszsdpnEItOUTfhAB/NQVOM8nw5WjBFc=;
 b=iHb7GeAFDnwKGzWT16eDRD7CrpaYcSMS20wIQi80X+rZAq1kkX4hOkCW2xp1PrPmkDXvGCQ4v0ikE4XXGWipXUrhVwhnZN3sJxR7FdbDQ2sGPr4SZ4dpLNPrmwDJO3P4LYQzIp9upBpRDno3q54eBu+YKFEjG/a9HTvNgP+rDWg=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV4PR08MB11250.eurprd08.prod.outlook.com (2603:10a6:150:2e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 12:25:44 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 12:25:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <tim.orling@konsulko.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Changes to python build dependencies
Thread-Topic: Changes to python build dependencies
Thread-Index: AQHdKlWywjBrbLScmkeG1BSqkd1BIQ==
Date: Wed, 12 Aug 2026 12:25:43 +0000
Message-ID: <31000A93-3B00-4DD9-9909-5F725D919106@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV4PR08MB11250:EE_|AM4PEPF00027A66:EE_|DB9PR08MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: 067e7d18-b733-4518-3483-08def86ce863
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|38070700021|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 /jO6IvbUgbSGtpDJiugIn8YB/YHtMjVNUphSAlzoy5JPqoXFczaF6YbPnaed2anmZutgjgvymZnsdp68kBYWNi/KUpMORq26zFOAw94I0wInO5oOYZjoY642DWXByw+jcSf5afif7WTLOJQVIxGhqolnsq8rGHq8DHjGtwwoDVkp8UdSyQGESqqrB2w3lsGC1iZJwX01hVngobun8PgKsg6ST1cUE/pkjOwv4dyVPw2FpDSbQb2osxZaKwJGDmIGYwMlaUvYREdI9StNrKoGq1Ix+mA6wAc81QCdBocUpmwWnvn+aMd5TA/+lfN3kHfZFpxmgtRBMjfD1KpvHrhefnruMGB9raqyIHwwB3WwvWYSPeTjMKVGVMg4r+3WpJMxyLKAp7dMQ7hinSkJsYJq8bXRBT6ScUmkb94ZN8RiVBWAIuwABkIJ5zjfntmN0Bs7PQJovs/CbxFIX+HQvdJZj5srtkbwh4MnthVXCnwrX9WhSPUCx5vG2CQxBmMXmT5nNxyIkqxdaXVKUZ5wazdVmAC1lrMZGyVzyNRMPRhJ1gyjqbVMbJvrAOOkpo3Sy8eiMKIckMaHKTU3pJx8LsVw1P7ngW4mdjHKwmuY54dypnbfEqo14sMzqE2Jqm7+sonJPhJ0iyU5OKKQC21Dt5GFLyKftO8XOBXJvXMGFTHDuESkHSqTq0zNCMZpDYUXjTh/Qzdq1XZ1f/fEGrR7pYvhoA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(38070700021)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F8E881CE21DA942BFD97971B20EF241@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 EQIThs8BRSET7TD27yBd1JSSbU+JQsOLvrQiegKlp/YnOlH/SmnvXl0by4vd46S/dizNRBpRX3QM5ebydH/qNyA8r1//Swic0oU4K+6OwIzLK0rkoSgLmcSp+Am+aVMpTe+9G0e/A4YV00k4X7otj4mLqkiYllDPMUzfQsDCWkRPeIq2IJeGYxMauk5RmqeTI/GG011uSrP4KRjsVCc93xgwFOLA0aQ1s/mftyo3N4ciyBO0mhMN+BMpnG2Nf8Nv42cfuuHDo/zVNCX1V5+AOuEQ9a+KKQQvY0vYkXAShxQSifTjXfrPvWis3J1ClxDOpfocFJ6TpHz0sKuH3Q/mbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR08MB11250
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7566c538-a81f-4f0b-983c-08def86cd49f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|14060799003|35042699022|376014|82310400026|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	aLpDGScEmjUntmCdo6tem0VyfjAVrHkqG0HCTMl/XGDzCJ3WX6Z5FYjI641iEU7galAQzcAHAqCfic7ieymI9z9MXbxU8DvhU7zahgdvH5hmmwMNsyx9nvnPMiKjwEQZaivXEUYW0J0sGc0kdR07NOFxxdmQSMrU3L9lgNMuWJLEYXPcDs2FB7DVb8P9nRcKejSd9n2W+feFQ2yiSsuJKAMUIkZjMzQdSGeGqyL2L2kRZReBFCu8otEd5cqM6TN2EvjCsQqT+ntAsZ5xq5uybCPtahZLDtc15ZdDLcenCAE60SUeNt6WL71Rd+SsSrECjaVlLn92H6bUgXCXyLvxwwN+Lwo4OjvYEEBk3Gvcx8q/I7mWWJ7RRlThGnrzVmsDplzAEsSrj+1sd5JS3XZmrYTwxWb5xRoyhdbs3ab+z7CFSL3jLQD9TJfK0nyZrsKfyreHlSkyU9pgWgPwRR8ckEPUXh2rnFx1Kh2y8rFKknbMfmruWjv0pgacIdk4v6OFW/5sZhGlzlPts0rZtoNG8jL1bzbhTBfr0EwwqjqgK75zgaKqTRxWZGxuArCzpPMu/gAXI1jRwLYdFsSeJCBACLu2VQ4DWU8v3rbeVVrG9oCwnlZctRY4DKT+Qs/7wj7oigzaWXNGj3cW7k1aSQr6W6pzeryOuaj/qoXll7oGyHImKIvpcBegNo+3lIskQCYe9ik6sSct4sl88B8tQJ3LJA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(14060799003)(35042699022)(376014)(82310400026)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	unNNubT8p6EdBqe9kH0jtd9XprPE3msiSJf8OOxORfHSrPF3gaiPctbl5xnB0SGP6lD/eU3KGeAKVzMy7eP5mc9GmvCBaNDD5QNa7n3z+Jl8B0cZvHf7Y0iYNTjHrkSdnw/nnAAlrMxS/lH7UP6JvO0Wk8jRPxEY3waAcC9uldjloATkYNBKrARXT5tBm22F+F7msS5a6pX6e3bKMtyHcx9pAGWveywH/ePKuxGnEJZmBRwW6GAVv0HNYSgz+hAuc3YG0vIG3yBiWmcu180Y99UlRbzvm4EYAbNnpnBJtdSvuaW9d2fqfeEftC5J5LR9Dd+7j/OjWl4q5LOl2fyZGQEJwO1hfhFwo9vlRQIIqt/etgrsUi4gDdF0+HOlr0ryPavMvw2bbwPM4S8B9zzNKaNJfgD81/qepdHFzfHvD2Pa3xuq94poanHtzEX1GqLu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:26:17.1264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 067e7d18-b733-4518-3483-08def86ce863
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9777
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2026 12:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128930

SGksDQoNClF1ZXVlZCBpbiBvZS1jb3JlIG1hc3Rlci1uZXh0IGlzIGEgY2hhbmdlIHRvIHJlbW92
ZSBweXRob24zLXdoZWVsLW5hdGl2ZSBmcm9tIHRoZSBweXRob24gYnVpbGQgY2xhc3MgZGVwZW5k
ZW5jaWVzLCBhcyB0aGlzIGhhc27igJl0IGJlZW4gbmVlZGVkIGZvciBzZXZlcmFsIHllYXJzIG5v
dy4gIFRoaXMgd2lsbCBleHBvc2Ugc29tZSB1cHN0cmVhbXMgd2hpY2ggc3RpbGwgZGVjbGFyZSDi
gJh3aGVlbOKAmSBhcyBhIGJ1aWxkIGRlcGVuZGVuY3kgZm9yIG5vIGdvb2QgcmVhc29uLCB0aGlz
IGNhbiBiZSByZXNvbHZlZCBzaW1wbHkgYWRkaW5nIHB5dGhvbjMtd2hlZWwtbmF0aXZlIHRvIERF
UEVORFMgYW5kIGlkZWFsbHkgdGVsbGluZyB1cHN0cmVhbSB0byB1cGRhdGUgdGhlaXIgcHlwcm9q
ZWN0LnRvbWwuDQoNCk9idmlvdXNseSBJ4oCZbSBzZW5kaW5nIHRoZSBjaGFuZ2VzIHRvIGNvcmUg
YW5kIHRoZW4gaW1tZWRpYXRlbHkgZ29pbmcgb24gaG9saWRheSBmb3IgdHdvIHdlZWtzLCBzbyBJ
IGhvcGUgdGhlIGZhbGxvdXQgaXNu4oCZdCBfdG9vXyBiYWQuDQoNCkNoZWVycywNClJvc3M=

