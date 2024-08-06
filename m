Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2C7C52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 20:07:04 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.16697.1722974817694740570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 13:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IR81hucz;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db12a2f530so582297b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 13:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722974817; x=1723579617; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBlIHBMKhuhK2gD+9ikNoebgSNQUH8o3J9EMaZa0TtE=;
        b=IR81huczvtHxMUw6yMEPyCAE0C+i77YFcF+pBHXa1V/DFKlAJ6SY/XY0uG3n/PzTcA
         2Hf6YNRHobU5MG9T1XNZeUeXcUk5lzPVahmTKS90uKrrV9duXJhfpzd7B1IhHUL441eh
         +bBNSZ0jsg7yLANQqC1UeZEtwf3xrfvHgW46EhuVKr4JRex7bjjXL8ouOE/2ZAuRvh6i
         FwLz0htsDU4atPuQKLAVhvWgMRn8K5i7uCb6PKLBbm59phA+tmjLZ/ZqHpJ4ZI0uo1vF
         DFrG9kgF+W3QGoS/7y11aeS8DpMnUduZAea90eZaG9JzCExG7C/vJk0dkRG6wREM4yLR
         Sq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722974817; x=1723579617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBlIHBMKhuhK2gD+9ikNoebgSNQUH8o3J9EMaZa0TtE=;
        b=Q2tXPvwSQCskHMVIbMpZqt79D4umVDMZUGEfjmubkf/pMGasqIeqebCvBDBC8+LEt8
         qhWA3/JzTj1EGz4LIOPnQVpeOcb6BBbKd0qdlfBHviCeTmCf6tuXNWO6r6rakExIXswK
         QlIzbHB4wViJPGQxNQi9mb6dIrxRWX00nDrE8RqlwvlJZuAFzOUEIFISqEaSIs80ljUY
         k+kAPkgo9TTmBKxTYRgi1wIJolaOuZ0k/OfdVitmvBXdlz1Ewua1CtStb5tfbFyxlYe6
         x21OasX72CK7g2xQTDZLzgx+Gx7Qfw8K+vaRwbZuUcLm5jguFWZi+JbfEDeQTfTtgOms
         9voQ==
X-Gm-Message-State: AOJu0Yw0mssQNzj6QY+mdIec/Twwl4NJqDh5COd67mItj+YmINVkq2+t
	ZNCdsDxZI1ImcESmNUAWu0BoMqzApc9oOVesusxecw5Yy8BHWHaWI8M1BxBIFAXe++RVHjpsLhs
	RaoSFMLzr16lTMPUxDcqSZbvhS6c=
X-Google-Smtp-Source: AGHT+IH7bZ4dcvif0hhGOTGqgt/ukB6lxX/jYP5JGivHJaw7G3jJBbMK9efANxX43nNat/UxeHm+eFUceSCQYMePnTM=
X-Received: by 2002:a05:6870:7189:b0:261:1b66:5ab1 with SMTP id
 586e51a60fabf-26891d6506amr20436759fac.21.1722974816879; Tue, 06 Aug 2024
 13:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com> <1722933994-32549-11-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1722933994-32549-11-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2024 13:06:31 -0700
Message-ID: <CAMKF1srfKrSmiY+eoAPLU8ifAguZRoSKp_ZdOLqLXdUt_eRHsw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 11/60] hostapd: upgrade 2.10 -> 2.11
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 20:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111595

On Tue, Aug 6, 2024 at 1:47=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../hostapd/{hostapd_2.10.bb =3D> hostapd_2.11.bb}              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.10.bb =3D> hostap=
d_2.11.bb} (91%)
>
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-=
oe/recipes-connectivity/hostapd/hostapd_2.11.bb
> similarity index 91%
> rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
> rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
> index 44683bf73..693afe6c5 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "User space daemon for extended IEEE 802.11 m=
anagement"
>  HOMEPAGE =3D "http://w1.fi/hostapd/"
>  SECTION =3D "kernel/userland"
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://hostapd/README;beginline=3D5;endline=3D47;m=
d5=3Daa03b8bd6216d1a7ca01fd4b89863073"
> +LIC_FILES_CHKSUM =3D "file://hostapd/README;beginline=3D5;endline=3D47;m=
d5=3D8e2c69e491b28390f9de0df1f64ebd6d"
>

what changed here ?


>  DEPENDS =3D "libnl openssl"
>
> @@ -14,7 +14,7 @@ SRC_URI =3D " \
>  "
>
>
> -SRC_URI[sha256sum] =3D "206e7c799b678572c2e3d12030238784bc4a9f82323b0156=
b4c9466f1498915d"
> +SRC_URI[sha256sum] =3D "2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e3=
30219fe7aed1747a"
>
>  inherit update-rc.d systemd pkgconfig features_check
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111529): https://lists.openembedded.org/g/openembedde=
d-devel/message/111529
> Mute This Topic: https://lists.openembedded.org/mt/107747828/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

