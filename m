Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.84])
 by mx.groups.io with SMTP id smtpd.web11.5306.1585281232614154068
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 20:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BdpZy5En;
 spf=pass (domain: windriver.com, ip: 40.107.77.84, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXoNa45c9NBbjOfgKA+5KAp3+HmQuTz+QjwVwK2eZ135TvDVjnJKl7whL682QVm6FOT5RwnXrBwWaX1KsoDeX6y0aNyfLO21GWnJ2GFPd5UVZJl9aVT+liSkP9Lm6k9sg+/8YgpyiszcAAJpyewfAqURZCLwRrPFGIFLRd0QqyN5V6B8lrVDB2uIHX374/r8LI9ZaZOtdw9NdrJZNeexQHusqsS9IdwG/BtIIAYdaQaTuOp4poSIW5Ky4Q8DDriK4tVh7i0Kjzs261f2zFX8ygaG/VvlhYAsoZS0rsKiRDz6QFIYubw27pvI1OAlhb4w8pPBPZHo+tBq11Ya6x2VFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpdwHOf0wcisxkg+Bw6P55PhE9VRI7tDW3p62uWm9Tw=;
 b=fzUmgvFazm8S5rWJlZWWd/TjSXShALnHHtIX0hgYlZLz3r9qZ/Y+uhxayJKTbL06mhFFVtcgFJG2Udlf6fwsoVVaEecYVXvwqe0kT3vWJGzPGsVfH66HpeJduvpa9L1i/9spHbyNR8imUROZ3y3DIJ2DcvNNpOyNxO9g1BSS0YO8Q29RB2QQmEso0ighjgD7rG6SrlQWeqF6Kma9k5QX73OWT/NkSQHfRqnc5X3RMqEzElXruMPBJBK49uilVg9IZDPFpJ37Mq5mtPmDsiqvwAHHAvIJjce6SiBX3u7I4rIPd/8jMdquI4INAhr2sOs0o8dj9sTHHjo/51BmOVFoJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpdwHOf0wcisxkg+Bw6P55PhE9VRI7tDW3p62uWm9Tw=;
 b=BdpZy5EnT5ekP7trZUIK0AKZ5LanDtd5zvyDZxsSPhMdny7iPAH2QZtL0gRFK7ecGDZkkbkTOP1rOtiKuuFJ9f2bx1JnNxO3GiAHExa/C8W682GETB6db2zWjZBVSRq30ONiyABsXxSrOqO83fGiziqZG3KMOk+7PE2Bj4trQRo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhe.He@windriver.com; 
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SN6PR11MB3534.namprd11.prod.outlook.com (2603:10b6:805:d0::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 03:53:50 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::d852:181d:278b:ba9d]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::d852:181d:278b:ba9d%5]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 03:53:50 +0000
Subject: Re: [oe][meta-oe][PATCH] turbostat: Fix build failure for missing kernel internal heaers and clean up
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <1585133822-167040-1-git-send-email-zhe.he@windriver.com>
 <CAMKF1sqdcGRxKfubhncfxwHRKdcUTRprLsaX9ofhA8m6Bw3HJA@mail.gmail.com>
 <42e3898f-d34a-402a-9934-cf5587e8bce9@windriver.com>
 <CAMKF1srrO=Yf_GwRia86RBOyejxKHWwBuph1K6DPbO_YJL1AOQ@mail.gmail.com>
 <455aaf4d-1727-3634-3388-8fdb4a41479d@windriver.com>
 <CAMKF1spbyNWMhnSbdsmHFKEpUk3ysQWP477S0bBaZpF6H1etUA@mail.gmail.com>
From: "He Zhe" <zhe.he@windriver.com>
Message-ID: <b0abef22-325c-801d-d427-c21a43eec6a3@windriver.com>
Date: Fri, 27 Mar 2020 11:53:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CAMKF1spbyNWMhnSbdsmHFKEpUk3ysQWP477S0bBaZpF6H1etUA@mail.gmail.com>
X-ClientProxiedBy: BYAPR08CA0056.namprd08.prod.outlook.com
 (2603:10b6:a03:117::33) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.175] (60.247.85.82) by BYAPR08CA0056.namprd08.prod.outlook.com (2603:10b6:a03:117::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend Transport; Fri, 27 Mar 2020 03:53:49 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30747b3a-d2a1-48d1-77a0-08d7d2027597
X-MS-TrafficTypeDiagnostic: SN6PR11MB3534:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3534F04F11829FD2E36641D18FCC0@SN6PR11MB3534.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(376002)(396003)(346002)(39850400004)(366004)(4326008)(36756003)(66476007)(66556008)(86362001)(316002)(6666004)(66946007)(31686004)(16576012)(81166006)(81156014)(186003)(6486002)(53546011)(5660300002)(966005)(2906002)(478600001)(956004)(6706004)(6916009)(8936002)(31696002)(8676002)(52116002)(2616005)(26005)(16526019)(78286006);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR11MB3534;H:SN6PR11MB3360.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eHhb4G2fCy6ww/pYfv2Pwcd+d2nBmCzzs5svXVSGmp33GVWx4Jo8JRC9INw32FEtAqWRLQQnuE6W6dSqXFgrRNwBqY6Wh82Lsm+R4iOSlglu3UX4zJ5ngbNQyFNJIKP81xPPDh5uX/DTR6O4oVKVrDNs2nNwIHtupgVqWASfzW5wqT+tsfXmy+BWwhcx6gGmn+YIuUIyLrdugmAzaU59ROM++3t4CDxXLaD2jDGEEF0SCiN0IWwCw5DUNGnb8xFevtVb+ZoSJ0SmADsstvTgB169uSCzkK13bW3cqbtYgha2N0WwiD7717sqf+D13s3+88GfQjQC4oNo30LvCalVd3bt3pGSPYijOrVERaHv1k1kShUY1UMFs/X1iFlD2trKY6ECmD5m8yZKuoSO0s41tWfhj3PBNjNfw/XKPURTOobNvvJ8LYjfefjBUdv+Psue5vrRlZxX0k8APKFVdX+TzYSGkiosfdzF8mTPwu46iGUltqVDQ/5waT5PzJ54u0xmynRdRGKLFpnPnOtldf+iF+Lfurxby1s9+RRk71A1kKrMbuORIceK6zPVXh6VBXhSOKdMVThAcqTLAvW3tPX/yqEseZPBdZhdnW6NXtk8mVA=
X-MS-Exchange-AntiSpam-MessageData: 
	dkCCFnXA8MnOVz2yohmCJK+GVN7l19EyFsl9KXi8w6kxGvDWsI/BJp0cnxDFAtqPyiQ8CYnnERioubemwyxQGmGVIqIrDMLFHz1h2fZK6FkDyGeHYu9y4O7IaUUVc+6Nz7yfYV87SZTYfSObknpCLQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30747b3a-d2a1-48d1-77a0-08d7d2027597
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 03:53:50.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 910j1lHjTJNAgWLlf/aXV0IJIMbtuRBo5CK3IqTna9P/f6mMRPkBVljrSQ0KhoPRYuZfI1IsLzQy7q/58WCpQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3534
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/27/20 1:06 AM, Khem Raj wrote:
> On Thu, Mar 26, 2020 at 1:39 AM He Zhe <zhe.he@windriver.com> wrote:
>>
>>
>> On 3/26/20 3:38 PM, Khem Raj wrote:
>>> On Wed, Mar 25, 2020 at 10:11 PM He Zhe <zhe.he@windriver.com> wrote:
>>>>
>>>> On 3/25/20 11:30 PM, Khem Raj wrote:
>>>>> Fails build on qemux86
>>>>>
>>>>> https://errors.yoctoproject.org/Errors/Details/398664/
>>>> Hi Raj,
>>>>
>>>> I cannot reproduce this failurewith poky(master branch) + meta-openembedded(master branch).
>>>>
>>>> Looking at the reported error,
>>>> 'TOPDIR/build/tmp/work-shared/qemux86/kernel-source/arch/x86/include/asm/msr-index.h': No such file or directory
>>>> the TOPDIR, part of STAGING_KERNEL_DIR, is not evaluated, strange.
>>>>
>>>> Where can I find the exact reproduction steps? Thanks.
>>>>
>>> its listed here http://errors.yoctoproject.org/Errors/Details/398850/
>>>
>>> Use master-next branch of poky and MACHINE=qemux86-64
>> I've tried with the following config,
>> git://git.yoctoproject.org/poky on master-next
>> git://git.openembedded.org/meta-openembedded on master-next
>> MACHINE=qemux86-64
>>
>> But I still cannot reproduce it. Anything that might still be missing here?
>>
>> And it seems it's not turbostat's recipe who makes "TOPDIR" not evaluated.
>>
> TOPDIR in those logs is a replacement to hide the build paths by error
> server. Don't get confused by it.
> can you try this
>
> bitbake turbostat && rm -rf build/tmp && bitbake -ccleansstate
> turbostat && bitbake turbostat

Thanks, I really didn't run these steps.

v2 will be sent.

Zhe

>
>> Zhe
>>
>>>> Zhe
>>>>
>>>>> On Wed, Mar 25, 2020 at 3:57 AM He Zhe <zhe.he@windriver.com> wrote:
>>>>>> From: He Zhe <zhe.he@windriver.com>
>>>>>>
>>>>>> To fix the following build failures
>>>>>> turbostat.c:(.text+0xc28a): undefined reference to `UL'
>>>>>> turbostat.c:33:10: fatal error: sys/capability.h: No such file or directory (for kernel v5.6-rc7)
>>>>>>
>>>>>> - Add dependency on libcap for kernel v5.6-rc7 and later versions
>>>>>> - Copy internal linux/const.h used by previously added internal linux/bits.h
>>>>>> - Tweak linux/const.h to allow it to refer to uapi const.h, as
>>>>>>   linux-libc-headers purposely removes _UAPI from the locker macros of the
>>>>>>   headers
>>>>>> - Remove -I for kernel-source in EXTRA_OEMAKE, as linux-kernel-headers has
>>>>>>   provided enough and necessary headers
>>>>>>
>>>>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>>>>> ---
>>>>>>  meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 8 +++++---
>>>>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>>>>>> index 5f6588d..d2694b8 100644
>>>>>> --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>>>>>> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>>>>>> @@ -21,7 +21,7 @@ SRC_URI += "\
>>>>>>              "
>>>>>>
>>>>>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>>> -DEPENDS = "virtual/kernel"
>>>>>> +DEPENDS = "virtual/kernel libcap"
>>>>>>
>>>>>>  # This looks in S, so we better make sure there's
>>>>>>  # something in the directory.
>>>>>> @@ -30,8 +30,7 @@ do_populate_lic[depends] = "${PN}:do_configure"
>>>>>>
>>>>>>
>>>>>>  EXTRA_OEMAKE = '\
>>>>>> -                CC="${CC}" \
>>>>>> -               'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
>>>>>> +                CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}' \
>>>>>>                 '
>>>>>>
>>>>>>  # If we build under STAGING_KERNEL_DIR, source will not be put
>>>>>> @@ -43,12 +42,15 @@ do_configure_prepend() {
>>>>>>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
>>>>>>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
>>>>>>         cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
>>>>>> +       cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
>>>>>>         cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
>>>>>>         cp -r ${WORKDIR}/COPYING ${S}
>>>>>>  }
>>>>>>
>>>>>>  do_compile() {
>>>>>>         sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
>>>>>> +       sed -i 's#<linux/const.h>#"const.h"#' bits.h
>>>>>> +       sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
>>>>>>         sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
>>>>>>         sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
>>>>>>         sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
>>>>>> --
>>>>>> 2.7.4
>>>>>>
>>>>>> 

