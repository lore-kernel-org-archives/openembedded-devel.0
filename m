Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD657EDFB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 03:13:02 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d15so803889qkl.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 20:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ha8Qtlw1JRgf7v0+HFdRXQeM8gpJe4rPnN0ZuhH3rNc=;
	b=pPd6HueN7yqTyXoaNlpWlq32BAL+MSpnkfys+alinlYzlKLcxdaesbkHT34TqFhXDY
	iiQXJd5Xgncm74l81p/JAvj0VR72GASUqZRaKQ4XIupd/4ZMa71vg9tG5VXqGXRhh6Ds
	+Ouy1PdO6YoZctqrhSAaoQX5Gco4AiucSpyIVDiuqwCBUY8n6HvRrVjrMXzU9MCcmwP9
	+Sho+4M/sV3QafxSdVyaokTbx9eTGq9FPaSKCd9p3AgoX5A60nYYNJV+U/iUOb9QHQb2
	xqbOOJAqSKEKHv1rzS2rLiKo6F/PVY+o/zDyc+bLKGupgFZnf3d1n8L/t7SSAdoLYpik
	icoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ha8Qtlw1JRgf7v0+HFdRXQeM8gpJe4rPnN0ZuhH3rNc=;
	b=TN59BZnqMglSHcwFpTsmxjnPr9dRqTeGgA2mNi+q/kTS7tPgi8Ap+lFPtZhIzfEKxQ
	1tQi1TtHYOQHxpCup6UHXz8IkRck8jfJNiKZ7wGdGtM/95qoAaZeyzgFGRXfPapfUZVm
	9x72YAVoyFJpkTsgs/gsWOvUWNFxvg2uuxBz15gvyVEbNTk/BsfET9VltGVmF/lr5yGY
	VYMXN4ZGSVS0PxvLHyAcSbdE4Pq54z3VCAG3AwSf2tXoJBNEprXN/59h6gV1A8Bfr9D5
	IFaNR/WzHUiqa4VvDbxK/7dM4HGggBiuJSQiSHcMRYx5XI/YAEPUdOVFORPtA/7Vj/sI
	kN8Q==
X-Gm-Message-State: APjAAAVCTlsFbDnhWGtkpjZqoE6TRgbOWPmVfZWIZYFi6S6OdGmsuCE1
	Ldq2QI55mPg7ChhYkbnTwHMHrJSivn4AVF5ydHk=
X-Google-Smtp-Source: APXvYqxYfJbm6qfawgN1lFMV6hI8wdLyb/K8NBjF7nuHxGDbOhq8ue4gKDXRIf+5Vkuc30m3v87Ttv4MNsUCnpKe5kU=
X-Received: by 2002:a37:c81:: with SMTP id 123mr22237201qkm.474.1562728383783; 
	Tue, 09 Jul 2019 20:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190710023525.25506-1-kai.kang@windriver.com>
In-Reply-To: <20190710023525.25506-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 20:12:49 -0700
Message-ID: <CAMKF1srOY5ZTo=m9u13rhgcE4u7747bEPPRqqF5VPio7Uh3jdw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libvncserver: update to latest commit 1354f7f
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
X-List-Received-Date: Wed, 10 Jul 2019 03:13:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 7:35 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update libvncserver to latest git commit 1354f7f which could help to fix
> do_package error when multilib is enabled:
>
> | Files/directories were installed but not shipped in any package:
> |   /usr/lib/libvncclient.so.0.9.12
> |   /usr/lib/libvncclient.so.1
> |   /usr/lib/libvncclient.so
> |   /usr/lib/libvncserver.so.0.9.12
> |   /usr/lib/libvncserver.so.1
> |   /usr/lib/libvncserver.so
> |   /usr/lib/pkgconfig
> |   /usr/lib/pkgconfig/libvncserver.pc
> |   /usr/lib/pkgconfig/libvncclient.pc
>
> Rename recipe name from _git.bb to _${version}.bb as well.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../{libvncserver_git.bb => libvncserver_0.9.12.bb}           | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-graphics/libvncserver/{libvncserver_git.bb => libvncserver_0.9.12.bb} (92%)
>
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
> similarity index 92%
> rename from meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> rename to meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
> index bc47a3f15..683a29f94 100644
> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
> @@ -31,7 +31,9 @@ FILES_libvncclient = "${libdir}/libvncclient.*"
>  inherit cmake
>
>  SRC_URI = "git://github.com/LibVNC/libvncserver"
> -SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
> +SRCREV = "1354f7f1bb6962dab209eddb9d6aac1f03408110"
>  PV = "0.9.12+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

