Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA35C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 15:08:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45586.1670857719324185248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Dec 2022 07:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=rMTgar1l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9345c419cd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCCEhxX016647
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 15:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=3IQyPqH5g4kn3cRw3sRK83SXid5ZQoRb5o6iIiOAc0M=;
 b=rMTgar1lsoUYrR9HpkgHk5yXedFhmfPd/zgtM9wPVysDL8LEwNsW82LHQVn+j/CC/g6v
 EMh3WAvaCXjdo3YwPZu54Uv3TEUVj0xVtK/RnRq4AGQ5Ts+lPEut5+QD0ZjmqTgEScAH
 DekvsVTbHVISJlonvgyLLmjgW03f9LZM82fdp2zEx1DTFx6l6DE3c8ktd/RcksXjYctZ
 /ZUE3DSPgnnzWyOBbHo31SSQ5IXG3x10QzEMKxgrWNtmrmXDoa1BYyD8Q3cGYKmeXoYF
 iq88iO5Ws6a7zovybHM2jL7Ze3UaxExrDYS0qCxZGSYk/M0qMUaFYdFHmVHXFY6Qvip8 Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3me1v7g6g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 15:08:38 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCF3h6g018408
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 15:08:37 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3me1v7g6fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 15:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fxn7R2lG8iqEvHXEnKUo8POLMxtkVJF1KeRKM8Edigct9LMEHEOwtUs3YMDLwyMTr0HxBD361AgHrYSVC2OijQ7YKv5yfj8j6ca7y0qO+gVYAlubE+OBFkW+TJeUTOJ1ki8VM7Uo7EU0JxvKAok4F88lqBHpxTurQCOpCAIJw7bsb92pkA9lrR8lNlM7uK0gRFieNHieXdGr/TPKO+e4oy2R7Gtib+qgA4XYnV/l13w4NY+gkMsyI12nXQAbsXDYFA95w8eszmYX+5O6c0OdIMNrXIIygXq3agw8Nw0b3FhLUqQXPcQNTy7VlqgH3x3nmBN12CLWTiVHx/5z+jAMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IQyPqH5g4kn3cRw3sRK83SXid5ZQoRb5o6iIiOAc0M=;
 b=K1mS3QHFEwZKg/FIWDJHOWwbsPwQe+rgDbFe7ZqDeJ2v79KGoqfIp4/X7KaCBGuuVY+eeIjBocDw32qbkjpGQaVevF280rCCkgPSOWCVkaUrmqJn8eA8Brb1Fsxrz7aRcFP0JJSKsntdkebJrttN2i0scmRuuhKpSe7n9Da+7BBiejJSKu9lNzyrCyDrIjuWFLyqA5Fhe3YHPfjjk425DSK3MYbTgfs4Mv4vC7t8TddHiBrTXignKgLKf88S1lymk8nMlzufkP1+Wj9O4Qa0Guz4ZqrQf0H4hJIM1H698/lAPGKLH7ufhHmyBhXUsHXyAIZQj9uOPeq8XH2t79knyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA0PR11MB4557.namprd11.prod.outlook.com (2603:10b6:806:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 15:08:33 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 15:08:33 +0000
Content-Type: multipart/alternative;
 boundary="------------R6lija5OMUYVlJLpgiKtSZRK"
Message-ID: <b3a9f05f-ed25-9846-58f2-a5e0924ace96@windriver.com>
Date: Mon, 12 Dec 2022 10:08:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs - Upgrade to 16.18.1
Content-Language: en-CA
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "Polampalli, Archana" <archana.polampalli@windriver.com>,
        Armin Kuster <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com
References: <20221118182718.2548901-1-archana.polampalli@windriver.com>
 <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com>
 <f0a3b575-dfc2-829f-6100-9e1eaedf0be5@windriver.com>
 <CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com>
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA0PR11MB4557:EE_
X-MS-Office365-Filtering-Correlation-Id: 14df42e6-a6d2-4489-c650-08dadc52bc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ojw9mWAo3F4essd582qq3Y15CO+BICkW+N1XlxucZSFi8xw63aSUXsFRD3LagQomfOGwf7dRs4ayDWfMRoa1cCZXNPRW16eDywjlqPij5QNNGeiSP+39xQT/uT3XXYDXnbECe2VpLzgTMKhrkyvOWPxi9bKaMYKYrNXA9hAvtSUiok6Aow3bTBYGh5YC89Ovhtw5QtwG2Yit/CzIok5BwqVcNhIzj3chA+BWvUQkt6Tk2AnCb1a/c78CYWly4eeeVQK6iY2zf5CF5GoCNryzPPgvsVcRkZi/D64bu1HphukNYnP/JMuw4vvgg1CNyzvo2qzkn2IzLjY8XgGfTmepzdMsFsfC7FmgQ+XYUNvhDTl0QZmE8akYD+9sR6cFivNbA0Nr/ahVhMPx641EHv6YYk3rCdVQNYM0iT0NOkjRkGErkXJIYg/w234K5XYSudL31Vao256tWAwmRLE5QQ1WG9KVD02Ph4FdEb+Y96aPeRFJ3pFm5iwVSFH0RUeh82Xn3CJTq4X1t8sgvR2wosdQEDo13Csa30QCKCGlW00Y/52H1J7hrlDIGkf9o/MNozYrx4FZ4NPZCRyLEWLQHmSyz2nAO9tOBxcUC26f5i874Ckrh/uUB3dUfSHsJFoeCs0fNAgLuGjlSxiIoSgo2/yrIamXPpwZ/hNjUgeQx+sIuz+4RZtrXvQBzBHpceSLBFHSOsl81bxCiXBpWZOCNPojvUqo19A6NV/yoBdhYUeWbsjHi3kXAcb0kxfOQhRJAVdOUSucPKvZQAYRrOJRGVQ4eiYrdDVjAKhWVuyve1Uao9Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(366004)(376002)(136003)(346002)(451199015)(83380400001)(86362001)(31696002)(38100700002)(2906002)(8676002)(166002)(66556008)(66476007)(6916009)(316002)(4001150100001)(54906003)(66946007)(4326008)(5660300002)(478600001)(2616005)(8936002)(41300700001)(186003)(6512007)(6486002)(26005)(6506007)(6666004)(33964004)(53546011)(966005)(107886003)(66899015)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2NZT0ZsMlBVY2NVRTRpT0NEZkN0NjM4dnJqS3I2WHBTc3pwMGJsZngyNEZQ?=
 =?utf-8?B?Qkk3TGl4aElJK2dnaWExMUljbTZuVkI0akxyMEpEVVF1L1JDSlFvaXJyYWJF?=
 =?utf-8?B?ZStvZEgxTkVieGtFTC9pS1BHcmJtSDJpTlNucnlUczR2ZFRkcWpvTUU3MGVl?=
 =?utf-8?B?VERVSkVvMWFlZ1JwV0tEY29XY2oxRDdLemtOa1hVN3hraWhWckdUQVMzbXg5?=
 =?utf-8?B?NWNZRHFQdk1LenNmWG5iUkJkSEt2bys3ZXJFUjg1ZE1hSFdJd2kwUFYyMFZt?=
 =?utf-8?B?eEZEcUw2YzVQY3JsUFVzdDZ2TGYzSmpQdG96MWRkZWRPaEJJK0cxTU9Zcnd0?=
 =?utf-8?B?UTRFZjNkMkd6Wkwvc21XUS84SklEMWM2WDl3bGdqUk5LdDc4ZDhRNEhFQXBj?=
 =?utf-8?B?UmtUdWFHaEk5UW93bklaOTYvMHVsNUcxRkxVbDdYaEpjcVBjbnJML1o0eEVD?=
 =?utf-8?B?THZJOCtJOXVyMVZkeVYxVWNkdXRXcmFGK3l4aThCUlVhYVpUUlBCZ0hQTGpF?=
 =?utf-8?B?ZUtZQ0k1NWljeTNVYVoxWlhlYnJMVm9NM0wvVUFHbEhmZGlNajZnY3ZUdVor?=
 =?utf-8?B?WUlPZVZKUkdaU0x3cEc4cmxDbEdzUTY2WS9HWjI2ajdsQ096eWFBWUZSUW1B?=
 =?utf-8?B?NzNiQUNSRE1mZTJlVGw0cXRwbUNmaHZqZ0pCakdwUysydGE5SU9BYWZROEtC?=
 =?utf-8?B?aGY5YTJBZUxoVGwwQ2wyWm5ja1A4aWtaZllacW4xcllZbThzbldiaUFFMmtB?=
 =?utf-8?B?TXNkTkxLc2IyelBaODRMWHRYdVpHK0VFWTlreFdXSTVPWEpvYnVGeHJDYkdR?=
 =?utf-8?B?UHFrRnRLNXQ1TXloTXlzYUNwNUxWWnM0NDFUN0RHeHZYN1plNVlxMTNyMk1u?=
 =?utf-8?B?ekFha01DQTNUQ2xhbnhTNE9WWDR2c0VTa2VMUmFsbjRGOHgrMWFsYmFFYUtq?=
 =?utf-8?B?bmJiay9WSGIySVpGcXlObVVGYTlObTNzOUJKUCtvaDJyWUhBM2kwOWl6RFdP?=
 =?utf-8?B?STVValQ0dm8zbG0xR2JLWlBOMFZZYVdzanBHTTVLY2ViSVFqb2Y1Mk0reEZX?=
 =?utf-8?B?ekFZUnhYUUpWOFVXNHN0UHRpSm1IQmNvSjRnYWlxd0RLOGpjY2VjVU4vbmxF?=
 =?utf-8?B?dmVXZ2JidUVVMFc2aU1tNFJOYlNYZkg1VDEzYWsyWkpwSGdGQ1hGQ3ZENFFw?=
 =?utf-8?B?OVoyZC9IeU5XU0VhVU1CVjNQSG1sMmswWGlNYkkwRHI4TFIzQU8yODdOazNy?=
 =?utf-8?B?cDlESG1GZWlOSFNHQmJabnk4cXRnZHpTdkR0WHJXNzZ2WS8rdHJkZkxRWG5C?=
 =?utf-8?B?ZmoyZkJSVVNWU2x5aHdxVUJFOGwzSk5tZUpTWVFDc1c3TzJ4VGlac0dvdHEw?=
 =?utf-8?B?Q0JFSktJa1lKYk9zTVdrYkdGUTEwL0Q1cjdWMkxJRHlnQnVDaWs4Q2svNHJy?=
 =?utf-8?B?dHB0UUl1U0xDZnE3OEVpVitiUU1kQWhjTXRPbkYxd1RPbWZqbVN5S0dONXYy?=
 =?utf-8?B?SS9SNEZqWHZZZWtrSFI0U0JQZW92T3dvRkRYYmMyUWZRL3VzODVCaXl0MzBa?=
 =?utf-8?B?SUFPd29ZZG83QkIvZWlQZVNkUE44NEhFYkh5dGZaeWRQMDVRQnJtK1Uzb050?=
 =?utf-8?B?S3hhRW1CS0tvOGE5TzYwajVDdThsYUF6ZURucTNkMEN4ZVhLcTk3Z3pramoy?=
 =?utf-8?B?NEw1aGdRUWJQcHRSZlIxRHRabHErVDUyeTBKOWNqeWNvZTB2VHhLWkZ0d1NW?=
 =?utf-8?B?alZCdlY4cFlOMTFydEFhMkYvRXJOWHliNlJ0dnZKT2hzS3owUXpqQkVTdE1L?=
 =?utf-8?B?QkdsVzhjOGVsYTRCUVlib1oyM3Q5Wkw3V2tZREFXSktRdFBYNlZySHBMN2Fu?=
 =?utf-8?B?aC9wVUdtZUVPWU8zcEMrN1M2KzFlcE0rQmZxR293YjJtTWR6MS9RaXQ0dTg0?=
 =?utf-8?B?MnpOMjFROUJIQmozNE5qMjRFSXhONEVWazRQcnBRbUtlUmFHSStveTJZZDNk?=
 =?utf-8?B?dllYU3B2R0xsSE1KN1FCL04vekJndEVLY1dHVEFjSkpjbzRkbG5OZzBKajd1?=
 =?utf-8?B?U2RGeElKb3Vwbm1HbVFMcGNCaHBBS3FWRU1nODJZWUx3WUpwa24zYThqZlJM?=
 =?utf-8?B?eThHVUtSb0xtYnk4M2hBb1BDeU5VZ00zc0hQOUVyTTB2VXRZbGNkR3VmQXp0?=
 =?utf-8?B?WEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14df42e6-a6d2-4489-c650-08dadc52bc4a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 15:08:33.4542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCkrQAONP08GN1mioMXHChW3j+tTJqEXaKgVFZjcN0DThDyg+r9W2i7b5Fyqcwsi57dU3r5pTg7Sq6Un9Jr1o9zDkTZz+AeNvyUPGSfTxz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4557
X-Proofpoint-ORIG-GUID: QFvbslAiEtLksgQ1dYQP4Utj1t4N7eWN
X-Proofpoint-GUID: 0xIFxSvoIqcNItQC7wDu-HpJbstmlFPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120138
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 15:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100061

--------------R6lija5OMUYVlJLpgiKtSZRK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BCCEhxX016647

On 2022-11-24 14:18, Martin Jansa wrote:
> On Thu, Nov 24, 2022 at 7:06 PM Randy MacLeod=20
> <randy.macleod@windriver.com> wrote:
>
>     Add Armin to ensure he seems this once he recovers from US
>     Thanksgiving indulgences.
>
>     On 2022-11-24 12:05, Martin Jansa wrote:
>>     I see this is now queued in kirkstone-next
>>     https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirksto=
ne-next&id=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f
>>     <https://urldefense.com/v3/__https://git.openembedded.org/meta-ope=
nembedded/commit/?h=3Dkirkstone-next&id=3D08b6b6846a84d9a0459f42d1d730c9e=
a1d50c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw=
5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyDWE$>
>>
>>     I see bunch of recipes failing since this upgrade landed in
>>     master, mostly due to npm dependency resolution being more strict
>>     now and builds failing with
>>
>>     npm ERR! code ERESOLVE
>>     npm ERR! ERESOLVE could not resolve
>>     ...
>>     npm ERR! Fix the upstream dependency conflict, or retry
>>     npm ERR! this command with --force, or --legacy-peer-deps
>>     npm ERR! to accept an incorrect (and potentially broken)
>>     dependency resolution.
>>
>>     Can we please delay backporting to kirkstone and langdale a bit mo=
re?
>
>     Seconded!
>
>     What recipes encounters this bug?
>
>
> I've seen it in ~10 recipes, but all are internal and not available in=20
> any public layer. I've added --force to them as work around to see how=20
> many other recipes will start failing now.
>
> There is one more failing from public layer:
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipe=
s-webos/localization-tool/localization-tool-native.bb=20
> <https://urldefense.com/v3/__https://github.com/webosose/meta-webosose/=
blob/master/meta-webos/recipes-webos/localization-tool/localization-tool-=
native.bb__;!!AjveYdw8EvQ!fVXXP6WGpCWaykh_uWoklqQArJCJQ7A5_YHNHIuOJVZwFc5=
36QpaNTNkS-6VpmURy5ZCL16s1QAAg5Wsei1dqCoqFPA$>
> but that's different issue, caused by the=C2=A0sysroot_stage_all:append=
()=20
> and new nodejs now installing=C2=A0node_gyp_bins with symlink to python=
3=20
> causing:
>
> ERROR: localization-tool-native-1.7.0-r7 do_populate_sysroot: sstate=20
> found an absolute path symlink=20
> /OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/sysroot-destdir=
/OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/recipe-sysroot-na=
tive/opt/js-loctool/node_modules/node-expat/build/node_gyp_bins/python3=20
> pointing at /OE/hosttools/python3. Please replace this with a relative=20
> link.
>
> But I haven't narrowed it down yet to see which exact nodejs/npm=20
> change caused this. And yes this recipe has other issues as well and=20
> doesn't even use npm.bbclass nor npmsw:// fetcher.
>
>>
>>     And if others are seeing similar failures please share them here
>>     as well.
>>
>>     The older nodejs was using npm@8.5.0, now its npm@8.19.2 more
>>     details about this change in behavior from 8.6.0 in
>>     https://github.com/npm/cli/issues/4998
>>     <https://urldefense.com/v3/__https://github.com/npm/cli/issues/499=
8__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfV=
sVaCxBstk-GtvN-eKnWtaUipHYjAMZmTsAyk$>
>
>
>     Someone in the linked issue thread said:
>
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "We rolled back to Node v16.15=
.0, which has a working
>     version of npm 8.5.5."
>
>     Should we drop the 16.18.x update and stick with 16.15.1 for
>     kirkstone/langdale?
>
>
> I don't mind keeping it in master, once I figure out how to fix it in=20
> master I wouldn't mind it getting backported to kirkstone and langdale=20
> as well.
>
> This was just warning that this isn't just simple minor upgrade for=20
> some and at least some longer delay would be useful.
>
>
>     For master, I'd like to update to 18, 19, or ideally 20 if it's
>     available before the end of M3.
>
>     Martin,
>
>     What version of node make sense to you for master?
>
>
> I don't have strong opinion, we have a lot of ugly npm/nodejs recipes=20
> in webOS which need to be re-worked first, independently on nodejs=20
> version used.
>
>     Do you agree that we should leave master on 16.18.x and people
>     should fix their
>     'broken' npm dependencies?
>
>
> Yes, from that npm bug it looks, that the old behavior was even worse=20
> than the current clear failure and the --force as work around seems to=20
> work reasonably well, so I don't mind keeping it in master and even=20
> eventually backporting it to kirkstone a bit later.


How about 2 weeks later?

We need to either backport a patch or update to 16.18.1 to fix=20
CVE-2022-35255

$ git log --oneline -1 a54283a6387
a54283a638 crypto: fix weak randomness in WebCrypto keygen

$ git branch -a --contains a54283a6387
* v16.x
 =C2=A0 remotes/origin/backport-avoid-prototype-pollution
 =C2=A0 remotes/origin/v16.19.0-proposal
 =C2=A0 remotes/origin/v16.x
 =C2=A0 remotes/origin/v16.x-staging

$ git tag --contains a54283a6387
v16.17.1
v16.18.0
v16.18.1


My vote is to upgrade since people have had some time to fix their=20
dependencies.

../Randy


>
> Cheers,


--=20
# Randy MacLeod
# Wind River Linux

--------------R6lija5OMUYVlJLpgiKtSZRK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-11-24 14:18, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">On Thu, Nov 24, 2022 at 7:06 PM Randy MacLeod
          &lt;<a href="mailto:randy.macleod@windriver.com" moz-do-not-send="true" class="moz-txt-link-freetext">randy.macleod@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <div>Add Armin to ensure he seems this once he recovers
                from US Thanksgiving indulgences.</div>
              <div><br>
              </div>
              <div>On 2022-11-24 12:05, Martin Jansa wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div>I see this is now queued in kirkstone-next</div>
                  <div><a href="https://urldefense.com/v3/__https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&amp;id=08b6b6846a84d9a0459f42d1d730c9ea1d50c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyDWE$" target="_blank" moz-do-not-send="true">https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&amp;id=08b6b6846a84d9a0459f42d1d730c9ea1d50c43f</a><br>
                  </div>
                  <div><br>
                  </div>
                  I see bunch of recipes failing since this upgrade
                  landed in master, mostly due to npm dependency
                  resolution being more strict now and builds failing
                  with
                  <div><br>
                  </div>
                  <div>npm ERR! code ERESOLVE<br>
                    npm ERR! ERESOLVE could not resolve<br>
                  </div>
                  <div>...</div>
                  <div>npm ERR! Fix the upstream dependency conflict, or
                    retry<br>
                    npm ERR! this command with --force, or
                    --legacy-peer-deps<br>
                    npm ERR! to accept an incorrect (and potentially
                    broken) dependency resolution.<br>
                  </div>
                  <div><br>
                  </div>
                  <div>Can we please delay backporting to kirkstone and
                    langdale a bit more?</div>
                </div>
              </blockquote>
              <p>Seconded!</p>
              <p>What recipes encounters this bug?<br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>I've seen it in ~10 recipes, but all are internal and not
            available in any public layer. I've added --force to them as
            work around to see how many other recipes will start failing
            now.</div>
          <div><br>
          </div>
          <div>There is one more failing from public layer:</div>
          <div><a href="https://urldefense.com/v3/__https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-webos/localization-tool/localization-tool-native.bb__;!!AjveYdw8EvQ!fVXXP6WGpCWaykh_uWoklqQArJCJQ7A5_YHNHIuOJVZwFc536QpaNTNkS-6VpmURy5ZCL16s1QAAg5Wsei1dqCoqFPA$" moz-do-not-send="true">https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-webos/localization-tool/localization-tool-native.bb</a><br>
          </div>
          <div>but that's different issue, caused by
            the&nbsp;sysroot_stage_all:append() and new nodejs now
            installing&nbsp;node_gyp_bins with symlink to python3 causing:</div>
          <div><br class="gmail-Apple-interchange-newline">
            <span style="color:rgb(0,0,0);font-family:Roboto,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px;white-space:pre-wrap">ERROR: localization-tool-native-1.7.0-r7 do_populate_sysroot: sstate found an absolute path symlink /OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/sysroot-destdir/OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/recipe-sysroot-native/opt/js-loctool/node_modules/node-expat/build/node_gyp_bins/python3 pointing at /OE/hosttools/python3. Please replace this with a relative link.</span><br>
          </div>
          <div><br>
          </div>
          <div>But I haven't narrowed it down yet to see which exact
            nodejs/npm change caused this. And yes this recipe has other
            issues as well and doesn't even use npm.bbclass nor npmsw://
            fetcher.</div>
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div><br>
                  </div>
                  <div>And if others are seeing similar failures please
                    share them here as well.</div>
                  <div><br>
                  </div>
                  <div>The older nodejs was using&nbsp;<a href="mailto:npm@8.5.0" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">npm@8.5.0</a>, now
                    its <a href="mailto:npm@8.19.2" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">npm@8.19.2</a> more
                    details about this change in behavior from 8.6.0 in&nbsp;<a href="https://urldefense.com/v3/__https://github.com/npm/cli/issues/4998__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMZmTsAyk$" target="_blank" moz-do-not-send="true">https://github.com/npm/cli/issues/4998</a></div>
                </div>
              </blockquote>
              <p><br>
              </p>
              <p>Someone in the linked issue thread said:<br>
              </p>
              <p dir="auto">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;We rolled back to Node v16.15.0,
                which has a working version of npm 8.5.5.&quot;</p>
              <p dir="auto">Should we drop the 16.18.x update and stick
                with 16.15.1 for kirkstone/langdale?</p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>I don't mind keeping it in master, once I figure out how
            to fix it in master I wouldn't mind it getting backported to
            kirkstone and langdale as well.</div>
          <div><br>
          </div>
          <div>This was just warning that this isn't just simple minor
            upgrade for some and at least some longer delay would be
            useful.</div>
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p dir="auto"><br>
              </p>
              <p dir="auto">For master, I'd like to update to 18, 19, or
                ideally 20 if it's available before the end of M3.<br>
              </p>
              <p dir="auto">Martin,<br>
              </p>
              <p dir="auto">What version of node make sense to you for
                master?<br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>I don't have strong opinion, we have a lot of ugly
            npm/nodejs recipes in webOS which need to be re-worked
            first, independently on nodejs version used.&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p dir="auto"> Do you agree that we should leave master on
                16.18.x and people should fix their <br>
                'broken' npm dependencies?<br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Yes, from that npm bug it looks, that the old behavior
            was even worse than the current clear failure and the
            --force as work around seems to work reasonably well, so I
            don't mind keeping it in master and even eventually
            backporting it to kirkstone a bit later.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>How about 2 weeks later? <br>
      <br>
      We need to either backport a patch or update to 16.18.1 to fix
      CVE-2022-35255</p>
    <pre class="noformat panel">$ git log --oneline -1 a54283a6387
a54283a638 crypto: fix weak randomness in WebCrypto keygen

$ git branch -a --contains a54283a6387
* v16.x
&nbsp; remotes/origin/backport-avoid-prototype-pollution
&nbsp; remotes/origin/v16.19.0-proposal
&nbsp; remotes/origin/v16.x
&nbsp; remotes/origin/v16.x-staging

$ git tag --contains a54283a6387
v16.17.1
v16.18.0
v16.18.1</pre>
    <p></p>
    <p><br>
    </p>
    <p>My vote is to upgrade since people have had some time to fix
      their dependencies.</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Cheers,</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------R6lija5OMUYVlJLpgiKtSZRK--

