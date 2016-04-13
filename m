Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DDEDD6018C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 03:00:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a140so10122409wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 20:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=MUWcB6qvkswMVOJSESj9KRyoAI/3lM3HQ9DBB/0Tn3s=;
	b=txYii5X7W26I4+kHcWNdtCkIGCJXZId9G6vsvNkzI65k7zx1dgjtyQ/jpq/tGzAtBX
	coxqkzIKSr4sdtVBiJx9i4znzIBT1TOAopJ8FlpaA3RuwWpcmPU2UJnPgyCGOrfEBmbV
	yvxspAjLZH42LQsLdE072I7B7g/yOsP81aAYBIYVmj038qNCPv5JQ+j9bdjNAbSuGwNd
	/w2dPpUiXMOkMy2DiYROsc53iayZSTe9o3oAJ0F42eVOkTK3Dl6NwQiAlNJDUP9+CWxG
	HJSpf9JqlrqzvhKhxjk+NE1at3yGbRLhBqz2zLYvTh/JabSJpxg9/7j+caaZl1UslJ3y
	4IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=MUWcB6qvkswMVOJSESj9KRyoAI/3lM3HQ9DBB/0Tn3s=;
	b=AFL+MohTlUHiKgI06lz6+Em6MwbRK7FFOcAcHVdimn0Fzcr6IWeX/y+LITdxr3BpM7
	kQsJ3vw5MpKxehnN74S34lKesLjLPT0qvJLCuxHFrKWgIOqZ/+fHqo1PQn8V6Pt4LSJg
	woSAxer/n0EcppO+CpIwK74+J3f43OUEAyXrZJBgDv+RPAuYMvR3EFApzG3r5PffuJga
	GV58pCV+o4Y1xgds86zF2Jjuq5+GCNDRVhaReIf5EVON/vqF8tmPQT7WPZFF5stViMWz
	Zvty3458JZ096BjFgGVojljWKHNTBQrpPYSEgKw3uAKCjgqKlgMHEIvfJ0/uM41ssI/X
	OJOA==
X-Gm-Message-State: AOPr4FUuX/BZ+pRpBebcacv8nbe2lnxefEpvbL9pV1DylSlIdXT5RnAReoWh2KK+UaTYxzRFY9Ck9xHkFMmM0w==
MIME-Version: 1.0
X-Received: by 10.194.57.168 with SMTP id j8mr6960099wjq.43.1460516436153;
	Tue, 12 Apr 2016 20:00:36 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Tue, 12 Apr 2016 20:00:36 -0700 (PDT)
In-Reply-To: <1460511460-26976-1-git-send-email-akuster808@gmail.com>
References: <1460511460-26976-1-git-send-email-akuster808@gmail.com>
Date: Tue, 12 Apr 2016 20:00:36 -0700
Message-ID: <CAJ86T=W9mv5hZZV0xNmt0Fz+HvES5nxMzc0wfgM_ESsBS8NXFA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] c-ares: Add package to networking
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
X-List-Received-Date: Wed, 13 Apr 2016 03:00:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 12, 2016 at 6:37 PM, Armin Kuster <akuster808@gmail.com> wrote:
> this package is in 5 other layers.
>
> Move to a more common location and update version.

At least one version of c-ares fails to build with security_flags.inc
enabled (configure complains if any -Dxxx option is passed via
CPPFLAGS and security_flags.inc uses CPPFLAGS to pass
-D_FORTIFY_SOURCE).

If c-ares 1.11.0 still has the problem, then this patch from curl should fix it:

  https://github.com/curl/curl/commit/5d3cbde72ece7d83c280492957a26e26ab4e5cca

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
>
> diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
> new file mode 100644
> index 0000000..2f72ab4
> --- /dev/null
> +++ b/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
> @@ -0,0 +1,13 @@
> +# Copyright (c) 2012-2014 LG Electronics, Inc.
> +
> +DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
> +HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://ares_init.c;beginline=1;endline=3;md5=53f5ecf4c22c37cf1ddd1ef8f8eccce0"
> +
> +SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz"
> +SRC_URI[md5sum] = "d5c6d522cfc54bb6f215a0b7912d46be"
> +SRC_URI[sha256sum] = "b3612e6617d9682928a1d50c1040de4db6519f977f0b25d40cf1b632900b3efd"
> +
> +inherit autotools pkgconfig
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

