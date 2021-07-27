Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1262.1627392943836097040
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jul 2021 06:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=nHvM4Kk0;
 spf=permerror, err=parse error for token &{10 18 testsso.windriver.com}: permanent DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=284255f135=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16RAt9A3018072
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jul 2021 06:35:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Kor5CMgvykQbs8P53/8POtu29NWYHQT4ls4WgsJpp7M=;
 b=nHvM4Kk02QSqt+5iNY2Omx9sIoo/Wub4/JS7MJwQr0yIrsr5lUX3hD9g386fCI1uEvNQ
 26G6H0UeoTs0DrQHXcvS987LIwkj6VGFpasUCYH9ElITdEi3kSVePZzBe20W6lTqpavN
 gXJnTIFqlJ2xUquwbBPOapFOGWt5ANoofXaccrYByuKDR1ydDM50Nm6bbtngpy6JxvMo
 1pox0JYkcshV/JK/aT3p7hRRBtzXl8KoRBEzPyyMqtgTcVPjCuqJMw6/u3DLJHaBxrAA
 ZnMfC7X1v4MNupGLQ9ewabmvUWC5JPr9THYfBBkFudZq51c/6YTIvpwm0Ll+yLfHN+Bx FA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a23558jkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jul 2021 06:35:43 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16RDZgo1011439
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jul 2021 06:35:42 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a23558jka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jul 2021 06:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nihSHGneQWtL/4shW2boVyC2Pp1XrbDOxud1TfQt9i69Ih4gkrwbctKtFih2+bDnBrLfn3FVF7GDSoHyYLiH9ShswJNsyBn31FFfiuFm1B9p75E0jhDToEV+EGRzPYNbpCi5PwgtNC5kGbt1yivt5QAML2aLkHgAOtUN/FleceYVifV+Ax77vo3G1RmLN3ZUa06O3Jab4a7hD/JKHllh3Rw/GXJcZsvR4x6sZKXcTUKzRmYksQGS7hGVjdCYhTXFh3iS7xT6X/dMca9JYtcplzQvKDjX9PgMgY8Ng2KV0SeE4JVCEgu5QmVOQdhpVdYv0cmygNjNZYwVZa1ioagVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kor5CMgvykQbs8P53/8POtu29NWYHQT4ls4WgsJpp7M=;
 b=WBKmUp8ChbeQm5IbUxLVOiDnlk75YQ4JGl+I/Xue5xQOSiIm4HZqfLTq9J+dSv3XBJQ6rm0cRLJ0PsrNLm+BoYXFE8SnAoS+XoEySPMkfMZHTqdEIdiuN+4yGjwhA562H7cH+zhKlryi51UUhwItMWti+755KoOdR6mPQW4X53gd/NOByBFAxXn9WDKE4IRgCE9k7E+hPaoJrokeRB+LFiIrDC6KE8s7Mint7a1cVpJqwhTrUtkLY9brNKi81bUb9p5DlQgTsCrGybMh1z27LpDO5XQOcP47ndtE2bm4JGZj8hFtmn7RUsANT8Vn49eKJR/fZCctsV9oK6zZ9qe5ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 13:35:41 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579%6]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 13:35:41 +0000
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/2] redis: fix CVE-2021-29477
To: akuster808 <akuster808@gmail.com>,
        Tony Tascioglu <tony.tascioglu@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20210716184733.37797-1-tony.tascioglu@windriver.com>
 <106d037b-ffac-beae-e65c-845e99742c86@gmail.com>
 <a3b8968d-140c-68a7-2704-7a9b3b54f164@windriver.com>
 <cb5a4f2d-c3fc-23e7-64cf-c8ad9daf1fe6@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <a61803b6-5db1-5f9c-ba04-8af0d8b3f24f@windriver.com>
Date: Tue, 27 Jul 2021 09:35:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <cb5a4f2d-c3fc-23e7-64cf-c8ad9daf1fe6@gmail.com>
X-ClientProxiedBy: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR08CA0017.namprd08.prod.outlook.com (2603:10b6:a03:100::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend Transport; Tue, 27 Jul 2021 13:35:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74bc0622-83d4-429d-cacd-08d951036d5c
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB28594A1BA17043056EA5D6BDF8E99@DM6PR11MB2859.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9lqAosRRrmOfKrBTshIlTPhdnxu5UWrgk8jM/ofCBZ3lM7NW75yLued1BXZNFBAtJeOd4L9D/pSpkzaruYdCxJtbiZ59If8NPWTs4qaT+lFCuHcjkTSyRjE9AkghZNV9fs1jtPiedmoC7TYGGRZ2HShrreXOZSXKg1PyVqaZ6exVHWMlk1uyUY2Fq03osmyvZO30BZMEFtZGJNL24kZ/lfBerpJksHjd9wv+FUej0v8Cxyma1LrqGEBNrdYFW3KeWxGFU3/qBsko7griF0+oGeMv5qC5N7C3+GiH4SlzuPh+k9fP/rhYM3GqulQhxQY2NQWcjLMzNRa+b20MRiuzHIhWusxdCD0mNoHrhGzKWClaoXa2t/c3ZRIYiFOQztQ8DKuGXIgZFBPnz7gJGNLniIXHLahL+UQSZBPqCuxhSTpwTW7DoxgUV5eEswX1xQ+5bi1CgsYGkrUgX44xuELfrZL3FEYtsMK7/93j9xXsgzrgFeavphZ6T5BzLvkoRzlqXZS9i5tkGyB0/5xauJF/uGaARX8toS9chIa8Lc8e8r83hRRgKL8RIUjnngo8Kqs2ymyoub41TBuZZuXs3kQxdGCzCUtI43CuiouO8VCEoD6zy9y89pdtwkjqFiN6anSEQozAJbaujvpffQXJYHwEPtPlec4yjv8iCP5fYdj9YZNoWBYmpkQ9+I9Pl+zWUu5A8G75nKaF/oaupjADEIWKmTEl2TnbWrxJ2rzfrDofW5zcGd8DabehJKo4ayKtWcC7SbdpWHNjtzJEQ+O5Qu5Cc0cFSKjdrP5ddUv+9VN+b5jfqw+ae7hM2NlrJheqZdo25lblAVTUQe5xQiHng8UfFohP2AKMu5qn/7stoAuUzw8Ol95PU9rfFv6+KWVdfyF7mLNV8QftYbcp/WdcF2L7dQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39850400004)(366004)(31696002)(38100700002)(966005)(66556008)(31686004)(956004)(26005)(316002)(83380400001)(53546011)(36756003)(5660300002)(8936002)(8676002)(38350700002)(6486002)(6666004)(66476007)(52116002)(86362001)(110136005)(16576012)(66946007)(2616005)(478600001)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NU5DN0xWUzFiLzFETzhDN1dOYVN3M3l5Rjg0Y1ljU3ZPdmQwVlVPYnJ6dGZW?=
 =?utf-8?B?ckVPeXdOWXhuK3hvc1pYa1Z1VE1pREZxS2ZMVnRWTXlJaGFXQXNpMXNqdE85?=
 =?utf-8?B?WUNJMWNxVjc4b1d4SjEyM01sUXU3RWtKVTdvY3B6RFA2ZGhpTTRmSE5vbkJV?=
 =?utf-8?B?ZlRFK3ZzMWdhbTU1eEVScXliQndYeGpzWXhaZzJHaThDa0xTMHh0Y3NDMUNl?=
 =?utf-8?B?NkRZbGp0MzlRd1pMZWVFVkNHRmk0V1lPd2VEZlJOV0NWZk1UNnovRXJYbFVD?=
 =?utf-8?B?YjJocDhKT2xEV2VhVFFOZzlvZ0tZc1JOUndhZEZiWXptMlFzUVYyVWhCYXds?=
 =?utf-8?B?Uzk0Y3RjNGFlY2IrcjREWk9yclc5OEU5ZTBYVWoweXhBMXFoQUlibkg3cWxr?=
 =?utf-8?B?UXN3cndHL002RXI2UTVJeDhpdGI4VSt4VXI2cVN1Uk1sdGVRZnJRM2VndW5J?=
 =?utf-8?B?QnluejBoYktiSXBPOTRYT2JieU82WVVaRlgzL2JpN1hic1dBTGtFNWVpYVND?=
 =?utf-8?B?TW1QNkI1OXRvVGFMV0dtWE8wakgyZDBhQ0NBTGV0d3FjRlZQV0lEZ0JWQ2FM?=
 =?utf-8?B?bEUzZHErZFpuSHliQ0gzUDNyNGNoVzdiRGR5bk9WYTA0RXZuZ0pJQm44ZlZ4?=
 =?utf-8?B?OWkrZ1NLMlp0RFE0YzNBZ21jR21laHlrM0p1ODkwRkpKK282YTVvSFRjRkdt?=
 =?utf-8?B?NHRrMkFueW5NUDRWVTdoSzM1UVVqS0M1ZnRDRFc1TmRaZlI1S1RwMkZMSkpx?=
 =?utf-8?B?QUhjNFNRQ0FSL0dOSmxWTW5ZR0hkMnUvK09xTkFLRnk5Q1QwYTlzSkRiMHp3?=
 =?utf-8?B?L0hhNWZaTk13NXhqZVpOazFzbmJ1T0dJYjdsNjlJNWE5RndFWU9taG8xSU1S?=
 =?utf-8?B?UzlaSXVSdHFOV0dLeE1tY1hQMkgrQVFFMmtRSEN5K3RVcUh0dWxrelNVbFRS?=
 =?utf-8?B?V2Q2UGN3WllsVWdYOTE1MGFoUFRSYUtmRng2RmFmazFqbTcrRWZvYmZydkVM?=
 =?utf-8?B?Wm1meWF1UDY4eFFDTUFjRFJJTFhhdFplc0dIQmxCQTAySytTQXJmV2FjVm1y?=
 =?utf-8?B?dWxwdlRuVDRMcEl3TFVZTXdwWU9jemtxTnJKNng5c3Z4a21kNXVqVkVBcFlr?=
 =?utf-8?B?UDVHdkVndGtQY016VGNxWUhtYTdFOVgyblQvYUNTUUhwQzlWNTQwdExvQUlC?=
 =?utf-8?B?MDFIbmx2eTIwOUJ0SDRUY0xaaVZFMTgyUHRBUWEwRUpmRU5YVDV5dVVQWCty?=
 =?utf-8?B?T2dEYkhhc0Q3QkNwQ1dvaHlLcC9ITGsxN0xjYVNCdkoyZjFBaUEzTVNTa2Nq?=
 =?utf-8?B?d080bDIxWEZaRUp6S1dLbUY3K3htSHBlSXJQTEN0ZlNqcWgrNGRYcTZnNS8x?=
 =?utf-8?B?NVVKRDY4b1J2OUhWSTkwTm9iMXQyN2YwbWRrWS9mbXMxS2xkL0hnTitIQ1FX?=
 =?utf-8?B?ZGV4UUozcEhRQld4cGh4RVRLUHk0c0lUamNNUDMyeDZvelZiY1V1TU9IcFZt?=
 =?utf-8?B?U3l5S082Rm5sNWpROEZtSTJIQS8wblZWSTd3TWMzT3lzeEY0ZFFkeTZPWm82?=
 =?utf-8?B?Y285SmVIcGtvdGhNOU10dEV2WjRhWE41NUp3MW5UdTNDVFlnZTZ3TmoyRzJU?=
 =?utf-8?B?NVVJNyt4alRheng0K3h2cVB3ejZ6cnRzcUM1bDF4TW0xMTQ1bEJzTEszSks1?=
 =?utf-8?B?ZmhrWW96SGovTkFiM1l1bS9vV3NWaGFMVDVXKzlyM0hhZXpXZGxnYmZKUWt1?=
 =?utf-8?Q?xxjzv764E1ildDDSWL9qL5sI1oBsn6PeVNKAayi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bc0622-83d4-429d-cacd-08d951036d5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 13:35:41.2374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZngajuV0uHaN7d7wkE6YMIkwqfFhzGl2F7ir4E/gsroHRB0h12mYm+xOnLL/sgyYEEBAM0ClTzXxiLlOXr4okPKv0207vBkltyy0vbUbu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2859
X-Proofpoint-ORIG-GUID: lsVhdLrQ31BDJUgO5H4JG2_sCF9HDFaA
X-Proofpoint-GUID: doCvjc5qnqj8ezo-zcxN0XyqwqOXzYFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-27_10,2021-07-27_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107270080
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16RAt9A3018072
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-07-17 7:12 p.m., akuster808 wrote:
>=20
>=20
> On 7/17/21 11:09 AM, Randy MacLeod wrote:
>> On 2021-07-17 9:50 a.m., akuster808 wrote:
>>>
>>> On 7/16/21 11:47 AM, Tony Tascioglu wrote:
>>>> This patch backports the fix for CVE-2021-29477.
>>>>
>>>> CVE: CVE-2021-29477
>>>> Upstream-Status: Backport
>>>> [https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af49=
02789d1ef9]
>>>>
>>> Thanks for the fixes. Any reason why updating to the latest stable 6.2=
.4
>>> is not an option?
>>> https://raw.githubusercontent.com/redis/redis/6.2/00-RELEASENOTES
>>
>> This commit adds a public function:
>>
>>  =C2=A0=C2=A0 1916:void redactClientCommandArgument(client *c, int argc=
);
>> in:
>> https://github.com/redis/redis/commit/875a1f07d821dc5abe737b064018a27bb=
c7175d2
>>
>>
>> probably not a show stopper but it does affect the API in server.h.
>>
>> I didn't check the rest of the commit carefully but we really need an
>> API/ABI
>> checker. I'm not sure how redis clients usually interact with the
>> server, are you?
>>
>> It would be nice if this site were up to date:
>>  =C2=A0=C2=A0 https://abi-laboratory.pro/?view=3Dtimeline&l=3Dhiredis
>>
>> I guess Tony could try the tools that the site points to if
>> you like Armin.
>=20
> Thanks for the info. Patches in this case are appropriate.
>=20
> - Armin

Ping? I don't see this in hardknott yet...
../Randy

>>
>> ../Randy
>>
>>
>>> - Armin
>>>> An integer overflow bug in Redis version 6.0 or newer could be
>>>> exploited using
>>>> the STRALGO LCS command to corrupt the heap and potentially result
>>>> with remote
>>>> code execution.
>>>>
>>>> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>>>> ---
>>>>  =C2=A0 .../redis/redis/fix-CVE-2021-29477.patch=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 | 35
>>>> +++++++++++++++++++
>>>>  =C2=A0 meta-oe/recipes-extended/redis/redis_6.2.2.bb |=C2=A0 1 +
>>>>  =C2=A0 2 files changed, 36 insertions(+)
>>>>  =C2=A0 create mode 100644
>>>> meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>>>
>>>> diff --git
>>>> a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>>> b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>>> new file mode 100644
>>>> index 000000000..a5e5a1ba5
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>>> @@ -0,0 +1,35 @@
>>>> +From f0c5f920d0f88bd8aa376a2c05af4902789d1ef9 Mon Sep 17 00:00:00 20=
01
>>>> +From: Oran Agra <oran@redislabs.com>
>>>> +Date: Mon, 3 May 2021 08:32:31 +0300
>>>> +Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-29477=
)
>>>> +
>>>> +An integer overflow bug in Redis version 6.0 or newer could be
>>>> exploited using
>>>> +the STRALGO LCS command to corrupt the heap and potentially result
>>>> with remote
>>>> +code execution.
>>>> +
>>>> +CVE: CVE-2021-29477
>>>> +Upstream-Status: Backport
>>>> +[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4=
902789d1ef9]
>>>>
>>>> +
>>>> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>>>> +
>>>> +---
>>>> + src/t_string.c | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/src/t_string.c b/src/t_string.c
>>>> +index 9228c5ed0..db6f7042e 100644
>>>> +--- a/src/t_string.c
>>>> ++++ b/src/t_string.c
>>>> +@@ -805,7 +805,7 @@ void stralgoLCS(client *c) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup an uint32_t array to store at LCS[=
i,j] the length of the
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * LCS A0..i-1, B0..j-1. Note that we =
have a linear array
>>>> here, so
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we index it as LCS[j+(blen+1)*j] */
>>>> +-=C2=A0=C2=A0=C2=A0 uint32_t *lcs =3D zmalloc((alen+1)*(blen+1)*size=
of(uint32_t));
>>>> ++=C2=A0=C2=A0=C2=A0 uint32_t *lcs =3D
>>>> zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* Start building the LCS table. */
>>>> +--
>>>> +2.32.0
>>>> +
>>>> diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>>> b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>>> index 65b525709..e89bb50f1 100644
>>>> --- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>>> +++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>>> @@ -16,6 +16,7 @@ SRC_URI =3D
>>>> "http://download.redis.io/releases/${BP}.tar.gz \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 file://GNU_SOURCE.patch \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 file://0006-Define-correct-gregs-for-RISCV32.patch \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://=
fix-CVE-2021-29477.patch \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "
>>>>  =C2=A0 SRC_URI[sha256sum] =3D
>>>> "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
>>>>  =20
>>>>=20
>>>>
>>
>=20


--=20
# Randy MacLeod
# Wind River Linux
