Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B60C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 05:04:35 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.45786.1653973462916129988
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 22:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BKX/BES0;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id f35so12550438qtb.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 22:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rjoB63hROCMfQKf4mw5fzfa4Ou7WeUsjo5u2BFBFDrk=;
        b=BKX/BES00Iukruyl8mi4RdoXNQp72BthtDzVjJCTwIaZs/SEHqJu05ZEE/WG9clWkX
         ilvOXjmORKOa/DJJas5agTMUFVTLC13eJCmaQWb5fP0I7RnMl8oYX4CgtkgHxohkMGXC
         RVoo+tk2nRMbf5TbKPlfPcAUPExFMr0wXzclqFUINoaiwvuDnmQv7Pr7gKvvFabaKRkV
         oQV9WAKY0V8XPaWqTwAYReIYeq5cF8ZaTwD4lDlgMFrPyBs0uouZOIVPZz1je9QB1RcW
         QhYLZ4Dgx1cN8k4aBi4sWaCNqLaLvEiPTwKfBQPsCe+XzzvQgXBik0ilix1UatxAiLf0
         T5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rjoB63hROCMfQKf4mw5fzfa4Ou7WeUsjo5u2BFBFDrk=;
        b=QkLExeNOeNSdic3tLUOxUEr2nJUc51Q3PS5tz+jFIH1PbBP++1QGhMfYYzlM1JqIrp
         C/mcSFCb+Yah7aq83JIxtJzQqER8x/pbIaHgKYXGXL3nO0JqmOoXIceS/QR9/vPohMy7
         MdJz4177428Hdk73toeh9VhICpnVVmVxEN9A0yNzAZC/L8oY0B9mvh+HpSP94PBKydtS
         1RBhAwvtLla5DVjgxWpgP6GrSNiWCOrlnfjJj/J0OCrSyAbLSGdTv6TmynJobezojZHF
         q726WofsVEPXD/YlszicQnGV3OuXTTjroMNoM5kRp99NW5FQ13tSoZYk95RYSWmaYzCZ
         qJTA==
X-Gm-Message-State: AOAM531wpFZSx3KRua5ebvEe0WozA7j5S0xvTNbNQsWxbhbqBVaJKz3H
	ZMhm59uYEop6bjwIITjRmw5JA81PMHdAGMY0C6M=
X-Google-Smtp-Source: 
 ABdhPJy1gK5Vz/dCCS949i4Q/Ph+WJJbgJ43ljsGQ7Ae5kg2VmcTpEC9i0v0EG5XgkbBM9QekbGcN2ByBheRRGyC5Q8=
X-Received: by 2002:ac8:5a86:0:b0:303:fba5:ed5e with SMTP id
 c6-20020ac85a86000000b00303fba5ed5emr6903605qtc.330.1653973461714; Mon, 30
 May 2022 22:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <8d3926c7-e8d6-628e-82ea-4b9854cc2be8@gmail.com>
In-Reply-To: <8d3926c7-e8d6-628e-82ea-4b9854cc2be8@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 May 2022 22:03:55 -0700
Message-ID: 
 <CAMKF1spCr7hmw2TU1oMUSrk-MBwmpXd9BzHy4PwPuaFmGYWz_w@mail.gmail.com>
Subject: Re: dunfell merge request: May 30th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 05:04:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97341

merged thanks.

On Mon, May 30, 2022 at 7:07 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 8ff12bfffcf0840d5518788a53d88d708ad3aae0:
>
>    postgresql: Fix build on riscv (2022-04-19 10:15:37 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to deee226017877d51188e0a46f9e6b93c10ffbb34:
>
>    tcpdump: Add fix for CVE-2018-16301 (2022-05-25 19:34:39 -0700)
>
> ----------------------------------------------------------------
> Julien STEPHAN (2):
>        opencl-icd-loader: switch to main branch
>        opencl-headers: switch to main branch
>
> Martin Jansa (2):
>        python3-cryptography: backport 3 changes to fix CVE-2020-36242
>        ostree: prevent ostree-native depending on target virtual/kernel
> to provide kernel-module-overlay
>
> Mikko Rapeli (1):
>        fuse: set CVE_PRODUCT to "fuse_project:fuse"
>
> Ranjitsinh Rathod (1):
>        atftp: Add fix for CVE-2021-41054 and CVE-2021-46671
>
> Riyaz Ahmed Khan (1):
>        tcpdump: Add fix for CVE-2018-16301
>
> Sana Kazi (1):
>        openjpeg: Whitelist CVE-2020-27844 and CVE-2015-1239
>
> Steve Sakoman (1):
>        lua: fix CVE-2022-28805
>
>   meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb            | 2 +
>   meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb             | 2 +
>   .../atftp/atftp/0001-fix-buffer-overflow-in-atftpd.patch        | 111
> ++++++++++++++++++++++++++++
>   ...01-options.c-Proper-fix-for-the-read-past-end-of-array.patch | 48
> ++++++++++++
>   meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb            | 2 +
>   .../recipes-support/tcpdump/tcpdump/CVE-2018-16301.patch        | 111
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb        | 1 +
>   meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb       | 2 +-
>   meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb | 2 +-
>   .../recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch  | 73
> ++++++++++++++++++
>   meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch           | 28
> +++++++
>   meta-oe/recipes-devtools/lua/lua_5.3.6.bb                       | 1 +
>   meta-oe/recipes-extended/ostree/ostree_2020.3.bb                | 2 +-
>   meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb             | 14 ++++
>   .../python3-cryptography/0001-chunked-update_into-5419.patch    | 99
> +++++++++++++++++++++++++
>   .../0002-chunking-didn-t-actually-work-5499.patch               | 43
> +++++++++++
>   ...3-correct-buffer-overflows-cause-by-integer-overflow-i.patch | 37
> ++++++++++
>   meta-python/recipes-devtools/python/python3-cryptography_2.8.bb | 3 +
>   18 files changed, 578 insertions(+), 3 deletions(-)
>   create mode 100644
> meta-networking/recipes-daemons/atftp/atftp/0001-fix-buffer-overflow-in-atftpd.patch
>   create mode 100644
> meta-networking/recipes-daemons/atftp/atftp/0001-options.c-Proper-fix-for-the-read-past-end-of-array.patch
>   create mode 100644
> meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-16301.patch
>   create mode 100644
> meta-oe/recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch
>   create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-cryptography/0001-chunked-update_into-5419.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-cryptography/0002-chunking-didn-t-actually-work-5499.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-cryptography/0003-correct-buffer-overflows-cause-by-integer-overflow-i.patch
>

