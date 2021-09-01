Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.22.1630520645509860548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 11:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kKaDh9xz;
 spf=pass (domain: konsulko.com, ip: 209.85.222.174, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f174.google.com with SMTP id ay33so402628qkb.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Sep 2021 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=20SjLzAXWgCW9mT63d6kYKaRch7mhUhVfU6dRFilgzw=;
        b=kKaDh9xzFIsI6df5U1h3NDnjvE7Rz9FnTA+/CNwiGAHC2r4zBzypfeTAZCxQ353k97
         ShPq3LgmFRaaf/8fu+EHB9aPaEeCEz/GnZDswlEwTyuDjQNw/t+CnHNnCd9n9y1KWzLx
         d/e41uKVtG0EqLRCfZSVTt9kzUKZU4MJenc7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=20SjLzAXWgCW9mT63d6kYKaRch7mhUhVfU6dRFilgzw=;
        b=Jyri0unowwnRkdCHUKEBuPcKOa1dBocvhmhkFKEh8FDtqUyFaPA3WXhwPfE6JpN6ps
         2AcFrUdCc4ROWbjAGbnMEu7YK2rIHAdw0KxWgNGEcQFsTH7qi2/eunML32Vo4htSA4vm
         VJ8cGX/MOXHrLp6S1X5T+ZRie0MstBxCgjQ2MJbgpd/nax8c0fBp6MmWmMtvm9kgP8/b
         aPFmUswulwEkZOYzPSBDPaoHBsWsrhlAlKaIYLlDkCU5xDukGoLgRdx0wVIq7/NbRRQc
         I5VNkLv+dAm1cOjnJU5hos9aAzkljD+XxQqE2+qQmePhANmhCP6zMdvYckw8G7VfsevS
         XwrQ==
X-Gm-Message-State: AOAM5311CihXfGPSM1kwOU0TpJdK5I5Jnv0gSgYr0lqdf3F0Fsx8Emxg
	DilIhxgfZ0kzyZCnx6CmhP476g==
X-Google-Smtp-Source: ABdhPJxNbLUmCRHFQaaQYh63uSo36kES/FIyhRsrsuq2EsYDdxhotRxxCwuwspnZYCy9t9+OyQYKlw==
X-Received: by 2002:ae9:c007:: with SMTP id u7mr936258qkk.271.1630520644601;
        Wed, 01 Sep 2021 11:24:04 -0700 (PDT)
Return-Path: <scott.murray@konsulko.com>
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id g19sm205153qki.58.2021.09.01.11.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 11:24:04 -0700 (PDT)
Date: Wed, 1 Sep 2021 14:24:01 -0400 (EDT)
From: "Scott Murray" <scott.murray@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: Upgrade to 0.3.34
In-Reply-To: <20210901152108.24811-1-raj.khem@gmail.com>
Message-ID: <1306bb1-e75e-6481-47d9-39215ae41a3@spiteful.org>
References: <20210901152108.24811-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Sep 2021, Khem Raj wrote:

> Enable systemd user services as well as they are required for user
> pipewire sessions
>
> enable pw-cat which also needs sndfile enabled
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../pipewire/{pipewire_0.3.31.bb => pipewire_0.3.34.bb}   | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.31.bb => pipewire_0.3.34.bb} (97%)
>
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
> similarity index 97%
> rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
> index 1c18ba0328..33b5d88a2e 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
> @@ -11,7 +11,7 @@ SECTION = "multimedia"
>
>  DEPENDS = "dbus"
>
> -SRCREV = "c43dabcc96e2e072cdf08e5f094bb677d9017c6b"
> +SRCREV = "1924c2c29824955b5e763f1def6967f68e403c7c"
>  SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
>
>  S = "${WORKDIR}/git"
> @@ -46,7 +46,7 @@ USERADD_PARAM:${PN} = "--system --home / --no-create-home \
>  EXTRA_OEMESON += " \
>      -Daudiotestsrc=enabled \
>      -Devl=disabled \
> -    -Dsystemd-user-service=disabled \
> +    -Dsystemd-user-service=enabled \

Shouldn't this perhaps be tied to the existing systemd PACKAGECONFIG?

>      -Dtests=disabled \
>      -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
>      -Dvideotestsrc=enabled \
> @@ -54,12 +54,13 @@ EXTRA_OEMESON += " \
>      -Dvulkan=disabled \
>      -Dlibcamera=disabled \
>      -Dman=disabled \
> +    -Dpw-cat=enabled \
>  "
>
>  PACKAGECONFIG ??= "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
> -    gstreamer jack v4l2 \
> +    gstreamer jack sndfile v4l2 \
>  "
>
>  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> @@ -250,6 +251,7 @@ FILES:${PN}-media-session = " \
>      ${bindir}/pipewire-media-session \
>      ${datadir}/pipewire/media-session.d/* \
>      ${systemd_system_unitdir}/pipewire-media-session.service \
> +    ${systemd_user_unitdir}/pipewire-media-session.service \
>  "
>  RPROVIDES:${PN}-media-session = "virtual-pipewire-sessionmanager"
>
> --
> 2.33.0
>
