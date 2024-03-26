Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0550CD11DF
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 21:15:11 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.45])
 by mx.groups.io with SMTP id smtpd.web10.22343.1711487709018503710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 14:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oHJoAGYJ;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oHJoAGYJ;
 spf=pass (domain: arm.com, ip: 40.107.241.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Aev5D3v1m9FvMvEvWqjKGrt/nth1ztx17b3xkXSn6toPFHOsKlKjJ/5riNZBEeZA2frGfFRpBMkbbituQ7Ekt1N2buJxwoTHNAxyH1Ato+5BUj6vyRQ9xw2A3lUvZ/cACrn8M4oEi2omoustdhgAfqbtWvf7+YQdiSPY/4SSzu9oTyADQaWkWlUfmZf1NsAZMcldXiSTD2Q0ibFTJNlj3GG9jePLxIn6W8OlFlVlnftazMQGbjHIZ5328Yo65R5qm0FzYq2GS8QxQB6UwBfkh7raJsqCoJYFG2IUW5TR+dT7pdI+0GBWcI7gPpLFKquJxJYsVThmdT8pkNWdFMxedQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lLnOHP+RukEDsMItZZBeaKCJbUa2VGeuKVCz+2I8sw=;
 b=LTLJBniioBVSFZgupgNyR3CdRGZuYcS8n/njfjeRS5bvCZSLzntZGwSsToVjRxZF4yKmIBWF+EXfXdJEDQUEKVOYG4cWcDSqreB28eIvIuSIfplTCckp+IpEqZkoFhHDZ0hOSudYApzqR62mIflmh9amPaYbqoHWsShWhCzPWdUbdCvpC5YYJq8Q3VEUhyhp/05Z2zGrtMMVjtgOcsb33A6wJpV7z0Et6FRhj4HLzjDNmrmCjUPI5wSaOnlUhmy3LfEYTKVc3wLsyW22IXJllQM2abB7u9iuS3dC4MquM4ssQ/S+m284VpGdQm5GPosdCghr2ixLuLuvk+Wyho9s5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lLnOHP+RukEDsMItZZBeaKCJbUa2VGeuKVCz+2I8sw=;
 b=oHJoAGYJ0k7AybEuHed0qzx+/hi740JFO2759fRmMu0cbfD6QeNMXhgpggqm2HBB3+kL+aaF+obDR5ralM/wdCHEV7xNXD/Lw352I3AqtYOAate9WYnNxcgWkgEMYr3hH0Z98dFDS+wZIuBiy0gsuIp6vnMlz4IVbdAkEtrRO7E=
Received: from AS4P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::13)
 by PAVPR08MB9793.eurprd08.prod.outlook.com (2603:10a6:102:31d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 21:15:04 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::5) by AS4P190CA0011.outlook.office365.com
 (2603:10a6:20b:5de::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 21:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 21:15:03 +0000
Received: ("Tessian outbound e26069fc76b9:v300"); Tue, 26 Mar 2024 21:15:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 759dde2c0ac86520
X-CR-MTA-TID: 64aa7808
Received: from ff73a23cd59c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 08A922FF-D4CB-470B-8B21-761864AF0718.1;
	Tue, 26 Mar 2024 21:14:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff73a23cd59c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Mar 2024 21:14:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZ02gJQnFT+JBn1LzdqqvX3cQHsOLjfYSMVY1NcKmYfeWV3TmMv2/V7uL675Ag4xCTU2dsdThvq9Q6zytHg2FmXd/pnLjlGHmuilMLnBnx6lvzgxU0g2gBZmtu2cgNvYiyyBEvMr8GAOzcy5KsNk8o/UxQ6w+JGpN6cki3337vz2wPVHzkjtrdshOAZ1UcsKegUp1Vya7HkFIekWc2nVg7LQuo098iFIlD/9NxXBjE8+BAfE746xNP2vhBW8aqGKEZZzktvuFuhanHbxQ7H+VyzsT7V9BXx/RltA5EfVhn0sjejxy6tIst8E0Zn7lkYyURrBe71yWSlVKKG+t6dtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lLnOHP+RukEDsMItZZBeaKCJbUa2VGeuKVCz+2I8sw=;
 b=HA1/wW5c89R36tRiFh4ezycId9kL2OrLhit8c6iWt1DrDbfGRVbIX5+W4FPkcfixu9AdtmgsY066a/tlXjD/MyGKkVslcfwUKGsTwPeBJYuKAzCuWMof6Ba9s9HOoGljYOj4hGSiUHDtAHAuHJwwENIlGPn/WJBPjSD5qjCgO1dkjrburuGszl8TpfWH+ceY6WndW1hWpcvgwlmld7RDepp4yT9xj5mVjwPimrHgQzALJmlHg/tOLF8qefeO1bbUq3kiY9edcCtXOCJt8SrzPpQHgHZW1ndKZuDkKqPBXalfdrth+hA4INZan7TnnrFKqG3fV17IY6aCyhIE+Snn0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lLnOHP+RukEDsMItZZBeaKCJbUa2VGeuKVCz+2I8sw=;
 b=oHJoAGYJ0k7AybEuHed0qzx+/hi740JFO2759fRmMu0cbfD6QeNMXhgpggqm2HBB3+kL+aaF+obDR5ralM/wdCHEV7xNXD/Lw352I3AqtYOAate9WYnNxcgWkgEMYr3hH0Z98dFDS+wZIuBiy0gsuIp6vnMlz4IVbdAkEtrRO7E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB5951.eurprd08.prod.outlook.com (2603:10a6:102:ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 21:14:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 21:14:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 2/2] microsoft-cpr: add new recipe including
 ptest
Thread-Topic: [oe] [meta-oe][PATCH 2/2] microsoft-cpr: add new recipe
 including ptest
Thread-Index: AQHaf7zAG3frxPSusk6mDw5tpR1xnbFKhcUA
Date: Tue, 26 Mar 2024 21:14:54 +0000
Message-ID: <E8CA58DD-11D1-49FF-8241-68FD6D52FD6E@arm.com>
References: <20240326203135.532296-1-peter.marko@siemens.com>
In-Reply-To: <20240326203135.532296-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB5951:EE_|AMS1EPF00000047:EE_|PAVPR08MB9793:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +3w46EBM3k6pXGcyW/iiEubknMCRTIYnXce62ahReRFdUcBbJPdsJKHtazIsZSqMtLYkJiOevptVRUDvMQCyTkA3RaORcdNpXRB6HKRkuxGqTV5MLyvLpqjCKXl03Zvm4shlr6VpRLwalU0i/5Eys8lfEENaM7kOZzNQ1aSREM8RvKCYakYdsKOZ9NB7AU/fXdTJXS0NtnqWL+vb7mSPVOpA2D1CIdAGiHTXe3WVWtUCc6P/w7cpFQcMGdcGImRgJU7H4jLI7KvteqWR7nKAJLgCQA41HixkiC/AdX98lN3vire+EaCGl8fVENQTFI7KHcGwjbbIvg3U47lkb4xdS19dhA7VtQZ76CHo6t9Hl/abGPAf4UmUvnWh/bgHxeqvu4X3eBQaLNxtfE7DgWcyTfiF4CP3OYlh3bbxwA98d9viJU5eOIlKwLHDfjks46WkKEjldeRqpZ+uEu5mmqqznuv0baPXIR7qT7ky4l5n4LYq/iJPtmCWa8C2oxowUlZ/phqi7ERcPhMD9zZ1HIMCm0Ig7XPRoYQjjIzSHczuXGQO/NSpUPl5aLhAMHVJ9tWyAWOH5Uh0JyJSo1WEFu1YrM9VqZpL0TaSWhVRNiF0ky2VseUd4FO8F5e8u8YlzXzcRvFu1Yt/zWq4PqZ6yzhX98FYIdC41QylTsta00AFoQw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <233E07EC09005B4C9E861377706B81C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5951
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ebb76d2-4a6f-4718-0051-08dc4dd9cdaa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	so422ibaOZULBw7MOnY3xTqMXM6Tr+LIev/rHQqrFfUEjI+0I23jIiYMk0rs+CPo817P7qbIS1Xi64hMtsCCRQ+GHwCm9H7i0UTVyH7gDeBI9PJP6/eFQUJmzeJ44x/LqoXy6IOCXO0kQYeubqzIg6vk8wK8EvPBU51HguSKrluRT0rIWdUNA3ytCdmQHLMnP/dftuE3VZWE4TyXGCcgYUcU0pSxORKcUlSgesK4nvR3UgyU/cj5UvAr/MGa90VP4TSUdXn6Fnmg0d93Vz0GCZUZPX0tIaYYEuPOUjSjCmEAxn6a8AkwoyzphmqOVKhJOnbipP9nKMAjd58f55FrOhDY0I1FQLj4+pGl3IJD7nDHB0yQY0CaDJO24GxLEPKUklcW2mF+gJYHuB3pQZGm9LzTvZPTTxXgCc/PX1i38JOLVDzB6pBAvI+BEaVAhfO6+krs+yQ62C+1l5aZLsaw4K7UEvtJ66VynqS+1Nmj4e258i+jX021mFfIs6zG7i1+TsSpv/Sshz+rv4gMKGAVKSM2IWuXo67y8sR0nVeLG5JdKyzB6Qc0eP1Qi7zthXVA3+4YHYvupcJkRWs5DpeFRF7FVT8PN9b7UZ65J+rvWVH7rHDdB/txerUT9c0RaSgUsAHEw4eUQek9rXVjPrz+NJcqsO7mYRpAzitcCQOTWzpUImBrk9AtycFjSzD3SIbMivHXnSMr8U7GQQeZcCXVGBfu8gMhFMExLgBVVfZX81TBDYKj89b2gJur+2xcKV7P
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:15:03.3011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebb76d2-4a6f-4718-0051-08dc4dd9cdaa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9793
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 21:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109630

DQoNCj4gT24gMjYgTWFyIDIwMjQsIGF0IDIwOjMxLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+ICtpbmhlcml0IGNtYWtlIHB0ZXN0DQo+ICtpbmhlcml0ICR7QGJiLnV0
aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncHRlc3QnLCAncGtnY29uZmlnJywgJycs
IGQpfQ0KDQpVbm5lY2Vzc2FyeSBjb21wbGV4aXR5LCBqdXN0IGluaGVyaXQgcGtnY29uZmlnIGRp
cmVjdGx5LiBUaGUgbWVudGFsIG92ZXJoZWFkIG9mIHBhcnNpbmcgdGhpcyBsaW5lIGlzbuKAmXQg
d29ydGggaXQgdG8gYXZvaWQgcGtnY29uZmlnLW5hdGl2ZS4NCiANCj4gK1BBQ0tBR0VDT05GSUcg
Pz89ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdwdGVzdCcsIGQpfSIN
Cg0KQ2hlY2sgUFRFU1RfRU5BQkxFRCBpbnN0ZWFkIG9mIHRoZSBESVNUUk9fRkVBVFVSRSBkaXJl
Y3RseSwgYXMgc29tZSBwZW9wbGUgbGlrZSB0byBjb250cm9sIHdoYXQgcmVjaXBlcyBhcmUgcHRl
c3RlZCBhdCBhIHJlY2lwZS1sZXZlbCBieSBzZXR0aW5nIFBURVNUX0VOQUJMRUQgZXhwbGljaXRs
eS4NCg0KUm9zcw==

