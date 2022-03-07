Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64284C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 16:44:17 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.125.1646671456123453415
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zst0lKra;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id v189so3438509qkd.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rAh14/n2QUn95oLRtt7ir1ODN033sP0GtjbFniB4BuU=;
        b=Zst0lKra3ZlGT9Ah3GX7CS9bmTHXV0xX66NpVQ3CWPODKwXUq43Ick+oIFGNJMKas6
         MEzp8yCooxYVQCO3KeictEfbPPg1IuVcR3CwCR/n/AhtOCOjEpd7etAlG6Vf+MbQWPY7
         6RJZDrASXNyw8FkTKjLHEx5pWR30f5e7KkdYNyPaZLXhepaN/gxgfrSrnUrIB8Kg6PMM
         ygVqnlNwwmLQAgsbWudqxUitI368vlf5h8u6Vqd4ooxLrvPVy+JIhOjeTaKZk7aa+Dzc
         Akv00X5qj/B7CiPXAH/+RT+C/s8bvV+zf2W1dtVMSkVbxTe5BFuBWDmAyx/yL3EFXm+n
         J8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rAh14/n2QUn95oLRtt7ir1ODN033sP0GtjbFniB4BuU=;
        b=hHZRyZAhe5NX7t5jZ5cOmjrAVpI/ytCenSKgrHn0iZJUsP+9zvh+KSKzSRc0HRoVcz
         DJwPuFY7dwXsVKTb684N6vg8Et0Rn1g239ts0JuocFM2i/A0knnD9XXyyQZE/jr1uSNR
         eIoVJlORGq1mViqccPp+40xBlyU/YJaBsMscaB91MmveyxEi0UfpJd4aSXvMy9GQqxAj
         7eq3wb4+TmKWk+fCILu8AmnUcYc4Ams4yF2ICEFQG0PqWJ97YgXtfjs6ixqxyQtgb8l9
         C8JJKfP9CKEJtfTdSY+jFgtHmcVoUxixi4vP8rQXHTSMzFiwHR7Pl/y6BayQesu+HgTz
         FvJw==
X-Gm-Message-State: AOAM5332T4saKMqiVoHGroVGQzeuqsAKcrKr4dVtmWYpatGlv4BB3ITA
	jA1i1CeX2KQo4ljayKtcr3U6Z+BCbkxZC+/NDkk=
X-Google-Smtp-Source: 
 ABdhPJzwmOCf+NZ6RvZnLxaod7Y60316//EnD0gvcrJsseJhBnCfaexIEAcTjsbHl3+GUJomvWW0yo+Zdk5b8GeuDlw=
X-Received: by 2002:a05:620a:45a7:b0:67a:ec24:d3fc with SMTP id
 bp39-20020a05620a45a700b0067aec24d3fcmr7218498qkb.180.1646671455129; Mon, 07
 Mar 2022 08:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20220307121818.1851345-1-ross.burton@arm.com>
 <20220307121818.1851345-2-ross.burton@arm.com>
In-Reply-To: <20220307121818.1851345-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2022 08:43:49 -0800
Message-ID: 
 <CAMKF1sqEeuuaBLDSYFoOEn5EfAc79D2hSHMTg-WEwXCWA4x1xg@mail.gmail.com>
Subject: Re: [oe] [PATCH v2 2/2] python3-meh: use setuptools_legacy
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 16:44:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95863

this patch does not apply. Please rebase

On Mon, Mar 7, 2022 at 4:18 AM Ross Burton <ross@burtonini.com> wrote:
>
> This setup.py installs data_files with absolute paths, which isn't
> supported by bdist_wheel.  Use setuptools_legacy as the legacy install
> task needs to be used.
>
> Also update patch status on the setuptools port.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...etup.py-switch-from-distutils-to-setuptools.patch |  3 +--
>  .../python-meh/python3-meh_0.50.1.bb                 | 12 ++----------
>  2 files changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch b/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch
> index b616b3fad3..2eb6be5a18 100644
> --- a/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch
> +++ b/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch
> @@ -9,8 +9,7 @@ In Python 3.10 'distutils' is deprecated with removal slated for Python
>  This also allows for a 'wheel' binary archive format to be built with
>  'setup.py bdist_wheel'.
>
> -Upstream-Status: Submitted
> -[https://github.com/rhinstaller/python-meh/pull/37]
> +Upstream-Status: Backport [cf9eafdd165347f86bb4a2534c41fd805db52322]
>
>  Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>
> diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
> index 9f72b72623..1d9af438da 100644
> --- a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
> +++ b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/rhinstaller/python-meh"
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -inherit setuptools3
> +inherit setuptools3_legacy
>
>  S = "${WORKDIR}/git"
>
> @@ -14,12 +14,4 @@ SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=rhe
>            "
>  SRCREV = "c321ce22950aff76611a3c6beffa02b5ea3adbed"
>
> -PIP_INSTALL_PACKAGE = "python_meh"
> -
> -do_install:append () {
> -    install -d ${D}/${datadir}/python-meh
> -    mv ${D}${PYTHON_SITEPACKAGES_DIR}${datadir}/python-meh/* ${D}/${datadir}/python-meh/
> -}
> -
> -FILES:${PN} += "${datadir}/*"
> -
> +FILES:${PN} += "${datadir}/python-meh"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95852): https://lists.openembedded.org/g/openembedded-devel/message/95852
> Mute This Topic: https://lists.openembedded.org/mt/89610377/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

