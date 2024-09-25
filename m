Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775E0CF9C7C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 15:10:28 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.18629.1727277021279461570
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 08:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ktj5HFQ5;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5da686531d3so3871357eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 08:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727277020; x=1727881820; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OZZPI61qrywm/KHJIaNbjNx2G7F0ZY5npjoSPFCNBo=;
        b=Ktj5HFQ5z1N68+LjwNF2gz4uJZJLic6jHrxjtbaC3W2dWx/dDWDKtt5iLYiOTQkdvU
         mRvlORH1w/RjZ9bL3ZmlFG0U7tGn756VWG5LV8c4vMJunP1MfWKzCJqFYCjOQRAHgmfr
         pdJsbyrdybRjPvggqXxZ12gDQDijy5Xmf+umkXSYojGZllN7B9ebo20Bgzt8naJPAkc5
         Pvn+9KS1wiROI0IiWWxMk9cLjNcqrGOKwP7tXxgGE3+1NmyFNu33sOzpmHhB4eyg7YEk
         cNG5j8DHkuTs+rHwlQ8CHsRWA6EbmTTWmJi31KwEkNResYkbim1wJIK/xtJWYyhF1ciu
         ESuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727277020; x=1727881820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OZZPI61qrywm/KHJIaNbjNx2G7F0ZY5npjoSPFCNBo=;
        b=EhQGOPNQiL4wjATzeRUM8ay4WsY2+AaPdutsW5AEGEUzM5EQnxLIBqACpcjb9DibBq
         jpP47uqk5C6jT3SZxT4ZbDXRolT+U9k35uodbyAknMQeXQsGaU7Ft8d+A9ueDsFss70J
         Q/+209CWkaf80dfBLmlOH/GLwaDZMqr7e6GJXiZLm/WUna6ptjFQPTIaFub+hB4dV5aD
         z5fBHtS9xylA2JKt8Bxk8qUIyWlltMFfhVeDWYB5th7nSEqF0IMyD9LVaqjkrFE8QWZ9
         FoWV8wbSuViN7k7ouo4OO4RIy76gJgXrZXM2LBWMVebBgyqfjYEM1gBpRjATUdqaOgGt
         Jb6Q==
X-Gm-Message-State: AOJu0Ywsu2vZv3lvD8RRzQyF4I9aAeu5xpyvD08DEGRV84/ODQf2f8CF
	gBQ+D4vratuthfwPCdC9dMQjGIPjSMi2c/d/E9NQbpe1vdn77dF2UCHUPDIVMEOEzcnZr3OiSG1
	JnIlPT+kayed2WioYjXePxWKczlU=
X-Google-Smtp-Source: AGHT+IH1tGBZl/xtRzI2FBoYeoFY70/PGkb9OGGWqb5V0jFNVtNLb1ZPJT/E6LV9DvJHORTWPi5LZSxDs6/brt6iPWk=
X-Received: by 2002:a05:6820:610:b0:5e5:c49a:b3a with SMTP id
 006d021491bc7-5e5c6a5f5f7mr2066711eaf.8.1727277020485; Wed, 25 Sep 2024
 08:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <1b800883-a47b-404a-b07d-08f833fb4b48@gmail.com>
In-Reply-To: <1b800883-a47b-404a-b07d-08f833fb4b48@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2024 08:09:54 -0700
Message-ID: <CAMKF1spP_p0J=F9uTtzpFQEg3XWMFtgF8mJM1seHE4VAfeLuxw@mail.gmail.com>
Subject: Re: scarthgap merge request: Sept 22
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 15:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112497

merged now. Thanks Armin

On Sun, Sep 22, 2024 at 6:47=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 801849483137e3b24a8409f124aa24aba1af47=
f8:
>
>    python3-libevdev: Fix LIC_FILES_CHKSUM (2024-09-09 19:19:20 -0400)
>
> are available in the Git repository at:
>
>    git://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 735ae0310870ffce07ce0c55c4f87c20ac161ff9:
>
>    postgresql: upgrade 16.3 -> 16.4 (2024-09-15 15:46:40 -0400)
>
> ----------------------------------------------------------------
> Marc Ferland (1):
>        polkit: update SRC_URI
>
> Markus Volk (1):
>        gnome-remote-desktop: update 46.1 -> 46.2
>
> Martin Jansa (2):
>        gpm: fix buildpaths QA issue
>        xerces-c: fix buildpaths QA issue
>
> Wang Mingyu (2):
>        samba: upgrade 4.19.7 -> 4.19.8
>        postgresql: upgrade 16.3 -> 16.4
>
> Yi Zhao (1):
>        samba: upgrade 4.19.6 -> 4.19.7
>
>   .../{gnome-remote-desktop_46.1.bb =3D>
> gnome-remote-desktop_46.2.bb}          |  16 +-
>   .../recipes-connectivity/samba/{samba_4.19.6.bb =3D>
> samba_4.19.8.bb}         |   2 +-
>   .../files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
> |   6 +-
>   meta-oe/recipes-dbs/postgresql/files/CVE-2024-7348.patch | 583
> ------------------------------------
>   meta-oe/recipes-dbs/postgresql/{postgresql_16.3.bb =3D>
> postgresql_16.4.bb}   |   3 +-
>   .../0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch |
> 58 ++++
>   meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb |   8 +-
>   meta-oe/recipes-extended/polkit/polkit_124.bb |   5 +-
>   meta-oe/recipes-support/gpm/gpm_git.bb |   4 +
>   9 files changed, 86 insertions(+), 599 deletions(-)
>   rename
> meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-deskto=
p/{gnome-remote-desktop_46.1.bb
> =3D> gnome-remote-desktop_46.2.bb} (64%)
>   rename meta-networking/recipes-connectivity/samba/{samba_4.19.6.bb =3D>
> samba_4.19.8.bb} (99%)
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2024-7348.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_16.3.bb =3D>
> postgresql_16.4.bb} (82%)
>   create mode 100644
> meta-oe/recipes-devtools/xerces-c/xerces-c/0001-aclocal.m4-don-t-use-full=
-path-of-with_curl-in-xerce.patch
>

