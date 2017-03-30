Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 684DA77D24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:49:04 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k6so11987048wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nvncU/ACo+0pDMjIdJQpaqlrInho500ZY81o4v/3XHQ=;
	b=F39+ddx5kIY7my3fklrHREtYMIqd+jVGTBaaq/TqPO2cO2imYMy+texVA5Sxx+yDZN
	zbkCogXYD5NyHs5/cE1cu3qls9Kkl/ZNcDc/mxsgzICkJTMhyMuE+30IBv/KWFspy0RR
	FVprbQ2xkkV7Z9I3NuwFaJsXrdrJFmkAM1cDeNt3QyKxLxsvM/4Tb1w2o2PNtfkOEkfX
	PLpzsGH+SCrli8s4XpPcQSrkohLeM4FufQnnVIKRElKzI4eLTiNNL5OHhAozSDrOPHef
	rvQ08hp2RJ+AhHQ+qMYshnELW8z6QaJPM6s+RRDCqX2oCBwJrYBRvB1g8pO1cOohPmGX
	vXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nvncU/ACo+0pDMjIdJQpaqlrInho500ZY81o4v/3XHQ=;
	b=DzwhQhRAdWhz7zvoNExnQ7b4gE15ajsJ1Vaa0GEVQ/CCAFlijdqLM2/EMeP6xSEy9s
	M2ap+0VFx51Q3wN4Ji4owiwQ7HJRICIz60kKkVMuJ0og/ggMX2x7QspBewOBMcL2bdkn
	6ETckrmvZAB+B/8V/XfcoK9W4N72wc8rk8L4oMQwQN0DppfL9F8Uj59EVcEsUsie66BI
	+jZVLZ8S+plTdWtZrMkm+rKidCHsvOcCo9F1zMrIW6kg4XnR/mh7tt1jXUis/8+3xD0Q
	DHaK7qT28BTMLYhylj/4xm7xb3k+C4NBu9YCJ2q2roxe9OKmzN45cNUZ2WJ0+SvLikwi
	OVzA==
X-Gm-Message-State: AFeK/H2kcv7uYCf26F5JsaRG27t4XW3VtAwHWORqFb3940RGWTqVRzlwECYQQrXEceV+nKHQuMp7M8ZblmlZ7A==
X-Received: by 10.28.134.70 with SMTP id i67mr4168257wmd.124.1490888945161;
	Thu, 30 Mar 2017 08:49:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 30 Mar 2017 08:49:04 -0700 (PDT)
In-Reply-To: <20170321055346.24665-1-kai.kang@windriver.com>
References: <20170321025110.3562-1-kai.kang@windriver.com>
	<20170321055346.24665-1-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 Mar 2017 17:49:04 +0200
Message-ID: <CA+chaQeDxFhUHzP2KinSOG2d9FYRTLnLbq630LOwn2fJX26RUg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] gflags: correct S and update library install directory
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
X-List-Received-Date: Thu, 30 Mar 2017 15:49:04 -0000
Content-Type: text/plain; charset=UTF-8

This could be the reason for opencv failures:
http://errors.yoctoproject.org/Errors/Details/138538/


On Tue, Mar 21, 2017 at 6:53 AM, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> The current setting of S is not right for multilib. Remove the setting
> and use the default value.
>
> And library install directory is not right either. Pass ${libdir} to fix
> the [installed-vs-shipped] QA issue:
>
> | ERROR: gflags-2.2.0-r0 do_package: QA Issue: gflags: Files/directories
> | were installed but not shipped in any package:
> |   /usr/lib/libgflags.so
> |   /usr/lib/libgflags_nothreads.so.2.2
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
> b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
> index b9188c3..77617ef 100644
> --- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
> +++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
> @@ -8,13 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=
> c80d1a3b623f72bb85a4c75b556551df"
>  SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz"
>  SRC_URI[md5sum] = "b99048d9ab82d8c56e876fb1456c285e"
>  SRC_URI[sha256sum] = "466c36c6508a451734e4f4d76825cf
> 9cd9b8716d2b70ef36479ae40f08271f88"
> -S = "${WORKDIR}/${PN}-${PV}/"
>
>  FILES_${PN}-dev += "${libdir}/cmake"
>
>  inherit cmake
>
> -EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF"
> +EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF
> -DLIBRARY_INSTALL_DIR=${libdir}"
>
>  PACKAGES =+ "${PN}-bash-completion"
>  FILES_${PN}-bash-completion += "${bindir}/gflags_completions.sh"
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

