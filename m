Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6683.1626545405183798122
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jul 2021 11:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NAJNepVB;
 spf=permerror, err=parse error for token &{10 18 testsso.windriver.com}: permanent DNS error (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2832432288=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16HI4Ibc015349
	for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jul 2021 18:10:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39us6r09w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jul 2021 18:10:03 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16HIA3fU025030
	for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jul 2021 18:10:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com with ESMTP id 39us6r09vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jul 2021 18:10:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xdp6I80DZ8Hqj4V6heYIjFb+J3pGTCN3Qjil8vEZCqN2ZlfLZWn25v2vjFIl0YacSegGvefE1T96M5cr2s95GY4bwqIh/83aXUhhAr3o+XhpxnyBe6RN8zKdxsb6sa2tveNJYOSlkUEdbYwpjHgp9QDGNG/bJlaDCQr4PzNffeyZ13uW52ho0Dgc+SyecnhWzU82i6V5QOItzTVmLiKVSsh6ssVi16+8WbX0Abtt6bk0pS2dfxudSbg9B+pv0gRnVO8tD1Wqhbp/WCdWLowT870J9gtcLj6U/o8UOHu3bsc7oa0wUNa8k5swoPOz2E720gPR3N4J3okiE2B1PN072A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1T84RVxLYLy6I/QbJX+weprpxKYAMQATZ2CmC7KOFg=;
 b=AYnYinr/0tv5ymdN97LAiqRIOldM/KHgu3vvxpptTyQt+PvS+qYU+cZX15cJVMuQo0WedABVT7SeNkFM3W+VngBTQVlQ3oDVD5cn4QJLByxhHOoHqSQV6yOqOj75bsgQU5uloqUCC9vW4QUuEb9mMikgUpRHrLZjFNH9OWN3pLfnzIhddVSNAv8uKXM8T90+InaO6U0xYHk6Juhu3WuYhdrHR+OpnsfMIoS4MFXuaDsJsNHqIfZovxSxM2IeYGOtUFch629CXGwluUaAXQkAv57ver10Rdxjvyd5m3Pf7hKlnOsOdC98H2Y1ydt8tHi4p4W5YtaPNrCFOcUw015m1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1T84RVxLYLy6I/QbJX+weprpxKYAMQATZ2CmC7KOFg=;
 b=NAJNepVBK5Jz6UOPKsoCp8u80hQ/ZOzAwsHBdqUojngQ6bX+ktKnswjX5OkHisLsgAnW1enFP5FKbjExZ/plrcMQAlkH4GC7HyMPf8pMpKapeopeAdS4M5Tojdrvy9dD3kQLNs2kqVxE/YdTjOvVzeDnywCFNgRx9P/kqFpzNDU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1675.namprd11.prod.outlook.com (2603:10b6:4:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.26; Sat, 17 Jul 2021 18:10:01 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579%6]) with mapi id 15.20.4331.030; Sat, 17 Jul 2021
 18:10:01 +0000
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/2] redis: fix CVE-2021-29477
To: akuster808 <akuster808@gmail.com>,
        Tony Tascioglu <tony.tascioglu@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20210716184733.37797-1-tony.tascioglu@windriver.com>
 <106d037b-ffac-beae-e65c-845e99742c86@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <a3b8968d-140c-68a7-2704-7a9b3b54f164@windriver.com>
Date: Sat, 17 Jul 2021 14:09:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <106d037b-ffac-beae-e65c-845e99742c86@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0278.namprd03.prod.outlook.com (2603:10b6:a03:39e::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend Transport; Sat, 17 Jul 2021 18:10:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5885aa6-7ded-4ba9-6273-08d9494e1851
X-MS-TrafficTypeDiagnostic: DM5PR11MB1675:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB167578766431D42D27D72528F8109@DM5PR11MB1675.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GcB7X7hgExybaUOjxj3k29KVBtgsC3wchMMLw1WZsTeKF0KUHOOIfvDTFdHWbfhfbe5zvlmINSEgP58dCvsiFXPqb8yhEYIw5rxjWndePrdlz1o8q+wPqPrEN4vIQQIkrKLnJA/LXG69yf5ce8yPYumwxtqAFBc9Ndi+ZImveWpG6ysb2EYsqkqx1znZFeZLaAlSqKi0ThBkihWywhv0P/wVb4Op9e1YFyVOEM5OPGeXdfUpAucgZZnV3IEtpAQsiQJL/6qR+9mRbm15KR/qBUB2hRvL7ZWhR9JH9qID966aXhKQX8AEIF7bdXxLb09HjfNse22Ffex/xwgXziwqwNMfWDdwRjbzcMYnMNjVL1CFW99P6QfO4xta7Ij+J4uddbVdjM0nLIyVnlALtvwwmo+XgD24A80Rjvq9VcD4x6sxOAx5L3NXQCvEWdkJ+cWuxP6fCS2wWRnHIkuOd6+gDcv1Eu7h4YiNTJ9IcUq7S18EXnTYBdlq2p8A0viFNCH6qJHPjfjJvMIAEn9ltlcLGEbvu5Py/5z5UrutTX/D9sjSUjMRnvGMiRJcQ9Wo8lukUeMDsboyGdqYRTsBUpStZGKEIo5jGCRYBUfFfs6y7qLJitx4gHf9/DxinpdYQnejewXSvBGE5S9rIPHGkOss7iroWyuheAT4YgUgF9tX0l2J978MY9dkGrf/wuGMbh+xmfBa+/lwTVqGC+As8AG26Rrr6naZZRvPs1PcjX/zwvxFAV2ugoAOZqVGigpEJRplnHsga0+f3N2LOPWOcqAsn0nKu+cBBdxvw3grK8sp5+vgrcpWem1lI4RCUcOv+EOn5ctPwseb/zF0xMgHzf4OvwuCDK6FzkmBkKu5CvDM3jZxSDWW/A84pMfaYZgaHCNu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(39840400004)(376002)(6666004)(6486002)(8676002)(31696002)(31686004)(8936002)(86362001)(2906002)(110136005)(16576012)(36756003)(2616005)(956004)(53546011)(478600001)(66556008)(66476007)(66946007)(5660300002)(316002)(38350700002)(83380400001)(38100700002)(966005)(26005)(52116002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NW15alJOZlUrdnJZYzNHdTgwc0J4WXdSdWM5Q3RUZzh2V2tObllXUGFPbzhC?=
 =?utf-8?B?OFdsNjVlcE0ybkxwY3o1SjVTRWxxZnluWG1oTHA3cVVBWEh0alY3ZjNJOFFO?=
 =?utf-8?B?bWVPQzlITW9uVDQ5K0I0VGIwdVlDNXg5Y21wdFAwWWIxdjFaYjUwRlBqMFFn?=
 =?utf-8?B?TlpQa0g3VkFMMG9KRUtheEVUY0hqdThFRkRBVndqUDBmajI1ZDkzUFg2MS9r?=
 =?utf-8?B?TzN4YzlJaTNaMDAvU2puU2hYZDlxdUhTdklDK2N0RERnUEt6VnFaUVZ4ZTRw?=
 =?utf-8?B?VURveWJqUXJiSzFoK3AxMythSEJNZW95ZjRJRitOZko4YnFtdFdJZ0plV2xU?=
 =?utf-8?B?RDVQRVZrZHFxMGMwUEVJUC9xd05ZcUp4aWIzQ2U3UzVSTENyd21CSGRURUdx?=
 =?utf-8?B?RFhsbm5iRlJOMDJ1MU5Ya0JSUmFjSU9QQkNXMG1vMHdEM3hTRXBuY3JvMjIx?=
 =?utf-8?B?RGdOa1pTVjlxQnorZEY2RjE3NWRGSkRFcG0yQkZQTjc4MjZBNDZoSWpWYU50?=
 =?utf-8?B?aEErNktiRWMrYWwxRUR6bE9pNjdaUUQzcFVkVk5leElyZTQ2RkdFSmtnMDY5?=
 =?utf-8?B?TFJYU2xuVTV0RjR0NzMzYUpiajFTeUhEK3hpUUcwTEJUOHFlcXFEc1hMK2JS?=
 =?utf-8?B?emJodzFYZWFoeFZRK0owQnlIUWUvSC9JM1E0aE5lMk9oZFhZc0hRRDUzRWdw?=
 =?utf-8?B?REpBcFhkNVhKRk1ObUV0a1U1azl0NFpMK1pXbi9rS1RIcDE2YXZ4R0IvdU04?=
 =?utf-8?B?dzUvb1hpVXNOQjBIR21NRTFnNWJEOW56R0lYTC9sRENxMUJoNTcxb3ZjWmVF?=
 =?utf-8?B?dExKUXNBRzM3K1A3ZnBLbkxZSHFkMWwvZ1diYlF1NkE2eGc4UmlrUjRVZHA3?=
 =?utf-8?B?Z2ZlZWp2WmtwODZ6S2FnRVR1citiR2ZzNHMzK3huVTM2UG5WQnpMRWw0aFZF?=
 =?utf-8?B?YStnQVlpK2RYQkxyWEVIdktHQXZrN1RWbndLRXRhd0VOMFZKWGFUNmlSVmdO?=
 =?utf-8?B?YXY4QVBaOHoxN3dBckg1dm1MVEN0M3NEMjBBS0JqKzEwZWJ6TGM1YnRoZDFX?=
 =?utf-8?B?OXNNMTlIUmFOWGxtbjY3M0NSWEl5Tll6MGV6WnByblhxNEtiUjFkeEVZM3E3?=
 =?utf-8?B?STJMRk4rU010L0NMTjV2dG5SN1M4Q1o1S0FvZHFvR2RXaGtDWjhPMUU5eEF6?=
 =?utf-8?B?SHF1MGluOEhSc1FIU3llR25mL1RadlA5bjNLc3dnN0N1R3V0b2lvaHF0OHZD?=
 =?utf-8?B?UlEvM1JyYUM5dkVsV2tKUlpZanFTTzl2dDdPWVJRZGtPQ2ZqV3F1R3ZxSkFL?=
 =?utf-8?B?YU1wejhLaFNlNXRKekNHMlFJSEdKZmxFRU91ZVU0TDB1YldlVTdJZjZHWklo?=
 =?utf-8?B?bEJpMGFra0tlQ3NGRE1FOWdwbC9IV2ZkVVNjNUhlcDM4a3dYVlRsSkxycEQ3?=
 =?utf-8?B?bXhXVmJlUldxaUdONW5lMG9OcEprVDdoblhSSCszWjMyMGtadlhmNGtlRWZY?=
 =?utf-8?B?MGZxR0tBa1ZyTk1rWUNaNVlEL0VpMXJyWjMvTTVqWUZITCt1ZHVROWV6NER0?=
 =?utf-8?B?TGtpaGRHbWV6RTh2aXRDVkxIVUw4dEE2UExLTlRWZ0x0YUkrcm45dHRLRnpR?=
 =?utf-8?B?ZzQ5eVJsdHBOY3MxYThSUzE2V1hibWZRME8rT2MwS1JaUklIb2l1enhESHV4?=
 =?utf-8?B?V3RWNEJtQUZXQzhyNEoyNmVCM3AwRDJTRHdBZjNBNzBLSlR2dDk0MW1lODlI?=
 =?utf-8?Q?+ohCy04XbFcuffTnzb9rP1DH3hsxTPFr4CgY6Py?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5885aa6-7ded-4ba9-6273-08d9494e1851
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 18:10:01.5198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j38a9YX9VSxiDB/YGp2t0wyOkXRUIj/tbPhs/vdrrIoUGgSoDO1gLl+DL76Ko7NjU4sOPbM3shXseHdQKdl9mDyuTwoG4XtKszx6vRFvSY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1675
X-Proofpoint-ORIG-GUID: YfpZAXh7lJlfENASDw8tCRjAMqYwrc-E
X-Proofpoint-GUID: _ubMnIPnajvcVDKNgtPocBdiuqCa_Zk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-17_07,2021-07-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107170110
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16HI4Ibc015349
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-07-17 9:50 a.m., akuster808 wrote:
>
> On 7/16/21 11:47 AM, Tony Tascioglu wrote:
>> This patch backports the fix for CVE-2021-29477.
>>
>> CVE: CVE-2021-29477
>> Upstream-Status: Backport
>> [https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902=
789d1ef9]
> Thanks for the fixes. Any reason why updating to the latest stable 6.2.4
> is not an option?
> https://raw.githubusercontent.com/redis/redis/6.2/00-RELEASENOTES

This commit adds a public function:

 =C2=A0=C2=A0 1916:void redactClientCommandArgument(client *c, int argc);
in:
https://github.com/redis/redis/commit/875a1f07d821dc5abe737b064018a27bbc71=
75d2

probably not a show stopper but it does affect the API in server.h.

I didn't check the rest of the commit carefully but we really need an=20
API/ABI
checker. I'm not sure how redis clients usually interact with the=20
server, are you?

It would be nice if this site were up to date:
 =C2=A0=C2=A0 https://abi-laboratory.pro/?view=3Dtimeline&l=3Dhiredis

I guess Tony could try the tools that the site points to if
you like Armin.

../Randy


> - Armin
>> An integer overflow bug in Redis version 6.0 or newer could be exploite=
d using
>> the STRALGO LCS command to corrupt the heap and potentially result with=
 remote
>> code execution.
>>
>> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>> ---
>>   .../redis/redis/fix-CVE-2021-29477.patch      | 35 ++++++++++++++++++=
+
>>   meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-=
29477.patch
>>
>> diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.pa=
tch b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>> new file mode 100644
>> index 000000000..a5e5a1ba5
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>> @@ -0,0 +1,35 @@
>> +From f0c5f920d0f88bd8aa376a2c05af4902789d1ef9 Mon Sep 17 00:00:00 2001
>> +From: Oran Agra <oran@redislabs.com>
>> +Date: Mon, 3 May 2021 08:32:31 +0300
>> +Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-29477)
>> +
>> +An integer overflow bug in Redis version 6.0 or newer could be exploit=
ed using
>> +the STRALGO LCS command to corrupt the heap and potentially result wit=
h remote
>> +code execution.
>> +
>> +CVE: CVE-2021-29477
>> +Upstream-Status: Backport
>> +[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af490=
2789d1ef9]
>> +
>> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>> +
>> +---
>> + src/t_string.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/t_string.c b/src/t_string.c
>> +index 9228c5ed0..db6f7042e 100644
>> +--- a/src/t_string.c
>> ++++ b/src/t_string.c
>> +@@ -805,7 +805,7 @@ void stralgoLCS(client *c) {
>> +     /* Setup an uint32_t array to store at LCS[i,j] the length of the
>> +      * LCS A0..i-1, B0..j-1. Note that we have a linear array here, s=
o
>> +      * we index it as LCS[j+(blen+1)*j] */
>> +-    uint32_t *lcs =3D zmalloc((alen+1)*(blen+1)*sizeof(uint32_t));
>> ++    uint32_t *lcs =3D zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32=
_t));
>> +     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
>> +
>> +     /* Start building the LCS table. */
>> +--
>> +2.32.0
>> +
>> diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/re=
cipes-extended/redis/redis_6.2.2.bb
>> index 65b525709..e89bb50f1 100644
>> --- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>> +++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>> @@ -16,6 +16,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.=
tar.gz \
>>              file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>>              file://GNU_SOURCE.patch \
>>              file://0006-Define-correct-gregs-for-RISCV32.patch \
>> +           file://fix-CVE-2021-29477.patch \
>>              "
>>   SRC_URI[sha256sum] =3D "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce4=
2d3017bed6add0b9535"
>>  =20
>>
>>=20
>>

--=20
# Randy MacLeod
# Wind River Linux

