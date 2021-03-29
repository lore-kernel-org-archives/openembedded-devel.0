Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.14648.1616976292313468517
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 17:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UrduSHeQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id y18so10907656qky.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 17:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ULAWaoDsyq0nNEBFz3Nv+4J4UtDmC4V/UU4k9WUO6bo=;
        b=UrduSHeQt5x+pWuL8dFiyYh6FIPNLMIElQL9ebwe+sNRoA6+M0Iuv5u6wtOqz6n48v
         x1KtrVIgsrj8NGywgAnz2vurPvyvXjRov+xTo6Pgs7GRLShg/vNqNhNN2aiw6gpQljA2
         IzPc8lETNB2UwTgvRuTOkQmzWpUXLwsrshrLbu2pDXowjdpvjsGO5EXAo/HButYh/eaV
         LHqD9OGR1Nl5/OEDW3WsgSzcv/gOlFduTiXu94D2AVDGASS8kWgz8BTxvCKWTwP4ZSrA
         TMcXlcArZQkQfHJRH8k8EuabmJ6d0S0utV5ZSg4Eoqk8ffexsgsLqKQcYEmiVBk5BsBX
         HO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ULAWaoDsyq0nNEBFz3Nv+4J4UtDmC4V/UU4k9WUO6bo=;
        b=WjEc7csK6QZOU3KWhCu5u3SF0hbekAwYLJm3nlXm90+qHrhdXK+6KUMb98/D2eVoLh
         irFuM6PimvGRgmo9FLwDcaF+Ad43ZZOw+iGyahuUZVDu2jKb1Xt7QUbIIEpQqdZsb8XM
         G7gIPc8U1lE6ge+EjepYpWuVsO8b6NFnbqe8OSlTKntgMgLnRAegttLC/J6itjfgkpFS
         IrlDm2HXUxd+GgPCmLl2x04CNS/VefkrCDsFiW0eyzpTdZKfpwbUQmBNwHunvQp/0z/K
         xvh9DQuVjaYOSf4UuZm3uaWgYLOpTEqvpeHvZQQd6myvNCFjM5K1pOySRydbCC1pPtHf
         SKvw==
X-Gm-Message-State: AOAM533TW0hB/t1JOQXTVsDXYSD4ur4P9puqp3JB4sKvuJQfWFRv7xtB
	uLeiSaqCoZ9S+t81fD4BxIdG6XNpjlBjh+b8is0=
X-Google-Smtp-Source: ABdhPJy+Sg4c84E3RfPAZQIlP94TT9EvFBjO4BEXoUTkDb5voYvx7l1QW6GGMfV7AvOkRHxRWp3IXfY0DMdSKzyTMDE=
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr22849544qkl.125.1616976291262;
 Sun, 28 Mar 2021 17:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210328232516.2563896-1-bgampe@digi.com>
In-Reply-To: <20210328232516.2563896-1-bgampe@digi.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 28 Mar 2021 17:04:25 -0700
Message-ID: <CAMKF1srwZDr0umBuV_iabTvaNWWkPWBncoQrADc8PzHTsJ7Q-A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-httptools: new package
To: bgampe@digi.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

please add new packages to test packagegrooup as well in
packagegroup-meta-python.bb

On Sun, Mar 28, 2021 at 4:26 PM Ben Gampe via lists.openembedded.org
<bgampe=digi.com@lists.openembedded.org> wrote:
>
> Add recipe for python3-httptools: a collection of framework
> independent HTTP protocol utils
> ---
>  .../recipes-devtools/python/python3-httptools_0.1.1.bb    | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
> new file mode 100644
> index 000000000..164a32d64
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "A collection of framework independent HTTP protocol utils"
> +HOMEPAGE = "https://github.com/MagicStack/httptools"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "41b573cf33f64a8f8f3400d0a7faf48e1888582b6f6e02b82b9bd4f0bf7497ce"
> --
> 2.25.1
>
>
> 
>
