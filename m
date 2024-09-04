Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32955CD37B5
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 00:15:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38934.1725408912478577248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 17:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9977d9f82b=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48401Uk0017117
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Sep 2024 17:15:12 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41e4yy8gmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 17:15:11 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4840FBG2005212;
	Tue, 3 Sep 2024 17:15:11 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41e4yy8gmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 17:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Egugc9u/WRTqi0JgZnld5dtTREC/J8urG1ZgaCBXBvuwYdNM+k3h0EsuU4MgxuROZQQB4e/vlBJxUIpV9KAV3cooR3NGp0w4340z4/sCulo3Z8JjUaGyvTj9p1+Ygxy2C5rfOLhEesoZHD4k8BTOYPdNdUgo3U5IovMfMnzmgPiUL0n9wvsh0C+CuOgf6w6F0F/fg2E+ymBdF2K3pHYyej2oca/iXjfJV7pFPHcoDqdKSp3DtSwkc+PQXixH/8JH3vNmjEPU5r+sCrfCb3jPpd1ZO68An23hmr8gl8pBMkS1FTjyDvAXrpq5uUO84hMRXcrT7SAXm2y0OtuB6ut7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBnUuBaNJUdX31LAmaOylLo/lrhF26deJZTC0Ai1R+M=;
 b=ZnCxSLhJLvBvRt0Qb8UWXYIMgmbNV6c3IpUVBfSvsJKeJFa7pPHKUzIeFtOaKnbeoIDB/QCSEVVEK+yCLWW/Xv8sr0nisk0QjI1wJFtjoxg84IB24WVOyVAAb6rXLx9v1+zI/E8U6eT8Tpc3FwGFmeb+8LVublosd4d+JB8wu8eq5pxsA5YmAB1tinl45yEGElR/Qk4lmacB8UKB3jLrHqVjdYr4UQaWEEkcAr4VgnK/9XlPw9ryVR4P5iDCs0a/RvGPl7hFa9nfjUX75eJ3zBgJbqTZ2EHZE5UhX85y8gh5yNaObrgubv+iYwAIrlhqWadjj7MYjwQfivizECHnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA0PR11MB8377.namprd11.prod.outlook.com (2603:10b6:208:487::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 00:15:06 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 00:15:06 +0000
Content-Type: multipart/alternative;
 boundary="------------f3igUcGDl2dDHxmBdyoQyeQu"
Message-ID: <556188c9-c36e-4654-98c5-600acc1933a4@windriver.com>
Date: Wed, 4 Sep 2024 08:15:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][PATCH] mariadb: fix runtime failure on riscv
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240903045247.275642-1-changqing.li@windriver.com>
 <CAMKF1sreQCYaJfH7iWN3-QF1i_c2gHgmB5ORiUw3d4BoofZEHA@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1sreQCYaJfH7iWN3-QF1i_c2gHgmB5ORiUw3d4BoofZEHA@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA0PR11MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: 903d3d9f-9357-4f08-b2b9-08dccc76a142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1pMR0E0M0QzNmRFUGVySWhodUdKeFAyMUVNd09JT3ZwbUN0U003S1E0Ylpa?=
 =?utf-8?B?M08zSU9Rd1RoRjRLNGF5cU5udDhnMElWZ0RFTUVRQzdlVG1BTWxUY3RDY1R4?=
 =?utf-8?B?OUk4dXgzOVRNbE5aTko0bmF1UVY0WlJodWRYWjJtcjFvRWtJNmJzZ0lRSE55?=
 =?utf-8?B?L09uckFQemdXOStsKzQ4cTE5Y3B4ZXFQYjlsdzVoSEV3M2FPOUVQTWVxZ2dL?=
 =?utf-8?B?MkhuK1pHZmpENC9hMEl6YzMzemJpMmxuemhmZGVnTnY1K1Z6SGxCUXZMTDVC?=
 =?utf-8?B?SXlXajl6dVZrY3I4SWg5M3VYUXRWTmRiRm53Kzdzc2JIeHhDZC85WGhiTFVE?=
 =?utf-8?B?aEJ5aHo0MkhYYXNLelFVTE1BUzd6RHVuRW4vcjBRT0lsS2dHc1JZcjM3Q00z?=
 =?utf-8?B?UG90ek05NmhLMXhZNkEvSFlKaDd2V2RQMUlIOFVFQ295bGpYWVMvZjNnVWpL?=
 =?utf-8?B?dVk0MDlwVDJKdlUzTkExUDJJZlYwcVVKWkhsME4zV05MOEJ3WmdIc1NtQ3Rj?=
 =?utf-8?B?MjFTWGN4dmMvK29UOXluUGxyRjNmd3cyYlA2a3FHOWhMQkExdzRYcU1HSDZ2?=
 =?utf-8?B?N0lyM1BtRThWTTRKZDVldGRTcklIWXJCZWtyVW5HQlYyODZsSjcvcG56N0s5?=
 =?utf-8?B?WTNpQWxqUG9mZ2lEZ0JkTW8xeC9NQmlQMC80b1k2MDM3eHE0MSt3L2syQ2tu?=
 =?utf-8?B?MkhiWUg2Y1EwWDRNTEx4QjJDSm5MS3JHRk5sOVZhNEhRRGIwTlJmUVIwWkRj?=
 =?utf-8?B?UDJjdTNoTkhEdnZZWmNQY3Vjd0tDL1VSTjZvN1RmUWx3eXRRSDJ0bzBHTzJL?=
 =?utf-8?B?TXZGYlpXVTZqejhtZkx4bDhGcEVVSFozWXRhT3JvZ1hpYVk1U2ZFN3paMlIw?=
 =?utf-8?B?cnY5VmxIcHFZV2F6eW0xSThjdGMyTkkrQmc5dlpGV0hCdFk1Z214VFZTYjgw?=
 =?utf-8?B?dUhVR0dOZDQzRjdUZUtobUFGTVlSZXkwckorUENVdFJ0ejJvUGVpSlpYMkxM?=
 =?utf-8?B?Z0hrZG5GYmY0b1B0YnpIVnJHV2NnSTI3Ry9hOHlZbEx5SGh2ZXV4emV0OUJU?=
 =?utf-8?B?TjUvL1BZNCtGL08xR05JdW01eXZrREJOTlNTeVFhRnVBSitpMGlxU3Ayb2tL?=
 =?utf-8?B?K0sxLzQrVFFHNllKalZUcVpQNlJJTGF3MTlwelh1S0lHVjFweFdHZEl4NzlG?=
 =?utf-8?B?SW9CRGxTWUdraEcrZnprMmJ4VWlBTVFZejE2cVAwdUFYOUdXQ1Fxd09CcVAz?=
 =?utf-8?B?ZTJMVWRLMVh0NWthajQ3eUljTjhnbHBkSnNKKzg0U01PNVNoL3hVOHlJWk9Q?=
 =?utf-8?B?eTREL1N1NWhKZGlLbHUxcmFhRnBLSUhkNUtZQXpmUWE5QzZqb0VpNDJhNzZU?=
 =?utf-8?B?eW81K2Z4WGh2aDBuQ0RZN3pIOXVnSk9DcWFxTnFjSmlTUnhRUUF5VnM5aklk?=
 =?utf-8?B?KzluUUp3NDIzcXhEd2loRGtCckpsUndES1lFSmhqK1p2SEJrL0RhUCt4VTIv?=
 =?utf-8?B?c29vSjZKeklDbUhCWjhieXhqODc0UFp6U1N1akMrbkdkOTIxQU00Y2NIaWFU?=
 =?utf-8?B?VTNUaU9hbXFmNEJ3YUFnN21Ta21wRXR0ZkFNQ2FWb296WG9hanJjNkRtRzdz?=
 =?utf-8?B?T2MyejJiNW1VaVRXS2MvMFBLd0wvNU9Xdk9mcTMwYW1OUTJ2NTNlY2drNkdE?=
 =?utf-8?B?bXkvdFhSYzV3RFVWd1lhL0ZNRVNab2J6bEg2VWROcy9HRWF2emVKYlZqWC9u?=
 =?utf-8?Q?lWYnjD9p5aGQzuSsQI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUhEMndLWTVHNXpIbXFqUGV6K0tzTUdpN2I1eG5GVVAxR0pQQXY0YWJQc2V6?=
 =?utf-8?B?UnE2SG1oY1d1TU1tVE5TemNaYk1lUUlqbW9vdXBRZTNBaXVKaXZKMGlacFhZ?=
 =?utf-8?B?dHRkOHJqQ2tQMVFoNkYxUldKbGdrbUxWV0RjTmthOUZoRitPME5UcElpTzJp?=
 =?utf-8?B?QlFERmhQdExad0hRMkhaZ0hjVmZNUTdWZmhXZ0w2bmV4eEowWGlBQ25SRkxx?=
 =?utf-8?B?ckEvcy9ZVk5uOU4yeEE0UXBhbWxmMkNwVytSV0ZVR05mYVh3cnB1T2dwd0wz?=
 =?utf-8?B?Zkc2QnVnbEFDWnI5NUo3YS9teXR1WFdSajl4YTBZRjdzQUxFOTloRklVdVNG?=
 =?utf-8?B?WFpxVGdjNzdYNW12WEtzdUEzcmxNVkxXVjJncnBZUlcxQTVsRkx6RCtDb1dq?=
 =?utf-8?B?TEQvK255VmlBWjllUU5heU1zbGhrS2U2T2NxRTIzZ2lNSTZuNlI4NmVUWUlk?=
 =?utf-8?B?SGhTVWRVSklKTEltZXh5bWMwNmhKbWhzcU5tekJDeVhGaHZoL2tIZ3hqaThx?=
 =?utf-8?B?RFRxREl6Vjl1Zm8wMmhPSkEwWnJrN0Y1TmxyRER0OEtGWGZqRmNFSXZpMHFi?=
 =?utf-8?B?N1QzTjllc2Z3QzIwYWlHeDArUWtzUS9UVzg3dldwb25ubFZQVmYxYXhZdk0z?=
 =?utf-8?B?czduSEhadFBCa2Y2aVFoZGJnV2prdmtXWEw3YzVFZnI2SllNQUpnUGdXREZD?=
 =?utf-8?B?TWRKMkIyN1pXcXNteWRUdVhDTks0OHNyc1NnNXJIUUdkeXFlSTQ4SVhRRVRz?=
 =?utf-8?B?cFJJSW9QbXcvd2ZJK3JXRXJvdml6VGRiL0dIaVFSM3pnNXZEUVNZd3dXenpy?=
 =?utf-8?B?N1hKaTg1M0ZTQ2pqeFBaQ3VaR01tdkNaSlNJVXRncDkvUTZIb1NIZFQ5T2p1?=
 =?utf-8?B?Qmphcm9PZXo1WEszUnI1YXdVb3FOUzNoa3FadUpERFVQVUo4Y3A2d0pvOTdF?=
 =?utf-8?B?UVlITHZaN25PWWVxNE1GYjlOdmJpc0NEZEhEQjluMWxla2U3ZHNBN3dhRERE?=
 =?utf-8?B?c0R4MnYyS0FYZDRCd2JiNE5tcWNEdEl2WEVaWTN3dVhYR3B5UUVUMHh6ZGcr?=
 =?utf-8?B?aTl2OExFVVlZbUtTT1pOZDlzZ2V3L2JQSTVXVTVhdUJJdjVBbjJtSU5NYlZ3?=
 =?utf-8?B?aHdMdEpkTEp5KzJxT2RCWGhCY2ovL0VmdXZqQXJqeE9TV1VmZ3ppdG5lanZF?=
 =?utf-8?B?bjVtVXNVdlhwc1NiZWlpcnFjU1JGUDFNaGtvV0hMbjFYaDY3a3VWUjdMY200?=
 =?utf-8?B?eVlCL21iSk9YSXB0S3laZU5QazI2MmlsTzNTeXpXTytFc0J6NnVyc0VNWEsw?=
 =?utf-8?B?T29tcDhaaUlNdEVWZGdIRnBpK3doTUhDcHVHcEUxN0FNbnFlNXgrQlE5QVhv?=
 =?utf-8?B?NWZHSWxsRjRFdkxCYjczNG1KYlhxMkVIT28yenBXcTFPOVc5K2g0UUI0RzVh?=
 =?utf-8?B?anJFV2FHeFdJQXVuV1BuRktjV1phbEpqTis3cWE0c253ODA2VTRDQ3NEdE9Z?=
 =?utf-8?B?K1dxY3M5OGpCSUNtYzNhUzVGOEpkZUhYWUZFdmFjWHZQZXlRWFF0SENaTUdU?=
 =?utf-8?B?aXVERVd1Mk8zUllZdGR1dThKTlhROHQ5NDBFMWdycUZXQzlhY1p2aTk4RzJj?=
 =?utf-8?B?RFJ4ZWFVaXVTRVBjbXozZkpYWXlwLzUxYW9hWlJjNXkxY0hVQ0wvYWpPd1ln?=
 =?utf-8?B?cVdZR3pJcDY1cStOU2hIWEluWWgvTTJ4eUlXVGVlZTJvdHhqQUIxeXNtL29C?=
 =?utf-8?B?SFhxOFpGQk5OaE4yU2pHNERyWnNmYjZlZHZaMGxkaTk2Zjd5YXBpQXJLeHor?=
 =?utf-8?B?K0dwM1ZWS1kvVGdGUW1WZmJ0VmlwSEtDZHVUZ3VHTVlsbm9rVThnVzltWmFU?=
 =?utf-8?B?RHlrM2xwYTkzQkMxbk1HQVNuMi92Y2N4Y2tOOXRMM2dSVy9FK3NHWXphSU1D?=
 =?utf-8?B?MzNvUXNib0pmMnk3dFhVVUUvSnpYczBKcktrV1BUM1diYzdjYlNTbDVPdGx0?=
 =?utf-8?B?Y24wSVdZVWZ2K0VqMnJoakxGSjJPS29OTjdTUm5PK2JERS9FWFVwZUlyR1JG?=
 =?utf-8?B?S05WSG9pU2o5TWw0aWRIZGRwSVNPZE9QWVg1WkMvZGthZ0ZvaVBkTDN2SlBU?=
 =?utf-8?B?T0pKaDE4TWtrRXcra3k3VGhDMmIxNVo2OTd0cmpJazl5S2hFV1FZMzYzajNz?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903d3d9f-9357-4f08-b2b9-08dccc76a142
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 00:15:06.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5xxL0PWjEtC8TL/P2swuNmRh97l34mt4BNcNWWqTVhys9w5IOqUFFhgp4nUVTTrJ1gZZ6OkuTUlg6tyNZwRCXorzNhRzpCFavl88yWCcRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8377
X-Proofpoint-GUID: 3g4QqjP-sgOcB33SnrxVYGAmZ7_NT86J
X-Proofpoint-ORIG-GUID: bY5Fpb9sKlZ6evDdYdK9QjDd2qyEUcD2
X-Authority-Analysis: v=2.4 cv=C4m7yhP+ c=1 sm=1 tr=0 ts=66d7a68f cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=hkEv4HZQAAAA:8
 a=hXZgYZo4AAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=SN11at2HIzmDqlgV1swA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=52mdeZd8sWgJSgSe30wA:9 a=kYK1ZmhYYuSHRsbY:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=NA03pvyaApPJG5valX87:22 a=37BJPeUnzxYkbV1yBC-1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_12,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409030193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 00:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112082

--------------f3igUcGDl2dDHxmBdyoQyeQu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48401Uk0017117


On 9/3/24 22:03, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> do we need this on master as well ? if so please rebase on master-next
> or master

No,=C2=A0 master is mariadb 10.11.9,=C2=A0 this issue is fixed since 10.1=
1.8.

//Changqing

> On Mon, Sep 2, 2024 at 9:52=E2=80=AFPM Changqing Li via lists.openembed=
ded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Starting with Linux 6.6, RDCYCLE is a privileged instruction on RISC-V
>> and can't be used directly from userland. This causes 'systemctl start
>> mysqld.service' failed with error:
>> [ 1456.918172] mariadbd[12115]: unhandled signal 4 code 0x1 at 0x00005=
5558689d134 in mariadbd[555585bfa000+14a7000]
>> [ 1456.921772] CPU: 1 PID: 12115 Comm: mariadbd Not tainted 6.6.43-yoc=
to-standard #1
>> [ 1456.922327] Hardware name: riscv-virtio,qemu (DT)
>> [ 1456.923045] epc : 000055558689d134 ra : 000055558620ea48 sp : 00007=
fffdc487770
>> [ 1456.923525]  gp : 00005555872ec400 tp : 00007fff89560780 t0 : 00005=
55587be32e8
>> [ 1456.923951]  t1 : 0000555586886042 t2 : 000000002d6a89f0 s0 : 00007=
fffdc4877b0
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
>>   ...RISC-V-use-RDTIME-instead-of-RDCYCLE.patch | 66 +++++++++++++++++=
++
>>   2 files changed, 67 insertions(+)
>>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use=
-RDTIME-instead-of-RDCYCLE.patch
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-d=
bs/mysql/mariadb.inc
>> index 33da32fb2..124a49ff9 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -25,6 +25,7 @@ SRC_URI =3D"https://archive.mariadb.org/${BP}/source=
/${BP}.tar.gz \=20
>> file://0001-Add-missing-includes-cstdint-and-cstdio.patch \=20
>> file://0001-Remove-the-compile_time_assert-lines.patch \=20
>> file://0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch \ +=20
>> file://0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch \ "
>>   SRC_URI:append:libc-musl =3D" file://ppc-remove-glibc-dep.patch"
>>   SRC_URI[sha256sum] =3D "5239a245ed90517e96396605cd01ccd8f73cd7442d1b=
3076b6ffe258110e5157"
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-=
instead-of-RDCYCLE.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-=
use-RDTIME-instead-of-RDCYCLE.patch
>> new file mode 100644
>> index 000000000..25a2c399c
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead=
-of-RDCYCLE.patch
>> @@ -0,0 +1,66 @@
>> +From 342f0dd9b4f9fc49dcb589cd98933ea330de55d8 Mon Sep 17 00:00:00 200=
1
>> +From: Aurelien Jarno<aurelien@aurel32.net>
>> +Date: Thu, 4 Jan 2024 11:30:34 +0100
>> +Subject: [PATCH] RISC-V: use RDTIME instead of RDCYCLE
>> +
>> +Starting with Linux 6.6 [1], RDCYCLE is a privileged instruction on
>> +RISC-V and can't be used directly from userland. There is a sysctl
>> +option to change that as a transition period, but it will eventually
>> +disappear.
>> +
>> +Use RDTIME instead, which while less accurate has the advantage of be=
ing
>> +synchronized between CPU (and thus monotonic) and of constant frequen=
cy.
>> +
>> +[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/?id=3Dcc4c07c89aada16229084eeb93895c95b7eabaa3
>> +
>> +Upstream-Status: Backport [https://github.com/MariaDB/server/commit/6=
56f8867720efc1b4dd0969319f35a3e1a2a005e]
>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> +---
>> + include/my_rdtsc.h | 12 ++++++------
>> + 1 file changed, 6 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/include/my_rdtsc.h b/include/my_rdtsc.h
>> +index 8b9b0046bc0..21e44847d9a 100644
>> +--- a/include/my_rdtsc.h
>> ++++ b/include/my_rdtsc.h
>> +@@ -111,7 +111,7 @@ C_MODE_START
>> +   On AARCH64, we use the generic timer base register. We override cl=
ang
>> +   implementation for aarch64 as it access a PMU register which is no=
t
>> +   guaranteed to be active.
>> +-  On RISC-V, we use the rdcycle instruction to read from mcycle regi=
ster.
>> ++  On RISC-V, we use the rdtime instruction to read from mtime regist=
er.
>> +
>> +   Sadly, we have nothing for the Digital Alpha, MIPS, Motorola m68k,
>> +   HP PA-RISC or other non-mainstream (or obsolete) processors.
>> +@@ -211,15 +211,15 @@ static inline ulonglong my_timer_cycles(void)
>> +   }
>> + #elif defined(__riscv)
>> +   #define MY_TIMER_ROUTINE_CYCLES MY_TIMER_ROUTINE_RISCV
>> +-  /* Use RDCYCLE (and RDCYCLEH on riscv32) */
>> ++  /* Use RDTIME (and RDTIMEH on riscv32) */
>> +   {
>> + # if __riscv_xlen =3D=3D 32
>> +     ulong result_lo, result_hi0, result_hi1;
>> +     /* Implemented in assembly because Clang insisted on branching. =
*/
>> +     __asm __volatile__(
>> +-        "rdcycleh %0\n"
>> +-        "rdcycle %1\n"
>> +-        "rdcycleh %2\n"
>> ++        "rdtimeh %0\n"
>> ++        "rdtime %1\n"
>> ++        "rdtimeh %2\n"
>> +         "sub %0, %0, %2\n"
>> +         "seqz %0, %0\n"
>> +         "sub %0, zero, %0\n"
>> +@@ -228,7 +228,7 @@ static inline ulonglong my_timer_cycles(void)
>> +     return (static_cast<ulonglong>(result_hi1) << 32) | result_lo;
>> + # else
>> +     ulonglong result;
>> +-    __asm __volatile__("rdcycle %0" : "=3Dr"(result));
>> ++    __asm __volatile__("rdtime %0" : "=3Dr"(result));
>> +     return result;
>> +   }
>> + # endif
>> +--
>> +2.25.1
>> +
>> --
>> 2.46.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112078):https://lists.openembedded.org/g/openembed=
ded-devel/message/112078
>> Mute This Topic:https://lists.openembedded.org/mt/108240112/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------f3igUcGDl2dDHxmBdyoQyeQu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48401Uk0017117

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 9/3/24 22:03, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sreQCYaJfH7iWN3-QF1i_c2gH=
gmB5ORiUw3d4BoofZEHA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

do we need this on master as well ? if so please rebase on master-next
or master
</pre>
    </blockquote>
    <p>No,&nbsp; master is mariadb 10.11.9,&nbsp; this issue is fixed sin=
ce
      10.11.8.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sreQCYaJfH7iWN3-QF1i_c2gH=
gmB5ORiUw3d4BoofZEHA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
On Mon, Sep 2, 2024 at 9:52=E2=80=AFPM Changqing Li via lists.openembedde=
d.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Starting with Linux 6.6, RDCYCLE is a privileged instruction on RISC-V
and can't be used directly from userland. This causes 'systemctl start
mysqld.service' failed with error:
[ 1456.918172] mariadbd[12115]: unhandled signal 4 code 0x1 at 0x00005555=
8689d134 in mariadbd[555585bfa000+14a7000]
[ 1456.921772] CPU: 1 PID: 12115 Comm: mariadbd Not tainted 6.6.43-yocto-=
standard #1
[ 1456.922327] Hardware name: riscv-virtio,qemu (DT)
[ 1456.923045] epc : 000055558689d134 ra : 000055558620ea48 sp : 00007fff=
dc487770
[ 1456.923525]  gp : 00005555872ec400 tp : 00007fff89560780 t0 : 00005555=
87be32e8
[ 1456.923951]  t1 : 0000555586886042 t2 : 000000002d6a89f0 s0 : 00007fff=
dc4877b0

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...RISC-V-use-RDTIME-instead-of-RDCYCLE.patch | 66 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDT=
IME-instead-of-RDCYCLE.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index 33da32fb2..124a49ff9 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,6 +25,7 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://archive.mariadb.org/${BP}/source/${BP}.tar.gz\file://0001-Add-mis=
sing-includes-cstdint-and-cstdio.patch\file://0001-Remove-the-compile_tim=
e_assert-lines.patch\file://0001-MDEV-33439-Fix-build-with-libxml2-2.12.p=
atch\+file://0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch\">&quot;http=
s://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Remove-the-compile_time_assert-lines.patch \
            file://0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch \
+           file://0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch \
           &quot;</a>
 SRC_URI:append:libc-musl =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
file://ppc-remove-glibc-dep.patch">&quot; file://ppc-remove-glibc-dep.pat=
ch&quot;</a>
 SRC_URI[sha256sum] =3D &quot;5239a245ed90517e96396605cd01ccd8f73cd7442d1=
b3076b6ffe258110e5157&quot;
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-ins=
tead-of-RDCYCLE.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use=
-RDTIME-instead-of-RDCYCLE.patch
new file mode 100644
index 000000000..25a2c399c
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead-of=
-RDCYCLE.patch
@@ -0,0 +1,66 @@
+From 342f0dd9b4f9fc49dcb589cd98933ea330de55d8 Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:a=
urelien@aurel32.net">&lt;aurelien@aurel32.net&gt;</a>
+Date: Thu, 4 Jan 2024 11:30:34 +0100
+Subject: [PATCH] RISC-V: use RDTIME instead of RDCYCLE
+
+Starting with Linux 6.6 [1], RDCYCLE is a privileged instruction on
+RISC-V and can't be used directly from userland. There is a sysctl
+option to change that as a transition period, but it will eventually
+disappear.
+
+Use RDTIME instead, which while less accurate has the advantage of being
+synchronized between CPU (and thus monotonic) and of constant frequency.
+
+[1] <a class=3D"moz-txt-link-freetext" href=3D"https://git.kernel.org/pu=
b/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Dcc4c07c89aada16229=
084eeb93895c95b7eabaa3">https://git.kernel.org/pub/scm/linux/kernel/git/t=
orvalds/linux.git/commit/?id=3Dcc4c07c89aada16229084eeb93895c95b7eabaa3</=
a>
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/MariaDB/server/commit/656f8867720efc1b4dd0969319f35a3e1a=
2a005e">https://github.com/MariaDB/server/commit/656f8867720efc1b4dd09693=
19f35a3e1a2a005e</a>]
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ include/my_rdtsc.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/include/my_rdtsc.h b/include/my_rdtsc.h
+index 8b9b0046bc0..21e44847d9a 100644
+--- a/include/my_rdtsc.h
++++ b/include/my_rdtsc.h
+@@ -111,7 +111,7 @@ C_MODE_START
+   On AARCH64, we use the generic timer base register. We override clang
+   implementation for aarch64 as it access a PMU register which is not
+   guaranteed to be active.
+-  On RISC-V, we use the rdcycle instruction to read from mcycle registe=
r.
++  On RISC-V, we use the rdtime instruction to read from mtime register.
+
+   Sadly, we have nothing for the Digital Alpha, MIPS, Motorola m68k,
+   HP PA-RISC or other non-mainstream (or obsolete) processors.
+@@ -211,15 +211,15 @@ static inline ulonglong my_timer_cycles(void)
+   }
+ #elif defined(__riscv)
+   #define MY_TIMER_ROUTINE_CYCLES MY_TIMER_ROUTINE_RISCV
+-  /* Use RDCYCLE (and RDCYCLEH on riscv32) */
++  /* Use RDTIME (and RDTIMEH on riscv32) */
+   {
+ # if __riscv_xlen =3D=3D 32
+     ulong result_lo, result_hi0, result_hi1;
+     /* Implemented in assembly because Clang insisted on branching. */
+     __asm __volatile__(
+-        &quot;rdcycleh %0\n&quot;
+-        &quot;rdcycle %1\n&quot;
+-        &quot;rdcycleh %2\n&quot;
++        &quot;rdtimeh %0\n&quot;
++        &quot;rdtime %1\n&quot;
++        &quot;rdtimeh %2\n&quot;
+         &quot;sub %0, %0, %2\n&quot;
+         &quot;seqz %0, %0\n&quot;
+         &quot;sub %0, zero, %0\n&quot;
+@@ -228,7 +228,7 @@ static inline ulonglong my_timer_cycles(void)
+     return (static_cast&lt;ulonglong&gt;(result_hi1) &lt;&lt; 32) | res=
ult_lo;
+ # else
+     ulonglong result;
+-    __asm __volatile__(&quot;rdcycle %0&quot; : &quot;=3Dr&quot;(result=
));
++    __asm __volatile__(&quot;rdtime %0&quot; : &quot;=3Dr&quot;(result)=
);
+     return result;
+   }
+ # endif
+--
+2.25.1
+
--
2.46.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#112078): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/112078">https:=
//lists.openembedded.org/g/openembedded-devel/message/112078</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/108240112/1997914">https://lists.openembedded.org/mt=
/108240112/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------f3igUcGDl2dDHxmBdyoQyeQu--

