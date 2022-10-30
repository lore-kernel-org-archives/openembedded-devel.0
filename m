Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEF6C433FE
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 02:08:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.4678.1667095674879710307
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 19:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=by3rTr0k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83027ac7d5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29U27s6R014988
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 19:07:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=pCm/XXtZVY897SpwJw085KkiUL0mR1mVEpIm4AXRs+0=;
 b=by3rTr0kc64SAt9vNhEDl1ezoUCZV2fo4kfufyK3f/SjhqAvauLMaSt/0wVWdgUCUfBI
 Qib+r+igFbfZFnO+gOiViniQEb54yA9fz5EGfykpGsbT/hVsNp5B8DiKN1yYZPaai3Pq
 NTkFC2MjxwbP6lq09e9ZrqpWrvbK88awLLOiGRe9rixWYb6xIlF2WJjrAEuBlE9yESbu
 MZQvG7Ai3hDIMlWrwmNesA3YbWPO8ERhGj4n2Orx7kfKtC0ISb+qGygLMVEaqtx/15/v
 LUHIN+nwKtGl11cVf+Ji3JL4mlPrgH+F0t470rMg5/FkD7VhTgcwCEvrUDJZEeY4zGVM sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgyf3rfh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 19:07:54 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29U27sCL014970
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 19:07:54 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgyf3rfh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Oct 2022 19:07:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6YFQYuSd2EMFYFL7ZKEP0kVH5a+noT/XDoC+PNFwxIEneL1vxzxJk1TyjE4eQwNNPZoIOyWT8dejmG5grk0JCCmtEuofhW4DuoL0pPUWPJIYtQDbaf/gJwOe2bubZVRnmcd9zlgF1Y7aGK+QJUd1IIno52dDCwdg/s2gcilhV6SdcYmY2iOFwyDAso+3cG+F6n1aeDoNdXWnw1GDFS/z6egzNtKnYJ26NFBCQtVvuhFnpXCnQ9KUfnb/YG9OpsF5ZkSwjvzmmtexxIQRYwWfL2c3C855j/E+u2oUGAWXPlMbtT68d2e0yfaZQph/h9N7f3YLWKsbS+Zl7ph9rx+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCm/XXtZVY897SpwJw085KkiUL0mR1mVEpIm4AXRs+0=;
 b=QOIVIoyMs9QPHj41s/xJ8gtIkIXM3BjW85No7ZuW61kYBqPUnxt56y7klKgmFo1BNB33NdgEEppGD+d2ptsLlD/2TgofpkDrsVHkYEo/7RGMunEEh8CBBg0tcYqMp78+oIc3arZPOKIiIm5+DsOSSmjY08bb1aH3Esw/zz+w4Oo8BkEBFknnjqGXu4wGGfv0XFJZSHoegN/QB95RdiSzbkrsgGPLdL2BDd8usZAoKfkp2O16jCsKl32+r52lLAiAiWyVF3lRjmSMwuTkfidKewUpU4ndufE7hG+iuL8IYd8Ui3d1PerhAfnn33DIMVsa8B7lVC2VeUetLhGpH6kQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Sun, 30 Oct
 2022 02:07:50 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5769.015; Sun, 30 Oct 2022
 02:07:50 +0000
Message-ID: <77bd11cb-1a37-44f0-6931-e9aa9619bc03@windriver.com>
Date: Sat, 29 Oct 2022 22:07:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] [meta-oe][PATCH] grpc: Update to 1.50.x release
Content-Language: en-CA
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20221018173118.784429-1-raj.khem@gmail.com>
 <7f680b57-19b4-d43e-df23-e774b259416e@windriver.com>
 <CAMKF1spqB47ApZms=BVwe3eCpLZbDLj4e4jKYqShmeCZ9uOgDA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1spqB47ApZms=BVwe3eCpLZbDLj4e4jKYqShmeCZ9uOgDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 6937dd13-8191-4cab-f635-08daba1b8bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DWtFu/O/jXU2BJ3qaK1vkiJxl6XEK+qrRaBHEYr3dT862XasFxu+/z1sQyEnuDL+rYBrfWciPE0p8YF0XICkqrG+LohkPptJJ4AnTRfb1lf4fcsFj+GBKotgSywUCsWcmVKMugpFBPmpsPuvum34BX45vPO8ypEtKalYqp686pDRjQ4uf+FMoPtG8lJm/Bmnp1dne+MGS4K5gpVRFbBH+kCF/wKNwlNjkxoGZ9rofUUGN0dNLS2UyVJtONnAl/3VA6i+ouo4TP2/6GqbPK+phghls1ztmH22AOyTSkC0oNIcshZO1iryJqwIaJsnbYQkKr/CzRtxAm2hH+WY+ge4bDzEWdPpBy+wnOt68rFX0DedgPSQqRDoclwvqp2jUBzHaH+6SOG6RE9n8vq3BFLql9rckPNmDD/KZHDt6N6Fva5GIZJ75aS6GrvxBAmYVDy8aJdYx8pSDYv+3sOE6/YezDSTdhgrrIKXkb7jTKi7m33H9QEnTEYb9OZ1PFf9FhXjSuUxv5GWniFdFJ3/A8vx1mWNaiIaIKOZmQobG1Xqq1e85XRIimU+xJo8LEuu1xpkmkWufC4xF9dwRUrdvY7Md6NK9+hd73iJIJSHK2b3zIn60bEROw2gT9kTS54lgPkgIBKyTonqpFltsbl91WfbFH6V8rZC87Jt/qFvNitSqATuE8bvc0IBH1Xt8pZmi/pf9bvQFvwJyW6hDdjxJatXQJw0AIkpktwDk+d4OaJvlZJgtH1C9V2YlgbujajI/lQ/XM0ZD/llTGAon0nmEAQRtSUuA5gLpKnv0zak2EAWvqiYma8gPkD4M3/drJl2b0dcT4jXnkOxUUbNjl4FJEP/QIJpuCwhj2ifch03HRUokabS3KI40YmezABqUX7I1wFw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(136003)(39830400003)(451199015)(316002)(6916009)(6666004)(478600001)(41300700001)(66899015)(966005)(31686004)(6506007)(66946007)(66556008)(4326008)(8676002)(6486002)(66476007)(53546011)(2616005)(186003)(15650500001)(8936002)(5660300002)(2906002)(4001150100001)(6512007)(83380400001)(26005)(36756003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1lIWnJtc2tzczhhb0JTby9GZUpXTG10MVYxb2tIVVQwb2dZMHV5RC96MmlB?=
 =?utf-8?B?Q01RdmtEbmVyRHA0Y0t5RzJ4R2g0Sm5nVWVqc3gwanRnVy95Rkl3dWJ4d2Nq?=
 =?utf-8?B?OXhSOWJUS0xKcHMxNElmYmpuZ2dHZG56aHBDNVZDTTBML0lVL3B6VUd5Q0Ew?=
 =?utf-8?B?VG1QQXF4aUI2RzJpNDYyRlhZMDhJU29lSTFtSU5CeVFwTCt2QjVaMWgwcWpW?=
 =?utf-8?B?aG40Syt1bkE5K2dCbitWcUdlUmdBTVNZdUhpMitsekROcUFTdXR5OUZpczRB?=
 =?utf-8?B?cU5lbnF3amIwV1l3aWpsVVRlL3h5Rk1maXAxeHVSbGpoSUpFbkRsNDNXZndo?=
 =?utf-8?B?KzRSZHFWQUJLU2JjaWtnby9hTWVzcnBlN0dhaWo5UllvYnpZS3NELytka0k3?=
 =?utf-8?B?Y2JHUUgzMEM5RDhzUXBUb215cVRXQU1ZeVNTY0RQTGU4WFJ4YldsWnhuMS93?=
 =?utf-8?B?TVBROWdzVi83RCtCejB2OC84WkhqY0JiREtvbXJQSXc2ejhZcU0xU3BUYWth?=
 =?utf-8?B?QXpyN0FVSktZZnBVZ2s1UVZsQy9qTFEwNHVWc0JqeDRxSnlFRVNFOU0wUTQ5?=
 =?utf-8?B?WmYxRGtEWlZ5bmtoMjdRenVYa1N5N3lpSk5DWUNUbkpETnJqMkxPeWV4TDVB?=
 =?utf-8?B?VXIvbitUOWppT2xXTUluMDBXT2ZNU2xoa1ZiVVd6cWpua2hQTFRjTDBSbVpM?=
 =?utf-8?B?L1ZCTVZSTFpPVjNPMmdjNjJjMXNNbDRGTFRLZXB3dFIxcmtOc1lRWkxrV0Y3?=
 =?utf-8?B?dFRKaXkxNTlCUitMQTBRbWtEYVVVTXhqNTQvUUcyTUZoUFozd1A0NmcrWS9V?=
 =?utf-8?B?cTRqaWVzWkdDcmFHUGxyWGM0MWl3TkllSHR0UUVxdDQwQVRkc2wvK0hxbW1o?=
 =?utf-8?B?MFdQeEtuOEZHZ0NBclNxNEZwWmJmZ2ZCMm4xZnRNU0RxcGxyVzRMYkJaVkpR?=
 =?utf-8?B?RUJRUWdRWnN2a0k5YjFjbmkwbWxJYzR0WUZRK2MrWHRGeG1lMUJBUExKcmdp?=
 =?utf-8?B?MTcvL3N1WmY4bm1XdEJkRVNnUHA5ZGplQW90Y2paVktabnFMd1diZStHWVFy?=
 =?utf-8?B?ZVpFZjZwbjVEYmxGQVF0b2owSFpNRDduSTV6Y0hZa2Z5bHhKV0dhZnMvN3lw?=
 =?utf-8?B?cnBBOGFoVlVTWlRSYzlIenRvYnh5UTJhZlFUaTdhSTMvcXVvY2J4T0dYU3Rt?=
 =?utf-8?B?Z0VZWUcvaGZiMFhXTWF4QzNOQy9JRjJSb2dBbzFncjduTTFxVTAybUVua0tN?=
 =?utf-8?B?WjNKRUNxNU4vMUN2WWQxdjh3QU1MUkNyM3UrYzNjd2JvMTZWYVg1K0pwNFRh?=
 =?utf-8?B?Q2QzdVFiSGVaN1JtT1llc0hJTnIyTGpoM3JQL0hpZEU2T3RtcmhxUi9PVGRJ?=
 =?utf-8?B?ZFUvUmQ1YVdyWW5mRXB5L3RQMkdMZTJwazMwR0Z5eWhmN2JSWEZaV2l2Y1BQ?=
 =?utf-8?B?Y2NUaEFBN3d4UUErTlpGNmtqQllZZFh1TTU0RUxpK3BlZ1Y1aFFrUmsxYk01?=
 =?utf-8?B?aU5UK1BWMlYvaTc0UzBlWVlRSktCOUhWL1RGNXNnUDhiSytIRURwdEhvSlF1?=
 =?utf-8?B?eDBwMXpOdTZkaDQ5YkMzTThsYmFha2RrM3A3bUFBb1hsa2orNmNvU0Z6cm5Z?=
 =?utf-8?B?RGF2ZlZFS3BKSDNsUzRxU1ZQSEptVUZ2eXBIUTY1QWMwRkFqQm9RMFExSE1V?=
 =?utf-8?B?MjNSMWtTRGVuSk9ML1dGRGxRWkVFdGdsMUNRN2NBbk1GSnZxT0RMcXBud1h5?=
 =?utf-8?B?dHVLb3FJQmxSM1BLaUt0dGJ2Ymk2YXFRQzMrQTJjQXpXdlNTZnJQN0lycGpW?=
 =?utf-8?B?aGtBbmNpbVhkYzlLekNGQU1HdXV3Z3JyR3ZWemJzY3ZVVjJhSEx5RWJTV3dz?=
 =?utf-8?B?dmRrT1hFV0lFTVl1aVZLalZLWCtVRk13R21wQ0N4RHpCM2lnVjRUNjhsa1pS?=
 =?utf-8?B?dHVFMktsVlgwUm8xRFNmK01Rd2J4MjRtSlZ0b1NNekx5WWo1TmM5MVFTbEx1?=
 =?utf-8?B?SjBMRkpBdHRERmRZWWE3dGRIOVlPWEFZZFh5OENVRnFidWJhYmFxcFRORTl4?=
 =?utf-8?B?NnBYT2Q0WVhEUTZUOWZMVUc0MEt5anpRTFRocUdTa2JySVpqUkpMbnJQbW9t?=
 =?utf-8?B?Sk15Szg0TEgwNHV1cithUVZROCtRWVFERm1Cb0ZpNVpPbXUyZFc3dlFyd2VJ?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6937dd13-8191-4cab-f635-08daba1b8bdc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2022 02:07:50.1462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zLynBO89qN+Yusdxc2btzTjBcTRza1KOttJ3a1AcQvWLPqM3FDh3WGMUbiZjMXmzblNeYqPGJKWLYORDzppZW6/p64u7JU31stGYMrdztU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
X-Proofpoint-ORIG-GUID: qJpIyG5tuScuf089Ta2J3Tdkjf86Zl3f
X-Proofpoint-GUID: xyv1BhaDl5a0Z6UN_OvhoxyXIq--Bmea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-29_16,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210300011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 02:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99347

On 2022-10-29 19:56, Khem Raj wrote:
> On Sat, Oct 29, 2022 at 2:08 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>>
>> On 2022-10-18 13:31, Khem Raj wrote:
>>
>> License-update: Include MPL-2.0 [1]
>>
>> Add missing BSD 3-clause and MPL-2.0 to license field
>>
>> Switch to git submodules since its using locked versions of some
>> components like opencensus-proto
>>
>> [1] https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../grpc/{grpc_1.45.2.bb => grpc_1.50.0.bb}            | 10 +++++-----
>>
>>
>> Is anyone else seeing:
>>
>> error: #error "C++ versions less than C++14 are not supported."
>>
>>
>> i.e.
>>
>> TOPDIR/tmp-glibc/hosttools/g++ -Dgpr_EXPORTS \
>> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/include \
>> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git \
>> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/address_sorting/include \
>> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upb-generated \
>> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upbdefs-generated \
>> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/upb \
>> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/xxhash \
>> -isystemTOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include \
>> -O2 -pipe -Wl,--no-as-needed -fPIC -std=c++11 \
>> -MD -MT \
>> CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
>> -MF \
>> CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o.d \
>> -o \
>> CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
>> -c \
>> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc
>> In file included from
>> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/config.h:86,
>> from
>> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/attributes.h:37, \
>> from \
>> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc:25: \
>> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/policy_checks.h:79:2: \
>> error: #error "C++ versions less than C++14 are not supported."
>> 79 | #error "C++ versions less than C++14 are not supported." \
>> | ^~~~~
>>
>>
>> Happening for a variety of distros.
>>
>> fedora: 34, 35, 36, ubuntu: 1804, 2004, opensuse153
> 
> you seem to be still building 1.45.2 and the upgrade to 1.50x fixed
> exactly this.

Huh, look at that.

Thanks Khem.
../Randy

> 
>>
>>
>> ../Randy
>>
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>   rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.50.0.bb} (90%)
>>
>> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
>> similarity index 90%
>> rename from meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
>> rename to meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
>> index c2f952fc64..8efd9321ca 100644
>> --- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
>> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
>> @@ -3,8 +3,8 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
>>   (C++, Node.js, Python, Ruby, Objective-C, PHP, C#)"
>>   HOMEPAGE = "https://github.com/grpc/grpc"
>>   SECTION = "libs"
>> -LICENSE = "Apache-2.0"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6e4cf218112648d22420a84281b68b88"
>> +LICENSE = "Apache-2.0 && BSD-3-Clause && MPL-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
>>
>>   DEPENDS = "c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
>>   DEPENDS:append:class-target = " googletest grpc-native "
>> @@ -20,9 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
>>   # RDEPENDS:${PN}-dev += "${PN}-compiler"
>>
>>   S = "${WORKDIR}/git"
>> -SRCREV_grpc = "b39ffcc425ea990a537f98ec6fe6a1dcb90470d7"
>> -BRANCH = "v1.45.x"
>> -SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>> +SRCREV_grpc = "91091e3668144de9c6aa392f496bb7639f7025a7"
>> +BRANCH = "v1.50.x"
>> +SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>>              file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
>>              file://0001-cmake-add-separate-export-for-plugin-targets.patch \
>>              file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#99241): https://lists.openembedded.org/g/openembedded-devel/message/99241
>> Mute This Topic: https://lists.openembedded.org/mt/94413640/3616765
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux

-- 
# Randy MacLeod
# Wind River Linux


