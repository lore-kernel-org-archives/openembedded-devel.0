Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id C2217762B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 06:06:05 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v19-v6so4728499qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 23:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lXtOfdUrAihPvO4Wjyva3dSmQPO/kBqnxROC4m5XqQI=;
	b=Qtsnr8w30yzOA7S4In4vtJNgOZGDlSAy8RLxrhG3cnUCNAYk/BRVgbT2bfQBWsmTBP
	vb2691C5XKQ7pciYGwouo0M0yh9gjiOfCikNlsOZhf4KmNDr2poQ4LS5TOu42Y/uNy9f
	b49DYbjReqg+IxD/t5dhYyFIMuA4W0VsY33blbpuWsZBVGeXc5kdG3gYOSGl8+wsYZW0
	blPzih4a1GdHvrqU+5WB6Mn3CMNkMQGlrIeM45zPJTDSLHNmiv6Ts3wh2lr/NYOBQlZ6
	hqD3JPaC0n+5AMwMDqlV3cFXxdL5PvjqGnedX2b7rVs/jP80a9ortVrleSi77Pndn6JJ
	PCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lXtOfdUrAihPvO4Wjyva3dSmQPO/kBqnxROC4m5XqQI=;
	b=ehqs0/zUJ25uEpaUDxK7zHbVjsfH9Zqfff+hFboMqTzVsAAkbwlulw0ogy0EGNkjx7
	iEEvs9bM6ZnHhBi886bvDG74nzHfkNf//BSBkt54Hdo+6ds4EhbBm3N0SCxva8twegV0
	GLsg18R7+6E1mLpaYFhStH7zx5TXwJBVxpLOJWi9W5gdC701P0n8yDEjZPd/nqWl2S7N
	3MMlfuwmekgEyaT0OsM6ro/f1P6kVyCN9TIeBJKZlP8WVg39IUv3NDJgIAb/5Sd0mQ+H
	17Pyh7fDRa5sK/Fxn4iu1BxyQF4hLXIbRIoLQRRuHoPVXCMepXed5Lnxzf6x0ec101BU
	gUNw==
X-Gm-Message-State: ABuFfoiF8r0gzuMw1SvcKxqC/57Ciom4xY3Q99M6szh2D6t12Pk5EYeS
	JH6KSlPwGNzRi5QMgifYH4ZdVlGm71jQV0pUG6k=
X-Google-Smtp-Source: ACcGV60bG9By4GneTO0NGE//fdKGQ1e+Tu9xeR/hM24u5EXyxvoanRehUoVe4/G+LhWGCdh3fO5LUioJduec9ykF7wg=
X-Received: by 2002:aed:3b04:: with SMTP id p4-v6mr181086qte.218.1538546766358;
	Tue, 02 Oct 2018 23:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20181003055941.175426-1-wak@google.com>
In-Reply-To: <20181003055941.175426-1-wak@google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Oct 2018 23:05:40 -0700
Message-ID: <CAMKF1so32EhZmzb2Jd47wFYCzs2Np7BrUPE8C+V82N+63PnZ8A@mail.gmail.com>
To: wak@google.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cli11: Add recipe
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
X-List-Received-Date: Wed, 03 Oct 2018 06:06:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 2, 2018 at 11:00 PM William A. Kennington III via
Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
>
> cli11 is a c++ command line parser library that provides a simple
> user interface with modern c++ semantics.
>
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  meta-oe/recipes-support/cli11/cli11_1.6.1.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cli11/cli11_1.6.1.bb
>
> diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.1.bb b/meta-oe/recipes-support/cli11/cli11_1.6.1.bb
> new file mode 100644
> index 000000000..2d231b98c
> --- /dev/null
> +++ b/meta-oe/recipes-support/cli11/cli11_1.6.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "C++11 command line parser"
> +DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
> +HOMEPAGE = "https://github.com/CLIUtils/CLI11"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
> +SRCREV = "v${PV}"

it better for reproducibility that we include the SHA corresponding to
this tag instead

> +PV = "1.6.1"
> +PR = "r1"
> +

drop setting PR

> +SRC_URI += "git://github.com/CLIUtils/CLI11"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE_append += " \

_append/_prepend with += is not a defined operation even
though it might result in something. We might be ok with just

EXTRA_OECMAKE +=

here

> +        -DCLI11_TESTING=OFF \
> +        -DCLI11_EXAMPLES=OFF \
> +        "

why are tests and examples disabled ?
I would prefer them to be part of build and packaged into
different PACKAGES so we can install them if needed e.g.
may be with ptest enabled we can install the tests package

> --
> 2.19.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

