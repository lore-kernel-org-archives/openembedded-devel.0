Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3692FC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 01:13:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6251.1714007577052244545
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 18:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=CUwX9uNY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4845b5da70=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P0g2Gf023329
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 18:12:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=463DH13kSDY6x0Yu4K9
	dcElAgSHH7UTmVgNR5L3x310=; b=CUwX9uNYbWDks7X1myr7hLEwmv1QKnNHZ43
	Va1J30qcJ73srpGmqftti3iuvrFFNo2RgyZv+e1Crw6xxWqstGhpkQeSzGT//3Xo
	zCKAFR+KVl53G2551InJbritLWN+o0GSjsByKaMKi1vdfLCpaqv/mS3sGyoRhC8h
	otWn7M+Kl/fCFscOzidbp7veYLNztJPP6AP7ccId0hkK4pFgX6ea3rkQaMYh/PSu
	ouCIZuXlfLCGgaJdr8cPr5fYDaEpJuKqwAoqT7wAlPDkWGHxw46d9q4VAEOFJuGb
	ShsI/BEyUxrGbmCuLxOaK3yZRL1kYltqS7dpBNQyoV6JdYx+jiQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xmd7gmepw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 18:12:56 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43P1Cti0032608;
	Wed, 24 Apr 2024 18:12:55 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xmd7gmepv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 18:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USbG5lC72Raks/fmm3pgC1j+0BDfIyE9NWyKbeyDX2HlsKh3JNeY6JBW3Kn7oBJtPIMIhp2DlO/JTpLsXSuNKDSU5s6B8b9jJmP1INihg9zbcDBcbix5sVMmu+dxcAViK8riQWvJ0Hbq5ENeJBHh4iPKIccns5ZdXgay85opYVh/8Vy17hoV57ZO0+o8O9uEB/kIG/T/boXMZeyiDwL+hU61bUeN87KGBuqpxGNYFnr/s+dt0GG3xklAi90km+1W9TX72Z2Vwx4iB25ZiFeaRUmjUBk7RG536d3DPHFF9Qb8ebSzyOGwoqiFFIaBpCUC6fx09sOyc0FKK95vj3enyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=463DH13kSDY6x0Yu4K9dcElAgSHH7UTmVgNR5L3x310=;
 b=OTyRPmzBNkXQZsQODUobslvV3zHDi41uO8oAmuZoZZO4Q2OY1AWChLftjmF2/BaxCraj7skbUEnGAXwT9qR+MPYFGWRc3qkW9Sx8sb+TgoMM+l3eW/9sSad/P6soTJn7+GrNDnpob2BOHaVdv/FFooFW4kmDiF8dc5uRB1aGAZKFqKbBRIu1fZbEbjptD+y/gcz3mzYD9fbXAHH69mtn3vhT1ASP7IE9iTqVNFnIZ1Z95m8DXVBDnx+zn+76bSJsMgfQh5qOIJxkyUC+o0txXZSzJSTaWAux1oFfk0KG7DBoFG68E3LNMHPijUkg/+S0Y7aloIG4X0VIiKBfx+CwzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ1PR11MB6105.namprd11.prod.outlook.com (2603:10b6:a03:48c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 01:12:50 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::11a8:330f:c42c:b2d5]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::11a8:330f:c42c:b2d5%4]) with mapi id 15.20.7519.023; Thu, 25 Apr 2024
 01:12:49 +0000
Content-Type: multipart/alternative;
 boundary="------------XWEA8b107zNI0wLtBZQe2x0e"
Message-ID: <4a296975-a600-4cba-a8c2-803a20670b9b@windriver.com>
Date: Thu, 25 Apr 2024 09:12:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [master][scarthgap][meta-filesystems][PATCH] fuse3: remove
 sysv init script and install fuse kernel module explictly
To: Khem Raj <raj.khem@gmail.com>, changqing.li@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20240424080953.2461900-1-changqing.li@windriver.com>
 <CAMKF1spdM_JP2EsrxmMwp=DQo-YSSxWSzMvtujrtRWBXLkhtRQ@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1spdM_JP2EsrxmMwp=DQo-YSSxWSzMvtujrtRWBXLkhtRQ@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:4::24) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ1PR11MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: a57e611e-5b33-4fef-1443-08dc64c4d2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T05uZnRXK1hjVmg5Ti9nYkdGSi85eUg4MWJwcnNmRzhFVStkcE9CdEJPLzZu?=
 =?utf-8?B?OW9nRzZYZXhJNHIvK2IxYVhmaUdDcE9xWEVtK05xYjQ4am84SzhkQW02WTFK?=
 =?utf-8?B?RkFoRWxJMHZuQmpJMVFjTkoxQ2RBYnI0M1FFcmhHNG5panUzQWpBayt0cXlq?=
 =?utf-8?B?UEhSTnR5QjViSWFaN0FYUUsrYmdBYUpueHVSMFVFUysyR2dLQWtvOUdiVWd0?=
 =?utf-8?B?LzRLOHhPaWwwK3lIQ3FHL3IrSitKMXJBd2F1a3hmV0pBVk5ZYVJxdzBObTdQ?=
 =?utf-8?B?RmFLaTF5bkd0aDhJYXhjNkhjUVU0ZURNWVFWVGFZdU52NWFSc0kyZFVwUGYz?=
 =?utf-8?B?WVMxazA0YmVOZS9pZDBZUlkxczlMeW9VRVYrTjVJeS82MjNUSnQvdWRENUxT?=
 =?utf-8?B?aCtsclFnNUhPOWpueTdiRnVoRGw1U1NsS2V2a2wxTmNzemwyVllTMjQrL0pL?=
 =?utf-8?B?YTgyL0pqUnowM2RTUEV3ZjF3UXFOQnR3S3FCRDQrYXQ3NW83bXVlbWlPUUl2?=
 =?utf-8?B?dFBYMTBISWJOWDNnT2MxQWZqVHo0aDhuMFE0aTBoV0lyeVVFOTZvTDZGQ2dP?=
 =?utf-8?B?bXNwRWQ2SWNCV2lvWlI2MXA2T3lyOWlNZi9iOGdZM3lWdEpGR0VOUnZJT2pa?=
 =?utf-8?B?WnJsUldsYmpWNzVZbHl0UkVXTzRCbE5YRDA1cjhGZlJISU93dVhQM2pQVnFE?=
 =?utf-8?B?M0pNV0lWV1ljWjMxZXphRVJKRkFIK2RGMTkrQXhqa2RHZzA3ZXp5RGdZc2JY?=
 =?utf-8?B?OVF6R1AyNUFFVG9VN085NDlFRzJVUUZjZytXakMzZE1ZZ3QrbnFEU0NweVpx?=
 =?utf-8?B?ZnJFMlA5RytTRWJhTXZNdkZwWWFZY2dHV29MbnJ3OTRmLzhubWM5Sjc4cUxN?=
 =?utf-8?B?VFZtUytkVzZ4MVA3TzdDdWhvL09VK0xJRlljL2IyMlFBcE42SzVwSTBHak4w?=
 =?utf-8?B?eTZLdjB6dmtSMG9qNlJJN1A5NHpqQlpYMXArbmt1VUI5K1N4cDQ3d1pHbm9P?=
 =?utf-8?B?TDVuaXJwQVJyQzVoczBFV0VTWGtOdlV5ZC8zTGxMS1JBMWdNOUtrRTNtQW13?=
 =?utf-8?B?UkMvT3o2NXljL3l3bGE0VmZKemRod1B3T285R1pQRkRiMUlCTDl1Z3JLaHZh?=
 =?utf-8?B?UmpDRG4rMEhHbzNGV0hOaDU4aWhvMkdOcjU3cTZnNjlTMHhiMVhlUnJIaUxH?=
 =?utf-8?B?Y0ZDeXZYenZJSUxwdlF2ZGU5QmJraGkvUHJScVg0TlJPOVQyOFg2d2lNc3lR?=
 =?utf-8?B?eGF4SWxIbHQ4M2hsdE1LRFJMSnVTYXhWb3V0cllOVjhJTkVNTGFzY0t0VkZ0?=
 =?utf-8?B?YXAyc0JQR3pVODFyb1d6QWVOUHlxVWszbXljajB1N0NjS0VPR3hMMWFWMEZD?=
 =?utf-8?B?Tm9OcDBJZ1dlMXVzNCtJU2cvajlhamo4WlVwcHNzQkEyd0tyL2wzK0VpT1NH?=
 =?utf-8?B?VVRiQWJFdG5adFFDcnFqa0Z4M0w4NGJxc2dwcGxyNkdwS3g1TlJqVUxyWXVp?=
 =?utf-8?B?bzhtZUFJK1Z1eld1cGppNnM3YTBtWjNpSjlnZDI5aExUYlAxOGdlaE4zVnpR?=
 =?utf-8?B?RWtUc0xUVkd2eituSU5RV3JXckpzM2RMZkxtd3ZsNERUcEUxTjJBZUJESWxq?=
 =?utf-8?Q?d/xRMZS3t2AhRK2YDvoCcTzZqNqrefkaAOkf9jdxZxoc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHF1b2IyMFprcEFpaGNRY0xJVGUrNWx3MlBHejdoY0dBWmlzSE1ZRzU3ZEls?=
 =?utf-8?B?RHE2RnVMRC9SSGNnbnk1cCtZWk1BVG1hNWYrQTFsUk03VGNDckRVMDBLQ21R?=
 =?utf-8?B?eklMZHRPMThJVy82YjdOWEZMZkFFaW5BRXkxM3RqQUh3NmVIMzVzVi9OZVVN?=
 =?utf-8?B?bDFQbUFBZWNiRlJRNDZXVlBiZ21KVXNlT1F0UEQvMWlVQStzS0pKNVIwdk90?=
 =?utf-8?B?SE0vTU9ROUtCb2dKcStKSVNaUndkOGhqZm5WVWxlODdKNXhtT3pKMDc3MG5m?=
 =?utf-8?B?U2kraUVsNE1PS3VSdEhuZnl1cVZRSjJvRmprUG1mSGt2dXo2bGNNT1BkdVUy?=
 =?utf-8?B?U1hxY2tDYmFOK3NCUThmUFlKZjN6WGlFZHZCK0VhZXJLcmhsd0tZcFhMKzNF?=
 =?utf-8?B?N2w3d2x5SXRHYVJweXRBNDBRWk41dWFjN0tNR0pMK1VvaDdFNWdjUEplMU5m?=
 =?utf-8?B?Z3JiNWtna3ZDOEJsTDdic252aE5HU3laUEhrQnY5eVlTOFlkVno0eDFaOVFT?=
 =?utf-8?B?ZjBOVjdsR01GanVFQk1mY1V0RHYzMUlrSkpHUVZDYTdhYWU1S1h4SzBrTS95?=
 =?utf-8?B?dU12ZHBab2dsYVlHM1pnK0RMck1MVy9Vakh1STJSZjZMTzRqNFU3ZEl4VTgw?=
 =?utf-8?B?djNrOGtoTWNweHlwdXhxdHVGOUVEMlY1c1NXcTVVbjFMTXRrS3VzcFFjd3VS?=
 =?utf-8?B?S3V1NmhMa3JQc0E2VDh1aW1iOUt5WE1tSkUxRjRTd2MvYms5Q2JaM1J3ZGpm?=
 =?utf-8?B?VXBRWXN4aEt1TGJZdXVEZlJKTkQxRzV5UXFlU0QxV3ZXeGhONTMvWXUxaklN?=
 =?utf-8?B?K29JcVNxQzAySW1vbUtUeUx4MU8rZlVaUnBIS1hkWXBESzRuN2N2enFBd0Nz?=
 =?utf-8?B?T2pvQlplZWIwQzgxWWhtQkNITXRvYVpadFVFMk8yd1BoMEFwYUVkRmhhbXR6?=
 =?utf-8?B?MnA5ZUFqeDY5MC80MGZBblNvVkgzQkdIbnVGa1NkQk5GN1lSODd6ODJmNHNr?=
 =?utf-8?B?QndqNlRjQ0lHNERhV2MwYzFud2dqdUh0S0dXTFZ0VjBxOCtYbW9leFl5ZWZa?=
 =?utf-8?B?c3g2a3BNRm5hOE9IeHViV21mOXlCbmRzanp3M1UvakdLOWw4cURWTTVCaTRN?=
 =?utf-8?B?OHNoOXR1enBGZis0VGl6aWNGR0MySldZS0JUSVhpUEJPMzNjSkZMWmozeWIy?=
 =?utf-8?B?eDIyR2xOM3dubTczM3IrcndmeG5WVnlKekNUVUt4RE10OFJZNm15Q3lRNWli?=
 =?utf-8?B?RmVXcE1sa3E2dVlWQ1oxSUlzVllpOFBGQXRrSlJUTE9MRG1oTG13V0hvNFo2?=
 =?utf-8?B?ZmRDRjgxcGw2MTdwQ2FlRUFURTZ5VFZ0c29CZmdBSUU0V1lwWXA1cUZwVVM0?=
 =?utf-8?B?T04yL1NrVk5QQ3RPSjFzeFNaZkJHV3E3MGloTFIzSW9UbUt4elEvSXM3TjJm?=
 =?utf-8?B?a05rT0FiTVN5NUYxSXpOUjRhdjhaZUtXNmhtdzVnR0xQcWhIMjJGVEdKbzBI?=
 =?utf-8?B?Smg1dXV0aTZWK2YyTFZLT3krVTFCWkFkM1hQclQvYjVJTDRTaUgvRGVpVTNG?=
 =?utf-8?B?N0VxZHZPbU91SDJuaTN5U3gyLysyM1RqSVRXM0lQTkxkd0VlMmxway92c0t2?=
 =?utf-8?B?T0gxWGdsT3pmYVVFdVlUQlMrVDgraFNJSTg3ZWZlNTlJQ1pTbnk3L1hGZnht?=
 =?utf-8?B?aEt0V3hwVm9EZDFpRFBacXV5bU84MGtoZ0xnS3dWMU9CbUo1cUo3VWhSVlRr?=
 =?utf-8?B?dTB5T2pvTE9aajdPNjNCU2c4UGFoL1RwYzZiekdsMWEzMUZaN3ZhbXMzR2p3?=
 =?utf-8?B?MGRJUG8wMjg4Sjkza3hRV3pFRnNObVRWSXJHSmlBb1lmaitOUEFiMjV6RVJC?=
 =?utf-8?B?N1Y0d0JLVjBybHhIMHRTSndNclpoUWNNakxQWnN4aURlTjErTWdpSFBLS3RG?=
 =?utf-8?B?TnBwZzBEWDEvblpPRk5uOURBRGo1MEhBQjBRTVdySkVmNDU5VmlnYXFIU1Vj?=
 =?utf-8?B?L3Z2SzMzemhUbk9MdmZuNk1hZURKcjROaEV5UXY4eXQrYTBleGtSTjZoaExD?=
 =?utf-8?B?NGRtd2ZFT2JSdlVSMDU3N3NVQ0NoSW51UUQ0aHJGVkJvZC9FcjVZbXR3Mkp4?=
 =?utf-8?B?dUZvT0dHb1BjeDZVeUUxblN5dHNZYTZ6SzFRNW9lNUgrbnpjTHdvWUhwSEN6?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57e611e-5b33-4fef-1443-08dc64c4d2f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 01:12:49.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXkbu0+QkC2OW9teyIlaG/26EHcjERN/QMcPDb0QIJ+yuaoElN3UB6bqF5w/4ToZu689vLrYbmtDxK54NTAx+VxRGMoZIkWKOZ2+7SLSOos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6105
X-Proofpoint-ORIG-GUID: wI_qwj_kk9G4fSXkmHineCrN8V58EwC8
X-Proofpoint-GUID: kAnyIKQWWZIbKfBGVuBEJyCIvLpSk5OW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_21,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404250007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 01:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110143

--------------XWEA8b107zNI0wLtBZQe2x0e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43P0g2Gf023329


On 4/24/24 22:59, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Wed, Apr 24, 2024 at 10:09=E2=80=AFAM Changqing Li via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji=
7i_whkywcFNl8Lch7ilmQ$>=20
> <changqing.li=20
> <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!aSee_7=
-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcF=
Nl8IR2yqQFQ$>=3Deng.windriver.com@lists.openembedded.org>=20
> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com>
>
>     For systemd, there is not a fuse.service since systemd provides
>     sys-fs-fuse-connections.mount to mount the fuse control filesystem,=
 so
>     instead, only fuse.conf is added to modules-load.d to load the
>     required
>     fuse kernel module.
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     ---
>     =C2=A0.../recipes-support/fuse/fuse3_3.16.2.bb
>     <https://urldefense.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ=
!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_=
whkywcFNl8K4AuVerw$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++++++++++++
>     =C2=A01 file changed, 15 insertions(+)
>
>     diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
>     <https://urldefense.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ=
!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_=
whkywcFNl8K4AuVerw$>
>     b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
>     <https://urldefense.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ=
!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_=
whkywcFNl8K4AuVerw$>
>     index 2b0797a6f..8c5c51360 100644
>     --- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
>     <https://urldefense.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ=
!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_=
whkywcFNl8K4AuVerw$>
>     +++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
>     <https://urldefense.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ=
!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_=
whkywcFNl8K4AuVerw$>
>     @@ -28,6 +28,7 @@ inherit meson pkgconfig ptest
>
>     =C2=A0SRC_URI +=3D " \
>     file://run-ptest \
>     + file://fuse.conf \
>
>
> Who provides this file ? I don=E2=80=99t see it as part of patch

There is already a fuse.conf under files,=C2=A0 it is used by fuse_2.9.9.=
bb.

https://git.openembedded.org/meta-openembedded/tree/meta-filesystems/reci=
pes-support/fuse/files/

Regards

changqing

>
>     =C2=A0"
>
>     =C2=A0RDEPENDS:${PN}-ptest +=3D " \
>     @@ -79,6 +80,20 @@ FILES:fuse3-utils =3D "${bindir} ${base_sbindir}=
"
>     =C2=A0DEBIAN_NOAUTONAME:fuse3-utils =3D "1"
>     =C2=A0DEBIAN_NOAUTONAME:${PN}-dbg =3D "1"
>
>     +SYSTEMD_SERVICE:${PN} =3D ""
>     +
>     =C2=A0do_install:append() {
>     =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${base_prefix}/dev
>     +
>     +=C2=A0 =C2=A0 # systemd class remove the sysv_initddir only if
>     systemd_system_unitdir
>     +=C2=A0 =C2=A0 # contains anything, but it's not needed if sysvinit=
 is not
>     in DISTRO_FEATURES
>     +=C2=A0 =C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit=
',
>     'false', 'true', d)}; then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${sysconfdir}/init.d/
>     +=C2=A0 =C2=A0 fi
>     +
>     +=C2=A0 =C2=A0 # Install systemd related configuration file
>     +=C2=A0 =C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd'=
, 'true',
>     'false', d)}; then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/modules-l=
oad.d
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/fuse.conf
>     ${D}${sysconfdir}/modules-load.d
>     +=C2=A0 =C2=A0 fi
>     =C2=A0}
>     --=20
>     2.25.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#110121):
>     https://lists.openembedded.org/g/openembedded-devel/message/110121
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/110121__;!!AjveYdw8EvQ!aSee_7-ICSMQYIbOvW2JOzFIlLuJ=
vdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl8IjKKEj_w$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/105706495/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1057=
06495/1997914__;!!AjveYdw8EvQ!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG=
4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl8JO5CC2Fw$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-=
DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl8LCNsyZIw$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------XWEA8b107zNI0wLtBZQe2x0e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43P0g2Gf023329

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/24/24 22:59, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spdM_JP2EsrxmMwp=3DDQo-YS=
SxWSzMvtujrtRWBXLkhtRQ@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"auto"><br>
        </div>
        <div><br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 24, 2024 at
              10:09=E2=80=AFAM Changqing Li via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K=
4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl8Lch7ilmQ$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;<a href=3D"https://urldefe=
nse.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!aSee_7-ICSMQYIbOvW2JOzFI=
lLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl8IR2yqQFQ$" moz-=
do-not-send=3D"true">changqing.li</a>=3D<a href=3D"mailto:eng.windriver.c=
om@lists.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">eng.windriver.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
              From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windr=
iver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-lin=
k-freetext">changqing.li@windriver.com</a>&gt;<br>
              <br>
              For systemd, there is not a fuse.service since systemd
              provides<br>
              sys-fs-fuse-connections.mount to mount the fuse control
              filesystem, so<br>
              instead, only fuse.conf is added to modules-load.d to load
              the required<br>
              fuse kernel module.<br>
              <br>
              Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing=
.li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;.../recipes-support/fuse/<a href=3D"https://urldefens=
e.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ!aSee_7-ICSMQYIbOvW2JOzF=
IlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl8K4AuVerw$" rel=
=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">fuse3_3.16.2.b=
b</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; | 15 +++++++++++++++<br>
              &nbsp;1 file changed, 15 insertions(+)<br>
              <br>
              diff --git a/meta-filesystems/recipes-support/fuse/<a href=3D=
"https://urldefense.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ!aSee_=
7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywc=
FNl8K4AuVerw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">fuse3_3.16.2.bb</a>
              b/meta-filesystems/recipes-support/fuse/<a href=3D"https://=
urldefense.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ!aSee_7-ICSMQYI=
bOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl8K4AuV=
erw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">fuse3=
_3.16.2.bb</a><br>
              index 2b0797a6f..8c5c51360 100644<br>
              --- a/meta-filesystems/recipes-support/fuse/<a href=3D"http=
s://urldefense.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ!aSee_7-ICS=
MQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl8K=
4AuVerw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">f=
use3_3.16.2.bb</a><br>
              +++ b/meta-filesystems/recipes-support/fuse/<a href=3D"http=
s://urldefense.com/v3/__http://fuse3_3.16.2.bb__;!!AjveYdw8EvQ!aSee_7-ICS=
MQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl8K=
4AuVerw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">f=
use3_3.16.2.bb</a><br>
              @@ -28,6 +28,7 @@ inherit meson pkgconfig ptest<br>
              <br>
              &nbsp;SRC_URI +=3D &quot; \<br>
              &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt-link-freetext" href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
              +&nbsp; &nbsp; <a class=3D"moz-txt-link-freetext" href=3D"f=
ile://fuse.conf">file://fuse.conf</a> \</blockquote>
            <div dir=3D"auto"><br>
            </div>
            <div dir=3D"auto">Who provides this file ? I don=E2=80=99t se=
e it as
              part of patch <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>There is already a fuse.conf under files,&nbsp; it is used by
      fuse_2.9.9.bb.</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedde=
d.org/meta-openembedded/tree/meta-filesystems/recipes-support/fuse/files/=
">https://git.openembedded.org/meta-openembedded/tree/meta-filesystems/re=
cipes-support/fuse/files/</a></p>
    <p>Regards</p>
    <p>changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spdM_JP2EsrxmMwp=3DDQo-YS=
SxWSzMvtujrtRWBXLkhtRQ@mail.gmail.com">
      <div>
        <div>
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">
              <br>
              &nbsp;&quot;<br>
              <br>
              &nbsp;RDEPENDS:${PN}-ptest +=3D &quot; \<br>
              @@ -79,6 +80,20 @@ FILES:fuse3-utils =3D &quot;${bindir}
              ${base_sbindir}&quot;<br>
              &nbsp;DEBIAN_NOAUTONAME:fuse3-utils =3D &quot;1&quot;<br>
              &nbsp;DEBIAN_NOAUTONAME:${PN}-dbg =3D &quot;1&quot;<br>
              <br>
              +SYSTEMD_SERVICE:${PN} =3D &quot;&quot;<br>
              +<br>
              &nbsp;do_install:append() {<br>
              &nbsp; &nbsp; &nbsp;rm -rf ${D}${base_prefix}/dev<br>
              +<br>
              +&nbsp; &nbsp; # systemd class remove the sysv_initddir onl=
y if
              systemd_system_unitdir<br>
              +&nbsp; &nbsp; # contains anything, but it's not needed if =
sysvinit
              is not in DISTRO_FEATURES<br>
              +&nbsp; &nbsp; if ${@bb.utils.contains('DISTRO_FEATURES',
              'sysvinit', 'false', 'true', d)}; then<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; rm -rf ${D}${sysconfdir}/init.=
d/<br>
              +&nbsp; &nbsp; fi<br>
              +<br>
              +&nbsp; &nbsp; # Install systemd related configuration file=
<br>
              +&nbsp; &nbsp; if ${@bb.utils.contains('DISTRO_FEATURES', '=
systemd',
              'true', 'false', d)}; then<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${sysconfdir}/m=
odules-load.d<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; install -m 0644 ${WORKDIR}/fus=
e.conf
              ${D}${sysconfdir}/modules-load.d<br>
              +&nbsp; &nbsp; fi<br>
              &nbsp;}<br>
              -- <br>
              2.25.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#110121): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/1101=
21__;!!AjveYdw8EvQ!aSee_7-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZE=
St9NY3Wxw_Fbzji7i_whkywcFNl8IjKKEj_w$" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-devel/message/110121</a><br=
>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/105706495/1997914__;!!AjveYdw8EvQ!aSee_7-I=
CSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcFNl=
8JO5CC2Fw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>
                https://lists.openembedded.org/mt/105706495/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@l=
ists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!aSee_7=
-ICSMQYIbOvW2JOzFIlLuJvdJNndae-DCyAUG4F8K4bVPfZESt9NY3Wxw_Fbzji7i_whkywcF=
Nl8LCNsyZIw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------XWEA8b107zNI0wLtBZQe2x0e--

