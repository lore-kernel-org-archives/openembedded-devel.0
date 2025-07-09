Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A057C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 20:35:27 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.7271.1752093326837058723
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 13:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AEIjnK7S;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso214814276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752093326; x=1752698126; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6GjtFYeTqlR+0RJ+fsJXasy4+d0Oh2orbwNFek7hes=;
        b=AEIjnK7S67Nf/sZZYVGxf7WkP6/yByBq6MbWsYSM5ZyK5vYwcNfD0p9ezl44kctF6i
         mj9+AAMzjqM44IVVzYRKoZwy2xchU8fte9tyqCbbf0WmWPLDD6KH/E2hYmRSZCyqP5NA
         h3JHPhqCoLHGa/t4tDDMsNtQBskp/iIrYMOc/9rMn0CKhqO8S5f39vLwXRVOlg0IKasQ
         lS+ORBWTuhuLzAT9C4wGw7L404PhIyum8Pn6/dHdxeMfgGLSvCSTu37zTzVO462FzUco
         9ZGdktcgyeakW/3QcV7bprw6Qlo66Ku2DduuumzyTKJIW8EUdnGSqwzG0pa61HeJhQQ6
         SOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752093326; x=1752698126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6GjtFYeTqlR+0RJ+fsJXasy4+d0Oh2orbwNFek7hes=;
        b=KcK/+chgaBhx+yhse1KVPy/Eq+wyPNyipwGrCtdhWpbhiED6VkBrqRVWrcHu1rhMiZ
         1rNekxWvzvqkTW7LtKJ25XMBUYc6J+rZLuPCLNglXEMKAON/B7bG2plAtpqjiiYME/0v
         SShKIIWXgmXYIgbBuyk52LKFEOlp9+iK4N0MBc5f+YgCqRYwu6L7unYF/Dxk+UvrSoak
         rGXgU4SzZ0IMhbVu9IXxV0zTxvMRhmrfrJaz26ry8QfF0pblJbwzMSOP/CPxRn/qBues
         V0HkEYrd4qBwWpqF5GQd6C/+fvxk06CeaEYXDhNXJWtb+xlKNKVcY5/VWge4Ws3vk4TB
         +DvQ==
X-Gm-Message-State: AOJu0Yw0oDkF2kzB8yRhr+7SnMi2QYoAHx0FY52XZLWnMObTEw42BqlB
	XJTSYcFdVlDK68aS2JuAoydP0w67g4z41zDWFoPL+iT2FyFGhnr4EL9EEappFkQZon3JjWqG8o1
	fkUsRUu4PrLm89lRoE5ca52LZsLhvZE0=
X-Gm-Gg: ASbGncv/YK611El3abYeyCwpZEchZsqh38uhvhhIPLUEcnlk574dGec9j94NoxKbhPx
	z0o0oTqR21lR9Hs+x7yV+1GoYWKjtkqMUzgt30zXosog6TDpMDYpJXqVrEOmJM0QY+ZLhK0Dsvc
	Fmiep9zEF09PeQ3SjOuDhgE/2tBJYAfsu6NPIqmJrndsqIZgGYfSTQjQ==
X-Google-Smtp-Source: AGHT+IEZ7eqsMT0Di9idi3OQAXhB6UGsh/MZ8vT9E8pPHXQTMgreR8XsYka3kquXTl6eUne6FvW77ptxJ1jRvMRwGu8=
X-Received: by 2002:a05:690c:670a:b0:70e:16a3:ce92 with SMTP id
 00721157ae682-717c4741ea2mr3052117b3.17.1752093325825; Wed, 09 Jul 2025
 13:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <3c8dd1aa0e7a4abcbb93c151a7e671f1@diehl.com>
In-Reply-To: <3c8dd1aa0e7a4abcbb93c151a7e671f1@diehl.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jul 2025 13:34:58 -0700
X-Gm-Features: Ac12FXwggytwGUgHtLL-x3cWO6Gy4SDjKRf6mnGZdFnMDOJdRQ9Fbz77dz_tbHo
Message-ID: <CAMKF1sprBm4-mHNzh+2Hiv8V7kEF3djUWJFaFAx_3o6Ch8Q8zw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libp11: version bump 0.4.13 -> 0.4.16
To: denis.osterland@diehl.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 20:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118382

This fails to build for distros having 'usrmerge' in DISTRO_FEATURES

ERROR: libp11-0.4.16-r0 do_package: QA Issue: libp11:
Files/directories were installed but not shipped in any package:
  /usr/lib/ossl-modules/pkcs11prov.so
  /usr/lib/ossl-modules/libpkcs11.so
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
libp11: 2 installed and not shipped files. [installed-vs-shipped]

On Wed, Jul 9, 2025 at 7:35=E2=80=AFAM Denis OSTERLAND-HEIM via
lists.openembedded.org
<denis.osterland=3Ddiehl.com@lists.openembedded.org> wrote:
>
> This version comes with a pkcs11 provider called 'pkcs11prov'.
> Configure modules directory for native build for the provider.
>
> Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
> ---
>  .../libp11/{libp11_0.4.13.bb =3D> libp11_0.4.16.bb}          | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libp11/{libp11_0.4.13.bb =3D> libp11_0.4.=
16.bb} (77%)
>
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb b/meta-oe/re=
cipes-support/libp11/libp11_0.4.16.bb
> similarity index 77%
> rename from meta-oe/recipes-support/libp11/libp11_0.4.13.bb
> rename to meta-oe/recipes-support/libp11/libp11_0.4.16.bb
> index 807d079a05..0f62abbf96 100644
> --- a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
> +++ b/meta-oe/recipes-support/libp11/libp11_0.4.16.bb
> @@ -11,7 +11,7 @@ DEPENDS =3D "libtool openssl"
>
>  SRC_URI =3D "git://github.com/OpenSC/libp11.git;branch=3Dmaster;protocol=
=3Dhttps"
>
> -SRCREV =3D "6d669183c7b241ce47ecce28744837ad92814f5c"
> +SRCREV =3D "b9c2de288833e38a391ee3cb106f965a40153629"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "libp11-(?P<pver>\d+(\.\d+)+)"
>
> @@ -19,7 +19,10 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "libp11-(?P<pver>\d+(\.=
\d+)+)"
>  inherit autotools pkgconfig
>
>  EXTRA_OECONF =3D "--disable-static"
> -EXTRA_OECONF:append:class-native =3D " --with-enginesdir=3D${RECIPE_SYSR=
OOT_NATIVE}/usr/lib/engines-3"
> +EXTRA_OECONF:append:class-native =3D "\
> +    --with-enginesdir=3D${RECIPE_SYSROOT_NATIVE}/usr/lib/engines-3 \
> +    --with-modulesdir=3D${RECIPE_SYSROOT_NATIVE}/usr/lib/ossl-modules \
> +"
>
>  do_install:append () {
>      rm -rf ${D}${docdir}/${BPN}
> --
> 2.47.2
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118351): https://lists.openembedded.org/g/openembedde=
d-devel/message/118351
> Mute This Topic: https://lists.openembedded.org/mt/114065514/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

