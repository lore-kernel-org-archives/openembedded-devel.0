Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04168CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 10:25:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22058.1759227926790736470
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 03:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Q/x4rUcE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2368835a42=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58U7vXIr2071854
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 03:25:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=qzOTrJ4Rvhc/lIWvkik+Sz
	11jpL0KqXMrU2jnG6pByA=; b=Q/x4rUcEiJ4DHbeO5lyWCIfLgvRc9Zp+xK9pfk
	FC7te6PpZ/eFssABs7ZuwEVaTbkn+xspD3HlsZdV9gpQyhKtbdwYpeezC/WuH2Pt
	wGwgJ4geLFRwsZIVB8CzqYBvnDDYWNGeYmlMv5BkIrm8BwGbgu5wAVoDnHC2J1KG
	aIp28L6qco0Z40xwAVeqX9qmH8mJeaeygCc1cFUamugISyvaN3avK+Hmsv8+C9Wn
	XI5aIQhGeSe0Q3R/q1/dH0+g6aICZnfgKzTBSYhkhRIlSY3GOu0lV6Dx2aa59Tp8
	IMIaweB3fZClnbYXLfW1N+CKTBfMUxfcTGV9kJ9m5qHkGS9Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49efegax70-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Sep 2025 03:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YA/zJQi/xLbfIYEVtyiJtVGleXMgHmovwojHGs9KviHfqH4t5hTgjUDhnl1JxAM0fKPAZuRo06amlAbbWfte0Nl99Lw1qBZtO37NFZfADWHDi8nPOVH756c0RfVdOxjLxrauTFnE30YxjKihXEwRNwZr+/1zjDZBZKu4uCFiCpTzedeFZa1+rFXqGlugFy9rpm78mIBfCgLDNjNuKr7SvcE3BBUryGYbfFkKUD2XSyQQQSWzNEWz9xRBBC8txljvjmEdjBjzx7gnyyCcg9wVtnvhncVSf0BEg2+Kus/8XcHW0+WvtryjS7ldhTsSZI8YYKgInmb/4OrxZHai97AJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzOTrJ4Rvhc/lIWvkik+Sz11jpL0KqXMrU2jnG6pByA=;
 b=TZ6yIe4J3PdIo6LAs/P4aOJHVyz8ij3WqAnobKhTewhmxacm0KmpPPT66MG1/QqeoF7ECJQY+XbebxBNsZr6Vn//KTu0b87l8NGBVi9pp0SS1M9L8d3lQWgCRkyIUmVHvNu9SlAWk2yJhrq0jcLGX3Kh5OpiVXFzM9qLzi6v92EsAFESgpfue8ZLSxW5qHVWAD2tR5R1CDi1FKZdHREgPmnsSjHxFXapm9eiO6C0vU0nDMP9Vkt/JBiB/1okk6F7B/hOJGLeYvYhXb32VNJRF80QUKzUCxOgh90IJjzY78hw3E8hoFmjuCO1Y7Sok00R9g0eDUWkMaZyQjUsJUiWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7173.namprd11.prod.outlook.com (2603:10b6:208:41b::13)
 by SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 10:25:23 +0000
Received: from IA1PR11MB7173.namprd11.prod.outlook.com
 ([fe80::cda8:4221:c482:799d]) by IA1PR11MB7173.namprd11.prod.outlook.com
 ([fe80::cda8:4221:c482:799d%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 10:25:22 +0000
Content-Type: multipart/alternative;
 boundary="------------c94afCHFowCObzBfRgUrMfoM"
Message-ID: <d6b18dfd-8f93-4256-a182-d5ce828ce321@windriver.com>
Date: Tue, 30 Sep 2025 15:50:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] Revert "mariadb: upgrade
 10.11.9 -> 10.11.12"
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20250926105137.3980107-1-yogita.urade@windriver.com>
 <7121a8c5-1148-45dd-80b3-38558b4070ed@gmail.com>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <7121a8c5-1148-45dd-80b3-38558b4070ed@gmail.com>
X-ClientProxiedBy: PN3PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::13) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7173:EE_|SJ5PPF2F7FC4EE6:EE_
X-MS-Office365-Filtering-Correlation-Id: 50de828e-669c-4f90-e902-08de000ba073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|52116014|38350700014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WGpjUGR5VVBWR0xETWo3VGVVSy9wbitsMTd5S3V5Z012UHpxSjNhUW5GMlFE?=
 =?utf-8?B?dHVZV3NFbHZVZXlZUUNXNXkwZExvNFpCRmVaTlROM0JqaW8xU3Y4dktGemln?=
 =?utf-8?B?TlRqbW9wWHlUTDV6ZEcvSXVHS2dRNG5yNGY3YUVBTnh5V2krUFp5eDFKWXZP?=
 =?utf-8?B?Zks0dkJRUHZnRjFsWldnZzhVYjB6bC9iWnl1NzRia2diUWtBcTZMMDNyRHI1?=
 =?utf-8?B?RWd1cUIzUDhBUzRMVzBaM1YzeDgwZWJCaENYTXR1Qyt5NmJqVTRBSHI4ZUdR?=
 =?utf-8?B?TVR1Y1R5MXRTd2ZVWkFERWdUWmZmcDROYW15aHpwTEErTEZ2aVQycnNhbGdx?=
 =?utf-8?B?Zkd5eWs1OGxjU2I1U0IrMzMwYkNENFBpdUlMWUsvaXBDYW9YdHoxUmQwaExw?=
 =?utf-8?B?V3FGTjN4Q1NucWZlckk1UVV6RHR6WWRSMWlsaWFTb2U1ZVhocWdlS2ZWN2Nu?=
 =?utf-8?B?ZnB6VXp6U1B5TkVGNC8yQmpvZnBSRDlZOGw1aHZWdXZ6RktFYTVhMTlCZXdC?=
 =?utf-8?B?dUVJQlhhQ0tTR3ZkNC84TmM5QjVtQ0V5MkVFU1hTNHdrVldqeUw1Mkw2YjBC?=
 =?utf-8?B?TDUvdTJkVktoa3FDNjBRcjdlN3R3cWtqK3A0ME00aWZ1NVlFSTZvZFdnQis1?=
 =?utf-8?B?MklRU25EREpKd0xDdFBMRW9nMTFYaEF2c1QrdTBoRXM1Y1BSY1RMbGVjZHQ3?=
 =?utf-8?B?WHpQUC8xNmtXTUdjeWpUcWJQSkk2SlQ2Mkg2T2hLRVdCZU1NVFNveWJOQjN4?=
 =?utf-8?B?d3RNa3cra1FtVGQvVmhzb2pmaVJQL2o0S3hrSjE3c2xwaW45c1dlVi9ZbHh4?=
 =?utf-8?B?WmZBUHh6SUxHNk1zMk9COGg2bWlrTDc5UmZyYVJvVys5TmdDYUF1K2NFWlYv?=
 =?utf-8?B?bDJMREFwTmhRTTVmS2MzRmRybVNzdDJSKytHbEhvTE0zR0I4dHFMd3lqTmhO?=
 =?utf-8?B?WFdiQVk4bjRsTTJBUXdzeVNNNlZSVmFnTmZUZjNpbmV2dnp3Uzc1eWRVRWhh?=
 =?utf-8?B?S0lWUzNDM3YxR1EwVnBtT1RJeG5oS2NIams0WmNJa2UxT2RTN3FoS0lkL2w2?=
 =?utf-8?B?VlRVZERiY0lNVW54OXE5MkFSMFBuYWpGdThmakJOR1JxZ3B0TGI3UkNiK1Jz?=
 =?utf-8?B?NnVDRTVIM1pKWDhJWitNTHVYdENlblJzcWVHSXU4dmZUN0k4aWtjaDVxU01l?=
 =?utf-8?B?d3RlMERRcnNXT1F2cW5MYy9ick5NMmI5dDNQTGJ6Mld4OHhzU1JwbVJKRmxY?=
 =?utf-8?B?Ti91UEFSSHlKd0dYZFRVRU1PSFlmSUpTdGlTdFBSRUhVNTRDZUpTbWNRU1pz?=
 =?utf-8?B?UkVVTTFleFpSQUp4d3YzWU40emtDbEg2aE96TnY2NWNTNE4rS1pNZUhOSHdv?=
 =?utf-8?B?ZEJCWkRaUVJIcEN5YXZDUTJaejJaZitsWWJCRWpHVG1oUzdDQ3NkRVRSTHpU?=
 =?utf-8?B?ZUliWjBDOXgvbzFad2ZHRmx3UCt5REY1WjdCRXVVL043bThJMzF0SWU0RlpF?=
 =?utf-8?B?L2VRU1FKK1ZmVldpTVd5ZUk3cExTcUZ1M01yT0lFRm9HWXdjaktUTzlwN2dw?=
 =?utf-8?B?SHFJbTNuZVlJMFpvaGFnZ3hLUEpxSXFobEcySVhGd2VsUU83eXBacUVwMXU3?=
 =?utf-8?B?WHBnZkpVYUVFbVFPZVpHbDlxN1d1cnlVcFF1SlYyREdWa2NTbGFocE9HT1Er?=
 =?utf-8?B?dXlvQy9FdTR6bFprWTZZOFRBTFhaY1d0N01aSXlhNDE5M2p2VENncjY1MG1K?=
 =?utf-8?B?eGxWeGFwV2dUTUpJSFZRZDlNRUpyd3UxdkR5ejRjcTIxd1FobjZNM2ZjeXVu?=
 =?utf-8?B?MkNCRU14d2J0N042OGp6eUJ6dng4SlduZ25nNTlTRFZDNHhtTDBmeTFkSW0r?=
 =?utf-8?B?UlNNalB2T0czLzZuYnZ5M205ZlBFVVJzM1R0dXFhb0RlQWV0b0NBYTZoOHZq?=
 =?utf-8?B?MFpJK0tYSm9xSFVGRVEvTDltNjM1WDkzT01EKy9NZWdac05PbkJYTXNla0F1?=
 =?utf-8?B?TXNPekJ5aVRnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7173.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UDJwSThMYTdRd0dRWEh3ZStCVThwZklmTUhDdkpUVkNpNGltTmZNUWZmOFZu?=
 =?utf-8?B?TXdyOExQcmd6SWpkNm9wTFVqS3BuSnFxYXBhVG1KMVl1eUZ1V0gwc212Qm5a?=
 =?utf-8?B?MWd0aEZQVmhzaE1NejRPQXBZZ3d4ZDFMeTFFNnRZVFV2ZG9FTkZwak01UXFz?=
 =?utf-8?B?R090cElFZkpoYitLakx3dHVobVJBTmtobThYMVNWdUlRNVp4WXErUEFtdStH?=
 =?utf-8?B?M2J3NjBsT3hEOTdraFQxVWRPMk1sVDhyZmQ2czJWMkFqMTg0QTVwMkZaTnNs?=
 =?utf-8?B?VWlnaE5ySkZwY2NIWkNEei9rZitpT0pwYld4Zkx3a0p0cDZRejdudXhON2Mw?=
 =?utf-8?B?OTEyaTRWbWdtRGZoYklYUURqcFlRWXZUWWU2OUhOV3B5MEdHZzBTSHNvS2JX?=
 =?utf-8?B?eit5T1RneGZ3eWYrcmsxZU94RGJNRG1OS0FSUGM5UjJQem9WMjJVaVluS2pj?=
 =?utf-8?B?WTFVRnFlNEpsbXpIT290cm1VenFrYkhJTElMT2VOcjhJcUE3Tk5DaU5seWZr?=
 =?utf-8?B?clBnS0kvdGNYOUZBaXhTWDh3Wm5SMDVTdUVHbU5FdjRFVWUwb2dyOXA3ZEk3?=
 =?utf-8?B?aU04S1VUU3BVVmh5dE12MGRBOUF1Z3lUZ01TYi9KN0FJU0lUaDc4aS9pYVFa?=
 =?utf-8?B?OWgxTWp0N0hnL1ozVm1JdU1lVEN4c2pqQmVIbWRrWnBOUTNJZUp0M3VlUVdk?=
 =?utf-8?B?c1FYUDN4ZDVCOXY2N0xWR0hzaEdtRTRHNmV1MGdaSFhOVFVaR0tDdkc5a2Z0?=
 =?utf-8?B?aVZPY3h3YzY3dzk3WVlvL2dzSS9McGdpTE5RSFVnMGUyZnZLQmppOXBJSE40?=
 =?utf-8?B?U0ZpNTV1cWxzUEU2b0cyL1Via2pDZ2ZZaHlHVDBycWhZQ1NnSitzbjVIajFQ?=
 =?utf-8?B?Q0dROFd6Z1lwcFhld01ML0NCaXFxU05scWtGSWpvWWdMTGd6WXlzYUpHWkts?=
 =?utf-8?B?cFcydUZHeHFueTZpUWZ3R2ZjQWVkVWwyZVZQL21CckttTXpMdjM0UEFLdU9M?=
 =?utf-8?B?anVPc3FDVTVZUzNDVk1uWDU2TE10U1lnVlN3QUxDSzRWYjk4WnVUMWtrV1Rw?=
 =?utf-8?B?RmVuRXl4UldqbHZGYUdBdHpEWVRjSWt5WlFDd2o2OW8xUUpkZTk5NitlSkVz?=
 =?utf-8?B?UlFFVjY1SEVMSE5DbXN5ZFFzT3B0UTh3aUZBdTVIRlN3L0RUS1loL1dVTFI4?=
 =?utf-8?B?UE1pbWVIcGI2MThiU0VaSXM2bFV6NXc1MUYybWJHMzNqZmlyL2RrQmlnOUk5?=
 =?utf-8?B?aDI5THlzbXo2SHN2Z3phMWZyUVN5WTk1Y0swbkt1OWprcG94NzZ1aWdhREdi?=
 =?utf-8?B?RVlQd3NrU0lvVENzMWNKNWxKTGtqSnFHS1BOeit4YmttQ0RFK2UvUWxiTUZy?=
 =?utf-8?B?ejBGNkVCbC9ENVRCSzVtQjJnU1NiRkt3UndlcFNpRG1xcWYwSzlNOVpCTm1B?=
 =?utf-8?B?U29TcFhCUjBQWkxmNTh3c0JnLzdNUW5ZWEpmSVd0eHlBTk1WSVVQOU00VSsr?=
 =?utf-8?B?RWdqN2VLMGZTN3N0OENlUE1EQzRWajc0OUNCMHJRSFk1eEg2VUtmUGp1bis3?=
 =?utf-8?B?MUlqcHdaVnA3ZXFTdVhQVTJJZG02U1NvL3o4bjZJY1lxUkVzYVV1VzhmSHY0?=
 =?utf-8?B?eXkyZjF5RzlJL3NRUTU3dGY2UUY0dXN5SHNiNFBhbnF3d3N2WWlncGVSVFJx?=
 =?utf-8?B?OFk0KzBNTWtJOGNHWE1jb1JVeUtFV25EbFM1c3FVVDNWOGptMFIzcU9TMy82?=
 =?utf-8?B?aXhlb2lmOXArYmV2MDgzbk1JOFdLS1ZmaGFEd2hhSWJwYVZBcEVuMnZVRXBt?=
 =?utf-8?B?NktLVG5EM1k2MTZBaFhKQkczcExicWdXNzhFcEE0Ly8zRGI4ZmRFSUk5MHla?=
 =?utf-8?B?NE9oNHlISEpnRUYyYzhSSHhWUUxBWVZwblNqa3poRExJQWZ5SWU1TjMyZktO?=
 =?utf-8?B?L0RNYXVOV0FyME1GcllGOEtXY1FUeXVGaVRzQnUrSktrNzlmaXNrc2VHM2VL?=
 =?utf-8?B?YndrRlV4Qm8zZUJyNGdNQTR6ZWN2c25mS3JoMmtnV2hIbXNRdFpndzZWTkdE?=
 =?utf-8?B?ZFg3a0RrT3A3ZE15c1pCWkozL1l4UU9SNDJmQUdTc0ZDdjdzODdLVmwzc1l6?=
 =?utf-8?B?K0xUVllncUtIRWFRTFhJbHVQQy9qVHhsbjJGMGI3OS9JRzFkT1I5bVd1amNW?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50de828e-669c-4f90-e902-08de000ba073
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 10:25:22.3528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUngj1qRbUtw7XZhfvB1HFsgruzjoF2fqVm0c7ytMe7IJgGgkEhdUwaAJ2OAdJPT6ksy2ol9b+rzPw/36/WNav3t9+jBWSfd5UcaO/OTWCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F7FC4EE6
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: KB5flbPKYT1ovq0Ch8A_pi2Sxk0WIwpP
X-Authority-Analysis: v=2.4 cv=aKr9aL9m c=1 sm=1 tr=0 ts=68dbb016 cx=c_pps
 a=n4Rd88MCvJemCXT3WVAnXw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8
 a=kmYkUENqAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=YvNiMV7mDO7qTPD92zMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VBk6kOu6_BfMlV61kw0A:9 a=2_7t2VRjZsLk2Uss:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=NA03pvyaApPJG5valX87:22 a=p9kz6gysRiz6SGr9lVkz:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7xSN7XE6wa6yXXEoycCXvky3KpQrTldY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDA5MiBTYWx0ZWRfXyRMaAy/pAb7i
 HeeWXGlAyiSmFyG4BMQvOyEU0MNcs7iAfsIaJxT0mYUEwmdCgaoHq+9guF/4r3yFmhU9zcCRceX
 EVL1iYY5BbwXuFDa+DSDKhRL0pAsrIlKRantOr+UReqgjs9hxte4E7WPxtIfrBmPyKWenJIGp0y
 XYVPbnZChQagwAVjDP+ipBV+627g1N2C5R0zzXISNtTwsbewy27rrK9YqlWOVWZiFZJmfZRBt3o
 YJwsYnpeWhDLTQVEcynH7wnUFShCVNtNDxnTcfFvKWA96fGtyoTFbU8br7gQJqyqdRzhyl6Uxya
 UE86vB78ag4aMc0eS6WYkqhozm0vJMiil+FJDGTndCNIuNIogaIsj/Vcsruj14cIM1RW4I49sH0
 Whmu5k5VUXsr+GlvajHTm6xM+7MdZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509300092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 10:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120079

--------------c94afCHFowCObzBfRgUrMfoM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58U7vXIr2071854


On 30-09-2025 15:35, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 9/26/25 12:51, Urade, Yogita via lists.openembedded.org wrote:
>> From: Yogita Urade<yogita.urade@windriver.com>
>>
>> This reverts commit 7b57b8f1069f29981623ee30c6dd24b7781ed958.
>>
>> This upgradation causes timeout issue to start the mysqld services.
> Could you please give some info, how to reproduce this issue? Does it
> need anything special?
> I think it would be better to bisect the issue and try to find the
> solution (if possible) rather than going backwards.
To reproduce this issue, added following parameters in local.conf:
DISTRO_FEATURES:append =3D " systemd usrmerge"
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
VIRTUAL-RUNTIME_init_manager =3D "systemd"
VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"

After booting to image ran the following command:
root@qemux86-64:~# systemctl start mysqld
 =C2=A0Job for mysqld.service failed because a timeout was exceeded.
 =C2=A0See "systemctl status mysqld.service" and "journalctl -xeu=20
mysqld.service" for details.

Kindly let me know if you have any suggestions to fix this.
../Yogita
>> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> ---
>>   ..._10.11.12.bb =3D> mariadb-native_10.11.9.bb} |  0
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
>>   ...-missing-includes-cstdint-and-cstdio.patch | 43 ++++++++++++-----=
--
>>   .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ++++++
>>   .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 43 +++++++++++++++++=
++
>>   ...mariadb_10.11.12.bb =3D> mariadb_10.11.9.bb} |  0
>>   6 files changed, 87 insertions(+), 16 deletions(-)
>>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb =3D> ma=
riadb-native_10.11.9.bb} (100%)
>>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glib=
c-dep.patch
>>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb =3D> mariadb_1=
0.11.9.bb} (100%)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb b/me=
ta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-d=
bs/mysql/mariadb.inc
>> index 6e7c01a775..abcf0b3cda 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -17,13 +17,15 @@ SRC_URI =3D"https://archive.mariadb.org/${BP}/sour=
ce/${BP}.tar.gz \=20
>> file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \=20
>> file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \=20
>> file://ssize_t.patch \ + file://mm_malloc.patch \=20
>> file://sys_futex.patch \ file://cross-compiling.patch \=20
>> file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \=20
>> file://lfs64.patch \=20
>> file://0001-Add-missing-includes-cstdint-and-cstdio.patch \ "
>> -SRC_URI[sha256sum] =3D "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26=
a2d3a6308b8d194e167"
>> +SRC_URI:append:libc-musl =3D" file://ppc-remove-glibc-dep.patch"
>> +SRC_URI[sha256sum] =3D "0a00180864cd016187c986faab8010de23a117b9a75f9=
1d6456421f894e48d20"
>>
>>   UPSTREAM_CHECK_URI =3D"https://github.com/MariaDB/server/releases"
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includ=
es-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-=
missing-includes-cstdint-and-cstdio.patch
>> index fa580d039a..7fc2377f19 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstd=
int-and-cstdio.patch
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstd=
int-and-cstdio.patch
>> @@ -11,14 +11,27 @@ Upstream-Status: Pending
>>   Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>   Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>>   ---
>> - storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 =
+
>> - .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 =
+
>> - storage/rocksdb/rocksdb/util/slice.cc                           | 2 =
+-
>> - storage/rocksdb/rocksdb/util/string_util.h                      | 1 =
+
>> - 4 files changed, 4 insertions(+), 1 deletion(-)
>> + .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1=
 +
>> + storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1=
 +
>> + .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1=
 +
>> + storage/rocksdb/rocksdb/util/slice.cc                            | 1=
 +
>> + storage/rocksdb/rocksdb/util/string_util.h                       | 1=
 +
>> + 5 files changed, 5 insertions(+)
>>
>> +diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iterati=
on_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_s=
tats.h
>> +index 963c1d8e..73487edd 100644
>> +--- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stat=
s.h
>> ++++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stat=
s.h
>> +@@ -5,6 +5,7 @@
>> +
>> + #pragma once
>> +
>> ++#include <cstdint>
>> + #include "rocksdb/rocksdb_namespace.h"
>> +
>> + struct CompactionIterationStats {
>>   diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/check=
point.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>> -index 7fb9d489..f7b4e6f0 100644
>> +index c7f93b4c..3c2ab805 100644
>>   --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>>   +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>>   @@ -8,6 +8,7 @@
>> @@ -42,20 +55,20 @@ index f356395f..32152217 100644
>>    #include <vector>
>>
>>   diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb=
/rocksdb/util/slice.cc
>> -index 3c3656de..b18d7f5d 100644
>> +index 6db11cc9..c26b6a21 100644
>>   --- a/storage/rocksdb/rocksdb/util/slice.cc
>>   +++ b/storage/rocksdb/rocksdb/util/slice.cc
>> -@@ -12,7 +12,7 @@
>> - #include <stdio.h>
>> +@@ -8,6 +8,7 @@
>> + // found in the LICENSE file. See the AUTHORS file for names of cont=
ributors.
>>
>>    #include <algorithm>
>> --
>>   +#include <cstdint>
>> - #include "rocksdb/convenience.h"
>>    #include "rocksdb/slice_transform.h"
>> - #include "rocksdb/utilities/object_registry.h"
>> -diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/roc=
ksdb/rocksdb/util/string_util.h
>> -index 7794dbb0..b480177e 100644
>> + #include "rocksdb/slice.h"
>> + #include "util/string_util.h"
>> +
>> +diff --git a/util/string_util.h b/util/string_util.h
>> +index 55d106fff02..11178fd1d7b 100644
>>   --- a/storage/rocksdb/rocksdb/util/string_util.h
>>   +++ b/storage/rocksdb/rocksdb/util/string_util.h
>>   @@ -6,6 +6,7 @@
>> @@ -67,5 +80,5 @@ index 7794dbb0..b480177e 100644
>>    #include <string>
>>    #include <unordered_map>
>>   --
>> -2.40.0
>> +2.25.1
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-=
oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>> new file mode 100644
>> index 0000000000..56ed480d33
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>> @@ -0,0 +1,13 @@
>> +Upstream-Status: Pending
>> +
>> +--- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
>> ++++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
>> +@@ -5,7 +5,7 @@
>> +
>> + #pragma once
>> +
>> +-#if defined(__clang__)
>> ++#if defined(__clang__) && defined(__GLIBC__)
>> + // glibc's `posix_memalign()` declaration specifies `throw()` while =
clang's
>> + // declaration does not. There is a hack in clang to make its re-dec=
laration
>> + // compatible with glibc's if they are declared consecutively. That =
hack breaks
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.pa=
tch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>> new file mode 100644
>> index 0000000000..3787b74ad1
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>> @@ -0,0 +1,43 @@
>> +Upstream-Status: Pending
>> +
>> +Remove glibc specific function dependencies
>> +
>> +Sourced from:https://git.alpinelinux.org/aports/tree/main/mariadb/ppc=
-remove-glibc-dep.patch
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +
>> +diff --git a/include/my_cpu.h b/include/my_cpu.h
>> +index f2e26fca..94599b74 100644
>> +--- a/include/my_cpu.h
>> ++++ b/include/my_cpu.h
>> +@@ -24,17 +24,16 @@
>> + */
>> +
>> + #ifdef _ARCH_PWR8
>> +-#include <sys/platform/ppc.h>
>> + /* Very low priority */
>> +-#define HMT_very_low() __ppc_set_ppr_very_low()
>> ++#define HMT_very_low() asm volatile("or 31,31,31")
>> + /* Low priority */
>> +-#define HMT_low() __ppc_set_ppr_low()
>> ++#define HMT_low() asm volatile ("or 1,1,1")
>> + /* Medium low priority */
>> +-#define HMT_medium_low() __ppc_set_ppr_med_low()
>> ++#define HMT_medium_low() asm volatile ("or 6,6,6")
>> + /* Medium priority */
>> +-#define HMT_medium() __ppc_set_ppr_med()
>> ++#define HMT_medium() asm volatile ("or 2,2,2")
>> + /* Medium high priority */
>> +-#define HMT_medium_high() __ppc_set_ppr_med_high()
>> ++#define HMT_medium_high() asm volatile("or 5,5,5")
>> + /* High priority */
>> + #define HMT_high() asm volatile("or 3,3,3")
>> + #else
>> +@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
>> +   __asm__ __volatile__ ("pause");
>> + #endif
>> + #elif defined(_ARCH_PWR8)
>> +-  __ppc_get_timebase();
>> ++  __builtin_ppc_get_timebase();
>> + #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
>> +   /* Mainly, prevent the compiler from optimizing away delay loops *=
/
>> +   __asm__ __volatile__ ("":::"memory");
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb b/meta-oe/r=
ecipes-dbs/mysql/mariadb_10.11.9.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119905):https://lists.openembedded.org/g/openembed=
ded-devel/message/119905
>> Mute This Topic:https://lists.openembedded.org/mt/115446396/6084445
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------c94afCHFowCObzBfRgUrMfoM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-09-2025 15:35, Gyorgy Sarvari
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:7121a8c5-1148-45dd-80b3-38558b4070ed@gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 9/26/25 12:51, Urade, Yogita via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>

This reverts commit 7b57b8f1069f29981623ee30c6dd24b7781ed958.

This upgradation causes timeout issue to start the mysqld services.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Could you please give some info, how to reproduce this issue? Does it
need anything special?
I think it would be better to bisect the issue and try to find the
solution (if possible) rather than going backwards.
</pre>
    </blockquote>
    To reproduce this issue, added following parameters in local.conf:<br>
    DISTRO_FEATURES:append = &quot; systemd usrmerge&quot;<br>
    DISTRO_FEATURES_BACKFILL_CONSIDERED += &quot;sysvinit&quot;<br>
    VIRTUAL-RUNTIME_init_manager = &quot;systemd&quot;<br>
    VIRTUAL-RUNTIME_initscripts = &quot;systemd-compat-units&quot;<br>
    <br>
    After booting to image ran the following command:<br>
    root@qemux86-64:~# systemctl start mysqld
    <br>
    &nbsp;Job for mysqld.service failed because a timeout was exceeded.
    <br>
    &nbsp;See &quot;systemctl status mysqld.service&quot; and &quot;journalctl -xeu
    mysqld.service&quot; for details.&nbsp;<br>
    <br>
    Kindly let me know if you have any suggestions to fix this.<br>
    ../Yogita
    <blockquote type="cite" cite="mid:7121a8c5-1148-45dd-80b3-38558b4070ed@gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
---
 ..._10.11.12.bb =&gt; mariadb-native_10.11.9.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
 ...-missing-includes-cstdint-and-cstdio.patch | 43 ++++++++++++-------
 .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ++++++
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 43 +++++++++++++++++++
 ...mariadb_10.11.12.bb =&gt; mariadb_10.11.9.bb} |  0
 6 files changed, 87 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb =&gt; mariadb-native_10.11.9.bb} (100%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb =&gt; mariadb_10.11.9.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 6e7c01a775..abcf0b3cda 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -17,13 +17,15 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://archive.mariadb.org/${BP}/source/${BP}.tar.gz\file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch\file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch\file://ssize_t.patch\+file://mm_malloc.patch\file://sys_futex.patch\file://cross-compiling.patch\file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch\file://lfs64.patch\file://0001-Add-missing-includes-cstdint-and-cstdio.patch\">&quot;https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://ssize_t.patch \
+           file://mm_malloc.patch \
            file://sys_futex.patch \
            file://cross-compiling.patch \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           &quot;</a>
-SRC_URI[sha256sum] = &quot;d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167&quot;
+SRC_URI:append:libc-musl = <a class="moz-txt-link-rfc2396E" href="file://ppc-remove-glibc-dep.patch">&quot; file://ppc-remove-glibc-dep.patch&quot;</a>
+SRC_URI[sha256sum] = &quot;0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20&quot;

 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/MariaDB/server/releases">&quot;https://github.com/MariaDB/server/releases&quot;</a>

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
index fa580d039a..7fc2377f19 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -11,14 +11,27 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
 ---
- storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 +
- .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 +
- storage/rocksdb/rocksdb/util/slice.cc                           | 2 +-
- storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
- 4 files changed, 4 insertions(+), 1 deletion(-)
+ .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
+ storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
+ .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
+ storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
+ storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
+ 5 files changed, 5 insertions(+)

+diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
+index 963c1d8e..73487edd 100644
+--- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
++++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
+@@ -5,6 +5,7 @@
+
+ #pragma once
+
++#include &lt;cstdint&gt;
+ #include &quot;rocksdb/rocksdb_namespace.h&quot;
+
+ struct CompactionIterationStats {
 diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
-index 7fb9d489..f7b4e6f0 100644
+index c7f93b4c..3c2ab805 100644
 --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 @@ -8,6 +8,7 @@
@@ -42,20 +55,20 @@ index f356395f..32152217 100644
  #include &lt;vector&gt;

 diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
-index 3c3656de..b18d7f5d 100644
+index 6db11cc9..c26b6a21 100644
 --- a/storage/rocksdb/rocksdb/util/slice.cc
 +++ b/storage/rocksdb/rocksdb/util/slice.cc
-@@ -12,7 +12,7 @@
- #include &lt;stdio.h&gt;
+@@ -8,6 +8,7 @@
+ // found in the LICENSE file. See the AUTHORS file for names of contributors.

  #include &lt;algorithm&gt;
--
 +#include &lt;cstdint&gt;
- #include &quot;rocksdb/convenience.h&quot;
  #include &quot;rocksdb/slice_transform.h&quot;
- #include &quot;rocksdb/utilities/object_registry.h&quot;
-diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
-index 7794dbb0..b480177e 100644
+ #include &quot;rocksdb/slice.h&quot;
+ #include &quot;util/string_util.h&quot;
+
+diff --git a/util/string_util.h b/util/string_util.h
+index 55d106fff02..11178fd1d7b 100644
 --- a/storage/rocksdb/rocksdb/util/string_util.h
 +++ b/storage/rocksdb/rocksdb/util/string_util.h
 @@ -6,6 +6,7 @@
@@ -67,5 +80,5 @@ index 7794dbb0..b480177e 100644
  #include &lt;string&gt;
  #include &lt;unordered_map&gt;
 --
-2.40.0
+2.25.1

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
new file mode 100644
index 0000000000..56ed480d33
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
@@ -0,0 +1,13 @@
+Upstream-Status: Pending
+
+--- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
++++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
+@@ -5,7 +5,7 @@
+
+ #pragma once
+
+-#if defined(__clang__)
++#if defined(__clang__) &amp;&amp; defined(__GLIBC__)
+ // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
+ // declaration does not. There is a hack in clang to make its re-declaration
+ // compatible with glibc's if they are declared consecutively. That hack breaks
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
new file mode 100644
index 0000000000..3787b74ad1
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Pending
+
+Remove glibc specific function dependencies
+
+Sourced from: <a class="moz-txt-link-freetext" href="https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch">https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch</a>
+Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+
+diff --git a/include/my_cpu.h b/include/my_cpu.h
+index f2e26fca..94599b74 100644
+--- a/include/my_cpu.h
++++ b/include/my_cpu.h
+@@ -24,17 +24,16 @@
+ */
+
+ #ifdef _ARCH_PWR8
+-#include &lt;sys/platform/ppc.h&gt;
+ /* Very low priority */
+-#define HMT_very_low() __ppc_set_ppr_very_low()
++#define HMT_very_low() asm volatile(&quot;or 31,31,31&quot;)
+ /* Low priority */
+-#define HMT_low() __ppc_set_ppr_low()
++#define HMT_low() asm volatile (&quot;or 1,1,1&quot;)
+ /* Medium low priority */
+-#define HMT_medium_low() __ppc_set_ppr_med_low()
++#define HMT_medium_low() asm volatile (&quot;or 6,6,6&quot;)
+ /* Medium priority */
+-#define HMT_medium() __ppc_set_ppr_med()
++#define HMT_medium() asm volatile (&quot;or 2,2,2&quot;)
+ /* Medium high priority */
+-#define HMT_medium_high() __ppc_set_ppr_med_high()
++#define HMT_medium_high() asm volatile(&quot;or 5,5,5&quot;)
+ /* High priority */
+ #define HMT_high() asm volatile(&quot;or 3,3,3&quot;)
+ #else
+@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
+   __asm__ __volatile__ (&quot;pause&quot;);
+ #endif
+ #elif defined(_ARCH_PWR8)
+-  __ppc_get_timebase();
++  __builtin_ppc_get_timebase();
+ #elif defined __GNUC__ &amp;&amp; (defined __arm__ || defined __aarch64__)
+   /* Mainly, prevent the compiler from optimizing away delay loops */
+   __asm__ __volatile__ (&quot;&quot;:::&quot;memory&quot;);
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#119905): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/119905">https://lists.openembedded.org/g/openembedded-devel/message/119905</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115446396/6084445">https://lists.openembedded.org/mt/115446396/6084445</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------c94afCHFowCObzBfRgUrMfoM--

