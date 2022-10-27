Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B95FA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 17:06:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.45.1666890405370982582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 10:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=qRvuPBpl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7299a433e6=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29REw6uW020196
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 10:06:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=t7Qjv5Ehx+TQudcly0SXH+aQ5cmA9d46Z+2WkjVLtS8=;
 b=qRvuPBplhycJQdU2tk4qmHrgOKR6ynXekLkKxfz6H+VuXu+SOLil4Ui8YKXj2NoaHb9x
 wJ8nNNkXs4B9UsXuK4ZPw/PO7jff195Xj2TwA4nqs3kPb6hK6GB7rj/ZeOH5aq/RFIKF
 eWDIKGXp5na3pseMJQwlFBEcziNbKgVE6qCHHfnYRC5B4UO6dISLauK2kLT91XSnicey
 87P29cUMm0B3GWnsIa6eSdTwRgWYt94x82Op3RQ8BD/VspDHyhgnW4vO7zeIdC73Nrax
 VYF1/9KyuMA+IDJs2iTJf5GZcEA7n/D0uOLhvYq7/EQ92YLCEI1rkqbq1wSqYc91jlPE dA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3grnb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 10:06:44 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29RGvR4C032502
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 10:06:44 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3grnb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Oct 2022 10:06:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ5h2OHlwAbtJBNCHmJ/Yf6C4autRiaPStTRD2BGXh5bQJqq2LBGdLgbLgOMn0jbzdfk3bJQn5fkmoKbF5DVAPNZJnSOXnrprewdMdJujWs1Ev4VZLWwCS/iBjRWCGnAweQuK44EOEXiL534PvsGmgWvMGAgCBBTEpjynDRZEJVYXfoHykQFaur9wLXOcVu1+WxjJooYQTnSbK+jULLAu0j8sPcL/NMlgazqobKZnmpYfzrwxcr0TF38L1+IdU98V7xrGsE7FCY20BMHayEHRD+6CLvRMPXmPVFNAMS+WIlq7SONHrbfF3dy7jnpK2b6mCk7PstzhYbX2c0vwLqT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7Qjv5Ehx+TQudcly0SXH+aQ5cmA9d46Z+2WkjVLtS8=;
 b=Kymme22FKdirXMH/ZFcwMZIilh5/f7GlZhLS7/wfcnXk0cP3MdBHh9dpaMOftUUa8LZk/DoBrSFgLi/5Vp5CMKk4AdgFj5d+3i7yRbmowNHWmXWjx7K/rTCAWWRe1Lx7wIqH0sR0hyCTkKVP7oZ/eqlGeNrGoJKZfvfLWnWX9CP0livdGYWJk4OAbl4Ph3nst/swwjGKNNCVKt2T39G269GESpMjgCriTv2SzM597yETo5JbzxCMvVzOcKU+5pOjLergAk9byI9rfqSwaH9ztgQpIniOBFnaWaX7LQHSpYSBSl/1kJ5yKCi5LOkAqjwZCJSPW49wL5JYLBjO3B+/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA2PR11MB4843.namprd11.prod.outlook.com (2603:10b6:806:fb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 17:06:40 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5769.015; Thu, 27 Oct 2022
 17:06:40 +0000
Message-ID: <53653928-d36e-a869-779d-55255341c7a5@windriver.com>
Date: Thu, 27 Oct 2022 13:06:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] mariadb: not use qemu to run
 cross-compiled binaries
Content-Language: en-CA
To: "Yu, Mingli" <mingli.yu@windriver.com>,
        openembedded-devel@lists.openembedded.org, Ross.Burton@arm.com,
        Armin Kuster <akuster808@gmail.com>
References: <647C21FD-1AD1-4955-AB61-C3C5195CC7CF@arm.com>
 <17184F1EA11A10CE.15234@lists.openembedded.org>
 <a1962501-4bfe-a547-0af5-caaae7cc4797@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <a1962501-4bfe-a547-0af5-caaae7cc4797@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA2PR11MB4843:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c696cea-733d-42f9-8d40-08dab83d9d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2FiPXYUK9OBqr1p6+fXZHXGueoHQZggenttks0jPvmAyc9yZYvXoKf35lCroCr3nhoMya4NSY1RCr1AVXpxVN4o3VyzMQHlkCWwH0qFXRFyCGXklP/z4q2HIzLg8vcLLskAU6iqfl44m2HU7bk2w4OVnA51LpPiinEIjtqb7Z4jDw7OAAEASn9qe8kkGrTfgWaniunnwnTnpZjhnoZCZFQLUbP2CbSo0/1wke+hshfwPd0CJCBChPwdBkU8Tk2Oc0/2DuB6m7EodPlTNJobIF4p9Tv5GmMgMoQnv2F6GS0RsAhWBwJapv8zJ/pDD1ctUB0Agi4hrs3kkZUEihsDvvVhat/u1GL3e7vJ7hFMKyzAHtp1BlQLXmS2yN5RcS2MK5YmPiPVzQi1X9S7JE3E6Tlw6eAK61s3SuPSnype0EvHeomMW7j9dVgd7tFvdev9xGl2hLbF4Y39EIOheeQ7NZEk/16Ka97YWSQWAV+vjdZkACiivfsq8+NOMuOhf0y4t1Zmk3AihCN994GMqztZLJWnLEpOkliEB54Qku4cANhWWRvEmrhFdycEfRLx5AtF+ht/b18ztq1M9amgyTnkOsu5WiDuvs9czBU2ayD6Yi7jqlLoT1cv2cOEKum9Z0A4g3ZDiMybrMLXg1YgMZdP9s1Psz2acv/E68dep/Zk43uuMTvnJEx7UBfdryC4ITUC61UeIQcm+FAqdH6jGNrjnF3VXGI2RK5arhdwMvs6g/o7aTsRTG62GkUnplOjG7tl3wJD2FUUUCGO3ZBe8WvxOgTcNm5lx3dTLzkgvEfsVt0bLZbsoCvK2Cg9Ti/8hZfYEOavkYLuoz5VR3y75Zs3zM+SiV3qBPVXmb7YwaGZxfRM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(451199015)(31696002)(83380400001)(110136005)(38100700002)(66556008)(8936002)(30864003)(5660300002)(66946007)(66476007)(2906002)(8676002)(86362001)(6666004)(41300700001)(6506007)(53546011)(4001150100001)(478600001)(2616005)(6512007)(186003)(966005)(26005)(316002)(31686004)(36756003)(66899015)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V2p3S0hSdTlvL0FLalVtMERncVU0MHRVOTJIRVJ3WXlmNEtLUXdwTlBEdWYy?=
 =?utf-8?B?ZEFpbnFZZ1Bvbi84aThmaG1heHBUb2ZZcXI3am1tSnlpeFYzREY4N0JqcFU5?=
 =?utf-8?B?NldSRmxIbFpic3F6clNoSkpFMkFFdG1ScFZXTzk5d1BhK3dsczZQVU1OUVcx?=
 =?utf-8?B?a0Z0UUJEYk1IYk0rWlhpQ1U1VHYycGk4NkUwT0QyYWMvdUowMWFNMnZWSStw?=
 =?utf-8?B?RHN6bXdzUHhMbzBxR3VpNkQvRFBMNDc5Z0IzT2ZPM1hNOVJwZXJ3MDFUbFJp?=
 =?utf-8?B?VndjNms1d0tRM0pOV0txYXR5ZmJVRVVhcWtOdDg5UDdqWU1pS25XNmNNOG1I?=
 =?utf-8?B?UXRKcTVzMEwrbE01OUI3RjVqcHNyZis4Y1dzUjQwbVFOZC9Jbnl3L1JGSitm?=
 =?utf-8?B?NXN1cTNYNkJ1N0dTSWcwVGlQTERaUlZaQ2E5WWJYSW4zUzQ2QXFPbkhwZkJR?=
 =?utf-8?B?WUhNWVhscnNlRnl3NkJxeFVnbUNNa3FFSEtSc2wzUDZFWGxaakJBVUIwOHVG?=
 =?utf-8?B?QVVzR0swckdZcFFGN2s4b1BwRDJkem1jbjZoYVdFZDhQVjVtMUdjR1YxMzlN?=
 =?utf-8?B?a3VnRTA1eEZxajlaK1NjZm1ZVytxU2NsR1FyL3J0Zmk4TVAzSExxTlhNbEpj?=
 =?utf-8?B?a3hFUWYweW8xY0I2YnFDckhtekYybVV1QnArTlpsMjNldEk4YndYaUNaaDgw?=
 =?utf-8?B?eWoxaWFUTzZDbmJsaGxLWEF5ejRlaEQxSW1XMEovdXBwc1hDc3c5R3E0UUlJ?=
 =?utf-8?B?UXcwS01PaTBlUld1d2JvS2xhTkdhNkZ0MTJzR21mL2tCMitCQ2ZDOHdwL3Vt?=
 =?utf-8?B?WEhZaUJVWVNzeEo4ak9EaE12YkpJSC9sL0lWR3ZyeU40a3FHcHNONCtWTklD?=
 =?utf-8?B?UVFHMDJienBkNkMvRWFIQjR1STBheSt1amlPMGhBWURmTVFVZ2V5QWtWV0Yz?=
 =?utf-8?B?V1Y3d2VQd2N3WHhEQys1VitHTFU2ajNhUUFXclYrcVpBN051WHU2NnNWbTRz?=
 =?utf-8?B?eVRZNjkzTFc2bHRzN0JUUmhtanptRysyRFA3WjJ0bGd5c25iWXVtcjJ6b2to?=
 =?utf-8?B?SDBNOXltL29TWGVPMXRZaENubVlLOCtLUStBM1VLMnFXczE4SWtzeTVvNnd4?=
 =?utf-8?B?SThhaU1VQXA0OFdCMSt1RThOdVptSU1SYithZGtyUTBRZURNVjEyYVpXeVo0?=
 =?utf-8?B?U1RGK2VrYVJuQ3dmdzhPZ1JWa1l6UTQ4R0RFMVdqWUVMd05HOFlIQmU5MjV3?=
 =?utf-8?B?VlBLYkRpaVpqR1VJN1VkVGx5TjJjSFNMLzRQdmFKWk5zN2hVUnlxcktONzZK?=
 =?utf-8?B?R2JjUTNod0tSY0dDS2RZMTRkNTROSHBmK2xScjBHRHVSWnBHdDVoNzUxSmhh?=
 =?utf-8?B?TU9ablQvb1Z5RldDdE9rRkJUL05QSWU1TXZhbTBUV3NOcks1bWoxZjdjeHdI?=
 =?utf-8?B?M3N6TjJ1V2o0M2NhM1hQMzNvUk1OVUxqTVdvbmRCU1pUVS81RUdkZGJsNFRn?=
 =?utf-8?B?WEJnTzNBWnVnQVdrczhpQzRvOVJQbHg5d3Z5Z25hellsK0lFOEpIYnRmUVND?=
 =?utf-8?B?eDBKbHFQZWRmdWpkOFp3V1NvMldzcENFUTNoU3BONmhwRDNHeHVmOGoxaVVw?=
 =?utf-8?B?bXZlbTYvOFlOUkxwMVlUVnZzNHNCN0F5b0tRVE9OYzE4NkJ0dGtwVHk0TWpL?=
 =?utf-8?B?dllKMjhDUnFIMmpGMmw2WVBQYUJyNEo4SUlEWkViRU84Q2s2cDZiT21YUWN0?=
 =?utf-8?B?OHlOd1NEcjk2YlhLTzJXSmthbFBRdkRnK2hxcURuS0lRWmt2TmpBSkxtNzY3?=
 =?utf-8?B?eDBvbmg0M281aUg4RWV4MUNEdHZ2Ny92bzVWczFuZ1QvelgzbmlJUUtOVGpk?=
 =?utf-8?B?VUlzcEx6RVVxTmpvbS9pSjZQWHJVTUgycUgzSXdIaUtUY0NSTmVwOXduRWlp?=
 =?utf-8?B?RWU2SkoxUkY0dGtlNlp5ODdRRENPZkxtbnc2UTVaZTJBRFBXVzNid1IxbmhP?=
 =?utf-8?B?SUNBbkJRbDZ0MEh0M1ZKV01lc215MHpSQlRmNkZWV3RxY0h1aE5pcks5MjdX?=
 =?utf-8?B?ZnBMRldhcTVSS3I5RytxL25laktvS3EwT291VEJ4VUFQS25ZYnlCZFNqZjd5?=
 =?utf-8?B?TkF4ZEpaSnREUjQ4U3dmbG5YUTdCSUhGbnI2K2l4Qk13UjFMd1pxY3l0M3Ru?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c696cea-733d-42f9-8d40-08dab83d9d82
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 17:06:40.3628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVCOHL2Moe24NYDBxovkQRu+QVkiCOoY95F4vwjb7DSQ8elJjJ1gzBsx8BAUogHI3NDSoDhXbKvGfzyB9gT3yrmI2Jd+ZI2FCyfiwS74N0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4843
X-Proofpoint-GUID: d9qatpQH9rakTtJCEI0oH4VBN1rtoVDn
X-Proofpoint-ORIG-GUID: GqM28d4fc-2MTjeXZIyxax5G8_38AWYE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270096
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 29REw6uW020196
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 17:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99324

On 2022-10-17 01:56, Yu, Mingli wrote:
> Ping.

Armin,

Did you miss this one since it was threaded?

../Randy

>
> Thanks,
>
> On 9/26/22 12:37, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> The build fails when use qemu to run build for amd64 as below:
>>
>> | make=C2=A0 -f=20
>> libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build.make=20
>> libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/depend
>> | make=C2=A0 -f libmariadb/libmariadb/CMakeFiles/libmariadb.dir/build.=
make=20
>> libmariadb/libmariadb/CMakeFiles/libmariadb.dir/depend
>> | make[2]: Entering directory=20
>> '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
>> | cd /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build &&=20
>> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot=
-native/usr/bin/cmake=20
>> -E cmake_depends "Unix Makefiles"=20
>> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4=
=20
>> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4=
/libmariadb/libmariadb=20
>> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build=20
>> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmaria=
db/libmariadb=20
>> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmaria=
db/libmariadb/CMakeFiles/mariadbclient.dir/DependInfo.cmake=20
>> --color=3D
>> | make[2]: Leaving directory=20
>> '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
>> | make=C2=A0 -f=20
>> libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build.make=20
>> libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build
>> | Illegal instruction (core dumped)
>> | make[2]: *** [sql/CMakeFiles/GenServerSource.dir/build.make:76:=20
>> sql/lex_hash.h] Error 132
>> | make[2]: *** Deleting file 'sql/lex_hash.h'
>> | make[2]: Entering directory=20
>> '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
>> | [=C2=A0 8%] Linking C static library libmariadbclient.a
>> | cd=20
>> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmaria=
db/libmariadb=20
>> &&=20
>> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot=
-native/usr/bin/cmake=20
>> -P CMakeFiles/mariadbclient.dir/cmake_clean_target.cmake
>> | Illegal instruction (core dumped)
>> | Illegal instruction (core dumped)
>> | make[2]: *** [scripts/CMakeFiles/GenFixPrivs.dir/build.make:78:=20
>> scripts/mysql_fix_privilege_tables_sql.c] Error 132
>>
>> So don't use qemu to run cross-compiled binaries.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>> =C2=A0 .../mysql/mariadb-native_10.7.4.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
>> =C2=A0 meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 20 +++---
>> =C2=A0 ...Lists.txt-fix-gen_lex_hash-not-found.patch | 69 ++++++++++++=
+++++++
>> =C2=A0 .../mysql/mariadb/cross-compiling.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 34 +++++++++
>> =C2=A0 meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb=C2=A0=C2=A0 |=C2=A0=
 4 +-
>> =C2=A0 5 files changed, 116 insertions(+), 15 deletions(-)
>> =C2=A0 create mode 100644=20
>> meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_=
hash-not-found.patch
>> =C2=A0 create mode 100644=20
>> meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb=20
>> b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
>> index e38726d3f..17a06349b 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
>> @@ -2,7 +2,9 @@ require mariadb.inc
>> =C2=A0 inherit native
>> =C2=A0 =C2=A0 PROVIDES +=3D "mysql5-native"
>> -DEPENDS =3D "ncurses-native zlib-native bison-native libpcre2-native"
>> +DEPENDS =3D "ncurses-native zlib-native bison-native libpcre2-native =
\
>> +gnutls-native fmt-native \
>> +"
>> =C2=A0 =C2=A0 RDEPENDS:${PN} =3D ""
>> =C2=A0 PACKAGES =3D ""
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc=20
>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 922373b63..23322cf74 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -20,6 +20,8 @@ SRC_URI =3D=20
>> "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://mm_malloc.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://sys_futex.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://mariadb-openssl3.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://c=
ross-compiling.patch \
>> + file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patc=
h"
>> =C2=A0 @@ -61,6 +63,8 @@ FILES:${PN}-setupdb =3D=20
>> "${sysconfdir}/init.d/install_db \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
${bindir}/mysql-systemd-start \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"
>> =C2=A0 +EXTRA_OEMAKE =3D "'GEN_LEX_HASH=3D${STAGING_BINDIR_NATIVE}/gen=
_lex_hash'"
>> +
>> =C2=A0 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam=
', d)}=20
>> openssl"
>> =C2=A0 PACKAGECONFIG:class-native =3D ""
>> =C2=A0 PACKAGECONFIG[pam] =3D ",-DWITHOUT_AUTH_PAM=3DTRUE,libpam"
>> @@ -95,9 +99,9 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DINSTALL_SYSCONFDIR:PATH=3D${syscon=
fdir} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DMYSQL_DATADIR:PATH=3D/var/mysql \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCAT_EXECUTABLE=3D`which cat` \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DSTACK_DIRECTION=3D1 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCMAKE_AR:FILEPATH=3D${AR}"
>> =C2=A0 -EXTRA_OECMAKE:prepend:class-target =3D=20
>> "-DCMAKE_CROSSCOMPILING_EMULATOR=3D${WORKDIR}/qemuwrapper "
>> =C2=A0 =C2=A0 # With Ninja it fails with:
>> =C2=A0 # make: *** No rule to make target `install'.=C2=A0 Stop.
>> @@ -121,18 +125,12 @@ do_generate_toolchain_file:append:class-native=20
>> () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d"=
 ${WORKDIR}/toolchain.cmake
>> =C2=A0 }
>> =C2=A0 -do_configure:prepend:class-target () {
>> -=C2=A0=C2=A0=C2=A0 # Write out a qemu wrapper that will be used by cm=
ake
>> -=C2=A0=C2=A0=C2=A0 # so that it can run target helper binaries throug=
h that.
>> -=C2=A0=C2=A0=C2=A0 qemu_binary=3D"${@qemu_wrapper_cmdline(d,=20
>> d.getVar('STAGING_DIR_HOST'),=20
>> [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST=
}${base_libdir}')])}"
>> -=C2=A0=C2=A0=C2=A0 cat > ${WORKDIR}/qemuwrapper << EOF
>> -#!/bin/sh
>> -$qemu_binary "\$@"
>> -EOF
>> -=C2=A0=C2=A0=C2=A0 chmod +x ${WORKDIR}/qemuwrapper
>> -}
>> =C2=A0 =C2=A0 do_compile:prepend:class-target () {
>> +=C2=A0=C2=A0=C2=A0 # These need to be in-tree or make will think they=
 need to be=20
>> built,
>> +=C2=A0=C2=A0=C2=A0 # and since we're cross-compiling that is disabled
>> +=C2=A0=C2=A0=C2=A0 cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
>> +=C2=A0=C2=A0=C2=A0 cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${@bb.utils.contains('PACKAGECONF=
IG', 'krb5', 'yes',=20
>> 'no', d)}" =3D "no" ]; then
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ! [ -e ${B}/=
include/openssl/kssl.h ] ; then
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 mkdir -p ${B}/include/openssl
>> diff --git=20
>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_le=
x_hash-not-found.patch=20
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_le=
x_hash-not-found.patch=20
>>
>> new file mode 100644
>> index 000000000..456a2bad6
>> --- /dev/null
>> +++=20
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_le=
x_hash-not-found.patch
>> @@ -0,0 +1,69 @@
>> +From f92f657973997df30afdb0032c88ad3a14ead46b Mon Sep 17 00:00:00 200=
1
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Fri, 23 Sep 2022 15:48:21 +0800
>> +Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
>> +
>> +Fix the below do_compile issue in cross-compiling env.
>> +| make[2]: *** No rule to make target=20
>> '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13=
/sql/gen_lex_hash',=20
>> needed by 'sql/lex_hash.h'.=C2=A0 Stop.
>> +| make[2]: *** No rule to make target=20
>> '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13=
/sql/gen_lex_token',=20
>> needed by 'sql/lex_token.h'.=C2=A0 Stop.
>> +
>> +Upstream-Status: Inappropriate [oe build specific]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + sql/CMakeLists.txt | 30 ++++++++++++++++++++++--------
>> + 1 file changed, 22 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
>> +index 241b482..27a3991 100644
>> +--- a/sql/CMakeLists.txt
>> ++++ b/sql/CMakeLists.txt
>> +@@ -60,11 +60,18 @@ ${CMAKE_BINARY_DIR}/sql
>> + ${CMAKE_SOURCE_DIR}/tpool
>> + )
>> +
>> +-ADD_CUSTOM_COMMAND(
>> +-=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> +-=C2=A0 COMMAND gen_lex_token > lex_token.h
>> +-=C2=A0 DEPENDS gen_lex_token
>> ++IF(NOT CMAKE_CROSSCOMPILING)
>> ++=C2=A0 ADD_CUSTOM_COMMAND(
>> ++=C2=A0=C2=A0=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> ++=C2=A0=C2=A0=C2=A0 COMMAND gen_lex_token > lex_token.h
>> ++=C2=A0=C2=A0=C2=A0 DEPENDS gen_lex_token
>> ++)
>> ++ELSE()
>> ++=C2=A0 ADD_CUSTOM_COMMAND(
>> ++=C2=A0=C2=A0=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> ++=C2=A0=C2=A0=C2=A0 COMMAND gen_lex_token > lex_token.h
>> + )
>> ++ENDIF()
>> +
>> + FIND_PACKAGE(BISON 2.4)
>> +
>> +@@ -372,11 +379,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED=20
>> CMAKE_CROSSCOMPILING_EMULATOR)
>> +=C2=A0=C2=A0 ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
>> + ENDIF()
>> +
>> +-ADD_CUSTOM_COMMAND(
>> +-=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>> +-=C2=A0 COMMAND gen_lex_hash > lex_hash.h
>> +-=C2=A0 DEPENDS gen_lex_hash
>> ++IF(NOT CMAKE_CROSSCOMPILING)
>> ++=C2=A0 ADD_CUSTOM_COMMAND(
>> ++=C2=A0=C2=A0=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>> ++=C2=A0=C2=A0=C2=A0 COMMAND gen_lex_hash > lex_hash.h
>> ++=C2=A0=C2=A0=C2=A0 DEPENDS gen_lex_hash
>> ++)
>> ++ELSE()
>> ++=C2=A0 ADD_CUSTOM_COMMAND(
>> ++=C2=A0=C2=A0=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>> ++=C2=A0=C2=A0=C2=A0 COMMAND gen_lex_hash > lex_hash.h
>> + )
>> ++ENDIF()
>> +
>> + MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc)
>> + SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES=20
>> COMPILE_FLAGS "-DTZINFO2SQL")
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch=20
>> b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>> new file mode 100644
>> index 000000000..d0d6e3c73
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>> @@ -0,0 +1,34 @@
>> +From 80be37351d995654f86b838f6b5ed47e8a90261b Mon Sep 17 00:00:00 200=
1
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Fri, 23 Sep 2022 12:05:17 +0800
>> +Subject: [PATCH] CMakeLists.txt: not include import_executables.cmake
>> +
>> +building failed since native does not generate import_executables.cma=
ke
>> +In fact, our building system will export the needed commands.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + CMakeLists.txt | 5 -----
>> + 1 file changed, 5 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index f9e2b1b..34924ba 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -394,11 +394,6 @@ CHECK_LIBFMT()
>> + ADD_SUBDIRECTORY(tpool)
>> + CHECK_SYSTEMD()
>> +
>> +-IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATO=
R)
>> +-=C2=A0 SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "=
Path=20
>> to import_executables.cmake from a native build")
>> +-=C2=A0 INCLUDE(${IMPORT_EXECUTABLES})
>> +-ENDIF()
>> +-
>> + #
>> + # Setup maintainer mode options. Platform checks are
>> + # not run with the warning options as to not perturb fragile checks
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb=20
>> b/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
>> index c800c4c56..8dba5c858 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
>> @@ -1,8 +1,6 @@
>> =C2=A0 require mariadb.inc
>> =C2=A0 -inherit qemu
>> -
>> -DEPENDS +=3D "qemu-native bison-native boost libpcre2 curl ncurses \
>> +DEPENDS +=3D "mariadb-native bison-native boost libpcre2 curl ncurses=
 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 zlib libaio libedit libevent libxml2 gnutls fmt lzo"
>> =C2=A0 =C2=A0 PROVIDES +=3D "mysql5 libmysqlclient"
>>
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99188): https://lists.openembedded.org/g/openembedd=
ed-devel/message/99188
> Mute This Topic: https://lists.openembedded.org/mt/94378750/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


