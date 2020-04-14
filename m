Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.337.1586893776805699058
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 12:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MpVV17ZX;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id b62so14733396qkf.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 12:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G8RRpPy84qNF4DcBLGvKLYp1wKVOPcKx/5dp8mkjuvI=;
        b=MpVV17ZX3PBjm2gjpIGzJhIw1K6kaDy3+yoNmufrsAFydU0s1D52kawM61BH6B2sqK
         noyBv2HjmEAQrVEPGnMcbzdYTuaggSfbR8/g70wPPSWNIECrnlTsh1sScyknue6Zj0E9
         9qEM906isarXSfcUsaTRsLv1m+oThICPqI14lbaaHGNF9mX+5qhrQ6WOGaP8QK1z6ulw
         sz8FnyCigLvTPCwOxpIoj4/x//wy995ibk/Mxllls2hzLtx7nlm19aRveS8xkgPqIl0r
         i5CULA7/q34WmYRNN1cqb9ixbzQHvpl08C7Ow9Pa+l7tyCxac/o7rEneg298huLHAPi9
         2/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G8RRpPy84qNF4DcBLGvKLYp1wKVOPcKx/5dp8mkjuvI=;
        b=O7vp4nFI5hqaCtCc5P2Uyghym5IxmL/jQMx7Wj+plF0yr80cbbVCK+y6s7r/gxrRhs
         916HA9PZbuDbKl7Ok+GTNCWxNmhqHlA1NL03SeA4NbR4KKKHbcnNq5WJXY7YYQ1zwN5G
         Orti6v9UGhTmAmF5Wiym0wMsPRWMUdE7LVGdwNBbsKQ6MWjgoBHSrjpph9w1+cEoxMFs
         K1+tcWAXZLHKzFeTIGot/oGqEnPITUyy1zywAN8x9uWY4MxYuLsLV5n5DWpnEHuhPrl2
         9diBITnZNiN6kxk2zwZchKHaE2JKhe9bXziCUgdRtVbDk2LpSaICS1xmVIc/1dIOugOE
         szWA==
X-Gm-Message-State: AGi0PuY4Io/9cZ1IqH86GZ/blMCB1D0wULbuRt+ED5pK5VQHSAoUNtyW
	mYuP5b1CjVLw8GAxkNJlcVG/qs+wuuiuagEcZIM=
X-Google-Smtp-Source: APiQypK4Yx6PX+hZSi4O+NY1LMlNHnk6GgTyQJrAzt2Ne4c62CdyFORGVQ8FeImxS59+JmuecE4QAlFyApq3aqnZwQ4=
X-Received: by 2002:a37:8d81:: with SMTP id p123mr21636596qkd.17.1586893775657;
 Tue, 14 Apr 2020 12:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200414185217.24503-1-abhishek.shah@broadcom.com> <20200414185217.24503-2-abhishek.shah@broadcom.com>
In-Reply-To: <20200414185217.24503-2-abhishek.shah@broadcom.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 14 Apr 2020 12:49:09 -0700
Message-ID: <CAMKF1sq7uOSsk5OeSeGjHZmZ_4d9ZPQKNgWK8V=YZsBEy=Em6g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 2/2] python3-pykwalify: Add recipe for v1.7.0
To: abhishek.shah@broadcom.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

it fails to build

http://errors.yoctoproject.org/Errors/Details/403673/

On Tue, Apr 14, 2020 at 11:52 AM Abhishek Shah via
lists.openembedded.org
<abhishek.shah=broadcom.com@lists.openembedded.org> wrote:
>
> Description of the package can be found at:
> https://pypi.org/project/pykwalify/
>
> Signed-off-by: Abhishek Shah <abhishek.shah@broadcom.com>
>
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> new file mode 100644
> index 000000000..1107502ca
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "YAML/JSON validation library"
> +DESCRIPTION = "pykwalify is a schema validator for YAML and JSON"
> +HOMEPAGE = "https://pypi.org/project/pykwalify/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a72ea5159364a2cd7f45c6dcbee37872"
> +
> +SRC_URI[md5sum] = "58357f1d0f77de976e73dbd3660af75b"
> +SRC_URI[sha256sum] = "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015defcceb2"
> +
> +PYPI_PACKAGE = "pykwalify"
> +inherit setuptools3 pypi
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-dateutil \
> +    ${PYTHON_PN}-pyyaml \
> +"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.17.1
>
> 
