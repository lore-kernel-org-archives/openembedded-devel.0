Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3590C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 14:55:43 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.15198.1713365739105643188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 07:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=E7MoXeXs;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=E7MoXeXs;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IUScwp5Cp/rqDS9CVWLumV8cFCvxAJpPd87UP7Nwwne9IIL2OKCyOSKOeqNBtqUPHBD7xGYUiaB505XIoYaTsUCPAjhwGZBbvjnTvptaiDobyBBLyzSAaDqL3vjMM+LExLVCVxzNeKmdbHhSa2CuT6x+k1uniO/X9ACYj9rPNE4wsvFvQZyHSmAxTsb3VRaxpvOpewrIUUNG17esMfuQEnpvv+rbALewoQFWDHKUBMu+lGJjeqwsHjieXXh/dHY7TFSh62UVnLSh/X1UvczXX+I6wuUtie/lkZaba3nE39JwsCM4Hw9uMODE5dot4llDjen6htwXuehSdlkknfFPkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M23DR//2xPTu1hbbDmO+qFw4VHR2ocLAGPFgg2kOiIA=;
 b=jfa9BDTSAMVp5ziTsEMz6fswtmZujIPC4aEzRDojcYbGvqg1C3c67Gum2IHMfp4yCeXtVaxvfjI2i6rpvPlGT1vZqtpkwmCqUIJAfjloOhIWXUKxmPafoYT1ryUWmWN6hEVmFKZVdooHXgXWa2EsAJMxy9yIYm/eLXkxvAGrsBpWDPMEWYKG3FGLkV1bo5VJhZhBBQ+1jD8niaeQGVhBl2UV17gMGRkzSjsO/+Kam90XEvsMRsolTzn+jvWcCdVTN3E7LbHOtfsynEtLZBLfaCq1lW+eTTZgfUQLAIIxhFCL2wMqNuGPamPO5cYTIIiy7FXUWn0KhNBNrow9iklrWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M23DR//2xPTu1hbbDmO+qFw4VHR2ocLAGPFgg2kOiIA=;
 b=E7MoXeXsSSjXYP6z8PEMXbN19BdJ3atyJhtDes2kLoR/zrnNdpbKTxcxreY/A45RV/uHYYdglwoji/dAUwuRiCi2p9vehZiZ2ZW87jKdYzymKloJHj2D9mCFZ+hQ+I5DlXk5t7GsYbWHcvv1F6BMy1qJexk+O3YX5Qw+lY+b8gE=
Received: from AS8P189CA0046.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::18)
 by AM0PR08MB5444.eurprd08.prod.outlook.com (2603:10a6:208:185::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 14:55:36 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:458:cafe::e9) by AS8P189CA0046.outlook.office365.com
 (2603:10a6:20b:458::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Wed, 17 Apr 2024 14:55:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 17 Apr 2024 14:55:35 +0000
Received: ("Tessian outbound 88c46f8f09a7:v313"); Wed, 17 Apr 2024 14:55:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4c0602c75a693c61
X-CR-MTA-TID: 64aa7808
Received: from be3e2f511700.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2CF5A864-B677-4903-8E5E-E6AB39BDCAB9.1;
	Wed, 17 Apr 2024 14:54:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be3e2f511700.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Apr 2024 14:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UioVP837+NgVhxUY+zX5Yoh5rCSncFL/e+xllNy2G4WMngIKQ37+FoXZiJVpp9QcD0s4gnTkUAFIJsmfPT+zODcVie6qWB6nE5TIWFjREjHmYHFyCLnvK/TBoL3NRUw8tFgo0gLruVHZxFhs99/cLnyk07dPPNbQMp4ovz60ZWJVHZSq2HpTxX4UYsbe+jyBM5MogAkpJJFBwAlXLkG1ZbQ4iqJKMbA2sZMhWsQoo9EjNEpbeMiyqgMFmkEcEa4+kr9GRdi+Gi/WQbaQxSKKDvjiCbFSkqejRBK/5nZyFDvjJn+MNMyzEZrB+5fWX78seb/9ZHkIyCxyOR27T9z3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M23DR//2xPTu1hbbDmO+qFw4VHR2ocLAGPFgg2kOiIA=;
 b=cAPFq9cUbdwtW5T0+MGsMViARrWi/wxf4iSGvRYsXoYFGJ7+cXs3xGjBPj1KLwxUFhGGqp7EZaEbgmJut2R5n+Iwnwi3VWFuVSGxZOXH5f4VtVH4dOm1liO9indQYyIBfQGZ+iBet27HwnVXIEGcEdto+plKlqtk76CEMlmo1w4GcTf8waygr3+KhvPaCXPhyfUhuNqSV6WFkfbs4u2pL3vXNPK53C51UBHYQfaMRz3+F53erv4rWd733plC2GRLjYLfuh1kqUm2LA0UlP/lNRVB/TWGuUVh+Mc/knUa0yHNJ84JnIiq1zgrYqfBfg7BPC+T95OGEP0v+q4S+93xug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M23DR//2xPTu1hbbDmO+qFw4VHR2ocLAGPFgg2kOiIA=;
 b=E7MoXeXsSSjXYP6z8PEMXbN19BdJ3atyJhtDes2kLoR/zrnNdpbKTxcxreY/A45RV/uHYYdglwoji/dAUwuRiCi2p9vehZiZ2ZW87jKdYzymKloJHj2D9mCFZ+hQ+I5DlXk5t7GsYbWHcvv1F6BMy1qJexk+O3YX5Qw+lY+b8gE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6665.eurprd08.prod.outlook.com (2603:10a6:10:2ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 14:54:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 14:54:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "perceval.arenou@ptxtrimble.com" <perceval.arenou@ptxtrimble.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Perceval Arenou
	<perceval.arenou@gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] aravis: new recipe aravis is a
 vision library for genicam based cameras. aravis project allows to stream
 from genicam and GigE cameras
Thread-Topic: [oe] [meta-multimedia][PATCH] aravis: new recipe aravis is a
 vision library for genicam based cameras. aravis project allows to stream
 from genicam and GigE cameras
Thread-Index: AQHakNBF2VhVE/4BT0uBKZzizXBYyrFsjL0A
Date: Wed, 17 Apr 2024 14:54:55 +0000
Message-ID: <C6D61636-5453-4887-9698-02228A8CC9C4@arm.com>
References: <20240417140412.87875-1-perceval.arenou@ptxtrimble.com>
In-Reply-To: <20240417140412.87875-1-perceval.arenou@ptxtrimble.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6665:EE_|AMS1EPF00000049:EE_|AM0PR08MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da5e20d-62ac-41cf-22ff-08dc5eee7026
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZEt2RHdwRUxmVjRsdTFzQ0I2Wjhxek1nN3pCcXNSQmw5aXpEMFRLMUN3OGZG?=
 =?utf-8?B?YWdrUXRSTWllNHFWTzhMbEExcldxZzlmVS95b0VSQlZSblBwVFRaT3U2MkpU?=
 =?utf-8?B?RUZTQ05wVjc4d2hKTFhxTVg3ckV1M1MxTzI1SnRDNHJRNFlTNWtHak5WR0Rh?=
 =?utf-8?B?a1E5UTUzenh0b25DdGx2aDdKZWw4NlhHWnZ6ZHlGb093WmN4Si91Y0dFbkxR?=
 =?utf-8?B?YWZuMmo2Q0ZxRHh0ZThEcDdYdDFacUVxOTk1ZmtZdWNPc2QxNWVNcWxFOXhu?=
 =?utf-8?B?aVF1QnpGRzZvR1FydWFINHhJSHNKMGwyQ2VZWjFmNy8vMEFaaGhBR3hlS0Fo?=
 =?utf-8?B?Q1Yrc1JtNCtPaGZ1WkN2WktaK0llUVg5OWVIT0U1QlVlUzd5VWl4TWI5Z3Ny?=
 =?utf-8?B?UVdJelRQZ05wN2tkVzZhV1E2NlhBTU5EWHplVXdHSTFZU2JXYkdrenEyRXdI?=
 =?utf-8?B?bEo1UWtXQnNuRU9sZXV0Tk13RFNTcFNDQWVTR3hPTVpvMVdYLyswS2JaejhX?=
 =?utf-8?B?UFZ5c0pwKzY4VVJIVHhoMmx3amlIYm9CL0crd0d3TWZPa3dqVmFWNi9hd05M?=
 =?utf-8?B?VHVaRFNISnJMVjR4QW04VVRZQ1huNzNyZmlyTlZXYjRpMHczOGFHQkZ0Y2du?=
 =?utf-8?B?NU4rcWpJR0N2RlZJR3hXSVNqMnQydlNNZHFwdityUWdzRVlyWFNJZVBZdjZB?=
 =?utf-8?B?MTZxRklHWWI0YlRKUnV0ZGxFT0YxMTJldzlFZzM0V3c3enJvTk5FUlRjalc1?=
 =?utf-8?B?cXBOVVVoUkM2RVQxVlhPb3kxc3pPbkJlV2NNVjVETnRnSHhZYVQ2Wk1hWFNt?=
 =?utf-8?B?eHg5VlE3cXFEbTJXOEFXTlVXWGRJUWw5UHg0UzZNMldKQlRDa213QVVQZWIy?=
 =?utf-8?B?ZS9iSDBTN2dKWVlEKy9qQ2VHZjNicXJGSUowbmo5NDJZUWRQQWYzVG1JY3g5?=
 =?utf-8?B?Y21aekphT1Z2cW1HcHJmVkV1RndvQmpmUjl5SnpsZDlCWW1Rd21RMkRMMkpF?=
 =?utf-8?B?cnVodWd3Mjl5a0VDd0ZuZUt5TmthUXg1WGFrN3BrdnRrYWJ5R0p4eXR5aUMx?=
 =?utf-8?B?MWVTOHQ2OXAveUdHYVN5Z3dKMHZ3d0Jrc3krdFlud005Z3pnYTBzNHNMMmNq?=
 =?utf-8?B?bmVHWW1RZlhUOC9GVjhUd0diWDcxdElMaldORlAwbm9VTE1VbXMyY0RYTjl6?=
 =?utf-8?B?d0R6NFVpUll6SStRbTkycERJNk5DZEV3UkZmV1FZOEtKT2NSVVNGSEJWRkRU?=
 =?utf-8?B?WXFNSTh2WVFCZ09xVEJZUTVvWWx3M01Zc295b2tibmpOeTI2cnhEZDNiN0wy?=
 =?utf-8?B?STlxTm0vdDFpT0dpKy9RVFlrMEFzN3dVazdEcWVqVjZSKzBDTjBra2hxRjdJ?=
 =?utf-8?B?eGE5SjMrNXVxbllpMHkvWXJSMHd6VG5UeWovMEdoLy9ab1ovSitGTmdmTG4y?=
 =?utf-8?B?dDZyMXYxQTI1T1crajZLYWJxa0V6c2FON0ZhY1N4blhGRVl2S0Y5dHQzT0Q0?=
 =?utf-8?B?RzNCaHFmR2Vpa0I5RFZsVzJuTjVhcWQyMUwvRGNUYlVpbGJyT1hiUDZ4cHZn?=
 =?utf-8?B?WXVadnNqdTEzNXpEYTkwNnNESjNEdExOOW5BbjJtN1RLZ1NaUTYwUk1ROXNR?=
 =?utf-8?B?eTBvS2FTMWFkTElLdTkrdmgxRU1qYUFvQWNONXcvaG4vYjF5aFRXK2NEKzg5?=
 =?utf-8?B?eG8xMzY4L1pLSmg2dTVFUjl2Q0pMTWlUdUtreEFwVEN1cExqcVJWTUlSQWpp?=
 =?utf-8?B?V29CSHo5VVhRejkvNjFoSGw2NUJ2RHFEQlBxMHkwaXJGNVFFMGVpSllEMjlj?=
 =?utf-8?B?R1ZJbEFhVjFYMmpHczRaQT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F581705541C6B84787BD7415BD16F278@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6665
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6bbb7c8c-7ced-414c-5b58-08dc5eee5826
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WV2TGLzxJWqj8fHJR7JU+RFJmBGj2lleoxYiGs7d9HtC/p2T/IsGSH5Kly5Z1uTm2V09ayv6KDsYqXnT8ROkAmoP2qaZPyWGeqI2yPrRXh8ChJrn7BVONiPIL8eSeqTefH1G6PqghRJY5XIJ3Y8gxrwQwODgZ0cZwOH68KgUq/s33xG1388vMy78x2JjLW1MCVyeLCk73M2+CI6VWoonYc8Up0PJzdXkMPhGJFZrYlGXNSwdqXkzDIv5/o/zEMUe+vVO0dctSBnGAoYjdHPaHiRbJNWS/tBX6ZiZA6HH+VZrLCGaME61Kl5fnTOAK7pAoFo9becpLr3J6O0jW/BEftg7ZJAItxtL3mu9du1hX1BfFMP8GtVTw7JkD4GPTnbHxYUVMbLVxOjl7bLsRGhUuNQYMIWH37SyKxKJgK+xdKmQ7YC+dNrvNLwZ6wG1UtE1KRz4w4j+X34JnTBVgMfpPP6EKOYsZnKjA3uHE8yzcXdQ5oTUY3729HxkQy1wNfbRuygX7G5y/T4ugcjDbONfRgXImzgrnX2BPxTgVd8ooHtC7MpJwpJ0NGnv3S805Lje1WcISOn59BtTTB5ytl6ncgpG0neWd3wf8a4gEefvUoPvzCg7/0IizmSv/qP7kSoxCYlFfOdt7Mx7y1cnyaHsw39cAGUxRC8BEVasU1g0YQq+4obOuGUpEh9AIu3QG33c45A7gUwwZMF/anxCGvlL6xRASuh0naA3GOTRTjd59UDQfy6f3t7v9u9mF86OBr9B
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 14:55:35.6073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da5e20d-62ac-41cf-22ff-08dc5eee7026
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5444
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 14:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110044

T24gMTcgQXByIDIwMjQsIGF0IDE1OjA0LCBQZXJjZXZhbCB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cGVyY2V2YWwuYXJlbm91PXB0eHRyaW1ibGUuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiArREVQRU5EUyArPSAiXA0KPiArIGdsaWItMi4wIFwNCj4gKyBnbGliLTIu
MC1uYXRpdmUgXA0KPiArIGludGx0b29sLW5hdGl2ZSBcDQo+ICsgbGlieG1sMiBcDQo+ICsgemxp
YiBcDQo+ICsiDQoNCkNvbnNpZGVyaW5nIHRoaXMgdXNlcyBNZXNvbiwgSeKAmW0gc3VycHJpc2Vk
IHRoaXMgdXNlcyBpbnRsdG9vbC4gIElzIHRoaXMgc3RpbGwgdmFsaWQ/DQoNCj4gK1MgPSAiJHtX
T1JLRElSfS8ke0JQTn0tJHtQVn0iDQoNClRoaXMgaXMgdGhlIGRlZmF1bHQsIHJlbW92ZS4NCg0K
PiArUEFDS0FHRUNPTkZJRyA/PSAiIg0KPiArUEFDS0FHRUNPTkZJR1tnc3RyZWFtZXJdID0gIi1E
Z3N0LXBsdWdpbj1lbmFibGVkLCAtRGdzdC1wbHVnaW49ZGlzYWJsZWQsIGdzdHJlYW1lcjEuMCBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLCINCj4gK1BBQ0tBR0VDT05GSUdbaW50cm9zcGVjdGlv
bl0gPSAiLURpbnRyb3NwZWN0aW9uPWVuYWJsZWQsIC1EaW50cm9zcGVjdGlvbj1kaXNhYmxlZCwg
Z29iamVjdC1pbnRyb3NwZWN0aW9uLCINCj4gK1BBQ0tBR0VDT05GSUdbdXNiXSA9ICItRHVzYj1l
bmFibGVkLCAtRHVzYj1kaXNhYmxlZCwgbGlidXNiMSwiDQo+ICtQQUNLQUdFQ09ORklHW3ZpZXdl
cl0gPSAiLUR2aWV3ZXI9ZW5hYmxlZCwgLUR2aWV3ZXI9ZGlzYWJsZWQsIGd0ayszIGdzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2UsIg0KDQpJ4oCZZCBzdWdnZXN0IGVuYWJsaW5nIG1vcmUgdGhpbmdz
IGJ5IGRlZmF1bHQsIHNvIHRoZXkgZ2V0IHRlc3RlZC4NCg0KPiArIyBuZWVkcyB0byBiZSBhZnRl
ciBQQUNLQUdFQ09ORklHIHRvIG1ha2Ugc3VyZSBpdCBpcyBkZWZpbmVkDQo+ICtpbmhlcml0IG1l
c29uIHBrZ2NvbmZpZyAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdpbnRy
b3NwZWN0aW9uJywgJ2dvYmplY3QtaW50cm9zcGVjdGlvbicsICcnLCBkKX0NCg0KVXNlIGluaGVy
aXRfZGVmZXIgdG8gc29sdmUgdGhpcyBwcm9ibGVtLg0KDQpSb3Nz

