Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C925DC4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 01:32:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4089.1670203967494341634
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Dec 2022 17:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s7jHQkxX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=933831f28a=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B51SRan027461
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Dec 2022 01:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=GFP7NKUq3v1031zBUOeHtmFIN9fdJijv0fI58GgWKho=;
 b=s7jHQkxXSfX7YOHeZD/f/ZuBTu1t4Y9OIgaEEeZkl1ZvCpFsMEbARjj07dOn9Tshsin8
 cwnFKjaMNXG/+pt37pIOOptKV6VDb/op3kKnAiAIGe02WXamzt6FBqqr6SJOJfXiTr+Z
 53ZXf3STl7Ckt0VkJuhKSAPDrydW2HAW4IvKWcYonNV1AvWllwNOvsNURj6r1GJ2ylgg
 bFYMrg7IF1S6+VEcKVaKJgYs9Z6ctyE7xYB4YbQqw8a7ufTMES2SabH+ChlR5ruA0QyZ
 p9tM1XV2hDXu7tczvSud1zkUuTeY8xjLKChnAtzn47JQwHuS2KOzt40U5mdsItbf8aQk gw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we913te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 01:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/lPv6UPpxGeQfmZzeoOG4OpLJlfWLfSKs3QFW4y3pYBcxTTVzbVJKZO4ZIivdV8pSFauwKgWJG+zpycTTPoXEfMhjsnEyVC1ArenB0Leqc/txierEYrQ8qTZOYlpkHtuSDw8gGHNIObU39imuGvMQcgnuSfnOgPiNpigVw4ZjpDPhjI6WCCVLjNt0VyA/Tl/ChM91ywXrANxQESGUEQsYH86V5jxuyovUi0MMZpItU8RbsN5x+L2RBuOCPfAAXYzOdCi6gCaTJqK71AxsS08d4sdjAMeV/XAwLFDFW1ycJc8/6EgMM+5wPAHW8nmT/VOqpoJN7DeKe0JSn+/SsLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFP7NKUq3v1031zBUOeHtmFIN9fdJijv0fI58GgWKho=;
 b=SxqOPOUkbo2vdUhA9BTX1j2vHHAH+XPE/+Vu4m2XNclndRCv8OaW/T9qn8aNl9Zh/ueI6aYgWr714t7QT7JXjPte2vaQWWWrsH8cuu2sIkDF6IlMHhy00X0eUO7gjOCl6plvVQK6Gegjs7f7dOLbhj+SQu8+NwpcSouWv3vV3MnfIVmWsDAqG1i3hc6QK6EyEay/dNPlI5hL+T9TTDZ05qaBM/l1oNnghiqBWVS+Ulb8KTluqueVEBDO4V52gIsRfTQXcvH6y1hX9GSdZ0VEKf0MPzZPk5dGrgutvwzEmVwAORxY5WoqNPdHZmrHXPuKagyc98/h3l73BSHDWJb3KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 01:32:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 01:32:44 +0000
Message-ID: <4b56a78d-b2e6-0ee6-b529-465af68b3c0a@windriver.com>
Date: Mon, 5 Dec 2022 09:32:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-python][PATCH v2 0/1] python3-wxgtk4: replace
 deprecated inspect.getargspec
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20221204064433.5377-1-kai.kang@windriver.com>
 <CAMKF1sqOAm2Emi2MBRQ1hQE6V2ezOSscKz4E2XCxOKkyBhS4sQ@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sqOAm2Emi2MBRQ1hQE6V2ezOSscKz4E2XCxOKkyBhS4sQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0139.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 4454aaa2-4f0e-400c-e931-08dad6609b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9E428HuzYQQo0qg5pkiKEGqgJTJrU8d7fqzavbfFQMdGjilPv0zwqsa2l+xsN87YCoEc75tUT1RH/FUv89G2EUUYQ0klqyI0ct2FqrABhW0jHbR87N2ihSPCnox6imuf9MaTV8D24fqLK36oEbGrje97AXCWFS9MK8y4QFH0IWZrOh4LSv9x+6WEZkDWi/iJNxkekvMMmA7myfpxG4yv4KMrXKyldC6zvg87DFECMzRFHbmIbeOIAnS5C8m6crqYZVEd1hcHpWmNEcEaLtDHCRZqzL3FXWZZsFizsJTyJSFjoibZPrgMHNyw1jqmci3LfN2hxIwHtpxwTeYaWNmvD9AD/E2Kj5s9o3Y7GukvFlZ6dXEx12tN2/JxmvzJM0Y+BOkmf2rxjLbRF/nc3SxyQmBio6vvNP9Kk/f7XTSjx4xex0tScP1pe8nCKQxNdX383Y9cUXV774YTIwdP3E4OonhrKG49+WVcFTtCWAX9I2FyIZYVKVhZurhUBHjlpyjRepXkbYuPngjzALguEMn26SZ7M7egzt1A+vjSk9xp18ICTs4kM+9G6VPxIRropdkILJugsq7SUykI8GTKTr/3vz6DsHc8hLmLaBHeU954vvf/ndDTtxWBCOaP/h8h2L0HDUMnxfRTW14NSAThcDSdDJqqvd4pK4g3VNORBxKihDfQIN1n7YpVvR0McHoG0VnxW7p+no1egx1sId7g6PzK8K1pE9G+Pdk7JREO239OrtjWAP1IAOFkC/lQdWqLn6e5FMjeAfvU59qcCEJi+2ZNyStczIi43ovrtKuSCGTHZXc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(366004)(39840400004)(136003)(451199015)(2906002)(316002)(86362001)(31696002)(83380400001)(6506007)(966005)(6512007)(6486002)(6666004)(26005)(53546011)(186003)(6916009)(478600001)(2616005)(5660300002)(41300700001)(8936002)(38100700002)(66476007)(66556008)(31686004)(66946007)(8676002)(66899015)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGZYRUNXdmZvOXp4TXl0UmNjekRxRERiSFp2Z25ydU1XNmgvUzlZOEwwNWN0?=
 =?utf-8?B?ZFQyVHRjMVF3MWxKdDZOWXQ0YTIwWlg5enZkaEdzdzY5NUQyd3U0UDROZm9q?=
 =?utf-8?B?OW00UGY3S2dvTTBIdzU5UWxXSnVqak5iMzlQUE1IaHcrVzR6OUM5bXRGNzl6?=
 =?utf-8?B?NklHaHVjM2VIcmkvd28wMEhxRzFrcCsvNFRWRVZTYzg1OTdZYit5WEVqZnF1?=
 =?utf-8?B?VXVaY3RZeUNsK3lZRUR2V3l4ZGlpWGNPNHZ2b2ZKRDRSTzc4ZENIUlhkM3ll?=
 =?utf-8?B?TW1ZcWNJTFBvMUtKR3RPd2RFS05kM0Z4SVlOTUR2amdpQytRVGhNQWRmZ3Zr?=
 =?utf-8?B?SGhMbTJkdGdCcHp6UWlTMXp3ell1SWgvclppWE5WY0RINndvNG5nZVg2L0d5?=
 =?utf-8?B?THd0emxpVUtaUEdvVTZaT2ZvTWlyNTE2dUhiUVdOWFMxQXdVdjRKVTVtNmo5?=
 =?utf-8?B?MXZPajZsK3d0enZwTXpNeE03MUdDM3B1RWdQVGpOWmpoeW5HakZkRXhNdHBj?=
 =?utf-8?B?dWs3YTNqMnhNYXlpYkJYbTZ6Tk9XMnptTGhML08wZ2htWE9VK1FyYzZxTHVV?=
 =?utf-8?B?WEhiN1IzYjhoVGNLc2dBbGt1b3ZuMGZsWWRHM3pyZkRkMGNYMlhMbWtMZXRU?=
 =?utf-8?B?UUdpTFBUb3I2Q1Ywcyt1cEU1WjFyL0psNlhIKzY2L0ROei9iVUR0b3VhUTJV?=
 =?utf-8?B?VFlUQlhFZjRoTHd1OEtCMlVtL0hSRHk1OEI1TzFrMVpvdHl3TVBRbUY2RDEy?=
 =?utf-8?B?d2NQeUlpVitKVHE5UkwwVnhKOUFmRXlnOWVucklYc0lKd3U2am1xVk5nWmxS?=
 =?utf-8?B?eHdjVnVSa2NkRTh6VVBQM29hRlk4bGl1QmhmTHpGYjFqcWdWaldiaERDTUl4?=
 =?utf-8?B?dGJvbVQvTVN3dy9SV1RjQ1RIOEk2VW1WY3NvejhTcFMzQkQ5dW9vQTB0NHg4?=
 =?utf-8?B?Q1ZwRnRITENRY1FLWERVMXpNU3RXK0l6SGFLTEREL3N0TDA5cGJEWTNtYmtv?=
 =?utf-8?B?Y042djRFL3ovOHhkVlFlaGNrc3g4R3lCbnAyMXNVMmtCM3JKd0E1ck1Za2ly?=
 =?utf-8?B?eG5kWkNnNStTY1NubExZcFR5L1liUXREbFp2blJETlB3V1RUc3BXdURRSDZG?=
 =?utf-8?B?T2k4ZE8vTklyV0lSVkxBR05xMWZ3K3BHK3Izd1B4OCtyZjMyOHpCN0dmK1hp?=
 =?utf-8?B?emRlbG9WalUyb3JGQytVeWlvSzA4dVhVeTViSUVXUVdKWkFXRXVkN0dPSjZ0?=
 =?utf-8?B?QWlqQUNmQ2NQelFLeVE4Vk9zMlZtR1lZcXRISzJxNWo2TmR6MWJza1NzR2Rw?=
 =?utf-8?B?VForN0hHNmx3ckc5Yjh2MUdNRlpVV0NTT2tla2JyK21UUm9WcW9KaUpjSVpy?=
 =?utf-8?B?aU96WGtsWTd0ZjBWVVY2cTFaK3V4dkRsUzE1NG10OFBSVEZ1aDJBU0E2RDlD?=
 =?utf-8?B?TDdvT1I1WDJ4cEo2d1ZiUUNlamxiaklmQnBxcWlWYTFFS0JVNk83RzBENVJh?=
 =?utf-8?B?cXVaSndQNzNVSGNFQStudG8rTWdmK2RoYXAxS2NaSDI4VmM2QXgxZEx2QXpS?=
 =?utf-8?B?TDdzWkZDVzdOdGxibkFjTjRlc3lLSmp3ck9lUGM1N3ZRUWFLMXlsNloyMjB3?=
 =?utf-8?B?U2JEMVZhem81cWl0MytsdUdJcUFZanN5blkvRUozMTRLbEdpczBOWFMwa3By?=
 =?utf-8?B?ZjY0bW13czF1ZDJGOHgxQW9sWXVMUFpJZEFJa0ROOU43SXdYVkloTjU3c2Fn?=
 =?utf-8?B?SWpIR29WZUlwR1dTeXFxQ3lmV2gzWk40aDdYS2p4WUhHT2p5dDFHeGVlR2Qv?=
 =?utf-8?B?aks2UWZHL0NqTlpWdXhKY3d1Q2Z3WTB4Vk00UWx6azFaaElrZlFSdnY2QlI2?=
 =?utf-8?B?ZFJZVUxVTDdLZnkzMG9YZ0FhVm9yVWxleE14OU5NMnpuUklOUW1wVGYxTWdG?=
 =?utf-8?B?MFFiNDExNGNoMUl1Y0FqamJEdlpidjJQd1lsY2FuWVVZL0VnODRHb3ozRW5L?=
 =?utf-8?B?M2gwWTNhU1N6SHpZUXFiZi9UVXoxZnRQTXdPbnZwWWtjbVh6TlRweWIrdm1C?=
 =?utf-8?B?NjJ2Ung5amdqZWFoeXRNRmFkTWxnVnFmV1hlMGx1ZTVwcStmQTdHOFpTL003?=
 =?utf-8?Q?Vo8+rJ1zCR6vE8KptfhRavAmP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4454aaa2-4f0e-400c-e931-08dad6609b96
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 01:32:44.5502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwdmD4pBdD6HGMIeiltYzoCwnUtGFduUzgRlij/PRCgXb2PPk1B2XqxJ/LMSPQBaBZUK3IbhDyyl1hieorFYxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-GUID: 6KDFnTo27maVztsZhyBXnxOhI8lj04hM
X-Proofpoint-ORIG-GUID: 6KDFnTo27maVztsZhyBXnxOhI8lj04hM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=592 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 01:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99948

On 12/5/22 01:33, Khem Raj wrote:
> On Sat, Dec 3, 2022 at 10:44 PM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Hi Khem,
>>
>> The backported patch is dos format which ends with CRLF. But the other
>> part of this commit still end with LF. It seems fail to call `git apply`
>> directly. So I pushed to github:
>>
>> https://github.com/kkang-wr/meta-openembedded/commit/b9a114e5c992afd6619512cd78098ef9d9072170
>>
>> It should be fetched and cherry-picked
> Please create a PR for ease against
> https://github.com/openembedded/meta-openembedded
> as a special case.

OK. Thanks.

Kai

>
>> Thanks,
>>
>> Kai Kang (1):
>>    python3-wxgtk4: replace deprecated inspect.getargspec
>>
>>   ...eplace-deprecated-inspect.getargspec.patch | 65 +++++++++++++++++++
>>   .../python3-wxgtk4/python3-wxgtk4_4.2.0.bb    |  2 +
>>   2 files changed, 67 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
>>
>> --
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#99947): https://lists.openembedded.org/g/openembedded-devel/message/99947
>> Mute This Topic: https://lists.openembedded.org/mt/95442606/3616933
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@eng.windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Kai Kang
Wind River Linux


