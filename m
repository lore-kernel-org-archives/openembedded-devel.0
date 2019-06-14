Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A33237D278
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 19:05:16 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id s15so3705905qtk.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6vlceaMj/0QdhSdXQBqvYKbwTLYjlZWdSukeH+H0DwM=;
	b=P8gZocfDrw4nXutRs6vtYizDnEH/uz2dDS77uPq/f2hbaWFGsGTjiDEGo/bLyVhdxi
	EZgQ/zTkZA0ZutGNFqcScwKhqMXiC5sgbHgZQrp/62lP5Qw5UNC1XQRwvIEKxcr2+y3f
	RJhcQK4EHr/F0EMZmOaOTt7U1slbTWU1Dly8rwAOPE9YjRW1JTGuwLlAgX7wU2li7NdW
	ZM8E7X/3zNgTptkG97TZ9VzobEosgOy/0fxTXHfx+IOf31TsBsdH2Z7UW2MY+xd6g1pS
	Vlx0Qwt/hcRjZR+tU6C0M2Rxxs03zvfXLNlSmniiRSCBusbsbw60hgq6TImvndk4o4gm
	4xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6vlceaMj/0QdhSdXQBqvYKbwTLYjlZWdSukeH+H0DwM=;
	b=gRtvC0eRSMb2O+rQjHdpFJx8z7jr4br3KU+pA0D1a4lfofMksATQsrtVwLW3qaAp8X
	YTAxqbdR/7Vq/9RZENhIi++mZ4pcGMO3LfFUZ3syCeFy0yGqOGdjz/FsS1XRfmEKRYK0
	zqVpTA9srCYCRrej9tyomYYUSrfl6SOpPyxZMR+T0c8bfa6xpxDcUQgOhos9//GM8xxN
	evaXJ9kHKMNqN2W1GcJVcJmMVM/9a67W1cZHDnc/u97ml2eGrV8BMqbB3U4Vlv9NsIBQ
	WLWvLGd/1Bk6IqX0NNjgaA0tQ8ei5jJkQgXgF6HaKnaR1aVQs2Xgr3bMDaMo6nt2MgGf
	ZeXw==
X-Gm-Message-State: APjAAAV1W9mMv3aUk3jpNK+94V1M72+x/b2/HHFcWCqs4J2Ivh2FhFY4
	SVl+WDZSJAZ78w7Z6+2aotoVBwhefR+kzLYQbikcd5VA
X-Google-Smtp-Source: APXvYqy3CJQn6CrbS/3u9lImQgsCPM/+ksjWgykbzaszIVUGiPZfFaeDS5uqHfUKD8ALayheQfZKd810lmSpv+jCjyY=
X-Received: by 2002:ac8:2cfc:: with SMTP id 57mr80834182qtx.194.1560539117270; 
	Fri, 14 Jun 2019 12:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <1559305488-7112-1-git-send-email-maciej.pijanowski@3mdeb.com>
In-Reply-To: <1559305488-7112-1-git-send-email-maciej.pijanowski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2019 12:04:51 -0700
Message-ID: <CAMKF1srcujMyTL1OaRa+AZyjKnNqOJEvSVZ34uh+CYpv+FqJkg@mail.gmail.com>
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	piotr.krol@3mdeb.com
Subject: Re: [meta-oe][PATCH] recipes-benchmark/stressapptest_1.0.9.bb: add recipe
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
X-List-Received-Date: Fri, 14 Jun 2019 19:05:16 -0000
Content-Type: text/plain; charset="UTF-8"

I see it fail on qemuarm/musl

https://errors.yoctoproject.org/Errors/Details/248676/

On Fri, May 31, 2019 at 6:42 AM Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
> This patch introduces recipe for the stressapptest utility.
> The recipe builds without errors and warnings (tested on thud).
> It basically uses autootools to buildm so should build just fine
> on the other releases as well.
> Basic commands from the project's README were tested on a few
> armv7 / armv8 platforms.
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  .../stressapptest/stressapptest_1.0.9.bb              | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
>
> diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
> new file mode 100644
> index 000000000000..3e5748a3a12c
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Stressful Application Test"
> +DESCRIPTION = "Stressful Application Test (or stressapptest, its unix name) \
> + is a memory interface test. It tries to maximize randomized traffic to memory \
> + from processor and I/O, with the intent of creating a realistic high load \
> + situation in order to test the existing hardware devices in a computer. \
> +"
> +HOMEPAGE = "https://github.com/stressapptest/stressapptest"
> +SECTION = "benchmark"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ea9d559f985fb4834317d8ed6b9e58"
> +
> +SRC_URI = "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "d3a526c174c049dd7a1068dc74a62be2"
> +SRC_URI[sha256sum] = "2ba470587ad4f6ae92057d427c3a2a2756e5f10bd25cd91e62eaef55a40b30a1"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +inherit autotools
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

