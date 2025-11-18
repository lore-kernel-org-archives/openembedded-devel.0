Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486A2CEDDA1
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 14:53:51 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14257.1763477612825824691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 06:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kBy6/Myi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kBy6/Myi;
 spf=temperror, err=temporary DNS error (domain: arm.com, ip: 52.101.84.13, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QFpd4WWLuixN/b1vEHpBN7BiYv6DF67Yuz6N/LaTLGRKSehY6c20gQVwUvlSgjNl+hxFOg84RQv3zmTgZirlzNfMYrXHPp7kLkuEa10vY5IN9Zvk9NXsHBYb+YNeAQljTqi9lsz6KegvdGrbYD5vhDUQfB3OBKn/uKfBBm/ilRzlPwmfzm2wP2NctPcYzpbNQ0NDe3f8ZnrvynjD1qeTfBnCK3VMjy+k4ZokCCsUf4Ts+QBSu+7psImi6v+aG5zQ7iw9seoawo+1sqy1+yiB5c+U/LQCfRFqlNXjli2dtTTgma1bVckKR5yBO/QfMydG13/7A9qKbeGQOJX2mT7Tag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssdi7kHBV6D5GzouJGXStNVTX1p+c3VSLyJiI6FGQZU=;
 b=GTHqDtpv5g1IHrpkl3WPK60dJStzKCBvQIMyf2TNN35Bh/KrX02iy/gqziIuj0PJ30I3Cv7wz2FC9M74eIQL229S+5tCiAFuf+EGXDjbZD6Y2Vf8HFS/NCrUvNeG5BltNzsgW53QfD3Yb3qKpIC8J3EAe4R4XOtjlGGeurxNNE1r301Pq2rmedZKvQCfaTY35o79x9n6yYoa6oSE4VijTNu18tqExeNxO/ziV9QrHkxtqRTTsShXmXoqzmM6KLSM38W9z9PDCndvav1Z09YDBG2dhHhRLL6pQsAeyQDCIVlhnaYn3s8HnmgsWCHGFJXx7ZobUWDED5coPD/GUoUlXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssdi7kHBV6D5GzouJGXStNVTX1p+c3VSLyJiI6FGQZU=;
 b=kBy6/Myi7OCJ6KldZshPBnsia+qwGsAVVgKYWukBfXq5HazkNhKfkb1GPFv1b3HdKlBCv6aY1SPPFPa7ZXtHRW9pEjlp5MmQ3cpt6YqFVf4cdcAEyZczOW9Mlsv1GOs8hZC/JXd1LpKuyu7HXe32wRmRC0dHwUo+wEQxgESjf8w=
Received: from DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) by DU0PR08MB8471.eurprd08.prod.outlook.com
 (2603:10a6:10:405::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:53:28 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::1f) by DUZPR01CA0067.outlook.office365.com
 (2603:10a6:10:3c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 14:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Tue, 18 Nov 2025 14:53:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGyOdHAa8KJvccOmjtRD/RD7FUNkcJkTMVZ94gBnGQYVFzhu8gjbMZBtfZzZLzuh6zE483tJZfYgap8IkWFFzPhVRxPpwCqh0gAVx44ETetGpZ+6gegHflxtiMjS6uuZv8vf+MP5Uegob/Yk4z/6kHN//H+faw0ewKLc9KmvRzyoKytLMqcmmEevJx54MhFVJFf8Kq7NKnxdSuPezTuv6ecyURW7ZIt4yn1wpsNfiMTNKi60t8og/gXqKVj34iixy5hjB0ZhhjMVFiwjCpz+HdUaLs064GL6Pv0ibUzYuj8CCXjI6TAuvyaBtSYzNN5F6fZE0ctaJnNkkgwz+S+smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssdi7kHBV6D5GzouJGXStNVTX1p+c3VSLyJiI6FGQZU=;
 b=Ev5hms1gV6ju5PcEMO5sEKi2EJI8H3c9zogQ2YuVvUk+yxGPBC9GQw5Svl7EMyLw/xaX4/xPGBYIAqQ491zy130Sprxl2aAHADSZ6mQApgkEodAZ4u2nKotw8fO3Dr+3EEq5BHpaYVCu9Hiiv/z7hKTznOpCCTsi0Wq7CC7eqrsEr9e6Agrsa9CJiXO98f2xUAF+bMMg9LkoTO5/QGQGXDgrjtHKJVFsRqAed9g8GkcGxU60hcfrOb8wS0G56mou2WeNjrmyAXMmeRj7yRQBFna1wffMhf7B6aaKhu7XOAremRSybRQ1sL33YSURY8RhYMHC67PbDduZnU4jPUYomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssdi7kHBV6D5GzouJGXStNVTX1p+c3VSLyJiI6FGQZU=;
 b=kBy6/Myi7OCJ6KldZshPBnsia+qwGsAVVgKYWukBfXq5HazkNhKfkb1GPFv1b3HdKlBCv6aY1SPPFPa7ZXtHRW9pEjlp5MmQ3cpt6YqFVf4cdcAEyZczOW9Mlsv1GOs8hZC/JXd1LpKuyu7HXe32wRmRC0dHwUo+wEQxgESjf8w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10260.eurprd08.prod.outlook.com (2603:10a6:102:369::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 14:52:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 14:52:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] CVE report - master - 2025-11-17
Thread-Topic: [oe] CVE report - master - 2025-11-17
Thread-Index: AQHcV6YLhkOvE02SK0CVDfEUBL9yabT4hrOA
Date: Tue, 18 Nov 2025 14:52:55 +0000
Message-ID: <BA866AFA-CD11-4615-8AA4-04646194A330@arm.com>
References: <20251117093853.844143-1-skandigraun@gmail.com>
In-Reply-To: <20251117093853.844143-1-skandigraun@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10260:EE_|DB5PEPF00014B8D:EE_|DU0PR08MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a0f357-d09b-4b98-6ade-08de26b23bbe
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dG1rVjN3bDgxS2ZBWlVMNTBoYTJOaDc5bFNqRTNLZVNIMW8zRHova3JkUG9r?=
 =?utf-8?B?WnoySVVNc0w0QnRiNUQvWXlxOXVYUnYvdWNMMHBOVnlwOTI5aWRPb0oyMWxX?=
 =?utf-8?B?aG5aSXV4aWozTVh5bnFRVHR6dStFZXBPWTZDNlIrL1EvdTRUSlpDR25kMWwr?=
 =?utf-8?B?ZHV1WE5nZkg2M3NPaDZTTGhjZU1EbjZOeERPTnNpQWNZZlZVNEtBYzMrWm5O?=
 =?utf-8?B?VUx2TG9wZWFLN0g4YS9IV0dvZnNuV0RaZmQ0VGNjb3lZY2VhdVptVkpkKzJ5?=
 =?utf-8?B?VlVONERRb1FuWjNUblIyb1lIaEc5aFNMTXB1KzhNQWhBNUFKaEtiQnc5ZU41?=
 =?utf-8?B?dkRUN1c2eElTV2tscDRKZ1VJYWc4K1NpaFVpbkQzTUhrZS95N3hocXJtc2t5?=
 =?utf-8?B?L1l3ZFpIb3U4VnlLSUNpSEV5WlRXY1BIUk1ySEtja1QxQ3U1R1lYcG1HSU9U?=
 =?utf-8?B?Ukh6MzNIUGdaK2Q3R0pBSVhKU09GR2ZMUkxwVGJTaUYwYVVhaGt2UWx2c0Vw?=
 =?utf-8?B?c2k5YmtnSmR3bG8ycFhPdmxTN0lHSUh3WkFsVVVNL29Fa2hnSlVQbm5VRDdu?=
 =?utf-8?B?TG5WUXBweVpCWHE0MUxOVzE2Y0lsMXM3WGhYK3JSSTNlSFd6TGZ1S2lxT0VU?=
 =?utf-8?B?OU9iaXFWOU5ITFBSMWRyRzA0WHpFYVdRaHc0UTJLcG5HZ3R3UjR4cHphNlYw?=
 =?utf-8?B?dFcyQ2Jld1JKRm5vdEVVWTYvR3hnTGwySzRPS0lpQlhwWjQ0Zm1tclVDaUdU?=
 =?utf-8?B?SytYcXlqREJNbllHdXlRWjc4R3EwVWVjbUlLRmVZUHZoWGRjWUpaSFU5YmFD?=
 =?utf-8?B?MHZ1MDVkaklLUjNaUXg4dG95ZHRRblc1Q0xIUnpDQ1U4UGE4NTAwN01yL0lX?=
 =?utf-8?B?azhySjFYbnlrTEd3SS9FZEVJSjFhL1BkT1dkWGd0aUhUMkFmcEIrb2tWZVk2?=
 =?utf-8?B?cTdseWFpU1dVWjZXc1c1VUdKcy9WdEhic3hzNStJdzRoTjJQMTZUNTkyaExL?=
 =?utf-8?B?TUVqZUZXYVlQSlNhSkw5azdmU0dYTlBzWVlkMkYzVm83ZzhhcU1tbG1jYnc3?=
 =?utf-8?B?VHZSTW5jWEtZSzNjL25nNUthR094ZVpOTmxES3hhRm4xY3BDZGNLeHMvNmp5?=
 =?utf-8?B?bDhvMDhicWtkSGZyYmdLUnBlell6VzhaNzBjWWtqZ2lEVVpRdVZIamVQSGZU?=
 =?utf-8?B?ZEFoc2QxUTlySmZnUERBWG4ycGdFbWE3VHVKeFhyZ2tCNlE2b0xvUGd5YUxq?=
 =?utf-8?B?WWhQL0RNVVdiSFZaWDlpckN0Z3ZPVjYydzZyWVVXVUhuZXFFRjRxckZNbnpW?=
 =?utf-8?B?aTBEejdaSFZvdHNCb3h0Zk9ISURzcW1xdFdEZHVOc1RwN0t4TjZaWWI4cGxY?=
 =?utf-8?B?amhJMXdMQVFwM2lYaGlRSEVmWm1WbnpBVGNqSE9mcW45U09qNG1mVHVIWC9n?=
 =?utf-8?B?SkxSNWxVYXQ5cEM1YjduL09zMnNNUUo5MURxMFlGSTdWVWpFSWVVeFQ1Y2t6?=
 =?utf-8?B?b0FnSkQzRGhjNHJiQTE3NHVVWjJ1ejh5WEZuN1huVWJENTFFOTVNMEtrMkR1?=
 =?utf-8?B?dXhCTlZET2ZNYnRNdVhtdWY2alp4SllFSHg4TWtrSlZXaklwSFNCL2lKQmZK?=
 =?utf-8?B?RkllbWl1TFFjNFpwRlZXb29naTZ4bGlhMEk2SG5pRGZJWUZnVEdUMGx4S2cy?=
 =?utf-8?B?OXBPTnVXUGEvZ3doUjBhcnNER0F0Mk1QMFlSUVd5WnFtSm16a2szVWoyd0VD?=
 =?utf-8?B?aTlOTzZzeXhXVVFDdXZWZVk5U3Q2QVBkTDRqaG4rcklUcWpIM2RKSVg3VWtL?=
 =?utf-8?B?TEt3UUZEUUczZHFNaStyZ2N0S1AxRHY5bHZuZFhCVm50VCtMRkx6SXpYVVdo?=
 =?utf-8?B?KzV3WjNWaWFESFl5bXgzais2cGZTeFZzek1yWmxLKzhPQUs3UU9pclpubzlo?=
 =?utf-8?B?VXV4azBKb3pjdzJzYnMvbmNabThBR1pvN0xnTDNTSVB5SzBDanRxTzVlNnlX?=
 =?utf-8?B?UWVIMzhxTVBTSXZQMGNRYUw5V3V6Nmg2TVZlRFVxSGtvdXovSzJjWWVSOGRo?=
 =?utf-8?B?dytLYS9IRlBLejhrU0pOWGdhdkd3TzFoWWgyUT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <52EF761480F85A4FB2A85399E1AE9390@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10260
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	28b40ec1-12f6-41c8-b839-08de26b22844
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|82310400026|14060799003|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VEpUQTJGOFBnWEJiWFR0d1MycEhiV1ExenpGQU5wYkVKRXBJQmxsZzRtcG1t?=
 =?utf-8?B?ak5jR25jS3RUU3pIMFplaFNSSEZaZ3d5NlUxVG1VSk1GUWZRckFyZzdaOG9J?=
 =?utf-8?B?L2M4NjhWb2I5WGtYemtIbkFNZTNlUGxUWEF1Nk1tV3lCbCszQUpyYmJSbEZZ?=
 =?utf-8?B?Wi9tZ1Q1UG90WGtMaW9aRHluWnh0LzFGbEFQZjMyc1FoT3F6bnllTitGSGpp?=
 =?utf-8?B?WFZoWTlPV3c0emt6aCs4RFdrVmRqY2N0bHBpWkJtRThOT2RFbDArOWZ3Vllq?=
 =?utf-8?B?c0xwV2J1eVZPRXZ6VFJzeTFiTnBRbmREQzhuRzRmQXR1MVVKbHNDMlFxM3Y2?=
 =?utf-8?B?ZlNMamJkN1lFNlVtVkRZODRISmxZa0xqVEp2U0h5WFUxZUc2THNJYmJWcmpp?=
 =?utf-8?B?cWFoRnJwbUdGeVNsUVdhczZXcjN2UTYyYXA3bHlvYnd0WTRGT3dURVNzVWJ2?=
 =?utf-8?B?S0htZ1BLMDF2bzBScmdzNjlsVktwRUo5c0dCQzFCc1NvRCtDc2U2V0dHdGVn?=
 =?utf-8?B?Y2NQY1VHZHQ5cmo5VzlVdzBNbHYxU3FQdlV0SXRDY3ZHY2dJakp5QnY3d1hy?=
 =?utf-8?B?dDdSZUFlVU5JYUpwaVp4N0FCNTNzNE1NYjZseFhrMGFRRWExM3NkeUxpN2pj?=
 =?utf-8?B?N09lZ2M0WG5MOVdDMGJMTVhieXk2SEEvdnZYc1lUalFOemkwWjArbDlsREZB?=
 =?utf-8?B?ZU95a1FXQm1iUWdpd1RGYnFRbXAvMjhkOEZYc2gxOGZ0ZEpVVU16NHhVNXQv?=
 =?utf-8?B?Mmg3K2RnZ1lMVkZVRVh1T3Y2bXhHN2NNQVQwYnpaQ2lYQUZYcEI4bWpVRkZU?=
 =?utf-8?B?M1cxcm14ekQvaGxsaUhTSkg4c0VpR0FTdERFYVZIWXp4SDJ5S29PdUMxU3ll?=
 =?utf-8?B?UStQS0QvVGVIcTRpb3pDQTgrZmVWdGFPN2M2OFlrM1FKaGN6VWk2WHdPTnND?=
 =?utf-8?B?MHBDdlZJbmluQ0NIcGVGaGNOK2xyUjd3c2Jac0ozWERwdG85cWhwQWFibENv?=
 =?utf-8?B?dVZaa0s1QUxGeXR2aks3L0NGKzlnVnIrdFVpRnZsZWlyN0lBRHc1djJxQkww?=
 =?utf-8?B?ZHZEckJxOFFyTmpxNFBKRDd4c1gwVXV6NEJUYXZhN0h5VzExNC9TZG8yUC9R?=
 =?utf-8?B?MDdvREd0RzllSVdNWFFneEcwaVpQUHhyRVp6cENhdGQveVcwdmJrLzdLZXBS?=
 =?utf-8?B?b21LSzJBZmJBN0tqd1dFbGppSnlka2VwVHJDM3ovSStjdkszL1pUdHA5Mzhi?=
 =?utf-8?B?QVk4eUJiQnJvOW1nU1pkdTFWY2M1cVFxM0VOS1dFTVRyMHZoVk85eGxYV0xI?=
 =?utf-8?B?QnZmdHdsWDNsN3AreHovdHdzMEJra1JBbU5VLzlPWDkwYVRSdFlFVHdMQTg0?=
 =?utf-8?B?MnI4a0FFOGVRUVpocGF5dnI4QkNoTGdaTUkyU3Bab3ltMG54SFBwbis0eXow?=
 =?utf-8?B?azVrQ2ZKRkU1ekR6cW1oRWxWZEt4UGQ2RHVjZUlxenkzYzA5eTBCdkRuUjNj?=
 =?utf-8?B?TEZGVEp1eXd5S0dvY2RDNTFuN2hDK0lMWTdPY3JqRlZWUGJoSWNPbzdjSkpL?=
 =?utf-8?B?Z3dEM2licUhNOXUxQ1pkWWp4em05YldsN0hiVVYzN2l2VkdXdFFyNlJ3Y1Jw?=
 =?utf-8?B?bEpYejlwWXF0TXRDOVp4MFY3NjRCQStVZFcwanEzTVFzZVl0S3ArRGxBUExH?=
 =?utf-8?B?cE04UnNoaHg2aFYwaFRsbjBZY0JWY0lzTDhLU3MrUmFXY2I3Yk5QMVZveUZZ?=
 =?utf-8?B?ZDBVSnpDLytTbUJuOUYxeVRhV0U2d0FybTFRWkk5ZmxvRmlxZ1ZpR1pMQS9N?=
 =?utf-8?B?RjlMVnJIUTVzbGk2alp0RTZZUGFCaTRySEE2VGpFWWpTMVI5eEJZUDlIekll?=
 =?utf-8?B?TE9mNEV0TXNLUW1WbElreTZIbC8rczFzY2ZvRkhCNXYyVlNnaTZOSlE4aG10?=
 =?utf-8?B?SEVteDhXSVpSeXY3cTVPQm9VQjRpcGJVTXZpMEJoRTZOdXB3RUpDR3d0M3Uw?=
 =?utf-8?B?S3ltdmlMbEtsalhvQXhhRE9iaGRvZTJUcGxKc2ZDQzFzUzIySFlvZzBVS2dT?=
 =?utf-8?B?U1g2Y1QwQWdOdHZ1RjBRcFZNVzJzRFVEVzJnUFpQVVlKdVhXSjhtTHRIbDRB?=
 =?utf-8?Q?6K/4=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(82310400026)(14060799003)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:53:28.1102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a0f357-d09b-4b98-6ade-08de26b23bbe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 14:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121860

T24gMTcgTm92IDIwMjUsIGF0IDA5OjM4LCBHeW9yZ3kgU2FydmFyaSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c2thbmRpZ3JhdW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gLSB5YXNtOiBDVkUtMjAyMS0zMzQ1NTogaHR0cHM6Ly9udmQubmlzdC5n
b3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjEtMzM0NTUNCj4gLSB5YXNtOiBDVkUtMjAyMS0zMzQ1Nzog
aHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjEtMzM0NTcNCj4gLSB5YXNt
OiBDVkUtMjAyMS0zMzQ1ODogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIw
MjEtMzM0NTgNCj4gLSB5YXNtOiBDVkUtMjAyMS0zMzQ1OTogaHR0cHM6Ly9udmQubmlzdC5nb3Yv
dnVsbi9kZXRhaWwvQ1ZFLTIwMjEtMzM0NTkNCj4gLSB5YXNtOiBDVkUtMjAyMS0zMzQ2MDogaHR0
cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjEtMzM0NjANCj4gLSB5YXNtOiBD
VkUtMjAyMS0zMzQ2MTogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjEt
MzM0NjENCj4gLSB5YXNtOiBDVkUtMjAyMS0zMzQ2MjogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVs
bi9kZXRhaWwvQ1ZFLTIwMjEtMzM0NjINCj4gLSB5YXNtOiBDVkUtMjAyMS0zMzQ2MzogaHR0cHM6
Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjEtMzM0NjMNCj4gLSB5YXNtOiBDVkUt
MjAyMS0zMzQ2NTogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjEtMzM0
NjUNCj4gLSB5YXNtOiBDVkUtMjAyMS0zMzQ2NjogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9k
ZXRhaWwvQ1ZFLTIwMjEtMzM0NjYNCj4gLSB5YXNtOiBDVkUtMjAyMS0zMzQ2NzogaHR0cHM6Ly9u
dmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjEtMzM0NjcNCj4gLSB5YXNtOiBDVkUtMjAy
MS0zMzQ2ODogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjEtMzM0NjgN
Cj4gLSB5YXNtOiBDVkUtMjAyMy0zMDQwMjogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRh
aWwvQ1ZFLTIwMjMtMzA0MDINCj4gLSB5YXNtOiBDVkUtMjAyMy0zMTk3MjogaHR0cHM6Ly9udmQu
bmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjMtMzE5NzINCj4gLSB5YXNtOiBDVkUtMjAyMy0z
MTk3MzogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjMtMzE5NzMNCj4g
LSB5YXNtOiBDVkUtMjAyMy0zMTk3NDogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwv
Q1ZFLTIwMjMtMzE5NzQNCj4gLSB5YXNtOiBDVkUtMjAyMy01MTI1ODogaHR0cHM6Ly9udmQubmlz
dC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjMtNTEyNTgNCg0KUHJvcG9zYWw6IGRlbGV0ZSB5YXNt
LiAgSXQgYWR2ZXJ0aXNlcyBpdHNlbGYgYXMgYSByZXdyaXRlIG9mIG5hc20sIGJ1dCBuYXNtIGlz
IHN0aWxsIGFsaXZlIGFuZCBkaWQgYSBtYWpvciByZWxlYXNlIGp1c3QgYSBmZXcgbW9udGhzIGFn
by4gTm90aGluZyBlbHNlIGluIG1ldGEtb2UgZGVwZW5kcyBvbiB5YXNtLCBhbmQgYWNjb3JkaW5n
IHRvIHRoZSBsYXllciBpbmRleFsxXSB0aGUgb25seSBpbnRlcmVzdGluZyByZWNpcGUgdGhhdCBk
ZXBlbmRzIG9uIHlhc20gaXMgY2hyb21pdW0sIHdoaWNoIEkgYmFzaWNhbGx5IHJlZnVzZSB0byBi
ZWxpZXZlIHdvbuKAmXQgd29yayB3aXRoIG5hc20gKG1haW5seSBhcyB0aGUgZGViaWFuIHBhY2th
Z2luZyBmb3IgY2hyb21pdW0gZG9lc27igJl0IGRlcGVuZCBvbiBuYXNtIG9yIHlhc21bMl0gc28g
dGhpcyBkZXBlbmRlbmN5IGlzIGxpa2VseSBvYnNvbGV0ZSBub3cpLg0KDQpJIGNhbiBzZW5kIGEg
cGF0Y2guLi4gOikNCg0KQ2hlZXJzLA0KUm9zcw0KDQpbMV0gaHR0cHM6Ly9sYXllcnMub3BlbmVt
YmVkZGVkLm9yZy9sYXllcmluZGV4L2JyYW5jaC9tYXN0ZXIvcmVjaXBlcy8/cT1kZXBlbmRzJTNB
eWFzbS1uYXRpdmUNClsyXSBodHRwczovL3NhbHNhLmRlYmlhbi5vcmcvY2hyb21pdW0tdGVhbS9j
aHJvbWl1bS8tL2Jsb2IvbWFzdGVyL2RlYmlhbi9jb250cm9sDQoNCg==

