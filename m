Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DF1C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 01:33:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.62469.1679535222769051559
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 18:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=jzAu67NV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24469da2f1=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N1RdKL005539
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 18:33:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=/gqy2C4EhN9CA/LlNJEMZ2XoWHU9ZMxCms2kSbMSeMM=;
 b=jzAu67NV+qM+7rStdvFFSvOjvnMvDSm2O8WrsnTfZyOrBY+kUtGNb+uBhgSMXKlYQTEQ
 x0XTQPgAOlJtDY29CeM6tP90h+bLnY1kNmKc6bilsIX32lFd8XI7iG2V+Gm6mqW/lVHk
 FQfq0c62bk4kYvRUkc0lVqjio56r691PRepygTvKe1kjI4k9g/n/WW2KKsWs1JAs2yPH
 qnDPTGgBGW6vSRPgI8TnsJaIxamK2g0lIQqmUGtuMkGb+hk4THl+X4HIevHWhB5/hUv8
 f/1wLdl5mvPSA/9okb0xvR406dw3wj3NWqjlMqcm62iCQoiT9kvXsF9yfz1AbkZqCOti +A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsb96rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 18:33:42 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32N1XfnH017523
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 18:33:41 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsb96rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 18:33:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDyDGIRAfgi/zCKasLIsfC35H5yjEw/8xWkIS9gassIgVI947q6+riRVIaPLcfRtnzB6NJVhL/7E8U8X31onzUMtQEeTibkBfJimhS1YmNzQfEDx78kL8IcHvFXLH33LTDwZq7HVz2MWm7+iuZ7amujH4ooeqbWhh29ru7czcAxYBXvzltM/hZhq3Yxn0JlNH8aWPIQIG5dO0AlwMvYIdtEwMoWeozgKYdeMzJE0NuqMJp0CZzFnYv9nWZOPTJhkbChfXF2ATYcTkO4RAFbeUzvyfASFx3Et60WoiBi2tdxM+EWRyUllhIpVOtgWXiQXLKZJ+bDAo09EMiLPIQO35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gqy2C4EhN9CA/LlNJEMZ2XoWHU9ZMxCms2kSbMSeMM=;
 b=A8NBrJkZNxxAUjpv3BWiCeUAPT9pYhLuJeDo+VgnKtvUZwKmpW6FixgaJkQsfuvEKnFjSMEFZ/XEuLg5j0pyMIxZeHhsfMFMvEWVir/ecakVPDAwHgXkP5ZDVPnl+PLborLbplkGHBIKUt8+CXxVa1/Lj1p0/UEK9i/b8L/gJiXuQ0NBvEiH6dxSwHZ5wMhTCkFIdViTdGazMjS4aNXqCrkk8/ostv/Ma3kmNw8zj4NnjSQRZDnZeAvukVEVghPW1SfajeP69Zx5Vmt9+USzXks/LuZrc0y82FMZuxGUHo85YiEwlz02B0uiWHE+AmW3b2zlf07DgmVqA1qBpu/oow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 01:33:38 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545%7]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 01:33:38 +0000
Message-ID: <17ccc23e-537d-ffa6-562a-021633894a08@windriver.com>
Date: Thu, 23 Mar 2023 09:33:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [kirkstone][meta-oe][PATCH] redis: upgrade 7.0.9 -> 7.0.10
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20230322082921.2464069-1-changqing.li@windriver.com>
 <ad2ad401-b01c-ad73-7a93-a699af8a9fd3@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <ad2ad401-b01c-ad73-7a93-a699af8a9fd3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8988f9ed-4286-49c5-f7b6-08db2b3ea02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WOfn07ai+qiOFZAcJHhpj4WIT9OsTYvHerKR99/sIFuFgNG4VUHUtqVaZ2F0gfo+dXa7RPMpc95uaUsEZOVvu+dlW6576hLai+NwgZr03wQ3tPpdXIkWIP+IN5IzYN92AwFvCsSKUrATpMVjEfpa6UxjX4rK4LEHWM5Cr5/rk8p+aXVgsYbts7SOLaTJqL+Awjb/MtcIhPpqlJZ5ZnFILaeEcT7hi6LWMI52PB5xVk6880hilv5cSqJZBssKStn9OwbtH5VscEQnRxyZ4dspE02RQNKpFX5f22HPA8bo0PnAdZ1CHItgfujbX+cVSgpAiMEB95pxTXl8Qs3clYgqTBCPtWhrZ1aA9R/0YIs2NGIYjIACxzCRb49DYb9nS97alJrGnGl8OLDThat438nj33CzT42WAsRG+7tAmLx1WsZqc89P8EhfelE6qIMYCeiNsCtWY/xmX9sT6ajs7J2BPUOXB9v832UvXnqsaarfUw2xf+UbM3C0fTPR6OhGsnJfL/Gp4T57Z4fhJ/Kv25bVhbSk6UKmHnyJ83i8Gdg7XsjAFJ2ADCOE+1qMu15Pil+FeVJXJF3wfYz7RxAzfpNO2eIAlJwYdApLTLuU/Tf3DT88o/OKBFJdxcZGXwLlc5GsHwA1VvJKcXxGR+KKmvQ/A8sR0DLEtSh4nYG3+lHHRBOrWgZEdJLqTFUiBwFpJ3+ajoNZkdYoOEIjPxdgo7/C/3OzCPmIIwoY9k6hlp2ir4mtB76EEZTCHPEhn7P80AXl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(36756003)(44832011)(8936002)(2616005)(5660300002)(83380400001)(2906002)(18074004)(6486002)(966005)(38100700002)(478600001)(110136005)(316002)(86362001)(31696002)(31686004)(41300700001)(66899018)(6512007)(53546011)(6506007)(26005)(8676002)(66556008)(66476007)(66946007)(6666004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZTNxVUNyVi9OTlU3WTh5bDZmbFdlWUZxZkFLbll4SWYyeFc1QzF2bW9ZQ1lG?=
 =?utf-8?B?NUZZbW9ldGgvRXNyZ0pFUDBIQjFFQks3WCtZeTVYdFJxdC9lTFkvd1B3TzAv?=
 =?utf-8?B?b3dhNEt1b25wUmdtckR4aHNLdEN1aElpZm9DNUtFb1ZySzZWeFlPOEVPOU1Q?=
 =?utf-8?B?bVhTOWUxdk5Famt3SzRNVlNTbHZTanRqUVB1S3VCVWx0b0pMekU4TUF5dzFh?=
 =?utf-8?B?Q0tFYWtINjVPRXdqbTFyeWQrMi9lblkvcStVWGQvRVg3SVdGZWFsYjNFdkIy?=
 =?utf-8?B?clRvcXJDbXM0Lzd0S3hMNjBJbWNUa0RjZWhSeHYwek1saDkraWVYcjNndXcw?=
 =?utf-8?B?VC9XblB5QzAwZHZpVHYrN01XVk9JNTFkbmowb05oTkFPZUJiVVhzaGFGSUVN?=
 =?utf-8?B?b0phN2dlaW93WFEzSnROa0lxMFFqT05yQ2hBZWI2TXlCMElYeWdHYkJrbGJE?=
 =?utf-8?B?Zk5WNS80SEw2UHFQWGJTd3oyc2ZaVVVPN2NRTUlSZFluVGZFOXZrVlJURnY1?=
 =?utf-8?B?VE9HVXNkQ0xieXJlWHMycFQxVDlaWDRnNEZud2pGMXRra0xpbFdGSmpqRlVC?=
 =?utf-8?B?K1dIb09ORGdqWmpCbGJYZkpjZjJEaUVLanZpM1hLRnJJWlpiMStrZ05NRjVU?=
 =?utf-8?B?VDV3UVlEZjc5ZTZYTzdudFozQUhhdndxemxvRGRKamtnbXNXV2RtU2JMV1F4?=
 =?utf-8?B?K20wbC9CanhnZ0syekNINXl0Y01xVExvZklhUURXcWdUYVpRaXJNbVBmTE40?=
 =?utf-8?B?czdOK3JZeDluZEZLS2JyL0F3Mm9KVUNBeFJUbHMwUDk5cjluUENOZnB0OGp5?=
 =?utf-8?B?RHZXSWxNRnFMZWhmeFFBcjRaNGszcDdXOG9JOWRRMUZ2UEJlaFdMUkt2bTVx?=
 =?utf-8?B?YVB6ZmdtRTBtNUc5WmJJTnd4VGNwTklNYlNoYjFPUmpKWFZNWk1lNUV6M0V3?=
 =?utf-8?B?cU9aOTB6MnM4VUs4bkkzVnBKaUNWY1c2VVhNSXpnMEd1WHVHK202Z0FLY3RM?=
 =?utf-8?B?NHZuQzRwaHc3eFcrOVdTbnZGYXRJdVA2YjZDTWtaS1ZxdjhrVmcvYUZnNUU0?=
 =?utf-8?B?dGluWW5yUDhzSDg2OUlnWjJvSE00YWd1cUxYM1c3UmNIYUlIUDU5OTdVTUlr?=
 =?utf-8?B?azA3T2dYM0YvUWowQU80NmFuUng5Tkt5MmUrVXYzS2xaMDVqb0t5T3YrRWtP?=
 =?utf-8?B?bDF6eWk4MFpheWRSZDMvZlJ2Nm5KU3RQS2hkTGZOWE9SdTNyT2d2NFVlOEFE?=
 =?utf-8?B?cGpWdEMzc09YbHh1Mm1paXRzbXNtZmE3Q3dQQXZVdk8rSnlpV3R0K2U2VWs4?=
 =?utf-8?B?blF0T1RObG1uT1RHMXN1ZVZlWU5aQXRGS0xwbnI0N3JNT09vRytPOUFzVE5I?=
 =?utf-8?B?VUxlSEMrQ2JLWGE1NWJKaGxITk9LZ0tMTXUyUDhSTnJ2SGlkTzYrajE4L3oz?=
 =?utf-8?B?SGhDMmkyOVhpTUFpQldrbzErczMraXRBdHpWMzFhVnAydjVmZlF6K1pMd2Fk?=
 =?utf-8?B?ZmRZandGWk5rcjZzVDFIdUlZelVsNERSMERsRTVZWjhTa0RPMWJIdkxHTmVD?=
 =?utf-8?B?QUkyRVg1L2djaGdlT2FWcGRBRC90NzlXVTZQaTFOSzFIWHNIRDA5bHZSRGps?=
 =?utf-8?B?OGJlRHI0NEE3THg3ZUZ2bTNsRXQwOGs0NW03MUVlQytBUGlBYUVxeGx5SGRN?=
 =?utf-8?B?c3MxZjZDbzErN3htMzNTTGNncTA4Z1M0L1NRYVNMQnk2eEcrbjJvNytNV1Np?=
 =?utf-8?B?NkJURjB4bGRSeVZTOFNYTVJOQmY1Wk9SRmowdVFwL0N0STB0ekQvNnZ3Nk9B?=
 =?utf-8?B?VUtwamZFUUhOTWVJdW1Dc2svQVFrM0phclNnV3pERG8wMVFRZmEyTHdrSjhN?=
 =?utf-8?B?QmFKSHBPUEZHdHd1SkgxT1JLK09zam8yRFVVeTFvbUlTUWpYSG5wVDZUZ0FC?=
 =?utf-8?B?TkFNMVJQU0s2QmpxYk1KTWh0OUlXTThORzJhc0ZlbmJrV3FTb3hiSEdwUjZt?=
 =?utf-8?B?Tld0YW82UUlCSmp2b1JwZHN3MGZqRjBvRGFpU0JyYlpJd3BXMFErcHFrTGhK?=
 =?utf-8?B?eFBLUFlnSGd1d0RWR3Q3eFpwUlB5Z3BzVFVjWHM4NGNYT1pwVGVMaVJxeU15?=
 =?utf-8?B?S2J0UGFJL0NhdEFEYkFqUkpSQnB0ZmIxSWM5MTdSR0RTRUYwMlNIZ09QbEJp?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8988f9ed-4286-49c5-f7b6-08db2b3ea02f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 01:33:38.1959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPX3VkZKHZQyaAZ6Q9SsMM6ewrg3tYpLy6Fye4cTCGH+tcJqCS2nULfGsfAlaFgpw92pfVZEkI+NgZEJZe8yE3DSsmk6r6Ob+EPShGrQoYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
X-Proofpoint-ORIG-GUID: zvyL-E8EEGErMtsYSyypDFpLX2t6KcAJ
X-Proofpoint-GUID: h33gwpBXYLfZnF-vNVVGlU5zTjifKNWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=754 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303230009
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32N1RdKL005539
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 01:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101640


On 3/22/23 19:23, akuster808 wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> On 3/22/23 4:29 AM, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Upgrade urgency: SECURITY, contains fixes to security issues.
>>
>> Security Fixes:
>>
>> (CVE-2023-28425) Specially crafted MSETNX command can lead to=20
>> assertion and denial-of-service
>
> Was this sent to master?

Yes,=C2=A0 It is another patch, because=C2=A0 the context of the changed =
line is a=20
little different.

Regards

Changqing

>>
>> Bug Fixes
>> Large blocks of replica client output buffer may lead to PSYNC loops=20
>> and unnecessary memory usage (#11666)
>> Fix CLIENT REPLY OFF|SKIP to not silence push notifications (#11875)
>> Trim excessive memory usage in stream nodes when exceeding=20
>> stream-node-max-bytes (#11885)
>> Fix module RM_Call commands failing with OOM when maxmemory is=20
>> changed to zero (#11319)
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>> =C2=A0 .../recipes-extended/redis/{redis_7.0.9.bb =3D> redis_7.0.10.bb=
}=C2=A0 | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>> =C2=A0 rename meta-oe/recipes-extended/redis/{redis_7.0.9.bb =3D>=20
>> redis_7.0.10.bb} (96%)
>>
>> diff --git a/meta-oe/recipes-extended/redis/redis_7.0.9.bb=20
>> b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
>> similarity index 96%
>> rename from meta-oe/recipes-extended/redis/redis_7.0.9.bb
>> rename to meta-oe/recipes-extended/redis/redis_7.0.10.bb
>> index e4b2d45a4..5f972033f 100644
>> --- a/meta-oe/recipes-extended/redis/redis_7.0.9.bb
>> +++ b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
>> @@ -19,7 +19,7 @@ SRC_URI =3D=20
>> "http://download.redis.io/releases/${BP}.tar.gz \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://GNU_SOURCE.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://0006-Define-correct-gregs-for-RISCV32.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> -SRC_URI[sha256sum] =3D=20
>> "f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a84c6f32a3cfb9f65"
>> +SRC_URI[sha256sum] =3D=20
>> "1dee4c6487341cae7bd6432ff7590906522215a061fdef87c7d040a0cb600131"
>>
>> =C2=A0 inherit autotools-brokensep update-rc.d systemd useradd
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101631):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/101631
>> Mute This Topic: https://lists.openembedded.org/mt/97773847/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

