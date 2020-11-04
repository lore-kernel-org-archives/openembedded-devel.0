Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.18936.1604522168571922148
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 12:36:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sMhWfjAe;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id k7so1550104plk.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2020 12:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JC4NtKtHFT/QqSi1roG6U78MObg4gcWBpnu8G1PlQvE=;
        b=sMhWfjAeIs/AuXtLg8v9n08+7QWrC6c8l9tcrDZJFxNTaRt040xr2vhEWSSSU+QOK1
         o+HMtJp4mzkOfQ7BYL3U9iquo4h3mZWoYHGdDPxKKNY+U0p808tvWaEp61IkhmPxuD5a
         338eopZ6yQHpaU04EmG2uZsgingjGlXi9SHSLFxEGFH7mZu5p5K+dk0wKRNyYPJnNhyq
         kMCEy4WSAS7iBBgc+dxBvn9aggDwD3CerIUVRxuzua+60c5KG8ntroVOayBnsiBw+6RG
         HN+2rXasRPxwUSVrt+ldl5jFB0eQOI6lEBLtFClkRKO9No81PlKi7HlqT4Ioxn+G0ewQ
         z6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JC4NtKtHFT/QqSi1roG6U78MObg4gcWBpnu8G1PlQvE=;
        b=XxlzrP1p29ZwzL91wvXXBKbkOzz9Azr4nriK2ufo6aEJecGXfV5BvNq2bkJ+VVUA5Y
         Yg6kO9QFZ5eSaswxiG/cxYhMXnES92Fu3xn25ftyO3z82GmDDA6jkglupFLLFGSMTgIf
         i7rWxuj7peiTfVuzO1sn8cYrjCB9XJgzbsDrTNqtADE9cqcjIq0Nhbu9sh3DMyMPnUla
         Jca/U+CBW+R4RIEaxqpBlV3jHu5gnGY9xuWjm+E048CI5X7wWg6qmMnIesuXvAIoFGIT
         +ASh/zzzB5VRWKQ+LGNPxD4VjJ2EbY3KbAY1HREbdy2UYHUnpYX2SL2bybWKQfMx0ZxH
         PNCg==
X-Gm-Message-State: AOAM530NThYT9oBQwQO1uRR94bIgU0ELICNNcc12XGd1hX3UrMjkJe9k
	Bzee8dOKl6Fm14Dknq/MkehWmQOvnyfcbA==
X-Google-Smtp-Source: ABdhPJwTbTz82rn2kGUmASxMfWYM2UthmmicWSHvLiqapqyG2YSaDYHMEmQAIkmcPaUtlB4d/MgDrQ==
X-Received: by 2002:a17:902:744a:b029:d6:8b8c:622d with SMTP id e10-20020a170902744ab02900d68b8c622dmr30191229plt.67.1604522167583;
        Wed, 04 Nov 2020 12:36:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e1b6:7072:230a:1b80? ([2601:646:9200:4e0:e1b6:7072:230a:1b80])
        by smtp.gmail.com with ESMTPSA id g17sm3164357pfu.130.2020.11.04.12.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 12:36:07 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH] README: updated Maintainers list for Gatesgarth
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201104153039.4432-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <25b2c441-6b5e-d339-cee1-2907942771f8@gmail.com>
Date: Wed, 4 Nov 2020 12:36:06 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104153039.4432-1-akuster808@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Armin, All

Thanks, With this gatesgarth public branch has been created and Thanks 
Armin for stepping up to maintain it.

Happy hacking
-Khem

On 11/4/20 7:30 AM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   README                      |  2 +-
>   meta-filesystems/README     | 10 +++++-----
>   meta-gnome/README           | 10 +++++-----
>   meta-initramfs/README       |  8 ++++----
>   meta-multimedia/README      | 10 +++++-----
>   meta-networking/MAINTAINERS | 32 +++-----------------------------
>   meta-networking/README      |  6 +++---
>   meta-oe/README              |  6 +++---
>   meta-perl/README            | 10 ++++------
>   meta-python/README          | 14 +++++---------
>   meta-webserver/README       |  8 ++++----
>   meta-xfce/README            | 10 +++++-----
>   12 files changed, 47 insertions(+), 79 deletions(-)
> 
> diff --git a/README b/README
> index 7318f09cdb..66cb7af51e 100644
> --- a/README
> +++ b/README
> @@ -1,6 +1,6 @@
>   Collection of layers for the OE-core universe
>   
> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> +gatesgarth maintainer: Armin Kuster  <akuster808@gmail.com>
>   
>   This repository is a collection of layers to suppliment OE-Core
>   with additional packages, Each layer have designated maintainer
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index edcf8bfeef..fe7b77e1af 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -11,26 +11,26 @@ This layer depends on:
>   
>     URI: git://git.openembedded.org/openembedded-core
>     layers: meta
> -  branch: master
> +  branch: gatesgarth
>   
>     URI: git://git.openembedded.org/meta-openembedded
>     layers: meta-oe
> -  branch: master
> +  branch: gatesgarth
>   
>   Patches
>   =======
>   
>   Please submit any patches against the filesystems layer to the
>   OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][gatesgarth]' in the subject.
>   
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +gatesgarth maintainer: Armin Kuster <akuster808@gmail.com>
>   
>   When sending single patches, please use something like:
>   
>      git send-email -1 -M \
>           --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=meta-filesystems][PATCH
> +        --subject-prefix=meta-filesystems][gatesgarth][PATCH
>   
>   
>   Table of Contents
> diff --git a/meta-gnome/README b/meta-gnome/README
> index a11815fb15..db6ad0b902 100644
> --- a/meta-gnome/README
> +++ b/meta-gnome/README
> @@ -3,16 +3,16 @@ Dependencies
>   This layer depends on:
>   
>   URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][gatesgarth]' in the subject'
>   
>   When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][gatesgarth][PATCH'
>   
> -Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
> +maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index 79244d43f0..079bf7e01c 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -12,7 +12,7 @@ Dependencies
>   This layer depends on:
>   
>   URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   
> @@ -20,12 +20,12 @@ Maintenance
>   -----------
>   
>   Send patches / pull requests to openembedded-devel@lists.openembedded.org
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][gatesgarth]' in the subject.
>   
>   When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][gatesgarth][PATCH'
>   
> -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> +gatesgarth maintainer: Armin Kuster <akuster808@gmail.com>
>   
>   
>   License
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index b4c2455a11..cf5c0dea35 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -1,19 +1,19 @@
>   This layer depends on:
>   
>   URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   URI: git://github.com/openembedded/meta-oe.git
>   layers: meta-oe
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][gatesgarth]' in the subject'
>   
>   When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][gatesgarth][PATCH
>   
>   You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
>   
> -Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
> +gatesgarth maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> index 5c4c4ce052..9f756a6735 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,38 +2,12 @@ This file contains a list of maintainers for the meta-networking layer.
>   
>   Please submit any patches against meta-networking to the OpenEmbedded
>   development mailing list (openembedded-devel@lists.openembedded.org) with
> -'[meta-networking]' in the subject.
> +'[meta-networking][gatesgarth]' in the subject.
>   
>   When sending single patches, please use something like:
>   
>      git send-email -1 -M \
>           --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=meta-networking][PATCH
> +        --subject-prefix=meta-networking][gatesgarth][PATCH
>   
> -You may also contact the maintainers directly.
> -
> -Descriptions of section entries:
> -
> -        M: Mail patches to: FullName <address@domain>
> -        F: Files and directories with wildcard patterns.
> -           A trailing slash includes all files and subdirectory files.
> -           F: recipes-devtools/    all files in and below recipes-devtools
> -           F: recipes-selinux/*    all files in recipes-selinux, but not below
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
> +gatesgarth Maintainer:      Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-networking/README b/meta-networking/README
> index e1ba27d83b..b761bc5e5a 100644
> --- a/meta-networking/README
> +++ b/meta-networking/README
> @@ -18,19 +18,19 @@ Dependencies
>   This layer depends on:
>   
>   URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   For some recipes, the meta-oe layer is required:
>   
>   URI: git://github.com/openembedded/meta-openembedded.git
>   subdirectory: meta-oe
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   URI: git://github.com/openembedded/meta-openembedded.git
>   subdirectory: meta-python
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   Maintenance
> diff --git a/meta-oe/README b/meta-oe/README
> index 8d787df68b..65eea2b320 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -4,7 +4,7 @@ meta-oe
>   This layer depends on:
>   
>   URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
> @@ -14,7 +14,7 @@ e.g. on archlinux based distributions install prerequisites like below
>   
>   pacman -S lib32-gcc-libs lib32-glibc
>   
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][gatesgarth]' in the subject'
>   
>   When sending single patches, please use something like:
>   'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
> @@ -26,4 +26,4 @@ Other services like GitLab, repo.or.cz or self-hosted setups are of course accep
>   'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
>   to use, has been proven to be reliable and has a really good web GUI.
>   
> -layer maintainer: Khem Raj <raj.khem@gmail.com>
> +gatesgarth maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-perl/README b/meta-perl/README
> index 67f291079f..634c3bdb6e 100644
> --- a/meta-perl/README
> +++ b/meta-perl/README
> @@ -52,7 +52,7 @@ Dependencies
>   This layer depends on:
>   
>     URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: gatesgarth
>     revision: HEAD
>     prio: default
>   
> @@ -75,14 +75,12 @@ Maintenance
>   -----------
>   
>   Send patches / pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-perl]' in the subject.
> +'[meta-perl][gatesgarth]' in the subject.
>   
>   When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][gatesgarth][PATCH'
>   
> -Layer maintainers:
> -    Hongxu Jia <hongxu.jia@windriver.com>
> -    Tim "moto-timo" Orling <ticotimo@gmail.com>
> +gatesgarth maintainers: Armin kuster <akuster808@gmail.com>
>   
>   License
>   -------
> diff --git a/meta-python/README b/meta-python/README
> index ca0a290d9f..fea3274584 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -13,12 +13,12 @@ The meta-python layer depends on:
>   
>   	URI: git://git.openembedded.org/openembedded-core
>   	layers: meta
> -	branch: master
> +	branch: gatesgarth
>   	revision: HEAD
>   
>   	URI: git://git.openembedded.org/meta-openembedded
>   	layers: meta-oe
> -	branch: master
> +	branch: gatesgarth
>   	revision: HEAD
>   
>   Please follow the recommended setup procedures of your OE distribution.
> @@ -35,16 +35,12 @@ comments and patch review. It is subscriber only, so please register
>   before posting.
>   
>   Send pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-python]' in the subject.
> +'[meta-python][gatesgarth]' in the subject.
>   
>   When sending single patches, please use something like:
> -'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
> +'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][gatesgarth][PATCH'
>   
>   Maintenance
>   -------------------------
>   
> -Layer Maintainers:
> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> -        Derek Straka <derek@asterius.io>
> -        Trevor Gamblin <trevor.gamblin@windriver.com>
> -
> +gatesgarth Maintainers: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-webserver/README b/meta-webserver/README
> index 7b60630700..26e666f3eb 100644
> --- a/meta-webserver/README
> +++ b/meta-webserver/README
> @@ -13,14 +13,14 @@ This layer depends on:
>   
>   URI: git://github.com/openembedded/oe-core.git
>   subdirectory: meta
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   For some recipes, the meta-oe layer is required:
>   
>   URI: git://github.com/openembedded/meta-oe.git
>   subdirectory: meta-oe
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   
> @@ -52,9 +52,9 @@ Maintenance
>   -----------
>   
>   Send patches / pull requests to openembedded-devel@lists.openembedded.org
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][gatesgarth]' in the subject.
>   
> -Layer maintainer: Derek Straka <derek@asterius.io>
> +gatesgarth Maintainer: Armin Kuster <akuster808@gmail.com>
>   
>   
>   License
> diff --git a/meta-xfce/README b/meta-xfce/README
> index 70ad47a2d1..9d78a3d87c 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -1,11 +1,11 @@
>   This layer depends on:
>   
>   URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   
>   URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: gatesgarth
>   revision: HEAD
>   meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
>   
> @@ -14,9 +14,9 @@ this to local.conf:
>   
>   BBMASK = "meta-xfce/recipes-multimedia"
>   
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][gatesgarth]' in the subject'
>   
>   When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][gatesgarth][PATCH'
>   
> -Layer maintainer: Kai Kang <kai.kang@windriver.com>
> +gatesgarth Maintainer: Armin Kuster <akuster808@gmail.com>
> 
> 
> 
> 
> 
