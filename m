Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCAFC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:38:30 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.11599.1647963510032694323
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 08:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nSmLYl0T;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id kj22so3499326qvb.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5CqPhlLYe3stjujUf+Q0ZWl1wfst8xVa6rnFyETYIg=;
        b=nSmLYl0T2tNTn1j/Z8C+DcnidrFDSS5n+7PNaq1w93w2LIsb1p85UbuKOvQH8kjbn3
         s4yWgzH5NEvOOAut3rqyvqvWUD7c7sKKEcvUpOPdFioiuWoID4k32ROw3ai7o549YC9U
         IZ58Y6sxWSmKAKpBSspuD+dxDpSin4Xwgd/3Ox19Mjwu6Sdz/v8yD2El32RJ5ot0IEE1
         LP6F1k+ELIsP9WqEQPskL5VzgwVtmipUXXAurJ8e0UImWk4QYCwC/wmBdA/Me1M4Nrq1
         WnHV8/1uTVgl3+CY8jJKNOSsfkT9NLOJPBM2FEpToSwNIsTdUXgLQvTLE0lk+elqlhvk
         SSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5CqPhlLYe3stjujUf+Q0ZWl1wfst8xVa6rnFyETYIg=;
        b=7tQKKD7oIkZ4+f10J8M+iQmPa99gbi3PY3SBkFrvipYzZqMPFJdp51KuZbpZL96y+q
         Qaw+GMa09IRF8pmciboXspjNn+r6/AbutUAib8CxL+Mf8TiKs0cMMpsNS4BUKECGNNAy
         1+YCRPgXzW61Q1a7xrXtb/gcdDj1ZQX93Cy5KRuRW+SxYHn27IXxTHDYq9FzAQs6T1l+
         XC+iJLKyEFiadrD3nXGyLkybGh5QelEDPsC0KhOdJBaa+PW1Bs+taPoWbyK/WsaXJ5uD
         5DOOV3RxB8dP1SastSa/pZNAJwmbFrfPpvDAYyEPy46E+O6qAnqoS88ALA5+tuGTzq/g
         zX5Q==
X-Gm-Message-State: AOAM532+3+jzgiaw1lEWGUmzcVmEHT90y4IkQj1d276NT5Y1ZisBas0d
	IVz2lJxpQtLRrB+c8b0Agl8b6Kttvw5T8WG/8NwWgzqVHpXoHw==
X-Google-Smtp-Source: 
 ABdhPJyoGYzlBiGFNgJsw7XsnXAQxnitqcOo6+m3dlRF/o6/HiwDRA2k2NYwZDZjlR0mAZSgp/yrvrYHxCiswQj+8b0=
X-Received: by 2002:a05:6214:4017:b0:441:35e:fcbd with SMTP id
 kd23-20020a056214401700b00441035efcbdmr14249868qvb.110.1647963508809; Tue, 22
 Mar 2022 08:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220322150010.32030-1-trevor.gamblin@windriver.com>
In-Reply-To: <20220322150010.32030-1-trevor.gamblin@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Mar 2022 08:38:02 -0700
Message-ID: 
 <CAMKF1srgf2hhxLMV0jcg+hQc4uypWf5fyGAxJSFzFcR=aEOAtw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] nftables: upgrade v1.0.0 -> v1.0.2
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 15:38:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96143

There is a prior patch doing this upgrade slightly differently

https://patchwork.yoctoproject.org/project/oe/patch/20220322044616.867009-1-yi.zhao@windriver.com/

and since it fixes the extramples/ build with a backport, I think
thats better tha disabling the build.

This patch adds explicit rdeps on libmnl and libnftnl, is there a
reason to do so ? is shlibs code failing to detect
the dependencies?

On Tue, Mar 22, 2022 at 8:00 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> Add libmnl and libnftnl to the RDEPENDS for the recipe. Also add a
> patch to remove the "example" directory from the list of build
> subdirs in Makefile.am, since this was added in v1.0.2 but it is
> breaking the build for content that we don't need in the image.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  ...e.am-do-not-build-examples-directory.patch | 34 +++++++++++++++++++
>  .../{nftables_1.0.1.bb => nftables_1.0.2.bb}  |  8 +++--
>  2 files changed, 40 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch
>  rename meta-networking/recipes-filter/nftables/{nftables_1.0.1.bb => nftables_1.0.2.bb} (85%)
>
> diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch b/meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch
> new file mode 100644
> index 000000000..da568900c
> --- /dev/null
> +++ b/meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch
> @@ -0,0 +1,34 @@
> +From 4a0a013647054994e089a024b07d76b25af6ab76 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <trevor.gamblin@windriver.com>
> +Date: Tue, 22 Mar 2022 10:11:10 -0400
> +Subject: [PATCH] Makefile.am: do not build examples directory
> +
> +v1.0.2 added the "examples" subdir in Makefile.am, but the contents of
> +this directory do "#include <nftables/libnftables.h>", which is breaking
> +the build. Since we don't need the content in that directory, patch it
> +locally to prevent it from being built.
> +
> +Upstream-Status: Inappropriate (embedded-specific)
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +---
> + Makefile.am | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 72fb4e88..4a17424d 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -3,8 +3,7 @@ ACLOCAL_AMFLAGS        = -I m4
> + SUBDIRS =     src     \
> +               include \
> +               files   \
> +-              doc     \
> +-              examples
> ++              doc
> + if HAVE_PYTHON
> + SUBDIRS += py
> + endif
> +--
> +2.35.1
> +
> diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
> similarity index 85%
> rename from meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
> rename to meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
> index 2c378e8fd..1556b217f 100644
> --- a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
> +++ b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
> @@ -6,11 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
>  DEPENDS = "libmnl libnftnl bison-native \
>             ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
>
> +RDEPENDS:${PN} = "libmnl libnftnl"
> +
>  # Ensure we reject the 0.099 version by matching at least two dots
>  UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
>
> -SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
> -SRC_URI[sha256sum] = "3ceeba625818e81a0be293e9dd486c3ef799ebd92165270f1e57e9a201efa423"
> +SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
> +           file://0001-Makefile.am-do-not-build-examples-directory.patch \
> +          "
> +SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
>
>  inherit autotools manpages pkgconfig
>
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96141): https://lists.openembedded.org/g/openembedded-devel/message/96141
> Mute This Topic: https://lists.openembedded.org/mt/89953861/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

