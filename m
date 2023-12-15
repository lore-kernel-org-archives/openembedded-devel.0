Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D2CC4167D
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:43:16 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.57690.1702626194687383787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S8G7CzBL;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-46491d5b814so156747137.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626194; x=1703230994; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EenWmG+BrQyyhqKPl/ar0Q0VReqoUaBb4OL0vteBI0Q=;
        b=S8G7CzBLCwugOWB8+2oO526hM0y/DcKlv6ZjBLcze5GA8g0zhojr7QZv2tOfxXGhiG
         VeZ9+ZHNonU2PUeCX9wZI8aKJH9wAORxIOqDBQhIf3/P8hV3a+sKcwBtxssI+dctUQJw
         kqeZJZd9nw6eCa2r3tu2JFOcVtpO/UDtd11oICFVoFeDq/5F4gNrKBlzzTrZtw5qIdam
         sR+FA2xdjkp1fq3U5N5yFxchzPKnUZK79y8furL2Z7JwBt5L+MSnQHDXNwwKm+6HwgGe
         raT0pWg9kYbfHP+Zv/CmCgxu0ukrB6OwsBxQLdjwDdS7PETIkPdvF1bZkVyG84qQbHeU
         8bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626194; x=1703230994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EenWmG+BrQyyhqKPl/ar0Q0VReqoUaBb4OL0vteBI0Q=;
        b=gWcFi7w7qtBsIUao5K6KteedBXHbDkxrcSVLnTFfTcLx+lGWEH+k3KRZZmzIDPlrS3
         7uoD/QTBE6IOSJUdY0bmtJomXnvx0oz/MUWwFPf0XT9VNEpsaOzIFbFXCgidekUbA0KH
         RS7XnPDkOIa6seMXYpq7Yotfn3AiUSkrXLUGCYBJQVPFnGQF5wC1+P7Yfuy5hL6AXUlx
         3AZ9qVj6fgK9+JJlvczPgnkgE1xSSuX/qPpcHc3VYnBqlhqZ+wlKkyrqWugnDZiHWIxI
         Efk6fGc9VLdxux0Ux/fKHCBQlY+SgNxnkfIBZgNbARTo0CJ4JPb69Gor1ZvQC8GbTlgm
         SmKw==
X-Gm-Message-State: AOJu0YyX2S0DtxOr4GfBx6L6dQvlTGFHsIfHoSlnD0ED2NG9SyerYftL
	glb+VxH7kS0F2nZ3ZQSIe8jYy+H7SZDIhEx1etE=
X-Google-Smtp-Source: AGHT+IFfRXrtsExO/ND5w4RJPQkjb1SE5RDpoaRaI+0+TdOMTwvUcZdze79p8/1oavmGllnrUYXDvXzI+71Yaw0okj0=
X-Received: by 2002:a05:6102:b08:b0:464:45a1:b8bd with SMTP id
 b8-20020a0561020b0800b0046445a1b8bdmr9073840vst.12.1702626193575; Thu, 14 Dec
 2023 23:43:13 -0800 (PST)
MIME-Version: 1.0
References: <1702619685-4145-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702619685-4145-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 23:42:46 -0800
Message-ID: <CAMKF1soB8D-7Pe2z6+VvLFG7YqBksW7k7VFjun09M+qYPtHqZg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] paho-mqtt-cpp: upgrade 1.3.1 -> 1.3.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107493

i am getting

ERROR: paho-mqtt-cpp-1.3.2-r0 do_fetch: Fetcher failure: Unable to
find revision 5e0d1bf37b4826d680ec066ec42afd133851a681 in branch
master even from upstream
ERROR: paho-mqtt-cpp-1.3.2-r0 do_fetch: Bitbake Fetcher Error:
FetchError('Unable to fetch URL from any source.',
'git://github.com/eclipse/paho.mqtt.cpp;protocol=3Dhttps;branch=3Dmaster')

On Thu, Dec 14, 2023 at 9:55=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Fixed generator expression for older CMake
> -Bad LWT message in async_publish.cpp sample.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{paho-mqtt-cpp_1.3.1.bb =3D> paho-mqtt-cpp_1.3.2.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/paho-mqtt-cpp/{paho-mqtt-cpp_1.3.1.b=
b =3D> paho-mqtt-cpp_1.3.2.bb} (92%)
>
> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3=
.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
> similarity index 92%
> rename from meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.=
1.bb
> rename to meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.=
bb
> index 1e1e92339..97f2f3263 100644
> --- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D " \
>
>  SRC_URI =3D "git://github.com/eclipse/paho.mqtt.cpp;protocol=3Dhttps;bra=
nch=3Dmaster \
>             file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_=
BIN.patch \
> -"
> -SRCREV =3D "4691652479bb4b398c7b81bde639482b164ae6d6"
> +           "
> +SRCREV =3D "5e0d1bf37b4826d680ec066ec42afd133851a681"
>
>  DEPENDS =3D "openssl paho-mqtt-c"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107488): https://lists.openembedded.org/g/openembedde=
d-devel/message/107488
> Mute This Topic: https://lists.openembedded.org/mt/103185783/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

