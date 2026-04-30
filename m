Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EB8FF887E
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 02:07:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11526.1777514838663164953
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2026 19:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9580c50987=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U1e12u2057371
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 19:07:18 -0700
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dumcvgshc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 19:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCSrAIJrar3WaRUYrZub2vlVa7m6/m70Spr+z7Obmw610CHuSQFTlU7O9Smq2gDpiJPnxkTFy+aev8OrDMV1PVNusX/iJLpmht03LekdSiZOxICqIlSPSGl2RUsLY1MHQKeUzvvtnXte/jWbCT8WrhliGYlFiS3ITbCFvQyGYcXGALnKswcQ5Xn3jgUS3qt4EALoMaFj+SCix0YTqoyvrSXnz5ubJleykA6AEf+iFz8MwF5q9iEoeZLeHnx/8A9cEj1rCCcsrhzT2rRCPAPcUBlW8OUpEmpNf85uLbHCVhhYQnAX6JLt0iJTCndhi1TDQMemmsxssfQ28D+OJRFiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilBqE0SIUnST9Ha3m+zBUlIAv+5vGJBs0LqpynRutlE=;
 b=QPYL6+QEhpuXIQtIyFYFGCSYb6zhej/GyOJ1XFytJFxacqR3L9wBW9dcWwejED/zoF125SsgivizjyMB/rh0HevzU/oBYD6XjwLMrjlnj6WKnuWZEKz3C3ejeAkUPzHIj7jrk1SN76K0LktbsrVR9uM0NFzmygQdJA9yyl4wIjkurF4W+RpAXBUWIiMzMahmhYYjoNNDw9DXwTbxzaG5Nnz8rFkH3lmVC1V5kPHLVWndrMty0Y6qbuIFgPYtUYplzcJfojwy9nLMZ10QBhoJ9LKedjVf1feS4zWzCuky9Ui3WjAExzzhRu0y1GH8kbyk86FMklizfSRuDvNC3hxIZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by DSVPR11MB9743.namprd11.prod.outlook.com
 (2603:10b6:8:34d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 02:07:15 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 02:07:15 +0000
Message-ID: <03aceda7-7f70-4b56-8d88-b30c8fb66de6@eng.windriver.com>
Date: Thu, 30 Apr 2026 10:07:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH] pahole: upgrade 1.25 -> 1.29
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260422104659.1814004-1-xiangyu.chen@windriver.com>
 <CA+s=J=w+Ox9es4DSansjUsd2dFpTsUPYj2gDrKPAv-WZFpxWug@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CA+s=J=w+Ox9es4DSansjUsd2dFpTsUPYj2gDrKPAv-WZFpxWug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: KL1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:820:d::19) To DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|DSVPR11MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 60362547-85b9-47e0-6e55-08dea65d32f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	SXLnUwO/pnn3FUwwn+7WmdxNm/Oe4A7xGTtJVyPBDIeJzSqurxwrPsh+EXeN/r/UbgG/u5sLygXkt1AkT/78H8xGPb3mbiOPvhcFkalkv9rS8raQhviTo4mJT6TdA8lAngoQuP8fQ5z7IdrPPSBoZiieqrEgGQK7q6KPP5LBRcUVc9fD5XhVhqIcHwNfQGLPgUDgSRPLOka2XkIGFPgh0/eKE0k+kg5arUHadget1S4HcUb2FIrYq1ZsGp+vQCd4rMQNRxIOoCnoOxTlBDFNHFTqWqQcQIrdsEDHOqDDqWQtmUSH8agMin2Zk4kbhFZpQw+94Y2bNI+yUwuF9E3tycBSymenUrLkvKdZvu9P/n6woTXDfkNDbDno+P1Lmi+FI8+peiAg8Rh5/VT1mMRBUYZJNUnryJHvgRTLQTWi2Ec7CNe9/GYrWUfzeWp8O20Gwzc7qye3i/6FplK2YHj/FSXdbifay+NZFd7VVJdGesqG83H23Ucg2iY7HH5cJIHNQfAx1U9yzFbo/PzCHJccKCKVYYMd6x2osK77yNNYrCxs15YRWz3VfvpR2jVyEofAs7YRimZaPrXUBXtF6mibgAjoEIMlMfpE4Njp8zoG6ZSxTDPlLTpoSoNItu24/s/8laxA6cbUM6XuiE8LCBIKxg3Gm3G8bmgYhrRIYDCwRa6SJewzrHTP3xS/oWndy5PNqud352wnzHZLlwUtx0oZxDG/+262XrATkDK+ipzeDnY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTFPTnNJbUNiQlJQaFdKQkhyRHpva3VJT3Qzd1ROTDZXU3VoU3RhSU1CL0ty?=
 =?utf-8?B?bm5xQWFvcm1hTGhYVEdrSGJyZE1qOXlVMm10SnJSWXZickxYN2NYaXhIOTA4?=
 =?utf-8?B?Q3hVY3RzbHJ2RElFbHViQlFRaWV0UzBKaEUzdENtSXJpWUdmWDdCYmR3Vksy?=
 =?utf-8?B?ZGVHamhBb3FuTGNITURjQ3hYYnpmK3J3ZUxEcUpXS09ZYmtGQ3lSTmtOQy9Y?=
 =?utf-8?B?dnJDM1dkdGx0SnV3MjVPVHpQTGxUT3hPdUtSd2xtcFVaUzFJWmxGSUtsdjlt?=
 =?utf-8?B?cVRydXdpUk1teEF5cVRRVWJGVnoxM1ZCbjQ4NjBnaExDNVJLcTUwUWFpeG00?=
 =?utf-8?B?WmxTMmxIbTNnbG5rbnRWcTR4bzFzUys1amsyUXRvUlVsQ0lsMGUzbU9hM05Q?=
 =?utf-8?B?N0krcjFyMVJyMG1tQVB4allSTE5LRkdzNnhSemFjNUVpQWZhSVRUWG5lNTR1?=
 =?utf-8?B?NkNKdEUvdWhsd2NWc0JhMCs5WFJVOEpPeFNkT2d3ZGhwbmJFbGNxZklsVE1y?=
 =?utf-8?B?RmxQZEk0WGdkRFJkTEZuR0hVMmtRWnFYdkhjYVFZeFJobm91Wi9EK3FpOTRR?=
 =?utf-8?B?eEtqdFNqeFNOYW9CbmxGR3gxbU5qT1R4emVKRVdsaDFaRUQ0am1qZFZNVDQz?=
 =?utf-8?B?ZndQUHhHQjBZdW41S3prV3VoNitoZ0I3MHQzNEFkcXJWelhtVG03d2FjREdR?=
 =?utf-8?B?Z09sSU8rbjRRbElueXRIM0JIUjdnOWxjWDY1aERVNzNMTFA3aWZZY3hrRllY?=
 =?utf-8?B?eG0yZnNROUdUc2czc2dCRXM2NjcyM1ExZE02dHIveS9XYUt6bFl4bGV1djN0?=
 =?utf-8?B?TVRmcG9sb2kyUGtUMnJTdDl6M0JsVy93N0x6aVhHNEdOeHM1SzVyR25ZdUZx?=
 =?utf-8?B?WDZvQlk2citNNit5OVVUVG9NNWUwOFBhWnJuVFM2YkZuaFE4U29uR1hnVEZQ?=
 =?utf-8?B?OURWemVXdlNjdzlXQTNVWjJHYzIzbVhDTG0xN2xYR3RCcTBFVDNQTGZxZkgx?=
 =?utf-8?B?RFoyc3F5cGQrTm45d0hUbDhMUG14VEpEL3YwdUxwMXFpa1pZY25jM2x3bHJM?=
 =?utf-8?B?Zm94RlovaFc3VHQ4SzliaS8vMUpzM2VvUnpyL0ZEbFFsVm5NTXl4MEZUNGVh?=
 =?utf-8?B?c244bytGa1pIRjByNzFBVG9QWE8rZmhIUGpFZU1ZamhnRjNQdmhhRFIzME1V?=
 =?utf-8?B?VWVGSTJEQldOMTcxMGU1aVk3KzVydGFBeEtSaGFQMGEySFh5Nms1WWh3dm5H?=
 =?utf-8?B?REthZkhIVTBzSHlFVzBpVDA4UHA5SndxSEdmWVNZK015L0JhTHNZVXdYKytq?=
 =?utf-8?B?cVd4K1hqVjFoanlkaFNSM3NDNWsra09pSTUvcGVrcmRUSmFXSTBGSEJBRWds?=
 =?utf-8?B?ajYwMDNxNGE5L2tocWNrMGt1WTZrMk9HSTRVZUJpbEwvRjhoaWU2QUdadXBW?=
 =?utf-8?B?aGZRTEdNaXZvYmZ3dUliaUlidEZNVlUzTXVYQUoyNE9BNmw1NFpPWFZuL2NW?=
 =?utf-8?B?V3FJd3hzb3Fyd21CZlo4S0lKazEyUVIwMHJyV05ucmVDMmcwU0x4bmRGcVVo?=
 =?utf-8?B?WGFzYWswaEtKNHVEVTIrdmRjOEhZeWZqRy84aHFzMXU4SzVVQkhXN0NUdk9O?=
 =?utf-8?B?Tk5vTk10bURMc0duTUNHdHVwSzZIdm5SMHV1TEozVFY2bXZFNlUwMWpNU1oz?=
 =?utf-8?B?SkJjVGNzeklCL0QyeXFzN2EzaHUzOFFiSUVJZXJOOEdjc0RJYWRSNTRlSkg2?=
 =?utf-8?B?UlhHT1QzME53dzlkTnRreEFqSDNocU1tUk96a2hMV25VamQrejZoeFJxeWpF?=
 =?utf-8?B?d3R5aUQ4UUVKbE0ySWZ4eGthWTNHUkt6UHp6VlJNVFpMTDZDeFRnNDRDRUtt?=
 =?utf-8?B?Q1YrMzFYdlNZUnl4TDFBUEs1MEJzUHYySW84elJsMlBGVlE1UkVRZ0J0Y0E5?=
 =?utf-8?B?U0NMSUZQUVVPUU5URHBqOCtsMmo4V2NZUVZPK3l6SFlWcmUzWjFmWnVzYmlL?=
 =?utf-8?B?UlYrNUNoVkFtRWNEbTVQL0dBUG12eEtiandhcUpiV2o4RG5VRWlXN0szSnFu?=
 =?utf-8?B?bERlcllxNDR6SUlwcmdzSkpRZk9EWGZ1NEtyMFJiMk9jSGcxeCtUeFFnc0xx?=
 =?utf-8?B?ckxQU0lZcTFqWVFRdE1wclRHaG5FUWcyUDF1UVJxVGlJbmszTDgydDk3Qlgy?=
 =?utf-8?B?a2V3L3h3NWprK1B0YWpzSjZ1bkg1bTNhOUJlQ2dJcVZEM1lzdmFTOXNTZWYv?=
 =?utf-8?B?OS9jRTJmck9FaDZSUTR2L3JjSm53aUJFeHlMdEllN2pqeDBiQ2lTUlUxQUt4?=
 =?utf-8?B?OUlYMW9RTzZ0OHI3aG94OUxGSE16SnF5K2gwVUVEcTFFR2N5dkI3OHkxbm0y?=
 =?utf-8?Q?oe+kCZeoSP+zsSns=3D?=
X-Exchange-RoutingPolicyChecked: 
	X5fIa+noKERhSyqglMhqMoK2p+Vk/nQ0d09yEOq7+SrWNCCr9PiEPeohPmwDTOeWwfow78OlnDuKMG/ZMptB3u7plUCp5nLgwkb+jYa4lV4r1ch5ZoDWnYOw7PcuTuEC0oluh9F3MzkoGyF/+NpqGvA620TBu3dxLE1vNLQf3J0lwyrqKxnVUCDjE8KsZSH55Vn36E64XYCEqw2LSyRSkuqixHozvXWNEUMoVIxzol+IKmnl2mZ4IWaR27T4Gu1HxN0kV9YuV5hztC8L/SXH9ZOUBSOY8rLnUSUtoWIwUdjCPI3dY+v9rm2C0De05ns4FwChO3bpObYpfIIV1VL/7A==
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60362547-85b9-47e0-6e55-08dea65d32f5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 02:07:15.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GHom5b6mCLWSeuahbCEYV1PALLwXbcvY5htLa6yf7ln09K3Tnu8h8wd8rZJT0AHbrdVj7H5A0u+Ql3It4TTTVaV+aWUoybJ1YLoS2ntac4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9743
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDAxOCBTYWx0ZWRfX43vuLxYHc2Op
 Ud1G0hDse69QT+WFOpxAJKsgRlrmuOTt2YU5Vy59Z7JPjbWOPJ3EJS0ZYqeY+Y84ULUZpe2kLv/
 rkmN2xKrgUF7H9TAKuALFJ/dTTaPfL0i3rHWPZ+LMv03HsRaeIh+uq7ppNDaoElLRzZpL+H4HmI
 33Auhn9qq+0qC9v1luY6qm7q/KEGShE/RAGL+GSCYsdo23dhIO9MQnrDoE/lvmICuU4mpdWTmvN
 L4We41nN6NsWTF+Pwv/xMLxTfpV9DQ8Fqc5w2o8zNJxN5/bddg7q9lFsgMxFZFHw8gPzW9rKUJ9
 pkcYDlX71WymUHzK7Iuiue1H8jhQbbtqKsUZU/BBdQ3euCTscXEKP2HTfHgkII0PQRsVzubJQU3
 jRbTFHshpkNMIJzjguKmbauBSnD+a1zvKDV+SUbmlCLc+oH/nm/8WgAc7Hy7cAx/2mEjESj7CAg
 n/7I3ds7Kp0iKxb0Gbg==
X-Authority-Analysis: v=2.4 cv=eYsNubEH c=1 sm=1 tr=0 ts=69f2b955 cx=c_pps
 a=2pTyoxkMaluYXS6DGsynPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=LZdOaWrZoXTLVzWT6lEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3FFawiwByJHPc7MQgFl_j_pHLvj3bphY
X-Proofpoint-GUID: eqEdyuXDvh3U-G7YjCbcWNe-vdCtCvhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300018
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63U1e12u2057371
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 02:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126668


=E5=9C=A8 2026/4/29 10:55, Anuj Mittal =E5=86=99=E9=81=93:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Apr 22, 2026 at 7:16=E2=80=AFPM Xiangyu Chen via
> lists.openembedded.org
> <xiangyu.chen=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
>>
>> pahole v1.25 in scarthgap non-deterministic BTF type ID ordering when =
using
>> its parallel mode (-j).
>> The kernel build system (scripts/pahole-flags.sh) automatically passes=
 -j to
>> pahole for versions >=3D 1.22. This means two builds from identical so=
urce produce
>> different vmlinux binaries with different .BTF sections, even though t=
he bitBake
>> task hash is the same.
>>
>> It was fixed in pahole v1.29 (Jan 2025, commit 4c916259) which made re=
producible
>> builds always-on by default.
>>
>> Since Scarthgap is a stable release, the current v1.25 is retained to =
support
>> users who require the older version. Users can revert to it by setting
>> PREFERRED_VERSION_pahole =3D "1.25".
> You seem to have sent this 3 times without revisions. Are all patches
> same? Also, can't the fix be backported instead?

Sorry for that, seems something wrong with my network, send-email=20
service always

report failure at that day, I tried to re-send, but in fact, the patch=20
has already sent.

Regarding to backport, the aim is keep both version of pahole in a=20
stable branch.

If backport the upgrade commit, it not very clearly for others who want=20
to know what happen.


Br,

Xiangyu


>
> Thanks,
>
> Anuj

