Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED9CCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 18:57:52 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.47080.1697223468677486100
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 11:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mxg5UWNb;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-27cefb5ae1fso1632579a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697223468; x=1697828268; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udLCFyJGRRTHLVpJY4z5jbqZzirE7pX3qSw1aCrZYjc=;
        b=Mxg5UWNb0x2Covln03wyu2e9XoklswoQt6gw/T4qgi8HrzuEv2MF8CkdH9L9Fcvaf9
         3eTChDKdqS8J7fMk9ssSQb6574OBq9OirNMo327OYSjhoAtlbLfuRmmqbFqz0zktXDv/
         7RHJnQeBVZYt6Zrx/fXe2CJbUBhmM1TV9BSC85gTOJW5jnjNe3P0EEjV8zel0jghao1b
         7x9jO8S8zDlFNqPm/5TAh6MKVugOOkTe8t5fWnrI1Leslt8cSbiaYh72NMq26jgyOye4
         iofxQYI49YZlmvRTXq6Y/Y4tpvHAx7SA+JM7MMp0ZLpgIk+vRvhOHLDqZEFzvlRMz6oC
         FFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697223468; x=1697828268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udLCFyJGRRTHLVpJY4z5jbqZzirE7pX3qSw1aCrZYjc=;
        b=dKzhORE4q+hBbsmwXKEnKUXQ6/9/S0fQILHBxoVMY52quICOSbapR/LTgE57ZFv0eg
         a+fHXmXSeAR/KqGNxg16aP3QKyXOTcX2PXOd7ObQFg2iwo3OAp7t7SmeDbelHXeVIwC+
         Ed4herxcVJsWkC2o0CEbDotKs6IdERDqlM6mYRJK04ifzXaeDf58nHvw5WgHaa1hjSii
         jwix27wj4ckotpNsnUNEgesD5CpSEYiJj65NFE1sNBp4kec6u4Ho25ItBzXkJNncBELj
         479r4GhMQ/tbdeCkk1uoztFIB4eiG6nF528u1ZhlXqtXXfAwMSaTQbCUTNKdzva5foga
         OrYQ==
X-Gm-Message-State: AOJu0YwbdcnXYRg+J4mSuL9EKu3is6b+9o4TywL3RjHA9BUPLxKFpDdE
	R0DITd1+zfU/F4Lo/TSsCDFLIh5peJPqKoO/qgY=
X-Google-Smtp-Source: AGHT+IHKe03ClnvWJdSonHGz5sixy5vRIupZoPrUmmfXfYO0vgG767pDH6/3MDB8uABQNDdNdJ88jGnxQhNkG8FCoBc=
X-Received: by 2002:a17:90b:4a0c:b0:274:b4ce:7049 with SMTP id
 kk12-20020a17090b4a0c00b00274b4ce7049mr25145442pjb.34.1697223468041; Fri, 13
 Oct 2023 11:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231013140719.344880-1-beniaminsandu@gmail.com> <CAMKF1so9ZzJr0jbrOWEOoHdChUkz6JHa7CZH75LDxtEAb45uMg@mail.gmail.com>
In-Reply-To: <CAMKF1so9ZzJr0jbrOWEOoHdChUkz6JHa7CZH75LDxtEAb45uMg@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Fri, 13 Oct 2023 19:57:36 +0100
Message-ID: <CABQJdOH0XpV3yvkene=P4OcxgFuZK9ZE-pgqs1mX1-UPqAjpfA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v3] mbedtls: upgrade 3.4.1 -> 3.5.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 18:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105492

On Fri, 13 Oct 2023 at 18:19, Khem Raj <raj.khem@gmail.com> wrote:
>
> fails to compile on x86
> https://errors.yoctoproject.org/Errors/Details/739887/
>

Will have a look and fix it next week.

> On Fri, Oct 13, 2023 at 7:15=E2=80=AFAM Beniamin Sandu <beniaminsandu@gma=
il.com> wrote:
> >
> > * Includes security fix for CVE-2023-43615 - Buffer overread in TLS str=
eam cipher suites
> > * Includes security fix for CVE-2023-45199 - Buffer overflow in TLS han=
dshake parsing with ECDH
> > * Includes aesce compilation fixes
> >
> > Full changelog: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtl=
s-3.5.0
> >
> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ---
> >  ...cify-an-arch-version-when-enabling-c.patch | 33 ------------------
> >  ...t-target-attribute-when-building-wit.patch | 34 -------------------
> >  .../{mbedtls_3.4.1.bb =3D> mbedtls_3.5.0.bb}    |  4 +--
> >  3 files changed, 1 insertion(+), 70 deletions(-)
> >  delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtl=
s/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
> >  delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtl=
s/0002-aesce-use-correct-target-attribute-when-building-wit.patch
> >  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.1.bb =
=3D> mbedtls_3.5.0.bb} (93%)
> >
> > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-=
aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networkin=
g/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-ve=
rsion-when-enabling-c.patch
> > deleted file mode 100644
> > index 44d74754c..000000000
> > --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-d=
o-not-specify-an-arch-version-when-enabling-c.patch
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
> > -From: Beniamin Sandu <beniaminsandu@gmail.com>
> > -Date: Sun, 25 Jun 2023 19:58:08 +0300
> > -Subject: [PATCH] aesce: do not specify an arch version when enabling c=
rypto
> > - instructions
> > -
> > -Building mbedtls with different aarch64 tuning variations revealed
> > -that we should use the crypto extensions without forcing a particular
> > -architecture version or core, as that can create issues.
> > -
> > -Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/=
471a975942dec76bf0ccb92b6c6da055385683fb]
> > -
> > -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ----
> > - library/aesce.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/library/aesce.c b/library/aesce.c
> > -index fe056dc4c..843de3973 100644
> > ---- a/library/aesce.c
> > -+++ b/library/aesce.c
> > -@@ -60,7 +60,7 @@
> > - #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
> > - #       endif
> > - #       pragma GCC push_options
> > --#       pragma GCC target ("arch=3Darmv8-a+crypto")
> > -+#       pragma GCC target ("+crypto")
> > - #       define MBEDTLS_POP_TARGET_PRAGMA
> > - #   else
> > - #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-=
aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networkin=
g/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attrib=
ute-when-building-wit.patch
> > deleted file mode 100644
> > index c8f6cb750..000000000
> > --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-u=
se-correct-target-attribute-when-building-wit.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
> > -From: Beniamin Sandu <beniaminsandu@gmail.com>
> > -Date: Mon, 26 Jun 2023 12:07:21 +0300
> > -Subject: [PATCH] aesce: use correct target attribute when building wit=
h clang
> > -
> > -Seems clang has its own issues when it comes to crypto extensions,
> > -and right now the best way to avoid them is to accurately enable
> > -the needed instructions instead of the broad crypto feature.
> > -
> > -E.g.: https://github.com/llvm/llvm-project/issues/61645
> > -
> > -Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/=
aa4f6219014d863bed51453e5261178adc66be34]
> > -
> > -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ----
> > - library/aesce.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/library/aesce.c b/library/aesce.c
> > -index 843de3973..7bea088ba 100644
> > ---- a/library/aesce.c
> > -+++ b/library/aesce.c
> > -@@ -53,7 +53,7 @@
> > - #       if __clang_major__ < 4
> > - #           error "A more recent Clang is required for MBEDTLS_AESCE_=
C"
> > - #       endif
> > --#       pragma clang attribute push (__attribute__((target("crypto"))=
), apply_to=3Dfunction)
> > -+#       pragma clang attribute push (__attribute__((target("aes"))), =
apply_to=3Dfunction)
> > - #       define MBEDTLS_POP_TARGET_PRAGMA
> > - #   elif defined(__GNUC__)
> > - #       if __GNUC__ < 6
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1=
.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
> > similarity index 93%
> > rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.=
bb
> > rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
> > index a6f8583b2..1fd187ab2 100644
> > --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
> > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
> > @@ -23,10 +23,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef963=
87f14655fc854ddc3c6bd57"
> >  SECTION =3D "libs"
> >
> >  S =3D "${WORKDIR}/git"
> > -SRCREV =3D "72718dd87e087215ce9155a826ee5a66cfbe9631"
> > +SRCREV =3D "1ec69067fa1351427f904362c1221b31538c8b57"
> >  SRC_URI =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;bra=
nch=3Dmaster \
> > -       file://0001-aesce-do-not-specify-an-arch-version-when-enabling-=
c.patch \
> > -       file://0002-aesce-use-correct-target-attribute-when-building-wi=
t.patch \
> >         file://run-ptest"
> >
> >  inherit cmake update-alternatives ptest
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105470): https://lists.openembedded.org/g/openembed=
ded-devel/message/105470
> > Mute This Topic: https://lists.openembedded.org/mt/101940558/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

