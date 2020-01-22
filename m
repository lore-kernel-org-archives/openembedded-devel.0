Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 208CC7D67C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 20:54:15 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w47so731018qtk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 12:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7Q9RTicToBoJ5uIQVeMEHfxbIrMzuwnxsi0AsmrvoJk=;
	b=cjfQ5RTAbQgJ6e+YfU9fssbJpFOHsAk96Vm9Y68axeKJ+ppqWaRKmy/cyqus7F6IbX
	jdTylXwS38NwnZMemn5VgXxiG4HYZTYSgF+49Ioi2J9+M8NxWt9tSV+7fofBzqy32Atd
	7Y9Pbyx5TLrzjUhW1lI9ir9oIJkrMCAM2CDPdGtXJzbA0uYZ4QCOX/++F1YjUDcdTtIS
	8ORfiY2CFitzTlRVxuNBaNWkytqruQM+ZnJRal5QwXzu7/LlngFmThDPIfEcIu7U4YTC
	Tm8WDDXnwt+rwyfXkjJUEi+XE8wdqhE0XK08PX0zlPAKJVRWfsxPco34zvmoFpK2ku2u
	sOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7Q9RTicToBoJ5uIQVeMEHfxbIrMzuwnxsi0AsmrvoJk=;
	b=iM4BvTeibSOg1t0kDC80BPO74fzoba0hFN0giFS6tPkBSikn/KNN0zmuZaVCZk5EPH
	82lfwmOhZ1P2oEA8EKxbmTZVhB6MNb4VvQgeIhFZizWYDDAmQHpP1AVDlcRLe2gqDJVH
	tqS01lS8rdsqR+dxTjZNm9KE01iHeI7kPHiMV9ToJx6bXrnb2sj5+d0k5n6W/Th8I/37
	bpTjIbLVppy/xAXp1XcEXxZPF8prRBV9ZlTchYac2fsQOcMNN/SgG++U+jV281RhMJva
	ReL2GXGIt2vJlrRaCRYTy8qhrfjbDrd67uQmGdgV+VlqoGkdHUicyNcNtDwkCtwntsYZ
	aXgg==
X-Gm-Message-State: APjAAAVmefH1poenub4L9+3w2DCBK4iN8+xAO4Ozra58Yn1er+5eQobg
	ORoG8u8fQjXBPlo18o06Y/DLDFzSh4UwyqqDMcg=
X-Google-Smtp-Source: APXvYqxqc/0Fr61frru9lJZkTw6EwI8Q8L1QcxlnHVlunVkary1stcLY2olJGzxqayHxbNS75259exmSTOPORX5zmus=
X-Received: by 2002:ac8:145:: with SMTP id f5mr12475044qtg.194.1579726455770; 
	Wed, 22 Jan 2020 12:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20200117065558.19959-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20200117065558.19959-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2020 12:53:49 -0800
Message-ID: <CAMKF1spN_VGujcWwN25za7f+M9Chjgsvrr5cWN=w3voA-_NK+A@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-yappi: upgrade 1.0 -> 1.2.3
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
X-List-Received-Date: Wed, 22 Jan 2020 20:54:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 16, 2020 at 10:54 PM Zang Ruochen
<zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-yappi.inc        | 6 +++---
>  .../python/{python-yappi_1.0.bb => python-yappi_1.2.3.bb}   | 0
>  .../python/{python3-yappi_1.0.bb => python3-yappi_1.2.3.bb} | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-yappi_1.0.bb => python-yappi_1.2.3.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-yappi_1.0.bb => python3-yappi_1.2.3.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-yappi.inc b/meta-python/recipes-devtools/python/python-yappi.inc
> index 54d408742..e84774f9d 100644
> --- a/meta-python/recipes-devtools/python/python-yappi.inc
> +++ b/meta-python/recipes-devtools/python/python-yappi.inc
> @@ -2,10 +2,10 @@ SUMMARY  = "Yet Another Python Profiler"
>  HOMEPAGE = "http://yappi.googlecode.com/"
>
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=91efaebbca5a9e4db0870636d36e7b98"
>

what changed here? Please mention that in commit msg and also rebase
it on the latest master

> -SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
> -SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
> +SRC_URI[md5sum] = "36474a3e47ad9a2e4605b8e7e30a08fc"
> +SRC_URI[sha256sum] = "b8db9bc607610d6da4e27e87ec828ebddec4bdaac89ca07ebfe9a153b0641580"
>
>  inherit pypi setuptools
>
> diff --git a/meta-python/recipes-devtools/python/python-yappi_1.0.bb b/meta-python/recipes-devtools/python/python-yappi_1.2.3.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-yappi_1.0.bb
> rename to meta-python/recipes-devtools/python/python-yappi_1.2.3.bb
> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.2.3.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-yappi_1.0.bb
> rename to meta-python/recipes-devtools/python/python3-yappi_1.2.3.bb
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

