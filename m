Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 137C27992A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2018 08:14:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8F8F0iR021180
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 15 Sep 2018 01:15:00 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 15 Sep 2018 01:14:47 -0700
To: Andrea Adami <andrea.adami@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1536948135-11493-1-git-send-email-andrea.adami@gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <e7e25946-8c75-4cd6-9b1b-3aaa6fdd4a5b@windriver.com>
Date: Sat, 15 Sep 2018 16:14:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536948135-11493-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [meta-initramfs][PATCH v2] klibc: fix build on i386 with GCC and security flags enabled
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Sep 2018 08:15:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月15日 02:02, Andrea Adami wrote:
> ld fails if distro's security-flags are enabled:
> Inject the SECURITY_XFLAGS if security_flags.inc was included.
>
> Fix on i386: ld: discarded output section: `.got.plt'
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>   meta-initramfs/recipes-devtools/klibc/klibc.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index 3d25e96..837b026 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -47,7 +47,8 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
>                   'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
>                    V=1 \
>                   "
> -EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack" EXTRA_KLIBCLDFLAGS="-z noexecstack"'
> +EXTRA_OEMAKE += "'EXTRA_KLIBCAFLAGS=${SECURITY_CFLAGS} -Wa,--noexecstack' \
> +                 'EXTRA_KLIBCLDFLAGS=${SECURITY_LDFLAGS} -z noexecstack'"
>   
Is it necessary to pass SECURITY_XFLAGS directly? While including 
security_flags.inc,
CC will contain SECURITY_CFLAGS and LDFLAGS will contain SECURITY_LDFLAGS.
Maybe you should make sure  to pass LDFLAGS to EXTRA_KLIBCLDFLAGS to avoid
ldflags qa warning.

[security_flags.inc]
  58 TARGET_CC_ARCH_append_class-target = " ${SECURITY_CFLAGS}"
  59 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
[security_flags.inc]

>   export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
>   KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
> @@ -74,5 +75,4 @@ KLIBC_ARCH_powerpc = "ppc"
>   KLIBC_ARCH_powerpc64 = "ppc64"
>   THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
>   
> -SECURITY_CFLAGS = "-fno-PIE -no-pie"
> -SECURITY_LDFLAGS = "-no-pie"
> +SECURITY_LDFLAGS = "${@'-z relro -z now -pie' if '${GCCPIE}' else ''}"

The same reason, it is not necessary to test GCCPIE,

and it missed "-Wl,"?, how about directly set SECURITY_STACK_PROTECTOR = ""


//Hongxu


