Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA9961604
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:43:44 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t13so3169014qto.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9iPAqdqljQ8YbhaoqzRp+e6bTNhIRdH8KHmoqb2UHPk=;
	b=odHAlhcZyjj9zSWC+QD5YdCNSLvYjfAAKmYcyQ0A3sx9Xt93xALrcbvnwHsRO2Apxb
	W9DURUSAVjf6NetS1ebIUgbB8j/c2SDd3v3pbhmb9qRpAB6h6XDg99KtBnhFvkWESRXT
	2+CBJB8PpLCOkBEi6ThLbxWQjE0jFKkAZBbyiJIb6ZoTclXz+cvRsuA20XVz2HudBzJd
	LpX5Dv57YUEkvkSdCcPz2Nvo+wOMoBGHIkZO1jP7iTAkkcb0DJXtvn1NN3oa6ljlQQIS
	+qwSpmOG5jkW62fMZJuXkgaOY5c5Hc+Q4Xwhi9n9WoN2c+JTwlgVrz++ACrhXLD6ZKsV
	jRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9iPAqdqljQ8YbhaoqzRp+e6bTNhIRdH8KHmoqb2UHPk=;
	b=STjp5Nu5sbCyHwIL4EXKV58Wlg2IxTiBBv/hFzO05XICkQwlj0P3OE9InkGKIbS+52
	ib4M+mxKtWdJyrIZquMyeOfLNZjzP5NlyBH2a0OZt0OULMOTlg1y6LH0xTC0Tsbz3LtE
	/d6qd8TBJQ6P72CECH+WWJ4Sm1m+/e+ph4Mkc0TaotT8S9zgqW6kQHE5fGkU06Mg2psx
	afWINLIlHW4TAlIMuAtFYSUFPcNnrrgXq9pDKqiT3a1rNkQgwTJsdcH8+ZHG2S5qVnH7
	KfVV+IelgSwlk1XWEaHPZjiPY2LvOSvD4YVByndGRQybvWzECjR1DCgPDvJP/0lol1Kd
	5IZg==
X-Gm-Message-State: APjAAAXuW7xt0d8+P2Cmv++d04HHorGrNJmPCVjedL7gWWEWVoELGVsW
	/nXbi6NAAPzOo1+8O8X5lTcILw0+OuzqrMbXa+P1tlkVfH4=
X-Google-Smtp-Source: APXvYqxIHHB2l+3uacVC1UpCQzSTwLdoIs/biVxn0oLiZ9Nf7713SwrFI3pcOHq7NGYOdEmlwXiwStZUerdBrUnhuFM=
X-Received: by 2002:ac8:4e3c:: with SMTP id d28mr27153904qtw.190.1582213425571;
	Thu, 20 Feb 2020 07:43:45 -0800 (PST)
MIME-Version: 1.0
References: <1582191622-130680-1-git-send-email-wangmy@cn.fujitsu.com>
	<1582191622-130680-3-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1582191622-130680-3-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Feb 2020 07:43:19 -0800
Message-ID: <CAMKF1sqtThAMz=ThJRNVpuKmG366v-bqhAT0Q6oYHnHikqLY1g@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mraa: upgrade 2.0.0 -> 2.1.0
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
X-List-Received-Date: Thu, 20 Feb 2020 15:43:45 -0000
Content-Type: text/plain; charset="UTF-8"

fails on musl/x86

http://errors.yoctoproject.org/Errors/Details/391870/

On Wed, Feb 19, 2020 at 6:29 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/mraa/mraa_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
> index 6d42c6771..745e4e3b9 100644
> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> @@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/intel-iot-devkit/mraa"
>  SECTION = "libs"
>
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4b92a3b497d7943042a6db40c088c3f2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=91e7de50a8d3cf01057f318d72460acd"
>

please describe why this changed in commit msg

> -SRCREV = "967585c9ea0e1a8818d2172d2395d8502f6180a2"
> -PV = "2.0.0+git${SRCPV}"
> +SRCREV = "e15ce6fbc76148ba8835adc92196b0d0a3f245e7"
> +PV = "2.1.0+git${SRCPV}"
>
>  SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
>             "
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

