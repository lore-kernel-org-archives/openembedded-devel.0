Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC0DC83F12
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 00:42:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7503.1693269752362113048
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Aug 2023 17:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=CiNaOjHv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7605aaace3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37SNU28P016620
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 00:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=FM23b9r3hcUl2vitTwjNhuRc/Bg0HqRm8V2AQOPHxAU=; b=
	CiNaOjHvXCrwuSjl1/QL9gFKfBN1hEsjnslm4C7uWEO+mczi0g0YLIp76TRJ/2cl
	tORgKJ3HGbO4pmTQ/1JcHwX+enKFBkgEgQ2EyjwcyrQi1c8BsnAELj086H3ygSzA
	9OAyCqyk0idX3Quod8i/GpLaTPt5S66/8XBtArymJlw5DvHX6neAKEPQ80kSxo/g
	ZlNh0w4RjtwPvkALzmNKtgEOHgYbZ7klPUdl7rgujZZnuq4oWYwh9VSfgKz3c9Tg
	br7r88WHY+6Zyu5z+Z/ZOyT7yyWMv8lBi4gkpkX43kU/GOVxaxMSQAW8NWMmosKx
	oUrERanexVvXjSdvTknV/Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c625u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 00:42:31 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37T0gUjD010747;
	Tue, 29 Aug 2023 00:42:30 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c625u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 00:42:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqQZXDKqOqsO8m+jNwwq4+7ZDrDQKQV+yrBqcB5rswH/Gax+LD8T+scC6dUgdj/oo3G7F4s13AIyLd/K8quLE3+Es74jU/qgp8Rs2paLZi8qUuy2Bq9RNOviLLrXDeAZ6B6z5shaVT/SDjomY+RxaiijhlRRbAaiO1qiGiG34S5xrw+5810KsnmQaIZNJZj6qVfa29LWcytbkloTxCVsE5BTbZ77mk8UmFSzU24CqIClQkWT0YBagGvm93GtM74hfHM7Vw7XrMC8qW0Igcq6HDvJ3YRB74DpamNUhF4aavO9xJ0U59vMQVr21Zwvx8TZJxs9G0KJBrKPlC6uCepWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM23b9r3hcUl2vitTwjNhuRc/Bg0HqRm8V2AQOPHxAU=;
 b=hbRjuvrijpkt/RwMdAyjpS/qXs+9e/nnxfaY1xakxfgaP57/Eu4BjuJ/1OivRyngcI8wFbmG8V4cHxPPClbuzjA/ylcDi8zg6ZBvNfqmLnSXkN6eTcWngfd5DwBlBvO4f84V34DoEAkuc7F3F/zevjOAP/Q7eh8Xli5fznYzEQi8x0Jy+Ay3pAYmfd+5gXl99wUNgl7zF/HdUKf8+Pkq0IRfQPmg5QpkB5NP7Nq9VtOXW85B31p1oDXK+bBNwi/mMT9FrF27xYRGeK55uN4XJsYoPUqp/SJ9L2a5pdia0MO3Zj0LCyXYSTwfG0okUmrWBPDM2PwGbcDHUquyfXYAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 00:42:26 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 00:42:25 +0000
Message-ID: <c25a7e78-f04f-8803-501f-b9be8e0cb77a@windriver.com>
Date: Tue, 29 Aug 2023 08:42:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-networking][PATCH][master][mickledore] frr: Security
 fix CVE-2023-3748
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230828104918.471061-1-yi.zhao@windriver.com>
 <CAMKF1sozTDfumsfEF0pOuJG5UTy4VVr38+iUo4eg2gmN6PAi-g@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMKF1sozTDfumsfEF0pOuJG5UTy4VVr38+iUo4eg2gmN6PAi-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH0PR11MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: d9eec443-093a-4d95-a30f-08dba828d0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	77UTQ0trm4Fpfm3T+GHQ/1N3f9BcSdkksXzi3dq72bWh6zkH0RNQ5SdfrogNUGIOFpQBFgk5OcdgHAmiYUdPxQtO+G3idgXwDgW49hKMQ8M1j/wDY9SOo/nhy4wQSISMBLHM0figuvMArnCDbPSXSeCvndXMZ0/0wsUHNwcBWI9gurA122WgUWC1yjognWHDootEDrQjIzl41SRehMEPMofl0bDrzzf7mGtFJlvCHWx/Dic+9UKhO5fqiEs2TbbOmb3Vd3dh8mz34Qzp5W+CQIRclg0F3hfBWI10CQlbVUPXzDrf/+2BadEPRVm8F+Hy4Wr8o7242MFxRuedGUcXENFVbSo/j1tbHwL11llpn7Y5dineuVCdR0W9Ng42RtFrzCLuFAcx+fsXtYYnLxPUpbDZpA3UOQ2vj+u0mfpQ9vu/Z+6xqQWZeBccGXCRmlrICz9JOykFf+YPyE29G8V00aHTJ5LF+TDB1zbs9KaSwOCmxZLzBkuj484JPZcNtnnP/tQFkFf+LutwKK+bGotLbr6p73yF276e3sYrJ15sHYySb3Xj9cpmo5tGtEh+73yxxURbDNYreRhCtTuvkcYRBVWdJhzC8k0B+9AZCS88YrdLfZBkludoe6LKyf/gHhyAzVbGr26WNj9UbFWrkEAF5HsTbauCtpH9I8LvuKwL0MI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39850400004)(376002)(136003)(346002)(1800799009)(186009)(451199024)(6666004)(6506007)(6486002)(66899024)(86362001)(31696002)(36756003)(26005)(2616005)(83380400001)(6512007)(316002)(5660300002)(53546011)(110136005)(66946007)(66556008)(38100700002)(66476007)(41300700001)(44832011)(31686004)(966005)(2906002)(478600001)(8936002)(15650500001)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wkg2UGdoSkdUV2M3RTVEc1djREZPeGJLUU8wTW1lNi9QMk51WWo5OHUvUnJr?=
 =?utf-8?B?RmNQR3ovYW5BekR0V2QxaTZNT0lWdTNhVUFKNVNrTC9DQVFEZ0oxd3FlMTJo?=
 =?utf-8?B?OUVTbndkZ3ZXQUNsNG10b2FwZ09rT1p1TGFHQlBJbVcyUUo1Z3pwdWQ2Vkxu?=
 =?utf-8?B?a1p6TWIzTnBvdU92M09sQVJ5UUppTmVETlVFMjhHekNxOFBGRE1rSEZoTWRU?=
 =?utf-8?B?dVVKSXEwUU1qeFBSUTUzUldUNzNXcXpjZnJMNjRzOVdsa1NoeE0wRng2UUFW?=
 =?utf-8?B?ZkVvR0RkbFZ4SDBJQkJUODhObnNrYjViSW5JME04YTE4elpXNHFwYVNwTnMr?=
 =?utf-8?B?VklSWXJmaFZGQkRXNWxxMmtycHhKUkRmVEdacEJLUUZlSDAyL2lzS3ZUc1Nq?=
 =?utf-8?B?eXF5VS9sUXJjVm4vQzhra1pQUUdVemhwczVkMlZUck5XVnV3SmFvb3ZldTV3?=
 =?utf-8?B?dXFhNzI5alJkc0tEV1p5VW1TOURneDhHb0tSa0Y2QU0rd0NGWTRTWTJVNzV0?=
 =?utf-8?B?RkY0VUppdGhzMGljcFQyYVM4eW45UXdRdFNEdGgvclBvZHlNY3dTZ1diUGdX?=
 =?utf-8?B?VVhNNEQvWi9UM3BJWWQzMURVWHhpMWptMDNhc3NaK1Q2T0gxQjZod0ViTDBi?=
 =?utf-8?B?b3QvRG1hd3BoMTZodllhV2Q4bVVaRm9oc3hrRUxRVk5Bck1qSkhBL0YweEh0?=
 =?utf-8?B?NjBwUktVc1d3Ym42Y3dEYUZTUHk5eDdES0VpMjVpM1o0L0oyc3Jvd2dHaDls?=
 =?utf-8?B?UVZJazd5eVZ5Y2hOVXBkQm9NdW5mRzJJMnVDVjM1eU90SHMyWENqUjFRZnB1?=
 =?utf-8?B?dHp4ZDRtNlkrZUhzSUhpYXhsZDRIdnBXQTh2MkZIS2d3MWtyWGxHcUhuODFO?=
 =?utf-8?B?bjZ3WVQ4a3ZOcVVEM24vOUpoRmJGLzY5T0xYSnZvQmpSbXFMS0xKZlZITW9q?=
 =?utf-8?B?RklQSSs0M1Z3THRLU1BuWGNZQzMvYkUvWTdDd2JDazhHWm1wUFVwQjdBcDcv?=
 =?utf-8?B?ZnNOeFFGKzlFWVFvTFdKMDVlQWNUa1VmcE5vRVoxbUMvd3Y3eVREOHhzZGxB?=
 =?utf-8?B?eGFIZ29lL1VuREVFNDFhUm1HNjE1ditLNWxFM1gzYStlczFGQXQ0Q3hKL2lH?=
 =?utf-8?B?Uy8vcVZ5S3pERS9nU0hlL2hJampPWTJHK2lWS1A1Q2Z5MmhveS93NHZXbE5V?=
 =?utf-8?B?SjJoc05UbFpPMHlqaDBrQ0YzQVg0ZTlpNmsrb3hNcnU3S0lzSVZkdkJiQkxP?=
 =?utf-8?B?Z1cxaUhtTU4vMUE1bkhtZHYyeWRMSHYrVWFtS3VqdkJVM2t1aDdVRXdFT0U2?=
 =?utf-8?B?S1A0em5JY2tGL0huNzlwZE1kVDRldExhVjBRSEprY2tIRjUwejgvb24xTGJ6?=
 =?utf-8?B?Ulo3V2E5YnB4YUFkUDZMSyt4QitOTkhhYlFPaDhxZmlXd29KenJGaXBVNWRE?=
 =?utf-8?B?WDQ4WlFiSzZkd2owTXE2OUpadUJ5OHc5ZkY2MitzeUJaS3VoVlptYVRWWnZ2?=
 =?utf-8?B?YVNPNW0rTWRkT2V0MkJzYm5VVW94TU8yOWErcjNOY01ZRDdiZDFDK0FRdkNm?=
 =?utf-8?B?Z2xnR3U5Znp3N2VmWUZvTGRGYlFIQXlSR1BuUXU4SjZiTmpGcjh5RHFzODRG?=
 =?utf-8?B?UTJubTZEdmJaTm8yV2I1Z3pmRFhtTklVbHhMZ2g2NmprT09WUVhDeXZFS2J3?=
 =?utf-8?B?UTBjWTVkSkJSaG5oMW9VVjUzd2pqV0Z2TzUvUWFGZU0wSXVFVUxkblVXNmpr?=
 =?utf-8?B?UFhPMW02a3ZteExHdU9nRjNScUdCZnFPV29kemFYT3o4eFhWZGZpMnNkQnhj?=
 =?utf-8?B?OU53VWNmSWQ0MjNiRjdXTmhUd3RXMUhITzYwZXo4azNRR3dtYys3VWNSWkhl?=
 =?utf-8?B?NDFETG9uQUpKb0gyMFVzVElFUVdBbHAzSlR0ak1XUm9URUw4Z2pRR0ZsZnQy?=
 =?utf-8?B?NFhxSlNxSEdaM1ZmWk5MV2RRYUttdWlaQjZJSkkveGNIeHN3VHhhZS9XYSt1?=
 =?utf-8?B?OU1icjVGc3YvN3lQMHIrdVdQOE5YWU9uZndQRitkdWRJTGtlYm9CM09HNVRP?=
 =?utf-8?B?bEwzSHF5bzJPb2ZWbkhKUFk4UjlDeWd1YXNBenRaeStwemZheUVzcWFPQW80?=
 =?utf-8?Q?G6QsF58TUBKJLyFWmwfWn2EO5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eec443-093a-4d95-a30f-08dba828d0a8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 00:42:25.8434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoO2cj3O3xFRi/q9YqbdmoCfprAYoglUJOS4d8Yh2h3/D68YpCCcao4daNcj2BJ4exQGUXm7Gd+O7HWtmbEjEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5674
X-Proofpoint-ORIG-GUID: ZWdjnZaZqeaGrEkOfy1k0wFwjQoT7At3
X-Proofpoint-GUID: tU6CJNxR5junOvSoN88enIqme7WoTmnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_20,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308290003
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37SNU28P016620
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 00:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104635


On 8/29/23 01:05, Khem Raj wrote:
> does this also apply to master? if so then it should be routed through =
master

Yes. It also applies to master.


//Yi

>
> On Mon, Aug 28, 2023 at 3:49=E2=80=AFAM Yi Zhao <yi.zhao@eng.windriver.=
com> wrote:
>> CVE-2023-3748:
>> A flaw was found in FRRouting when parsing certain babeld unicast hell=
o
>> messages that are intended to be ignored. This issue may allow an
>> attacker to send specially crafted hello messages with the unicast fla=
g
>> set, the interval field set to 0, or any TLV that contains a sub-TLV
>> with the Mandatory flag set to enter an infinite loop and cause a deni=
al
>> of service.
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2023-3748
>>
>> Patch from:
>> https://github.com/FRRouting/frr/commit/ae1e0e1fed77716bc06f181ad68c44=
33fb5523d0
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../frr/frr/CVE-2023-3748.patch               | 54 +++++++++++++++++=
++
>>   .../recipes-protocols/frr/frr_8.4.4.bb        |  1 +
>>   2 files changed, 55 insertions(+)
>>   create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-202=
3-3748.patch
>>
>> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.p=
atch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
>> new file mode 100644
>> index 000000000..4a8a7e1af
>> --- /dev/null
>> +++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
>> @@ -0,0 +1,54 @@
>> +From e61593f2ded104c4c7f01eb93e2b404e93e0c560 Mon Sep 17 00:00:00 200=
1
>> +From: harryreps <harryreps@gmail.com>
>> +Date: Fri, 3 Mar 2023 23:17:14 +0000
>> +Subject: [PATCH] babeld: fix #11808 to avoid infinite loops
>> +
>> +Replacing continue in loops to goto done so that index of packet buff=
er
>> +increases.
>> +
>> +Signed-off-by: harryreps <harryreps@gmail.com>
>> +
>> +CVE: CVE-2023-3748
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/FRRouting/frr/commit/ae1e0e1fed77716bc06f181ad68c=
4433fb5523d0]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + babeld/message.c | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/babeld/message.c b/babeld/message.c
>> +index 7d45d91bf..2bf233796 100644
>> +--- a/babeld/message.c
>> ++++ b/babeld/message.c
>> +@@ -439,7 +439,7 @@ parse_packet(const unsigned char *from, struct in=
terface *ifp,
>> +                       debugf(BABEL_DEBUG_COMMON,
>> +                              "Received Hello from %s on %s that does=
 not have all 0's in the unused section of flags, ignoring",
>> +                              format_address(from), ifp->name);
>> +-                      continue;
>> ++                      goto done;
>> +               }
>> +
>> +               /*
>> +@@ -451,7 +451,7 @@ parse_packet(const unsigned char *from, struct in=
terface *ifp,
>> +                       debugf(BABEL_DEBUG_COMMON,
>> +                              "Received Unicast Hello from %s on %s t=
hat FRR is not prepared to understand yet",
>> +                              format_address(from), ifp->name);
>> +-                      continue;
>> ++                      goto done;
>> +               }
>> +
>> +               DO_NTOHS(seqno, message + 4);
>> +@@ -469,7 +469,7 @@ parse_packet(const unsigned char *from, struct in=
terface *ifp,
>> +                       debugf(BABEL_DEBUG_COMMON,
>> +                              "Received hello from %s on %s should be=
 ignored as that this version of FRR does not know how to properly handle=
 interval =3D=3D 0",
>> +                              format_address(from), ifp->name);
>> +-                      continue;
>> ++                      goto done;
>> +               }
>> +
>> +               changed =3D update_neighbour(neigh, seqno, interval);
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb b/meta=
-networking/recipes-protocols/frr/frr_8.4.4.bb
>> index b87c3e78b..f32b52f33 100644
>> --- a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
>> +++ b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
>> @@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d6=
9f5fce4486a80fdaf4a4263 \
>>   SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;bra=
nch=3Dstable/8.4 \
>>              file://frr.pam \
>>              file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc=
-not-py.patch \
>> +           file://CVE-2023-3748.patch \
>>              "
>>
>>   SRCREV =3D "45e36c0c00a517ad1606135b18c5753e210cfc0d"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104632): https://lists.openembedded.org/g/openembe=
dded-devel/message/104632
>> Mute This Topic: https://lists.openembedded.org/mt/101007225/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

