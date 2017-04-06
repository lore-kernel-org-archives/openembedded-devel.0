Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E731F7760E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 08:19:21 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g19so9032134wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nfulpxWPzRfw1dXy1rCF2iCBN1OKKRqWOO9gR9GUNGg=;
	b=k3GUhMtk72j1G1G+P6mPOGXCyBi/av5OK+QHxqI/Cj+C2OTuOtugpi3uTU0PdO/JbB
	IhlMmxDrLjpqySUUJNxglnjuQoM93J87DFY5m9TV1sVspCXQO5Jab5AotqhMeea1/MYz
	TMs5LTwEd8SCRFRWjM1CiTwsJiLiQuMHQrUNjhKUgv5nS5MQ6VaIjcTWsSfCU/CHu6dy
	vW6XTDxEhHnBiZktKdfE0Kv4VCn7myYApfjGM8VFMZTgqJlPc+hz/6NS/0p4qegfU0yU
	7aXVEVU6NBjzvlPT7UH7wfODZ4NMa2l1iE8L/HLNG1y68B3znlwoDtxt9RF5q8DrrGZw
	rbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nfulpxWPzRfw1dXy1rCF2iCBN1OKKRqWOO9gR9GUNGg=;
	b=LKzLgMuykkBdBhz6qofktVLPq9qp+oMKw8RJSoRuD+7PPQ6TuHBmGvHWBJU+93BXCd
	GRBCuA8dIxHq6WWapCBhL+vdwmYgH36d9zlFEHIGovUF9NvRXLwJm41kG+rYgkNMMYLY
	49Y9h9PK1tqgFexr4BkzaTxGbg5ert+fybWmh9QFgCW4cWD9GDYZdov+kd+kUACFvfBu
	rZQzEMylbYivaInfp1QlISXfw67an2pac364QDWho21NXi+XicAIK8fWlEBeVtSvzbci
	0w2ocMFb+4j857iAI5hNEhJ4UCzN88ZGo45PP/NkTf+kBwzhFQ2bmLTT8h+w68rPiecP
	ex8Q==
X-Gm-Message-State: AN3rC/6P5b8c1h3yCJKTgXNPAh+mbeYQu2WOINCyKSFNkDfcVk2mJZCL+hkB/iBfbtDpGoW2XFH+cuI7Vzrt9A==
X-Received: by 10.223.136.165 with SMTP id f34mr4765819wrf.145.1491466762554; 
	Thu, 06 Apr 2017 01:19:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 01:19:21 -0700 (PDT)
In-Reply-To: <20170406081336.20321-2-jonathan.yong@intel.com>
References: <20170406081336.20321-1-jonathan.yong@intel.com>
	<20170406081336.20321-2-jonathan.yong@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Apr 2017 10:19:21 +0200
Message-ID: <CA+chaQcbXppZu59Bbjfx_ki7jhq1K4n6V3XVFpOp6UuEU1qbhg@mail.gmail.com>
To: "Yong, Jonathan" <jonathan.yong@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] f2fs-tools: Update to Version 1.8.0
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
X-List-Received-Date: Thu, 06 Apr 2017 08:19:22 -0000
Content-Type: text/plain; charset=UTF-8

> mkfs patch is already upstreamed.

Then say this in Upstream-Status: field inside the .patch file.

On Thu, Apr 6, 2017 at 10:13 AM, Yong, Jonathan <jonathan.yong@intel.com>
wrote:

> mkfs patch is already upstreamed.
> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> ---
>  .../0002-Fix-mkfs-out-of-tree-builds.patch         | 28
> ++++++++++++++++++++++
>  .../{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb}   |  5 ++--
>  2 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/
> 0002-Fix-mkfs-out-of-tree-builds.patch
>  rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.4.0.bb =>
> f2fs-tools_1.8.0.bb} (81%)
>
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/
> 0002-Fix-mkfs-out-of-tree-builds.patch b/meta-filesystems/recipes-
> utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
> new file mode 100644
> index 0000000..39453f3
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/
> 0002-Fix-mkfs-out-of-tree-builds.patch
> @@ -0,0 +1,28 @@
> +From 0731eefd389e01419f78a115e1363ed0c28cfd3a Mon Sep 17 00:00:00 2001
> +From: "Yong, Jonathan" <jonathan.yong@intel.com>
> +Date: Thu, 30 Mar 2017 08:03:37 +0000
> +Subject: [PATCH] Fix mkfs out of tree builds
> +
> +Libraries are built in builddir, not srcdir, fix Makefile.am
> +accordingly.
> +
> +Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> +Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> +---
> + mkfs/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
> +index 162a0cf..0ea8b49 100644
> +--- a/mkfs/Makefile.am
> ++++ b/mkfs/Makefile.am
> +@@ -10,5 +10,5 @@ lib_LTLIBRARIES = libf2fs_format.la
> + libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c
> f2fs_format_utils.c
> + libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
> + libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
> +-libf2fs_format_la_LDFLAGS = -luuid -L$(top_srcdir)/lib -lf2fs \
> ++libf2fs_format_la_LDFLAGS = -luuid -L$(top_builddir)/lib -lf2fs \
> +       -version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
> +--
> +2.10.2
> +
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
> b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
> similarity index 81%
> rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
> rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
> index 1a558e7..691cb6e 100644
> --- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
> @@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 362b4b2594cd362b874a97718faa51d3"
>  # to provide libuuid
>  DEPENDS = "util-linux"
>
> -SRCREV = "baac4b4e6f41ceb02511da49dd3707674f3fea21"
> +SRCREV = "1e7aedf99b85d16f94d1d8ad2fcf846403bb2174"
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-
> tools.git \
> -    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch"
> +    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch \
> +    file://0002-Fix-mkfs-out-of-tree-builds.patch"
>  S = "${WORKDIR}/git"
>
>  inherit pkgconfig autotools
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

