Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5FDCA9EBB
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 21:43:45 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6517.1791582215970548593
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 14:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k+Alr6wc;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ab43af5e97so1141197b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 14:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791582215; cv=none;
        d=google.com; s=arc-20260327;
        b=pv+YNm0s4G9nGdF0/h1nUva8QsWa19wUo4SuEyVWbPSuJsRanizvx5zpCssUksxqKZ
         kEGqC43KOUhp+m9ezjvVmOMH+gAwp2j1lJWY4qwXT62PJyY4NlVvQqq6GJStCm/u9bE9
         hup09rvzEGpKISqD9OgINwsMs9cT4aqusAeg4EcV1p3jqBVTkbhrTJJKI5CUnJxdHWDY
         wDFSjfqMbMxlspbfGdbr20SwhwD2b80EASaxtm+X8I/4LAK+j3qfcJoCqKXxOT+7+MmZ
         W0NwYpNysT2gdrt0vQEo9syGjbXNlBm4xFp2TxN5Qb2Y8hlKQcwjMkO9ousLxSGH8FMG
         9Zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+eZDJZHX+kz8OxJViGOWDC6ehuLiAIa3zOP0cZ08OXM=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=X0CCnfuMxNwMU6sGw5vu6/GLf2Gal9bj8hhV9yu7f1aiDWUfZaB71d44FLIkR4OcUL
         lvutlLZz5fjQCyGSY1KG39I0F9ucgoYVtRcXT/IpbNK/EZ4PUIVD/e0lboChZkS3gFGi
         fPvMq9pIWbwuT3bf0IKKXc7cB2QvmiOIR/YcEK1efZTD18P+jxW0jIp4tqk+C/QaTqH3
         YSlSiUZbComcqklxmUrrqUnDtPHHfgjV8EFmpG8T8EiVf/hC51GWSnG7pKU6tvie2uuN
         iHR3+n6Y6fHhIdHeQEhZixdo1mD3Xo9qyP93Uv9vK0ZlX6A3Q8lUuPUVmArZktU9EIPF
         bPwQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791582215; x=1792187015; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eZDJZHX+kz8OxJViGOWDC6ehuLiAIa3zOP0cZ08OXM=;
        b=k+Alr6wcdm8TApULxqQbeKPk2TUDEwuSkCd86qsfNZE59N0FxsGYkBokWS6pllRvth
         DH0iAx6ucPzwG/vl3pdb7ShCg1f4ahGUyoMsOHHDKEjJRqY9nXrWSMGHWpQ1TI1z2Nce
         DxC6v1WS4DtngfUNe3aNwKc/GnIOV02PZgJdoUlcjNxgd5Y0cfzGp4KUzbZ5ve8d8ei8
         cL0Ry+jkgKxuc0TYNctOXv4tAoVajTnb8CXb0SyZJjKw0qvosTyVwrn/BrlCVRqQL03D
         VH5MYZCUouCkav8w01kOTGJDpGtQ09v8XRStNI4uqE+h0rv4nG8bg4rCLeYOwAdTA1GO
         ixqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582215; x=1792187015;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+eZDJZHX+kz8OxJViGOWDC6ehuLiAIa3zOP0cZ08OXM=;
        b=sen5tdv/drIz5Mx1n52Uzit5JKiQsXjS/QzGr7B/bQ3ImgseNi0ieNIusxdMjBfy9P
         RjS9eQU7Cz20VrTsBsjvHQbtWntzol0Ef8olC2siLVdUEP+7J/k1H0VkP8ccmKojaIs9
         WSRgLrbKuQmzCIiVSqjlexoQGSUIRLA7WLwfj1Bk26xhum/tlpwHfnJeudhF47fmJWxx
         bi4NdiuxLqfDdd1jW8oi7KD5lq1dKhNdrIpl9yDNNTXh1eFCOvvAn4rBM4hBsk6ggFeR
         Gb8tWpjTsWo9pUNYfPjBscyIyPRFMqU10yw2YoE35cjbOTi4rab7TesKdR7POZbYXuw+
         Ks9g==
X-Gm-Message-State: AFq9FYJw8oKzglVDYoISN1V+9h7QgvwOXQio0h89I32mNG4dbBlVXzEt
	MOzqEp0HcR5W4JVdH151SUuFFJXj+Vrvl3CIo3yTV4SWqpPrw3NuJVnXR5uD96EkqcPLYqbW3D8
	7+6OFvf0pXj+VhZgkAmnIAtyQb2+Cato=
X-Gm-Gg: AYBFou37r0NvzJ+e7Pv8tgUcRDl5hz8WZ8vuKlXva4UOsOtbpERdRRh0Gjq9DQXVS+2
	4inMWUcLBJjNlYmRdh92jTvGJGOsZEeHH4/VJKqas0wp9qgs4dEqtKXB1Ou4ma89eFqdiGQhcpD
	XyfNCmHrfxSWtkFfPopnL2wm+t257R9EqHXukutw4zqJKyGQdk265EPriXKJDtN1NgRvzzMAYaj
	JbQAJOoZLxB5pZdCrxyzv38G7Kdwr4IY/HdWTx9/4pghL51vAm9YfeMZtjRDFtdE5vxU+HWPQS8
	QNnxQxUqGPi0fJMHxIK3GLcXwVkIyU9Jt4fCIAWharCFAMGRz4aXyjsUDjkcK4H7ymFze+eilG3
	LqNSTpDDpUB+SQRReHcCaDP55RuTaZQmHGbwKIsmPWZwHP+lXBm8E1lTzQnwKU5U0GoAiJFojC6
	FBzK0LXY4+D9KM1kISm/g0oueLsm44MlsaPlo6GqXt3Yac11qJm952wcH4oOq7NyxvaaDyc26hw
	ptsno6sAMegK17Cr/cSVSH6V+vI8sGbjy2VmmJcTI10bWt+1fnthFgNwzabbIrcHwReq6P1CocO
	3kJluJE=
X-Received: by 2002:a05:690c:6e81:b0:8ad:7131:9178 with SMTP id
 00721157ae682-8b07d3bee19mr10719517b3.12.1791582214758; Fri, 09 Oct 2026
 14:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261009214017.2589019-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20261009214017.2589019-1-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Oct 2026 14:43:06 -0700
X-Gm-Features: AclHuK-iRRMRNdLVJwDveYCpH72psdO2bDRpSz6LfxEHYKXhGJuaLNGlbxDZblE
Message-ID: <CAMKF1spdfPZ7B8okWv8soJ70RvCA=X=z-vJnRNbtGr6cOpS+QQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][blacksail][PATCH] readme: update maintainer
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007f2961065d6f3d73"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 21:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130711

--0000000000007f2961065d6f3d73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM

On Fri, Oct 9, 2026 at 2:40=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  README.md                  |  2 +-
>  meta-filesystems/README.md | 10 +++++-----
>  meta-gnome/README.md       | 10 +++++-----
>  meta-initramfs/README.md   |  8 ++++----
>  meta-multimedia/README.md  | 10 +++++-----
>  meta-networking/README.md  |  8 ++++----
>  meta-oe/README.md          |  8 ++++----
>  meta-perl/README.md        | 10 ++++------
>  meta-python/README.md      | 12 +++++-------
>  meta-webserver/README.md   | 10 +++++-----
>  meta-xfce/README.md        | 11 +++++------
>  11 files changed, 47 insertions(+), 52 deletions(-)
>
> diff --git a/README.md b/README.md
> index 9fc30bda95..f445aed152 100644
> --- a/README.md
> +++ b/README.md
> @@ -1,6 +1,6 @@
>  Collection of layers for the OE-core universe
>
> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Main layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
>  This repository is a collection of layers to supplement OE-Core
>  with additional packages, Each layer have designated maintainer
> diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
> index 78a4429ce2..28c2f14733 100644
> --- a/meta-filesystems/README.md
> +++ b/meta-filesystems/README.md
> @@ -11,26 +11,26 @@
>
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: blacksail
>
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: blacksail
>
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
>
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (
> openembedded-devel@lists.openembedded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][blacksail]' in the subject.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-filesystems][PATCH'
> +        --subject-prefix=3D'meta-filesystems][blacksail][PATCH'
>
>
>  Table of Contents
> diff --git a/meta-gnome/README.md b/meta-gnome/README.md
> index 6c23b4e671..7d66dfce27 100644
> --- a/meta-gnome/README.md
> +++ b/meta-gnome/README.md
> @@ -3,14 +3,14 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: blacksail
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: blacksail
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-gnome][blacksail]' in the subject'
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-gnome][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-gnome][blacksail][PATCH'
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
> diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
> index e074142be7..cca1b5f174 100644
> --- a/meta-initramfs/README.md
> +++ b/meta-initramfs/README.md
> @@ -12,19 +12,19 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: blacksail
>
>
>  Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][blacksail]' in the subject.
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-initramfs][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-initramfs][blacksail][PATCH'
>
> -Interim layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Interim layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
>
>  License
> diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
> index bda470a6f6..5f847c259c 100644
> --- a/meta-multimedia/README.md
> +++ b/meta-multimedia/README.md
> @@ -1,17 +1,17 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: blacksail
>
>  URI: git://git.openembedded.org/meta-openembedded
>  layers: meta-oe
> -branch: master
> +branch: blacksail
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-multimedia]' in the subject
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-multimedia][blacksail]' in the subject
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-multimedia][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-multimedia][blacksail][PATCH'
>
>  You are encouraged to fork the mirror on github
> https://github.com/openembedded/meta-openembedded to share your patches,
> this is preferred for patch sets consisting of more than one patch. Other
> services like GitLab, repo.or.cz or self hosted setups are of course
> accepted as well, 'git fetch <remote>' works the same on all of them. We
> recommend github because it is free, easy to use, has been proven to be
> reliable and has a really good web GUI.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
> diff --git a/meta-networking/README.md b/meta-networking/README.md
> index f8337b0c5b..094a85b9d9 100644
> --- a/meta-networking/README.md
> +++ b/meta-networking/README.md
> @@ -18,21 +18,21 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: blacksail
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: blacksail
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-python
> -branch: master
> +branch: blacksail
>
>  Maintenance
>  -----------
> -Layer maintainers: Khem Raj <raj.khem@gmail.com>
> +Layer maintainers: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
>
>  Please see the MAINTAINERS file for information on contacting the
> diff --git a/meta-oe/README.md b/meta-oe/README.md
> index da6c4cbe79..345b3ca903 100644
> --- a/meta-oe/README.md
> +++ b/meta-oe/README.md
> @@ -4,7 +4,7 @@
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: blacksail
>
>  luajit recipe requires host compiler to be able to generate 32bit code
> when target is 32bit
>  e.g. arm, so ensure that $CC -m32 is functional on build host, if
> building this recipe, needed
> @@ -16,10 +16,10 @@
>  Ubuntu
>  sudo apt-get install gcc-multilib linux-libc-dev:i386
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-oe][blacksail]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D"meta-oe][PATCH"'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D"meta-oe][blacksail][PATCH"'
>
>  You are encouraged to fork the mirror on GitHub
> https://github.com/openembedded/meta-openembedded
>  to share your patches, this is preferred for patch sets consisting of
> more than one patch.
> @@ -33,4 +33,4 @@
>  'git fetch <remote>' works the same on all of them. We recommend GitHub
> because it is free, easy
>  to use, has been proven to be reliable and has a really good web GUI.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
> diff --git a/meta-perl/README.md b/meta-perl/README.md
> index 9d56dbe8c6..9fb1d7d864 100644
> --- a/meta-perl/README.md
> +++ b/meta-perl/README.md
> @@ -52,7 +52,7 @@
>  This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: blacksail
>
>  Adding the meta-perl layer to your build
>  ---------------------------------------
> @@ -73,14 +73,12 @@
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> with
> -'[meta-perl]' in the subject.
> +'[meta-perl][blacksail]' in the subject.
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-perl][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-perl][blacksail][PATCH'
>
> -Layer maintainers:
> -    Hongxu Jia <hongxu.jia@windriver.com>
> -    Tim "moto-timo" Orling <ticotimo@gmail.com>
> +Layer maintainers: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
>  License
>  -------
> diff --git a/meta-python/README.md b/meta-python/README.md
> index 36c193957c..36255167b6 100644
> --- a/meta-python/README.md
> +++ b/meta-python/README.md
> @@ -13,11 +13,11 @@
>
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
> -       branch: master
> +       branch: blacksail
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
> -       branch: master
> +       branch: blacksail
>
>  Contributing
>  -------------------------
> @@ -28,14 +28,12 @@
>  before posting.
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-python]' in the subject.
> +'[meta-python][blacksail]' in the subject.
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-python][PATCH'
> +git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-python][blacksail][PATCH'
>
>  Maintenance
>  -------------------------
>
> -Layer maintainers:
> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> -        Derek Straka <derek@asterius.io>
> +Layer maintainers: Ankur Tyagi <ankur.tyagi85@gmail.com>
> diff --git a/meta-webserver/README.md b/meta-webserver/README.md
> index 565269648d..1562365e47 100644
> --- a/meta-webserver/README.md
> +++ b/meta-webserver/README.md
> @@ -13,13 +13,13 @@
>
>  URI: git://git.openembedded.org/openembedded-core
>  subdirectory: meta
> -branch: master
> +branch: blacksail
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: blacksail
>
>
>
> @@ -50,14 +50,14 @@
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][blacksail]' in the subject.
>
>  When sending single patches, please use something like:
>  ```
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D"meta-webserver][PATCH"
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D"meta-webserver][blacksail][PATCH"
>  ```
>
> -Layer maintainer: Derek Straka <derek@asterius.io>
> +Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
>
>  License
> diff --git a/meta-xfce/README.md b/meta-xfce/README.md
> index 564590ff39..d032d1b076 100644
> --- a/meta-xfce/README.md
> +++ b/meta-xfce/README.md
> @@ -1,10 +1,10 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: blacksail
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: blacksail
>
>  meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this
> repository.
>
> @@ -13,10 +13,9 @@
>
>  BBMASK =3D "meta-xfce/recipes-multimedia"
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-xfce]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-xfce][blacksail]' in the subject'
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-xfce][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-xfce][blacksail][PATCH'
>
> -Layer maintainer: Kai Kang <kai.kang@windriver.com>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130710):
> https://lists.openembedded.org/g/openembedded-devel/message/130710
> Mute This Topic: https://lists.openembedded.org/mt/121679825/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007f2961065d6f3d73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 9, 2026 at 2:40=E2=
=80=AFPM Ankur Tyagi via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Ankur Tyagi &lt;<a hr=
ef=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">ankur.tyagi85@gmail=
.com</a>&gt;<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
=C2=A0meta-filesystems/README.md | 10 +++++-----<br>
=C2=A0meta-gnome/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
=C2=A0meta-initramfs/README.md=C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0meta-multimedia/README.md=C2=A0 | 10 +++++-----<br>
=C2=A0meta-networking/README.md=C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0meta-oe/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++---=
-<br>
=C2=A0meta-perl/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++------<br>
=C2=A0meta-python/README.md=C2=A0 =C2=A0 =C2=A0 | 12 +++++-------<br>
=C2=A0meta-webserver/README.md=C2=A0 =C2=A0| 10 +++++-----<br>
=C2=A0meta-xfce/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++------<br>
=C2=A011 files changed, 47 insertions(+), 52 deletions(-)<br>
<br>
diff --git a/README.md b/README.md<br>
index 9fc30bda95..f445aed152 100644<br>
--- a/README.md<br>
+++ b/README.md<br>
@@ -1,6 +1,6 @@<br>
=C2=A0Collection of layers for the OE-core universe<br>
<br>
-Main layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Main layer maintainer: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gma=
il.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
=C2=A0This repository is a collection of layers to supplement OE-Core<br>
=C2=A0with additional packages, Each layer have designated maintainer<br>
diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md<br>
index 78a4429ce2..28c2f14733 100644<br>
--- a/meta-filesystems/README.md<br>
+++ b/meta-filesystems/README.md<br>
@@ -11,26 +11,26 @@<br>
<br>
=C2=A0 =C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedd=
ed-core</a><br>
=C2=A0 =C2=A0layers: meta<br>
-=C2=A0 branch: master<br>
+=C2=A0 branch: blacksail<br>
<br>
=C2=A0 =C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openemb=
edded" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-opene=
mbedded</a><br>
=C2=A0 =C2=A0layers: meta-oe<br>
-=C2=A0 branch: master<br>
+=C2=A0 branch: blacksail<br>
<br>
=C2=A0Patches<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0Please submit any patches against the filesystems layer to the<br>
=C2=A0OpenEmbedded development mailing list (<a href=3D"mailto:openembedded=
-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.o=
penembedded.org</a>)<br>
-with &#39;[meta-filesystems]&#39; in the subject.<br>
+with &#39;[meta-filesystems][blacksail]&#39; in the subject.<br>
<br>
-Layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Layer maintainer: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.co=
m" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
<br>
=C2=A0 =C2=A0 git send-email -1 -M \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--to <a href=3D"mailto:openembedded-devel=
@lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openemb=
edded.org</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3D&#39;meta-filesystems][PATC=
H&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3D&#39;meta-filesystems][blac=
ksail][PATCH&#39;<br>
<br>
<br>
=C2=A0Table of Contents<br>
diff --git a/meta-gnome/README.md b/meta-gnome/README.md<br>
index 6c23b4e671..7d66dfce27 100644<br>
--- a/meta-gnome/README.md<br>
+++ b/meta-gnome/README.md<br>
@@ -3,14 +3,14 @@<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core=
</a><br>
-branch: master<br>
+branch: blacksail<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded=
</a><br>
-branch: master<br>
+branch: blacksail<br>
<br>
-Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> wi=
th &#39;[meta-gnome]&#39; in the subject&#39;<br>
+Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> wi=
th &#39;[meta-gnome][blacksail]&#39; in the subject&#39;<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-gnome][PATCH&#39;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-gnome][blacksail][PATCH&#39;<br>
<br>
-Layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Layer maintainer: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.co=
m" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md<br>
index e074142be7..cca1b5f174 100644<br>
--- a/meta-initramfs/README.md<br>
+++ b/meta-initramfs/README.md<br>
@@ -12,19 +12,19 @@<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded=
</a><br>
-branch: master<br>
+branch: blacksail<br>
<br>
<br>
=C2=A0Maintenance<br>
=C2=A0-----------<br>
<br>
=C2=A0Send patches / pull requests to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembe=
dded.org</a><br>
-with &#39;[meta-initramfs]&#39; in the subject.<br>
+with &#39;[meta-initramfs][blacksail]&#39; in the subject.<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-initramfs][PATCH&#39;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-initramfs][blacksail][PATCH&#39;<br>
<br>
-Interim layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Interim layer maintainer: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@=
gmail.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
<br>
=C2=A0License<br>
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md<br>
index bda470a6f6..5f847c259c 100644<br>
--- a/meta-multimedia/README.md<br>
+++ b/meta-multimedia/README.md<br>
@@ -1,17 +1,17 @@<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core=
</a><br>
-branch: master<br>
+branch: blacksail<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded=
</a><br>
=C2=A0layers: meta-oe<br>
-branch: master<br>
+branch: blacksail<br>
<br>
-Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> wi=
th &#39;[meta-multimedia]&#39; in the subject<br>
+Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> wi=
th &#39;[meta-multimedia][blacksail]&#39; in the subject<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-multimedia][PATCH&#39;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-multimedia][blacksail][PATCH&#39;<br>
<br>
=C2=A0You are encouraged to fork the mirror on github <a href=3D"https://gi=
thub.com/openembedded/meta-openembedded" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/openembedded/meta-openembedded</a> to share your patc=
hes, this is preferred for patch sets consisting of more than one patch. Ot=
her services like GitLab, <a href=3D"http://repo.or.cz" rel=3D"noreferrer" =
target=3D"_blank">repo.or.cz</a> or self hosted setups are of course accept=
ed as well, &#39;git fetch &lt;remote&gt;&#39; works the same on all of the=
m. We recommend github because it is free, easy to use, has been proven to =
be reliable and has a really good web GUI.<br>
<br>
-Layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Layer maintainer: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.co=
m" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
diff --git a/meta-networking/README.md b/meta-networking/README.md<br>
index f8337b0c5b..094a85b9d9 100644<br>
--- a/meta-networking/README.md<br>
+++ b/meta-networking/README.md<br>
@@ -18,21 +18,21 @@<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core=
</a><br>
-branch: master<br>
+branch: blacksail<br>
<br>
=C2=A0For some recipes, the meta-oe layer is required:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded=
</a><br>
=C2=A0subdirectory: meta-oe<br>
-branch: master<br>
+branch: blacksail<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded=
</a><br>
=C2=A0subdirectory: meta-python<br>
-branch: master<br>
+branch: blacksail<br>
<br>
=C2=A0Maintenance<br>
=C2=A0-----------<br>
-Layer maintainers: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Layer maintainers: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.c=
om" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
<br>
=C2=A0Please see the MAINTAINERS file for information on contacting the<br>
diff --git a/meta-oe/README.md b/meta-oe/README.md<br>
index da6c4cbe79..345b3ca903 100644<br>
--- a/meta-oe/README.md<br>
+++ b/meta-oe/README.md<br>
@@ -4,7 +4,7 @@<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://github.com/openembedded/openembedded-cor=
e.git" rel=3D"noreferrer" target=3D"_blank">github.com/openembedded/openemb=
edded-core.git</a><br>
-branch: master<br>
+branch: blacksail<br>
<br>
=C2=A0luajit recipe requires host compiler to be able to generate 32bit cod=
e when target is 32bit<br>
=C2=A0e.g. arm, so ensure that $CC -m32 is functional on build host, if bui=
lding this recipe, needed<br>
@@ -16,10 +16,10 @@<br>
=C2=A0Ubuntu<br>
=C2=A0sudo apt-get install gcc-multilib linux-libc-dev:i386<br>
<br>
-Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> wi=
th &#39;[meta-oe]&#39; in the subject&#39;<br>
+Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> wi=
th &#39;[meta-oe][blacksail]&#39; in the subject&#39;<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-&#39;git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.=
openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.o=
rg</a> --subject-prefix=3D&quot;meta-oe][PATCH&quot;&#39;<br>
+&#39;git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.=
openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.o=
rg</a> --subject-prefix=3D&quot;meta-oe][blacksail][PATCH&quot;&#39;<br>
<br>
=C2=A0You are encouraged to fork the mirror on GitHub <a href=3D"https://gi=
thub.com/openembedded/meta-openembedded" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/openembedded/meta-openembedded</a><br>
=C2=A0to share your patches, this is preferred for patch sets consisting of=
 more than one patch.<br>
@@ -33,4 +33,4 @@<br>
=C2=A0&#39;git fetch &lt;remote&gt;&#39; works the same on all of them. We =
recommend GitHub because it is free, easy<br>
=C2=A0to use, has been proven to be reliable and has a really good web GUI.=
<br>
<br>
-Layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Layer maintainer: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.co=
m" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
diff --git a/meta-perl/README.md b/meta-perl/README.md<br>
index 9d56dbe8c6..9fb1d7d864 100644<br>
--- a/meta-perl/README.md<br>
+++ b/meta-perl/README.md<br>
@@ -52,7 +52,7 @@<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0 =C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedd=
ed-core</a><br>
-=C2=A0 branch: master<br>
+=C2=A0 branch: blacksail<br>
<br>
=C2=A0Adding the meta-perl layer to your build<br>
=C2=A0---------------------------------------<br>
@@ -73,14 +73,12 @@<br>
=C2=A0-----------<br>
<br>
=C2=A0Send patches / pull requests to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembe=
dded.org</a> with<br>
-&#39;[meta-perl]&#39; in the subject.<br>
+&#39;[meta-perl][blacksail]&#39; in the subject.<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-perl][PATCH&#39;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-perl][blacksail][PATCH&#39;<br>
<br>
-Layer maintainers:<br>
-=C2=A0 =C2=A0 Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-=C2=A0 =C2=A0 Tim &quot;moto-timo&quot; Orling &lt;<a href=3D"mailto:ticot=
imo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
+Layer maintainers: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.c=
om" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
=C2=A0License<br>
=C2=A0-------<br>
diff --git a/meta-python/README.md b/meta-python/README.md<br>
index 36c193957c..36255167b6 100644<br>
--- a/meta-python/README.md<br>
+++ b/meta-python/README.md<br>
@@ -13,11 +13,11 @@<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 URI: git://<a href=3D"http://git.openembedded.o=
rg/openembedded-core" rel=3D"noreferrer" target=3D"_blank">git.openembedded=
.org/openembedded-core</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 layers: meta<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0branch: master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0branch: blacksail<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 URI: git://<a href=3D"http://git.openembedded.o=
rg/meta-openembedded" rel=3D"noreferrer" target=3D"_blank">git.openembedded=
.org/meta-openembedded</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 layers: meta-oe<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0branch: master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0branch: blacksail<br>
<br>
=C2=A0Contributing<br>
=C2=A0-------------------------<br>
@@ -28,14 +28,12 @@<br>
=C2=A0before posting.<br>
<br>
=C2=A0Send pull requests to <a href=3D"mailto:openembedded-devel@lists.open=
embedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</=
a> with<br>
-&#39;[meta-python]&#39; in the subject.<br>
+&#39;[meta-python][blacksail]&#39; in the subject.<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-git send-email -M -1 --to=3D<a href=3D"mailto:openembedded-devel@lists.ope=
nembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org<=
/a> --subject-prefix=3D&#39;meta-python][PATCH&#39;<br>
+git send-email -M -1 --to=3D<a href=3D"mailto:openembedded-devel@lists.ope=
nembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org<=
/a> --subject-prefix=3D&#39;meta-python][blacksail][PATCH&#39;<br>
<br>
=C2=A0Maintenance<br>
=C2=A0-------------------------<br>
<br>
-Layer maintainers:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Tim &quot;moto-timo&quot; Orling &lt;<a href=
=3D"mailto:TicoTimo@gmail.com" target=3D"_blank">TicoTimo@gmail.com</a>&gt;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Derek Straka &lt;<a href=3D"mailto:derek@aster=
ius.io" target=3D"_blank">derek@asterius.io</a>&gt;<br>
+Layer maintainers: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.c=
om" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md<br>
index 565269648d..1562365e47 100644<br>
--- a/meta-webserver/README.md<br>
+++ b/meta-webserver/README.md<br>
@@ -13,13 +13,13 @@<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core=
</a><br>
=C2=A0subdirectory: meta<br>
-branch: master<br>
+branch: blacksail<br>
<br>
=C2=A0For some recipes, the meta-oe layer is required:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded=
</a><br>
=C2=A0subdirectory: meta-oe<br>
-branch: master<br>
+branch: blacksail<br>
<br>
<br>
<br>
@@ -50,14 +50,14 @@<br>
=C2=A0-----------<br>
<br>
=C2=A0Send patches / pull requests to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembe=
dded.org</a><br>
-with &#39;[meta-webserver]&#39; in the subject.<br>
+with &#39;[meta-webserver][blacksail]&#39; in the subject.<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
=C2=A0```<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&quot;meta-webserver][PATCH&quot;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&quot;meta-webserver][blacksail][PATCH&quot;<br>
=C2=A0```<br>
<br>
-Layer maintainer: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" ta=
rget=3D"_blank">derek@asterius.io</a>&gt;<br>
+Layer maintainer: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.co=
m" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
<br>
=C2=A0License<br>
diff --git a/meta-xfce/README.md b/meta-xfce/README.md<br>
index 564590ff39..d032d1b076 100644<br>
--- a/meta-xfce/README.md<br>
+++ b/meta-xfce/README.md<br>
@@ -1,10 +1,10 @@<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core=
</a><br>
-branch: master<br>
+branch: blacksail<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded=
</a><br>
-branch: master<br>
+branch: blacksail<br>
<br>
=C2=A0meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this =
repository.<br>
<br>
@@ -13,10 +13,9 @@<br>
<br>
=C2=A0BBMASK =3D &quot;meta-xfce/recipes-multimedia&quot;<br>
<br>
-Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> wi=
th &#39;[meta-xfce]&#39; in the subject&#39;<br>
+Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> wi=
th &#39;[meta-xfce][blacksail]&#39; in the subject&#39;<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-xfce][PATCH&#39;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&#39;meta-xfce][blacksail][PATCH&#39;<br>
<br>
-Layer maintainer: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" t=
arget=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
-Layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Layer maintainer: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.co=
m" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130710): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130710" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130710</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121679825/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121679825/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007f2961065d6f3d73--

