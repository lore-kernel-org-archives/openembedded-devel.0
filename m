Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.22154.1586108285010047228
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 10:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NHBEJykj;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id 14so10738331qtp.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jXPWCO4YopaIQhsb5fO5Y2BJpXb4D7eqAT/K8pji9Vs=;
        b=NHBEJykjSHt/c3WMrgY/OyoIpSAqPTfBsULSh40i92w332r92UMbiPs3cuKrIHzKjn
         fcGt6NtcyVA76NTUWqbcID2YTaW7Nm/W5KtD9sWryotf7Tj4KVT+pIVo4L5fNXjQBzls
         KaVLic/2t3HCfT5LpvfCTrYbg/BNG0eIoSaEU52ygJlf5yh9bOKXmynu5qfOaQZOf0xy
         U+/s0ipfbOlaNGQAdrtfjwio4vvQZt9WFWkfbvlYFR0sM5bFkMxbIbSVyBYc96jb2REi
         tj3iPL1DR2SxAnERZJGWszqwJ2lXSgqx2awqYaeZS29hG1klm+mMN3qgaJnqjNEZb4+G
         R5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jXPWCO4YopaIQhsb5fO5Y2BJpXb4D7eqAT/K8pji9Vs=;
        b=SAtpIIdJs+ddEx3uO0/1uDts2ogXnapg/WMsk+Y/O9U9eAEDMhRvPIo8Up3PvClqIT
         N+zilfIna0KZeqqFHZqpsh9klHp4Vo6xHYycCdFCGokhX5KxQ0wqykYw2euJHUP1S+pP
         EUDdPv111XTG9BkJ0cCbHKRKmmRWjofuONmoeMGk5fUlOd1Vf5wpX1AmlUC914SNuEMK
         kAGrtNxfrDjjudZp7qwa7AH840QsxHI2efKOzvHdVi2Bthc8EuYGNo5zQU7jY8d7evNF
         iKX15co4Fh2U7kUaAQS7bPI7QCxN3pldMCGCuS8dA0Qa5MrbrnWvZi9eRAK+Wi+19a9N
         UHrA==
X-Gm-Message-State: AGi0PuZLPyOaq5heLZgSu0NXwGeTkSKXEqXkjNS/EsjN+zeEgrF1SBAj
	hySzgzQBmQIWJblNS3rMjbzeuuBpyAytA4MsU6SY5WnQ
X-Google-Smtp-Source: APiQypIEXaRRVMEzWBZs1jvBPYUdouXOzUD7sIa2k296V5Lvsk+nE1xuwhNhfai+F8uqT/7LqwWstpS4AfdSVnZXBnw=
X-Received: by 2002:ac8:a09:: with SMTP id b9mr17434725qti.190.1586108283855;
 Sun, 05 Apr 2020 10:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200404171251.19823-1-derek@asterius.io> <20200404171251.19823-6-derek@asterius.io>
In-Reply-To: <20200404171251.19823-6-derek@asterius.io>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 5 Apr 2020 10:37:37 -0700
Message-ID: <CAMKF1srZ5yVcDTWOyESVW5HSinTkoTUS3yAKd+9O81kBMOC9qg@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH 06/27] python-systemd: consolidate inc and bb files into a single bb file
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 4, 2020 at 10:13 AM Derek Straka <derek@asterius.io> wrote:
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../python/python-systemd.inc                 | 20 -----------------
>  ...-implementation-of-strndupa-for-musl.patch |  0
>  .../endian.patch                              |  0
>  .../python/python3-systemd_234.bb             | 22 ++++++++++++++++---
>  4 files changed, 19 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-systemd.inc
>  rename meta-python/recipes-devtools/python/{python-systemd => python3-systemd}/0001-Provide-implementation-of-strndupa-for-musl.patch (100%)
>  rename meta-python/recipes-devtools/python/{python-systemd => python3-systemd}/endian.patch (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-systemd.inc b/meta-python/recipes-devtools/python/python-systemd.inc
> deleted file mode 100644
> index b14f825011..0000000000
> --- a/meta-python/recipes-devtools/python/python-systemd.inc
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY = "Python interface for libsystemd"
> -HOMEPAGE = "https://github.com/systemd/python-systemd"
> -LICENSE = "LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
> -
> -PYPI_PACKAGE = "systemd-python"
> -DEPENDS += "systemd (<=234)"
> -RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
> -REQUIRED_DISTRO_FEATURES = "systemd"
> -inherit pypi features_check
> -

inheriting feature_check is dropped, please reintroduce it and send v2.

> -SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
> -SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
> -
> -# allow for common patches for python- and python3-systemd
> -FILESEXTRAPATHS_prepend := "${THISDIR}/python-systemd:"
> -
> -SRC_URI += "file://endian.patch"
> -
> -SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
> diff --git a/meta-python/recipes-devtools/python/python-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch b/meta-python/recipes-devtools/python/python3-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch
> rename to meta-python/recipes-devtools/python/python3-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch
> diff --git a/meta-python/recipes-devtools/python/python-systemd/endian.patch b/meta-python/recipes-devtools/python/python3-systemd/endian.patch
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-systemd/endian.patch
> rename to meta-python/recipes-devtools/python/python3-systemd/endian.patch
> diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
> index 78ec431560..0ee5df8782 100644
> --- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
> +++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
> @@ -1,3 +1,19 @@
> -require python-systemd.inc
> -RDEPENDS_${PN} += "python3-syslog"
> -inherit setuptools3
> +SUMMARY = "Python interface for libsystemd"
> +HOMEPAGE = "https://github.com/systemd/python-systemd"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
> +
> +SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
> +SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
> +
> +SRC_URI += "file://endian.patch"
> +SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
> +
> +DEPENDS += "systemd (<=234)"
> +
> +PYPI_PACKAGE = "systemd-python"
> +REQUIRED_DISTRO_FEATURES = "systemd"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
> --
> 2.17.1
>
> 
