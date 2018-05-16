Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0C65B74845
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 17:11:10 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id c11-v6so796740plr.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W6hozn3DdXVFqpagMNziAODbWOPBiKPti0Bz9BRRRe0=;
	b=NfEUcgIhqKFPJGkwP416J5i1YEaO0IV5XKY+TsYj84YUwpKOLpaih1gB/nJ7giXwjH
	N3IHTHa+TraKQLr9L5MrmOa1CsU1S5gHmbNMUmM62EahtdY4upw+88ax+leMjSWoDTN0
	U+xshsP0Cl4A7M8XgrIWzGIBxVkKADuDH6V8R7j8+98NSWjmYquKSE+Usakek+L8LpWF
	FpfDJLnoGTR5f/XTHYI26i2qVzeXaAHszkULkpW5RfbKpwibqeh0A7N/JOxBB9IrbLbb
	UlWVwOKc8MiwMwY3AkJ5EmiNi6zoTTAAI5V6+Wh3R5f5AgMwwxdIzj+bR/L40PG5h0KG
	yHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W6hozn3DdXVFqpagMNziAODbWOPBiKPti0Bz9BRRRe0=;
	b=oEwunv02YdfKaIqwMA5165BWfvPHaygBAekADA3CUwLghtsYoPmGCsF471m8p3Almz
	vgWqTjvxwtDK4tbBTB412JG/JWY7vjQeMgLpq7O4qK+jjyExeH3P+z2DAe7DYOBTakQI
	w5oI4RUSl3GD70NzMtFzn8sl9dQE6RWpCJo+KiCGnariHXSeXzyINyyCh0OEf5hdTIxY
	OO2cIfpM7NBlLHDN7Fs55/YGVMhGVlY9OqM9ZxjOwFEGfq+7nfF2kGA9e9bXjRW0Ge8m
	b2VmKFFOpEjgCS7oe7Mhy7pyWWQnmuwTudrfhaZxTD6VuDt+h5J5y249J3qROOTFC/2j
	vDFA==
X-Gm-Message-State: ALKqPwevB69JzKQUkMKPvJiR3eEyx1C+8HNvonzYONn9dMqrOUTk7VeE
	fgzEBmoktgT9c7Gt6rnQb/Wah1ZUGY1/oZtU2dI=
X-Google-Smtp-Source: AB8JxZosL2gaWAztOBVL43p9u8JcFtDCNxp4EJfCQlfTxxdR/mAkOaqaxwWyKPiP3L6rJPEZsOPbwX2sbVh7JQefrGk=
X-Received: by 2002:a17:902:10c:: with SMTP id
	12-v6mr1766796plb.252.1526490671536; 
	Wed, 16 May 2018 10:11:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Wed, 16 May 2018 10:10:41
	-0700 (PDT)
In-Reply-To: <20180516170632.15614-1-twoerner@gmail.com>
References: <20180516170632.15614-1-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2018 10:10:41 -0700
Message-ID: <CAMKF1sqAWHSmiphAcc6GvgmJaOybVVVSOB0HG_9GrU=gGmSVkw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2 1/2] openh264: fix build for 32-bit intel arch
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
X-List-Received-Date: Wed, 16 May 2018 17:11:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 16, 2018 at 10:06 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  .../recipes-multimedia/openh264/openh264_1.7.0.bb        | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> index a7aaab3623..d77de2876b 100644
> --- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> +++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> @@ -3,9 +3,8 @@ decoding. It is suitable for use in real time applications such as WebRTC."
>  HOMEPAGE = "http://www.openh264.org/"
>  SECTION = "libs/multimedia"
>
> -DEPENDS = "${@oe.utils.conditional('TARGET_ARCH', 'i386', 'nasm-native', \
> -              oe.utils.conditional('TARGET_ARCH', 'x86_64', 'nasm-native', \
> -             '', d), d)}"
> +DEPENDS_x86 += "nasm-native"
> +DEPENDS_x86-64 += "nasm-native"
>

if using overrides, perhaps using _append instead of += is better.

>  LICENSE = "BSD-2-Clause"
>  LICENSE_FLAGS = "commercial"
> @@ -17,14 +16,14 @@ SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f68957
>
>  COMPATIBLE_MACHINE_armv7a = "(.*)"
>  COMPATIBLE_MACHINE_aarch64 = "(.*)"
> -COMPATIBLE_MACHINE_i386 = "(.*)"
> +COMPATIBLE_MACHINE_x86 = "(.*)"
>  COMPATIBLE_MACHINE_x86-64 = "(.*)"
>  COMPATIBLE_MACHINE_mips = "(.*)"
>  COMPATIBLE_MACHINE_mips64 = "(.*)"
>
>  EXTRA_OEMAKE_armv7a = "ARCH=arm"
>  EXTRA_OEMAKE_aarch64 = "ARCH=arm64"
> -EXTRA_OEMAKE_i386 = "ARCH=i386"
> +EXTRA_OEMAKE_x86 = "ARCH=i386"

can you take another look if there are other options eg. i686 ?
if in literal sense it means i386 then we should not be using it
for newer i*86 arches.

>  EXTRA_OEMAKE_x86-64 = "ARCH=x86_64"
>  EXTRA_OEMAKE_mips = "ARCH=mips"
>  EXTRA_OEMAKE_mips64 = "ARCH=mips64"
> --
> 2.17.0.rc2.3.gc2a499e6c
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

