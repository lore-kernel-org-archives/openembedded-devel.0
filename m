Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D861F77DCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 22:08:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y10so7493669wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 15:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pNVaE8UwTKxjMw+Nzn4ZzQ6roctu0d0ld/WEqwuI0a8=;
	b=tZ2JqH+J72FvfWvM44v8BKr7SMEl3zO9Zv9d4CTiENUANtV4EhQVGiosjHgQo126Ut
	hyW540bUgr3LyihfeWOwaGk6dR4IlsABMNjorbLi7/CMX0yaxnGCeF4dPaTHeHf37xRK
	oz6i92f+L08O0d6e3/bWp8WWsgtHQhtTe1Ni8awC4uN0aLh3OkRomIgYS3lTSwbpuYFB
	b0Rbhbj+FNJH9FTuTZ2v2PC3bRMZ8cgOtPvTA4y0LFPOHsvvxfLdq9qnKAACNW4DCio4
	YHi6pPmwEN/t87UObWekEFsjlc0gRq2EkHaubOOxvMGynxI1MaIR6bAwKrB+0rohidTm
	szIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pNVaE8UwTKxjMw+Nzn4ZzQ6roctu0d0ld/WEqwuI0a8=;
	b=buY+sE2blIHkUEwuAcrof/eC3nvx16YBM0Ci9JBgrv99GgQJ5MFY4OIZrmecnnuRxz
	Ils1cIPcoiW9fqy242toPmUnAo9vQyMx1yAwIZT5pL6bSCeRx5+DVN7r5qO8/yKkZ9Cp
	hhTBi48JG8YZQdQ/qwTylW0e02hkAhnMx+eTAIPWbrPC6vRA8IAVWUBRr0wYgIfPE9pE
	VngIIDf605xJjTtCSr5mbCAF+jb5/9paUCuAMYlHcrPV1CjOAY4ZbRi/DYTX/32rpZ5E
	H+xL6vXkU3iFioy5cRHkohHU4l4SBj4Ntff2g2D568iQ9XtqwTcvZD92kPCoUUhG0nKS
	1PLQ==
X-Gm-Message-State: AN3rC/4FjpkttwoiW/aZjFA3MUjquv5HzVmOzU7dLlbQVzGBjv3btV1Z
	E3C48CD6uyB75kzGNBf6jzV48LvRjw==
X-Received: by 10.80.144.206 with SMTP id d14mr6507971eda.9.1493330885500;
	Thu, 27 Apr 2017 15:08:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Thu, 27 Apr 2017 15:08:05 -0700 (PDT)
In-Reply-To: <20170427211851.10351-1-andrej.rode@ettus.com>
References: <20170427211851.10351-1-andrej.rode@ettus.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Apr 2017 00:08:05 +0200
Message-ID: <CA+chaQc63KW_k+bcTj0pNL_2ztH=aHzPh4SwkbXO4y44ijhvOg@mail.gmail.com>
To: Andrej Rode <andrej.rode@ettus.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v3] python-systemd, python3-systemd: add a new recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Apr 2017 22:08:05 -0000
Content-Type: text/plain; charset=UTF-8

All 4 changes were already merged, please rebase and send what's left as
follow-up patch.

On Thu, Apr 27, 2017 at 11:18 PM, Andrej Rode <andrej.rode@ettus.com> wrote:

> Adds new recipe for python-systemd and python3-systemd
> which provide python bindings for libsystemd
>
> Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> ---
>  meta-python/recipes-devtools/python/python-systemd_234.bb  | 13
> +++++++++++++
>  meta-python/recipes-devtools/python/python3-systemd_234.bb | 13
> +++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-systemd_234.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-systemd_234.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-systemd_234.bb
> b/meta-python/recipes-devtools/python/python-systemd_234.bb
> new file mode 100644
> index 0000000..ef11831
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-systemd_234.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Python interface for libsystemd"
> +HOMEPAGE = "https://github.com/systemd/python-systemd"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b36451
> 6c"
> +
> +PYPI_PACKAGE = "systemd-python"
> +DEPENDS += "systemd (<=234)"
> +RDEPENDS_${PN} += "systemd"
> +REQUIRED_DISTRO_FEATURES = "systemd"
> +inherit pypi setuptools distro_features_check
> +
> +SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
> +SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7e
> b5b0b6372cd1b391228047d33895db83e7"
> diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb
> b/meta-python/recipes-devtools/python/python3-systemd_234.bb
> new file mode 100644
> index 0000000..845b7d9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Python interface for libsystemd"
> +HOMEPAGE = "https://github.com/systemd/python-systemd"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b36451
> 6c"
> +
> +PYPI_PACKAGE = "systemd-python"
> +DEPENDS += "systemd (<=234)"
> +RDEPENDS_${PN} += "systemd"
> +REQUIRED_DISTRO_FEATURES = "systemd"
> +inherit pypi setuptools3 distro_features_check
> +
> +SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
> +SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7e
> b5b0b6372cd1b391228047d33895db83e7"
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

