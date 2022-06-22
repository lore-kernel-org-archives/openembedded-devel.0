Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D743DC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 17:03:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.9754.1655917422222122151
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jun 2022 10:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=bDN+whym;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3172006884=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25MDh463003707
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jun 2022 17:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=We4hQbTdLkUHeuAi9Hre1H97qiJzz8kOpgYoeMTjWTM=;
 b=bDN+whymH5uYtruVDWDQramHdwsM0GTvNUMhM/1RCATpQyANlHaBgUrsHIiuz8YfLCaS
 Y8N4JeZBnOm6gEte67SkcHtgnv5MXIVhdXLVqpAhGj3aeodU0Jyf8B3sEA9F9u63rD9Q
 MTbXz+K3Oja/fQAJ2LO/04ePA6pNR8yzYn24DZ7jtkxzKVatrZnNswRpAVsB/JtH6nk9
 dMALJ+1inYcUz5kp8ocpBLETcitShAksWE9ic+O2EChbkcU/+RE7Ti1Tv42r8BPPEh9P
 FWMifqD1p1PjT8iJJgBasxZPajmlisBuhfEtIBfR/E9cUtLxOzX19JRQEepbTlAwPTmi 7g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gs3x1bb9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jun 2022 17:03:40 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25MH3dwu012457
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jun 2022 17:03:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gs3x1bb9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jun 2022 17:03:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vb7ibh4UaTAyUflwUkc1uPcnsWaVjXgM1xBIj1PiAOiz5A9J2go3kZUuuOe00YJoGGWJuu8hpjsbneKJJXJYM+w+AM/I2ziug0gteaI/+4G1p8UEJNIseGMqW3O8MUDdg7D1x6N8SfZXlUM+r5mrf3HHgkvjD/xAc1pGI/ftfC49SohNhGprzY6ZPtIM37stm3RATmD2spTlhwZhVnI+3roGbHGU3purQJgvaktia5Z4uCFerEd0a1dE6s7u4qP/ZeABju8mZMCz1PeJa4n48UrNkI2m3n6CYyCYdElCha1eW+1jMUMR+e9ICq0rZEzQCswnRMUu2QFFH6/xWZZBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=We4hQbTdLkUHeuAi9Hre1H97qiJzz8kOpgYoeMTjWTM=;
 b=eHCJW0/4SIWSDRp7akuKeiYrcuYarsNhsrjTrSMMy3Q0822T0kfJ2UI7fQYSTUBfjTWBjF0cDRqwO/zcwbzW6K+HZgJ5wUyNeNyuepU5s8Ev4OY9wBOovfV4K5AmrIPZmsBAhjQoYXVQygKX4QyzfAn6Y5Hy/8eQWBRvK3Ipj3qDIK918/+smh9utT6i+AEFYT/cVlz4FV55A++duR1AbZmz6BNNs4InOjLEFUuSvjujqij8RYOkI11KZ2WkL+TatvVHyT0kgSRvM9jXVqyktkpJ2KledcsVNnd4na38tpy6NGvn4RO+4gZsXfrkWFad2jmWozec9QTtg64MZS/1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 22 Jun
 2022 17:03:34 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 17:03:34 +0000
Message-ID: <9256c154-b591-cfad-4c4f-cb812b067890@windriver.com>
Date: Wed, 22 Jun 2022 13:03:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-oe][PATCH] minio: add recipe for minio client
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20220617165311.5069-1-sakib.sajal@windriver.com>
 <a117f0a7-e74c-5855-6d78-5883dee5d221@gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <a117f0a7-e74c-5855-6d78-5883dee5d221@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::40) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6998e554-f197-411b-8c7b-08da54712436
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6156:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ1PR11MB6156F8316EC700E666DEDCF6F2B29@SJ1PR11MB6156.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zxH2+gXbhgKwdVx4aFz7OZ49Fl0aqykX3gTDtrtfgKLNMfv8RoBqHoh1t/r6HALt1ovNY3g90TUdsdmEhMISElxMJ7luxMKq8ESe6AELyktTZh/tmQENWcTS5DlLW5j9CPXOZ9rq9VzoL7aMM5/aJFE0iOuRvFRXqWiREMQh4TwOdmfeBAIMM25kg9RI1D6irO5cvWG52r+QjJVdCaG93Apj3se1h+6y2JVGrPIBU+eZ7FzX5wF8t8pz3NGIsYUhUskozkCAzM0rIX8z7D7aR0KxEfYeDSoDfBSXoagvvrxF10VgzcZ4NfT+DFbv3v7aWjEWyicrMgFPTrOWD3miLUCa7nyXN8kVkO1Z7qj1YYTzG7Z3grjCq9Kanlxr9mKZzobyHnycgqrWkWmUO2qi4KLEMK1Nb9QbcX+A42z9cI/9xWVpjG7DihCfwT02yqYQDavdTmJKVkcO+gFUc27fEMC0YocFcQMmsKFSh2b8G0D63aygOc6nj0TydhHNKaSwYtXCXbJ3PqimUV2YsJsHYGiqa2+AKwyPZ3a0svkWH/tq21vdb/20SqoVcwD5gSWBq5CMi2uBbloMUbDdmYcvUzbiElNakni3i5q+QPOdvOpSEutru1aJd9bRecrg3AeJTpWsEnWZQ5cMiBUsEZmVnBqZstDgjhueB+RxW+mOGD06ek5324Slua9BWYAwZnkyuz1b7YYxl2RGKrk4+bMCmnTV/JDI01tIdY7hFlNSU5K7ZYGOVbhAiX5AohWaS4vSSyJnOif2n3iA3VGndkeul9OqNNpUi3QVfZ5NPDar42jmYJogxQx0XLvZqXhuhwHYLg7hsz6n3Pscq4gMF0OUCoGX6QSQvx7p+Z16oepUBlMAAwuj1mTO8fmMiUr0fntx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(66946007)(6512007)(5660300002)(2906002)(31696002)(2616005)(186003)(26005)(83380400001)(44832011)(6666004)(38350700002)(316002)(6506007)(31686004)(53546011)(966005)(8676002)(66556008)(6486002)(41300700001)(38100700002)(84970400001)(36756003)(66476007)(8936002)(86362001)(30864003)(52116002)(478600001)(45980500001)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1I5RDlaN0NDWEFEMi80cmMxaU5WUlM0bjJmTFhELytOZUpEVzJ2N3ZFV282?=
 =?utf-8?B?YkdXU1VHVWdsVjhDKyt5WjBOVDltMldvVjlPZDR6dUpTbE5IT1VMNHVPNjNk?=
 =?utf-8?B?VVlvQ1pJNHRXdW05YXIzRlVHNkEwb2pZUk5BZkdVeHNubHNoWXVSV2J5WHlz?=
 =?utf-8?B?OXdTWEh4OSt2MTZpNmh6bTJvMUIzYkdja1JqTURCSDJSdGFjVXgxZ1NlWElN?=
 =?utf-8?B?bkUzbnJ4U0ZFd2VRbmdCSUlJa2NMS2hjMzA1V0k4SkxuVjQzYUQ3Ynd4RWZE?=
 =?utf-8?B?S1lsMy9wZnllQjB3dVBqY0FkbjVEc1NZKzVCTWVZZDRCRS9iZk5JWkYxR0Na?=
 =?utf-8?B?bzc2NFlSdGdWeDUxa09DeCtDZUFlR0VuczI1RUVzRHlZRXlJcVkzUU5Mdis5?=
 =?utf-8?B?akp6Qi8zS2UzNS90THpCaExuZWdjTVpaT0NRSG5tM3FaT2poYkZrWjhyOWU0?=
 =?utf-8?B?QWJDUys1RFU3U1JvVXhVRFFndVo5WE5OUlhMc0NMbVZxTm5VQlZEcFV2KzFw?=
 =?utf-8?B?c2drN2c0TnN4S2U1dW1nRE9jRTEzbjA2VjhFdjRORlFub2hUNWRxOUxWdkFW?=
 =?utf-8?B?T0tpajRsWE8vUDhkdU9RcHZma2dnbWoxM2tNNzh3WnBZcUZaTGhtcGNsZldl?=
 =?utf-8?B?dFJNWE5sRDg2N1I3N2VJbzZIc0k3dGNJSzJFS2xmODVDSGtZU253ejhjK3I1?=
 =?utf-8?B?b1ozSXRjTXBHbjFoRUxqSUdDUS9LNE1KU0E4V3VQZEptSndXS2tCdktCUm5Q?=
 =?utf-8?B?YkgwNXNBY1lpbVZkejhkSm13aFplOTJSREVFSG8zYXlINFQ1eDdwaGs5cTFZ?=
 =?utf-8?B?Yk52NzRmdkNGblJla2lLSFNwdUcvT1plK3RpSlNzUGVOS0ZzYlVqOU95QXNL?=
 =?utf-8?B?S0tmcnE3TzBCcTdsM3JLVTZUeWkxK2pIQWErNE1oY3pXVWgyeWJING10SFh2?=
 =?utf-8?B?UmN5RThhakZLYkNnRFVITGtobGR6RktDNmdMMDc2RWV5RXk2aFZRTmN2Q2hD?=
 =?utf-8?B?ZHZwYXhONDhzUmVJT3R1cGkxZGlSSHhia1F0Tk5ZcmxPakV5WU1yWERIOTJQ?=
 =?utf-8?B?RTdrUkxnVHA1bUlHL2NqMmpRYjN2V1ZCd2duSnlGQWNXNkpnKzZDcTV0c2Rn?=
 =?utf-8?B?TmprWHc0ZG95VXIyZkZDZ3UzbzVCQXB0YmVYcDhiZUVJOXhweWxROExjd0dU?=
 =?utf-8?B?Unc5Z1doeHhxVzd2dklVL3Bac2UzOWh2TnZ2emc2Vjl2dEh2L09DQzYzSUsy?=
 =?utf-8?B?UnZ5UWpCMmVxVE1CbXd5S0lwb1J2SktqSGRaM3hWc2trd1hiZk94N1VNK3BX?=
 =?utf-8?B?TlFZWWZaOE9KMXc5MTRLNXhSWkVWVUhHa0tvSytiREZiQjh2ZWtPYnJ5amtR?=
 =?utf-8?B?QkRINWo3bHdBbGQxTmVpb01yOXVJRzlyVXZjNkVUd3Eza2V1OEdENzdHNWVW?=
 =?utf-8?B?RWNnZTVlaVpzbGZoS1ZhZzRmM0J1bHphMEZnR2hKK2ppQTkyWGNJeHIwQnZ4?=
 =?utf-8?B?Q2xKVkpNRzlYWEdLN1huWDhnOWZVKzE3SEEwSlhyUUNldzZUWVI0dlhoOFJx?=
 =?utf-8?B?UTd1WElCNmpDbTd0cFdWRitvdVpZM3dkekFtNURyMUFaaE95NFBiaGQrVnpv?=
 =?utf-8?B?L3lkWmJ4U1k2R3ErSVo1cGh1aDJjMWtpV0xrZVZheWR4eFNyZFhNUXZaL3RB?=
 =?utf-8?B?bVBoV3hiTGdjMUE4b2srdWt2WFJoc2lXa0JaNzZqOGtDcFJVWlhkTU1lTy9T?=
 =?utf-8?B?WVhsbkhteHFMZjRLei9lWXlxRHVOUDkwQ20xSDNKM3JmSExVcUdNTHgzbHJP?=
 =?utf-8?B?R3BOMm9UWGtIMVJmYzQ0akdpcDBJeUg5NnU4QmtmRWFra3ZQUWhSVGFEOGFZ?=
 =?utf-8?B?MzlvNlBUSkMraVRzVnRTMDVRMEFueVB4eG4xSjE2VW4vdFBHcmh2YUpObUxE?=
 =?utf-8?B?dXVNaUx2cWFDY2pJV0tSbXFTazVBYXoyYUhGcUY3KzVKQ1UxOHV6azBlaDhO?=
 =?utf-8?B?bW9CbjN6amtyNHBudTdyZDBueS9qNjVaVStDaE9ndmw2eHV1RVNYOTd1emxr?=
 =?utf-8?B?TmVDeWxHT1FwbXl4K2lpcHp0VGRISndxWXJ3RUlIaFpZYnk4aHppMFp3YTRM?=
 =?utf-8?B?MEluS2xJMUJ2RnNkM0FyVFdqVXhRa2E4WWE3MGRDK3Z4VnBjU3FKaTd2UE4v?=
 =?utf-8?B?UlBhbWp0VFU1SFhFTmZhY0U5b3huZ1NpS084Mmc1L2dxQnV0QlYyeHkydkFx?=
 =?utf-8?B?eWNCTnJ6SjkwMVdyRTBoeEFKK0F4c3lhOVJLbjdONHc4VjRyd2c4bG9ySW1R?=
 =?utf-8?B?ZDNEZ2t4Uzl0WkcrMktiVlJYaEI2cWsza05PRWdPcGdqSkx0WWJ0Qkh0NTRM?=
 =?utf-8?Q?cayyA7G/q2hbibYY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6998e554-f197-411b-8c7b-08da54712436
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 17:03:34.5219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dqJFxJMO7Zn1OlkAG4IGLI2x1kBMb59CQzeYNVuzPXyvplnUmGbShv30fkDE37bhbjG1Cnc3ZvxysdOT6lHxpry8tN3rXKk/9RUCXTy5Nrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
X-Proofpoint-GUID: -0MgP8opTf5_JHuC80n_EU8fH1p3W0F7
X-Proofpoint-ORIG-GUID: N-l7abwbMpPnMAMHVHjryn2OQEtuoxQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_04,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206220082
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 25MDh463003707
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jun 2022 17:03:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97568


On 2022-06-18 10:12, akuster808 wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 6/17/22 09:53, Sakib Sajal wrote:
>> MinIO Client (mc) provides a modern alternative to UNIX commands like
>> ls, cat, cp, mirror, diff, find etc. It supports filesystems and Amazo=
n
>> S3 compatible cloud storage service (AWS Signature v2 and v4).
> If these are replacements for utilities that already exist, how are the
> conflicts handled or overlaying it with busybox?
There should not be any conflicts regarding the utilities. Minio client=20
implements its own commands and are to be executed as "mc=20
[ls|cat|head...]". People would typically use minio to interact with=20
cloud storage.
>
> Just out of curiosity,=C2=A0 have you tried=C2=A0 the Auto Upgrade hand=
ler with
> this recipe?

No I have not tried the Auto Upgrade handler with the recipe.

Sakib

>
> -armin
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>> =C2=A0 .../recipes-extended/minio/minio/modules.txt=C2=A0 | 208 ++++++
>> =C2=A0 meta-oe/recipes-extended/minio/minio_git.bb=C2=A0=C2=A0 | 673 +=
+++++++++++++++++
>> =C2=A0 2 files changed, 881 insertions(+)
>> =C2=A0 create mode 100644 meta-oe/recipes-extended/minio/minio/modules=
.txt
>> =C2=A0 create mode 100644 meta-oe/recipes-extended/minio/minio_git.bb
>>
>> diff --git a/meta-oe/recipes-extended/minio/minio/modules.txt=20
>> b/meta-oe/recipes-extended/minio/minio/modules.txt
>> new file mode 100644
>> index 000000000..2777dc8dc
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/minio/minio/modules.txt
>> @@ -0,0 +1,208 @@
>> +# github.com/charmbracelet/bubbletea v0.19.3
>> +## explicit
>> +# github.com/cheggaaa/pb v1.0.29
>> +## explicit
>> +# github.com/dustin/go-humanize v1.0.0
>> +## explicit
>> +# github.com/fatih/color v1.13.0
>> +## explicit
>> +# github.com/go-ole/go-ole v1.2.6
>> +## explicit
>> +# github.com/goccy/go-json v0.8.1
>> +## explicit
>> +# github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
>> +## explicit
>> +# github.com/google/uuid v1.3.0
>> +## explicit
>> +# github.com/inconshreveable/mousetrap v1.0.0
>> +## explicit
>> +# github.com/json-iterator/go v1.1.12
>> +## explicit
>> +# github.com/klauspost/compress v1.13.6
>> +## explicit
>> +# github.com/mattn/go-ieproxy v0.0.1
>> +## explicit
>> +# github.com/mattn/go-isatty v0.0.14
>> +## explicit
>> +# github.com/minio/cli v1.22.0
>> +## explicit
>> +# github.com/minio/colorjson v1.0.2
>> +## explicit
>> +# github.com/minio/filepath v1.0.0
>> +## explicit
>> +# github.com/minio/madmin-go v1.3.11
>> +## explicit
>> +# github.com/minio/md5-simd v1.1.2
>> +## explicit
>> +# github.com/minio/minio-go/v7 v7.0.24
>> +## explicit
>> +# github.com/minio/pkg v1.1.21
>> +## explicit
>> +# github.com/minio/selfupdate v0.4.0
>> +## explicit
>> +# github.com/minio/sha256-simd v1.0.0
>> +## explicit
>> +# github.com/mitchellh/go-homedir v1.1.0
>> +## explicit
>> +# github.com/pkg/xattr v0.4.4
>> +## explicit
>> +# github.com/posener/complete v1.2.3
>> +## explicit
>> +# github.com/prometheus/client_golang v1.11.0
>> +## explicit
>> +# github.com/rjeczalik/notify v0.9.2
>> +## explicit
>> +# github.com/rs/xid v1.3.0
>> +## explicit
>> +# github.com/secure-io/sio-go v0.3.1
>> +## explicit
>> +# github.com/shirou/gopsutil/v3 v3.21.12
>> +## explicit
>> +# github.com/tidwall/gjson v1.12.1
>> +## explicit
>> +# golang.org/x/crypto v0.0.0-20220128200615-198e4374d7ed
>> +## explicit
>> +# golang.org/x/net v0.0.0-20220127200216-cd36cc0744dd
>> +## explicit
>> +# golang.org/x/text v0.3.7
>> +## explicit
>> +# gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
>> +## explicit
>> +# gopkg.in/h2non/filetype.v1 v1.0.5
>> +## explicit
>> +# gopkg.in/yaml.v2 v2.4.0
>> +## explicit
>> +# maze.io/x/duration v0.0.0-20160924141736-faac084b6075
>> +## explicit
>> +# github.com/briandowns/spinner v1.18.1
>> +## explicit
>> +# github.com/charmbracelet/bubbles v0.10.0
>> +## explicit
>> +# github.com/charmbracelet/lipgloss=20
>> v0.4.1-0.20220204041308-bf2912e703f6
>> +## explicit
>> +# github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1
>> +## explicit
>> +# github.com/golang-jwt/jwt/v4 v4.4.1
>> +## explicit
>> +# github.com/navidys/tvxwidgets v0.1.0
>> +## explicit
>> +# github.com/olekukonko/tablewriter v0.0.5
>> +## explicit
>> +# github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
>> +## explicit
>> +# github.com/tinylib/msgp v1.1.6
>> +## explicit
>> +# golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
>> +## explicit
>> +# github.com/beorn7/perks v1.0.1
>> +## explicit
>> +# github.com/cespare/xxhash/v2 v2.1.2
>> +## explicit
>> +# github.com/containerd/console v1.0.2
>> +## explicit
>> +# github.com/coreos/go-semver v0.3.0
>> +## explicit
>> +# github.com/coreos/go-systemd/v22 v22.3.2
>> +## explicit
>> +# github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
>> +## explicit
>> +# github.com/fatih/structs v1.1.0
>> +## explicit
>> +# github.com/gdamore/encoding v1.0.0
>> +## explicit
>> +# github.com/gogo/protobuf v1.3.2
>> +## explicit
>> +# github.com/golang/protobuf v1.5.2
>> +## explicit
>> +# github.com/hashicorp/errwrap v1.1.0
>> +## explicit
>> +# github.com/hashicorp/go-multierror v1.1.1
>> +## explicit
>> +# github.com/klauspost/cpuid/v2 v2.0.9
>> +## explicit
>> +# github.com/kr/text v0.2.0
>> +## explicit
>> +# github.com/lestrrat-go/backoff/v2 v2.0.8
>> +## explicit
>> +# github.com/lestrrat-go/blackmagic v1.0.0
>> +## explicit
>> +# github.com/lestrrat-go/httpcc v1.0.0
>> +## explicit
>> +# github.com/lestrrat-go/iter v1.0.1
>> +## explicit
>> +# github.com/lestrrat-go/jwx v1.2.14
>> +## explicit
>> +# github.com/lestrrat-go/option v1.0.0
>> +## explicit
>> +# github.com/lucasb-eyer/go-colorful v1.2.0
>> +## explicit
>> +# github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
>> +## explicit
>> +# github.com/mattn/go-colorable v0.1.12
>> +## explicit
>> +# github.com/mattn/go-runewidth v0.0.13
>> +## explicit
>> +# github.com/matttproud/golang_protobuf_extensions v1.0.1
>> +## explicit
>> +# github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
>> +## explicit
>> +# github.com/modern-go/reflect2 v1.0.2
>> +## explicit
>> +# github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
>> +## explicit
>> +# github.com/muesli/reflow v0.3.0
>> +## explicit
>> +# github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0
>> +## explicit
>> +# github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
>> +## explicit
>> +# github.com/philhofer/fwd v1.1.1
>> +## explicit
>> +# github.com/pkg/errors v0.9.1
>> +## explicit
>> +# github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c
>> +## explicit
>> +# github.com/prometheus/client_model v0.2.0
>> +## explicit
>> +# github.com/prometheus/common v0.32.1
>> +## explicit
>> +# github.com/prometheus/procfs v0.7.3
>> +## explicit
>> +# github.com/rivo/uniseg v0.2.0
>> +## explicit
>> +# github.com/sirupsen/logrus v1.8.1
>> +## explicit
>> +# github.com/tidwall/match v1.1.1
>> +## explicit
>> +# github.com/tidwall/pretty v1.2.0
>> +## explicit
>> +# github.com/tklauser/go-sysconf v0.3.9
>> +## explicit
>> +# github.com/tklauser/numcpus v0.3.0
>> +## explicit
>> +# github.com/yusufpapurcu/wmi v1.2.2
>> +## explicit
>> +# go.etcd.io/etcd/api/v3 v3.5.2
>> +## explicit
>> +# go.etcd.io/etcd/client/pkg/v3 v3.5.2
>> +## explicit
>> +# go.etcd.io/etcd/client/v3 v3.5.2
>> +## explicit
>> +# go.uber.org/atomic v1.9.0
>> +## explicit
>> +# go.uber.org/multierr v1.7.0
>> +## explicit
>> +# go.uber.org/zap v1.19.1
>> +## explicit
>> +# golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
>> +## explicit
>> +# golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
>> +## explicit
>> +# google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
>> +## explicit
>> +# google.golang.org/grpc v1.43.0
>> +## explicit
>> +# google.golang.org/protobuf v1.27.1
>> +## explicit
>> +# gopkg.in/ini.v1 v1.66.3
>> +## explicit
>> diff --git a/meta-oe/recipes-extended/minio/minio_git.bb=20
>> b/meta-oe/recipes-extended/minio/minio_git.bb
>> new file mode 100644
>> index 000000000..649051cb3
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/minio/minio_git.bb
>> @@ -0,0 +1,673 @@
>> +HOMEPAGE =3D "https://github.com/minio/mc"
>> +SUMMARY =3D "MinIO Client is a replacement for ls, cp, mkdir, diff an=
d=20
>> rsync commands for filesystems and object storage."
>> +DESCRIPTION =3D "MinIO Client (mc) provides a modern alternative to \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 UNIX commands like ls, cat, cp, mirror, diff, find \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 etc. It supports filesystems and Amazon S3 compatible \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 cloud storage service (AWS Signature v2 and v4). \
>> +"
>> +
>> +SRC_URI =3D=20
>> "git://github.com/minio/mc;nobranch=3D1;name=3Dmc;protocol=3Dhttps \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://m=
odules.txt \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> +
>> +SRCREV_mc =3D "cc4ff3a0cc82f25d3d8f53e1815aba2160083282"
>> +
>> +GO_IMPORT =3D "import"
>> +
>> +LICENSE =3D "GPL-3.0-only"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://src/${GO_IMPORT}/LICENSE;md5=3Deb1e647870add0502f8f010b19de32a=
f"
>> +
>> +# S =3D "${WORKDIR}/git"
>> +PV =3D "${SRCREV_mc}"
>> +#=C2=A0=C2=A0=C2=A0 github.com/charmbracelet/bubbletea v0.19.3
>> +# [1] git ls-remote https://github.com/charmbracelet/bubbletea=20
>> 3dc51789d11229a1fb00f137d02b50b04cac372b
>> +SRCREV_bubbletea=3D"3dc51789d11229a1fb00f137d02b50b04cac372b"
>> +SRC_URI +=3D=20
>> "git://github.com/charmbracelet/bubbletea;name=3Dbubbletea;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/charmbracelet/bubbletea"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/cheggaaa/pb v1.0.29
>> +# [1] git ls-remote https://github.com/cheggaaa/pb=20
>> e2a33cc368a206516cc95f7bdd9176db0b83f098
>> +SRCREV_pb=3D"e2a33cc368a206516cc95f7bdd9176db0b83f098"
>> +SRC_URI +=3D=20
>> "git://github.com/cheggaaa/pb;name=3Dpb;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cheggaaa=
/pb"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/dustin/go-humanize v1.0.0
>> +# [1] git ls-remote https://github.com/dustin/go-humanize=20
>> e673fa1ffc91213297a60d18a6f513aa74bced52
>> +SRCREV_go-humanize=3D"e673fa1ffc91213297a60d18a6f513aa74bced52"
>> +SRC_URI +=3D=20
>> "git://github.com/dustin/go-humanize;name=3Dgo-humanize;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/dustin/go-humanize"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/fatih/color v1.13.0
>> +# [1] git ls-remote https://github.com/fatih/color=20
>> a05da93ebe62ca9fc6791d3376ec4dad01196448
>> +SRCREV_color=3D"a05da93ebe62ca9fc6791d3376ec4dad01196448"
>> +SRC_URI +=3D=20
>> "git://github.com/fatih/color;name=3Dcolor;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/=
color"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/go-ole/go-ole v1.2.6
>> +# [1] git ls-remote https://github.com/go-ole/go-ole=20
>> 8b1f7f90f6b1728609c9694f2cff140d34fd91f8
>> +SRCREV_go-ole=3D"8b1f7f90f6b1728609c9694f2cff140d34fd91f8"
>> +SRC_URI +=3D=20
>> "git://github.com/go-ole/go-ole;name=3Dgo-ole;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go=
-ole/go-ole"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/goccy/go-json v0.8.1
>> +# [1] git ls-remote https://github.com/goccy/go-json=20
>> de89bd3db67f2219c6183ec6febe2b5f7a6b06fb
>> +SRCREV_go-json=3D"de89bd3db67f2219c6183ec6febe2b5f7a6b06fb"
>> +SRC_URI +=3D=20
>> "git://github.com/goccy/go-json;name=3Dgo-json;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
occy/go-json"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/google/shlex v0.0.0-20191202100458-e7a=
fc7fbc510
>> +# [1] git ls-remote https://github.com/google/shlex=20
>> e7afc7fbc51079733e9468cdfd1efcd7d196cd1d
>> +SRCREV_shlex=3D"e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
>> +SRC_URI +=3D=20
>> "git://github.com/google/shlex;name=3Dshlex;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google=
/shlex"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/google/uuid v1.3.0
>> +# [1] git ls-remote https://github.com/google/uuid=20
>> 44b5fee7c49cf3bcdf723f106b36d56ef13ccc88
>> +SRCREV_uuid=3D"44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
>> +SRC_URI +=3D=20
>> "git://github.com/google/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google=
/uuid"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/inconshreveable/mousetrap v1.0.0
>> +# [1] git ls-remote https://github.com/inconshreveable/mousetrap=20
>> 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75
>> +SRCREV_mousetrap=3D"76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
>> +SRC_URI +=3D=20
>> "git://github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/inconshreveable/mousetrap"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/json-iterator/go v1.1.12
>> +# [1] git ls-remote https://github.com/json-iterator/go=20
>> 024077e996b048517130b21ea6bf12aa23055d3d
>> +SRCREV_go=3D"024077e996b048517130b21ea6bf12aa23055d3d"
>> +SRC_URI +=3D=20
>> "git://github.com/json-iterator/go;name=3Dgo;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jso=
n-iterator/go"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/klauspost/compress v1.13.6
>> +# [1] git ls-remote https://github.com/klauspost/compress=20
>> 38d4ba985ac157cb858763e016645e14e74c13c4
>> +SRCREV_compress=3D"38d4ba985ac157cb858763e016645e14e74c13c4"
>> +SRC_URI +=3D=20
>> "git://github.com/klauspost/compress;name=3Dcompress;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/klauspost/compress"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/mattn/go-ieproxy v0.0.1
>> +# [1] git ls-remote https://github.com/mattn/go-ieproxy=20
>> 439dd0581a2a03b415673a2462ad5c21eaabc588
>> +SRCREV_go-ieproxy=3D"439dd0581a2a03b415673a2462ad5c21eaabc588"
>> +SRC_URI +=3D=20
>> "git://github.com/mattn/go-ieproxy;name=3Dgo-ieproxy;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/mattn/go-ieproxy"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/mattn/go-isatty v0.0.14
>> +# [1] git ls-remote https://github.com/mattn/go-isatty=20
>> 504425e14f742f1f517c4586048b49b37f829c8e
>> +SRCREV_go-isatty=3D"504425e14f742f1f517c4586048b49b37f829c8e"
>> +SRC_URI +=3D=20
>> "git://github.com/mattn/go-isatty;name=3Dgo-isatty;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/mattn/go-isatty"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/minio/cli v1.22.0
>> +# [1] git ls-remote https://github.com/minio/cli=20
>> 735b30120ed7535d13933b0246f8a75cf80b0f74
>> +SRCREV_cli=3D"735b30120ed7535d13933b0246f8a75cf80b0f74"
>> +SRC_URI +=3D=20
>> "git://github.com/minio/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/cli=
"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/minio/colorjson v1.0.2
>> +# [1] git ls-remote https://github.com/minio/colorjson=20
>> f964b335cdb6cd51dff32a726d3d6ab9e1db0633
>> +SRCREV_colorjson=3D"f964b335cdb6cd51dff32a726d3d6ab9e1db0633"
>> +SRC_URI +=3D=20
>> "git://github.com/minio/colorjson;name=3Dcolorjson;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/minio/colorjson"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/minio/filepath v1.0.0
>> +# [1] git ls-remote https://github.com/minio/filepath=20
>> a116cb5d2b6396deea35d06389e3e9809c887fcf
>> +SRCREV_filepath=3D"a116cb5d2b6396deea35d06389e3e9809c887fcf"
>> +SRC_URI +=3D=20
>> "git://github.com/minio/filepath;name=3Dfilepath;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/minio/filepath"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/minio/madmin-go v1.3.11
>> +# [1] git ls-remote https://github.com/minio/madmin-go=20
>> 2664c729f38dce56bf2551675a33e41e1d5f2373
>> +SRCREV_madmin-go=3D"2664c729f38dce56bf2551675a33e41e1d5f2373"
>> +SRC_URI +=3D=20
>> "git://github.com/minio/madmin-go;name=3Dmadmin-go;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/minio/madmin-go"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/minio/md5-simd v1.1.2
>> +# [1] git ls-remote https://github.com/minio/md5-simd=20
>> 776275e0c9a74ceebbd50fe5c1d61b0c80c608df
>> +SRCREV_md5-simd=3D"776275e0c9a74ceebbd50fe5c1d61b0c80c608df"
>> +SRC_URI +=3D=20
>> "git://github.com/minio/md5-simd;name=3Dmd5-simd;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/minio/md5-simd"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/minio/minio-go/v7 v7.0.24
>> +# [1] git ls-remote https://github.com/minio/minio-go=20
>> 207899fb50d8584c8e3099dbf4b87b3ee6e0376f
>> +SRCREV_v7=3D"207899fb50d8584c8e3099dbf4b87b3ee6e0376f"
>> +SRC_URI +=3D=20
>> "git://github.com/minio/minio-go;name=3Dv7;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/=
minio-go/v7"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/minio/pkg v1.1.21
>> +# [1] git ls-remote https://github.com/minio/pkg=20
>> ac4b2bb8640d840b01bd89603f13dac7b9142b31
>> +SRCREV_pkg=3D"ac4b2bb8640d840b01bd89603f13dac7b9142b31"
>> +SRC_URI +=3D=20
>> "git://github.com/minio/pkg;name=3Dpkg;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/pkg=
"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/minio/selfupdate v0.4.0
>> +# [1] git ls-remote https://github.com/minio/selfupdate=20
>> 9e32fb8d38277355add4fa3983edb0b376d12bb5
>> +SRCREV_selfupdate=3D"9e32fb8d38277355add4fa3983edb0b376d12bb5"
>> +SRC_URI +=3D=20
>> "git://github.com/minio/selfupdate;name=3Dselfupdate;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/minio/selfupdate"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/minio/sha256-simd v1.0.0
>> +# [1] git ls-remote https://github.com/minio/sha256-simd=20
>> 6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9
>> +SRCREV_sha256-simd=3D"6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
>> +SRC_URI +=3D=20
>> "git://github.com/minio/sha256-simd;name=3Dsha256-simd;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/minio/sha256-simd"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/mitchellh/go-homedir v1.1.0
>> +# [1] git ls-remote https://github.com/mitchellh/go-homedir=20
>> af06845cf3004701891bf4fdb884bfe4920b3727
>> +SRCREV_go-homedir=3D"af06845cf3004701891bf4fdb884bfe4920b3727"
>> +SRC_URI +=3D=20
>> "git://github.com/mitchellh/go-homedir;name=3Dgo-homedir;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/mitchellh/go-homedir"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/pkg/xattr v0.4.4
>> +# [1] git ls-remote https://github.com/pkg/xattr=20
>> 8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a
>> +SRCREV_xattr=3D"8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a"
>> +SRC_URI +=3D=20
>> "git://github.com/pkg/xattr;name=3Dxattr;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/xat=
tr"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/posener/complete v1.2.3
>> +# [1] git ls-remote https://github.com/posener/complete=20
>> 05b68ffc813dd10c420993cb1cf927b346c057b8
>> +SRCREV_complete=3D"05b68ffc813dd10c420993cb1cf927b346c057b8"
>> +SRC_URI +=3D=20
>> "git://github.com/posener/complete;name=3Dcomplete;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/posener/complete"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/prometheus/client_golang v1.11.0
>> +# [1] git ls-remote https://github.com/prometheus/client_golang=20
>> 9b6b6df74a146d5e700cd7205818ad6b2f0afec2
>> +SRCREV_client_golang=3D"9b6b6df74a146d5e700cd7205818ad6b2f0afec2"
>> +SRC_URI +=3D=20
>> "git://github.com/prometheus/client_golang;name=3Dclient_golang;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/prometheus/client_golang"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/rjeczalik/notify v0.9.2
>> +# [1] git ls-remote https://github.com/rjeczalik/notify=20
>> 69d839f37b13a8cb7a78366f7633a4071cb43be7
>> +SRCREV_notify=3D"69d839f37b13a8cb7a78366f7633a4071cb43be7"
>> +SRC_URI +=3D=20
>> "git://github.com/rjeczalik/notify;name=3Dnotify;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/rjeczalik/notify"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/rs/xid v1.3.0
>> +# [1] git ls-remote https://github.com/rs/xid=20
>> efa678f304ab65d6d57eedcb086798381ae22206
>> +SRCREV_xid=3D"efa678f304ab65d6d57eedcb086798381ae22206"
>> +SRC_URI +=3D=20
>> "git://github.com/rs/xid;name=3Dxid;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rs/xid"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/secure-io/sio-go v0.3.1
>> +# [1] git ls-remote https://github.com/secure-io/sio-go=20
>> a455d2cd8fcacdfe18557d117db15c0629fb7e2c
>> +SRCREV_sio-go=3D"a455d2cd8fcacdfe18557d117db15c0629fb7e2c"
>> +SRC_URI +=3D=20
>> "git://github.com/secure-io/sio-go;name=3Dsio-go;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/secure-io/sio-go"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/shirou/gopsutil/v3 v3.21.12
>> +# [1] git ls-remote https://github.com/shirou/gopsutil=20
>> 2f8da0a39487ceddf44cebe53a1b563b0b7173cc
>> +SRCREV_v3=3D"2f8da0a39487ceddf44cebe53a1b563b0b7173cc"
>> +SRC_URI +=3D=20
>> "git://github.com/shirou/gopsutil;name=3Dv3;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/shirou=
/gopsutil/v3"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/tidwall/gjson v1.12.1
>> +# [1] git ls-remote https://github.com/tidwall/gjson=20
>> db0033701cccc8e2e43b77d03e4f509a48b6b2f2
>> +SRCREV_gjson=3D"db0033701cccc8e2e43b77d03e4f509a48b6b2f2"
>> +SRC_URI +=3D=20
>> "git://github.com/tidwall/gjson;name=3Dgjson;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tid=
wall/gjson"
>> +
>> +#=C2=A0=C2=A0=C2=A0 golang.org/x/crypto v0.0.0-20220128200615-198e437=
4d7ed
>> +# [1] git ls-remote https://go.googlesource.com/crypto=20
>> 198e4374d7ed0909af956c010c19ee6bae6a1bc9
>> +SRCREV_crypto=3D"198e4374d7ed0909af956c010c19ee6bae6a1bc9"
>> +SRC_URI +=3D=20
>> "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googleso=
urce.com/crypto"
>> +
>> +#=C2=A0=C2=A0=C2=A0 golang.org/x/net v0.0.0-20220127200216-cd36cc0744=
dd
>> +# [1] git ls-remote https://go.googlesource.com/net=20
>> cd36cc0744dd695657988f15f08446dc81e16efc
>> +SRCREV_net=3D"cd36cc0744dd695657988f15f08446dc81e16efc"
>> +SRC_URI +=3D=20
>> "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.c=
om/net"
>> +
>> +#=C2=A0=C2=A0=C2=A0 golang.org/x/text v0.3.7
>> +# [1] git ls-remote https://go.googlesource.com/text=20
>> 3cd4007149f3f883d229d707172ed356727aae99
>> +SRCREV_text=3D"3cd4007149f3f883d229d707172ed356727aae99"
>> +SRC_URI +=3D=20
>> "git://go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.c=
om/text"
>> +
>> +#=C2=A0=C2=A0=C2=A0 gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a=
05b
>> +# [1] git ls-remote https://gopkg.in/check.v1=20
>> 038fdea0a05bc030b0bfda479dc2e08d2220ec74
>> +SRCREV_check.v1=3D"038fdea0a05bc030b0bfda479dc2e08d2220ec74"
>> +SRC_URI +=3D=20
>> "git://gopkg.in/check.v1;name=3Dcheck.v1;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/check.v1"
>> +
>> +#=C2=A0=C2=A0=C2=A0 gopkg.in/h2non/filetype.v1 v1.0.5
>> +# [1] git ls-remote https://gopkg.in/h2non/filetype.v1=20
>> 8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b
>> +SRCREV_filetype.v1=3D"8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b"
>> +SRC_URI +=3D=20
>> "git://gopkg.in/h2non/filetype.v1;name=3Dfiletype.v1;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.=
in/h2non/filetype.v1"
>> +
>> +#=C2=A0=C2=A0=C2=A0 gopkg.in/yaml.v2 v2.4.0
>> +# [1] git ls-remote https://gopkg.in/yaml.v2=20
>> 7649d4548cb53a614db133b2a8ac1f31859dda8c
>> +SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
>> +SRC_URI +=3D=20
>> "git://gopkg.in/yaml.v2;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2"
>> +
>> +# WARNING: unable to reset to revision HEAD
>> +#=C2=A0=C2=A0=C2=A0 maze.io/x/duration v0.0.0-20160924141736-faac084b=
6075
>> +# [1] git ls-remote https://maze.io/x/duration HEAD
>> +# SRCREV_duration=3D"faac084b60750d976faae179bf78124fda0f0b57"
>> +# SRCREV_duration=3D"faac084b6075"
>> +SRCREV_duration=3D"faac084b60750d976faae179bf78124fda0f0b57"
>> +#SRCREV_duration=3D"HEAD"
>> +SRC_URI +=3D=20
>> "git://git.maze.io/go/duration;name=3Dduration;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/maze.io/x/du=
ration"
>> +#SRC_URI +=3D=20
>> "git://maze.io/x/duration;name=3Dduration;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/maze.io/x/duratio=
n"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/briandowns/spinner v1.18.1
>> +# [1] git ls-remote https://github.com/briandowns/spinner=20
>> 16b2c08520470d8126885d3833d66bcf76ac5cea
>> +SRCREV_spinner=3D"16b2c08520470d8126885d3833d66bcf76ac5cea"
>> +SRC_URI +=3D=20
>> "git://github.com/briandowns/spinner;name=3Dspinner;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/briandowns/spinner"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/charmbracelet/bubbles v0.10.0
>> +# [1] git ls-remote https://github.com/charmbracelet/bubbles=20
>> 7714089ad7c81898564ebeb7b6876b5844e26ccd
>> +SRCREV_bubbles=3D"7714089ad7c81898564ebeb7b6876b5844e26ccd"
>> +SRC_URI +=3D=20
>> "git://github.com/charmbracelet/bubbles;name=3Dbubbles;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/charmbracelet/bubbles"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/charmbracelet/lipgloss=20
>> v0.4.1-0.20220204041308-bf2912e703f6
>> +# [1] git ls-remote https://github.com/charmbracelet/lipgloss=20
>> bf2912e703f6ecf88a1b843472afd47ce5002caf
>> +SRCREV_lipgloss=3D"bf2912e703f6ecf88a1b843472afd47ce5002caf"
>> +SRC_URI +=3D=20
>> "git://github.com/charmbracelet/lipgloss;name=3Dlipgloss;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/charmbracelet/lipgloss"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/gdamore/tcell/v2 v2.4.1-0.202109050028=
22-f057f0a857a1
>> +# [1] git ls-remote https://github.com/gdamore/tcell=20
>> f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1
>> +SRCREV_v2=3D"f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1"
>> +SRC_URI +=3D=20
>> "git://github.com/gdamore/tcell;name=3Dv2;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gdamor=
e/tcell/v2"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/golang-jwt/jwt/v4 v4.4.1
>> +# [1] git ls-remote https://github.com/golang-jwt/jwt=20
>> 0972257eba279bb357882afc11db8218644ad565
>> +SRCREV_v4=3D"0972257eba279bb357882afc11db8218644ad565"
>> +SRC_URI +=3D=20
>> "git://github.com/golang-jwt/jwt;name=3Dv4;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang=
-jwt/jwt/v4"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/navidys/tvxwidgets v0.1.0
>> +# [1] git ls-remote https://github.com/navidys/tvxwidgets=20
>> f017cfd5ce6d4bd7fb22529305d7a438c3f1369d
>> +SRCREV_tvxwidgets=3D"f017cfd5ce6d4bd7fb22529305d7a438c3f1369d"
>> +SRC_URI +=3D=20
>> "git://github.com/navidys/tvxwidgets;name=3Dtvxwidgets;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/navidys/tvxwidgets"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/olekukonko/tablewriter v0.0.5
>> +# [1] git ls-remote https://github.com/olekukonko/tablewriter=20
>> c7d2a8a09b076b70918308a3cd95464b2ae3b5d8
>> +SRCREV_tablewriter=3D"c7d2a8a09b076b70918308a3cd95464b2ae3b5d8"
>> +SRC_URI +=3D=20
>> "git://github.com/olekukonko/tablewriter;name=3Dtablewriter;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/olekukonko/tablewriter"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/rivo/tview v0.0.0-20211202162923-2a6de=
950f73b
>> +# [1] git ls-remote https://github.com/rivo/tview=20
>> 2a6de950f73bdc70658f7e754d4b5593f15c8408
>> +SRCREV_tview=3D"2a6de950f73bdc70658f7e754d4b5593f15c8408"
>> +SRC_URI +=3D=20
>> "git://github.com/rivo/tview;name=3Dtview;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/t=
view"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/tinylib/msgp v1.1.6
>> +# [1] git ls-remote https://github.com/tinylib/msgp=20
>> 205265da651409c54677b486e350b4d105da6d8b
>> +SRCREV_msgp=3D"205265da651409c54677b486e350b4d105da6d8b"
>> +SRC_URI +=3D=20
>> "git://github.com/tinylib/msgp;name=3Dmsgp;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tinyli=
b/msgp"
>> +
>> +#=C2=A0=C2=A0=C2=A0 golang.org/x/term v0.0.0-20210927222741-03fcf44c2=
211
>> +# [1] git ls-remote https://go.googlesource.com/term=20
>> 03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50
>> +SRCREV_term=3D"03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50"
>> +SRC_URI +=3D=20
>> "git://go.googlesource.com/term;name=3Dterm;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.c=
om/term"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/beorn7/perks v1.0.1
>> +# [1] git ls-remote https://github.com/beorn7/perks=20
>> c49ff274687222a7373c4cd83578f1065cf3e143
>> +SRCREV_perks=3D"c49ff274687222a7373c4cd83578f1065cf3e143"
>> +SRC_URI +=3D=20
>> "git://github.com/beorn7/perks;name=3Dperks;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/beorn7=
/perks"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/cespare/xxhash/v2 v2.1.2
>> +# [1] git ls-remote https://github.com/cespare/xxhash=20
>> 7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4
>> +SRCREV_v21=3D"7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4"
>> +SRC_URI +=3D=20
>> "git://github.com/cespare/xxhash;name=3Dv21;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cespar=
e/xxhash/v2"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/containerd/console v1.0.2
>> +# [1] git ls-remote https://github.com/containerd/console=20
>> d5efa7d56fd239f7f3dad2ab6685db09359a3618
>> +SRCREV_console=3D"d5efa7d56fd239f7f3dad2ab6685db09359a3618"
>> +SRC_URI +=3D=20
>> "git://github.com/containerd/console;name=3Dconsole;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/containerd/console"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/coreos/go-semver v0.3.0
>> +# [1] git ls-remote https://github.com/coreos/go-semver=20
>> 6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5
>> +SRCREV_go-semver=3D"6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5"
>> +SRC_URI +=3D=20
>> "git://github.com/coreos/go-semver;name=3Dgo-semver;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/coreos/go-semver"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/coreos/go-systemd/v22 v22.3.2
>> +# [1] git ls-remote https://github.com/coreos/go-systemd=20
>> 0b40357fd65760243a3eceb80a299772c23c8470
>> +SRCREV_v22=3D"0b40357fd65760243a3eceb80a299772c23c8470"
>> +SRC_URI +=3D=20
>> "git://github.com/coreos/go-systemd;name=3Dv22;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/c=
oreos/go-systemd/v22"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
>> +# [1] git ls-remote https://github.com/decred/dcrd=20
>> 9f8114e53d1ab500886db980fa0d9ddaffa96271
>> +SRCREV_v41=3D"9f8114e53d1ab500886db980fa0d9ddaffa96271"
>> +SRC_URI +=3D=20
>> "git://github.com/decred/dcrd;name=3Dv41;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/decred/=
dcrd/dcrec/secp256k1/v4"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/fatih/structs v1.1.0
>> +# [1] git ls-remote https://github.com/fatih/structs=20
>> 4966fc68f5b7593aafa6cbbba2d65ec6e1416047
>> +SRCREV_structs=3D"4966fc68f5b7593aafa6cbbba2d65ec6e1416047"
>> +SRC_URI +=3D=20
>> "git://github.com/fatih/structs;name=3Dstructs;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/f=
atih/structs"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/gdamore/encoding v1.0.0
>> +# [1] git ls-remote https://github.com/gdamore/encoding=20
>> 79c592247a6248468805a0e297f43a7cac979903
>> +SRCREV_encoding=3D"79c592247a6248468805a0e297f43a7cac979903"
>> +SRC_URI +=3D=20
>> "git://github.com/gdamore/encoding;name=3Dencoding;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/gdamore/encoding"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/gogo/protobuf v1.3.2
>> +# [1] git ls-remote https://github.com/gogo/protobuf=20
>> b03c65ea87cdc3521ede29f62fe3ce239267c1bc
>> +SRCREV_protobuf=3D"b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
>> +SRC_URI +=3D=20
>> "git://github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
gogo/protobuf"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/golang/protobuf v1.5.2
>> +# [1] git ls-remote https://github.com/golang/protobuf=20
>> ae97035608a719c7a1c1c41bed0ae0744bdb0c6f
>> +SRCREV_protobuf1=3D"ae97035608a719c7a1c1c41bed0ae0744bdb0c6f"
>> +SRC_URI +=3D=20
>> "git://github.com/golang/protobuf;name=3Dprotobuf1;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/protobuf"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/hashicorp/errwrap v1.1.0
>> +# [1] git ls-remote https://github.com/hashicorp/errwrap=20
>> 7b00e5db719c64d14dd0caaacbd13e76254d02c0
>> +SRCREV_errwrap=3D"7b00e5db719c64d14dd0caaacbd13e76254d02c0"
>> +SRC_URI +=3D=20
>> "git://github.com/hashicorp/errwrap;name=3Derrwrap;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/hashicorp/errwrap"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/hashicorp/go-multierror v1.1.1
>> +# [1] git ls-remote https://github.com/hashicorp/go-multierror=20
>> 9974e9ec57696378079ecc3accd3d6f29401b3a0
>> +SRCREV_go-multierror=3D"9974e9ec57696378079ecc3accd3d6f29401b3a0"
>> +SRC_URI +=3D=20
>> "git://github.com/hashicorp/go-multierror;name=3Dgo-multierror;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/hashicorp/go-multierror"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/klauspost/cpuid/v2 v2.0.9
>> +# [1] git ls-remote https://github.com/klauspost/cpuid=20
>> 6903d4066801a7d800d4537ee9eebe81ea97000e
>> +SRCREV_v212=3D"6903d4066801a7d800d4537ee9eebe81ea97000e"
>> +SRC_URI +=3D=20
>> "git://github.com/klauspost/cpuid;name=3Dv212;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kl=
auspost/cpuid/v2"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/kr/text v0.2.0
>> +# [1] git ls-remote https://github.com/kr/text=20
>> 0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5
>> +SRCREV_text1=3D"0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5"
>> +SRC_URI +=3D=20
>> "git://github.com/kr/text;name=3Dtext1;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr/text"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/lestrrat-go/backoff/v2 v2.0.8
>> +# [1] git ls-remote https://github.com/lestrrat-go/backoff=20
>> c3af762cb9d2bc8339e1d5099a4550366a675f60
>> +SRCREV_v2123=3D"c3af762cb9d2bc8339e1d5099a4550366a675f60"
>> +SRC_URI +=3D=20
>> "git://github.com/lestrrat-go/backoff;name=3Dv2123;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/lestrrat-go/backoff/v2"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/lestrrat-go/blackmagic v1.0.0
>> +# [1] git ls-remote https://github.com/lestrrat-go/blackmagic=20
>> 370527f88bbfd5be3192a38af3148dbd64f0976f
>> +SRCREV_blackmagic=3D"370527f88bbfd5be3192a38af3148dbd64f0976f"
>> +SRC_URI +=3D=20
>> "git://github.com/lestrrat-go/blackmagic;name=3Dblackmagic;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/lestrrat-go/blackmagic"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/lestrrat-go/httpcc v1.0.0
>> +# [1] git ls-remote https://github.com/lestrrat-go/httpcc=20
>> e7e8fea419e32f7549252ad15ecf17f3a3c1a268
>> +SRCREV_httpcc=3D"e7e8fea419e32f7549252ad15ecf17f3a3c1a268"
>> +SRC_URI +=3D=20
>> "git://github.com/lestrrat-go/httpcc;name=3Dhttpcc;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/lestrrat-go/httpcc"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/lestrrat-go/iter v1.0.1
>> +# [1] git ls-remote https://github.com/lestrrat-go/iter=20
>> 628869e97ee3dcc09033086e547a5cab96b0d708
>> +SRCREV_iter=3D"628869e97ee3dcc09033086e547a5cab96b0d708"
>> +SRC_URI +=3D=20
>> "git://github.com/lestrrat-go/iter;name=3Diter;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/l=
estrrat-go/iter"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/lestrrat-go/jwx v1.2.14
>> +# [1] git ls-remote https://github.com/lestrrat-go/jwx=20
>> de7d9bca43812abc4f630320f8632108ccfe34bf
>> +SRCREV_jwx=3D"de7d9bca43812abc4f630320f8632108ccfe34bf"
>> +SRC_URI +=3D=20
>> "git://github.com/lestrrat-go/jwx;name=3Djwx;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/les=
trrat-go/jwx"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/lestrrat-go/option v1.0.0
>> +# [1] git ls-remote https://github.com/lestrrat-go/option=20
>> 7e3467dce320ff45667b138ae503367c92deaa0b
>> +SRCREV_option=3D"7e3467dce320ff45667b138ae503367c92deaa0b"
>> +SRC_URI +=3D=20
>> "git://github.com/lestrrat-go/option;name=3Doption;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/lestrrat-go/option"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/lucasb-eyer/go-colorful v1.2.0
>> +# [1] git ls-remote https://github.com/lucasb-eyer/go-colorful=20
>> d2b05a0d83cca9d610425691c3253d5f36d0ad06
>> +SRCREV_go-colorful=3D"d2b05a0d83cca9d610425691c3253d5f36d0ad06"
>> +SRC_URI +=3D=20
>> "git://github.com/lucasb-eyer/go-colorful;name=3Dgo-colorful;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/lucasb-eyer/go-colorful"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/lufia/plan9stats v0.0.0-20211012122336=
-39d0f177ccd0
>> +# [1] git ls-remote https://github.com/lufia/plan9stats=20
>> 39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2
>> +SRCREV_plan9stats=3D"39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2"
>> +SRC_URI +=3D=20
>> "git://github.com/lufia/plan9stats;name=3Dplan9stats;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/lufia/plan9stats"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/mattn/go-colorable v0.1.12
>> +# [1] git ls-remote https://github.com/mattn/go-colorable=20
>> e1bb79c8d53c38a60962ad4b8f658226cc983710
>> +SRCREV_go-colorable=3D"e1bb79c8d53c38a60962ad4b8f658226cc983710"
>> +SRC_URI +=3D=20
>> "git://github.com/mattn/go-colorable;name=3Dgo-colorable;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/mattn/go-colorable"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/mattn/go-runewidth v0.0.13
>> +# [1] git ls-remote https://github.com/mattn/go-runewidth=20
>> df1ff59654317c1b5a3f860ffc47402931932104
>> +SRCREV_go-runewidth=3D"df1ff59654317c1b5a3f860ffc47402931932104"
>> +SRC_URI +=3D=20
>> "git://github.com/mattn/go-runewidth;name=3Dgo-runewidth;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/mattn/go-runewidth"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/matttproud/golang_protobuf_extensions =
v1.0.1
>> +# [1] git ls-remote=20
>> https://github.com/matttproud/golang_protobuf_extensions=20
>> c12348ce28de40eed0136aa2b644d0ee0650e56c
>> +SRCREV_golang_protobuf_extensions=3D"c12348ce28de40eed0136aa2b644d0ee=
0650e56c"=20
>>
>> +SRC_URI +=3D=20
>> "git://github.com/matttproud/golang_protobuf_extensions;name=3Dgolang_=
protobuf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}=
/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protobuf_exte=
nsions"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/modern-go/concurrent v0.0.0-2018030601=
2644-bacd9c7ef1dd
>> +# [1] git ls-remote https://github.com/modern-go/concurrent=20
>> bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94
>> +SRCREV_concurrent=3D"bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
>> +SRC_URI +=3D=20
>> "git://github.com/modern-go/concurrent;name=3Dconcurrent;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/modern-go/concurrent"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/modern-go/reflect2 v1.0.2
>> +# [1] git ls-remote https://github.com/modern-go/reflect2=20
>> 2b33151c9bbc5231aea69b8861c540102b087070
>> +SRCREV_reflect2=3D"2b33151c9bbc5231aea69b8861c540102b087070"
>> +SRC_URI +=3D=20
>> "git://github.com/modern-go/reflect2;name=3Dreflect2;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/modern-go/reflect2"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/muesli/ansi v0.0.0-20211018074035-2e02=
1307bc4b
>> +# [1] git ls-remote https://github.com/muesli/ansi=20
>> 2e021307bc4b4f4766c3fb4faf6030b13dc9ec51
>> +SRCREV_ansi=3D"2e021307bc4b4f4766c3fb4faf6030b13dc9ec51"
>> +SRC_URI +=3D=20
>> "git://github.com/muesli/ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli=
/ansi"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/muesli/reflow v0.3.0
>> +# [1] git ls-remote https://github.com/muesli/reflow=20
>> 602e329532049c9e33fa8c74e352a46fb9486947
>> +SRCREV_reflow=3D"602e329532049c9e33fa8c74e352a46fb9486947"
>> +SRC_URI +=3D=20
>> "git://github.com/muesli/reflow;name=3Dreflow;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mu=
esli/reflow"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/muesli/termenv v0.11.1-0.2022020403583=
4-5ac8409525e0
>> +# [1] git ls-remote https://github.com/muesli/termenv=20
>> 5ac8409525e03ee6cd96daeae32d47902b88f32a
>> +SRCREV_termenv=3D"5ac8409525e03ee6cd96daeae32d47902b88f32a"
>> +SRC_URI +=3D=20
>> "git://github.com/muesli/termenv;name=3Dtermenv;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
muesli/termenv"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/niemeyer/pretty v0.0.0-20200227124842-=
a10e7caefd8e
>> +# [1] git ls-remote https://github.com/niemeyer/pretty=20
>> a10e7caefd8e0d600cea437f5c3613aeb1553d56
>> +SRCREV_pretty=3D"a10e7caefd8e0d600cea437f5c3613aeb1553d56"
>> +SRC_URI +=3D=20
>> "git://github.com/niemeyer/pretty;name=3Dpretty;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
niemeyer/pretty"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/philhofer/fwd v1.1.1
>> +# [1] git ls-remote https://github.com/philhofer/fwd=20
>> 9bcb9cab1b0394d8516a132ec243ba944efdb644
>> +SRCREV_fwd=3D"9bcb9cab1b0394d8516a132ec243ba944efdb644"
>> +SRC_URI +=3D=20
>> "git://github.com/philhofer/fwd;name=3Dfwd;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/philho=
fer/fwd"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/pkg/errors v0.9.1
>> +# [1] git ls-remote https://github.com/pkg/errors=20
>> 614d223910a179a466c1767a985424175c39b465
>> +SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
>> +SRC_URI +=3D=20
>> "git://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/er=
rors"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/power-devops/perfstat=20
>> v0.0.0-20210106213030-5aafc221ea8c
>> +# [1] git ls-remote https://github.com/power-devops/perfstat=20
>> 5aafc221ea8c1ff54b0835cbd5f2386a8410be11
>> +SRCREV_perfstat=3D"5aafc221ea8c1ff54b0835cbd5f2386a8410be11"
>> +SRC_URI +=3D=20
>> "git://github.com/power-devops/perfstat;name=3Dperfstat;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/power-devops/perfstat"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/prometheus/client_model v0.2.0
>> +# [1] git ls-remote https://github.com/prometheus/client_model=20
>> f44e7adcba5ee54c8a94709e6fc300d83245f171
>> +SRCREV_client_model=3D"f44e7adcba5ee54c8a94709e6fc300d83245f171"
>> +SRC_URI +=3D=20
>> "git://github.com/prometheus/client_model;name=3Dclient_model;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/prometheus/client_model"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/prometheus/common v0.32.1
>> +# [1] git ls-remote https://github.com/prometheus/common=20
>> a8301e4aa43c56eadd119b45e363a94166508d45
>> +SRCREV_common=3D"a8301e4aa43c56eadd119b45e363a94166508d45"
>> +SRC_URI +=3D=20
>> "git://github.com/prometheus/common;name=3Dcommon;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/prometheus/common"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/prometheus/procfs v0.7.3
>> +# [1] git ls-remote https://github.com/prometheus/procfs=20
>> f436cbb89ece38bf080d446b3ca27053b305eaac
>> +SRCREV_procfs=3D"f436cbb89ece38bf080d446b3ca27053b305eaac"
>> +SRC_URI +=3D=20
>> "git://github.com/prometheus/procfs;name=3Dprocfs;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/prometheus/procfs"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/rivo/uniseg v0.2.0
>> +# [1] git ls-remote https://github.com/rivo/uniseg=20
>> 75711fccf6a3e85bc74c241e2dddd06a9bc9e53d
>> +SRCREV_uniseg=3D"75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
>> +SRC_URI +=3D=20
>> "git://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/u=
niseg"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/sirupsen/logrus v1.8.1
>> +# [1] git ls-remote https://github.com/sirupsen/logrus=20
>> bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b
>> +SRCREV_logrus=3D"bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
>> +SRC_URI +=3D=20
>> "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
sirupsen/logrus"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/tidwall/match v1.1.1
>> +# [1] git ls-remote https://github.com/tidwall/match=20
>> 4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf
>> +SRCREV_match=3D"4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
>> +SRC_URI +=3D=20
>> "git://github.com/tidwall/match;name=3Dmatch;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tid=
wall/match"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/tidwall/pretty v1.2.0
>> +# [1] git ls-remote https://github.com/tidwall/pretty=20
>> aaa765e7476acb0028a854b85675801362cbdaa2
>> +SRCREV_pretty1=3D"aaa765e7476acb0028a854b85675801362cbdaa2"
>> +SRC_URI +=3D=20
>> "git://github.com/tidwall/pretty;name=3Dpretty1;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
tidwall/pretty"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/tklauser/go-sysconf v0.3.9
>> +# [1] git ls-remote https://github.com/tklauser/go-sysconf=20
>> 746b19d14e19d242c2daa08e0d645c19832c1939
>> +SRCREV_go-sysconf=3D"746b19d14e19d242c2daa08e0d645c19832c1939"
>> +SRC_URI +=3D=20
>> "git://github.com/tklauser/go-sysconf;name=3Dgo-sysconf;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/tklauser/go-sysconf"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/tklauser/numcpus v0.3.0
>> +# [1] git ls-remote https://github.com/tklauser/numcpus=20
>> cc3fdd5f3955d53d50d94380963bddd24bd373e2
>> +SRCREV_numcpus=3D"cc3fdd5f3955d53d50d94380963bddd24bd373e2"
>> +SRC_URI +=3D=20
>> "git://github.com/tklauser/numcpus;name=3Dnumcpus;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/tklauser/numcpus"
>> +
>> +#=C2=A0=C2=A0=C2=A0 github.com/yusufpapurcu/wmi v1.2.2
>> +# [1] git ls-remote https://github.com/yusufpapurcu/wmi=20
>> 253c5f0cb35e666c4c0fc42083824e7c89f0cc8d
>> +SRCREV_wmi=3D"253c5f0cb35e666c4c0fc42083824e7c89f0cc8d"
>> +SRC_URI +=3D=20
>> "git://github.com/yusufpapurcu/wmi;name=3Dwmi;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/yu=
sufpapurcu/wmi"
>> +
>> +#=C2=A0=C2=A0=C2=A0 go.etcd.io/etcd/api/v3 v3.5.2
>> +# [1] git ls-remote https://github.com/etcd-io/etcd=20
>> 4591a096d4d3c08e577d7269851938db0c1da3d4
>> +SRCREV_v31=3D"4591a096d4d3c08e577d7269851938db0c1da3d4"
>> +SRC_URI +=3D=20
>> "git://github.com/etcd-io/etcd;name=3Dv31;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/etcd-i=
o/etcd/api/v3"
>> +
>> +#=C2=A0=C2=A0=C2=A0 go.uber.org/atomic v1.9.0
>> +# [1] git ls-remote https://github.com/uber-go/atomic=20
>> 135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8
>> +SRCREV_atomic=3D"135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8"
>> +SRC_URI +=3D=20
>> "git://github.com/uber-go/atomic;name=3Datomic;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/=
atomic"
>> +
>> +#=C2=A0=C2=A0=C2=A0 go.uber.org/multierr v1.7.0
>> +# [1] git ls-remote https://github.com/uber-go/multierr=20
>> 19d9fff1d3b66750a134671435786579bc994737
>> +SRCREV_multierr=3D"19d9fff1d3b66750a134671435786579bc994737"
>> +SRC_URI +=3D=20
>> "git://github.com/uber-go/multierr;name=3Dmultierr;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.=
org/multierr"
>> +
>> +#=C2=A0=C2=A0=C2=A0 go.uber.org/zap v1.19.1
>> +# [1] git ls-remote https://github.com/uber-go/zap=20
>> 2f61e97148e69cd2dd1902b03e89ce07cd1218a1
>> +SRCREV_zap=3D"2f61e97148e69cd2dd1902b03e89ce07cd1218a1"
>> +SRC_URI +=3D=20
>> "git://github.com/uber-go/zap;name=3Dzap;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/zap"
>> +
>> +#=C2=A0=C2=A0=C2=A0 golang.org/x/sync v0.0.0-20210220032951-036812b2e=
83c
>> +# [1] git ls-remote https://go.googlesource.com/sync=20
>> 036812b2e83c0ddf193dd5a34e034151da389d09
>> +SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
>> +SRC_URI +=3D=20
>> "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.c=
om/sync"
>> +
>> +#=C2=A0=C2=A0=C2=A0 golang.org/x/sys v0.0.0-20220412211240-33da011f77=
ad
>> +# [1] git ls-remote https://go.googlesource.com/sys=20
>> 33da011f77ade50ff5b6a6fb4a9a1e6d6b285809
>> +SRCREV_sys=3D"33da011f77ade50ff5b6a6fb4a9a1e6d6b285809"
>> +SRC_URI +=3D=20
>> "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.c=
om/sys"
>> +
>> +# [ERROR]: git operation failed: Command '['git', 'clone',=20
>> 'https://github.com/googleapis/go-genproto',=20
>> 'google.golang.org/genproto']' timed out after 30 seconds
>> +#=C2=A0=C2=A0=C2=A0 google.golang.org/genproto v0.0.0-20211223182754-=
3ac035c7e7cb
>> +# [1] git ls-remote https://github.com/googleapis/go-genproto=20
>> 3ac035c7e7cb
>> +#SRCREV_genproto=3D"3ac035c7e7cb"
>> +SRCREV_genproto=3D"3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3"
>> +SRC_URI +=3D=20
>> "git://github.com/googleapis/go-genproto;name=3Dgenproto;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
ogle.golang.org/genproto"
>> +
>> +#=C2=A0=C2=A0=C2=A0 google.golang.org/grpc v1.43.0
>> +# [1] git ls-remote https://github.com/grpc/grpc-go=20
>> 14c11384b76b67f7b1b32a5d18f865762634c0ae
>> +SRCREV_grpc=3D"14c11384b76b67f7b1b32a5d18f865762634c0ae"
>> +SRC_URI +=3D=20
>> "git://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org=
/grpc"
>> +
>> +#=C2=A0=C2=A0=C2=A0 google.golang.org/protobuf v1.27.1
>> +# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go=20
>> b92717ecb630d4a4824b372bf98c729d87311a4d
>> +SRCREV_protobuf12=3D"b92717ecb630d4a4824b372bf98c729d87311a4d"
>> +SRC_URI +=3D=20
>> "git://github.com/protocolbuffers/protobuf-go;name=3Dprotobuf12;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/google.golang.org/protobuf"
>> +
>> +#=C2=A0=C2=A0=C2=A0 gopkg.in/ini.v1 v1.66.3
>> +# [1] git ls-remote https://gopkg.in/ini.v1=20
>> fcd6cc399e588727c1231f4ea187d1b963536bcc
>> +SRCREV_ini.v1=3D"fcd6cc399e588727c1231f4ea187d1b963536bcc"
>> +SRC_URI +=3D=20
>> "git://gopkg.in/ini.v1;name=3Dini.v1;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1"
>> +
>> +inherit go
>> +inherit goarch
>> +
>> +DEPENDS +=3D "rsync-native"
>> +
>> +do_compile() {
>> +
>> +=C2=A0=C2=A0=C2=A0 cd ${S}/src/${GO_IMPORT}
>> +
>> +=C2=A0=C2=A0=C2=A0 export GOFLAGS=3D"-mod=3Dvendor"
>> +=C2=A0=C2=A0=C2=A0 export=20
>> GOPATH=3D"$GOPATH:${S}/src/import/.gopath:${S}/src/import/vendor"
>> +=20
>> sites=3D"github.com/charmbracelet/bubbletea:github.com/charmbracelet/b=
ubbletea=20
>> \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/cheggaaa/pb:github.com/cheggaaa/pb \
>> + github.com/dustin/go-humanize:github.com/dustin/go-humanize \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/fatih/color:github.com/fatih/color \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/go-ole/go-ole:github.com/go-ole/go-ole \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/goccy/go-json:github.com/goccy/go-json \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/google/shlex:github.com/google/shlex \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/google/uuid:github.com/google/uuid \
>> +=20
>> github.com/inconshreveable/mousetrap:github.com/inconshreveable/mouset=
rap=20
>> \
>> + github.com/json-iterator/go:github.com/json-iterator/go \
>> + github.com/klauspost/compress:github.com/klauspost/compress \
>> + github.com/mattn/go-ieproxy:github.com/mattn/go-ieproxy \
>> + github.com/mattn/go-isatty:github.com/mattn/go-isatty \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/minio/cli:github.com/minio/cli \
>> + github.com/minio/colorjson:github.com/minio/colorjson \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/minio/filepath:github.com/minio/filepath \
>> + github.com/minio/madmin-go:github.com/minio/madmin-go \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/minio/md5-simd:github.com/minio/md5-simd \
>> + github.com/minio/minio-go/v7:github.com/minio/minio-go/v7 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/minio/pkg:github.com/minio/pkg \
>> + github.com/minio/selfupdate:github.com/minio/selfupdate \
>> + github.com/minio/sha256-simd:github.com/minio/sha256-simd \
>> + github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/pkg/xattr:github.com/pkg/xattr \
>> + github.com/posener/complete:github.com/posener/complete \
>> +=20
>> github.com/prometheus/client_golang:github.com/prometheus/client_golan=
g=20
>> \
>> + github.com/rjeczalik/notify:github.com/rjeczalik/notify \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/rs/xid:github.com/rs/xid \
>> + github.com/secure-io/sio-go:github.com/secure-io/sio-go \
>> + github.com/shirou/gopsutil/v3:github.com/shirou/gopsutil/v3 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/tidwall/gjson:github.com/tidwall/gjson \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 golang.o=
rg/x/crypto:go.googlesource.com/crypto \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 golang.o=
rg/x/net:go.googlesource.com/net \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 golang.o=
rg/x/text:go.googlesource.com/text \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gopkg.in=
/check.v1:gopkg.in/check.v1 \
>> + gopkg.in/h2non/filetype.v1:gopkg.in/h2non/filetype.v1 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gopkg.in=
/yaml.v2:gopkg.in/yaml.v2 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maze.io/=
x/duration:maze.io/x/duration \
>> + github.com/briandowns/spinner:github.com/briandowns/spinner \
>> + github.com/charmbracelet/bubbles:github.com/charmbracelet/bubbles \
>> + github.com/charmbracelet/lipgloss:github.com/charmbracelet/lipgloss =
\
>> + github.com/gdamore/tcell/v2:github.com/gdamore/tcell/v2 \
>> + github.com/golang-jwt/jwt/v4:github.com/golang-jwt/jwt/v4 \
>> + github.com/navidys/tvxwidgets:github.com/navidys/tvxwidgets \
>> + github.com/olekukonko/tablewriter:github.com/olekukonko/tablewriter =
\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/rivo/tview:github.com/rivo/tview \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/tinylib/msgp:github.com/tinylib/msgp \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 golang.o=
rg/x/term:go.googlesource.com/term \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/beorn7/perks:github.com/beorn7/perks \
>> + github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 \
>> + github.com/containerd/console:github.com/containerd/console \
>> + github.com/coreos/go-semver:github.com/coreos/go-semver \
>> + github.com/coreos/go-systemd/v22:github.com/coreos/go-systemd/v22 \
>> +=20
>> github.com/decred/dcrd/dcrec/secp256k1/v4:github.com/decred/dcrd/dcrec=
/secp256k1/v4//dcrec/secp256k1=20
>> \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/fatih/structs:github.com/fatih/structs \
>> + github.com/gdamore/encoding:github.com/gdamore/encoding \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/gogo/protobuf:github.com/gogo/protobuf \
>> + github.com/golang/protobuf:github.com/golang/protobuf \
>> + github.com/hashicorp/errwrap:github.com/hashicorp/errwrap \
>> +=20
>> github.com/hashicorp/go-multierror:github.com/hashicorp/go-multierror =
\
>> + github.com/klauspost/cpuid/v2:github.com/klauspost/cpuid/v2 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/kr/text:github.com/kr/text \
>> + github.com/lestrrat-go/backoff/v2:github.com/lestrrat-go/backoff/v2 =
\
>> + github.com/lestrrat-go/blackmagic:github.com/lestrrat-go/blackmagic =
\
>> + github.com/lestrrat-go/httpcc:github.com/lestrrat-go/httpcc \
>> + github.com/lestrrat-go/iter:github.com/lestrrat-go/iter \
>> + github.com/lestrrat-go/jwx:github.com/lestrrat-go/jwx \
>> + github.com/lestrrat-go/option:github.com/lestrrat-go/option \
>> +=20
>> github.com/lucasb-eyer/go-colorful:github.com/lucasb-eyer/go-colorful =
\
>> + github.com/lufia/plan9stats:github.com/lufia/plan9stats \
>> + github.com/mattn/go-colorable:github.com/mattn/go-colorable \
>> + github.com/mattn/go-runewidth:github.com/mattn/go-runewidth \
>> +=20
>> github.com/matttproud/golang_protobuf_extensions:github.com/matttproud=
/golang_protobuf_extensions=20
>> \
>> + github.com/modern-go/concurrent:github.com/modern-go/concurrent \
>> + github.com/modern-go/reflect2:github.com/modern-go/reflect2 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/muesli/ansi:github.com/muesli/ansi \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/muesli/reflow:github.com/muesli/reflow \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/muesli/termenv:github.com/muesli/termenv \
>> + github.com/niemeyer/pretty:github.com/niemeyer/pretty \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/philhofer/fwd:github.com/philhofer/fwd \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/pkg/errors:github.com/pkg/errors \
>> + github.com/power-devops/perfstat:github.com/power-devops/perfstat \
>> +=20
>> github.com/prometheus/client_model:github.com/prometheus/client_model =
\
>> + github.com/prometheus/common:github.com/prometheus/common \
>> + github.com/prometheus/procfs:github.com/prometheus/procfs \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/rivo/uniseg:github.com/rivo/uniseg \
>> + github.com/sirupsen/logrus:github.com/sirupsen/logrus \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/tidwall/match:github.com/tidwall/match \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.c=
om/tidwall/pretty:github.com/tidwall/pretty \
>> + github.com/tklauser/go-sysconf:github.com/tklauser/go-sysconf \
>> + github.com/tklauser/numcpus:github.com/tklauser/numcpus \
>> + github.com/yusufpapurcu/wmi:github.com/yusufpapurcu/wmi \
>> + go.etcd.io/etcd/api/v3:github.com/etcd-io/etcd/api/v3//api \
>> +=20
>> go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/api/v3//client/p=
kg=20
>> \
>> + go.etcd.io/etcd/client/v3:github.com/etcd-io/etcd/api/v3//client/v3 =
\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go.uber.=
org/atomic:go.uber.org/atomic \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go.uber.=
org/multierr:go.uber.org/multierr \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go.uber.=
org/zap:go.uber.org/zap \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 golang.o=
rg/x/sync:go.googlesource.com/sync \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 golang.o=
rg/x/sys:go.googlesource.com/sys \
>> + google.golang.org/genproto:google.golang.org/genproto/ \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 google.g=
olang.org/grpc:google.golang.org/grpc \
>> + google.golang.org/protobuf:google.golang.org/protobuf \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gopkg.in=
/ini.v1:gopkg.in/ini.v1"
>> +=C2=A0=C2=A0=C2=A0 for s in $sites; do
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 site_dest=3D$(echo $s | cu=
t -d: -f1)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 site_source=3D$(echo $s | =
cut -d: -f2)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p vendor.copy/$site=
_dest
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ -n "$(ls -A vendor.copy/=
$site_dest/*.go 2> /dev/null)" ]=20
>> && { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy=20
>> skipped (files present)" ; true ; } || { echo "[INFO] $site_dest:=20
>> copying .go files" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/=
'=20
>> vendor.fetch/$site_source/ vendor.copy/$site_dest ; }
>> +=C2=A0=C2=A0=C2=A0 done
>> +
>> +=C2=A0=C2=A0=C2=A0 ln -sf vendor.copy vendor
>> +=C2=A0=C2=A0=C2=A0 # these are bad symlinks, go validates them and br=
eaks the build=20
>> if they are present
>> +=C2=A0=C2=A0=C2=A0 rm -f vendor/go.etcd.io/etcd/client/v3/example_*
>> +
>> +=C2=A0=C2=A0=C2=A0 cp ${WORKDIR}/modules.txt vendor/
>> +
>> +=C2=A0=C2=A0=C2=A0 ${GO} build
>> +}
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${sbindir}
>> +=C2=A0=C2=A0=C2=A0 install ${S}/src/${GO_IMPORT}/mc ${D}/${sbindir}/m=
c
>> +}
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#97537):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/97537
>> Mute This Topic: https://lists.openembedded.org/mt/91825499/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

