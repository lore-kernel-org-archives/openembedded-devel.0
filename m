Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1BEC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 02:25:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.81365.1677464744780961883
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Feb 2023 18:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=SpBf2/Za;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=142213231d=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R1tCxn027312
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 02:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=sJXEEU1U4Yks5ZoDes8a+1S1Si8wXtluPCxZGhPjAn8=;
 b=SpBf2/ZaNd7Np0Omhmi8sqlT2ZH/CvZtmWuddnAUAcdz8rY3b1oz2HuJGBDPxQ2PPXC4
 vL1tL3wPXD+cTchAVjwOExypcvjC5kvDmiwzblyGX7rEgLf4w68KmfZ23ZQEm9K+MXDG
 ya7nIHszc11r5AFAztuwe53+QrfN1uZuqOui7Wu/2FaTHDeVqhyyfbptPeSImhpRElM/
 F4254sUVMHUpVQB1vrHJXfXe+2iKQW3UOMkT63ZXC5+K7FK895iXH7Gt+Whttm8kpyoX
 qZIMKs1Rv6YySrT/6SNAkIQGQnTatUZl64pRqs4L5v3NEYmiVyIDtUAGqNvf1yo4yHx1 pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwhfh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 02:25:43 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31R2Php8020537
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 02:25:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwhfgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 02:25:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcGEIlISiGPNC/9z65D/f+aTOkH/WwTwr/PYxaNkyR4Y4K53dwblAdhSG38jm/WJH+XUGI9oVIYistAViCaTrqYpwaWLDk5+PnaPWjaTrg8b0j0Dk4TshwkK8aeLiMxwzvdzFI2tar/kf928LLduvhBkAh+Y6KKbK7HbX5qVjKzRsgVjOeywyiQ1XLwLtmqwDk7qO6xBCuRtZAiqfDZKBDEPqr5JYLiMS8BV45pg1Iomt1sJPJLASyB2vB5QzGV4CGRayW4cjSgBCOZLYA0CnSOrZuHfGfj4YjuqW7fz7u/L3h3N8FpO/3EqD0WgevInY+Ek/OgFNqeOO0BYZyu10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJXEEU1U4Yks5ZoDes8a+1S1Si8wXtluPCxZGhPjAn8=;
 b=A7DDltMuYRi6wX9DtpzGUAPmoJUHJe6IkdO7zZHRqhPDaphM6QcaJF+j/JKRzs2ZBw/niUM+XR46VSvimyxnVAXb9Mw2EDTcAvFofdDrmatLuGFi6ze3BcMRp9Dc6byDJz+++5XOsjBbtHpPnVwFE05F6pZohCHhK4dkOCJWmAB2FZFExGplx87n00vsv+CaAlKNF4OWzc7WpGxsLPzzZzgbQhoPJmpG4v0QVlM7aV8FgzQjgPhaWXNnKbhG9gXiZyrr2TrgidGy3vUj6Bi8WuQbxfwqa1RC50UiKzBxSG90lKETwC4N81GRSz185mSx2lIMwKTB5/EoDoG3MdwX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 02:25:39 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545%7]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 02:25:39 +0000
Message-ID: <615c3b41-8d2c-e761-6e23-e03cca4923b0@windriver.com>
Date: Mon, 27 Feb 2023 10:25:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [kirkstone][meta-oe][PATCH V2] liblockfile: fix do_install
 failure when ldconfig is not installed
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20230224043904.3306228-1-changqing.li@windriver.com>
 <3e87d1a1-b6fa-808e-8511-17d203be0a52@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <3e87d1a1-b6fa-808e-8511-17d203be0a52@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PH0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::14) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef663b5-99c4-4286-421d-08db1869ea8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mu8HFyUxc7YZ8HFeAl6nkHWTg46V3henM/PPXnYegqJy+yDo1ptVqZSN7/ybXqPnCllYVC7DvShQPFhUemK+L0DrWAXdLE2p8jbQdI0pqBxnbky7/roQaoQZp90l6rp29DCBeIoUn5PPhlqh8sBGr/iNvg3R+awC01PUam60zSG+HXXBpI61n1avpPwjd8f5jX02/cQYS3fHQXGykTyMZlRHmYoVAw0Z6RwjCHh8qAuKeWzWa4udkVC6AJIIXXPlQ1K4ZlvMfBBk8KvdUhyfehREkAxoQ4XFj++Qd6q3zNd5MrtNmkZ18CgmAgpiOAxp74gooGHOSgla9Lki1/yOSaQ5IYW/HG3M3nwIKKuuNtGapbafYuNItek8o20UDuF5wY+A5Xce6wXe/Vf9sEm7ExZJpcrcvC7OmcN2rOWAjKt7oox9XnYVyj7fEZrZ8VpweSdAy64Merpm8/HLMI6dK/TbnplDJD371YTKyYY7wIy1+jxqad2bSRWTYn1bfeyeYT3fo+nBvxpZ9EDjruPzwaksPoQDNi9+RRbiCZBWqZFnnIfdQ6KZqO0y2ELePQhDy3h6g8GFIKloXtKz8pLvVel5x/oA519hJzw6UJHhi07u42Fc6woWpZfC1JqtaGpMzvOhDY+/rcYmt6dEo2OjRbPWTkfj/NfRF5PCO/932JZqIC44eWqFaOQmoTCGA4B6hCU3rK064tB1q2FuKYqml0WwIcYy9CiMNwzJieAxehyFsS76PItiyCOKxUtTwPet
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(451199018)(110136005)(316002)(966005)(31696002)(36756003)(86362001)(66899018)(31686004)(6486002)(2906002)(44832011)(6512007)(5660300002)(186003)(8936002)(66946007)(41300700001)(8676002)(66476007)(66556008)(6666004)(478600001)(53546011)(2616005)(26005)(6506007)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1diSy9hQnowMHFUMmFkaDJIK2Roc3JOUVU2bmJBMU9KSytieXhvOGRTQ1lR?=
 =?utf-8?B?MXZxbWRFbUgrVVlPSUpFN2x5TDZ1MFV1ZUd2ZTJnWlNpeFBOYVMxN1UzajI3?=
 =?utf-8?B?YzlpTjFNU0xOUENzRDVRZHBRdTg0aC9FOE5pUVlXendSYzNTZXFNZjd4Unp4?=
 =?utf-8?B?eWxTYjEyNTl6U2RiTW9OdDBQcko4dlphTnJtRml6UG4xSkRTRU16MXhhdzNH?=
 =?utf-8?B?amkzbnMxQ2dla3VQM2VZdEpPcmt3R2pDNmoxa0lTbkZQeUdBTERRbHFQZnhu?=
 =?utf-8?B?dmk4eFlLREsrQkdKY3lhdENadWxEMUdLUmI0NFI1K2pLR3NNOWVDN29KbE9U?=
 =?utf-8?B?dFJ4UWduck1vdlZGVkUrUDgyalpZaSszTTFHSmdRL0JHVjNpYXFIYzJyWGlo?=
 =?utf-8?B?VjRNYnF2YWNCcm1GOXY1bjZ4KzZpOGZja2ZtMVpsVm5sMnNXczh6Rm1WOW0y?=
 =?utf-8?B?d0I2UStHSy9CanZMV2NqQ1ZTQUY4dk4zN25SSFprUkc5a1BDaFNEMzlLbld6?=
 =?utf-8?B?eXcrNnIvaFNLWUpkWUdSTUtQYjRnVi9tbENBWlNBKzRMRUdIdmlzSk1ONXhm?=
 =?utf-8?B?bllqdlVNZWd4djVSelIzVUpNNUhzNUJWYmhqU09rVWRzT09Yck9FTmQ3cVk2?=
 =?utf-8?B?cTk2TlB3RHZGejRyU2hZNXIvcTZxSlViNDBPd1VnQ1B2UWZzVFBSaWxKMm56?=
 =?utf-8?B?d0gxYkNTUURwNStOdTg4YmM0ajN4YkI5V28rRkxQNGJoT1VrUmxvZEtOTGhX?=
 =?utf-8?B?WUpIMHV0RTF3QXc5aGc5Qm00dU9LM1lON24rZnBSZVp6UURQZ3ZVUHlLSmtT?=
 =?utf-8?B?ZXdWUGxTcWxDcEd5OTRNVmVKb3JFMGYzdG1iMFVIMUZQTzJjMzNuaVJ0b0dw?=
 =?utf-8?B?aUhEdHFQWEY2dk9aRFd1Y3FHYXNhUENhUlAvYTJubzFOSUg4ajJzUW5nZ0Iz?=
 =?utf-8?B?OG1oM1VyUzhhbWVZUnJ3TmxkeWdJVjFGdUV0WDBpeU5ZSXlwRUhrc0MvdmN6?=
 =?utf-8?B?VmF3MDNIV2ZQb1JXb0JVclZqM2dtRDVQNHVXL2FnMkltQ1FQU2QvcHNJa3Fh?=
 =?utf-8?B?UzUwOEtPKzhSeXYzVFc1OWR6VllNYmRMVVU0RFl6TUplcWZsa25nVE5kTE1w?=
 =?utf-8?B?MDhpTjRKNWxDV0ViQXJ2d2IzOHZJMXRYNjNvOWM5d0VqREtnU1RkNkIrS1dr?=
 =?utf-8?B?TUE1WG04bUFZSi9nYlZCc1RyeS95YmJ1ay9NcHZqRHF0aGVPU1JFVzdvUTV5?=
 =?utf-8?B?RGhZNWJ6Tk96M1hIeXdleXJUREYxa3ZjSTIzV1RrYlRGVnQ1aDJxUWRnVGZG?=
 =?utf-8?B?NitLb0IzQVlxNHBpUWdZOW9PVGFuMkpkYXVsa2tiMk9PajRBczkrV0RsR1V1?=
 =?utf-8?B?ZjQyQWt6Z0hJa3hpakxsYjQ4bTJxaFk1REEwdUFqS0YvZDloQmlnbTMyOFBT?=
 =?utf-8?B?Rzc0SWRWUVY3N2VPTHdUMWJZQnAzWmdXeXl2a1F3K2JxUEVoV1FNNGRjS3pu?=
 =?utf-8?B?NFBxSS93SlQra3lpVTdya3B1dHhHbEdDNFVaN0FsNVdEdHAyWmlGOEVqOUpu?=
 =?utf-8?B?Zm0vZW15Q2lMRlVxYkN1TytnbENaM3p0UHYrNE42cWw4UndjK3FsblFiSWFu?=
 =?utf-8?B?K21BMWhXcTV3N1lBUDNyallxS1FhU1FlREdLVlpoLzRxeWVnSjJhVjQyaVhl?=
 =?utf-8?B?djk2MTdFWDVoWDZUOTIyUXZETlZGQnBiOTgzVDU3WVQ0RnFRQ0lET1RpRlNM?=
 =?utf-8?B?S25UeWIzc3ZBc2VUT2ZXZjhzM1NQS1JET1VwUG9pQmUzamNHZHY0dTIzM09x?=
 =?utf-8?B?MVA5aHpVeG02Wk1sZjUxUExLWVJzeHZYTUJONnNBOUpkSWRYN2h4V3VLamdp?=
 =?utf-8?B?SW5MNWxWVkhmcGJVSktZbTRGL2kvRlNEMTQ1Y1NKQVlKSHBXSVhqaTRoYkJy?=
 =?utf-8?B?aUhLN1Vnd0IyUTgyZ3E5d3RCTHlUN2hIMHlaeGdCVXhobFFWN3RuMiswd2xQ?=
 =?utf-8?B?VmVnVUtBbVRubUwzcTNCVzV6bEVlb2J6VktSM3IzM2pGbVBGUzVuS1J6c2cz?=
 =?utf-8?B?RVIrUFUvQXFpNGhGZlI3dVRVRTdrVnZVSFFXemJjR3FEamVhb1A5SFNSVDIx?=
 =?utf-8?B?dGVaelUzTEdSc2o4YUw3S1IxSkswY2RwWWVJNVA3bHVyZjd6SVVwTW1YTHp1?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef663b5-99c4-4286-421d-08db1869ea8b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 02:25:39.0872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF7n3yy4tzyJinC+X29ERnMkn7oTzhUegaF9t04/AqpwZIZvtOJFObd5LUGijeTN3XjWJDa2siYHcyqCDx7HIPKqiP0XWevr/NUzlH2Toac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
X-Proofpoint-ORIG-GUID: 3eOMetlHk6w6nH-WlwJmkpu_rNtAe_eo
X-Proofpoint-GUID: 58A3GosOMSkwazTy9nk99i8hZeQ7q0Pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270016
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31R1tCxn027312
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 02:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101260


On 2/26/23 01:19, akuster808 wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> whats in V2?

In V2, I changed to a better solution and upstream it.

https://github.com/miquels/liblockfile/pull/21

Regards

Sandy

>
> -armin
>
> On 2/23/23 11:39 PM, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> liblockfile do_install task will fail since syntax error when ldconfig
>> is not installed on the host.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>> =C2=A0 ...install-failure-on-host-without-ldco.patch | 62 ++++++++++++=
+++++++
>> =C2=A0 .../liblockfile/liblockfile_1.14.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 2 files changed, 63 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-=
install-failure-on-host-without-ldco.patch
>>
>> diff --git=20
>> a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fi=
x-install-failure-on-host-without-ldco.patch=20
>> b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fi=
x-install-failure-on-host-without-ldco.patch=20
>>
>> new file mode 100644
>> index 000000000..5103f910d
>> --- /dev/null
>> +++=20
>> b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fi=
x-install-failure-on-host-without-ldco.patch
>> @@ -0,0 +1,62 @@
>> +From 0f78a746fee8553082c73beb2217d08fc5aaaa83 Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Fri, 24 Feb 2023 02:57:35 +0000
>> +Subject: [PATCH] Makefile.in: fix install failure on host without=20
>> ldconfig
>> +
>> +* fix syntax error when ldconfig is not installed on host
>> +
>> +when ldconfig is not installed on the build host, install will=20
>> failed with
>> +error:
>> +ln -sf nfslock.so.0.1=20
>> /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/l=
ib64/nfslock.so.0
>> +install -m 644 lockfile.h maillock.h=20
>> /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/i=
nclude
>> +if test=20
>> "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" =3D=
=20
>> ""; then ; fi
>> +if [ "mail" !=3D "" ]; then\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -g mai=
l -m 2755 dotlockfile=20
>> /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/b=
in;\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -g roo=
t -m 755 dotlockfile=20
>> /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/b=
in;=20
>> \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +/bin/sh: -c: line 1: syntax error near unexpected token `;'
>> +/bin/sh: -c: line 1: `if test=20
>> "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" =3D=
=20
>> ""; then ; fi'
>> +
>> +* only run ldconfig when it exists
>> +
>> +Upstream-Status: Submitted=20
>> [https://github.com/miquels/liblockfile/pull/21]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + Makefile.in | 5 +++--
>> + 1 file changed, 3 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile.in b/Makefile.in
>> +index bfa0acb..e29763e 100644
>> +--- a/Makefile.in
>> ++++ b/Makefile.in
>> +@@ -9,6 +9,7 @@ NFSVER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0.1
>> + CFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D @CFLAGS@ -I.
>> + LDFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D @LDFLAGS@
>> + CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D @CC@
>> ++LDCONFIG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D @LDCONFIG@
>> +
>> + prefix=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D $(DESTDIR)@prefix@
>> + exec_prefix =3D @exec_prefix@
>> +@@ -58,7 +59,7 @@ install_shared:=C2=A0=C2=A0=C2=A0 shared install_st=
atic=20
>> install_common
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(libdir)/liblockfile=
.so.$(SOVER)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ln -s liblockfile.so.$(SOVER)=20
>> $(libdir)/liblockfile.so.$(MAJOR)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f test "$(DESTDIR)" =3D ""; then @LDCONFIG@; fi
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f test "$(DESTDIR)" =3D "" -a -n "$(LDCONFIG)"; then=20
>> $(LDCONFIG); fi
>> +
>> + install_common:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 install -d -m 755 -g root -p $(includedir)
>> +@@ -79,7 +80,7 @@ install_nfslib:=C2=A0=C2=A0=C2=A0 nfslib
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f test "$(DESTDIR)" =3D ""; then @LDCONFIG@; fi
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f test "$(DESTDIR)" =3D "" -a -n "$(LDCONFIG)"; then=20
>> $(LDCONFIG); fi
>> +
>> + clean:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 rm -f *.a *.o *.so *.so.* dotlockfile
>> +--
>> +2.32.0
>> +
>> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb=20
>> b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
>> index bac3a2c0b..eefc25dc4 100644
>> --- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
>> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
>> @@ -10,6 +10,7 @@ SRC_URI =3D=20
>> "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Makefile.in-add-DESTDIR.pat=
ch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Makefile.in-install-nfslock=
-libs.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://liblockfile-fix-install-so-to-ma=
n-dir.patch \
>> +=20
>> file://0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch=
 \
>> =C2=A0 "
>>
>> =C2=A0 SRC_URI[md5sum] =3D "420c056ba0cc4d1477e402f70ba2f5eb"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101245):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/101245
>> Mute This Topic: https://lists.openembedded.org/mt/97200207/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

