Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C607C74A44
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 19:29:24 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.96.1678390163480779669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 11:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fy6m641H;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-176261d7f45so3388164fac.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 11:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678390162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHMyi1nlftJxuBvVgjo2cKBOJGyIU073zCWN6SfQycw=;
        b=Fy6m641HkuZ4J98Xyul+2WkZ1a3CWspQQVyvBFZZwJeSS0hw2rwZwlJXE9ieVP9nXo
         por58QbVS8Pzm2tfZzzoLOauiWepZV8LR1H1RqopIq2zwJwZnVr3fzUu1JSU/SMfiRfH
         jnP6QVF5ukMXw13w889sd3zmIV8nvjqNLzaoAg3j4b0U5GTgmYoxV2P3kL9YqDEaWZtG
         hQmEa2sWsAnQL2gnmfTdx8bGA9Ok+p5/gbTJuVNhQgTEEnFrYO5jaRoUJ5WqoKNY6U3P
         DNwtG0/2dTe8LgsAxNnDXqLQyH+CG4AvjfQOb7hBJbxlGO5GKS9Gg5toP7otmmXLxNIZ
         R10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678390162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHMyi1nlftJxuBvVgjo2cKBOJGyIU073zCWN6SfQycw=;
        b=vk/Of5eEmI5AYriVu+ldLOb7ApukiF7GeI94tkiS4eWadd09bQsvWncJdDnFbAPF/u
         84SPbscaBEFKiHgZ54k3vs+3GOyPtENOZrZs09UdrK7BMbHCQ+AcDP0CMKdTbwSk5g7W
         fBVvm7QXdlTt5EfD1vG6GUe0XPqeOr/8fmdNgJmnN0tSkYDFg729no906+G5LxyM5bab
         TexX/pZdvwJbgVPhibS0E3LpcpLkh0iw4XgFz4NjoiFhh/DUzJdbfDVi9qo82kzxsBFb
         O2VGYlCuLzzeJD/gAC5aN4m2N7tMISFNfpo+udZtJI6mhF8hK7hW3/NZUQvd3NjMmr3h
         3lkA==
X-Gm-Message-State: AO0yUKVW+uuUZC2cvEPgvAz2bPeh/e/sipOSqjpdKqvSBROLAuAH+Ni7
	kz6mQILLTzKCsn6PM8ZICIhAhqAqz/NswUv2na8=
X-Google-Smtp-Source: AK7set9hIbL+TT/UfsBkV2GmXNN4jcysP07Kz0Vz9ngfYkoeNKe6siFhKx5iHFtXd4tEVJqIEEvdBDbVh6LD6r4WLMY=
X-Received: by 2002:a05:6870:8c34:b0:176:68fb:88a6 with SMTP id
 ec52-20020a0568708c3400b0017668fb88a6mr6666973oab.4.1678390162538; Thu, 09
 Mar 2023 11:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20230309084314.1187137-1-changqing.li@windriver.com>
In-Reply-To: <20230309084314.1187137-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Mar 2023 11:28:56 -0800
Message-ID: <CAMKF1srUNaowx9zqOak2e3DnHu=WSRJBPhP-XZ=0LwM33TV8GA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sg3-utils: upgrade 1.45 -> 1.47
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 19:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101466

On Thu, Mar 9, 2023 at 12:43=E2=80=AFAM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../sg3-utils/{sg3-utils_1.45.bb =3D> sg3-utils_1.47.bb}      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.45.bb =3D> sg3-uti=
ls_1.47.bb} (72%)
>
> diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb b/meta-o=
e/recipes-support/sg3-utils/sg3-utils_1.47.bb
> similarity index 72%
> rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
> rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
> index ac12f9561..713c9f27d 100644
> --- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
> +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://sg.danny.cz/sg/sg3_utils.html"
>  SECTION =3D "console/admin"
>
>  LICENSE =3D "GPL-2.0-or-later & BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df90da7fc52172599dbf082d7620f1=
8ca"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df685699d3ac82f108aa880043fa3f=
eb7"
>
>  SRC_URI =3D "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
>  "
> @@ -14,8 +14,8 @@ MIRRORS +=3D "http://sg.danny.cz/sg/p https://fossies.o=
rg/linux/misc"
>
>  UPSTREAM_CHECK_REGEX =3D "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
>
> -SRC_URI[md5sum] =3D "2e71d7cd925dcc48acb24afaaaac7990"
> -SRC_URI[sha256sum] =3D "0b87c971af52af7cebebcce343eac6bd3d73febb3c72af9c=
e41a4552f1605a61"
> +SRC_URI[md5sum] =3D "5c6f6315f36ecf3499e49b1b6dbdc034"

md5sum can be dropped.

> +SRC_URI[sha256sum] =3D "8673c7faca849b6b34764332d2aa91f72db05bff7382bb83=
6d0688795199c3e1"
>
>  inherit autotools-brokensep
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101443): https://lists.openembedded.org/g/openembedde=
d-devel/message/101443
> Mute This Topic: https://lists.openembedded.org/mt/97492283/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

