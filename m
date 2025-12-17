Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A82D66B86
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 18:48:48 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22521.1765997326383916495
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 10:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FiGxG43/;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4557f0e5e60so3886797b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 10:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765997325; x=1766602125; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8O+3xpPNk5a3JUgbATiuzyn90rKoi3YBGiI7Jsei6I=;
        b=FiGxG43/enV2LnhOJZ4VzzJNdibPkoHu4pk8W2AcEk4oY1OwexpN8N9vdCUeC76uPh
         0KvADIhJqkFcJUu0tcAva6b3YDzkkkVplx64qwxPuD14ph7PuCsJAeKE/hK19UnuxMZ4
         8/WWKu0B3teyIoTuQH8p+rA2sV9EwAkvad1ZPoNoBTXj7+8O41N+nm/krNiVoJCdZ2L+
         GnBw0jH5wHX9JHBoigCeyqsww+AIAATMRz1iOsLf+ZRcNpe/nxQ5EwNCh82Y/37lqT09
         QdfUYxbV+rxnGyl8pIz0lV0dlon3iHpbVjygUByFbBdPUEPirCaX0e5BBreKViw5ORC4
         s3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765997325; x=1766602125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8O+3xpPNk5a3JUgbATiuzyn90rKoi3YBGiI7Jsei6I=;
        b=j57Y01MRyRZU/GWFqbJZCWrsrX7nQTOs6CrbrU78TpTHa/4qNvPLglII/nsC4Fpmjw
         QbKDmI1h0JBTnA6g2aEv/s+jQbvVFsO0TQ5vkx8r52EK7akxkUS/OS0fQUWkPs/3TD6+
         MUhyF6x7qGeLmQlz/xgX8mSotqHrN1MHiAYyQhD81++9R8rFBH0N6hlz8MVzUUHPvonL
         dcKK2p7J//q9DHtkQNPesfjg6Ovdyyc6x4ewTlEWQFMR6F5+26Wraadd4GwbWLah6htI
         +8LfueMswp0CBYkazor+k1EFYrgZ2WmWbnNFSD65lANxm0pzA2AYxsAjVl29zaR1jJ6r
         W2QA==
X-Gm-Message-State: AOJu0YwvcqDJE9t9N2Cre1XQQ/tKx10JhTOExz7XfwzLs+iLGADRTB2S
	vUXUt/D4/VEaV9iyk/2WsKHr3DA0KjkwqL3MlKGd/tDeEnBf3SY5q0dBTQsGzq5+VsEs9WOmmD+
	DX1qYcaKHvYM4IVJSzLf0EydOqMn0TXo=
X-Gm-Gg: AY/fxX5hOqYxmqAkpWbRtD/+JcOA0poVw9WVW9dNLlk/gz2J7QZvUturNPHXubtM0Dt
	k6HcSs9cFtOLf+lZdYPlcs5+l2RZdhoHyqwMCC6R/jWj9CYUXwHiLOEwG6V5b26yqrdUKhG67Yf
	8gAyeckqVbW6jfh644nzDZsA9BeROL5SrNHzFwlZKPSICD1ZbIHrLGPzeI3TB/JVAebLWzya/RR
	k7q0Dn3z28yuswP1FgtQFaE5bQcTVdBbfx3lJ5m///oCBKi5ijrzq+j6VgfDr5TpiSRQ4PUSA==
X-Google-Smtp-Source: AGHT+IEt+ARrmE3R9B/AkywV1/mnmd+nu5z5+uYB8akUV5vZVhdihkJfsXgS7Iw7u2VUyzJAgWu/oep9JQuM/3TX8/w=
X-Received: by 2002:a05:6808:14cd:b0:450:f3e4:eb05 with SMTP id
 5614622812f47-455aca1175fmr8944770b6e.64.1765997325607; Wed, 17 Dec 2025
 10:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20251217153757.43289-1-frederikbraendstrup@gmail.com>
In-Reply-To: <20251217153757.43289-1-frederikbraendstrup@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 18 Dec 2025 00:18:33 +0530
X-Gm-Features: AQt7F2qmMzm965WwuPzGtPjDguMFQE0ADVpnSRzu_yvNd8BCeEMf0-M0HHc6A9g
Message-ID: <CADySD0HpaQvwErZrPLqBt57SqWV1hr4EB_qqCLGZ9ihprb95Tw@mail.gmail.com>
Subject: Re: [oe] [PATCH] dbus-cxx: upgrade 2.5.2 -> 2.6.0
To: frederikbraendstrup@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 18:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122730

On Wed, Dec 17, 2025 at 9:07=E2=80=AFPM Frederik Br=C3=A6ndstrup via
lists.openembedded.org
<frederikbraendstrup=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Frede Hoey Braendstrup <frede@vokalo.io>
>
> ---
>  .../dbus-cxx/{dbus-cxx_2.5.2.bb =3D> dbus-cxx_2.6.0.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.5.2.bb =3D> dbus-cxx_2.=
6.0.bb} (96%)
>
> diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/re=
cipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
> similarity index 96%
> rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
> rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
> index 0908409e1e..79cf9449de 100644
> --- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
> +++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "LGPL-3.0-or-later | BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D24594f493407a4cd401ce9794e0b9=
308"
>
>  SRC_URI =3D "git://github.com/dbus-cxx/dbus-cxx.git;branch=3Dmaster;prot=
ocol=3Dhttps"

will be good to include ";tag=3D${PV}" in the SRC_URI

> -SRCREV =3D "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
> +SRCREV =3D "b705ad73bef724de0ed33f60462c70b380b6b300"
>
>  DEPENDS =3D "libsigc++-3"
>
> --
> 2.51.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122724): https://lists.openembedded.org/g/openembedde=
d-devel/message/122724
> Mute This Topic: https://lists.openembedded.org/mt/116827776/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

