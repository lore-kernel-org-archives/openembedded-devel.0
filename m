Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F8FC433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 18:06:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30363.1669313204184391474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 10:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=kHB6fifO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83271011fd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AOGjhNm017641
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 18:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=YnGPm20+k6xvwQpVEt7Nv3iGQslE3OjYpaAhbCHao6U=;
 b=kHB6fifO6vTsrqTUyN0kmLs1JXTeW89AKuwE05TFe4aXghfXDUgLaZmxKF6Xi199+MbF
 AeyCDNIsMEB9hOFJMFrE/1UyoTMbFXvu54sraerjkgNsRId/uEeyFGr6pKxc4nagI3fO
 EOZy5hOPdEzeHL2hp8t9jIr620EcbqEuMAzPG5w8t48Dj6AlPHUfme04IrRzVKcVnzhF
 N/rt+iKhrpxfS5yue5xICs5jMdSC/dHFjyJRYK/lgzF9X0iCI+FCcxiPbP8M8IDJmhqN
 5adCme40/2OXkkrRWtkmySlyE+EX3TYrex5Kj+wuLBc104ToIZiheRruQWJNBpT9jInR jA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48me6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 18:06:42 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AOI6gnO030837
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 18:06:42 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48me6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 18:06:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNxbqZllR0UleiWMYKTgodg8Sn+6j46IWsPUEmqwpPBoIbjWip53agkhuDxCCoriZJKP53RSby2BTIxpendV/BD5JI8IOdHt8eKof2oLksG0LzhQNSq4QIOf2/r+7kvKmyq50cB0E8C++zgYaUY9O/mMKbZb+CdyPT1gd38DNStQOD/4FAaGIznJlQMXjhER5NRzLXfd90krz5VrYA9UWn8rD0lVUrKu7gvaSyhrBeS3T6kmws3ydWsCUwne7pXwqByv+h/hZ+nswwj43npJaK98u4UKnh9qfphUvdYebX26pNBqs7iu7mm8kIgQNBdnWTE3LsAmnguTxzABpadOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnGPm20+k6xvwQpVEt7Nv3iGQslE3OjYpaAhbCHao6U=;
 b=EGsiIMZ3iF8HsoNDGKiZFWKroJdka0UGhxT2gaDNfUNBqC98/RkNUl9Vfuiowfi4AsQaNOUqVXB9eMFwnu1iuo0ahCFZzLqo6Zsxj1SDWONkjpaJ93ia/G1i4B4Jv9gAdYm9pjAJZ2dI4bxyyE5eIXbC7YjSLBW7I3WKA1XHW7O+l0YIVej0PbxQBjGX40ZXNXKYBBcMNaQSD4W4wQ1il2huDn4yaCNOBUWrJbkmCo8HxN71x0OrnqSL0rLe9DbEvvxhVt1HTUWdpslfBZMaBzOgXmVX/N52H/o9XD9olD8pOlecKr5T/A+uqDD9zSlAt086jjZtwYk9wtKsGRoWgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 18:06:37 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 18:06:37 +0000
Content-Type: multipart/alternative;
 boundary="------------P3mszWZdo4rl3fCtdHLtKIZY"
Message-ID: <f0a3b575-dfc2-829f-6100-9e1eaedf0be5@windriver.com>
Date: Thu, 24 Nov 2022 13:06:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs - Upgrade to 16.18.1
Content-Language: en-CA
To: Martin Jansa <martin.jansa@gmail.com>,
        "Polampalli, Archana" <archana.polampalli@windriver.com>,
        Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com
References: <20221118182718.2548901-1-archana.polampalli@windriver.com>
 <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com>
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS0PR11MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: dabe6fc2-0627-4748-8843-08dace46a0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jxxFF/9U/9yaYmUTDzLyVA/pZms8KZPGUeokcoxyvAHDN50d9Ce3jB/tIsiATtT8ZHsTas5GtqYsLgszjKTf6VIguKT6YYSPma1UWQTOvA86xtaAL5ycwR14nWAoGnHe61fALbIg7al4nJRqooHusrNXk9LQz+BDMJ4PgV2rVN12HojQgR5Lc6fRCOTeDjx9qsaC9kposJGIU79m+Q70qU2c18VzYG82XzAazjbXr9ujyAgRL0LN6JTK7rsmcNZd/e1eRO2h5USGM2AMQVU73v5ICiIhGWS9aUngByB/WUCRhJ0m+hgk5D8JJlmOSWrXiD8OBpgiJO7CtMblOLslvJoFoeQPUAbL3+MMIG/QOV65mxz0aGPZfjY9nU5tDoR+MrVd+fm6+e2wGAiKpZrAFAHQHUJZWx/ZDqB3tlbaffRF/+XNwpeWRddJx990Cm7xFkDFwgo2Rl9NbUz6XapMAxc7TyAaXXBNEfY0K7Jq8vCsJg8ZM/5fGdgtGXY5g8kBcDwUrBSNrnRh4nObGmotqZRCFQTWKS9J9X2idWx9gyUdKcDTq+0xNvqkKX0q39aCFlaNBBs2qqJeM3PV0Io/hUMx3Xost4DVEP3G+BR9fXIeSgV5U+tprSHjedPN0lzND8yW09a+Ow7mvNbnXPAOsOQx8CBPCunxCTjsnvrtN5YOK/+6ICvaCJHZVBYtj6B5jhyp0p1yM1nVsp3Thlzj3tfcd2raWR7hksJWha0/nraH7pbFOAIZxj/YSEhloBm6se/DaSXtZ7noSIcJvmIFCEGFtfmQQpSSDNEqRKCFH8bm7CQppGDKle19cGq2LJMwdRdf+hz6GohBKPsSxzmKhiMo7xsHD9Lh9uBWn8Wu+RQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(451199015)(186003)(83380400001)(66574015)(6506007)(966005)(6486002)(19627235002)(110136005)(53546011)(6512007)(36756003)(33964004)(26005)(6666004)(107886003)(166002)(478600001)(16799955002)(2616005)(31696002)(30864003)(38100700002)(66899015)(5660300002)(4001150100001)(8936002)(31686004)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(41300700001)(86362001)(4326008)(43740500002)(45980500001)(559001)(579004)(460985005)(19607625013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NnFzeFJwMTBTdjVEdUE5M29HMEdJRmJUV1BzKzBVVnFDbVJwSHVFZTg1NmxE?=
 =?utf-8?B?NGhtUVV1TXpubmVxTzRwZUJ4YjZTSXQ5cG5laS9PMUEzaW5MWUhoT2FSTzQz?=
 =?utf-8?B?Rm40bHRvNjNzNkk0TjQvVHZLSTdtYnlnRHhXQ3VPUXAwMVp5azhJdytEelg3?=
 =?utf-8?B?bFUrbWFEeXdMbTBBelp3eXFPWXBMUW9sd3NYME1va0luNjhYaE9ad21XWlpR?=
 =?utf-8?B?SGNTOUtaTkxKOG5BMHZ4Q2YxSjIxZlVmVzFEUmxkSllaUngwcnlveUNKMXlC?=
 =?utf-8?B?UXFvRzlsSTNrVllwbTdIaHNqbHgxNHQzcXdyaVVIb3pGblI2Q0Y5c0t4aDY2?=
 =?utf-8?B?V2swdlZWbjdLVUI5OXVtc1BDNk1XRUw1cUQzNWw1ZlAyYkMvZS9RbE9Va2gz?=
 =?utf-8?B?Q3EvdUpZbHJJYmlLZDNBZnlOZWRMdjBna1cva0FnUGlScmtVQk54dzJMN25m?=
 =?utf-8?B?MWZaS2pPcGZXMjdZbm9aRTJGUFRZMEhQWEFaeThCUW5KWGV5VjJETzV0WTFr?=
 =?utf-8?B?cFNucWFXY3ZQL2p4ZUVmTXVYWTRRaURBSGY1azZkcEJJWWxpdzU0K1NqQzY4?=
 =?utf-8?B?TzFHWVNWMmpYN3pzMzlHSGd4UUE5QlpucWlLNlc2MTMyTGUwNVlTMHF2SndV?=
 =?utf-8?B?SzQ1NVl4RXB4dHA0OTNDdVpuTE5iY290cTM2NzlVdzhaenpNQzh3aEhReVlx?=
 =?utf-8?B?SkpmaytISXZOaUpVZXFyanA4NDlQUmZZSmFBT29TSzA5Z0ZoRGtacmRoV0hM?=
 =?utf-8?B?Tm9IVTRKbUpUTUVNT083cnFURlRibnVyUWdJcUdSQWhFRGFBamh4Q0pRMk8r?=
 =?utf-8?B?YWRxZmh1ajhYdCtZN3dwbE50K0NpSkpGUVlkK1dpbmR5b0dtMGR6b0tGc04w?=
 =?utf-8?B?ejRUbVVVRXp3RUxjMnpmNWJvbjRNdGlvOEJnUS85NlhrTFp1TkRiZjF4akdZ?=
 =?utf-8?B?aVdwc0RFeDVJT3F6SjIvdC94eG1nWFJPWStPSG8rVldrVHNnY2JucjZuVTdH?=
 =?utf-8?B?Nkt3RFpvV2VNaC9xMGsrS3hTTkhyOXk3MFpxOERzVlQ3T3krdXdWalZ6Q3Vo?=
 =?utf-8?B?SllsVS9oMWpQUG5CVTloR1lXSTZZdXpyTlU1ZnhReFRPaHcwRlQwaWJQSUJj?=
 =?utf-8?B?aEtZQ3NxaEpXSG5MTy9RTXZZRVpzd1MrTXhoa1RaL3hqbzJJWW9Td0lYUmRa?=
 =?utf-8?B?SFp1ZjlMZTZnOHo2TUM2MllPbUxVNlQrUXBZdFlxNDNKUU4wdnhZaG5IanJq?=
 =?utf-8?B?NVNPQ1RsQTV3K1hnU0kxNGhHWUFYNDNxTzFaeUJpVHIrcjBtdlRIRG5wYjcv?=
 =?utf-8?B?RFQ2RHNMeDZkT0EzK1pEYUx1Qml6RlJvL3V5UnNlS1MxSDVBV0lqVlRQUnlK?=
 =?utf-8?B?dk5FTkhxdnVia1FnaG9pbktQU2xicmxnZmh2a001VzlRVHNLNE5nWHRHWm9N?=
 =?utf-8?B?clJuWTk0S2lNRWxKWkhReUk1MmdRUFdMNlVLT1J0eUppTkk2ODErYzg2WTk3?=
 =?utf-8?B?T2locHpDcEpHU1JvOHRPZnI0UzErK1pjZURFZDJzSnlCY3BkK294NjUyNjRy?=
 =?utf-8?B?WEJCV3hyYno3eUpOaGFYNkg2Mkl0YnJXb05FQjNjSHVKbnVKQmRiV3hyRWFp?=
 =?utf-8?B?NHFDaFpHRjl3ZndBejJHM1FEbXd6b1FyNU92Y3BiajNBMHljRE1UeXdwRENh?=
 =?utf-8?B?OUtzTm9HQ1VQLzZiZDdQQzZkaDI1Y096RGhmRFRaQTRsbjFGTHBPeHIrSWsw?=
 =?utf-8?B?RmFlS3lpTGI1Rjd6NDBTVEs5RWI4UXdqNXExYVpCZENwZENrVG1UVm1XU2FK?=
 =?utf-8?B?V01ZTUFidnI1VzBUWVA1aFcwRGFObEFNQTlHMGdodi9TQk91NnBwcWw4dnhv?=
 =?utf-8?B?WVdSU0h4RTlCK1VCdWlqUnJ2aVZ0MWo1L3I3cy9qTHAveXFDWFRtdnJPMmta?=
 =?utf-8?B?YmRUaWR0S1FxczdXZjU1UUcxTmV4Z29YdkhtVEFWYk5GN2JyU2ZFdVhrT1hx?=
 =?utf-8?B?aHpiSjd3d3pmLzZ2TmhGa2FJb2ZCcGVlNXdGbDlLNHJoMkpCYU9YSjQxY3RQ?=
 =?utf-8?B?T3JONGo1dDNFS0p2YTZobTIyazhuaTZ5c3MvOWZBaVFzT0JXQ05SQjhiaVEy?=
 =?utf-8?B?SEVyUUMwNUo4cE01azRpUTVFM0IvQ0QyZ21ib0xNbWhDNnpyV0tJd3dib1l6?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabe6fc2-0627-4748-8843-08dace46a0e3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 18:06:37.4894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZVM8C8o8B7wOkCJa7/aXNbOAj/yeK+vAPUhrjhMfuaYvjjljkg/laO7WEEOxXkTO7/YoJzCXCaIeAbEpayPU3cDP0KN3hPqZnjkeBkQbIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
X-Proofpoint-GUID: eJsGv6cpBNeFK7LS4z3ak7pW_lgJ_EOx
X-Proofpoint-ORIG-GUID: TgV9Hnc1QQAHAGLqQOiSH3jzzQILhmzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_11,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240135
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 18:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99721

--------------P3mszWZdo4rl3fCtdHLtKIZY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2AOGjhNm017641

Add Armin to ensure he seems this once he recovers from US Thanksgiving=20
indulgences.

On 2022-11-24 12:05, Martin Jansa wrote:
> I see this is now queued in kirkstone-next
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-ne=
xt&id=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f=20
> <https://urldefense.com/v3/__https://git.openembedded.org/meta-openembe=
dded/commit/?h=3Dkirkstone-next&id=3D08b6b6846a84d9a0459f42d1d730c9ea1d50=
c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-F=
PfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyDWE$>
>
> I see bunch of recipes failing since this upgrade landed in master,=20
> mostly due to npm dependency resolution being more strict now and=20
> builds failing with
>
> npm ERR! code ERESOLVE
> npm ERR! ERESOLVE could not resolve
> ...
> npm ERR! Fix the upstream dependency conflict, or retry
> npm ERR! this command with --force, or --legacy-peer-deps
> npm ERR! to accept an incorrect (and potentially broken) dependency=20
> resolution.
>
> Can we please delay backporting to kirkstone and langdale a bit more?

Seconded!

What recipes encounters this bug?

>
> And if others are seeing similar failures please share them here as wel=
l.
>
> The older nodejs was using npm@8.5.0, now its npm@8.19.2 more details=20
> about this change in behavior from 8.6.0 in=20
> https://github.com/npm/cli/issues/4998=20
> <https://urldefense.com/v3/__https://github.com/npm/cli/issues/4998__;!=
!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCx=
Bstk-GtvN-eKnWtaUipHYjAMZmTsAyk$>


Someone in the linked issue thread said:

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "We rolled back to Node v16.15.0, w=
hich has a working version of=20
npm 8.5.5."

Should we drop the 16.18.x update and stick with 16.15.1 for=20
kirkstone/langdale?


For master, I'd like to update to 18, 19, or ideally 20 if it's=20
available before the end of M3.

Martin,

What version of node make sense to you for master?
Do you agree that we should leave master on 16.18.x and people should=20
fix their
'broken' npm dependencies?

../Randy

>
> Regards,
>
> On Fri, Nov 18, 2022 at 7:27 PM Polampalli, Archana=20
> <archana.polampalli@windriver.com> wrote:
>
>     * Drop Openssl legacy provider patch and install both binaries patc=
h
>     =C2=A0 which are already available in 16.x
>     * Refresh native binaries patch against 16.x base
>
>     Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com=
>
>     ---
>     =C2=A0.../oe-npm-cache=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
0
>     =C2=A0....14.bb
>     <https://urldefense.com/v3/__http://14.bb__;!!AjveYdw8EvQ!bcx80wmig=
op8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYj=
AMucZHoEo$>
>     =3D> nodejs-oe-cache-native_16.18.bb
>     <https://urldefense.com/v3/__http://nodejs-oe-cache-native_16.18.bb=
__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVs=
VaCxBstk-GtvN-eKnWtaUipHYjAM3BdjfLc$>}
>     |=C2=A0 =C2=A00
>     =C2=A0...patch =3D> 0001-Using-native-binaries.patch} |=C2=A0 40 ++=
+--
>     =C2=A0...Install-both-binaries-and-use-libdir.patch |=C2=A0 96 ----=
-------
>     =C2=A0...5-add-openssl-legacy-provider-option.patch | 151
>     ------------------
>     =C2=A0.../{nodejs_16.14.2.bb
>     <https://urldefense.com/v3/__http://nodejs_16.14.2.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMmGjEF2k$>
>     =3D> nodejs_16.18.1.bb
>     <https://urldefense.com/v3/__http://nodejs_16.18.1.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMtRkXgYY$>}
>     |=C2=A0 =C2=A08 +-
>     =C2=A06 files changed, 27 insertions(+), 268 deletions(-)
>     =C2=A0rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14=
 =3D>
>     nodejs-oe-cache-16.18}/oe-npm-cache (100%)
>     =C2=A0rename
>     meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb
>     <https://urldefense.com/v3/__http://nodejs-oe-cache-native_16.14.bb=
__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVs=
VaCxBstk-GtvN-eKnWtaUipHYjAMcMegzi4$>
>     =3D> nodejs-oe-cache-native_16.18.bb
>     <https://urldefense.com/v3/__http://nodejs-oe-cache-native_16.18.bb=
__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVs=
VaCxBstk-GtvN-eKnWtaUipHYjAM3BdjfLc$>}
>     (100%)
>     =C2=A0rename
>     meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.=
patch
>     =3D> 0001-Using-native-binaries.patch} (70%)
>     =C2=A0delete mode 100644
>     meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-a=
nd-use-libdir.patch
>     =C2=A0delete mode 100644
>     meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-prov=
ider-option.patch
>     =C2=A0rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb
>     <https://urldefense.com/v3/__http://nodejs_16.14.2.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMmGjEF2k$>
>     =3D> nodejs_16.18.1.bb
>     <https://urldefense.com/v3/__http://nodejs_16.18.1.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMtRkXgYY$>}
>     (94%)
>
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cach=
e
>     b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cach=
e
>     similarity index 100%
>     rename from
>     meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>     rename to
>     meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>     <https://urldefense.com/v3/__http://nodejs-oe-cache-native_16.14.bb=
__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVs=
VaCxBstk-GtvN-eKnWtaUipHYjAMcMegzi4$>
>     b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb
>     <https://urldefense.com/v3/__http://nodejs-oe-cache-native_16.18.bb=
__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVs=
VaCxBstk-GtvN-eKnWtaUipHYjAM3BdjfLc$>
>     similarity index 100%
>     rename from
>     meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>     <https://urldefense.com/v3/__http://nodejs-oe-cache-native_16.14.bb=
__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVs=
VaCxBstk-GtvN-eKnWtaUipHYjAMcMegzi4$>
>     rename to
>     meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb
>     <https://urldefense.com/v3/__http://nodejs-oe-cache-native_16.18.bb=
__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVs=
VaCxBstk-GtvN-eKnWtaUipHYjAM3BdjfLc$>
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries=
.patch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries=
.patch
>     similarity index 70%
>     rename from
>     meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.p=
atch
>     rename to
>     meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.p=
atch
>     index 8db1f1dd5..445aaf839 100644
>     ---
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries=
.patch
>     +++
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries=
.patch
>     @@ -3,14 +3,17 @@ From: Guillaume Burel
>     <guillaume.burel@stormshield.eu>
>     =C2=A0Date: Fri, 3 Jan 2020 11:25:54 +0100
>     =C2=A0Subject: [PATCH] Using native binaries
>
>     +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.co=
m>
>     =C2=A0---
>     - node.gyp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++--
>     - tools/v8_gypfiles/v8.gyp | 11 ++++-------
>     - 2 files changed, 6 insertions(+), 9 deletions(-)
>     + node.gyp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 ++
>     + tools/v8_gypfiles/v8.gyp | 5 +++++
>     + 2 files changed, 7 insertions(+)
>
>     +diff --git a/node.gyp b/node.gyp
>     +index 24505da7ba..7d41bd52db 100644
>     =C2=A0--- a/node.gyp
>     =C2=A0+++ b/node.gyp
>     -@@ -294,6 +294,7 @@
>     +@@ -319,6 +319,7 @@
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'action_nam=
e': 'run_mkcodecache',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'process_ou=
tputs_as_sources': 1,
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'inputs': [
>     @@ -18,14 +21,16 @@ Subject: [PATCH] Using native binaries
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<(m=
kcodecache_exec)',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'outputs': =
[
>     -@@ -319,6 +320,7 @@
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'action_nam=
e': 'node_mksnapshot',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'process_ou=
tputs_as_sources': 1,
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'inputs': [
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<(PRODUC=
T_DIR)/v8-qemu-wrapper.sh',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'<(n=
ode_mksnapshot_exec)',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'outputs': =
[
>     +@@ -366,6 +367,7 @@
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0'action_name': 'node_mksnapshot',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0'process_outputs_as_sources': 1,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0'inputs': [
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0'<(node_mksnapshot_exec)',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0'outputs': [
>     +diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
>     +index ed042f8829..371b8e02c2 100644
>     =C2=A0--- a/tools/v8_gypfiles/v8.gyp
>     =C2=A0+++ b/tools/v8_gypfiles/v8.gyp
>     =C2=A0@@ -68,6 +68,7 @@
>     @@ -40,11 +45,11 @@ Subject: [PATCH] Using native binaries
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<@(torque_outputs=
_inc)',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'action': [
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<(PRODUCT_DIR)/v8-qemu-wrappe=
r.sh',
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<(PRODUCT_DIR)/v8-qemu=
-wrapper.sh',
>     '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '-o', '<(SHARED_IN=
TERMEDIATE_DIR)/torque-generated',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '-v8-root', '<(V8_=
ROOT)',
>     -@@ -225,6 +227,7 @@
>     +@@ -211,6 +213,7 @@
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'action_name': 'generate_=
bytecode_builtins_list_action',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'inputs': [
>     @@ -52,7 +57,7 @@ Subject: [PATCH] Using native binaries
>     '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generato=
r<(EXECUTABLE_SUFFIX)',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'outputs': [
>     -@@ -415,6 +418,7 @@
>     +@@ -395,6 +398,7 @@
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'inputs': [
>     @@ -60,7 +65,7 @@ Subject: [PATCH] Using native binaries
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '<(mksnapshot_exec=
)',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'outputs': [
>     -@@ -1548,6 +1552,7 @@
>     +@@ -1513,6 +1517,7 @@
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'action_name': 'run_gen-r=
egexp-special-case_action',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'inputs': [
>     @@ -68,3 +73,6 @@ Subject: [PATCH] Using native binaries
>     '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUT=
ABLE_SUFFIX)',
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'outputs': [
>     +--
>     +2.34.1
>     +
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries=
-and-use-libdir.patch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries=
-and-use-libdir.patch
>     deleted file mode 100644
>     index 5cb2e9701..000000000
>     ---
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries=
-and-use-libdir.patch
>     +++ /dev/null
>     @@ -1,96 +0,0 @@
>     -From 62ddf8499747fb1e366477d666c0634ad50039a9 Mon Sep 17 00:00:00
>     2001
>     -From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
>     -Date: Tue, 19 Mar 2019 23:22:40 -0400
>     -Subject: [PATCH 2/2] Install both binaries and use libdir.
>     -
>     -This allows us to build with a shared library for other users whil=
e
>     -still providing the normal executable.
>     -
>     -Taken from -
>     https://src.fedoraproject.org/rpms/nodejs/raw/rawhide/f/0002-Instal=
l-both-binaries-and-use-libdir.patch
>     <https://urldefense.com/v3/__https://src.fedoraproject.org/rpms/nod=
ejs/raw/rawhide/f/0002-Install-both-binaries-and-use-libdir.patch__;!!Ajv=
eYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk=
-GtvN-eKnWtaUipHYjAMet0aFAI$>
>     -
>     -Upstream-Status: Pending
>     -
>     -Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com=
>
>     -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     ----
>     - configure.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++
>     - tools/install.py
>     <https://urldefense.com/v3/__http://install.py__;!!AjveYdw8EvQ!bcx8=
0wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaU=
ipHYjAMXZ-_c6A$>
>     | 21 +++++++++------------
>     - 2 files changed, 16 insertions(+), 12 deletions(-)
>     -
>     -diff --git a/configure.py
>     <https://urldefense.com/v3/__http://configure.py__;!!AjveYdw8EvQ!bc=
x80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWt=
aUipHYjAMFajHJ5c$>
>     b/configure.py
>     <https://urldefense.com/v3/__http://configure.py__;!!AjveYdw8EvQ!bc=
x80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWt=
aUipHYjAMFajHJ5c$>
>     -index
>     6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f397=
8067537abf9f0f0
>     100755
>     ---- a/configure.py
>     <https://urldefense.com/v3/__http://configure.py__;!!AjveYdw8EvQ!bc=
x80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWt=
aUipHYjAMFajHJ5c$>
>     -+++ b/configure.py
>     <https://urldefense.com/v3/__http://configure.py__;!!AjveYdw8EvQ!bc=
x80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWt=
aUipHYjAMFajHJ5c$>
>     -@@ -721,10 +721,16 @@ parser.add_argument('--shared',
>     -=C2=A0 =C2=A0 =C2=A0dest=3D'shared',
>     -=C2=A0 =C2=A0 =C2=A0default=3DNone,
>     -=C2=A0 =C2=A0 =C2=A0help=3D'compile shared library for embedding n=
ode in another
>     project. ' +
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '(This mode is not officially s=
upported for regular
>     applications)')
>     -
>     -+parser.add_argument('--libdir',
>     -+=C2=A0 =C2=A0 action=3D'store',
>     -+=C2=A0 =C2=A0 dest=3D'libdir',
>     -+=C2=A0 =C2=A0 default=3D'lib',
>     -+=C2=A0 =C2=A0 help=3D'a directory to install the shared library i=
nto')
>     -+
>     - parser.add_argument('--without-v8-platform',
>     -=C2=A0 =C2=A0 =C2=A0action=3D'store_true',
>     -=C2=A0 =C2=A0 =C2=A0dest=3D'without_v8_platform',
>     -=C2=A0 =C2=A0 =C2=A0default=3DFalse,
>     -=C2=A0 =C2=A0 =C2=A0help=3D'do not initialize v8 platform during n=
ode.js startup. ' +
>     -@@ -1305,10 +1311,11 @@ def configure_node(o):
>     -=C2=A0 =C2=A0 =C2=A0o['variables']['debug_nghttp2'] =3D 'false'
>     -
>     -=C2=A0 =C2=A0o['variables']['node_no_browser_globals'] =3D
>     b(options.no_browser_globals)
>     -
>     -=C2=A0 =C2=A0o['variables']['node_shared'] =3D b(options.shared)
>     -+=C2=A0 o['variables']['libdir'] =3D options.libdir
>     -=C2=A0 =C2=A0node_module_version =3D getmoduleversion.get_version(=
)
>     -
>     -=C2=A0 =C2=A0if options.dest_os =3D=3D 'android':
>     -=C2=A0 =C2=A0 =C2=A0shlib_suffix =3D 'so'
>     -=C2=A0 =C2=A0elif sys.platform =3D=3D 'darwin':
>     -diff --git a/tools/install.py
>     <https://urldefense.com/v3/__http://install.py__;!!AjveYdw8EvQ!bcx8=
0wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaU=
ipHYjAMXZ-_c6A$>
>     b/tools/install.py
>     <https://urldefense.com/v3/__http://install.py__;!!AjveYdw8EvQ!bcx8=
0wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaU=
ipHYjAMXZ-_c6A$>
>     -index
>     41cc1cbc60a9480cc08df3aa0ebe582c2becc3a2..11208f9e7166ab60da46d5ace=
2257c239a7e9263
>     100755
>     ---- a/tools/install.py
>     <https://urldefense.com/v3/__http://install.py__;!!AjveYdw8EvQ!bcx8=
0wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaU=
ipHYjAMXZ-_c6A$>
>     -+++ b/tools/install.py
>     <https://urldefense.com/v3/__http://install.py__;!!AjveYdw8EvQ!bcx8=
0wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaU=
ipHYjAMXZ-_c6A$>
>     -@@ -128,26 +128,23 @@ def subdir_files(path, dest, action):
>     -=C2=A0 =C2=A0for subdir, files_in_path in ret.items():
>     -=C2=A0 =C2=A0 =C2=A0action(files_in_path, subdir + '/')
>     -
>     - def files(action):
>     -=C2=A0 =C2=A0is_windows =3D sys.platform =3D=3D 'win32'
>     --=C2=A0 output_file =3D 'node'
>     -=C2=A0 =C2=A0output_prefix =3D 'out/Release/'
>     -+=C2=A0 output_libprefix =3D output_prefix
>     -
>     --=C2=A0 if 'false' =3D=3D variables.get('node_shared'):
>     --=C2=A0 =C2=A0 if is_windows:
>     --=C2=A0 =C2=A0 =C2=A0 output_file +=3D '.exe'
>     -+=C2=A0 if is_windows:
>     -+=C2=A0 =C2=A0 output_bin =3D 'node.exe'
>     -+=C2=A0 =C2=A0 output_lib =3D 'node.dll'
>     -=C2=A0 =C2=A0else:
>     --=C2=A0 =C2=A0 if is_windows:
>     --=C2=A0 =C2=A0 =C2=A0 output_file +=3D '.dll'
>     --=C2=A0 =C2=A0 else:
>     --=C2=A0 =C2=A0 =C2=A0 output_file =3D 'lib' + output_file + '.' +
>     variables.get('shlib_suffix')
>     -+=C2=A0 =C2=A0 output_bin =3D 'node'
>     -+=C2=A0 =C2=A0 output_lib =3D 'libnode.' + variables.get('shlib_su=
ffix')
>     -
>     --=C2=A0 if 'false' =3D=3D variables.get('node_shared'):
>     --=C2=A0 =C2=A0 action([output_prefix + output_file], 'bin/' + outp=
ut_file)
>     --=C2=A0 else:
>     --=C2=A0 =C2=A0 action([output_prefix + output_file], 'lib/' + outp=
ut_file)
>     -+=C2=A0 action([output_prefix + output_bin], 'bin/' + output_bin)
>     -+=C2=A0 if 'true' =3D=3D variables.get('node_shared'):
>     -+=C2=A0 =C2=A0 action([output_libprefix + output_lib],
>     variables.get('libdir') + '/' + output_lib)
>     -
>     -=C2=A0 =C2=A0if 'true' =3D=3D variables.get('node_use_dtrace'):
>     -=C2=A0 =C2=A0 =C2=A0action(['out/Release/node.d'], 'lib/dtrace/nod=
e.d')
>     -
>     -=C2=A0 =C2=A0# behave similarly for systemtap
>     ---
>     -2.33.0
>     -
>     diff --git
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-pr=
ovider-option.patch
>     b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-pr=
ovider-option.patch
>     deleted file mode 100644
>     index 4d238c03f..000000000
>     ---
>     a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-pr=
ovider-option.patch
>     +++ /dev/null
>     @@ -1,151 +0,0 @@
>     -From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17 00:00:00
>     2001
>     -From: Daniel Bevenius <daniel.bevenius@gmail.com>
>     -Date: Sat, 16 Oct 2021 08:50:16 +0200
>     -Subject: [PATCH] src: add --openssl-legacy-provider option
>     -
>     -This commit adds an option to Node.js named --openssl-legacy-provi=
der
>     -and if specified will load OpenSSL 3.0 Legacy provider.
>     -
>     -$ ./node --help
>     -...
>     ---openssl-legacy-provider=C2=A0 enable OpenSSL 3.0 legacy provider
>     -
>     -Example usage:
>     -
>     -$ ./node --openssl-legacy-provider=C2=A0 -p 'crypto.createHash("md=
4")'
>     -Hash {
>     -=C2=A0 _options: undefined,
>     -=C2=A0 [Symbol(kHandle)]: Hash {},
>     -=C2=A0 [Symbol(kState)]: { [Symbol(kFinalized)]: false }
>     -}
>     -
>     -Co-authored-by: Richard Lau <rlau@redhat.com>
>     -Signed-off-by: Signed-off-by: Andrej Valek <andrej.valek@siemens.c=
om>
>     -Upstream-Status: Backport
>     [https://github.com/nodejs/node/issues/40455
>     <https://urldefense.com/v3/__https://github.com/nodejs/node/issues/=
40455__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-=
FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMzLcRt8c$>]
>     ----
>     - doc/api/cli.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 10
>     ++++++++++
>     - src/crypto/crypto_util.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10
>     ++++++++++
>     - src/node_options.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 10
>     ++++++++++
>     - src/node_options.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 7 +++++++
>     - .../test-process-env-allowed-flags-are-documented.js=C2=A0 =C2=A0=
|=C2=A0 5 +++++
>     - 5 files changed, 42 insertions(+)
>     -
>     -diff --git a/doc/api/cli.md
>     <https://urldefense.com/v3/__http://cli.md__;!!AjveYdw8EvQ!bcx80wmi=
gop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHY=
jAMFt6pddQ$>
>     b/doc/api/cli.md
>     <https://urldefense.com/v3/__http://cli.md__;!!AjveYdw8EvQ!bcx80wmi=
gop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHY=
jAMFt6pddQ$>
>     -index 74057706bf8d..608b9cdeddf1 100644
>     ---- a/doc/api/cli.md
>     <https://urldefense.com/v3/__http://cli.md__;!!AjveYdw8EvQ!bcx80wmi=
gop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHY=
jAMFt6pddQ$>
>     -+++ b/doc/api/cli.md
>     <https://urldefense.com/v3/__http://cli.md__;!!AjveYdw8EvQ!bcx80wmi=
gop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHY=
jAMFt6pddQ$>
>     -@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on
>     startup. Among other uses, this can be
>     - used to enable FIPS-compliant crypto if Node.js is built
>     - against FIPS-enabled OpenSSL.
>     -
>     -+### `--openssl-legacy-provider`
>     -+<!-- YAML
>     -+added: REPLACEME
>     -+-->
>     -+
>     -+Enable OpenSSL 3.0 legacy provider. For more information please s=
ee
>     -+[providers readme][].
>     -+
>     - ### `--pending-deprecation`
>     -
>     - <!-- YAML
>     -@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:
>     - * `--no-warnings`
>     - * `--node-memory-debug`
>     - * `--openssl-config`
>     -+* `--openssl-legacy-provider`
>     - * `--pending-deprecation`
>     - * `--policy-integrity`
>     - * `--preserve-symlinks-main`
>     -@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=3D1536 index.js
>     - [emit_warning]: process.md#processemitwarningwarning-options
>     - [jitless]: https://v8.dev/blog/jitless
>     <https://urldefense.com/v3/__https://v8.dev/blog/jitless__;!!AjveYd=
w8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-Gt=
vN-eKnWtaUipHYjAM4H_FRAA$>
>     - [libuv threadpool documentation]:
>     https://docs.libuv.org/en/latest/threadpool.html
>     <https://urldefense.com/v3/__https://docs.libuv.org/en/latest/threa=
dpool.html__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5n=
w5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMsvK9VnA$>
>     -+[providers readme]:
>     https://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVID=
ERS.md
>     <https://urldefense.com/v3/__https://github.com/openssl/openssl/blo=
b/openssl-3.0.0/README-PROVIDERS.md__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohE=
OVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMVhHNfFg$>
>     - [remote code execution]:
>     https://www.owasp.org/index.php/Code_Injection
>     <https://urldefense.com/v3/__https://www.owasp.org/index.php/Code_I=
njection__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5=
ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMM8NUUqY$>
>     - [security warning]:
>     #warning-binding-inspector-to-a-public-ipport-combination-is-insecu=
re
>     - [timezone IDs]:
>     https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
>     -diff
>     <https://urldefense.com/v3/__https://en.wikipedia.org/wiki/List_of_=
tz_database_time_zones-diff__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPf=
Dp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAM1Edl0A8$>
>     --git a/src/crypto/crypto_util.cc
>     <https://urldefense.com/v3/__http://crypto_util.cc__;!!AjveYdw8EvQ!=
bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKn=
WtaUipHYjAMxy_0MgY$>
>     b/src/crypto/crypto_util.cc
>     <https://urldefense.com/v3/__http://crypto_util.cc__;!!AjveYdw8EvQ!=
bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKn=
WtaUipHYjAMxy_0MgY$>
>     -index 7e0c8ba3eb60..796ea3025e41 100644
>     ---- a/src/crypto/crypto_util.cc
>     <https://urldefense.com/v3/__http://crypto_util.cc__;!!AjveYdw8EvQ!=
bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKn=
WtaUipHYjAMxy_0MgY$>
>     -+++ b/src/crypto/crypto_util.cc
>     <https://urldefense.com/v3/__http://crypto_util.cc__;!!AjveYdw8EvQ!=
bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKn=
WtaUipHYjAMxy_0MgY$>
>     -@@ -148,6 +148,16 @@ void InitCryptoOnce() {
>     -=C2=A0 =C2=A0}
>     - #endif
>     -
>     -+#if OPENSSL_VERSION_MAJOR >=3D 3
>     -+=C2=A0 // --openssl-legacy-provider
>     -+=C2=A0 if (per_process::cli_options->openssl_legacy_provider) {
>     -+=C2=A0 =C2=A0 OSSL_PROVIDER* legacy_provider =3D OSSL_PROVIDER_lo=
ad(nullptr,
>     "legacy");
>     -+=C2=A0 =C2=A0 if (legacy_provider =3D=3D nullptr) {
>     -+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "Unable to load legacy provi=
der.\n");
>     -+=C2=A0 =C2=A0 }
>     -+=C2=A0 }
>     -+#endif
>     -+
>     -=C2=A0 =C2=A0OPENSSL_init_ssl(0, settings);
>     -=C2=A0 =C2=A0OPENSSL_INIT_free(settings);
>     -=C2=A0 =C2=A0settings =3D nullptr;
>     -diff --git a/src/node_options.cc
>     <https://urldefense.com/v3/__http://node_options.cc__;!!AjveYdw8EvQ=
!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eK=
nWtaUipHYjAMmfYpJHc$>
>     b/src/node_options.cc
>     <https://urldefense.com/v3/__http://node_options.cc__;!!AjveYdw8EvQ=
!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eK=
nWtaUipHYjAMmfYpJHc$>
>     -index 00bdc6688a4c..3363860919a9 100644
>     ---- a/src/node_options.cc
>     <https://urldefense.com/v3/__http://node_options.cc__;!!AjveYdw8EvQ=
!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eK=
nWtaUipHYjAMmfYpJHc$>
>     -+++ b/src/node_options.cc
>     <https://urldefense.com/v3/__http://node_options.cc__;!!AjveYdw8EvQ=
!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eK=
nWtaUipHYjAMmfYpJHc$>
>     -@@ -4,6 +4,9 @@
>     - #include "env-inl.h"
>     - #include "node_binding.h"
>     - #include "node_internals.h"
>     -+#if HAVE_OPENSSL
>     -+#include "openssl/opensslv.h"
>     -+#endif
>     -
>     - #include <errno.h>
>     - #include <sstream>
>     -diff --git a/src/node_options.h b/src/node_options.h
>     -index fd772478d04d..1c0e018ab16f 100644
>     ---- a/src/node_options.h
>     -+++ b/src/node_options.h
>     -@@ -11,6 +11,10 @@
>     - #include "node_mutex.h"
>     - #include "util.h"
>     -
>     -+#if HAVE_OPENSSL
>     -+#include "openssl/opensslv.h"
>     -+#endif
>     -+
>     - namespace node {
>     -
>     - class HostPort {
>     -@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {
>     -=C2=A0 =C2=A0bool enable_fips_crypto =3D false;
>     -=C2=A0 =C2=A0bool force_fips_crypto =3D false;
>     - #endif
>     -+#if OPENSSL_VERSION_MAJOR >=3D 3
>     -+=C2=A0 bool openssl_legacy_provider =3D false;
>     -+#endif
>     -
>     -=C2=A0 =C2=A0// Per-process because reports can be triggered outsi=
de a
>     known V8 context.
>     -=C2=A0 =C2=A0bool report_on_fatalerror =3D false;
>     -diff --git
>     a/test/parallel/test-process-env-allowed-flags-are-documented.js
>     b/test/parallel/test-process-env-allowed-flags-are-documented.js
>     -index 64626b71f019..8a4e35997907 100644
>     ---- a/test/parallel/test-process-env-allowed-flags-are-documented.=
js
>     -+++ b/test/parallel/test-process-env-allowed-flags-are-documented.=
js
>     -@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines,
>     ...v8OptionsLines]) {
>     -=C2=A0 =C2=A0}
>     - }
>     -
>     -+if (!common.hasOpenSSL3) {
>     -+=C2=A0 documented.delete('--openssl-legacy-provider');
>     -+}
>     -+
>     - // Filter out options that are conditionally present.
>     - const conditionalOpts =3D [
>     -=C2=A0 =C2=A0{
>     -@@ -50,6 +54,7 @@ const conditionalOpts =3D [
>     -=C2=A0 =C2=A0 =C2=A0filter: (opt) =3D> {
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0return [
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'--openssl-config',
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 common.hasOpenSSL3 ? '--openssl-legac=
y-provider' : '',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'--tls-cipher-list',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'--use-bundled-ca',
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'--use-openssl-ca',
>     -
>     diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
>     <https://urldefense.com/v3/__http://nodejs_16.14.2.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMmGjEF2k$>
>     b/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
>     <https://urldefense.com/v3/__http://nodejs_16.18.1.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMtRkXgYY$>
>     similarity index 94%
>     rename from meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
>     <https://urldefense.com/v3/__http://nodejs_16.14.2.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMmGjEF2k$>
>     rename to meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
>     <https://urldefense.com/v3/__http://nodejs_16.18.1.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMtRkXgYY$>
>     index 62188f94a..a67948320 100644
>     --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
>     <https://urldefense.com/v3/__http://nodejs_16.14.2.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMmGjEF2k$>
>     +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
>     <https://urldefense.com/v3/__http://nodejs_16.18.1.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMtRkXgYY$>
>     @@ -1,7 +1,7 @@
>     =C2=A0DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>     =C2=A0HOMEPAGE =3D "http://nodejs.org
>     <https://urldefense.com/v3/__http://nodejs.org__;!!AjveYdw8EvQ!bcx8=
0wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaU=
ipHYjAM4Pdi5yU$>"
>     =C2=A0LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artist=
ic-2.0"
>     -LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D6ba5b21ac7a505195ca69344d3d7a94a"
>     +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D6e54852cd826c41e80c6d80f6db00a85"
>
>     =C2=A0DEPENDS =3D "openssl"
>     =C2=A0DEPENDS:append:class-target =3D " qemu-native"
>     @@ -19,9 +19,7 @@ COMPATIBLE_HOST:powerpc =3D "null"
>
>     =C2=A0SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz
>     <https://urldefense.com/v3/__http://nodejs.org/dist/v$*7BPV*7D/node=
-v$*7BPV*7D.tar.xz__;JSUlJQ!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0=
MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMRxCfBF8$>
>     \
>     file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
>     - file://0002-Install-both-binaries-and-use-libdir.patch \
>     file://0004-v8-don-t-override-ARM-CFLAGS.patch \
>     - file://0005-add-openssl-legacy-provider-option.patch \
>     file://big-endian.patch \
>     file://mips-less-memory.patch \
>     file://system-c-ares.patch \
>     @@ -29,7 +27,7 @@ SRC_URI =3D
>     "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz
>     <https://urldefense.com/v3/__http://nodejs.org/dist/v$*7BPV*7D/node=
-v$*7BPV*7D.tar.xz__;JSUlJQ!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0=
MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMRxCfBF8$>
>     \
>     file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     =C2=A0SRC_URI:append:class-target =3D " \
>     - file://0002-Using-native-binaries.patch \
>     + file://0001-Using-native-binaries.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     =C2=A0SRC_URI:append:toolchain-clang:x86 =3D " \
>     file://libatomic.patch \
>     @@ -37,7 +35,7 @@ SRC_URI:append:toolchain-clang:x86 =3D " \
>     =C2=A0SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>     file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     -SRC_URI[sha256sum] =3D
>     "e922e215cc68eb5f94d33e8a0b61e2c863b7731cc8600ab955d3822da90ff8d1"
>     +SRC_URI[sha256sum] =3D
>     "1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4d445238"
>
>     =C2=A0S =3D "${WORKDIR}/node-v${PV}"
>
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#99614):
>     https://lists.openembedded.org/g/openembedded-devel/message/99614
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/99614__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPf=
Dp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMXpka9ds$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/95118333/3617156
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9511=
8333/3617156__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv=
5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMK7q4q3U$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-=
8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMM4Y3D7g$>
>     [Martin.Jansa@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------P3mszWZdo4rl3fCtdHLtKIZY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2AOGjhNm017641

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Add Armin to ensure he seems this once
      he recovers from US Thanksgiving indulgences.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2022-11-24 12:05, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQeUgwE0kPWymzP7C4pupbOYHf=
KH3SG13KoaPbt8eX3KxA@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div>I see this is now queued in kirkstone-next</div>
        <div><a href=3D"https://urldefense.com/v3/__https://git.openembed=
ded.org/meta-openembedded/commit/?h=3Dkirkstone-next&amp;id=3D08b6b6846a8=
4d9a0459f42d1d730c9ea1d50c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1w=
PfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyDWE$" moz-do=
-not-send=3D"true">https://git.openembedded.org/meta-openembedded/commit/=
?h=3Dkirkstone-next&amp;id=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f</a>=
<br>
        </div>
        <div><br>
        </div>
        I see bunch of recipes failing since this upgrade landed in
        master, mostly due to npm dependency resolution being more
        strict now and builds failing with
        <div><br>
        </div>
        <div>npm ERR! code ERESOLVE<br>
          npm ERR! ERESOLVE could not resolve<br>
        </div>
        <div>...</div>
        <div>npm ERR! Fix the upstream dependency conflict, or retry<br>
          npm ERR! this command with --force, or --legacy-peer-deps<br>
          npm ERR! to accept an incorrect (and potentially broken)
          dependency resolution.<br>
        </div>
        <div><br>
        </div>
        <div>Can we please delay backporting to kirkstone and langdale a
          bit more?</div>
      </div>
    </blockquote>
    <p>Seconded!</p>
    <p>What recipes encounters this bug?<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQeUgwE0kPWymzP7C4pupbOYHf=
KH3SG13KoaPbt8eX3KxA@mail.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>And if others are seeing similar failures please share them
          here as well.</div>
        <div><br>
        </div>
        <div>The older nodejs was using&nbsp;<a class=3D"moz-txt-link-abb=
reviated" href=3D"mailto:npm@8.5.0">npm@8.5.0</a>, now its <a class=3D"mo=
z-txt-link-abbreviated" href=3D"mailto:npm@8.19.2">npm@8.19.2</a>
          more details about this change in behavior from 8.6.0 in&nbsp;<=
a href=3D"https://urldefense.com/v3/__https://github.com/npm/cli/issues/4=
998__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FP=
fVsVaCxBstk-GtvN-eKnWtaUipHYjAMZmTsAyk$" moz-do-not-send=3D"true">https:/=
/github.com/npm/cli/issues/4998</a></div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Someone in the linked issue thread said:<br>
    </p>
    <p dir=3D"auto">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;We rolled =
back to Node v16.15.0, which has a
      working version of npm 8.5.5.&quot;</p>
    <p dir=3D"auto">Should we drop the 16.18.x update and stick with
      16.15.1 for kirkstone/langdale?</p>
    <p dir=3D"auto"><br>
    </p>
    <p dir=3D"auto">For master, I'd like to update to 18, 19, or ideally
      20 if it's available before the end of M3.<br>
    </p>
    <p dir=3D"auto">Martin,<br>
    </p>
    <p dir=3D"auto">What version of node make sense to you for master?<br=
>
      Do you agree that we should leave master on 16.18.x and people
      should fix their <br>
      'broken' npm dependencies?<br>
    </p>
    <p dir=3D"auto">../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQeUgwE0kPWymzP7C4pupbOYHf=
KH3SG13KoaPbt8eX3KxA@mail.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Regards,</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 18, 2022 at 7:2=
7
          PM Polampalli, Archana &lt;<a href=3D"mailto:archana.polampalli=
@windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
archana.polampalli@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
*
          Drop Openssl legacy provider patch and install both binaries
          patch<br>
          &nbsp; which are already available in 16.x<br>
          * Refresh native binaries patch against 16.x base<br>
          <br>
          Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana=
.polampalli@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">archana.polampalli@windriver.com</a>&gt;<br>
          ---<br>
          &nbsp;.../oe-npm-cache&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &=
nbsp;0<br>
          &nbsp;....<a href=3D"https://urldefense.com/v3/__http://14.bb__=
;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVa=
CxBstk-GtvN-eKnWtaUipHYjAMucZHoEo$" rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">14.bb</a>
          =3D&gt; <a href=3D"https://urldefense.com/v3/__http://nodejs-oe=
-cache-native_16.18.bb__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MA=
iO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAM3BdjfLc$" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">nodejs-oe-cache-native_1=
6.18.bb</a>}
          |&nbsp; &nbsp;0<br>
          &nbsp;...patch =3D&gt; 0001-Using-native-binaries.patch} |&nbsp=
; 40 +++--<br>
          &nbsp;...Install-both-binaries-and-use-libdir.patch |&nbsp; 96
          -----------<br>
          &nbsp;...5-add-openssl-legacy-provider-option.patch | 151
          ------------------<br>
          &nbsp;.../{<a href=3D"https://urldefense.com/v3/__http://nodejs=
_16.14.2.bb__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5=
nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMmGjEF2k$" rel=3D"noreferrer" targe=
t=3D"_blank" moz-do-not-send=3D"true">nodejs_16.14.2.bb</a>
          =3D&gt; <a href=3D"https://urldefense.com/v3/__http://nodejs_16=
.18.1.bb__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5=
ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMtRkXgYY$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">nodejs_16.18.1.bb</a>}&nbsp;
          |&nbsp; &nbsp;8 +-<br>
          &nbsp;6 files changed, 27 insertions(+), 268 deletions(-)<br>
          &nbsp;rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-1=
6.14
          =3D&gt; nodejs-oe-cache-16.18}/oe-npm-cache (100%)<br>
          &nbsp;rename meta-oe/recipes-devtools/nodejs/{<a href=3D"https:=
//urldefense.com/v3/__http://nodejs-oe-cache-native_16.14.bb__;!!AjveYdw8=
EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN=
-eKnWtaUipHYjAMcMegzi4$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true">nodejs-oe-cache-native_16.14.bb</a>
          =3D&gt; <a href=3D"https://urldefense.com/v3/__http://nodejs-oe=
-cache-native_16.18.bb__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MA=
iO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAM3BdjfLc$" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">nodejs-oe-cache-native_1=
6.18.bb</a>}
          (100%)<br>
          &nbsp;rename
          meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binar=
ies.patch
          =3D&gt; 0001-Using-native-binaries.patch} (70%)<br>
          &nbsp;delete mode 100644
meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use=
-libdir.patch<br>
          &nbsp;delete mode 100644
meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-o=
ption.patch<br>
          &nbsp;rename meta-oe/recipes-devtools/nodejs/{<a href=3D"https:=
//urldefense.com/v3/__http://nodejs_16.14.2.bb__;!!AjveYdw8EvQ!bcx80wmigo=
p8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjA=
MmGjEF2k$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
nodejs_16.14.2.bb</a>
          =3D&gt; <a href=3D"https://urldefense.com/v3/__http://nodejs_16=
.18.1.bb__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5=
ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMtRkXgYY$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">nodejs_16.18.1.bb</a>}
          (94%)<br>
          <br>
          diff --git
          a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-=
cache
b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache<br>
          similarity index 100%<br>
          rename from
          meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-ca=
che<br>
          rename to
          meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-ca=
che<br>
          diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"https:/=
/urldefense.com/v3/__http://nodejs-oe-cache-native_16.14.bb__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAMcMegzi4$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">nodejs-oe-cache-native_16.14.bb</a>
          b/meta-oe/recipes-devtools/nodejs/<a href=3D"https://urldefense=
.com/v3/__http://nodejs-oe-cache-native_16.18.bb__;!!AjveYdw8EvQ!bcx80wmi=
gop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHY=
jAM3BdjfLc$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">nodejs-oe-cache-native_16.18.bb</a><br>
          similarity index 100%<br>
          rename from meta-oe/recipes-devtools/nodejs/<a href=3D"https://=
urldefense.com/v3/__http://nodejs-oe-cache-native_16.14.bb__;!!AjveYdw8Ev=
Q!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-e=
KnWtaUipHYjAMcMegzi4$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true">nodejs-oe-cache-native_16.14.bb</a><br>
          rename to meta-oe/recipes-devtools/nodejs/<a href=3D"https://ur=
ldefense.com/v3/__http://nodejs-oe-cache-native_16.18.bb__;!!AjveYdw8EvQ!=
bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKn=
WtaUipHYjAM3BdjfLc$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">nodejs-oe-cache-native_16.18.bb</a><br>
          diff --git
a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch=
<br>
          similarity index 70%<br>
          rename from
          meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binari=
es.patch<br>
          rename to
          meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binari=
es.patch<br>
          index 8db1f1dd5..445aaf839 100644<br>
          ---
a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch=
<br>
          +++
b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch=
<br>
          @@ -3,14 +3,17 @@ From: Guillaume Burel &lt;<a href=3D"mailto:g=
uillaume.burel@stormshield.eu" target=3D"_blank" moz-do-not-send=3D"true"=
 class=3D"moz-txt-link-freetext">guillaume.burel@stormshield.eu</a>&gt;<b=
r>
          &nbsp;Date: Fri, 3 Jan 2020 11:25:54 +0100<br>
          &nbsp;Subject: [PATCH] Using native binaries<br>
          <br>
          +Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archan=
a.polampalli@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">archana.polampalli@windriver.com</a>&gt;<br=
>
          &nbsp;---<br>
          - node.gyp&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;|&nbsp; 4 ++--<br>
          - tools/v8_gypfiles/v8.gyp | 11 ++++-------<br>
          - 2 files changed, 6 insertions(+), 9 deletions(-)<br>
          + node.gyp&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;| 2 ++<br>
          + tools/v8_gypfiles/v8.gyp | 5 +++++<br>
          + 2 files changed, 7 insertions(+)<br>
          <br>
          +diff --git a/node.gyp b/node.gyp<br>
          +index 24505da7ba..7d41bd52db 100644<br>
          &nbsp;--- a/node.gyp<br>
          &nbsp;+++ b/node.gyp<br>
          -@@ -294,6 +294,7 @@<br>
          +@@ -319,6 +319,7 @@<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'action=
_name': 'run_mkcodecache',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'proces=
s_outputs_as_sources': 1,<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'inputs=
': [<br>
          @@ -18,14 +21,16 @@ Subject: [PATCH] Using native binaries<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
'&lt;(mkcodecache_exec)',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ],<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'output=
s': [<br>
          -@@ -319,6 +320,7 @@<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'action=
_name': 'node_mksnapshot',<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'proces=
s_outputs_as_sources': 1,<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'inputs=
': [<br>
          -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '&lt;=
(PRODUCT_DIR)/v8-qemu-wrapper.sh',<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
'&lt;(node_mksnapshot_exec)',<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;],<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'output=
s': [<br>
          +@@ -366,6 +367,7 @@<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;'action_name': 'node_mksnapshot',<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;'process_outputs_as_sources': 1,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;'inputs': [<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; '&lt;(PRODUCT_DIR)/v8-qemu-wrapper.sh',<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;'&lt;(node_mksnapshot_exec)',<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;],<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;'outputs': [<br>
          +diff --git a/tools/v8_gypfiles/v8.gyp
          b/tools/v8_gypfiles/v8.gyp<br>
          +index ed042f8829..371b8e02c2 100644<br>
          &nbsp;--- a/tools/v8_gypfiles/v8.gyp<br>
          &nbsp;+++ b/tools/v8_gypfiles/v8.gyp<br>
          &nbsp;@@ -68,6 +68,7 @@<br>
          @@ -40,11 +45,11 @@ Subject: [PATCH] Using native binaries<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '&lt;@(torque_=
outputs_inc)',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ],<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'action': [<br>
          -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '&lt;(PRODUCT_DIR)/v8-qemu=
-wrapper.sh',<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '&lt;(PRODUCT_DIR)/=
v8-qemu-wrapper.sh',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
'&lt;(PRODUCT_DIR)/&lt;(EXECUTABLE_PREFIX)torque&lt;(EXECUTABLE_SUFFIX)',=
<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '-o',
          '&lt;(SHARED_INTERMEDIATE_DIR)/torque-generated',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '-v8-root', '&=
lt;(V8_ROOT)',<br>
          -@@ -225,6 +227,7 @@<br>
          +@@ -211,6 +213,7 @@<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'action_name':
          'generate_bytecode_builtins_list_action',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'inputs': [<br>
          @@ -52,7 +57,7 @@ Subject: [PATCH] Using native binaries<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
'&lt;(PRODUCT_DIR)/&lt;(EXECUTABLE_PREFIX)bytecode_builtins_list_generato=
r&lt;(EXECUTABLE_SUFFIX)',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ],<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'outputs': [<br>
          -@@ -415,6 +418,7 @@<br>
          +@@ -395,6 +398,7 @@<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ],<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'inputs': [<br>
          @@ -60,7 +65,7 @@ Subject: [PATCH] Using native binaries<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '&lt;(mksnapsh=
ot_exec)',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ],<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'outputs': [<br>
          -@@ -1548,6 +1552,7 @@<br>
          +@@ -1513,6 +1517,7 @@<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'action_name':
          'run_gen-regexp-special-case_action',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'inputs': [<br>
          @@ -68,3 +73,6 @@ Subject: [PATCH] Using native binaries<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
'&lt;(PRODUCT_DIR)/&lt;(EXECUTABLE_PREFIX)gen-regexp-special-case&lt;(EXE=
CUTABLE_SUFFIX)',<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ],<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'outputs': [<br>
          +-- <br>
          +2.34.1<br>
          +<br>
          diff --git
a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-u=
se-libdir.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-u=
se-libdir.patch<br>
          deleted file mode 100644<br>
          index 5cb2e9701..000000000<br>
          ---
a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-u=
se-libdir.patch<br>
          +++ /dev/null<br>
          @@ -1,96 +0,0 @@<br>
          -From 62ddf8499747fb1e366477d666c0634ad50039a9 Mon Sep 17
          00:00:00 2001<br>
          -From: Elliott Sales de Andrade &lt;<a href=3D"mailto:quantum.a=
nalyst@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">quantum.analyst@gmail.com</a>&gt;<br>
          -Date: Tue, 19 Mar 2019 23:22:40 -0400<br>
          -Subject: [PATCH 2/2] Install both binaries and use libdir.<br>
          -<br>
          -This allows us to build with a shared library for other users
          while<br>
          -still providing the normal executable.<br>
          -<br>
          -Taken from - <a href=3D"https://urldefense.com/v3/__https://sr=
c.fedoraproject.org/rpms/nodejs/raw/rawhide/f/0002-Install-both-binaries-=
and-use-libdir.patch__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO=
-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMet0aFAI$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">https://src.fedoraproject.=
org/rpms/nodejs/raw/rawhide/f/0002-Install-both-binaries-and-use-libdir.p=
atch</a><br>
          -<br>
          -Upstream-Status: Pending<br>
          -<br>
          -Signed-off-by: Elliott Sales de Andrade &lt;<a href=3D"mailto:=
quantum.analyst@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">quantum.analyst@gmail.com</a>&gt;<br>
          -Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schni=
tzeltony@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"m=
oz-txt-link-freetext">schnitzeltony@gmail.com</a>&gt;<br>
          -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">raj.khem@gmail.com</a>&gt;<br>
          ----<br>
          - configure.py&nbsp; &nbsp; &nbsp;|&nbsp; 7 +++++++<br>
          - tools/<a href=3D"https://urldefense.com/v3/__http://install.p=
y__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfV=
sVaCxBstk-GtvN-eKnWtaUipHYjAMXZ-_c6A$" moz-do-not-send=3D"true">install.p=
y</a> | 21
          +++++++++------------<br>
          - 2 files changed, 16 insertions(+), 12 deletions(-)<br>
          -<br>
          -diff --git a/<a href=3D"https://urldefense.com/v3/__http://con=
figure.py__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw=
5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMFajHJ5c$" moz-do-not-send=3D"true">c=
onfigure.py</a> b/<a href=3D"https://urldefense.com/v3/__http://configure=
.py__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FP=
fVsVaCxBstk-GtvN-eKnWtaUipHYjAMFajHJ5c$" moz-do-not-send=3D"true">configu=
re.py</a><br>
          -index
6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f397806753=
7abf9f0f0
          100755<br>
          ---- a/<a href=3D"https://urldefense.com/v3/__http://configure.=
py__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPf=
VsVaCxBstk-GtvN-eKnWtaUipHYjAMFajHJ5c$" moz-do-not-send=3D"true">configur=
e.py</a><br>
          -+++ b/<a href=3D"https://urldefense.com/v3/__http://configure.=
py__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPf=
VsVaCxBstk-GtvN-eKnWtaUipHYjAMFajHJ5c$" moz-do-not-send=3D"true">configur=
e.py</a><br>
          -@@ -721,10 +721,16 @@ parser.add_argument('--shared',<br>
          -&nbsp; &nbsp; &nbsp;dest=3D'shared',<br>
          -&nbsp; &nbsp; &nbsp;default=3DNone,<br>
          -&nbsp; &nbsp; &nbsp;help=3D'compile shared library for embeddi=
ng node in
          another project. ' +<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '(This mode is not official=
ly supported for regular
          applications)')<br>
          - <br>
          -+parser.add_argument('--libdir',<br>
          -+&nbsp; &nbsp; action=3D'store',<br>
          -+&nbsp; &nbsp; dest=3D'libdir',<br>
          -+&nbsp; &nbsp; default=3D'lib',<br>
          -+&nbsp; &nbsp; help=3D'a directory to install the shared libra=
ry into')<br>
          -+<br>
          - parser.add_argument('--without-v8-platform',<br>
          -&nbsp; &nbsp; &nbsp;action=3D'store_true',<br>
          -&nbsp; &nbsp; &nbsp;dest=3D'without_v8_platform',<br>
          -&nbsp; &nbsp; &nbsp;default=3DFalse,<br>
          -&nbsp; &nbsp; &nbsp;help=3D'do not initialize v8 platform duri=
ng node.js
          startup. ' +<br>
          -@@ -1305,10 +1311,11 @@ def configure_node(o):<br>
          -&nbsp; &nbsp; &nbsp;o['variables']['debug_nghttp2'] =3D 'false=
'<br>
          - <br>
          -&nbsp; &nbsp;o['variables']['node_no_browser_globals'] =3D
          b(options.no_browser_globals)<br>
          - <br>
          -&nbsp; &nbsp;o['variables']['node_shared'] =3D b(options.share=
d)<br>
          -+&nbsp; o['variables']['libdir'] =3D options.libdir<br>
          -&nbsp; &nbsp;node_module_version =3D getmoduleversion.get_vers=
ion()<br>
          - <br>
          -&nbsp; &nbsp;if options.dest_os =3D=3D 'android':<br>
          -&nbsp; &nbsp; &nbsp;shlib_suffix =3D 'so'<br>
          -&nbsp; &nbsp;elif sys.platform =3D=3D 'darwin':<br>
          -diff --git a/tools/<a href=3D"https://urldefense.com/v3/__http=
://install.py__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDz=
v5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMXZ-_c6A$" moz-do-not-send=3D"tru=
e">install.py</a> b/tools/<a href=3D"https://urldefense.com/v3/__http://i=
nstall.py__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw=
5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMXZ-_c6A$" moz-do-not-send=3D"true">i=
nstall.py</a><br>
          -index
41cc1cbc60a9480cc08df3aa0ebe582c2becc3a2..11208f9e7166ab60da46d5ace2257c2=
39a7e9263
          100755<br>
          ---- a/tools/<a href=3D"https://urldefense.com/v3/__http://inst=
all.py__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai=
-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMXZ-_c6A$" moz-do-not-send=3D"true">inst=
all.py</a><br>
          -+++ b/tools/<a href=3D"https://urldefense.com/v3/__http://inst=
all.py__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai=
-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMXZ-_c6A$" moz-do-not-send=3D"true">inst=
all.py</a><br>
          -@@ -128,26 +128,23 @@ def subdir_files(path, dest, action):<br=
>
          -&nbsp; &nbsp;for subdir, files_in_path in ret.items():<br>
          -&nbsp; &nbsp; &nbsp;action(files_in_path, subdir + '/')<br>
          - <br>
          - def files(action):<br>
          -&nbsp; &nbsp;is_windows =3D sys.platform =3D=3D 'win32'<br>
          --&nbsp; output_file =3D 'node'<br>
          -&nbsp; &nbsp;output_prefix =3D 'out/Release/'<br>
          -+&nbsp; output_libprefix =3D output_prefix<br>
          - <br>
          --&nbsp; if 'false' =3D=3D variables.get('node_shared'):<br>
          --&nbsp; &nbsp; if is_windows:<br>
          --&nbsp; &nbsp; &nbsp; output_file +=3D '.exe'<br>
          -+&nbsp; if is_windows:<br>
          -+&nbsp; &nbsp; output_bin =3D 'node.exe'<br>
          -+&nbsp; &nbsp; output_lib =3D 'node.dll'<br>
          -&nbsp; &nbsp;else:<br>
          --&nbsp; &nbsp; if is_windows:<br>
          --&nbsp; &nbsp; &nbsp; output_file +=3D '.dll'<br>
          --&nbsp; &nbsp; else:<br>
          --&nbsp; &nbsp; &nbsp; output_file =3D 'lib' + output_file + '.=
' +
          variables.get('shlib_suffix')<br>
          -+&nbsp; &nbsp; output_bin =3D 'node'<br>
          -+&nbsp; &nbsp; output_lib =3D 'libnode.' + variables.get('shli=
b_suffix')<br>
          - <br>
          --&nbsp; if 'false' =3D=3D variables.get('node_shared'):<br>
          --&nbsp; &nbsp; action([output_prefix + output_file], 'bin/' +
          output_file)<br>
          --&nbsp; else:<br>
          --&nbsp; &nbsp; action([output_prefix + output_file], 'lib/' +
          output_file)<br>
          -+&nbsp; action([output_prefix + output_bin], 'bin/' + output_b=
in)<br>
          -+&nbsp; if 'true' =3D=3D variables.get('node_shared'):<br>
          -+&nbsp; &nbsp; action([output_libprefix + output_lib],
          variables.get('libdir') + '/' + output_lib)<br>
          - <br>
          -&nbsp; &nbsp;if 'true' =3D=3D variables.get('node_use_dtrace')=
:<br>
          -&nbsp; &nbsp; &nbsp;action(['out/Release/node.d'], 'lib/dtrace=
/node.d')<br>
          - <br>
          -&nbsp; &nbsp;# behave similarly for systemtap<br>
          --- <br>
          -2.33.0<br>
          -<br>
          diff --git
a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider=
-option.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider=
-option.patch<br>
          deleted file mode 100644<br>
          index 4d238c03f..000000000<br>
          ---
a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider=
-option.patch<br>
          +++ /dev/null<br>
          @@ -1,151 +0,0 @@<br>
          -From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17
          00:00:00 2001<br>
          -From: Daniel Bevenius &lt;<a href=3D"mailto:daniel.bevenius@gm=
ail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">daniel.bevenius@gmail.com</a>&gt;<br>
          -Date: Sat, 16 Oct 2021 08:50:16 +0200<br>
          -Subject: [PATCH] src: add --openssl-legacy-provider option<br>
          -<br>
          -This commit adds an option to Node.js named
          --openssl-legacy-provider<br>
          -and if specified will load OpenSSL 3.0 Legacy provider.<br>
          -<br>
          -$ ./node --help<br>
          -...<br>
          ---openssl-legacy-provider&nbsp; enable OpenSSL 3.0 legacy prov=
ider<br>
          -<br>
          -Example usage:<br>
          -<br>
          -$ ./node --openssl-legacy-provider&nbsp; -p
          'crypto.createHash(&quot;md4&quot;)'<br>
          -Hash {<br>
          -&nbsp; _options: undefined,<br>
          -&nbsp; [Symbol(kHandle)]: Hash {},<br>
          -&nbsp; [Symbol(kState)]: { [Symbol(kFinalized)]: false }<br>
          -}<br>
          -<br>
          -Co-authored-by: Richard Lau &lt;<a href=3D"mailto:rlau@redhat.=
com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">rlau@redhat.com</a>&gt;<br>
          -Signed-off-by: Signed-off-by: Andrej Valek &lt;<a href=3D"mail=
to:andrej.valek@siemens.com" target=3D"_blank" moz-do-not-send=3D"true" c=
lass=3D"moz-txt-link-freetext">andrej.valek@siemens.com</a>&gt;<br>
          -Upstream-Status: Backport [<a href=3D"https://urldefense.com/v=
3/__https://github.com/nodejs/node/issues/40455__;!!AjveYdw8EvQ!bcx80wmig=
op8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYj=
AMzLcRt8c$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/nodejs/node/issues/40455</a>]<br>
          ----<br>
          - doc/api/cli.md&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;| 10
          ++++++++++<br>
          - src/crypto/crypto_util.cc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 10
          ++++++++++<br>
          - src/node_options.cc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | 10
          ++++++++++<br>
          - src/node_options.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;|&nbsp; 7
          +++++++<br>
          - .../test-process-env-allowed-flags-are-documented.js&nbsp; &n=
bsp;|&nbsp; 5
          +++++<br>
          - 5 files changed, 42 insertions(+)<br>
          -<br>
          -diff --git a/doc/api/<a href=3D"https://urldefense.com/v3/__ht=
tp://cli.md__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5=
nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMFt6pddQ$" moz-do-not-send=3D"true"=
>cli.md</a> b/doc/api/<a href=3D"https://urldefense.com/v3/__http://cli.m=
d__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfV=
sVaCxBstk-GtvN-eKnWtaUipHYjAMFt6pddQ$" moz-do-not-send=3D"true">cli.md</a=
><br>
          -index 74057706bf8d..608b9cdeddf1 100644<br>
          ---- a/doc/api/<a href=3D"https://urldefense.com/v3/__http://cl=
i.md__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-F=
PfVsVaCxBstk-GtvN-eKnWtaUipHYjAMFt6pddQ$" moz-do-not-send=3D"true">cli.md=
</a><br>
          -+++ b/doc/api/<a href=3D"https://urldefense.com/v3/__http://cl=
i.md__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-F=
PfVsVaCxBstk-GtvN-eKnWtaUipHYjAMFt6pddQ$" moz-do-not-send=3D"true">cli.md=
</a><br>
          -@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on
          startup. Among other uses, this can be<br>
          - used to enable FIPS-compliant crypto if Node.js is built<br>
          - against FIPS-enabled OpenSSL.<br>
          - <br>
          -+### `--openssl-legacy-provider`<br>
          -+&lt;!-- YAML<br>
          -+added: REPLACEME<br>
          -+--&gt;<br>
          -+<br>
          -+Enable OpenSSL 3.0 legacy provider. For more information
          please see<br>
          -+[providers readme][].<br>
          -+<br>
          - ### `--pending-deprecation`<br>
          - <br>
          - &lt;!-- YAML<br>
          -@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:<br=
>
          - * `--no-warnings`<br>
          - * `--node-memory-debug`<br>
          - * `--openssl-config`<br>
          -+* `--openssl-legacy-provider`<br>
          - * `--pending-deprecation`<br>
          - * `--policy-integrity`<br>
          - * `--preserve-symlinks-main`<br>
          -@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=3D1536
          index.js<br>
          - [emit_warning]: process.md#processemitwarningwarning-options<=
br>
          - [jitless]: <a href=3D"https://urldefense.com/v3/__https://v8.=
dev/blog/jitless__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZ=
QDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAM4H_FRAA$" rel=3D"noreferrer" =
target=3D"_blank" moz-do-not-send=3D"true">https://v8.dev/blog/jitless</a=
><br>
          - [libuv threadpool documentation]: <a href=3D"https://urldefen=
se.com/v3/__https://docs.libuv.org/en/latest/threadpool.html__;!!AjveYdw8=
EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN=
-eKnWtaUipHYjAMsvK9VnA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true">https://docs.libuv.org/en/latest/threadpool.html</a><br>
          -+[providers readme]: <a href=3D"https://urldefense.com/v3/__ht=
tps://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md__=
;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVa=
CxBstk-GtvN-eKnWtaUipHYjAMVhHNfFg$" rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">https://github.com/openssl/openssl/blob/openssl-=
3.0.0/README-PROVIDERS.md</a><br>
          - [remote code execution]: <a href=3D"https://urldefense.com/v3=
/__https://www.owasp.org/index.php/Code_Injection__;!!AjveYdw8EvQ!bcx80wm=
igop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipH=
YjAMM8NUUqY$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">https://www.owasp.org/index.php/Code_Injection</a><br>
          - [security warning]:
          #warning-binding-inspector-to-a-public-ipport-combination-is-in=
secure<br>
          - [timezone IDs]: <a href=3D"https://urldefense.com/v3/__https:=
//en.wikipedia.org/wiki/List_of_tz_database_time_zones-diff__;!!AjveYdw8E=
vQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-=
eKnWtaUipHYjAM1Edl0A8$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">https://en.wikipedia.org/wiki/List_of_tz_database_time_zones=
<br>
            -diff</a> --git a/src/crypto/<a href=3D"https://urldefense.co=
m/v3/__http://crypto_util.cc__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wP=
fDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMxy_0MgY$" moz-do-=
not-send=3D"true">crypto_util.cc</a> b/src/crypto/<a href=3D"https://urld=
efense.com/v3/__http://crypto_util.cc__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7To=
hEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMxy_0MgY$=
" moz-do-not-send=3D"true">crypto_util.cc</a><br>
          -index 7e0c8ba3eb60..796ea3025e41 100644<br>
          ---- a/src/crypto/<a href=3D"https://urldefense.com/v3/__http:/=
/crypto_util.cc__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQ=
Dzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMxy_0MgY$" moz-do-not-send=3D"t=
rue">crypto_util.cc</a><br>
          -+++ b/src/crypto/<a href=3D"https://urldefense.com/v3/__http:/=
/crypto_util.cc__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQ=
Dzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMxy_0MgY$" moz-do-not-send=3D"t=
rue">crypto_util.cc</a><br>
          -@@ -148,6 +148,16 @@ void InitCryptoOnce() {<br>
          -&nbsp; &nbsp;}<br>
          - #endif<br>
          - <br>
          -+#if OPENSSL_VERSION_MAJOR &gt;=3D 3<br>
          -+&nbsp; // --openssl-legacy-provider<br>
          -+&nbsp; if (per_process::cli_options-&gt;openssl_legacy_provid=
er)
          {<br>
          -+&nbsp; &nbsp; OSSL_PROVIDER* legacy_provider =3D
          OSSL_PROVIDER_load(nullptr, &quot;legacy&quot;);<br>
          -+&nbsp; &nbsp; if (legacy_provider =3D=3D nullptr) {<br>
          -+&nbsp; &nbsp; &nbsp; fprintf(stderr, &quot;Unable to load leg=
acy provider.\n&quot;);<br>
          -+&nbsp; &nbsp; }<br>
          -+&nbsp; }<br>
          -+#endif<br>
          -+<br>
          -&nbsp; &nbsp;OPENSSL_init_ssl(0, settings);<br>
          -&nbsp; &nbsp;OPENSSL_INIT_free(settings);<br>
          -&nbsp; &nbsp;settings =3D nullptr;<br>
          -diff --git a/src/<a href=3D"https://urldefense.com/v3/__http:/=
/node_options.cc__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZ=
QDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMmfYpJHc$" moz-do-not-send=3D"=
true">node_options.cc</a> b/src/<a href=3D"https://urldefense.com/v3/__ht=
tp://node_options.cc__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO=
-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMmfYpJHc$" moz-do-not-send=
=3D"true">node_options.cc</a><br>
          -index 00bdc6688a4c..3363860919a9 100644<br>
          ---- a/src/<a href=3D"https://urldefense.com/v3/__http://node_o=
ptions.cc__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw=
5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMmfYpJHc$" moz-do-not-send=3D"true">n=
ode_options.cc</a><br>
          -+++ b/src/<a href=3D"https://urldefense.com/v3/__http://node_o=
ptions.cc__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw=
5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMmfYpJHc$" moz-do-not-send=3D"true">n=
ode_options.cc</a><br>
          -@@ -4,6 +4,9 @@<br>
          - #include &quot;env-inl.h&quot;<br>
          - #include &quot;node_binding.h&quot;<br>
          - #include &quot;node_internals.h&quot;<br>
          -+#if HAVE_OPENSSL<br>
          -+#include &quot;openssl/opensslv.h&quot;<br>
          -+#endif<br>
          - <br>
          - #include &lt;errno.h&gt;<br>
          - #include &lt;sstream&gt;<br>
          -diff --git a/src/node_options.h b/src/node_options.h<br>
          -index fd772478d04d..1c0e018ab16f 100644<br>
          ---- a/src/node_options.h<br>
          -+++ b/src/node_options.h<br>
          -@@ -11,6 +11,10 @@<br>
          - #include &quot;node_mutex.h&quot;<br>
          - #include &quot;util.h&quot;<br>
          - <br>
          -+#if HAVE_OPENSSL<br>
          -+#include &quot;openssl/opensslv.h&quot;<br>
          -+#endif<br>
          -+<br>
          - namespace node {<br>
          - <br>
          - class HostPort {<br>
          -@@ -251,6 +255,9 @@ class PerProcessOptions : public Options
          {<br>
          -&nbsp; &nbsp;bool enable_fips_crypto =3D false;<br>
          -&nbsp; &nbsp;bool force_fips_crypto =3D false;<br>
          - #endif<br>
          -+#if OPENSSL_VERSION_MAJOR &gt;=3D 3<br>
          -+&nbsp; bool openssl_legacy_provider =3D false;<br>
          -+#endif<br>
          - <br>
          -&nbsp; &nbsp;// Per-process because reports can be triggered o=
utside a
          known V8 context.<br>
          -&nbsp; &nbsp;bool report_on_fatalerror =3D false;<br>
          -diff --git
          a/test/parallel/test-process-env-allowed-flags-are-documented.j=
s
b/test/parallel/test-process-env-allowed-flags-are-documented.js<br>
          -index 64626b71f019..8a4e35997907 100644<br>
          ----
          a/test/parallel/test-process-env-allowed-flags-are-documented.j=
s<br>
          -+++
          b/test/parallel/test-process-env-allowed-flags-are-documented.j=
s<br>
          -@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines,
          ...v8OptionsLines]) {<br>
          -&nbsp; &nbsp;}<br>
          - }<br>
          - <br>
          -+if (!common.hasOpenSSL3) {<br>
          -+&nbsp; documented.delete('--openssl-legacy-provider');<br>
          -+}<br>
          -+<br>
          - // Filter out options that are conditionally present.<br>
          - const conditionalOpts =3D [<br>
          -&nbsp; &nbsp;{<br>
          -@@ -50,6 +54,7 @@ const conditionalOpts =3D [<br>
          -&nbsp; &nbsp; &nbsp;filter: (opt) =3D&gt; {<br>
          -&nbsp; &nbsp; &nbsp; &nbsp;return [<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'--openssl-config',<br>
          -+&nbsp; &nbsp; &nbsp; &nbsp; common.hasOpenSSL3 ? '--openssl-l=
egacy-provider' :
          '',<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'--tls-cipher-list',<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'--use-bundled-ca',<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'--use-openssl-ca',<br>
          -<br>
          diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"https:/=
/urldefense.com/v3/__http://nodejs_16.14.2.bb__;!!AjveYdw8EvQ!bcx80wmigop=
8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAM=
mGjEF2k$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">n=
odejs_16.14.2.bb</a>
          b/meta-oe/recipes-devtools/nodejs/<a href=3D"https://urldefense=
.com/v3/__http://nodejs_16.18.1.bb__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEO=
VlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMtRkXgYY$" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nodejs_16.18=
.1.bb</a><br>
          similarity index 94%<br>
          rename from meta-oe/recipes-devtools/nodejs/<a href=3D"https://=
urldefense.com/v3/__http://nodejs_16.14.2.bb__;!!AjveYdw8EvQ!bcx80wmigop8=
Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMm=
GjEF2k$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">no=
dejs_16.14.2.bb</a><br>
          rename to meta-oe/recipes-devtools/nodejs/<a href=3D"https://ur=
ldefense.com/v3/__http://nodejs_16.18.1.bb__;!!AjveYdw8EvQ!bcx80wmigop8Eo=
ea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMtRk=
XgYY$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">node=
js_16.18.1.bb</a><br>
          index 62188f94a..a67948320 100644<br>
          --- a/meta-oe/recipes-devtools/nodejs/<a href=3D"https://urldef=
ense.com/v3/__http://nodejs_16.14.2.bb__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7T=
ohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMmGjEF2k=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nodejs_1=
6.14.2.bb</a><br>
          +++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"https://urldef=
ense.com/v3/__http://nodejs_16.18.1.bb__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7T=
ohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMtRkXgYY=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nodejs_1=
6.18.1.bb</a><br>
          @@ -1,7 +1,7 @@<br>
          &nbsp;DESCRIPTION =3D &quot;nodeJS Evented I/O for V8 JavaScrip=
t&quot;<br>
          &nbsp;HOMEPAGE =3D &quot;<a href=3D"https://urldefense.com/v3/_=
_http://nodejs.org__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8=
lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAM4Pdi5yU$" rel=3D"noreferrer=
" target=3D"_blank" moz-do-not-send=3D"true">http://nodejs.org</a>&quot;<=
br>
          &nbsp;LICENSE =3D &quot;MIT &amp; ISC &amp; BSD-2-Clause &amp;
          BSD-3-Clause &amp; Artistic-2.0&quot;<br>
          -LIC_FILES_CHKSUM =3D
          <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;md5=3D=
6ba5b21ac7a505195ca69344d3d7a94a">&quot;file://LICENSE;md5=3D6ba5b21ac7a5=
05195ca69344d3d7a94a&quot;</a><br>
          +LIC_FILES_CHKSUM =3D
          <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;md5=3D=
6e54852cd826c41e80c6d80f6db00a85">&quot;file://LICENSE;md5=3D6e54852cd826=
c41e80c6d80f6db00a85&quot;</a><br>
          <br>
          &nbsp;DEPENDS =3D &quot;openssl&quot;<br>
          &nbsp;DEPENDS:append:class-target =3D &quot; qemu-native&quot;<=
br>
          @@ -19,9 +19,7 @@ COMPATIBLE_HOST:powerpc =3D &quot;null&quot;<=
br>
          <br>
          &nbsp;SRC_URI =3D &quot;<a href=3D"https://urldefense.com/v3/__=
http://nodejs.org/dist/v$*7BPV*7D/node-v$*7BPV*7D.tar.xz__;JSUlJQ!!AjveYd=
w8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-Gt=
vN-eKnWtaUipHYjAMRxCfBF8$" rel=3D"noreferrer" target=3D"_blank" moz-do-no=
t-send=3D"true">http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Disable-=
running-gyp-files-for-bundled-deps.patch">file://0001-Disable-running-gyp=
-files-for-bundled-deps.patch</a> \<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0002-In=
stall-both-binaries-and-use-libdir.patch">file://0002-Install-both-binari=
es-and-use-libdir.patch</a> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-txt-l=
ink-freetext" href=3D"file://0004-v8-don-t-override-ARM-CFLAGS.patch">fil=
e://0004-v8-don-t-override-ARM-CFLAGS.patch</a> \<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0005-ad=
d-openssl-legacy-provider-option.patch">file://0005-add-openssl-legacy-pr=
ovider-option.patch</a> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-txt-l=
ink-freetext" href=3D"file://big-endian.patch">file://big-endian.patch</a=
> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-txt-l=
ink-freetext" href=3D"file://mips-less-memory.patch">file://mips-less-mem=
ory.patch</a> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-txt-l=
ink-freetext" href=3D"file://system-c-ares.patch">file://system-c-ares.pa=
tch</a> \<br>
          @@ -29,7 +27,7 @@ SRC_URI =3D &quot;<a href=3D"https://urldefen=
se.com/v3/__http://nodejs.org/dist/v$*7BPV*7D/node-v$*7BPV*7D.tar.xz__;JS=
UlJQ!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfV=
sVaCxBstk-GtvN-eKnWtaUipHYjAMRxCfBF8$" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">http://nodejs.org/dist/v${PV}/node-v${PV}.tar=
.xz</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-mips-Use=
-32bit-cast-for-operand-on-mips32.patch">file://0001-mips-Use-32bit-cast-=
for-operand-on-mips32.patch</a> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
          &nbsp;SRC_URI:append:class-target =3D &quot; \<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt-l=
ink-freetext" href=3D"file://0002-Using-native-binaries.patch">file://000=
2-Using-native-binaries.patch</a> \<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt-l=
ink-freetext" href=3D"file://0001-Using-native-binaries.patch">file://000=
1-Using-native-binaries.patch</a> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
          &nbsp;SRC_URI:append:toolchain-clang:x86 =3D &quot; \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-txt-l=
ink-freetext" href=3D"file://libatomic.patch">file://libatomic.patch</a> =
\<br>
          @@ -37,7 +35,7 @@ SRC_URI:append:toolchain-clang:x86 =3D &quot;=
 \<br>
          &nbsp;SRC_URI:append:toolchain-clang:powerpc64le =3D &quot; \<b=
r>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-ppc64-Do=
-not-use-mminimal-toc-with-clang.patch">file://0001-ppc64-Do-not-use-mmin=
imal-toc-with-clang.patch</a> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
          -SRC_URI[sha256sum] =3D
          &quot;e922e215cc68eb5f94d33e8a0b61e2c863b7731cc8600ab955d3822da=
90ff8d1&quot;<br>
          +SRC_URI[sha256sum] =3D
          &quot;1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4=
d445238&quot;<br>
          <br>
          &nbsp;S =3D &quot;${WORKDIR}/node-v${PV}&quot;<br>
          <br>
          -- <br>
          2.34.1<br>
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#99614): <a href=3D"https://urldefense.com/v=
3/__https://lists.openembedded.org/g/openembedded-devel/message/99614__;!=
!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCx=
Bstk-GtvN-eKnWtaUipHYjAMXpka9ds$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-deve=
l/message/99614</a><br>
          Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/mt/95118333/3617156__;!!AjveYdw8EvQ!bcx80wmigop8E=
oea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMK7=
q4q3U$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://lists.openembedded.org/mt/95118333/3617156</a><br>
          Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists=
.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembedde=
d-devel+owner@lists.openembedded.org</a><br>
          Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lis=
ts.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!bcx80wmigo=
p8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjA=
MM4Y3D7g$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://lists.openembedded.org/g/openembedded-devel/unsub</a>
          [<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Martin.Jansa@gmail=
.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------P3mszWZdo4rl3fCtdHLtKIZY--

