Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDCBC433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 13:22:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3335.1643030564419992549
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 05:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ma4XNnR6;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8023944d17=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20OD9rdo011862
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 05:22:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=/ZsA/QffndSULlnXM6UFlyyosJ6NtH6dbncxSn9Oqbc=;
 b=Ma4XNnR6qjD4yoJmyUJgFjVdXoV0fhuLzu1T5598PhLYHi5WPvBnMvoZr4npMwGv0Huo
 UCRls6WmDto2isvseUQWGlCMBzhRhn4fE3KDInzRlZUzdOTQp4Pcyl6XzOk+x+IW7LJZ
 Vqu9HeUv38zJ/09AYa/QCn3yNF+8NxDQ6Dpr6pYfYzCP7Rh9Cpmu8hq4fHIndCY0aDak
 QA+YkpyZCpsUvlwc52UvwH7NKnupxgUSCc3bIHiaJFlGik5fWVeyREhhAKxKXXdqy6Mi
 vCRQTxPwWfR02tDBEuiEyNrC8n0rcPf+Rcs7lU9V2jGWFQ9ewh0wjYb07oHSGCONdg95 bQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsv6nr0xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 05:22:43 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20ODMhoG008330
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 05:22:43 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsv6nr0xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jan 2022 05:22:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRpABowlGuKVxEE3ww06VohDbjnmERhjd+WsrudJ5EYeLLj49CBpa86yUgS6dTNud34iTjcpn8PiLTotWqgGqz6idE3XRRbWRkxIe4w9etAd/gwXtzYcGtX8OkK8LJW6D8dmTQxvjdY0zCn8zmjPxN8G6CDNaR1URrzfpetOqJELn0wqchlxI2e7zasINTVcf7V6HfLza05yA/DwXUg7x7vD7tn03Rtc4jrdDw3sg4jMt+tsJye3+P3EIP4vm7qgpokP3j6VVe01Sz2GmovCiUr8VxITsgEyzzwcuw0L8q8sR5FgYa8pqsnvsglG0DNVW2Ud4kP+yVJ/j8pqzK+LpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZsA/QffndSULlnXM6UFlyyosJ6NtH6dbncxSn9Oqbc=;
 b=mryZVnibcrl5WMB/4C7jUN2uOqA9P7ee33a5EovQtGaJnjAdAGDvpiwGSr8UNJpS2FVp6i8mKe/frYRzgwn/dCj8Qd8+d8WT7m2d+8HSTFThyjyNYZSmyiKO5fsX+icgWxtbsKGyYy89yvrkOc5NOH/EtwXVj5iKplUQD8w6AqZBKGWGVY9uL/hHi0sikA/DiGyc9F4rCpxoMFhkkVUBD4LHUc0P54Vla5gxFjFL189xZcdMA7FEUDmWo4Ufb6+/F8/dfcLqCNIVb2bEblx4QRzYO0jUjr0rybP5fXGiZycRwCj1D7JYTKV+fVMmdG8G0vHC3a3G8Ju7PeQazVrM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BN9PR11MB5559.namprd11.prod.outlook.com (2603:10b6:408:104::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 24 Jan
 2022 13:22:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5185:e1ba:237b:8bb1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5185:e1ba:237b:8bb1%3]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 13:22:39 +0000
Message-ID: <9a6d1c29-5fa5-0b00-dd25-3f1a10cf64ef@windriver.com>
Date: Mon, 24 Jan 2022 08:22:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [meta-python][PATCH] python3-zeroconf: bump version 0.36.13 ->
 0.38.1
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
        Armin Kuster <akuster808@gmail.com>,
        Tim moto-timo Orling <TicoTimo@gmail.com>,
        Derek Straka <derek@asterius.io>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20220107122702.614365-1-brgl@bgdev.pl>
 <CAMRc=Me+wvcyEdN-1na_Em-ba+ZOTfyCt9_CKaceouCBshEhsw@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
In-Reply-To: 
 <CAMRc=Me+wvcyEdN-1na_Em-ba+ZOTfyCt9_CKaceouCBshEhsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa335244-1e9f-4367-fcdb-08d9df3c9852
X-MS-TrafficTypeDiagnostic: BN9PR11MB5559:EE_
X-Microsoft-Antispam-PRVS: 
	<BN9PR11MB55595130AAAE9A3BD73B087A9F5E9@BN9PR11MB5559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6GNLAIb/f6TmPf+TyXwiyMdBRwO+45Y5vd+DKOfjFBQPfnSoVJiYIHr7n3SNOmFo56tGa/6CFvumhNew33CX9vrtjUdsPbIDf+xJU/0D4RGIiB0uNZX0JKn+CsnMSTeYKVsgNHhWcDGVeInJ9/05HPfJ5NUe5HT+TdI1jLvmTol+X6md7ixPA1qXUf7gAaaKrW4pKjGlJEC/1qqrk3TCAROUuBQ1Qa8h7wv5WzK82EX+0nPifFSbD6FoVlFTtm8i3h7Z7sG2leocg7VrIOeRYTlGA01SfZSojR8FCo4z4/6A6HqhIRmsCrlubRqobwHU0tF34a8eX/CtTykYhXdzuTYWYTcKEpNuM6V9B9d/mgrjbJvZqiIuth4ZxltOVRjxrtx/noZb1+hJx3TemxQndhU81/qCx0wJGD06SkFb9j+tbvBgnomX3I2mNdGrv5xVpGMRldrhtk+GtOvEex+nb3vxe9SqF2DK1NoVEZgdR/HTaF+au0ksGAineOH7cVG48rHDC9YO9L7zXpQLGW7yUyU2LyK0wsTxA6FCLBqaRUklQevAQV3YwDjMrTgJQzb7B7uIki8x50aNQXwGtAfis8ZfptVo6DjLiKMW2SVV4ORKrT+3KfltnEorVvapN800gWxQog8SCfsrz6lDvGB8ZlR8n0W04NirnwveaWSviyf8V1jiT09jk7djOzp8eoKPvUtGI2au/O1cvbdxmWsUmrFLcnedDoJivkt7qQfG5PKv8WBlBkVS47K9p0XSE1qto68VFX89U5f994mWUMd43hSjvChciLOWuKm8X/KUjGE/cd1MwJPpw4vlyKLj9KwG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(66946007)(38100700002)(86362001)(8936002)(508600001)(5660300002)(6666004)(316002)(66556008)(6512007)(66476007)(4326008)(53546011)(6506007)(2616005)(36756003)(31686004)(8676002)(110136005)(44832011)(2906002)(31696002)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlF6L3ptWStTc2hCc3k3cG5rKzdSU1N3RFJaTUFnZUpnUFNlQ3JwM3djbmZw?=
 =?utf-8?B?a2dSQytzNGZhd3Q1UXl6Lzl6YlkyVUI3REdwUWM2aTBQcVpBaDZmQzBQNXpY?=
 =?utf-8?B?V2h4VW9yeGdydFhRZ3l5VHNFS3BYV284Z2NqaEJBSTQvckl5azRWbnlBb2t3?=
 =?utf-8?B?dlUydEVxQ3JDVkd0bkxLQWplVEUwWGtydXBLdjRWamxNQ1I4bjl0SFlxQ1Zj?=
 =?utf-8?B?aDZvdFd5ZWxUdE1BclJTUU5RdkJWTUIyb3hFVnA2UFphQ2VjN3V5SnZjZUhs?=
 =?utf-8?B?NGRwaW5Ec2ttOWVQR0JDcmczWWhpdHJ4TnJVTmFIM0VlR2JHZEdxSWFMWXFZ?=
 =?utf-8?B?b2RhNkw2SmdnM1A4emxZSGhJRFpEV29WUW1NZGdNMnFPS1hNNjloY254MzdX?=
 =?utf-8?B?WGs2YUxhd0JDRlRrODRvdytndURjc0g3b0dOMVFIU2FnY0h1TEVkbTB1dFdo?=
 =?utf-8?B?T3NLOUFsZTd3bzVoS3FnekpxbktibTJsQ09tcEUvTjBwNERUY2dZaHJXNXIr?=
 =?utf-8?B?d3B2UG1POUpiTU8yQTRrSTVqN1ViOEh3b2RlelZxS3doOG55aHd6dE52MzJs?=
 =?utf-8?B?Y1BsNUZZb1Y5ejgrWTViY3IrS3A1dXhBaUFVb2NQUUgvN2x5RTJZbUpwTElH?=
 =?utf-8?B?NDZhUmJHMXo0V0syMGlzSGl6TU1xTGR5SmlGQi9ncmoyYVFyNU1hVjNiRjd3?=
 =?utf-8?B?aWUvTFl1RFBMRHQ4T1hlRWRUcGhEalg0ci9idUN3K3RtME1wek9FQUpaSHUr?=
 =?utf-8?B?azNGRTU5RExrSGZhZTVIOTlWZUVlNnNVQ0hodFpuT3pocTVDb0IrT2FBT20x?=
 =?utf-8?B?OHRXcUJXQ0Vmc2w5S1ZaTTBDMnlna2I1VVdnQTJXbzNYb1o4eEtZblZoeU9z?=
 =?utf-8?B?d0lZbjllUkZ2emFDNG9CTG1ITDZZQ21pTWZET05Fdmx2VGs0WVZ2TEJrT3BE?=
 =?utf-8?B?N2w5ZkhNZWdjOHdrNFdMYzF1blVHS254TVlFSkQ4Uzg3a0dheU5qMGtoWWJW?=
 =?utf-8?B?Q2RKVVc1MlR3VVVYZ1llS0ZtVzF0d1BIcSs2T1lNWk9yajBWZWdmUDYyYXQ1?=
 =?utf-8?B?UEhTMFJ4REE5Q2hGU2ZaWXNMa3VHb2tTUHNhcjVOQ3dIMDhldlFqSDA4N2Vz?=
 =?utf-8?B?K1htOUg1ZWV1ZmRpVHpwN2RJNHJvR1E1ci9va2RiZ3B0RlI1Tk9tQWx3MjRG?=
 =?utf-8?B?WkJhN0pkQXRQa1B4MDFlSW5zUFo2MlVvblg1Zk9SUENHV3FmOE5rU3ZYTEYx?=
 =?utf-8?B?WVZpMXpUUE1qemQrUjkxa1FDNzhoRFpFMXI5a2xBMVZUdllhYmFwcjYvZ0lG?=
 =?utf-8?B?MXQ0bFVpRkk5Z3lEbTNXZGVJZW5zRDdmd2kwU1JvejE5d3RqTnRRTU00TGR5?=
 =?utf-8?B?bzBXdnhQK21NaGR2REpDLzMwdWVtMDFXZStOK0JWMUhJeDI4M0V3WU1zSWNJ?=
 =?utf-8?B?MWRKYXJybjhPSlk1ajdWT3kxcjUrWUY5RStLd0EvRnlWM0VoUk4zUlltamQ5?=
 =?utf-8?B?ZXZiYTlzR3paOU13LzgxbENZQzdlQlpsMG5TNVVzSFlSZ1AyQXBEVy9KK0sy?=
 =?utf-8?B?UVU3WnFPTFhVT01hN2owQ2RFUnpzWGx6V1ZDRTBZTUkxSnBwbTdwODREMWtY?=
 =?utf-8?B?ZUw5TFBrZmpUS2M1clRYaFBKS09SVVBLU2MzYnUvRVhBRHNEdlFUaVlENERE?=
 =?utf-8?B?ZDRXbXM0MVl0c2JMWnpXNjZHZUluN2MxeDlJMnQrRXpBODBZbHlMQ3d0Zzg3?=
 =?utf-8?B?MlB2ZWtiRmFpMStZTTlwc2ZoVFJGaklQd3BKNzRRNXFRSVNyTEhZeXllR1Q3?=
 =?utf-8?B?THNMM0psYTd1ZWpkYzQ1MEJQbHNsam9vdWxmT09EdGc4UXYyVVdlTkNVeW5B?=
 =?utf-8?B?aC9lRHFZTk01c2dDR3doYnRTemZuRElYNnFYbEp0RFBnREoyY2JhSUNna1RQ?=
 =?utf-8?B?ZzNMK0I3NU5Id1ViUlYrRjhIcGxDYjVhWk81RFpvMGZ1L2Fleis4TEhHMEhF?=
 =?utf-8?B?eThNQmgzeHBFYUlnRk13QmNpV29PSGZkNmIzQ3ZjTkN2TWdKRzBpeXFUQjJY?=
 =?utf-8?B?NUlSVDBFaC9oQzZuZXVtaWc0blRmajRZNjd2UXY5dE40Tk9uSk5tR1lEelpv?=
 =?utf-8?B?djJjMUw0U0JlVU40OUVOVjJCOWd3ekhOSVZrTHVLZTcvTVg4U2M0YjhCUTJU?=
 =?utf-8?B?WXQvanE3K090VCs5S1B0RE53NnJKTFMrVUswNkRmMmRKamtNeXIwcnAyNXNR?=
 =?utf-8?B?eGUxSjdZVG5TS1djSFpkRG9ZYUFxVVNRL1hWaTRMUGMxTlFCT2dxZDFaRk85?=
 =?utf-8?Q?kdkrQm8kUXYMOk77Ho?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fa335244-1e9f-4367-fcdb-08d9df3c9852
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 13:22:39.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mPfRuBZJtErzKp/McPUovsKBvwwQZRDBDjjltXU34baxtTIr2s4si2GuCPkQYfmP0kXKvdjKe+d9EIfmbC4CZsaMGrrfzvPo0pjv1VfXyoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5559
X-Proofpoint-GUID: aEUNzvlX_1oY-Fbp5PZ5aRauHLZznGzT
X-Proofpoint-ORIG-GUID: TOjud3t3maV9PYHfclNh0kwDzx6JuGYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_07,2022-01-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 13:22:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95033


On 2022-01-23 07:55, Bartosz Golaszewski wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Fri, Jan 7, 2022 at 1:27 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> ---
>>   .../{python3-zeroconf_0.36.13.bb => python3-zeroconf_0.38.1.bb} | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-python/recipes-devtools/python/{python3-zeroconf_0.36.13.bb => python3-zeroconf_0.38.1.bb} (79%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.13.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
>> similarity index 79%
>> rename from meta-python/recipes-devtools/python/python3-zeroconf_0.36.13.bb
>> rename to meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
>> index ccab7fe4c..c49782e42 100644
>> --- a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.13.bb
>> +++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
>>   LICENSE = "LGPL-2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
>>
>> -SRC_URI[sha256sum] = "196fa1bd6e166f0333e3e9fff076f9991bf2719c4788287eaec577c241ef96bf"
>> +SRC_URI[sha256sum] = "10c501b25d8881b656e56c34674d98fe6bc752240a572e74f918bc849c93ba9c"
>>
>>   inherit pypi setuptools3
>>
>> --
>> 2.25.1
>>
> Ping. Did this get lost somehow?

Not sure how I missed it before. Submitted with the latest PR just now.

- Trevor

>
> Bart

