Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4A84C74CE8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 18:12:15 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id n6-v6so3368094qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Aug 2018 11:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LD0NsmulkinjkamyxEUo02/iAeczaRLcbWLdfkdhqUk=;
	b=qLiuluEy0+BcUxuHLQs4maPI1a7qzbNhfmD1s7VpebIWtTim79fZYC9O8FKr9o2PcI
	mlYHhJcsQMVGvIpEn2lkHQOpe4Q//zdy4XoFcaxkWzgtPReU5kLGobh9+qa6xy2SgHt/
	qIG8lkAhAJb/DLq1xE5uI1fWUrsvmvCkhZNYNLkAXcVX/WdR1jmQ0eCxgNzgAlc5jjKW
	oE0p5hLU0AcV08IaqVZZLu/AtJYB2AT29izup0ivSO1Ph8StdhRTRDHzHPo7LS3ftT+k
	AYhyLvZLrvvtIfrMoN025qTm3vTmJqu3gOT2IcsftPbkPHwuBqOYTWXHWh+B/e7htOWQ
	SvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LD0NsmulkinjkamyxEUo02/iAeczaRLcbWLdfkdhqUk=;
	b=TV77ovig3ZnHZUu9Dqvm87mxgv/Lu6P7fRjIarB49i5WM8aZdhZPxunfVfyvOJRM8N
	jIXrf8XeNr1j/bE9RcMwp/BrYnikwo1+rM7qd/If5T8g0RqFq+ulnO7BNssau3MyLBtk
	nFnfsikbNggBg9B8YKnRbu9b7mshc4P07i7oZlJO32VdG/lqJBVIzt4dPefbsNCQGrDX
	QhWT6iutIlyxv8LPTNzhXM8ABuhkbiTxQlOzTfLuscYRFEs4tQFxSUtO5Msc3Tcs4F8q
	fC3mHWjtmlkhXEYn1bhFG0xmfC2ishAcPKS7AkQMVx91Amw7YC4AvWuXs3oIMkVPPyjz
	RujQ==
X-Gm-Message-State: AOUpUlEhhIEKYeLAq9bY6+T1RVeaPyfDhJNpPQf7JfXg6CC4UOcMapH3
	geF4AFSeH+Iz9mlOirXP2whFRVeylPxCmBop1pup4Psf
X-Google-Smtp-Source: AAOMgpdtRLCf3zztZWlTupHkRJa2KUx/FKROVMxPfRkwsSxVkCNrgf4ZaIo2NK/nDy4nBLrh5LeGYTAaLkS80t4evl4=
X-Received: by 2002:ac8:70c5:: with SMTP id g5-v6mr586744qtp.376.1533233535883;
	Thu, 02 Aug 2018 11:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180731030937.3685-1-robert.joslyn@redrectangle.org>
	<20180731030937.3685-5-robert.joslyn@redrectangle.org>
In-Reply-To: <20180731030937.3685-5-robert.joslyn@redrectangle.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 11:11:49 -0700
Message-ID: <CAMKF1srNOQX4hDPYSr3=nMPdk8dM3o8Z3GToudKbCkd4O8tOgw@mail.gmail.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 4/5] python-parse-type: Add Python 3 recipe
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
X-List-Received-Date: Thu, 02 Aug 2018 18:12:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 30, 2018 at 8:11 PM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
> Clarify license from BSD to BSD-3-Clause.
> ---
>  meta-python/recipes-devtools/python/python-parse-type.inc   | 12 ++++++++++++
>  .../recipes-devtools/python/python-parse-type_0.4.2.bb      | 13 ++-----------
>  .../recipes-devtools/python/python3-parse-type_0.4.2.bb     |  2 ++
>  3 files changed, 16 insertions(+), 11 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-parse-type.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-parse-type.inc b/meta-python/recipes-devtools/python/python-parse-type.inc
> new file mode 100644
> index 000000000..4549ec98b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-parse-type.inc
> @@ -0,0 +1,12 @@
> +SUMMARY = "Simplifies building parse types based on the parse module"
> +HOMEPAGE = "https://github.com/jenisys/parse_type"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
> +
> +SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
> +SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
> +
> +PYPI_PACKAGE = "parse_type"
> +inherit pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-parse"

there is no recipe for python3-parse but this does mean that
python3-parse-type will rdep on it and fail the dep check like below

ERROR: Nothing RPROVIDES 'python3-parse' (but
/mnt/a/oe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-parse' is unbuildable, removing...

> diff --git a/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
> index b516c5912..8e10e801c 100644
> --- a/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
> @@ -1,11 +1,2 @@
> -SUMMARY = "Simplifies building parse types based on the parse module"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
> -PYPI_PACKAGE = "parse_type"
> -
> -SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
> -SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
> -
> -RDEPENDS_${PN} += "python-parse"
> -
> -inherit pypi setuptools
> +inherit setuptools
> +require python-parse-type.inc
> diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
> new file mode 100644
> index 000000000..91d9ce2d4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-parse-type.inc
> --
> 2.16.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

