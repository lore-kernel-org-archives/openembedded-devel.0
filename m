Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7602.1631080094290870710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Sep 2021 22:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=T1Iwab8q;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48850d2a5b=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1885i26B007104
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 05:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=SME/cIYMlbCBGQ0vAYgOWlJsL2MB5RrUeW9fFnPrSCs=;
 b=T1Iwab8qC2EKnqlrGP7yeJlqvu/mT4bmEXG9PQRWV4SQlCz7Fy+E11E+7ECSr8MwKcU1
 RtM0OoFX7BstWzW/As211QRd611/yMygY0YlRFbeTfmj3eZasW2PvdPyFM74YzfoMKrS
 LabwnwlNW7p/02ZjrPWr3D7mCTfn1AW8nx9KLi8EUzR5meI579M63Mo0t5soxgYKHnC7
 mbP8U/Q12HVrgMEKpvse5JCUvP7FqooPWb8rxoCUxyG4w2fyhbnOQ547fAI8ZBtLdpHS
 w8KCtk3Z+0d3HGnn03VXFkO8GI4p6xzipN0b/jdSMrlftKr1fZ+MXpCaOQXjvwGgc+Pj Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcmtgbq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Sep 2021 05:48:11 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1885mBRS013996
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 05:48:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcmtgbq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Sep 2021 05:48:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUxjtGAUGGr/MCRYA4rGktKH9w3yWSh+9aDukNM1DXQEfSuJ/QnCUWdoIYkliO9PTfPodJfeUHUd/YAUyqR3NReZ7wyqOVsBAbxkwGUQzcLg6KE634imRuETznVF0lxLDy7SDuH8vR3fa9XWtA+EORLCM+u0M9I4USJntnYGyMkuCEOURQmKYtzsH+KqtH0VQ4cUkdgRlfXHfvhwCqVDOZd7bNPEEv5H780qaHeSH34dSVOpNkerZyphoRIUI/MYoHMlUP9c/6fQqn/bxd86irLi7dN21MMKDtJzj0GInevONI8ODzwLEuUD+3Zp2Cv1G0RfHm/GwjkkPnY/zMzzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=SME/cIYMlbCBGQ0vAYgOWlJsL2MB5RrUeW9fFnPrSCs=;
 b=NfQBqVaVIn00M9JwKZeD7v8mXIuf/Z3rc9AuN28UJm8BdqsX3j0VMYW1wMhsXlqNOe09Acrs3FKXpdpmFg2RBqd4QlaRFblE3XdefkHqvNkCLiCv8JECj+LA78NplL97Wl8aexOKFpfc8uq6LxqkGu/SdO6gMF+qxaYLokcv8FzOVj4+04YUrLFmRCal1GncnoryeQ4Z5YS8izEUHKnhZvTTmjmd84xj2q5Qcntb32oZ6lP1q2WZDrLNk34SZPCJnji5UWGzjSuUiO6ohTs20XjSXbmnutDOEWfadJ7+BqrWyN1XlOMfk5SWgXfF5aXvE2vDX7+YJPjOnXR9aWHL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3037.namprd11.prod.outlook.com (2603:10b6:805:d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 05:48:09 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339%5]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 05:48:09 +0000
Subject: Re: [oe] [meta-networking][PATCH] ndpi: upgrade 3.4 -> 4.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210908001540.24948-1-changqing.li@windriver.com>
 <CAMKF1srbmqYfZW_22764uyax61r7hv0-_VJe08OBZvGTUbeN3g@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <aedf194b-60c6-ee6c-d82e-1d1a1ed11951@windriver.com>
Date: Wed, 8 Sep 2021 13:48:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1srbmqYfZW_22764uyax61r7hv0-_VJe08OBZvGTUbeN3g@mail.gmail.com>
X-ClientProxiedBy: HK2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:202:2e::15) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by HK2PR06CA0003.apcprd06.prod.outlook.com (2603:1096:202:2e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 05:48:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bacd8a2-0b32-4171-0f26-08d9728c3cbb
X-MS-TrafficTypeDiagnostic: SN6PR11MB3037:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3037F3CEAA8A602B0D26DD3582D49@SN6PR11MB3037.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3vNxo3SCIuJtvoXSuZQ2+BFmB8/8bBzzSYw05S6PIavf/vWUP6gEFuAfEiDZsjYAkn4oh0QIUaB4uYTBTBUsI/8MNL4GFLInF3qxxCCmKvGYNjC2x/WAEAl0gF+qsJq7h8iFBLwsasTX871/5lIN3QG7n8ZP56lNqRjBkbjRYpZS7d4CUviRuzaDIJE8YfvalJ4mv1YFLbTfxODPadG2aU4itBLuiqDGu3vFiz0oCJKErHJOX0CWw95RQ9h21INvjriQrp9kPz+3+oee2aOX3qwoW//yu6jD/rRiC1fuS2QdjwMy8fPNYIQFflII6ap7wCligAUjL8BDYvuEQvGKg+1idZ4KfhTNvui2XD2u0kUX+txIW2tAHn+OvcS3eH4nB3Bus0aOuGa36s5xUEyxKFluNuMWpBzEXfFHLqBPH+yQ2M3NQ8RT+AEaAEUTZw0Bfe2yAyHZk2PafS3usV3VLIm8Ryq48gH5f2wy5NSKjwOpkFBugPOUKiFGyX86UDEC9xJo7lvgyEWvvbJ0L/VPlxQf8lhmG4xqz8C33vrtY0oU5AdtvxOIVDfP4AUZMr5s8QoSobD0JGyLJguU2Y6rtWNdAFkPuSezley/WBt1Uu9GgYlbILT7GDLeuvY+fYt/3lgRswGIS771vByq5gQHDE4txzPX/73JJOt6F+pAm3JgRHmATXCtc8NbmS2xFehdou++K8xqkJDUGkY7E8+Aak+Y9Av6KiNcB9uexnovL97JETO/6B13iQOTm0TDkC7/aRsB6ySiZkzwRz/ZCj/+Skl8mjJ44C93eOYbba0WYCssRil/hTt4cOgWoVlGMURU1po7oKeaAANUV+fzorExOhhVG7JRxv8fjN78Ge3HhJjqPs/A8t7Srt799E7MlMZciyrCP2N+fCrN0xmyDTMzaBRdNJpFEgvK3coyPvmlQ7s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(956004)(2616005)(6486002)(6666004)(31696002)(2906002)(36756003)(478600001)(31686004)(66476007)(966005)(66556008)(66946007)(6706004)(38350700002)(8676002)(52116002)(6916009)(53546011)(38100700002)(86362001)(8936002)(4326008)(83380400001)(16576012)(186003)(316002)(44832011)(5660300002)(26005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHJtOFNhWjNSdlVDa0RXSUE3Njk5a240SGZSZW51WUpVdU05VUR0NGxVTVBh?=
 =?utf-8?B?WlFxWXNyZU5rWEo1NHI3QlNnRWVtWmdmNEJyeXpod1RJd05JcXJ5N3ZLYitY?=
 =?utf-8?B?Y3FSaGs4VHpnS1BjeUtLSWJOT0VKSGZvVW85NDlBUkFNR0ZZTWRjOUpoeExy?=
 =?utf-8?B?Ry8yTjBEd200Sk41NlRnY3IrQjV4M0gzdHF2VUdFd3Rlek9HVlV4emhUNzJK?=
 =?utf-8?B?MDF2cU9Sc2RLYjFYOHhmYUpGa3MxV0VVbGdvWDVwd1QxNFIwUWpRTGo1NXhU?=
 =?utf-8?B?MFRsTHlZdzJ3dWd4YitMYzkxdU9RcGRRUitKRG5DSmtWejFXbktUd21qQ0ty?=
 =?utf-8?B?YU5acXNHSEtCdEQzT2JwYmNyKy8rUlU4ZXlnMmsrVFFTMlVHZWhya1VMS1Nl?=
 =?utf-8?B?dHh5T1dFUDJ2Q2NZM0hYYjhzMmtYUlUvMEgrenNtbVlSTG5ZdjU1MWRIRUV4?=
 =?utf-8?B?QkNlODRvZ3B4aSsxUjlSdC9pMUJSdEdUY2hQTzMrOEhDOUtVN0hOamdLank1?=
 =?utf-8?B?UUViL0c5eURENGZmd1poOEdOMFZCNFFpeVkyY21tck4rVWhtS1NMclBoakZx?=
 =?utf-8?B?Y0xHd1A5aXV5VDZSNXpQZjZ5V2RmNk1OSi9sOW9DL2hhK0Q2N2lYbm52djB2?=
 =?utf-8?B?SGhtR0NzSHlmYldLbnV0TlNsM0FZTGYxOHN5M0N4T3pMS2p3dnVZYis0bGla?=
 =?utf-8?B?bDFEWWM3b3hGNFdmc2JWZ3YwNGZHRUVLNnNSakpnZzljWnVOUTJsbkFWQWFJ?=
 =?utf-8?B?cDVUaHJGY1o0YlBUa21zVnZZYnQzM1c2YnZ0V1gyTmFIZ3BQeUQvK1A4WXI4?=
 =?utf-8?B?TkZndnJmVHpHekZXUHluMUJGdy9SM2p4ZkFHSjBXYjhEclBkbjlpMDRlSUNa?=
 =?utf-8?B?ZEpQWUg3S21qTVVPVGZtdkdGRkdVcE5vUGtNN0tjS0pGUDc4QzNOenZVZ29E?=
 =?utf-8?B?S1RBRlhOVG1zdk9McDB0TzNUOHBNUitWOWpoRjZNYlpPU1VPU2wrUDdncmow?=
 =?utf-8?B?cGU0U2dYRFpKUUZOdm02aXhCb1dxQjNtOTRscHpMWnZoRTJzNEY1MExpOGVZ?=
 =?utf-8?B?SVRvejN0cjBTZDM3bkNZUlRPNkNzK3UvQUtYSHhJcWI2WlU4MEZGWUc1TUQr?=
 =?utf-8?B?NU5VbnNKUGlZWVNpdWQzT05WOHJKZXUxNEN4QWo3TXZtZDUxY2FEYXJnR2Vz?=
 =?utf-8?B?a1VnOEFRcEdyWFlYNzFYa1RuOXhNUEVWQ1diZXZ2SnBDWS9zemgycXMxUnhj?=
 =?utf-8?B?bldIVDFiLytNcDFielJTdG9lc3dFd2VaM3p4YnUxYUZHcFpWRllhUHpCU0Vi?=
 =?utf-8?B?N3VIcngwc3VJcndORkxGenpsRzgyZTNoOVBoMmladEduZGMycG1xNUJNcjQr?=
 =?utf-8?B?a0pua1ppayt2Z2VoKzVhNkFZS2VFVXF0Z3JBUlRYMFRVRDNnK3cvdXFCb0Nv?=
 =?utf-8?B?eFZQVWpSMzJDb2NYNUtxcFBpRE1TRmc5cHE0Vnl1emVSSzJWNXpKSHNDcDQz?=
 =?utf-8?B?MzlyZDdHZTZaQzIzeldPQkgxb2NVNzNmVzlnMDJDRXNSM3ptbnY1RnJxS3JG?=
 =?utf-8?B?SjdmZFBXYkpQQVI5TUNoUUpGcGlHQjRDNmN6YUpQd1E2UlJBNlNIVnBveG5E?=
 =?utf-8?B?aHUxOWk2OE5qekFsenhsN08yVSs2MlJDK2JzQXdXVG41NDhtbmhIZlUrTW93?=
 =?utf-8?B?bG15VUJCODFyUUMrVkU1c2dYMmpkWFlHRHJhVGgyYSs0NUVxK2EyU2JQZnI1?=
 =?utf-8?Q?RJrlKfhrbmkeMKnqUmT1f4XTM2iJKV5q2z/G9yA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bacd8a2-0b32-4171-0f26-08d9728c3cbb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 05:48:09.1054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+R4zjG25jkkoTuRura5ClFyaItGKWEQea7q6vJGj4OB141SY7Jo+nMBryvufh8wLhH8zmy3FkKuAA8jvkRgsjYEUuVJ2gYHwuQxI5fDQWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3037
X-Proofpoint-ORIG-GUID: hMezAq_0SWge34RU_Omar-ifR0VBDS9u
X-Proofpoint-GUID: CAMhHwmtCJ3FLR0QGP_vEOnKuUZuSeFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_01,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080036
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1885i26B007104
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 9/8/21 1:36 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> This update fails ntopng see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1516
>
> Can you look into ti ? perhaps this needs to be upgraded too.
OK,=C2=A0 I will check this.
>
> On Tue, Sep 7, 2021 at 5:19 PM Changqing Li <changqing.li@windriver.com> =
wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../0001-autogen.sh-not-generate-configure.patch     | 12 ++++++++----
>>   .../ntopng/{ndpi_3.4.bb =3D> ndpi_4.0.bb}              |  7 +++----
>>   2 files changed, 11 insertions(+), 8 deletions(-)
>>   rename meta-networking/recipes-support/ntopng/{ndpi_3.4.bb =3D> ndpi_4=
.0.bb} (76%)
>>
>> diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.s=
h-not-generate-configure.patch b/meta-networking/recipes-support/ntopng/fil=
es/0001-autogen.sh-not-generate-configure.patch
>> index ffc6ec1ef..1cbf059ef 100644
>> --- a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-g=
enerate-configure.patch
>> +++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-g=
enerate-configure.patch
>> @@ -8,15 +8,18 @@ Only use autogen.sh to generate configure.ac.
>>   Upstream-Status: Inappropriate [embedded specific]
>>
>>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +
>> +refresh patch to 4.0
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>   ---
>> - autogen.sh | 8 --------
>> - 1 file changed, 8 deletions(-)
>> + autogen.sh | 9 ---------
>> + 1 file changed, 9 deletions(-)
>>
>>   diff --git a/autogen.sh b/autogen.sh
>> -index df734ce9..d7bbf8cb 100755
>> +index cf5d7057..cb73cf9d 100755
>>   --- a/autogen.sh
>>   +++ b/autogen.sh
>> -@@ -52,11 +52,3 @@ cat configure.seed | sed \
>> +@@ -52,12 +52,3 @@ cat configure.seed | sed \
>>        -e "s/@NDPI_VERSION_SHORT@/$NDPI_VERSION_SHORT/g" \
>>        -e "s/@FUZZY@/$FUZZY/g" \
>>        > configure.ac
>> @@ -25,6 +28,7 @@ index df734ce9..d7bbf8cb 100755
>>   -cat configure | sed "s/#define PACKAGE/#define NDPI_PACKAGE/g" | sed =
"s/#define VERSION/#define NDPI_VERSION/g"  > configure.tmp
>>   -cat configure.tmp > configure
>>   -
>> +-echo "./configure $@"
>>   -chmod +x configure
>>   -./configure $@
>>   -
>> diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-n=
etworking/recipes-support/ntopng/ndpi_4.0.bb
>> similarity index 76%
>> rename from meta-networking/recipes-support/ntopng/ndpi_3.4.bb
>> rename to meta-networking/recipes-support/ntopng/ndpi_4.0.bb
>> index 89450f562..24de044c0 100644
>> --- a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
>> +++ b/meta-networking/recipes-support/ntopng/ndpi_4.0.bb
>> @@ -3,15 +3,14 @@ DESCRIPTION =3D "nDPI is an open source LGPLv3 library=
 for deep-packet \
>>   inspection. Based on OpenDPI it includes ntop extensions"
>>
>>   SECTION =3D "libdevel"
>> -DEPENDS =3D "libpcap"
>> +DEPENDS =3D "libpcap json-c"
>>   RDEPENDS:${PN} +=3D " libpcap"
>>   LICENSE =3D "GPLv3"
>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db52f2d57d10c4f7ee67a7eb9615=
d5d24"
>>
>> -SRCREV =3D "64929a75e0a7a60d864bd25a9fd97fdf9ac892a2"
>> -SRC_URI =3D "git://github.com/ntop/nDPI.git;branch=3D3.4-stable \
>> +SRCREV =3D "b8806bd2de7391abee18353e9a99ee4aec13887c"
>> +SRC_URI =3D "git://github.com/ntop/nDPI.git;branch=3D4.0-stable \
>>              file://0001-autogen.sh-not-generate-configure.patch \
>> -           file://CVE-2021-36082.patch \
>>   "
>>
>>   S =3D "${WORKDIR}/git"
>> --
>> 2.17.1
>>
>>
>>=20
>>
