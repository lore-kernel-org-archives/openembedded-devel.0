Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.4883.1615531004108665540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 22:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FVM+1G6d;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id t4so23347305qkp.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 22:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h0Y1Bia6nrhHFLZTg9eqmTIrMIDOW2+Q7GnOPQONYak=;
        b=FVM+1G6d98lDT3I8+9Sd6dktAkv7iHseMVfXsGIkvGPU2xM1tekYg8JsRN8s2itlz/
         nJdad2s08y8idXrEWI/MpvGcrBFxIxDCN/jyfCMgPl4snWJJU1XwTZxdojFkiAjbZN24
         UpkaPANo11H1KJ3aiVvNfwU2vU0QyF80xqI5D1dPvHXtq0nNPf53+7H+ndHOI7X1f70p
         fsvduXavwfyZA7kqfoCsvUbwc17iHiz2I0pN9kRq5Jby/scTnIuw7IqIHeti2sG+k+/y
         GH1gPRKp5xBJqI9ldsMZOqZxGR5YFPhURX3oPfD4wSOkYa8syp+hYm6hroS+9Gz5b3yU
         R6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h0Y1Bia6nrhHFLZTg9eqmTIrMIDOW2+Q7GnOPQONYak=;
        b=tGxs/bPSjNuHE00h2NHoCkr9PsJLAYozd3Z2Eiv/pi480rcmvIixMYVck3eqtth4RQ
         +lW8EhWDDa8DXf7oK4ihWbE3mhlYNw4unnTDHB24Wk5jkFM3zEyWof1Mpoe+LeKb5Dsp
         uAEDyt5ZNEf7snfV0SbUTiG1A+RyvdGMid4SGUt4nWwtdY4aMUjzYvuZtp7n3//8oPBU
         pcEeLRjilC+SwCE9wpoXo5zG5caGvlhpWFxtAHoLvxkOjB6fBnGTIc3h/Qt5538O8WTp
         uvtmva4U+6RfqN9ojxNZ+DflfRbie+yxUhSEJl8F5SFYnyBQyq63FEgQcu2FbnGeFfHR
         c7EQ==
X-Gm-Message-State: AOAM533sjHT8/O18o836/hf+lPjZjPN74pgWDKDeGMgJg35Fm+TiFvHy
	DfyzOSCX2a07VYknlNVeyV4I+GM2tG88lDSTHUU=
X-Google-Smtp-Source: ABdhPJzTlxUiXvS2wWD96DRujsh0KU57ls7hpMTPq20z8PmyF2DWekmSihcBW5TC20dhrxQYawjrAwwejsHRnGUfmwM=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr11259946qkd.381.1615531003225;
 Thu, 11 Mar 2021 22:36:43 -0800 (PST)
MIME-Version: 1.0
References: <1615523098-8089-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1615523098-8089-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 22:36:17 -0800
Message-ID: <CAMKF1sqgwtV3zkVRVq0KuQbhsERzJLxdjtOwLgHRZ1H3sHtPLA@mail.gmail.com>
Subject: Re: [oe] [PATCH] czmq: Conflict resolution for sha1.h
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 8:25 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> libmd(oe-core) also uses the doc 'sha1.h', so package it in own subdirs of czmq.
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
> index e742d2a1c4..56b688cad1 100644
> --- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
> @@ -30,3 +30,7 @@ PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
>
>  BBCLASSEXTEND = "nativesdk"
>
> +do_install_append() {
> +        mkdir -p ${D}/${includedir}/${PV}
> +        mv ${D}/${includedir}/sha1.h ${D}/${includedir}/${PV}/.

It should be BPN

> +}
> --
> 2.25.1
>
>
> 
>
