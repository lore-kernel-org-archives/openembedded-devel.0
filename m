Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CAD5674813
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Nov 2019 18:03:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id q70so13695973qke.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Nov 2019 11:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qkSQSKXZPKpnxAjOi5BskCK1JumJ7y+6agY9Quo3h3c=;
	b=Nv36qFgopvfMlb4J0YVlBrJXWKp0T9Xbryo8mRvNn+1d2u2d9vENMx8BJgx+DTM06z
	t81ze4rdExQJbo3y0cxQk8gjsx2/eYSWUDxcZm2Y36ZUnJkl5S+8Kg8HRAdD1GPGdG7I
	zUyHwXeR12ZwBhnTFTRtckn5Lc+LjCIwB/lOp21w9yRHCM31OHdqAzAtnbzxAaOtpFKW
	cY9b7i4CeKTbWxDqjgDTRp6kzjiaYhr55bg0P0f4x0z6lIwG21asqkO4w0MwpIOhCrfN
	YA1CRCKXia/vFv/nXsybkuPP/TYGJGMd6Wdq7Xkn9eq8ealyJ7bW7MA0uZ+8sbkoU+BB
	z7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qkSQSKXZPKpnxAjOi5BskCK1JumJ7y+6agY9Quo3h3c=;
	b=ZZIZ176Jj+c/kOhkDZwa6FarVJhDSpFNSTfzUd22LhuPJg01aWHB/+1zLJxtEXnSCS
	ClsZZws8XKAX+fs4YSUFeY63Rs4igI/RDpVuWkYhdM1E3TsuAkXYtYuSlncva64cB+35
	XMLnGAsJtgv+1ExfxidY7gDtZ3GSV1re59SE6RfrRXFR6Od/WkrU0hU6F0Ylk1l9+fJw
	yKf2DLmIIam664JtO4q15PDFi9tY3zhw+2yOt6BGMsM6UmLr7H7MWbOwN5JYXr+k2mmk
	NNGObHkIAJc3X0JKITK2JodmmevfNL+p4RHZcHXq9spR7r6rA6ksFhH9L9e3w2b3P8vh
	nCbg==
X-Gm-Message-State: APjAAAXLRSNuRtpzabo/xCNPmAFlL6L44RC5AVr3UGi0XGbREKw2aeIO
	EYhGJwmyBuGV9sHJzEHcEQmBHDQiUF/1rry/HOIIrqOn
X-Google-Smtp-Source: APXvYqyseoVkZGFAV7I+Tmqlo637WsU8NLsOzP5JP5dJCcuIeNv/k1nghr9K4QzvBzc5uj1OH/tAAqNKK+PZBnQdbkU=
X-Received: by 2002:a37:6554:: with SMTP id z81mr5200799qkb.9.1572717825208;
	Sat, 02 Nov 2019 11:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <1572607459-67246-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572607459-67246-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Nov 2019 11:03:18 -0700
Message-ID: <CAMKF1soJ99bwEYUyszo9L28Uoo9DF-Le6JRtoCGXZ3orNxjqBA@mail.gmail.com>
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
X-List-Received-Date: Sat, 02 Nov 2019 18:03:45 -0000
Content-Type: text/plain; charset="UTF-8"

Zheng

I have taken this and mostly it will be in master shortly, however, I
see that 1.0 is also out in last week or so.
do you plan to work on upgrading to 1.0 as well ?

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

