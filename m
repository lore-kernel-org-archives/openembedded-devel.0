Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1C3C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 19:45:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14107.1675539937444085444
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Feb 2023 11:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=NENzP3ER;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1399dc41aa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 314Jjbro009795
	for <openembedded-devel@lists.openembedded.org>; Sat, 4 Feb 2023 11:45:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=VP+hQVykHUD/6qi+tEmnLbYabw4hz2j189OLYLpQ12Q=;
 b=NENzP3ERoRqvJbZqka+gx7HwgPih02Dw6MJD8t8iLEZFfWxAz9wXdlrLhQWV9Y8M+ZiT
 BKuPLCqM5rsTFZ+aOeHSMSTQAexu7FFp2vU/t8nTvgM7Lz67l/7ygUZyQWkK28842tlL
 qW7zmaM1Z3pEMf/oCC4f7JsS3KduAHSoRXae0MhQLLAjgSOF6Guwiwex8mJ/nQfNH5pB
 ehSoxJtJkSGkQXdcyNjcsyzksdGOXJwUovgIgLfjJhuBSX/tNnJ2UFQx6z6oFFwlh+e2
 HuJpXNzxxxtBY0Mnm+GIHXgGzxbS2aUNhQUuKFLo8wAORHpDz2Nhw52XqAfT3lcXRk1y Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhkh98acx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 11:45:36 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 314Jjav9009779
	for <openembedded-devel@lists.openembedded.org>; Sat, 4 Feb 2023 11:45:36 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhkh98acw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Feb 2023 11:45:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeLHKHncu4XlTuTWz/rAbES9TsyAtyN4PtEK3kW2CtvwBrDLr/ajLdVNq+irLT7RZZXrnLtzw+A6y23TWUOWgfKa1LOIW8NzbNRq+yAWLdvh3DF8hp1mDFS5apofFAmRpEjH9F0ucbX9A6DFKYHndvvHpYlD7vEMa2t/ajJzoSzzu0l3vhMSQxk0d8kgcSpqUC5UpIRDN53NOSel59NdbYgAA8wlPNmFLtkLIcaSKtEa6EiSYqNgjgYqq5NjNvqV3b3al7eUClaI+v9enU/8Q2DnKNY6Rk2brGTJNJu9uTBlzV4GDMDt/A3/V7bwXdsVJHBImHZBUDcoyhmnfQUTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VP+hQVykHUD/6qi+tEmnLbYabw4hz2j189OLYLpQ12Q=;
 b=MRaebWuHV85C8Msx+FFluapZWPSaBQaqvGT2bSooeWvYKPIcGFMst2iQALHNx3JeZjAsfMdWT3CQ1k4JJp4LOLiiP7gteTjy6PDgSJTlzwUDzT5d5x4DAIytghacY43gti3MB5OyzudzKUJqsZ/+6Q4GQchOLrKjrhGcY68dZShuUzB51sd0h1B8VuTA9O7l0ce+3f7bz6JkRcI3OAZjkcXAB8fWngf3RGyWd3kEsBak9dUXdW4IRk7TSbMG6NNafF39SobossjKm6V1iQ3yQEah1LovBp9kq6J8UtoDvb7AMZ0I23T3lBqF8pCVg6MndNxCI6LOKjrVrTmFXQDTaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Sat, 4 Feb
 2023 19:45:32 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6064.032; Sat, 4 Feb 2023
 19:45:32 +0000
Content-Type: multipart/alternative;
 boundary="------------ec8f3mT6LhP56obEyD2Iy08b"
Message-ID: <6519a978-b3f0-ee0a-3eb8-42eb7f88b0a4@windriver.com>
Date: Sat, 4 Feb 2023 14:45:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][kirkstone][PATCH 3/6] python3-pillow: upgrade
 9.2.0 -> 9.3.0
Content-Language: en-CA
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
 <20230131230851.2785067-3-Randy.MacLeod@windriver.com>
 <06197dd2-46e8-ffba-c703-681cee51b14c@gmail.com>
 <c698b344-1b87-fa9a-59fc-692167fb6cd5@windriver.com>
 <e7ca5239-44d6-1601-0b5a-805d50882173@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <e7ca5239-44d6-1601-0b5a-805d50882173@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f6795a-eb46-4135-d43c-08db06e86046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+WVR/BeZjeEqUXYbC7dbj8KYd9/3FEHYRnGxL4FJKfHev9+KQwtWbCpjry7vDp2i1H4Aj6xYL5RSX184t9hm7hiFxu2wDRhFEwJKhC3rNH/XOftme3WE4SOU55j3DpbRzdj3y97xt+YUTEPbg4eXIT0uS8MzFR458FPvuqTDpp6Bzkl2til4AZ73n6eX4vd700TLr6LNxpourrmk3heR3GywzJanShpETNchiSewu8cAdpBlMPaUPetgSKDbqu9ZBtzmvky25X90bc14Jc1ocwODzaG9Sr6urooaeUnZ3zzaRQuH4jT8t5rEyQuaFAESMIS+RR96U4G6mQ8VMZYr34R8ZdhqlHNfX0lcdaa7O6lV5l4+MNZ4DdPQmdUC4fQ+Kv2zRu4roX16ZTdoIynJxVs1zzK6XKMPpNMvZLbY/tMOfsp7a4n4HgtGA7YMUUejO/SgO1T1e8ahClB4JNjS8N1CtoDG3PXymJBsZwbOgZi0Iqq9zzzHacilQOmP1OX3WoKgvkCxcDeBMeJ2joqy8d0iJCGTRAd7k7el1RyjVhXyQ+6HBtcnF6bhfzRHBshat1u6YcKrVxyijwSerf8jn+keObQxxrcZVv2J4ekKpmY/h8iESz8O411tFp53ObXAR9FoReKce/1xa3JzK1o0mIA8mRfHphgtonSe3M1z+fd2DE0ItdhNkcsAuATGfA9eFfe5S7B1WZQdF1n6+94D92HN07xzkC19lwsfxxV+NKx2VyS08M2GkGkTBw2LqDgF6Q2SM6VJAFO6PStQPxcWAvp8Hpq6clTtZ6k63SIn26d2zTVkjm7HXd6AU19OPPNQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(376002)(346002)(366004)(396003)(451199018)(36756003)(86362001)(166002)(31696002)(66476007)(38100700002)(316002)(5660300002)(8936002)(41300700001)(66556008)(66946007)(8676002)(21615005)(2906002)(30864003)(83380400001)(2616005)(966005)(6486002)(478600001)(186003)(26005)(53546011)(6512007)(6666004)(33964004)(6506007)(66899018)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Nnd3UE9JQ1lWdExRUjhCK3p5eWdOYWxRYzhvUFRXNnNOM2Z6NXA3cmJBSS80?=
 =?utf-8?B?NzJZd29jZ1NUM3E4WndNZFBkR0lIa1krbnNWK0xqYnFlWEdERmZ0enplMlh2?=
 =?utf-8?B?S0xkUDUwSDBRYmxCdE5aUTdYMnZGTG5HR0g1MFpzQXhTRDUvQnBvaGZWeUVL?=
 =?utf-8?B?dGZGRFZSOEZGdTBjR0ZrV3JpdFNFNENJd2wyNmxvY2g2N0F1bG5md3VyTlJI?=
 =?utf-8?B?RE9Ea212dmhmQXVLbDFWOTdQTkJQTXMyTGxFYzZiT1lJY1d4VWNXTDBmRnR4?=
 =?utf-8?B?WktJaUpjeVNuVlFvcGUzVm1vazJtSXV0Mjd5RXJoRjRqS0JnUTRWakVZeHVy?=
 =?utf-8?B?Z2t6ckNpZ1NuMVFaR1NtV0hxZjNXMWJoaStmRDh3OEdpNGZ5M25OTk5wNTl0?=
 =?utf-8?B?QkQ1SWhOZW40bVFNa2RWVXhPWDF6czZqQ1l3cCtuMUJidXFRa21ER0R6ei9a?=
 =?utf-8?B?TEx5emVqOGVVNVdXU3pKTGNNUEtnRGw4c2RXT3MrSUtQajBPWGNQUnFTMVgz?=
 =?utf-8?B?aFJObWdZNjYwek0reUp1b2JIYytCRldadmFKSllpdjh4d2FPa1o3eEs1WnhY?=
 =?utf-8?B?NXNJNmpnMnVSdEpNemdUQlRCR3JTRG5DWlM3T05MYVh0Qm5xVHpzalFNUndW?=
 =?utf-8?B?MlpNOW51SU5sY21VdEVQWTBkOEdTZ1lNVjJpZnBYeTBmVThSdExOOG03VDk0?=
 =?utf-8?B?ZFlkNHYvZ09mUUJ6cnVxcWhxcWJ4dm03Q2JWVDdBaEJvdU8zVzJRWnhPSTR2?=
 =?utf-8?B?bDRLTFhwa0o5Sk9LQk51SWRTRVF6bWZpODNYQzExTGZxVlZBVDF2WldkNUE2?=
 =?utf-8?B?emgwSTlvS09tRkgzUElTdnVHWEhWa2tTOFErK0g3L3lHTC9qeU40Q28zWWlz?=
 =?utf-8?B?a3F5c3pGSklxNFBPdCtIYVFHY3BtcUQvcGdmZlZLS3BkdU9maXByZGFOVU9z?=
 =?utf-8?B?ckdTWEhRNU1tVEdaMElDcUUxQXc0TWppTG9MMVRISC85NFNBRis5QzRTdUZi?=
 =?utf-8?B?UXZjSFJTU243ZlRLZGhVTTk1QWRnak0yWkdqaGs5WUFwZjViOUY1bjNWdXNF?=
 =?utf-8?B?ZGttd1RPamJ3TXNyT1FwUytEa2ppQlg1ajFqM2pPdmxJRzRId25LTElCNW1R?=
 =?utf-8?B?d2ZKdXpEVjlKallaWTlab09LclpKb3lNNktVeGpTbEg0R1A0dS9qaGRJRlBK?=
 =?utf-8?B?WVprMlpHOEUvVjhPYkt5emFRSXlSdGQ5emllKzFsamoxb1g0QzZUbXhKaStz?=
 =?utf-8?B?OVJSTXVGYUIxb09ZbDVzVUE4bXFuRzZ0TldlanlsaTR6NTdyWUVjOUVRbVZI?=
 =?utf-8?B?ZHhMU2h4OFFzaXBoa2xiRnQzMUJqL2NaVGhIS0JXM0I2a3pudzdSd3JNeC9Y?=
 =?utf-8?B?NnZkSWNlbE1NY3JKbDdWVEpRU0pMZmJYUU1BSXRlV1Z4aXBuMWIvQ0pxZVBq?=
 =?utf-8?B?UEhhM2dNV2Q5RDdiOWVxY01yaU5BL3NMZVowMVB6Zm5YOTV3bThWNno5dTNQ?=
 =?utf-8?B?bzh2L1VkME5LdjRaSE9YOXQvUWhaR25mQmVDQTdFUklUUVlKMWduaVBSVjJ0?=
 =?utf-8?B?bEhCQ2dadllNWW5oT0hJYU92R0cyQ2JYaUhhakp6ZXZyZkV0ZHRIVmMreVo0?=
 =?utf-8?B?aGFpVVF4UzVKUlRBa3NxcVVwaWNzNGd5dCtWT0pwNkl1N3hSVzNMd284NGtS?=
 =?utf-8?B?Nlp4a1JyN0YrVHBBUWZsSTdYOWdpcityWkp3SFpuYklzZGtTaSsveCtidEt2?=
 =?utf-8?B?OU1leGo4VzlxYnZTVjdNcXhOdkZZSVd5U2ZNVHdLS1dQMDFGSUN5dlM0d0NR?=
 =?utf-8?B?UExBbGp0VGwzWFNYS0lHTVNGclJSMTBJaXFmRXhteCsxSEZPWEduTlVldW1n?=
 =?utf-8?B?R3hNNU0rSmVGbjFKaTVvWDJBTUZhZ1ZQTks3dGtSQVQ3RUxmSDlKYS9FQXo0?=
 =?utf-8?B?ekpjQWVlcEs0MTAxMU9Sdy9WYWZEQWVsRkJOZkhFSk9LamJCYlpGY3dDYWtL?=
 =?utf-8?B?WmhDQ1lnNk9mTXVDRWpTTlpVMVEvQnNIZmFybGxqL3AwanRGUVVPOHZNeGhN?=
 =?utf-8?B?amhKSFg1SllCZENKajIvNFh3MUhPOEJkaUhpTEE2aG02ZHBudkpBYndhWTAx?=
 =?utf-8?B?NFBoMnBDblJqc2tucUVzMmdrVHZjT1lpUVB6b2tSdUQrWE14dnM0eGxIU2ZP?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f6795a-eb46-4135-d43c-08db06e86046
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2023 19:45:32.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R02lx+4O8Dd+axoMzALdiaD29q7kP77ELI3PP3dHtxZeDLRS4mxxt76HKLN+ewKQ/zuvGgLywhBmOsAQWKKa2ATE1Yi69p1TEnx/NmJMsLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-Proofpoint-GUID: kuIN4YVrOCxLsqoBtwxKQX2b2M5XgwL5
X-Proofpoint-ORIG-GUID: M9wLGh5LYUd_SoUlr-n1YdvOepiPbcsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-04_10,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302040177
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 19:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100931

--------------ec8f3mT6LhP56obEyD2Iy08b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 314Jjbro009795

On 2023-02-04 12:45, akuster808 wrote:
>
>
> On 2/3/23 1:37 PM, Randy MacLeod wrote:
>> On 2023-02-01 08:35, akuster808 wrote:
>>> Hello Randy,
>>>
>>> On 1/31/23 6:08 PM, Randy MacLeod wrote:
>>>> From: Wang Mingyu <wangmy@fujitsu.com>
>>>>
>>>> Changelog:
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Limit SAMPLESPERPIXEL to avoid runtime DOS =
#6700 [wiredfool]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Initialize libtiff buffer when saving #6699=
 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Inline fname2char to fix memory leak #6329 =
[nulano]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fix memory leaks related to text features #=
6330 [nulano]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Use double quotes for version check on old =
CPython on Windows=20
>>>> #6695 [hugovk]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Remove backup implementation of Round for W=
indows platforms=20
>>>> #6693 [cgohlke]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed set_variation_by_name offset #6445 [r=
adarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fix malloc in _imagingft.c:font_setvaraxes =
#6690 [cgohlke]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Release Python GIL when converting images u=
sing matrix=20
>>>> operations #6418 [hmaarrfk]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added ExifTags enums #6630 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not modify previous frame when calculati=
ng delta in PNG=20
>>>> #6683 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added support for reading BMP images with R=
LE4 compression=20
>>>> #6674 [npjg, radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Decode JPEG compressed BLP1 data in origina=
l mode #6678=20
>>>> [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added GPS TIFF tag info #6661 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added conversion between RGB/RGBA/RGBX and =
LAB #6647 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not attempt normalization if mode is alr=
eady normal #6644=20
>>>> [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed seeking to an L frame in a GIF #6576 =
[radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Consider all frames when selecting mode for=
 PNG save_all #6610=20
>>>> [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Don't reassign crc on ChunkStream close #66=
27 [wiredfool,=20
>>>> radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Raise a warning if NumPy failed to raise an=
 error during=20
>>>> conversion #6594 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Show all frames in ImageShow #6611 [radarhe=
re]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Allow FLI palette chunk to not be first #66=
26 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 If first GIF frame has transparency for RGB=
_ALWAYS loading=20
>>>> strategy, use RGBA mode #6592 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Round box position to integer when pasting =
embedded color=20
>>>> #6517 [radarhere, nulano]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Removed EXIF prefix when saving WebP #6582 =
[radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Pad IM palette to 768 bytes when saving #65=
79 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added DDS BC6H reading #6449 [ShadelessFox,=
 REDxEYE, radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added support for opening WhiteIsZero 16-bi=
t integer TIFF=20
>>>> images #6642 [JayWiz, radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Raise an error when allocating translucent =
color to RGB=20
>>>> palette #6654 [jsbueno, radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added reading of TIFF child images #6569 [r=
adarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Improved ImageOps palette handling #6596 [P=
ososikTeam, radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Defer parsing of palette into colors #6567 =
[radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Apply transparency to P images in ImageTk.P=
hotoImage #6559=20
>>>> [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Use rounding in ImageOps contain() and pad(=
) #6522=20
>>>> [bibinhashley, radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed GIF remapping to palette with duplica=
te entries #6548=20
>>>> [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Allow remap_palette() to return an image wi=
th less than 256=20
>>>> palette entries #6543 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Corrected BMP and TGA palette size when sav=
ing #6500 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not call load() before draft() in Image.=
thumbnail #6539=20
>>>> [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Copy palette when converting from P to PA #=
6497 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Allow RGB and RGBA values for PA image putp=
ixel #6504 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Removed support for tkinter in PyPy before =
Python 3.6 #6551=20
>>>> [nulano]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not use CCITTFaxDecode filter if libtiff=
 is not available=20
>>>> #6518 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fallback to not using mmap if buffer is not=
 large enough #6510=20
>>>> [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed writing bytes as ASCII tag #6493 [rad=
arhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Open 1 bit EPS in mode 1 #6499 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Removed support for tkinter before Python 1=
.5.2 #6549 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Allow default ImageDraw font to be set #648=
4 [radarhere, hugovk]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Save 1 mode PDF using CCITTFaxDecode filter=
 #6470 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added support for RGBA PSD images #6481 [ra=
darhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Parse orientation from XMP tag contents #64=
63 [bigcat88,=20
>>>> radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added support for reading ATI1/ATI2 (BC4/BC=
5) DDS images #6457=20
>>>> [REDxEYE, radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not clear GIF tile when checking number =
of frames #6455=20
>>>> [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Support saving multiple MPO frames #6444 [r=
adarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not double quote Pillow version for setu=
ptools >=3D 60 #6450=20
>>>> [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Added ABGR BMP mask mode #6436 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed PSDraw rectangle #6429 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Raise ValueError if PNG sRGB chunk is trunc=
ated #6431 [radarhere]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Handle missing Python executable in ImageSh=
ow on macOS #6416=20
>>>> [bryant1410, radarhere]
>>>>
>>>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>
>>> Whats missing here are the dependency needs for kirkstone:
>>> harfbuzz to 4.4.1
>>> libtiff to 4.4.0
>>
>> Hi Armin,
>>
>> Thanks for the comments, I think an update could make sense but=20
>> really I'm after CVE fixes so I won't argue.
>> A CVE patch=C2=A0 was posted for dunfell and it's a one-liner so I'll =
take=20
>> that for kirkstone and send a patch.
>>
>>
>> If you'd like to help me understand your concerns, since I haven't=20
>> worked with python modules much,
>> you could answer the questions below but they aren't relevant now.
>>
>>
>> Why do you think we need those versions? I don't see them called out=20
>> in the logs above or
>>
>> in any release notes for pillow and the tests work...
>>
>> Harfbuzz is mentioned as being needed for libraqm
>>
>
> Looking at their git repo:=20
> https://github.com/python-pillow/Pillow/releases, under 9.30 there is=20
> a section on Dependencies:
>
> They noted this:
>
>
> =C2=A0=C2=A0 Dependencies
>
> =C2=A0* Updated harfbuzz to 5.3.1 #6669
> <https://github.com/python-pillow/Pillow/pull/6669> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* Updated zlib to 1.2.13 #6664
> <https://github.com/python-pillow/Pillow/pull/6664> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* Updated harfbuzz to 5.3.0 #6651
> <https://github.com/python-pillow/Pillow/pull/6651> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* Update github-actions #6616
> <https://github.com/python-pillow/Pillow/pull/6616> [@renovate
> <https://github.com/renovate>]
> =C2=A0* Updated Ghostscript to 10.0.0 #6609
> <https://github.com/python-pillow/Pillow/pull/6609> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* Fix Renovate config #6599
> <https://github.com/python-pillow/Pillow/pull/6599> [@hugovk
> <https://github.com/hugovk>]
> =C2=A0* Configure Renovate #6564
> <https://github.com/python-pillow/Pillow/pull/6564> [@renovate
> <https://github.com/renovate>]
> =C2=A0* Updated harfbuzz to 5.2.0 #6591
> <https://github.com/python-pillow/Pillow/pull/6591> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* [pre-commit.ci] pre-commit autoupdate #6560
> <https://github.com/python-pillow/Pillow/pull/6560> [@pre-commit-ci
> <https://github.com/pre-commit-ci>]
> =C2=A0* Updated libimagequant to 4.0.4 #6535
> <https://github.com/python-pillow/Pillow/pull/6535> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* Updated libimagequant to 4.0.2 #6523
> <https://github.com/python-pillow/Pillow/pull/6523> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* Updated libwebp to 1.2.4 #6483
> <https://github.com/python-pillow/Pillow/pull/6483> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* [pre-commit.ci] pre-commit autoupdate #6472
> <https://github.com/python-pillow/Pillow/pull/6472> [@pre-commit-ci
> <https://github.com/pre-commit-ci>]
> =C2=A0* Updated harfbuzz to 5.1.0 #6466
> <https://github.com/python-pillow/Pillow/pull/6466> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* Updated libimagequant to 4.0.1 #6451
> <https://github.com/python-pillow/Pillow/pull/6451> [@radarhere
> <https://github.com/radarhere>]
> =C2=A0* Updated libwebp to 1.2.3 #6442
> <https://github.com/python-pillow/Pillow/pull/6442> [@radarhere
> <https://github.com/radarhere>]
>
>
> I was just repeating what they said.
>
> Also based on=20
> https://pillow.readthedocs.io/en/stable/releasenotes/9.3.0.html, there=20
> are API additions.
>
> Those two bits of information does prompt me to question why and push=20
> back.
>
>
>
>
>> https://pillow.readthedocs.io/en/latest/installation.html#external-lib=
raries=20
>>
>>
>> but there's no recipe for libraqm yet and so it's not a requirement=20
>> it seems:
>>
>> b/pillow$ grep Requiring=20
>> tmp-glibc/work/core2-64-oe-linux/python3-pillow/9.4.0-r0/temp/log.do_c=
ompile
>> Requiring zlib
>> Requiring jpeg
>> Requiring tiff
>> Requiring freetype
>> Requiring lcms
>> Requiring jpeg2000
>>
>>>
>>> neither version exists in kirkstone.
>>>
>>> and it appears to be adding a lot of new features.
>>
>> Yeah, IMO it's a reasonable update because of the semantic versioning=20
>> approach
>> followed by pillow, specifically:
>>
>> https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#v=
ersioning=20
>>
>>
>> =C2=A0- MINOR version when you add functionality in a backwards compat=
ible=20
>> manner,
>>
>
> Ah, so it is.
>>
>> but you're the maintainer so I'll send a patch next week.
>>
>
> I appreciate the additional information.=C2=A0 Thanks for your persiste=
nce.
>
> Where things get trick is "New Features" is under the=20
> "*Unacceptable:*". New Features that break backward compatibility who=20
> be a no, but new feature that are backward compatible should be fine=20
> and that is how I am interpreting this.
>
> I plan on taking your patch series.


Ah cool. I know that it's often a hard line to draw but in this case a=20
9.X update seems sensible.

Thanks,
../Randy


>
> BR,
> Armin
>>
>> ../Randy
>>
>>
>>> =C2=A0 Per our stable branch process, this update does not qualify to=
 be=20
>>> included.
>>>
>>> BR,
>>> Armin
>>>> ---
>>>> =C2=A0 .../{python3-pillow_9.2.0.bb =3D> python3-pillow_9.3.0.bb}=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4=20
>>>> ++--
>>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> =C2=A0 rename=20
>>>> meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb =3D>=20
>>>> python3-pillow_9.3.0.bb} (86%)
>>>>
>>>> diff --git=20
>>>> a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb=20
>>>> b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
>>>> similarity index 86%
>>>> rename from=20
>>>> meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
>>>> rename to meta-python/recipes-devtools/python/python3-pillow_9.3.0.b=
b
>>>> index 454d61a48..11f545160 100644
>>>> --- a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
>>>> +++ b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
>>>> @@ -5,7 +5,7 @@ HOMEPAGE =3D "https://pillow.readthedocs.io"
>>>> =C2=A0 LICENSE =3D "MIT"
>>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>>> "file://LICENSE;md5=3Dad081a0aede51e89f8da13333a8fb849"
>>>> =C2=A0 -SRC_URI =3D=20
>>>> "git://github.com/python-pillow/Pillow.git;branch=3D9.2.x;protocol=3D=
https=20
>>>> \
>>>> +SRC_URI =3D=20
>>>> "git://github.com/python-pillow/Pillow.git;branch=3Dmain;protocol=3D=
https=20
>>>> \
>>>> file://0001-support-cross-compiling.patch \
>>>> file://0001-explicitly-set-compile-options.patch \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "
>>>> @@ -39,4 +39,4 @@ RPROVIDES:${PN} +=3D "python3-imaging"
>>>> =C2=A0 =C2=A0 BBCLASSEXTEND =3D "native"
>>>> =C2=A0 -SRCREV =3D "58acec3312fb8671c9d84829197e1c8150085589"
>>>> +SRCREV =3D "d594f4cb8dc47fb0c69ae58d9fff86faae4515bd"
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#100894):=20
>>>> https://lists.openembedded.org/g/openembedded-devel/message/100894
>>>> Mute This Topic: https://lists.openembedded.org/mt/96664649/3616698
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe:=20
>>>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>>>> [akuster808@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux
>

--=20
# Randy MacLeod
# Wind River Linux

--------------ec8f3mT6LhP56obEyD2Iy08b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-02-04 12:45, akuster808 wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:e7ca5239-44d6-1601-0b5a-805d50882173@gmail.com">
      <br>
      <br>
      On 2/3/23 1:37 PM, Randy MacLeod wrote:
      <br>
      <blockquote type="cite">On 2023-02-01 08:35, akuster808 wrote:
        <br>
        <blockquote type="cite">Hello Randy,
          <br>
          <br>
          On 1/31/23 6:08 PM, Randy MacLeod wrote:
          <br>
          <blockquote type="cite">From: Wang Mingyu
            <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
            <br>
            <br>
            Changelog:
            <br>
            =========
            <br>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Limit SAMPLESPERPIXEL to avoid runtime DOS #6700
            [wiredfool]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Initialize libtiff buffer when saving #6699 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Inline fname2char to fix memory leak #6329 [nulano]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Fix memory leaks related to text features #6330
            [nulano]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Use double quotes for version check on old CPython on
            Windows #6695 [hugovk]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Remove backup implementation of Round for Windows
            platforms #6693 [cgohlke]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Fixed set_variation_by_name offset #6445 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Fix malloc in _imagingft.c:font_setvaraxes #6690
            [cgohlke]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Release Python GIL when converting images using matrix
            operations #6418 [hmaarrfk]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added ExifTags enums #6630 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Do not modify previous frame when calculating delta in
            PNG #6683 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added support for reading BMP images with RLE4
            compression #6674 [npjg, radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Decode JPEG compressed BLP1 data in original mode #6678
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added GPS TIFF tag info #6661 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added conversion between RGB/RGBA/RGBX and LAB #6647
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Do not attempt normalization if mode is already normal
            #6644 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Fixed seeking to an L frame in a GIF #6576 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Consider all frames when selecting mode for PNG
            save_all #6610 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Don't reassign crc on ChunkStream close #6627
            [wiredfool, radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Raise a warning if NumPy failed to raise an error
            during conversion #6594 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Show all frames in ImageShow #6611 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Allow FLI palette chunk to not be first #6626
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; If first GIF frame has transparency for RGB_ALWAYS
            loading strategy, use RGBA mode #6592 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Round box position to integer when pasting embedded
            color #6517 [radarhere, nulano]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Removed EXIF prefix when saving WebP #6582 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Pad IM palette to 768 bytes when saving #6579
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added DDS BC6H reading #6449 [ShadelessFox, REDxEYE,
            radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added support for opening WhiteIsZero 16-bit integer
            TIFF images #6642 [JayWiz, radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Raise an error when allocating translucent color to RGB
            palette #6654 [jsbueno, radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added reading of TIFF child images #6569 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Improved ImageOps palette handling #6596 [PososikTeam,
            radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Defer parsing of palette into colors #6567 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Apply transparency to P images in ImageTk.PhotoImage
            #6559 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Use rounding in ImageOps contain() and pad() #6522
            [bibinhashley, radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Fixed GIF remapping to palette with duplicate entries
            #6548 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Allow remap_palette() to return an image with less than
            256 palette entries #6543 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Corrected BMP and TGA palette size when saving #6500
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Do not call load() before draft() in Image.thumbnail
            #6539 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Copy palette when converting from P to PA #6497
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Allow RGB and RGBA values for PA image putpixel #6504
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Removed support for tkinter in PyPy before Python 3.6
            #6551 [nulano]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Do not use CCITTFaxDecode filter if libtiff is not
            available #6518 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Fallback to not using mmap if buffer is not large
            enough #6510 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Fixed writing bytes as ASCII tag #6493 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Open 1 bit EPS in mode 1 #6499 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Removed support for tkinter before Python 1.5.2 #6549
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Allow default ImageDraw font to be set #6484
            [radarhere, hugovk]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Save 1 mode PDF using CCITTFaxDecode filter #6470
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added support for RGBA PSD images #6481 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Parse orientation from XMP tag contents #6463
            [bigcat88, radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added support for reading ATI1/ATI2 (BC4/BC5) DDS
            images #6457 [REDxEYE, radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Do not clear GIF tile when checking number of frames
            #6455 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Support saving multiple MPO frames #6444 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Do not double quote Pillow version for setuptools &gt;=
            60 #6450 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Added ABGR BMP mask mode #6436 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Fixed PSDraw rectangle #6429 [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Raise ValueError if PNG sRGB chunk is truncated #6431
            [radarhere]
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp; Handle missing Python executable in ImageShow on macOS
            #6416 [bryant1410, radarhere]
            <br>
            <br>
            Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
            <br>
            Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
            <br>
          </blockquote>
          <br>
          Whats missing here are the dependency needs for kirkstone:
          <br>
          harfbuzz to 4.4.1
          <br>
          libtiff to 4.4.0
          <br>
        </blockquote>
        <br>
        Hi Armin,
        <br>
        <br>
        Thanks for the comments, I think an update could make sense but
        really I'm after CVE fixes so I won't argue.
        <br>
        A CVE patch&nbsp; was posted for dunfell and it's a one-liner so I'll
        take that for kirkstone and send a patch.
        <br>
        <br>
        <br>
        If you'd like to help me understand your concerns, since I
        haven't worked with python modules much,
        <br>
        you could answer the questions below but they aren't relevant
        now.
        <br>
        <br>
        <br>
        Why do you think we need those versions? I don't see them called
        out in the logs above or
        <br>
        <br>
        in any release notes for pillow and the tests work...
        <br>
        <br>
        Harfbuzz is mentioned as being needed for libraqm
        <br>
        <br>
      </blockquote>
      <br>
      Looking at their git repo:
      <a class="moz-txt-link-freetext" href="https://github.com/python-pillow/Pillow/releases">https://github.com/python-pillow/Pillow/releases</a>, under 9.30 there
      is a section on Dependencies:
      <br>
      <br>
      They noted this:
      <br>
      <br>
      <br>
      &nbsp;&nbsp; Dependencies
      <br>
      <br>
      &nbsp;* Updated harfbuzz to 5.3.1 #6669
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6669">&lt;https://github.com/python-pillow/Pillow/pull/6669&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* Updated zlib to 1.2.13 #6664
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6664">&lt;https://github.com/python-pillow/Pillow/pull/6664&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* Updated harfbuzz to 5.3.0 #6651
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6651">&lt;https://github.com/python-pillow/Pillow/pull/6651&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* Update github-actions #6616
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6616">&lt;https://github.com/python-pillow/Pillow/pull/6616&gt;</a>
      [@renovate
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/renovate">&lt;https://github.com/renovate&gt;</a>]
      <br>
      &nbsp;* Updated Ghostscript to 10.0.0 #6609
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6609">&lt;https://github.com/python-pillow/Pillow/pull/6609&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* Fix Renovate config #6599
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6599">&lt;https://github.com/python-pillow/Pillow/pull/6599&gt;</a>
      [@hugovk
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/hugovk">&lt;https://github.com/hugovk&gt;</a>]
      <br>
      &nbsp;* Configure Renovate #6564
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6564">&lt;https://github.com/python-pillow/Pillow/pull/6564&gt;</a>
      [@renovate
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/renovate">&lt;https://github.com/renovate&gt;</a>]
      <br>
      &nbsp;* Updated harfbuzz to 5.2.0 #6591
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6591">&lt;https://github.com/python-pillow/Pillow/pull/6591&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* [pre-commit.ci] pre-commit autoupdate #6560
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6560">&lt;https://github.com/python-pillow/Pillow/pull/6560&gt;</a>
      [@pre-commit-ci
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/pre-commit-ci">&lt;https://github.com/pre-commit-ci&gt;</a>]
      <br>
      &nbsp;* Updated libimagequant to 4.0.4 #6535
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6535">&lt;https://github.com/python-pillow/Pillow/pull/6535&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* Updated libimagequant to 4.0.2 #6523
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6523">&lt;https://github.com/python-pillow/Pillow/pull/6523&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* Updated libwebp to 1.2.4 #6483
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6483">&lt;https://github.com/python-pillow/Pillow/pull/6483&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* [pre-commit.ci] pre-commit autoupdate #6472
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6472">&lt;https://github.com/python-pillow/Pillow/pull/6472&gt;</a>
      [@pre-commit-ci
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/pre-commit-ci">&lt;https://github.com/pre-commit-ci&gt;</a>]
      <br>
      &nbsp;* Updated harfbuzz to 5.1.0 #6466
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6466">&lt;https://github.com/python-pillow/Pillow/pull/6466&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* Updated libimagequant to 4.0.1 #6451
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6451">&lt;https://github.com/python-pillow/Pillow/pull/6451&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      &nbsp;* Updated libwebp to 1.2.3 #6442
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/python-pillow/Pillow/pull/6442">&lt;https://github.com/python-pillow/Pillow/pull/6442&gt;</a>
      [@radarhere
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://github.com/radarhere">&lt;https://github.com/radarhere&gt;</a>]
      <br>
      <br>
      <br>
      I was just repeating what they said.
      <br>
      <br>
      Also based on
      <a class="moz-txt-link-freetext" href="https://pillow.readthedocs.io/en/stable/releasenotes/9.3.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/9.3.0.html</a>,
      there are API additions.
      <br>
      <br>
      Those two bits of information does prompt me to question why and
      push back.
      <br>
      <br>
      <br>
      <br>
      <br>
      <blockquote type="cite"><a class="moz-txt-link-freetext" href="https://pillow.readthedocs.io/en/latest/installation.html#external-libraries">https://pillow.readthedocs.io/en/latest/installation.html#external-libraries</a>
        <br>
        <br>
        but there's no recipe for libraqm yet and so it's not a
        requirement it seems:
        <br>
        <br>
        b/pillow$ grep Requiring
tmp-glibc/work/core2-64-oe-linux/python3-pillow/9.4.0-r0/temp/log.do_compile<br>
        Requiring zlib
        <br>
        Requiring jpeg
        <br>
        Requiring tiff
        <br>
        Requiring freetype
        <br>
        Requiring lcms
        <br>
        Requiring jpeg2000
        <br>
        <br>
        <blockquote type="cite">
          <br>
          neither version exists in kirkstone.
          <br>
          <br>
          and it appears to be adding a lot of new features.
          <br>
        </blockquote>
        <br>
        Yeah, IMO it's a reasonable update because of the semantic
        versioning approach
        <br>
        followed by pillow, specifically:
        <br>
        <br>
<a class="moz-txt-link-freetext" href="https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#versioning">https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#versioning</a>
        <br>
        <br>
        &nbsp;- MINOR version when you add functionality in a backwards
        compatible manner,
        <br>
        <br>
      </blockquote>
      <br>
      Ah, so it is.
      <br>
      <blockquote type="cite">
        <br>
        but you're the maintainer so I'll send a patch next week.
        <br>
        <br>
      </blockquote>
      <br>
      I appreciate the additional information.&nbsp; Thanks for your
      persistence.
      <br>
      <br>
      Where things get trick is &quot;New Features&quot; is under the
      &quot;*Unacceptable:*&quot;. New Features that break backward compatibility
      who be a no, but new feature that are backward compatible should
      be fine and that is how I am interpreting this.
      <br>
      <br>
      I plan on taking your patch series.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Ah cool. I know that it's often a hard line to draw but in this
      case a 9.X update seems sensible.</p>
    <p>Thanks,<br>
      ../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:e7ca5239-44d6-1601-0b5a-805d50882173@gmail.com">
      <br>
      BR,
      <br>
      Armin
      <br>
      <blockquote type="cite">
        <br>
        ../Randy
        <br>
        <br>
        <br>
        <blockquote type="cite">&nbsp; Per our stable branch process, this
          update does not qualify to be included.
          <br>
          <br>
          BR,
          <br>
          Armin
          <br>
          <blockquote type="cite">---
            <br>
            &nbsp; .../{python3-pillow_9.2.0.bb =&gt;
            python3-pillow_9.3.0.bb}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++--
            <br>
            &nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)
            <br>
            &nbsp; rename
            meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb
            =&gt; python3-pillow_9.3.0.bb} (86%)
            <br>
            <br>
            diff --git
            a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
            <br>
            similarity index 86%
            <br>
            rename from
            meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
            <br>
            rename to
            meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
            <br>
            index 454d61a48..11f545160 100644
            <br>
            ---
            a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
            <br>
            +++
            b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
            <br>
            @@ -5,7 +5,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pillow.readthedocs.io">&quot;https://pillow.readthedocs.io&quot;</a>
            <br>
            &nbsp; LICENSE = &quot;MIT&quot;
            <br>
            &nbsp; LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849">&quot;file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849&quot;</a>
            <br>
            &nbsp; -SRC_URI =
            &quot;git://github.com/python-pillow/Pillow.git;branch=9.2.x;protocol=https
            \
            <br>
            +SRC_URI =
            &quot;git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            \
            <br>
            <a class="moz-txt-link-freetext" href="file://0001-support-cross-compiling.patch">file://0001-support-cross-compiling.patch</a> \
            <br>
            <a class="moz-txt-link-freetext" href="file://0001-explicitly-set-compile-options.patch">file://0001-explicitly-set-compile-options.patch</a> \
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;
            <br>
            @@ -39,4 +39,4 @@ RPROVIDES:${PN} += &quot;python3-imaging&quot;
            <br>
            &nbsp; &nbsp; BBCLASSEXTEND = &quot;native&quot;
            <br>
            &nbsp; -SRCREV = &quot;58acec3312fb8671c9d84829197e1c8150085589&quot;
            <br>
            +SRCREV = &quot;d594f4cb8dc47fb0c69ae58d9fff86faae4515bd&quot;
            <br>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-
            <br>
            Links: You receive all messages sent to this group.
            <br>
            View/Reply Online (#100894):
            <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/100894">https://lists.openembedded.org/g/openembedded-devel/message/100894</a>
            <br>
            Mute This Topic:
            <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/96664649/3616698">https://lists.openembedded.org/mt/96664649/3616698</a>
            <br>
            Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
            <br>
            Unsubscribe:
            <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a class="moz-txt-link-abbreviated" href="mailto:akuster808@gmail.com">akuster808@gmail.com</a>]
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-
            <br>
            <br>
          </blockquote>
          <br>
        </blockquote>
        <br>
        --&nbsp;<br>
        # Randy MacLeod
        <br>
        # Wind River Linux
        <br>
      </blockquote>
      <br>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ec8f3mT6LhP56obEyD2Iy08b--

