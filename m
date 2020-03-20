Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED7561B59
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 15:27:45 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id ca19so7483468edb.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+owfB4Fc0mzUT0iWYp3MabZc6a6/eVQojUk9Kyc6xOw=;
	b=lE2YA+dwfbvMhW1ALNMaKnqlq2y5MsDVu9viImqzCHq7wX4G39v5046C/NRPrkzwAW
	ziqNtuR0n+Qjanf0bLzC44vAnacO08rqQUz4ZgwplNvaIUAmzd7ydzSOe4LKKiYwpaQY
	u64hhI/2nEs2OlAVPGjLj65x67t9Nb66tFkWWo+9tE7fpAHbwpEu4nDihRv+bypQlr3X
	1JsmMR5KEhhk3zUkaIOeAPVtZlpgDWXcTel99MViV+QkkNBLgdbMp5yXdnJWzwQdQQ4K
	TjhJ87vOMdRwgSDjFllBuCxJ1gyqV7gmNAyNHsmeXlgKxaPWiSxhu7EvroWC1rBQcp/R
	U8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+owfB4Fc0mzUT0iWYp3MabZc6a6/eVQojUk9Kyc6xOw=;
	b=OVY8LYefAT7gh4f6gKejMiB9bxjahXfNa2++OGBJZqxRXcF2XjnuLEjH32Ig+N3653
	gC6ezdbpCLXMkkqmTFCs6qsan6HhY0byZpIcP8W2Cww1APyousNzgICse8ojd1y1C3fg
	eg8+8hrqI7gQtgWrK99jghrDcIDV1HLaJhSvSYZ3y9o3QHoBZ6tlryRvdWrOK+jxCC/o
	qyZ8dE+k5QTem/piknnfo+g6+UbsCPt1a56tMEuquVuC7x6jojGChL4Lxff6q3NjmPPn
	8PeMhRaElqbOnedIOztFbqbx/ve9I+IVQXEPOBjPOuBd5/lrJSIVcap6WQCbs+wcPGdk
	08kQ==
X-Gm-Message-State: ANhLgQ21NfiN2vu7anIP7NyTdj1jISXIfhKa0yPM8VV8T6zzhb+O55fU
	+P4t6Wk872R2/EbgIKFTTPJVPpI1VsW1fcNAQr0=
X-Google-Smtp-Source: ADFU+vsgdjuiWOycQwJKbegsZLuhcREEjQH4jwDoeJNkntWXorc0YywK24KdZihZ/22Hk4tVHSZmDJ5vg24R8/sgico=
X-Received: by 2002:a50:ed0f:: with SMTP id j15mr8350327eds.311.1584718065797; 
	Fri, 20 Mar 2020 08:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200320144553.2587659-1-raj.khem@gmail.com>
	<20200320144553.2587659-3-raj.khem@gmail.com>
In-Reply-To: <20200320144553.2587659-3-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Mar 2020 16:27:34 +0100
Message-ID: <CA+chaQczKRWOke9maR0n_4LRZ4KsUWYDuEjWtE7-Gawk8RoCRw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] layers: update LAYERSERIES_COMPAT to dunfell
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
X-List-Received-Date: Fri, 20 Mar 2020 15:27:45 -0000
Content-Type: text/plain; charset="UTF-8"

Can we drop at least thud and warrior? without e.g. features_check or
mime-xdg bbclasses from dunfell oe-core some of these layers don't even
parse, so it might be worth keeping just dunfell (that's what I did for
meta-qt5 now).

On Fri, Mar 20, 2020 at 3:46 PM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-filesystems/conf/layer.conf | 2 +-
>  meta-gnome/conf/layer.conf       | 2 +-
>  meta-initramfs/conf/layer.conf   | 2 +-
>  meta-multimedia/conf/layer.conf  | 2 +-
>  meta-networking/conf/layer.conf  | 2 +-
>  meta-oe/conf/layer.conf          | 2 +-
>  meta-perl/conf/layer.conf        | 2 +-
>  meta-python/conf/layer.conf      | 2 +-
>  meta-webserver/conf/layer.conf   | 2 +-
>  meta-xfce/conf/layer.conf        | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta-filesystems/conf/layer.conf
> b/meta-filesystems/conf/layer.conf
> index e8bd3628f8..be1635deea 100644
> --- a/meta-filesystems/conf/layer.conf
> +++ b/meta-filesystems/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
>
>  LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus dunfell"
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index d381fdf070..7aa9507eb5 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -17,4 +17,4 @@ LAYERVERSION_gnome-layer = "1"
>
>  LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
>
> -LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus dunfell"
> diff --git a/meta-initramfs/conf/layer.conf
> b/meta-initramfs/conf/layer.conf
> index 93220b1208..634e0883c6 100644
> --- a/meta-initramfs/conf/layer.conf
> +++ b/meta-initramfs/conf/layer.conf
> @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-initramfs = "8"
>  LAYERDEPENDS_meta-initramfs = "core"
>
> -LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus"
> +LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus dunfell"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    dracut->virtual/kernel \
> diff --git a/meta-multimedia/conf/layer.conf
> b/meta-multimedia/conf/layer.conf
> index 74dd4a1b03..2d52fb938a 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
>
>  LAYERDEPENDS_multimedia-layer = "core meta-python"
>
> -LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus dunfell"
> diff --git a/meta-networking/conf/layer.conf
> b/meta-networking/conf/layer.conf
> index 866bda7558..7bc0702ba7 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
>  LAYERDEPENDS_networking-layer += "openembedded-layer"
>  LAYERDEPENDS_networking-layer += "meta-python"
>
> -LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus dunfell"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 652a378f28..434537fd3a 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -34,7 +34,7 @@ LAYERVERSION_openembedded-layer = "1"
>
>  LAYERDEPENDS_openembedded-layer = "core"
>
> -LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
> index 2c730e4c75..1361fe0842 100644
> --- a/meta-perl/conf/layer.conf
> +++ b/meta-perl/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
>
>  LAYERDEPENDS_perl-layer = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus dunfell"
> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> index db65943f56..7cfeafe599 100644
> --- a/meta-python/conf/layer.conf
> +++ b/meta-python/conf/layer.conf
> @@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
>
>  LAYERDEPENDS_meta-python = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_meta-python = "thud warrior zeus"
> +LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
> diff --git a/meta-webserver/conf/layer.conf
> b/meta-webserver/conf/layer.conf
> index 2c6fad4ac6..24469115e4 100644
> --- a/meta-webserver/conf/layer.conf
> +++ b/meta-webserver/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
>
>  LAYERDEPENDS_webserver = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_webserver = "thud warrior zeus"
> +LAYERSERIES_COMPAT_webserver = "thud warrior zeus dunfell"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> index 070ea6ac7d..199c69e7b2 100644
> --- a/meta-xfce/conf/layer.conf
> +++ b/meta-xfce/conf/layer.conf
> @@ -19,4 +19,4 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
>  LAYERDEPENDS_xfce-layer += "meta-python"
>  LAYERDEPENDS_xfce-layer += "networking-layer"
>
> -LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus dunfell"
> --
> 2.25.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

