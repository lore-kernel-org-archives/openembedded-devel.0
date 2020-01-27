Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 894677FD44;
	Mon, 27 Jan 2020 18:59:51 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s24so9732175iog.5;
	Mon, 27 Jan 2020 10:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KClFvlZCut5EDkyPSTIinq5isOAo2qgMQ/Ip9AAlQdc=;
	b=lNk6cEWeuNaAhfxYEjuDb75A72cZRE273oA40CjCjpNRQaPoE0y1ntR8ehgB2rkoGI
	yC4jajuFxFBsjY8pdHCruWHINfJ54li7z0FPu9dqnNfboVym2uBmke9fRp4s3/j2YwpQ
	3VY8yU/+ArtB8XTRKJzWPDgfxwLcPJ6E5BTzQZYtF3m/tJ95BCbGGeap1DfqJUMwEHtl
	aRB68RDTVac2mT6TI8yoqgcScvbKg1yK2OkE46ZynJp59cUlqzJ9L92Pws2YNWAHJpn6
	ysudownunmzjRPaYcbfCiCrXvWxb1xYc0QaPw111ASZwkfpVeiOuO8PMPBqM6kJW8eqe
	oxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KClFvlZCut5EDkyPSTIinq5isOAo2qgMQ/Ip9AAlQdc=;
	b=Uy3ZyOotsgC5uyVWG7+cK/cd1IWbN+M5YL4DUzvp7htFurtaCJpZaCWlJW1X8XXUM6
	rnqk5adYv2iq4cXYAHsV2FLUC13RAvUKFBP9acShIn85gKCbHO2+4UqnNMi8OhUyXU4d
	cbFQAC6HSx+h+gsh0OwQJ6YqEJsuGK/zVQFbiHjRP2PBKesBHnXEcy/J2XeeRGW8vru3
	sFTGdJNqX51xnLyNbTXyBVj+11HKmoYplhmTL1/U/WmMuE1JUI1eHsN5DLeb1m/Vd6B1
	YYbTmiQShPOcmPSz1Shd7/n/msHZ69xCasVrUEs+As4xqQ4zIrZAag9CWwlBsH5xXhhU
	FXog==
X-Gm-Message-State: APjAAAUjgQSD4a6kL+E5qBfyy+syFhi3pvxweexrSxoC2UTEMi8O73oz
	y8I9olNLm9wqY+cTfkUGMq/jwe2jt6+x6ZhmbmALdQ==
X-Google-Smtp-Source: APXvYqz7HOE9MZN67hQxUNWk+0Vc5I4+O5stVSF4F9oOBLvpXo/GK+sfYflmjqyRfBUzXSlZ+sNX1qdlK/XMCuAnCpE=
X-Received: by 2002:a6b:7b0d:: with SMTP id l13mr13205263iop.147.1580151592136;
	Mon, 27 Jan 2020 10:59:52 -0800 (PST)
MIME-Version: 1.0
References: <158014867798.8755.9822262787436785196@git.openembedded.org>
	<20200127181118.90572232CAA@git.openembedded.org>
In-Reply-To: <20200127181118.90572232CAA@git.openembedded.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 27 Jan 2020 19:59:40 +0100
Message-ID: <CALbNGRTW5YFAYAvL06gOY_s0M6XOLXRQvYRNB3F=sHa8PRp2fQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Andrey Zhizhikin <andrey.z@gmail.com>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 03/03: libhugetlbfs: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 18:59:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 7:11 PM <git@git.openembedded.org> wrote:
>
> This is an automated email from the git hooks/post-receive script.
>
> khem pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit 60fb9cfa741849f43e5f234dd5a95ec2d6cb5e48
> Author: Andrey Zhizhikin <andrey.z@gmail.com>
> AuthorDate: Mon Jan 27 17:36:08 2020 +0000
>
>     libhugetlbfs: update recipe to use python3
>
>     Update recipe to use python3 since python2 is EOL and has been dropped
>     from OE-Core.
>
>     Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...page_setup_helper-use-python3-interpreter.patch | 29 ++++++++++++++++++++++
>  .../libhugetlbfs/libhugetlbfs_git.bb               |  3 ++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch
> new file mode 100644
> index 0000000..e45f283
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch
> @@ -0,0 +1,29 @@
> +From b77c61de4d88d2c6e5d31f4f5a5877cc4c61272e Mon Sep 17 00:00:00 2001
> +From: Andrey Zhizhikin <andrey.z@gmail.com>
> +Date: Mon, 27 Jan 2020 17:27:55 +0000
> +Subject: [PATCH] huge_page_setup_helper: use python3 interpreter
> +
> +Setup helper script is already prepared to be used with python3, use the
> +interpreter explicitly. This removes dependency to python2 and will not
> +fail the QA check.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> +---
> + huge_page_setup_helper.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/huge_page_setup_helper.py b/huge_page_setup_helper.py
> +index a9ba2bf..7ba0c92 100755
> +--- a/huge_page_setup_helper.py
> ++++ b/huge_page_setup_helper.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python3
> +
> + #
> + # Tool to set up Linux large page support with minimal effort
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index f1a4efb..7f7f838 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>  DEPENDS = "sysfsutils"
> -RDEPENDS_${PN} += "bash python python-io python-lang python-subprocess python-resource"
> +RDEPENDS_${PN} += "bash python3 python3-core"
Minor nit: python3 package is empty and does not create any rdepends
so it can be removed.

Andreas
>  RDEPENDS_${PN}-tests += "bash python3-core"
>
>  PV = "2.22"
> @@ -25,6 +25,7 @@ SRC_URI = " \
>      file://0005-Include-dirent.h-for-ino_t.patch \
>      file://0006-include-limits.h-for-PATH_MAX.patch \
>      file://0001-tests-add-explicit-permissions-to-open-call.patch \
> +    file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
>  "
>
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

