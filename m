Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 42F3F6BC7E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 04:29:59 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id z16so21634187qtn.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 21:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZyHcss+x8RljWq0iBsnEBHJ/QxqD4HCqnoSYuxhuFQU=;
	b=TLp+Iixk1IPUq1kt6qHg+hnQ7znfllmLqFEKMxq0f9RJIySZ76poGlvI+fzBQYkx9f
	1WZcAnK4lHgrHVKkHS0iM/tuDvuBRoYpvcchMOT2VFtp0kCt/QmRDZ9I76+JdpHKlcTR
	E+cFgdba4pNvG/cVsfsnjUN5OYVlCpcPhXSr4usXFem1QukPa5TBmVO6bgfqySUzdsji
	j9eEEs1rRm2qXmOgG96lbD1vEiUe6zI/cDwSqBs2w9RKYJ7/g3HJD6IpkcEwUvrj3ew1
	iz9N8NeUWrtm+snfmBaxR1Q4wh1sVCUvQUPC74Y1C8REoQ3mRJZ4rDNWLzKRov+m9o2l
	/cDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZyHcss+x8RljWq0iBsnEBHJ/QxqD4HCqnoSYuxhuFQU=;
	b=To5gP4E0BQLIl1ufilfepnCbFykS6ggfMJMxQv7dG315bVuvnaz/pNX13qnElkPTbM
	Tyz6n8zm3m2qLoM+i1KX/pFV0TZahlCdhwi05BQ7CeRAUBskr8sM8Hk2KQAcUZjR6zE2
	uIwAU8OxyOH2n7ZTZjg32FqhqmhLQ4HTaSb0JOzsS7GoXHA6T8UqThEVrDuYNFBsIqUp
	aVBO682Uj7bpmRMG1/dry0eq7ZIOXjdDT110zoqPlPRB1DkfMfPDjoG9yWji86ki/YHE
	WYPD6wt6aVWdm+b7VyAe9VPUj/l7WQyzgjug+qgLTk1IBjofqdNiunK+yJmrTVXycQg2
	hafQ==
X-Gm-Message-State: APjAAAXD/uKHnZwRTB0OkzkzdoY4txF9oQkvWdXOTBGOQ/lKOSYq41uG
	s4I63EZ8rn8i+fBLgynH/J/rIXlZYJNoa735JCw=
X-Google-Smtp-Source: APXvYqzDHpCIVylj4B+CzaNJTSK4MkufiDLdSlDikzQTdJ/CZR9ChHv7yDJ8VySLjFmsF6Z/tlxSL3lGLbHM/wBe1Io=
X-Received: by 2002:a0c:9561:: with SMTP id m30mr33346945qvm.224.1553747399893;
	Wed, 27 Mar 2019 21:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190327032430.59511-1-wak@google.com>
In-Reply-To: <20190327032430.59511-1-wak@google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Mar 2019 21:29:34 -0700
Message-ID: <CAMKF1srK4zKuwA0zzo6zNpASu_yYp1W8txE+gzgBiP6vzWuzAA@mail.gmail.com>
To: "William A. Kennington III" <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cli11: 1.6.2 -> 1.7.1
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
X-List-Received-Date: Thu, 28 Mar 2019 04:29:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 26, 2019 at 8:24 PM William A. Kennington III via
Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
>
> LICENSE checksum updated to reflect a new copyright date being updated
> there.
>
fails to unpack

https://errors.yoctoproject.org/Errors/Details/234626/

> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  .../recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb} (79%)
>
> diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> similarity index 79%
> rename from meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> rename to meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> index e62c1d3d1..1ed97a27e 100644
> --- a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> +++ b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> @@ -2,8 +2,8 @@ SUMMARY = "C++11 command line parser"
>  DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
>  HOMEPAGE = "https://github.com/CLIUtils/CLI11"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
> -SRCREV = "bd4dc911847d0cde7a6b41dfa626a85aab213baf"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8489f3831fc7b75264c1d5e346251a74"
> +SRCREV = "49ac989a9527ee9bb496de9ded7b4872c2e0e5ca"
>  PV .= "+git${SRCPV}"
>
>  SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

