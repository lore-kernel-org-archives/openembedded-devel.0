Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF98C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 03:44:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3433.1666755865559021807
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Oct 2022 20:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CaKhaxe7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7298788a6b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29Q3JWna006995
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 20:44:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rqgD6CyXFGgi1VWeCP3p4BEe8oDYCRx+kiJxsSKgR/o=;
 b=CaKhaxe7LQeO+X1Z4SMrDN0O0NI+QCd99F5030yharJmLfZhjkN8q7mjSlS/wbZMTDPo
 H2BnA3+BoHZQKi/1EbbYfilrBoGNyntN6IlaA0heyL+5jm3XKtxRs+l2qGJtVqEZ+Jmn
 sdriBlllg60H9gWzvHhzwSi5EiIdv4gnXU+Lk0kJ15Q763OGt2rkPoDncBOEYR6elVDL
 LFUCiSzeOfbCJFg7a8N6fTYIOuAcAiO2JiDW5MAqHQRay3lh2xM+2Dv5u99vWXIaGUE6
 T3pJ32R5WyIx2YPnncfytVwC5IVn/57DN6+6tY4I0hanZSZWo5OKJ7X8ZOVMMOpAVLlS Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kems1gdkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 20:44:24 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29Q3esvB017332
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 20:44:23 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kems1gdk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 20:44:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faTgQmOXd+mntF90gCwCc5ANPJ7OpaV0pKKZZewphEvosOuf96T3FVF3XxzLm8TfUmeRQ25UV83d81Qt/jvLoNYgMnRRiqg3RlTl4R3xohC3mHKw6DMQrD8BhWJZyfuuiei9zr3NaL+q1JsDOpXDHnZ33FgcogLLcNjNEMuDldNXVxGHQvzs9wmJFy8jznTC2xXoo8xhRxwsuzOUqXNJ4eTg1QUbLclNzLKjcBXUa2hp83zIekUBND2SPL6IWzjS60XGopAjQm8ULd4ba/VX9BX6z+ytWVz71njRIkJirZTru0qEmMcsjL0yASOByDIr9566iu2l87uiqrQP1dq88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqgD6CyXFGgi1VWeCP3p4BEe8oDYCRx+kiJxsSKgR/o=;
 b=IQ9UnxSvgzhknyzm62LLPwwtvJcX8WFtlSorEIVl6dtcvEuW6ES3tszsAefmxEqjbhEbKpx1LNlaa7GOxFcjQ/0OK9JmB9VIGf70sOO0Sw5GOH+VP67KaU5EY3QnJM9pHVpCCY0PsqVy8Temcvc5l1jmUQ1ezkRtaC2tIQcaBr56T1jp+9ndmq/SpDXtZJjeajuGetOZTPKqe1qMNqQ90wiqXcL1AOGfCxW4JVCUQpsHCFN2h2ZPrTKb/+dM8qG5U6Q3SuoOeIEUeQtV+xEazlAO/EvYEMxMI8kq/uTBtHyhkdiJPYjHhW2+mlFXYDq7MA/GZ1vgbzNuET48WrHCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.24; Wed, 26 Oct
 2022 03:44:21 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%8]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 03:44:21 +0000
Message-ID: <c563867b-f9ef-781f-6172-a26ede260da7@windriver.com>
Date: Wed, 26 Oct 2022 11:44:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-oe][PATCH] ipmitool: add default iana enterprise
 numbers database
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20221024095656.292305-1-xiangyu.chen@windriver.com>
 <91f4d7befff848f9a308e5ed77b9c510@axis.com>
 <70780f6d-9fb9-3553-a6ec-1eb9e8098583@windriver.com>
 <CAMKF1srJjfdCnJkSWH4YBWyq8QifnRZAyU8CPOpR_=PhgL3gGg@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@windriver.com>
In-Reply-To: <CAMKF1srJjfdCnJkSWH4YBWyq8QifnRZAyU8CPOpR_=PhgL3gGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0220.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: d8820158-73e1-4b4f-5cd7-08dab7045e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RowRL2STbxbUl4T+DM37sF5W1TSo5Z9gg6J7dq1GEz0rLMZOBbtfVuoEKhPaLNCOLeteRvwu/3bUW8g/y8PircQHonMGvdH6BxXSWvF+TZJKoS5Xi5lf9HbDAQ25qaHqJ0f12DJHCDoLtFA5PmoB8/d2Hx12spcKDFqlgvAS77SrZbU9wvbwGAF1zjPd8AzuQ5PdHMoJFGB/1vz8VClbH7Vmchcvh1xBxcn3YESulddlEt/Zs808xC+JRqoUBbczcp5TaYl3XZ2szcoJB/1iG2ukMqyAwwrVPVMG3JDtXte2CX7OyXGymK9yoa3IF00qLlCtz8YKNPNNoG1XOXow9bNA4gsIkO79EbuHs1mzi6SZp1sTYy3FA4d822T3CngwdmP262ryLS0WZC4EvBZJOpeK4j6dB/CFlmRPTD3xHcLd7rYthFUte+veohonjDOvLLUFBpnfdP9lZa52bAlF1RfZerOvkqc7lhlC8RukXS9ZCWoM2RiIRnQAStCD8+kqgBpguSP0oGq65nxBI/lwKRPIBQ32KkmMtXL+fYKZsLB+NQAWmIaLrFtSa9xqDrWBOJqJP7Kp3+3m+3iILIeeJfJwkl1PIOz/C9pC1SFnkC/d+z5yR25t+rhddKGQZ7J/vCAdO+chXQQmighCySni9zlsXmwgcmY2wCouxPkcO8ELen/Y1fWVVBKjABX3JXGFoN1wZwPI93sd95NXGEgpkKkMvceMF9EQ4coSL+Hafp6cAAOriPwCZvyDwkTRTr4e8rCRz++3A23Jbu7Jbwlfh0EnLzDS9lAz+B35jvaY+Z0OV8X3J4d5Rh3v546UjPRc0wKxqxCkbanbrnOIy1RRBcXXdWZhceK+QwNCWFNsVKp5cVoXzIbDcyXt27ZJyu73
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(451199015)(45080400002)(86362001)(31686004)(31696002)(83380400001)(6486002)(66899015)(478600001)(66574015)(966005)(6666004)(26005)(8676002)(4326008)(316002)(53546011)(41300700001)(5660300002)(6512007)(66476007)(6506007)(66556008)(66946007)(6916009)(8936002)(38100700002)(186003)(4001150100001)(44832011)(2616005)(2906002)(36756003)(45980500001)(43740500002)(130980200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MXlTTmhsOUxrMm5ZOEtEMmI0NWRJZEdvUmZ0OVpyU1pBbi9ha1BPZVBMYnJk?=
 =?utf-8?B?cjZWUE4vRCsxWThSQ0ZERGlEQ3c5dDJ1TGMySy9idFkxMHI5TEhpTWpVRnRD?=
 =?utf-8?B?aDUzOTJnSXFyeFEzWHVXYTIvV1VIeldFSEI5QXBWU1FlWlN3cFdLdkZ5ZVJn?=
 =?utf-8?B?R2JDYW85NWJ4RkZYUy9vdzBMZ3ZHNno0Q21GVmswODN2SWJhTjY2bUMwbnZh?=
 =?utf-8?B?VE9iOTc2WklRbUJvTzFTMXFYNndKY3J6WUxYWmV3MGNxSnhYMWdYT3hMTk1N?=
 =?utf-8?B?WVFDR2E3Nll1WHEvdkx3NHhpRzh1STlHa3hYT1JQUHkvYzI2TjBsbmJpQnNt?=
 =?utf-8?B?TG02MmE2bGoxZHFQWGJUa2lTT0NXMlJJc0tQMUVhMThTL3h2SWgxUnJqNW9Y?=
 =?utf-8?B?NEZhcVRsd0JWaTBRUVdRZ0hoSG9WQWRodHNuaU5KcW1qUUhvMkxmN2tuVFRT?=
 =?utf-8?B?ellaVFhDeDJ1bVFsRXN2ZnZhWktIVk53NW9XMTRPaU9MVjU0ME9NZW1MdS9u?=
 =?utf-8?B?QzhzNGwwV3VrT09rTUx2SVdDZVR5WU1uWkdkSVlUeUI5RFQzbGllTFYzTW4y?=
 =?utf-8?B?MSsyZThtS1VIb1JxRnRpSFNVVmNOSDhRcDdzUy9QOWJPTjJVRzFnZDZpTkQy?=
 =?utf-8?B?RXFjbjd4QnB3aXJybk1BRS9QSXR6U1hOT2dDbVhwZWJ3M1BzcTZyV1kvVUlz?=
 =?utf-8?B?TjRBNHptdnpqUGhNQlV4TE1vREJ1OVd0QzVYTlBxNzZ2cDc4bTEwa1VuSmVa?=
 =?utf-8?B?d0NQNm9yTVBYd3B4bFdIdnhNVUJuWGg4TGhycUZwOWdScWp2RDdZMTBQZXZZ?=
 =?utf-8?B?SkVvdHB0dWZvUkRyaHE0YWhjZlRqc0NjdG05a01Mdk12aVZJb2dtZUdBVW5p?=
 =?utf-8?B?eHVqMHdwcUJDM2phM2lpYUZHdFo5VkJiM2QrNkRjaFFiVFozeWY1dFV4WVE2?=
 =?utf-8?B?Rmw2OW1qdkRObTNDeXc4R2llNWQ0a3M4YWt6QzFUTzl0L3VqaSs3ei9oT0JI?=
 =?utf-8?B?Z05RSzYzaE1paWxObXFad1Jma3gwVVIwYnZCR1dLVGQyNFJwOXZ5MldPUGxN?=
 =?utf-8?B?Z2xUdzBocTl3c2JtWjRpaWNCMDdnWm1IczZ5SEhCUlJMQ3d4dHA0UG50Z0Rm?=
 =?utf-8?B?TDJIckw2SHFrN0I3Ymlrc3l2azFLcCt4MWtZdW9mWEcvS2Z2TUdsVEVvU1d0?=
 =?utf-8?B?U3F4Q0hneVVtaGFUcmR5RHI0am5rVHdQR3BSQUlYd05RZVdQckV3Qk9hQVhC?=
 =?utf-8?B?YkxvblY5RkRUWUJ0NTdHS0ZqTkVjOWRXV3c2TzhaY1BzT3RpZ2Y1V2ZMTWRt?=
 =?utf-8?B?NTMzTGpyQUYvbEFiU25qUSs5Tm1tbkNJTmw3QVIvcTg2REhMU3ZqU3I4ejJT?=
 =?utf-8?B?QWZ1eHdLam1WR0MxcVUyckc5QlprME8ydFRrcTVkSEw3OHNnVmRZMFVoUVJ1?=
 =?utf-8?B?WWJ0bENOS1FscU1lWEVZcEg0Wk1lZWtOK0ttemZzWVpOSGlBbVBiSDlZZUg5?=
 =?utf-8?B?L1Y4RXp1OE1scWlTWDVjTStKQTVFc2lRTFhwZXJ3bXlSL0NyVzBpMmhiUWZ4?=
 =?utf-8?B?N08xT0ZsSWd6M29VNEltaFp4c0cxb1RzWDQrenpEVVloV0tUanVGQjZSZENr?=
 =?utf-8?B?SUtCb3RmWExYQWIzM1ZPbm1iUHhQZ0dqd3dwaXp2STFUcGUrOFhuZ1ZpZENP?=
 =?utf-8?B?RXVta0p4bmRhWEc2S1RKWjMxMGVOcUQveWl5TXpKZEdBTmdpOGN4amRXSW9I?=
 =?utf-8?B?RWdMVjc3anVvYTVFM2M5UDlOZHZyNUMvUUZPKzVDMndieXlXV2M2SkcxSUx2?=
 =?utf-8?B?UUF3a0hOWDQ4R0RzdVVLT1FvM1NPVVFzbkJzSERNYjRDaGZzQ3Q0eGZrS011?=
 =?utf-8?B?V2ZyL1N6Vm15T05XZ2NUVVFLUUpTb3pTVlVhYmZ1VHFsaXc1MWFTc0R1RkFJ?=
 =?utf-8?B?WXcxQ2p3V2poTTFkZGlpNnViSTI0Rlp4MDBCdWpFVFNQV2RPWG9rQWl2bGF1?=
 =?utf-8?B?NXpXdnNVNFNWNDBOcVFSZzR3ZzlWMTNhSjJpVGkzNXBxUDhHU2dnclVVZXAy?=
 =?utf-8?B?Zm9XNVo1WTRmYllOZXlhNXNxSCs1SzBWVGZIK1pROC9PbURtRGtOOFh5V1hS?=
 =?utf-8?B?OTR3ZHNUWmc4TEJLVXBOeWlmcUpkWTlydkl1SG90MmM3cVBiYU1rQTJsRWhH?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8820158-73e1-4b4f-5cd7-08dab7045e24
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 03:44:21.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+hZq6k5kdWuka2e2UQk6MLg86KT39fLVtb6Ku3sv16Qp02xvfnBDf4cfRBJysd5RHfb7Rwq6romBExNTY/epyYWENx96ma8bz5hcLaIh7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
X-Proofpoint-ORIG-GUID: 21wYM98S8nA5awuTaqd2Dra2_olgLYqx
X-Proofpoint-GUID: DPqe7tTTqcYsEW6MjU-X1Zg7GxZbhkiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_15,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Oct 2022 03:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99309


On 10/25/22 12:00, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Mon, Oct 24, 2022 at 7:46 PM Xiangyu Chen <xiangyu.chen@windriver.com> wrote:
>>
>> On 10/25/22 00:30, Peter Kjellerstedt wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>>> -----Original Message-----
>>>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Xiangyu Chen
>>>> Sent: den 24 oktober 2022 11:57
>>>> To: openembedded-devel@lists.openembedded.org
>>>> Subject: [oe] [meta-oe][PATCH] ipmitool: add default iana enterprise numbers database
>>>>
>>>> When using default configuration without add IANA_ENTERPRISE_NUMBERS and
>>>> SRC_URI in a bbappend, the ipmitool would report an error as below:
>>>>
>>>> "
>>>> root@intel-x86-64:~# ipmitool -I open bmc getenables
>>>> IANA PEN registry open failed: No such file or directory
>>>> "
>>>>
>>>> Add a default iana enterprise numbers database to avoid the error
>>>> happen if using ipmitool default bb configuration.
>>>>
>>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>> ---
>>>>    .../ipmitool/ipmitool/iana-enterprise-numbers | 237682 +++++++++++++++
>>>>    .../ipmitool/ipmitool_1.8.19.bb               |      6 +-
>>>>    2 files changed, 237686 insertions(+), 2 deletions(-)
>>>>    create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers
>>>>
>>>> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers b/meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers
>>>> new file mode 100644
>>>> index 000000000..f8c328796
>>>> --- /dev/null
>>> [cut 237k+ lines... ]
>>>
>>> For the benefit of all members of this list, do not send a 237k+
>>> lines patch as a mail! The resulting mail was 20 MB. It took my
>>> Outlook client over two hours to create this response (where I
>>> then had to remove most of those 237k+ lines again)...
>>>
>>> Instead push the change to some public repository. For
>>> OpenEmbedded you should be able to use the github repository and
>>> create a merge request that way (and let us hope that Khem does
>>> not have automatic tooling that sends all merge requests as
>>> patches to the mailing list...)
> Regardless, I would not like to have binary blobs in git metadata.
> Please make it a separate downloadable artifact
> hosted somewhere reliable.

After investigating the enterprise numbers database text file, I think 
we can find a compromise propose.
The database recorded enterprise/vendor private enterprise codes for SMI 
network management, it keeps updated when has new enterprise join. This 
database has a fixed format and has a reserved(default) code as below:

Decimal
| Organization
| | Contact
| | | Email
| | | |
0
Reserved
Internet Assigned Numbers Authority
iana&iana.org

We can create a text file just contains reserved code as above instead 
of the full data in a compressed binary blob for ipmitool normal working 
when using yocto generic build without any change, if a user needs full 
SMI network Management feature, they can enable the 
IANA_ENTERPRISE_NUMBERS and SRC_URI in their own layer.


>> sorry about that, i'll pay attention to check the size next time.
>>
>> I've created a merge request on github
>> (https://github.com/openembedded/meta-openembedded/pull/629)
>>
>>>> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers
>>>> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
>>>> index 0a600e23b..e166ea213 100644
>>>> --- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
>>>> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
>>>> @@ -27,9 +27,11 @@ SRC_URI = "git://github.com/ipmitool/ipmitool;protocol=https;branch=master \
>>>>               file://0001-ipmi_fru.c-Provide-missing-function-declarations.patch \
>>>>               file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch \
>>>>               "
>>>> -IANA_ENTERPRISE_NUMBERS ?= ""
>>>>
>>>> -# Add these via bbappend if this database is needed by the system
>>>> +# Default IANA enterprise database version is 2022-10-24
>>>> +IANA_ENTERPRISE_NUMBERS ?= "file://iana-enterprise-numbers"
>>> If you compress the file with xz, the size is reduced to a third.
>>> Bitbake will then uncompress it automatically during do_unpack().
>> Sure, I used a xz instead of the pure text file in latest version merge
>> request.
>>>> +
>>>> +# Add these via bbappend if the latest version database is needed by the system
>>>>    #IANA_ENTERPRISE_NUMBERS ?= "http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
>>> Change "?=" to "=", or the suggestion to add it as a bbappend will
>>> not work.
>> I have changed ?= to = in latest version merge request.
>>>>    #SRC_URI[iana-enterprise-numbers.sha256sum] = "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
>>>>
>>>> --
>>>> 2.34.1
>>> //Peter
>>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#99300): https://lists.openembedded.org/g/openembedded-devel/message/99300
>> Mute This Topic: https://lists.openembedded.org/mt/94530972/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

