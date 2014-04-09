Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id BE2D265DF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 08:10:47 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id as1so2114455iec.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 01:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=kW7KM/HQw3J/2pKAxwQbnhEkldduttntBWHqeOeraLI=;
	b=PhJRB9CQLhWlvz0X/DXDwj02Li4lrOHMPg/P9bJl9CAfLWreCsndLEfwTwWXD6PRu9
	oKF3DLXhVZB4oUgFI+ek4SaaPZHxxNm/O1aIhZTLtH6KHTE8YfjNX+ihD+mBJSoSxh1a
	N0cwJ5Kdvo/dNrjrgzvIBpeGtir+aI3zJ2IEShiL/OhO5D1oNqvZYRrz1Lcsh2YcDEgY
	jxw09UmHFUhSnv5X3kCPd99qiRJ986KmR57ABPGGZRdFrHJX/AxCVxWB1YLEbbvsmtod
	eGxc67r77qJ9BUWjvb4EWcRxPB6c4OGppdXVoYBb7QZismXnjcr68BgBNfDzIeAvF8N5
	2Lnw==
MIME-Version: 1.0
X-Received: by 10.50.143.76 with SMTP id sc12mr3451377igb.2.1397031048128;
	Wed, 09 Apr 2014 01:10:48 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 9 Apr 2014 01:10:48 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 9 Apr 2014 01:10:48 -0700 (PDT)
In-Reply-To: <1397029826-16492-1-git-send-email-jackie.huang@windriver.com>
References: <1397029826-16492-1-git-send-email-jackie.huang@windriver.com>
Date: Wed, 9 Apr 2014 01:10:48 -0700
Message-ID: <CAMKF1srqj5tu9ZJP8oL0HvBtqq8UL7P3frcHNgoWsLpDp5BMZg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] fbset: fix parallel build
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
X-List-Received-Date: Wed, 09 Apr 2014 08:10:49 -0000
Content-Type: text/plain; charset=UTF-8

On Apr 8, 2014 9:50 PM, <jackie.huang@windriver.com> wrote:
>
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Fix an incorrect dependency in makefile so that we can build
> in parallel.

this is a good patch thanks. i expect more and more such patches where we
could enable parallel make.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../fbset-2.1/fbset-2.1-fix-makefile-dep.patch     |   31
++++++++++++++++++++
>  meta-oe/recipes-support/fbset/fbset_2.1.bb         |    6 ++--
>  2 files changed, 34 insertions(+), 3 deletions(-)
>  create mode 100644
meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefile-dep.patch
>
> diff --git
a/meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefile-dep.patch
b/meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefile-dep.patch
> new file mode 100644
> index 0000000..41ab8af
> --- /dev/null
> +++
b/meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefile-dep.patch
> @@ -0,0 +1,31 @@
> +From 3db6782de1de7ca4f1bb9ee7652c4f2808e57539 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Thu, 10 Jan 2013 12:24:33 +0800
> +Subject: [PATCH] fbset 2.1 fix makefile dep modes.tab.c
> +
> +Upstream-Status: Inappropriate [no upstream]
> +
> +fix the error in parallel build:
> +make: *** No rule to make target `modes.tab.h', needed by `lex.yy.o'.
 Stop.
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + Makefile |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 61536c1..09183e5 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -15,7 +15,7 @@ fbset:               fbset.o modes.tab.o lex.yy.o
> +
> + fbset.o:      fbset.c fbset.h fb.h
> + modes.tab.o:  modes.tab.c fbset.h fb.h
> +-lex.yy.o:     lex.yy.c fbset.h modes.tab.h
> ++lex.yy.o:     lex.yy.c fbset.h modes.tab.c
> +
> + lex.yy.c:     modes.l
> +               $(FLEX) modes.l
> +--
> +1.7.4.1
> +
> diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bbb/meta-oe/recipes-support/fbset/
fbset_2.1.bb
> index aa78008..84f35ff 100644
> --- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
> +++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
> @@ -14,12 +14,12 @@ DEPENDS = "bison-native"
>  PR = "r4"
>
>  SRC_URI = "
http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.orig.tar.gz \
> -           file://makefile.patch"
> +           file://makefile.patch \
> +           file://fbset-2.1-fix-makefile-dep.patch \
> +"
>
>  inherit autotools update-alternatives
>
> -PARALLEL_MAKE = ""
> -
>  do_install() {
>      install -d ${D}${sbindir} ${D}${datadir}/man/man8
${D}${datadir}/man/man5
>      install -m 0755 ${WORKDIR}/${P}/fbset ${D}${sbindir}/fbset.real
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

