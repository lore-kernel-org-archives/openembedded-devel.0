Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02428788EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 18:35:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id h21so6920358wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 10:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=21/o17xjPJu1MjkSShFpO6gyAaBs9uMJb5Ug5fQ9GS0=;
	b=GnWjLW9QYXQRCEE1WSJNHDJ0PmKzv/FWih9wC+qHz1W8lM2vCBZ6do5vWWczu37UuY
	jdRbIDnQoyF85zYXHO5VnXxSeeveaIvZhw5ucNxjkQ9a9C+vmGC3VQxexAogNuVhIBJx
	0Tsyafp1JHxX6VEQ9QN2APpr5XQcSBuSPQ/w+WfibiVAAHfyPshcEHPHRB4S0E79Q6EK
	BV+CVKMbVojgfBoSKPm4Dy65ytKgC6Gdt3WDnnAM6e9odxvM5MXmV9ePnYNqdAujFnsB
	+C1vfYW8x8yrNaMeMXCiJHmPyC7NvBGq8xakNR23yYN2qQBUhNIi1FuDHPxyZ98Ja1l+
	pMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=21/o17xjPJu1MjkSShFpO6gyAaBs9uMJb5Ug5fQ9GS0=;
	b=B8nXR9GCT7q3c8z/Mk99+A+n+ocE5ORJqPKxwkM7+MJq2hJ60vlAmC7Hsc8v1WJTK4
	60OumbMeiMwJ85ZT+sq1ULVSJQEiOtFgVh0KkIeQcTI+ERO7oGovlhzdJ6sRl9VogNHI
	Vi4pKmBbHr606Rxnhj8rXXnFYZ3a3Eiq5rDVOcoqk0331gcyIbnO0YTMcbJ/kTF8cpHY
	Np8UCFQ73AbQWRA7LqzivLY3oTaVZnXjaVE/ddzQPekyqN6hWxTyI5/FgrUtAm0RJRKz
	Vdnq4hmN7oGpYM3CLRexZvw3cdZgCbTO5Py+BhOVw+7z+Twm+eAw280FMr7LuDQZMrWy
	Ls/Q==
X-Gm-Message-State: APf1xPCn9SGMlmO4YKv/bF45ie7wss6GMqd+WGhTF2moN0eM95JBpD14
	Xx9M/bHjD4z0UBjQr0g7yTXmT5K3gTk/Pd8vNKw=
X-Google-Smtp-Source: AG47ELtmOnr12/pfj0zbs2GOcXmrOn+kMVHUfAazNsSYR1wEdh3ftG0o7OkL7DbSZcfpqr6V38ZejY0lPydqfAzxlpk=
X-Received: by 10.28.212.141 with SMTP id l135mr13414438wmg.122.1519842942557; 
	Wed, 28 Feb 2018 10:35:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 28 Feb 2018 10:35:41 -0800 (PST)
In-Reply-To: <20180119151942.19731-3-Martin.Jansa@gmail.com>
References: <20180119151942.19731-1-Martin.Jansa@gmail.com>
	<20180119151942.19731-3-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 28 Feb 2018 19:35:41 +0100
Message-ID: <CA+chaQdV4GUzF_dH200=p7RQWZv8Ad4JDNJJs+ZcmyaW=ncGgA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 3/3] xorgxrdp: add distro_features_check for x11
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
X-List-Received-Date: Wed, 28 Feb 2018 18:35:42 -0000
Content-Type: text/plain; charset="UTF-8"

ping

On Fri, Jan 19, 2018 at 4:19 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * fixes: following errors in every world build:
>   ERROR: Nothing PROVIDES 'xrdp' (but meta-oe/recipes-support/xorg-xrdp/
> xorgxrdp_0.2.5.bb DEPENDS on or otherwise requires it)
>   xrdp was skipped: missing required distro feature 'x11' (not in
> DISTRO_FEATURES)
>   ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>   Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'xorgxrdp', 'xrdp']
>
>   ERROR: Nothing PROVIDES 'virtual/libx11' (but
> meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb DEPENDS on or
> otherwise requires it)
>   libx11-diet PROVIDES virtual/libx11 but was skipped: missing required
> distro feature 'x11' (not in DISTRO_FEATURES)
>   libx11 PROVIDES virtual/libx11 but was skipped: missing required distro
> feature 'x11' (not in DISTRO_FEATURES)
>   ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>   Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'xorgxrdp', 'virtual/libx11']
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> index 20cf45f06d..6150865795 100644
> --- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> @@ -1,15 +1,16 @@
>  SUMMARY = "Xorg drivers for xrdp."
>
>  LICENSE = "X11"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a2523660329fdca3d954c0a87390e007 \
> -"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a2523660329fdca3d954c0a87390e007"
>
>  inherit autotools pkgconfig
>
>  DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
>
> -SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git \
> -           "
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git"
>
>  SRCREV = "c122544f184d4031bbae1ad80fbab554c34a9427"
>
> --
> 2.15.1
>
>

