Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA2FC25B76
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 10:06:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3806.1717841171614855132
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Jun 2024 03:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=688978f826=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 458A63U4021701
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Jun 2024 03:06:11 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk282pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 03:06:10 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 458A6A38021743;
	Sat, 8 Jun 2024 03:06:10 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk282pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 03:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4ENuo/QUUxRJM3whlmTlo4Esnp2rWqru5yz0OUspC9JGupJSUqDN50d9nPOWwaVy8orhWVd3Nk3Y+YmY3n5paGihufVvu8XNWIbWqD7UMe1iJWnZZ6rjKhJPLhjMd8VA6iTgKZGAyITkTCvVFQcXxOuBzCwgSFKujTooSG3niFu1B8MCZOiPlEqshRcTMG2BzK3AuRU7dNkfsvvLfG5xd+Yv8mLK75X2k9FmAVrh65Xn+bXDwafiVJ92Wmod9/p0jdB0hZJfUknWevVnU1yrNlEz6rXM6BMbCoo0F1VqgyItOUa2RYkribBfpU8cWrwKjbPaJ3wKJsY/DM4biihPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJa8BEjr3JfpzbXCqPhNAkZeOWsYTfp1aMVKziCkW88=;
 b=J/AKaUSVFYzXQx/H2nhnZyVx9+6fZg5qEFb3iTMgfLHvh0jxaAAKCLJM1Il3E+q8Ze2I6ZUltJp1tlqFsHPVQxlij2/tFnHpsXcKRY8YNt6CkfrAXeEBw/VucDukv9R1JOkGUA76bjNFj1yZA9+IY5G3fwMuvBvPuBuMRpOE+IvXSFjAB2ZQkC1kgb+jNz+qCudItAKCvBk8St98HS9ud3QJBRayBxNVkhYVg04uh+oajyy60x4+6pbbHyQKTdkiL5ckL511W1tWEMXm5cXWRTlGmq221hkRed8Rs3qJR/bwNVOcOo0d5WakoNNpx//SeJbJgqE92Lo3uv98XhJM+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by MN2PR11MB4549.namprd11.prod.outlook.com (2603:10b6:208:26d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Sat, 8 Jun
 2024 10:06:06 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7633.033; Sat, 8 Jun 2024
 10:06:06 +0000
Message-ID: <633c6e80-d164-4be6-a2b0-dc843e3bef07@windriver.com>
Date: Sat, 8 Jun 2024 18:05:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/4] uw-imap: fix compile errors of
 incompatible pointer type
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240606162307.972946-1-kai.kang@windriver.com>
 <20240606162307.972946-2-kai.kang@windriver.com>
 <CAMKF1sq_k6mYr5bp5J0kt0UO14wbtKyUeBox3iZkuZ9Vj6ztFg@mail.gmail.com>
 <b3b42523-5dfa-44ba-a50f-e3bc0904fa95@windriver.com>
 <CAMKF1sraL2hMj06iABhmyN65MunnHikWh1mDh0KPmAtiE-eP2Q@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sraL2hMj06iABhmyN65MunnHikWh1mDh0KPmAtiE-eP2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0153.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::21) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|MN2PR11MB4549:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f3d3b9-9a3a-4481-606a-08dc87a29ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UjVPSlhxYURJTkN2T0pZK3lUSVFNMzVNak01TS9zcllML0lNK25pUXUvYURM?=
 =?utf-8?B?TTJVZDVvRU5pUVVGeEgydE8vK3NmMmV6MUR6NHNaYXZoT1hPeks1NjlZeDZD?=
 =?utf-8?B?ejB3eHZRbGhqdWI5RG1jMzhuNWZLQVdvYWZjamk4OVN4VUhGTjhMRFU5QmVI?=
 =?utf-8?B?OURXUkZZVmhuV3RyNFJPc2s1UzFsMEhINU9iMGZZTVdsTm1pdzN6c2hRdzlo?=
 =?utf-8?B?ejVDWk5jYXlRcStONDlXUXFDdVhBRkRGblVnamhJeTZReGQ2a3JhdG1FbUVK?=
 =?utf-8?B?VFVQVVhndkxCZDVvU0tKU2twYjcwQldhNGpxaVVzc1dMSGVUblAxS1o1TG1Q?=
 =?utf-8?B?K21Ja2hqWlVQLy93SjA2Ykp4OHdSWGlBVndkcGRiYnk2QjlyYWNac1hxam5K?=
 =?utf-8?B?dmZZWWIyNVNhcmtsdEY3UjhDeU1rR04zQkJUcWFHYml3QXp1WVNtY1hLNGww?=
 =?utf-8?B?dHVtcjJXMzRyTHlLVFN5QzRtU29YdzgrcVFxU3p2dS9pekxOYkpoaU03cVFT?=
 =?utf-8?B?dHFpUlR3S3JXK3F4TGVaMTlWQ2RCUDh5bGVJQmcrMzRxVlMyaysrOEhkVUh5?=
 =?utf-8?B?U3FrNnUyWnJJVk0xanVwQjFwaHhTR1pRNXpXYnpQNFAwY0hVcy9ieTdNOG1X?=
 =?utf-8?B?ZU8wdFEwaFZJU2tRcjVGcmUyZHQ5R2JXN0N5T25NM0xLYUY3RHJ0bGxTeXc5?=
 =?utf-8?B?UEFCTzArVEpLajJZanR5UXRDWGJWbkQ5ZnRzc1E2eVRMY2s2aUkwd2FyOENw?=
 =?utf-8?B?dnJwU3JQOFp1QWF4SW9XOVp6S2RSM3NyeVIwM04yVDlYa1B1U2h4eDdLQUVK?=
 =?utf-8?B?cEhyaXI5Q2FkSmc5c1BINHFZQnVtRTBvT2w3NkNHM082VzNWNDlXUE55amlX?=
 =?utf-8?B?YUVxRmVhYWJ6L1JBam0wa2NiR2RPSXdodG5OdUlNK2tiWE5jM3F6YlUyMzZq?=
 =?utf-8?B?dUlrZVhFRDlrcE1CUG5OUjJSNkl1alJPNW45aExZUUtPYXJncjRhVlFLTWZm?=
 =?utf-8?B?Qk13Nmp4Z3RFVi9GSmo4dDJoUGY3QmVYaUVDK29IY0xnWkRSYlp5cDJpQXp2?=
 =?utf-8?B?Mk45UmhzL2lTaTJhait2OVd3dGo2VFo3eE9yMzQrMXErOVdDaWZQSlFLc1Yv?=
 =?utf-8?B?UGhkTXdhZnhTQ0dLc0lDdk9rdzhDUFcwd0Zad05oUEsvUEg3Rllrbk1FajBQ?=
 =?utf-8?B?Rzcrc0J3VElHYkI0b2RpbkVZMk5yVWtwNnpMY2ljMzU5S29Ud0RGa1NKNi9R?=
 =?utf-8?B?OGcyemQwRC9yb3RDZktsZjNuSnQ2eDN6b3dDd0xNYWFab2VKN3p2aDJPWFVT?=
 =?utf-8?B?c254Sjh0ZWtMRnBUdUNrbmxoalZWVnhOZ0JyNFFrM1RZNVNtd0ZWbTRaL1RJ?=
 =?utf-8?B?N04zQkF5K0RydWtKWWxFWlljQXVLeW5TMjJ3eE5YZzJtV291NU9kTkxMbXhQ?=
 =?utf-8?B?MU1XWDFKR3B0UXB1TFFhM3ZlR1NPYnpEK0dwUHI3d2NkR00zelRIVWMrbkl1?=
 =?utf-8?B?VldrVVZYSzg4VjUzUFEzUnk4aDBrTUx4bjNra1RybHdZbFpGbGNRQVlSN29O?=
 =?utf-8?B?WjljSmFzUUlIZGJNaTBPVHN3YWh2UnI3YUV4SlFtelluRVY0Vmg3KzFOUzNR?=
 =?utf-8?B?bUs4bkxDUnAzNjJrTm5ESzNsWTdtK2swN1V6dHhZbDdKMmFWSFV4Q091ckN5?=
 =?utf-8?B?VWhNblFSanBUNnVwaVEvbDlTY0dOSEp3b2djMFZtZW1yUTUxRkZGRWd3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eVRwWmg5a0xCeEZORURISkJzS1hxYklCTHV6dWxFeXNPWHJYT1U0R3M5bExG?=
 =?utf-8?B?REttRjJZNDAya051b0NmUnM1dXdkKzJGaWdFMXJTeWpQVmtJNUt6b3hCWWww?=
 =?utf-8?B?MDRpbHRWT2dNMDVza0FqWXhDdVpCTjdzWVN3MTRQNXZGWlQ2aFd3bnFMdUpu?=
 =?utf-8?B?SG1QZkRURk9GQXBiR2RnTWVVd2dMQ2xBMkx6TUhlWWF4QXVTSXRhVEZhSFd3?=
 =?utf-8?B?UkpyU2JmMnlTZkMrR0xYZ3dBTzJja3dEbDUxdFVvcC9nT2d3VUZ2V1VpUHlJ?=
 =?utf-8?B?V2kvNDFIWTRLOGZTS2ZXVmlxdHo3L2h4LzBoaW9mQnQxZmh2Z2ZpVG1aMkVm?=
 =?utf-8?B?NHpDNHBVWmVGWW9yL2wxRDVob0hvTFR5V1YvTFY5U3gzTXh2a0EvUHFBb1RN?=
 =?utf-8?B?VWxzUXh1Y1Y1QjQ0Y2lnTzljUHpUWndZLzZNMXE1U2hvaTlDMDRWSkxaYVBQ?=
 =?utf-8?B?Q0E5VVF2cjB6a0cvdDdLdHBGVlhDRDg0akNoVzdGQU96UDNUcXV1Qm1LOEE2?=
 =?utf-8?B?TW53c1hCWHJmeXl1NUhGTkhhdC93NlJ5TzQ4d2lndWdOTko3SnZyZzR0S1Yz?=
 =?utf-8?B?SVkvekpuVUV1MUUyMWJrelg1U3FnYXlVRmFTUUMzMkJpbjh4akdvRnd2ZzN6?=
 =?utf-8?B?SldaY3ZjOXNpTlhCRktpakxDaExEdEJONmpWYnNKazJTOG9UeTloRnVIQjRL?=
 =?utf-8?B?MkxRTUdaalBYbzhDSnRFamw5MnltaG9Uczc0ZkNZdUZZdnNLVHhvRUR2VGxt?=
 =?utf-8?B?SzQvUURXNWxLZXhaYjFrbU5MUWVCblJSUTR0REc1OEhlOGFubzNjYlA0TVpR?=
 =?utf-8?B?ajR0Vzc4YWFJQUNRNkJMWWtOR0ZJV0p2Z09Kdk1iaW5JV01XMGptT1g4eWcw?=
 =?utf-8?B?RmFram1DOFlhQnRISzVlM2ticzRHUGFPdVdKWWpJdktVVHVreWNQUk9CZVZj?=
 =?utf-8?B?d3h5TTJOS3ZMdEY2VUFDWFFqT3hrVFdPTWw0djdsWllNWDRja3JOdmFWTzRs?=
 =?utf-8?B?aWo2bVczNkpqUXcvd3lFbDNIWmhqQVZxVFlDdUlNUHdsUkZNazQvZ2tDVGtQ?=
 =?utf-8?B?OWo1OUFVMXlERHVuck1nd1FuUFBjYjlpOWpMZ3MvcklLL25GWURZdFhqQ2Vs?=
 =?utf-8?B?M3FnL2xtSVMvODlSTEJIYXRzOWVRSDRFV1VUcnAxU0dZVWhXaDVMd0l3UG9V?=
 =?utf-8?B?YnZxSXpxWW9zaFcwUzlkWVUyQUlHVnRBUVZBY1JhQ2owdlFmWVJyaERhT20x?=
 =?utf-8?B?dGIyekRrV2JtN2gxVDNjMmhBYVJDdmE3NDlZcVJxMEYrdXJvSFVwVWJXeERJ?=
 =?utf-8?B?WjY5VU9jTkhvRDA4OUR0Q2U2bVFrUWxZQlBKL0V1L1gxeXpKTnBwa2krSXVm?=
 =?utf-8?B?OHErY0NlUkJyTTdtTnFkakRXcmtnYVpFNmVXa2pteTVrQ3Q0cTFsMVhTWHZY?=
 =?utf-8?B?VGwxNGErVlFUM0duOU9KckYxR2I2MFFJL3YvT3lVbHlJYitCZmlzbFdERURj?=
 =?utf-8?B?Q0RaZ2E3aFlHOElQMVBXTDd3UUkwOERPeUYzTWQyWUw2elR6b2ZUQnZJVGNj?=
 =?utf-8?B?eU9QRUVYTTVCM3AwTTZCSTlydG85eGlIM21jWFRWQUxwTy9hUmxtU2V1UFFC?=
 =?utf-8?B?aUpta01OU2dEb0c4WnMvSi9XRE45UzFPQzZzbTBjbDVudmcyNzdyWmtjeDNI?=
 =?utf-8?B?a0ZkQnMyMTVtdVlmdlZxLzdVaXB3aHh1VXFMS1YwNk81eWErSzN0N3crREZs?=
 =?utf-8?B?MG94d3N0aG01T1hHLzFCcVU0aFRCKzk0T2FKcDhpMjdWL3d0dkhQQTZHMDNz?=
 =?utf-8?B?N3I4QkhEQ3dUUEhlVW03dVI1dS9xSFhCNCt3eGE4ejdkdDNxWGF0dnBwV0ZD?=
 =?utf-8?B?OTk5T1pDTUhhdUJOdERSUUV4OGtGVHN2MEorOVF0UTdvTFNsOEE2ZFd0bGZ0?=
 =?utf-8?B?VEVQWFlITGlIeTZxN1BMK3NNQmU2c0NHU21xalBicnpHNGVQNWJOUTFPRWZD?=
 =?utf-8?B?RnRCK2NwcTJ6Z1htL0Z2MnB6MWVLaWdPZmhqNXQvOGR2cG1LRVVMMGNnNm1P?=
 =?utf-8?B?QWVzeXdQR0czQldqT3NxaGZXazhSVE1aT0JuOUlQN2c4SlhWeWlURDlmcEl6?=
 =?utf-8?Q?Et8u13DakeLr7jEXlE0k8aXZM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f3d3b9-9a3a-4481-606a-08dc87a29ca4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2024 10:06:06.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHevsnO2hIanI8BmgjJJsl9MrkZr1CAHQJkzWJNEZp33zReZ27y2oYnGrMQK3v+mB8UbMWe7iJcvJQOZh4q2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4549
X-Proofpoint-ORIG-GUID: FHSyZHnnwX25KHXqHs7EwmZNfDhpXJKg
X-Proofpoint-GUID: BXagvlA8vxlNMfuYsm-f_hsTNEuJH7Ge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_04,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406080074
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 458A63U4021701
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 10:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110774

On 6/7/24 22:05, Khem Raj wrote:
> On Fri, Jun 7, 2024 at 12:56=E2=80=AFAM Kai <kai.kang@windriver.com> wr=
ote:
>> On 6/7/24 00:29, Khem Raj wrote:
>>> this patch is good cleanup patch please submit it upstream as well.
>> It seems uw-imap project has been stalled and no upstream to submit.
>> Other uw-imap
>> patches have 'Pending' status too.
>>
> Thanks, in that case update the upstream status ro reflect
> Inappropriate [Upstream dead] or something
> pending means it should be send upstream at some point.

OK. v2 will be sent.

Regards,
Kai

>
>> Regards,
>> Kai
>>
>>> On Thu, Jun 6, 2024 at 9:23=E2=80=AFAM Kai Kang via lists.openembedde=
d.org
>>> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Fix compile errors when gcc option '-Wincompatible-pointer-types' se=
t:
>>>>
>>>> mx.c: In function 'mx_setdate':
>>>> mx.c:1286:15: error: passing argument 2 of 'utime' from incompatible=
 pointer type [-Wincompatible-pointer-types]
>>>>    1286 |   utime (file,tp);              /* set the times */
>>>>         |               ^~
>>>>         |               |
>>>>         |               time_t * {aka long int *}
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>    ...-imap-fix-incompatible-pointer-types.patch | 354 +++++++++++++=
+++++
>>>>    .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
>>>>    2 files changed, 355 insertions(+)
>>>>    create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-im=
ap-fix-incompatible-pointer-types.patch
>>>>
>>>> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-in=
compatible-pointer-types.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap=
/uw-imap-fix-incompatible-pointer-types.patch
>>>> new file mode 100644
>>>> index 000000000..7146fbbeb
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompati=
ble-pointer-types.patch
>>>> @@ -0,0 +1,354 @@
>>>> +Fix compile errors when gcc option '-Wincompatible-pointer-types' s=
et:
>>>> +
>>>> +mx.c: In function 'mx_setdate':
>>>> +mx.c:1286:15: error: passing argument 2 of 'utime' from incompatibl=
e pointer type [-Wincompatible-pointer-types]
>>>> + 1286 |   utime (file,tp);              /* set the times */
>>>> +      |               ^~
>>>> +      |               |
>>>> +      |               time_t * {aka long int *}
>>>> +
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> +
>>>> +---
>>>> + src/osdep/unix/mbx.c       |  12 ++++++------
>>>> + src/osdep/unix/mh.c        |   2 +-
>>>> + src/osdep/unix/mmdf.c      |  10 +++++-----
>>>> + src/osdep/unix/mtx.c       |  16 ++++++++--------
>>>> + src/osdep/unix/mx.c        |   2 +-
>>>> + src/osdep/unix/tenex.c     |  16 ++++++++--------
>>>> + src/osdep/unix/unix.c      |  10 +++++-----
>>>> + 7 files changed, 34 insertions(+), 34 deletions(-)
>>>> +
>>>> +diff --git a/src/osdep/unix/mbx.c b/src/osdep/unix/mbx.c
>>>> +index c8a45a5..0a587fe 100644
>>>> +--- a/src/osdep/unix/mbx.c
>>>> ++++ b/src/osdep/unix/mbx.c
>>>> +@@ -302,7 +302,7 @@ int mbx_isvalid (MAILSTREAM **stream,char *name=
,char *tmp,int *ld,char *lock,
>>>> +     if (sbuf.st_ctime > sbuf.st_atime) {
>>>> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
>>>> +       tp[1] =3D sbuf.st_mtime;
>>>> +-      utime (tmp,tp);         /* set the times */
>>>> ++      utime (tmp, (const struct utimbuf *)tp);                /* s=
et the times */
>>>> +     }
>>>> +   }
>>>> +                               /* in case INBOX but not mbx format =
*/
>>>> +@@ -776,7 +776,7 @@ void mbx_flag (MAILSTREAM *stream,char *sequenc=
e,char *flag,long flags)
>>>> +        stream->user_flags[LOCAL->ffuserflag]) || (oldpid !=3D LOCA=
L->lastpid))
>>>> +       mbx_update_header (stream);
>>>> +     tp[0] =3D time (0);         /* make sure read comes after all =
that */
>>>> +-    utime (stream->mailbox,tp);
>>>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +   }
>>>> +   if (LOCAL->ld >=3D 0) {               /* unlock now */
>>>> +     unlockfd (LOCAL->ld,LOCAL->lock);
>>>> +@@ -1075,7 +1075,7 @@ long mbx_copy (MAILSTREAM *stream,char *seque=
nce,char *mailbox,long options)
>>>> +                               /* else preserve \Marked status */
>>>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime :=
 time(0);
>>>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> +   close (fd);                 /* close the file */
>>>> +   MM_NOCRITICAL (stream);     /* release critical */
>>>> +   unlockfd (ld,lock);         /* release exclusive parse/append pe=
rmission */
>>>> +@@ -1213,7 +1213,7 @@ long mbx_append (MAILSTREAM *stream,char *mai=
lbox,append_t af,void *data)
>>>> +                               /* else preserve \Marked status */
>>>> +     else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime=
 : time(0);
>>>> +     tp[1] =3D sbuf.st_mtime;    /* preserve mtime */
>>>> +-    utime (file,tp);          /* set the times */
>>>> ++    utime (file, (const struct utimbuf *)tp);         /* set the t=
imes */
>>>> +     fclose (df);              /* close the file */
>>>> +     MM_NOCRITICAL (dstream);  /* release critical */
>>>> +   }
>>>> +@@ -1446,7 +1446,7 @@ long mbx_parse (MAILSTREAM *stream)
>>>> +     time_t tp[2];
>>>> +     tp[0] =3D time (0);
>>>> +     tp[1] =3D LOCAL->filetime;
>>>> +-    utime (stream->mailbox,tp);
>>>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +   }
>>>> +   stream->silent =3D silent;    /* can pass up events now */
>>>> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox=
 size */
>>>> +@@ -1814,7 +1814,7 @@ unsigned long mbx_rewrite (MAILSTREAM *stream=
,unsigned long *reclaimed,
>>>> +   fstat (LOCAL->fd,&sbuf);    /* get new write time */
>>>> +   tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>>>> +   tp[0] =3D time (0);           /* reset atime to now */
>>>> +-  utime (stream->mailbox,tp);
>>>> ++  utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +   unlockfd (ld,lock);         /* release exclusive parse/append pe=
rmission */
>>>> +                               /* notify upper level of new mailbox=
 size */
>>>> +   mail_exists (stream,stream->nmsgs);
>>>> +diff --git a/src/osdep/unix/mh.c b/src/osdep/unix/mh.c
>>>> +index 9264624..26f3539 100644
>>>> +--- a/src/osdep/unix/mh.c
>>>> ++++ b/src/osdep/unix/mh.c
>>>> +@@ -1279,5 +1279,5 @@ void mh_setdate (char *file,MESSAGECACHE *elt=
)
>>>> +   time_t tp[2];
>>>> +   tp[0] =3D time (0);           /* atime is now */
>>>> +   tp[1] =3D mail_longdate (elt);        /* modification time */
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> + }
>>>> +diff --git a/src/osdep/unix/mmdf.c b/src/osdep/unix/mmdf.c
>>>> +index e962434..c0adbee 100644
>>>> +--- a/src/osdep/unix/mmdf.c
>>>> ++++ b/src/osdep/unix/mmdf.c
>>>> +@@ -379,7 +379,7 @@ long mmdf_isvalid (char *name,char *tmp)
>>>> +       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf=
.st_atime)) {
>>>> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
>>>> +       tp[1] =3D sbuf.st_mtime;
>>>> +-      utime (file,tp);        /* set the times */
>>>> ++      utime (file, (const struct utimbuf *)tp);       /* set the t=
imes */
>>>> +       }
>>>> +     }
>>>> +   }
>>>> +@@ -1131,7 +1131,7 @@ long mmdf_copy (MAILSTREAM *stream,char *sequ=
ence,char *mailbox,long options)
>>>> +   else tp[0] =3D                        /* else preserve \Marked s=
tatus */
>>>> +        ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.s=
t_atime)) ?
>>>> +        sbuf.st_atime : tp[1];
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> +   mmdf_unlock (fd,NIL,&lock); /* unlock and close mailbox */
>>>> +   if (tstream) {              /* update last UID if we can */
>>>> +     MMDFLOCAL *local =3D (MMDFLOCAL *) tstream->local;
>>>> +@@ -1292,7 +1292,7 @@ long mmdf_append (MAILSTREAM *stream,char *ma=
ilbox,append_t af,void *data)
>>>> +     ret =3D NIL;                        /* return error */
>>>> +   }
>>>> +   else tp[0] =3D tp[1] - 1;     /* set atime to now-1 if successfu=
l copy */
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> +   fclose (sf);                        /* done with scratch file */
>>>> +                               /* force UIDVALIDITY assignment now =
*/
>>>> +   if (tstream && !tstream->uid_validity) tstream->uid_validity =3D=
 time (0);
>>>> +@@ -1550,7 +1550,7 @@ void mmdf_unlock (int fd,MAILSTREAM *stream,D=
OTLOCK *lock)
>>>> +     }
>>>> +     else now =3D 0;             /* no time change needed */
>>>> +                               /* set the times, note change */
>>>> +-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime =3D tp=
[1];
>>>> ++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp=
)) LOCAL->filetime =3D tp[1];
>>>> +   }
>>>> +   flock (fd,LOCK_UN);         /* release flock'ers */
>>>> +   if (!stream) close (fd);    /* close the file if no stream */
>>>> +@@ -2393,7 +2393,7 @@ long mmdf_rewrite (MAILSTREAM *stream,unsigne=
d long *nexp,DOTLOCK *lock,
>>>> +                               /* set atime to now, mtime a second =
earlier */
>>>> +     tp[1] =3D (tp[0] =3D time (0)) - 1;
>>>> +                               /* set the times, note change */
>>>> +-    if (!utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
>>>> ++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCA=
L->filetime =3D tp[1];
>>>> +     close (LOCAL->fd);                /* close and reopen file */
>>>> +     if ((LOCAL->fd =3D open (stream->mailbox,O_RDWR,
>>>> +                          (long) mail_parameters (NIL,GET_MBXPROTEC=
TION,NIL)))
>>>> +diff --git a/src/osdep/unix/mtx.c b/src/osdep/unix/mtx.c
>>>> +index 8e6f76e..f64142b 100644
>>>> +--- a/src/osdep/unix/mtx.c
>>>> ++++ b/src/osdep/unix/mtx.c
>>>> +@@ -196,7 +196,7 @@ int mtx_isvalid (char *name,char *tmp)
>>>> +       if (sbuf.st_ctime > sbuf.st_atime) {
>>>> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
>>>> +       tp[1] =3D sbuf.st_mtime;
>>>> +-      utime (file,tp);        /* set the times */
>>>> ++      utime (file, (const struct utimbuf *)tp);       /* set the t=
imes */
>>>> +       }
>>>> +     }
>>>> +   }
>>>> +@@ -565,7 +565,7 @@ void mtx_flag (MAILSTREAM *stream,char *sequenc=
e,char *flag,long flags)
>>>> +     fstat (LOCAL->fd,&sbuf);  /* get current write time */
>>>> +     tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>>>> +     tp[0] =3D time (0);         /* make sure read comes after all =
that */
>>>> +-    utime (stream->mailbox,tp);
>>>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +   }
>>>> + }
>>>> +
>>>> +@@ -834,7 +834,7 @@ long mtx_expunge (MAILSTREAM *stream,char *sequ=
ence,long options)
>>>> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
>>>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>>>> +       tp[0] =3D time (0);               /* reset atime to now */
>>>> +-      utime (stream->mailbox,tp);
>>>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +       MM_NOCRITICAL (stream); /* release critical */
>>>> +                               /* notify upper level of new mailbox=
 size */
>>>> +       mail_exists (stream,stream->nmsgs);
>>>> +@@ -929,7 +929,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequenc=
e,char *mailbox,long options)
>>>> +                               /* else preserve \Marked status */
>>>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime :=
 time(0);
>>>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> +   close (fd);                 /* close the file */
>>>> +   unlockfd (ld,lock);         /* release exclusive parse/append pe=
rmission */
>>>> +   MM_NOCRITICAL (stream);     /* release critical */
>>>> +@@ -946,7 +946,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequenc=
e,char *mailbox,long options)
>>>> +       fstat (LOCAL->fd,&sbuf);        /* get current write time */
>>>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>>>> +       tp[0] =3D time (0);               /* make sure atime remains=
 greater */
>>>> +-      utime (stream->mailbox,tp);
>>>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +     }
>>>> +   }
>>>> +   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
>>>> +@@ -1062,7 +1062,7 @@ long mtx_append (MAILSTREAM *stream,char *mai=
lbox,append_t af,void *data)
>>>> +                               /* else preserve \Marked status */
>>>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime :=
 time(0);
>>>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> +   fclose (df);                        /* close the file */
>>>> +   unlockfd (ld,lock);         /* release exclusive parse/append pe=
rmission */
>>>> +   MM_NOCRITICAL (stream);     /* release critical */
>>>> +@@ -1212,7 +1212,7 @@ long mtx_parse (MAILSTREAM *stream)
>>>> +     time_t tp[2];
>>>> +     tp[0] =3D time (0);
>>>> +     tp[1] =3D LOCAL->filetime;
>>>> +-    utime (stream->mailbox,tp);
>>>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +   }
>>>> +   stream->silent =3D silent;    /* can pass up events now */
>>>> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox=
 size */
>>>> +@@ -1312,7 +1312,7 @@ void mtx_update_status (MAILSTREAM *stream,un=
signed long msgno,long syncflag)
>>>> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
>>>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>>>> +       tp[0] =3D time (0);               /* make sure read is later=
 */
>>>> +-      utime (stream->mailbox,tp);
>>>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +     }
>>>> +   }
>>>> + }
>>>> +diff --git a/src/osdep/unix/mx.c b/src/osdep/unix/mx.c
>>>> +index b5c5adf..4146409 100644
>>>> +--- a/src/osdep/unix/mx.c
>>>> ++++ b/src/osdep/unix/mx.c
>>>> +@@ -1283,5 +1283,5 @@ void mx_setdate (char *file,MESSAGECACHE *elt=
)
>>>> +   time_t tp[2];
>>>> +   tp[0] =3D time (0);           /* atime is now */
>>>> +   tp[1] =3D mail_longdate (elt);        /* modification time */
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> + }
>>>> +diff --git a/src/osdep/unix/tenex.c b/src/osdep/unix/tenex.c
>>>> +index eee61fb..622da61 100644
>>>> +--- a/src/osdep/unix/tenex.c
>>>> ++++ b/src/osdep/unix/tenex.c
>>>> +@@ -203,7 +203,7 @@ int tenex_isvalid (char *name,char *tmp)
>>>> +       if (sbuf.st_ctime > sbuf.st_atime) {
>>>> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
>>>> +       tp[1] =3D sbuf.st_mtime;
>>>> +-      utime (file,tp);        /* set the times */
>>>> ++      utime (file, (const struct utimbuf *)tp);       /* set the t=
imes */
>>>> +       }
>>>> +     }
>>>> +   }
>>>> +@@ -654,7 +654,7 @@ void tenex_flag (MAILSTREAM *stream,char *seque=
nce,char *flag,long flags)
>>>> +     fstat (LOCAL->fd,&sbuf);  /* get current write time */
>>>> +     tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>>>> +     tp[0] =3D time (0);         /* make sure read comes after all =
that */
>>>> +-    utime (stream->mailbox,tp);
>>>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +   }
>>>> + }
>>>> +
>>>> +@@ -924,7 +924,7 @@ long tenex_expunge (MAILSTREAM *stream,char *se=
quence,long options)
>>>> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
>>>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>>>> +       tp[0] =3D time (0);               /* reset atime to now */
>>>> +-      utime (stream->mailbox,tp);
>>>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +       MM_NOCRITICAL (stream); /* release critical */
>>>> +                               /* notify upper level of new mailbox=
 size */
>>>> +       mail_exists (stream,stream->nmsgs);
>>>> +@@ -1019,7 +1019,7 @@ long tenex_copy (MAILSTREAM *stream,char *seq=
uence,char *mailbox,long options)
>>>> +                               /* else preserve \Marked status */
>>>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime :=
 time(0);
>>>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> +   close (fd);                 /* close the file */
>>>> +   unlockfd (ld,lock);         /* release exclusive parse/append pe=
rmission */
>>>> +   MM_NOCRITICAL (stream);     /* release critical */
>>>> +@@ -1036,7 +1036,7 @@ long tenex_copy (MAILSTREAM *stream,char *seq=
uence,char *mailbox,long options)
>>>> +       fstat (LOCAL->fd,&sbuf);        /* get current write time */
>>>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>>>> +       tp[0] =3D time (0);               /* make sure atime remains=
 greater */
>>>> +-      utime (stream->mailbox,tp);
>>>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +     }
>>>> +   }
>>>> +   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
>>>> +@@ -1159,7 +1159,7 @@ long tenex_append (MAILSTREAM *stream,char *m=
ailbox,append_t af,void *data)
>>>> +                               /* else preserve \Marked status */
>>>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime :=
 time(0);
>>>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> +   fclose (df);                        /* close the file */
>>>> +   unlockfd (ld,lock);         /* release exclusive parse/append pe=
rmission */
>>>> +   MM_NOCRITICAL (stream);     /* release critical */
>>>> +@@ -1324,7 +1324,7 @@ long tenex_parse (MAILSTREAM *stream)
>>>> +     time_t tp[2];
>>>> +     tp[0] =3D time (0);
>>>> +     tp[1] =3D LOCAL->filetime;
>>>> +-    utime (stream->mailbox,tp);
>>>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +   }
>>>> +   stream->silent =3D silent;    /* can pass up events now */
>>>> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox=
 size */
>>>> +@@ -1424,7 +1424,7 @@ void tenex_update_status (MAILSTREAM *stream,=
unsigned long msgno,long syncflag)
>>>> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
>>>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>>>> +       tp[0] =3D time (0);               /* make sure read is later=
 */
>>>> +-      utime (stream->mailbox,tp);
>>>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>>>> +     }
>>>> +   }
>>>> + }
>>>> +diff --git a/src/osdep/unix/unix.c b/src/osdep/unix/unix.c
>>>> +index 86be3f9..012dc83 100644
>>>> +--- a/src/osdep/unix/unix.c
>>>> ++++ b/src/osdep/unix/unix.c
>>>> +@@ -232,7 +232,7 @@ DRIVER *unix_valid (char *name)
>>>> +       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf=
.st_atime)) {
>>>> +       tp[0] =3D sbuf.st_atime;  /* yes, preserve atime and mtime *=
/
>>>> +       tp[1] =3D sbuf.st_mtime;
>>>> +-      utime (file,tp);        /* set the times */
>>>> ++      utime (file, (const struct utimbuf *)tp);       /* set the t=
imes */
>>>> +       }
>>>> +     }
>>>> +   }
>>>> +@@ -999,7 +999,7 @@ long unix_copy (MAILSTREAM *stream,char *sequen=
ce,char *mailbox,long options)
>>>> +   else tp[0] =3D                        /* else preserve \Marked s=
tatus */
>>>> +        ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.s=
t_atime)) ?
>>>> +        sbuf.st_atime : tp[1];
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> +   unix_unlock (fd,NIL,&lock); /* unlock and close mailbox */
>>>> +   if (tstream) {              /* update last UID if we can */
>>>> +     UNIXLOCAL *local =3D (UNIXLOCAL *) tstream->local;
>>>> +@@ -1160,7 +1160,7 @@ long unix_append (MAILSTREAM *stream,char *ma=
ilbox,append_t af,void *data)
>>>> +     ret =3D NIL;                        /* return error */
>>>> +   }
>>>> +   else tp[0] =3D tp[1] - 1;     /* set atime to now-1 if successfu=
l copy */
>>>> +-  utime (file,tp);            /* set the times */
>>>> ++  utime (file, (const struct utimbuf *)tp);           /* set the t=
imes */
>>>> +   fclose (sf);                        /* done with scratch file */
>>>> +                               /* force UIDVALIDITY assignment now =
*/
>>>> +   if (tstream && !tstream->uid_validity) tstream->uid_validity =3D=
 time (0);
>>>> +@@ -1425,7 +1425,7 @@ void unix_unlock (int fd,MAILSTREAM *stream,D=
OTLOCK *lock)
>>>> +     }
>>>> +     else now =3D 0;             /* no time change needed */
>>>> +                               /* set the times, note change */
>>>> +-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime =3D tp=
[1];
>>>> ++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp=
)) LOCAL->filetime =3D tp[1];
>>>> +   }
>>>> +   flock (fd,LOCK_UN);         /* release flock'ers */
>>>> +   if (!stream) close (fd);    /* close the file if no stream */
>>>> +@@ -2251,7 +2251,7 @@ long unix_rewrite (MAILSTREAM *stream,unsigne=
d long *nexp,DOTLOCK *lock,
>>>> +                               /* set atime to now, mtime a second =
earlier */
>>>> +     tp[1] =3D (tp[0] =3D time (0)) - 1;
>>>> +                               /* set the times, note change */
>>>> +-    if (!utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
>>>> ++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCA=
L->filetime =3D tp[1];
>>>> +     close (LOCAL->fd);                /* close and reopen file */
>>>> +     if ((LOCAL->fd =3D open (stream->mailbox,O_RDWR,
>>>> +                          (long) mail_parameters (NIL,GET_MBXPROTEC=
TION,NIL)))
>>>> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/met=
a-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>>>> index 17faa3aa6..7e3bddb58 100644
>>>> --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>>>> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>>>> @@ -16,6 +16,7 @@ SRC_URI =3D "https://fossies.org/linux/misc/old/im=
ap-${PV}.tar.gz \
>>>>               file://0002-tmail-Include-ctype.h-for-isdigit.patch \
>>>>               file://0001-Fix-Wincompatible-function-pointer-types.p=
atch \
>>>>               file://uw-imap-newer-tls.patch \
>>>> +           file://uw-imap-fix-incompatible-pointer-types.patch \
>>>>               "
>>>>
>>>>    SRC_URI[md5sum] =3D "2126fd125ea26b73b20f01fcd5940369"
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#110750): https://lists.openembedded.org/g/openem=
bedded-devel/message/110750
>>>> Mute This Topic: https://lists.openembedded.org/mt/106526690/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>> --
>> Kai Kang
>> Wind River Linux
>>

--=20
Kai Kang
Wind River Linux


