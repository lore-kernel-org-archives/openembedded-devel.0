Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAC5E7C4E5
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:58:15 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.24036.1696438692414849058
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 09:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hSB5mo1t;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dce0f9e222so1579944fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 09:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696438691; x=1697043491; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STdda2xWo6r7F5YEpaWdjx9W5vElquC1nwgI89u77Zc=;
        b=hSB5mo1tnxSi3YxVlaobGcL46tbbxH23XpLqy1Lftmi4Cc4lid2JA2BTiNHR41Ws5Z
         nzf+JXl+z9SbJAGn7wFMbBF7EhS+05MkhIxdxfbKqL7vjvD+1dvVmfI+zaLuNKiuhjky
         jgAw9SClJoeKEJ+OjC7CGhBBIG9JJCO5RDR9mwg6iWdAN3OEnMICE8NvobDDnTDR3mwS
         c5fcprlporpBiG2DRX3ZZEJA1X1dJCan4u3Zr8pIku+4GNYGM9PSW3CW5vZ4xlWE+aZC
         i08SgBt9oSS0rJaOeuLOLEypIWmJnF2OzHX7TpzQphffhiz5Xu2SwmYL+Sluv8RGXhhv
         I2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696438691; x=1697043491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STdda2xWo6r7F5YEpaWdjx9W5vElquC1nwgI89u77Zc=;
        b=l6NTCm7Y94PZiWE3tD+iUWK+ySzh9z+OfcM8Hz5kPQFfUs9TLbontKB+Z45nKBzWFI
         0DtOLLNf2nrPG4XO9vLxyGitBXWL2b3tomQwAK7jJM9vGy4d2XLQMxYMWfedzoI6+4wY
         2zaw07r4t2pfibdWYCONJTpofnswooK5zrBiBB+YXYNTkw3hmITO+9R7orxjjrXMjRNr
         uVjcT7USYxxGee3OK8MOoGJ+mZgNdBrjk7d23jsfcZhu9jCWCXEZHJJtkp9p4E3fOaGZ
         EV1WLKkNgonaAm1dn3Iv9jUk0yyeO2ra74nT65SV7DRgbYGHYB3KdDY01HBOtILs0UAO
         cvaQ==
X-Gm-Message-State: AOJu0YzWK108GAPkDlH12FAYVoTOzBzQPX4CwdqDVFfzx+mI960mcD2B
	lgZijE9Te6ogWgcG1HVzBofn3yZ4vlU4s05y6MwWYjfKQjY=
X-Google-Smtp-Source: AGHT+IEBEMpjgJVSMLbUbp/e+d6QQkG3VoWtCibvkGUifW6ofUVhfI6VmjIaBRekwkYUe1cVRyIXbyGAE8Xrcoe2Ozw=
X-Received: by 2002:a05:6870:b025:b0:1bf:9f6:b810 with SMTP id
 y37-20020a056870b02500b001bf09f6b810mr3183473oae.36.1696438691494; Wed, 04
 Oct 2023 09:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231004161345.322169-1-joe.slater@windriver.com>
In-Reply-To: <20231004161345.322169-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Oct 2023 09:57:45 -0700
Message-ID: <CAMKF1spFprH3HOwJ=3PdpiSA3-H-U4qDGOG4EsK2ViBTaPEtGg@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH 1/1] nginx: add configure option
To: joe.slater@windriver.com
Cc: openembedded-devel@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 16:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105339

On Wed, Oct 4, 2023 at 9:13=E2=80=AFAM Joe Slater via lists.openembedded.or=
g
<joe.slater=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
> Support --with-http_xslt_module configure option via a PACKAGECONFIG
> option.  The option is not added to the defaults.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../files/0001-configure-libxslt-conf.patch   | 39 +++++++++++++++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |  3 ++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta-webserver/recipes-httpd/nginx/files/0001-configu=
re-libxslt-conf.patch
>
> diff --git a/meta-webserver/recipes-httpd/nginx/files/0001-configure-libx=
slt-conf.patch b/meta-webserver/recipes-httpd/nginx/files/0001-configure-li=
bxslt-conf.patch
> new file mode 100644
> index 0000000000..7ba2a1fb85
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-con=
f.patch
> @@ -0,0 +1,39 @@
> +From 0c3c669464a514cf8d0cac08282ecb2b486f440f Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Tue, 3 Oct 2023 19:21:17 +0000
> +Subject: [PATCH] configure: libxslt conf
> +
> +Modify to find libxslt related include files under sysroot.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + auto/lib/libxslt/conf | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/auto/lib/libxslt/conf b/auto/lib/libxslt/conf
> +index 3063ac7..eb77886 100644
> +--- a/auto/lib/libxslt/conf
> ++++ b/auto/lib/libxslt/conf
> +@@ -12,7 +12,7 @@
> +                       #include <libxslt/xsltInternals.h>
> +                       #include <libxslt/transform.h>
> +                       #include <libxslt/xsltutils.h>"
> +-    ngx_feature_path=3D"/usr/include/libxml2"
> ++    ngx_feature_path=3D"=3D/usr/include/libxml2"

For OE usecase, this might be enough, however, upstream might support
different compilers or even older gcc or clang where sysroot support is not
there or are configures with sysroot support disabled so =3Dincpath syntax =
may
not work universally.  Perhaps adding a new case where PREFIX is set
then prepend
that to path if not them proceed as normal might make it easier to not rely=
 on
tool features.

> +     ngx_feature_libs=3D"-lxml2 -lxslt"
> +     ngx_feature_test=3D"xmlParserCtxtPtr    ctxt =3D NULL;
> +                       xsltStylesheetPtr   sheet =3D NULL;
> +@@ -100,7 +100,7 @@ fi
> +     ngx_feature_name=3DNGX_HAVE_EXSLT
> +     ngx_feature_run=3Dno
> +     ngx_feature_incs=3D"#include <libexslt/exslt.h>"
> +-    ngx_feature_path=3D"/usr/include/libxml2"
> ++    ngx_feature_path=3D"=3D/usr/include/libxml2"
> +     ngx_feature_libs=3D"-lexslt"
> +     ngx_feature_test=3D"exsltRegisterAll();"
> +     . auto/feature
> +--
> +2.35.5
> +
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/recipes-httpd/nginx/nginx.inc
> index 1ea32f7c94..8890e0bea1 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -22,6 +22,7 @@ SRC_URI =3D " \
>      file://nginx-volatile.conf \
>      file://nginx.service \
>      file://nginx-fix-pidfile.patch \
> +    file://0001-configure-libxslt-conf.patch \
>  "
>
>  inherit siteinfo update-rc.d useradd systemd
> @@ -47,6 +48,8 @@ PACKAGECONFIG[ipv6] =3D "--with-ipv6,,"
>  PACKAGECONFIG[webdav] =3D "--with-http_dav_module,,"
>  PACKAGECONFIG[stream] =3D "--with-stream,,"
>
> +PACKAGECONFIG[xslt] =3D "--with-http_xslt_module,,libxslt"
> +
>  do_configure () {
>      if [ "${SITEINFO_BITS}" =3D "64" ]; then
>          PTRSIZE=3D8
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105337): https://lists.openembedded.org/g/openembedde=
d-devel/message/105337
> Mute This Topic: https://lists.openembedded.org/mt/101758666/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

