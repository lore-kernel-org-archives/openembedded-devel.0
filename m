Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.43])
 by mx.groups.io with SMTP id smtpd.web11.32933.1585211948054995403
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=j7zBP3uP;
 spf=pass (domain: windriver.com, ip: 40.107.243.43, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2eqc1y+BQpJ0X7XdsKd9oZpqgcjpsfm9cMg6e2IFFzcQxXkkKQT1JrWcfIBX7ctfycierGnnOC4ufdJpVu46sKK2F+vjZoeAquXY9xLbta9LcjnNrzAFVQwafLcZfjzQJM61rwpu5n8TLVJMVi1OzGbyq/l0weK6Z2l9lUEDraeG4jd3hSihbgmV8jaGwmdUA4XgUtpHc6Ux/HWxLbVA2e3JSDFScRea6R+MCJZqOpG3utThrr+ixu9Z4aZJg7v8lOeasgOyywNQzlospsQEq5Y8W5qsbxg4GJmhwXcoJe3DUbgAZVYR/1DL8JtrUS57v7mTq+ok/cH37CSonWnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvInAvj/Mt5jtrLjqH7lkrFCzhilLIjAUrB3zVamX2E=;
 b=SGGt+SjfgZrwmjUbeIPbi9Xy/W3scxg1AY1FcKom87yxmFEOTCsUDJCFsqb6dFLhvRMIbS8EuWiyJblx0+GzvH0PaA27EjqZzLMEhxv6fWd3a/CeO31s4Gt7FssVQjXzpG2QxkLJHj1R1vzLzi78dCUVUPaaRmKWDhRSK44ynAYRmc9cHJOPwciGqIT3VD0RBMsO55VC0Ju6b9mGMvOcmzfWSvri8QykewueE8kBo0AhEEPf9YKYm0wI2bpO0fUCp31j4frvOp6kFd4CrBjStA4T65VHTTEygBwB3h+79L1RcK5w3o4VMlvaFMVofCDzyvQDdfzNG1QPpa1JTMUfOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvInAvj/Mt5jtrLjqH7lkrFCzhilLIjAUrB3zVamX2E=;
 b=j7zBP3uPCNjqtcZNLTTKAjyRr2rE/KfVs+TKwldmZv5YF4q1OkxSRQZJxwdLON02aDlsLfvbnEbZ+CojRnS+3TYU2EuSJg7UNUgXHjE0/zE+g5Zd1dDAUbZYTpmm4DV1aqe1Djw4/WQoD4bFJ6JdA9pkHRdsCrGJ4DfFfUdBsHU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhe.He@windriver.com; 
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SN6PR11MB2720.namprd11.prod.outlook.com (2603:10b6:805:56::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Thu, 26 Mar
 2020 08:39:06 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::d852:181d:278b:ba9d]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::d852:181d:278b:ba9d%5]) with mapi id 15.20.2835.021; Thu, 26 Mar 2020
 08:39:06 +0000
Subject: Re: [oe][meta-oe][PATCH] turbostat: Fix build failure for missing kernel internal heaers and clean up
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <1585133822-167040-1-git-send-email-zhe.he@windriver.com>
 <CAMKF1sqdcGRxKfubhncfxwHRKdcUTRprLsaX9ofhA8m6Bw3HJA@mail.gmail.com>
 <42e3898f-d34a-402a-9934-cf5587e8bce9@windriver.com>
 <CAMKF1srrO=Yf_GwRia86RBOyejxKHWwBuph1K6DPbO_YJL1AOQ@mail.gmail.com>
From: "He Zhe" <zhe.he@windriver.com>
Message-ID: <455aaf4d-1727-3634-3388-8fdb4a41479d@windriver.com>
Date: Thu, 26 Mar 2020 16:38:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CAMKF1srrO=Yf_GwRia86RBOyejxKHWwBuph1K6DPbO_YJL1AOQ@mail.gmail.com>
X-ClientProxiedBy: HK2PR0302CA0008.apcprd03.prod.outlook.com
 (2603:1096:202::18) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.175] (60.247.85.82) by HK2PR0302CA0008.apcprd03.prod.outlook.com (2603:1096:202::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend Transport; Thu, 26 Mar 2020 08:39:05 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3238ccff-4c65-49b7-f659-08d7d1612538
X-MS-TrafficTypeDiagnostic: SN6PR11MB2720:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2720D268C04BD9B7BA17000F8FCF0@SN6PR11MB2720.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0354B4BED2
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(396003)(39850400004)(346002)(366004)(136003)(376002)(478600001)(81166006)(966005)(6706004)(6666004)(2906002)(31686004)(6916009)(36756003)(956004)(53546011)(8676002)(316002)(6486002)(81156014)(16576012)(86362001)(26005)(52116002)(31696002)(2616005)(66946007)(16526019)(186003)(4326008)(5660300002)(66556008)(66476007)(8936002)(78286006);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR11MB2720;H:SN6PR11MB3360.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tYwLJtuCIdG79Iu9X4mtRMVuR62yn6vl1Iq6EQmlaSFHtqW/dIM1AgadueVcqcebINKtjkkwV5gJNENS4nHFIzk3RIVdV+dbneXiyssSd967OE+MGvJCNU8MfHRZN7hFxsOWoFv+2RvVhTLokQpR/axYLsyVLmCgX8ywwU4E6wlC5N+ECkt10s/AjJkPYZjYTziG8778BcSxr1/7D8NHH1EcpoROPwld7GzQY714gl4V6dHKoRkz8j7Bu8NIxGOR6vAS/+F6CXtJDjZ4vm4+DskdNqD7fG4Jme3gcnJ+fgQ/v4MAu4nuQBH09/ZIAnmH2dnsqSDpcgAXo/NBrQCyRu4WsJPN8fQ5qp7GX6YNZnrMNsH+sL6eLL/YKhuYGlNj7Cf21wE61u1Aqk9F10odI9jJ1PbZtFENEGBr00uPuPcQAQxOJoMD9PrgqlWSMFct5Vb+nhiQ5RtqlFCVjx20xhb6g0LWWnooHnc5Q3y21ybgsC2Ucgm74ogCf4Q1BxmQxXd/oP1yv+14QP0X+Gid5FrZK8NaCyF87xWk1fa5zibHZ5M18EprEy+w6gYMHxU9zCgVq72oJJf4xWNeHh4nllTHAP4z6pZcKzACNvcFpg0=
X-MS-Exchange-AntiSpam-MessageData: 
	FRdYKMOtF/CEkubRbyDDt2EaqIYyAtovRSHzxc+CwfvaFDSuGL86kffLTiykCQILtQBHEFMXNLBnnSqlCblCh7yN48+Vjq9NXYSnyDmLK4+8TqOnxp9HO7wr/vh0rEQGhD8ObbaTVXIXHrwMXjEIjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3238ccff-4c65-49b7-f659-08d7d1612538
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2020 08:39:06.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIYoe741bybV4irCJ6bObhSDkIu1bviu+Mr93KjmFEssnXIq/Bvl6WybQLtnThMzKtKWdqfrW+zrK5JqAJyMXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2720
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/26/20 3:38 PM, Khem Raj wrote:
> On Wed, Mar 25, 2020 at 10:11 PM He Zhe <zhe.he@windriver.com> wrote:
>>
>>
>> On 3/25/20 11:30 PM, Khem Raj wrote:
>>> Fails build on qemux86
>>>
>>> https://errors.yoctoproject.org/Errors/Details/398664/
>> Hi Raj,
>>
>> I cannot reproduce this failurewith poky(master branch) + meta-openembedded(master branch).
>>
>> Looking at the reported error,
>> 'TOPDIR/build/tmp/work-shared/qemux86/kernel-source/arch/x86/include/asm/msr-index.h': No such file or directory
>> the TOPDIR, part of STAGING_KERNEL_DIR, is not evaluated, strange.
>>
>> Where can I find the exact reproduction steps? Thanks.
>>
> its listed here http://errors.yoctoproject.org/Errors/Details/398850/
>
> Use master-next branch of poky and MACHINE=qemux86-64

I've tried with the following config,
git://git.yoctoproject.org/poky on master-next
git://git.openembedded.org/meta-openembedded on master-next
MACHINE=qemux86-64

But I still cannot reproduce it. Anything that might still be missing here?

And it seems it's not turbostat's recipe who makes "TOPDIR" not evaluated.


Zhe

>
>> Zhe
>>
>>> On Wed, Mar 25, 2020 at 3:57 AM He Zhe <zhe.he@windriver.com> wrote:
>>>> From: He Zhe <zhe.he@windriver.com>
>>>>
>>>> To fix the following build failures
>>>> turbostat.c:(.text+0xc28a): undefined reference to `UL'
>>>> turbostat.c:33:10: fatal error: sys/capability.h: No such file or directory (for kernel v5.6-rc7)
>>>>
>>>> - Add dependency on libcap for kernel v5.6-rc7 and later versions
>>>> - Copy internal linux/const.h used by previously added internal linux/bits.h
>>>> - Tweak linux/const.h to allow it to refer to uapi const.h, as
>>>>   linux-libc-headers purposely removes _UAPI from the locker macros of the
>>>>   headers
>>>> - Remove -I for kernel-source in EXTRA_OEMAKE, as linux-kernel-headers has
>>>>   provided enough and necessary headers
>>>>
>>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>>> ---
>>>>  meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 8 +++++---
>>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>>>> index 5f6588d..d2694b8 100644
>>>> --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>>>> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>>>> @@ -21,7 +21,7 @@ SRC_URI += "\
>>>>              "
>>>>
>>>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> -DEPENDS = "virtual/kernel"
>>>> +DEPENDS = "virtual/kernel libcap"
>>>>
>>>>  # This looks in S, so we better make sure there's
>>>>  # something in the directory.
>>>> @@ -30,8 +30,7 @@ do_populate_lic[depends] = "${PN}:do_configure"
>>>>
>>>>
>>>>  EXTRA_OEMAKE = '\
>>>> -                CC="${CC}" \
>>>> -               'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
>>>> +                CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}' \
>>>>                 '
>>>>
>>>>  # If we build under STAGING_KERNEL_DIR, source will not be put
>>>> @@ -43,12 +42,15 @@ do_configure_prepend() {
>>>>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
>>>>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
>>>>         cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
>>>> +       cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
>>>>         cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
>>>>         cp -r ${WORKDIR}/COPYING ${S}
>>>>  }
>>>>
>>>>  do_compile() {
>>>>         sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
>>>> +       sed -i 's#<linux/const.h>#"const.h"#' bits.h
>>>> +       sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
>>>>         sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
>>>>         sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
>>>>         sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
>>>> --
>>>> 2.7.4
>>>>
>>>> 

