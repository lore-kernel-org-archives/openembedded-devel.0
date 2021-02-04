Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.82])
 by mx.groups.io with SMTP id smtpd.web10.5888.1612433178390722485
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 02:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LfTz7nq8;
 spf=pass (domain: windriver.com, ip: 40.107.75.82, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJ2M8q8f7jGLO3g/MR+65ik1IvM4l1C13Z247dp2pMVyyIXVHIDw5YgjlyJsWkFEd+y3TBDqUCFH5ab8kfybRFYp7H2CA/pm8UVJvQM3SUAeGym2sP8r1Wrm1xzO026Zvb9ceMQbRozdd+51f3MLKaQnX+x4ZqFY99pzSqxgH85vLpJBwtY0k5oKfHzVBM+tC8uJyx9IR0nB1tZZZUbsUeygSIhhTwhugP0XwaJgnkg1QwH8hLG37tpk7SN6Le9n0gdmdsiMnx/Hnj465nM9ON72MKvf8fxG3P05WHdxwUEmP1L9hGKLcx98nSpVGBmGz2zrBKoZRSoyH08bh83jbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNjyBu4kipprOvmDzYU6TpBHFvFZEorvHlGuAH+u7ck=;
 b=DUBOIh6ThaUOqFiQqNkxf9iQztI0yIKmN/iU1zoKgcFAsd7VG4zqzFuYSJCC4LlsaYIqxw1ejlx2ud8M+rmpG/IhAWH/wAz1wFVUYMBzVpv+0GxASQuEHmiYuGsfv1lViWyiCeCPYQwFVqfvJ50Qr0ICqHUtd/uhiDYEAIfhcxzcopdjSPBsj8aOp/aEOUfxeovHNzINohZFBTFfYGNnvE7azBktFSsS40+dERx0VARml+oJZNWtD0EiFz6G5A5G38G/2s8qOxKgixQbyCjLfFrMsZ31CZ05XYt8+iaVko8wQKjPR1JtE1gAScQMWL94psEO3EcM4aTCbDY4R3GHOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNjyBu4kipprOvmDzYU6TpBHFvFZEorvHlGuAH+u7ck=;
 b=LfTz7nq8ULhi/F1vM1Yi4S+pSdhF5WFc/drthx2GmJYCu5HknoPkEY+DNOyF1pSmWQcCy/tU+itSpb4XHQ86jytbMTho0UeTEG/XhR3AjoQWupAXy/CHT7rVPtDlJqmEO8DYKZcRN2H7KeEH2PTHY/hYrHt7UH7lMNSqQdU9BHM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16; Thu, 4 Feb 2021 10:06:15 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13%4]) with mapi id 15.20.3825.020; Thu, 4 Feb 2021
 10:06:15 +0000
Subject: Re: Help with dealing with autoconf uprev affected packages?
To: Randy MacLeod <randy.macleod@windriver.com>,
 Yi Fan Yu <yifan.yu@windriver.com>, "Chen, Qi" <qi.chen@windriver.com>
CC: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
 <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <5a73bb02-18ae-a7ea-c55b-d650db4d97a1@windriver.com>
Date: Thu, 4 Feb 2021 18:06:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0065.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::29) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.131] (60.247.85.82) by HK0PR01CA0065.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 10:06:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55605c01-5760-46d2-79ce-08d8c8f481f5
X-MS-TrafficTypeDiagnostic: DM6PR11MB3243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3243F99FE9D7441424534A0894B39@DM6PR11MB3243.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uskk1GC7ah8BDhBEardZNkX4RjBfosJTQ778pW/Vl39steuZCaj5F3Ri6m7zPq1TCuHWoxYwLkMwtY+2hLHgYor5ohBe8sqT2V/JE1IL9iFaPbaYyAVZBqQjJt6pyUqrmYDH8g27dniY2AWrNikcwXCjW7v9J8XIiS1hL53Gm6HeJpMlj/4Q5Gqedm8o0mE5Lo8hwB2FBoNAg5hpgb/4P3FwSLHzpnWPZkUt4bid3ufnOwZVWWpzwb/5tQIrZ8KsjaPryY1lVO4qnafeFr496B9GmZ7Dym8y+l95A0h7YB6gaiicl+zPLu3ltpyBZTuvgI/k5Eyq+yDS5EbkUQ7cAAshGFXsuKIHOcea5QoKje5VYAgwWQaF9SYcNoXcbD/IiAZadnNCD4F4HZlgYOQT6OenMtQpRgs9wul8iUQJRhMspmH82R90Gfnd5DSUgVRvg3yfKumFToZ0CjJOzYPV0OhBh4GIsoD5IsmtJ2mvjw63wpFMt51xnUa7ZyP3YG7FXM7r9MglsxgJhrZo7t+xZgWRc7m5hhcUekwmODaHnzzd6TSXZ83HAJiZT7inVAwqLlxEE+Wx0Fs37YDFb807wDBJ9QQC8f0z8Udi6weAiEu8w3OnAmLef8UQmIr/tFsPVZyFmb5s64dHHy7TXEJ8V9caJy3izXu361H0umMKEp+AfJEEm/H6L3mP+IAC7+bw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(136003)(346002)(366004)(5660300002)(6666004)(83380400001)(66946007)(26005)(66476007)(86362001)(4326008)(6706004)(53546011)(36756003)(6636002)(316002)(8936002)(31686004)(2906002)(16576012)(52116002)(966005)(186003)(478600001)(31696002)(956004)(8676002)(16526019)(6486002)(2616005)(44832011)(66556008)(54906003)(110136005)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?IV+L8pRj8VSOosZtKHhmLiay+X3U8sSCtHzTblhXCWHlddbobUdt3hgNCGGl?=
 =?us-ascii?Q?neG88rL0gR1j0khAJTFpvTxUG7ny9xuBasFNk6emV9fJiywWIqLCvdHLGw92?=
 =?us-ascii?Q?AHyOkqS59bfZX0IVVIl07CAcJQej+SQCm2ODeL0/J0Qq+V95u7/xsDGZ0rql?=
 =?us-ascii?Q?TkAtvDvbz7TNijAP1o8O4lUU13YUv7U9IvhY64FPIAwArHDdQBFLJMs9WsE1?=
 =?us-ascii?Q?Np5ruPSh6O8XgNEhsyZomUUnEakl8HKM3RtgD4t1Z20T9mVHjfVRsCyKF0d1?=
 =?us-ascii?Q?z+kuN4dG1OT3x8hstQ7qLNntTo2Rgu9ZZPTW3hcFXyWQsV1G8Mu1ROVLniwJ?=
 =?us-ascii?Q?Nf4CfP1tLPQGXJLcgIsgEwo2MjzNnjhZklBGC5k3jnSwckRk+8ecemBWoXTX?=
 =?us-ascii?Q?OH5f2qDLhNeMAheNfZfUEpGfj/U0brvcryl+zgkTajd1oNuYt0MLoFqruYcJ?=
 =?us-ascii?Q?Csr8EuHAagzoTgh8xl0LjsMg5JptT0cR6jzy9bETowc1xHT0dxrcZW04foQe?=
 =?us-ascii?Q?GVA6cgO7OPKS7yaYfuGJulpykAhu+aA+Cx5LQp8alcAXg4kr3BxjWOOcFDpr?=
 =?us-ascii?Q?p1OdxzdqYnhUVL/OgsXy8xOhnebAJ0zk7zKGZKH7kYzO/IGyCxBeaZCuMaz/?=
 =?us-ascii?Q?EueEumkPsqBe+ZUsLYj5OX1llgp4PmEPQsqRZXg0PjyOdRfNDiCcY5zv+bwI?=
 =?us-ascii?Q?CsJ//oodfBpXuuzX6dIBgJfdv11s2AltUTqSR6yjbwPvCJTdk/tLDD2yd8Eg?=
 =?us-ascii?Q?F0QRCORjOBKYKq4pEkj4ni2/bxVNClkX4j1ortr8YP8AcoWy7xPJwSfPU8p/?=
 =?us-ascii?Q?mID7a4dUW1SFPRwbg1J7XtdvUsQvpCk6CwqD5jAqONojTdsVovgv2EiIJSFE?=
 =?us-ascii?Q?9wCxZe2KjK2eZUPnPeBvFjH77E/WSHUVdLMaDXM6QlLTPya6+SdeO2I5Vwdx?=
 =?us-ascii?Q?5VFufnxepzQ2+wWWAXLzNOJbdEa/E3K67lP7mSJFsiAR5Mgm1dcXFo5B4yTl?=
 =?us-ascii?Q?5HI1d08imrHxp7al3JAxhQCWA8JonzqCXdvbBR4BlqgXr1iup1jge8fMzTK/?=
 =?us-ascii?Q?rMCQlsNh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55605c01-5760-46d2-79ce-08d8c8f481f5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 10:06:15.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OE+1dtkwU7R+qz+CCF7uYB0nMX5D6DirWsucnfsqmJuwxGo7dh4MhJcjTEDTX4bBoKLjyMyGjIK5kCBFO4OtiT9sqz7RWzbvCXeuCHIGLQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3243
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2/3/21 3:17 AM, Randy MacLeod wrote:
> On 2021-02-02 12:11 p.m., Ross Burton wrote:
>> If you have anyone willing to work through some of the recipes in that
>> list then that will be much appreciated.
>>
>> If the issues are not obvious feel free to reach out to me.
>>
>> Ross
>
>
> YiFan, Hongxu, Qi, and anyone else.
>
>
> YP is upreving autoconf to 2.71 in oe-core/master-next
> after ~7 years of using autoconf-2.69!
>
> It breaks a few packages in meta-openembedded and I hear
> from Richard/Ross that usually an uprev will work for both
> the existing version of autoconf and the new version.
>
> Can we split up the list below among the team and do uprevs?
> I have checked the meta-oe list and I don't see any uprevs in the queue.
>
> I'll take libssh2 since I need to move it to oe-core for rust.
>
> We (Wind River) are mainly interested in:
>
> - libssh2 - Randy 1.9.1 is close (days/weeks?) to release:
> https://www.libssh2.org/mail/libssh2-devel-archive-2021-01/0020.shtml
>
> - lksctp-tools
>
Upstream has fixed it, it is easy to fix through backport a patch
> - openldap

Upstream has fixed it, but it is very hard to backport patches,

we have to upgrade it from 2.4.57 to 2.5.0 alpha through git

>
> - freeradius
Upstream is not alive and does not update autoconf to latest
>
> - libmcrypt - YiFan
>
> - iperf3 - YiFan
>
> - spice
>
> - postgresql
>
Upstream is not alive and does not update autoconf to latest

//Hongxu

>
> but given your other work, please consider helping with the other=20
> packages.
>
> This should be easy work and done soon. If there's a problem, reply=20
> all and let
> Ross know what's going wrong.
>
>
> Other packages:
>
> - pidgin
>
> - geany
>
> - npdi
>
> - transmission
>
> - yasm
>
> - hidapi
>
> - libstatgrab
>
> - keepalived
>
>
> ../Randy
>
>
>>
>> On Tue, 2 Feb 2021 at 17:07, Randy MacLeod=20
>> <randy.macleod@windriver.com> wrote:
>>> Khem, Ross,
>>>
>>> Richard mentioned on the YP call that there are some packages in
>>> meta-openembedded that are affected by the autoconf uprev
>>> in master-next.
>>>
>>> Do you need any help fixing/upreving those recipes
>>> from say a WR student or more experienced WR Beijing developers?
>>>
>>> ../Randy
>>>
>>> commit a38a6203b4c584c91fc69c461bb2e1c8f4fcb389 (master-next)
>>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> Date:=C2=A0=C2=A0 Fri Jan 29 10:57:42 2021
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 autoconf: Upgrade 2.70 -> 2.71
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Drop patches backported from autoconf ma=
ster.
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie=20
>>> <richard.purdie@linuxfoundation.org>
>>>
>>>
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/895/s=
teps/12/logs/stdio=20
>>>
>>>
>>> Summary: 18 tasks failed:
>>> .../meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb:do_configure
>>>
>>> .../meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb=
:do_configure=20
>>>
>>> .../meta-oe/recipes-support/openldap/openldap_2.4.57.bb:do_configure
>>> .../meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb:do_configure
>>> .../meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb:do_configure
>>> .../meta-oe/recipes-devtools/geany/geany_1.36.bb:do_configure
>>> .../meta-networking/recipes-support/ntopng/ndpi_3.4.bb:do_configure
>>>
>>> virtual:native:.../meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
configure=20
>>>
>>>
>>> .../meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_co=
nfigure=20
>>>
>>>
>>> .../meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.b=
b:do_configure=20
>>>
>>> =C2=A0=C2=A0=C2=A0 .../meta-oe/recipes-devtools/yasm/yasm_git.bb:do_con=
figure
>>> .../meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb:do_configure
>>> .../meta-oe/recipes-support/hidapi/hidapi_git.bb:do_configure
>>> .../meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb:do_configure
>>> .../meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb:do_configure
>>> .../meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb:do_configu=
re
>>>
>>> .../meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb:do_c=
onfigure=20
>>>
>>> .../meta-networking/recipes-support/spice/spice_git.bb:do_configure
>>> --=20
>>> # Randy MacLeod
>>> # Wind River Linux
>
>

