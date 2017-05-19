Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 314E877F58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 19:16:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id k15so18718950wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 12:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ghkECLJStBQkfDCzMP30S4YNpFW29Ft3/2haCwezkzs=;
	b=jRmed/5RoeoyrS+yOkzGF/H++10dmAYuP8PuAKvz5F7ve0Ts4kMzymoFwUZmpyD3Nh
	Hiko+MkLfpJmrSnbG2/dsC5jfCGge++vSgk6SIwNOksuyRFopRclf/CQy1UI4FP7vB6P
	6LsG9h6nDIhyFLh+fv8593lUGez6vaMLLYmjcHCbGq+a/CKjCBcMmv4qVfuK8NKmav5F
	PgGJmiSGbCGLMMTNQvvSamZQEiHNzSgsMymAwOC52s/7gYKAOoCLbB4gLxVobIEM0P2E
	Q+faAAHClQ4Hz3IZNWHD9sjx5S53iUJqgtRI+TqP5UFLmV3kB7mXUIP6uaglhp69Qezz
	Vreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ghkECLJStBQkfDCzMP30S4YNpFW29Ft3/2haCwezkzs=;
	b=KZ6+MnJgk4sf4swRZZkRzd7zNJqrH74lS5hnGBdNZLTjcwpOGDiqLDaT2891oYkL3C
	UMsrW3vZU9dvaGew8gTVdNZldjito6sP9ywZXifAD86Fswcq0dsfm4qGI3iQUklslvRR
	TGasXZKfT91jL/aT0AIMHU6zBW/VaKoGzd4chyL4tnbABTtauFarNXw++bdAV4hT2GlU
	fFevAsGTNA8kxXhsOkr4Mt6YqAcp6bykC7iPhYa3/rhKYIFm34ZfbM76GH0lwe5Rv9U4
	lsbaVxE+Dl2XgnZe3Sg9O/Wnd0fQREperdyUIxGCvMmZ2E9GQxFBYtirz6cCz+5aQny1
	lvow==
X-Gm-Message-State: AODbwcBm7NTKgaz86zXebnnEYj7L6D+n+0FbX0J9KUgV0b3VUfs+LAcC
	Th44YVCp8sBRrcMb59+wQCQP0Wog2Q==
X-Received: by 10.80.163.213 with SMTP id t21mr8402393edb.158.1495221373923;
	Fri, 19 May 2017 12:16:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Fri, 19 May 2017 12:16:13 -0700 (PDT)
In-Reply-To: <20170516094516.22549-1-clement.perrochaud@openmailbox.org>
References: <20170516075335.GB3088@jama>
	<20170516094516.22549-1-clement.perrochaud@openmailbox.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 May 2017 21:16:13 +0200
Message-ID: <CA+chaQfnWjXOboJyh6OYa5642RcZ-jS5Wkn8FoDZFfXYX94o=A@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Perrochaud?= <clement.perrochaud@openmailbox.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xf86-video-geode: Update to 2.11.18
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
X-List-Received-Date: Fri, 19 May 2017 19:16:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Still seems to be failing:
http://errors.yoctoproject.org/Errors/Details/142984/

On Tue, May 16, 2017 at 11:45 AM, Cl=C3=A9ment Perrochaud <
clement.perrochaud@openmailbox.org> wrote:

> This release includes the patch required for 2.11.16 and fixes the
> build issue.
> Removed from blacklist.
>
> Signed-off-by: Cl=C3=A9ment Perrochaud <clement.perrochaud@openmailbox.or=
g>
> ---
>  ...1-Add-config.h-include-to-src-lx_memory.c.patch | 41
> ----------------------
>  .../xorg-driver/xf86-video-geode_2.11.16.bb        | 16 ---------
>  .../xorg-driver/xf86-video-geode_2.11.18.bb        | 12 +++++++
>  3 files changed, 12 insertions(+), 57 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-
> driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patc=
h
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/
> xf86-video-geode_2.11.16.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/
> xf86-video-geode_2.11.18.bb
>
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/
> 0001-Add-config.h-include-to-src-lx_memory.c.patch
> b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/
> 0001-Add-config.h-include-to-src-lx_memory.c.patch
> deleted file mode 100644
> index fcd2f684b..000000000
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/
> 0001-Add-config.h-include-to-src-lx_memory.c.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 621d946e56efac2c779b83b1a5c6b645169c4ebd Mon Sep 17 00:00:00 2001
> -From: "Brian A. Lloyd" <brian.lloyd@familyhonor.net>
> -Date: Wed, 1 Oct 2014 12:35:18 +0300
> -Subject: [PATCH] Add config.h include to src/lx_memory.c
> -
> -The src/lx_memory.c file uses the xf86.h header file.  This file must ha=
ve
> -HAVE_STRNDUP defined before calling it when the building platform has a
> strndup
> -function.  When using config.h, this file doesn't have that define and s=
o
> fails
> -to compile.
> -
> -The attached patch adds the conditional config.h to this file so it may
> compile
> -on the affected platforms.
> -
> -The patch is trivial and may be included and used under whatever licensi=
ng
> -desired.
> -
> -Closes: Free Desktop Bug #84541
> -
> -Signed-off-by: Brian A. Lloyd <brian.lloyd@familyhonor.net>
> -Upstream-Status: Backport
> ----
> - src/lx_memory.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/src/lx_memory.c b/src/lx_memory.c
> -index f26d280..992446f 100644
> ---- a/src/lx_memory.c
> -+++ b/src/lx_memory.c
> -@@ -22,6 +22,9 @@
> -  * contributors may be used to endorse or promote products derived from
> this
> -  * software without specific prior written permission.
> -  */
> -+#if HAVE_CONFIG_H
> -+#include "config.h"
> -+#endif
> -
> - #include "xf86.h"
> - #include "geode.h"
> ---
> -2.1.1
> -
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_
> 2.11.16.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_
> 2.11.16.bb
> deleted file mode 100644
> index e543413ad..000000000
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require recipes-graphics/xorg-driver/xorg-driver-video.inc
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De7f3e39474aeea5af381a8e103daf=
c36"
> -
> -SUMMARY =3D "X.org server -- Geode GX2/LX display driver"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://0001-Add-config.h-include-to-src-lx_memory.c.patch"
> -SRC_URI[md5sum] =3D "35fa387f6a33f6b22a56ce4bda424392"
> -SRC_URI[sha256sum] =3D "38fc1f55e29fb7985b90c9021a4b7e
> 5295d42888bd669174f42f3b7f681fc1a7"
> -
> -COMPATIBLE_HOST =3D "i.86.*-linux"
> -
> -RDEPENDS_${PN} +=3D "xserver-xorg-module-exa"
> -
> -# 2_2.11.16-r21.0/xf86-video-geode-2.11.16/src/gx_driver.c:376:20:
> error: implicit declaration of function 'xf86MapVidMem'
> [-Werror=3Dimplicit-function-declaration]
> -PNBLACKLIST[xf86-video-geode] ?=3D "BROKEN, fails to build - the recipe
> will be removed on 2017-09-01 unless the issue is fixed"
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_
> 2.11.18.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_
> 2.11.18.bb
> new file mode 100644
> index 000000000..0c338c5f3
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.18.bb
> @@ -0,0 +1,12 @@
> +require recipes-graphics/xorg-driver/xorg-driver-video.inc
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De7f3e39474aeea5af381a8e103daf=
c36"
> +
> +SUMMARY =3D "X.org server -- Geode GX2/LX display driver"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "7d049187ee3640087e99f4267de6baf1"
> +SRC_URI[sha256sum] =3D "d6ece9a862a68be3cdf86a87e0e1ba
> 5e199168b8d075129646638f53649ba9e8"
> +
> +COMPATIBLE_HOST =3D "i.86.*-linux"
> +
> +RDEPENDS_${PN} +=3D "xserver-xorg-module-exa"
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

