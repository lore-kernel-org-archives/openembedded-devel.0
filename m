Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.6426.1628397446805924752
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Aug 2021 21:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LLVFnxec;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id c9so14656125qkc.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Aug 2021 21:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+Hd/5uuchu9SaGyQ81dOOlkXSK3PanVOiesuYvtb74=;
        b=LLVFnxec6nxr+Du55Eqr+iXylb/gvxAmJ6bA25Gp9f1MaEDqV2EOam1a0IsuJMwunu
         60z+fgvOHiBTt/SxyDRh8x449G49tub2MF4dwZgxd2P1unt836shQQsOzadvwxmUBdaI
         v7Jejz3RO3RL+NNh8Np67OyZ2f8RutB0YUl7/cf39QFFvulWZmp3J2coR4nLwK+tVeCI
         1LDwDcWJKTmCi0GQgS65DakE04nC0CGVGMZjxl9UVXPYDBtFXi4nH6JWbK/iH/Xh+DCN
         ItM8PbbpJg1ZIz92j7M6JS4DW0VC8zJSpV0m2Q0CQeZ/B7y07bRHnNQgcbcL01epQa/J
         k0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+Hd/5uuchu9SaGyQ81dOOlkXSK3PanVOiesuYvtb74=;
        b=Hcu41B/whMMyCc0EXp9j9cgmKQes+mCiaPHRfkybjWDItUyxqVRfQHeKeO4cBcdfO8
         VOCJqXpSr/7UcXJ+KYGX7sRUu9ehirJ+B9w95aQZtG7UmbCPrPn9QIaBGqpFeY1QF7um
         GTX7ZMDIkYhsSM5CDMmi3/x8UZOdJ+XD3UppW5CUwFzjcq/2SNqEA3uaQqncSmG2nT/d
         2kUZR3Tkc/f8jyZEAUh2c7QpGrc+2uHdGDd8lfI1DF8f3Yo6Cl4MQCqLpucPvci08iqn
         uKhzKU85hNL7M8n+yKSuGrwX7u5ECqdNrTjTxvZ8U6wa2MXDjgD0924pRGOnfl8Hr5eU
         PTRg==
X-Gm-Message-State: AOAM530tJoQwM7nRDqK7HuMhGlqcLD1sg+c82ZwugGTP0ojxLAlLFBXc
	9Mb8PUztQVh6EhAPmYN1/qE/RRg9bA3U3/HOPBY=
X-Google-Smtp-Source: ABdhPJz5AI7zgc3bVrudwV18OAPmAA0p9WuYyyX1YMh3MCQ0kXoE49jOl/8OS6kmWbcGgsXlUCj0sA+I6r6rKAScTYc=
X-Received: by 2002:a37:9a17:: with SMTP id c23mr725492qke.25.1628397445936;
 Sat, 07 Aug 2021 21:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210806215045.3036785-1-maxims@google.com>
In-Reply-To: <20210806215045.3036785-1-maxims@google.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 7 Aug 2021 21:36:59 -0700
Message-ID: <CAMKF1sqDbkkGjO5PvjBVYEJzx=y7QG3n6YTVj2mCMBWjDPREyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: libusbgx: Configure the Devices Used
To: Maxim Sloyko <maxims@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 6, 2021 at 2:50 PM Maxim Sloyko via lists.openembedded.org
<maxims=google.com@lists.openembedded.org> wrote:
>
> Add ability to configure the UDC used for specific schema.
> The feature is backwards compatible, so existing users don't need to
> change anything.
>
> If one wants to specify which UDC is used for specific schema,
> for example, `eth0`, they can add this variable to the configuration
> file:
>
> UDC_FOR_SCHEMA_eth0=f8000000.udc
>
> If the device file exists in /sys/class/udc when the gadget is started,
> it will be used for this schema.
>
> If this configuration is not present, first available device is picked.
>

Thanks for your contribution Maxim, it looks fine, although I had to
edit the commit subject line to remove meta-oe from it
commit msg guidelines are here for OE
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


> Signed-off-by: Maksym Sloyko <maxims@google.com>
> ---
>  meta-oe/recipes-support/libusbgx/libusbgx/gadget-start | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>  mode change 100644 => 100755 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
>
> diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> old mode 100644
> new mode 100755
> index 1a106b785..9e22671a9
> --- a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> +++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> @@ -7,5 +7,10 @@ for i in $IMPORT_SCHEMAS; do
>  done
>
>  for i in $ENABLED_SCHEMAS; do
> -    ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
> +    configured_udc=$(eval 'echo ${UDC_FOR_SCHEMA_'"$i"'}')
> +    if [ -n "${configured_udc}" ] && [ -e "/sys/class/udc/${configured_udc}" ]; then
> +        echo ${configured_udc} > /sys/kernel/config/usb_gadget/"$i"/UDC
> +    else
> +        ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
> +    fi
>  done
> --
> 2.32.0.605.g8dce9f2422-goog
>
>
> 
>
