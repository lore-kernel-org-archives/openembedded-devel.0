Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 751FA6B523
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 01:50:44 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id t60so257167wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2014 18:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=sS8ct3n5EyMJRsvk9hLJmTc//T04/stHsUG5vvrMx5Y=;
	b=o0zD1/YMyeyY82SGA+r+d1ESQ7MVtKmukWi9X3xZs+MmOR/vjbLxQbGh7IdfuTkvrx
	rWyJUsjtUZfPcKWEWhLZ/thgeKyiffNcHnogrCVGAIOC1QRbgVUgFaMZ23KLOwiShRGE
	VVdQIHOn4cq2wpV6ckyOgQQ9mU/350t9cXPpsUUNDB8bUxHBNLKGO21/lxwnUg6Lfyj5
	UGMlE6Qh6TN5H41bpE9kScbQsjOdW+z+vVJuw8x4TphA58Ql8lZhKfpx6MRAx92EH+Ni
	H8/YRYm/7e7F/1zfm3vtzJgurZBVGcMlWNMK7jfS6A00TjjoWB89AJYhyjgUliyaBfSe
	+VNw==
MIME-Version: 1.0
X-Received: by 10.194.192.132 with SMTP id hg4mr1014059wjc.28.1396921843727;
	Mon, 07 Apr 2014 18:50:43 -0700 (PDT)
Received: by 10.194.135.76 with HTTP; Mon, 7 Apr 2014 18:50:43 -0700 (PDT)
In-Reply-To: <1396410465-13709-2-git-send-email-stephen.arnold42@gmail.com>
References: <1396410465-13709-1-git-send-email-stephen.arnold42@gmail.com>
	<1396410465-13709-2-git-send-email-stephen.arnold42@gmail.com>
Date: Mon, 7 Apr 2014 18:50:43 -0700
Message-ID: <CAOLEWZXXS7LpYmmGk_Gfa6in+NuXC_6o5yctCLyAATPbAqHgSw@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2 2/2] gnuplot: added upstream license file and updated recipe to match
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
X-List-Received-Date: Tue, 08 Apr 2014 01:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

This is 2/2 as requested by Martin, et al.  Is there pending feedback, or
did I miss an email?

Thanks, Steve


On Tue, Apr 1, 2014 at 8:47 PM, Stephen Arnold
<stephen.arnold42@gmail.com>wrote:

> This fixes QA warnings about missing license file and updates the license
> type to match custom license file.
>
> Upstream-Status: Inappropriate (distribution/packaging fix)
>
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> ---
>  meta-oe/licenses/gnuplot                     | 29
> ++++++++++++++++++++++++++++
>  meta-oe/recipes-extended/gnuplot/gnuplot.inc |  2 +-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/licenses/gnuplot
>
> diff --git a/meta-oe/licenses/gnuplot b/meta-oe/licenses/gnuplot
> new file mode 100644
> index 0000000..ff6fe23
> --- /dev/null
> +++ b/meta-oe/licenses/gnuplot
> @@ -0,0 +1,29 @@
> +/*[
> + * Copyright 1986 - 1993, 1998, 2004   Thomas Williams, Colin Kelley
> + *
> + * Permission to use, copy, and distribute this software and its
> + * documentation for any purpose with or without fee is hereby granted,
> + * provided that the above copyright notice appear in all copies and
> + * that both that copyright notice and this permission notice appear
> + * in supporting documentation.
> + *
> + * Permission to modify the software is granted, but not the right to
> + * distribute the complete modified source code.  Modifications are to
> + * be distributed as patches to the released version.  Permission to
> + * distribute binaries produced by compiling modified sources is granted,
> + * provided you
> + *   1. distribute the corresponding source modifications from the
> + *    released version in the form of a patch file along with the
> binaries,
> + *   2. add special version identification to distinguish your version
> + *    in addition to the base release version number,
> + *   3. provide your name and address as the primary contact for the
> + *    support of your modified version, and
> + *   4. retain our contact information in regard to use of the base
> + *    software.
> + * Permission to distribute the released version of the source code along
> + * with corresponding source modifications in the form of a patch file is
> + * granted with same provisions 2 through 4 for binary distributions.
> + *
> + * This software is provided "as is" without express or implied warranty
> + * to the extent permitted by applicable law.
> +]*/
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> index ab3ec3f..6c27e6d 100644
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Gnuplot is a portable command-line driven
> interactive datafile \
>  (text or binary) and function plotting utility."
>  HOMEPAGE = "http://www.gnuplot.info/"
>  SECTION = "console/scientific"
> -LICENSE = "BSD-4"
> +LICENSE = "gnuplot"
>  LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
>  DEPENDS = "virtual/libx11 gd readline"
>
> --
> 1.9.1
>
>

