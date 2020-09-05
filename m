Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.14273.1599292493025755352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 00:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i29xxMgf;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id d20so8673272qka.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 00:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cf0rhk2ODIdWQTOerC8HDT/C3ecFvi2gTeoyJo6IDKA=;
        b=i29xxMgftZQbLgsziAs+2Bq7DzJncoWbl/sYr3wN5Vk0jaQe96ctqZb6kFVZUUiKLS
         mqJyR32yMi2vwfZ/dFHkbPs/Dr3hMwggA3Av9fjLDndRYjsFfMLBC9WB26tr4xYudjGk
         2sI7NE2QvmXXli6VKGhvMgDopq08DoLNUZEvcsItSlS7dWH24+PoYYvGaA3b0tfXXgno
         wF99mvVgtVDHL5cPe/zAneBuHo/TDDRXVu0E4jU+hpfBhw/PTv9uWccFGleaDbMdkJ7v
         u/WWySc76KH/7kek0rST0lLVQjn16SLGW0lXihb8laCpz2rE8XLxMupi39HJY88E9cnZ
         rkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cf0rhk2ODIdWQTOerC8HDT/C3ecFvi2gTeoyJo6IDKA=;
        b=RsQOy9jbDP5sljLGx/DDRZ5FZfNVSsJLL1uMLp2H2ndDEfyswxwpMw1cmo99h7qxzj
         JJIAAlT9KlP+shWF+SdG/ROoWWpU4t/PmNQ2+1Oi7iDxCV7e2kcRZK9aUU/kdQ5JdKpR
         Fz/emUOmg/E7iy2jIkg7NzkouWtnRKZ4xIEiHj4nmx0w0sK2WwaOT+pjiFyJ4Luihig+
         50I/77UhDkZ1G6dfg10jGVV/FlT5F6cEi/cVCCEzlsoCLpna+RetrzORQOq030+R+xTk
         rgQtcizHpI9G2yX12j8RPuv+nI/uYG4UwM0/vI/4FTyOp1lj8E0tO4gujm0IYq1eP/3A
         +8Jw==
X-Gm-Message-State: AOAM533gfzmB5DbtM8TaZ53KzgJZex3fhJVxwjuFQM9eto9Q2b6lPOAN
	Yp46CDMZw1pYuVC56vX2cW/5m3hgl9j3FVhVdXw=
X-Google-Smtp-Source: ABdhPJw1E0bKFu8blaLIt1OjV8P4B1dJ3V9bIpD2S7HF19ELVVnUa/ilgELp6Cgc8FT08M+0MMlZTaYS9RogcuyWAaI=
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr11187897qkk.337.1599292492020;
 Sat, 05 Sep 2020 00:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200905074918.23065-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20200905074918.23065-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 5 Sep 2020 00:54:26 -0700
Message-ID: <CAMKF1soiXY_0SqpuFk34o7U+dZ4+5BtqR49jsKnTAuFi6Qj0vQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] brotli: update to 1.0.9
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 5, 2020 at 12:49 AM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> cherry-pick upstream fix for pkg-config based detection failure
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../recipes-extended/brotli/brotli/838.patch  | 48 +++++++++++++++++++
>  .../{brotli_1.0.7.bb => brotli_1.0.9.bb}      |  7 +--
>  2 files changed, 52 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/brotli/brotli/838.patch
>  rename meta-oe/recipes-extended/brotli/{brotli_1.0.7.bb => brotli_1.0.9.bb} (81%)
>
> diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch b/meta-oe/recipes-extended/brotli/brotli/838.patch
> new file mode 100644
> index 000000000..98b888760
> --- /dev/null
> +++ b/meta-oe/recipes-extended/brotli/brotli/838.patch
> @@ -0,0 +1,48 @@
> +Upstream-Status: Backport [https://github.com/google/brotli/pull/838]

I ended up merging your V2, please rebase this on master and resend
just the delta

> +From 092446fafb4bfb81738853b7c7f76b293cd92a80 Mon Sep 17 00:00:00 2001
> +From: Evgenii Kliuchnikov <eustas.ru@gmail.com>
> +Date: Wed, 2 Sep 2020 10:49:49 +0200
> +Subject: [PATCH] Revert "Add runtime linker path to pkg-config files (#740)"
> +
> +This reverts commit 31754d4ffce14153b5c2addf7a11019ec23f51c1.
> +---
> + scripts/libbrotlicommon.pc.in | 2 +-
> + scripts/libbrotlidec.pc.in    | 2 +-
> + scripts/libbrotlienc.pc.in    | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/scripts/libbrotlicommon.pc.in b/scripts/libbrotlicommon.pc.in
> +index 10ca969e..2a8cf7a3 100644
> +--- a/scripts/libbrotlicommon.pc.in
> ++++ b/scripts/libbrotlicommon.pc.in
> +@@ -7,5 +7,5 @@ Name: libbrotlicommon
> + URL: https://github.com/google/brotli
> + Description: Brotli common dictionary library
> + Version: @PACKAGE_VERSION@
> +-Libs: -L${libdir} -R${libdir} -lbrotlicommon
> ++Libs: -L${libdir} -lbrotlicommon
> + Cflags: -I${includedir}
> +diff --git a/scripts/libbrotlidec.pc.in b/scripts/libbrotlidec.pc.in
> +index e7c3124f..6f8ef2e4 100644
> +--- a/scripts/libbrotlidec.pc.in
> ++++ b/scripts/libbrotlidec.pc.in
> +@@ -7,6 +7,6 @@ Name: libbrotlidec
> + URL: https://github.com/google/brotli
> + Description: Brotli decoder library
> + Version: @PACKAGE_VERSION@
> +-Libs: -L${libdir} -R${libdir} -lbrotlidec
> ++Libs: -L${libdir} -lbrotlidec
> + Requires.private: libbrotlicommon >= 1.0.2
> + Cflags: -I${includedir}
> +diff --git a/scripts/libbrotlienc.pc.in b/scripts/libbrotlienc.pc.in
> +index 4dd0811b..2098afe2 100644
> +--- a/scripts/libbrotlienc.pc.in
> ++++ b/scripts/libbrotlienc.pc.in
> +@@ -7,6 +7,6 @@ Name: libbrotlienc
> + URL: https://github.com/google/brotli
> + Description: Brotli encoder library
> + Version: @PACKAGE_VERSION@
> +-Libs: -L${libdir} -R${libdir} -lbrotlienc
> ++Libs: -L${libdir} -lbrotlienc
> + Requires.private: libbrotlicommon >= 1.0.2
> + Cflags: -I${includedir}
> diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> similarity index 81%
> rename from meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> rename to meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> index 32f855844..0038ba74d 100644
> --- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> +++ b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> @@ -6,9 +6,10 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
>
> -SRC_URI = "git://github.com/google/brotli.git"
> -# tag 1.0.7
> -SRCREV= "d6d98957ca8ccb1ef45922e978bb10efca0ea541"
> +SRC_URI = "git://github.com/google/brotli.git \
> +           file://838.patch "
> +# tag 1.0.9
> +SRCREV= "e61745a6b7add50d380cfd7d3883dd6c62fc2c71"
>  S = "${WORKDIR}/git"
>
>  inherit cmake lib_package
> --
> 2.17.1
>
> 
