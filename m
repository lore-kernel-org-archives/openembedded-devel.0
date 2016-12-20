Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 22FE877306
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 00:38:56 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id a197so107325539wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 16:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=x3fxtZWrLya/mbvpfD/JG4/ZtzgyN2rvOBO3N67CkFk=;
	b=jkKpzz89Mnx/lEbAuxn9gnSem6nKddFJGlcT5sfp0gOSEjMVhi0UaG00QslOLBijxV
	fGhvYVGmTR3WBbKH+ppKUGyqgL8uEi39iFAblMM9rpwBhMYcxO8xJMXwyy7iLbyaCBab
	XWZNgezgO3zMqZZmW4akZBkQKz3YkV6R0tYUxA1N/jM6vv0V4AxFBi7v1pr6XjtXBsUn
	zCz5DYSkCqRcMjaoGe4uV2goTU5+Ipe2vPzichR7pTpLaHuyfcgcZ67ARbtKZyj1XpxT
	ekHWSa5k9Y86crBOb63A/LBrhI14pswuVcpGENOm2KbgXegUDHKDvDxmlJv53n5bqtr+
	ivTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=x3fxtZWrLya/mbvpfD/JG4/ZtzgyN2rvOBO3N67CkFk=;
	b=IWcblurFVHKgqs4K9H3YUEeCrr9CH50HwvzlHr9JGJlivMo4KWPNgFhtS9rvkrjTka
	4KJLmLGfRYdJcEUKDTsPMkQRg7SpojQBIVZl7fRReN8mf9wY1AyrAWOrVK/kPJCXThgD
	jBs82Zv701O/T7AnkwAshZAu9lJRx9xhS8+qu8P2qb70rO1c/kSTzYDf14TSgMpips6y
	VNiLnKLNErOhrR4SOhgKsE0bzw0GJwluKeCCwcnh+hqwgd3jCOCfyXYL1mFYOBeFQQfA
	FvJXz5Y4EvEpw6pijxeHj3g/fSkBrHv5+h+X1YXcW0vZrPvw+aq3BykVegbwzhKC7eYS
	vBfw==
X-Gm-Message-State: AIkVDXImJq0scAkF8aVaOggUiMg5foQeEZ0Lj5PFk9spQRnlbXrP0kgbhhqY8PFKMcpp6gD6+mAM6kcaqSQA4Q==
X-Received: by 10.28.184.88 with SMTP id i85mr14704600wmf.49.1482194337667;
	Mon, 19 Dec 2016 16:38:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Mon, 19 Dec 2016 16:38:57 -0800 (PST)
In-Reply-To: <20161219205629.7768-1-raj.khem@gmail.com>
References: <20161219205629.7768-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Dec 2016 01:38:57 +0100
Message-ID: <CA+chaQffPQBehWQBuB=_5ckq006zsiWPjzc970g1nK_God8C+w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] yajl_1.0.12: Add recipe for yajl1
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
X-List-Received-Date: Tue, 20 Dec 2016 00:38:57 -0000
Content-Type: text/plain; charset=UTF-8

Please don't use github archives which might be regenerated with different
checksums.

On Mon, Dec 19, 2016 at 9:56 PM, Khem Raj <raj.khem@gmail.com> wrote:

> yajl1 and yajl2 are not ABI compatible, therefore
> add a recipe for latest release of yajl1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
>
> diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> new file mode 100644
> index 000000000..ed62bb25d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Yet Another JSON Library."
> +
> +DESCRIPTION = "YAJL is a small event-driven (SAX-style) JSON parser \
> +written in ANSI C, and a small validating JSON generator."
> +
> +HOMEPAGE = "http://lloyd.github.com/yajl/"
> +
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=da2e9aa80962d54e7c726f232a2bd1e8"
> +
> +SRC_URI = "https://github.com/lloyd/${BPN}/archive/${PV}.tar.gz"
> +SRC_URI[md5sum] = "792672a75c3aa87a283b8714545a0bd0"
> +SRC_URI[sha256sum] = "5f0d297154da89f0131b71110c0e95
> af78b6127d6252930441fd20671bb28167"
> +
> +inherit cmake lib_package
> +
> +EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

