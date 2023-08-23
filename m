Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BBEEE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 09:21:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7615.1692782474648936295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 02:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KyX92aWC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75991bd149=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N9IkkC032177
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 02:21:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=2ahRXznT2GZ9lMLzTpikurWPtLcUvr3ZZL4CgDzhp50=; b=
	KyX92aWCsQS+9GO8h1hQCXyHosrr/W4bVxHdfeh1Am8+jioUGLie5FlpxpFgTu8T
	WdXxuL4vU8fkj7V9JsXfAAHF1HsEI6ymEPQFnW+fIcAZuN9GApsEUyoYwDqyuO3l
	QDNmaDYtPsn90G6SFPex2UzAzVue7/C++GaVqVBfrXocvTV+RZZ9DKGLtWXRvsmc
	vc/ut2A1On941MGgRIdNjJkr7ZWbYsGxufln9j9363nlx893fTzmUmo1w0l+sfA+
	lpLQPY+1Th7b7O/V5KIYvA6ub4YTQbgkuuQI0h+BZXbKIVhTjupcbLTaDCIFWrO5
	zYTU09w/4RFDs80GvITSZw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20dgkj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 02:21:13 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37N9LDfV005619;
	Wed, 23 Aug 2023 02:21:13 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20dgkj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 02:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ch2EKjgiYUnpw7UBNgIm2R0hj3B9W/CoahgE4vSH8qY01Qxt/tnzoC/0ca4Mu4uCmBkVb/QNqbC2fZPLUI30ORbyl2Ejzg/ca9+8CXaguXD0SXTCkKCTWygYktkA7yL738eCcbtNRlj7bwatznw3nCrdmaqOA9CK7SdnsjVcy5TuNfx0E4YB4ujsRP/RkBDt9t+D1gNS2RF57FRCBCmr1c+fLhSL6iseWotJPyYVTS2WIZNDBcTd8wmird9VjHt3EuMa6r+jMI2fIF0lb+59bxxWsCVpiXIRXPwp5lOQ2zZYXAxF+v9Cs6Lh9zcI79UlkPQR3dZpfI9Y3cdoXYvAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ahRXznT2GZ9lMLzTpikurWPtLcUvr3ZZL4CgDzhp50=;
 b=R/bcli32BPNd5SQ7/8os+aI70r2u1yzATgHLljlwkngjET8yCzjuE6HDnrQ0bE/NEa51jv0pBpQ3pyGEOlIFMACQ5mbaX9D2/6PuwouRaqSSp3OZWArDQ9cOvp6xL+w9TycEWqREeu60GM6LNTabYqygTxqRgtjLJrDBqLLeXHeZskt/p4Sq/rvFwRTgY+kVhXoc+zEeK7zwd5rdPPFaXXjskh+pQdpb+R3dT9P2idVz/dzPZCKK4eeVnhqMSLIoqWasbThxdNv6uXKxNzghoU+0PosZ2DQKXY4wJx/UuSwsZGXZ03+FTIBctONj1tmojscClz6rVlnwmgWwJoQQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Wed, 23 Aug 2023 09:21:10 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::e636:7625:3352:5e8d]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::e636:7625:3352:5e8d%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 09:21:09 +0000
Message-ID: <99e71938-2875-aac8-5ca2-d1d6b1149936@windriver.com>
Date: Wed, 23 Aug 2023 14:48:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/2]
 python3-requests-toolbelt: upgrade 0.9.1 -> 0.10.1
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        "akuster808@gmail.com" <akuster808@gmail.com>
References: <20230823072624.1686194-1-narpat.mali@windriver.com>
 <389e85d54acb72a6cd763f37924fe91d077a078c.camel@intel.com>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <389e85d54acb72a6cd763f37924fe91d077a078c.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:510:f::14) To BN9PR11MB5545.namprd11.prod.outlook.com
 (2603:10b6:408:102::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5545:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5209cb-312b-4b90-5ab4-08dba3ba4960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ar8Y+0VVFOIzL2xAChXE+u80g0xl78mHg4AKdvg0w0m7GzsC+8pjTq+B7rAXxUOVptzqLeK5nNCcdJ1GJao82cOqOjqh9gJeoV6ag8aspIxv46SowaANib29UuNYNJVBte4Ta7OuWC1TSm197l95M5uD/Vfs7ILwlPvmjV7cLQ7+ykJ4FTsFnAOmRuqo+CDuQJ99jXRvdr/XUp7YJHVK3Xbiw9QE0Y+FtvUGgSjQaxDxUbZLtv30SlT6Uc9Yh/xQbmuDmdhJBjWpFpt0CC32CBZhxG77ricEjT7/RK+UVNnfXKUV4Adx7flSe8K/aiN9WiqwgmLHD8caBCkjUwZUrU9T/5sEYrGRtFbz2JbDolElWX1tG4Qqkr87rUOWdkd2O1KZOxAGdRqVKTG0eiBP+IuI9zUtraB3GTEFFTByGL+eaIdw0quZ+AnfWQ9wsUebMaANpF/AZahbqgKnno3RIlNQkRTTqTqHcKt/Dog180DvE5iNTE4Nc39FeEOm8b5kOFWazjdQ8LysuBtBjo3p230LQNBNQMnbcFbgsfq/PwmONpKNAJTOwD8vf708JMV1HN4FX/IZWJ1upWtFRWU+9cwX+CuypwnPznN5Uzl7OtPmU90E4a41zEwe76MehCWbxOOeJrBGY8r+zyvGkkEoJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39840400004)(1800799009)(186009)(451199024)(66476007)(66556008)(66946007)(6512007)(316002)(66899024)(110136005)(8676002)(8936002)(2616005)(966005)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(53546011)(55236004)(83380400001)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUpoQUdBMmMrWWhXM2o2cTFwSjhudmw0bmRZMjVqbGlOMVo0WlpLR1hYZHBI?=
 =?utf-8?B?VjZaVmVxYjNoQXJWeWVPVzRKb0tKOEFqRDJkeVdYL1RRV0ExQVRBZmY3Wm4v?=
 =?utf-8?B?eDd3cXd5V2hsbUEzN1NsNVRDZSt4RFlZN0dWYzNLMUthS3Z0eVQ5UklRUXVI?=
 =?utf-8?B?NjFRb2RxamdqSmVZVzFEV1ZKTFhTcWtLWmswSFRYS2xGSm04L0pvMDU0VVJa?=
 =?utf-8?B?WXQwU3o4VXROSE1sb0FmWW5ZclVmWTJ6TVhSZkxmYnNuS3Vid0M1VGd3TTZo?=
 =?utf-8?B?RS9tSUNmN1pkQjg3VnZXL2tJVFA0eVZtVHl1T2NuUXJJdlpZc1NoVzk4WEND?=
 =?utf-8?B?RDgraHUxSG94WVZNZnlMQjJMYVI4cVFTYW1tUjI2QzlQeTNvdEJJdmg2ODdz?=
 =?utf-8?B?ckZuWm5SOWxRS1YrK20rZ1R6QjYrS2VNc2w2bHVNZnVoek1adlVjWGN0azBF?=
 =?utf-8?B?Zm9ISEFLSFpjeloycXhGVTlMQkZnWG1QdG1pbDhNSHh0SXFnL3MySDc2L1lB?=
 =?utf-8?B?T1BMUzJ5U2t6MXpHbUFGQUZBOTdBd0dtazl3bEJkanlYZTcxS2Yzb3dRNHc0?=
 =?utf-8?B?MW9JZkZhalNFWlhLQzVrK0N0aFZXNlBNQnR2ektWY21tdjJoL0ZzN3VJUERT?=
 =?utf-8?B?bVkvZ016QlZ4Wko3ZkZBTDVBaVU3ZDYxbmVsUWZnZUNJSnFmdG1JUnpBdlBp?=
 =?utf-8?B?bU8vWVA4Qnh4NHc5NEgyNW1UMzRoRGNCL3NBbmorbHp5cUhzTmFpUGFrNVhD?=
 =?utf-8?B?SE15T3RkWTVEeGhJR2JFbTdKbmlabXZ3Ym5wdG11N0Y0dmtubFE5bmdpVHNS?=
 =?utf-8?B?SGFDS1FyQWZkbTdqNUdxTnp4WDg0MFJrdGp0TUY4aGFMeWM2NGdlQTBQQmhD?=
 =?utf-8?B?Z0lBb1FMak93eUlRUkJHZzFyb3dyeEhRd0Z5bUU1L2FlTGhpSVJpbDNjMWt0?=
 =?utf-8?B?R1RLTG5hUFMxSExZTC9uYjNwZWNuekEyVTRhM0VETytEM3QrK2FpN1F4QzFV?=
 =?utf-8?B?aEdnSTNpWmRjRkxBWjM2aUFaL1hoc2J1UGdmRUN3ZEJKV0hNYTlhaUxrZVZY?=
 =?utf-8?B?Nkl0L2VQa05xTGpsVEN6bHFUV2FjUCtKQlFOQzRYUnVFQ1VNMlg1OGVKUkk1?=
 =?utf-8?B?bEcySkVHQVJRZ3pLNXJyYVJaM1VzMlphc2dWK2JFYlVzd2kyaG1oSjlha1ZO?=
 =?utf-8?B?MTVqNGdIRjAxOXhlQkw3Z0t3RWh3M1ZEYXJSYS9PaDY4TzFzeUEvK0ZwclNz?=
 =?utf-8?B?T05rWHVzd2xxT3hPWnNvSTFER3lvUnlWenRhclpHL3U1Q3ZkaFhSWGI2OWRX?=
 =?utf-8?B?OERQY2pLdXl5cnU1R1NWc0tUU0NCRitPM0szM0lTYlB3aHFhZU9QR3hiSzNj?=
 =?utf-8?B?dEQwWTVhZ091aWRLWFlNeWtvS2sxRVp0MlJBVDdyTi9qSFFmbUlXTFJZTjhM?=
 =?utf-8?B?Y0JMTXVwMGFtSjVzQWtNcWpqa251TzQ3ZjkzSVJiaVlEN0lkVm1rZE1OMGh4?=
 =?utf-8?B?ZnVvVFFqRGxMQmx5akp1MTZCSkVNbDZJeEphekV1WmMxZ0JKdG1tMEI0anNz?=
 =?utf-8?B?ZmFMOERaeVhrcE56ZWN5SkZxaHZWWkhmOWY5Um0xRkZFVVVWVTB5a1k0ZjB4?=
 =?utf-8?B?OGRwV01jSjNVY3NXY1pKMnNOQWpyT1o0UEEvdnBrNkRyV1NFajl4SmlIaUJG?=
 =?utf-8?B?RUhwWkNlVitLR21qK3RPaU9sNXcwTFg0RGw0ZWx6M3Q0RHNMVHBBdnpBQWY1?=
 =?utf-8?B?U01GbXZuMDRPWCs2YkVlUzNSUFJ3c0pUTTFCQ2NjOGZSbHEzdzNCU0tGY1BK?=
 =?utf-8?B?STkxTzVFd0RHOEVLdmUwb3NlRjZGc2JnS2hGY1k5K2ZuRy9iaWdjSHh4VlpK?=
 =?utf-8?B?VmtpZ2NIWWFUNFhyU3YrOER1WGZyblZiR1JsV1JOdzdmMEtXVVp0RzgxNHlW?=
 =?utf-8?B?eEdyd21XdEpwRVVlRXROb2tValFsNVVhMkdmazFOTEdXb0NxWk9EZmh4MUc5?=
 =?utf-8?B?VmhJM3FUODRVV245SjBYSEs1WTR1bGkzM01xOWZ4V1NQK1JqZ212Ky96U2Uz?=
 =?utf-8?B?Uk12dndxNXlPWll5QnlTYnJrWnFTeHN6QlEzSGhrZk9MRkY1Y29HU3BTcHV1?=
 =?utf-8?B?QkVCZ1dBRG5WbmZmZE1EeHh3MjFyaHpDYmlDTGdiMjBRRzJhL3lpR0lwdnBS?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5209cb-312b-4b90-5ab4-08dba3ba4960
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 09:21:09.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/3GJ7UlnIw4hBnmXQ/9We2TTxzgVFf/VIRVFsM3EW+KqYBoen9xhobkst8yVEyIAwguc8mMPziJdR/zzwyvQFhHaaxVQl0AChloUo+Jj9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
X-Proofpoint-ORIG-GUID: QAqOusPqX4vdQV4SCEiMTeKLkF0NNqNN
X-Proofpoint-GUID: tiJTK_51aXaXSgC-b0ROPqtezJj5fhA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_06,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2308230085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 09:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104532


On 23-08-2023 13:43, Mittal, Anuj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 2023-08-23 at 07:26 +0000, Narpat Mali via
> lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> Changelog:
>> https://pyup.io/packages/pypi/requests-toolbelt/changelog
>> https://github.com/requests/toolbelt/blob/master/HISTORY.rst
>>
>> - License-Update: url of License changed from http to https.
>> - Fixing missing newline in dump utility.
>> - Add support for preparing requests in BaseUrlSession.
>> - Fix urllib3 warning to only emit on X509Adapter usage
>>
>> Upstream master patches:
>> 0.9.1 -> 0.10.0  :
>> https://git.openembedded.org/meta-openembedded/commit/?id=a4f2646ef27a3f27bc607d57b8166071f307426f
>> 0.10.0 -> 0.10.1 :
>> https://git.openembedded.org/meta-openembedded/commit/?id=b5cd6f6164eb3ab0403f610236ac0cbbe5459671
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>>   ...lbelt_0.9.1.bb => python3-requests-toolbelt_0.10.1.bb} | 8 +++---
>> --
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>   rename meta-python/recipes-devtools/python/{python3-requests-
>> toolbelt_0.9.1.bb => python3-requests-toolbelt_0.10.1.bb} (70%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-requests-
>> toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-
>> requests-toolbelt_0.10.1.bb
>> similarity index 70%
>> rename from meta-python/recipes-devtools/python/python3-requests-
>> toolbelt_0.9.1.bb
>> rename to meta-python/recipes-devtools/python/python3-requests-
>> toolbelt_0.10.1.bb
>> index 72ad7a6180..c39950ab5d 100644
>> --- a/meta-python/recipes-devtools/python/python3-requests-
>> toolbelt_0.9.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-requests-
>> toolbelt_0.10.1.bb
>> @@ -3,14 +3,12 @@ HOMEPAGE = "https://toolbelt.readthedocs.org"
>>   AUTHOR = "Ian Cordasco, Cory Benfield"
>>
>>   LICENSE = "Apache-2.0"
>> -LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
>>
>>   SRC_URI = "file://run-ptest \
>> -
>> file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
>>   \
>> -           "
> The patch itself should also be removed?

Oh yes, missed it.

Please ignore this, will send the v2 patch with that patch removed.

../Narpat

>
> Thanks,
>
> Anuj
>
>> +          "
>>
>> -SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
>> -SRC_URI[sha256sum] =
>> "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
>> +SRC_URI[sha256sum] =
>> "62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d"
>>
>>   inherit pypi setuptools3 ptest
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104529):
>> https://lists.openembedded.org/g/openembedded-devel/message/104529
>> Mute This Topic: https://lists.openembedded.org/mt/100910607/3616702
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-devel/unsub [
>> anuj.mittal@intel.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

