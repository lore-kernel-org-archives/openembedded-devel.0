Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91783C27C55
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 08:27:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36921.1717748838872079690
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 01:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6888c8ef97=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4574jHLg001757
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jun 2024 01:27:18 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfxwyx4w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 01:27:17 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4578RHTK028224;
	Fri, 7 Jun 2024 01:27:17 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfxwyx4w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 01:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAKCEja5UDhsSd0TH3QIIXnS4U72m5xqHLEYF48gf4XE7plpFVWsHCN3kWbADgffcV7C7lQ/ISZ1b0FpI5hUjOu/ewzyeSk7OCEsi01qUZHVQbnp5e7edd5/OWl/TWpZ1uonjj8aV7QzH4wDxaZtWu61Irdy/sEXpLDsgpg4o/ESBHFjQlktPEz9AGd+9pmtM3gNFXEkiNZ1VsEi/Fw9oLCsdMrbSupSErXFyzF71+kaWeXamU3zpoCIrF/bqPC7qtxtPQ4FfdYubg9C34cSCObhd1yPGMk/wikrNxSxJH8bx0TOxi5LhMY2ab6osNihsQ3ScjY+KYP5NZeMQzj4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PE/8I04zHjvjZgLtOJlVu4jAwfPJtuuWCxS/bxtX4o=;
 b=KOR/Ue6N3pmNeEA9qd89/V2r9djUoM327x+M/ksvwdl9kvQR+NWSssuhyV1bMsKQz6bPAimjddUCETfbZfdOtAkYQG0nX/vYNk26KR1EAlFRGUEBAURlkJrpAFeeMjoHhU4XN3jg05EZEGHsXvt53eO2eN6Jbw+PZjsafSyUaq8L+8sheMan7vuOSNwAi+fZ7fOTx9tSU8U/vMfaqLS/StOTxHHncvlVLKpiFC9xTgfbp8H9q2RsBoO1rlGIqJlXQKcSL8X1WSTvGPm8cqJOyu8iWm29kdyiEFd0AmqPKk3tVnqTj9EfMu7CldUkcw/DMFdp2htIfNwb/Wm4Fi4sVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by PH8PR11MB6877.namprd11.prod.outlook.com (2603:10b6:510:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 7 Jun
 2024 08:27:12 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 08:27:12 +0000
Message-ID: <5a60b2ad-b60c-4bbf-a1bc-6b56f8e04cee@windriver.com>
Date: Fri, 7 Jun 2024 16:27:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 4/4] daq: fix incompatible pointer
 type error
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240606162307.972946-1-kai.kang@windriver.com>
 <20240606162307.972946-4-kai.kang@windriver.com>
 <CAMKF1soi8GbyLSjoAN5396abY98FoON90f=JSn_doBpvVnQg1w@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1soi8GbyLSjoAN5396abY98FoON90f=JSn_doBpvVnQg1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:404:28::24) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|PH8PR11MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: bb019a22-909b-4ae6-2ef9-08dc86cba10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0JnazFPRkpIL1E0azlPQSttL1gvRjNNMmd5ZUhaZjMvTy94WW9yaTZsU04r?=
 =?utf-8?B?N2p0SjJTQy9ZeWROdHdnREVFTm5pQzRKVCtvUU1hejZIR2tNbnEydU5pakVl?=
 =?utf-8?B?WXRjQmI1MlNzbElMTmtXV0p5V0NVZ3VKNDE4NWZtVlpySWdUcFNkcFNQMEZ6?=
 =?utf-8?B?dk9pRVNOeDVIUkcwRU8rajVGOU5UbTRob2c3eFI0ekd3dDI5d0k1OXpraTV5?=
 =?utf-8?B?U1dyQU5CRklHZk8rNCtRUHFSMjZXSUdLaExYWXdoZXEwMTFISnBqZnlkRTIx?=
 =?utf-8?B?cTRvUi8rTjJGb25VdDdHblZVVEpTZ1RKL0tPV2wxd1pGdHJQOUE5N3B5Z1J6?=
 =?utf-8?B?cnlYTkZWMm5MVS8zZVhOaktTeWRxREhPWkhlSzNZQ2RFYVJyOFFqNWlralQv?=
 =?utf-8?B?bVNmRXZML0RDTWJpTUJoVmZxYi9TaCtLUDA3eWJRM3E2NFhxeG43eDc3Nmgz?=
 =?utf-8?B?K3VxOVlRQUw5MnRYTjJ6bW03TXFTcERKWUtGcmpvaHlDM01HRzcwTTF1VFZK?=
 =?utf-8?B?ZytrdGYxN2FvRC9DSWhrTmxSbW5FaDVINkNqcUx2VTlDSUFtNWQ1N001V0Zk?=
 =?utf-8?B?UnhDMm84WW1GNVNHOVZKOG1QWXpJM0dacEJoWnN0TzNxTFFpcndMTkxXY0pK?=
 =?utf-8?B?ZGZrWTJCcnZ2SkY5MCsyQXA3S0hmMXpQQUJWb3g4WkV4SnQxcTh0VUdwY0Jn?=
 =?utf-8?B?N3ExK0ttcjR5RFE0WG13bkhWWExEUnhKdjBqMXFkYkJna3hSWC95OVZPdVJp?=
 =?utf-8?B?VTFCcnFXeEV1d01ad2VXUG40NVFsNVdXaHRnelM3akluWFhsOWhwUlVTQkFo?=
 =?utf-8?B?ZXd6eXNZbUZjWU9hZEVMYmp2bW5pSzJMTTdvODU5aGxYdDhIU3VSK3g1OUxV?=
 =?utf-8?B?ZzVQTmR0b0R4OFV0eGVpWGd4VzA0SzgvWXRydWs4UzVkRkRTYnljUTU2L3FJ?=
 =?utf-8?B?bmptUnhpY0I0OHBLQXRQUW4zc3J2azBYUXVXUDVKMXlYeHpxUTJNcFBUN1dn?=
 =?utf-8?B?TjRZNDRTdkhteUV2Yks0UTM4VmJ4cnBLZjRDWmwyTkxFcjQwUlZQQXo0RVQr?=
 =?utf-8?B?ZklkTFU2VkZyUGpUOWF0RGwxcjg4Y1dLV1VpVTJDcFd5Ymk4N1dpT1VZcnly?=
 =?utf-8?B?dU1jdHRvRnpzSUpscEE3N3hoU2UvTFNkZW5Bd3VhMEVWbjh2YWRKWXZnVlFs?=
 =?utf-8?B?YkZlMzYxUTV6QnNoNm52VElLaFZaWno3NHE4bkM5Z3hFWmVzVzF6Z0ZBeU1N?=
 =?utf-8?B?N2dUaXhEcnl5YlcrNjNXWW83d0VkVFNLdU1BUXpLWkp4dWFrSGdvbWlseWg2?=
 =?utf-8?B?SUZ6QTdJNTRNSXgvVFFlTDRTNFRpVWFrTEMrTC8wUTBzSTlOZGhia1ZudVMv?=
 =?utf-8?B?b0J0aG0zN3F3eE44c1k2bWdxQ2I5bWlxYndpUC9vV2h6TTRERTZOOTBLNERQ?=
 =?utf-8?B?VXM0aC9pQms1bkJGamtVQUVBS3gvbGtXSVN5N1NJZml1R0djeldhL0lZbWpB?=
 =?utf-8?B?Tlg0UnBQL0ZkWU0wYURVS0tXVG1RVGVsVW8xRDNCQ0ZUZ09RbkhtT083Mlkr?=
 =?utf-8?B?ejEzMWwxOUpENkZhY29VNGZGN2Y5TXNUZnFOekdlWFNMZzEvWTdhdmhNVG5L?=
 =?utf-8?B?c3pidC9VMGdPSjV0ZUxuTTNtVGJHUlZxWnNxbC9uTnh4b0NaamMrSG9zVzk1?=
 =?utf-8?Q?XEo+bk3ypzijLNspQLzB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RElnUGtvL3hFanJlenllb25uWVVSU0VQUmNQL0NVcFJ1YkRuMVAzMEtPT2NW?=
 =?utf-8?B?a2p3ZXhQZlViRS9PN2l4U3lhRzJUUzV0K3RpamtNckp2SXd1d2NYSm5DS256?=
 =?utf-8?B?WVVycS9uTSs1SWszcmVQR2tCb3dEMngzR2plRHFOcStrR1lycWwyNWtNalVB?=
 =?utf-8?B?TlFQbzNpenYrNGdielEydGdSUzYrSktDenZvWmFXckhvNzc5VmxobmRhNFlZ?=
 =?utf-8?B?elhORXVoeVBhQmtyZE5pWkVTdDhiTDRFUnNpL2EyUkt5N2pDMEJ3QXVBdFRD?=
 =?utf-8?B?Umk2K1F5MExTbVpuT3R5cUIzNkYyREFta0w2RzdreG5mQXRvaTZQdUpJK0RN?=
 =?utf-8?B?T25OS2lXS0dSd0g2aVFwWmQ4Yy80RnhkVEphL25yOHlaOFBMOHFqVHJjaDRM?=
 =?utf-8?B?cElteFBDdVFaTDhpT3ptN3VzWmVFZWJ0d29MVDZZWng4d3M4TFhtdWpTcGw4?=
 =?utf-8?B?bng5RXlJWGpaVkpPczhGZU1lTnd6ZzBnRU5HYUpZaFEvN3BTOEdaT3lMbWtx?=
 =?utf-8?B?bUNRSURZbTI1Zy9zeU5ZSWJKL09GT0lqa3Rla1VUZG1GMzd6ZEdWRkJoLzBJ?=
 =?utf-8?B?VjZsdDJJS1lsdGF3YmEyU3l2bjhhTDhLOW9udGc0b1MyT0x0ZFQyczdGTkdN?=
 =?utf-8?B?NXUyVkd3dFpCaW00OVRaMXZTdHMzbHpKUWhBOC9UUldzVEp1aDRGTUlmMVpE?=
 =?utf-8?B?b0ZHOEVac3lJZjNWYWxEMEdEUnJpTXpBV0JPYXNqLzNHcFdDZ25pRjJ2b1B4?=
 =?utf-8?B?QlV1eS9zSGdLUTc5OGtzbDZEL1NDdHBGWEVJKzlWYzdFMUljZUF5K1didlAr?=
 =?utf-8?B?N1BNei84M1lLR2hLQkdDUmJQYWduUnBucXNXcTBGRUFYd2o4UTFNZTg5UE9t?=
 =?utf-8?B?bjJBdmlodGtOLzlqWkhqaTlnbXZSa1Z5T0hRcHBoYkhUQXFYNkJpYWlwUXhk?=
 =?utf-8?B?MDFqWWllUHN5SkpmT25NYzBmcmFXMm42UWw5SUVkaGEzcXJxV3ZkUU5NMHl1?=
 =?utf-8?B?VW5EZUVjM1FNTFIycTEyTndGQjhkKzJGWk5nVmVVTDR5dHJRWE52Sk9haXZZ?=
 =?utf-8?B?Tk10T3cwS1RFcnByY1BPMk01WXllYnc3OGUwVmpDTngzL1AzS0crSjNlT3dL?=
 =?utf-8?B?aFZyVzZUMUp0ekNrczVsL2IvdlZteGRaLzhuZDltRjZ6VmplcUk0ZzJzYU40?=
 =?utf-8?B?ZmYvaitwTFkrNFU0aklmdEdpMGM2Q1pVMzBBRGtDV2cyT2Mrd3BQSkplbStk?=
 =?utf-8?B?NktITmJyUGhQSlRJVklCc2RkdFJ5T0d2bTg3aHJ1VmtEZlpCcXZidkh1K3Nw?=
 =?utf-8?B?UzJpblJEM2QrUy9ZRm5aMkg0bjlIRTk0NFpqMUVBUGYyZnRmWjBDUVRFVUhs?=
 =?utf-8?B?LzVZRU5EaDIvN1l2YUZqRnZRcHFyQ1hBcnNHN2xoellOaDRqcXdpL0R6QU1N?=
 =?utf-8?B?Q1dURVVNR3JYT2tIMy9vZWpVMEJzZ0RjOTQrakNwNTBFVkVIM3o2Qko0cW4z?=
 =?utf-8?B?UFdFRlBwZFdlT0QrZWhMdk1DbmNzbWE1dFRPSzlNblRzZlQzOFRvSFBPZWw0?=
 =?utf-8?B?YnVFbmpvdVdRU3IrcERiaDg3MjFqVXI2cys2emdiM0FDR1I5a0FDUzJKVUZT?=
 =?utf-8?B?QXZEbExmOVAxOEhNWGN6dzhYR1pwQmJoWE9HUWZNcWMyRjgralg5SVVic1RT?=
 =?utf-8?B?SmI2MFNNWm90eGEyVUZFZ1pvQkpyVGVvekpBL2FqQTJidUZraEQveUV5QThH?=
 =?utf-8?B?UnNTejJMUWs2YzRQQnRHUVhRM3FFRzlvdFFqQ0RvSDJ2enFGSGY5S1Fnai9E?=
 =?utf-8?B?QzNJMUh0dko3UFA2YUhyS2lwdEtRSitiMndNNDE4bTlmUEphT1dhaXp1UEJm?=
 =?utf-8?B?Nm5ZaE9EeHRxZG5xVVlwcDh1cEYzWmxhbXZ4V3NpZnJtTUdzZnhFVVY3Rys2?=
 =?utf-8?B?ZXdSaHZwbUVzczZTak9hS2xkU1ozdkFOZWw2RTZuL2pvY0xId1cxWGd5VVJ1?=
 =?utf-8?B?cVBONzZnU3k1VU5OTGNZQWRUZ3BhM3cySDYyUWg1bVlyTlV6VzNPVm1rcGdB?=
 =?utf-8?B?ME9kMm1jcVhqMTlYT1gyWWlXMEtlQlkrdmdJQWJPV3Y3c1RmZnpzZlJKa1d1?=
 =?utf-8?Q?AncFAZGRWNl+nEIAxPjioYqZA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb019a22-909b-4ae6-2ef9-08dc86cba10f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 08:27:12.0419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iChmAIcHCIpjcKef4RFY61QI8xkT0Xrs+vtazScwU1ca6QWPxsFa0LFBR+T95Hh5SuPRuREl3HV3bUVpTEh8Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6877
X-Proofpoint-GUID: AWm2z4hJC0eZTQC1FLQOXNpUQuprY4vn
X-Proofpoint-ORIG-GUID: CZm4zd1kNpDmaDrfVZNTLcENZHTEX3pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2405170001 definitions=main-2406070059
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4574jHLg001757
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 08:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110763

On 6/7/24 00:32, Khem Raj wrote:
> On Thu, Jun 6, 2024 at 9:23=E2=80=AFAM Kai Kang via lists.openembedded.=
org
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Fix incompatible pointer type error for daq:
>>
>> | ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
>> | ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argu=
ment 2 of 'nfq_get_payload' from incompatible pointer type [-Wincompatibl=
e-pointer-types]
>> |   394 |     int len =3D nfq_get_payload(nfad, (char**)pkt);
>> |       |                                     ^~~~~~~~~~~
>> |       |                                     |
>> |       |                                     char **
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../recipes-connectivity/daq/daq_2.0.7.bb     |  1 +
>>   ...-fix-incompatible-pointer-type-error.patch | 30 +++++++++++++++++=
++
>>   2 files changed, 31 insertions(+)
>>   create mode 100644 meta-networking/recipes-connectivity/daq/files/da=
q-fix-incompatible-pointer-type-error.patch
>>
>> diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb b/m=
eta-networking/recipes-connectivity/daq/daq_2.0.7.bb
>> index 66ad83f71..8cb4c04fa 100644
>> --- a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
>> +++ b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
>> @@ -11,6 +11,7 @@ DEPENDS =3D "libpcap libpcre libdnet bison-native li=
bnetfilter-queue"
>>   SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
>>              file://disable-run-test-program-while-cross-compiling.pat=
ch \
>>              file://0001-correct-the-location-of-unistd.h.patch \
>> +           file://daq-fix-incompatible-pointer-type-error.patch \
>>              "
>>   SRC_URI[sha256sum] =3D "bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9=
abed609927ae13a7705e"
>>   # these 2 create undeclared dependency on libdnet and libnetfilter-q=
ueue from meta-networking
>> diff --git a/meta-networking/recipes-connectivity/daq/files/daq-fix-in=
compatible-pointer-type-error.patch b/meta-networking/recipes-connectivit=
y/daq/files/daq-fix-incompatible-pointer-type-error.patch
>> new file mode 100644
>> index 000000000..5a02d1615
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/daq/files/daq-fix-incompati=
ble-pointer-type-error.patch
>> @@ -0,0 +1,30 @@
>> +Fix daq incompatible pointer type error:
>> +
>> +| ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
>> +| ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing arg=
ument 2 of 'nfq_get_payload' from incompatible pointer type [-Wincompatib=
le-pointer-types]
>> +|   394 |     int len =3D nfq_get_payload(nfad, (char**)pkt);
>> +|       |                                     ^~~~~~~~~~~
>> +|       |                                     |
>> +|       |                                     char **
>> +
>> +Upstream-Status: Pending
>> +
> please submit upstream as well
It seems daq belongs to snort2 which I don't find any git repo for it.
There are git repos of snort3 on github but none for snort2.

Regards,
Kai

>
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +---
>> + os-daq-modules/daq_nfq.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
>> +index 4de94b6..a6de2f3 100644
>> +--- a/os-daq-modules/daq_nfq.c
>> ++++ b/os-daq-modules/daq_nfq.c
>> +@@ -391,7 +391,7 @@ static inline int SetPktHdr (
>> +     DAQ_PktHdr_t* hdr,
>> +     uint8_t** pkt
>> + ) {
>> +-    int len =3D nfq_get_payload(nfad, (char**)pkt);
>> ++    int len =3D nfq_get_payload(nfad, (unsigned char**)pkt);
>> +
>> +     if ( len <=3D 0 )
>> +         return -1;
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110752): https://lists.openembedded.org/g/openembe=
dded-devel/message/110752
>> Mute This Topic: https://lists.openembedded.org/mt/106526692/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


