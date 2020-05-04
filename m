Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.1687.1588575970997745186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 00:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lwproaG6;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id g16so9187973qtp.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 00:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5McLwjuA29KkK64zGGX1PljcDViDA5XfyUiLIRhNE0c=;
        b=lwproaG6kiZ/9IMS2bdq00pMF8P+PMjPgOKyPr31dwZhfN7QA6ig01+GsES3iQsdQc
         niM7c8WvdRFOIA75TDoHQ8QIcbu2zdvRvHxJWqdhB29tmYZie/+mown0bmADXlXgg+Tp
         0qpRYo7AnfdgnBNgfJoEHROU74M3FBpZEZTRiRnQJ8mcSrWEOzHmy8kHhgjQXUSoS3Tq
         ferUfzSbatT0Jd7su9RLyp44IgXtAw7nAmZYXPzHjRTVxycnqjT/nMK9JNNLHmUvrD4t
         4PrcWrz3fAIG1IRbu9YHS0sNHi9jZNL6Omu8JpF6AZcbzXJbiTcU5A5UZMXHcFOfaL4w
         hKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5McLwjuA29KkK64zGGX1PljcDViDA5XfyUiLIRhNE0c=;
        b=t8ZHUTiXaEslaXRiwqP1wfsmSRyiZh9xHfDoL1kc03g2RZNSh3mn6zYCTlkMMD7KU9
         BSOF2BvER50uBgCCiljYs8wzirkLyBxD8k635Bw9sPqT+ihElzaA6oj3WRMF0GrNMGwg
         c92FL1ef83nw5dCXp9iCKyXH8tpmE6LamfHP4fiQD1nZm2F/ezFYXQy1RrfDhCpxtQVx
         Z+kqF9Q6e8nB7stWizR8oWIo1KnLeapy4aas+168JYNozcsJHKSf2eb9kX5i5ihkXLLY
         2IGZYplUj7ZBs/WasUCWpFcI9aL5pDXvQBm7Hpp/VNHrmzSQgEIDSca4upsa0TC7PMeA
         Tf1w==
X-Gm-Message-State: AGi0PuYL/CKEilqa8sJ+pGoh95Drxi/GbhSP2gXimlO8ovSTwIhI8IaN
	Z4z/inBkMVaH+nOCGapie/9u3Octc69J4NopdmQ=
X-Google-Smtp-Source: APiQypKcC/hehxuzxJEyHxCJ7eoHuWV70NyzJ5Uh0LM5ybjri7mDkiuHuptxlJh9FIWAN9ja8iKT57NfHIVApRM9I9k=
X-Received: by 2002:ac8:24b7:: with SMTP id s52mr14645129qts.316.1588575969653;
 Mon, 04 May 2020 00:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200504044227.6314-1-akuster808@gmail.com> <20200504044227.6314-2-akuster808@gmail.com>
In-Reply-To: <20200504044227.6314-2-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 4 May 2020 00:05:43 -0700
Message-ID: <CAMKF1spsSPbwdFn5CLYAaLeaFyFfv=wB6oQOrcNLvEDd+FJMWA@mail.gmail.com>
Subject: Re: [dunfell][PATCH 1/1] README: updated Maintainers list for Dunfell
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Armin, looks good.

On Sun, May 3, 2020 at 9:42 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  README                      |  2 +-
>  meta-filesystems/README     | 10 +++++-----
>  meta-gnome/README           | 10 +++++-----
>  meta-initramfs/README       |  8 ++++----
>  meta-multimedia/README      | 10 +++++-----
>  meta-networking/MAINTAINERS | 32 +++-----------------------------
>  meta-networking/README      |  6 +++---
>  meta-oe/README              |  8 ++++----
>  meta-perl/README            | 10 ++++------
>  meta-python/README          | 12 +++++-------
>  meta-webserver/README       |  8 ++++----
>  meta-xfce/README            | 10 +++++-----
>  12 files changed, 48 insertions(+), 78 deletions(-)
>
> diff --git a/README b/README
> index 7318f09cdb..e8b30de36d 100644
> --- a/README
> +++ b/README
> @@ -1,6 +1,6 @@
>  Collection of layers for the OE-core universe
>
> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> +dunfell maintainer: Armin Kuster  <akuster808@gmail.com>
>
>  This repository is a collection of layers to suppliment OE-Core
>  with additional packages, Each layer have designated maintainer
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index edcf8bfeef..4731d216fe 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -11,26 +11,26 @@ This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: dunfell
>
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: dunfell
>
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
>
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (openembedded-devel@lists.openembe=
dded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][dunfell]' in the subject.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +dunfell maintainer: Armin Kuster <akuster808@gmail.com>
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3Dmeta-filesystems][PATCH
> +        --subject-prefix=3Dmeta-filesystems][dunfell][PATCH
>
>
>  Table of Contents
> diff --git a/meta-gnome/README b/meta-gnome/README
> index a11815fb15..6fdc5cf715 100644
> --- a/meta-gnome/README
> +++ b/meta-gnome/README
> @@ -3,16 +3,16 @@ Dependencies
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome][dunfell]' in the subject'
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-gnome][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-gnome][dunfell][PATCH'
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index 79244d43f0..6d927fffa1 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -12,7 +12,7 @@ Dependencies
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>
> @@ -20,12 +20,12 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][dunfell]' in the subject.
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-initramfs][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-initramfs][dunfell][PATCH'
>
> -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> +dunfell maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index 3c4b1af7f4..1c08f9d9ff 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -1,19 +1,19 @@
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-oe.git
>  layers: meta-oe
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia][dunfell]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-multimedia][PATCH
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-multimedia][dunfell][PATCH
>
>  You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets co=
nsisting of more than one patch. Other services like gitorious, repo.or.cz =
or self hosted setups are of course accepted as well, 'git fetch <remote>' =
works the same on all of them. We recommend github because it is free, easy=
 to use, has been proven to be reliable and has a really good web GUI.
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +dunfell maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> index 5c4c4ce052..3e151b821b 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,38 +2,12 @@ This file contains a list of maintainers for the meta-n=
etworking layer.
>
>  Please submit any patches against meta-networking to the OpenEmbedded
>  development mailing list (openembedded-devel@lists.openembedded.org) wit=
h
> -'[meta-networking]' in the subject.
> +'[meta-networking][dunfell]' in the subject.
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3Dmeta-networking][PATCH
> +        --subject-prefix=3Dmeta-networking][dunfell][PATCH
>
> -You may also contact the maintainers directly.
> -
> -Descriptions of section entries:
> -
> -        M: Mail patches to: FullName <address@domain>
> -        F: Files and directories with wildcard patterns.
> -           A trailing slash includes all files and subdirectory files.
> -           F: recipes-devtools/    all files in and below recipes-devtoo=
ls
> -           F: recipes-selinux/*    all files in recipes-selinux, but not=
 below
> -           One pattern per line.  Multiple F: lines acceptable.
> -
> -Please keep this list in alphabetical order.
> -
> -Maintainers List (try to look for most precise areas first)
> -
> -COMMON
> -M:      Khem Raj <raj.khem@gmail.com>
> -M:      "Joe MacDonald (backup)" <joe@deserted.net>
> -L:      openembedded-devel@lists.openembedded.org
> -Q:      https://patchwork.openembedded.org/project/oe/
> -S:      Maintained
> -F:      conf
> -F:      recipes-*
> -
> -NETKIT
> -M:      Armin Kuster <akuster808@gmail.com>
> -F:      recipes-netkit
> +dunfell Maintainer:      Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-networking/README b/meta-networking/README
> index e1ba27d83b..52e7c79601 100644
> --- a/meta-networking/README
> +++ b/meta-networking/README
> @@ -18,19 +18,19 @@ Dependencies
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://github.com/openembedded/meta-openembedded.git
>  subdirectory: meta-oe
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-openembedded.git
>  subdirectory: meta-python
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>  Maintenance
> diff --git a/meta-oe/README b/meta-oe/README
> index 347816b0d1..10583aef27 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -4,7 +4,7 @@ meta-oe
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>  luajit recipe requires host compiler to be able to generate 32bit code w=
hen target is 32bit
> @@ -14,10 +14,10 @@ e.g. on archlinux based distributions install prerequ=
isites like below
>
>  pacman -S lib32-gcc-libs lib32-glibc
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][dunfell]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][dunfell][PATCH'
>
>  You are encouraged to fork the mirror on GitHub https://github.com/opene=
mbedded/openembedded-core
>  to share your patches, this is preferred for patch sets consisting of mo=
re than one patch.
> @@ -26,4 +26,4 @@ Other services like gitorious, repo.or.cz or self-hoste=
d setups are of course ac
>  'git fetch <remote>' works the same on all of them. We recommend GitHub =
because it is free, easy
>  to use, has been proven to be reliable and has a really good web GUI.
>
> -layer maintainer: Khem Raj <raj.khem@gmail.com>
> +dunfell maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-perl/README b/meta-perl/README
> index 67f291079f..fed2da3451 100644
> --- a/meta-perl/README
> +++ b/meta-perl/README
> @@ -52,7 +52,7 @@ Dependencies
>  This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: dunfell
>    revision: HEAD
>    prio: default
>
> @@ -75,14 +75,12 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g with
> -'[meta-perl]' in the subject.
> +'[meta-perl][dunfell]' in the subject.
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-perl][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-perl][dunfell][PATCH'
>
> -Layer maintainers:
> -    Hongxu Jia <hongxu.jia@windriver.com>
> -    Tim "moto-timo" Orling <ticotimo@gmail.com>
> +dunfell maintainers: Armin kuster <akuster808@gmail.com>
>
>  License
>  -------
> diff --git a/meta-python/README b/meta-python/README
> index 705b035d9e..237dff3021 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -13,12 +13,12 @@ The meta-python layer depends on:
>
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
> -       branch: master
> +       branch: dunfell
>         revision: HEAD
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
> -       branch: master
> +       branch: dunfell
>         revision: HEAD
>
>  Please follow the recommended setup procedures of your OE distribution.
> @@ -35,15 +35,13 @@ comments and patch review. It is subscriber only, so =
please register
>  before posting.
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-python]' in the subject.
> +'[meta-python][dunfell]' in the subject.
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org -=
-subject-prefix=3Dmeta-python][PATCH'
> +'git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org -=
-subject-prefix=3Dmeta-python][dunfell][PATCH'
>
>  Maintenance
>  -------------------------
>
> -Layer Maintainers:
> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> -        Derek Straka <derek@asterius.io>
> +dunfell Maintainers: Armin Kuster <akuster808@gmail.com>
>
> diff --git a/meta-webserver/README b/meta-webserver/README
> index 7b60630700..7adeff833a 100644
> --- a/meta-webserver/README
> +++ b/meta-webserver/README
> @@ -13,14 +13,14 @@ This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
>  subdirectory: meta
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://github.com/openembedded/meta-oe.git
>  subdirectory: meta-oe
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>
> @@ -52,9 +52,9 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][dunfell]' in the subject.
>
> -Layer maintainer: Derek Straka <derek@asterius.io>
> +dunfell Maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-xfce/README b/meta-xfce/README
> index 70ad47a2d1..eaa17175d6 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -1,11 +1,11 @@
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dunfell
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: dunfell
>  revision: HEAD
>  meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this rep=
ository.
>
> @@ -14,9 +14,9 @@ this to local.conf:
>
>  BBMASK =3D "meta-xfce/recipes-multimedia"
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce][dunfell]' in the subject'
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-xfce][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-xfce][dunfell][PATCH'
>
> -Layer maintainer: Kai Kang <kai.kang@windriver.com>
> +dunfell Maintainer: Armin Kuster <akuster808@gmail.com>
> --
> 2.17.1
>
