Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA36FC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 23:50:00 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.9223.1709596197600136655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 15:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X9GX8tOi;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-220a0cacf9fso2316587fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 15:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709596197; x=1710200997; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSl7s5/2Y8CdUu8a0gODvFNO07XF2ZuL2vJTR+xka8Q=;
        b=X9GX8tOixFEWEF0mnliCUp7TlH+GGVHJNBu7KQVt9mB/r6uQTYSc+/Trx7kxF5HaFY
         GuVDZCSV5q/zggquO8AD6/xULRZL2dnRY3coU0+bEfjzd19nXYkyJNuY78h88dDXQt2J
         uGgtrT4EUylNVZci4L3qnDku3IrpUEDeMhr/5DDzQZZk1tmoWbf0aaQZDXPbKy0O7pbF
         6O3+rIwn42vU+QF6rZ07tT4Tyeru4yDQ2jJ9TuKL0+FCpx7QSAtlgUmFcAJzICNL06/Z
         pwHG4REgVi+97T23+71T8aSpgkJGkn+uNuS1PCfT8detfwi05N/5N2xJAK9mfTOAfkYD
         jgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709596197; x=1710200997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSl7s5/2Y8CdUu8a0gODvFNO07XF2ZuL2vJTR+xka8Q=;
        b=prQzAM4zgqb9lrTyzxr10BqWWw23n7xDgxNmezfc37X465VfFe8oiC197KJ5JEn6Up
         UmGNVvlTj044a0GT/dB6RRPnZOv5F4hSk+KTSmyBzKWKsQ3UPrTCzWa91lEOX1zbxWjI
         Ovk5uJNzToBBxJ0qG5VYyDHd1j3gVfwpSFSV0HNxnebTuuZ/NhF+0mtgrrDqsecETLdu
         nfChMEJv/HJL1ofxDBMktaPBzFFSAmCA0e1oit5Bmr3BnpsBL5OXA9HFy5vTfgCO3T8m
         aJFSnT0zg+rSU51df1vIj0Pd2NRJtOHAHZ64OXgeAdkbUjTDXPWDyA++cH0Dym4/bUlg
         vWAQ==
X-Gm-Message-State: AOJu0YxsYc34spZFYm6SZxDZa0fG8BUdLJBo5U7OkdzezFI3FosJ5zuv
	Hax4HKqK2Wc101k+2M69vZMsi5SabEEUlpQBC5yyqqrivYsjFpzaSPd36hK8HQyb4yEQTbrT85X
	hbKkhUpzA1clpt8mFDfxbi++yV+FdpQnZ
X-Google-Smtp-Source: AGHT+IGSfb3nmjr+mEAMK8je/VG3iJUzTZxuHAy13CVFCJBzK3OucJsy1tOZG6eo5pF8fWc3SSogcIqiep1xOjAppa4=
X-Received: by 2002:a05:6870:891d:b0:21f:d37a:d6d3 with SMTP id
 i29-20020a056870891d00b0021fd37ad6d3mr218591oao.3.1709596196731; Mon, 04 Mar
 2024 15:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20240304215014.4191019-1-joe.slater@windriver.com>
In-Reply-To: <20240304215014.4191019-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Mar 2024 15:49:30 -0800
Message-ID: <CAMKF1sqND1HW4vubUN7AMpvQvWwXGHTKygR36zkzQuZAoVP3tA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] googletest: allow for shared libraries
To: joe.slater@windriver.com
Cc: openembedded-devel@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 23:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109105

On Mon, Mar 4, 2024 at 1:50=E2=80=AFPM Joe Slater via lists.openembedded.or=
g
<joe.slater=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
> Add a PACKAGECONFIG option to produce shared libraries.
> Allow staticdev to be empty if no static libraries
> are built.
>

why would be not build static libs ? and if we do not then why do we
need to create
empty package ?

> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-test/googletest/googletest_1.14.0.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb b/meta-=
oe/recipes-test/googletest/googletest_1.14.0.bb
> index 8c75f936de..1b05f3d336 100644
> --- a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
> +++ b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
> @@ -10,11 +10,17 @@ S =3D "${WORKDIR}/git"
>  SRCREV =3D "f8d7d77c06936315286eb55f8de22cd23c188571"
>  SRC_URI =3D "git://github.com/google/googletest.git;branch=3Dmain;protoc=
ol=3Dhttps"
>
> -inherit cmake
> +inherit cmake pkgconfig
> +
> +# allow for shared libraries, but do not default to them
> +#
> +PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LIBS=
=3DOFF,,"
> +
>
>  ALLOW_EMPTY:${PN} =3D "1"
>  ALLOW_EMPTY:${PN}-dbg =3D "1"
>
> +ALLOW_EMPTY:${PN}-staticdev =3D "1"
>  RDEPENDS:${PN}-dev +=3D "${PN}-staticdev"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109103): https://lists.openembedded.org/g/openembedde=
d-devel/message/109103
> Mute This Topic: https://lists.openembedded.org/mt/104732413/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

