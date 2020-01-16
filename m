Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD4C7F891
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 04:54:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r14so17975653qke.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 20:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sm0QzEhjh7L2bTzO/A7Ii573lFYj7rqvOHJRMKHwx6Q=;
	b=pwMq1ntir1HZhROLjWndwrhxL+ncb3rUlVpTTmiPqjaeulisdgkTEx32A3+zUfa/Rw
	Hhhndo175HBdGuzYn6IVwDCVjByGOWc+bi4txt48zwH92W9yHg8pcIEnvJFfNQZX4uXy
	0pTSvTa8hyvp/kVzCCb5AQDchsWP1obv0Df+jUcKvkk0Xt/hB7rcJ0nVpceMqapfav9u
	uEFe+Iehr0aBrBbVNThFbb8Npt9ybrANlerteJE6YoQK9laLofmkZpbUregyGlcVw/Nk
	MeZCTa38wW/L8nnf385uI2jbBez55/OpCgPvE+R4v+bg2VxeR7CNINfydKtRLIbW+ZRV
	fhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sm0QzEhjh7L2bTzO/A7Ii573lFYj7rqvOHJRMKHwx6Q=;
	b=VVULlQIyr1gs+teN09aZygPkSQ9l9bQI8AxGpT9dMCPphVqYmF0pMt9QoLfzdNIM93
	eEqPoKbT9xR9Bp6AxFcNAsIeqg9yVjNGkhqSZB2a6Bh07z0p0RViJHuvawFUyDvIWKkh
	VaIMgaPa9fCpqdTZpTtha63X+nO7N88LSojhlo6kKOpxTbsA+oeMzDF52WdFe8lt/hHK
	iGsSYsBElP9njvbUmyoLedumYqFqQYTuwWSyOQ8kj7z04phbqbKLpxjR1JZNn/blkmC1
	SnYNOvsKVp2PFtK7oU5yd4W6sD+l6BEFGzdvmkWcsRHTzoox6C0JApokUl7k+hDOWYt+
	zisw==
X-Gm-Message-State: APjAAAXUtlJD/CfMswqWvO++oHGc1PkWutj4ZKaEIpZLpElBihT+ICf0
	p7W7wj+XGvaqRN/FOVkbVYQxYydYvmPSN1LW6Pc=
X-Google-Smtp-Source: APXvYqyd2E9ZbWRKIZRyLc9RgLfDDJwhjsE7kgxXTXOu0MKr9/LndHw76CH26USqnAtr1koCjuIIz34jpxlLYuV4flo=
X-Received: by 2002:a37:a3c7:: with SMTP id
	m190mr26527698qke.212.1579150453021; 
	Wed, 15 Jan 2020 20:54:13 -0800 (PST)
MIME-Version: 1.0
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
	<1579093951-77460-3-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1579093951-77460-3-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jan 2020 20:53:46 -0800
Message-ID: <CAMKF1soMRS8En6LM9GV==MaH2VYimpvxV6vB1F5pxds1h3KL=g@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python3-h5py: upgrade 2.9.0 -> 2.10.0
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
X-List-Received-Date: Thu, 16 Jan 2020 04:54:12 -0000
Content-Type: text/plain; charset="UTF-8"

There is a patch fuzz being reported, can you inspect the patch and
refresh it on top of 2.10.0

WARNING: python3-h5py-2.10.0-r0 do_patch: Fuzz detected:

Applying patch 0001-cross-compiling-support.patch
patching file setup_build.py
Hunk #1 succeeded at 55 (offset 2 lines).
patching file setup_configure.py
Hunk #1 succeeded at 206 with fuzz 1 (offset -2 lines).

also see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/202

On Wed, Jan 15, 2020 at 1:30 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> -License-Update: Copyright year updated from 2008 to 2008-2013.
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../python/{python3-h5py_2.9.0.bb => python3-h5py_2.10.0.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-h5py_2.9.0.bb => python3-h5py_2.10.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
> rename to meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> index 7822e463e..9db23918c 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> @@ -2,12 +2,12 @@ SUMMARY = "Provides both a high- and low-level interface to the HDF5 library fro
>  HOMEPAGE = "https://www.h5py.org/"
>  SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://setup.py;beginline=107;endline=107;md5=795ecad0d261c998cc526c84a822dff6"
> +LIC_FILES_CHKSUM = "file://licenses/license.txt;md5=798db444108a3ba1de5f804ff696ebb1"
>
>  SRC_URI = "git://github.com/h5py/h5py.git \
>             file://0001-cross-compiling-support.patch \
>            "
> -SRCREV ?= "8d96a14c3508de1bde77aec5db302e478dc5dbc4"
> +SRCREV ?= "1156f5ac1ca38db85dcd906cf19a7aba90d0b39a"
>
>  inherit setuptools3
>
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

