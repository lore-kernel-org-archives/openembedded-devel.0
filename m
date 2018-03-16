Return-Path: <samuli.piippo@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3163E788CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 12:58:11 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id e79so4311162ioi.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PzJ2NH8GIaDEIykKtxMaehyXfB4Qquw/fFqv4fW1fww=;
	b=YgwS5iii2WQfUOZe2EFsfZrPA8mUc+Mh9pdMBk5yOVH07fSGD3ObKU4YsvXWVn8QsA
	Hsxj6T4+z+5HrZZLVnskqmDEKEiVP9RmODl+WAl7OxFQkaxMjPMupjg7KI+hQbWCXvJz
	YonOotr5WsWX5WgnjBip5y376/mUbtiIjB3u/IUlWc7DAPZwx7ceaN9ljiukDP/wimxP
	cfvj/SsRWGiF0/VGL1byHysbWEVYPa6sYFjMg0yuKyNaaWd6FRV8KbcbOETcfLzhGEcs
	nlAQpU3GzvxrbVLVl9iovs9U0ChrFBeKXvX4IVpyR2XoKitfKghAmQlCFz1Z6p2YJEQj
	iEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PzJ2NH8GIaDEIykKtxMaehyXfB4Qquw/fFqv4fW1fww=;
	b=aXVfyDuFhs8/dUlRPhG/Ii1GXzpogzT71EUJioc67dJOX8nr8CI7K0x6j8oC7IJBCt
	plXCOn0xCZfcBvIcRpXys/cHKRQfNEF6X3ffiDdQMxG/bBnYXoaP5Zzref8/S5I7OENW
	Du+xYDtqX37VWVjUNBloiVKPb9DV+tmOqkovHYFbozpmjUSB/QwmI63ZWkFKdGzQuyrN
	hJMsu+7i0m2+mSqhrEyLgB2YXG7F24VXSp5q0L2btaiSrzSywKpBv+5MGRe5ciRIWgww
	7OWmDw9cFB0P9Cqvab3CuGj+TYlCABrIqQ4wTS6aiGnIMiHoum1fd3Fw0A/JWH14V+ZW
	J7kA==
X-Gm-Message-State: AElRT7Hs1dzfigVk6cMazrdwgdPhgkea/OYfKKTx0YEvEcYo0xH/uOCO
	u6UWl9aownQB1icz5i6joYybyC2R4FDtQ7Rh4dY=
X-Google-Smtp-Source: AG47ELttQ2tQ9I3ofQrmiGKONxRXJgrHDo2VhlJia7fpr6glhibHeeM/feILopz2QW9TURGJDjgNjkhhRLrPN4S69j8=
X-Received: by 10.107.137.158 with SMTP id t30mr1644073ioi.230.1521205092973; 
	Fri, 16 Mar 2018 05:58:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.146.139 with HTTP; Fri, 16 Mar 2018 05:58:12 -0700 (PDT)
In-Reply-To: <1521190809-26444-1-git-send-email-liu.ming50@gmail.com>
References: <1521190809-26444-1-git-send-email-liu.ming50@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 16 Mar 2018 14:58:12 +0200
Message-ID: <CABXoSoWWN3EESu3VKEeSONt9NTrYD+5wXEwGRo8Bccuc8t8PSg@mail.gmail.com>
To: liu.ming50@gmail.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] [PATCH] qtwayland: handle examples, tests PACKAGECONFIG
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
X-List-Received-Date: Fri, 16 Mar 2018 12:58:12 -0000
Content-Type: text/plain; charset="UTF-8"

This happens on every module, but only if you have examples enabled in
qtbase: https://github.com/meta-qt5/meta-qt5/commit/909858baf064216a3b221edb59b40cc93d536a44

On 16 March 2018 at 11:00,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <liu.ming50@gmail.com>
>
> The examples and tests parts of qtwayland are enabled by default even
> they are not passed by QT_BUILD_PARTS, so we need special logic set
> in qtwayland to explicitly disable them if they are not being chosen
> in PACKAGECONFIG.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-qt/qt5/qtwayland_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
> index 91ffcd7..aece932 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -35,6 +35,9 @@ PACKAGECONFIG[wayland-brcm] = "-feature-wayland-brcm,-no-feature-wayland-brcm,vi
>  PACKAGECONFIG[drm-egl-server] = "-feature-drm-egl-server,-no-feature-drm-egl-server,libdrm virtual/egl"
>  PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature-libhybris-egl-server,libhybris"
>
> +EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'examples', '', 'QT_BUILD_PARTS-=examples', d)}"
> +EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'tests', '', 'QT_BUILD_PARTS-=tests', d)}"
> +
>  EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
>
>  SRCREV = "db36bc0d9ccae21e84cd54be3e18ae539542eadc"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

