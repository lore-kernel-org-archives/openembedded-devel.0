Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD243E82CD7
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:36:18 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.27521.1695846978060963598
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X0k88sMj;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3ae214a077cso6254682b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695846977; x=1696451777; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlSZ2S9HhOsSuVWSePe0Cse8uuwtWt733Wb6+GzLfGI=;
        b=X0k88sMjoo20SoBx7Jde4zkQlnjVTpVKJy95rHR+W/3GYaHGnN5pKP5TDnSOrZs8yu
         gsy5H+5NpszY0YNHB6s8A8DddBWHB+ubT+ROAerZ6dsepcPdhjOcjspoAFUox4QCTY1J
         qUKogXiaq9mEkE0J7kFJ3zZ8R1sIyqKEDgPtFRsO5cEMoqudSwKfVmBc7e8mZJFFsu01
         488ng6mPUBpPwi3fX+ENsiIsazmBlW3uZK3nJg+tEhk/fxCTzWoUVU2MMzTFeAI2F9hu
         BliJwwHS0jVQdumS7+Yl5SpCQOwdzuFPyIVC/VqjiIt5sbOb9U+GxyJM/5MryUB/jM2L
         o7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846977; x=1696451777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlSZ2S9HhOsSuVWSePe0Cse8uuwtWt733Wb6+GzLfGI=;
        b=F6PCWBPKAcTr3xFxfNxX5X563a74x/W2S+hksgbPUZPnhFrdI6SDTSeIehhFs782Kr
         nDqWnfS4JrWXdilmFDE0d/9TuRivreYW+/5HWLq9TyFo7v4BdPZ90OhZJGqslleRlDmA
         FoS90KiwhXPQGvlZ+E+jLkNU4PzofzBYhW2JeVttx+WFS3nNZzcGjy/zLKswN9Vp0pu0
         yjYHpqcHfNrrezH33Axlvii6/8s3pshiuq4TEzi37TvJ/gC1iDQYEerPuJts8yUS20So
         VnW8Q9Xt7NFpH6qt7hcDtdPuN+ldCFqIje/q9drwpfZVjXR2khYecBh+iT21MOB/TB2w
         zIng==
X-Gm-Message-State: AOJu0YxYq4mn6r2FlfHYTqM7VT7/0t6C4A50JbbC5FnkPUSMkqCsnbVO
	eX+/4TcL8CIxIUDtqa7TkzZoFjy1F0y8YTcA6jc=
X-Google-Smtp-Source: AGHT+IHsUko/81H9/praJj63unJYZYv/HVAy3QdWPR3Gh0WushWcpFWyX+KDGqAkO8fj+nER+StXAqS6VS7UMo/XSF4=
X-Received: by 2002:a05:6870:5609:b0:1d5:af57:e916 with SMTP id
 m9-20020a056870560900b001d5af57e916mr3780871oao.16.1695846977103; Wed, 27 Sep
 2023 13:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230927104920.2052173-1-martin.jansa@gmail.com>
 <CAMKF1soQ+34Je2k3t52iNFmF18Q0HMYAnPGjin9egBejv3b6tg@mail.gmail.com> <CA+chaQfAoK1ZFdg=n_upKo2B2pesA7viXEfeAS=d-hh1uqia=g@mail.gmail.com>
In-Reply-To: <CA+chaQfAoK1ZFdg=n_upKo2B2pesA7viXEfeAS=d-hh1uqia=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2023 13:35:51 -0700
Message-ID: <CAMKF1spapF_oNbqAxqf=ZNmcq1CqyyS4kyrSv46A_tkrQH9ZYg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] gnome-tweaks, networkmanager-fortisslvpn,
 libesmtp, json-schema-validator, python3-pybluez, python3-pynetlinux,
 apache2: Fix Malformed Upstream-Status
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105209

Awesome, thanks!

On Wed, Sep 27, 2023 at 1:12=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Done and added 3 more missing Upstream-Status which are missing only in m=
aster-next.
>
> On Wed, Sep 27, 2023 at 9:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> can you rebase it on master-next
>>
>> On Wed, Sep 27, 2023 at 3:49=E2=80=AFAM Martin Jansa <martin.jansa@gmail=
.com> wrote:
>> >
>> > * Accepted was replaced with Backport in gatesgarth:
>> >   https://docs.yoctoproject.org/migration-guides/migration-3.2.html#mi=
scellaneous-changes
>> >
>> > * as detected with oe-core/scripts/contrib/patchreview.py:
>> >
>> > meta-openembedded $ grep -A 3 Malformed *qa-patches
>> > meta-gnome.qa-patches:Malformed Upstream-Status 'Malformed Upstream-St=
atus in patch
>> > meta-gnome.qa-patches-/OE/layers/meta-openembedded/meta-gnome/recipes-=
gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.=
patch
>> > meta-gnome.qa-patches-Please correct according to https://docs.yoctopr=
oject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
>> > meta-gnome.qa-patches-Upstream-Status: Accepted [https://gitlab.gnome.=
org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]' =
(/OE/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-tweaks/gnome-t=
weaks/0002-meson-fix-invalid-positional-argument.patch)
>> > --
>> > meta-networking.qa-patches:Malformed Upstream-Status 'Malformed Upstre=
am-Status in patch
>> > meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networkin=
g/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-p=
pp-2.5.0-build.patch
>> > meta-networking.qa-patches-Please correct according to https://docs.yo=
ctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-sta=
tus :
>> > meta-networking.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta=
-openembedded/meta-networking/recipes-connectivity/networkmanager/networkma=
nager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch)
>> > meta-networking.qa-patches:Malformed Upstream-Status 'Malformed Upstre=
am-Status in patch
>> > meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networkin=
g/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-p=
pp-2.5.0-build.patch
>> > meta-networking.qa-patches-Please correct according to https://docs.yo=
ctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-sta=
tus :
>> > meta-networking.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta=
-openembedded/meta-networking/recipes-connectivity/networkmanager/networkma=
nager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch)
>> > --
>> > meta-networking.qa-patches:Malformed Upstream-Status 'Malformed Upstre=
am-Status in patch
>> > meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networkin=
g/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.=
patch
>> > meta-networking.qa-patches-Please correct according to https://docs.yo=
ctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-sta=
tus :
>> > meta-networking.qa-patches-Upstream-Status: Accepted [https://github.c=
om/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d]' (/OE=
/layers/meta-openembedded/meta-networking/recipes-support/libesmtp/libesmtp=
/0001-Add-build-option-for-NTLM-support.patch)
>> > --
>> > meta-oe.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Statu=
s in patch
>> > meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtoo=
ls/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char=
.patch
>> > meta-oe.qa-patches-Please correct according to https://docs.yoctoproje=
ct.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
>> > meta-oe.qa-patches-Upstream-Status: Accepted [https://github.com/pboet=
tch/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]'=
 (/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-validat=
or/json-schema-validator/0002-Fix-assumed-signed-char.patch)
>> > meta-oe.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Statu=
s in patch
>> > meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtoo=
ls/json-schema-validator/json-schema-validator/0003-For-root-value-use-empt=
y-pointer.patch
>> > meta-oe.qa-patches-Please correct according to https://docs.yoctoproje=
ct.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
>> > meta-oe.qa-patches-Upstream-Status: Accepted [https://github.com/pboet=
tch/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]'=
 (/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-validat=
or/json-schema-validator/0003-For-root-value-use-empty-pointer.patch)
>> > --
>> > meta-python.qa-patches:Malformed Upstream-Status 'Malformed Upstream-S=
tatus in patch
>> > meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipe=
s-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-l=
ength-fix-426-42.patch
>> > meta-python.qa-patches-Please correct according to https://docs.yoctop=
roject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status =
:
>> > meta-python.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-ope=
nembedded/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_s=
size_t-when-parsing-buffer-length-fix-426-42.patch)
>> > meta-python.qa-patches:Malformed Upstream-Status 'Malformed Upstream-S=
tatus in patch
>> > meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipe=
s-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
>> > meta-python.qa-patches-Please correct according to https://docs.yoctop=
roject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status =
:
>> > meta-python.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-ope=
nembedded/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed=
-relative-imports.patch)
>> > --
>> > meta-webserver.qa-patches:Malformed Upstream-Status 'Malformed Upstrea=
m-Status in patch
>> > meta-webserver.qa-patches-/OE/layers/meta-openembedded/meta-webserver/=
recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-di=
rectory-to-i.patch
>> > meta-webserver.qa-patches-Please correct according to https://docs.yoc=
toproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-stat=
us :
>> > meta-webserver.qa-patches-Upstream-Status: Accepted [https://svn.apach=
e.org/viewvc?view=3Drevision&revision=3D1909241]' (/OE/layers/meta-openembe=
dded/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-conf=
ig9.m4-Add-server-directory-to-i.patch)
>> >
>> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> > ---
>> >  .../0002-meson-fix-invalid-positional-argument.patch            | 2 +=
-
>> >  .../networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch   | 2 +=
-
>> >  .../networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch   | 2 +=
-
>> >  .../libesmtp/0001-Add-build-option-for-NTLM-support.patch       | 2 +=
-
>> >  .../json-schema-validator/0002-Fix-assumed-signed-char.patch    | 2 +=
-
>> >  .../0003-For-root-value-use-empty-pointer.patch                 | 2 +=
-
>> >  ...1-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch | 2 +=
-
>> >  .../python/python3-pynetlinux/0002-Fixed-relative-imports.patch | 2 +=
-
>> >  ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 2 +=
-
>> >  9 files changed, 9 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-m=
eson-fix-invalid-positional-argument.patch b/meta-gnome/recipes-gnome/gnome=
-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
>> > index bd7e76f208..d921ff3308 100644
>> > --- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fi=
x-invalid-positional-argument.patch
>> > +++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fi=
x-invalid-positional-argument.patch
>> > @@ -3,7 +3,7 @@ From: Mae Dartmann <hello@maedartmann.name>
>> >  Date: Wed, 16 Feb 2022 06:08:41 +0000
>> >  Subject: [PATCH] meson: fix invalid positional argument
>> >
>> > -Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gnome-tweak=
s/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
>> > +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-tweak=
s/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
>> >  ---
>> >   data/meson.build | 4 ++--
>> >   1 file changed, 2 insertions(+), 2 deletions(-)
>> > diff --git a/meta-networking/recipes-connectivity/networkmanager/netwo=
rkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch b/meta-networking/reci=
pes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5=
.0-build.patch
>> > index 0a568fa23c..2e84a334f0 100644
>> > --- a/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0001-fix-ppp-2.5.0-build.patch
>> > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0001-fix-ppp-2.5.0-build.patch
>> > @@ -7,7 +7,7 @@ MIME-Version: 1.0
>> >  Content-Type: text/plain; charset=3DUTF-8
>> >  Content-Transfer-Encoding: 8bit
>> >
>> > -Upstream-Status: Accepted
>> > +Upstream-Status: Backport
>> >  Signed-off-by: Eivind N=C3=A6ss <eivnaes@yahoo.com>
>> >  ---
>> >   Makefile.am                                   |  5 +-
>> > diff --git a/meta-networking/recipes-connectivity/networkmanager/netwo=
rkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch b/meta-networking/reci=
pes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5=
.0-build.patch
>> > index 798a57b0da..6ac8f2b643 100644
>> > --- a/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0002-fix-ppp-2.5.0-build.patch
>> > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0002-fix-ppp-2.5.0-build.patch
>> > @@ -6,7 +6,7 @@ MIME-Version: 1.0
>> >  Content-Type: text/plain; charset=3DUTF-8
>> >  Content-Transfer-Encoding: 8bit
>> >
>> > -Upstream-Status: Accepted
>> > +Upstream-Status: Backport
>> >  Signed-off-by: Eivind N=C3=A6ss <eivnaes@yahoo.com>
>> >  ---
>> >   configure.ac | 6 +-----
>> > diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Ad=
d-build-option-for-NTLM-support.patch b/meta-networking/recipes-support/lib=
esmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch
>> > index 64938a4820..dbdd644830 100644
>> > --- a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build=
-option-for-NTLM-support.patch
>> > +++ b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build=
-option-for-NTLM-support.patch
>> > @@ -11,7 +11,7 @@ disabled by default.
>> >  Like 1.0.6, it will check openssl MD4 algorithm support as MD4 is
>> >  insecure and modern systems may drop MD4 support.
>> >
>> > -Upstream-Status: Accepted [https://github.com/libesmtp/libESMTP/commi=
t/1c304e7886a08fb56485e41614ff3f8685afb59d]
>> > +Upstream-Status: Backport [https://github.com/libesmtp/libESMTP/commi=
t/1c304e7886a08fb56485e41614ff3f8685afb59d]
>> >  Signed-off-by: Jiaqing Zhao <jiaqing.zhao@intel.com>
>> >  ---
>> >   meson.build       | 13 ++++++++++---
>> > diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schem=
a-validator/0002-Fix-assumed-signed-char.patch b/meta-oe/recipes-devtools/j=
son-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.pat=
ch
>> > index 2ee0a39126..1c4b871bb6 100644
>> > --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-valid=
ator/0002-Fix-assumed-signed-char.patch
>> > +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-valid=
ator/0002-Fix-assumed-signed-char.patch
>> > @@ -11,7 +11,7 @@ GCC treats char as unsigned resulting in compile err=
ors:
>> >
>> >  Fix this by specifying signed char.
>> >
>> > -Upstream-Status: Accepted [https://github.com/pboettch/json-schema-va=
lidator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
>> > +Upstream-Status: Backport [https://github.com/pboettch/json-schema-va=
lidator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
>> >
>> >  Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
>> >  ---
>> > diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schem=
a-validator/0003-For-root-value-use-empty-pointer.patch b/meta-oe/recipes-d=
evtools/json-schema-validator/json-schema-validator/0003-For-root-value-use=
-empty-pointer.patch
>> > index e0d0cf8ce9..eac997ae58 100644
>> > --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-valid=
ator/0003-For-root-value-use-empty-pointer.patch
>> > +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-valid=
ator/0003-For-root-value-use-empty-pointer.patch
>> > @@ -3,7 +3,7 @@ From: Sven Fink <sven.fink@wipotec.com>
>> >  Date: Fri, 13 Jan 2023 09:15:42 +0100
>> >  Subject: [PATCH 3/3] For root value, use empty pointer
>> >
>> > -Upstream-Status: Accepted [https://github.com/pboettch/json-schema-va=
lidator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
>> > +Upstream-Status: Backport [https://github.com/pboettch/json-schema-va=
lidator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
>> >
>> >  Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
>> >  ---
>> > diff --git a/meta-python/recipes-devtools/python/python3-pybluez/0001-=
Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch b/meta-python/re=
cipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buff=
er-length-fix-426-42.patch
>> > index 9126aba8d3..4d54a2e943 100644
>> > --- a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_=
ssize_t-when-parsing-buffer-length-fix-426-42.patch
>> > +++ b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_=
ssize_t-when-parsing-buffer-length-fix-426-42.patch
>> > @@ -20,7 +20,7 @@ From python 3.8 changes:
>> >
>> >  Fixes https://github.com/pybluez/pybluez/issues/426
>> >  ---
>> > -Upstream-Status: Accepted
>> > +Upstream-Status: Backport
>> >
>> >   bluez/btmodule.c | 23 ++++++++++++++---------
>> >   msbt/_msbt.c     |  6 ++++--
>> > diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux/00=
02-Fixed-relative-imports.patch b/meta-python/recipes-devtools/python/pytho=
n3-pynetlinux/0002-Fixed-relative-imports.patch
>> > index 9b5d9d6364..ee7cea8108 100644
>> > --- a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixe=
d-relative-imports.patch
>> > +++ b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixe=
d-relative-imports.patch
>> > @@ -6,7 +6,7 @@ Subject: [PATCH] Fixed relative imports
>> >  Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> >  ---
>> > -Upstream-Status: Accepted
>> > +Upstream-Status: Backport
>> >
>> >   pynetlinux/__init__.py | 8 ++++----
>> >   pynetlinux/brctl.py    | 2 +-
>> > diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules=
-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipe=
s-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-director=
y-to-i.patch
>> > index 996eabf586..9accbf18a1 100644
>> > --- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mapper=
s-config9.m4-Add-server-directory-to-i.patch
>> > +++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mapper=
s-config9.m4-Add-server-directory-to-i.patch
>> > @@ -4,7 +4,7 @@ Date: Tue, 18 Apr 2023 15:38:53 +0200
>> >  Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory=
 to
>> >   include path if mod_rewrite is enabled.
>> >
>> > -Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=3Drevis=
ion&revision=3D1909241]
>> > +Upstream-Status: Backport [https://svn.apache.org/viewvc?view=3Drevis=
ion&revision=3D1909241]
>> >
>> >  ---
>> >   modules/mappers/config9.m4 | 5 +++++
>> > --
>> > 2.42.0
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#105186): https://lists.openembedded.org/g/openembe=
dded-devel/message/105186
>> > Mute This Topic: https://lists.openembedded.org/mt/101614703/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

