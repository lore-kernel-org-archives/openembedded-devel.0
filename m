Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B793E70715
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:18:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19694.1695385126730839543
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ccv13cT0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7629d4ac35=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38MA0WND004326
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=su4Z5zs9pR5SxiPJ7zbe8hZDt32APkXvQwKG5PAk3/Y=; b=
	ccv13cT0Vr+/rFu9rBTUnh5O3JLeB+QSGyxN3kVlnrG7zZ+RiT6BR3ZS/w725zIx
	SGp4Kx3UQlE0YvkuU6COvfbO9o53ypqmZi9p1vSyRHJHeus1mcrqavXusTkChm55
	Cq2n8XB3IQrzDvpIkvatiyyIciNw+AJW+RrxqwKEj+MIS+xjsqJq7wE49O6MKVVA
	7qgCI95hUa/iLfOVQmfYzhxcFSrN0EuDvytY5WFrkZthuNcQ2Myqa1MGucDeBWc9
	T6Nj1/pOsPWgvvKJV2m9Ibtwnv1tmCFV7XEb+mnIRZNd+IYBLwadyE3gEzIvibA3
	YmNv2OEeINjbgoE+iW5OCQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tvx0qv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:18:45 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38MCIjfE023961
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:18:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tvx0qv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 12:18:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDeyJkZxbbl/D78XnkVAGmroGo+bDdtq2IZ163JvwoKLRV62UqtsUx1+vNGqNx8iMjEcTsnAiP5fYFrFWaN1aekVf7mmVUqYFS9sOIzZXBioc/L33W6J5oGohSY4TgiPS0PVBu2T9PDnbkugMNuKp/663TQKAoQjqdDAeksqAiA2Z6bu7PDVJVlbO8VdzvXjQNfThmIbmpxNoBYQndQPds3rKSKQtmrn0f4S32jrhJFZ8PhouK3DRqQOJ9POsa8YW8mJutGGEKuwBSOokvBu5ekxMXVeyWak1u1bd0E838u+kGw9Kki7bsnycA2UWiDwIo486LsIw1L3nxm7QDX0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=su4Z5zs9pR5SxiPJ7zbe8hZDt32APkXvQwKG5PAk3/Y=;
 b=PKSSxEDe8Q2B6OIY+XhQUKtQVTCRyY2ADtAYp/civRNQY2qLyqSf9sg2oDdyIhQyJA8MaVPyEulFkERBGgX4WShl8nFKrqXi9IspGNQwO45SY/5CmnX4tzGrq3LeWalFqgj3EmFlkmZUkgcJtFuSb4/a8ks3q/V+P5nLAXyoBBpQqXzlIg0wkDrJKETTDLE8ME8E9L7Q5BBCvpURR6qL990X2pjE+yjAtSqWfBmJAH1OM7uFBxYqshAMmnGJiiDnGH46Us76/2wvFAK6iZlnX41ZMHNEnEo4fUKzfxCAmrgwqyAsVIJWK70hU8OZbC0u24J+LoN9dzo1kObqjHcFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH0PR11MB4965.namprd11.prod.outlook.com (2603:10b6:510:34::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 12:18:43 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 12:18:43 +0000
Message-ID: <2f957332-7064-0463-b504-92842afc6071@windriver.com>
Date: Fri, 22 Sep 2023 17:45:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [oe] [meta-python][kirkstone][PATCH v2 2/2] Introduce
 python3-trustme to fix ptest error of python3-requests-toolbelt
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <20230823104110.1949022-1-narpat.mali@windriver.com>
 <177DFD136D69B7A7.28529@lists.openembedded.org>
 <1782D94E6954A090.4793@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1782D94E6954A090.4793@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH0PR11MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bb37a5-1159-407d-fdbe-08dbbb660fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D/jwEGgDdSWe0J19xyFQbkH9zAqdFaoPIaHOZpAnwhAEzwPYaCtI+84hAhh7hhGwe+HTA61WsexWR7WNQblaeERMatAneS+9TCSabm0dQHjdTy6K+kfx81maoHp58a8RLW8io9v/XFYkq4FOTrim3K5Zjripr4B7B/La5B1K8ItpGJECYZl1PLc11CbqQnpM3sLfa20KMFJgLTxCQYKdVEM9vv1K5gDi+bTxW3U21GQqmilXydY++tLb1rJjxqIkysJsZrsW0ylLSHXswSM1h8N1DaNw4gw1yKzs74YqqTeQrPOmaOANih/mawkvYKPRfRQVut5ST6aE1ybBvu44FNgGFZBi84i8o6JTI9vOf5tr0DCqUpPg3r6jyKygrL9aWEixpaxKO2t7tLAP1MrivTm1WxL80wPCrgyPtpNFsa7USXc6O5V9WYJlc5GJZl+xUpruXc4YVqWxLRbVEL7imgDE6GO2YZVXnkxxiq4q66eQYSiJSFd0f67d7tm9+cHaRG8C3bio9UI9YECXRZRjaLRXwtypgviLE5/Pio8wmCGAzBrDhVldHk8bSkkibGkFWrfap3IKG56IyxvJcAHh0Dk3Wr01ndpg5KnikfIqRBkfzhFjc6qaq7VwgoDt6wvpwdJSGWhxoaJUwY2AedrvjLbQhjnBMXdnVNAUP5qNNzk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39850400004)(366004)(346002)(451199024)(1800799009)(186009)(2906002)(31686004)(5660300002)(26005)(66946007)(316002)(66556008)(66476007)(41300700001)(478600001)(966005)(8936002)(8676002)(6666004)(6486002)(53546011)(6506007)(55236004)(66899024)(6512007)(36756003)(2616005)(38100700002)(31696002)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WXlldUZzcUZ4ejNzSFRMNUlUWDhRYTV4RCtubmlHS2tYNy9KS1VoVlFxOFBz?=
 =?utf-8?B?bE8xTmQrbC9jcDk4b0NQZkNScitpdUNzRUx0SndhaVJFL0EvNFhoQSsySGpa?=
 =?utf-8?B?b0tRUmpzZC9nTGMvd3Izc3NVWExxem9vWTBoOENWQ0ZVd29kV2dRc2FHK1ZO?=
 =?utf-8?B?cmJnS25SQ3p4amxFKzBOeituZVh4aXV5MGxOZ09ERk9YQ28wYTRNRDN5OHVY?=
 =?utf-8?B?bG1UWllsbSsyNVU2TVVGRHRrWjJuZTRDNXpXSmU4UzkxY0YzR25rN2pQdGRF?=
 =?utf-8?B?V3RiVHE4VVd3eEpNWElBN09GeE84UHNzd1BIVDZEUjZkY1d4blFXeW9xMHBE?=
 =?utf-8?B?TUVvRFBPWVkvRXVYdFpkRlBSY2NlSXpVSy9OL2hGRnhoV1RoT3F0WFlBR0Ex?=
 =?utf-8?B?WGhCSk4rZ1dxQUUwaGNEUTMzbkhDY2IzK1NSbjY2NVI3VFMvQ2Exd2Rob1FX?=
 =?utf-8?B?Uzc4OElXakZYZjh3RFRNUHVyU2JvODlFYVg2OXdObW9EdXB2OXkzd2dEbzN6?=
 =?utf-8?B?NWZUanNRN1VTODRnd1pZY1RIbDQ5K2h0dWNIYnN6Ny85cDFEb2tnR1cybE0x?=
 =?utf-8?B?WkFTWGZidU9kUGJpYTZNeWFjVmUvRVEyMlJKVnZBWGkyK1NvK1ZOQTRRdjVw?=
 =?utf-8?B?M29qVHA1WDBjQWlkK2xZQy9ndnN3TnZ6RS9JN1NGeWtWT2NkSkZqRW9UMEZl?=
 =?utf-8?B?SVhZQndtZk0rYXN0bDg3eFQ3SGY4Sm1leVREb1U3b1QvWXEzQ3dtMFM5S3lE?=
 =?utf-8?B?ejZPb0h3WlFFTzRkZFdEamtrMXNuUXl6ODZIc3RrNXhoMjJINGxKZjd5T2la?=
 =?utf-8?B?TlMxZWZxa1NaN08zT001V25xU0xRN3ZqcDZxVC9jWmNwMGtTa0MzRGJ0K01R?=
 =?utf-8?B?UnR5R3Rhd3A4ZHQ5YW41Q2VSL0tIM1Vnb0d4ZVNwcm9jVXpCeXc1b3ZaanZz?=
 =?utf-8?B?VkQ1SUF3bGJZMmFpQlRZOVArV09XTUIrMjRPZGJ3M1IzVEVVenFWMDNnWW9s?=
 =?utf-8?B?eThSWi9GOXk2MUhVS2ptQU0zbVBUM2pLK3loVGowV2FydW5jaE4wVyt0ZTg0?=
 =?utf-8?B?K3kzeUJhZWNveml6a2VXWnN2RUNkVUtNSWNEM3k1OFV3aEtBMFRJRjU0NEtz?=
 =?utf-8?B?QU90aFIyVExmaFZTdk5Sb1Ziakwwbi9WenhNQzUwaFVyRlM2R250UzVHR250?=
 =?utf-8?B?VEs4cXVBaFowcUgxdXRVeXJrelBVcjZadzJmQVFLdjUwV2lWTnVVMnVkakdW?=
 =?utf-8?B?b0xjUGN6dDFVdm1tVlRkaVlEOFpPVitLdlNVc1hhVDN1L0pmZ1YxbHhRVENM?=
 =?utf-8?B?Znl5MTlZK3lKdlRaWTJtYzFYOTNNS2dEcWdxMFVqbVFoRHl0ZlpMNUxLZDUw?=
 =?utf-8?B?MndCUFJCbGtYb040U1JZRlV5Tm1rb05NTW9LL0lrU01JTmNWeDdBcWw2YTBT?=
 =?utf-8?B?MjdkWFU1NXNreGZiK0dOZHBEM1hUaGcxWjhRbEdtd1ZhYUlCc281aWZ1N0FV?=
 =?utf-8?B?S3NCQzVVbzRiMTFVcG5hbXRDejgzeDdLZmRZcmtCa2w1eXl4RGFDcTU4cDR4?=
 =?utf-8?B?bUpBZUlHNUhnUE9ET1Q2TlIwUVlkNkcvaDlYWWJEMXNUaU9PVlE4RUhXWHFj?=
 =?utf-8?B?NjJpZkpBOWNJdEdlbDBoQ0JXVTc4TFRGS21OV09oTjA4YjVwUHY0THdxVkg1?=
 =?utf-8?B?bjJ2TmVNazdXbHpBaEFnUThrY1RhZUhQRjlBZy9CK0lEWEdsNlhjUGVZU3dh?=
 =?utf-8?B?d0dhZzNLbWNTNmdMYmUySUtIUTRIZzhEMnlrbUNkeW5Lb1c5UXc3U2NEMVBa?=
 =?utf-8?B?a2V0dzJmYWxvQXJVQkc2TXRTdFFpdFoveDBVUUx3WWZpUnpzQVA2ZDViaDFv?=
 =?utf-8?B?bkI4d0x0Zy93YWtGMkNpV0x5dXVaSzlwUW9wQnJPSWJOcUdiZDhPTjRZTlYz?=
 =?utf-8?B?ZTVlTjhRN2EwWFJhdUNwNFAyOXMwWktDVVRSYUJHVzF3SHlpajZwcjR6cVdC?=
 =?utf-8?B?YVhLOFljT2tFMzVKSWZ0eDdCM0p3VktxV2d1K0xheWw2eTNzNk1DNTU2QUdO?=
 =?utf-8?B?dld5YmFBNk93V1d5K1ptQUVNRTVQRE4yOXM5OHFaZXBkbkYvYVlKMHNaQ09h?=
 =?utf-8?B?OTFESVdidFFxSS8xUk8rUUtZZmY2cENOS21yVUhQY3ZXYkpzSGljdVREQzBm?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bb37a5-1159-407d-fdbe-08dbbb660fd4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 12:18:43.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+gajyZMHeJYdmD86aNgdnfEHTM53zftaAHhIyaBKSgzfvDzRF83G7kYx9keS6ybbYVrnOCOHFZR5OIqPcj+fhA0gU5AlAnZUFpTsDb/DjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4965
X-Proofpoint-ORIG-GUID: FrhMbIlpMfE5xrIjGpSZ6IOWquCXUdCO
X-Proofpoint-GUID: kVIGzVR8GXJ9mAfluy-02WDGBlgM4yB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_10,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309220104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 38MA0WND004326
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105061

Gentle Reminder !!

../Narpat

On 08-09-2023 12:09, Narpat Mali via lists.openembedded.org wrote:
> Gentle Reminder !!
>
> ../Narpat
>
> On 23-08-2023 16:11, Narpat Mali via lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> The ptest fails after python3-requests-toolbelt is upgraded
>> to 0.10.1.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> Hint: make sure your test modules/packages have valid Python names.
>> Traceback:
>> ../../python3.11/importlib/{}init{}.py:126: in import_module
>> =C2=A0=C2=A0=C2=A0=C2=A0 return _bootstrap._gcd_import(name[level:], p=
ackage, level)
>> tests/test_x509_adapter.py:20: in <module>
>> =C2=A0=C2=A0=C2=A0=C2=A0 import trustme
>> E=C2=A0=C2=A0 ModuleNotFoundError: No module named 'trustme'
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>
>> The commit b93b4067ea "Fix x509 tests by using trustme" of
>> python3-requests-toolbelt introduces the trustme in=20
>> test_x509_adapter.py.
>>
>> Introducing python3-trustme to fix ptest error of=20
>> python3-requests-toolbelt,
>> also introducing python3-service-identity, which is requested by=20
>> python3-trustme's
>> ptest.
>>
>> The ptest passes of all the three packages.
>>
>> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> Cherry-picked the upstream master commit:
>> https://git.openembedded.org/meta-openembedded/commit/?id=3Da4b6e3ee89=
4047cd13c5d2b7bfc67f0093899537=20
>>
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>> =C2=A0 .../packagegroups/packagegroup-meta-python.bb |=C2=A0 2 ++
>> =C2=A0 .../python3-requests-toolbelt_0.10.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 .../python/python3-service-identity/run-ptest |=C2=A0 3 +++
>> =C2=A0 .../python/python3-service-identity_21.1.0.bb | 25 ++++++++++++=
+++++
>> =C2=A0 .../python/python3-trustme/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
>> =C2=A0 .../python/python3-trustme_0.9.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 27 +++++++++++++++++++
>> =C2=A0 6 files changed, 61 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-python/recipes-devtools/python/python3-service-identity/run-ptest
>> =C2=A0 create mode 100644=20
>> meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
>> =C2=A0 create mode 100644=20
>> meta-python/recipes-devtools/python/python3-trustme/run-ptest
>> =C2=A0 create mode 100644=20
>> meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
>>
>> diff --git=20
>> a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb=20
>> b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> index fdeb83c42a..c2481eb307 100644
>> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
>> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
>> @@ -373,6 +373,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-send2trash \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-sentry-sdk \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-serpent \
>> +=C2=A0=C2=A0=C2=A0 python3-service-identity \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-sh \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-sijax \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-simpleeval \
>> @@ -408,6 +409,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-trafaret-config \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-traitlets \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-transitions \
>> +=C2=A0=C2=A0=C2=A0 python3-trustme \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-twine \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-twisted \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-twitter \
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1=
.bb=20
>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1=
.bb=20
>>
>> index c39950ab5d..7191a3e6c1 100644
>> ---=20
>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1=
.bb
>> +++=20
>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1=
.bb
>> @@ -21,6 +21,7 @@ RDEPENDS:${PN}-ptest +=3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-betamax \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-mock \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-multiprocessing \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-trustme \
>> =C2=A0 "
>> =C2=A0 =C2=A0 do_install_ptest() {
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-service-identity/run-pte=
st=20
>> b/meta-python/recipes-devtools/python/python3-service-identity/run-pte=
st
>> new file mode 100644
>> index 0000000000..b63c4de0d9
>> --- /dev/null
>> +++=20
>> b/meta-python/recipes-devtools/python/python3-service-identity/run-pte=
st
>> @@ -0,0 +1,3 @@
>> +#!/bin/sh
>> +
>> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e=20
>> 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e=20
>> 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS"=
 ||=20
>> $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XP=
ASS"){printf=20
>> "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=3D=3D"PASS" ||=20
>> $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XP=
ASS")=20
>> {$NF=3D"";print $0}else{print}}'
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.=
bb=20
>> b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.=
bb
>> new file mode 100644
>> index 0000000000..0210a5de22
>> --- /dev/null
>> +++=20
>> b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.=
bb
>> @@ -0,0 +1,25 @@
>> +DESCRIPTION =3D "The tools for verifying whether a certificate is=20
>> valid for the intended purposes."
>> +HOMEPAGE =3D "https://pypi.org/project/service-identity"
>> +AUTHOR =3D "Hynek Schlawack"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D8a0f079f4e6a215d6bd6f9d97cab4d5f"
>> +
>> +SRC_URI[md5sum] =3D "5e5c195d8fcedc72f9068be2ad9b5a13"
>> +SRC_URI[sha256sum] =3D=20
>> "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
>> +
>> +inherit pypi setuptools3 ptest
>> +
>> +SRC_URI +=3D " \
>> +=C2=A0=C2=A0=C2=A0 file://run-ptest \
>> +"
>> +
>> +RDEPENDS:${PN}-ptest +=3D " \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-pytest \
>> +"
>> +
>> +do_install_ptest() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${PTEST_PATH}/tests
>> +=C2=A0=C2=A0=C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>> +=C2=A0=C2=A0=C2=A0 cp -rf ${S}/setup.py ${D}${PTEST_PATH}
>> +}
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-trustme/run-ptest=20
>> b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
>> new file mode 100644
>> index 0000000000..b63c4de0d9
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
>> @@ -0,0 +1,3 @@
>> +#!/bin/sh
>> +
>> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e=20
>> 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e=20
>> 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS"=
 ||=20
>> $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XP=
ASS"){printf=20
>> "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=3D=3D"PASS" ||=20
>> $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XP=
ASS")=20
>> {$NF=3D"";print $0}else{print}}'
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb=20
>> b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
>> new file mode 100644
>> index 0000000000..641512c46c
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION =3D "A utility provides a fake certificate authority (CA)=
"
>> +HOMEPAGE =3D "https://pypi.org/project/trustme"
>> +AUTHOR =3D "Nathaniel J. Smith"
>> +
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3Dd5a7af1a4b73e57431e25d15a2da745a"
>> +
>> +SRC_URI[md5sum] =3D "0e4d698e5aecaf8306cf440bf3dcbbe0"
>> +SRC_URI[sha256sum] =3D=20
>> "5e07b23d70ceed64f3bb36ae4b9abc52354c16c98d45ab037bee2b5fbffe586c"
>> +
>> +inherit pypi setuptools3 ptest
>> +
>> +SRC_URI +=3D " \
>> +=C2=A0=C2=A0=C2=A0 file://run-ptest \
>> +"
>> +
>> +RDEPENDS:${PN}-ptest +=3D " \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-pytest \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-service-identity \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-pyasn1-modules \
>> +"
>> +
>> +do_install_ptest() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${PTEST_PATH}/tests
>> +=C2=A0=C2=A0=C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>> +=C2=A0=C2=A0=C2=A0 cp -rf ${S}/setup.py ${D}${PTEST_PATH}
>> +}
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104799): https://lists.openembedded.org/g/openembed=
ded-devel/message/104799
> Mute This Topic: https://lists.openembedded.org/mt/101232091/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[narpat.mali@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

