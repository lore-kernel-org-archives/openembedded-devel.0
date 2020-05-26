Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.483.1590535113223490274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 16:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h5ueORnS;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 205so9475399qkg.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 16:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hi+en5EJXjAlY8f4tLRGJV4Qgnl65kVTVuz/i3Ua308=;
        b=h5ueORnSYbNXgahxQ/pRbUqjksRHM9YfPOY2ojPvwueaDWmuwhJv+Hu2Dr1vEcm29l
         UceKfNe3nbZFHQFeQd4DhBn8nGljmzx9PPp+0b0fy5WL7melS/gpn7AetZeirCrCUu1q
         skMLwiZByvUqj+w05M+dgItbutaB9uqKmvwK/hVCkuPCGhO649MgCgNLWQ2EWKoV7l/G
         CDofh7iQCPnIlGrmikCR7n7JAyf6D5UYQoY/9p+LajxKXzVNkB8GfGarKDcPnu5DOfpe
         WgzxmwQVjaKVeZewvzQArTQB+NDA/jWki72cVKTflBt+lpmMxpEGQcRBpTfnQpTKNcYx
         uV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hi+en5EJXjAlY8f4tLRGJV4Qgnl65kVTVuz/i3Ua308=;
        b=QWYtdLhkv/rsTZfTn/9DlaKznJomF6Mzq0gM7wsP6PS8pBGDjCxksg5C3th0iUcX9A
         6hNrUWDkm9UYWeoBYJH/q1Ug8B+gdIpUdvY0AwqBMBPRoOWI6hXQ+H+SvgLGxvo1W7i6
         vRgnXzDJTyrrZczOZN9cCuvSogRcfjvOPl5d/CC7sxDAWFWFmAlvK6A40TToMAfhR+uD
         hvh39sY2nH7dsHMU6fpb+cVyFsWIyDEU+afQ1OqEd6iv9jKByftgYJTaQvUR2+lqV830
         /A6OSToAybs+bApV+aijIbJ9V8bhwnyrTtTuTo58/zuoZiIPHMyEBIWDHdXaWbFXQJoQ
         eZuA==
X-Gm-Message-State: AOAM530czdYtw+kf8HoWlom56kxngZaCnsao7I335pnIKFAHKu27M4XR
	Zz8PQ5z9qrNr5T4TSGRHlT9rZ8E+wsgnBkk1H9YIxzmE
X-Google-Smtp-Source: ABdhPJxn8ox6R7WilPyp9UG/a1PxgeFmr7CwnrbmPtsU+CCI9E9H2rpYoIy7BMO8jqCQQy+9HjnyhmEOJlXQgPHVMnY=
X-Received: by 2002:a37:7143:: with SMTP id m64mr1390274qkc.215.1590535110844;
 Tue, 26 May 2020 16:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2005251518590.6822@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2005251518590.6822@localhost.localdomain>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 26 May 2020 16:18:04 -0700
Message-ID: <CAMKF1sq2UQaxxdjZYMQh-jXmG5L-kre=xLv3SuaAEOZfFzu+_w@mail.gmail.com>
Subject: Re: [oe] [PATCH] use weak assignments for PNBLACKLIST in recipe files
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 25, 2020 at 12:21 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> Make sure PNBLACKLIST assignments in recipe files use weak assignment,
> so they can be overridden in, for example, local.conf files.
>

I would like contributions here when someone fixes one of the
blacklisted recipes. This patch will let downstream users host it in
bbappends or other places
what is the intended use of this patch?

> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> index c39faef8d..eee96d865 100644
> --- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> @@ -69,4 +69,4 @@ RDEPENDS_${PN}-server += "tcp-wrappers xinetd rpcbind"
>
>  # http://errors.yoctoproject.org/Errors/Details/186962/
>  COMPATIBLE_HOST_libc-musl = 'null'
> -PNBLACKLIST[netkit-rusers] = "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or directory"
> +PNBLACKLIST[netkit-rusers] ?= "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or directory"
> diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
> index 23fe2021b..c296c3bc1 100644
> --- a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
> +++ b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
> @@ -22,4 +22,4 @@ do_install () {
>      oe_runmake install DESTDIR="${D}"
>  }
>
> -PNBLACKLIST[drbd] = "Kernel module Needs forward porting to kernel 5.2+"
> +PNBLACKLIST[drbd] ?= "Kernel module Needs forward porting to kernel 5.2+"
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> index 5917cfb3e..4a1bbe620 100644
> --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> @@ -36,4 +36,4 @@ FILES_${PN}-dbg += "${libexecdir}/lowpan-tools/.debug/"
>  PACKAGES =+ "${PN}-python"
>  FILES_${PN}-python = "${libdir}/python*"
>
> -PNBLACKLIST[lowpan-tools] = "WARNING these tools are deprecated! Use wpan-tools instead"
> +PNBLACKLIST[lowpan-tools] ?= "WARNING these tools are deprecated! Use wpan-tools instead"
> diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
> index 21d110aee..2e3da7d4d 100644
> --- a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
> +++ b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
> @@ -27,4 +27,4 @@ RDEPENDS_${PN} += "\
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -PNBLACKLIST[nanopb] = "Needs forward porting to use python3"
> +PNBLACKLIST[nanopb] ?= "Needs forward porting to use python3"
> diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> index e40e1cd26..eca8dfc7b 100644
> --- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> @@ -11,4 +11,4 @@ inherit module
>
>  EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
>
> -PNBLACKLIST[can-isotp] = "Kernel module Needs forward porting to kernel 5.2+"
> +PNBLACKLIST[can-isotp] ?= "Kernel module Needs forward porting to kernel 5.2+"
> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> index 6683eccf2..1758430bc 100644
> --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> @@ -32,4 +32,4 @@ python do_package_prepend() {
>  }
>
>  B = "${WORKDIR}/${BPN}-${PV}"
> -PNBLACKLIST[bpftool] = "Needs forward porting to kernel 5.2+"
> +PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> 
