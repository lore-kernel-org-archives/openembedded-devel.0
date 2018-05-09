Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0E82C75160
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 23:34:52 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x191-v6so147921vke.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 16:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x4kZI5tqwPBWi1jl/nIoC47y7ev/1DomBN1X7LTUgoU=;
	b=MDZpqfaM0k2MJFHkRTXXduIvPNrvyzWk3yPU8wRqTj9tRemvpZPTmtG5YKXDbTklfu
	88/3o9qaOcKOPk0pjEEKVJSIP/i/h2DSrDEQUl99V/Kr7xCdtma+WzZOGu+3gfNeGP3b
	RzwNIHcuoySNZhxXPBedDqrFi4gAKxvxBQuYX8XCgtQfUkiBNy6XCT8DC9ZCkb+LR0aN
	UuPn6VBfumnM8OTyrcBZljawWkd7FUp6LVBNOgFXNbYVPIpagAvcym6JpTQoZh2OkHY1
	nckuQaaobxBnBOYtSYMxTWu+uiF/abPh5BdxAtLLAzedOAJ+uglAf2xCTena7vGMr5FC
	kkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x4kZI5tqwPBWi1jl/nIoC47y7ev/1DomBN1X7LTUgoU=;
	b=KGkLg+MYzTUxFUT1jffN5ToFLg1X2TXvAGqpjIN10g0+RoXOK/Se+vEFgTmEZHOUCv
	LGQl26tQR/4DWwfu5eQ+d6mhUdFHyNGPHFSqJrE3Bt/DuYaXyTAUv7kNs/hr0PYz8tI2
	b3S5J3C1IvuBiv6NLY7qvCHbthGYZd7BFfD+zOJobCRvi2N2uIHQ0GUFKKiuOBO50exE
	0QkP3EVgvQyK05nowj66R3zLrVDSJMP2sn6FKNUOGHy81Os/oKaE891Ip66bh8OYYCi8
	eASVoDs9UBeDjyBKooNeFYKW2WkXL+pJ+j5J5yJyT5VCyNwd/TyObh8wX95Wm6zcHFyc
	whmQ==
X-Gm-Message-State: ALQs6tCs0FZzottYnvLyXMKJqCUmCjMRINX9j2o41C6UEYGuF24vwiSA
	NjTdMK3LlnTw2aUVuu596y9yMzqtfEnMqS0VCmU=
X-Google-Smtp-Source: AB8JxZquZ/oo+ymOwQHrt+CsO8+8KybLUzkM1UJe6xeDcc1UnONttop8ioYmygm24qnTntpuCjWQc74gODJ2s13orKA=
X-Received: by 2002:a1f:b254:: with SMTP id
	b81-v6mr33168577vkf.20.1525908893490; 
	Wed, 09 May 2018 16:34:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Wed, 9 May 2018 16:34:52 -0700 (PDT)
In-Reply-To: <20180509224633.17514-1-twoerner@gmail.com>
References: <20180509224633.17514-1-twoerner@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 9 May 2018 16:34:52 -0700
Message-ID: <CAJ86T=WLNNu_dR2-QazLZXoWXcdY0inh1KxyF_EC_LebQJHS9A@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] openh264: switch away from github archive
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
X-List-Received-Date: Wed, 09 May 2018 23:34:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 9, 2018 at 3:46 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> Since we know that github archives which are automatically generated have a
> tendency to change their checksums[1], switch to using a git clone.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  .../recipes-multimedia/openh264/openh264_1.7.0.bb          | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> index a7aaab3623..de8352336e 100644
> --- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> +++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> @@ -11,9 +11,10 @@ LICENSE = "BSD-2-Clause"
>  LICENSE_FLAGS = "commercial"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
>
> -SRC_URI = "https://github.com/cisco/openh264/archive/v${PV}.tar.gz"
> -SRC_URI[md5sum] = "93da4e76cfda7ede8fd2df51b0021efd"
> -SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f"
> +S = "${WORKDIR}/git"
> +SRCREV = "a180c9d4d6f1a4830ca9eed9d159d54996bd63cb"
> +OPENHBRANCH = "openh264v1.7"

"openh264" is a combination of "open" and "h264", so using "openh" in
this variable name looks a little odd?

Since the variable is local to the recipe, maybe just "BRANCH" would be OK?

> +SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${OPENHBRANCH};"
>
>  COMPATIBLE_MACHINE_armv7a = "(.*)"
>  COMPATIBLE_MACHINE_aarch64 = "(.*)"
> --
> 2.17.0.rc2.3.gc2a499e6c
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

