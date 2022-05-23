Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF1CC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 15:12:35 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.28814.1653318745318881552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 08:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cV3FJKxg;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id p123so2841994qke.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nST6xYoZa9rOhxW1UxpE5dHOhOSKByfWQfHuceknu20=;
        b=cV3FJKxgZN7lWsT/LsB1+OY+ofqti0yrCxqYG3R8vnH38Y+71W6BqqEYJZohHoiD/a
         B6SfcE0sWJSyK5T+jx5EVc2pmIpxxg/Uln1sFhaqil8+V6MHW8WoOSmU3LQPNpULTtq+
         M/MSdNyg+8ye5Dv2mxtYbiiVvXhgRhUzP5v8LtF+pi2kff3wObjtqcmcgn08o7UBdm5K
         ux7JwEHP3P6l4tb9w8n84uQ7iB5gifr6EwKxHz+sNtqOpt1CFjKIP0+EMZMQP4XUhjt0
         xE8AfBhR+eOIYFv4Bp8rWnI+QZy/f9OLVLxWY6YodZaXj0/UvM3hIy1lmXOdsmyu3jnW
         4UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nST6xYoZa9rOhxW1UxpE5dHOhOSKByfWQfHuceknu20=;
        b=BScYatikhcai9lfylcBuVdl5fCejyoyVZdp+vifcHS9dBB9tIxuojhwfr4PnV+SPXt
         P/nKnISBbhHinGcYWP5WaskMaFdwlgXP1IUQ0iwD8v3KzKzXUEAgKyjC6/UzUT8qZ3kk
         xBwet9D1qTKmChbQr7gzeWdv0otPW99fqXsoUlsYa7hq/JdtwQlgF5YKpqP2+Cfx9EYs
         P72Zp0tMi/2QqS0NBjsfc7vzgKTqfCyugf0i032kBBpV51A7spP4k9Fw+Doh/b+DQPk7
         5rT4bcRBlWhT0+UJ3kONqcsuePxpb/OJsMHg2IlToBkkyco6TWQ3Q/Un4rA+vLS371QQ
         0dOA==
X-Gm-Message-State: AOAM531+S8yrZRSZZxX6OZ3f/aViphqmuk9l38JNwuwww6WXPJ8uKBM2
	Nlbmj7CvPm9nA7nvuq46JrMA+7Nfwv6CBV3y1LA=
X-Google-Smtp-Source: 
 ABdhPJyPYrvcQ1fTmX2KWNHU4thjoBA5uqTbiR4o0eUqqnWOuKGOZajnfkolLL+nJuw5BAZGjpJnsTmkpMRRqUFR620=
X-Received: by 2002:a05:620a:cc8:b0:6a3:9b4b:dde6 with SMTP id
 b8-20020a05620a0cc800b006a39b4bdde6mr2669140qkj.463.1653318744279; Mon, 23
 May 2022 08:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220522204207.2323510-1-uvv.mail@gmail.com>
In-Reply-To: <20220522204207.2323510-1-uvv.mail@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 May 2022 08:11:58 -0700
Message-ID: 
 <CAMKF1soVO4qeVF+24FxD-GTbC57Sk=u4=itXQyoT-vq2pRmc2A@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] overlayfs-tools: add new recipe
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 15:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97232

needs some patching on musl see
https://errors.yoctoproject.org/Errors/Details/657137/

On Sun, May 22, 2022 at 1:42 PM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> This package provides maintenance tools for OverlayFS, such as vacuum,
> diff, merge, and deref
>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>  ...-so-that-it-compiles-on-Ubuntu-20.04.patch | 41 +++++++++++++++++++
>  .../overlayfs/overlayfs-tools_git.bb          | 28 +++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/overlayfs/files/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
>  create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
>
> diff --git a/meta-filesystems/recipes-utils/overlayfs/files/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch b/meta-filesystems/recipes-utils/overlayfs/files/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
> new file mode 100644
> index 000000000..f7490ebce
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/overlayfs/files/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
> @@ -0,0 +1,41 @@
> +From 81b4fbb5f52044cb348534c23f10b3884972b09b Mon Sep 17 00:00:00 2001
> +From: Beat Schaer <beat.schaer@wabtec.com>
> +Date: Fri, 19 Mar 2021 08:18:58 +0100
> +Subject: [PATCH] Fixed includes so that it compiles on Ubuntu 20.04
> +
> +---
> + logic.c | 3 +--
> + main.c  | 3 ++-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/logic.c b/logic.c
> +index 97767f5..47ebfaa 100644
> +--- a/logic.c
> ++++ b/logic.c
> +@@ -7,8 +7,7 @@
> + #include <string.h>
> + #include <errno.h>
> + #include <unistd.h>
> +-#include <attr/xattr.h>
> +-#include <attr/attributes.h>
> ++#include <sys/xattr.h>
> + #include <fts.h>
> + #include <libgen.h>
> + #include "logic.h"
> +diff --git a/main.c b/main.c
> +index aa11239..f462b98 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -12,7 +12,8 @@
> + #include <linux/limits.h>
> + #include <stdbool.h>
> + #include <sys/stat.h>
> +-#include <attr/xattr.h>
> ++#include <sys/xattr.h>
> ++#include <errno.h>
> + #ifndef _SYS_STAT_H
> +   #include <linux/stat.h>
> + #endif
> +--
> +2.25.1
> +
> diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> new file mode 100644
> index 000000000..b0406fbae
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "Maintenance tools for OverlayFS"
> +HOMEPAGE = "https://github.com/kmxz/overlayfs-tools"
> +LICENSE = "WTFPL"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
> +
> +SRC_URI = "\
> +    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
> +    file://0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch \
> +"
> +
> +PV = "1.0+git${SRCPV}"
> +SRCREV = "291c7f4a3fb548d06c572700650c2e3bccb0cd27"
> +
> +S = "${WORKDIR}/git"
> +B = "${S}"
> +
> +DEPENDS += "attr"
> +EXTRA_OEMAKE += "'CC=${CC} -O2'"
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_compile () {
> +    oe_runmake
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/overlay ${D}${bindir}
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97220): https://lists.openembedded.org/g/openembedded-devel/message/97220
> Mute This Topic: https://lists.openembedded.org/mt/91275863/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

