Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 36FA56067C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 16:35:28 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id s187-v6so8233434vke.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LiHk8u7+9vi96zFCpdgCkAUN6HuY6aVFgXpfEALLSg4=;
	b=esQspEfk415W8Tk6wPAXJWj8pZGPXRsW+1149D4R1spQy6a9EgqEBHQ3nJuiwgkpzF
	gqbCfc8ASnTB/EeOBpanyA3GNME3oGEPIwLesES64CzR5slVY20px7lsXOiKBirSm9BY
	b8KNrNfKgh4GEyB9GLXrLpuj9ixvh6AA1+M5f2GhhmTDV0HDlmZ/65TNxRB7mJvUYgTk
	wntI7wTqak1jIm6Ivwncl0BBNrf63hmdnBOXm3uFapFQkUdqCcJSwYGm03vW36ap+MhN
	uH/3ONNEsza9ZZo9UXq1ER3Ly3QKRP0JpUTUV6VdNVGs36VFAWouF0JHMHbemdnOdnlI
	Jm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LiHk8u7+9vi96zFCpdgCkAUN6HuY6aVFgXpfEALLSg4=;
	b=Gy3K7w6cjWXw6fkEmLO6w1dGQ9f1TpwBiTKLRiDjKoU4kvmzRiKObRMwgWiXoOi0Wt
	G9bM5VzpO0DYzZHYfF1o/8IC0yFegIRaYgX7pK3Nmg5PXK09O74rpUbZEB3I+KuoPNWp
	2e6F6eBD7EI05Ig+hYVCHnr4vc+0QqBmywOyGVBnGRdelVU43qP529BNVl340J3PIAYB
	yhFcVUCcy0c5CzngXK/qACaY7Wb/o9eLoHjePpMnIfDyJSccknbNXWRdk5II0/9eYFKH
	C6GO7ZQg9GnFmzf9ZfMl0/eeUvTSsGzbVc85HKH4mRjK4UePIhIXtAp7jPgLqrEytmUr
	NeIQ==
X-Gm-Message-State: APt69E1xd6S940JragJp7z8yLW3UCLeY3UGSfSK+hjliDj3sOc7kpxjp
	ZcUayZ4j7b6pG+cuTE3FwJ6LG/lgudWAlbHJd5M=
X-Google-Smtp-Source: ADUXVKLbSzqLGq5EL7Kx70+LevzeIyI+tcKNcgexIcdMESEk9agKWwYfhKhZWckDMCCZnSAzCZ8NDMpGJ9TrIWl5nco=
X-Received: by 2002:a1f:a285:: with SMTP id
	l127-v6mr7907022vke.95.1529944528839; 
	Mon, 25 Jun 2018 09:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180624191845.31082-1-raj.khem@gmail.com>
	<20180624191845.31082-18-raj.khem@gmail.com>
	<CAJTo0LZUq3ptRy_TrWdhZFyBw72Jb9wXCbQ2QZPFWj0JEhkFFA@mail.gmail.com>
In-Reply-To: <CAJTo0LZUq3ptRy_TrWdhZFyBw72Jb9wXCbQ2QZPFWj0JEhkFFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jun 2018 09:35:02 -0700
Message-ID: <CAMKF1sp+VhR+Qo3H+Nw=7UsfDz9Pno9c+0GNj6hhkuburP2pFw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 18/20] check: add recipe
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
X-List-Received-Date: Mon, 25 Jun 2018 16:35:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 25, 2018 at 2:05 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Already in oe-core: meta/recipes-support/libcheck/libcheck_0.12.0.bb
>

yes thanks, it seems I points devtool finish to point to wrong layer.
It will be dropped here.

> Ross
>
> On 24 June 2018 at 20:18, Khem Raj <raj.khem@gmail.com> wrote:
> > It is a C unittest framework
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-test/check/check_git.bb | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 meta-oe/recipes-test/check/check_git.bb
> >
> > diff --git a/meta-oe/recipes-test/check/check_git.bb b/meta-oe/recipes-test/check/check_git.bb
> > new file mode 100644
> > index 0000000000..e7bfece3cf
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/check/check_git.bb
> > @@ -0,0 +1,21 @@
> > +# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +DESCRIPTION = "A unit testing framework for C"
> > +HOMEPAGE = "https://libcheck.github.io/check/"
> > +LICENSE = "LGPL-2.1"
> > +LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
> > +
> > +PV = "0.12.0+git${SRCPV}"
> > +
> > +SRCREV = "285d04b3d461ba68dc39e0f9e847784fb6064bb3"
> > +
> > +SRC_URI = "git://github.com/libcheck/check"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +do_install_append() {
> > +    rm -rf ${D}${exec_prefix}/cmake
> > +}
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

