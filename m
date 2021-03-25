Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.1453.1616687990636073270
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 08:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BSXuBay4;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id v70so2242173qkb.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 08:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WS+yWxn72yknl1hI2SO0IryFKbwQ2RNQ/0TzZyl8Ou0=;
        b=BSXuBay4kaplg436CWeXCD1QBc65innbM5mAvgN2xJay7hO2lK/8lmLxUVYZ49Zi9T
         gwEvzSqWT5KOaQmjcNUYPbnapSByBmlV0CN3kib5Ukz65qHb2fulRVga7hDt2vzUOZv5
         uLc9FDzn54jOjHWoQG9KcNduySJziFXVjnhqIrPZ8WiapHCDDcM9tomIYeHeyBun2KWP
         5ab4X+iylJIBr+4XPYEYZD08i8WNY0mhVKMcQ6gPR4IMxgArzuEZ1Bd4AvrAhtkVkSyR
         Xa1S23n3bZmBBTNMP4x7kckaHeIPWJM+dfH0T/sBQ/1vrUdQplX+SZweSNuyazj7F8R2
         idGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WS+yWxn72yknl1hI2SO0IryFKbwQ2RNQ/0TzZyl8Ou0=;
        b=Fs2AIYg50DiU9dnyhTBq9W8mGgczLDhfSp8y2pxYOuVOPec/a3FUzeeZCPBgoiJD4A
         wt777xoW4i50m6lvrkMwgNwfP/JyPofPBdL0Zu6htdrkt0QytuNpoi0/s3sUtLeK6XH+
         PxwFl2+oXmKU1EaAVx45XMu2AwfhOQ/fwiAmBPV13FbRFDwTp2qw0aGkJFpWtHmGX1rT
         lQpoSCFBdzF3QkqYv4GfXNTTQgvTHg2vwb9T1qOEGL3qOfkS9NglpMQ7RP14myPsEwA5
         iEynBZI7XdVfxdKPqLoWSb2CFuUvg5DH/HBT22XBr+pGU5m+A2z4J/Uh+Obl3SSli8LG
         asCg==
X-Gm-Message-State: AOAM533t55j91l8HbHGq/5l+spEDUd//25izsb6Iw4PpUrNru5qgdP/o
	L7n+/AT+oGn11MDioYvwOSEwRfZ5B4iwioq2tEU=
X-Google-Smtp-Source: ABdhPJwn5I4m+y3902qQNMqYP3CwDSgKf2UJwsXMuJvFYUysPA0cEmzQKpqWycILFy3QeO5Z80lTl3zPtyJLtIdbgpM=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr8763235qka.119.1616687989729;
 Thu, 25 Mar 2021 08:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210325155401.37285-1-dzagorui@cisco.com>
In-Reply-To: <20210325155401.37285-1-dzagorui@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 25 Mar 2021 08:59:23 -0700
Message-ID: <CAMKF1srwLM6vDDe5G30WjgbW7PNnjNJAmquq4fxhbMBxHYR9RQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] bpftool: remove recipe from blacklist
To: dzagorui@cisco.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 25, 2021 at 8:54 AM Denys Zagorui -X (dzagorui -
GLOBALLOGIC INC@Cisco) via lists.openembedded.org
<dzagorui=cisco.com@lists.openembedded.org> wrote:
>
> Have not seen build issues for 5.4 and 5.10
> kernels so allow to build it
>
> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
>  meta-oe/recipes-kernel/bpftool/bpftool.bb                  | 1 -
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index c717d45e5..eb3d51c62 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -597,6 +597,7 @@ RDEPENDS_packagegroup-meta-oe-graphics_remove_libc-musl = "renderdoc"
>
>  RDEPENDS_packagegroup-meta-oe-kernel ="\
>      agent-proxy \
> +    bpftool \
>      crash \
>      cpupower \
>      ipmitool \
> @@ -613,7 +614,7 @@ RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 = " libpfm4"
>
>  # Kernel-selftest does not build with 5.8 and its exluded from build too so until its fixed remove it
>  RDEPENDS_packagegroup-meta-oe-kernel_remove = "kernel-selftest"
> -RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash intel-speed-select kernel-selftest minicoredumper turbostat"
> +RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "bpftool crash intel-speed-select kernel-selftest minicoredumper turbostat"
>
>  RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch = "makedumpfile"
>  RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> index 1758430bc..e58bdd493 100644
> --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> @@ -32,4 +32,3 @@ python do_package_prepend() {
>  }
>
>  B = "${WORKDIR}/${BPN}-${PV}"
> -PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"

will it work on all architectures ? I wonder if its better to add
compatible hosts that you plan to maintain.

> --
> 2.26.2.Cisco
>
>
> 
>
