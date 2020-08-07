Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.1465.1596784535292440976
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2020 00:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y3o8Z2GQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id p25so919793qkp.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2020 00:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lfP9de+cyw8UCnd7ufFdSdOaKEhklfAZhNq1AV+TyPA=;
        b=Y3o8Z2GQEHoovL3QtFmr/KjRaEMRzJpFS1ESFufSdWc9Eq3hX42i4fan/9kx6M15MB
         olGqp4kD+9whY3VHcq7CnK3CaTuaYgkvY0MDpj+qKo1I+Wd/lEDUQmKKnOgFPpzFsmYS
         KdbVVbby2fILhTTBiXT2ZvC/uBrTXSNelOkrW4LMyBqHKX520aR0VOer/w7njkxC7pXp
         ufN8F7GGBULnuAjXcmGpRchQT9oYS04J4DzIKv1VgLCge6yz1Dz/lS+Hx0Sk7nAP0rux
         CljlXYJL56s41hTk20cacVgZaaAoeIc0Nwj+LeR6ieUKSRPhRNYjQ1SZwzw6Csanj++a
         7rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lfP9de+cyw8UCnd7ufFdSdOaKEhklfAZhNq1AV+TyPA=;
        b=RwHTHBO5R5S54tTO1ozT7bIvnfjlfN1MLXwCqmrCTbKLjhQQzrVTNe/PMREuFw2Ku3
         cZnxPl7++U9LOmArbzH9GFJYAYa3V03J5GpeuNldd9fBQqndM/TybgpOFYjfe7ldxZ/i
         0qWbHHAjVaw7QYAoGSgRCsNdG+7SPL5OYl9GIu17zQSoisj3X3x7GT7aOSG7Mk8PKn97
         e0SKoGJFCkU8klCsYlNV+F0W2B42Kuj1dANnhQyY+ZrQvayOCMxVUcOWBk70+XPfakcm
         qpymf/LqRz1Wa8rcufhmN7RQMfsJt/BdqI5ctszm9lBvR98TvaxAwz+M8BEqXR7SG7hq
         Z6Eg==
X-Gm-Message-State: AOAM5307qmQ129X8gGQuEySassICkOew5zONpVBq9+8cIspQqXKTWH0k
	T87OjLxrOKTdP1tUqffVQpfNuVMdNsjTj7qjrak=
X-Google-Smtp-Source: ABdhPJzUoyAE8BznmivrQiP0+sc8unpVmt5FP6AgIGQaZoeBsaOcDMMRYK2zuHG0bAYZIvosy6I+LxAR8ZOy2e0xkZ4=
X-Received: by 2002:a37:7081:: with SMTP id l123mr11020200qkc.225.1596784534318;
 Fri, 07 Aug 2020 00:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200731142354.1428760-1-Oleksii.Miroshko@bmw.de>
In-Reply-To: <20200731142354.1428760-1-Oleksii.Miroshko@bmw.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 7 Aug 2020 00:15:08 -0700
Message-ID: <CAMKF1soEYORUhc-mqKhoGSKR77Brcnu3cPXOdBBU1prL4Z+N8g@mail.gmail.com>
Subject: Re: [oe] [meta-selinux][PATCH] setools: Add native support
To: Oleksii Miroshko <miroshko@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Please send it to yocto@lists.yoctoproject.org

On Fri, Jul 31, 2020 at 7:24 AM Oleksii Miroshko <miroshko@gmail.com> wrote:
>
> From: Oleksii Miroshko <miroshko@gmail.com>
>
> Enable using setools for analyzing the built SELinux policy
> during the build.
>
> Signed-off-by: Oleksii Miroshko <miroshko@gmail.com>
> ---
>  recipes-devtools/python/python3-decorator_%.bbappend | 2 ++
>  recipes-devtools/python/python3-networkx_%.bbappend  | 2 ++
>  recipes-security/setools/setools_4.3.0.bb            | 6 ++++++
>  3 files changed, 10 insertions(+)
>  create mode 100644 recipes-devtools/python/python3-decorator_%.bbappend
>  create mode 100644 recipes-devtools/python/python3-networkx_%.bbappend
>
> diff --git a/recipes-devtools/python/python3-decorator_%.bbappend b/recipes-devtools/python/python3-decorator_%.bbappend
> new file mode 100644
> index 0000000..3bc71e0
> --- /dev/null
> +++ b/recipes-devtools/python/python3-decorator_%.bbappend
> @@ -0,0 +1,2 @@
> +BBCLASSEXTEND = "native nativesdk"
> +
> diff --git a/recipes-devtools/python/python3-networkx_%.bbappend b/recipes-devtools/python/python3-networkx_%.bbappend
> new file mode 100644
> index 0000000..3bc71e0
> --- /dev/null
> +++ b/recipes-devtools/python/python3-networkx_%.bbappend
> @@ -0,0 +1,2 @@
> +BBCLASSEXTEND = "native nativesdk"
> +
> diff --git a/recipes-security/setools/setools_4.3.0.bb b/recipes-security/setools/setools_4.3.0.bb
> index ec73f7c..8fdeeb0 100644
> --- a/recipes-security/setools/setools_4.3.0.bb
> +++ b/recipes-security/setools/setools_4.3.0.bb
> @@ -8,6 +8,8 @@ SETools."
>  SECTION = "base"
>  LICENSE = "GPLv2 & LGPLv2.1"
>
> +BBCLASSEXTEND = "native nativesdk "
> +
>  S = "${WORKDIR}/git"
>  SRC_URI = "git://github.com/SELinuxProject/${BPN}.git;branch=4.3 \
>             file://setools4-fixes-for-cross-compiling.patch \
> @@ -21,9 +23,13 @@ LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=83a5eb6974c11f30785e90d0eeccf40c \
>
>  DEPENDS += "bison-native flex-native swig-native python3 python3-cython-native libsepol libselinux"
>
> +DEPENDS_class-native += "libselinux python3-setuptools python3-cython python3-networkx"
> +
>  RDEPENDS_${PN} += "python3-networkx python3-decorator python3-setuptools \
>                     python3-logging python3-json libselinux-python"
>
> +RDEPENDS_${PN}_class-native = ""
> +
>  RPROVIDES_${PN} += "${PN}-console"
>
>  inherit setuptools3
> --
> 2.25.4
>
> 
