Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id D6D2A78BEB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2018 06:23:11 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z16so12479155qtq.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 22:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UVRIRSFOxQWF1A0CLSKtX+vmM05gzzIunTjaoZf11Fg=;
	b=TtpS/w5lIJed0xchPUHhHYYIv3l5ZGdQADzsss4IA1raD2jXRe+8QkxAJ/yYtJnsvL
	vY8xRTTq/oVcxJijqEQSdTC5qv/Y9uePZkPYGPiZhcDHe4QVMrUzUNkMKvZSLmNr6gYW
	kibKBnPvJYgORKR6YNlzHNzIj3dgaJqSD+M/+oGMG/6AHaE6/n5g0vaf1KJNNf1ZldKb
	j9dKvXYG76WxPcrN28kPkv3oSZBh7GoCMlWeNF40e+K/9By8u7aAyRSywo63NIbBC5hj
	/SN0T1Fwr3vml3gHqG6noMBTpSaF/i/JKCVA8wSZMlmRtOBdfX+MCXag5jsg4HKvklE+
	CKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UVRIRSFOxQWF1A0CLSKtX+vmM05gzzIunTjaoZf11Fg=;
	b=rhNK2FZ4CUBjBZH3Ex4OgLtEQycST7ui0kehOUEm/Wb1m1YE5l1uKcauNu0EFosCh9
	WQedMNizIXrtG9ZKO1fzQekq8FjD2n+5lWhQ46Rl8EuHxW4wavq35REFUl47fLMf7ceP
	5qZrsx6xtl6/UYGZ95Qh6ufX0JFzrsNK+OVs6uuTC9Vfme21sVGgadI9UQR0w6SvE10m
	8WLvpijT/v87WngGRTtkYnMAFNQMYa24PegjhHE0wJaKgaWb2wXfioX4LRSvtgvFRwE4
	l27x0+YTnIuV2SIhX22TD9hvjz5tAcRZ6UsuLSUepxuCbl1Fl2V1XrFF06g4XekhrWD7
	tqFQ==
X-Gm-Message-State: AA+aEWYvkJyCmVyvwbkpJe1PAoIAEEQZreDIPTzUy2QCBFDExY3BA5CU
	CJQV8VmNFmjaz4/JohBDHxUr2fxwDhttJ7YKzHw=
X-Google-Smtp-Source: AJdET5ebUAuqkOh/8gFuTaDFCYGkVYjhf/qGh2DT8GtH8mAAPYT50BPQ8Q7E+DP2GNVlVoyiyNvFwels5Gd8i80krqs=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr17710910qte.29.1543040592591; 
	Fri, 23 Nov 2018 22:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<20181123153941.10186-5-brgl@bgdev.pl>
In-Reply-To: <20181123153941.10186-5-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Nov 2018 22:22:46 -0800
Message-ID: <CAMKF1sqKKr5FkvWCeYeUVEXxuYjU84iZfvTHfzgFwjy4nuhnNg@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/6] libsigrok: new package
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
X-List-Received-Date: Sat, 24 Nov 2018 06:23:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 23, 2018 at 7:39 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  .../sigrok/libsigrok_0.5.1.bb                 | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
>
> diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
> new file mode 100644
> index 000000000..b60c64c3b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "libsigrok is a shared library written in C, which provides the basic hardware access drivers for logic analyzers and other supported devices, as well as input/output file format support."
> +HOMEPAGE = "http://sigrok.org/wiki/Main_Page"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +DEPENDS = "glib-2.0 libzip"
> +
> +PACKAGECONFIG[serialport] = "--with-libserialport,--without-libserialport,libserialport"
> +PACKAGECONFIG[ftdi] = "--with-libftdi,--without-libftdi,libftdi"
> +PACKAGECONFIG[usb] = "--with-libusb,--without-libusb,libusb"
> +PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx,glibmm doxygen-native"
> +
> +PACKAGECONFIG ??= "serialport ftdi usb"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI = "http://sigrok.org/download/source/libsigrok/libsigrok-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "a3de9e52a660e51d27a6aca025d204a7"
> +SRC_URI[sha256sum] = "e40fde7af98d29e922e9d3cbe0a6c0569889153fc31e47b8b1afe4d846292b9c"
> +
> +FILES_${PN} += "/usr/share/*"

may be use ${datadir} here

> --
> 2.19.1
>

