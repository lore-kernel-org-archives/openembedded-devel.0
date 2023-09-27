Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85766E82CC7
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 19:10:47 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.26081.1695841845458997752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 12:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HD/5Wnff;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so6405877fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 12:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695841845; x=1696446645; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CzYCegdwK+Avv0Xss9WXund6QmFw+hcMeSII2EBz6M=;
        b=HD/5WnffSDnD58nHZhD574RS7uWt+3Pj3M2OXbbzqjn8gh0lkaUF0T6l4R6fcdvrL3
         2iE3Ly8QHG7118ASxdlSgcmwOd5GblaRe+CplpHLIJfPlD/n81Er2Wr6cuLt1YdclhLE
         Ql11n9raMLyoAQeqHh+aCoPP4K46C3Bdq3k7cN5i5rhZMskzh+jxkeTNdyOY4Gr8Vu3/
         osY+pbXxAUAlldjMu4kSZpY8FlCWbtg+mVdTgtTCmjRi/bytUV4xvtbI1AlrqPhG5EYv
         n3tv8h7cfLHLnlcUyxjolw9b3edRk9ryyTMN7WB0YGlD8aFIVE3uKJdmFOMv4rV1/SWG
         2ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695841845; x=1696446645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CzYCegdwK+Avv0Xss9WXund6QmFw+hcMeSII2EBz6M=;
        b=BOZl9vWZumLkZS0boCDljWzrG7eXd/6DX/l2dFzdFc0zQGPdH3gfW2DjJBjTHKVoM8
         yA970HMpBaewfhXRh2O8Hb8c9FHK5vCSVQrQCnZMPuE1EUyqYWDErb/3Xonr4Fk1bWw7
         KlxJmRGN7MFEPr9EWHOHx52oGwHYKZHIaIqaKhLj+9r7mR6nTrpKTnoZphcv7v1RRtcn
         mv8asRd74MxqOOl8UBBi9WzpKw63ZD5EVHjSjVIsQZ5BKyyLITGPYg5IQZF0GdaKQpo9
         XTz/Nexm0wlWocKE9B0V84aBhHZpLeSxFwhZJh6lq4BFhzraq9nBdh4ULNgBt43p2nrd
         xYcQ==
X-Gm-Message-State: AOJu0Yydlmp1kOn2gmEHSuSNgX5+eSQFVSyC7G8rg8iVzoUG+WYrn141
	W/epCOcc4z5MrzvpxcIR3Phr4SNflyRTr2Ndjns=
X-Google-Smtp-Source: AGHT+IGweuL58V/FEpB6UOEGRICBftvxq80LXVL1sN3Hx/x489VRZ277C+0ZLNkF1NdqTBlqDTeRpe0bwcWfjHkq0ZA=
X-Received: by 2002:a05:6870:79e:b0:1bf:787c:411b with SMTP id
 en30-20020a056870079e00b001bf787c411bmr3370790oab.10.1695841844348; Wed, 27
 Sep 2023 12:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230927104920.2052173-1-martin.jansa@gmail.com>
In-Reply-To: <20230927104920.2052173-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2023 12:10:18 -0700
Message-ID: <CAMKF1soQ+34Je2k3t52iNFmF18Q0HMYAnPGjin9egBejv3b6tg@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 19:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105196

can you rebase it on master-next

On Wed, Sep 27, 2023 at 3:49=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> * Accepted was replaced with Backport in gatesgarth:
>   https://docs.yoctoproject.org/migration-guides/migration-3.2.html#misce=
llaneous-changes
>
> * as detected with oe-core/scripts/contrib/patchreview.py:
>
> meta-openembedded $ grep -A 3 Malformed *qa-patches
> meta-gnome.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Statu=
s in patch
> meta-gnome.qa-patches-/OE/layers/meta-openembedded/meta-gnome/recipes-gno=
me/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.pat=
ch
> meta-gnome.qa-patches-Please correct according to https://docs.yoctoproje=
ct.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
> meta-gnome.qa-patches-Upstream-Status: Accepted [https://gitlab.gnome.org=
/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]' (/O=
E/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-tweaks/gnome-twea=
ks/0002-meson-fix-invalid-positional-argument.patch)
> --
> meta-networking.qa-patches:Malformed Upstream-Status 'Malformed Upstream-=
Status in patch
> meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networking/r=
ecipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-=
2.5.0-build.patch
> meta-networking.qa-patches-Please correct according to https://docs.yocto=
project.org/contributor-guide/recipe-style-guide.html#patch-upstream-status=
 :
> meta-networking.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-op=
enembedded/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0001-fix-ppp-2.5.0-build.patch)
> meta-networking.qa-patches:Malformed Upstream-Status 'Malformed Upstream-=
Status in patch
> meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networking/r=
ecipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-=
2.5.0-build.patch
> meta-networking.qa-patches-Please correct according to https://docs.yocto=
project.org/contributor-guide/recipe-style-guide.html#patch-upstream-status=
 :
> meta-networking.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-op=
enembedded/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er-fortisslvpn/0002-fix-ppp-2.5.0-build.patch)
> --
> meta-networking.qa-patches:Malformed Upstream-Status 'Malformed Upstream-=
Status in patch
> meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networking/r=
ecipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.pat=
ch
> meta-networking.qa-patches-Please correct according to https://docs.yocto=
project.org/contributor-guide/recipe-style-guide.html#patch-upstream-status=
 :
> meta-networking.qa-patches-Upstream-Status: Accepted [https://github.com/=
libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d]' (/OE/la=
yers/meta-openembedded/meta-networking/recipes-support/libesmtp/libesmtp/00=
01-Add-build-option-for-NTLM-support.patch)
> --
> meta-oe.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status i=
n patch
> meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtools/=
json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.pa=
tch
> meta-oe.qa-patches-Please correct according to https://docs.yoctoproject.=
org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
> meta-oe.qa-patches-Upstream-Status: Accepted [https://github.com/pboettch=
/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]' (/=
OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-validator/=
json-schema-validator/0002-Fix-assumed-signed-char.patch)
> meta-oe.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status i=
n patch
> meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtools/=
json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-p=
ointer.patch
> meta-oe.qa-patches-Please correct according to https://docs.yoctoproject.=
org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
> meta-oe.qa-patches-Upstream-Status: Accepted [https://github.com/pboettch=
/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]' (/=
OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-validator/=
json-schema-validator/0003-For-root-value-use-empty-pointer.patch)
> --
> meta-python.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Stat=
us in patch
> meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipes-d=
evtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-leng=
th-fix-426-42.patch
> meta-python.qa-patches-Please correct according to https://docs.yoctoproj=
ect.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
> meta-python.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-openem=
bedded/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssiz=
e_t-when-parsing-buffer-length-fix-426-42.patch)
> meta-python.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Stat=
us in patch
> meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipes-d=
evtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
> meta-python.qa-patches-Please correct according to https://docs.yoctoproj=
ect.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
> meta-python.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-openem=
bedded/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-re=
lative-imports.patch)
> --
> meta-webserver.qa-patches:Malformed Upstream-Status 'Malformed Upstream-S=
tatus in patch
> meta-webserver.qa-patches-/OE/layers/meta-openembedded/meta-webserver/rec=
ipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-direc=
tory-to-i.patch
> meta-webserver.qa-patches-Please correct according to https://docs.yoctop=
roject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status =
:
> meta-webserver.qa-patches-Upstream-Status: Accepted [https://svn.apache.o=
rg/viewvc?view=3Drevision&revision=3D1909241]' (/OE/layers/meta-openembedde=
d/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9=
.m4-Add-server-directory-to-i.patch)
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../0002-meson-fix-invalid-positional-argument.patch            | 2 +-
>  .../networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch   | 2 +-
>  .../networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch   | 2 +-
>  .../libesmtp/0001-Add-build-option-for-NTLM-support.patch       | 2 +-
>  .../json-schema-validator/0002-Fix-assumed-signed-char.patch    | 2 +-
>  .../0003-For-root-value-use-empty-pointer.patch                 | 2 +-
>  ...1-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch | 2 +-
>  .../python/python3-pynetlinux/0002-Fixed-relative-imports.patch | 2 +-
>  ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meso=
n-fix-invalid-positional-argument.patch b/meta-gnome/recipes-gnome/gnome-tw=
eaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
> index bd7e76f208..d921ff3308 100644
> --- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-i=
nvalid-positional-argument.patch
> +++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-i=
nvalid-positional-argument.patch
> @@ -3,7 +3,7 @@ From: Mae Dartmann <hello@maedartmann.name>
>  Date: Wed, 16 Feb 2022 06:08:41 +0000
>  Subject: [PATCH] meson: fix invalid positional argument
>
> -Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gnome-tweaks/-=
/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-tweaks/-=
/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
>  ---
>   data/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch b/meta-networking/recipes=
-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-=
build.patch
> index 0a568fa23c..2e84a334f0 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
fortisslvpn/0001-fix-ppp-2.5.0-build.patch
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
fortisslvpn/0001-fix-ppp-2.5.0-build.patch
> @@ -7,7 +7,7 @@ MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
>
> -Upstream-Status: Accepted
> +Upstream-Status: Backport
>  Signed-off-by: Eivind N=C3=A6ss <eivnaes@yahoo.com>
>  ---
>   Makefile.am                                   |  5 +-
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch b/meta-networking/recipes=
-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-=
build.patch
> index 798a57b0da..6ac8f2b643 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
fortisslvpn/0002-fix-ppp-2.5.0-build.patch
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
fortisslvpn/0002-fix-ppp-2.5.0-build.patch
> @@ -6,7 +6,7 @@ MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
>
> -Upstream-Status: Accepted
> +Upstream-Status: Backport
>  Signed-off-by: Eivind N=C3=A6ss <eivnaes@yahoo.com>
>  ---
>   configure.ac | 6 +-----
> diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-b=
uild-option-for-NTLM-support.patch b/meta-networking/recipes-support/libesm=
tp/libesmtp/0001-Add-build-option-for-NTLM-support.patch
> index 64938a4820..dbdd644830 100644
> --- a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-op=
tion-for-NTLM-support.patch
> +++ b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-op=
tion-for-NTLM-support.patch
> @@ -11,7 +11,7 @@ disabled by default.
>  Like 1.0.6, it will check openssl MD4 algorithm support as MD4 is
>  insecure and modern systems may drop MD4 support.
>
> -Upstream-Status: Accepted [https://github.com/libesmtp/libESMTP/commit/1=
c304e7886a08fb56485e41614ff3f8685afb59d]
> +Upstream-Status: Backport [https://github.com/libesmtp/libESMTP/commit/1=
c304e7886a08fb56485e41614ff3f8685afb59d]
>  Signed-off-by: Jiaqing Zhao <jiaqing.zhao@intel.com>
>  ---
>   meson.build       | 13 ++++++++++---
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-v=
alidator/0002-Fix-assumed-signed-char.patch b/meta-oe/recipes-devtools/json=
-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
> index 2ee0a39126..1c4b871bb6 100644
> --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validato=
r/0002-Fix-assumed-signed-char.patch
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validato=
r/0002-Fix-assumed-signed-char.patch
> @@ -11,7 +11,7 @@ GCC treats char as unsigned resulting in compile errors=
:
>
>  Fix this by specifying signed char.
>
> -Upstream-Status: Accepted [https://github.com/pboettch/json-schema-valid=
ator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
> +Upstream-Status: Backport [https://github.com/pboettch/json-schema-valid=
ator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
>
>  Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
>  ---
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-v=
alidator/0003-For-root-value-use-empty-pointer.patch b/meta-oe/recipes-devt=
ools/json-schema-validator/json-schema-validator/0003-For-root-value-use-em=
pty-pointer.patch
> index e0d0cf8ce9..eac997ae58 100644
> --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validato=
r/0003-For-root-value-use-empty-pointer.patch
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validato=
r/0003-For-root-value-use-empty-pointer.patch
> @@ -3,7 +3,7 @@ From: Sven Fink <sven.fink@wipotec.com>
>  Date: Fri, 13 Jan 2023 09:15:42 +0100
>  Subject: [PATCH 3/3] For root value, use empty pointer
>
> -Upstream-Status: Accepted [https://github.com/pboettch/json-schema-valid=
ator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
> +Upstream-Status: Backport [https://github.com/pboettch/json-schema-valid=
ator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
>
>  Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
>  ---
> diff --git a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use=
-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch b/meta-python/recip=
es-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-=
length-fix-426-42.patch
> index 9126aba8d3..4d54a2e943 100644
> --- a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssi=
ze_t-when-parsing-buffer-length-fix-426-42.patch
> +++ b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssi=
ze_t-when-parsing-buffer-length-fix-426-42.patch
> @@ -20,7 +20,7 @@ From python 3.8 changes:
>
>  Fixes https://github.com/pybluez/pybluez/issues/426
>  ---
> -Upstream-Status: Accepted
> +Upstream-Status: Backport
>
>   bluez/btmodule.c | 23 ++++++++++++++---------
>   msbt/_msbt.c     |  6 ++++--
> diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-=
Fixed-relative-imports.patch b/meta-python/recipes-devtools/python/python3-=
pynetlinux/0002-Fixed-relative-imports.patch
> index 9b5d9d6364..ee7cea8108 100644
> --- a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-r=
elative-imports.patch
> +++ b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-r=
elative-imports.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] Fixed relative imports
>  Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>  ---
> -Upstream-Status: Accepted
> +Upstream-Status: Backport
>
>   pynetlinux/__init__.py | 8 ++++----
>   pynetlinux/brctl.py    | 2 +-
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-ma=
ppers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-h=
ttpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-t=
o-i.patch
> index 996eabf586..9accbf18a1 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-c=
onfig9.m4-Add-server-directory-to-i.patch
> +++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-c=
onfig9.m4-Add-server-directory-to-i.patch
> @@ -4,7 +4,7 @@ Date: Tue, 18 Apr 2023 15:38:53 +0200
>  Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
>   include path if mod_rewrite is enabled.
>
> -Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=3Drevision=
&revision=3D1909241]
> +Upstream-Status: Backport [https://svn.apache.org/viewvc?view=3Drevision=
&revision=3D1909241]
>
>  ---
>   modules/mappers/config9.m4 | 5 +++++
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105186): https://lists.openembedded.org/g/openembedde=
d-devel/message/105186
> Mute This Topic: https://lists.openembedded.org/mt/101614703/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

