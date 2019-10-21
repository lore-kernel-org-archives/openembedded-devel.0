Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id C780D7F44C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2019 21:26:40 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u184so14264816qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2019 14:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OMRr3MmYoFhxXjSVHI3jr1HEXPHwEYw1QQZQ5MVUx4A=;
	b=jsL8oFI1CVWsYvlZtGDnLNRzcyBMun+pwz1eUB9WGP+QyAThBWx0Am8wg2Lip2hpzo
	3wIFna2SffNzY75QyeZ1zvPn4FC0rnD/IK+bWwsl1DhUIVc2b0Q157jrO5ztvmouKRM6
	VUmQmfsO71Tnngg26NoGTbOIQJAdVlvfO9p7y5ehilQ/piCXtpeEWnjkgGNwZzufyXaY
	cTOAYVFnXG/kjc1/qwwMVas1ohzO6EhylqMngelXtl5rTENiOE6VrwTBBPypveJtOF75
	w/c3ycCHj4JepatJ8KO9WVDhNZie/aKEmYkzQklQfxf1KhqcdeUSRwcSObz+infro6xD
	fl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OMRr3MmYoFhxXjSVHI3jr1HEXPHwEYw1QQZQ5MVUx4A=;
	b=A7DYyITtXpSqSv5IE14YoWNqCICXLoe3mTtOxEiczfSgifF2FsK5B94yPgazqqQo7x
	DCLZs2iq5zPOWqaFAtRvzTnsR3zitX/V/53mlBHC6F00X5Ym6IGfHMVeYVIN20ekI3d3
	cen2cKRVhw4bSqUw7UflPo7kFpJtJ/35M6Mfjwd2SuKlNnm1M89TmJ99VWwroDHBTaxc
	iM60AyoS8ZTo0mlgrhN0r3l9dgTZIJS2LTLbEvykD1+gi8aaZwcLeTMFibchnEd46Qao
	X70vg6f6RIS3W+UFr/c936h/VnxmHySdcyckr5CEp6h6Fq9SKYMpT4Qv7edW+q4F/tCl
	KqrQ==
X-Gm-Message-State: APjAAAWuyJOhbMBpDw4uCujOb01I0T2x0NqVaUWUfP4dSZv0HOAzvp9Y
	aj7+O9oiRW4v33s/3Xi3jvzBV2eIDSVQisRZOTE=
X-Google-Smtp-Source: APXvYqyRqRTHziOs4pxkDQxwbPeo98LB4DHzydOKa372fdmfLZZzPBWDFKSvwHJt7yOjZphZO5GpbgwSTgffZfXNO8Y=
X-Received: by 2002:ae9:f30e:: with SMTP id p14mr23661131qkg.71.1571693201170; 
	Mon, 21 Oct 2019 14:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191018234515.15676-1-wak@google.com>
In-Reply-To: <20191018234515.15676-1-wak@google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Oct 2019 14:26:14 -0700
Message-ID: <CAMKF1soSC=gmGrk+3DxdbLa_nr4Qj92489_1_4gBKPAB8mu=hQ@mail.gmail.com>
To: "William A. Kennington III" <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] span-lite: Init at 0.6.0
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
X-List-Received-Date: Mon, 21 Oct 2019 21:26:41 -0000
Content-Type: text/plain; charset="UTF-8"

also fails with libc++/clang

https://errors.yoctoproject.org/Errors/Details/274130/

On Fri, Oct 18, 2019 at 4:45 PM William A. Kennington III via
Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
>
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb
>
> diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb b/meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb
> new file mode 100644
> index 000000000..0ea2dcc8d
> --- /dev/null
> +++ b/meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "single-file header-only version of a C++20-like span for C++98, C++11 and later"
> +HOMEPAGE = "https://github.com/martinmoene/span-lite"
> +LICENSE = "BSL-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
> +
> +SRC_URI += "git://github.com/martinmoene/span-lite"
> +SRCREV = "34118d2df7976f635c8fd35b5959f86cb52ba93c"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +inherit ptest
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

