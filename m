Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.59])
 by mx.groups.io with SMTP id smtpd.web11.321.1612293481417466278
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 11:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L6G06z1G;
 spf=pass (domain: windriver.com, ip: 40.107.70.59, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBPy/HjjMJNUEQY+wo+JujtHCHUI30s5/rr+34pAjYxRXkqNVdrwTVbIa7pp3iNrO1+VKOotufNjQLJQkQe/WzHHBqF1EqpUON3zGkfXTb/OnRW4mpHv7RhPkshzeVJkAW13x57D3/0Kwp7AIDOqPVOIVYtX3L03qC34ARbhceLOGHrQchggLuuQhXrYnNgvr6DNhAULIqxEv4EgcMXHyAviWBGn54onhCBRhx/MbjJ4CNJnFFXPqFYU15XABjEQU+q3ScAHkr+Usxj1bJddz7uckuZt15nDyccwxYp8zHYURT+7PvqpEdh7RVmcbUvS/MH9uXQ8za0NPThSkxwWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2S3a1gDUKZRftHAO0Aq9vD5bW7ehdNkQHBhUHGjYq8=;
 b=k5Nr7qGYtycTwhCl2Zs+C8FZd4LFoAywDDMyWlRDmVyDUMHvZu68waWTTFM5slXbFsMy+UKnOR4d2SkHfGBNsKe9W9Jrk06RWOuewD+MG8gfsF+4KBsFJo9p5F366r+4gwG1AIaqfYEfOpUHt3ZCyFj/gGODOFZy/ny2BoY3t/fVQF2/oazfsVkdBHDFk1eKfjY0GNqgHD/Cs+0zbHi8/SVyBFHIgtCaj677uVyHyexTmJeuDlck8oUiZzrfr8Qmcq9xXzUB3UVrz1ag4zRLjgZ86mrM55MHaEQIfpezQpGvJky6MZ+3p9P8NaBC83/TWw1TQVdIKaDcKE8uOc1Jkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2S3a1gDUKZRftHAO0Aq9vD5bW7ehdNkQHBhUHGjYq8=;
 b=L6G06z1GBFCPWu0wmRTeEn4o3gYjGynahAKJldOPuJkoGYYuWTydY6cyZxrA3egy0+zDvFVLumwb9itaGYPe8Luxq7cIOZ6SKtx15KlwYAEFXze0CbyzIg9uhkmDLuglpdW9B6rztPR4HDqz9kjSXqO4zYAfu7TzlbXLDVF7eH8=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2604.namprd11.prod.outlook.com (2603:10b6:5:c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Tue, 2 Feb
 2021 19:17:53 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3805.024; Tue, 2 Feb 2021
 19:17:53 +0000
Subject: Re: Help with dealing with autoconf uprev affected packages?
To: Yi Fan Yu <yifan.yu@windriver.com>, "Jia, Hongxu"
 <Hongxu.Jia@windriver.com>, "Chen, Qi" <qi.chen@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com>
Date: Tue, 2 Feb 2021 14:17:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR04CA0029.namprd04.prod.outlook.com (2603:10b6:a03:40::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Tue, 2 Feb 2021 19:17:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0fa61e3-20e9-4d99-411e-08d8c7af3cf5
X-MS-TrafficTypeDiagnostic: DM6PR11MB2604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2604C3AB2150AD241BDFE9A9F8B59@DM6PR11MB2604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oLhplHi14kCNrfHwuTcMfOQDQGvDVm4k1uepv+OYF4RsfusH09aT+3NC+2BewHgNBJkmFcZbQv3LSp6wEiHC2zbC1b73VC/jQyda+eSyxESRLZ8gMw0oa1wC7cioS1jdA7ORwEGS9WNm1u+A21ua7B+w/1EZ1S/PjVx99bhRkgxro5J54TyCAadzvFQbAugrCOfPZbrEtwR3V4K5NtBY/nK3pTA68bzGuzGrVvWVGQi4gyMQPzmXTP1TF8eIf2U6XFgWoC4XoT8jwsoyKpTq50bZqKQHXH3F+9F71pRCvtOdbB4S8Urnl1OmJSDcfgYpoximV7QPIHQGLlscMjIiOX5dHELhNjGICZSSLmOrhKs+wnTGqBXb9TUnZXsIAQT9mN7olBo17it4mossUxhvXDLZaFj/QxXCR3BquS9p4sEPbRNhk0vFDWufIiBOsT+tYKc9Ns6rodTHL8n4//zio20q0mPPVtHuT87CLH1+aBjvBshkI0KzjBMGpIrxC0znBGzKDv2Zk9YSZPMipQqa54Ff/75dCl/nHf0CLJhbNbuQGHqfkfMnqOwG94HxPSGGOym3MWLLOyy7pScVtLjxOcL3wPxSyxdBrw65GS6j15iOEOKdrtYB7osBfjkgwk5tXhB30LTGoIEugxRmtrbZX7W7bIMI5i79dorY2GbX/Awq2eg9LmzDkdEURltjYLX0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(346002)(366004)(396003)(16526019)(86362001)(66946007)(186003)(966005)(83380400001)(66476007)(66556008)(31696002)(2906002)(52116002)(2616005)(956004)(53546011)(31686004)(26005)(54906003)(316002)(110136005)(16576012)(6636002)(478600001)(8676002)(8936002)(5660300002)(6666004)(4326008)(6486002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dWJ1a0V1M2hKUTA1blB3UHNYSnczdzJNL3dhY28zV0FmK0JZM1N4b0ZpRXBp?=
 =?utf-8?B?Q2dXOGdCNklVNnBFYUlZV3Z5QlVIdlZBdWVyL3RDT2htNDVqSFVQMWNmU2dQ?=
 =?utf-8?B?TVlXanpZcHdUcjNkcVpFRTJ1QTJrUWJVY3UzRlNzSUdFK3Z0elQxcHVSYlls?=
 =?utf-8?B?QlM2TzAvU01tUXpldTBkTThDQi9saVhlNWZLb3RPekxwQ3JsMDhWbmd1Rmdk?=
 =?utf-8?B?OWRMUEY0UEYzOVZtbDFNV3VrVkl6TVNXL2dFVzM0VVpWWldmayt4dnlVY1p3?=
 =?utf-8?B?SnlrdDd1bTVrd3orbGp4Mk1HOE5wbWFVRWtJU2JLR0lxNGRIdG5iVWtVODZs?=
 =?utf-8?B?eXozVzhrV0RrS1RnMzNWdkluTmgvWTBXcjdvZW1DVks3OHNvTHJ2b2daODFm?=
 =?utf-8?B?SWpGUzV0cVBZLy9xUGtTc1ZsTEhwTW9GcC9DTFduYmdPWVZyeGIwdjZBK2Fk?=
 =?utf-8?B?VENZSCsxWVN0c3Z1N3U1bGlIOEsxL3NPVG1mTFBhNzV6WEcwT3RYeFZ3dXBX?=
 =?utf-8?B?Q05yQXZwWU5SN29TQno3ZHdHbEduSzEwQ1B1Z0t2TlVIMFZsSExvbVZieUpj?=
 =?utf-8?B?Y3ZIc0VpL053SFZOQkRrTHFvRGpmSTJnZ1FNTlFzRWRiY0FhNE8wWUd4VDIr?=
 =?utf-8?B?T3NScEVBanJLQ0JjWW05RnBEMkt0RkdHVVhsclh2eGZXeGY4QU9XUFNmOGtW?=
 =?utf-8?B?eUNUNXYzM2gzOVNFN3hSRXFVM3ZFVEMzWWZ5d0Vtc1I5ZWgra1BXbWNGd3Nt?=
 =?utf-8?B?ZEZxeWxDTDVzYnFXaTFmSmgvK2RyWkVaQ2NQTS83Vzl1V051VmxKTHVrK0hG?=
 =?utf-8?B?VE9ZK3J5Nmhpb2JURHdXSGNJSHdvWTh4NC9ObkU3cUhneUtLb1ZnKytSR0ZJ?=
 =?utf-8?B?cXFXVlc3U3VqdGlSL2Y2SzROakphZlBIM2NuMkl6eWdXaWtjUGJpM3JrSnZK?=
 =?utf-8?B?ekNmSzZXN0MvdkFBWkczM3AySlRSWS9lb3JFSUVGK1pCMjR0ancrSHRGZXdz?=
 =?utf-8?B?bVJWNDZNVGppay83amlhNUdVUmswbGZsV1BCUldvdVdnc3htNTEyNDVPTWFQ?=
 =?utf-8?B?NXB2L0F1YU9lMmlDVFZySnJaKzJ0NExWdnh5cUFmQk5SUlg4RUxuVlMvU1lp?=
 =?utf-8?B?ODY2QWFPMUZDQnhHcC81QTM3aktsa3pLWEhKZmVsNXdFdlRpYUZFVGcvbWRT?=
 =?utf-8?B?ZDZlb1lQR1UwL1FuaXl4anMyckdpZkJJVE9LVU1qSWY3RHR4SlM2eXY0aGJV?=
 =?utf-8?B?WmNHa2grT2tXRGZYbVdoM0xjRFhIZ3lXREhFKzFLTXpLTi9OM3RaWVZyam40?=
 =?utf-8?B?Rk80cndYRDdFZlU0RDNUb0hFMVB0amk2V1U3dE5rcVZkclBiS1hmZ0dwbWJL?=
 =?utf-8?B?ZXNYdyszelQyandld2pTNENFMldORGxJRUdRU2JZKytDT0RGenV6SkN1Vnlx?=
 =?utf-8?Q?mQ370p7T?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fa61e3-20e9-4d99-411e-08d8c7af3cf5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 19:17:53.4192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HX6eKUda/Gl0XVlgRCVPikRP6iJaZBXSWNZYgPQlXbkAusnvR4lhxmXP6749DuW2QZQT+dG9umfinSMEFgFoxIkX60QHCAX4dyAR+oVXrY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2604
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-CA

On 2021-02-02 12:11 p.m., Ross Burton wrote:
> If you have anyone willing to work through some of the recipes in that
> list then that will be much appreciated.
>
> If the issues are not obvious feel free to reach out to me.
>
> Ross


YiFan, Hongxu, Qi, and anyone else.


YP is upreving autoconf to 2.71 in oe-core/master-next
after ~7 years of using autoconf-2.69!

It breaks a few packages in meta-openembedded and I hear
from Richard/Ross that usually an uprev will work for both
the existing version of autoconf and the new version.

Can we split up the list below among the team and do uprevs?
I have checked the meta-oe list and I don't see any uprevs in the queue.

I'll take libssh2 since I need to move it to oe-core for rust.

We (Wind River) are mainly interested in:

- libssh2 - Randy 1.9.1 is close (days/weeks?) to release:
https://www.libssh2.org/mail/libssh2-devel-archive-2021-01/0020.shtml

- lksctp-tools

- openldap

- freeradius

- libmcrypt - YiFan

- iperf3 - YiFan

- spice

- postgresql


but given your other work, please consider helping with the other packages.

This should be easy work and done soon. If there's a problem, reply all 
and let
Ross know what's going wrong.


Other packages:

- pidgin

- geany

- npdi

- transmission

- yasm

- hidapi

- libstatgrab

- keepalived


../Randy


>
> On Tue, 2 Feb 2021 at 17:07, Randy MacLeod <randy.macleod@windriver.com> wrote:
>> Khem, Ross,
>>
>> Richard mentioned on the YP call that there are some packages in
>> meta-openembedded that are affected by the autoconf uprev
>> in master-next.
>>
>> Do you need any help fixing/upreving those recipes
>> from say a WR student or more experienced WR Beijing developers?
>>
>> ../Randy
>>
>> commit a38a6203b4c584c91fc69c461bb2e1c8f4fcb389 (master-next)
>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Date:   Fri Jan 29 10:57:42 2021
>>
>>       autoconf: Upgrade 2.70 -> 2.71
>>
>>       Drop patches backported from autoconf master.
>>
>>       Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/895/steps/12/logs/stdio
>>
>> Summary: 18 tasks failed:
>>     .../meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure
>>
>> .../meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb:do_configure
>>     .../meta-oe/recipes-support/openldap/openldap_2.4.57.bb:do_configure
>>     .../meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb:do_configure
>>     .../meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb:do_configure
>>     .../meta-oe/recipes-devtools/geany/geany_1.36.bb:do_configure
>>     .../meta-networking/recipes-support/ntopng/ndpi_3.4.bb:do_configure
>>
>> virtual:native:.../meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure
>>
>> .../meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_configure
>>
>> .../meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb:do_configure
>>     .../meta-oe/recipes-devtools/yasm/yasm_git.bb:do_configure
>>     .../meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb:do_configure
>>     .../meta-oe/recipes-support/hidapi/hidapi_git.bb:do_configure
>>     .../meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb:do_configure
>>     .../meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb:do_configure
>>     .../meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb:do_configure
>>
>> .../meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb:do_configure
>>     .../meta-networking/recipes-support/spice/spice_git.bb:do_configure
>> --
>> # Randy MacLeod
>> # Wind River Linux


-- 
# Randy MacLeod
# Wind River Linux

