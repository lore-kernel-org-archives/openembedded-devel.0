Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.5906.1623400481255983426
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jun 2021 01:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vETjm69B;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id ci15so3333344ejc.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 01:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4qTbmRkmRcqffRm9+EynmYxI0zhOC5whS0wAvPobN4M=;
        b=vETjm69B/qsE/B0iFWXCYf8NPBzLnlbRF7pPsjPeqd0d2CdecKWZcGVV/39h15BBit
         4KvuzVYCO3px4i8dloojE3bj+uCjjeXVXQhso4RQg4GTJJmoqLLSmRyovhKi6gCFs5mb
         TSkwGq0ihV6ftmehiX+JU1bX4nORwfWwYfhMyCGQw/9esMb7gps9g9lKyZcq2dmdmWg2
         32RBLFzU/IchUqi+3QeM1tXHstDKE/5D7oKtjsNgRdBrEtqygGqzVjqn7RYXkoVGgOSt
         WaZgp/3Hj33fJP8KBlqM+zZY+8wZMKbN7/bBuma07WqKTOUyHBM9Qk0+s8o0KhEtGU7C
         I1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4qTbmRkmRcqffRm9+EynmYxI0zhOC5whS0wAvPobN4M=;
        b=JTgEtcBNqJFBzGyfxrT3gC1WZjmGesrN9TKc7C/xnaL2ujcIcvX5rHg9SUVL0dckHB
         ViuD7suGV1sjwtr9yGrjoJ7uR/32CYXUV9md75bqWjDmYYbsxqQA4TpwOtswcpoPRXqJ
         xe4/i1xqQks/nuO29waSIEOqSN73Gn+Wb1r87vD8CzZIg18b6oTJJXRR1uOnlgldm8/R
         U/GG185pCPOx15wwx6Arni5bOUb2g/fL5/Ls2LTQ+WmGoNDcvEAmxAgtXEg9YjwLAVh7
         iFaFACRy26cKR6vU1MNQFEYPwexZfjqMZ81mEFhrxnPzaeG7JD+Xcw0BV2aIMajCdsM+
         Al8Q==
X-Gm-Message-State: AOAM531rer1OmwhWGmVl3tw7PhSYr0CkMSJnCEkGHB/8ydNi734nyHN1
	NKbjl1bkW6f0NS4EmXUvOeMRup8VR8jImIo2N6k=
X-Google-Smtp-Source: ABdhPJzaNYFDML5eB8+L78R5SxLz+5fuOpU2PoKTABxbtqy5KvevfrgJwT6cy5R1NnoNYb1JdK6fCjLHG91Z4XdyB8I=
X-Received: by 2002:a17:906:4f10:: with SMTP id t16mr2526562eju.337.1623400479716;
 Fri, 11 Jun 2021 01:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210611024246.2108884-1-raj.khem@gmail.com>
In-Reply-To: <20210611024246.2108884-1-raj.khem@gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Fri, 11 Jun 2021 10:34:28 +0200
Message-ID: <CAAQYJAtOrLFX1WQ+_jnz+=VSVnvOZEd7WnB4=zhWR+6PPv9hAQ@mail.gmail.com>
Subject: Re: [meta-initramfs][PATCH] klibc: Add clang's -rtlib to known options
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll plan to do more testing with clang/llvm.

BTW there is now klibc 2.0.9.
Cheers
Andrea

On Fri, Jun 11, 2021 at 4:42 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This helps in ensuring that we always link klibc apps with libgcc as
> compiler-rt does not work for klibc due to missing libssp functions e.g.
> __stack_chk_guard and __stack_chk_guard which it expects in libc
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../klibc/files/klcc-cross-accept-clang-options.patch        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
> index 56905a5159..431c75e3af 100644
> --- a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
> +++ b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
> @@ -5,7 +5,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  --- a/klcc/klcc.in
>  +++ b/klcc/klcc.in
> -@@ -207,6 +207,24 @@ while ( defined($a = shift(@ARGV)) ) {
> +@@ -207,6 +207,27 @@ while ( defined($a = shift(@ARGV)) ) {
>       } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
>         # Override gcc encoded sysroot
>         push(@ccopt, $a);
> @@ -26,6 +26,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  +      push(@ccopt, $a);
>  +    } elsif ( $a =~ '--unwindlib=.*' ) {
>  +      # Allow clang options
> ++      push(@ccopt, $a);
> ++    } elsif ( $a =~ '-rtlib=.*' ) {
> ++      # Allow clang options
>  +      push(@ccopt, $a);
>       } else {
>         die "$0: unknown option: $a\n";
> --
> 2.32.0
>
