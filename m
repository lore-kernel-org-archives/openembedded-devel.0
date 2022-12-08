Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F32EC4708E
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 03:12:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4332.1670469127381651813
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 19:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=rhhMTSL8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9341c1888a=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B82paNR029100
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Dec 2022 19:12:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=++Pi7avph6m4McQTo3KTSTq5PUyFuzw2szX3SfDUWLE=;
 b=rhhMTSL8UWZoZoZlKJGvM/QISmuOuKf7KQM/lNABQ8Rzd8ipgLhzLPcB+skpFRNf2Ecn
 yQ98O+EkHhn23blrePiiDwvv5hmoPKuEGj3djD7g9dbMb8/E4aeoV128AKgo8FN/8sCm
 McgYde/z5B7F1Dh27o7x4gZ/+0T/oYlSpyhQJt+P645g5GiM1ZJTSjhLGiu2qq0xtvt9
 xYdg8E+2t8V4NgXOJ3WSyugK27YPE22jHWbkDWqCaO0BU4tpbvYgOmzMU9c2pQgE3wxr
 p0q2JM76pLKsYx91tiEfdSsEpNKceviZgskzJcZvXSNXrJxSPuiV/FPZ7PnnGFb+jaF+ ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6uyf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 19:12:06 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B83C6lN011725
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Dec 2022 19:12:06 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6uyey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Dec 2022 19:12:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Flv0HSW+8sb0WjYgUDF1QUq5xExH4bVBDBil4lDhR+CMpuD+8R/zJg2JQ3Zh0VW8ZpJ2fjZi5gOu0v+dfJRnwXgDGg3+Gx5NzIV98RiRwkhNZ2vdilJN6I3raJ1GJpei8V98+WwTz34nxqCQqH46WJKT7INJ87kju1JwzWCjLVwiS40Eru5Oh8RVAyHX9ohsh4mu2SR74+0m1t1OZANy1+njSykB+7aKClwJFB0xSo5wJ0zDGyZgOJWtBuP2XdUg2VICZaoUE9SBbJ0C1bt/CF3rVJZyn1VDpaK3/SEjfMsA6Vh1KT3xL+5eGsbWHjRx1VsFOENA8lesb0F/cGbAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++Pi7avph6m4McQTo3KTSTq5PUyFuzw2szX3SfDUWLE=;
 b=Dg72JwWHjV9GHc2gFzunGjnzfbgpgP5jLRSaLBpu7peDiHRN5MhtxKE9xdV+BdO6PoEJu5Ld+BDYuRvFgmyTMIR0wRgdh3KN5qPQu7GCO1OWc5t3lY4nzvrQtMDqbgk6jHZWp6Pxw3PIui0bdCxZteI+6FVVquRi0cWx1MZdKICbZlW2kYKoh4x9imFJlaQvoXi5l3EeZ0iL1H7D3SeAdxWvDdnDYz7Zi1FSxSiKn13Rh5vuRl8oelgcA9d6Hk2d+nFk1/m7BCMC2ye3SaZh0o10DoQPR2Fj3f/4bfhMRLxDX90sGyDwXbWPXyH//XTUsBtZ32xhLnDJcWMdus3NaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 03:12:02 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dfdc:1e8b:daa4:455c]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dfdc:1e8b:daa4:455c%3]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 03:12:02 +0000
Message-ID: <05acfc7f-1cde-81e0-7802-a8b36b7f20b0@windriver.com>
Date: Thu, 8 Dec 2022 11:11:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH] protobuf: upgrade 3.19.4 ->
 3.19.6
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20221207114011.28123-1-zhe.he@windriver.com>
 <d89c3a17-c188-6452-13ab-ee2f91e2c9b6@gmail.com>
From: He Zhe <zhe.he@windriver.com>
In-Reply-To: <d89c3a17-c188-6452-13ab-ee2f91e2c9b6@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SL2P216CA0228.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::14) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|PH0PR11MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: c49d4aff-2c8c-4a42-a688-08dad8c9fa41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hlT9WcpUZO7Ja73///mUlhS4Qb2W48TVWOD2vCS8T+AZjutq+uL4kUPqynyGD9i4r4FgSFISUwLbfcxrDetL2HUyTqFWnlqFB1+NCjBDPg6dG5CCwlTF1SB/Co6DmoAIcooi/rJlGPOTWzCfJ5sW011FIEmOTD2FhsEYZAF2q9i6YY2PNI/sAJT6G+FMsypQhPVqnM5ZC43Seg1Pt+RfZTkKAsEhpFaH7hKrbAab93DJcOu6D3mLAkWJDdwujqEXGVVw44LOadefHNpWu+lIfULqKk6is6VYLJ5j8DnSpeWLVBYWaHaFIMLeG1hLDo9SZKKoYRKwps9dBWBTUhzUNsAhn16jhIgOYFKlskiD9uPNeI5RWcVdb4ZIqappIPx50nuzxxj1Rv3GcRiPEjgDsVkeAm3IEjxvpB13VcRrGSQiqEI23CdvXXPbFOa3cQJ9qrScMWXa1rneyyY6tHy0WvZNw57dWm3C9n+gL7G9/M3/+JZYYh/MU9i0/9f2c2f0kmLpLB1fQDYO5bTYvtnC5n45/mOWwpbl12O2BU+3VBq1XoOqPjYXwLaHf79qQzrlhmWk7lLCSMFEob9inepA9XcLhwAGRxEso7GlRV8MDvlclZCRFxV+M6yDyXunwhOzo42EKeyESCvQPRcDMz5g22+LaS0PipcUJmAgrH8peda/Fdnk29sBG39RlHdS/vIKHgq38jYjU7d8ekCGLo1PBB5vl6uBPlrVNrJidKGwMz/2FWoeL9tsQD7QO/MMt7KwU5CjWcoJ5kx1dBdP2tKe/imuwAP0jog0SAKdKYTZj6o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(451199015)(31686004)(66899015)(2906002)(31696002)(86362001)(5660300002)(41300700001)(2616005)(8936002)(6666004)(66476007)(53546011)(186003)(83380400001)(66556008)(36756003)(66946007)(6512007)(26005)(8676002)(6506007)(316002)(478600001)(38100700002)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZHFTT3J4WUhkNTExd3BYb0JUTGM1UGgyamtkWE9BVzdGZTNSTlE0cXhaaUpE?=
 =?utf-8?B?V01KN0RIRnhLVVZrTHFWQmE1Z2R1NHdKSkhCb1lrVWlSTTRXc00rekJ2dVVR?=
 =?utf-8?B?QUFoOVFEL0N3SmVsb2dHbGltYWNzZU5lQ0ZJa1JxZDZSWW1mTTB6aDBZRzF2?=
 =?utf-8?B?Vk42Ui92QThsNXVqeXJiNGxYYmFacDFCdUJjZUZqWllLUm1DUDJWanJKdXFi?=
 =?utf-8?B?SUxtdTZodFZiazdqVkVLd0RtSWdrZmpXVVFVM3NwM256NGZJQ2Q0VlpTL1pG?=
 =?utf-8?B?eE5tNksvN2dTbUdaZjExWmZGbERKQW9mZmpvSVd4QkZFZitMVEJzRWVxQVZC?=
 =?utf-8?B?NlRDa2E1RC9XU3FGM0lkOERPc2I4dzFxK0lBTlpMVSsyUGNTbFVvNTRMQ2x0?=
 =?utf-8?B?MndDdzBrWFI4SEtRaHlocGV4YW1pTTJoLy9rSFRpNUpqdnZVa1hZbmZDR2py?=
 =?utf-8?B?eHV6ODlsZkZ6V1pRRVNoQ3JhS2plNTllZlNweXZ5dUU0elF6bHA0LzkxODhp?=
 =?utf-8?B?c2VsbEUrM1ppV3lwRFRraEdwYk8wckRkdzFoTmRBSHM3TnU3cGEvT241Vkcw?=
 =?utf-8?B?clJiS0M5T2tuT2owdkNlWVNnUTZTcUI2cmMrd1BHcXFrNU93dlRkRVczK24v?=
 =?utf-8?B?QjNpQk9rd2hqaXVWY3lCL1Avak5OQ0o5WE5wejhLTzJTWmhlY3dQOEhrRkhY?=
 =?utf-8?B?ZWFKcDh4dlRZQXdic2l4V05JSVMwa2k2NFN2YkhySkdsbGtvZENUY0NiV0NR?=
 =?utf-8?B?TWxtTU9nNXc3SzUrUmlrdjNxQXdIeXNmS3NDNlNsYjZwSm1RRlIrOUU4STJP?=
 =?utf-8?B?SHhBQjh1akwzdGdYSzNFR3E2RlVuNVhibWpweVFiVnE4UkpRVGMvRk5UOTk5?=
 =?utf-8?B?dSs1dzJwOWZFQjFoTndXSzJVSXVlcVpGdVNGWStad25wSnRHYWtwRzVRdDBZ?=
 =?utf-8?B?VzM3UVVtQmpYSkxBWEpjRENHZDlIUkpxTnFZajZWK1p5czladmt1U04yTXhJ?=
 =?utf-8?B?MXZVbEdwc2JzNnVWUGtVd3pGMkZqVDUyVE1odXlJcFgwcEYvekY5aHM1Tzhh?=
 =?utf-8?B?b3c5VWs3VWpyMWhSRkE1N3RxY3VEL0k1WG0xSTJ4b3g3MjI3N1dEYUx6RGxX?=
 =?utf-8?B?Vm9UeU1MZUo1Y0MvY09ZVHhPRXV0UVhzOGNYU0QrZG1YY2Q4QlI1a2RWYlh6?=
 =?utf-8?B?SG5sWXJEZ3RISFppYWFlUkNZU2JqM3hNZlZobDFWQytodEIyQ0FoVTFYZE10?=
 =?utf-8?B?dldKUDQyVVhNU3pWMDBOaDRCc1dqbWpmRmZLOWY3cEd6aFdjVDZEOUNXTkJ4?=
 =?utf-8?B?K1loY2VNUjZhaFdxRGdSUFVCV01EM09nU2NBelh3a3hmdSs3a0VpNTdLSXU3?=
 =?utf-8?B?ZTJHUDRETk1mWGtQVXR1Vm9EZ3Q4RnQ0a3NHbk1SclhmdE4zdU8zSTdPdWls?=
 =?utf-8?B?bWZNdnZiRkcxUFNaYTYzL3VWWitqZ3JNcnFOUitDQm80N01Mc0s3UDJXNWxt?=
 =?utf-8?B?NnFwYmh5SytIKzd0OTRpMS9lMzJjSCtaQ1J1WWFRSUlTNDRWQjdDekdmRGZa?=
 =?utf-8?B?NmpNVVUyWXZsdzhmWU1qRk1WOHdBVTRlT0Q3L210cVlrTHJpNmwvSGZCWXUx?=
 =?utf-8?B?VGh0QjZ5Q1RzZUZyWVJJcmN2RWk4dGt1UmZ3SUZBSTliNXZrdVg4Y1NFMy9C?=
 =?utf-8?B?dTROazR3ZkdRN00zTDR4V0d3ajJIWUhOUkkrY2VpM0tJQXNybmY3V05NNXln?=
 =?utf-8?B?L2wwZEdDd0Z6SndnanM5RldmL3VJVC8yMDBnOU53U2I3clpxRkpoRUltSjNO?=
 =?utf-8?B?cjlzdWh0VFpWNkVWRzg0MHNGdlgyelNsWjk3cHAwU1RQall5Tmg0SmNjV1FC?=
 =?utf-8?B?MHN3anUyQkhxVHFPNE5QK3dYQnZuN2ZVKzdzSzlaazNMVml5VHRBTUNBdVky?=
 =?utf-8?B?OFgwVGlnSEgraTR1disya3A3MWFad2dUQk9oMHlZTW5VK204QnJ0UzZta002?=
 =?utf-8?B?RndtQW1KT2NxdlZNTHdVblBKWG9EMHlDaGNwcGI0cEYyeE02Mk5UK21JWnhE?=
 =?utf-8?B?Ym9INTRQdDRIZkljNkpqMUl2NlpJMTcyeGZpdnZwNjlJTzZjTmQ3RzN1Y0hj?=
 =?utf-8?Q?WqXdTQ7Z00NhTIIdEjuP8IfMx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49d4aff-2c8c-4a42-a688-08dad8c9fa41
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 03:12:02.8572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrQ50bwcv4ZtLYkKpRUjwk0ShUPRSZWMNUNRi8V/bfoVxE4uEwOV3+rvcpCUhMrDvyEEC5KluMZpDqddL4Whcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5095
X-Proofpoint-ORIG-GUID: whFk5rlMx16SzImbV00Yb2EvHIgEos5B
X-Proofpoint-GUID: LhnYDOSyFsjLBvK8dqHelw5lz3ealGrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_11,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=961 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212080025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B82paNR029100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 03:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99985



On 12/8/22 02:32, akuster808 wrote:
>
>
> On 12/7/22 6:40 AM, He Zhe wrote:
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>> =C2=A0 .../protobuf/{protobuf_3.19.4.bb =3D> protobuf_3.19.6.bb}=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>> =C2=A0 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.19.4.bb =3D=
> protobuf_3.19.6.bb} (98%)
>
> Is this a bug fix only update?

This is mainly used to include fixes for CVE-2022-1941 and CVE-2022-3509.

Zhe

>
> -armin
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb b/me=
ta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
>> similarity index 98%
>> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
>> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
>> index 566233084..8e5005471 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
>> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37b5762e0=
7f0af8c74ce80a8bda4266b"
>> =C2=A0 DEPENDS =3D "zlib"
>> =C2=A0 DEPENDS:append:class-target =3D " protobuf-native"
>> =C2=A0 -SRCREV =3D "22d0e265de7d2b3d2e9a00d071313502e7d4cccf"
>> +SRCREV =3D "c9297981b7c35ad9c2bf258e7c8d786a04d13378"
>> =C2=A0 =C2=A0 SRC_URI =3D "git://github.com/protocolbuffers/protobuf.g=
it;branch=3D3.19.x;protocol=3Dhttps \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://run-ptest \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#99974): https://lists.openembedded.org/g/openembed=
ded-devel/message/99974
>> Mute This Topic: https://lists.openembedded.org/mt/95513566/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>


