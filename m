Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8629EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:50:43 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.6998.1687783836234319871
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 05:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PpxiP4Q0;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-55af0a816e4so261569a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687783835; x=1690375835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pWyIVFivfTo+G6jzFsH10d6EYHwr4/LEdaKZy9gvCfI=;
        b=PpxiP4Q0XO8YBU7GB2s3hk2epeRaiZdiJYuZ4Do1CsanLdWExoN+oL3ooCduWw9tmI
         0B4J7rSemcKDya1unzz9um2k5jErvQWqNO/243OwOjHVmJh67Uuqtin+n33/orbw5rb9
         KTpAC5ldFTbnZislbVd1nxhLSAiJeuisQaijM82+5dh5NSt5BhjPCUFTcfZXL6DV4Bgi
         8SGKSJpW5DdZ0EXkc8yd//sCIOYg3BArHwJy1ajQ4XalRM/s2FUiDJDgNNa6ileHMMgt
         XcxViyLGk4wmj9bTNgOnIJoEyizw1U2Ea0f8beFaAX0hhWwvAYSozGbH5FGYvUclJFTs
         ruSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687783835; x=1690375835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWyIVFivfTo+G6jzFsH10d6EYHwr4/LEdaKZy9gvCfI=;
        b=BRWifMHVA3z+IK9lriFooRbqyFVUf1GGcEdDBmNx6/qn4/fGbODaMYvfRS07mBklUd
         qVUkqxrgHkJUBg6knSXASZyY/xUyOeQdKfVNGGYCaPKSf/Usl97GjuJH/COFnnav2rHt
         n0AyXpIOi8roypVdNA9qhFRTqml1DCAAawGE9UUt0ScGIE7UnDWlpcpdc/lds0xJjJyv
         2BR3hhjLUcMVZRyl5W0d/VO7V2Qpg+8ocrcxCDCJCFrYiZCmpHlXLV8ODvuZ3Xp3RpeW
         vXi3CP4xGMaDKvbBw1Jn1qrUdsQtpbmvkbs8wZPEByWxP7D8FPSjwJqivL8hVZ+5WKD8
         9e7w==
X-Gm-Message-State: AC+VfDwesLYwIOcYDdnM4nOdu7Rsobks7rteLLsX3kb0qaOnEzg1Fuix
	h9bKA7RxQLXZBn0hbJYW2VSimjJAf21xR168M30=
X-Google-Smtp-Source: ACHHUZ6o/iBD0FWEyO5KjPi0WDYHFuPvezBHqmx84fPg54H2ZkM3pQsfcsq0TuaQYVV+ezVMVO5lYhWggxiUMy8fbVk=
X-Received: by 2002:a17:90a:f2c3:b0:25e:9e59:af1a with SMTP id
 gt3-20020a17090af2c300b0025e9e59af1amr18001018pjb.21.1687783835317; Mon, 26
 Jun 2023 05:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230626115040.71199-1-beniaminsandu@gmail.com> <CAMKF1sqjkTYpgJ5HZiy1mJix2gZiVEyHjm_oi-haq4EX0=GGTQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqjkTYpgJ5HZiy1mJix2gZiVEyHjm_oi-haq4EX0=GGTQ@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Mon, 26 Jun 2023 15:50:23 +0300
Message-ID: <CABQJdOFq-yE_-DbV5TvZX_J_ZzAKkAnp0Yo+GRK2QVTJP=cy_Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: fix builds with crypto extensions
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f638e505ff07cb54"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 12:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103586

--000000000000f638e505ff07cb54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jun 2023, 15:12 Khem Raj, <raj.khem@gmail.com> wrote:

> On Mon, Jun 26, 2023 at 1:51=E2=80=AFPM Beniamin Sandu <beniaminsandu@gma=
il.com>
> wrote:
> >
> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ---
> >  ...cify-an-arch-version-when-enabling-c.patch | 33 ++++++++++++++++++
> >  ...t-target-attribute-when-building-wit.patch | 34 +++++++++++++++++++
> >  .../mbedtls/mbedtls_3.4.0.bb                  |  8 ++---
> >  3 files changed, 70 insertions(+), 5 deletions(-)
> >  create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-sp=
ecify-an-arch-version-when-enabling-c.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-corre=
ct-target-attribute-when-building-wit.patch
> >
> > diff --git
> a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-=
specify-an-arch-version-when-enabling-c.patch
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-=
specify-an-arch-version-when-enabling-c.patch
> > new file mode 100644
> > index 000000000..d98d8fa57
> > --- /dev/null
> > +++
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-=
specify-an-arch-version-when-enabling-c.patch
> > @@ -0,0 +1,33 @@
> > +From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
> > +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > +Date: Sun, 25 Jun 2023 19:58:08 +0300
> > +Subject: [PATCH] aesce: do not specify an arch version when enabling
> crypto
> > + instructions
> > +
> > +Building mbedtls with different aarch64 tuning variations revealed
> > +that we should use the crypto extensions without forcing a particular
> > +architecture version or core, as that can create issues.
> > +
> > +Upstream-Status: Submitted [
> https://github.com/Mbed-TLS/mbedtls/pull/7834]
> > +
> > +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > +---
> > + library/aesce.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/library/aesce.c b/library/aesce.c
> > +index fe056dc4c..843de3973 100644
> > +--- a/library/aesce.c
> > ++++ b/library/aesce.c
> > +@@ -60,7 +60,7 @@
> > + #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
> > + #       endif
> > + #       pragma GCC push_options
> > +-#       pragma GCC target ("arch=3Darmv8-a+crypto")
>
> I think you need so add something similar for clang case as well.
>

There is 2 patches, I have included one for clang too.


> > ++#       pragma GCC target ("+crypto")
> > + #       define MBEDTLS_POP_TARGET_PRAGMA
> > + #   else
> > + #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-cor=
rect-target-attribute-when-building-wit.patch
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-cor=
rect-target-attribute-when-building-wit.patch
> > new file mode 100644
> > index 000000000..4775c8ddb
> > --- /dev/null
> > +++
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-cor=
rect-target-attribute-when-building-wit.patch
> > @@ -0,0 +1,34 @@
> > +From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
> > +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > +Date: Mon, 26 Jun 2023 12:07:21 +0300
> > +Subject: [PATCH] aesce: use correct target attribute when building wit=
h
> clang
> > +
> > +Seems clang has its own issues when it comes to crypto extensions,
> > +and right now the best way to avoid them is to accurately enable
> > +the needed instructions instead of the broad crypto feature.
> > +
> > +E.g.: https://github.com/llvm/llvm-project/issues/61645
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > +---
> > + library/aesce.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/library/aesce.c b/library/aesce.c
> > +index 843de3973..7bea088ba 100644
> > +--- a/library/aesce.c
> > ++++ b/library/aesce.c
> > +@@ -53,7 +53,7 @@
> > + #       if __clang_major__ < 4
> > + #           error "A more recent Clang is required for MBEDTLS_AESCE_=
C"
> > + #       endif
> > +-#       pragma clang attribute push
> (__attribute__((target("crypto"))), apply_to=3Dfunction)
> > ++#       pragma clang attribute push (__attribute__((target("aes"))),
> apply_to=3Dfunction)
> > + #       define MBEDTLS_POP_TARGET_PRAGMA
> > + #   elif defined(__GNUC__)
> > + #       if __GNUC__ < 6
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-networking/recipes-connectivity/mbedtls/
> mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/
> mbedtls_3.4.0.bb
> > index ebc6ba573..b8c9662de 100644
> > --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> > @@ -25,8 +25,9 @@ SECTION =3D "libs"
> >  S =3D "${WORKDIR}/git"
> >  SRCREV =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
> >  SRC_URI =3D "git://
> github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=3Dmaster \
> > -           file://run-ptest \
> > -          "
> > +
>  file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
> > +
>  file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
> > +       file://run-ptest"
> >
> >  inherit cmake update-alternatives ptest
> >
> > @@ -41,9 +42,6 @@ PACKAGECONFIG[tests] =3D
> "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOFF"
> >
> >  EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:STRING=3D${libdir}"
> >
> > -# Needs crypto instructions on aarch64
> > -TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D
> "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
> > -
>
> It will be good to turn this into a parse warning or note and ignore
> to build this recipe if crypro is not available on armv8+ tune
> selection.
>

This is not needed anymore, as the flags are specified from source code in
both cases, so it should now work with all tune variations, with or without
crypto.


> >  # For now the only way to enable PSA is to explicitly pass a -D via
> CFLAGS
> >  CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', '
> -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
> >
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#103575):
> https://lists.openembedded.org/g/openembedded-devel/message/103575
> > Mute This Topic: https://lists.openembedded.org/mt/99785788/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000f638e505ff07cb54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, 26 Jun 2023, 15:12 Khem Raj, &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Jun 26, 2023 a=
t 1:51=E2=80=AFPM Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">beniaminsandu@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmai=
l.com" rel=3D"noreferrer noreferrer" target=3D"_blank">beniaminsandu@gmail.=
com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...cify-an-arch-version-when-enabling-c.patch | 33 +++++++++++++=
+++++<br>
&gt;=C2=A0 ...t-target-attribute-when-building-wit.patch | 34 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../mbedtls/<a href=3D"http://mbedtls_3.4.0.bb" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">mbedtls_3.4.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++---<br>
&gt;=C2=A0 3 files changed, 70 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/mbedtls/=
mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/mbedtls/=
mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001=
-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networki=
ng/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-v=
ersion-when-enabling-c.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..d98d8fa57<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-=
do-not-specify-an-arch-version-when-enabling-c.patch<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">beniaminsandu@gmail.com</a>&=
gt;<br>
&gt; +Date: Sun, 25 Jun 2023 19:58:08 +0300<br>
&gt; +Subject: [PATCH] aesce: do not specify an arch version when enabling =
crypto<br>
&gt; + instructions<br>
&gt; +<br>
&gt; +Building mbedtls with different aarch64 tuning variations revealed<br=
>
&gt; +that we should use the crypto extensions without forcing a particular=
<br>
&gt; +architecture version or core, as that can create issues.<br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/Mbed-TLS/mb=
edtls/pull/7834" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank"=
>https://github.com/Mbed-TLS/mbedtls/pull/7834</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gma=
il.com" rel=3D"noreferrer noreferrer" target=3D"_blank">beniaminsandu@gmail=
.com</a>&gt;<br>
&gt; +---<br>
&gt; + library/aesce.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/library/aesce.c b/library/aesce.c<br>
&gt; +index fe056dc4c..843de3973 100644<br>
&gt; +--- a/library/aesce.c<br>
&gt; ++++ b/library/aesce.c<br>
&gt; +@@ -60,7 +60,7 @@<br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error &quot;A more recent =
GCC is required for MBEDTLS_AESCE_C&quot;<br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0pragma GCC push_options<br>
&gt; +-#=C2=A0 =C2=A0 =C2=A0 =C2=A0pragma GCC target (&quot;arch=3Darmv8-a+=
crypto&quot;)<br>
<br>
I think you need so add something similar for clang case as well.<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">There is 2=
 patches, I have included one for clang too.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
&gt; ++#=C2=A0 =C2=A0 =C2=A0 =C2=A0pragma GCC target (&quot;+crypto&quot;)<=
br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0define MBEDTLS_POP_TARGET_PRAGMA<br>
&gt; + #=C2=A0 =C2=A0else<br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0error &quot;Only GCC and Clang supported=
 for MBEDTLS_AESCE_C&quot;<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002=
-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networki=
ng/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attri=
bute-when-building-wit.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..4775c8ddb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-=
use-correct-target-attribute-when-building-wit.patch<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">beniaminsandu@gmail.com</a>&=
gt;<br>
&gt; +Date: Mon, 26 Jun 2023 12:07:21 +0300<br>
&gt; +Subject: [PATCH] aesce: use correct target attribute when building wi=
th clang<br>
&gt; +<br>
&gt; +Seems clang has its own issues when it comes to crypto extensions,<br=
>
&gt; +and right now the best way to avoid them is to accurately enable<br>
&gt; +the needed instructions instead of the broad crypto feature.<br>
&gt; +<br>
&gt; +E.g.: <a href=3D"https://github.com/llvm/llvm-project/issues/61645" r=
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://github.co=
m/llvm/llvm-project/issues/61645</a><br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gma=
il.com" rel=3D"noreferrer noreferrer" target=3D"_blank">beniaminsandu@gmail=
.com</a>&gt;<br>
&gt; +---<br>
&gt; + library/aesce.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/library/aesce.c b/library/aesce.c<br>
&gt; +index 843de3973..7bea088ba 100644<br>
&gt; +--- a/library/aesce.c<br>
&gt; ++++ b/library/aesce.c<br>
&gt; +@@ -53,7 +53,7 @@<br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0if __clang_major__ &lt; 4<br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error &quot;A more recent =
Clang is required for MBEDTLS_AESCE_C&quot;<br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
&gt; +-#=C2=A0 =C2=A0 =C2=A0 =C2=A0pragma clang attribute push (__attribute=
__((target(&quot;crypto&quot;))), apply_to=3Dfunction)<br>
&gt; ++#=C2=A0 =C2=A0 =C2=A0 =C2=A0pragma clang attribute push (__attribute=
__((target(&quot;aes&quot;))), apply_to=3Dfunction)<br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0define MBEDTLS_POP_TARGET_PRAGMA<br>
&gt; + #=C2=A0 =C2=A0elif defined(__GNUC__)<br>
&gt; + #=C2=A0 =C2=A0 =C2=A0 =C2=A0if __GNUC__ &lt; 6<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mbedtls/<a href=3D"h=
ttp://mbedtls_3.4.0.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"=
_blank">mbedtls_3.4.0.bb</a> b/meta-networking/recipes-connectivity/mbedtls=
/<a href=3D"http://mbedtls_3.4.0.bb" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">mbedtls_3.4.0.bb</a><br>
&gt; index ebc6ba573..b8c9662de 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http://m=
bedtls_3.4.0.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank"=
>mbedtls_3.4.0.bb</a><br>
&gt; +++ b/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http://m=
bedtls_3.4.0.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank"=
>mbedtls_3.4.0.bb</a><br>
&gt; @@ -25,8 +25,9 @@ SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;1873d3bfc2da771672bd8e7e8f41f57e0af77f33&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/ARMmbed/mbe=
dtls.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer nor=
eferrer" target=3D"_blank">github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;=
branch=3Dmaster</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-aesce-do-not-specify-an-arch-v=
ersion-when-enabling-c.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-aesce-use-correct-target-attri=
bute-when-building-wit.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit cmake update-alternatives ptest<br>
&gt;<br>
&gt; @@ -41,9 +42,6 @@ PACKAGECONFIG[tests] =3D &quot;-DENABLE_TESTING=3DON=
,-DENABLE_TESTING=3DOFF&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECMAKE =3D &quot;-DLIB_INSTALL_DIR:STRING=3D${libdir}&quo=
t;<br>
&gt;<br>
&gt; -# Needs crypto instructions on aarch64<br>
&gt; -TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D &quot;${@bb.utils.contains(=
&#39;TUNE_FEATURES&#39;, &#39;crypto&#39;, &#39;&#39;, &#39;+crypto&#39;, d=
)}&quot;<br>
&gt; -<br>
<br>
It will be good to turn this into a parse warning or note and ignore<br>
to build this recipe if crypro is not available on armv8+ tune<br>
selection.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">This is not needed anymore, as the flags are specified from sourc=
e code in both cases, so it should now work with all tune variations, with =
or without crypto.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 # For now the only way to enable PSA is to explicitly pass a -D =
via CFLAGS<br>
&gt;=C2=A0 CFLAGS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&=
#39;, &#39;psa&#39;, &#39; -DMBEDTLS_USE_PSA_CRYPTO&#39;, &#39;&#39;, d)}&q=
uot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#103575): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/103575" rel=3D"noreferrer noreferrer noreferr=
er" target=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/m=
essage/103575</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99785788=
/1997914" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/mt/99785788/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-de=
vel+owner@lists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">htt=
ps://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mail=
to:raj.khem@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">raj.=
khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--000000000000f638e505ff07cb54--

