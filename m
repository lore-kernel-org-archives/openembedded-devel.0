Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5620771B86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 17:37:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t188so481647pfd.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lucnf5FtXqJKsUmnoJoos/2OrcB2kP8M5BHUMrU76iA=;
	b=Z/UH13F7nHLcj1DZYvz2lG0ZvqgpM6nR//cBgYfJUjHr4zof3oZ9zSbAZ11FdHusFa
	tUgMJMvtbfvWd5MqGX14Za3HLGNf/NaM91wFXC8Uwxjc8dQhmg6U1LU0aL1xTZx/I/7j
	gGTSV9cNjdg86tXBIvKKXKYLrx+q/H1E2FAjaC4TXH8vq1DCWY8Cc09Yg+JLY8xcegIw
	oH3vWNPL/n80oDMtkmt5dYryZ21+XqeRoqMVt1lD94QaToB6u/dbkdvItlLjvmZF/eKp
	Jv35p2egsmekjpRKcY1Xr0r/7tDDAzmJmXsXi1fq8+Z6o6g0zdzAS/ZN+jEIvnewaY4o
	yZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lucnf5FtXqJKsUmnoJoos/2OrcB2kP8M5BHUMrU76iA=;
	b=IwnGKpyIeKi6exOhmu+wHJcf+q1VT7aGveRrzA0BS5Umh7rLT5ViVUNnIbEOPyOm5i
	yG+uNal7C7krPMI5lWQL/9/LGtoH/LoCrOAibZW/fzqTbXgTZpx44e+8AtN7XbRYgBDT
	1aNakNCDyZbrhOyA+rmYNKeZWHwsWz3IM6gN0FuGJDR5ezO/VXifin0QOxInsxnb0Use
	qDoJJwQJw289ar0JvEn8b/b5lrp4nLVCKfIdyoT0lAQT2ALDPjgQznBpNS8fzPDsXECv
	n8j0XPl3WREphi7mDVmwXFJ/gPlaL742mUEBh2V3+7DRcXAEp8U5lS9bvdrJnLHy4kZO
	wnEw==
X-Gm-Message-State: AMCzsaW29Wb5a+rEylTFcgBrasdoV3KwrX1fZPyOuuHPo7jvzQJWuRfU
	jtAxugKM/RioDqgOba5SJAgyMp7iKupC9lCv4hc=
X-Google-Smtp-Source: ABhQp+R039ztas5dNr4nByBjAreLErlOgimJelDxP1JjLI2OW70WhJfBn+6fz9tBZIK94kbgg2R8iunDJqqGhDUro30=
X-Received: by 10.99.107.197 with SMTP id g188mr2649131pgc.341.1508953067239; 
	Wed, 25 Oct 2017 10:37:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Wed, 25 Oct 2017 10:37:16 -0700 (PDT)
In-Reply-To: <1508945869-2384-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1508945869-2384-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Oct 2017 10:37:16 -0700
Message-ID: <CAMKF1soZjsH=TPUDeBvJntJStZ=g2PzNp5QSwAYbtby81y6H0Q@mail.gmail.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Wed, 25 Oct 2017 17:37:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 25, 2017 at 8:37 AM, Manjukumar Matha
<manjukumar.harthikote-matha@xilinx.com> wrote:
> The Whetstone benchmark is a synthetic benchmark for evaluating the
> performance of computers.
>
> https://en.wikipedia.org/wiki/Whetstone_(benchmark)
>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
>
> diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> new file mode 100644
> index 0000000..2e01e1f
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "CPU benchmark to measure floating point performance"
> +LICENSE = "PD"
> +LIC_FILES_CHKSUM ="file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> +

Use COMMON_LICENSE_DIR instead of COREBASE

> +SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
> +SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
> +SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
> +
> +S = "${WORKDIR}"
> +
> +do_compile () {
> +       ${CC} ${CFLAGS} ${LDFLAGS} ${SELECTED_OPTIMIZATION} -Ofast -o whetstone whetstone.c -lm
> +}

SELECTED_OPTIMIZATION is already poured into CFLAGS
> +
> +do_install () {
> +       install -Dm 0755 whetstone ${D}${bindir}/whetstone
> +}
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

