Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42740C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:26:58 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.204905.1698337609314171887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 09:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HmyHQl0t;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1e9d3cc6e7aso643620fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698337608; x=1698942408; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBAZM5jygpokCL3+Iu0KUbXPOydDJk1pCGIJYOSxPm8=;
        b=HmyHQl0t1H27eq13W6LzP/kZ/rS/NPsuYplBdpdV4evNmJYqqWAWmXWYBIBB/rw06O
         qNvDWO98SjkIYsI/Wp4eZKraYRJg5p7j4lHFjFNsOUjeIOVCZpzs6AqohfdkijOUblgi
         tLNR8gT/va+P7Aew9WxQBHCxQIwtq+FuqaeniWEKl3I/vCY/lMZ7Qt39PDuKNUeCacZB
         qMk5v1XflJzpmyvuxug6bNA9uBdu2X43fA198/jedpHOyvnBdkSojYiT6iTQfWi8ZLMu
         8CqbJYJKaoQpV5c1XHc1/6q/m3hkRSXvrOZFbM10fxM7sYhtZuz6oVzZ4+SjWQiGx2D/
         P2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698337608; x=1698942408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBAZM5jygpokCL3+Iu0KUbXPOydDJk1pCGIJYOSxPm8=;
        b=pvWMuuA1wjvrzS9UJVhShvENcOSYQOU8zcpih8qBVNN44jG7GQ8Y51cFjOSJs9iPXX
         f6ure1PTlyRnMJgDxPo1FS8ghwnDhklf9GMRR2XHcuYg2YpzdexvbzBtoI3a6QiNX7vk
         SXD7/jcsjW8L2UKWJnpJz1JWw/oDcuvARV1KnqFzrCg0+CyYvm1Lv7Ywt4R/SsvYEt4n
         xQT2Knvt/dy8OGk4+hOtnzaiJ4ztGZxkiAzEFpeJxlmWw26wBaB8gIWWa0ca4LqlQbNX
         k/2imuBa6ozEbbEvoR9lisbBHaXz1zZg0xuSl+5Dns0Ghhi+JmZkkneaCDXm/kQVYSjq
         y3fA==
X-Gm-Message-State: AOJu0YyeURe9shYbBSzAdirVqnW55gs9PkOeO40Pj7YkAYVYi1FH/kEf
	tVW/Cp6u8W5KhmkpGcwIUEDfqfm61yanvbuws5o=
X-Google-Smtp-Source: AGHT+IFMvsnUWz6XMClbVOqXRBs50ypUt4zrDSANouPH7NDUgsGqWpj9Wa/H/2jUzjdEd70jZv6gmxUB6nA3ZAI1PhQ=
X-Received: by 2002:a05:6870:8e16:b0:1eb:e8b:73cb with SMTP id
 lw22-20020a0568708e1600b001eb0e8b73cbmr18625oab.58.1698337608491; Thu, 26 Oct
 2023 09:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231026132203.3840009-1-pkj@axis.com>
In-Reply-To: <20231026132203.3840009-1-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Oct 2023 09:26:22 -0700
Message-ID: <CAMKF1srjYu5bdZgWsrq3G-Z0dLUU4R3Q+r_05u7epNbbeX57yg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libwebsockets: Support building for native
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 16:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105757

On Thu, Oct 26, 2023 at 6:22=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> This is needed to be able to build mosquitto-native.
>
> The dependency on libcap when building for native is needed because
> cmake will pick up the existence of libcap from the host, but then the
> build fails if it is not available in the sysroot. Unfortunately, there
> does not seem to be any way to explicitly tell cmake to not build with
> libcap.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb  | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3=
.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
> index 5e6069fb8..b80c31a1e 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
> @@ -4,6 +4,7 @@ LICENSE =3D "MIT & Zlib & BSD-3-Clause & Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D382bfdf329e774859fd401eaf850d=
29b"
>
>  DEPENDS =3D "zlib"
> +DEPENDS:append:class-native =3D " libcap"

it will expand to native automatically but it might be better to be
explicit here and use libcap-native

>
>  S =3D "${WORKDIR}/git"
>  SRCREV =3D "b0a749c8e7a8294b68581ce4feac0e55045eb00b"
> @@ -61,3 +62,5 @@ RDEPENDS:${PN}-dev +=3D " ${@bb.utils.contains('PACKAGE=
CONFIG', 'static', '${PN}-s
>
>  # Avoid absolute paths to end up in the sysroot.
>  SSTATE_SCAN_FILES +=3D "*.cmake"
> +
> +BBCLASSEXTEND =3D "native"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105748): https://lists.openembedded.org/g/openembedde=
d-devel/message/105748
> Mute This Topic: https://lists.openembedded.org/mt/102199463/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

