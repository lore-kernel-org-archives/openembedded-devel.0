Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5CEC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 16:43:24 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.53101.1640796203630581618
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 08:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pbEn37bK;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id l10so18969207pgm.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Stpxkt96wzn6tiNaD7LkpI0hmjrD36FFqaWbhdN/Rno=;
        b=pbEn37bK/ZHQgfHZ0eLu2XVozPX9vq7uwcx9Xl6Y+E+ibXWO65C6AYfyjUXhqq3mQh
         uBkWCSAETdzOHmKdn0gT7QMgSFs2ArYvabG+jxjr9PBVbHDguaSNB3zfWxGV4B2yMUh2
         oUGFRdumFg4UWC3cWTyMSZvqX46QSdMp00EOqw28fhpU5j2Q55BoxfAn2SeV8ORBSBMj
         xVXU/FQqak9VGm8lUHRfcZr8kB0P3RsCMtl3rdnV2D7Ft0Wa7gf2+dCbz2MZgZYZcYKT
         YCVGplknwcBVaF678GlFdED8JNY+gOMEL/gcOXiH2LZj+/2c1Whcho8Psfmg9fVOdv2s
         9JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Stpxkt96wzn6tiNaD7LkpI0hmjrD36FFqaWbhdN/Rno=;
        b=4jfpHMZEL54g7ZwsQC3RxPxbNBuzpn2zrKnGd7DNAJiEEfRYAp+jpxe4Npe4OWijh1
         zpQt5TQbtkiTFaNlJ4hVtLGDBAWbsEXV0MjCjKB/+p0u8NtrUeOx/v6O5GpX3G6xABO5
         fTMZIxc9ch3DUsaQaPoHJp8k5Bu4FrxKC0bXLpOUFMyypCFQRLWXYMNOfLC70sCNKJd2
         hdjq8uP4m5pitxEjJfIAajpk0DrSQZptR0RcPbFBsQu4BdSCCYmD8lU++iw7AingEHUc
         imD1rdwkjciu+oAczC4TjSAfsfT3OwieGe2JD15xdJ8fp/JR9iKGs336LUMnNIIbSrTb
         zWUA==
X-Gm-Message-State: AOAM5317FwFY6A/vjZqPw0NTNVvhRNdsM2So2bgxr0PrjuiC5d9oAYje
	aZNpGua7iCL4w4tEBo4Kjy/QLDj6xHM=
X-Google-Smtp-Source: 
 ABdhPJx4tV8H2cv65UUcfSUALK6fxqItGwyBak9oH6TGP8vpCJ8ZnRaByL+UIMF5sRhc61ZZtBbJeQ==
X-Received: by 2002:a05:6a00:244b:b0:4ad:5852:f41d with SMTP id
 d11-20020a056a00244b00b004ad5852f41dmr27873963pfj.29.1640796202606;
        Wed, 29 Dec 2021 08:43:22 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:82f2:91f7:5149:7f46?
 ([2601:202:4180:a5c0:82f2:91f7:5149:7f46])
        by smtp.gmail.com with ESMTPSA id
 f5sm25713590pfc.102.2021.12.29.08.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 08:43:22 -0800 (PST)
Subject: Re: [meta-networking][hardknott][PATCH 00/19] samba: upgrade 4.10.18
 -> 4.14.11
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20211228073806.868759-1-yi.zhao@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <45267446-a992-9705-9b60-edf4f164b818@gmail.com>
Date: Wed, 29 Dec 2021 08:43:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Dec 2021 16:43:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94563



On 12/27/21 11:37 PM, Yi Zhao wrote:
> Upgrade from 4.10.x to 4.14.x to fix CVEs.
>
> The samba 4.10.x is EOL so it can not get the latest CVEs fixes. Previously, we backport patches from upstream to fix the CVEs.
> Unfortunately, for some recent CVEs, it is difficult to backport because there are more than one hundred patches:
> https://git.samba.org/?p=samba.git&a=search&h=refs%2Fheads%2Fv4-14-stable&st=commit&s=CVE

I do understand the rational. This is not a new situation and can be
applied to all supported branches. The issue is this is a large version
jump which is outside the accepted maintenance guidelines. I do not
intend on applying this series to Hardknott. You do have the option of
including this in a special layer.

BR,
Armin
>
> Upgrading to 4.14.x seems to be a better way.
>
>
> Khem Raj (2):
>   libldb: Inherit pkgconfig
>   samba: Inherit pkgconfig
>
> Persian Prince (1):
>   samba: Don't guess dirs for perllocal.pod removing
>
> Yi Zhao (14):
>   libldb: upgrade 1.5.8 -> 2.3.0
>   libparse-yapp-perl: add recipe
>   samba: upgrade 4.10.18 -> 4.14.4
>   samba: update smb.conf
>   samba: disable check fcntl RW_HINTS when configure
>   samba: upgrade 4.14.4 -> 4.14.5
>   samba: fix shebang for pidl
>   samba: add missing runtime dependency for pidl
>   samba: upgrade 4.14.5 -> 4.14.7
>   samba: upgrade 4.14.7 -> 4.14.8
>   libldb: upgrade 2.3.0 -> 2.3.2
>   samba: upgrade 4.14.8 -> 4.14.10
>   samba: add pyldb to rdepends for samba-python3
>   samba: update cross-answers files
>
> wangmy (1):
>   samba: Solve the dependency problem when installing Samba
>
> zhengruoqin (1):
>   samba: upgrade 4.14.10 -> 4.14.11
>
>  .../cross-answers-aarch64.txt                 |   5 +
>  .../cross-answers-aarch64_be.txt              |   5 +
>  .../waf-cross-answers/cross-answers-arm.txt   |   5 +
>  .../waf-cross-answers/cross-answers-armeb.txt |   5 +
>  .../waf-cross-answers/cross-answers-i586.txt  |   5 +
>  .../waf-cross-answers/cross-answers-i686.txt  |   5 +
>  .../waf-cross-answers/cross-answers-mips.txt  |   5 +
>  .../cross-answers-mips64.txt                  |   5 +
>  .../cross-answers-mips64el.txt                |   5 +
>  .../cross-answers-mipsel.txt                  |   5 +
>  .../cross-answers-powerpc.txt                 |   5 +
>  .../cross-answers-powerpc64.txt               |   5 +
>  .../cross-answers-powerpc64le.txt             |   5 +
>  .../cross-answers-riscv32.txt                 |   5 +
>  .../cross-answers-riscv64.txt                 |   5 +
>  .../cross-answers-x86_64.txt                  |   5 +
>  ... 0001-Don-t-check-xsltproc-manpages.patch} |  24 +--
>  ...ipt-Avoid-generating-nested-main-fun.patch |  30 ----
>  ....c-Avoid-nss-function-conflicts-with.patch |  96 ------------
>  ...001-waf-add-support-of-cross_compile.patch |  62 --------
>  ...t-target-module-while-cross-compile.patch} |   8 +-
>  ...ve-__thread-variable-to-global-scope.patch |  58 -------
>  ...-Add-config-option-without-valgrind.patch} |  12 +-
>  ...ions-to-configure-the-use-of-libbsd.patch} |  45 +++---
>  ...5-samba-build-dnsserver_common-code.patch} |  13 +-
>  .../samba/samba/CVE-2020-14318.patch          | 142 ------------------
>  .../samba/samba/CVE-2020-14383.patch          | 112 --------------
>  .../samba/samba/glibc_only.patch              |  28 ----
>  .../samba/samba/iconv-4.7.0.patch             |  25 ---
>  ... samba-fix-musl-lib-without-innetgr.patch} |   0
>  .../recipes-connectivity/samba/samba/smb.conf |  40 ++---
>  .../samba/samba/smb_conf-4.7.0.patch          |  28 ----
>  .../{samba_4.10.18.bb => samba_4.14.11.bb}    |  89 ++++++-----
>  ...t-target-module-while-cross-compile.patch} |  12 +-
>  ...001-waf-add-support-of-cross_compile.patch |  62 --------
>  ...-Add-configure-options-for-packages.patch} |  38 ++---
>  ...> 0003-avoid-openldap-unless-wanted.patch} |  13 +-
>  ...bldb-fix-musl-libc-unkown-type-error.patch |  31 ----
>  .../{libldb_1.5.8.bb => libldb_2.3.2.bb}      |  14 +-
>  .../perl/libparse-yapp-perl_1.21.bb           |  21 +++
>  40 files changed, 254 insertions(+), 829 deletions(-)
>  rename meta-networking/recipes-connectivity/samba/samba/{16-do-not-check-xsltproc-manpages.patch => 0001-Don-t-check-xsltproc-manpages.patch} (77%)
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-waf-add-support-of-cross_compile.patch
>  rename meta-networking/{recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch => recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch} (94%)
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-util_sec.c-Move-__thread-variable-to-global-scope.patch
>  rename meta-networking/recipes-connectivity/samba/samba/{21-add-config-option-without-valgrind.patch => 0003-Add-config-option-without-valgrind.patch} (88%)
>  rename meta-networking/recipes-connectivity/samba/samba/{0001-Add-options-to-configure-the-use-of-libbsd.patch => 0004-Add-options-to-configure-the-use-of-libbsd.patch} (76%)
>  rename meta-networking/recipes-connectivity/samba/samba/{dnsserver-4.7.0.patch => 0005-samba-build-dnsserver_common-code.patch} (55%)
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/iconv-4.7.0.patch
>  rename meta-networking/recipes-connectivity/samba/samba/{0001-samba-fix-musl-lib-without-innetgr.patch => samba-fix-musl-lib-without-innetgr.patch} (100%)
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
>  rename meta-networking/recipes-connectivity/samba/{samba_4.10.18.bb => samba_4.14.11.bb} (83%)
>  rename meta-networking/{recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch => recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch} (90%)
>  delete mode 100644 meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
>  rename meta-networking/recipes-support/libldb/libldb/{options-1.5.4.patch => 0002-ldb-Add-configure-options-for-packages.patch} (90%)
>  rename meta-networking/recipes-support/libldb/libldb/{avoid-openldap-unless-wanted.patch => 0003-avoid-openldap-unless-wanted.patch} (68%)
>  delete mode 100644 meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
>  rename meta-networking/recipes-support/libldb/{libldb_1.5.8.bb => libldb_2.3.2.bb} (84%)
>  create mode 100644 meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
>


