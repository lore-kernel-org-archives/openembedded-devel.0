Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8BAC433FE
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:14:37 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.10626.1653405273724918777
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 08:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dYZhg9C9;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id p63so1033746qkf.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7i6oMiixufqPamnk8oROJ4n3A3BVxLHmIrnkhHmRnQc=;
        b=dYZhg9C93brZy6Rtqd3bbgv+0pqZHFt0NBtCpbMq/OLVmhZp55kgxWDNOrBhBuspya
         qHhSCvJIEPS2rzXapCr/PF5Hstb7v1OmW9RIVXp5ej0Ef5SpBxK0/sDl9AJt27f+4cph
         GJCjmZDCEs7IqhX+bqQZqHofq1YFi1/byuEZ89LKHeA0Nr5UPDjLro/zbxeyJS7Yb8ai
         VgG2EcPUSTvJ/lrKoOG/HuMHooWAlULZ3WqdRdcYGbmVLEmdFLs2q2Q22zz2cIomxzyu
         JjN76ntCZQMQqYU31MfxTk0mJC4QRnBI9++4JNPfXh14vmci+ymj5XgFPF4rmXg1cnTL
         4rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7i6oMiixufqPamnk8oROJ4n3A3BVxLHmIrnkhHmRnQc=;
        b=Xrt4+66BqGUVznxUJDHuDaYETLmonlR3x0Vw9R6wvwNyl/DqxFtCGMLJDsx5CDvW4q
         YHaj/b/dR+TrGaVNyI7OIJWo3MAIiaBO2O0lb/VxT10ZxEPOJaSSCnyIR37iRAV7vrlD
         DvTAtj9mKqZji1qA3UklPgcgtZaFD5sJR+v+fHsb1KtWiF8cuYt13+qUpr4yLRJift3x
         Unp6XnkMpNzdIARZkC74fYb0m72gnSC6hxWUrTWHkont9UVwSrkA1uSTRn0KSsPOvhrc
         dBgUQvOGGQRXWoiTuFFz1yrrdYK9j6dWkm25K0DtbfQHwyaElfF4xvcI9t0LOskELoBB
         Wk8w==
X-Gm-Message-State: AOAM531DgyVvAyJMMnkIzLGi5qySdSnjoeW+hT6DMtRnkS84kdKjwILX
	Vl1KWfvs2wx+kJoabrGsWXVLlpr9/X5iiV1Q8bqumODqNuM=
X-Google-Smtp-Source: 
 ABdhPJznWVb6m6Ca5mc6kmTWtZr3n6G4IF6NJcy9MlihxMyhqECR50bBFQFacDDkJQuIgHQIwMBKxqDM8jDOHRQHdPY=
X-Received: by 2002:a05:620a:1712:b0:6a3:abba:697a with SMTP id
 az18-20020a05620a171200b006a3abba697amr4737215qkb.149.1653405272589; Tue, 24
 May 2022 08:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220523182203.8969-1-raj.khem@gmail.com>
 <PA4PR08MB7411054B66EE67A29DC76157E8D79@PA4PR08MB7411.eurprd08.prod.outlook.com>
In-Reply-To: 
 <PA4PR08MB7411054B66EE67A29DC76157E8D79@PA4PR08MB7411.eurprd08.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 May 2022 08:14:06 -0700
Message-ID: 
 <CAMKF1srfSLXXhuAwtyD2EpoCnqu1j+96UAza=UvFiqxwsO+4Jg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-traitlets: Upgrade to 5.2.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 15:14:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97250

On Tue, May 24, 2022 at 3:25 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> I have genuinely no idea how this builds: the recipe says to use setuptoo=
ls_build_meta but 5.2.1 deletes all the setuptools files and has ported to =
a new build system called hatchling.
>
>
>
> Maybe setuptools_build_meta infers a lot and it sort of works, but this i=
s not the correct fix.  I have a branch locally which is almost complete to=
 add hatchling (and it=E2=80=99s dependencies) so this can be built properl=
y.
>

yeah hatching would be an improvement for sure. I was just trying to
bring it back to where it was. I will wait for your fix

>
>
> Ross
>
>
>
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> on behalf of Khem Raj via lists.openembedded.org <raj.kh=
em=3Dgmail.com@lists.openembedded.org>
> Date: Monday, 23 May 2022 at 19:22
> To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org>
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-python][PATCH] python3-traitlets: Upgrade to 5.2.1
>
> Fix build with latest setuptools while here.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../dynamic_description.patch                 | 36 +++++++++++++++++++
>  ...ts_5.2.0.bb =3D> python3-traitlets_5.2.1.bb} |  3 +-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-traitlets=
/dynamic_description.patch
>  rename meta-python/recipes-devtools/python/{python3-traitlets_5.2.0.bb =
=3D> python3-traitlets_5.2.1.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-traitlets/dynami=
c_description.patch b/meta-python/recipes-devtools/python/python3-traitlets=
/dynamic_description.patch
> new file mode 100644
> index 0000000000..6d8e4b1f50
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-traitlets/dynamic_descr=
iption.patch
> @@ -0,0 +1,36 @@
> +New setuptools turns on autodiscovery of modules which ends up in funny =
errors like
> +
> +error: Multiple top-level packages discovered in a flat-layout: ['patche=
s', 'traitlets'].
> +
> +To avoid accidental inclusion of unwanted files or directories,
> +setuptools will not proceed with this build.
> +
> +
> +this is becasue patches/ folder is created by quilt. Secondly, define de=
scription and version
> +statically since new setuptools complain about it.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -4,6 +4,8 @@ build-backend =3D "hatchling.build"
> +
> + [project]
> + name =3D "traitlets"
> ++version =3D "5.2.1"
> ++description =3D "A lightweight Traits like module"
> + authors =3D [{name =3D "IPython Development Team", email =3D "ipython-d=
ev@python.org"}]
> + license =3D {file =3D "COPYING.md"}
> + readme =3D "README.md"
> +@@ -18,7 +20,9 @@ classifiers =3D [
> + ]
> + urls =3D {Homepage =3D "https://github.com/ipython/traitlets"}
> + requires-python =3D ">=3D3.7"
> +-dynamic =3D ["description", "version"]
> ++
> ++[tool.setuptools]
> ++py-modules =3D []
> +
> + [project.optional-dependencies]
> + test =3D ["pytest", "pre-commit"]
> diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.=
bb b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-traitlets_5.2.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
> index 56ebaac675..588bddbd74 100644
> --- a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3D9c125dfc5ff=
5364d40b5f56f02cd9de3"
>
>  PYPI_PACKAGE =3D "traitlets"
>
> -SRC_URI[sha256sum] =3D "60474f39bf1d39a11e0233090b99af3acee93bbc2281777e=
61dd8c87da8a0014"
> +SRC_URI +=3D "file://dynamic_description.patch"
> +SRC_URI[sha256sum] =3D "a415578cde1985f1b773faefe49e9f078d345f38665ce3e9=
e914ec7b41150ce9"
>
>  RDEPENDS:${PN} =3D "\
>      ${PYTHON_PN}-ipython-genutils \
> --
> 2.36.1
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.

