Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB0871A8E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 18:35:23 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id s143so26671299ywg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 11:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qj+nZvXsxhSyypzinULCqGmD4dnIVNyxqEkIbkoGWNA=;
	b=i74sG3vlqyeD/KYY0xHmkdqOuIneWBoS+k79FG/fACFrOnBNuQeugYfTRhmu3c/RmY
	3sN0eJjBU33XU4hEbzx7PDblhfDq/FG1g09b/tYBtuBRGE5YwPCq40+NuvVqa5Hzr+CL
	KC5ZpJFx+FQgz8Mpgcmy4/WUaK96gpuQqOIPvbk+SVcs+Ywrrw1I8qHQdJaj8I/j8YR/
	nHJsm3ng6FVhPBovQLEiQSaBFweMV1e5LJrOXkD89fwvwu9+rVNnXRfDNCGJQccU9vwW
	1AP2DIZZrKPeDDtRsLKQD4ziQrapU9ybW17ROkW27OElEO2PL+YWVzgxIl/SPtiqn3gu
	jxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qj+nZvXsxhSyypzinULCqGmD4dnIVNyxqEkIbkoGWNA=;
	b=FO03KjQAjD6aB50ilf81lD8bOLASwewEpLIlCtXVpucvC7PFSwgxbDClNJCbrl0nlt
	3TEE0hXESuVmbj/nsCAe4NMVxS356lwuoyWb/fasoMnb8ERrCCIP+hA5HN3zPr+r5D5a
	on2tDFcfR36ks3Eb+EZiwigkoavtwUiSeb37mnIRSCLUDLD3Eds4tQ/x7Vsnkx0YlyI+
	tDuVUnERa9LRDj/zMZFbqR+Qgeq6WMK2f2xeMErjEMUfJEciiRZpoKWDWweX6hfji1wq
	HTY1NwjvtMGH0S3ESaycLAT/srEu/A+PbKSu5nJfwdxxGGPr1e/Ji+eTsqjDd3O5HLeX
	Pnzw==
X-Gm-Message-State: AHYfb5i3anyi6FlfEPXPuhDks3a4wYaNwiwADfbNJ1D05xrlDro4HLH4
	UfqmndyCDoHu5Pp+xzHGZLjPEmiqAQ==
X-Received: by 10.37.160.207 with SMTP id i15mr209933ybm.162.1502217325257;
	Tue, 08 Aug 2017 11:35:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.172.196 with HTTP; Tue, 8 Aug 2017 11:35:24 -0700 (PDT)
In-Reply-To: <VI1PR0802MB2191EBB7271C730F6CF64E22A1BF0@VI1PR0802MB2191.eurprd08.prod.outlook.com>
References: <VI1PR0802MB2191EBB7271C730F6CF64E22A1BF0@VI1PR0802MB2191.eurprd08.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 Aug 2017 20:35:24 +0200
Message-ID: <CA+chaQcTES6sSR5qADvQPtNdvy4os1vPCti=dic+gPreGvLWrg@mail.gmail.com>
To: Wouter van der stoel <woutervdstoel@outlook.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Updated mpv to version 0.26.0.
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
X-List-Received-Date: Tue, 08 Aug 2017 18:35:25 -0000
Content-Type: text/plain; charset="UTF-8"

Missing SOB line and the summary should start with modified component so
something like:

mpv: upgrade to version 0.26.0

See http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines and
resend v2.

On Fri, Jul 28, 2017 at 4:50 PM, Wouter van der stoel <
woutervdstoel@outlook.com> wrote:

> Updates the mpv package to version 0.26.0.
> The patch that was previously necessary related to OpenGL has been added
> upstream.
> ---
>  .../mpv/0001-Fix-build-with-HAVE_GL-0.patch        | 39
> ----------------------
>  .../mplayer/{mpv_0.24.0.bb => mpv_0.26.0.bb}       |  5 ++-
>  2 files changed, 2 insertions(+), 42 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-
> with-HAVE_GL-0.patch
>  rename meta-oe/recipes-multimedia/mplayer/{mpv_0.24.0.bb => mpv_0.26.0.bb}
> (92%)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-HAVE_GL-0.patch
> b/meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-
> with-HAVE_GL-0.patch
> deleted file mode 100644
> index ab2b534..0000000
> --- a/meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-
> with-HAVE_GL-0.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 212f6c8206bd4dcc7d8970c5f1632823ae4e783a Mon Sep 17 00:00:00 2001
> -From: Michael Forney <mforney@mforney.org>
> -Date: Sun, 12 Feb 2017 23:01:21 -0800
> -Subject: [PATCH] Fix build with HAVE_GL==0
> -
> -video/out/opengl/hwdec.h includes video/out/opengl/common.h, which tries
> -to include opengl headers.
> -
> -Upstream-Status: Backport
> ----
> - options/options.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/options/options.c b/options/options.c
> -index b711156..0bb36ad 100644
> ---- a/options/options.c
> -+++ b/options/options.c
> -@@ -40,7 +40,6 @@
> - #include "stream/stream.h"
> - #include "video/csputils.h"
> - #include "video/hwdec.h"
> --#include "video/out/opengl/hwdec.h"
> - #include "video/image_writer.h"
> - #include "sub/osd.h"
> - #include "audio/filter/af.h"
> -@@ -53,6 +52,10 @@
> - #include "video/out/drm_common.h"
> - #endif
> -
> -+#if HAVE_GL
> -+#include "video/out/opengl/hwdec.h"
> -+#endif
> -+
> - extern const char mp_help_text[];
> -
> - static void print_version(struct mp_log *log)
> ---
> -2.9.3
> -
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
> similarity index 92%
> rename from meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> rename to meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
> index b1da217..a154e50 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
> @@ -14,10 +14,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 91f1cb870c1cc2d31351a4d2595441cb"
>  SRC_URI = " \
>      https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
>      http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=
> waf;subdir=${BPN}-${PV} \
> -    file://0001-Fix-build-with-HAVE_GL-0.patch \
>  "
> -SRC_URI[mpv.md5sum] = "5c85d1163911e49315a5bf1ca1fae13d"
> -SRC_URI[mpv.sha256sum] = "a41854fa0ac35b9c309ad692aaee67
> c8d4495c3546f11cb4cdd0a124195d3f15"
> +SRC_URI[mpv.md5sum] = "038d0b660de07ff645ad6a741704ecab"
> +SRC_URI[mpv.sha256sum] = "daf3ef358d5f260f2269f7caabce27
> f446c291457ec330077152127133b71b46"
>  SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
>  SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c
> 8e496d3da4a2ca343fe091f22fca60c98b"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

