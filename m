Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.17299.1599726273728513159
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 01:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JPCiNr6d;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id h6so4215725qtd.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2020 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQQE2kn1LFFPHycjDxJ0/ExtI1COT2M5la3H13Cl6YI=;
        b=JPCiNr6dxM9ktaq8gQxho/fdR/XcG8vkoc1YpH8fs9xfI9NAlhHhkAIU9yD8qDnvzT
         NUWvlMp9O9LGQlby3FOht1VO4MMFu8UdaNlLFAZ91sRM41xmrBGB9uQGFJgukP7T0DXq
         mcLVyY0uPeTWIgNfmgNnn/GC787MgZ/lmN9aCDOspL0iH5uxpplRet1T9XAzZ9aXdon4
         Vi9UMFVhdtxHjhyJZNQU9/C9zjMh/xlzC95okL82CwDgaWT3VofmPY4hI0onZEOh7BBZ
         jATc2+4AtdUJ1D/uKLWpZGdRFqyDcvEXKg6F7pEs6A95z36WJF4Hq6DjK1PMcS2+q6pJ
         NarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQQE2kn1LFFPHycjDxJ0/ExtI1COT2M5la3H13Cl6YI=;
        b=MB9MOSLV6oblBif9+a4k/nWoYiBbYRU4HygkR/xqvbVEUB59xtzQtr4pyAgXLHebwh
         bzKr4ven0KLoDyaTFKaZn8x5RZXS9ht9mNrERwlQJ2Rgu13iC5fN3TI/4zOXZYE5FcOp
         LMAM16LXO/HA2D7TF4CR9z/6Nky3imagDO3bGU3wyvzhAyUxSgR2lExCzUQdKmBQVVR7
         lMQfj3iWwsBwOE+zFz2wJBIsAZ7wfGJ2JYWtGqD4HYfiLnfyKozggsfE1jLjmyyOds5d
         5eV90vP05gowGSMxXpJjqpR0kzTodNMau4XBrgLrzcUENVAOh0O/H2lGksFtmGeD9msp
         EMPQ==
X-Gm-Message-State: AOAM532xUd7mybCC1Eev0DtG7PvIl+yKqQpUmcfytd46MUAAhMbqqZBT
	HqcUn/e+niWzNhUc3hmg7x04M2BeXTphF4D/ro4=
X-Google-Smtp-Source: ABdhPJwOYnK8g9dGL6OB6hSuIS282j79S9go8j0auKuhKag8DGo6YFcy0sq6EGu79HRQ1z8Cjujq12akso+HboAAU70=
X-Received: by 2002:aed:2646:: with SMTP id z64mr4832185qtc.194.1599726272783;
 Thu, 10 Sep 2020 01:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200909122322.12899-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20200909122322.12899-1-fabio.berton@ossystems.com.br>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 10 Sep 2020 01:24:05 -0700
Message-ID: <CAMKF1srzvFAy_OkLwvxK=Q1R2+FM7FNVUE2820VBtR=CCUzQrQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] modemmanager: Update 1.12.12 -> 1.14.2
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

clang  build ends up erroring out

https://errors.yoctoproject.org/Errors/Details/498792/

It seems --enable-more-warnings is gone in new release but then maybe
it wont compile with clang.

On Wed, Sep 9, 2020 at 5:23 AM Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../{modemmanager_1.12.12.bb => modemmanager_1.14.2.bb}         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.12.bb => modemmanager_1.14.2.bb} (95%)
>
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
> similarity index 95%
> rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
> rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
> index b0ab46f3f..6b5e73ba4 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
> @@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
>  DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
>
>  SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "a4fc4b33c0e8ae9372885f86fa033f3c1a89a76cd59a3458670eff1824222a3d"
> +SRC_URI[sha256sum] = "5fb5553aecd6eb9d6d8ecd130a24f3461e5f93c5f91a0e4ae0508b5228e8b0be"
>  S = "${WORKDIR}/ModemManager-${PV}"
>
>  PACKAGECONFIG ??= "mbim qmi \
> --
> 2.27.0
>
> 
