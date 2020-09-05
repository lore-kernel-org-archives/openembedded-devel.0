Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.10323.1599270072703231826
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 18:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gWZmQLJI;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id u3so8237954qkd.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2020 18:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9XL8hhOeTa17EO5XDMBTw9g404Q2nySoo/hK5YP4fLw=;
        b=gWZmQLJItx1VQzrbdSqkILEyNmYQmEiuBlwOn7Ryzzw/0JvivDlThLw4ivIuc/pBXY
         ysRTRWDqkx9kaKmD5m9jfAl9/TLVgLeFwNbF1e3/mbQhKPktO1xYPExo60JfXiZiFFKJ
         8KOUY32Q86x5ObJJ6cXUt+/YKA/ChCG3XADyAw/twNMkfwPcLTk2+SLMYO49CtQRp0Yu
         5u1lhm3dSobiz0OMHEtVGv/+TlSZUc6VTzbYfcNuM+P76Rrx9Ka+DcNhYpTrg/IwvPJf
         4nrtfY+nwAWIEasVRZjKTdHCi80aQlJRz+i5yNDUOrY+qsAgrV99hkhU9RSnSaQBaJGD
         Q6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9XL8hhOeTa17EO5XDMBTw9g404Q2nySoo/hK5YP4fLw=;
        b=TxOoRhlrhSsOJfsG3Az79UxkNUW4lX3EKoV/GKurio+wYgtYAliAYlI6YEI/UA0T+I
         yUbFNfwwr1hnfH45DmhtPY3f2+iyaj9hJ9rTfXW/b8g5QDpot0XntbmmyB1y3tRrCKN3
         HKqdbUbaSchlluSGnfuACTSwL+jXt/GeMybp49eUe3eV06avnw3aAmtnidk1h2as2adt
         l65euQ1wGgZYjKGQA2Nwnz1F+weVRkq10PMLwUlvlGAyILk3Wi2vtQq9zxbydZdbgpa1
         4Rr3TZEHNA2gE+HrWTkJ259OTOz0i45htzJhZN6BfH3061pVt+rj70wxRpab+tHy502w
         GDQA==
X-Gm-Message-State: AOAM530ut+zJMdbkEBg69pjtNNGVOnRLw77i9SNuFC9QZkyBmPc2dX8C
	wLIGtdD+tkTZZ1sM4A9wx/U8DVZpr2RRbQs308s=
X-Google-Smtp-Source: ABdhPJyTsS6KTBRQhmTSqfhQ+mphVyfvlGNKmnl+iDEayIrzu4dhb9Lv07BMLu4MJOA54GIBH1WycijjMqzw3qPLXlo=
X-Received: by 2002:a05:620a:13f6:: with SMTP id h22mr11037099qkl.9.1599270071738;
 Fri, 04 Sep 2020 18:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200904221358.14528-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20200904221358.14528-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 4 Sep 2020 18:40:45 -0700
Message-ID: <CAMKF1spxe83GwPAzSADwf2R2G2q1qLzF8_kC7tp7hc61xaH0-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] brotli: update to 1.0.9
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 4, 2020 at 3:14 PM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> cherry-pick upstream fix for pkg-config based detection failure
>

Is this patch reverted upstream? if so please add appropriate
Upstream-Status field for it in the patch header.

> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../recipes-extended/brotli/brotli/838.patch  | 47 +++++++++++++++++++
>  .../{brotli_1.0.7.bb => brotli_1.0.9.bb}      |  7 +--
>  2 files changed, 51 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/brotli/brotli/838.patch
>  rename meta-oe/recipes-extended/brotli/{brotli_1.0.7.bb => brotli_1.0.9.bb} (81%)
>
> diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch b/meta-oe/recipes-extended/brotli/brotli/838.patch
> new file mode 100644
> index 000000000..8ecf2e4c9
> --- /dev/null
> +++ b/meta-oe/recipes-extended/brotli/brotli/838.patch
> @@ -0,0 +1,47 @@
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
