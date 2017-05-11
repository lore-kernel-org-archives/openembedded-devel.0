Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CCA0C71C9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:57:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d127so6853060wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2B/KrFwnZIto+IHqkmJss2ozDeeUa+YY4Do9Sgq6ts0=;
	b=qgCer08QlmtWAcRKLcNbQOQPeOHpvFsyDxoEdpY+jqknwIyQoyk/cpnZeAhGu2ZlH9
	7nEGhAK3y3VQWswkpcRcrHZn+BGL85pXMTYFYO+6dkbys3kJUnig/OCXa2YVOKnUWMEN
	UcnFIPGcG6PWwH3KtmL7OfjtkJiBN3HXC0s30V5HVj5SzmvSYtqPSQ02lBWx6k2BmlPQ
	QTp+ZLPQokqkbJ6+I6HLCehut/VZ2DjtCaZ6XgMNE7+clBC7V8u+71UmtQbfxRDGUUSb
	Ifxzxf40HDZUD8o12V9VJAiEzQXF989+IxNPrFp2E0zrZsZADqfTz+lqg5vqxBhQPFzX
	Oc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2B/KrFwnZIto+IHqkmJss2ozDeeUa+YY4Do9Sgq6ts0=;
	b=Y0cElwbDqDqqKEeAreH2+7bWmNhwShLnu/fuabWlXoaRUara2NFVBgJCPIF2euNuIi
	B0BD5LvOcwrc3nGCCxO3+yRhRPCmgNzMhb7FYYYKktaNl0yJ0uT90quH7ktC1yN4JoI3
	c+i4x+WDTB8j8K13rZyKxW0Lj82u3M2n0ckUT/xBoYLXaVoiZouZsv8vs8zy36GF5NGn
	3SYz8yADz4kmzABX6sRl3pp3f7/LnO4ypbb2IdDVD9XXzeZOj8/DHiS4jpPzqJfM0Ti2
	BPhmFDOQVRA34FBkLxEnB1dSIYEEsuPBCzR2V3UnGD3mc7m6QEMOxFsJXeVcg77v384g
	bVLw==
X-Gm-Message-State: AODbwcBLLnPfGPaHa7wHGjLSvyuevmyr5pJYe8MP4JbQ9jlZ+Tv5gIO2
	68M3LdsEV56rOJDDxyTKEkhvqtd/lg==
X-Received: by 10.80.165.23 with SMTP id y23mr771020edb.64.1494507452746; Thu,
	11 May 2017 05:57:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Thu, 11 May 2017 05:57:32 -0700 (PDT)
In-Reply-To: <1494507239-32152-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494507239-32152-1-git-send-email-costamagnagianfranco@yahoo.it>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 May 2017 14:57:32 +0200
Message-ID: <CA+chaQfbC6H5ruV6qbdZjJ0-kqP=OJCmc1+vL9kxiipowUaDrg@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libndp: switch to github uri. libndp.org is unstable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 May 2017 12:57:32 -0000
Content-Type: text/plain; charset="UTF-8"

;branch=master is default and you can drop it.

Don't use tag names (bitbake will have to reach the git repository to
convert the name to fixed SRCREV every time it parses the recipe), use
fixed SRCREV which is matching the tag.

On Thu, May 11, 2017 at 2:53 PM, Gianfranco Costamagna <
costamagna.gianfranco@gmail.com> wrote:

> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> ---
>  meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
> b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
> index e06ff7f..7a8ba60 100644
> --- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
> +++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
> @@ -3,10 +3,10 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
> -SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz \
> +SRC_URI = "git://github.com/jpirko/libndp;branch=master;tag=v${PV} \
>             file://0001-include-sys-select.h-for-fd_-definitions.patch \
>             "
> -SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
> -SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f
> 72cfaf14f4ff77a77425e52edc33ffac0e"
> +
> +S = "${WORKDIR}/git"
>
>  inherit autotools
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

