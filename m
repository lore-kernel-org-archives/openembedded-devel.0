Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439BCC48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:48:03 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.625.1708544875941501783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=agpY6nW7;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-206689895bfso4417294fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 11:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544875; x=1709149675; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM9lh0kjMGum/XGj7uOsIYYtLq8pNLhz4+9FAodMi3w=;
        b=agpY6nW7gAKBjZftY49Y7lNv7f3oM6GWg0UEZJBBfwh/7ZnfaUoC+R5Ql+Y9zmX32V
         g+k3ooW6F9xgCcigMVsG24UUYpthFhBBJXUIFrQ+tBKYdtjnEaM5/x/+rcVA2TKwcdpm
         FYJm0rWn7VepbCVaBo6v9iWM2Bk9hpfMwvZN3CBKzOuigGdw526iWHZ5Rb9G1Qa/QhZh
         0aAq1hEMh7zJedahG5IjqgvgniBBrLY1Kcey0Og16fduKax0CePWJBmxQGvHRNdP+3Pq
         9bA1v5OilyrjpjJHc91NI8wPwkdaeYKQXwpcwkUmTPla6y+I5ftjRy3KoKJvpTdE5Ws/
         MJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544875; x=1709149675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tM9lh0kjMGum/XGj7uOsIYYtLq8pNLhz4+9FAodMi3w=;
        b=dejW+lqcaZt1DY9g578xI+5qjxNIsENlaPM2/2LGpBMw9TX99TOweP8Z+0+RAv2rzj
         57cPK129UfcUljgKUwhTglmFXDvMA86lm7XXaY0enN+U5yS0HrGstHv1yR1Nf4zFJ/IC
         16DjFxn5GX+LrBPogRCWzJsknrVj4wwh9NPggCHTxgBJTDcLhe9qrw9A8xyqDBRgrDRa
         E5MDUqAJfkD22yfOKFbtuOLOlPtiDPCMZGPyQJo3iKcY8xsc1PrnTs8wEXpoPQOXsI+B
         Uh5pt/ZIzZOCwuLTx9OzQbrciaqFXFD9pMgtyKuzStJNL6OpYplLqjJbKFhx88uvJV4E
         /noA==
X-Gm-Message-State: AOJu0Yy5+iefk2RiZTgGl3H7xhybzRXwohBAzds2a7R6P0LE2GROUgii
	DX5A9CSo5okWVg8st3kxLFE2/HRgDOUE++eZvS+b/JUhQSamZX0CXLMSM4HN+5tkiKJq73hIQ59
	3+V1Z/fDh5rrb/5jw0hJ43oOVKMk=
X-Google-Smtp-Source: AGHT+IFV4XsFPwqCFZykh7wMaMPOqeWZVVcnq6Z4MWpFULxAii1YDuF8rhZ35PjfrOM5N/JieZlbbop5JkkY0Nx/E98=
X-Received: by 2002:a05:6870:5b9b:b0:21e:623d:8bc with SMTP id
 em27-20020a0568705b9b00b0021e623d08bcmr15411343oab.17.1708544875000; Wed, 21
 Feb 2024 11:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20240221184624.3000696-1-jan.vermaete@gmail.com>
In-Reply-To: <20240221184624.3000696-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Feb 2024 11:47:28 -0800
Message-ID: <CAMKF1soThiXQmUDvfQhti=NXDvFEUQ_i126TyEZ1oyxZzeuJrw@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] netdata: version bump 1.43.2 -> 1.44.3
To: Jan Vermaete <jan.vermaete@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 19:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108969

On Wed, Feb 21, 2024 at 10:46=E2=80=AFAM Jan Vermaete <jan.vermaete@gmail.c=
om> wrote:
>
> And fixed a few minor oelint-adv warnings in the recipe.
>
> Tested on Raspberry PI 4
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../netdata/{netdata_1.43.2.bb =3D> netdata_1.44.3.bb} | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  rename meta-webserver/recipes-webadmin/netdata/{netdata_1.43.2.bb =3D> n=
etdata_1.44.3.bb} (92%)
>
> diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb b/=
meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
> similarity index 92%
> rename from meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> rename to meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
> index 28e82dac3..8eeb61f66 100644
> --- a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> +++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
> @@ -5,17 +5,17 @@ HOMEPAGE =3D "https://github.com/netdata/netdata/"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc9b848046ef54b5eaee6071947ab=
d24"
>
> -DEPENDS +=3D "libuv util-linux zlib libyaml json-c"
> +DEPENDS +=3D "json-c libuv libyaml util-linux zlib "
>
> -SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/$=
{BPN}-v${PV}.tar.gz \
> -"
> -SRC_URI[sha256sum] =3D "d4a7ea2717ac7c8f04865f18e13aeaa0a36784156059f1b5=
ced75a44f74afc4d"
> +SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/$=
{BPN}-v${PV}.tar.gz"
> +
> +SRC_URI[sha256sum] =3D "50df30a9aaf60d550eb8e607230d982827e04194f7df3eba=
0e83ff7919270ad2"
>
>  # default netdata.conf for netdata configuration
> -SRC_URI +=3D "file://netdata.conf"
> +SRC_URI:append =3D " file://netdata.conf"
>
>  # file for providing systemd service support
> -SRC_URI +=3D "file://netdata.service"
> +SRC_URI:append =3D " file://netdata.service"

why do we need to change +=3D to append here ?

>
>  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/tags"
>  UPSTREAM_CHECK_REGEX =3D "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108968): https://lists.openembedded.org/g/openembedde=
d-devel/message/108968
> Mute This Topic: https://lists.openembedded.org/mt/104494299/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

