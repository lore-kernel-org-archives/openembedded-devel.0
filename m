Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929AEC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 07:40:37 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.38021.1658216435904010961
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 00:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=JzRTcxuL;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.54,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f54.google.com with SMTP id os14so25594416ejb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W+spNk7emEv1WPucWO6t8GLcjs5Qybj3pCnPleXw4R0=;
        b=JzRTcxuLM5Yrfu/hXwgS5DPYusdxNUYEJybVDqa8jmtju8dF16lQrG00Z7AsBM3pDP
         /9GAMwuepOkthoz+ZJi5UTfBdfH4786vNVknxwTn/wvHQXf5VadvUTnBdtGubHGcRdlU
         tX+fKzMWgE4XHsJW0HUVW9J6UE7sy7oOEtmsFCjDmRDt12VEoQvcSptVIhcRr1isNTcx
         r5Z2DNcl2pDYRRDVlp1HM19/XVDnRosR2TjYjeEmoZfY2bKF98o4IXrdDUOK8Rl7uOne
         ZlUKYONMbZVYLjYlsIchlo1BdsPCUeU5V3thVtDIAF+KXEMuePSXiZdy/DyQKD9Hs6qB
         cmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+spNk7emEv1WPucWO6t8GLcjs5Qybj3pCnPleXw4R0=;
        b=KQPwAypZ/VVOmMGlMJcqqilR/W/H7RIaWaNr0i9xcwACBZZvAlJESoLT+QOtTuuWlA
         8Bohelha/OP9i7ItaXCGK17OX3HVhcLi4/UfNXkb2xv3JUgA14lBc0DwaAP5zvNiRMa3
         Bi7BH7WkDp304pFIxg49GPrbgolJjslaeF3n9XbheCLqCEBE1QJ85JyKcQQqKdUySfny
         P9Cj5UcRrKy1tw0JSuermD80dv+o5oSSS2Zt7qFBSexkkPfifsipEAFYpUQejwQFSAzR
         RweDLt+IYvw3eyzQk6RQu44JRvqzVLlCV7ahwRDhLAokxyLMbyIvrYXlCsYgzyxyD0Uk
         MTlw==
X-Gm-Message-State: AJIora811GC0O0qiiIMxLDWUd1uvUfDIvEBYVDlgfWjwmLKyAYsnCpVJ
	FMFxhzBKVqW29zYUCobC5A1My79J/bm2UhnchwTtWw==
X-Google-Smtp-Source: 
 AGRyM1vUx9fh41SUX2mJuXWTWf2qmFI7ScR1/UJE+2dx39YFqy/NN2uky5rGOxK6CfMD83VO8My8xXtN64fzsGNZ+40=
X-Received: by 2002:a17:906:98c8:b0:72b:408f:f499 with SMTP id
 zd8-20020a17090698c800b0072b408ff499mr29261957ejb.736.1658216434034; Tue, 19
 Jul 2022 00:40:34 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
 <YtWrKcR6y1jWSFtC@kudzu.us>
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Jul 2022 09:40:23 +0200
Message-ID: 
 <CAMRc=MecfyMPB2B5ukhYzMdQDWL4fY=8nbfUe0LR_8hUPhNP9w@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Jon Mason <jdmason@kudzu.us>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Jon Mason <jon.mason@arm.com>,
	=?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <elizabeth.flanagan@huawei.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 07:40:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97897

On Tue, Jul 19, 2022 at 12:10 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Jul 18, 2022 at 4:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Can you try something like this
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > index 5d74e4494d..61d5bf6058 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -68,8 +68,7 @@ do_configure () {
> >     # libstdc++ isn't built yet so CXX would error not able to find it
> > which breaks stdc++'s configure
> >     # tests. Create a dummy empty lib for the purposes of configure.
> >     mkdir -p ${WORKDIR}/dummylib
> > -   touch ${WORKDIR}/dummylib/dummylib.c
> > -   ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o
> > ${WORKDIR}/dummylib/libstdc++.so
> > +   ${CC} -nostartfiles -shared -x c /dev/null -o
> > ${WORKDIR}/dummylib/libstdc++.so
> >     for d in libgcc ${RUNTIMETARGET}; do
> >         echo "Configuring $d"
> >         rm -rf ${B}/${TARGET_SYS}/$d/
> >
> >
> > and see if it helps ?
>
> That appears to work for the 2 zephyr machines in meta-arm
>

This still fails for arduino nano 33 ble:

| checking for dirent.h... no
| checking sys/statvfs.h usability... no
| checking sys/statvfs.h presence... no
| checking for sys/statvfs.h... no
| checking utime.h usability... yes
| checking utime.h presence... yes
| checking for utime.h... yes
| checking whether to build Filesystem TS support... no
| checking for struct dirent.d_type... no
| checking for realpath... no
| checking for utimensat... no
| checking for utime... no
| checking for lstat... no
| checking for struct stat.st_mtim.tv_nsec... yes
| checking for fchmod... yes
| checking for fchmodat... yes
| checking for sendfile that can copy files... no
| checking for link... yes
| checking for readlink... yes
| checking for symlink... yes
| checking for truncate... yes
| checking for fdopendir... no
| checking for dirfd... no
| checking for unlinkat... yes
| checking __sync extensions... yes
| checking link.h usability... no
| checking link.h presence... no
| checking for link.h... no
| checking for fcntl... configure: error: Link tests are not allowed
after GCC_NO_EXECUTABLES.
| WARNING: exit code 1 from a shell command.
ERROR: Task (/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_configure)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 795 tasks of which 774 didn't need to
be rerun and 1 failed.

Summary: 1 task failed:
  /home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.

Bart

