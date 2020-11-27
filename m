Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.23768.1606506819597124966
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 11:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AUVKNS1R;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id p12so2791448qvj.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 11:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nAEUTtuqH1eIwseG0f9bmfzXY+NObcp9llNz5wNA+9o=;
        b=AUVKNS1Rvi2TCwdrU3PUM9Ngk29ijC1Fv6PeHyoYQvZ3gdnAM/3chPHuW9a/wE4t/l
         LK9Nvpckci4UyPcYeCz7ju4K7S87pr7lVoctuLYlG8IyOGYRKjncje6CKLi0TGtYLFxg
         0Icur+fvl72PCz/wp7ZJYEuw+SXcIfR39AHlXFPuT8CxKKPDXeqL3sD0UF79dGEDBE/W
         XJsheAjfm4vLFigg/f+KcCX++h8TslkoktNkq/JCd+bcIMselv2JIUivh0J7q4Y4aYld
         QzD2LnAXtysc/wY0aBucz55HdpsKEFAE09xx1cP1RkBd+FDNezv18qlhS4UvH2Jh3GSq
         +sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nAEUTtuqH1eIwseG0f9bmfzXY+NObcp9llNz5wNA+9o=;
        b=Qtof+TwycCY1zsbqYjTiI4fJtAihH+UhIHD/Ga7+uFdkol/H8GZ522hmV4rMzRvljz
         jGpgs1PrAgLixU3ioKdY7gL/mq267l4cwnH8+YXH1Ad0MNSEvPjKYz2OFCOA4E99SgMC
         CkfdEEQyCR56HzvtrsPDQXId2m2agrM7DgET8nocC5BtidXx+0yikHBm+wsm7lCr9d2z
         D298F8XRedEkDngUsphElR8P6g+wcjC+jmYhAimBtbD8rkibAQZnRNkgFcvFYJdBpUQp
         jP7jh4r1GZKIVc6atAxTfculKSFEZwOJBAaQNWJO+PtujZhA2V7uuf9qg/NngkPxYkHw
         VedA==
X-Gm-Message-State: AOAM532NUF3M+Wl4x/nxjBJ3IUNZxn0eSYINQUpMb00Kw65FMOBGyqwK
	nInNMlMYmKqwGvg4aV8EaOHE782SOfN05ntPtOE=
X-Google-Smtp-Source: ABdhPJwH7BNRhx23cVM0gNoD9fTJn/o2kJGvbEnAZNVbMokL0w6dZp93+2pYIpA9SV5GbwXpffsq3gg/LE6W9x30RfI=
X-Received: by 2002:ad4:4b67:: with SMTP id m7mr9828202qvx.5.1606506818727;
 Fri, 27 Nov 2020 11:53:38 -0800 (PST)
MIME-Version: 1.0
References: <1606442154-116983-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1606442154-116983-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Nov 2020 11:53:12 -0800
Message-ID: <CAMKF1sqeD6mfnC6nJcNt=Dtsr4xnqMPP9G38vw8uiP-nhia7PA@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] netplan: upgrade 0.99 -> 0.100
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails to build with clang see

https://errors.yoctoproject.org/Errors/Details/538863/

On Thu, Nov 26, 2020 at 5:56 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> 0001-src-parse.c-Initialize-key-to-NULL.patch
> Removed since this is included in 0.100.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...1-src-parse.c-Initialize-key-to-NULL.patch | 32 -------------------
>  .../{netplan_0.99.bb => netplan_0.100.bb}     |  5 ++-
>  2 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
>  rename meta-networking/recipes-connectivity/netplan/{netplan_0.99.bb => netplan_0.100.bb} (95%)
>
> diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
> deleted file mode 100644
> index a710b1e57..000000000
> --- a/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 63de116c617a35ff3d54c785b3dfb5378bb07f46 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 12 Aug 2020 22:39:17 -0700
> -Subject: [PATCH] src/parse.c: Initialize key to NULL
> -
> -Fixes
> -
> -src/parse.c:810:22: note: 'key' was declared here
> -cc1: all warnings being treated as errors
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/parse.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/parse.c b/src/parse.c
> -index 63a0863..c66277f 100644
> ---- a/src/parse.c
> -+++ b/src/parse.c
> -@@ -807,7 +807,7 @@ handle_addresses(yaml_document_t* doc, yaml_node_t* node, const void* _, GError*
> -         char* prefix_len;
> -         guint64 prefix_len_num;
> -         yaml_node_t *entry = yaml_document_get_node(doc, *i);
> --        yaml_node_t *key, *value = NULL;
> -+        yaml_node_t *key = NULL, *value = NULL;
> -
> -         if (entry->type != YAML_SCALAR_NODE && entry->type != YAML_MAPPING_NODE) {
> -             return yaml_error(entry, error, "expected either scalar or mapping (check indentation)");
> ---
> -2.28.0
> -
> diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
> similarity index 95%
> rename from meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
> rename to meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
> index 5546f300b..5039b277b 100644
> --- a/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
> +++ b/meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
> @@ -11,14 +11,13 @@ LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>  S = "${WORKDIR}/git"
> -SRCREV = "85134d13eb1ee5a1a7d139cd74ffa10933d73677"
> -PV = "0.99+git${SRCPV}"
> +SRCREV = "b7d32aebc880f3161b8f97ee56b729c0c54dd0e4"
> +PV = "0.100+git${SRCPV}"
>
>  SRC_URI = " \
>          git://github.com/CanonicalLtd/netplan.git \
>          file://0001-dbus-Remove-unused-variabes.patch \
>          file://0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch \
> -        file://0001-src-parse.c-Initialize-key-to-NULL.patch \
>  "
>
>  DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> --
> 2.25.1
>
>
>
>
> 
>
