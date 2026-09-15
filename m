Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B00BC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 13:30:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23164.1789479003170427598
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 06:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=q/I4u39/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=q/I4u39/;
 spf=pass (domain: arm.com, ip: 40.107.162.18, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=R2CPlBYeG6QNl/Lb2RL0Tn0PhffFXqzPg3I1yP44V+ZLSr1nxYriBBQK3aJ/AArMdtoNdRtm1+8hYQOY9NkoNkeKkPos12WlFsi3fpM7M+Y45nj4+PEfUbyaGZAoSxRGtLk4AnOId/ms35sk/2uA2UCjgBKI2M7JuDG+Ty5gIKVklljEGXOu7cWdqswDTTfuQ0AMVFxQw4bctrMedrwh0Orbh7vO7GBkFpV9HY0O97bzd35PF08fWO+dNqwylEooGRhAwJCjK8do90b6cpoSBGW2V4BtNjqr+4w+bjVkdvp/UjdUHIvWYvCjCnqxxGIb5SPnEWz5uGlIAqzMhy4OIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG7hFJ3V2zSmixo33iwbgNOvTk4MrT0Y+CZkPTL3710=;
 b=wi6/e9jFInVoHDEG+8A+MRFLCPQtScC+tcGfPjovpVU+cetV7++290KLUHmHMEZPu3663hUzpv+/QGmQik6QmEDf8s6prehEWiT6VviKg6lc8uU1YyzNuGP+aoIF6jdO0KWBlsnZU49YWq/rJlkFOPWuIUOoB1vlvEGlNEaG4OrBK//Hrlh1OLwseifzoXYBGms8EMwaqEL0qA+6v3N+c+F18IsDX0/FREOh7ZQg2+9exbfmc86p9wTijgLgOSVC0DF9fQ2t4jcSnLWokQ2Z74+XLZvpdOO9AACwfU6c+5U0qbWnc2vDa9m2rbKLp/HKUdX13E/v5jlXe/ml2bKE7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bmw.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG7hFJ3V2zSmixo33iwbgNOvTk4MrT0Y+CZkPTL3710=;
 b=q/I4u39/V3ouApyFi2csuSq5B1oHmcZ14e9CViTpKoSv9jkAeZJ7qbYoUis4wT6WUDxRKx1aGPq1M5bnL1IFZWj8k5hazhMVb85frOvLGNasg3YyzXyPZLedjuU/Y8vl0meqAMushL3nQs0BQRtPITcX8GAlHLyVFaCLxILphVk=
Received: from AM0P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::20)
 by PAXPR08MB7443.eurprd08.prod.outlook.com (2603:10a6:102:2b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 13:29:51 +0000
Received: from CPH1EPF0000051F.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::5b) by AM0P190CA0010.outlook.office365.com
 (2603:10a6:208:190::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 13:29:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF0000051F.mail.protection.outlook.com (10.167.241.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 15 Sep 2026 13:29:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fF7HoHMUY9o1zEHKvzNfO1zmaHkii5OiLhcycAmWJZgZuFIUeT8/ZXEyjQloU2VCe6cpwpeIabBcM/CLBP7qkX//22IpfOpCM7HVEy7DTOLihgcMpuY3Co9gWLTwS3LKhWaUwwyPwwTuCMHTZ7YN15h+dWWRBvRNsMx8v1/8k3c2J39ktPDelKz7f96Jm6KmPjHg8qNoEoH6dJz8xng8zyOBYl4helzndIIUGp3MFarLvrdMIBrt75Nphs7VorczKQSTJZb6ieEw8ZaJihI4bZ+MWdKYqy0DU7/drbOo2PlKM/+i9Z9qs+h8j9jssiov+HZ0m9ooOnE8P4O4vY8jxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG7hFJ3V2zSmixo33iwbgNOvTk4MrT0Y+CZkPTL3710=;
 b=fEx6TG2TcpMrstxBGxtwXqFOyUOE/BfNOUU2SmBk7MGcl+6/bVqax53KrI04gPSgVWsz2XcAdYznYEUSSvXSCNJ3lQiqFeNykW63iPpM7SEVBKXDbX8YmiVmRwQcAMc+qE3HZo67nQ+Y3y5zz92GieYk35xLNEbqmZgP4nOWXmtlx4wF3ZwxbtWRXl5UGlQhIdYCmMXWWUc0gu9QqH4l1PnGI2MXM4ZNpOhTnu7/Swap8oCowbkqKUbEcacD0JtQIS8uThVogGnJZbnnpOlJX1DJ7bAyTjPq00h3MJ1u0YS0ImCObsdPzJW2C4Cn0mAfWLyCBSz7B3qb/LCHOyYumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG7hFJ3V2zSmixo33iwbgNOvTk4MrT0Y+CZkPTL3710=;
 b=q/I4u39/V3ouApyFi2csuSq5B1oHmcZ14e9CViTpKoSv9jkAeZJ7qbYoUis4wT6WUDxRKx1aGPq1M5bnL1IFZWj8k5hazhMVb85frOvLGNasg3YyzXyPZLedjuU/Y8vl0meqAMushL3nQs0BQRtPITcX8GAlHLyVFaCLxILphVk=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU0PR08MB9079.eurprd08.prod.outlook.com (2603:10a6:10:470::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 13:29:18 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 13:29:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Tillmann.Severin@bmw.de" <Tillmann.Severin@bmw.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] smolkit: Add low-footprint drop-in
 replacement for polkit
Thread-Topic: [oe] [meta-oe][PATCH] smolkit: Add low-footprint drop-in
 replacement for polkit
Thread-Index: AQHdRETJIWHArnnYeUe2odigEbkTcrbPo9SA
Date: Tue, 15 Sep 2026 13:29:17 +0000
Message-ID: <E76E2C6A-43C3-4E87-BDBA-D8DDA125E2A4@arm.com>
References: <20260914122927.87418-1-tillmann.severin@bmw.de>
In-Reply-To: <20260914122927.87418-1-tillmann.severin@bmw.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU0PR08MB9079:EE_|CPH1EPF0000051F:EE_|PAXPR08MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef1550b-b7f0-4966-af27-08df132d6bbf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: 
 k1Sl4VL+J9wSAvUW3AvkQ0PCcjgiNyyK29kAzGiDZ1LORF/56W4+zZnPNgb7GTHy1zMdrbYVhfQODZkj5ZjzIWErTdhbYKh6Upp+r2H6EJF8d/+BJL0cFxK+Y5/Z18fdOsM96l7tS6Won3lax2Tnvw/50scAuIedZNCcculUNFhgyh+YIWrQBmHoq9DN/rU7X1VzugMAqtAhiCGddBnhLLxZCgN666Hhg99rQSvGQt7WO3bmN2giz8vfWM9CWd3fraA1nkhSXaYNdoBhKabL87MBNu3ox5bvwYmHqYc8OWnHdrlrsBSSC6jPRzoIed5uRXaiA9TFTzBKFYQP4ZM7/3gTgdNcgk0V4SiVpxrn9jp60Z8A9NlqTd4ltAmtDuC8bfFvFgYrRUWZ5dShFi96kobk5n2UphhdHX526nWwxtUd7EMArUrJqzguFhMeQMqnuPLuXpiDthHU+hWQN0NJxmYYwIydo0WP/KubLm03MAvJpnsGhqUaOMLYPmK8FGyNwZ7gMvHZxEaTpJeVgpwRxgxekBjqTxy8VYY1V6/GPXG3BWDAZGi63BoCDNZFKBH3+mWpw9PPuUo7kcHD5xyt4xQhD2DbhACcv0ZoaixzveD5ggk13CCxsiVXIl3BRz/yPD7OCHA1BR8On29/G9yjVxqH8CvSCJw80pdDCCJBjBil8mGMXghV2J+/UZAeixq7UBqAB/hobUU5+d5LJ58zIQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD14F2E81EA4C249B55757609F9856A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 irCkH3/qF7AtcDXA7l9W2pZifmxE0z2CIgbuYb6dZaL+1POYARou7NuScJvwfA8nLqbjI64nZkz4KRqfcGp6ZHb1cQrIz1Fuf3eOqoTk5JB9JkNJDotqaoGqNd5/xHb4DQUyxp+bTE2Ene/y2lVwIbJ9SDe3Ai6JWheSQH7Ovd/Cdy89kGo+6R1h0YDb+eEQNkEZ8SPQBVS8yUtGFUAN47wXAmpgM2TaJ+7IFG9335Y5jM9n3S8yHhlSTI4NepO688GT0TwGVvOBibMXmQgENxy3DNBKl4F6q7Z67U4Sqw7CCB3mtRaihBycPgbqiGiSLDFZMI/XMSM30i4xYCwXXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9079
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 CPH1EPF0000051F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d36edf32-ac5d-4de9-9e25-08df132d57cc
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|14060799003|36860700016|1800799024|35042699022|376014|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	5kRCwVbqoQyCkjaDCdx5gGJcfp6fzvYGU25gFELE0TXHFIusWNIbkAehLdeaHKIvcSao1eTcctke65svB56jWbs3j8Mtv203KXYS4GOFMqocFa5VksFw1787UZtujEjIfYXRJbSFVv+snFtmwRHWQxGgmql0b+ONF3CM5GIbhg0+24ULYbcJr9THuADyHEL0RaP3IFvXAQwLVjjdsCNPLiEG2uNmoGaj82MP70F/1z5Goj8hSFlvtAf2Eyaz0RQSnRTCKG0w0kapwr1s6QnBUwdNyYQeYzlr1EJMEh+Vffbnsc+GCVAfzFpH4/788S8OiTpeLmzFbrjSBTPQuxDFmRULEFr5eSb7FdqvknB0eNjkxqCL0Gr301IKW7rziviG037L0RRGR7uCKd/0E9Dxw6X4AxefMwnVTxzbsdW/SVBBkXEOcQuGIANQbNyJAaKzoVbMW27dN9jOn9PdtDHva+GcRdOyCEDWM4uE1gNd8komKmg6dFYLpZK5NkiP4PXQrQ5rCvubZpFbgz5MaayoMaYjKHZdvNlED5h+1gm9+iDxcNEKcJPMezO7ghWcKb6rkKXvukjsEqulN+fE7vHoM/F0EtZCJc+tS9hTGgYzmsv0CyRuUujhJk1mLzmyRl1ryE5NNR/xhOIe3U2OhPBqTqkIAn7ub+qvletbDvYgtQVcGzMG57uRE62Ngw8eqmCdSLKbG31GLXYqw2T6RiWExA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(36860700016)(1800799024)(35042699022)(376014)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VqgNWnPHyOqF8U4Pq40hQdLrpkPpvjQRJ4b99SZsZLvX3uKtV8t1sAtLl8GOiho1SH0xib+LTNzWvWGaBXyu2SjavukeAx9//XFUB+TsecNuGiXJE8mkde14oPDYHP2eQJE6O7522kAIjVKQOOBxRM39GNi3k0xWre2W5tiMPTmrR3A+QAfACkuEFfW0shREOE3DfRFovCq8Shx3n6+mDKywrJW03rm/eil6ditkHi5S/n7xwvB5IQOiL13CgYEpoz2zdcBB3NQn77gqkcM4mPPCZ51YesDOGE9hR4VDruXs14pV2Re0vJwMipUaW00HWZ/R2o8JtDL/X1rJhsGV8sP2docOCaitHQoheAi/0WdZMLrYQ+7gWGfUhLbdF6qfXBDm3YMvhawtbISbT47RCOucGosSdWVW+4d9RrRYb9OHeSd966KzMbhkHvucRd15
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:29:51.1319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef1550b-b7f0-4966-af27-08df132d6bbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF0000051F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7443
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 13:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130078

T24gMTQgU2VwIDIwMjYsIGF0IDEzOjI5LCBTZXZlcmluIFRpbGxtYW5uLCBERS04NjIgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPFRpbGxtYW5uLlNldmVyaW49Ym13LmRlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiArQ09ORkxJQ1RfRElTVFJPX0ZFQVRVUkVTID0gInBvbGtp
dCINCj4gK1JFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJzbW9sa2l0Ig0KDQpUaGlzIG1ha2Vz
IHRoZSBjbGFpbSBvZiDigJxkcm9wLWluIHJlcGxhY2VtZW504oCdIHN1c3BpY2lvdXMsIGJlY2F1
c2UgaXQgd291bGQgbWVhbiBldmVyeSByZWNpcGUgdGhhdCBjdXJyZW50bHkgZGVwZW5kcyBvbiBw
b2xraXQgYW5kIHJlc3BlY3RzIHRoZSBwb2xraXQgRElTVFJPX0ZFQVRVUkUgbmVlZHMgdG8gYmUg
bW9kaWZpZWQuDQoNCkNvdWxkIHNtb2xraXQgbm90IFBST1ZJREUgcG9sa2l0LCBzbyB0aGUgZGlz
dHJvIGNhbiBqdXN0IHN3aXRjaCB0aGUgcHJlZmVycmVkIHByb3ZpZGVyIGFuZCBldmVyeXRoaW5n
IGp1c3Qgd29ya3M/DQoNCj4gK1BWID0gIjAuMitnaXQiDQo+ICsNCj4gK1NSQ19VUkkgPSAiXA0K
PiArICAgIGdpdDovL2dpdGh1Yi5jb20vYm13Y2FyaXQvJHtCUE59LmdpdDtwcm90b2NvbD1odHRw
czticmFuY2g9bWFpbiBcDQo+ICsiDQo+ICtTUkNSRVYgPSAiNDZiYmZkNWM5MjJhOGQwM2E1MzQz
OThlZTEyOWRlZDgyMmRmY2FmZSINCg0KSSBub3RpY2UgYSBsYWNrIG9mIHRhZ3MgdXBzdHJlYW3i
gKYNCg0KPiArUyA9ICIke1VOUEFDS0RJUn0vJHtCQl9HSVRfREVGQVVMVF9ERVNUU1VGRklYfSIN
Cg0KWW91IGNhbiBkcm9wIHRoaXMgbGluZS4NCg0KRmluYWxseSwgSSBhYnNvbHV0ZWx5IGxvdmUg
dGhlIG5hbWUuDQoNClJvc3MNCg0K

