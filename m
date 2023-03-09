Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA8BC678D5
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 01:28:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3123.1678325297213675438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 17:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=QqFG8v59;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2432b735dc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32917lMl014184
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Mar 2023 17:28:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=EAmtBwoX5XXF/u8cixoHUR+CKkC6ZiwpP9OsEOH4RsY=;
 b=QqFG8v59erGjobwHWiU6TIF7BuTM+W9Fap9NEV/jC6kFdArVh4uCmqxib9eXXcr2OUNN
 sPR1SYgmXqr/MpZdlnfEZmB3gQh7zd5sxCXlUS1llmJ+2YKcrhlPEIwB5vTfcl7ySOeS
 TrgBgsBcPvDbSJ4sFQ+U2iL750ydPzZYWkRsHGNGYvD1tl0VPkZaEBgUuVQDk57Jkjj/
 KGmoTcpdn6MyoZu4R4hYTlqyiOkwU3Bpd3YlYJyqVmMle6wnqrYddjEy4t7pxReucmue
 ER29yxyIPWkWBzl4RwD5Eo4EUau92CFO45/pxrO3uUxMpEfbY8RLgCb9k+wJsfDCpjUb Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd14nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 17:28:16 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3291SG79021583
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Mar 2023 17:28:16 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd14nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 17:28:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biepZ9oI1gP3x63s8muuXCrcagqZ7ISL3mHlXSeMOZLJAojV57CehBUUJSUlphgop32j+2v5G8GvQI2YYT/GtzFF6Lcu+khuPG/CdSsJlAX8CVjCCRvpt9KiCHeNTPs/m6SUlgegUt64yjDjnyNBuG0XHnqv+doG3hZFdci+sQCeNkmrztFMgeSQuxu+LglkX75Su0+oWigVQMZBJTin3hSN7JmRruEgxN6EuPtfyvg+oZaAeO39yZOcD4/LTvkA+Aw3GjzKLWg3ccEkXmusxstkYIGDt3IS3gA7MAwc9SYzi1gMGc6f3PzIjoKUH/O9YduX3JGgLmjDNviIio7bBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAmtBwoX5XXF/u8cixoHUR+CKkC6ZiwpP9OsEOH4RsY=;
 b=ir+ED/2TSKUU6PTvykl4Qii7LNqzjNZs5Ph0cDduoGPOFhXbaSn5BwQ53irQa14GcJupa86oLbPSQEY6ZZJaCr3Rjp8qZI6VKU2wiILKJmYo1TJ0IE4YCu9jjB46liChUhxZs/EtjmISoxFRdUcqE4jjFlsWiTCn9Vwx2ZHYlureqtk78u8pKNY14f9Wqnqf3/MS+qkYC6WRdpjpVHCQcLM8hI3V48osm7316GZPaqXznX9ltkZFtPvBrf1ighNXgBK6TaojU7FInT5sBx4WkJR4QVl25YF8cRSuIgVAeYvJcXRqDdwg+CUUQswsC5bGPwBL3TYpUgZZycNbTz1uJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB6760.namprd11.prod.outlook.com (2603:10b6:806:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 01:28:12 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%4]) with mapi id 15.20.6178.016; Thu, 9 Mar 2023
 01:28:12 +0000
Content-Type: multipart/alternative;
 boundary="------------0VDOzivhg7IAhyiKNaL3xM9W"
Message-ID: <412cc346-8a94-e74f-65ea-8812a5442523@windriver.com>
Date: Thu, 9 Mar 2023 09:28:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-rich: add recipe
To: Tim Orling <ticotimo@gmail.com>, Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230308135705.796596-1-yi.zhao@windriver.com>
 <CANx9H-Az_jD58M4ntQO8DGXfYq3qQJJtNX9g2TawQenAHmeSbg@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANx9H-Az_jD58M4ntQO8DGXfYq3qQJJtNX9g2TawQenAHmeSbg@mail.gmail.com>
X-ClientProxiedBy: BY3PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 840a0a0d-4d95-4479-4efd-08db203d8c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uwU1jSeebpgTky0uS5jjl5Rp9MvYmX8Hvbuj0w0g6ZTayzwSFGvHTnSc9BBqPnA+8h0DdOiVGfEgCoW6pi2Q7ZEl6ZEteaN7mTMpgrON21TwSHjE0Avm16GIxTxHOLp5+mMov854YBCKY+g6VGGNP44HeNU+jsAZ4/MiluQTFmPd2YcFOTdW9/VVGkQPeMX95SVKg5dBTxSbvnvuMifQPG9sm5i/QaLbuTdeLx88d4zBnMtFY7bJYbQT/PF26MsGW1z862aZT/1ZCwOONKhi2hvAUrKdZaYCfnyb+WUiKwEefDgMywGyWSk0On3+XsNWdAJgEnnWtrK6rQ7gyHHBzMSmnNkVpgxfrN0et/uUPyoIJIfDbESOFqtY/e8b9nlRf574ApshdDuDFOn5d7SjG+neciH0Rmy9XbUuc6xASfSAHZj5cU29UhYOc5eGKYZ5mu5oXynDtrfFoCjbHUgoA6QR+ze0HdCic35uIfI9uwszuDDagzVqh73k51GzfQHz4E7JtxJcIEXevPZAk6odxj8XVIEdXgWTAs7g3d3MEeZliy7HYah5NBmjPnA4cojkX+l50Sd19WcUha17UHJY2d5A/3LlaqZM+Y2ugrXTRmL7i5OpyTC5ba62nHOM47e0YUaTvDvY9X5ZRTXX5qVHZQ85OGaeIvo4DeDZHLBqR6XHlEtHJsJ2I3y5PASw1evUmDwcHhwG1HZo5lShBp5vK4kJwxGBDa07siPrZH48d5Rk+pdbIf/ldQ1tEGxp08M7gbKt2DHYNn6PR39JLLHrpA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(396003)(376002)(136003)(346002)(366004)(451199018)(44832011)(31686004)(4326008)(5660300002)(8936002)(66476007)(8676002)(478600001)(41300700001)(2906002)(66556008)(66899018)(110136005)(316002)(66946007)(36756003)(6666004)(26005)(33964004)(6486002)(966005)(53546011)(6512007)(6506007)(2616005)(166002)(31696002)(86362001)(83380400001)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MXpWVkkvV1VGaVFkc3FsbXBTWmtFM3VZUmJZNnFOdHdWdHpQMlcwVWNYczdj?=
 =?utf-8?B?ajdzQVMxdDB6Qzc0aXRpT3A4ajBJTEZKSnNubkEzTWpJR09FNzV5eFdOUE5T?=
 =?utf-8?B?TzRUL21tbExtVkloSkhjcTVUcU5xT0tsc1NmczZCQitYVzJ4Q2NoY04xNXRM?=
 =?utf-8?B?STNYQzlocWR3U1hGbG9YUXlIekFQOHIxTklRTFdySVRCaDB1TEl5aERraEh5?=
 =?utf-8?B?TXdDZGMwbktxSUgxSEU5RFE0eS9kUGxYRnVGN3NZZWxqWGwzVnVYM3hzTWhY?=
 =?utf-8?B?eWViSks0OW9rZDNpS0hNVDZhYyswME9pWE5POC9KQlBhTVFkWnFTSDVFaWw2?=
 =?utf-8?B?N3pVcll2QmI5TjlnVHIyYmhENWhDY3o0bis3bFJZSUFjNnBCMm4wSEI0dEFI?=
 =?utf-8?B?MGdld3hEQTdsR2RiQ0tmcWl6TUdEYUpidW1lbkNrWjRidFhIUm55Qit5T25T?=
 =?utf-8?B?ZGpkeTEzL0hrNStEeFBtU1BIM3dJdjRhZFNmRlJkbFRWd21tejdjMzRTMHcy?=
 =?utf-8?B?L09IYXBwOTlxOWxKdFhZNU5GSnF1UXUwZEppOW1QYzNKSGt4Z25rSGtXdFB6?=
 =?utf-8?B?YllXZGJaR01nYWxIdkhpZmhvSHJxOXRZOXIwTittY1dlbDY1VnlvRDIwNHFM?=
 =?utf-8?B?azJXamsrU2ZhWFVVeVpPSnl2U2JJalZQeU5xRUpCSmJNUnA1VUQrbFhkVGhs?=
 =?utf-8?B?SmRTN256dFdRWEwvcjVhSWtxSE1TYXNLcG9vTWZOKyt3WTM5bERxOHVVNWRN?=
 =?utf-8?B?U1hBS0FzNWRzbTFBTXNuNnRqL0xEdEpHSUxOQ0VvU3VzZEZXS2N1a2xMK0Qx?=
 =?utf-8?B?d1hjeUhPenhiemg1S1c3MzZ5Z2hNTnBqU0FxNGl2NjRhS29scFUzUk5HSGps?=
 =?utf-8?B?VFdRQlorcDFST0Y2WGZaaitVR0J6WnR5VjNodmZJTWJFbmhselE4TmtqYllN?=
 =?utf-8?B?VGExaDVMdHZOYVIrOXdPZjNCQ0duRTRUd2hLUVJMVVF3K2lsZ0ZMdzhJT3Zt?=
 =?utf-8?B?c2gzOGpWcTd2L0tXSWJlLzVtdjNwenN6T0dqaGFwMmRFd2tBTDBVU0dzM1JS?=
 =?utf-8?B?RXZGMzJiVkp2aXhIZlBTRXBSR1ZoV0hUaS9JV2pLQ3BBR0VTWU9WNTZDQ0tD?=
 =?utf-8?B?NEw4V2FxZlRZUDFkMjY3VHQ5OThiMnVxVm1nL2dqZTdmN3hYSE1tV1VYOHNy?=
 =?utf-8?B?R2xIS3VjVnhyNXBOYXhEanhqNWtFakVDNTllN1lnMUVsUE8yKzg0S0d5dG5L?=
 =?utf-8?B?TjZ3a2JXQ2JiM0pvSUQxZHJpeHBQU3ovcnAxeDVUK1pxS3BTeW5PRFYyTjNo?=
 =?utf-8?B?ZzJXWHZsTTV5UTRVT2V4empwTzJubHJNYXBJbm5SczRmQ29xaENkWS9Wdjlh?=
 =?utf-8?B?VmZ1ZCtmNmtEZVJmTG5nN01ZNXVFQlh4VGtSa3VMaXN5U0lVV0lPSHFlN3VB?=
 =?utf-8?B?QTJrZkNTVlpsRHlVZjNMTWtrU1V3bE9hTFNDTzl3cnJGaGRzaXlOSEFOWGpu?=
 =?utf-8?B?UTZZVWt2L1cvbkFlcE5lUklQNW1DdVV4WGx6N2lUbVdhYkJkT0QxdEdWNlkx?=
 =?utf-8?B?Nm9SWTJHK2JzZVd4TmF6VWwrZmM4NEFUcm9JNW9tMTVSM1VqckN4NUR1SytF?=
 =?utf-8?B?cDRyWDUxTjExcjlBVFhvSDJ1Q2NpZ25Kb01GZUFNQ3E3Q3NML2hLeWRobDRh?=
 =?utf-8?B?N3orYWZwSzhNR2x1a1RXY0Z4T3BOQXIrbW13R2V6bmI4aVJOWG9hZlRCZ3Vi?=
 =?utf-8?B?a3NSQUdVVnVvQXFRZWJnL1pRc0grUHlJKzZ5L1hNZ0g2eVhHcmo1azBvd3h4?=
 =?utf-8?B?ZU5aMy8xQmtNYm5VOVdQbWcyc2dZbmYxbU5KLzBuV2tBNGZzeFZVM1gyWkhq?=
 =?utf-8?B?ZkNQMHBPeVNLbFlSSi8rWWo5Q3IzdnJleGhMOW9xOGQrbitXZllPNVA1L0gr?=
 =?utf-8?B?V3ZlREFFejVMaU1JeStwRzZIRy92bGtGenVoRmt1cEhkREMwUStyazE4OTRy?=
 =?utf-8?B?MEQrQ3haaE1WNXpWdW5rUGw0UFZYL01rVlh2dWRiTlRKcmVXRzE3SC9IRHJh?=
 =?utf-8?B?Nnh3SC8yZjVDaHRxUjlpQnl5a1ZiN2RTWEI1T2R1c1BUZnM2N25DeGZEeUZD?=
 =?utf-8?B?cTZCazMwUU92RWZWaFhsTmdUMGpWYzlSOW5UbGJJbWhxaFpvdkcrbk1VWG1M?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840a0a0d-4d95-4479-4efd-08db203d8c2b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 01:28:12.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHbhgR+PsA3YyeRTguI3sX8x2sn2KHdjc37sb9mZIeelbMr8Oy5g2H/2lRwBgZjDDjFvfl6Ykd0g51ncEgc6cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6760
X-Proofpoint-GUID: 6sjKU16VAeqRaR14myWpjSzhwfep_KeK
X-Proofpoint-ORIG-GUID: sZN-qex1ZNBEgrBw5IkIesx0AIvyPWKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 01:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101428

--------------0VDOzivhg7IAhyiKNaL3xM9W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32917lMl014184


On 3/9/23 02:59, Tim Orling wrote:
>
>
> On Wed, Mar 8, 2023 at 5:57=E2=80=AFAM Yi Zhao <yi.zhao@eng.windriver.c=
om> wrote:
>
>     Rich is a Python library for rich text and beautiful formatting in =
the
>     terminal.
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>     ---
>     =C2=A0.../python-rich/python3-rich_13.3.2.bb
>     <https://urldefense.com/v3/__http://python3-rich_13.3.2.bb__;!!Ajve=
Ydw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkU=
ZAH5uYUSsZ23l6Lx_0-Ew$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++++++++
>     =C2=A01 file changed, 13 insertions(+)
>     =C2=A0create mode 100644
>     meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
>     <https://urldefense.com/v3/__http://python3-rich_13.3.2.bb__;!!Ajve=
Ydw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkU=
ZAH5uYUSsZ23l6Lx_0-Ew$>
>
>     diff --git
>     a/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
>     <https://urldefense.com/v3/__http://python3-rich_13.3.2.bb__;!!Ajve=
Ydw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkU=
ZAH5uYUSsZ23l6Lx_0-Ew$>
>     b/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
>     <https://urldefense.com/v3/__http://python3-rich_13.3.2.bb__;!!Ajve=
Ydw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkU=
ZAH5uYUSsZ23l6Lx_0-Ew$>
>     new file mode 100644
>     index 000000000..b3a458ab8
>     --- /dev/null
>     +++
>     b/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
>     <https://urldefense.com/v3/__http://python3-rich_13.3.2.bb__;!!Ajve=
Ydw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkU=
ZAH5uYUSsZ23l6Lx_0-Ew$>
>     @@ -0,0 +1,13 @@
>     +SUMMARY =3D "Rich is a Python library for rich text and beautiful
>     formatting in the terminal"
>     +DESCRIPTION =3D "The Rich API makes it easy to add color and style
>     to terminal output. \
>     +Rich can also render pretty tables, progress bars, markdown,
>     syntax highlighted source code, \
>     +tracebacks, and more."
>     +HOMEPAGE=3D"https://github.com/Textualize/rich
>     <https://urldefense.com/v3/__https://github.com/Textualize/rich__;!=
!AjveYdw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Eh=
x9rkUZAH5uYUSsZ23l5H96Hp3w$>"
>     +SECTION =3D "devel/python"
>     +LICENSE =3D "MIT"
>     +
>     +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3Db5f0b94fbc94f5ad9ae4efcf8a778303"
>     +
>     +SRC_URI[sha256sum] =3D
>     "91954fe80cfb7985727a467ca98a7618e5dd15178cc2da10f553b36a93859001"
>     +
>     +inherit pypi setuptools3
>
>
> This should instead inherit python_poetry_core, since it has a proper=20
> pyproject.toml
> https://github.com/Textualize/rich/blob/master/pyproject.toml#L49=20
> <https://urldefense.com/v3/__https://github.com/Textualize/rich/blob/ma=
ster/pyproject.toml*L49__;Iw!!AjveYdw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2=
-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l6vd0-Waw$>
>
> Also, please double check whether it needs any RDEPENDS.


Thanks. I will check this.


//Yi


>     --=20
>     2.25.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#101424):
>     https://lists.openembedded.org/g/openembedded-devel/message/101424
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/101424__;!!AjveYdw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRt=
cd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l7zyq4Lnw$>
>     Mute This Topic: https://lists.openembedded.org/mt/97472578/924729
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9747=
2578/924729__;!!AjveYdw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKs=
idmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l5puEaR1Q$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YB=
s-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l7UVm9-9A$>
>     [ticotimo@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------0VDOzivhg7IAhyiKNaL3xM9W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32917lMl014184

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/9/23 02:59, Tim Orling wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANx9H-Az_jD58M4ntQO8DGXfYq3qQJ=
JtNX9g2TawQenAHmeSbg@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 8, 2023 at
            5:57=E2=80=AFAM Yi Zhao &lt;<a href=3D"mailto:yi.zhao@eng.win=
driver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">yi.z=
hao@eng.windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Rich is a Python library
            for rich text and beautiful formatting in the<br>
            terminal.<br>
            <br>
            Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windrive=
r.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">yi.zhao@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;.../python-rich/<a href=3D"https://urldefense.com/v3/__=
http://python3-rich_13.3.2.bb__;!!AjveYdw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hR=
tcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l6Lx_0-Ew$" rel=3D"nore=
ferrer" target=3D"_blank" moz-do-not-send=3D"true">python3-rich_13.3.2.bb=
</a>&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 13 +++++++++++++<=
br>
            &nbsp;1 file changed, 13 insertions(+)<br>
            &nbsp;create mode 100644
            meta-python/recipes-extended/python-rich/<a href=3D"https://u=
rldefense.com/v3/__http://python3-rich_13.3.2.bb__;!!AjveYdw8EvQ!e8_Wo5LG=
5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l6Lx=
_0-Ew$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">pyt=
hon3-rich_13.3.2.bb</a><br>
            <br>
            diff --git a/meta-python/recipes-extended/python-rich/<a href=
=3D"https://urldefense.com/v3/__http://python3-rich_13.3.2.bb__;!!AjveYdw=
8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH=
5uYUSsZ23l6Lx_0-Ew$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">python3-rich_13.3.2.bb</a>
            b/meta-python/recipes-extended/python-rich/<a href=3D"https:/=
/urldefense.com/v3/__http://python3-rich_13.3.2.bb__;!!AjveYdw8EvQ!e8_Wo5=
LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l6=
Lx_0-Ew$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">p=
ython3-rich_13.3.2.bb</a><br>
            new file mode 100644<br>
            index 000000000..b3a458ab8<br>
            --- /dev/null<br>
            +++ b/meta-python/recipes-extended/python-rich/<a href=3D"htt=
ps://urldefense.com/v3/__http://python3-rich_13.3.2.bb__;!!AjveYdw8EvQ!e8=
_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ=
23l6Lx_0-Ew$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">python3-rich_13.3.2.bb</a><br>
            @@ -0,0 +1,13 @@<br>
            +SUMMARY =3D &quot;Rich is a Python library for rich text and
            beautiful formatting in the terminal&quot;<br>
            +DESCRIPTION =3D &quot;The Rich API makes it easy to add colo=
r and
            style to terminal output. \<br>
            +Rich can also render pretty tables, progress bars,
            markdown, syntax highlighted source code, \<br>
            +tracebacks, and more.&quot;<br>
            +HOMEPAGE=3D&quot;<a href=3D"https://urldefense.com/v3/__http=
s://github.com/Textualize/rich__;!!AjveYdw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4h=
Rtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l5H96Hp3w$" rel=3D"nor=
eferrer" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/Te=
xtualize/rich</a>&quot;<br>
            +SECTION =3D &quot;devel/python&quot;<br>
            +LICENSE =3D &quot;MIT&quot;<br>
            +<br>
            +LIC_FILES_CHKSUM =3D
            <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;md5=
=3Db5f0b94fbc94f5ad9ae4efcf8a778303">&quot;file://LICENSE;md5=3Db5f0b94fb=
c94f5ad9ae4efcf8a778303&quot;</a><br>
            +<br>
            +SRC_URI[sha256sum] =3D
            &quot;91954fe80cfb7985727a467ca98a7618e5dd15178cc2da10f553b36=
a93859001&quot;<br>
            +<br>
            +inherit pypi setuptools3<br>
          </blockquote>
          <div><br>
          </div>
          <div>This should instead inherit python_poetry_core, since it
            has a proper pyproject.toml</div>
          <div><a href=3D"https://urldefense.com/v3/__https://github.com/=
Textualize/rich/blob/master/pyproject.toml*L49__;Iw!!AjveYdw8EvQ!e8_Wo5LG=
5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l6vd=
0-Waw$" moz-do-not-send=3D"true">https://github.com/Textualize/rich/blob/=
master/pyproject.toml#L49</a></div>
          <div><br>
          </div>
          <div>Also, please double check whether it needs any RDEPENDS.</=
div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks. I will check this.</p>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANx9H-Az_jD58M4ntQO8DGXfYq3qQJ=
JtNX9g2TawQenAHmeSbg@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            -- <br>
            2.25.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#101424): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-devel/message/101424=
__;!!AjveYdw8EvQ!e8_Wo5LG5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0Hb=
K4Ehx9rkUZAH5uYUSsZ23l7zyq4Lnw$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-devel=
/message/101424</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/97472578/924729__;!!AjveYdw8EvQ!e8_Wo5LG5fpv=
w4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l5puEaR1=
Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https:/=
/lists.openembedded.org/mt/97472578/924729</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembed=
ded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!e8_Wo5LG=
5fpvw4ff3zhjHEbs4hRtcd2-e78YBs-lSshKsidmY4bIa0HbK4Ehx9rkUZAH5uYUSsZ23l7UV=
m9-9A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">ticotimo@gmail.com</=
a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------0VDOzivhg7IAhyiKNaL3xM9W--

