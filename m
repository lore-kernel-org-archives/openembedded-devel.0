Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8B5EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:42:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14881.1687448532049679050
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=iVbq24HX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55378c4034=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35MDhFNV015816
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 15:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:from:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=fC2rbjneWHt9XZiPouDKMznkxQiyEv9cSykpPUzPOhM=; b=
	iVbq24HX5w5NimJc8rMP3DTIgP4KboHtT74+gbZRccmZmnKI4kUZ7Bm+4IFV5lWh
	2qz9fOLLYgpAIVIwybQzCATmKvH9sZHm2qjEhSdcfpZKIS/Je1r8ADruYvAqIPRy
	beXrJKxM3+ERwt042gHqXB3mLIwZMqHqqggyVPA3g7040cT8Qc7iV4+OHbvJHqfm
	97UVxm27/ZTu+QLmuao8dzxQn+xb9c8bBLIXGhX1vf2SyvUxTWWSjKuys1zSrlZ3
	olM2izZtMqL0Nq+SeT0HyiTH9Y6/LfHx3KBtAn0GGL+Ov4JWDNoAVxTbjnZwCrHq
	Io+wSRvop9Z9RuflG1XGmQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rcdnx0hx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 15:42:10 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 35MFg9HJ010496
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 15:42:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rcdnx0hx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 15:42:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m31gk/UZlJDqQQ4WOfwfYWSvH4XJQEzmpl0TK6uHko9HUntDDSSlOxrivF23Mim1givGNI9BPwKG3C8FCA+uFbcH6C3Bv83LTAiNkQwPBnjIkXjNREFkKyaPrbUlzHtxExz55OaOzfGrdPFYHk3GjDITnGMU6VgDwaSxlk8Z5HUl0jW2oQSMVhRqg6d18IXqv0FlfgcXI8UaB37fy7mEFBaB06iSLCPc83WC3bhpsmZTd2rSiANKElhkcFCFBzThzTS3o60xvGN/iVUoKvJoXS189Ivbie027v5SmNQIsUPzjDrE0vOZoYMhO52CWyOlEKLKI9HR5iQlH3ZCbn6TwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fC2rbjneWHt9XZiPouDKMznkxQiyEv9cSykpPUzPOhM=;
 b=NvUqm/r9P1QHwnV8ZXkSw34+1IBE3d3IEAnrzwv1sIr+5goIQEb3Hl7Jv1MmrLfu+F+3tRFWm9mAOr4iFnHmFgoNx+j+bKSMvChEv6tjpeMFqb5bRqO1uEvjgqOiCdVk4KjGa8hRn8z7XM8JZaMnR9O5E245aH152uxPD0O6f1EpcYgSqXSIdXmlp1xooZHcI3+Ym+5Z/F3AGU5gEhxRbLeL2RgcMRGIaY98qD5V4FaJmDXPBKCqTS6TupagdPHR/xYIUfmVZEPp2Ah+NZm+hnIjPWg1DIOYQZfC5p0ieKxd7JyphhC/X/rlXfP62kWtfCVgqWjNPs+a+N+UyLd5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 15:42:05 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::6d5f:a33b:c280:2981]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::6d5f:a33b:c280:2981%4]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 15:42:05 +0000
Message-ID: <beb15b16-7a04-3a09-63fd-be64ddca19d2@windriver.com>
Date: Thu, 22 Jun 2023 21:09:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-python][mickledore][PATCH 1/1] python3-django: upgrade
 4.1.7 -> 4.2.1
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
To: openembedded-devel@lists.openembedded.org,
        akuster808 <akuster808@gmail.com>
Cc: hari.gpillai@windriver.com
References: <1764E2D4F8CC0BEA.16620@lists.openembedded.org>
 <49a713ba-5335-c677-6f2d-e6ee5e43c71c@windriver.com>
In-Reply-To: <49a713ba-5335-c677-6f2d-e6ee5e43c71c@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::49) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH7PR11MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 5720671d-4794-43d2-a273-08db73373aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CPiCLRLeG4rWzEwY3mKrzbPnfb/W/uuPv0jy/SfCo2kX9OxxpCxKjasAcpOnH2wEq85m07o7Mmuo5keYIn/BW94q/Axr5ls++qayHZsXKJF8Y0znp3WsEVZGMUrF8B/+KT9Ya9STFbn89zMAK2dz8j8rERLgWtafcJNa27fDhtOGNcc/814lG6V0R6q1kfX/9l8z819GKsThLqR8axyDhuY5pbRkW2kte6vGu8/CCTHZfkN8boFZKNECPf/a2Lr5J44oa8BKYdDzbxH5DWRkK92X+whBZS9HJZeqUTDlY4ftzTYpk9oVAj1vYObjRqFtPJIwBunms29Qvh6/8qnnF262JFyt910vFuHGGVpZqeArjPkg0K0xUx96vG8Zi0TbixDdZXDx8LX3NcJWatPIs9nKhtliYvjbjzJEjpyoJDOWXzaWpcYhsvN4jt3ZGAI4UQzWet+mkQASWSYx7IDmdKHwZXrsHMLby1Ey3xxUymNKYeI5YRAXvtPhIGYAl1CSNuq1DukeqcgiMjKSSOJxSssFvgtYkyiJFg0BL70N3weHcOJYr7v5ISAp9N7OlAx6ryIFJEclSL6cNNkEeKm6kEMFm0+bD6PtFZW9MnCn34WEo8VAwpaZU4vNNyJqSL1W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(451199021)(66899021)(31696002)(86362001)(38100700002)(41300700001)(8676002)(8936002)(66946007)(6916009)(66476007)(66556008)(2616005)(316002)(83380400001)(5660300002)(53546011)(6486002)(6506007)(478600001)(6666004)(966005)(107886003)(6512007)(4326008)(186003)(26005)(2906002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnBSNFBwajJUOFlOSVpsQjJDcUcrcWpXUGJvR2ZoVDRHdDFUOXpkWG9WK1lJ?=
 =?utf-8?B?ZHpJeHptc2VUS3NIVzBYTENkSkFmcVQwMGRYN0NZMFh4TXh6bmIxWGRwS3Ja?=
 =?utf-8?B?Ti9rd0J3TkZnc3FPYk5LTWozMjkwbEF3WVVVZ3lKVVdzQ2p6bU5vNEhjRWd5?=
 =?utf-8?B?eTRpYm1yZi8xQ3JDc0ZVZWJoczVDa2lqb2NsR09ITnd2ZHdNQkVRUjNiTDYz?=
 =?utf-8?B?akxya0dYMDdWL1RQdGZxTlBIVlo2ZlRmcG9NZzF1aW5odDFuVzBVbUNwWXhC?=
 =?utf-8?B?UjhsQkpwQlZxbDZMR0Z4dmNxY0NDQTdqU2pUdGtoa29UV1RrZm1tQThVM2kz?=
 =?utf-8?B?Tys2QmtuV3B1YmlJL1dNRWRxVUNVdjdaOEprci8zcmRBY1NwY1pDb0s0QTNZ?=
 =?utf-8?B?M21SQlZYazVkZlNIOUhxTTVZaStRVytxOTBHa1JmUHM3TTBycml1ekt2WUZP?=
 =?utf-8?B?OXU3Yjh3R2tySWVZK1F3dzJZK2R5Zi9OU25GbWNZOGsvM01tQkdrdEk1N3lO?=
 =?utf-8?B?d3JXQVIzZmNwUkErWmN1QzhnWk5uNzlSWG1TUlcyaHM3VnRBb1Uwa0Q1bnQr?=
 =?utf-8?B?NjZIb1J6Z2ZaWE82YXowWXF5dVhqdjVPOHhiaGdFY1BWSWNIbElSbE5BV2lB?=
 =?utf-8?B?aEdrNkRnRGlrUmlmaW9INHdPbHVWSE11QTNSRWxXd1ptVHhsWVpnQ3d5dW5h?=
 =?utf-8?B?MVpHTXpwRlZOMEJzZmo3MUNrRmc1ejNOQzFZVFM0b2JvNUhGQ1YzOHcyU1ZB?=
 =?utf-8?B?Nm9ScEc4QUpkSzNNdSthdlJWT25iVGJScWtZMHZDVHhZbUE0cWI3dEdJdFZ1?=
 =?utf-8?B?N1ZNWmZpVndwMGE0STlpOHkwNmNad01BZDFmYXZFVGxBcVJoT1h3OG55Y0VV?=
 =?utf-8?B?a0RFUU9RcktvSnJITjNRQ2w3MWpYRzdFeU9vM3hsYjg0TXJRT01uank2Rjg5?=
 =?utf-8?B?TmlPZzJWcTRvTi96TEVSdGFPalRnTGlsbjlRSnE5NFlpMXYwUTJRcXljT2lK?=
 =?utf-8?B?ZGQ2ZGMzaEEwTytncEk3OTEwOGt4T0JQUEEyd01LL1dyRDZNTHBubFRrdURu?=
 =?utf-8?B?RXlxRWlEdVJyczBnZmlwTDFhSjhjWElLRHR3VjBubDVtK0g5dE9uRFQrR3dY?=
 =?utf-8?B?R25MRXNWaUJ4dXcxd0hXSlUveDlBMGhVY2xxK3BLL21OK0VLQUpsb20xai9y?=
 =?utf-8?B?SmFXODU3cXpudWhCM0l0M0dYRXRkTTBzOU1jYzVJOFZ4aVJGcGd1WWxuOXA4?=
 =?utf-8?B?bDQycW10RGNVd1VHVVJ4TzJnM0ZYcFhpSzNnci93WFVCVGhldlZIamN5OXpv?=
 =?utf-8?B?UEtSQWZNdDZ5ZU5keEIzMU5QcXlaOEJlVW9zUzhsUzlBS0RoUzBrMnVwa3g3?=
 =?utf-8?B?Y2pLVnRWU2hIQThJNGR2OGx6d3lUTWMzY3JUTVBybjdlWlZaTmlZVUdkR2dN?=
 =?utf-8?B?UGdOK0MyRTY1MGRmcjU1eVhTMlpWeW92UmVkWUdDUmRrVkM0QWxLZ1ZpYThG?=
 =?utf-8?B?RGd6K1dXSkxUVEVDeUtNcHR6V05UZTV0eEZsZHJsYzBGS2U0Yk5RWVllQVlv?=
 =?utf-8?B?V1NZRHFFNkw2TTZsL2hEOE5LWEJhMm9oKys4VDJGRFRaUUpWTTJTaFBKbW1a?=
 =?utf-8?B?b2VnbTVGQjVKdFZCbGJ4OVJqeFE2YmJ1ODB2OHV0RFhUUDlCdHdtL3IvdC84?=
 =?utf-8?B?TWZBZnphbnU5aWcvdURoS01YcUE1Z2tZWmdLb0VzU1kvOVJsN3YrVm01S21K?=
 =?utf-8?B?Ym9xS3VqaEJMOURxM0xwQ3VpY0RZYXp2YjlLV1haOTV4cHN0aWpwS1JHTXdP?=
 =?utf-8?B?eU5vZkNJK3ZUQldWcm01dFR5YUFkMEJ1RGMvdnFEcnlwZlYyT2s1NHdwZG43?=
 =?utf-8?B?NzZOM09MNmxmZERaQXkyRFBzNUp2VHhscnBYelVGZDhpWldsdXRBQ2VvVkw3?=
 =?utf-8?B?ZTFGR1BtRHNxcTc5THhsUU9mYnRNTk5McWlmVk4wbCtrRHJNVW1aK0d0ZCtp?=
 =?utf-8?B?SHRLNkZ4NDRPai9OQjBWOEozZjlyQ0hkTlBjLzNmMTgxcTN6VnZGVCsrQ2FE?=
 =?utf-8?B?L2h6b2lQTmJxNSs0WWo0c242ZjMxRUJwTks1TTdHU3dUVkVTbFBNZStRYi90?=
 =?utf-8?B?Z1NKcnpZbHYvdmUwTW96NkVNUFJqVUMxMTJQMWk4SlhrZmFSZGZDMFFLNU90?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5720671d-4794-43d2-a273-08db73373aac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:42:04.9844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fT0Qmg3kiGgr0ux+RpELWkCg3Kfilni2Unp2JxmPpS6gxoHgHTm2PzJmnsMBB0acfL/ewTjbFlXU3B3crZvkf0+eMBkFgGHQQooUnw1fY/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
X-Proofpoint-GUID: vFeRgt7M9keoNHpmWw08CkJ_frgICvd4
X-Proofpoint-ORIG-GUID: BP_rhaLC3KY7K1hqrt4-zrASU9x9zItC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_10,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2305260000
 definitions=main-2306220131
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35MDhFNV015816
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 15:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103492

Gentle Reminder !!

On 15-06-2023 20:31, Mali, Narpat wrote:
> Reminder.
>
> On 02-06-2023 21:29, Narpat Mali via lists.openembedded.org wrote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> Changelog:
>> https://docs.djangoproject.com/en/4.2/releases/4.2.1/
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>> =C2=A0 .../python/{python3-django_4.1.7.bb =3D> python3-django_4.2.1.b=
b} | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>> =C2=A0 rename meta-python/recipes-devtools/python/{python3-django_4.1.=
7.bb=20
>> =3D> python3-django_4.2.1.bb} (58%)
>>
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-django_4.1.7.bb=20
>> b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
>> similarity index 58%
>> rename from meta-python/recipes-devtools/python/python3-django_4.1.7.b=
b
>> rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
>> index be806eefaa..b1474cf054 100644
>> --- a/meta-python/recipes-devtools/python/python3-django_4.1.7.bb
>> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
>> @@ -1,7 +1,7 @@
>> =C2=A0 require python-django.inc
>> =C2=A0 inherit setuptools3
>> =C2=A0 -SRC_URI[sha256sum] =3D=20
>> "44f714b81c5f190d9d2ddad01a532fe502fa01c4cb8faf1d081f4264ed15dcd8"
>> +SRC_URI[sha256sum] =3D=20
>> "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
>> =C2=A0 =C2=A0 RDEPENDS:${PN} +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-sqlparse \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#103102):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/103102
>> Mute This Topic: https://lists.openembedded.org/mt/99289334/7199376
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [narpat.mali@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

