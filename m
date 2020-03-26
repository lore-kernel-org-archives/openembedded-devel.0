Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.44])
 by mx.groups.io with SMTP id smtpd.web12.31312.1585199461992790852
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 22:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LO+Sfg5O;
 spf=pass (domain: windriver.com, ip: 40.107.94.44, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No2IGvI+O5NBhNcFpbXO11yRFRncv9TM/KMNWM0euRyRnnsbsBvVN/DDPmgXPSgmdwp9ojCpn35j4aDxBba2N2HuhXTciNHiNznFjqx23QqTaGflk2/yqGBGQSDCLnvmpL6+t0D+9AtGav9fPTN+FIG8oT+gD2+0pwcp+Q2iy4j5BIFczIzvf4ZdlxY+zTwB+oY8ZNOMdAJgbUtusm3/fk4U9YlUvMus7S9Dne3LHKzdTmpEsRiL20DiWrgxmGirYJKEaCuorAKOoB31wCHUW/cl6XHdb6i072lqMupQc8DAfIHRk9AxUHmvT1Ka3YCSw0PYBy9BNk6klS4rdLSh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEH9OKCCl/SlS2KojrXI54BdRoRe0kA2UXTOqEPJ/J0=;
 b=ESkTwznm0ZSlq9aqg9bOxq/0VUNnr+F+q0FVqYVKvTtdyUoSdl9sZ6yg0ZclIrBylzl/eW2Tcp8g9XO8u9iXVERDH8itlY0cuYRQOi8SgO8s5LC0wGcq86gx31U4x//ypNrRxejfXzzSTDVjWsVryne0Kb0hHuRCKrebZElzdBfI8JcldvQcKrJtz/aN6BmvtUDBXhY8LbiezR9SyiQ8Us/kM126kVXTkqx5Tg3P3JOSbXLlnmj0wLxG5SJfLlguySWPDzACIUDK2qBb1q0hMhzVk2DH+NLrEENjbocTfjIvICL7UWDHzBwWUkdUgBCbi3cw0K/xyvKaStVCA72BPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEH9OKCCl/SlS2KojrXI54BdRoRe0kA2UXTOqEPJ/J0=;
 b=LO+Sfg5OdrgIDfAdl6AeF2ZGU7gP2e+ITzSieG0mrWqlQhpjbTY2EBHX95oEBW75EW2DaTDrwOxwQqiFUysb+RHYhw/GYsDP5fT6oRtEs6MfGUHBda1W8tZfdR4HUDYbAwfUjka/3FBjR6vRCEejvNtDVcjU4tB2bwi8uSxFEdU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhe.He@windriver.com; 
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SN6PR11MB2847.namprd11.prod.outlook.com (2603:10b6:805:55::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Thu, 26 Mar
 2020 05:11:00 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::d852:181d:278b:ba9d]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::d852:181d:278b:ba9d%5]) with mapi id 15.20.2835.021; Thu, 26 Mar 2020
 05:11:00 +0000
Subject: Re: [oe][meta-oe][PATCH] turbostat: Fix build failure for missing kernel internal heaers and clean up
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <1585133822-167040-1-git-send-email-zhe.he@windriver.com>
 <CAMKF1sqdcGRxKfubhncfxwHRKdcUTRprLsaX9ofhA8m6Bw3HJA@mail.gmail.com>
From: "He Zhe" <zhe.he@windriver.com>
Message-ID: <42e3898f-d34a-402a-9934-cf5587e8bce9@windriver.com>
Date: Thu, 26 Mar 2020 13:10:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CAMKF1sqdcGRxKfubhncfxwHRKdcUTRprLsaX9ofhA8m6Bw3HJA@mail.gmail.com>
X-ClientProxiedBy: BYAPR01CA0038.prod.exchangelabs.com (2603:10b6:a03:94::15)
 To SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.175] (60.247.85.82) by BYAPR01CA0038.prod.exchangelabs.com (2603:10b6:a03:94::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend Transport; Thu, 26 Mar 2020 05:10:59 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90e70cc2-4061-4852-9cc2-08d7d14412da
X-MS-TrafficTypeDiagnostic: SN6PR11MB2847:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2847CB490F3D963C4B600CCB8FCF0@SN6PR11MB2847.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0354B4BED2
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(366004)(8936002)(498600001)(26005)(5660300002)(6486002)(52116002)(966005)(16526019)(186003)(36756003)(31686004)(4326008)(81156014)(2906002)(956004)(2616005)(66556008)(53546011)(16576012)(6916009)(86362001)(31696002)(66476007)(6666004)(8676002)(66946007)(6706004)(81166006)(78286006);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR11MB2847;H:SN6PR11MB3360.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PW2aeCd1tP00r5c4N6eu4mQd+JorztkftyApegKccrWPgmjS6d2lQkd00jrxELCvkq7IVfzaTVSrj3Av9CaqZ4hC8KDEyXaX+2k05LADWEvp1NFalp4qONWHD8ayWBcsAkRFlJp6I34AVFMJO7qVsHPaQQkV9wEgz7g+T0bF0sDkZkzts3ArWbAVihNffUyQTLpc8F5ebgJoaCXxLo2kNcrRy0MjibmEjT5LqbAJ4g2knfYH4Wl5eG//XnyOmFR30zTxRDQ9uPK8vqL99H5ihyEttoREUvqJVTeamxrYE7Pqjt9zSaQ0a63MlvtsVVeRv35QyKhvj5vDC03YcVLjrjyv6oxZl79q9QsxYAUnOgtuY7lUTZfSeAl6OdJMPq+FTKa1JJVVY/Ati6Vwbv6UHD0H1BM2zgxOtlVGUlgjFHyBhodi1FMv2qqSX6plwTDwSIkQNKOoIG9H8khq+lhfj6BgaHumncYMDPZiBNnCRyUHuz1SDxUiwAmHXVcik2cKmv+TO+YY9CEeInq6AF6oVchx/+sAGmAxqKRMDBIsM7i4Td0jNvpgdPwkBX0KEUuzwLedmR+ar4pQtlS4hlSaI276DUKlfCMZE+wfVeAcEdw=
X-MS-Exchange-AntiSpam-MessageData: 
	y9fJmnrlF4RHiAzM2zSpg8IHmOM2lYTSRIvpHmeetOSsjtcLd7qxjGv/noI4ysebB0SV2AyEciFtQ8Xc1UP/OM/jSuet+xa+ivUng9jMZfWD1CVF7dVLaRIM/iSM033gLNjyyIOUX2fW2e3Zzp1Vtw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e70cc2-4061-4852-9cc2-08d7d14412da
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2020 05:11:00.2701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8s0TEPVyLaIOcIropDVOwG35nRWSOdFovMsQ+lLZuQLc/u+7+jJGySnp7YxQmVCMfoH6jGDwzgm+RaxOJA1qpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2847
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/25/20 11:30 PM, Khem Raj wrote:
> Fails build on qemux86
>
> https://errors.yoctoproject.org/Errors/Details/398664/

Hi Raj,

I cannot reproduce this failurewith poky(master branch) + meta-openembedded(master branch).

Looking at the reported error,
'TOPDIR/build/tmp/work-shared/qemux86/kernel-source/arch/x86/include/asm/msr-index.h': No such file or directory
the TOPDIR, part of STAGING_KERNEL_DIR, is not evaluated, strange.

Where can I find the exact reproduction steps? Thanks.

Zhe

>
> On Wed, Mar 25, 2020 at 3:57 AM He Zhe <zhe.he@windriver.com> wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> To fix the following build failures
>> turbostat.c:(.text+0xc28a): undefined reference to `UL'
>> turbostat.c:33:10: fatal error: sys/capability.h: No such file or directory (for kernel v5.6-rc7)
>>
>> - Add dependency on libcap for kernel v5.6-rc7 and later versions
>> - Copy internal linux/const.h used by previously added internal linux/bits.h
>> - Tweak linux/const.h to allow it to refer to uapi const.h, as
>>   linux-libc-headers purposely removes _UAPI from the locker macros of the
>>   headers
>> - Remove -I for kernel-source in EXTRA_OEMAKE, as linux-kernel-headers has
>>   provided enough and necessary headers
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>> index 5f6588d..d2694b8 100644
>> --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>> @@ -21,7 +21,7 @@ SRC_URI += "\
>>              "
>>
>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -DEPENDS = "virtual/kernel"
>> +DEPENDS = "virtual/kernel libcap"
>>
>>  # This looks in S, so we better make sure there's
>>  # something in the directory.
>> @@ -30,8 +30,7 @@ do_populate_lic[depends] = "${PN}:do_configure"
>>
>>
>>  EXTRA_OEMAKE = '\
>> -                CC="${CC}" \
>> -               'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
>> +                CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}' \
>>                 '
>>
>>  # If we build under STAGING_KERNEL_DIR, source will not be put
>> @@ -43,12 +42,15 @@ do_configure_prepend() {
>>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
>>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
>>         cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
>> +       cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
>>         cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
>>         cp -r ${WORKDIR}/COPYING ${S}
>>  }
>>
>>  do_compile() {
>>         sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
>> +       sed -i 's#<linux/const.h>#"const.h"#' bits.h
>> +       sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
>>         sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
>>         sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
>>         sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
>> --
>> 2.7.4
>>
>> 

