Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19517ECAAD3
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 18:08:17 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web09.1170.1662919693159915906
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 11:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f8r8nDYi;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-127f5411b9cso17814324fac.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 11:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3slVQrY2imptUU0mO1eXEUc+3sK1MdHuXKWx1O6N4Ho=;
        b=f8r8nDYiy87K6elw7T53QRZtKAvjPhBmMBy2MbLBj0PVp76z1RUqgIoL5/sVh0BPbD
         /hgaIzq4/NZ5Dwi5aQ8kqgzEkPh3C8WwJcf/6Nj3t77W3VinsN8KR28rHKC4+r2AwvFZ
         49LfhNY8PYqEteQtHokOVleAcoRqbxbbKxEj7FcNPap+tU/FgGvgieYseokYGtveejMA
         Tx1AVTJ8+tqDwddREufPbyKf9w6+ja6ugB71p996DIX/JT2lO1PQJXIx1+pfJk+nucyC
         At8rW8jT0iLQfWJPgp8iFAT44xVzE7DGU1kNFRnoF6nMwV8GeU5e4CM+RDttTLElkFfX
         XwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3slVQrY2imptUU0mO1eXEUc+3sK1MdHuXKWx1O6N4Ho=;
        b=u3P1KDTCyACkMXbnjfgZZ8nndOW/Ku8WZ/I5Gwc0RoVqVvYgkU0spDnxw0QRSzoIP2
         jpu67Xx4MFATlcmAym+Cej3QG3LfLO9v4T14BazVC6C8b5yG89XWECtk9Con6wKylUZZ
         +CKpptCvzpLG8oFqA1LSxe+MR89JCr0FhSTbPP5FXJfpg7ZOY+EdcAuQZqGtqVEQgxH3
         wTuNN1HI2r2ygybRql+HAF0BPZDrVPAhyGpH4hCudPShf+DB61cun3Iplg8jr3pluhQo
         F6J6pMCY4zT2zNOyGPkytXMMOTrRgqYTqWiQBfnbrCv2vXFRwAvNQ9N+IUAPr40RAQOo
         LAyw==
X-Gm-Message-State: ACgBeo260/eGN7qap1/Vm+uA6dtL0f16TTqe0Ig6VH7CZIHyctN/qhBO
	0aXuY4puUE3nz9WF888Vl6ZixphtfiSJ1lAvwUQ=
X-Google-Smtp-Source: 
 AA6agR42q/GMfsgMpbwEOOP5CfbYq8YZ4nLXKYZ+4H+XwAA1+nxamnAiVkS+bE8eeXA6BiFieud7P7UuYTeCtqBqafQ=
X-Received: by 2002:a05:6808:17a6:b0:344:eaa9:24e8 with SMTP id
 bg38-20020a05680817a600b00344eaa924e8mr7442492oib.55.1662919692375; Sun, 11
 Sep 2022 11:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <3dcd12fe-f397-8364-bd13-5a140527a908@gmail.com>
In-Reply-To: <3dcd12fe-f397-8364-bd13-5a140527a908@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Sep 2022 11:07:46 -0700
Message-ID: 
 <CAMKF1srtkEjchaFjx13eRFy=LHqz93fsbSVxz5FjZ52Sd9UkuQ@mail.gmail.com>
Subject: Re: dunfell merge request: Sept 11th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Sep 2022 18:08:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98735

applied thanks Armin

On Sun, Sep 11, 2022 at 10:56 AM akuster808 <akuster808@gmail.com> wrote:
>
> I appreciate the patience of our community while the stable build system
> relocated.
> Thank you very much,
> Armin.
>
>
>
> The following changes since commit f22bf6efaae61a8fd9272be64e7d75223c58922e:
>
>    meta-oe: Add leading whitespace for append operator (2022-08-02
> 06:59:38 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 6792ebdd966aa0fb662989529193a0940fbfee00:
>
>    c-ares: upgrade 1.17.2 -> 1.18.1 (2022-09-11 13:49:52 -0400)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>        Revert "c-ares: Add fix for CVE-2021-3672"
>
> Hitendra Prajapati (1):
>        python3-lxml: CVE-2022-2309 NULL Pointer Dereference allows
> attackers to cause a denial of service
>
> Khem Raj (1):
>        c-ares: Upgrade to 1.17.1 release
>
> Ranjitsinh Rathod (1):
>        nodejs: Upgrade to 12.22.12
>
> Sinan Kaya (1):
>        c-ares: remove custom patches
>
> Yi Zhao (1):
>        cryptsetup: upgrade 2.3.2 -> 2.3.7
>
> wangmy (2):
>        c-ares: upgrade 1.17.1 -> 1.17.2
>        c-ares: upgrade 1.17.2 -> 1.18.1
>
>   .../cryptsetup/{cryptsetup_2.3.2.bb => cryptsetup_2.3.7.bb} |    4 +-
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-2021-44532.patch     | 3090
> ---------------------------
>   .../nodejs/{nodejs_12.22.2.bb => nodejs_12.22.12.bb} |    5 +-
>   ...1-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch | 27 -
>   .../ares_expand_name-fix-formatting-and-handling-of-root.patch  | 115 -
>   .../c-ares/ares_expand_name-should-escape-more-characters.patch | 90 -
>   .../c-ares/c-ares/cmake-install-libcares.pc.patch               | 84 -
>   .../c-ares/{c-ares_1.16.1.bb => c-ares_1.18.1.bb} |   12 +-
>   meta-python/recipes-devtools/python/python-lxml.inc |    2 +
>   .../recipes-devtools/python/python3-lxml/CVE-2022-2309.patch    | 94 +
>   10 files changed, 102 insertions(+), 3421 deletions(-)
>   rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.2.bb =>
> cryptsetup_2.3.7.bb} (96%)
>   delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2021-44532.patch
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_12.22.2.bb =>
> nodejs_12.22.12.bb} (97%)
>   delete mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
>   delete mode 100644
> meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch
>   delete mode 100644
> meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch
>   delete mode 100644
> meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
>   rename meta-oe/recipes-support/c-ares/{c-ares_1.16.1.bb =>
> c-ares_1.18.1.bb} (53%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch

