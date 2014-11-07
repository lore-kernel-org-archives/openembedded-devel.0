Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id B7B0360557
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 01:36:50 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id r20so3080331wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Nov 2014 17:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=T2GWhMvoM8PUVF93cWo8jk7EDsFAp/pPro1SGDRVeRs=;
	b=SJOTWO8C0MGcPcckJihQP7gRsnMywJnXGNbD0Fk3bWZQ/WJOnbIcnjDuqVccrZuFIP
	YZFQ4edLBWxuJFZBzLXC0wdl51QBuaJPmDqNGYZU5QTkRU0Vw3hcOYDSTb261cb3vFCC
	y0DLJjtyyWADtQ62vEag8IBSHB4ITKSKxSvQgV4BwYThvs7uhh9nM6a40SgyXeYF7vWd
	xSS8uc4QgvypD8TRAawOU9Zw5S5ZUzVBZoPgWMEwXlYJ04gRhmTu8+xlTWl+tH0uvPvc
	fXggT1uhFrUSNN5+G11Pga3w50Hj+ydk5k3nOMJXpC5aQ2xscO9K7UD6y1ea+gS8gb44
	/9RA==
X-Gm-Message-State: ALoCoQmuykIgIEUUKJFw3PR0s1Ky6ySwd8rPKsXYqt5exYCObo5+/MU8wwZaNUZnoMifqMHPCPFH
MIME-Version: 1.0
X-Received: by 10.180.84.167 with SMTP id a7mr222175wiz.39.1415324210469; Thu,
	06 Nov 2014 17:36:50 -0800 (PST)
Received: by 10.216.180.73 with HTTP; Thu, 6 Nov 2014 17:36:50 -0800 (PST)
In-Reply-To: <1415301783-5342-2-git-send-email-gary.robertson@linaro.org>
References: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
	<1415301783-5342-2-git-send-email-gary.robertson@linaro.org>
Date: Thu, 6 Nov 2014 19:36:50 -0600
Message-ID: <CAF7YWnwmFx4aWUWCckOX+JkQJWcYLhHzhAE7qtcUr_rAS__2mg@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/3] libhugetlbfs: Add i*86 to list of compatible host architectures
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
X-List-Received-Date: Fri, 07 Nov 2014 01:36:52 -0000
Content-Type: text/plain; charset=UTF-8

Well, nothing ever happens as expected... please ignore this patch for now.
It looks as though the libhugetlbfs project may accept the other patches
immediately and we may be better served by updating the base version of
libhugetlbfs used in the recipe, rather than adding all these patches.

On Thu, Nov 6, 2014 at 1:23 PM, Gary S. Robertson <gary.robertson@linaro.org
> wrote:

> From: "Gary S. Robertson" <gary.robertson@linaro.org>
>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index c2262ea..737acb9 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -23,7 +23,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
>
>  S = "${WORKDIR}/git"
>
> -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> +COMPATIBLE_HOST =
> "(i386|i486|i586|i686|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
>
>  LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
>  LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
> --
> 1.7.9.5
>
>

