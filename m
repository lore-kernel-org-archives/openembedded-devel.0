Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.65])
 by mx.groups.io with SMTP id smtpd.web10.32.1614448728066878169
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Feb 2021 09:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZEwOAobt;
 spf=pass (domain: windriver.com, ip: 40.107.93.65, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlEXM3NFsbmfHHAqIBDCmnHTOXkeYHhfQ9EI2rPYFWmc74CBQhXt92FVNZLxOqaqURt81PEeSx/Rh4HNCn8RyIJk8cqtKc78e4fYtveWNHuDR+byN0fFBY5SnATS/ssHi/ditx7P0eZ4ZGLXqnpT9oExH2b/h8PpHC58GfuiFZOYirU8F35R6bul5ys4fVGZTRj5f7NJQJLX88tH7PfbyW0oJKqAG6N13dGgK7zDc5/rrjD/6i86kJ7Zo8Ilw7OskzflRZR6vhbp1OTzHx2bC9lDiBiYVO2FXaDlk5qUR+X7DQN8ldaDC4NASTVDwhdHa+KaBvigN9Ko6vGluFoYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sl9iVf8oPjrET/Sr8m+l/Hfkir72qqx+UcB4mloidfk=;
 b=afHq/2jD6Ehg8M8YHW2UZ2Lxyk6VNUt4T2g+iQLorOzgyX7osB3Lykv4GHdNXke4usYzLND6x7qxWO5vNoth8cfJr8jkenT0XXZHFENCtIAvj7D3umea9vK+jH4sWS//Or/AD4REGw0TWpDrlpcsG0cTw2GDU9bMCe03FhLDLjlv6Ua0hQ4H+jh5EmZ6lU4bq4igw9iaetcq5YivuYLwm6McGKhrJTjSwKj0T8y8LpVfr94NXLWz8D+Nvm2ko8IfcRJe7r+ASGdN8UNk+8UXiArEU0ftlpGaZwGIqD6zLjw0O+TAFryBETIhUeLaHCgnbLIbTt63sbvTp0/lNbkGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sl9iVf8oPjrET/Sr8m+l/Hfkir72qqx+UcB4mloidfk=;
 b=ZEwOAobtTctTSYDkSdFiZyYaoX6GAobSpvAtfkZIrswGwhNfSiKzTehZQ66kNmabhdumPEOyUSsGMCSM/8Pxg0yiWVxLtFAkb8SUTOA3zBlBVXF8FphLo/GqGfttBSKBHIAXPCqDTX2TS9CKtAFKkjWVz7Oweejmoti3WWRpbiY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sat, 27 Feb
 2021 17:58:45 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3868.035; Sat, 27 Feb 2021
 17:58:45 +0000
Subject: Re: [oe][PATCH] lmbench: Install cache command and fix typos in manual page
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <166650501510A6E8.6890@lists.openembedded.org>
 <168f0c44-2ca5-1d5f-d6c9-df35bcd2e8e0@windriver.com>
 <CAMKF1spZANnZBrPgZ3s9utttRh6YomFymRYBUwY0=Zvvckt8YQ@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <77c22f97-b9ac-7a87-2313-46310146ead5@windriver.com>
Date: Sun, 28 Feb 2021 01:58:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1spZANnZBrPgZ3s9utttRh6YomFymRYBUwY0=Zvvckt8YQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0056.apcprd04.prod.outlook.com
 (2603:1096:202:14::24) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR04CA0056.apcprd04.prod.outlook.com (2603:1096:202:14::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Sat, 27 Feb 2021 17:58:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08a9e91e-51d1-4bca-9662-08d8db495358
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-MS-Exchange-MinimumUrlDomainAge: openembedded.org#6612
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3112E4C463A8D78DE969B0A5E49C9@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yqb0dnvWLggbQf7eR/oW+vsWNnKjSkFvBU4xb6RPHGtVqeE0j1KM4N7R7Ug3sHzCvW9uOCee3G0uY6Ul3tNJox2AIL2UmeGB9Z0CFlZPOl/+Z+PZ+3Um4IaTCRC3/+uns5KoK9jfGpL2ZJ5tUFx89vX8KzSj4QguXR8KXl9r7SHM3tuYgcdUMKvvfQ4o+KCL0W9c5L5iL2KbgiyPcVpRsYkHtL6Ar4KzhUMsIsdC+DdmHI79RhMCgfyDMGnTa4hU/sc2XVye0o8+3JFuSk6wm/dl21rF+Bbst8vojhW27SYhjDaiM0yhVgtI52hc0Q/DpCF5H+/sfmYUv0yhiFhyJsoPkpyTbTrRXo7qoybxJwX3h8pFkXNh3RU52ruuHpxron9aQLSQMlFNpnbAMMwI7tjoeCiYLYwtcPNo9dzDg0wFiJvUs8CI1tEFapAnvRWuMTGgSZsehCQH/NpZvRhBx4Y+he5E1PWVXtUEPz9NTnbF0fF1YCjbBfUA43hObOl3qKxG9KyU5XjHy/4NTtwQ/LlxB+OPncQWbUfW6o/aQ45/BQnL9YeLgQFJ0EjLCKJ0jVvvOdNz2QTGVSl0fM8AsjxFAMkGU5K6R/SN6Y0E6RNy3jRZcg3oZsfhkIeOmWk8LCooliiQI92ijNZHQFyvArGiqdxaJtZoPcspIX8yx6MlBCsE1tJ4UHmCEzEO6PRyrIwEfSLPQm9+a24Y9hK5Lw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39850400004)(376002)(346002)(16526019)(966005)(53546011)(8936002)(478600001)(6666004)(31686004)(186003)(86362001)(2906002)(26005)(316002)(8676002)(4326008)(5660300002)(31696002)(83380400001)(6916009)(16576012)(6706004)(2616005)(956004)(6486002)(66556008)(66476007)(36756003)(52116002)(66946007)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?T1FFTzJ3OU9UYlVhN0x6N0c1YW1SUkJuOVRtb3FUTW45TjI0QmNxWFpHbEVT?=
 =?utf-8?B?b2RNZGRDa01YcVlzK2E1MWhvVkczY0lZcWdPQ2JGeldFemFPZHBhMCtxZHhn?=
 =?utf-8?B?V0J5OWZZRS9KaURtV3Q4dHpUQ09FRzdxTnJ2NmtNemlhcHpGd21vc0swUE0x?=
 =?utf-8?B?VFNzRUhLNnoxeXZUaXFvMDR3OHhPUWRRR0dUbFRFamZldWFOb0M0SFBXRzBM?=
 =?utf-8?B?cDB4Z3ZISGc3UncvbUowbzRqeWo0eHNCcFBleDdzWWJ2QTltSEVpWnM4bFlr?=
 =?utf-8?B?bnRMSWJEckQzTlB5bUtVcEphVUtJQUVPeSsyeWJjU1hXR3Axc2dHTElBQjQ0?=
 =?utf-8?B?aVpBSUZEclFUWkFYUWw4dyt5cXpyMVROV2cvd3NGRzIvWnUxVStjK0EweWRw?=
 =?utf-8?B?aWUvcmdMMGJHcjlrYzZzdlIwaXdCTlN3Y0JZaEt3ZEI1MWgzNzdiN2UvN1Jq?=
 =?utf-8?B?QzNUU1l3T1MxNTE5ZEVqNk8zVFhtRytqOUJHbWVwd1JhN1NCTnZKTmhGKzdY?=
 =?utf-8?B?L3djeFdnYUpFY1dwaVVKNElFLzJwOUNaWGNna25PaG1OWWsvWjRPc3lZcTQ3?=
 =?utf-8?B?cmV3WjdXdXVNRG5VVUxaNWlXSkxYWDRMYm4zQnBkMEpzM2d4WEF0M0NSMUtW?=
 =?utf-8?B?V2pUVGZFbC9WazdtMjZVY0VYMzlTSXZjNGNJVUlEbjQ0SDBWVGIrazd2MXY2?=
 =?utf-8?B?QmhMaXllcFdSWHIvSnlkZVdwL3pwa0tTbG81aEhJOEdkS3NFdFpQWVh4QWVZ?=
 =?utf-8?B?c1Z0VjVYb2FVVTY0ZGNrSThIRXVRR3NKWlFRWlZDNlBqSlFUdW9ZQ3licGYz?=
 =?utf-8?B?ZDRzVGhFbUZiNEgzSXpjdjJ3RkR1T0RmTWpLYm1id2RjdnZTcyt4WXpiRzBL?=
 =?utf-8?B?Y2QxMXlPb1lWb2VLdEN5b1hEQWwxUGlIRjQwUnpXN3J4VWQwcGtoV1FOUzVh?=
 =?utf-8?B?V1R5YTFVSElROFpON1V2T0ptdFlRMUY0NWdTbjQyYkVXSG9lc241OG5rdG5N?=
 =?utf-8?B?Q0FjTzI5N0xyUjBtMngxajZxOFN5VlRFaXMxSUJRdzRNdGRaR2NJN1ZTY1FE?=
 =?utf-8?B?UitHUDEwZjE0QXlKWnFtbGpRd3g4NVdHTkZGYlBieHZkcnRWT3JYZ2ZsTnpQ?=
 =?utf-8?B?YVZJZUVjeVBwTFBjU3BISnRKcFZqTkZkK3pEa0Q5VitHanNRQlBqRWlKbWxY?=
 =?utf-8?B?ZlcrV2IzWkNCQTliQmpINlp6MEhWWmxZaHFmeGlXU2VYTUZCS1NVeVErcjUz?=
 =?utf-8?B?b0FaUVd2aTRmZGVvOGtaa28yMGczSTFEaEoyZGZ2bllTVkRDZHBVZFFwUlFF?=
 =?utf-8?B?Qmk1NFNNWHloQXV2bzRiUWlmNGFhbHEwVGkrR0pTZVR5Q1hyZlNYYkd4ek5I?=
 =?utf-8?B?YS9sc1VTYWpHaEdFaGhuY3NJVmpvQmFrMFdyT0ZsR3dkNmNtcWRSZnkxb0E1?=
 =?utf-8?B?Sy8vMUlMMWlZR3RqT2tsc21nWjJOcHdFaEpYdTBleDlEQ3R0M2RoM0xKRnIx?=
 =?utf-8?B?TXp5SHBmZlIwSThZQXhnUWRLeWg2TFVPclNPRnczMUpuZ0pmVFJLemtRUjd5?=
 =?utf-8?B?c1Uvb3hCbFE0bWZiTnJyREcvTVUzcEJ0amxpR2pKbjVSZVJwYWZKVGZWRFRu?=
 =?utf-8?B?dG5RTTJnNU1EdjhKSFkvT2NKR0xlRm9FMENidXdmbFg5blB3YUMxMzZnTmZE?=
 =?utf-8?B?aEloMllvS09kVTdQOUI4TzZ2amI3UzhydkNUSG9ETTNNejV4N2JWWkdzL3hY?=
 =?utf-8?Q?SASjhQHEmKuDGtjCoJWBWU0mX8vzkbkjJm5WKp1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a9e91e-51d1-4bca-9662-08d8db495358
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2021 17:58:45.4203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1Bet3BMLPOD28hjNTLUlrLrdQpk6t8dy0zl9ePL6926jOS9aKBO/PwR/3N0arHTdajbgTo1Ojcyh/LtaJ21tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/27/21 11:24 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Hi Yanfei
> 
> Please update your copy of master
> Its already applied in master. I usually answer if there is something
> wrong with the patch.
> 
Got it. Many thanks.

//Yanfei
> On Sat, Feb 27, 2021 at 2:18 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>>
>> Ping.
>>
>> Yanfei
>>
>> On 2/23/21 3:36 PM, Xu, Yanfei wrote:
>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>
>>> Cache command was omitted when install, now add it.
>>> Fix a few typos in lat_unix_connect manual page.
>>>
>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>> ---
>>>    ...ypos-in-lat_unix_connect-manual-page.patch | 30 +++++++++++++++++++
>>>    .../lmbench/lmbench_3.0-a9.bb                 |  2 ++
>>>    2 files changed, 32 insertions(+)
>>>    create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
>>>
>>> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
>>> new file mode 100644
>>> index 000000000..d49dac5b2
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
>>> @@ -0,0 +1,30 @@
>>> +From 9bf2b363c5173c03adecf366f116415dbc559017 Mon Sep 17 00:00:00 2001
>>> +From: Yanfei Xu <yanfei.xu@windriver.com>
>>> +Date: Tue, 23 Feb 2021 10:54:26 +0800
>>> +Subject: [PATCH 1/2] doc: Fix typos in lat_unix_connect manual page
>>> +
>>> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>> +---
>>> + doc/lat_unix_connect.8 | 6 +++---
>>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/doc/lat_unix_connect.8 b/doc/lat_unix_connect.8
>>> +index b42e9a4..5ab1a51 100644
>>> +--- a/doc/lat_unix_connect.8
>>> ++++ b/doc/lat_unix_connect.8
>>> +@@ -25,9 +25,9 @@ is a client/server program that measures interprocess
>>> + connection latencies.   The benchmark times the creation and connection of
>>> + an AF_UNIX socket to a local server.
>>> + .LP
>>> +-.B lat_connect
>>> +-has three forms of usage: as a server (-s), as a client (lat_connect),
>>> +-and as a shutdown (lat_connect -S).
>>> ++.B lat_unix_connect
>>> ++has three forms of usage: as a server (-s), as a client (lat_unix_connect),
>>> ++and as a shutdown (lat_unix_connect -S).
>>> + .SH OUTPUT
>>> + The reported time is in microseconds per connection.
>>> + Output format is like so
>>> +--
>>> +2.27.0
>>> +
>>> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
>>> index 21e81ecf2..e9d1067d4 100644
>>> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
>>> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
>>> @@ -29,6 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
>>>               file://0001-lmbench-Point-webpage-lm-to-target-directory.patch \
>>>               file://0001-doc-Fix-typos-in-manual-pages.patch \
>>>               file://0001-lat_fifo-Fix-cleanup-sequence.patch \
>>> +           file://0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch \
>>>               "
>>>    SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
>>>    SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
>>> @@ -73,6 +74,7 @@ do_install () {
>>>                -C src install
>>>        mv ${D}${bindir}/line ${D}${bindir}/lm_line
>>>        install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
>>> +    install -m 0755 ${S}/bin/${TARGET_SYS}/cache ${D}${bindir}/
>>>        sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${BPN},;' \
>>>               -e 's,^CONFIG=.*$,CONFIG=`$SCRIPTSDIR/config`,;' \
>>>               ${D}${bindir}/lmbench-run
>>>
>>>
>>>
>>>
>>>
>>
>> 
>>
