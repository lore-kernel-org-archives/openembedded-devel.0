Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1563A7EDF1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 14:39:30 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id i19so1763887qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2h9oHEVGqyGvAwrPhPBhmA44DgUU2f1Fx85fOS6ZCGY=;
	b=fvCGRFSbNLJ8d2KGYOjE59O3FapYlQmagOSt/zf1B3fvtik6bANmVbb9QbxF7LWZxH
	NNKU36E2fMR2p6L5GFyEjogau3ZxLru+aFVGmydNoiCJnJQ6TL0z6qKa2AVDftZ/ijxV
	XRCL42pTSbjwRDx2gj0qug44coTEjQzGdGeEUlkFc4XX+bYiygXiuP24qbbw5I74qREh
	24eQDOvK9o4VeTxpRH0Rnxon3ssCbzq1hd+PWZesZmYdOfEZPwp2qiV/IQZ+8hA/a7JT
	XOMr9B9DlHQbuMrG2mfYes52Nr6yoKtgGTYCum6VdzL6AZoPYxE/OoqdYDRF/jAQy0EU
	Sk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2h9oHEVGqyGvAwrPhPBhmA44DgUU2f1Fx85fOS6ZCGY=;
	b=bCqCpnCktMrOtMrjG3H/E/fuzACnNOydsSjnGp3oED0tmr+Bs72U6Y3PfY92Tqqnuk
	Ycj3qJ7BDJF3asG1r1+ZuR8FaNK7Bb1XfW+6iST2AcOaWg8MF7BQCBvEnyvH7vwtvFdA
	LvK4z7zgSny3F3KwvfCSHCeToa3q9dgkBkxYBBLKccLrH0i/2ErISCbOfyDKaLs5FFDf
	MUlHeiuZbWDdESavbv6ILQShoTRz19xpHp9xPj1QBKzEYYV9B86thaIaP/YCQAvQkl4L
	dbWapc0CLpvaRe8s7MUMMrErymcWal8BN+/5OZ9nt5zrjg0jFqaVQTlTYkE+54kpBT2r
	K+jA==
X-Gm-Message-State: APjAAAV2GzxOonMaTislD42sP/Mp6vmOcvdzWLeveCJ6VIFBTaoATe6S
	lMDs+ZbCUjdS07bwEgp/wVlBInR0K32ZdHuNOqo=
X-Google-Smtp-Source: APXvYqxuD0k0jCE1Lp15nX1W/heLc7SPI9y8ttP4taCpoFtqDxnPdstHS0S2Bb9OyzItC0U0Yv0dwmEgvXUkqC03Kvw=
X-Received: by 2002:a05:620a:14b7:: with SMTP id
	x23mr1102596qkj.474.1572619171508; 
	Fri, 01 Nov 2019 07:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <1572607459-67246-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572607459-67246-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 07:39:04 -0700
Message-ID: <CAMKF1sqngtqVNPer5oytnH7xe1xGGJ7FLaz6GGz_BWzdhmojUg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iwd: upgrade 0.20 -> 0.23
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
X-List-Received-Date: Fri, 01 Nov 2019 14:39:31 -0000
Content-Type: text/plain; charset="UTF-8"

Fails on musl

https://errors.yoctoproject.org/Errors/Details/275171/

On Fri, Nov 1, 2019 at 12:45 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> 1) Add DEPEND python-docutils-native to generate manual pages.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-connectivity/iwd/{iwd_0.20.bb => iwd_0.23.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-connectivity/iwd/{iwd_0.20.bb => iwd_0.23.bb} (87%)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.20.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> similarity index 87%
> rename from meta-oe/recipes-connectivity/iwd/iwd_0.20.bb
> rename to meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> index 4220503..d48fb84 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_0.20.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> @@ -2,12 +2,12 @@ DESCRIPTION = "Wireless daemon for Linux"
>  LICENSE = "LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
>
> -inherit autotools pkgconfig systemd
> +inherit autotools pkgconfig systemd pythonnative
>
> -DEPENDS = "ell readline dbus"
> +DEPENDS = "ell readline dbus python-docutils-native"
>
>  SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
> -SRCREV = "00f0039232cc73bbcf7a1875f8f9aae464d90a8f"
> +SRCREV = "77f16ae26fc013477f6362a0c33f0e52e82863e0"
>  S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

