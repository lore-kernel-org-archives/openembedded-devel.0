Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 04194782DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 16:21:18 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id w105so2484430wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=52q5nbta/MLza0NdRTvi2NYjzulP14yXhghKB0ad8Zc=;
	b=FIQDns/JKyPq7VD+GAhb5KkbVAXKmJUAspFEMr6h4cZWfGNea34PVqp2qnYruhJIrS
	2KWBw148RqMnLspCDs+Dpxrn1EtIyxqyIfmQ3pqqxGdeEYrkc1gce51J2Ee22kqP5y0l
	+9JGI1qlQAjjrrqytnIcb6nXpL9HhN7Hn/RQXkE4WqSGjABKMBBFU3XnjqLBedZpIG48
	owJUBFlHN7FlGaf72VFxQBPusd4nUHnEcikAHSfFoDQpzG8DD/jqkCFCng6/NtUY2MCx
	qfV60KAaDPwLJZp8cUx/V1U/YkNU3CxW+9xdNDdIuplcdubzWQaytM6EomGtj29GE0sQ
	7pqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=52q5nbta/MLza0NdRTvi2NYjzulP14yXhghKB0ad8Zc=;
	b=XfkgHtlUDOULx9Fezk1Vg80mWgohxCsjZuRmsAkPJgjQZfVlBcph4aXqnuqn47xFcE
	OxsEa6VOe6LdfDM7rUC+TOAeCWAvDJgo+8kb6JDbVwVS2glOo/7Mzx9gykwxF1xoVda1
	vsdaOCrGkiwkvWmlOHOsJ8qCanvD/0L7jsiueauN+bUl8gMOIevuWbb3pL07/A47zBF2
	z2QgAZLu2pWmF7AdX5fgSJuGp9ngp1OxEYiFxxM5HNp7GvbrzKg9EJi6GVW6fAVqNArl
	fmJe8jsm6KI3CIs8KA1c0H5/2Cj8tzFBQm8F5gBjZIH7jNuvnzvyV6lobgJDefeF8YO9
	rzMA==
X-Gm-Message-State: AMCzsaU9iaRSfNaTe5FaOBcVvvifSoaR4zlymexpoR7jz21Dn6PwvMDB
	X/4KxRwzvKGNyRPn1br3BocLHq3nEd+Qq6TEDBI=
X-Google-Smtp-Source: ABhQp+RcpUPH95bZEKwJaewXAHm++h4U7QLRBVRcdr/0qjko2sGksZlAabytnfaf9k4OLIhwGLbSUtaW8GGbqdwovfY=
X-Received: by 10.223.158.208 with SMTP id b16mr4547804wrf.99.1508516479739;
	Fri, 20 Oct 2017 09:21:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Fri, 20 Oct 2017 09:21:18 -0700 (PDT)
In-Reply-To: <20171019174010.4331-2-anselmo.melo@intel.com>
References: <20171019174010.4331-1-anselmo.melo@intel.com>
	<20171019174010.4331-2-anselmo.melo@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Oct 2017 18:21:18 +0200
Message-ID: <CA+chaQcdpxeQC5Q2SB_x+C4x4Xph8y-Yc+qN_HVsxw1_Xje-5Q@mail.gmail.com>
To: "Anselmo L. S. Melo" <anselmo.melo@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] opencv: fix runtime dependencies.
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
X-List-Received-Date: Fri, 20 Oct 2017 16:21:19 -0000
Content-Type: text/plain; charset="UTF-8"

Follow the README and put [pyro] in the subject.

I've noticed this only because this doesn't apply to master where 3.2
version was removed 3 months ago with:
commit 31fceb560c0b81cff3aa439e3f43fd7a04dc477f
Author:     Ismo Puustinen <ismo.puustinen@intel.com>
AuthorDate: Thu Aug 10 12:58:18 2017 +0300
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Sun Aug 13 13:21:02 2017 +0200

    opencv: update to version 3.3.

and this commit is already in master.

On Thu, Oct 19, 2017 at 7:40 PM, Anselmo L. S. Melo <anselmo.melo@intel.com>
wrote:

> From: Ismo Puustinen <ismo.puustinen@intel.com>
>
> The newly split "libopencv-ts" package is empty (and thus not created),
> because all ts files are installed in the development package. So, do
> not add a runtime dependency to libopencv-ts.
>
> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb
> b/meta-oe/recipes-support/opencv/opencv_3.2.bb
> index 535c761fa..fc62e9975 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
> @@ -126,7 +126,7 @@ python populate_packages_prepend () {
>
>      metapkg =  pn
>      d.setVar('ALLOW_EMPTY_' + metapkg, "1")
> -    blacklist = [ metapkg ]
> +    blacklist = [ metapkg, "libopencv-ts" ]
>      metapkg_rdepends = [ ]
>      for pkg in packages[1:]:
>          if not pkg in blacklist and not pkg in metapkg_rdepends and not
> pkg.endswith('-dev') and not pkg.endswith('-dbg') and not
> pkg.endswith('-doc') and not pkg.endswith('-locale') and not
> pkg.endswith('-staticdev'):
> --
> 2.14.2
>
>

