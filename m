Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745AEC4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 15:13:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.106767.1671030801266939630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Dec 2022 07:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=H4s4mrSr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9347774aae=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BEDQR6G012222
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 15:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=MsI2F+LOKRfpG0YAClVva/4cNi70o8a+SWJcP2b022Y=;
 b=H4s4mrSr+g6uUvQfFm6RdLJAhPi9njG4x0S5xexOvf9BTBuXALC18EuuQ3sZHuYy+Ll9
 EyCxPI5mGy1hdQzA+ZzQT/q6Gl/aB+HKrRp9egAkd+4LJ6cqqLMQDpg9ftZK0TzQ43gs
 Wv69J7gJmiYxmW6AeQ7uAD6jF3ROY2wDCpQmQwb5mxxJyRF95Y269wO6JKhPT3ggCTaj
 cKPNO/s3MbeNXIaujLYvc6sBQ1NejB4RKGf3+OZb915M8UbGbs/n0sv7XS0FuOKpnX/m
 p58bjmlCUyVeIEk51ah3Vjods4LyryDudVCZy+3MHtDnwQRLZAyzVGNs9RqWUYBPeE13 Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3meyg5gp9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 15:13:20 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BEFDJQh005718
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 15:13:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3meyg5gp9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 15:13:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXpQfRWpOHkBxId2NmjbP78EeoTT+u5NmUh85koVWxrYR89rj6R+Up+u6KL7jCHnVa6UecrctZp+upVlvPZxU6UN6Av3yRCEtEqp5qh+T4UK7h37eihCmTY8696dFGme6JbOSG4UkFEop6WgbBmgWNuVM0c1Yj7CNO1MQMoEPNIu5UoCgVZDeJR8bob7+ZMt+0m2TRszgvLe1WukD1wcSO3IksSpvhlPQEXk/U87f8jNMVEePVj9AHONwtRfLguwptEUjoCcF8s/FXVwp3kcJRIXLYc3TtRA7LluXvFadxkkfvgdebelODwKyNyXSfNM2vMk3/ZhdzSFdNS6MvsPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsI2F+LOKRfpG0YAClVva/4cNi70o8a+SWJcP2b022Y=;
 b=jE8xmC7Y0rgBxBO3wtZfFU72vU020gBNQw5jB0BqtBgFAkTQ8F9dDnMF9HjvHfqcZKvYwN4JTk8n2sKaMMvghhIl6imS2gRfCuqxLaWxh5Olj+Db7MeQ3RV1MaJrQ1JevdU5ujwATWmXJfuG0TqYpl3svnHqfPWqnlNNnaM9YHpyjPkpDE6rnihin3cfilLWDIVwPoHN1nvmvCbPE89BFnCHArsTFCf6+21aek+/Eb1iLg36247l4C0AaV1pbuj1/8rxUtn/KvIuqVqKrjIfdMr4ahvRO46Uu8vg33PlIy/8bXhw+h96uuYCcmNST7DOqjj7xeXRZMJGUR77PtccKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 15:13:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 15:13:18 +0000
Message-ID: <7fe1041e-da5f-5537-1fef-fb66e1fdce82@windriver.com>
Date: Wed, 14 Dec 2022 10:13:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs - Upgrade to 16.18.1
Content-Language: en-CA
To: Armin Kuster <akuster808@gmail.com>
Cc: "Polampalli, Archana" <archana.polampalli@windriver.com>,
        openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com,
        Martin Jansa <martin.jansa@gmail.com>
References: <20221118182718.2548901-1-archana.polampalli@windriver.com>
 <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com>
 <f0a3b575-dfc2-829f-6100-9e1eaedf0be5@windriver.com>
 <CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com>
 <1730143E7B362879.23954@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1730143E7B362879.23954@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f3d6aa-aeeb-4e4a-f0d1-08dadde5bae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j5KaRitEOecqCZNsJx2TumtQzcRpeh1uNcGKI5UgHTYSk5240ttrHHNg+tRhO9IF3jXkx8DjlNVK4Bdg3GkCFyRU6aiH1b7xk3Vkidl34ZHxCVzhLLkLLFeEFUMd6/ftCwjj8CxhdjSFU2VKlpmi9LCyd4O+t5adCssBZ2zzQamnTcAkVilsE8qwLMVxrIWiDlvAYPeWJBLvZDCMoKyFdCCRkhVfZTWUjcruFNRs3+OlX5TEFkfAS4Exa75pAMo9KEtNJKzMoLT+oUDvTIqavME8T/SOTQ4vJ1pnZJZ3cYDT8Tw2d7u9eoT4QfRR1dEy888N3f33ljNi3HlmRHcRzKaKZGJZ117rZmmycnSz0EVt79qzpEzabVe899JVIK2XitnC87y3w/angMBN7w0/Y9iJ13R8tv0/gLUI7lPBcESyAbsLjisE7HCVXV4rTgj4QwPAhE1DZQgqTC50iQbVXAceXpKiDNFh3JAPvBbX+A/TB80nBQyqriiw4WZluEt1xTwQ3Xy7KJcTOw2zIOXkHHTVJI7KB+gXRmAmFgc+Av6DPWIbDVCyzzGE3dqhF6MH0ayLk+k1km8UmUnsIfZ5gDJHPXexIq30bB2DgkRENEusmq/hy4cx471kDbKimj7eePX6IvPu4JPUyP5d3QfsHLiibEmNkidaCGFn3a25U2u7GxyZxwKcOtBOz+vA98UMmF8SvZrbSvtjKY73PKrwfUerUqBRiGssztI33zmOruZwFLX8ZPDV9zFZIDmCYqjAjxuaeHdxkKmAI8O0j5usITI6NRYlCuXtFuPm5UaA/Z8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39850400004)(376002)(366004)(451199015)(66899015)(4001150100001)(8676002)(31686004)(966005)(53546011)(38100700002)(36756003)(66946007)(5660300002)(66476007)(66556008)(4326008)(6916009)(54906003)(86362001)(8936002)(316002)(41300700001)(26005)(6506007)(6666004)(2906002)(478600001)(186003)(31696002)(6512007)(6486002)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGJmQVJKU1lUMzBjeFRhWEF6Sk5KQ3VCOEN1RTg2dEkzTnF1eW5YN0FBSnYv?=
 =?utf-8?B?aC8rb0V1dnpJdFQ5d1BlUktycmFBU1cxRlAybm5nN2pkVHRqUG9GUHJuOWJL?=
 =?utf-8?B?RUNzUE03QTg5TktxejEzQlRzM0R2UGU0U24vMTlucUo1NWxMbGM4QkxFMEZG?=
 =?utf-8?B?OGdvdllNNWpqTW9YSG5Cdkk2MzF0SkVIN2l1R3NCSDB1WkxsY1JQMmI5Sk1Y?=
 =?utf-8?B?ODlNVXAzanpUMU5Ea1ZVcU14THBkQzRFQlBHTjczNmlablVuM1RJY1RiYkZR?=
 =?utf-8?B?Qm8wbVIybWFWcWcydmlGTWtmSm1VbnVkOE9WVmdhalJETytPcDVLRTkrSVpk?=
 =?utf-8?B?K3Uva2NJZHZxQXEya2RHY0FmWWZEKzFPZ1ByUDNUY0UyaVVzNmxXc3lFS2hr?=
 =?utf-8?B?V2p0V25sQWlZYVo5OSs5SUwzREd0d0pldVZPLzkrWm12WXY0Uk5ncTRycjZu?=
 =?utf-8?B?NTJ1aUJVZ3A1SzNVK0IvcklqdXlSMUdQNVo4VnlLWUd1Tzl5OGNNekxDZnFs?=
 =?utf-8?B?d3k4NEIyUkR6d25MNm92YldvUzEwalc2U0NlOXZ3QjFzVFFRWGNkMzhMZGFR?=
 =?utf-8?B?UUtQUUgzd0I3TDRpSElSV0dKR0NwaTIrMmRpSnJMQTNRalE1eTVOSWhzcHlH?=
 =?utf-8?B?YkR2R1ZPYUd1dTJaWWNPeVA2akdTckM0NDhEZlJoOEx2ZlQwUmRyMVNPeFBm?=
 =?utf-8?B?dXVMcFAxT1UzcXI5SkpmNXZtRUxxeko1SzhTdHA5ZjVraGJTSEFldlltNkta?=
 =?utf-8?B?aW5YZlVZeUVIRDRmYm1uYzVLMHlVckN4MTB1dEszaGN3YXd4ajYraDBHMHZ1?=
 =?utf-8?B?ZlBqQ0RoenlWKzgxT3NwWmVDZzdPYWdUYlFJZHo3WTRpc0d3akkxbTl1MVA1?=
 =?utf-8?B?TlRQQnZjclNRMlFrWEZMb0pCZDVvclJZSkJ5aHZzQnMwNGcwMTBVbE4zUFV2?=
 =?utf-8?B?a1ZkNU9uOFBBdEQrOXNpV21ML0RncFRESXN2UGZxczA3TEY1SXVBUkZjYS94?=
 =?utf-8?B?TjR5NUZWVWM0MFZ2VzNSelF1UHM4QzlVNEdhblBhMnc5RU4vZTFyRXlFRDdT?=
 =?utf-8?B?MkRHU2VueVJNN2ViejMrS3ZGVGF3VjA3TFphNElTSW9NNFJoNko4RkRjeCty?=
 =?utf-8?B?eHJpK05Za0Q2a0h2L1RrSUtxb3JBV3NNLzhRSllJbit5WUcwVlM3VjJmUjQ0?=
 =?utf-8?B?QVpBd3VBQ2ZWc2FZMWo5Q2hnRzYxd3dPUjMwVW1nTGNQWlQrTXY2UmhzWndK?=
 =?utf-8?B?MENpT3FtWHFhUmdEcE1RcUVWaGp5SThCZ0tRM1BsNlEwZHJMbGNvOWY0OXUv?=
 =?utf-8?B?NUI2RWQxak9CTW9pTzY3TGVDS0ZjWU56dWtHSWFGWW92ZmdRWVBoU3BUWHNk?=
 =?utf-8?B?WHZ0OHgyRVVXbXMyOGhHbjcweXJyRG5iZDV3Nms0amxYR3h4T3R5bHFRSTFr?=
 =?utf-8?B?b2QzbXF5MnFJN1ZJNCtjMlo2RTh5VnYwbFRqY1Z6d0VYMGYxemZlTk04OXNk?=
 =?utf-8?B?MWpxTzJQU01uWk9keDl3T2lDRmd4cXFJczVwZDQ1TWJ1dVdzcERwSG5VemFx?=
 =?utf-8?B?M0MycGQ3OFJSYXFLN3BCcFJoeGVkRGRMajVlNU02VUlPV2cvNlJ3RTdVQVRB?=
 =?utf-8?B?K29ZQzAwOUFDMmgxdmY2RWZQMmpNdWU2a1Q5TStacGNJT0Zva1RzcFlIY3VD?=
 =?utf-8?B?cHRoUk9jMG5iTVRyVVJ6SHVGRWdhbUhrMlg4cHpTYmxMN0o0NHVBYlkwS0hs?=
 =?utf-8?B?dkFzdG5mTFBDTEhJWUVoazFqZklXUWhSYS9abGNsMUdQZVFWY0k2bklIemJh?=
 =?utf-8?B?a3QzSkpQVGdLQ29hRnY5L3dPNnUvYTJTNU05eGdCS2kzT2tWOWhqcWVBbGJC?=
 =?utf-8?B?YXFDVlBvbmJoVTdmbWZxWUx6d1lvRi9TaERRcm40dlgwZHVuTFVCOEkrSGNR?=
 =?utf-8?B?bzdpQ0NsVUc2VEs4U25QNVMzS2lKVk5nRzN0Z1p2bEYyUFNKdVNVYUxCTzNn?=
 =?utf-8?B?ZmplcnZhWG9VMllRTXZiVk5PSmJvRVpMc0FCQ05yalFoZEUxbGZKWkVDdTly?=
 =?utf-8?B?M1lxcmZWVldRczVLc2drZnNOblhDU2d4R2hGMTZDb3NkUm5OVkNJeDNNZy82?=
 =?utf-8?B?VGtYaVJPTDZPNnJlQmpQd2JkQ09LMjhlUXQvbU5OZnlXaGtwTk8zRU9iSFJL?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f3d6aa-aeeb-4e4a-f0d1-08dadde5bae7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 15:13:18.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U57/MtyWu73L33miBzTqQLRjMl0G638v4JoK53BQCutjCVf3mPR24q2gD6HUjEEjb3GVgmeZpX7qH69SdjXxLxM9n4hMnwGQDdgKqH6UHhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
X-Proofpoint-ORIG-GUID: FLebjF0q8zX15l9028s9Y7tJUNkbxo8B
X-Proofpoint-GUID: sjZbRbQJz-q2weOcmtxszah9Gt1z32S_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_06,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212140120
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BEDQR6G012222
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 15:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100079

On 2022-12-12 10:08, Randy MacLeod via lists.openembedded.org wrote:
> On 2022-11-24 14:18, Martin Jansa wrote:
>> On Thu, Nov 24, 2022 at 7:06 PM Randy MacLeod=20
>> <randy.macleod@windriver.com> wrote:
>>
>>     Add Armin to ensure he seems this once he recovers from US
>>     Thanksgiving indulgences.
>>
>>     On 2022-11-24 12:05, Martin Jansa wrote:
>>>     I see this is now queued in kirkstone-next
>>>     https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkst=
one-next&id=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f <https://git.opene=
mbedded.org/meta-openembedded/commit/?h=3Dkirkstone-next&id=3D08b6b6846a8=
4d9a0459f42d1d730c9ea1d50c43f>
>>>
>>>     I see bunch of recipes failing since this upgrade landed in
>>>     master, mostly due to npm dependency resolution being more strict
>>>     now and builds failing with
>>>
>>>     npm ERR! code ERESOLVE
>>>     npm ERR! ERESOLVE could not resolve
>>>     ...
>>>     npm ERR! Fix the upstream dependency conflict, or retry
>>>     npm ERR! this command with --force, or --legacy-peer-deps
>>>     npm ERR! to accept an incorrect (and potentially broken)
>>>     dependency resolution.
>>>
>>>     Can we please delay backporting to kirkstone and langdale a bit m=
ore?
>>
>>     Seconded!
>>
>>     What recipes encounters this bug?
>>
>>
>> I've seen it in ~10 recipes, but all are internal and not available in=
=20
>> any public layer. I've added --force to them as work around to see how=
=20
>> many other recipes will start failing now.
>>
>> There is one more failing from public layer:
>> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recip=
es-webos/localization-tool/localization-tool-native.bb <https://github.co=
m/webosose/meta-webosose/blob/master/meta-webos/recipes-webos/localizatio=
n-tool/localization-tool-native.bb>
>> but that's different issue, caused by the=C2=A0sysroot_stage_all:appen=
d()=20
>> and new nodejs now installing=C2=A0node_gyp_bins with symlink to pytho=
n3=20
>> causing:
>>
>> ERROR: localization-tool-native-1.7.0-r7 do_populate_sysroot: sstate=20
>> found an absolute path symlink=20
>> /OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/sysroot-destdi=
r/OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/recipe-sysroot-n=
ative/opt/js-loctool/node_modules/node-expat/build/node_gyp_bins/python3 =
pointing at /OE/hosttools/python3. Please replace this with a relative li=
nk.
>>
>> But I haven't narrowed it down yet to see which exact nodejs/npm=20
>> change caused this. And yes this recipe has other issues as well and=20
>> doesn't even use npm.bbclass nor npmsw:// fetcher.
>>
>>>
>>>     And if others are seeing similar failures please share them here
>>>     as well.
>>>
>>>     The older nodejs was using npm@8.5.0, now its npm@8.19.2 more
>>>     details about this change in behavior from 8.6.0 in
>>>     https://github.com/npm/cli/issues/4998
>>>     <https://github.com/npm/cli/issues/4998>
>>
>>
>>     Someone in the linked issue thread said:
>>
>>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "We rolled back to Node v16.1=
5.0, which has a working
>>     version of npm 8.5.5."
>>
>>     Should we drop the 16.18.x update and stick with 16.15.1 for
>>     kirkstone/langdale?
>>
>>
>> I don't mind keeping it in master, once I figure out how to fix it in=20
>> master I wouldn't mind it getting backported to kirkstone and langdale=
=20
>> as well.
>>
>> This was just warning that this isn't just simple minor upgrade for=20
>> some and at least some longer delay would be useful.
>>
>>
>>     For master, I'd like to update to 18, 19, or ideally 20 if it's
>>     available before the end of M3.
>>
>>     Martin,
>>
>>     What version of node make sense to you for master?
>>
>>
>> I don't have strong opinion, we have a lot of ugly npm/nodejs recipes=20
>> in webOS which need to be re-worked first, independently on nodejs=20
>> version used.
>>
>>     Do you agree that we should leave master on 16.18.x and people
>>     should fix their
>>     'broken' npm dependencies?
>>
>>
>> Yes, from that npm bug it looks, that the old behavior was even worse=20
>> than the current clear failure and the --force as work around seems to=
=20
>> work reasonably well, so I don't mind keeping it in master and even=20
>> eventually backporting it to kirkstone a bit later.
>=20
>=20
> How about 2 weeks later?
>=20
> We need to either backport a patch or update to 16.18.1 to fix=20
> CVE-2022-35255
>=20
> $ git log --oneline -1 a54283a6387
> a54283a638 crypto: fix weak randomness in WebCrypto keygen
>=20
> $ git branch -a --contains a54283a6387
> * v16.x
>  =C2=A0 remotes/origin/backport-avoid-prototype-pollution
>  =C2=A0 remotes/origin/v16.19.0-proposal
>  =C2=A0 remotes/origin/v16.x
>  =C2=A0 remotes/origin/v16.x-staging
>=20
> $ git tag --contains a54283a6387
> v16.17.1
> v16.18.0
> v16.18.1
>=20
>=20
> My vote is to upgrade since people have had some time to fix their=20
> dependencies.

No objections so that's good.

Armin,
The update is in kirkstone-next, will it land in kirkstone and langdale=20
soon?

Sorry to nag the npm thing threw us off our usual workflow.

../Randy


>=20
> ../Randy
>=20
>=20
>>
>> Cheers,
>=20
>=20
> --=20
> # Randy MacLeod
> # Wind River Linux
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100061): https://lists.openembedded.org/g/openembed=
ded-devel/message/100061
> Mute This Topic: https://lists.openembedded.org/mt/95118333/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
# Randy MacLeod
# Wind River Linux


