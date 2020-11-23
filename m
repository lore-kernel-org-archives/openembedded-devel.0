Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.44028.1606172643248614772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 15:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G1ziwkET;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 9so5510197qvk.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 15:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wT6UxC/LTTGZ5enRHx3JyqIHXJx/jRB5G1y9dHH37ik=;
        b=G1ziwkETJh0MRaXwzLZ6pHq+XnaDLnE42R2OY4Nqvf+mCU/zA/jcwdoCLgx2ALlul+
         R8b09WnmFiBI89wcU0xtywwIWAfHMMTCD8RlHvg6WlGDi/QPy6N68yI7Ptmw069/372j
         aSqKHLwMn/s8jpqx46dUwhv9LYc0lgmMRLnjU5D0CATk7nfFC8FZ1jUhKhsMOctqIPd+
         4UpuYI8BdTZI7JRKwJ8iqpWVgAdGLIHuoRrMMsyKYVYPOsW8ETiYKZAs4djhYQX1aSkF
         f96S2sQr4froWYm+RuSmMVfrgIUI3/VIV4YL6eQmH9+5k9vB7rtQl+9eh9GBsixm13MD
         vwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wT6UxC/LTTGZ5enRHx3JyqIHXJx/jRB5G1y9dHH37ik=;
        b=TANPbiLOouLa4E8k9Bt7NorvPHFhU8e1T7dc8ve1eLDsrexEmkiBwqMUmHPhZaCmwC
         4dAW41X5lS0SjSHn6PMLkG6mfBKvnlI/RsFBksCycDeF0PVAgWO4kDbIEJzTId1s5VEa
         yKs/T0FzK4xrQ8OzwXV/AAG8gqEkJPVgK4sL5L1zPHwtHbEdIE6vixQ8qbEPMg6V/gDD
         FeWoIMNdxPexmQFTwbFfPt1VfGaJ9FFeEi0nvuTushjJhW9qUI1c1HPU+mH3BC71VInb
         ffhi0JRJEZB4OvHziA7gDpjwc4vRxjtwB0xstzyMnmEDKFSlGoMn6Lj+70EFmkfn7IeY
         QWYw==
X-Gm-Message-State: AOAM531/Ne3DtJ7FvKdu2NTmckT4zhmuD+ppmNwa28u5PYePTOyJMsVw
	FnTGtTqX/ImcN+yS93J8HqRKaFTPY8hOAxVS2pQ=
X-Google-Smtp-Source: ABdhPJxxPzknr63oVLkRpWcqzb8EHqDC1J4O0vkaNLMvRBsHF7y5gB9eGEfOKIAnILtwB+ifVKwPN/4PbBgwRtu2JEo=
X-Received: by 2002:ad4:524d:: with SMTP id s13mr1941987qvq.19.1606172642243;
 Mon, 23 Nov 2020 15:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20201123020919.5556-1-okaya@kernel.org>
In-Reply-To: <20201123020919.5556-1-okaya@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 23 Nov 2020 15:03:36 -0800
Message-ID: <CAMKF1sqW2ncvKtkWQE-YOPReOTihqBVCPiiG5LvDAgTcPbYGgw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v5] heaptrack: add bitbake recipe
To: Sinan Kaya <okaya@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sinan

This fails to build on musl

https://errors.yoctoproject.org/Errors/Details/538799/

On Sun, Nov 22, 2020 at 6:09 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> Add this useful tool to the devtools list.
>
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb      |  1 +
>  .../heaptrack/heaptrack_git.bb                 | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 9ac60b26c8..02ac44d13b 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -227,6 +227,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany-plugins geany", "", d)} \
>      lemon \
>      flatbuffers \
> +    heaptrack \
>      libubox \
>      ltrace \
>      lua \
> diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
> new file mode 100644
> index 0000000000..30d7b65bd7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Heaptrack"
> +HOMEPAGE = "https://phabricator.kde.org/source/heaptrack/"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = "zlib boost libunwind elfutils"
> +
> +SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https"
> +
> +SRCREV = "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>
