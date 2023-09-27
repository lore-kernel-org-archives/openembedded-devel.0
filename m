Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431DEE82CCF
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:12:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.27500.1695845546647408556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jx8Kl083;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40528376459so122055465e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695845545; x=1696450345; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sYYSesm1qB/LLbwwgwzCaZbwONU5OOaYZqf/bgFVGz4=;
        b=Jx8Kl083xZAGhOOUgN6o88ERMxGkNGRiAnjSRoXAZszfC+nND0eF9WTTlRf+hltfeG
         ArRwL8tddQeDTFQ67GZjfELqP+eZ7rVTOfaonBhf0imVJHdiBrIkO2P6aqxA0m2lXLLN
         mfjwXu6X/XIBx06gy9SqyNYXnSLpdeXsV01mK6jA6DKfT5GymItzgzM9NStD6Dujn2rY
         ISFKdiHX7LrkHp4mOCZMzQfdk7fw4wldugFxdKlaxPnU6cRCsAfsqt4OrI86qLTK4pjd
         cTA76Fjuz5Rp8rDXatlx/ej4UzBBAQ0IlrSHm23jFdYfGOwjmApJAtbihrpWUVzAS9JP
         P78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695845545; x=1696450345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYYSesm1qB/LLbwwgwzCaZbwONU5OOaYZqf/bgFVGz4=;
        b=BemIjXmqK/GcOaQCMOKPs32VDhjaDv/JwMAjNGoxX/pzTMnnuM2oT3jW5Bqsr9Dofe
         rLmb9tDLgZxLaUxKnmFQll+5O3sCUzaD2qtViFHEn9ugX1MTLhJmhVkPy+uJm5WpyewK
         OmvAuKLDAgRpdCpUQ/95nIthKPlYGIplVTlF1kpPr6lldROLE4QCqEVsKP5qPNzrO8Fz
         RtvRXU1q5elAKZHlUTS+AfHuBh6XkPcqkpXjITGQYAYwjeCs7H26nyhDWl9xcS19jXkN
         3r5Cx/u97inkT2lRiWNdReDE7Mhh17/aIfUp+TyNZXC7pPt0+BRHmZii2gQw/B4Fb1vx
         ljZQ==
X-Gm-Message-State: AOJu0YxJ9sQc4971NRDdcuMQS8Fnk+KyrnaU4vCMhPWM1pJpvq8wP+G3
	kTKE3tJlxnMJ4R9lTX8S/XjVk1vg4uSN22kC7Zs=
X-Google-Smtp-Source: AGHT+IFd77aHrC6D8NJkf5YKd5RYnnTP6YjmWRPlDM7mrD4fqAkpycf/VB4XeMF9vvUkVzImI97ZqtpCQBYzMyQgQDk=
X-Received: by 2002:a05:600c:294b:b0:401:b6f6:d8fd with SMTP id
 n11-20020a05600c294b00b00401b6f6d8fdmr2742510wmd.6.1695845544863; Wed, 27 Sep
 2023 13:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230927104920.2052173-1-martin.jansa@gmail.com> <CAMKF1soQ+34Je2k3t52iNFmF18Q0HMYAnPGjin9egBejv3b6tg@mail.gmail.com>
In-Reply-To: <CAMKF1soQ+34Je2k3t52iNFmF18Q0HMYAnPGjin9egBejv3b6tg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Sep 2023 22:12:11 +0200
Message-ID: <CA+chaQfAoK1ZFdg=n_upKo2B2pesA7viXEfeAS=d-hh1uqia=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] gnome-tweaks, networkmanager-fortisslvpn,
 libesmtp, json-schema-validator, python3-pybluez, python3-pynetlinux,
 apache2: Fix Malformed Upstream-Status
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004badf406065ccff0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105204

--0000000000004badf406065ccff0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Done and added 3 more missing Upstream-Status which are missing only in
master-next.

On Wed, Sep 27, 2023 at 9:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> can you rebase it on master-next
>
> On Wed, Sep 27, 2023 at 3:49=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
> >
> > * Accepted was replaced with Backport in gatesgarth:
> >
> https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscell=
aneous-changes
> >
> > * as detected with oe-core/scripts/contrib/patchreview.py:
> >
> > meta-openembedded $ grep -A 3 Malformed *qa-patches
> > meta-gnome.qa-patches:Malformed Upstream-Status 'Malformed
> Upstream-Status in patch
> >
> meta-gnome.qa-patches-/OE/layers/meta-openembedded/meta-gnome/recipes-gno=
me/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.pat=
ch
> > meta-gnome.qa-patches-Please correct according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> :
> > meta-gnome.qa-patches-Upstream-Status: Accepted [
> https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69=
fabaa350147f70096da8]'
> (/OE/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-tweaks/gnome=
-tweaks/0002-meson-fix-invalid-positional-argument.patch)
> > --
> > meta-networking.qa-patches:Malformed Upstream-Status 'Malformed
> Upstream-Status in patch
> >
> meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networking/r=
ecipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-=
2.5.0-build.patch
> > meta-networking.qa-patches-Please correct according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> :
> > meta-networking.qa-patches-Upstream-Status: Accepted'
> (/OE/layers/meta-openembedded/meta-networking/recipes-connectivity/networ=
kmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch)
> > meta-networking.qa-patches:Malformed Upstream-Status 'Malformed
> Upstream-Status in patch
> >
> meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networking/r=
ecipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-=
2.5.0-build.patch
> > meta-networking.qa-patches-Please correct according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> :
> > meta-networking.qa-patches-Upstream-Status: Accepted'
> (/OE/layers/meta-openembedded/meta-networking/recipes-connectivity/networ=
kmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch)
> > --
> > meta-networking.qa-patches:Malformed Upstream-Status 'Malformed
> Upstream-Status in patch
> >
> meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networking/r=
ecipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.pat=
ch
> > meta-networking.qa-patches-Please correct according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> :
> > meta-networking.qa-patches-Upstream-Status: Accepted [
> https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3=
f8685afb59d]'
> (/OE/layers/meta-openembedded/meta-networking/recipes-support/libesmtp/li=
besmtp/0001-Add-build-option-for-NTLM-support.patch)
> > --
> > meta-oe.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status
> in patch
> >
> meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtools/=
json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.pa=
tch
> > meta-oe.qa-patches-Please correct according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> :
> > meta-oe.qa-patches-Upstream-Status: Accepted [
> https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31=
790f5cacffa62e168bb35e32]'
> (/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-valida=
tor/json-schema-validator/0002-Fix-assumed-signed-char.patch)
> > meta-oe.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status
> in patch
> >
> meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtools/=
json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-p=
ointer.patch
> > meta-oe.qa-patches-Please correct according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> :
> > meta-oe.qa-patches-Upstream-Status: Accepted [
> https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54=
b4fc717ec1660c91eddb4d1a]'
> (/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-valida=
tor/json-schema-validator/0003-For-root-value-use-empty-pointer.patch)
> > --
> > meta-python.qa-patches:Malformed Upstream-Status 'Malformed
> Upstream-Status in patch
> >
> meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipes-d=
evtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-leng=
th-fix-426-42.patch
> > meta-python.qa-patches-Please correct according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> :
> > meta-python.qa-patches-Upstream-Status: Accepted'
> (/OE/layers/meta-openembedded/meta-python/recipes-devtools/python/python3=
-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch)
> > meta-python.qa-patches:Malformed Upstream-Status 'Malformed
> Upstream-Status in patch
> >
> meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipes-d=
evtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
> > meta-python.qa-patches-Please correct according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> :
> > meta-python.qa-patches-Upstream-Status: Accepted'
> (/OE/layers/meta-openembedded/meta-python/recipes-devtools/python/python3=
-pynetlinux/0002-Fixed-relative-imports.patch)
> > --
> > meta-webserver.qa-patches:Malformed Upstream-Status 'Malformed
> Upstream-Status in patch
> >
> meta-webserver.qa-patches-/OE/layers/meta-openembedded/meta-webserver/rec=
ipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-direc=
tory-to-i.patch
> > meta-webserver.qa-patches-Please correct according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> :
> > meta-webserver.qa-patches-Upstream-Status: Accepted [
> https://svn.apache.org/viewvc?view=3Drevision&revision=3D1909241]'
> (/OE/layers/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache=
2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch)
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  .../0002-meson-fix-invalid-positional-argument.patch            | 2 +-
> >  .../networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch   | 2 +-
> >  .../networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch   | 2 +-
> >  .../libesmtp/0001-Add-build-option-for-NTLM-support.patch       | 2 +-
> >  .../json-schema-validator/0002-Fix-assumed-signed-char.patch    | 2 +-
> >  .../0003-For-root-value-use-empty-pointer.patch                 | 2 +-
> >  ...1-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch | 2 +-
> >  .../python/python3-pynetlinux/0002-Fixed-relative-imports.patch | 2 +-
> >  ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 2 +-
> >  9 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git
> a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-inval=
id-positional-argument.patch
> b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-inval=
id-positional-argument.patch
> > index bd7e76f208..d921ff3308 100644
> > ---
> a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-inval=
id-positional-argument.patch
> > +++
> b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-inval=
id-positional-argument.patch
> > @@ -3,7 +3,7 @@ From: Mae Dartmann <hello@maedartmann.name>
> >  Date: Wed, 16 Feb 2022 06:08:41 +0000
> >  Subject: [PATCH] meson: fix invalid positional argument
> >
> > -Upstream-Status: Accepted [
> https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69=
fabaa350147f70096da8
> ]
> > +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69=
fabaa350147f70096da8
> ]
> >  ---
> >   data/meson.build | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > diff --git
> a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fort=
isslvpn/0001-fix-ppp-2.5.0-build.patch
> b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fort=
isslvpn/0001-fix-ppp-2.5.0-build.patch
> > index 0a568fa23c..2e84a334f0 100644
> > ---
> a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fort=
isslvpn/0001-fix-ppp-2.5.0-build.patch
> > +++
> b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fort=
isslvpn/0001-fix-ppp-2.5.0-build.patch
> > @@ -7,7 +7,7 @@ MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> >  Content-Transfer-Encoding: 8bit
> >
> > -Upstream-Status: Accepted
> > +Upstream-Status: Backport
> >  Signed-off-by: Eivind N=C3=A6ss <eivnaes@yahoo.com>
> >  ---
> >   Makefile.am                                   |  5 +-
> > diff --git
> a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fort=
isslvpn/0002-fix-ppp-2.5.0-build.patch
> b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fort=
isslvpn/0002-fix-ppp-2.5.0-build.patch
> > index 798a57b0da..6ac8f2b643 100644
> > ---
> a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fort=
isslvpn/0002-fix-ppp-2.5.0-build.patch
> > +++
> b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fort=
isslvpn/0002-fix-ppp-2.5.0-build.patch
> > @@ -6,7 +6,7 @@ MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> >  Content-Transfer-Encoding: 8bit
> >
> > -Upstream-Status: Accepted
> > +Upstream-Status: Backport
> >  Signed-off-by: Eivind N=C3=A6ss <eivnaes@yahoo.com>
> >  ---
> >   configure.ac | 6 +-----
> > diff --git
> a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option=
-for-NTLM-support.patch
> b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option=
-for-NTLM-support.patch
> > index 64938a4820..dbdd644830 100644
> > ---
> a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option=
-for-NTLM-support.patch
> > +++
> b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option=
-for-NTLM-support.patch
> > @@ -11,7 +11,7 @@ disabled by default.
> >  Like 1.0.6, it will check openssl MD4 algorithm support as MD4 is
> >  insecure and modern systems may drop MD4 support.
> >
> > -Upstream-Status: Accepted [
> https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3=
f8685afb59d
> ]
> > +Upstream-Status: Backport [
> https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3=
f8685afb59d
> ]
> >  Signed-off-by: Jiaqing Zhao <jiaqing.zhao@intel.com>
> >  ---
> >   meson.build       | 13 ++++++++++---
> > diff --git
> a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
02-Fix-assumed-signed-char.patch
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
02-Fix-assumed-signed-char.patch
> > index 2ee0a39126..1c4b871bb6 100644
> > ---
> a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
02-Fix-assumed-signed-char.patch
> > +++
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
02-Fix-assumed-signed-char.patch
> > @@ -11,7 +11,7 @@ GCC treats char as unsigned resulting in compile
> errors:
> >
> >  Fix this by specifying signed char.
> >
> > -Upstream-Status: Accepted [
> https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31=
790f5cacffa62e168bb35e32
> ]
> > +Upstream-Status: Backport [
> https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31=
790f5cacffa62e168bb35e32
> ]
> >
> >  Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
> >  ---
> > diff --git
> a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
03-For-root-value-use-empty-pointer.patch
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
03-For-root-value-use-empty-pointer.patch
> > index e0d0cf8ce9..eac997ae58 100644
> > ---
> a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
03-For-root-value-use-empty-pointer.patch
> > +++
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
03-For-root-value-use-empty-pointer.patch
> > @@ -3,7 +3,7 @@ From: Sven Fink <sven.fink@wipotec.com>
> >  Date: Fri, 13 Jan 2023 09:15:42 +0100
> >  Subject: [PATCH 3/3] For root value, use empty pointer
> >
> > -Upstream-Status: Accepted [
> https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54=
b4fc717ec1660c91eddb4d1a
> ]
> > +Upstream-Status: Backport [
> https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54=
b4fc717ec1660c91eddb4d1a
> ]
> >
> >  Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
> >  ---
> > diff --git
> a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t=
-when-parsing-buffer-length-fix-426-42.patch
> b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t=
-when-parsing-buffer-length-fix-426-42.patch
> > index 9126aba8d3..4d54a2e943 100644
> > ---
> a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t=
-when-parsing-buffer-length-fix-426-42.patch
> > +++
> b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t=
-when-parsing-buffer-length-fix-426-42.patch
> > @@ -20,7 +20,7 @@ From python 3.8 changes:
> >
> >  Fixes https://github.com/pybluez/pybluez/issues/426
> >  ---
> > -Upstream-Status: Accepted
> > +Upstream-Status: Backport
> >
> >   bluez/btmodule.c | 23 ++++++++++++++---------
> >   msbt/_msbt.c     |  6 ++++--
> > diff --git
> a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relat=
ive-imports.patch
> b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relat=
ive-imports.patch
> > index 9b5d9d6364..ee7cea8108 100644
> > ---
> a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relat=
ive-imports.patch
> > +++
> b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relat=
ive-imports.patch
> > @@ -6,7 +6,7 @@ Subject: [PATCH] Fixed relative imports
> >  Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >  ---
> > -Upstream-Status: Accepted
> > +Upstream-Status: Backport
> >
> >   pynetlinux/__init__.py | 8 ++++----
> >   pynetlinux/brctl.py    | 2 +-
> > diff --git
> a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-confi=
g9.m4-Add-server-directory-to-i.patch
> b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-confi=
g9.m4-Add-server-directory-to-i.patch
> > index 996eabf586..9accbf18a1 100644
> > ---
> a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-confi=
g9.m4-Add-server-directory-to-i.patch
> > +++
> b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-confi=
g9.m4-Add-server-directory-to-i.patch
> > @@ -4,7 +4,7 @@ Date: Tue, 18 Apr 2023 15:38:53 +0200
> >  Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory =
to
> >   include path if mod_rewrite is enabled.
> >
> > -Upstream-Status: Accepted [
> https://svn.apache.org/viewvc?view=3Drevision&revision=3D1909241]
> > +Upstream-Status: Backport [
> https://svn.apache.org/viewvc?view=3Drevision&revision=3D1909241]
> >
> >  ---
> >   modules/mappers/config9.m4 | 5 +++++
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105186):
> https://lists.openembedded.org/g/openembedded-devel/message/105186
> > Mute This Topic: https://lists.openembedded.org/mt/101614703/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000004badf406065ccff0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Done and added 3 more missing Upstream-Status which are mi=
ssing only in master-next.</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Sep 27, 2023 at 9:10=E2=80=AFPM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">can you rebase =
it on master-next<br>
<br>
On Wed, Sep 27, 2023 at 3:49=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; * Accepted was replaced with Backport in gatesgarth:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://docs.yoctoproject.org/migration-guides/=
migration-3.2.html#miscellaneous-changes" rel=3D"noreferrer" target=3D"_bla=
nk">https://docs.yoctoproject.org/migration-guides/migration-3.2.html#misce=
llaneous-changes</a><br>
&gt;<br>
&gt; * as detected with oe-core/scripts/contrib/patchreview.py:<br>
&gt;<br>
&gt; meta-openembedded $ grep -A 3 Malformed *qa-patches<br>
&gt; meta-gnome.qa-patches:Malformed Upstream-Status &#39;Malformed Upstrea=
m-Status in patch<br>
&gt; meta-gnome.qa-patches-/OE/layers/meta-openembedded/meta-gnome/recipes-=
gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.=
patch<br>
&gt; meta-gnome.qa-patches-Please correct according to <a href=3D"https://d=
ocs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstre=
am-status" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.o=
rg/contributor-guide/recipe-style-guide.html#patch-upstream-status</a> :<br=
>
&gt; meta-gnome.qa-patches-Upstream-Status: Accepted [<a href=3D"https://gi=
tlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f=
70096da8" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNO=
ME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8</a>]&#39;=
 (/OE/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-tweaks/gnome-=
tweaks/0002-meson-fix-invalid-positional-argument.patch)<br>
&gt; --<br>
&gt; meta-networking.qa-patches:Malformed Upstream-Status &#39;Malformed Up=
stream-Status in patch<br>
&gt; meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networkin=
g/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-p=
pp-2.5.0-build.patch<br>
&gt; meta-networking.qa-patches-Please correct according to <a href=3D"http=
s://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-u=
pstream-status" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproj=
ect.org/contributor-guide/recipe-style-guide.html#patch-upstream-status</a>=
 :<br>
&gt; meta-networking.qa-patches-Upstream-Status: Accepted&#39; (/OE/layers/=
meta-openembedded/meta-networking/recipes-connectivity/networkmanager/netwo=
rkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch)<br>
&gt; meta-networking.qa-patches:Malformed Upstream-Status &#39;Malformed Up=
stream-Status in patch<br>
&gt; meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networkin=
g/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-p=
pp-2.5.0-build.patch<br>
&gt; meta-networking.qa-patches-Please correct according to <a href=3D"http=
s://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-u=
pstream-status" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproj=
ect.org/contributor-guide/recipe-style-guide.html#patch-upstream-status</a>=
 :<br>
&gt; meta-networking.qa-patches-Upstream-Status: Accepted&#39; (/OE/layers/=
meta-openembedded/meta-networking/recipes-connectivity/networkmanager/netwo=
rkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch)<br>
&gt; --<br>
&gt; meta-networking.qa-patches:Malformed Upstream-Status &#39;Malformed Up=
stream-Status in patch<br>
&gt; meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networkin=
g/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.=
patch<br>
&gt; meta-networking.qa-patches-Please correct according to <a href=3D"http=
s://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-u=
pstream-status" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproj=
ect.org/contributor-guide/recipe-style-guide.html#patch-upstream-status</a>=
 :<br>
&gt; meta-networking.qa-patches-Upstream-Status: Accepted [<a href=3D"https=
://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f8685af=
b59d" rel=3D"noreferrer" target=3D"_blank">https://github.com/libesmtp/libE=
SMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d</a>]&#39; (/OE/layers/=
meta-openembedded/meta-networking/recipes-support/libesmtp/libesmtp/0001-Ad=
d-build-option-for-NTLM-support.patch)<br>
&gt; --<br>
&gt; meta-oe.qa-patches:Malformed Upstream-Status &#39;Malformed Upstream-S=
tatus in patch<br>
&gt; meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtoo=
ls/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char=
.patch<br>
&gt; meta-oe.qa-patches-Please correct according to <a href=3D"https://docs=
.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-=
status" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/=
contributor-guide/recipe-style-guide.html#patch-upstream-status</a> :<br>
&gt; meta-oe.qa-patches-Upstream-Status: Accepted [<a href=3D"https://githu=
b.com/pboettch/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e1=
68bb35e32" rel=3D"noreferrer" target=3D"_blank">https://github.com/pboettch=
/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32</a>]=
&#39; (/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-va=
lidator/json-schema-validator/0002-Fix-assumed-signed-char.patch)<br>
&gt; meta-oe.qa-patches:Malformed Upstream-Status &#39;Malformed Upstream-S=
tatus in patch<br>
&gt; meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtoo=
ls/json-schema-validator/json-schema-validator/0003-For-root-value-use-empt=
y-pointer.patch<br>
&gt; meta-oe.qa-patches-Please correct according to <a href=3D"https://docs=
.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-=
status" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/=
contributor-guide/recipe-style-guide.html#patch-upstream-status</a> :<br>
&gt; meta-oe.qa-patches-Upstream-Status: Accepted [<a href=3D"https://githu=
b.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c9=
1eddb4d1a" rel=3D"noreferrer" target=3D"_blank">https://github.com/pboettch=
/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a</a>]=
&#39; (/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-va=
lidator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch)<=
br>
&gt; --<br>
&gt; meta-python.qa-patches:Malformed Upstream-Status &#39;Malformed Upstre=
am-Status in patch<br>
&gt; meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipe=
s-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-l=
ength-fix-426-42.patch<br>
&gt; meta-python.qa-patches-Please correct according to <a href=3D"https://=
docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstr=
eam-status" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.=
org/contributor-guide/recipe-style-guide.html#patch-upstream-status</a> :<b=
r>
&gt; meta-python.qa-patches-Upstream-Status: Accepted&#39; (/OE/layers/meta=
-openembedded/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-=
Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch)<br>
&gt; meta-python.qa-patches:Malformed Upstream-Status &#39;Malformed Upstre=
am-Status in patch<br>
&gt; meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipe=
s-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch<br>
&gt; meta-python.qa-patches-Please correct according to <a href=3D"https://=
docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstr=
eam-status" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.=
org/contributor-guide/recipe-style-guide.html#patch-upstream-status</a> :<b=
r>
&gt; meta-python.qa-patches-Upstream-Status: Accepted&#39; (/OE/layers/meta=
-openembedded/meta-python/recipes-devtools/python/python3-pynetlinux/0002-F=
ixed-relative-imports.patch)<br>
&gt; --<br>
&gt; meta-webserver.qa-patches:Malformed Upstream-Status &#39;Malformed Ups=
tream-Status in patch<br>
&gt; meta-webserver.qa-patches-/OE/layers/meta-openembedded/meta-webserver/=
recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-di=
rectory-to-i.patch<br>
&gt; meta-webserver.qa-patches-Please correct according to <a href=3D"https=
://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-up=
stream-status" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproje=
ct.org/contributor-guide/recipe-style-guide.html#patch-upstream-status</a> =
:<br>
&gt; meta-webserver.qa-patches-Upstream-Status: Accepted [<a href=3D"https:=
//svn.apache.org/viewvc?view=3Drevision&amp;revision=3D1909241" rel=3D"nore=
ferrer" target=3D"_blank">https://svn.apache.org/viewvc?view=3Drevision&amp=
;revision=3D1909241</a>]&#39; (/OE/layers/meta-openembedded/meta-webserver/=
recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-di=
rectory-to-i.patch)<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0002-meson-fix-invalid-positional-argument.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch=C2=
=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch=C2=
=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../libesmtp/0001-Add-build-option-for-NTLM-support.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../json-schema-validator/0002-Fix-assumed-signed-char.patch=C2=
=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../0003-For-root-value-use-empty-pointer.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 ...1-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch =
| 2 +-<br>
&gt;=C2=A0 .../python/python3-pynetlinux/0002-Fixed-relative-imports.patch =
| 2 +-<br>
&gt;=C2=A0 ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch =
| 2 +-<br>
&gt;=C2=A0 9 files changed, 9 insertions(+), 9 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-m=
eson-fix-invalid-positional-argument.patch b/meta-gnome/recipes-gnome/gnome=
-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch<br>
&gt; index bd7e76f208..d921ff3308 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fi=
x-invalid-positional-argument.patch<br>
&gt; +++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fi=
x-invalid-positional-argument.patch<br>
&gt; @@ -3,7 +3,7 @@ From: Mae Dartmann &lt;<a href=3D"mailto:hello@maedart=
mann.name" target=3D"_blank">hello@maedartmann.name</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 16 Feb 2022 06:08:41 +0000<br>
&gt;=C2=A0 Subject: [PATCH] meson: fix invalid positional argument<br>
&gt;<br>
&gt; -Upstream-Status: Accepted [<a href=3D"https://gitlab.gnome.org/GNOME/=
gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gnome-tweaks/-/com=
mit/dc9701e18775c01d0b69fabaa350147f70096da8</a>]<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gnome-tweaks/-/com=
mit/dc9701e18775c01d0b69fabaa350147f70096da8</a>]<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0data/meson.build | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; diff --git a/meta-networking/recipes-connectivity/networkmanager/netwo=
rkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch b/meta-networking/reci=
pes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5=
.0-build.patch<br>
&gt; index 0a568fa23c..2e84a334f0 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0001-fix-ppp-2.5.0-build.patch<br>
&gt; +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0001-fix-ppp-2.5.0-build.patch<br>
&gt; @@ -7,7 +7,7 @@ MIME-Version: 1.0<br>
&gt;=C2=A0 Content-Type: text/plain; charset=3DUTF-8<br>
&gt;=C2=A0 Content-Transfer-Encoding: 8bit<br>
&gt;<br>
&gt; -Upstream-Status: Accepted<br>
&gt; +Upstream-Status: Backport<br>
&gt;=C2=A0 Signed-off-by: Eivind N=C3=A6ss &lt;<a href=3D"mailto:eivnaes@ya=
hoo.com" target=3D"_blank">eivnaes@yahoo.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 5 +-<br>
&gt; diff --git a/meta-networking/recipes-connectivity/networkmanager/netwo=
rkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch b/meta-networking/reci=
pes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5=
.0-build.patch<br>
&gt; index 798a57b0da..6ac8f2b643 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0002-fix-ppp-2.5.0-build.patch<br>
&gt; +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0002-fix-ppp-2.5.0-build.patch<br>
&gt; @@ -6,7 +6,7 @@ MIME-Version: 1.0<br>
&gt;=C2=A0 Content-Type: text/plain; charset=3DUTF-8<br>
&gt;=C2=A0 Content-Transfer-Encoding: 8bit<br>
&gt;<br>
&gt; -Upstream-Status: Accepted<br>
&gt; +Upstream-Status: Backport<br>
&gt;=C2=A0 Signed-off-by: Eivind N=C3=A6ss &lt;<a href=3D"mailto:eivnaes@ya=
hoo.com" target=3D"_blank">eivnaes@yahoo.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> | 6 +-----<br>
&gt; diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Ad=
d-build-option-for-NTLM-support.patch b/meta-networking/recipes-support/lib=
esmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch<br>
&gt; index 64938a4820..dbdd644830 100644<br>
&gt; --- a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build=
-option-for-NTLM-support.patch<br>
&gt; +++ b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build=
-option-for-NTLM-support.patch<br>
&gt; @@ -11,7 +11,7 @@ disabled by default.<br>
&gt;=C2=A0 Like 1.0.6, it will check openssl MD4 algorithm support as MD4 i=
s<br>
&gt;=C2=A0 insecure and modern systems may drop MD4 support.<br>
&gt;<br>
&gt; -Upstream-Status: Accepted [<a href=3D"https://github.com/libesmtp/lib=
ESMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/libesmtp/libESMTP/commit/1c304e7886a08f=
b56485e41614ff3f8685afb59d</a>]<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libesmtp/lib=
ESMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/libesmtp/libESMTP/commit/1c304e7886a08f=
b56485e41614ff3f8685afb59d</a>]<br>
&gt;=C2=A0 Signed-off-by: Jiaqing Zhao &lt;<a href=3D"mailto:jiaqing.zhao@i=
ntel.com" target=3D"_blank">jiaqing.zhao@intel.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++++++++---<b=
r>
&gt; diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schem=
a-validator/0002-Fix-assumed-signed-char.patch b/meta-oe/recipes-devtools/j=
son-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.pat=
ch<br>
&gt; index 2ee0a39126..1c4b871bb6 100644<br>
&gt; --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-valid=
ator/0002-Fix-assumed-signed-char.patch<br>
&gt; +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-valid=
ator/0002-Fix-assumed-signed-char.patch<br>
&gt; @@ -11,7 +11,7 @@ GCC treats char as unsigned resulting in compile err=
ors:<br>
&gt;<br>
&gt;=C2=A0 Fix this by specifying signed char.<br>
&gt;<br>
&gt; -Upstream-Status: Accepted [<a href=3D"https://github.com/pboettch/jso=
n-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/pboettch/json-schema-valid=
ator/commit/491ac44026e08f31790f5cacffa62e168bb35e32</a>]<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/pboettch/jso=
n-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/pboettch/json-schema-valid=
ator/commit/491ac44026e08f31790f5cacffa62e168bb35e32</a>]<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Parian Golchin &lt;<a href=3D"mailto:Parian.Golch=
in@iris-sensing.com" target=3D"_blank">Parian.Golchin@iris-sensing.com</a>&=
gt;<br>
&gt;=C2=A0 ---<br>
&gt; diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schem=
a-validator/0003-For-root-value-use-empty-pointer.patch b/meta-oe/recipes-d=
evtools/json-schema-validator/json-schema-validator/0003-For-root-value-use=
-empty-pointer.patch<br>
&gt; index e0d0cf8ce9..eac997ae58 100644<br>
&gt; --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-valid=
ator/0003-For-root-value-use-empty-pointer.patch<br>
&gt; +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-valid=
ator/0003-For-root-value-use-empty-pointer.patch<br>
&gt; @@ -3,7 +3,7 @@ From: Sven Fink &lt;<a href=3D"mailto:sven.fink@wipote=
c.com" target=3D"_blank">sven.fink@wipotec.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 13 Jan 2023 09:15:42 +0100<br>
&gt;=C2=A0 Subject: [PATCH 3/3] For root value, use empty pointer<br>
&gt;<br>
&gt; -Upstream-Status: Accepted [<a href=3D"https://github.com/pboettch/jso=
n-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/pboettch/json-schema-valid=
ator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a</a>]<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/pboettch/jso=
n-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/pboettch/json-schema-valid=
ator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a</a>]<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Parian Golchin &lt;<a href=3D"mailto:Parian.Golch=
in@iris-sensing.com" target=3D"_blank">Parian.Golchin@iris-sensing.com</a>&=
gt;<br>
&gt;=C2=A0 ---<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-pybluez/0001-=
Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch b/meta-python/re=
cipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buff=
er-length-fix-426-42.patch<br>
&gt; index 9126aba8d3..4d54a2e943 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_=
ssize_t-when-parsing-buffer-length-fix-426-42.patch<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_=
ssize_t-when-parsing-buffer-length-fix-426-42.patch<br>
&gt; @@ -20,7 +20,7 @@ From python 3.8 changes:<br>
&gt;<br>
&gt;=C2=A0 Fixes <a href=3D"https://github.com/pybluez/pybluez/issues/426" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/pybluez/pybluez/iss=
ues/426</a><br>
&gt;=C2=A0 ---<br>
&gt; -Upstream-Status: Accepted<br>
&gt; +Upstream-Status: Backport<br>
&gt;<br>
&gt;=C2=A0 =C2=A0bluez/btmodule.c | 23 ++++++++++++++---------<br>
&gt;=C2=A0 =C2=A0msbt/_msbt.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++--<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux/00=
02-Fixed-relative-imports.patch b/meta-python/recipes-devtools/python/pytho=
n3-pynetlinux/0002-Fixed-relative-imports.patch<br>
&gt; index 9b5d9d6364..ee7cea8108 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixe=
d-relative-imports.patch<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixe=
d-relative-imports.patch<br>
&gt; @@ -6,7 +6,7 @@ Subject: [PATCH] Fixed relative imports<br>
&gt;=C2=A0 Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz=
.golaszewski@linaro.org" target=3D"_blank">bartosz.golaszewski@linaro.org</=
a>&gt;<br>
&gt;<br>
&gt;=C2=A0 ---<br>
&gt; -Upstream-Status: Accepted<br>
&gt; +Upstream-Status: Backport<br>
&gt;<br>
&gt;=C2=A0 =C2=A0pynetlinux/__init__.py | 8 ++++----<br>
&gt;=C2=A0 =C2=A0pynetlinux/brctl.py=C2=A0 =C2=A0 | 2 +-<br>
&gt; diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules=
-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipe=
s-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-director=
y-to-i.patch<br>
&gt; index 996eabf586..9accbf18a1 100644<br>
&gt; --- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mapper=
s-config9.m4-Add-server-directory-to-i.patch<br>
&gt; +++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mapper=
s-config9.m4-Add-server-directory-to-i.patch<br>
&gt; @@ -4,7 +4,7 @@ Date: Tue, 18 Apr 2023 15:38:53 +0200<br>
&gt;=C2=A0 Subject: [PATCH] * modules/mappers/config9.m4: Add &#39;server&#=
39; directory to<br>
&gt;=C2=A0 =C2=A0include path if mod_rewrite is enabled.<br>
&gt;<br>
&gt; -Upstream-Status: Accepted [<a href=3D"https://svn.apache.org/viewvc?v=
iew=3Drevision&amp;revision=3D1909241" rel=3D"noreferrer" target=3D"_blank"=
>https://svn.apache.org/viewvc?view=3Drevision&amp;revision=3D1909241</a>]<=
br>
&gt; +Upstream-Status: Backport [<a href=3D"https://svn.apache.org/viewvc?v=
iew=3Drevision&amp;revision=3D1909241" rel=3D"noreferrer" target=3D"_blank"=
>https://svn.apache.org/viewvc?view=3Drevision&amp;revision=3D1909241</a>]<=
br>
&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0modules/mappers/config9.m4 | 5 +++++<br>
&gt; --<br>
&gt; 2.42.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#105186): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105186" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/105186</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10161470=
3/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101614703/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000004badf406065ccff0--

