Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.39.1605311627782336473
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2020 15:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Baar9Mlq;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id v143so10969461qkb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 15:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=41ugDJjkl8ZXdUaAIFeyGKfYAaHUqon3R4J30A4Ys2s=;
        b=Baar9MlqJyI/EMvZaiDS2pwXKwWYRPWivgcg63VMQ8yDeIXolBJTfnAVjQDtrnyeiY
         LguT1lcWtV+LMKivv7eJqRJM3mnkgVpUzST1aXa67UM8Avqr/H9ucYMqHUlDo7SAAnQu
         +K3lQz4jVONYqKtUfx77epv7SQc0crALRA0dS2HBfM08gxMnnUT1KEPa/C0cChWpUa76
         n2GR+s5PSFD8mrM+QgoOx5ypmcZOEt8V107qtPSZY/lHNbufDe89ja2blu3N9uDm+maw
         WO5aiJeXfQLi+odUG2T12FQIxMAdVjt9kr7VizUl0fT15AIobVn8rJ1xHgUVYzVYhQYk
         HgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=41ugDJjkl8ZXdUaAIFeyGKfYAaHUqon3R4J30A4Ys2s=;
        b=T1t1o5ngvBfdLZ9yTgU+ZzSQ+w6YpAKKIrkI1Zy/+w+I8lbN8WqprsZ3UduMjeTijq
         JP/IoIgvh5HIna2nciHgE7T5PlYDp+pOLb3F4XoV/2HPVoG5ZN3BLpW86ow/w1/XaxXo
         cxN3wuVdC/1JRqnkCAWHigrciKznDMB2wO+JuEo4bPQDERZBRG+6QnKrjW+4rSSFtFJB
         wqEHmqK3E14NoNWa/e45xDSiy6b9g5hcvxMZqcGxxzuxwRReRIhMRKdv4jaSUoevt5K9
         /QzBwH3/WuOK3eio9hn3SBo1RM/zdBcwb4rKTAfm0AKqV2bj0u6FVd1CW4pAasBX5Q4C
         C6/Q==
X-Gm-Message-State: AOAM533GJlCUDIs82W2xpdGjwbe6AzSKV7NIrcdt9kJxBildkx8aFE+Z
	5NKvKxo5XzgrvfsT3vS5uQ6WzsNNn3gRIXVhTyM=
X-Google-Smtp-Source: ABdhPJxHJPujH03ITprmZN4HN29/um/hXXNZ0Fq7/8gcRDwFXBcMHfTPPAtyZdD+8R95BOa1cHf+JSo2xu2h8AcM3a4=
X-Received: by 2002:a37:8944:: with SMTP id l65mr319892qkd.9.1605311626812;
 Fri, 13 Nov 2020 15:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20201113184045.44235-1-toertel@gmail.com>
In-Reply-To: <20201113184045.44235-1-toertel@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 13 Nov 2020 15:53:20 -0800
Message-ID: <CAMKF1sqp6u=NOxP+hsFBxATN65YniNc9N=myyZTmW3AJp20b9A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsocketcan: Add PACKAGECONFIG options
To: Mark Jonas <toertel@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 10:41 AM Mark Jonas <toertel@gmail.com> wrote:
>
> libsocketcan offers two configuration options.
>
> debug: Compile for debugging. Off by default.
> error-log: Logging of error events to stderr. On by default.
>
> Because error-log is on by default the package config option is
> no-error-log to retain existing recipe behavior.
>
> Signed-off-by: Mark Jonas <toertel@gmail.com>
> ---
>  meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
> index 0debe47e0..917f5e684 100644
> --- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
> +++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
> @@ -12,3 +12,7 @@ SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git"
>  S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> +
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
> +PACKAGECONFIG[no-error-log] = "--disable-error-log,--enable-error-log"

what are defaults for configure ?
perhaps its more readable if its
PACKAGECONFIG ?= "error-log"
PACKAGECONFIG[error-log] = "--enable-error-log,--disable-error-log"

> --
> 2.25.1
>
>
> 
>
