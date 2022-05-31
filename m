Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6165BC433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 15:45:38 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.50978.1654011933130028654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 08:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dv/UCWVU;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id ew15so2804931qtb.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zN+NGCYigwnw8V7ujDCIpF6oY9L9n3Hx5DAB0PmNet4=;
        b=dv/UCWVUc/jHgbAWUK2qf+AmHWff7Soa9/HoBuzcyDKQkHsKFtztZUtptqDUcfYGQt
         Kk8A/1G4dORqCpcoo5UB3As1TAOWWAQJdHF9KU39q0Or4xWVwEhug68cTOUB0NvxzqH5
         w7hstILxSUhEbVIGenIH6GzIB0xpeYxdNSieWvgmsR+3gi4mKpxtQ+CwUluLN+vnwnUN
         XhhBBaL07hbu8h22uju6FLJQS43gKYvvSiTBJ7HXg6uY1rpeEotUoNg2Giy0YRzNJf72
         6x9auaQ0h8skKmveImxb70It9xxreG9S8bHJM/4ed7WY+Xo5Nq/kAvr2TFuegV9WN41X
         TBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zN+NGCYigwnw8V7ujDCIpF6oY9L9n3Hx5DAB0PmNet4=;
        b=QJLMI8iF7xlKZ2nwGQJPeyiP7c4vCge2p/5aFwt5q1QjaU/Sp1DPnbPQ83buBLe8jH
         Qp4g1pcIriKZkRdvSTtqpDkLRXYfR5cLthoYSj337FAIJGtgxfwZ9+gTb/8lrC913+VJ
         SPbYSIYFHQqK5U/IgL95Aeeg+oUSG9VGARXPJDrGEVYljGa/H46XBUM+ap0LS+3fx7d7
         uLmpjAp5VDdfFf1pQ4BCLsm/BqHOiSeYFR5taM5iM4t+p1XCrJowqY2h08k+XAJB2uWA
         Os9BgZveOL3oPfI0k2bpgCrBcvw4egHpy2/pjlg1TZox3PdoCOCTgvzUE96LxjqRzk4U
         9x+Q==
X-Gm-Message-State: AOAM531iyjBAMXCnhwIWgNgdVyo3pa4/VObArQIPRvBpuGJL+6tVaqo5
	dvqEGLqRW5MqCPSpsRULND03DmU996rf1qvsvgw=
X-Google-Smtp-Source: 
 ABdhPJx4Z2ecu0nYLND5fVr91GPNy6OHx7vq/uLyyETsUqKgGrfLADO61dUuOOhY6EqLQjh87PZW9Oq3qrEnAtV2o+c=
X-Received: by 2002:ac8:7f08:0:b0:304:b3cb:8f5d with SMTP id
 f8-20020ac87f08000000b00304b3cb8f5dmr7119433qtk.532.1654011932208; Tue, 31
 May 2022 08:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <1653990320-31470-1-git-send-email-wangmy@fujitsu.com>
 <1653990320-31470-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1653990320-31470-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2022 08:45:06 -0700
Message-ID: 
 <CAMKF1srEjAuud9ux17vN0EyXVBvMNxP99eGja_oTc2d-ztKN7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] hidapi: upgrade 0.11.2 -> 0.12.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 15:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97355

On Tue, May 31, 2022 at 2:45 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Changelog:
> ==========
>   Windows: migrate from SetupApi to CfgMgr32 (#362) - as per recommendation from Microsoft;
>   Windows: add hid_winapi_get_container_id WinAPI-specific function (#379);
>   Windows: improved error messages (#388);
>   Windows: fixed out-of-boundary memory access for some of the function (#418);
>   windows: Add .rc (#415);
>   macOS: add hid_darwin_get_location_id macOS-specific function (#378);
>   macOS: add macOS-specific function(s) to open device(s) in non-exclusive mode (#397);
>   libusb: improved CMake dependency on Iconv (#405) - as a result, better support for NetBSD;
>   general: documentation improvements;
>   general: small code cleanups/improvements;
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/hidapi/hidapi_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> index 1c57a1d83..4aa58ec7f 100644
> --- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
> +++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> @@ -12,6 +12,6 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
>  inherit autotools pkgconfig
>
>  SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
> -PV = "0.11.2"
> -SRCREV = "31bde69a1f08c880ef1622f2586eea0daf3b0857"
> +PV = "0.12.0"

if its bumping from version to version, then perhaps its better to
rename the recipe to hidapi_0.12.0.bb and drop setting PV inside the
recipe
it's easy to manage bbappends that way

> +SRCREV = "76108294092c023a4ece99eb3219559cea0d5066"
>  S = "${WORKDIR}/git"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97345): https://lists.openembedded.org/g/openembedded-devel/message/97345
> Mute This Topic: https://lists.openembedded.org/mt/91447919/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

