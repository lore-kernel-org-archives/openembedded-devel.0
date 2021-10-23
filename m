Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25831C433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 18:24:11 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.9665.1635013449583318901
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TkGdfl/9;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id b12so6580801qtq.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ctlgFiDFGEaYAp44J3sRj4iHvNkfNmqccdH5C8EyOI0=;
        b=TkGdfl/9OHoaC6B73hsnlIJOLnvsTl2I4a8KJe/pLFiT/nnHV5ZvwKFwSvAbF95Zen
         1/AW/9WahhqgnlAQs4unSTGtYIKt/ANZdTkWFQwdAh+FZnLjVpfWVdE5nUqvu3lZjxi9
         DUsAp4cbz4RRAScg9IR3g0Cqx/5902f9CVJjcQNxI9Bf9sAMGopJLx8zzwK2B/FAlpF3
         q2D21ul399ta0Zeo3fi+k4xHHS9TrMKIGNFLRRnTs+kAYvAyjKely8LIhiNit/ymKQgG
         1QbdPk4EgOf2oDBLr9tHHUA1KcdxwrXcx+0+u8twpLCw6bdggjdh5pmV456NwRXVMOOk
         HFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ctlgFiDFGEaYAp44J3sRj4iHvNkfNmqccdH5C8EyOI0=;
        b=PNuQctVlcde5Y9hcl+Hr32GeQGAIEFn4yosnGnSrz9opWmHK8sUM+OZGM/Y9lfDXqu
         fUuAvYKlEfLAVbPrUn9dpQWTtbKrCiRVDJ5tyCzm6QzTvdWrPccCw5IAv8C9UaithGUf
         HuxJLtCqA9J5E875cNhl6SqW8xbFSuLmZJfqWjxQUYZcwlHqUuDV4k6FKR/v3iYl8cO0
         y/XySMU0IDCKgrnxiOTO4Ww5tj7ADb0XEOCsfV30b5W3UZIJDjsmeaGqkj4fOqlC0M3Q
         SfYXD08vTD2JFU2luHXK+2r6Rrj+3NFtjwta73dGNaouvBaL/h/Auy0JOetfcz33exyJ
         5DCA==
X-Gm-Message-State: AOAM530n9gkGnVOp7i9xDVAChzNca9iBky0HAEGvWpVRrC7i6mg1oxgg
	xuh/cYfy34ExmgfNTbiT3QlobeJUiQJOwMi6saY=
X-Google-Smtp-Source: 
 ABdhPJxQ/k/Xy8sZWpDWHn++9qACG57yUMyNsooNf1+7skBRl+xOgURK5V72GnzsQDy0Y9Ptz8I3qcA2fvjZRDie9pU=
X-Received: by 2002:a05:622a:13cc:: with SMTP id
 p12mr7776602qtk.227.1635013448665;
 Sat, 23 Oct 2021 11:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <6841bc08-9242-f958-a838-4ec94b5627c8@gmail.com>
In-Reply-To: <6841bc08-9242-f958-a838-4ec94b5627c8@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Oct 2021 11:23:42 -0700
Message-ID: 
 <CAMKF1so_BCLM+2cAtH+idkX9J7CAQMrH27Hq5Py7b8+qi1a57A@mail.gmail.com>
Subject: Re: hardknott pull-request: Oct 23rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Oct 2021 18:24:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93545

merged thanks

On Sat, Oct 23, 2021 at 8:53 AM akuster808 <akuster808@gmail.com> wrote:
>
> All of these where already submitted to the mailing list.
>
> - armin
>
> The following changes since commit f44e1a2b575826e88b8cb2725e54a7c5d29cf94a:
>
>   apache2: upgrade 2.4.48 -> 2.4.49 (2021-09-26 16:35:31 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to d378e4293d18e374f5d1494a88bfc3caee4d02df:
>
>   postgresql: upgrade 13.3 -> 13.4 (2021-10-23 07:39:43 -0700)
>
> ----------------------------------------------------------------
> Changqing Li (1):
>       postgresql: upgrade 13.3 -> 13.4
>
> Chen Qi (1):
>       ntfs-3g-ntfsprogs: upgrade to 2021.8.22
>
> Mingli Yu (1):
>       vsftpd: Upgrade to 3.0.5
>
> Peter Kjellerstedt (1):
>       libiio: Make libiio-python3 depend on python3-core
>
> Sakib Sajal (1):
>       gd: upgrade v2.3.2 -> v2.3.3
>
> Trevor Gamblin (3):
>       python3-sqlparse: Fix CVE-2021-32839
>       python3-pillow: Fix CVE-2021-23437
>       python3-pyinotify: Add fcntl, logging to RDEPENDS
>
>  ...3g-ntfsprogs_2017.3.23.bb => ntfs-3g-ntfsprogs_2021.8.22.bb} |  4 +-
>  ...1-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch | 51
> -----------------------
>  .../0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch     | 46
> ---------------------
>  ...1-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch |  0
>  .../{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-destdir.patch       |  0
>  .../vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-libs.patch   |  0
>  .../vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-strip.patch  |  0
>  .../nopam-with-tcp_wrappers.patch                               |  0
>  .../vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/nopam.patch           |  0
>  .../{vsftpd-3.0.3 => vsftpd-3.0.5}/vsftpd-2.1.0-filter.patch    |  0
>  .../vsftpd-tcp_wrappers-support.patch                           |  0
>  .../recipes-daemons/vsftpd/{vsftpd_3.0.3.bb => vsftpd_3.0.5.bb} |  5 +--
>  .../0001-configure.in-bypass-autoconf-2.69-version-check.patch  | 11 +++--
>  .../postgresql/{postgresql_13.3.bb => postgresql_13.4.bb}       |  2 +-
>  .../0001-fix-read-out-of-bands-in-reading-tga-header-file.patch | 33
> ---------------
>  meta-oe/recipes-support/gd/{gd_2.3.2.bb => gd_2.3.3.bb}         |  7 ++--
>  meta-oe/recipes-support/libiio/libiio_git.bb                    |  5 ++-
>  .../0001-Raise-ValueError-if-color-specifier-is-too-long.patch  | 49
> ++++++++++++++++++++++
>  meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb     |  1 +
>  meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb  |  2 +
>  ...1-Optimize-regular-expression-for-identifying-line-bre.patch | 64
> +++++++++++++++++++++++++++++
>  meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb   |  1 +
>  22 files changed, 136 insertions(+), 145 deletions(-)
>  rename
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2017.3.23.bb
> => ntfs-3g-ntfsprogs_2021.8.22.bb} (92%)
>  delete mode 100644
> meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
>  delete mode 100644
> meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =>
> vsftpd-3.0.5}/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
> (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =>
> vsftpd-3.0.5}/makefile-destdir.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =>
> vsftpd-3.0.5}/makefile-libs.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =>
> vsftpd-3.0.5}/makefile-strip.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =>
> vsftpd-3.0.5}/nopam-with-tcp_wrappers.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =>
> vsftpd-3.0.5}/nopam.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =>
> vsftpd-3.0.5}/vsftpd-2.1.0-filter.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =>
> vsftpd-3.0.5}/vsftpd-tcp_wrappers-support.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd_3.0.3.bb =>
> vsftpd_3.0.5.bb} (93%)
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_13.3.bb =>
> postgresql_13.4.bb} (78%)
>  delete mode 100644
> meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
>  rename meta-oe/recipes-support/gd/{gd_2.3.2.bb => gd_2.3.3.bb} (84%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/0001-Raise-ValueError-if-color-specifier-is-too-long.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/0001-Optimize-regular-expression-for-identifying-line-bre.patch
>

