Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.10644.1623257485291682409
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 09:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PxDgimcp;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id g6so18842200pfq.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 09:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mtv1H1jTWxIpvj/qXmY/XduGQBl29hcKX1ZbuPtLP1c=;
        b=PxDgimcp8F/8n40FV2ULFNalOqCRKtFY+/PfltJ9mX47S+riSh+cvzix76YMHxwHAx
         itntH3vtvfkSxnl4A9JQUuf6LxwyG7RqZV2556LXcchTpPa3p9Rb0OVAu+UQmRQnqgE5
         BrkVoLXOA9ixxWswROQhr4jEhQ6PvdcwCdbB1de7DPJUamRal6mrwqOaQREDIaI9Z7XZ
         mGQiS9txrXIi1f5T/YMaZ/ffNhzHUpDH3PeUWV++vx4s+dMhBc1gQTZYASohBdn1wQ1A
         iwKOCWN7rN767wZcsxEWJspDVFCIlETw1p1dGZm0EftbuGkXsKx3Z6KEsnJwHw0EKwyx
         Gjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mtv1H1jTWxIpvj/qXmY/XduGQBl29hcKX1ZbuPtLP1c=;
        b=WJwI+gzX+pVIyk7rhZTl5p55EGV1DwCg8OdwCPGhLsX8/rX/Bpi7/KcSVw2yZ/QDKK
         PCznClkap/0SY4hly6BDdWPGCqaKDZJ/qEi8Z8XJOeLT5mUuqOaXixOmGDpZaUfYwBkV
         5BKKw4zbJS+2xvGA95vmAlP64xWIxHPBZam9QeBhBR1Q/MXJYzeSuiGN6OgfrqpTKX0J
         2zK6PBYL5Y1eJZsQEZutKljS06pKLICJDzNySbA2MJ8UY7Dyl7+ILMlyYP5y3hSv81l7
         bNI5dTfmgoTG2Rut4kqHbXLX6qY8lER67dMJTPUGhbEHNUEdV3b1Djz1WVCF2q9kuA5I
         P8BA==
X-Gm-Message-State: AOAM531H+wIMs1WiccVgOj26ruhQnGKNFINfyW8/IEHGDAckVE16dY0b
	p+JdKO9nU7G9DUUMcQbUdyhppqB5X1+Hj8Nb4r0=
X-Google-Smtp-Source: ABdhPJwB+QJawJRW9lxD1r6FE/prxL/bljxbqi9nPkhBjyuM5Iho+tonfgI/AUmp2qkK/1FipoxqpsMrAHCVRT/4kow=
X-Received: by 2002:a05:6a00:bc1:b029:2f4:3461:c2ae with SMTP id
 x1-20020a056a000bc1b02902f43461c2aemr445611pfu.9.1623257484824; Wed, 09 Jun
 2021 09:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210609131446.783106-1-luca.boccassi@gmail.com>
In-Reply-To: <20210609131446.783106-1-luca.boccassi@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 9 Jun 2021 18:51:12 +0200
Message-ID: <CALbNGRTFQoNGokvs15aaej5_mZAi1ASRk8Dq4tAFP3db3cxJ=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dbus-broker: remove deprecated linux-4-17 option
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 9, 2021 at 3:15 PM Luca Bocassi <luca.boccassi@gmail.com> wrote=
:
>
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> Removed in v29
I was sure to have looked for that. Looked again: The option is still
there but it was turned into a noop. So

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta-oe/recipes-core/dbus/dbus-broker_29.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/dbus/dbus-broker_29.bb b/meta-oe/recipe=
s-core/dbus/dbus-broker_29.bb
> index 49ba16911..c59809f53 100644
> --- a/meta-oe/recipes-core/dbus/dbus-broker_29.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-broker_29.bb
> @@ -29,5 +29,4 @@ FILES_${PN} +=3D "${nonarch_libdir}/systemd/catalog"
>
>  EXTRA_OEMESON +=3D " -Dselinux=3D${@bb.utils.contains('DISTRO_FEATURES',=
 'selinux', 'true', 'false', d)}"
>  EXTRA_OEMESON +=3D " -Daudit=3D${@bb.utils.contains('DISTRO_FEATURES', '=
selinux', 'true', 'false', d)}"
> -EXTRA_OEMESON +=3D " -Dlinux-4-17=3Dtrue"
>
