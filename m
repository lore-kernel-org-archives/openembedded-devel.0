Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0DFC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 18:43:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2818.1680288193522702731
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 11:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=M2gA8ALr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=345414cf85=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VIfskI000754
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 18:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=9Fwd2Usrs/RELzdhTwaOo/THqzPJaHVvzw1yMmkpdlM=;
 b=M2gA8ALrihmddSfzXaqx64I9AHv7p0GwXnGwp9344LVjIn+mIT6X/F6+o1CFkENnQYbe
 2u3l7lfUosIn/j7uxq+4ihIVPOd0j8CJ4hOtqyJa/thZlmysKr+Y09X7667U6jxrLgsf
 hRZ6ZXboJ95fasmFXBFLsBnq//5HPaaHAQwiYSUYlJiJXXKmofBFQcMBaU8Y/g4s0//u
 ax9wozR6OO4GckM9O1WRhvLUouHZcTNj10wKb9PiGPcyN0pd5iu1Gm7WMEaIdtV3+Cck
 mdLxJw4aw/MMB7+Oq2zHsFB40Ks5iEBlEdAfpL8BCAlx+Oc13usbSS0bSzJcznqZKanp zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxc04dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 18:43:12 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32VIhClE002785
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 18:43:12 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxc04dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 18:43:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyyUd2cnoXObMqANd8my9SpYpeatPLBmMXkZl90pHWuHznIV0sW5bJHQBnf5MxV15gYUy3maXoIizJ9dMNKjnIq3Gj94O766Sp6lOiABLbWJo3mZiuis7g/qNYu9ABj7tFRi5UjuOj3KNgBC3Og8hiq67SL7IaNT7VLvCFYwbsVsq+dhgKGZs9l1ZdxdqPCu9Dexo1oDhtjqch6hSm0nm2llKGQict+Wl2cNh6zq73xz1t9uBqmW+l7APJqIFcyapq49Mb5y5tbNwe+OhsaAyAk7O7qPs/EClOuIKoHHkY4wJMeLxgqA3RX7FKf5zaSFey08rA9ocDlH9wdAyMe9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Fwd2Usrs/RELzdhTwaOo/THqzPJaHVvzw1yMmkpdlM=;
 b=W7J0FSHZYS80qmwESRlMiCkiUbqP8DciARI8OFD9pv+/sLx1fwlIEsCAVSw4l3cxPVTYEBPwUaNuwDN7AKucHlPuGwbR77PH/tIjBE4xKQBsFaqNuNH+Xa61MdmvgkN9gF0s5BSY56zxq/x/zH14iZSROjco8aiWp2c7TThjivyGeNL3TFgbHEHpUUOWDwLpggnVxN961cmhgoJ08R7UI5RR2t6WTL75ty862N2W4Q79ZhFM8dU+p1cJpOSmXR+Lgj38ks59DptVy6aWv8KgLcPrLqfoIXjxc8scuOz3cWl4QCkHhGl9TAA3iywpwBqK7PGiu3zzZPNr40S3btWqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ0PR11MB7702.namprd11.prod.outlook.com (2603:10b6:a03:4e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Fri, 31 Mar
 2023 18:43:08 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 18:43:08 +0000
Content-Type: multipart/alternative;
 boundary="------------0S0FnZ0AE0wDwhHCeuO3XEri"
Message-ID: <25f3bfc0-3a56-998f-83b8-713eda3f3282@windriver.com>
Date: Fri, 31 Mar 2023 14:42:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] Security Advisory - yasm - CVE-2021-33461: Propose mv
 yasm_git.bb yasm-native_git.bb
Content-Language: en-CA
To: Ross Burton <Ross.Burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>,
        "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        Martin Jansa <martin.jansa@gmail.com>
References: <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1srMzGA-y8+6mdV1gtYWfsJYvafhKkwvUu_HN-M=NwBfAA@mail.gmail.com>
 <MW4PR11MB5822CE51AA941EF0BE37115284259@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1sqHdrf1mK=c7CHVpKF7htPYbGztaG77FXReLMPczgoD4Q@mail.gmail.com>
 <3c7d0ac3-642d-8bc6-87b4-cd0d0b6a704b@windriver.com>
 <00ad165c-cf3e-e3f5-e0c9-46c9df882757@windriver.com>
 <FF2F4A07-1C8D-40DF-AA1A-B0E0CC82B8AA@arm.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <FF2F4A07-1C8D-40DF-AA1A-B0E0CC82B8AA@arm.com>
X-ClientProxiedBy: BY5PR17CA0069.namprd17.prod.outlook.com
 (2603:10b6:a03:167::46) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ0PR11MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5656c5-08da-4a3d-eae9-08db3217c572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lu+vR+idKw5zRS7yKN98Zu4sSL+jEciHEvXxDue3MrgKT6NmoeQ3/Scj3F27kTeN7WynF6weuzQl59qTwt0m7O6lbCqrXxyl6L+4H2u1wERF+qAUpnwpzXqwduP3P3Bpudk3QJfBEP0TXb/qnyW36dPGAG+zM/wgtlwi4w+Zfxkb/7E1hjhTk+cRhYZHTKQ9EmErLNpcGJrmaNB0ECR9YdGBQecx6GzBC7rJflfFVf9hjCQtf1RNwZP0mlVTPWHffrt503VEP1RMWjM363+0kkJzz68PTXdZ+03chEZy0eaKL5L/tfHSfAYfiGKDqIoIrx2ynYx+fLRYnByftaLq3cbyW/iRzfzIKFzwWIkMdV6wyYQ1TKR7rYWMNxVJ8OAJ/p1uGi6z/WepQj+YIRdIcGEuv7abvTiQqaLC9eWWW64diU1yCkSZ+3rZ8KQIYyWjZpBuyBQ3sOlhB7adIWYIsC6JlsWkkmxMORLKrNScp4pUSjhnJTMmXLDgBb57+CFsIpRR7/G7Ii/JdrEBXMM5Y54BCEPK4cuuKkotYXonqFo0sk4xox6V+n0OLgKLyq7atd+EjRGpDIzpbM9ZitIanktdXo5Juk2n2qsxE39Q9C3QX0WF3X4HCxrM8nEY0XHN4TQPE0P454sI7D7q8RpQLA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(346002)(366004)(376002)(396003)(451199021)(6486002)(31686004)(166002)(86362001)(31696002)(36756003)(2906002)(15650500001)(6666004)(83380400001)(6512007)(66946007)(66574015)(2616005)(53546011)(33964004)(38100700002)(478600001)(966005)(316002)(6506007)(8676002)(4326008)(66556008)(186003)(66476007)(26005)(6916009)(8936002)(54906003)(41300700001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2toN3dMNGpTVHhmY2ZjNUthRStleHcyTTVWYjZNMFJvWml2S1FYTEl1VWJL?=
 =?utf-8?B?TEtGd2lQTGpjTFN3dzRJRjRrRURPdy82SzFkeHFiQ0s5Z250cWlUcFdxN1Nl?=
 =?utf-8?B?M0d4Z3RHQ21hZnA1WG5PTjhPRDNOaUNHMWFCUE1UWGZCL2FoKzZPdGhLT1pS?=
 =?utf-8?B?MVY5WURPY3ZxekpjdGJxdkZrcGFEbUpUTjQyZ3RVei9ITXZQWEZjckN5RGRI?=
 =?utf-8?B?NGVMWmlKSXdlYjFtZ1NDQ0dUZ0V4R000Qlg2ZFI1Sk1iclJRSTRRa0VrQUpH?=
 =?utf-8?B?d0tmVzdmaGdDUmo4a2pnVEJvWjFKZEdlcmx3L21BZVBWWUlMUTZrWHVUWE1l?=
 =?utf-8?B?Zmc3NExHNTJ6c01qQkpuakJmVlZoWXVqRE55cEViMXQyRDJLKzRSYkpvemds?=
 =?utf-8?B?RVpqOWNPWmlyakpuYWQyZXhsMm13R2s1RWVlcnFrVmx1N2xlcEsxMGJtenpN?=
 =?utf-8?B?T3p2TVhWNUYxaGt1RDhPNUlJZ2pGSnFZSlR4b1BnWkcrdGR5QWlCSzVrSFZr?=
 =?utf-8?B?d1VJamNaOWY1VGhSN1hBcUhYbU9YRFRhVi9FTjFTMzBCcCtiMDRCS2I3TmpM?=
 =?utf-8?B?Y3dwM0RFTkxnaDdKNUlVbVFESDdZeFRPWjNrMmVaamlUeDY4aXBHbGh0eHBH?=
 =?utf-8?B?cGV6c3dVTnN0ekZaNWlHamRvb2FxY0l4UUpudGQ3eVFjMlBnSmF3MTAyb1Fv?=
 =?utf-8?B?UmFhSGUyaWFEN1BFL0pTUWpaMm03L0hMZWpHQStKUG5HNDM3VFNpMEFzVUhs?=
 =?utf-8?B?WUh5bUREd0F0aGlvd01HYkVjaHNpTTJaVWZWajNETTV3dHo5YjFhNWxPclIz?=
 =?utf-8?B?OHlXdnA2cjgwMFliYkp0aTc3WnRYYm10N3VzcTQ5bk1qSmhXdDN5VDBNSUtV?=
 =?utf-8?B?bzZDdGp6eFd4QThBYndxZmlHRks4Q1crVm10Vyt2K3Y2M2FuNHk5UGlpRm5p?=
 =?utf-8?B?NnFGL2x0ckV2SElmQ1prMUJjTU9YcG9BK0tZeG1tdVhZSXhJUEN0b2wzVmFv?=
 =?utf-8?B?WGpBOHU0cTl6eERFUFVFZTdDUHBQRWRMU2d1Uys0YWdXbzB5ajgzcDIrTVh4?=
 =?utf-8?B?bDhzSzlNQmlvVjIxR2UrNlZRcUNJczhkNk40YjFEajQvQStZOXJmVG1MM3RU?=
 =?utf-8?B?aE44M2JNZGltbzF1YURiVWcxeE0rOEZoQW1wQjFWZFVvcnMybHJFTjZXUWww?=
 =?utf-8?B?VlVlTVU2YXVreUR4SGRMTEFSbk5LWnRLTENKcE8zRVJJUWZJZmdpNWZ0eThx?=
 =?utf-8?B?bEl0MU1WSWVHQUxlY2w0L0lnckdqZHBxWURDZVhQV3BxK3lONnprWkl6VEsv?=
 =?utf-8?B?NlV1UEJObzhzc1hoSXBCOXF6UTlSWVNRQWVONTBDRGRpb25tYVlIa0xsM2E4?=
 =?utf-8?B?NytXQVEwdlh3L292cmxjUTdLaHBIL3gzUVJxajZrT1pYSnlyUGVtY2JYRHFT?=
 =?utf-8?B?R1JmS3ladUJEMVZaRnNvUndyZ2h2cWdhSXRPakswN0c0bEtvWFQycHV5RDlz?=
 =?utf-8?B?RXNEWFI3V3I4cGd6UU1yemNqRU9zSzJyMzdNQnRDZ1VwN2Fva21GRzhvYms5?=
 =?utf-8?B?SWNGU3M5NlhUdVVnRGZLVmZTcm8xSUlnZVZZZ1dBQjdFTnFrQU92UWo4VDB6?=
 =?utf-8?B?RFNRWVFyYUpCNXNlWUpLMzVKV2w5cHJGbHh5LzR3SUZVb3BWbHZCVVl0dzZJ?=
 =?utf-8?B?MUNCaFpPcldHM0lRNFBMczlGSFE3WjVvZGRkMHk0N1pPMS9zTU9wZ0pXZXNJ?=
 =?utf-8?B?VTV6KzFBR1lrYWh4L25wb2Z0SUFvRlZoczEzQXhJVnJSR040TGE4VVJsUzlM?=
 =?utf-8?B?NmFhbnBYSWk3VGJIL1RCN055MGIwelRzeU05emVxV0FnQ0pneTQ1aTJSTkti?=
 =?utf-8?B?QnNZVzIrK1ZzZDhkQm5FMi9idit4T1RCK0ZyWHJGMElnWHNucEdIYXhOOTZ4?=
 =?utf-8?B?Tm5qbldqV1gybGY3VG1rRzVVUm9ZU1J6NW01bmVuRGJJMFpMd25pWENnZjlk?=
 =?utf-8?B?Ym4rM1RSSC9mZXhRZ0xaNVRSaGlQWnRndjVxSUxFT20zQkNQZTVmbHdzZ09i?=
 =?utf-8?B?ZE83N0RpaWoxUlhnN2tSY0tUd0Jid0QzbWY4MjV5cUtZWGNTeGQybjVsSTRY?=
 =?utf-8?B?dEdxL1Yvd3Q3RFRhbmJjUU5ma0FIQzh2SnVzckx3THhMNTFFN1d2SGNFR0V2?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5656c5-08da-4a3d-eae9-08db3217c572
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 18:43:08.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkSJMov5A77CPAE3jseaOb9Q4YDNPrit6Ie76b1xv+GdO1gbB8xqGAYFF5sdBn+HW4ngMfI/xAZknDL0A1eQow0/o6f3a30SZ8hIQXauoWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7702
X-Proofpoint-GUID: H2Oii1WNWAIHss1eW2rC2OcoV9jxRlSN
X-Proofpoint-ORIG-GUID: Cj5yCe9AfRFNnKl8Pb2UvEDyvArpHR6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310151
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 18:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101863

--------------0S0FnZ0AE0wDwhHCeuO3XEri
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32VIfskI000754

On 2023-03-31 05:51, Ross Burton wrote:
> On 30 Mar 2023, at 22:56, Randy MacLeod via lists.openembedded.org<rand=
y.macleod=3Dwindriver.com@lists.openembedded.org>  wrote:
>> The yasm CVEs have come up again. Sigh.
>> Upstream seems not to be interested in fixing CVEs:
>> https://github.com/yasm/yasm/commits/master
>>
>> We only need yasm-native (1) so does anyone object to
>> moving this recipe to yasm-native_git.bb ? This small change
>> would make it clear that images/tagets/machines are not _directly_ vul=
nerable
>> due to the fuzzing errors people are generating which result in CVEs.
> It seems like a better alternative would be to reduce the number of ass=
emblers that are effectively unmaintained from two (nasm and yasm) to one=
 (just nasm, as that=E2=80=99s in oe-core).  Also marking all yasm/nasm d=
ependencies as being x86-specific for obvious reasons.
>
> I=E2=80=99m a firm believer that we should be able to rebuild all packa=
ges on target, so native-specific tools should be a special case.  The mo=
ment you make it native only is the moment you discover that someone was =
using nativesdk-yasm or on-target yasm to develop.
Few assembler recipes: good idea!
Yes, it's best to keep the recipe working for both -native and target.
>
> Looking at your search, I think we might be able to just remove yasm en=
tirely:
>
>> meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
>> 18:DEPENDS =3D " yasm-native"
> According to the AOM readme:
>
> "For x86 targets, yasm, which is preferred, or a recent version of nasm=
.=E2=80=9D
>
> So that dependency should be specific to x86 targets, and could be nasm.
>
>> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> 310:    yasm \
> This is just the meta packagegroup that pulls in all of the recipes, fo=
r testing.
>
>> ../meta-browser.git/meta-firefox/recipes-browser/firefox/firefox_68.9.=
0esr.bb
>> 8:            yasm-native nasm-native unzip-native \
> Of course firefox wants yasm *and* nasm.  Those should most likely be x=
86-specific to start with, and I=E2=80=99m guessing that=E2=80=99s relate=
d to:
>
>> ../meta-browser.git/meta-firefox/recipes-browser/firefox/firefox/fixes=
/pre-generated-old-configure.patch
>> 8213:+                { echo "configure: error: Building ICU requires =
either yasm or a GNU assembler. If you do not have either of those availa=
ble for this platform you must use --without-intl-api" 1>&2; echo "config=
ure: error: Building ICU requires either yasm or a GNU assembler. If you =
do not have either of those available for this platform you must use --wi=
thout-intl-api" 1>&5; exit 1;
> So that patch adds a huge configure script with no explanation and is a=
t least five years old.
>
> We happily build ICU in core without yaml as we have GNU as.  I expect =
that can be removed.

Let's hope so and Archana and I can take a look.


It would be nice to update firefox ( 68->110 !!) but we're (WR) in the:
'everybody expects the blink rendering engine'=C2=A0 camp.

If Martin doesn't have any plans to update firefox, it might become a=20
weekend project.

>
>> ../meta-intel-qat.git/recipes-extended/qat/qat17_4.20.0-00001.bb
>> 10:DEPENDS +=3D "boost udev zlib openssl yasm-native"
> I=E2=80=99d be surprised if a quick s/nasm/yasm/ didn=E2=80=99t fix thi=
s.  The nasm compiler is more actively maintained _and_ maintained by and=
 Intel employee after all=E2=80=A6


Ah, I didn't know that the nasm maintainer is an INTC geek, but
it's exactly the sort of info I was hoping to hear by posting!


Thanks Ross.

../Randy



>
> Ross


--=20
# Randy MacLeod
# Wind River Linux

--------------0S0FnZ0AE0wDwhHCeuO3XEri
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32VIfskI000754

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-03-31 05:51, Ross Burton wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:FF2F4A07-1C8D-40DF-AA1A-B0E0CC8=
2B8AA@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 30 Mar 2023, at 22:56, Ra=
ndy MacLeod via lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:randy.macleod=3Dwindriver.com@lists.openembedded.org">&lt=
;randy.macleod=3Dwindriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">The yasm CVEs have come up=
 again. Sigh.
Upstream seems not to be interested in fixing CVEs:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/yasm/yasm/c=
ommits/master">https://github.com/yasm/yasm/commits/master</a>

We only need yasm-native (1) so does anyone object to=20
moving this recipe to yasm-native_git.bb ? This small change
would make it clear that images/tagets/machines are not _directly_ vulner=
able
due to the fuzzing errors people are generating which result in CVEs.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">It seems like a better alter=
native would be to reduce the number of assemblers that are effectively u=
nmaintained from two (nasm and yasm) to one (just nasm, as that=E2=80=99s=
 in oe-core).  Also marking all yasm/nasm dependencies as being x86-speci=
fic for obvious reasons.

I=E2=80=99m a firm believer that we should be able to rebuild all package=
s on target, so native-specific tools should be a special case.  The mome=
nt you make it native only is the moment you discover that someone was us=
ing nativesdk-yasm or on-target yasm to develop.</pre>
    </blockquote>
    Few assembler recipes: good idea!<br>
    Yes, it's best to keep the recipe working for both -native and
    target.<br>
    <blockquote type=3D"cite" cite=3D"mid:FF2F4A07-1C8D-40DF-AA1A-B0E0CC8=
2B8AA@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Looking at your search, I think we might be able to just remove yasm enti=
rely:

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">meta-multimedia/recipes-mu=
ltimedia/aom/aom_3.4.0.bb
18:DEPENDS =3D &quot; yasm-native&quot;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">According to the AOM readme:

&quot;For x86 targets, yasm, which is preferred, or a recent version of n=
asm.=E2=80=9D

So that dependency should be specific to x86 targets, and could be nasm.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">meta-oe/recipes-core/packa=
gegroups/packagegroup-meta-oe.bb
310:    yasm \
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">This is just the meta packag=
egroup that pulls in all of the recipes, for testing.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">../meta-browser.git/meta-f=
irefox/recipes-browser/firefox/firefox_68.9.0esr.bb
8:            yasm-native nasm-native unzip-native \
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Of course firefox wants yasm=
 *and* nasm.  Those should most likely be x86-specific to start with, and=
 I=E2=80=99m guessing that=E2=80=99s related to:

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">../meta-browser.git/meta-f=
irefox/recipes-browser/firefox/firefox/fixes/pre-generated-old-configure.=
patch
8213:+                { echo &quot;configure: error: Building ICU require=
s either yasm or a GNU assembler. If you do not have either of those avai=
lable for this platform you must use --without-intl-api&quot; 1&gt;&amp;2=
; echo &quot;configure: error: Building ICU requires either yasm or a GNU=
 assembler. If you do not have either of those available for this platfor=
m you must use --without-intl-api&quot; 1&gt;&amp;5; exit 1;=20
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">So that patch adds a huge co=
nfigure script with no explanation and is at least five years old.

We happily build ICU in core without yaml as we have GNU as.  I expect th=
at can be removed.</pre>
    </blockquote>
    <p>Let's hope so and Archana and I can take a look.</p>
    <p><br>
    </p>
    It would be nice to update firefox ( 68-&gt;110 !!) but we're (WR)
    in the:<br>
    'everybody expects the blink rendering engine'&nbsp; camp. <br>
    <p>If Martin doesn't have any plans to update firefox, it might
      become a weekend project. </p>
    <blockquote type=3D"cite" cite=3D"mid:FF2F4A07-1C8D-40DF-AA1A-B0E0CC8=
2B8AA@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">../meta-intel-qat.git/reci=
pes-extended/qat/qat17_4.20.0-00001.bb
10:DEPENDS +=3D &quot;boost udev zlib openssl yasm-native&quot;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I=E2=80=99d be surprised if =
a quick s/nasm/yasm/ didn=E2=80=99t fix this.  The nasm compiler is more =
actively maintained _and_ maintained by and Intel employee after all=E2=80=
=A6</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Ah, I didn't know that the nasm maintainer is an INTC geek, but <b=
r>
      it's exactly the sort of info I was hoping to hear by posting!</p>
    <p><br>
    </p>
    <p>Thanks Ross.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:FF2F4A07-1C8D-40DF-AA1A-B0E0CC8=
2B8AA@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Ross</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0S0FnZ0AE0wDwhHCeuO3XEri--

