Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC7FC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 01:07:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8410.1678410454733661203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 17:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=r5sDlO9K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24331f10aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32A16iRN001666
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 17:07:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=tR2FBLCNGWeqXDS0Nta2t9+TcMKxbwkI8eFDyo9k3/8=;
 b=r5sDlO9KSLGx4Y4wKJvJn+6LUonlvvCA0puTDlB11oHfL+11XKkSUkIzZIOxuT3mF95R
 n7gXIPBuEEqn07EOFy5I1so2u+xvFfCnW8Wx2ul18iv8Lvw8nFYAP4rdjf8NojTO1OBl
 S+q+Ji7tps3CAST5ag3NzSxkErFGwv3/6X9/+VnhGAkydkKFRxdTKE6a9yfnAu8msgFY
 FotAHYTobmXWEzthz1YUrPO4dC7xxoFLr2x27edZFWiujCIhQUajqxBg5JlYX/FjASDE
 es5WsxRbqeG9gIXH5MHSbLvUfi4xW10ndj5hPbuh/VGx1s+Zzxn1BkCcdyDjRI9Swg0Y WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd2ap9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:07:34 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32A17Xa5003501
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 17:07:33 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd2ap8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 17:07:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvYHaFwkDkQq88WpauKgM3T+llGz378Xo1l7LJmh46lkVdZYZbxixfz54Qa+uaWyuOPBMrT3LLRaYtCqX/MuAnoyXMx4NqoTAviQikcQ/FBEEhquIccmptpdP5eQcqUduXgZLGtS8SRIrm8G+N8eUHo2PVcgGqWVeH0ntqXq1V/6OoSKGSfqGuT5Th6beSwPg65ZaBmcNOIzo3wPDXabJHhJU0Y/LtafDbL+iccyBYytL7anBjWSUqhOW/YIkD9LfRE2wWusU1JGC5zaCyTjhdPXydPnUZOEcm7ca5oN7jwFolBsgWYc8Wz72Rnkfx1L0usIYIJxNzjzRwMJY201Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tR2FBLCNGWeqXDS0Nta2t9+TcMKxbwkI8eFDyo9k3/8=;
 b=ZzZpaXF7nbiFYQ4akAOxALxQpPXHLVgGIYW32dWo88n2Ng5or8R2c7ACQoT8H19O2CRZRKGMjWzvg9MAl7xjtbZTudvtD5gOv+Cmi7XYsLmEjzXPS3G5knuqHXgRp3wXilyHeKER7BH530p+Ka901/N4LxL3YxPay1101truNGh8pWE3YT8jLzN6ahoOxTvMgd8hZdxh2zyRHyKhsu4nvOLcfarkQlLUUA+zxMXCYBr8TXXrSRHwzWP2gDMMfBJEosOy3G447Bb6/B+ydJnCjk5CqEnNo+qtPcwDOtvC86YZRRtTS9a/5ORpaWv7dj99m9aRw8SR7QXiWG0NI3WhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 01:07:31 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 01:07:31 +0000
Message-ID: <9cb1be68-fb16-d0ea-2848-7f98cad2951f@windriver.com>
Date: Fri, 10 Mar 2023 09:07:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-oe][PATCH] liblockfile: upgrade 1.14 -> 1.17
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230309084038.1182832-1-changqing.li@windriver.com>
 <CAMKF1sqFz9vpd1atHDmT5pFxxDVtasLOAF7COYLH09jH-kw6tw@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1sqFz9vpd1atHDmT5pFxxDVtasLOAF7COYLH09jH-kw6tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYWPR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::23) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 03300e29-3528-4a1a-8a06-08db2103d304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2cLC47xwKQ068tXT8GnbmI9U4J3EsByrdYxQS3drdUQ+43x8O22cdeFr7C7xQ5cs4Klieo7wstrFW1CUZGVHC5yFS93l/amM/DEQasPG1m2MMt/cI2ZHFY/sSCz9ZLr5grIjHgcrAXJLBZNUKXWbuIVuZGXClCg0MOVjPU45dPSTiCc2t+qPNin++FeXp4WgFYIN+xdLdGrLUxwSr139pa7cOJznF5kB9J6kQtwevMVk8BlnRYzU/HpQ7Ejh/+OelLeNNsmjTEqcUXwdNiZs3p/DO69kFeH1M1qRB/oO3HgDiYsP6Rk1DvTQC7D1v4wQFvWDzbpV9rYgZvfPd/3FOIIkuch57O+C3tga6KkzIPkz2BiZYcDpN/tX62KxwjlRcSvyfH5qXvZqwdHwtcj22GowerVDEAdE3le8vzW0yqCWHP8zynlqFFnDZL0W26xHiwAbV4lv7aMES4FRav+tzqVa6fYCvM+eBqOAfNFKv3BXhjQdRQpzuWiasJf4Kq8pTcuxAV2ILiPT0CeCO1q8z9m1YCEtIcdH4asW7AiWY0aPkijuLAW3znVfq+0g8qX/k3nR5J2wE7eKfUEdrvm3bPVHuuRlTmNTIsML265HeidTBJlLx+lBkveeAex1fMabLgn+gGtVKftMMegigPiL5tbkw/sQdfJaVU5h7aSX4sT2AZ0zHJTQdZZ3ovynCW4unDRKvG5uprwGaXEgcNLhI29uDIQT5enhIqjlZ01OXuc9kyAspuNIW3Nx0N0dGA+glwNXbaqBcVsDlaEyg/4u4w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(346002)(136003)(396003)(376002)(451199018)(66899018)(31686004)(38100700002)(36756003)(110136005)(86362001)(31696002)(186003)(26005)(6506007)(478600001)(53546011)(6512007)(83380400001)(6666004)(2616005)(316002)(5660300002)(6486002)(966005)(4326008)(41300700001)(44832011)(8936002)(66476007)(2906002)(30864003)(66556008)(8676002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1RWRkpBS0JHdHBubTBlNU1mMTVDTFhzNFQzWjFPdzB0VWJyV3g0eno2NUtU?=
 =?utf-8?B?bGhBdisrdnBPZHh3YUhPTG9jYWFVandrSU9CRGIyM2loWjNkUHJXeHEwbkhI?=
 =?utf-8?B?TCtnRmJoSHdURVRpUnRBUmRwamdBUWQ4enAwSGVqcDEvSGhJSGVHOTlES3lO?=
 =?utf-8?B?UXV2M0hmUGlLQnpTOTNqdXJ6M0I4dW0xeWg4TS9ESjlWTmdkOWJ0L0VtOFNm?=
 =?utf-8?B?V29FMTRkS3JPSUREWHRTWEJNTmxQWi9sRG1NRjBTRGY2dlhuMTE0UFdZZGho?=
 =?utf-8?B?Y1c3cFAzaHJxaUFmK0p4cXBLMXBaemlZalYwc2tobjFMVnBRLzlMUmtIcU92?=
 =?utf-8?B?N1dLSzdnVkpQaURKVDhYY0lmYkc4UndSUlplcllPakVBZjhITG1WTzVVU1Ba?=
 =?utf-8?B?cHNiaHhkZkt5bTN0ZW9BQzRUbGZCWnBleldWTjdFQ0JZL3RPSWQ5Ry9oQXR5?=
 =?utf-8?B?UU1jQnZyc3dYMHQya2hXT2duV3l6S21KRFBVUjBKSmZJR1pyV0RoNzczSlRG?=
 =?utf-8?B?U0FmR2hpRWhMMjBEVjRycDdGaklpYzJ1MnJXazh6Qll5SjFydDdBVnpsUWQ4?=
 =?utf-8?B?cFpQeHRDRUpYb3RnL3NDMGxSNjFiY2ZpVDVXeVVhSDdnaUpOUzVwWHp4UkYy?=
 =?utf-8?B?RnY3R0lVTFpadVMyM1I4d1JOZDlUQ0VXNG1NMFZMWkd1Z25pQ1h1VWY3VUp5?=
 =?utf-8?B?MDJBVWhkTEFINk1NVG5ZQWZqTW5mQnJqcW9RWE5jektNWHF1bmc2Y1lIdk5P?=
 =?utf-8?B?TXdGRGxXMDNXbklIMERJUGNzbGo3NG5BSWh4SENoOHZPNDFnejE1SXJyS2Uv?=
 =?utf-8?B?TlQrNmNyL3oxRUZ1ZUN5bnlRRWJvL1ZQRGh4WmtPcDVvdUZpMlFoZDd2YkFu?=
 =?utf-8?B?K0M3dXc2OU9iWHB1cFhQUkxua0RRL3JGKy9KejFhamRGWjhVWjc0UWFkRDVM?=
 =?utf-8?B?bFh3SE5JSVU3ai9DczBvQWp3NjJsSVJXNkF5aTgvR0FWR2t6c0R2cWJWbis1?=
 =?utf-8?B?RFZPbU9RUmhXSU1BTUhCU0l0c3hYeUUxemNpZXdIK3BaMWJhSWNTOTdMY1hG?=
 =?utf-8?B?MHBPMzJ1MEtPY0hiamZBTW5qSG9TR3cyVG85VlVJbnpIdlNuYXE0SHdaaUpw?=
 =?utf-8?B?ZWFiTGwrZGVkeTk5T1puWHp4VEJhQ1Z0QzdQUTBPVFRvRW1Ya2x4RktqRzJK?=
 =?utf-8?B?aC9rVEV0b1NWRUFaL2pUYXF5anBZZWFDazIxVFZsVUJONVk2R2UyaUVWS1Fs?=
 =?utf-8?B?VEtZbHhDOGFzcllnb1FBQWxpRGxLTDNwdFZLbnhVbnFqRkJDQjhhNWpERGI5?=
 =?utf-8?B?QUJDeUs0RGhuYVU5V2lCNElKMFNudTlDMEJSVloxR2JKa3VVbGdhRXZVRkw5?=
 =?utf-8?B?eWQwdGFTaTV3SmZVR01yV3M5N0FWQ2xWWnhkeXZZMENyVlRON0p6K1JhVzZu?=
 =?utf-8?B?VVJLUlBlZzlINC9RSDdIckl3UVAyblF5dzlVcTZpd1ZRSGhJejBIMVZKajlj?=
 =?utf-8?B?OFQxcVJPNWtUUThnMG1Iei80MHRUdytCU1FqT1pqbUpZaFM5aTMxVnhOb1Ji?=
 =?utf-8?B?UFJCQk1EMTh2enRMVGlvQk00QUZMYVpHQzVGa3BTOUt2elpsck5odzJsOUhj?=
 =?utf-8?B?QVYzN0RNRS9Pd3ZxYk51cXFpTGx3YTQvaGNFcG50cHNoVE5XbGRVMGJIdkdk?=
 =?utf-8?B?eVpzUDNPRjhvRWZpaitySDFaNldmUTRCQ0t6MzZYYmFvdE9nM0cxejdGNHRL?=
 =?utf-8?B?aU1vRmQ0ZU9RWWgxcWNUSWZoQ04xZnVEc2s4QmYvUHFzNXU0V2JwYkhwRUx0?=
 =?utf-8?B?aUZ2SVQwbTB1aDZkYzZmM1RaUGJ1T3Qvei92WDk1Z2xEbW1mMXVWeXdCWGkx?=
 =?utf-8?B?UUJoQ2E5bWtJVHYrOTk5Rm5TRmpsOTdQOUFNSWtKQThtd1gyMUpNNDl4Ym9I?=
 =?utf-8?B?dklWRlRhbGVScXI2eFprWTA5Tytyd3BHc21WWW5vTUtzcktPbkFNSEUxeVla?=
 =?utf-8?B?NHF2eFJYRlhmR0RlanNHcUhLcGwwOWRyU0tlTDRiNU9rQzcxTHREV3lwcE1F?=
 =?utf-8?B?RVBLcnN2YjRmYVRvT1BndStsTld2a01Ud3JsTXJFcTJ0aXNqeWRFVHQraDNu?=
 =?utf-8?B?TERLTFQwRjlPRGdUOFhQSHNWSDRTeFJQSXhHV2o4dzltYU9hZFNyaUZvNzY0?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03300e29-3528-4a1a-8a06-08db2103d304
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 01:07:31.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frJ1MvVrpgJvtf4lZiwUQ3QmD/V+69GF+sJYGMWBQAZ1iK6Aj+hhZiDoqI2nP0DtSGLiayZXSiukdBMS/iIIrPMvuygPPDbl0ZY2z+0NMH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
X-Proofpoint-GUID: 0fTbM8JhzSZ9HL35L6aoqTMahaD-kYlO
X-Proofpoint-ORIG-GUID: 97stN40C5dLG58WZl2JdZajn42ggpfXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_14,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100004
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32A16iRN001666
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 01:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101468


On 3/10/23 01:50, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> please rebase on master and resend

Thanks, V2 is coming.

//Changqing
>
> On Thu, Mar 9, 2023 at 12:40=E2=80=AFAM Changqing Li
> <changqing.li@eng.windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Updated patches:
>> configure.patch
>> 0001-Makefile.in-redefine-LOCKPROG.patch
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   ...akefile.in-Don-t-try-to-run-ldconfig.patch | 12 +++----
>>   .../0001-Makefile.in-add-DESTDIR.patch        |  6 ++--
>>   ...001-Makefile.in-install-nfslock-libs.patch | 10 +++---
>>   .../0001-Makefile.in-redefine-LOCKPROG.patch  | 34 ++++++++++++++---=
--
>>   .../liblockfile/liblockfile/configure.patch   | 22 ++++++++----
>>   ...iblockfile-fix-install-so-to-man-dir.patch |  8 ++---
>>   ...iblockfile_1.14.bb =3D> liblockfile_1.17.bb} | 14 ++++----
>>   7 files changed, 67 insertions(+), 39 deletions(-)
>>   rename meta-oe/recipes-extended/liblockfile/{liblockfile_1.14.bb =3D=
> liblockfile_1.17.bb} (72%)
>>
>> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Mak=
efile.in-Don-t-try-to-run-ldconfig.patch b/meta-oe/recipes-extended/liblo=
ckfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch
>> index 5a1d9a995..0e814d4f5 100644
>> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.i=
n-Don-t-try-to-run-ldconfig.patch
>> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.i=
n-Don-t-try-to-run-ldconfig.patch
>> @@ -1,4 +1,4 @@
>> -From 5876bd17caac96df70ef400bfeebb155c0bd7359 Mon Sep 17 00:00:00 200=
1
>> +From 4d07cbaddeed8fe283d77336a6432c4074450722 Mon Sep 17 00:00:00 200=
1
>>   From: Changqing Li <changqing.li@windriver.com>
>>   Date: Wed, 8 Feb 2023 10:34:45 +0800
>>   Subject: [PATCH] Makefile.in: Don't try to run ldconfig
>> @@ -27,10 +27,10 @@ Signed-off-by: Changqing Li <changqing.li@windrive=
r.com>
>>    1 file changed, 2 deletions(-)
>>
>>   diff --git a/Makefile.in b/Makefile.in
>> -index bfa0acb..ae5be56 100644
>> +index 232f1b6..5754ca5 100644
>>   --- a/Makefile.in
>>   +++ b/Makefile.in
>> -@@ -58,7 +58,6 @@ install_shared:      shared install_static install_=
common
>> +@@ -69,7 +69,6 @@ install_shared:      shared install_static install_=
common
>>                          $(libdir)/liblockfile.so.$(SOVER)
>>                  ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.s=
o.$(MAJOR)
>>                  ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.s=
o
>> @@ -38,14 +38,14 @@ index bfa0acb..ae5be56 100644
>>
>>    install_common:
>>                  install -d -m 755 -g root -p $(includedir)
>> -@@ -79,7 +78,6 @@ install_nfslib:      nfslib
>> +@@ -90,7 +89,6 @@ install_nfslib:      nfslib
>>                  install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
>>                  ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
>>                  ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
>>   -              if test "$(DESTDIR)" =3D ""; then @LDCONFIG@; fi
>>
>> - clean:
>> -               rm -f *.a *.o *.so *.so.* dotlockfile
>> + test:         test-stamp
>> +               @:
>>   --
>>   2.25.1
>>
>> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Mak=
efile.in-add-DESTDIR.patch b/meta-oe/recipes-extended/liblockfile/liblock=
file/0001-Makefile.in-add-DESTDIR.patch
>> index ea415dd8b..2533b3a00 100644
>> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.i=
n-add-DESTDIR.patch
>> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.i=
n-add-DESTDIR.patch
>> @@ -1,4 +1,4 @@
>> -From 67843dabe1177840697839b916fd899218893ec7 Mon Sep 17 00:00:00 200=
1
>> +From 8e370a2f35d0c3472ddc9068fab19d0077434c61 Mon Sep 17 00:00:00 200=
1
>>   From: Mingli Yu <mingli.yu@windriver.com>
>>   Date: Thu, 19 Jul 2018 00:25:23 -0700
>>   Subject: [PATCH] Makefile.in: add DESTDIR
>> @@ -29,7 +29,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>
>>   diff --git a/Makefile.in b/Makefile.in
>> -index 36a6d23..1e4130e 100644
>> +index 9c74b35..8cbda1d 100644
>>   --- a/Makefile.in
>>   +++ b/Makefile.in
>>   @@ -12,11 +12,11 @@ CC         =3D @CC@
>> @@ -50,5 +50,5 @@ index 36a6d23..1e4130e 100644
>>    MAILGROUP     =3D @MAILGROUP@
>>
>>   --
>> -2.17.1
>> +2.25.1
>>
>> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Mak=
efile.in-install-nfslock-libs.patch b/meta-oe/recipes-extended/liblockfil=
e/liblockfile/0001-Makefile.in-install-nfslock-libs.patch
>> index a6b297b59..f99ac2bf7 100644
>> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.i=
n-install-nfslock-libs.patch
>> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.i=
n-install-nfslock-libs.patch
>> @@ -1,4 +1,4 @@
>> -From 631d46efff2a6d8970e202ba5422ebedd17a8d2f Mon Sep 17 00:00:00 200=
1
>> +From 0f34d1d91d641c3d5c5bb2eb11bd6eec7cfaf738 Mon Sep 17 00:00:00 200=
1
>>   From: Mingli Yu <mingli.yu@windriver.com>
>>   Date: Thu, 19 Jul 2018 01:00:10 -0700
>>   Subject: [PATCH] Makefile.in: install nfslock.so and nfslock.so.0
>> @@ -14,10 +14,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>    1 file changed, 2 insertions(+)
>>
>>   diff --git a/Makefile.in b/Makefile.in
>> -index 1e4130e..0f1b506 100644
>> +index 8cbda1d..3a74811 100644
>>   --- a/Makefile.in
>>   +++ b/Makefile.in
>> -@@ -77,6 +77,8 @@ install_common:
>> +@@ -88,6 +88,8 @@ install_common:
>>    install_nfslib:       nfslib
>>                  install -d -m 755 -g root -p $(nfslockdir)
>>                  install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
>> @@ -25,7 +25,7 @@ index 1e4130e..0f1b506 100644
>>   +              ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
>>                  if test "$(DESTDIR)" =3D ""; then @LDCONFIG@; fi
>>
>> - clean:
>> + test:         test-stamp
>>   --
>> -2.17.1
>> +2.25.1
>>
>> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Mak=
efile.in-redefine-LOCKPROG.patch b/meta-oe/recipes-extended/liblockfile/l=
iblockfile/0001-Makefile.in-redefine-LOCKPROG.patch
>> index 35549ff2d..c387db123 100644
>> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.i=
n-redefine-LOCKPROG.patch
>> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.i=
n-redefine-LOCKPROG.patch
>> @@ -1,4 +1,4 @@
>> -From 9beb650712d448ad9c0899de9d98e9b623f9c249 Mon Sep 17 00:00:00 200=
1
>> +From 05227e74b732f13ed5a2a98232676f98bba028e6 Mon Sep 17 00:00:00 200=
1
>>   From: Mingli Yu <mingli.yu@windriver.com>
>>   Date: Fri, 12 Aug 2022 11:18:15 +0800
>>   Subject: [PATCH] Makefile.in: redefine LOCKPROG
>> @@ -11,23 +11,41 @@ And it should be "/usr/bin/dotlockfile" on the tar=
get.
>>   Upstream-Status: Inappropriate [oe specific]
>>
>>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +
>> +Update patch for 1.17, also redefine LOCKPROG in other lines
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>   ---
>> - Makefile.in | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> + Makefile.in | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>>
>>   diff --git a/Makefile.in b/Makefile.in
>> -index 6e53179..bfa0acb 100644
>> +index e447cb2..e02d75e 100644
>>   --- a/Makefile.in
>>   +++ b/Makefile.in
>> -@@ -42,7 +42,7 @@ dotlockfile: dotlockfile.o xlockfile.o
>> -               $(CC) $(LDFLAGS) -o dotlockfile dotlockfile.o xlockfil=
e.o
>> +@@ -44,19 +44,19 @@ dotlockfile:       dotlockfile.o dlockfile.o
>> +               $(CC) $(LDFLAGS) -o dotlockfile dotlockfile.o dlockfil=
e.o
>> +
>> + dotlockfile.o:        dotlockfile.c
>> +-              $(CC) $(CFLAGS) -DLOCKPROG=3D\"$(bindir)/dotlockfile\"=
 \
>> ++              $(CC) $(CFLAGS) -DLOCKPROG=3D\"/usr/bin/dotlockfile\" =
\
>> +                       -c dotlockfile.c
>>
>>    lockfile.o:   lockfile.c
>>   -              $(CC) $(CFLAGS) -DLIB -DLOCKPROG=3D\"$(bindir)/dotloc=
kfile\" \
>>   +              $(CC) $(CFLAGS) -DLIB -DLOCKPROG=3D\"/usr/bin/dotlock=
file\" \
>> -                       -c lockfile.c
>> +                       -DSTATIC -c lockfile.c
>> +
>> + solockfile.o: lockfile.c
>> +-              $(CC) $(CFLAGS) -DLIB -DLOCKPROG=3D\"$(bindir)/dotlock=
file\" \
>> ++              $(CC) $(CFLAGS) -DLIB -DLOCKPROG=3D\"/usr/bin/dotlockf=
ile\" \
>> +                       -c lockfile.c -o solockfile.o
>> +
>> + dlockfile.o:  lockfile.c
>> +-              $(CC) $(CFLAGS) -DLOCKPROG=3D\"$(bindir)/dotlockfile\"=
 \
>> ++              $(CC) $(CFLAGS) -DLOCKPROG=3D\"/usr/bin/dotlockfile\" =
\
>> +                       -c lockfile.c -o dlockfile.o
>>
>> - xlockfile.o:  lockfile.c
>> + install_static:       static install_common
>>   --
>>   2.25.1
>>
>> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/configur=
e.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patc=
h
>> index ea13e11d2..56f2d05eb 100644
>> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
>> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
>> @@ -1,10 +1,17 @@
>> +From fd3fce8c1a3d0c70a0ffd461fbbe7e2ef71dd3a7 Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Tue, 7 Mar 2023 11:05:45 +0800
>> +Subject: [PATCH] Update patch for 1.17
>>
>> -#
>> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patch=
er
>> -#
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + configure.ac | 8 +++++---
>> + 1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> ---- liblockfile-1.05/./configure.in~configure
>> -+++ liblockfile-1.05/./configure.in
>> +diff --git a/configure.ac b/configure.ac
>> +index df26cee..76e9165 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>>   @@ -1,4 +1,5 @@
>>   -AC_INIT(lockfile.c)
>>   +AC_INIT
>> @@ -12,7 +19,7 @@
>>    AC_CONFIG_HEADER(autoconf.h)
>>    AC_REVISION($Revision: 1.0 $)dnl
>>
>> -@@ -111,7 +112,8 @@
>> +@@ -111,7 +112,8 @@ AC_SUBST(TARGETS)
>>    AC_SUBST(INSTALL_TARGETS)
>>    AC_SUBST(nfslockdir)
>>
>> @@ -23,3 +30,6 @@
>>   -)
>>   +])
>>   +AC_OUTPUT
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/liblockf=
ile-fix-install-so-to-man-dir.patch b/meta-oe/recipes-extended/liblockfil=
e/liblockfile/liblockfile-fix-install-so-to-man-dir.patch
>> index da2503339..046cd8e69 100644
>> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix=
-install-so-to-man-dir.patch
>> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix=
-install-so-to-man-dir.patch
>> @@ -1,4 +1,4 @@
>> -From 363eb1aaeca914c7d36a2cdaf1417e4f87af4c22 Mon Sep 17 00:00:00 200=
1
>> +From 079d04c187800e22f18723c74e41c4e46eef67f8 Mon Sep 17 00:00:00 200=
1
>>   From: Mingli Yu <mingli.yu@windriver.com>
>>   Date: Thu, 19 Jul 2018 01:12:47 -0700
>>   Subject: [PATCH] Makefile.in: define dotlockfile.1 installed to man
>> @@ -16,10 +16,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>   diff --git a/Makefile.in b/Makefile.in
>> -index 0f1b506..6e53179 100644
>> +index 3a74811..e447cb2 100644
>>   --- a/Makefile.in
>>   +++ b/Makefile.in
>> -@@ -71,7 +71,7 @@ install_common:
>> +@@ -82,7 +82,7 @@ install_common:
>>                  else \
>>                    install -g root -m 755 dotlockfile $(bindir); \
>>                  fi
>> @@ -29,5 +29,5 @@ index 0f1b506..6e53179 100644
>>
>>    install_nfslib:       nfslib
>>   --
>> -2.17.1
>> +2.25.1
>>
>> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb =
b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
>> similarity index 72%
>> rename from meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
>> rename to meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
>> index e07dab3c7..68123e35a 100644
>> --- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
>> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
>> @@ -4,8 +4,8 @@ SECTION =3D "libs"
>>   LICENSE =3D "LGPL-2.0-or-later & GPL-2.0-or-later"
>>   LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df4ba6ad04fcb05cc30a4cfa=
5062c55a3"
>>
>> -SRC_URI =3D "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.=
orig.tar.gz \
>> -    ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14-1.debian.=
tar.bz2;name=3D1.14-1 \
>> +SRC_URI =3D "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.17.=
orig.tar.gz \
>> +    ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.17-1.debian.=
tar.bz2;name=3D1.17-1 \
>>       file://configure.patch \
>>       file://0001-Makefile.in-add-DESTDIR.patch \
>>       file://0001-Makefile.in-install-nfslock-libs.patch \
>> @@ -14,13 +14,13 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/libl/liblockfil=
e/liblockfile_1.14.orig.tar.gz \
>>       file://0001-Makefile.in-Don-t-try-to-run-ldconfig.patch \
>>   "
>>
>> -SRC_URI[md5sum] =3D "420c056ba0cc4d1477e402f70ba2f5eb"
>> -SRC_URI[sha256sum] =3D "ab40d4a3e8cbc204f7e87fea637a4e4ddf9a1149aaa0a=
723a4267febd0b1d060"
>> +SRC_URI[md5sum] =3D "918c4c07f7b99fc327db8bf39d3a1804"
>> +SRC_URI[sha256sum] =3D "6e937f3650afab4aac198f348b89b1ca42edceb17fb6b=
b0918f642143ccfd15e"
>>
>> -SRC_URI[1.14-1.md5sum] =3D "f9a44928c3477d218c56252712ebc479"
>> -SRC_URI[1.14-1.sha256sum] =3D "73f9be769e602149391588c28f0f4f5cda131e=
30fb94c0777dbb23d811ac21ff"
>> +SRC_URI[1.17-1.md5sum] =3D "40415c5702f82681d9811e4e9e182813"
>> +SRC_URI[1.17-1.sha256sum] =3D "e3657c0e3facfeccb58900c0b48d56cd68ad5f=
9f24d1b4c6eaa69c26490fb673"
>>
>> -S =3D "${WORKDIR}/${BPN}"
>> +S =3D "${WORKDIR}/${BP}"
>>
>>   inherit autotools-brokensep
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101442): https://lists.openembedded.org/g/openembe=
dded-devel/message/101442
>> Mute This Topic: https://lists.openembedded.org/mt/97492257/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

