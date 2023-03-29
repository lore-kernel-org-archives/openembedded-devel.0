Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADC4C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 01:57:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14749.1680055037295638362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 18:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34523aef51=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T1eXJp002761
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 18:57:17 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85v0dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 18:57:16 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32T1vGB3004307
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 18:57:16 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85v0dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 18:57:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTzWemXXKKI6lqCaUnZbrbTbkjdXwc9CdhJbCj/3SV4gP4lgZHxOIcvw6IhjU7jiTWtV1AV9ZpvE9Mj3SxXuIH8MQUbye7/eyohB3L4dOMreg2ss/XQ6IDMiDMqg5kmNPyrEf+RmGu4vrqO9sobgEHJa7N/uZShYwy46CxqQ6oSBxlRN2B90/BrjvWTPaC5fokuPyUliWjZk1RDmd4JtY1M1dz1MWeGJHX+9DMhKw/FZWU+ccxVHqtf7AqQF55vZypsg9vHZKnloJnX96Y5PN6YAM9m4SPcm5miiuNJCdKvcai7wxO8HG+4W8Z9WNuMWJZGJGms24WnCdhyY77rAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRBDiGDftyOyxQ2dMuK8xNFGhkw3gHvsc6xk9NJKUR8=;
 b=nUK7UfPaNgafvUrclrdr3qFHWnOtZB65LlhA2Nemb/k14DHFthsB9zIfRDxakHt3ZBzd/uQ81VUQnC8e5X5mOlN4fiU+OCDkz4CXk8ztG7KfMahset1Ywm/MwaJMGhr/VPdi77Y9Qzzy3cvwHervTQ8o3Hz4+NQG6DJFaduEub1NB1zM767W38MrcewHCVOk5uMHltcfKi431zAoQPQ6c6E0NgiJ8/ccZYi2q+6G7NZxGC3R4eqTX2ppgKY0+oCpZ3s4lrMGrDuPiYWgjQVTSI4cWF0JsoeWALemQ/q7m9wSwjxQ2+wSbIuOqO0woBWxVj+FU0lw69iNyZbdaCv8cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 01:57:11 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Wed, 29 Mar 2023
 01:57:11 +0000
Message-ID: <1346bc03-e810-9a2d-95fe-360ccdb2d10b@windriver.com>
Date: Wed, 29 Mar 2023 09:57:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][PATCH v2 1/2] protobuf: upgrade 3.21.12 -> 4.22.2
To: Khem Raj <raj.khem@gmail.com>
References: <20230328064248.4049456-1-xiangyu.chen@eng.windriver.com>
 <20230328064248.4049456-2-xiangyu.chen@eng.windriver.com>
 <CAMKF1spGf+sSjwSoHRYr6c1XGEsWAHkww+Ew9G87iPu8+NyP7A@mail.gmail.com>
 <175085C237DCAF2E.28404@lists.openembedded.org>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
In-Reply-To: <175085C237DCAF2E.28404@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7d332a-1d2a-485a-108a-08db2ff8e8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tcyD+qUywKgmcKQHgAQVyHz4siEC/gEP4n0LORV8p6YCKF6ZB+FT3/L43KLNsX2BnNK55N+XgyOAE1RdKy8RlsGTbod3YMxF3U7hU3mdBg74wt1pT22xcghweDb092IpDTvQQsyZXVP6y4T747DNILXdabTqxqmVnykal2kNo6NNrLCmnaP0JwYI8rGL1ywQn1Old24UZDLhsF1mN2JFDwFWC5G++YV43H4rHkgJIrfumThFy0RuwujFKkXrIncgy76lWio5Xc0NAN1n3PMNs/jWoKpXIlHB6EfaF5bgWhug0NOt6SDKgnyCf4R3HsLGz1iCr8G/Abr+larC0b/kyX8zypTmY/m2weGyqNZF4c8YOnJmj/w7j/7Qf41fTGDqLCBypeAJV6A2bGRGHG+H2/qJzVGEDsOPbWvZMNdDH1+9bbWq26hmfFbrG9qic1Kfvt1XAUVC4d51WhSGQekPo4dehrdSRLkn1VmwJw9lusMibYChYzMQwOFPmZBZ0irqnj4ZDtWA6rkUln5CrCDsnPrEDM+kag/ZpXXMNXVcptrzs0/j8ZBSm3AIosfMIHDwEZRCJLgZYLbtoPKAnJHIYxOWr/wP1aDryfvdTi6RC2DhuxCm7BMPz6LHZ//C7YknqAfx4pwSXdv2XJBKUv1d8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(136003)(376002)(346002)(396003)(451199021)(9686003)(6666004)(26005)(6506007)(83170400001)(6512007)(8936002)(53546011)(31686004)(83380400001)(186003)(31696002)(66899021)(6486002)(966005)(2906002)(38100700002)(44832011)(5660300002)(478600001)(4326008)(6916009)(41300700001)(66476007)(66946007)(8676002)(66556008)(316002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2FwcUM1MUJmZWNNOUNOOHdYYUYxR0d5L0tlWVZRbERtRVZxV05DRloyNU9B?=
 =?utf-8?B?KzFlQ3ROemtROXhRQ1JjN1o3WXpFZngvdGRyNXd1dFAxcUJ6VjVIcTF2Y0pI?=
 =?utf-8?B?UlZ0T01jcGh4TDF3dlEzUnoyS1l2a3c1NGJzUU1MVVM0YzVwb3F1Y2ErQ0Ir?=
 =?utf-8?B?QkUyZmlNaHhTVlNxZ2lpS2cxa3JqYzh3a3VPT01ITGtLOUdRM1pnZkRWcC95?=
 =?utf-8?B?R3RHKzNoWXUwMTQ4dkpxMGI2ckVic3doY1dUZVp1RW1wV25Rc3FCSytzbUpJ?=
 =?utf-8?B?bFJoOGd3SnVsaVJtSjRKS1FmbUgwMmpjTExNVHVuSnlqZDBzVEtjM2d5ajZV?=
 =?utf-8?B?bkJkVm1kRGdjUy9CenY4QWVidHM4YVpiSFRwaW9BWk4wbWNHTVdjaGU3TEZk?=
 =?utf-8?B?VlRtcjhrK0FINWxFaldIZU5BS1JaaGluR2gxMG9udXgyZlM4dmtFK1lSd3pn?=
 =?utf-8?B?S3hVeDBncnJIZERqWDBQdERJUHdrL09Ea3ZoaVA2M20vc3did2p4bnh5bFBa?=
 =?utf-8?B?cTFqSDU1YmNadWtmZk9MajJxcUNZNU94MW5rSFlJKzllZ2VMWXNsWXNHa3NV?=
 =?utf-8?B?Uys2dnFadkNPMCtoRitQQjY2U2EzSThsaWVtaUF1OWVBTVRQMHN1M0g0M3Nq?=
 =?utf-8?B?K3pObTladGFSZktwcVVseGt0NytzZzlqUUkrWjNmdFlKeGgvUXorVktWZmVi?=
 =?utf-8?B?WFJpMmtVSGk4dVNuM090UEl2NUIrNlQwQURkVzhEdkduR1UyVXdUNHpCNng2?=
 =?utf-8?B?RW1GQS9iSFNiZGtyTm1qS3h1NE90bFJleE5Ua0drWmU5UTRLeTVNOE0wdGJN?=
 =?utf-8?B?aGRjTHFMS0JYUmh2K0x5TFB3NThoSFcxYnM1dWI0WGR4WjBTNFRQaDMrLzd4?=
 =?utf-8?B?WkZ3RUpSQ0c5N3RYb2JDUnpERHM0QXRnaUVKc0FKYTZtRjNsUUMzN2svTStn?=
 =?utf-8?B?dkhYN0RPa2tqSDc1UnFPY2FObU9hZ0pGREMzWnViWi9ESWlzNzZYVmkwQTll?=
 =?utf-8?B?UWVhRER0WjV2WUV0Nm5XeUtYWWJ0SXZ4MlZPWlYyTFBxb3dUQWZESkpWa0k2?=
 =?utf-8?B?V0p0VmVabHdVWHVWT09Ma2kzN096c2tMRTRJazFPQ2FIL0VGS3prZU9oOWdk?=
 =?utf-8?B?T0l3TTREaW9vOCtQeTVwbDYyUXFTWTUrcUtVL0xqcHJYWDI4L2NFN0M0S21G?=
 =?utf-8?B?MHJ5UzRKcmVtMG1zQWprc0ZzVkkxVkRUVFlFRWlCNk9hcHR2eTlnTDBpQjdB?=
 =?utf-8?B?dzk3RFpxUWtJSVZHM3cxdzdtWVFlZTZqc2NiQmUwMEpLaUQ3aFR0aTRMdXJJ?=
 =?utf-8?B?UXg3eUFVeFJuTXJ2ajBZMUpxRlV5WDR0ZHFIZ1l5d011eXVucEFGM2plNHVS?=
 =?utf-8?B?NWNIWm9veEhQV0pZbUtLUndFMVhYMWJOenFVREFZeSsyMHZ1TVZJb1FTcyt5?=
 =?utf-8?B?ZVBLUVdSRWJnRVlkaDU4UUZHU243SjVBaHUxdVZsdXgzb2JyVUF1Ri96UVpP?=
 =?utf-8?B?bVZDL0JxYXJ1YUlmV0RDZ1NhZkJiT0NEU2ozV1VlWlY2M3dvWGs1ZmZYNVNs?=
 =?utf-8?B?dlM2dG94YVFjUXA4T3dnQ01LWThTQW9ZOTVidVZxQzdwc0xzME5kL2I1U09V?=
 =?utf-8?B?SWczQ1pqQzhHVFZ6ajE2c0JxYld1c1VHL0dzRUN6YmlxVjlCQVBKdGJha1JJ?=
 =?utf-8?B?ZTJ1MlFBY0Exdno2ak5RVTFFQnJrZkFTQ3ZZT3VJVXdtTTVuVWtFeVU1dnB5?=
 =?utf-8?B?Ty80R2ZYMmw0R3huRmd3TVgvVVlXSHJ4ZElCNTFmUU1EYkJ5anhESThyVXRG?=
 =?utf-8?B?Uy8wcVBHbmRQbEVZRXZuVUhtb09RM3VwbTRBcHBjcis4MUxQWGVUSlRRN3Yr?=
 =?utf-8?B?OEdVaXBlNk5heHpmeGxkbVlGWlJsMmNCWjcxYStLQnlKVEFhQ0RVM1FnOHBk?=
 =?utf-8?B?bnoxSE1EdTAwQ2ViOEtrYzBTUzFDU1hZWk5qUWw3aHlOWW5HdDUxSW05Yy9T?=
 =?utf-8?B?SU8xZm5TTnBWeW9vWmFOQS9zaTJGd2kwV0cvYlA2ZlJ5eXZCaEdlMWNxRkFM?=
 =?utf-8?B?NnFIa2pSUU53YXQzQkdnaFgxOWY4V0hnemUreVJueFdXL1V6clk3cmV1Sk5Z?=
 =?utf-8?B?TlgvZnZ1RFNGOFo4cU5TZXpmT0t1R0RoZjhQaEJRRkF2czN0eTZNWjNESUVJ?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7d332a-1d2a-485a-108a-08db2ff8e8ce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 01:57:11.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuSINGaGwe57G50mmTFRabWT3dnzSbmiRbo9foFcgdUXhXaLTB9ynPls+GUKmJfke8XjjKCn6Jte/3oNqlOp5hU7B3UU4yNVgtIpCxTQz3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
X-Proofpoint-GUID: MSJsUxFt73LPxSGCr89D7luSbyF4STNy
X-Proofpoint-ORIG-GUID: a0-w7odTsy8mZXlRMDi6Un3AAOg2zOEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290014
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32T1eXJp002761
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 01:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101810

Hi,


On 3/28/23 15:48, Xiangyu Chen wrote:
> Hello,
>
>
> On 3/28/23 15:22, Khem Raj wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> it stil fails
>>
>> Summary: 2 tasks failed:
>> virtual:native:/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/rec=
ipes-devtools/protobuf/protobuf-c_1.4.1.bb:do_compile
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-connectivi=
ty/mosh/mosh_1.4.0.bb:do_configure
>> Summary: There were 4 ERROR messages, returning a non-zero exit code.
>
> Could you please help to share the error log with me? thanks.
>
> I applied the protobuf-c related patch cannot reproduce in my local=20
> setup with "bitbake protobuf-c -c cleanall;bitbake protobuf-c" .
>
Upgrading protobuf caused the mosh compile error has already fixed and=20
sent a patch to mosh upstream[1], this commit will contain in V3 patch,

but regarding protobuf-c, after applying the patch that was sent to=20
oe-dev list[2] yesterday is building normal in my local setup. could you=20
help to

share the error log which happens on build server? thanks!


[1] https://github.com/mobile-shell/mosh/pull/1266

[2] https://lists.openembedded.org/g/openembedded-devel/message/101797


Thanks!


>
> Br,
>
> Xiangyu
>
>>
>> On Mon, Mar 27, 2023 at 11:43=E2=80=AFPM Xiangyu Chen
>> <xiangyu.chen@eng.windriver.com> wrote:
>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>
>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> ---
>>> =C2=A0 ...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15=20
>>> +++++++++------
>>> =C2=A0 .../{protobuf_3.21.12.bb =3D> protobuf_4.22.2.bb}=C2=A0=C2=A0 =
| 11 ++++++++---
>>> =C2=A0 2 files changed, 17 insertions(+), 9 deletions(-)
>>> =C2=A0 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =
=3D>=20
>>> protobuf_4.22.2.bb} (86%)
>>>
>>> diff --git=20
>>> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch=20
>>> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch=20
>>>
>>> index 36c3c597a..7c4bf260e 100644
>>> ---=20
>>> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
>>> +++=20
>>> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
>>> @@ -30,7 +30,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> =C2=A0=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> =C2=A0 diff --git a/examples/Makefile b/examples/Makefile
>>> -index 1c7ec8d63..85f591231 100644
>>> +index ef7a4ef58..7206e14e1 100644
>>> =C2=A0 --- a/examples/Makefile
>>> =C2=A0 +++ b/examples/Makefile
>>> =C2=A0 @@ -2,6 +2,8 @@
>>> @@ -42,17 +42,20 @@ index 1c7ec8d63..85f591231 100644
>>> =C2=A0=C2=A0 all: cpp java python
>>>
>>> =C2=A0=C2=A0 cpp:=C2=A0=C2=A0=C2=A0 add_person_cpp=C2=A0=C2=A0=C2=A0 =
list_people_cpp
>>> -@@ -40,11 +42,11 @@ protoc_middleman_dart: addressbook.proto
>>> +@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
>>>
>>> =C2=A0=C2=A0 add_person_cpp: add_person.cc protoc_middleman
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkg-config --cflags =
protobuf=C2=A0 # fails if protobuf is not=20
>>> installed
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c++ -std=3Dc++11 add_person.cc addre=
ssbook.pb.cc -o=20
>>> add_person_cpp `pkg-config --cflags --libs protobuf`
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS)=20
>>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF)=20
>>> add_person.cc addressbook.pb.cc -o add_person_cpp
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c++ -std=3Dc++14 add_person.cc addre=
ssbook.pb.cc -o=20
>>> add_person_cpp `pkg-config --cflags --libs protobuf`
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS)=20
>>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF)=20
>>> add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX) -std=3Dc++1=
7=20
>>> $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
>>>
>>> =C2=A0=C2=A0 list_people_cpp: list_people.cc protoc_middleman
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkg-config --cflags =
protobuf=C2=A0 # fails if protobuf is not=20
>>> installed
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c++ -std=3Dc++11 list_people.cc addr=
essbook.pb.cc -o=20
>>> list_people_cpp `pkg-config --cflags --libs protobuf`
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS)=20
>>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF)=20
>>> list_people.cc addressbook.pb.cc -o list_people_cpp
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c++ -std=3Dc++14 list_people.cc addr=
essbook.pb.cc -o=20
>>> list_people_cpp `pkg-config --cflags --libs protobuf`
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS)=20
>>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF)=20
>>> list_people.cc addressbook.pb.cc -o list_people_cpp #$(CXX)=20
>>> -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o=20
>>> list_people_cpp
>>>
>>> =C2=A0=C2=A0 add_person_dart: add_person.dart protoc_middleman_dart
>>>
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb=20
>>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
>>> similarity index 86%
>>> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>>> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
>>> index 343933033..0c6b446dc 100644
>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
>>> @@ -7,12 +7,12 @@ SECTION =3D "console/tools"
>>> =C2=A0 LICENSE =3D "BSD-3-Clause"
>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bda4266b"
>>>
>>> -DEPENDS =3D "zlib"
>>> +DEPENDS =3D "zlib abseil-cpp"
>>> =C2=A0 DEPENDS:append:class-target =3D " protobuf-native"
>>>
>>> -SRCREV =3D "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
>>> +SRCREV =3D "81f89d509d6771dcccb619cbe26ac86cec472582"
>>>
>>> -SRC_URI =3D=20
>>> "git://github.com/protocolbuffers/protobuf.git;branch=3D21.x;protocol=
=3Dhttps=20
>>> \
>>> +SRC_URI =3D=20
>>> "gitsm://github.com/protocolbuffers/protobuf.git;branch=3D22.x;protoc=
ol=3Dhttps=20
>>> \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://run-ptest \
>>> file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patc=
h=20
>>> \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://0001-Fix-linking-error-with-ld-gold.patch \
>>> @@ -35,6 +35,7 @@ EXTRA_OECMAKE +=3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dprotobuf_BUILD_LIBPROTOC=3DON \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dprotobuf_BUILD_TESTS=3DOFF \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dprotobuf_BUILD_EXAMPLES=3DOFF \
>>> +=C2=A0=C2=A0=C2=A0 -Dprotobuf_ABSL_PROVIDER=3D"package" \
>>> =C2=A0 "
>>>
>>> =C2=A0 TEST_SRC_DIR =3D "examples"
>>> @@ -52,7 +53,11 @@ do_compile_ptest() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp ${S}/${TEST_SRC_D=
IR}/Makefile "${B}/${TEST_SRC_DIR}/"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -e 's|libdir=3D|=
libdir=3D${PKG_CONFIG_SYSROOT_DIR}|' -i=20
>>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -e 's|Cflags:|Cf=
lags: -I${S}/src|' -i=20
>>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -e 's|Cflags:|Cflags:=20
>>> -I${WORKDIR}/recipe-sysroot-native${includedir} |' -i=20
>>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -e 's|Libs:|Libs=
: -L${B}|' -i=20
>>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -e 's|Libs:|Libs:=20
>>> -L${WORKDIR}/recipe-sysroot-native/usr/lib|' -i=20
>>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -e 's|Libs:|Libs: -labsl_lo=
g_internal_check_op |' -i=20
>>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -e 's|Libs:|Libs: -labsl_lo=
g_internal_message |' -i=20
>>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Until out-of-tree =
build of examples is supported, we have=20
>>> to use this approach
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -e=20
>>> 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeFiles/libpro=
tobuf.dir/src/google/protobuf/timestamp.pb.cc.o|'=20
>>> -i "${B}/${TEST_SRC_DIR}/Makefile"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export PKG_CONFIG_PA=
TH=3D"${B}/${TEST_SRC_DIR}"
>>> --=20
>>> 2.34.1
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101802): https://lists.openembedded.org/g/openembed=
ded-devel/message/101802
> Mute This Topic: https://lists.openembedded.org/mt/97900181/7175143
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[xiangyu.chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

