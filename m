Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 47EAB78558
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Feb 2018 19:16:03 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o76so6169847wrb.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Feb 2018 11:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sdio36T5ycW3l5ytP6akjSC3yeiU8vU9sWu6i9D0aao=;
	b=Ng77rnFKkI1HWHtgfejh3SdIF+MnTxRX7BxYZy5ZoBm1xP9U3JY93WyYsmZGj74Ezn
	TcSB9jo0WET6JHuJjcOl1Xq/zSZDRjZvC3IFx1R7G6Sl+q+2L4oh1xsD6fHh8ZsnjrP8
	12ZBJY+OIhUOR7EbfKSO7IIQkzKVDcBMzY75vABHdHym820m0PGXRQ7/EQVWgKYDn4ib
	pQ11d1WZzqXZVcbXYzQs9d14PhTmKKHF1Tl+SSFM5tlaXY+cDQGgc0d0HM2xmqOBvhvG
	Z+25LYH9CVA/UxHTkXIYXe53oUG3KMLAwpEbhmxpWw4ZhdRhsSESwtK2p52hRPlNeC/w
	9T8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sdio36T5ycW3l5ytP6akjSC3yeiU8vU9sWu6i9D0aao=;
	b=ikoLviqw314ggkpFAPFogKZ0Wfq8LRyjqriq5cVOUJsM2GrrpyKVpPvGBbYhkzyYqs
	c5MlwZlUeMejfBjsDNp+FEifGSmhEKGB3HwqpyF2r+p2C8GX9CD/jd1rlw65R79MsPhW
	er8ULrxGWl4HLiYtVhXtXC+JmO1qQQxKuSfH0UAcLpQ0Hmcto9jBLPN3jh+K1ZYgMcVT
	sqkPbMFQoYUNVYCk9CsddegACz1v4mfyqvSkbyImenn8u/LZONznQvCasbNqDx+zPSfS
	TuVgxoQxqnZE1UZELFxr90y2pY9+iYnh4KM76A7ltjLIbljT0MtohmEx3upyieuRSrqm
	ARWA==
X-Gm-Message-State: APf1xPCQI0ju2PYfOuwVHV0JTPo06RVNMDFitDlrAl7b/aIu0DB7lxgk
	GVbf5nddLLbUtBza1l1pgJ5kJIdsyqYen4FUSz8=
X-Google-Smtp-Source: AH8x225ScaJKH1uxX2ZNMVdRRHqILrEkPN2Hic/50QqFeZRoYsnmST7D1uXzMI/UfUU43ZlFYilcCu3/UvjnqI+tAWg=
X-Received: by 10.223.189.136 with SMTP id l8mr3473771wrh.58.1518203764992;
	Fri, 09 Feb 2018 11:16:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 9 Feb 2018 11:16:04 -0800 (PST)
In-Reply-To: <1518098282-23564-1-git-send-email-derek@asterius.io>
References: <1518098282-23564-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 9 Feb 2018 20:16:04 +0100
Message-ID: <CA+chaQdUtAC0EkTiebPUYBWybk972E89x2tTNvAnC2r0cMpVqw@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-smbus: remove sed to replace i2c path
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
X-List-Received-Date: Fri, 09 Feb 2018 19:16:04 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, works for me.

On Thu, Feb 8, 2018 at 2:58 PM, Derek Straka <derek@asterius.io> wrote:

> The i2c-dev file is now installed in the standard location, so
> the sed to change the path can be removed
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-smbus.inc | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-smbus.inc
> b/meta-python/recipes-devtools/python/python-smbus.inc
> index 0bca58f..57ca8ae 100644
> --- a/meta-python/recipes-devtools/python/python-smbus.inc
> +++ b/meta-python/recipes-devtools/python/python-smbus.inc
> @@ -9,9 +9,3 @@ SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f
> 2054bb39f19961d67e0c91610f07
>  DEPENDS += "i2c-tools"
>
>  S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
> -
> -do_configure_prepend() {
> -    # Adjust for OE header rename
> -    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: Module.mk
> -    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: smbusmodule.c
> -}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

