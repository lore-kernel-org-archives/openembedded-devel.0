Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955B3C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 09:22:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10034.1693387348928515694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 02:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Q2A30EkH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=760630e6d4=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37U9DOXf023143
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 09:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=sVOTSjmCZ2mjE5KzgiW4UQKUla8ozURcpUJ4MAxlUVU=; b=
	Q2A30EkHCscbwCKA66+Sa9pe3nB69jVP3Y0fruDSGx7qrMp2hOAPWaNPSFWF6Q10
	Y3xSfSeM/WBqTr7KmU4BjU+cN1vfRPnpoECxTdrVgnEyPgv4Zoh1TssjpBn6FITN
	2sFNCOVkHYNwcZrU/uakH6qjLkyidalWtGewIqVjH1CRBp4h1bTpbH2zx1CMfjSk
	6y2jO2pg5pAu22DGtIWdCfkzttD+iY/HbVJlrBFRCT0dSLpV9za57PbcugU+QY97
	GLU0IdyGt28IpCd6howhXSFnHaDkb7nLC0mDG/9AEpLnj3LR4WroWhecf6+w2adX
	PBpxrFjRbkXSgXg0u1sRZg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq6kwkk3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 09:22:27 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37U9MR3V007655;
	Wed, 30 Aug 2023 09:22:27 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq6kwkk3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 09:22:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMlhiosi8l6avoEnXEWFpPRssZwIQjzTRH7ETZmu/DH6esv6/qgLzezPbZfg0BWKxxUybU65sO2AA6LO4GtWT5T6x3ez58mZxdswRojBbrrHMCQAO37qW23628cqcPA3qyXOKcbZ2rIObTgDzZgQiTN/AawOtCPxpsjuTv6ACYpJCfLTCTila8OZitWbhMgn+7yPWR8mc8zQJxamxubQuOfE7mwDxvAoHSpmNdSuixDK3nGslO2GfB4xh/k0Fsy3v7YOnjuElgHs8QoBj4TuuRs4/UUOpKDRzn+pwY+I0N0FYFSmWIhek8X8ahhSB/XP/SZNF+kF0DvSImGahflB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVOTSjmCZ2mjE5KzgiW4UQKUla8ozURcpUJ4MAxlUVU=;
 b=V0vvlDsEDOouKnppygs5CPQru25C18/3t+a+HtYHjMwSPair9MI0JLpp5sgTrYGw4MQxxdWS9J+LDcc7rBE+zFSiA8e6+STL7K7HDvgidYs+WPXM+H3vyn/g8mvitoboAqVlj+hkAhT/3mZDyTIXuuqsxT+vbvYw4AT2T60X9BcqTAzZKhDwujUtK5vwriY4/FpA2hq/E83v2n1ioNnU5EADjLe27rVmxIWEb4sCeeRsksXO9qr3URn22K9x2U8xFAOrhdRyEZ75zSzqYs66kqo0QHzzqLufkKfli8l/KNYPgzIjZ4pUpGg63tt/15e0C8ZyzvSqqZEAFRR+M0q4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 09:22:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%7]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 09:22:24 +0000
Message-ID: <d903e5b3-4a07-5164-8b98-9c6e08a359bc@windriver.com>
Date: Wed, 30 Aug 2023 17:22:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe][meta-networking][kirkstone][PATCH] spice-protocol: fix
 populate_sdk error when spice is installed
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230828070502.2522488-1-Qi.Chen@windriver.com>
 <CAMKF1spxBeW0WNYK5U_-yCtoKB6OSa3VcAMHGRt3jzSjhAUZSA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CAMKF1spxBeW0WNYK5U_-yCtoKB6OSa3VcAMHGRt3jzSjhAUZSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a47df06-2cba-4333-a95a-08dba93a9ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nvC21RyacY816bt8U/oxExnSJbVMF8FafYOMne6vVyLXqdR34oh6xuggfozlt9a0ZNo1qoCKB3YnAYMJBSg1ontgkwI1Kyogt7q0cF4vc3QO0RPUtVjTnH046Xv/TowLu/E2JVlMxmPZkrwsZA/2gt6hoofj8xs9wZW4I/7PZ5o8Aw3Wg6FrHuJw3wvtwQVZ65HQd9Cl+6KWwiJDSZW81+IGxCDy+21banqAXZd2lbEc1pq6IBzt3tPqqX9cfOuGRZr5qy4sby0jWmo3AmSMZkAcm26AJrI/Hjao8epSd7X+WANOqNy8pmo0cjfe5HVSDbBhuRdvKGxZJ05D6nN8zwowCsYKP2aMtL4dCphE9gln7ldBTJv5Dz/YZXXMIT3KFd9bojfIDzDSHsNbM7khH2nQ93L84G+LYWi8792LpR6UeFp5tmudA/nKmmPP6WOqk0aMBoFw/VtxcXNhOLv0wSqobSd4kMuc3cu5351h8p8g6uqO01jusrwmXT577VxNWhCTczF9uS3CXnqUQ1xNaR2E6TEfCUvu3MFWS6pZmcA00b+AngE/1MJwRxZpWDBD1rX+5SUxyZJPwjCsluiFuYx9fLd1ImweyOtRnRf8oCitALT7GDWy1a21GwSrtJZlFXQE0YuxdjgZeafUa1RXJVPSazGSRpKtI9HEQMmaQaY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39850400004)(396003)(376002)(136003)(186009)(1800799009)(451199024)(31686004)(66899024)(6486002)(6512007)(6666004)(6506007)(4326008)(86362001)(36756003)(38100700002)(31696002)(2906002)(83380400001)(26005)(478600001)(53546011)(966005)(8676002)(41300700001)(66556008)(8936002)(5660300002)(66946007)(66476007)(6916009)(316002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXNXb3BvZjdzanNsNnRETHBLamd6WWhNVktpT0dydERRNjhOb1ZVcDBLc21q?=
 =?utf-8?B?bG9MSUpDNUJmS2hmRjUvaHp0T3pyb3k3RVFlOXZ2VjBxSnEvZ3dwL3hHcU1K?=
 =?utf-8?B?cFhQMVFlaWlOei82V2RobFJCZWMxbDNqckw3bUdYN21QUEZFTnFtZ2R3YVc3?=
 =?utf-8?B?dUZZWkxkNURNSTVwK3RHdS9ZMHMwODRUM0czS2JsL09aQ0xwRW9ZcUUyY3Jk?=
 =?utf-8?B?L01LdU9taXJYS1RZQ29ncXA5cEhMb3lQN0ZvUytJQm9yaFdvV0xDdURPNGRy?=
 =?utf-8?B?STF2Q0c4TmNLOU56QXJJQmxxS0wzRmcvT2MvamlwWEpFSFVORVZ4dGY0VjM2?=
 =?utf-8?B?Z0UwaWYvUWpGQVA5d2JmSk1BbzVLaytRUUcyRDA3aUFmZyszc1pST0FvdlRU?=
 =?utf-8?B?NmVEbW9Yc24rNWRHTUFCbk5hMTZueE93SjRaN2xaYU1zVmFuQnIzRmtPZUU2?=
 =?utf-8?B?UENuQXNLbWtWRlJmQ1FrME9oY3czQ0J0L0hFVnIvK2p4T05tZ0dqVkhMVnVX?=
 =?utf-8?B?dnl5RFVPbGExcXZPUU9qWHI5eWZUQ3FWMTk5OS9kUEZkR255ZFRJQ2lNOEFs?=
 =?utf-8?B?eUNVMWFENmZ4Zmovb2dkODBGL2FISTNWY3hiWE42VEYzNS9HRklldGFGT1Mx?=
 =?utf-8?B?ZmxtMXE5bGt2L3RUc3JIcFExbEt3TVAyWmx4YTNJUlJ5bDhnVE4zK2lzbXRF?=
 =?utf-8?B?Slk2Vkg5Um53bUMxTUNNd0ZyVVBMVFFtNEQ3V0d6dE1KeUNmMGc0SWpLYnZ3?=
 =?utf-8?B?T1ZpdGNYVXVGMUxJTDAxUXZVZjhITEhwM0d2YUFIZFI4WVVjM3hWRG9PMFZo?=
 =?utf-8?B?OTNFMytOYkE1ODM0RGsxK3Arb3I5bUUwR241QTIxOUtYT2JzeEtCWVQ4Mnlk?=
 =?utf-8?B?djR5cUY5NGI1UloxeEdUUmtzamV3REJ2S0hJMnBOWUVYL2JqYWNvT0owQkk5?=
 =?utf-8?B?R0krNnBkT1Z1clB5ZDlIZ0JKVllxcWM5bUEra0h2MHNPZGFNbDVFcTYrRWla?=
 =?utf-8?B?enFjU0wvRHNLN2hMZlZ5VWZjbDF0ZEg5UTF5SFlNaUtmTTBjWjZsVS9RS1pL?=
 =?utf-8?B?TUxoZk5DcGlWNFJ4eU1aYThNVlIzajlQUGhkZmh2TjNqVXkvbHBZOTllS3FP?=
 =?utf-8?B?MDBib2U3MGQ3cy8reDhDTkI2RWxVTXBPYk9FWSs0UW9YYzU5eTA1anQ2ZlRD?=
 =?utf-8?B?YXIvSDYwb2NWdWJDTHVOS2NIbnBaYVZHVVlDUURneWhhcHNyODl3bHdWU2Z2?=
 =?utf-8?B?QjNEdkxQUWxGOFFEZ1k1cnhSdElPampZTG5DdWNYbXdWRlkweVZUSGx6K3hE?=
 =?utf-8?B?akxCdTdCT3BOci96OW1kSXBjaGtxK0czZ3lpRVRDMHNKV1IydkZPK1BzZnYr?=
 =?utf-8?B?QjFUaVArUnIyaEVwMjJ3b1NOcjRhMmN5dXhJT0NKMEdJRWw5S0xmSyttbFJv?=
 =?utf-8?B?YUgvbkUrcHIxSzNuRU9MYm90amFWdjlMUEE2TjYxT0paRjhPTVd6VWgwODdl?=
 =?utf-8?B?RTBndTcrdlE1Y1A1V0Fld1ZvUGhqbnc5eTZuYVZTV2JiZWFheWcxcjZzbjJK?=
 =?utf-8?B?VFo2eVpDamd3bXJNalZGZEFaQjE3WGV2WTI2VDk4aURiTVZoa0hTV3loMHlX?=
 =?utf-8?B?ZUE1STVmbTBabTNJMWhYbUlERkJiMVJRZjF2WnBNT1VqLzdSVkIycVA1THhu?=
 =?utf-8?B?Q0treFF3bURVWTBLMTVoSDQvcURpS1FZK1IyTTYvM0ZKa0R4cjJDbkZYUVJ3?=
 =?utf-8?B?dlJFcHB5V1hKN1ppbjhZaXlicSt3K1ppUkZ3T3I1MVVjcU95bTh4MVFzZkhX?=
 =?utf-8?B?QllFeS9aSmFvRmNmdTRMNFRkTDN0YXJ1VVFwVWhFdHRIM2l6a2lRMU9DdlpL?=
 =?utf-8?B?bWpxeVl3RkpDTjVITTVxTndZU0QrQUJkTGdRWkdqSVJtVldsSkZpLzBUbnVO?=
 =?utf-8?B?OFZabUc4c2p1MEVNaGRyOE44UU4rdk9HY3V3RVBPWW9ZTTFJQmt0dG5xMjBa?=
 =?utf-8?B?NHpHSWUwZVhZOFJDWWllN25sYjdNU2lSSkhUdjFBdHRCQXY1QTRwYnc4RGky?=
 =?utf-8?B?VEVyeEI5Z1pWK1FpRjd3ZG4xV2hUb3dqcmxyRlNLUlJXWlhyTVlBaWlqZnJU?=
 =?utf-8?Q?9xXy/LKEAVKWJxjBOKZsALnI+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a47df06-2cba-4333-a95a-08dba93a9ed0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 09:22:24.2523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7D774YoIyap5BVPAO6yejfta0Ctyp7IF35DQk9oYZKT7T2SHhLKRyUeKa4KCZus2LP/h8c2mTkgcrGfEIHhiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
X-Proofpoint-GUID: 4IDA70TqctuC2_O5Eahw0O7r9Rr-L37A
X-Proofpoint-ORIG-GUID: V3ajJdvX-l5kLsVfqSYJXBGuCbbIWcUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=741 priorityscore=1501 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308300087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37U9DOXf023143
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 09:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104666

On 8/29/23 01:04, Khem Raj wrote:
> I think this applies to master too can you confirm.

I just saw this message, and I then found you've helped merged this patch.

Thanks.

Regards,

Qi

>
> On Mon, Aug 28, 2023 at 12:05=E2=80=AFAM Chen Qi via lists.openembedded=
.org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> spice depends on spice-protocol, when IMAGE_INSTALL contains spice,
>> do_populate_sdk fails with the following error:
>>
>>    Error:
>>    Problem: package libspice-server-dev-0.14.2+git0+7cbd70b931_4fc4c2d=
b36-r0.core2_64 requires spice-protocol-dev, but none of the providers ca=
n be installed
>>    - conflicting requests
>>    - nothing provides spice-protocol =3D 0.14.4-r0 needed by spice-pro=
tocol-dev-0.14.4-r0.core2_64
>>    (try to add '--skip-broken' to skip uninstallable packages)
>>
>> For spice-protocol, it's a development package and all things are in
>> the dev package, so set ALLOW_EMPTY to fix the above error.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb | 2 +=
+
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/spice/spice-protocol_0.14=
.4.bb b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
>> index 9ce019ed86..3c8458baac 100644
>> --- a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
>> +++ b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
>> @@ -16,4 +16,6 @@ S =3D "${WORKDIR}/git"
>>
>>   inherit meson pkgconfig
>>
>> +ALLOW_EMPTY:${PN} =3D "1"
>> +
>>   BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.40.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104631): https://lists.openembedded.org/g/openembe=
dded-devel/message/104631
>> Mute This Topic: https://lists.openembedded.org/mt/101005385/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


