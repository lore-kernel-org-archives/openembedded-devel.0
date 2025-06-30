Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF794C83026
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 06:52:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33118.1751266356698286925
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jun 2025 23:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9276b717df=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U4T8xO014012
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jun 2025 23:52:36 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp499v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jun 2025 23:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkAzRf5uDyWeY/oBfKzkkIiLsCTOZWCQJ87LlOKrhX8ETL77esqM6dj7IcC5MVav+iFduQkIs5+80mn6HLcMmAwdZewQzPf3Nk7E/LUHx/PeExz7B3GY0suJBXHL0xx8f7uuuMqapJ+7Gv+a7HdiyM6vKTv9o71j56826jXl2/4/ORKPuwfx3cdiI8nZtZwInz12Mr+EE34raJ9Tr7E/Wn46M0IbOL7NWAJganlrrYn7Qk3FdsJdg6XrfV2H0R1aFfvIoXUDv+vDB3volE6sl+1BARW219oIDw+fR70GmAbcdxTg4FpvO8y0oJ1XiA+3l96G8NytFfTUYNIvFeNzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a95yvRIA2SQJ+TEA2vEodxLBdssxWPB/UIBwRtrq4DM=;
 b=CGwnpybywn7kuX80Ex+6qc/gpkwmaj3JhH0x1fdFG/Ru8I3HUlzypxkn/seJYANpwvcMZEVyYS3K/hdYqylaH5PKrRINaTp0F65UmH4FqIJhNliir7SwLVYzQ3av7OKrv/9aamvYzVVCVayGXOtkIJ7ZysvnKkZxdPVjrEYfzclv6iaSBdOx42b3xQ3iLxcB6ZQqBTeHSKlbdyPus582aRs9ZT4xXhEePbnVH976+M6PLuNhk60IJVFo4zlS095KdILjp/CcHW1sEWMAtzKrWQrUxfXPk5HeOnBSLmN1R94e6QCJAo16ErJ3CXN95bFd13vdGWZef6bsCb2bG8d07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 06:52:33 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%4]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 06:52:33 +0000
Message-ID: <1ab88aa9-fb8d-46a1-bee1-8ac7ee201a49@windriver.com>
Date: Mon, 30 Jun 2025 14:52:27 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
Subject: [scarthgap][postfix] sample-main.cf -help needed
Cc: jinfeng.wang.cn@windriver.com
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f6acf9-89d5-48d2-ca5b-08ddb7a2b052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nk1PYmRrSUJhbnVwSllHZGUrdXRZSTRiNW5Ob1pBbTJwV1VMRnl1ejdOWVc1?=
 =?utf-8?B?M216ZFhwOXNjNUdPZ3puZ2NyQm1hRktzSW5TbnVCaVBJWXgzN3BwSFRYdllw?=
 =?utf-8?B?R1ozakZTNnpNUjVzV1VqTzVrRDdIVVRwQ1VTMFJjRjhML0E3Z3pBR2dOZmda?=
 =?utf-8?B?d3E4aUNDVk9wYlhSZmxpNXZlWW8xY3UxK09ocHkveXV2OU9hQ3NCQnNVL3do?=
 =?utf-8?B?aFI0SXZFKzZMN2JJemVjdHZOWUMyMDg3dmd4RHNVT3k1R0M1SkJOZ0Mwdzc1?=
 =?utf-8?B?anBRWnhhOFIwZ25sUUV4NzFDc2c0Sjd0d0dGaXplU21kcUdrSFUvVVArYlNG?=
 =?utf-8?B?YTBEZmltdjhNUXhyeDBlZFF1UmRDYlBnTnh0akdmSG9DaEREeGJtQlRGWmNP?=
 =?utf-8?B?TWhTbVBmLzdNYkhyNExXc2xrYlZzci9vNnJnNnN3VkJyTTgvU3JNVktDZmUw?=
 =?utf-8?B?bi9KY3VBMGFONVBiU1F3bmRtK0kzNms5a09hRTBhV1d3cE10MWxTRk1WS1Jk?=
 =?utf-8?B?QmpMYUVSaTYxM0tMZFdTdmNoa01iWnYwRnJWUitjOXRscmtpNllCbmQ5WEJQ?=
 =?utf-8?B?MkJDYTBxdG5TcGUxeTF4OFp5aEhpcGFpQ2Vhc201YUpHWkloSXlMNEVjcVhm?=
 =?utf-8?B?dVNUZUZSMmVEaTVCeFdBMFAyQ3NXMFNPSExxMnU0SElBdmYvK0QxNXovV1VF?=
 =?utf-8?B?cjRGSm5hckx5dEVLMVBMWFM0cFl6YjRGc3lZcDljMHgwbHZXNEFsbldESFNU?=
 =?utf-8?B?ZE0rSWRxLzBlZXorV2hsSlB1Tk1IVGlxMTFlZ1ZWSG4wbzcySnRtalQyTVNr?=
 =?utf-8?B?RTRWd24zYkN0akl2blptUkU3WWNpaTJJU2M5a2ZMRXZCQXdMYmhjcFRUTkx3?=
 =?utf-8?B?TnN5TlBnOE1MSHBWQ1oxYU1iV05nV0xkSUdNVU5VWUhZclJmYlZBd3NvNCtY?=
 =?utf-8?B?cXZnSmdOVWVWS0pXa0lQTFJkMUpmT2J0Skc3d2ZQdTVCKzNLY1dPQmJQU1B3?=
 =?utf-8?B?bXl3c1M3cS9aOVBjMTRRMjR0ZkZBMlhCRHNzcDZXeEZTdDJZSEF5T29Ca2Nz?=
 =?utf-8?B?YUpuUGVPWVAzMGFGUkxmV0ZITzBQWlUxcHNKWUc0djNSM3Y4eVlKa2Z1eG9C?=
 =?utf-8?B?bHdFTjFaQzJsRkwwNDhhZzFHUXFxbEd5NFpQNWdhUjZmWDlQTzFzNWJZWk1P?=
 =?utf-8?B?eHVqSVlVcU9ZTXhIWWhJL0dFT25SLzgzQWd2UldURWwvOHZ6Q2JrSEpJVTdD?=
 =?utf-8?B?SU5pWUZ0V3lMY285VWNEb3RQSWdsWkV0UEVCZWpybTMwTUhla1F1Ui9KQU4r?=
 =?utf-8?B?aEZrMGRQZGJEamxmcFQzemZVck15N0JtUzJybnY3NHFRbUxocDFLK21EV1ZE?=
 =?utf-8?B?TldZR1hqejI3QXAwaXEvK3N4WHlxRkltTDIya1VXQk92YmdpRWpTVUhQYUx4?=
 =?utf-8?B?V2JqRVA1eVdGYnJaTDBzcUxCR3V4cDZTNXBleHVzNk4zNDhmTGJOT3o2cHBG?=
 =?utf-8?B?a0Y2eVUzTVY4KzYwQU9DdjJNLzhBcUxLMjR4WHBMc0tvMVVjOWRmZ0xuQUc3?=
 =?utf-8?B?RjlCeUpyQURaZFMzVmtHd2t4YkpmRHBOWDVybjd4M29UQnNzYUlKOU9mVWc3?=
 =?utf-8?B?Um1DWXB6ZXg4dnU5amRKSytyRU5EMlBjK3o5K0lkYjRrVzdBT0dSUzZFMy9l?=
 =?utf-8?B?VWhWTUhGaEdHMnNMY2VvdmVFd1liaHpVcm5Wd3gzQW9hMjRaTmFSdE9NeUtn?=
 =?utf-8?B?U0wxN2xMeVE2OE9FelBYSVNLOWxuQkJpVzlBTUYrYjhvdTVTSzNFeWpvYmYr?=
 =?utf-8?B?ZUxKVkl3bzNEbUtnOVN0S21ONUwwcnBWZDhhMXFRMHB6akM5RllzdmNxanNz?=
 =?utf-8?Q?OYZEw/iId9ZQa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWYrOWFsa205WUNoT2FhYTVLM2x0c0xxaEdYT25jT1FKVytSODZiVmdWVDNM?=
 =?utf-8?B?cTgzQTY2VkFyMHZjOWp2dVdVaUs5bHRBSm1xdy9DVFc4Uy9LSVpseGlBMEFE?=
 =?utf-8?B?K0pONDhlSFlqWVIvaU5sWW5ibUJ6Z2Y3d1liVVZYTVg2L2dsWCs4SXhXZzVX?=
 =?utf-8?B?WXNEYUVoYXpEWHovSkh6UnF0T044cm00NmxvdVRWRTZYYThiM2hmaHhVaGo0?=
 =?utf-8?B?ZjlNbkF1RFlTYUVUTkJRQWw4NFBaVU9BOUxtamVIekxkOU5ENm56SEFSOWlx?=
 =?utf-8?B?UEx3dmtXZnUzL25TZlBlbmRLT0JKckJxeG0rWDArRGhBY1JXVVBxVnV2aTh6?=
 =?utf-8?B?cTR6alpWNmFFTXpQNU5tdWgxNHRnK3d3T0p4bTBqL3ZuQTQyN0lPeE00TmRC?=
 =?utf-8?B?anpZNXY5ZTJua04xNElXV0E4SCt3KzgrQTRwaFNSTHlWWkJYdEtSNU1SaE1s?=
 =?utf-8?B?b2R0cWl1SGVuWTBOZHZlT0NVamRqQ0pBNzNvY2hic09OZE5NOGdROElZZHlQ?=
 =?utf-8?B?Y1ptSkJxZkZmVjhsOEZKeUIxRmJwSmxMMnBGK1NLVHVXcmwxOThEQXA3ajFl?=
 =?utf-8?B?Tk9DdFZndkxoMlFHTFhhRDRpK0NyMlJ0MUNqZU9vSVZYd3VWNm54c2h5NlRI?=
 =?utf-8?B?bmhBVXpXRGwreFllVXEyR0NsTjRpTnlSWVBjSjE0czE3QXM3YjVZeU9lWFVT?=
 =?utf-8?B?Z3ErRXVoOHVZRDhQYXk5b3prbnFIM1JqNHZPUGF3cm85dzEyK1FPcmRWMWlM?=
 =?utf-8?B?Z3A3WVJ2UE9CRWVIUXlOWHI1MXphVFpqZ3AxdGxON3RtWVBsUTl0T1Zwb2Rm?=
 =?utf-8?B?Wk5lME1PR2VuZU5jQ3k0NXYrQkljdG95YWMwQXpUQkFFZEx3MGtTVTc1bStL?=
 =?utf-8?B?VTFIMkw2SmQ5SFV6TjQ0VmRFVU9VdUpjbUtsdENhNS9Rc1RvQnlRWEl3MUFB?=
 =?utf-8?B?TnU3SnFta2ZrSzdicnZEbXdhYVZSWEx6MituZDBnUVBOOW9xYks4TFVKZXNk?=
 =?utf-8?B?NDA5cmNDekNNdVYzbXkzL3N5ZkRjZDVaRWNqOE9lWG4wSGp6VnlOVWVXWmk5?=
 =?utf-8?B?Q2ZVZXFWUG1TRmF3VWNPdGc2RURnd3lZeVBsMnBWZXl6N21GSTdENjJTMkxi?=
 =?utf-8?B?SlFtL1ZJcHkwb1pHdnk2R2J2aVNybUQwVFhvWnR6NUN6TlEzNk9lV202aFUw?=
 =?utf-8?B?bk1OeTh5eXllQVFHdlpGUk91L2RWcHY1MUZPRHBPaG5RbEJvQnk5eWgxMERU?=
 =?utf-8?B?RXhxUWFzWkR1S01hUlBZMzlyUUVSVHQ1V0h1b0w3OWJkdnozVmRjanpXL0pO?=
 =?utf-8?B?L24reWg4TjlwN1Q2RUJmeEtJQWVqcitmMGFVQzcvSkw0VmxVM2c1NjF1cVF3?=
 =?utf-8?B?bGlLUXV5MDltaGdMYUZLbzhaRFIzYjJtc2pPVE8reXhWQ3AzL2hFaFZWdHlj?=
 =?utf-8?B?RWROdHU0c1RpZVdibm1QdTJodUdCbmVaN2ZueGFRaWFrcUhtTFRyQ1RpZkpS?=
 =?utf-8?B?ZyswTnVqV0hUczFYTDgvdS94NU03cG9hWE43VU1OdVg5RUdzWGw3WVZDaW8y?=
 =?utf-8?B?VU9Zbkw2NzhHTWVKTERCdnRyS05DWEl3S29ESHQ1ZE9MeVFmZ2dJWkM3R1Iv?=
 =?utf-8?B?c3FzazJ4OG1XbU1TLzJOR0h1U2wvZ3V1NlJuSjBHemtGb0FiSnB3YU9oRDZr?=
 =?utf-8?B?YjB6V3BLdmxOVWhFeWRJc012cW03MnA1aEhSNldaOUhLdmVvN2dmamx4M3BI?=
 =?utf-8?B?VGZzc21GRTFBSkJRVDJZazV3dlUxU2pMK3dGUTdRWGwxc1NKa1h1MWFncnZo?=
 =?utf-8?B?YndvQU9acHlFNTZCeVE0UmFvVFpJN1B3L2dJejgzamptWitiamJWbnRxang2?=
 =?utf-8?B?WWtEYWxnM3dEaDd4NTJKdGN2UkZpb1ErY2gyR2g5eEhsRU12MXhpL0lVSHhm?=
 =?utf-8?B?QXIyUjduN3dvMGxyeDQ2M0o5ZlB5RDU1a2h3d2NMaDVBZmo0WmtNRWd3MFlH?=
 =?utf-8?B?V2N3NUx6bUo5WkdvckE1MC9qR3VZT3BsZEV1UDlDSEZ6OVZkNzlXelZCRlpF?=
 =?utf-8?B?R3RjazMwS1o1QjFFSTRXNnpxMm5xVkJPeXB5ejVTcG5YTmNlR1lQVlVFWnpp?=
 =?utf-8?B?QnBLaG1XV3I2OUx3NUJLNVJCWWVYOEJtemRIVVp0blYybjZYS1BtT00vZUhF?=
 =?utf-8?B?UWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f6acf9-89d5-48d2-ca5b-08ddb7a2b052
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 06:52:33.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YT2hlOu3KWKepTwNx/c3YBhV7CCXX/TS1+7iDN6sJU04hDqEtJo36P02Lrdu7Q28PEm3eCOuDBLkgU+4NAM5Dffia6celOM5kCn88Kz5eEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
X-Proofpoint-GUID: 7pfECIFMfCWA7L-jXDFCAFtns2LVJIK0
X-Proofpoint-ORIG-GUID: 7pfECIFMfCWA7L-jXDFCAFtns2LVJIK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA1NiBTYWx0ZWRfX1/MurcHSsDtN EDYwNJQPAAckEDWnoaK4IX13FBiMqWGGiT9xn7U31iK68o2Abun80hlVlJFZ8nxAwvOad5s0d5X 9jvuBcFG14MWN9XCE9yXYdCQuYSGR1ZcK0LYNJFGITv90OfyJt1HQpXi4DdCas+N5XeMJ3J05gh
 /gtLS0+XG2xfi5cKWdQGWtAr/Zp0ZtuJxO7NA5GVRaJ6OH8KcHiEFWFIRHo/A8dkSkHtPG6DlcT emY68yj0AE0jkMSp9Ipk+CFYfQ56fwZtCE443junYKAS9S3DmFnvHaKrft27bF1uSm8TJbAVAiX izpEjpaH7ZDox3m3xk4L0UBVEQPnCRHkRWVh8Tl7YtvTvSgOYcQU5uztdvoikQ+BRQVcIrVE1Hb
 i5Z4DnPs/zQhSL0P0/wmPY/n23EaRz3nleF0rKLVjqi7j/htY22RQgvOV0WVNHl8Loc8PqYU
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=68623434 cx=c_pps a=jwBwXe7jPVY/Pk8tSagW2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=QrzIc1ncpklLeBUDSysA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=527 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506300056
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55U4T8xO014012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 06:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118166

Hi all,


When I do the followings,

1. mkdir project && cd project

2.git clone https://git.yoctoproject.org/poky

 =C2=A0=C2=A0 cd poky

 =C2=A0=C2=A0 git checkout scarthgap

 =C2=A0=C2=A0 cd ..

3 git clone origin https://git.openembedded.org/meta-openembedded

 =C2=A0=C2=A0=C2=A0 git checkout scarthgap

4 cd poky

 =C2=A0=C2=A0 source oe-init-build-env

 =C2=A0 vi conf/local.conf=C2=A0 IMAGE_INSTALL:append =3D " postfix"

 =C2=A0=C2=A0 bitbake-layers add-layer ../meta-openembedded/meta-oe

 =C2=A0=C2=A0 bitbake-layers add-layer ../meta-openembedded/meta-python

 =C2=A0=C2=A0 bitbake-layers add-layer ../meta-openembedded/meta-networki=
ng

 =C2=A0=C2=A0 bitbake core-image-minimal


When I do the build=C2=A0 (bitbake -ccleanall postfix && bitbake postfix)=
=20
more than one times, the contents of sample-main.cf in rootfs is=20
different sometimes.


The difference resides in the last two lines:

sometimes=C2=A0 is:

meta_directory =3D /etc/postfix
shlib_directory =3D no


sometimes is:

shlib_directory =3D no

meta_directory =3D /etc/postfix



Thanks

Jinfeng


