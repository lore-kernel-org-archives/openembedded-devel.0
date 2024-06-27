Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97972C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 10:12:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web11.4679.1719483135913340869
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 03:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kM6fZg5X;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kM6fZg5X;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=G/9Gc09cAzmC9qpwAygDOUnN3/Iw5mZmY0J4jJLBybZa3ic38H0iIhWqYmj3XTVWWN5Ed6+CqPf0T8ULTI14mw6hCgvHg8xy95hv02pzNw4g5KA81YDolfXWCp5LlL+tOzspnLEohJbBDE2NNFkGltPy9KXx4KRXxcQJI3loKKQPL45WPzcI5krWKRFUHZ6/ZBLjrmzbVsQgg7yWDEUkf+HaQrIUpBXQeaunUEhl5e7ban4VbPf8bMKNmaZxRnBi4jyga1zOeWJc1KL7Pvx6ANxx8YSij9hniEdIvHkRg491XRpra50DI/NQarXh3c+p/W1H8cWAgXMGCLYtYhedfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVl8n6fGH7KuI006PXlw+56cl2OcxIMsZGO2I1OxnnI=;
 b=D7MhL36Ve/hZ4w8emjY6njTfaIfgWuvWd/IL1ORp2ajsZEDg7MKE6xyYsvCAzQ3WZwBLw2LVzJcC6mexomgbqSiiUP7ytprAf1jPDEiNSS9m28ehminPB9/tF4gohs9bFR8gUNit9EwpUQY/Fz1XID1PkrL2UPo/LIvlwwfC90tczNt0ai1XiUofmLyeigLBRG2OToT7ommWSymk1nYFOIFkb9LJfhccj+GuKSeCwjdKqoe1DCT+zGv0r+pt0QkPWSnDS8OJw9M1iXnmnNfPjRZklStt1iGAimVhEP830986s8ZtW7capZiBPf4iWkRzbOfLDSoXIJ+HGIQYovoMQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVl8n6fGH7KuI006PXlw+56cl2OcxIMsZGO2I1OxnnI=;
 b=kM6fZg5Xa5CKH4GOa7DstDcJTBF30JPoFRIIyQRR3KgQo+NON7TK6VGdZOBxCTx14zi/j4cERRfRozs2hCq9SCtN2L+40vTq8Kn3DCRMKS2FzgE4bx5Ai2G0HFC/cSyVhYbE47GtxMZ+3tyfi0Ym6/mquCkughiRf+R82kHo9tc=
Received: from AS9PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:20b:46a::29)
 by PAXPR08MB7366.eurprd08.prod.outlook.com (2603:10a6:102:227::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 10:12:11 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:46a:cafe::63) by AS9PR04CA0036.outlook.office365.com
 (2603:10a6:20b:46a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 10:12:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Thu, 27 Jun 2024 10:12:10 +0000
Received: ("Tessian outbound 1fca641c4c16:v357"); Thu, 27 Jun 2024 10:12:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19eb8195bef9695c
X-CR-MTA-TID: 64aa7808
Received: from 7a0fd5ef3d56.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B76A603C-2C32-4112-9F93-DEF749FC466F.1;
	Thu, 27 Jun 2024 10:12:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a0fd5ef3d56.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 27 Jun 2024 10:12:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlVVMOHyf6ICqE7NrdUyRNML8FHyboQobGxBAPWQatQz/iMmdFJ/jtr9/bKNCy+lI4Df5k8W5UgDkTzseoar7BN3jijq1Gc/ojcnJQNsRXslb3GykGp/O+SjSx2VUsQthoEjxxAMNYeTashmQS8XoysO5fiRkt99i0UmDCEIcNrat75V4PYnHybbKMRiaJBTjgp0l3JesaQ5DFaV6+v2EVAbhUfGjCUgEYNp1YgbHJRMYZfiRT/0NwksrnXMYqAxBgjLBM0HHYDeyADD0KmxaZEmiNdVZ5HTyJTt7qg70sOyh2zN3D3kCGxfIDZ6ZM7jnyjc3alh8I/ooAqljH8LnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVl8n6fGH7KuI006PXlw+56cl2OcxIMsZGO2I1OxnnI=;
 b=NzKHazWr3pX2vFCMB/nCyrCM4hr7sARQ4vhczC/BmsoAfOAiFJCot1cQdXWFm6ZM/L8ql1HeTDdZIEQVllmAW5hY4EYpw1s6dEJ8MlFuzLV+mzZdX/DHBjfS/n30XW0qrT4pmi8MsExupAwlioZcHXn00KQALdMJmVhcJU5gzaY9L09l3dRvpWNSGFY24i3IU+dtAQHKXPhgdyBJco9h0O7+ylt/SEpwUpGEvc0bymjrQnALb/rSu3cZrCO8FTaUiXTkvR+qr5qDxBoDQ5Ve131/Upo1MqbAkeQQ1j/f5ZtEiVfmaHYf41YNF5DQ26+SvC4hb+5IId2latxIvJZAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVl8n6fGH7KuI006PXlw+56cl2OcxIMsZGO2I1OxnnI=;
 b=kM6fZg5Xa5CKH4GOa7DstDcJTBF30JPoFRIIyQRR3KgQo+NON7TK6VGdZOBxCTx14zi/j4cERRfRozs2hCq9SCtN2L+40vTq8Kn3DCRMKS2FzgE4bx5Ai2G0HFC/cSyVhYbE47GtxMZ+3tyfi0Ym6/mquCkughiRf+R82kHo9tc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5684.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 10:12:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 10:12:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Should DISTRO_FEATURE ptest include ptest-runner
Thread-Topic: [oe] Should DISTRO_FEATURE ptest include ptest-runner
Thread-Index: AQHax+1/luxA7m9pDUerOTv9jIzHtLHbZP4A
Date: Thu, 27 Jun 2024 10:12:01 +0000
Message-ID: <45281F93-46C7-4E91-A0B0-EEB37FEA712B@arm.com>
References: <x6gyiofwakvibrczp5awde7lihbxomhqslfn2izreb5wyxvbqi@hy5fd7bywmm5>
In-Reply-To: <x6gyiofwakvibrczp5awde7lihbxomhqslfn2izreb5wyxvbqi@hy5fd7bywmm5>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5684:EE_|AMS0EPF0000019B:EE_|PAXPR08MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: d68e3ad6-df8f-4b0b-adf6-08dc96919b8e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a3R5L1dwQ1pvTjNrbW5aaUVxVjlhWUY5WTlzQWtvSG5yVDR4cEFNQVFQQzNG?=
 =?utf-8?B?eCtqSVA1eVVOT1FPOFMrWnZuY0RzWnFyMWxoU1lLQjVoa081bW9PTlhjSHVm?=
 =?utf-8?B?Uk5MSHFCRFJsSDk1S1Aza28zRzkrVjFEV0ZQdndIZFFoMDloaVgvVS9YY2lV?=
 =?utf-8?B?T1JZNzVLZ3hNV2VlV1pueVVubjZKb0hvQ3ljdHBpTjdub3FlZTVYNXYrVXhW?=
 =?utf-8?B?SmZQbVpNaHFxa3RMeHVnNHVCd09MNWJBYk5HQ0VOUExFYUpZUTVmRHhBRHVC?=
 =?utf-8?B?QXZrc2Ewb0I3c0lxMFlyU0c2NDlpdVhBQStCNWVEVU9ZbHhkWVlpcEhTOU1Q?=
 =?utf-8?B?cTdPcldSQWpKK3I4SmQ5N25IUmNVQXN4eC9TaTduVDdoVXZ6YXBzS3JoSGth?=
 =?utf-8?B?aHQyZVAxM3ZKUTJ5R1g3Qi9aS09CbENENUdYRzNpN2lnbThrNGNHSzVCc3N3?=
 =?utf-8?B?SlJDU0hwQndCZGFjRmt0bzlkN0s1elB5K1FFRVpaZmlKemFhbGdIYnA4MHBx?=
 =?utf-8?B?clYwaWVBT1VqTjN2RVMwYm5vY3FnTHlXMmdLdTVKWE9hSVlLdWxBa1BzNUhl?=
 =?utf-8?B?b01hMWNDam5Qc3AyZktWK3hTRnQzSzFCdVFjNzV3Q3kwUlBUTUJIM1hYMnlD?=
 =?utf-8?B?RkVKMFFDcCtxZlhzM1BjSWVpUEhrcEl3UjVYejFIbGc5bTFVVzM0aHBXczBO?=
 =?utf-8?B?TlhkV2hOdk5MVnNldWgxaVh3a3JnZDNkK0JLaGRzOENmZC9pMVJ2aHdRRDRp?=
 =?utf-8?B?MWRWU0dxcTVGYW4vYnZqSWRFUmd2R2F2Z1ZQRXdvRVN2dnF2UWZ1UzU3cDJv?=
 =?utf-8?B?dll3RlZhVHpTVTVwL1hSNGR4S3N4citRbDBCWWRTZTVlOU1pRk9wVnhCU0Ur?=
 =?utf-8?B?K0VNdk5YSmQ1MzVXRDZrVmp3ZjZnV1VhZGljTFVHeElOeCtWb3JDaFZMMjI3?=
 =?utf-8?B?ZGdmMjY4cFRodFRkNFdzQmRKMjBGY3VrWHhEUkdMQlZaSm9NKzg4ak96M2pJ?=
 =?utf-8?B?TU1rVjRYZWE3TkZObXFFTFp3cGZYQ2s4eW5SN0MweTRoR1hWZS9UaERDekJS?=
 =?utf-8?B?N3IvWElEMFFxUGxuc1NCZmJmUHpZV1VqZWVOOENDQ1Y2bkZ1SktVN3ZsUEhL?=
 =?utf-8?B?azdKdlFSbmNXd1Z6NStNNVVLZVZGQVBSWithTlBkUTVkRWMycE1YOGNpZC82?=
 =?utf-8?B?N0lnT1JDa0NsZjNmVzJwS3dUN1dnZnYwUENiS1QxNExTRzlCUlJkeEk1ZjVv?=
 =?utf-8?B?bTkwQnNML3UzOCtBcWwvVzRLVXh2MllXQlk4TFd3Y3E4M0lqUGJYOHZxR24z?=
 =?utf-8?B?eW9RWWJwZ1RRQUg0eVNUME1PN21sVmc1b0c1NjhXZmpHcGU0WUVIY3I3V1pH?=
 =?utf-8?B?VkNqOVd3eGR2MWRJSWViK0FLbmNCQjVPdUN5NFl5K0ZjSElqS1drTWJYOWUw?=
 =?utf-8?B?a2tyMHMyVkYzQ2dyWGlqK0xobDcvTkoxQ1ErMWFjUXZzc0pLM3RlTldxZHht?=
 =?utf-8?B?eENpeU5xMEZETE5PUzBxcnFwTTA0aFNaL3MxbHQ3QnhDdnYwK3RvVUNpNEhR?=
 =?utf-8?B?Q0J0TzFTcy8xWEx1SnJGbjhRdlJUKzkzQzZtcm4yUS9adlRpb2UvbWNlTjd3?=
 =?utf-8?B?YmFrNkdSMHVsN2dxQjFqWVRwNnFxUFRRVkQ4UTFDdk5RMGxZdGQ1V0R6bTVs?=
 =?utf-8?B?MndicCthMlBxY1gxN1JFT0FZQUx5Wm1mSzRHVXBqK0dSK2wxeFpQSFYzNTBu?=
 =?utf-8?B?b1hBcFVKazdRQ2JVZ0NrSGhkU0xKcUpFbkt3czAzL1ZadUIwYkpTN3RieTRK?=
 =?utf-8?B?QmpLWkNFREJRTi80bnpybE04eDQ5Wk96NW02WEh4dDFxcVFCU0NWWnVMQ0xP?=
 =?utf-8?B?aW90VnQyMmFPMHI5LzRYNXRHMVppdXdoWVcxVG1jUzBiY1E9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B4EF17988BEBB4EB82E999FBDECF6E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5684
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0f660349-850a-4f64-82cc-08dc96919612
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZHUzSXJzTFNCRXdwS2M0a3Q1OVlqSUExYURCRktaYXpTc01iczRFME9QUUhj?=
 =?utf-8?B?a1p2b2ZHMHhxcmd2UFdzaXFWN2hEWlVPUXNoSFZWVWJoWnc0MzI5dmhYanJx?=
 =?utf-8?B?bnFRbnArdThmVGpBOWh0SFV3T1IrY0NLZExTWUNjNURNYWFRS3JrVlJ0Rlpa?=
 =?utf-8?B?bnFoUUMzdFM5OEFjOVorZ3hLOEdmeTJxdzdWenpiYXZkZU02REVGbWc3UUFX?=
 =?utf-8?B?ZjJxSm5udkgvSnFlMmJTSVZxeVk1Q1BBRE5ab09FWjVqS2pxUTNnek5zL0pP?=
 =?utf-8?B?V2ZweGhZLzh4UjJYNnR0aUxFQVpLV1dIN0ZSc1R3YjUzcFU5VDh0Tlh6MmZ0?=
 =?utf-8?B?cVM0bXhmOTk1dEJ6eHlDOEgzQ3hyUXBZOWVtbk9nb3dTR3A2TUd5US9wai9E?=
 =?utf-8?B?Y2JRMFRlbXAydGdTTHJUYjJSS2JnVGFiQkdlSWFWWnJIVUtpOUZmL0FhZmFz?=
 =?utf-8?B?RS9VSDRXQ0ovWjV6UWtUUTVLZUtNb0E0WUEvUFViY09NdU02d2NvRE52YjVM?=
 =?utf-8?B?STVIbjJQRElJOFRPdThQaHlodHUva2lFMDVDTVVCT1UvUk81b0haZFZXREpM?=
 =?utf-8?B?RFV3aHJvMEtJRHZkaW5sVm9tMkxKVUhvY2pzcTlBcEJhTU5mcHQya3FCVmx0?=
 =?utf-8?B?WXpZY09OZUhRSkYyL2RXZmFVU2Y4TGFHUGY5MWxNS1FCRUxuUllBVjNxMWdP?=
 =?utf-8?B?YWZha0VDVnNZd21RMWtzWGY4anNtVzg4VlA0NTFWNmtEOEJ1a3gwQy9ONmFy?=
 =?utf-8?B?SnB2eHBjZlBGdFp1dy9VWmNCdjRWU2cvODczU1JrWDd2RmF1RnNTMXhmSGVr?=
 =?utf-8?B?aGdPcUFmVEVLajlLcVd4TjljWHdVUlNoNFYrVDNBOHNTUTREbm5aSnF1aFUy?=
 =?utf-8?B?b002ZXIyS2NMSkNBTHNMMmNIOGhYZTFtK1VjOGxwR1ZqNFdQcDZYMUlpak5G?=
 =?utf-8?B?SUt2TU41UTEySkc4cHcraFRwUnFid3ZQcnFBV0VtcEdjSTlwNWZnYnN4ZzN4?=
 =?utf-8?B?ODI2SDdGK1kvWGVudmNpdnpPUGFBbVREdHRQalIwUUZSOHBoNGdHVVNucnNG?=
 =?utf-8?B?MlFtRkx2RkIxdEtudkppd3FNUStuVFJROWQ2M0poTVFNc2RYRE1Oc3lOQXZJ?=
 =?utf-8?B?WGYyTk5uKzZiTVRabU1rdEpJYnZXSDhyT0JXY3h5VUpmNzk5aDJyTWVwWGFj?=
 =?utf-8?B?cFBydDVZY2FIcjFxajFobGtNekVHcjBkRkVURHQxVG85a0ZNTlZQa3ZXRjNt?=
 =?utf-8?B?QkpENjJaOE5Ib1I5aG0rbjlJWHdVNEY2NmhHczNKL2tvOEI5clE0V3JXakZq?=
 =?utf-8?B?eFhBcWg1aktNaEJiQzRnWi96b0ZmMGNma3F4ODNSRS94d3UxZ00zZ2h5OXgw?=
 =?utf-8?B?WDdObHRlR1N5TWtwVmJDbXg4S2crYzFzWVVHWkZ6bm5nNmhUdks5SGk0R2Iv?=
 =?utf-8?B?K2hUQktvaUE5b3ZJSkxWUndONy9EWUN5SkxjNVVqZnlENVQwRXV0dXVHYndo?=
 =?utf-8?B?bC9ScE1VTXhLTUVnQTlIaWlpRW9aTVVQWE5NUU9qSVg1Zlc1NHVZYlFFSGlM?=
 =?utf-8?B?SmI2SlFCTXlzc09hOS8ycDE3cFZENzUrbHl0Q0lrUDRNUXBFQW5XdWFSSDk3?=
 =?utf-8?B?eFRGRFFUQ1pjL2JYSXBCMFhMRGREUmhSZFJBOTU5eXV6bEhyQlQxdmFKTmhC?=
 =?utf-8?B?dllsODNpV0JpR1EwWjhUeVJJUmZVdzJaSmprelVGdWUvbzU3bVpDcGNTNGtW?=
 =?utf-8?B?L1YxVDN2MDJPTzJHTGdYZWdCek5udW8wRDhoMUJMQ1hNVlhmMHhIWjdSR0lO?=
 =?utf-8?B?eTk3eHlJdlArdTBKUjFKL1hJMHpMbyt0TWJNK0ZLNlNZVzN0azdSTkFPb2dL?=
 =?utf-8?B?NzJvUHE5NEk2N0N5VER4QWVUZ2lzL280MUV3cmtwcDRER3diM0g1bVRCSWhL?=
 =?utf-8?Q?6Z39bbjCWjM8wUw0NNqnGG+EAistkJKZ?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 10:12:10.3542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d68e3ad6-df8f-4b0b-adf6-08dc96919b8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7366
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 10:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111123

T24gMjYgSnVuIDIwMjQsIGF0IDE4OjIyLCBKw7ZyZyBTb21tZXIgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGpvZXJnLnNvbW1lcj1uYXZpbWF0aXguZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IFNob3VsZCBwb2t5LmNvbmYgaW5jbHVkZSBzb21ldGhpbmcgbGlrZToNCj4g
DQo+IEVYVFJBX0lNQUdFX0ZFQVRVUkVTICs9ICIke0BiYi51dGlscy5jb250YWlucygiRElTVFJP
X0ZFQVRVUkVTIiwgInB0ZXN0IiwgIiBwdGVzdC1wa2dzIiwgIiIsIGQpfSINCg0KVGhhdCB3b3Vs
ZCBtYWtlIGl0IGltcG9zc2libGUgdG8gYnVpbGQgd2l0aCBwdGVzdCBlbmFibGVkIGJ1dCBvbmx5
IGhhdmUgdGhlIHBhY2thZ2VzIGluIHNlbGVjdGVkIGltYWdlcywgd2hpY2ggd2FzIGFuIGV4cGxp
Y2l0IGRlc2lnbiBjaG9pY2UgaW4gaG93IHB0ZXN0IHdhcyBpbXBsZW1lbnRlZC4NCg0KPiBJTUFH
RV9JTlNUQUxMICs9ICIke0BiYi51dGlscy5jb250YWlucygiRElTVFJPX0ZFQVRVUkVTIiwgInB0
ZXN0IiwgIiBwdGVzdC1ydW5uZXIiLCAiIiwgZCl9DQoNClRoaXMgaXMgcmVkdW5kYW50LCBhcyBl
dmVyeSBwdGVzdCBwYWNrYWdlIHJkZXBlbmRzIG9uIHB0ZXN0LXJ1bm5lci4NCg0KUm9zcw==

