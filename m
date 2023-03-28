Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A87C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 07:48:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.60782.1679989729893618112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 00:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2451043720=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S7jZrn020662
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 07:48:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php642y6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 07:48:48 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32S7mmMd027818
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 07:48:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php642y6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 07:48:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FveEUoC487iETbqCgKj168ErvkP2YsRxcA3Rf74bgW3I0IjCwDXgGC8u5TF7GbpIfuf/03oDeApjNNsMXbPwmjpSJ9x2smsjjEqaybfaW8pgHiV4C69YjZMnkzNifIb9BAGTfp1pyc3HCEukuQZLoR7/6GPV849Yyz8DwiSKatmvxYWN/tIikBVAIZD01EqMK+qR0Fwml21G8GHi0EorGRJXdD7EO/mreGptXSCOzJ8SZ1EembSnd6cpfPbLD0QicVq5lewiEyvY91UPdlYnaZm+/VrWT7s6SsVj5qxnDj7WRDREEblNKIV/7mHZ2cUc1ITVyMBLPQmNwfUVaypB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoKvdNrR2I7gIs5aidmIg3KyKyYTqIkQ5bcJ3siRr84=;
 b=VTTVqHT6yDuMIigERJkhBBg/dRmPBdvCdjEokluqg/sH7/+XLSWEviw/zeBxkxik8v02jQey0SaJAvMJAt7+Qp3cQzqCs/FXTfPvMVATGSgwRcrzQ2VfPj5rBcncFYmsENA0EAhdtX1xjrcz4PHDkHfb9bz2oFc05QpST7yOM2mvIT5QqqAUfftqcLZh4U3rMF9ni32MgOV/mjlJJPGJNFmW7j3zLTIv2OAhtzvyMnKM1edmqT2ZeZOlJX371Dn/oYdKBwUvAtB/m3HqSh2dbhRJsPkBFsfYpe4T50/xyulbAEEOg6TsX6FikDZsbpaefeL9XXB9XesEwdNJ3Nh5Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 07:48:44 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Tue, 28 Mar 2023
 07:48:44 +0000
Message-ID: <d2e01ad0-224d-527d-9105-942cdfaeda2f@windriver.com>
Date: Tue, 28 Mar 2023 15:48:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][PATCH v2 1/2] protobuf: upgrade 3.21.12 -> 4.22.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230328064248.4049456-1-xiangyu.chen@eng.windriver.com>
 <20230328064248.4049456-2-xiangyu.chen@eng.windriver.com>
 <CAMKF1spGf+sSjwSoHRYr6c1XGEsWAHkww+Ew9G87iPu8+NyP7A@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CAMKF1spGf+sSjwSoHRYr6c1XGEsWAHkww+Ew9G87iPu8+NyP7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0119.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DS0PR11MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 007264fc-60de-4b5e-a30d-08db2f60db31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yEuGTknYt5amxx+PIVeJWvCfnQyPB5SQgJ9Y61ouGiyTY2ZIGPV4dIX7JZsB23fAJB+9+R7XC/duoylkp9UxF+Sy7eoCc5XvigaArRpgVuWCyJjwjwlRfEQ/FNAsWVSKliMMLJAldXhmW4kDejqHLf9u+4RPFiovHfyVmbUuk0urTkCf643+3b3dvGnD0ezrwdq3QYiR8NJOK9ZA1LSXY4n2DrplPgV0GpTvc2+sIWmTr+3ktVWcES741OtJv3E0McO8n7KB3QJmHFIG9YEY/AWKZrH6KuxdOJhO39ZpNQxiIGM/pJfN9YcTZ0xNtVFeErorj50hWxpTzL/Vau7qgwfc3Yn+btq5eeMK3mn8U5ISrutnaxFF13iygNiPbWDaJ0ObXC3SPtdy0nircZGvxLG/UigAXdgksqpJzrgJ10cNBm6lFNDtAkaxxn1P00zee16VhK7Pth/AeumDBuF5/232iQ6vp8NfiBdSIKuhF7ONbaGMXoNZv8tdVgJzjKzJNcVst6sSbLW7CuZ6rjF4/F2V9IZ78nx2ltqJ2t4CqK4FYmSWQBEOYOEheGN3wYC83eeT/YcAlqblal7puatPwiRJE2vAqLqrdTPmoFrxuTHfpv21m1yJ183SOdHAOQLa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39850400004)(451199021)(6486002)(66476007)(66556008)(6916009)(8676002)(4326008)(66946007)(36756003)(41300700001)(83170400001)(2906002)(31696002)(8936002)(5660300002)(478600001)(38100700002)(44832011)(316002)(6512007)(6506007)(26005)(9686003)(53546011)(186003)(6666004)(31686004)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmlhOVgyZWt4WFYzbDJwNkU2UDVVS1JGT0cyN0pJWUhIYlEyZWJlNmdPUThX?=
 =?utf-8?B?MHM3U1VReE1FeEhibjB1amY5c0U2VGNNeGZiTlQ3TjVuUHFHWVk1NVc1UElk?=
 =?utf-8?B?T1FXenlScWZnb0NVM243NVRUZWQvUXlJaFNlS29CMFBVQXkxbEF1VWsxaTlJ?=
 =?utf-8?B?aFZ5VjBoWllEM3Y4RnBRNVdyalZma1lTT2JIOHJ1SFhvUER5NkM3N2NIUW0y?=
 =?utf-8?B?UzRhQk15OWpLWnNSRTJlV1EzRlo0SVpJTjZkL3NPc25hSFg5Q0daTktmaEJK?=
 =?utf-8?B?WHVKWFNKVkhzT3krWHorVUlMSGR5Z0FaRTh1ME5wMzAzSkpIZUFoS3ZXNHNa?=
 =?utf-8?B?VTQvMG00N2MrOVhub1poWTIzZ3BTamVsb2FUd3cwZnB2NVBwVXJZcjBxelZM?=
 =?utf-8?B?dVVpeFRHVjlNaEUxK0VaV1dOcVU0RldMNEt4Q21vOFplUG56aklSSzNTNnRQ?=
 =?utf-8?B?THYycVBZaFA0eHF4T080RWRjNG1ON2FJTDI3MERXNUNtUW5GNWtMZ2pLR0c4?=
 =?utf-8?B?Tmp4UXExdnE0YS9mRFl5dnNKY2toYmNiRGlrbDNXY3h0RHJpUzhqeXE0MC9i?=
 =?utf-8?B?bUhlcUV0dFg4OGZEZExnUnBUOE1FMnBtSTFWUWtqU2ZrN0l2V0hnTTlVMVd4?=
 =?utf-8?B?VktZNnR4SXY3UlRoTUd5cUZKVUY5ajk5bGxFaFZWRmpaVTdVcFFOVnE2TjhJ?=
 =?utf-8?B?RmpWZTBhN3d0bUZ5MjNENnhnWWp1SjBMQ3NCanU5ekZkMmM4YVV3bFdXUjg5?=
 =?utf-8?B?TzBFQS9EQ2dNdDgrV0lwdVdDcUVxL2pPR1dTODNFL01Vd1pxWVYxZjAyZlBr?=
 =?utf-8?B?SENSZUIxMXVOUUlKNmlyOGpHNFlrM1pPUHQvOWd3M2RUVzJGM1RKQUFGTTNR?=
 =?utf-8?B?dlNpRDFja2k1WDZSRkcrVEliTEhPZFYwOG1PUFVjZmVIQTExRm9kOUdsZEo1?=
 =?utf-8?B?bmRYMGRuSlRrM3R4Y01ZcTk4dmcybkIrRzJmT0tTY25rcmxtZ05zN2x5UDJk?=
 =?utf-8?B?c1k4Z0VPYktzOHRQamxub1FGR3hxY2JqTjc4Q2VHY3V0T3Z3R1Y5SmROYkgz?=
 =?utf-8?B?UG1HSUNuUm1VaG5HbkxvZG16azJQdktFUGJGUDRLVHlVVVRSQXllcUZrZ05y?=
 =?utf-8?B?RDBUWE9vVWRsalN5RCtHQjJBZVA1dTZ2SGhQbVIveHBuNS8wbTlPelpYTHZ2?=
 =?utf-8?B?cTVTdnJlbHRKYS9DclNZKzFMWDBWK2JBM0gzOWQ4WFpOQ0hqeW5Vbzdzc1Nx?=
 =?utf-8?B?aldwbStvaDFmd2hGUm1sLzZEYXJPWjBCNndCVzRmM3p6VkZWbEJ2MFcrV1cy?=
 =?utf-8?B?VVJLSGF5cHVTNVhKaXZUR0JSNSsxVkZKNDRYeFJhWlR4WFdYdHlreWFOc3hy?=
 =?utf-8?B?Wm5jTXUxemJQRGkxVlZURGE0TCt1MHZXQitBcm9PWDhwN1Y5Z205TDVtbnVW?=
 =?utf-8?B?VW1GNVl3a2FSRWFhYlJHL2JuMmJTUWZjR3E1NE16RitjZk00M3BFdHhielQr?=
 =?utf-8?B?elE3WWhnMmY1N0JoWFJZcTZ3ZmQrY010aHlHWWlHWVQ1QzFQTzhWUTBVaXRO?=
 =?utf-8?B?T3V2TlJqeFZQc3NjVURIajBUNXRsVC9JVmQvUEk3L0VETTJwa2JUbGVHdUJ3?=
 =?utf-8?B?S1RROEhLZjBPVCtCRXY4ZnY2bTVoUVRZY0JzanRFSHpKNTBOUStzYUJKRmxh?=
 =?utf-8?B?TW1nekRHRTNqRWt2aFVTc1VCU25QMURxMmpXaW9RQ3Zxbkp0elFWcU5hdVM5?=
 =?utf-8?B?Q0xIbE9VMFlSZGtpZU1ldU9wU2JOSERMd0hnSHZEaVlLU0dWYkRVaVZMelR5?=
 =?utf-8?B?VGZoQXlJanhreUFLRURXa3BiNzJUZlRFZThscUUrTFZqQUlmMVJ3NXlpcHVo?=
 =?utf-8?B?WXdMdGdpUjNkYVEvbW8rOGlSY2EzRlExWEErREltcUxzb0MyUEN5K1RHWmVD?=
 =?utf-8?B?dkE5WUpuYll1YlljU0RxcHA2U0FYTkRRRVgyVEc1YjNiZ3lObDhUWTR2Vmky?=
 =?utf-8?B?M3JwTU1NMjZYSys3WHd1V1lYVVE4bVRhSis1aGNyblNGTVRwallxazRPbytK?=
 =?utf-8?B?aU01eSs2MlQ2UzliaENka0R2amZvd0x5a2xjdEtlMEU5eTlTajRCeVc0MFJz?=
 =?utf-8?B?NXA2dmQycElHWlE0dDBNZmZJQ3FNeGQwOEt0UFhBNTc5RWhxY1F5bVJITWMz?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007264fc-60de-4b5e-a30d-08db2f60db31
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 07:48:44.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5nH6jO7Phcf76hFCHBTTM+nEpManHTV0VHKQcMA1nHeMpvw97bETgEOmRZWSuxJ7J3ZQDQZYNEm6oHoqOvyyThhub2D0ax4ThrDREvlbTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7192
X-Proofpoint-ORIG-GUID: k8UU96itafdI0KphVDOn9C1ti_VL_Um8
X-Proofpoint-GUID: HXkhh_xDl1gcnnWaZJY_NjiOFtWhXQjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32S7jZrn020662
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 07:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101802

Hello,


On 3/28/23 15:22, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> it stil fails
>
> Summary: 2 tasks failed:
>    virtual:native:/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/r=
ecipes-devtools/protobuf/protobuf-c_1.4.1.bb:do_compile
>    /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-connecti=
vity/mosh/mosh_1.4.0.bb:do_configure
> Summary: There were 4 ERROR messages, returning a non-zero exit code.

Could you please help to share the error log with me? thanks.

I applied the protobuf-c related patch cannot reproduce in my local=20
setup with "bitbake protobuf-c -c cleanall;bitbake protobuf-c" .


Br,

Xiangyu

>
> On Mon, Mar 27, 2023 at 11:43=E2=80=AFPM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   ...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15 +++++++++----=
--
>>   .../{protobuf_3.21.12.bb =3D> protobuf_4.22.2.bb}   | 11 ++++++++---
>>   2 files changed, 17 insertions(+), 9 deletions(-)
>>   rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D> p=
rotobuf_4.22.2.bb} (86%)
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-=
Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devto=
ols/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variable=
s-fix-.patch
>> index 36c3c597a..7c4bf260e 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefil=
e-respect-CXX-LDFLAGS-variables-fix-.patch
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefil=
e-respect-CXX-LDFLAGS-variables-fix-.patch
>> @@ -30,7 +30,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>
>>   diff --git a/examples/Makefile b/examples/Makefile
>> -index 1c7ec8d63..85f591231 100644
>> +index ef7a4ef58..7206e14e1 100644
>>   --- a/examples/Makefile
>>   +++ b/examples/Makefile
>>   @@ -2,6 +2,8 @@
>> @@ -42,17 +42,20 @@ index 1c7ec8d63..85f591231 100644
>>    all: cpp java python
>>
>>    cpp:    add_person_cpp    list_people_cpp
>> -@@ -40,11 +42,11 @@ protoc_middleman_dart: addressbook.proto
>> +@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
>>
>>    add_person_cpp: add_person.cc protoc_middleman
>>          pkg-config --cflags protobuf  # fails if protobuf is not inst=
alled
>> --      c++ -std=3Dc++11 add_person.cc addressbook.pb.cc -o add_person=
_cpp `pkg-config --cflags --libs protobuf`
>> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/tim=
estamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
>> +-      c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person=
_cpp `pkg-config --cflags --libs protobuf`
>> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/tim=
estamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp=
 #$(CXX) -std=3Dc++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_=
person_cpp
>>
>>    list_people_cpp: list_people.cc protoc_middleman
>>          pkg-config --cflags protobuf  # fails if protobuf is not inst=
alled
>> --      c++ -std=3Dc++11 list_people.cc addressbook.pb.cc -o list_peop=
le_cpp `pkg-config --cflags --libs protobuf`
>> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/tim=
estamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_c=
pp
>> +-      c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_peop=
le_cpp `pkg-config --cflags --libs protobuf`
>> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/tim=
estamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_c=
pp #$(CXX) -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o l=
ist_people_cpp
>>
>>    add_person_dart: add_person.dart protoc_middleman_dart
>>
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b/m=
eta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
>> similarity index 86%
>> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
>> index 343933033..0c6b446dc 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
>> @@ -7,12 +7,12 @@ SECTION =3D "console/tools"
>>   LICENSE =3D "BSD-3-Clause"
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8b=
da4266b"
>>
>> -DEPENDS =3D "zlib"
>> +DEPENDS =3D "zlib abseil-cpp"
>>   DEPENDS:append:class-target =3D " protobuf-native"
>>
>> -SRCREV =3D "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
>> +SRCREV =3D "81f89d509d6771dcccb619cbe26ac86cec472582"
>>
>> -SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D2=
1.x;protocol=3Dhttps \
>> +SRC_URI =3D "gitsm://github.com/protocolbuffers/protobuf.git;branch=3D=
22.x;protocol=3Dhttps \
>>              file://run-ptest \
>>              file://0001-examples-Makefile-respect-CXX-LDFLAGS-variabl=
es-fix-.patch \
>>              file://0001-Fix-linking-error-with-ld-gold.patch \
>> @@ -35,6 +35,7 @@ EXTRA_OECMAKE +=3D "\
>>       -Dprotobuf_BUILD_LIBPROTOC=3DON \
>>       -Dprotobuf_BUILD_TESTS=3DOFF \
>>       -Dprotobuf_BUILD_EXAMPLES=3DOFF \
>> +    -Dprotobuf_ABSL_PROVIDER=3D"package" \
>>   "
>>
>>   TEST_SRC_DIR =3D "examples"
>> @@ -52,7 +53,11 @@ do_compile_ptest() {
>>          cp ${S}/${TEST_SRC_DIR}/Makefile "${B}/${TEST_SRC_DIR}/"
>>          sed -e 's|libdir=3D|libdir=3D${PKG_CONFIG_SYSROOT_DIR}|' -i "=
${B}/${TEST_SRC_DIR}/protobuf.pc"
>>          sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DI=
R}/protobuf.pc"
>> +       sed -e 's|Cflags:|Cflags: -I${WORKDIR}/recipe-sysroot-native${=
includedir} |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
>>          sed -e 's|Libs:|Libs: -L${B}|' -i "${B}/${TEST_SRC_DIR}/proto=
buf.pc"
>> +       sed -e 's|Libs:|Libs: -L${WORKDIR}/recipe-sysroot-native/usr/l=
ib|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
>> +       sed -e 's|Libs:|Libs: -labsl_log_internal_check_op |' -i "${B}=
/${TEST_SRC_DIR}/protobuf.pc"
>> +       sed -e 's|Libs:|Libs: -labsl_log_internal_message |' -i "${B}/=
${TEST_SRC_DIR}/protobuf.pc"
>>          # Until out-of-tree build of examples is supported, we have t=
o use this approach
>>          sed -e 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CM=
akeFiles/libprotobuf.dir/src/google/protobuf/timestamp.pb.cc.o|' -i "${B}=
/${TEST_SRC_DIR}/Makefile"
>>          export PKG_CONFIG_PATH=3D"${B}/${TEST_SRC_DIR}"
>> --
>> 2.34.1
>>

