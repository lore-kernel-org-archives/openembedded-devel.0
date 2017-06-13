Return-Path: <gizero@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6E70478249
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 05:00:43 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id k145so54767409oih.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 22:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n8NxLFDlOCh3wgmYsi41EoA4SymUfMB/SJVKrY4OzbY=;
	b=MStOiKRaDX6LjtZ20fM+L1gM5KOnuJ05XrRv4cuwevu+9uhkQcEArvHPs9BYzfb5AR
	TJbn6G21mrnL5NXNfUUoUh3mITkipomvXVPV7lechJ4RZpsQUOIpW00htvPOfGYpZojR
	eCV/VBMJIOn6mHVRKViAY/BcrEK5alF1o72YJkF02RZW61c6oqHMPW5ZXp9cx/AKJBtu
	Hh0epMaz1XLumJK+AwHAs9IXH7S6xYWgdKXVkpdFTzie3pVrENErjTKSXiQL3s+AxXot
	//X2n89KbcbwyRMLP/TgX6t+guKR4I+89icMbGLWM1rH873pnvMvtdKKj4eg7/IPexFE
	yrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n8NxLFDlOCh3wgmYsi41EoA4SymUfMB/SJVKrY4OzbY=;
	b=fmrXT2c22JCgkMloXPOJA8dbD+sWGmbKJs/1XS1liqFhkEyizHlxAc1v8wGcPJiVEm
	pDH4siNPflwdg56XCE4EM3QTmH2/6IM0w26D313BsVZZ3kOAMMvodjiKr9luiITUhoVH
	PQJnIGOZAX50azYYNtHTUbl0GFiLv/GD01L0QSqh5hH8YKSRh9ivtVf5hSWzhGzD1VZf
	MVl4LD7EDeF3M8lwNy4rlO7XBiF2gXEuPWER3jvg+3dz5wbRxAKRpECoEoriqqYZXz2z
	DRCuOOA8MU+47uu+x0mpdbdjS0Nw2RqFIUEvH0DvLHut1uXkUvgidRj+GUb+RBv4kbrX
	GYQg==
X-Gm-Message-State: AODbwcCFE118zG9OC2uIAxbStIl77tn0KdxblR5ZUd8ScSdzWThVj6+C
	jYpS8tsfjg0gn0LUldt6qt3mV9QbsQ==
X-Received: by 10.202.104.212 with SMTP id o81mr21681573oik.69.1497330044764; 
	Mon, 12 Jun 2017 22:00:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.9.233 with HTTP; Mon, 12 Jun 2017 22:00:44 -0700 (PDT)
In-Reply-To: <1497292610-29445-1-git-send-email-maryan.pricak@gmail.com>
References: <1497292610-29445-1-git-send-email-maryan.pricak@gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Tue, 13 Jun 2017 07:00:44 +0200
Message-ID: <CAC+thW1XcZzSnTiVPvK3UXLwTGCKHf0Z11v0QNO1SGWmFZeaAA@mail.gmail.com>
To: Marian Pritsak <maryan.pricak@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hiredis: Add recipe
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
X-List-Received-Date: Tue, 13 Jun 2017 05:00:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 12, 2017 at 8:36 PM, Marian Pritsak <maryan.pricak@gmail.com>
wrote:

> Hiredis is a C client library for Redis database.
> Hiredis does not use autotools, but plane Makefile instead,
> so few changes had to be made, including removing hard coded
> compiler, setting INSTALL to 'cp -r' to to avoid host user
> comtamination QA issue, and setting PREFIX to ${prefix} instead of
> default /usr/local.
>
> Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
> ---
>  .../0001-Makefile-remove-hardcoding-of-CC.patch    | 32
> ++++++++++++++++++++++
>  meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb | 21 ++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/hiredis/files/0001-Makefile-
> remove-hardcoding-of-CC.patch
>  create mode 100644 meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
>
> diff --git a/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
> b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-
> remove-hardcoding-of-CC.patch
> new file mode 100644
> index 0000000..fef2bc7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-
> remove-hardcoding-of-CC.patch
> @@ -0,0 +1,32 @@
> +From d13b918a3ff8b0ebfd1e7b18b198b4b45841d720 Mon Sep 17 00:00:00 2001
> +From: Andrea Galbusera <gizero@gmail.com>
> +Date: Fri, 31 Jul 2015 16:42:08 +0200
> +Subject: [PATCH] Makefile: remove hardcoding of CC
> +
> +* upgrade previous patch to avoid wiping CFLAGS. This fixes build on arm
> +platforms which previously caused and issue due to -fPIC being lost
> +
> +Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> +---
> + Makefile | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 8b0f0c2..66a4317 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -34,11 +34,6 @@ define REDIS_TEST_CONFIG
> + endef
> + export REDIS_TEST_CONFIG
> +
> +-# Fallback to gcc when $CC is not in $PATH.
> +-CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) ||
> echo gcc')
> +-OPTIMIZATION?=-O3
> +-WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
> +-DEBUG?= -g -ggdb
> + REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) $(ARCH)
> + REAL_LDFLAGS=$(LDFLAGS) $(ARCH)
> +
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
> b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
> new file mode 100644
> index 0000000..96b86f9
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Minimalistic C client library for Redis"
> +HOMEPAGE = "http://github.com/redis/hiredis"
> +LICENSE = "BSD-3-Clause"
> +SECTION = "libs"
> +DEPENDS = "redis"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
> +SRC_URI = "git://github.com/redis/hiredis;protocol=git;rev=
> f58dd249d6ed47a7e835463c3b04722972281dbb \
> +           file://0001-Makefile-remove-hardcoding-of-CC.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +# By default INSTALL variable in Makefile is equal to 'cp -a', which
> preserves
> +# ownership and causes host-user-contamination QA issue.
> +# And PREFIX defaults to /usr/local.
> +do_install_prepend() {
> +  export PREFIX=${prefix}
> +  export INSTALL='cp -r'
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

A recipe for hiredis is already available from at least two other meta
layers as per [1], one of which does provide the same version as yours.
Don't know what the policy is here, but to me it seems worth a try talking
to those layers' maintainers and see if they agree to move the recipe to
meta-oe (at least meta-intel-iot-middleware is already listing meta-oe as a
dependency): it would help reducing the maintenance effort in the future.

[1]
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=hiredis

