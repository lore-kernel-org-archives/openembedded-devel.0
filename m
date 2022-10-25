Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1781AC67871
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 02:46:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2845.1666666002211243933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 19:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ub/z3Nl5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=729719c70e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29P2Yn4A011033
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 19:46:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : cc : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=2tk0kt0/HR4lpAjUUiedSCLaKz+Hm2ryYCvNbW1L/Zs=;
 b=Ub/z3Nl5BpSO3Z6qbCy4q+3xwX8ixkWzktT8akLSqK9tR3CrDBSw2fNitI7R557/weQe
 l523OWNNP1YWR2tPkMCimJJJI5u1BmvKcF1BPEA6mfdKf7ojD4K05kWD8Mh6ZMHoSp/8
 DXxLYGOB5jwi8AqQtWy4CE7/iW9JSSTg24HjHayYbx3FQMpWQmIvzObLkQ/yfnBAzKqW
 E6tVgLoNi0ipKpg1oYwrR/HXBwDOEq+o8XsYgCzMtFT9Y1+CcUzjqBFL3xj4NTmGt0lg
 Iu644dRo/DHaEU7GPlE20vbJnrIqoxP4yyvZBLjotBUGcMVk283pyTw8vRDX7hr8cVnx BA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kcg1ktpgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 19:46:41 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P2kf2G002363
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 19:46:41 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kcg1ktpge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 19:46:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIMaG/FxE5FfjI+zcLPox6ng7VHhA/e8+ERSv1ydkwwRiFJdbyqItVwpHqDI4avduNnYnVNEiliHVDPVBe5VQzZzEFllcibw9lwLZ1nuBkOlsSRQk9O35inTFev5k/A7X9ZAmNpkOz0lQYSUdCJNKq/CaT9KP2ZI1bc3hZLe03732qm+ojI1SY9rIpKQpOBboRbj4pS/kqimkOsBcQEXJZftLQke/i1ZWqsdykOzv0zARJ+UsG4CsKucKPwcHT3MMRzMh8/q721N9nrMou2jDy0AtaqZAlqsaueXjXomOw90Qe41d8kFC4iqqs0sC2Fzda2gn4aFR3YpiNKLfH3/Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tk0kt0/HR4lpAjUUiedSCLaKz+Hm2ryYCvNbW1L/Zs=;
 b=mniMItyoCBHNMvphSViZKIPNaFPAIJKEf38KU44oKXnKjtsiEFQMaFOYNWnO6UAUdIRcGRQgkKuoopSvRlVFn/rK0FI4Nxovlc00gsnMSAmkdMlzzBnkwps67x7BpX2dAGR+tP9Mf6iWWkEIB6eSuu5cfn2EicMxIk1x2LsYrTjHCcthwqieXSi7PVSvqe4G2lFV0cEGG+pcmdwDkBVo54AgFq1A3lfHBRHoodmzcjUfnVNUaS+/36CT0mWj54NLT4v8qgxcdD2e87I01HETYOhucddR3Ixr26lh/OY/+SKytHV7s8wtVdRWFHV+H+DF5f7uWz6Gb2Y/M1yI0UKk9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 02:46:39 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%8]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 02:46:39 +0000
Message-ID: <70780f6d-9fb9-3553-a6ec-1eb9e8098583@windriver.com>
Date: Tue, 25 Oct 2022 10:46:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-oe][PATCH] ipmitool: add default iana enterprise
 numbers database
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20221024095656.292305-1-xiangyu.chen@windriver.com>
 <91f4d7befff848f9a308e5ed77b9c510@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Xiangyu Chen <xiangyu.chen@windriver.com>
In-Reply-To: <91f4d7befff848f9a308e5ed77b9c510@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: b53ea258-62c4-4eab-670b-08dab63323e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rOlCLl+zMpjRR3UBmPAledVGfqjpSJOGZUgjcYNf/PhrBSQmYrbyxaEMOIKRXaAOmgfTg02tvL+SkHuHMoQL+lesFvUDGOyaOcJ1XZz4y4GZ9MNNYHi25LZk8U+6/yTzGu51gKIfL/v1luDLNp2EluvixzHfTQcnoey01+yNsAX7+2GlrNauFFJI8EVzoDFh1hPN8AnqmJd3IDuRW7sdoPy+CIR8ETjhRM9opKj4H8b3Refujys3ZMbzUht2kK7DHTJTzqWuUpBrurwz2oOKTVPAzFF8vtZFI8FWtg5xz7VVKU21AcuANBHwddVzpYtE4EDOHlVIcLFJXdfcetor16kOw2Uri9UEM8oe+UE4dmAJ1vTx90VpBiToUrsD+3Lxb544KEy22TRMglSQEMgVn7WvjvsIDplIZO1ydo2hWa7mH6N9LV7HAJ4hpHOQvERf2c1SnEaryg+SNpTGsXSJyEGGYL1LiwWsePYgaLftO5bDavUGgjwr7MGnYI+qG4Z0iiPi/obdOyo9QMGHZQ0WxT0GQQuUe3O8mm0NpwSyN6ksxPEp43y9FYrsogis1H6GuNC3Xs96p3414kid0X/QFr1eqES51GfcdsVIz8Dcm7XOBOON2jDMlLc9n3kbcGe2oMHYdNpOa5DuQPUUaMdl3qNrEqMfzzx4C1I1uGM1ZVUe0Bk0cPwNFOI3cFs2LcTVkw41C1fTW6Yqk5co1a3Vm2ie0bkF2nP44CeiO24XovWPCjz4PYa2jtyKp7NOIBsSwcmc8TOQwXxZv+28sipUOJCLYMth7aBANOOt8FyI+A5RGuj3j409uBdfJ+BhIaXQhPcIxkSLGEad0lTy4sV79Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(451199015)(6486002)(31686004)(478600001)(31696002)(83380400001)(86362001)(45080400002)(6916009)(5660300002)(66556008)(44832011)(66476007)(53546011)(8676002)(2616005)(316002)(2906002)(4001150100001)(36756003)(186003)(4326008)(26005)(41300700001)(6506007)(38100700002)(6512007)(8936002)(66946007)(6666004)(45980500001)(43740500002)(130980200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWI5NERGS1dadFNIZ3NvaUhmSzRtT3Z3K0Fna2F4Unp5OElSQXBXNHBqckFI?=
 =?utf-8?B?aFVkeGJxSW1wUDBuaFBnV1gwRWJ3S3hBNTJRaGFSWXFJb2M0SVQzUnB5K3ZH?=
 =?utf-8?B?M1lCS3FUK0xuOWhhSVZJUVI4aVR1MzUwR3hNS1JHL2pFdUZFb1JsWDdXYWhN?=
 =?utf-8?B?VjJSOUJSQ3lIQ2QrTTNDS0xuNjhHY3Nrdy9DMnU2ZE1CQ2hqY2lwUjR2TElR?=
 =?utf-8?B?RXE1Qk5RaE9uaitjWC9FakpkWkJhMDhxUXB4bVp4a0Y1RlRyNVVJN2N2dVpL?=
 =?utf-8?B?d0tzeGl5YUlETERHRWxrYkhkOVlNaWdyZ25rRWJTeGE2QzU4UTNjSkhaNGh2?=
 =?utf-8?B?THZTWmF6VFBaZWNWbkJZeUkyeDJnRlpWYVNlZWZzR0dsaDVZZW5UYVo0MktP?=
 =?utf-8?B?NDltbUVpTEhHY0l2Ukk5cXBqZGtjRHFnT2poRHpZVUJlY0hlUHJ2Rm0rY3Ur?=
 =?utf-8?B?SGRUbk9kOVN5ZkQ3d1hBZlQyYnRXSVhRR0lDc3RrNjFyU3NnWkR1c3RjNlRJ?=
 =?utf-8?B?K1dxS0MyMWFWd3hON05DdXBIZmxTdXJzb2xxNUtQRGhvY1JIa3p0VkJaTit2?=
 =?utf-8?B?bVA3blhBVFJWTVpLQ3lScXRlTGRORnMrQWdtWFZlQXgwUjI4eEc1dEFHRTNF?=
 =?utf-8?B?aXZHbFVGc2w5aS9neHdHbGRWYUduQ0tiZEFTKzZNeC8rdW1Lb2dXYXk0S0RC?=
 =?utf-8?B?TTY0WWtMV2hrNWlpSkNmdk1hV0xYckhqZWtJMWV1eGhhcG5ONHA1aWxRVWRZ?=
 =?utf-8?B?WVdvSUZhT3oydXAvdTlicmdDa1JkTW1GM0FPRTNkQ2N5Q1BrdjdxaWczMWpO?=
 =?utf-8?B?Z1NYQjRncTVaV05Rdm4zSnN3RDl4eVJ0MytUQVNlYjVEbktWcTBrNWRKWjBz?=
 =?utf-8?B?VDZsSmlqdEJtUUIwUzVGVGhtcjdyR0FBdWcwSE9BMGNEQXdiVEpIbXJLbjZC?=
 =?utf-8?B?ZEJjdDF1dFpsakxXaXNCd0prLzhiQTU0b0hjaWdLUjN4TmttWFdZRldtZ3dL?=
 =?utf-8?B?Z2FFcFNyL2VIbTVZbVZ0NHNra1VuNXl1YTZhUFhDVjBuK3RhaXFqN2pNTnhM?=
 =?utf-8?B?NjRYZTVMTmhnNWxySTJyTU5ERFVEb0dvWTJZWUVFSk1uTVVlOGdoNGZpWWEw?=
 =?utf-8?B?eHNXN29xajFrYkorU3RPbmw4ZzE0TFgzVnNScFhoNy95RnRNSEg1Q0tqZmJW?=
 =?utf-8?B?ZnVublVqT2ZmM25CNEdVREkvd0FkREVmUkNnK3Nsb1M4NmQrRDhRQ011R2dZ?=
 =?utf-8?B?YmNvdlZGYmowWHEyN1kzNlFiSUo0aldrTU9XTlRuVTY3ays3ejVZN256UXJS?=
 =?utf-8?B?THcrY0NJU2VTZDZKZTRGY2R2OStVVlp6VkxheUhESzVhdlM4dk9saG9vZm8z?=
 =?utf-8?B?QUdkS1pjRWp3WEIyVTFzOWYwWDd3TVBxM21BVWVDOGkyb2ZIb0Q2V05RelhM?=
 =?utf-8?B?WTV2bmVsL05YYThqNUovTWNQQjh1b29nN3kyQ2h6MjIzNmlmOGh4M0o4N2h0?=
 =?utf-8?B?bk95VllsMk54cXhCR2FtdTB2ajU0RHJaL3pWMWpJWDRrNTFyY0NUdFZOOXZM?=
 =?utf-8?B?VzdnOGMvMlRmbTFYRmZuU3FpMjRXb3hyaUlHZkhxYVZBRVNidUNPTGZJWS9v?=
 =?utf-8?B?d0E0R1Vtc0E2L1liVnRWNzFNZ2huR3FIdldCUlhpWnloRlVJbFphcjVldVQ2?=
 =?utf-8?B?VG1kV2UvYm5oUVBBalF5V1lESHNmOEdUSTlON1prVzU5SENCQkdjRmY0blhB?=
 =?utf-8?B?eUhYL1NNZVNnWmJzRmxjcWIzVWxHNVFXYkVOZDdVUjB3MUdnbG5MenNPTWxV?=
 =?utf-8?B?UXNBNFdhWXh0SUJxQyszL3l0bE1hWkRQaHE4NHhJTmc1SzdPN3M4UkkvaG9I?=
 =?utf-8?B?Yk1tSXA3WmljSzBDajdWSnZJRHJXTmJqWFZ1ajNLZFZ0Mnl2alZoVTRmQmhh?=
 =?utf-8?B?SUk4dDd2Y2hEb3dsdzNJRXo1dHlLNUd4Yk81dktxSDI3dnJ4N1BXMDNxOXFn?=
 =?utf-8?B?WmZpZnNKYjVqQyt2UjA0amtHajBqaER3VDQ0bkFFeURJYk1keWsyMHRCVlFD?=
 =?utf-8?B?eEZMdE80d0lHeXpzN3lBZzVPREM2S3AxeVgxYm5CdlhmUHNFb0RIdnNFbU9j?=
 =?utf-8?B?aDJSdWFFdUFaeGtOV3F3b2h4dy9CRTZydUY5Wm5xQy9aNEIxZk96NWF2Qmt6?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53ea258-62c4-4eab-670b-08dab63323e1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 02:46:39.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hB+gVWec6B+x75Q+urx8hciTQd00VgiPngOeKFw2B3HAg3NOqJQaQcOWFxgfWaXvdOtzkTjTl/SCZ9/p+HgqjA1NI+x4Dp/dhXpShitdDe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
X-Proofpoint-ORIG-GUID: fqY2F9YIq1lr4u39IRMckucfBDT4HGjV
X-Proofpoint-GUID: HAd4nLeqKyjNG7tKMnIarOAHXIglTH9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 02:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99300


On 10/25/22 00:30, Peter Kjellerstedt wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Xiangyu Chen
>> Sent: den 24 oktober 2022 11:57
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH] ipmitool: add default iana enterprise numbers database
>>
>> When using default configuration without add IANA_ENTERPRISE_NUMBERS and
>> SRC_URI in a bbappend, the ipmitool would report an error as below:
>>
>> "
>> root@intel-x86-64:~# ipmitool -I open bmc getenables
>> IANA PEN registry open failed: No such file or directory
>> "
>>
>> Add a default iana enterprise numbers database to avoid the error
>> happen if using ipmitool default bb configuration.
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   .../ipmitool/ipmitool/iana-enterprise-numbers | 237682 +++++++++++++++
>>   .../ipmitool/ipmitool_1.8.19.bb               |      6 +-
>>   2 files changed, 237686 insertions(+), 2 deletions(-)
>>   create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers
>>
>> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers b/meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers
>> new file mode 100644
>> index 000000000..f8c328796
>> --- /dev/null
> [cut 237k+ lines... ]
>
> For the benefit of all members of this list, do not send a 237k+
> lines patch as a mail! The resulting mail was 20 MB. It took my
> Outlook client over two hours to create this response (where I
> then had to remove most of those 237k+ lines again)...
>
> Instead push the change to some public repository. For
> OpenEmbedded you should be able to use the github repository and
> create a merge request that way (and let us hope that Khem does
> not have automatic tooling that sends all merge requests as
> patches to the mailing list...)

sorry about that, i'll pay attention to check the size next time.

I've created a merge request on github 
(https://github.com/openembedded/meta-openembedded/pull/629)

>> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers
>> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
>> index 0a600e23b..e166ea213 100644
>> --- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
>> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
>> @@ -27,9 +27,11 @@ SRC_URI = "git://github.com/ipmitool/ipmitool;protocol=https;branch=master \
>>              file://0001-ipmi_fru.c-Provide-missing-function-declarations.patch \
>>              file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch \
>>              "
>> -IANA_ENTERPRISE_NUMBERS ?= ""
>>
>> -# Add these via bbappend if this database is needed by the system
>> +# Default IANA enterprise database version is 2022-10-24
>> +IANA_ENTERPRISE_NUMBERS ?= "file://iana-enterprise-numbers"
> If you compress the file with xz, the size is reduced to a third.
> Bitbake will then uncompress it automatically during do_unpack().
Sure, I used a xz instead of the pure text file in latest version merge 
request.
>
>> +
>> +# Add these via bbappend if the latest version database is needed by the system
>>   #IANA_ENTERPRISE_NUMBERS ?= "http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
> Change "?=" to "=", or the suggestion to add it as a bbappend will
> not work.
I have changed ?= to = in latest version merge request.
>>   #SRC_URI[iana-enterprise-numbers.sha256sum] = "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
>>
>> --
>> 2.34.1
> //Peter
>

