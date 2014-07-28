Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D93326FECD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 20:03:04 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so7235949iec.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 13:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=IvVpodQh9y3OIiPicMk/5UOsMSIRyrVwHz3yEc6pOXg=;
	b=jd5nVz5+akwrGqkHWH9cLAbwVg5WxgM+7Frxdde5aasYfhPu7CL4kd411RFTshhEhY
	FVCmCJp1kQTdIZxN/6nnnOPjzye0sW8hGqyaG+h680BxepkzVY8BVxeeyAIesLwjF7tl
	8DPf1QrOk9T9J/VwZhOSPDCmcv1k9yBmRw3rdgqwWPPicXcWc9p8bkjMoly6s+l6l+/e
	zr5ZPLeckYgerL4qXj2PkV6xcI1FM+oOwCU0j6MgnHvDvwhjGYbRC6kznHk5rlImKYgL
	+D0Tfx4v7Rf/6LDGwP+1BhlM3c+0I9E/giUoC5xEqNlLTsDY6ro7IO84sGFw2MUkteSu
	DrKw==
X-Received: by 10.51.17.2 with SMTP id ga2mr28562545igd.2.1406577786180; Mon,
	28 Jul 2014 13:03:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Mon, 28 Jul 2014 13:02:36 -0700 (PDT)
In-Reply-To: <1406575596-15006-3-git-send-email-ben.shelton@ni.com>
References: <1406575596-15006-1-git-send-email-ben.shelton@ni.com>
	<1406575596-15006-3-git-send-email-ben.shelton@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2014 13:02:36 -0700
Message-ID: <CAMKF1srMsLU11_YQVdXksRmmQAT2Hw6TzNoNgmT8=5Weyn+tfw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] xorg-fonts-misc: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jul 2014 20:03:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 28, 2014 at 12:26 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> Adding a packagegroup recipe to build both the misc-misc and cursor-misc
> X.org fonts.
>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb
>
> diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb
> new file mode 100644
> index 0000000..b2d1db7
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb

For packagegroups the naming convention is to have packagegroup
somewhere in name and probably put it under recipes-core/packagegroups

> @@ -0,0 +1,11 @@
> +SUMMARY = "X.org misc font set"
> +LICENSE = "PD"
> +
> +inherit packagegroup
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +RDEPENDS_${PN} = "\
> +       font-cursor-misc \
> +       font-misc-misc \
> +"
> --
> 2.0.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

