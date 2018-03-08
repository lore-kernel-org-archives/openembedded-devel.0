Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id BA2C77885B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 22:07:28 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id v65so7178329wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2018 14:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QtUzi5waHJBuGpp+PstmgQfy7oWhsZnzT6Nc7KtlOq0=;
	b=goJzImrbpB1Uh7fY4xG48OxQGByPIXpyktH09OEKz7WTsmV6QOrzgFFZLx5WFmqMA6
	0zQzFc8+pR2g90FzCnCeZ45JI55TGWLd+6pPqIfv0f4rRNvj06PxWRxmp74vf3c16apr
	GphQ+eWnseMc2yNTLc3TSCYbC/WgwR0nAPSHWPpzGH1or9pxj608YJeqrGKx68wEDILJ
	4QY0LIrOl6I9eBp4tl1wKwa9+d4u7c56/xgijqzRXOrC9HO/pyLKwUR6t9pT0IaSazoO
	PBC8O8baPZaDUp0twQUO+b8pSFZa8n7zXbyJDywuwclDOzodPOEM2wq3YIlOGmFVo2YV
	vMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QtUzi5waHJBuGpp+PstmgQfy7oWhsZnzT6Nc7KtlOq0=;
	b=kKEfMXu6wpRS1agYyvBs+SlnHXgjpqqytD2gQJ6ZpnEmD68fpHywqIQmFjsqin2EKZ
	qeBRcR/7nOWt/Swqil19Vntm6Y/cfM3q+U2//JYfDlsB5DKOB0eSiNSFlgnI3an8ogIe
	KEn/5jFPJQp63mFPSKXJtIY3xQE79BkAoqlBKkRY6dMHeewW0mZQ5bBIVwVlIEVQ/eBh
	uE0uv8Wul8lMCKzBjCGxfC/Z3SKX0BHNcjfQBwmWhAzB7RcIIhoY6MqFZu9mJyMpTotW
	MT8yTqktAvhVp/oWbzXWRjnhW9qsqJTCYu06cXBe2urdMQ5cuSz+6Dzxt2XDbHVsqeDv
	izGQ==
X-Gm-Message-State: APf1xPB0KhdttVEhbiQZRFil7sG1kZPxmzLze0n87BxGhe6+FyTgkgBR
	4nI2QPkMHSJKDQmClXpXEe9OlHo/PmP8s8yBy+U=
X-Google-Smtp-Source: AG47ELsZfX8GYw3Dpp5AYnI9PVbg4r+WL79zishPdrtCCk2f2BiCJcCJngMTncrTs1+P0RsCOWU0wyN1eD1Y2qfVSEU=
X-Received: by 10.223.144.2 with SMTP id h2mr23007656wrh.114.1520546849506;
	Thu, 08 Mar 2018 14:07:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.193 with HTTP; Thu, 8 Mar 2018 14:07:29 -0800 (PST)
In-Reply-To: <20180308174316.36662-1-raj.khem@gmail.com>
References: <20180308174316.36662-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 8 Mar 2018 14:07:29 -0800
Message-ID: <CAJ86T=WNtG1GCk4AkR5Ysd6jTZYWeUKabbR724fouKueOjoXcQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Pass -DMESA_EGL_NO_X11_HEADERS=1 when x is disabled
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
X-List-Received-Date: Thu, 08 Mar 2018 22:07:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 8, 2018 at 9:43 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Some graphics drives e.g. mali/mesa depend on this define
> to use proper guards in eglplatform.h

Would it be better to patch the header directly rather than try to
arrange that every application which uses it defines the correct
CFLAGS?

> Fixes
>
> | In file included from /mnt/a/zonit/build/tmp/work/aarch64-bec-linux/qtmultimedia/5.10.1+gitAUTOINC+038716bb1f-r0/recipe-sysroot/usr/include/EGL/egl.h:36:0,
> |                  from .moc/../../../../../../git/src/plugins/videonode/egl/qsgvideonode_egl.h:48,
> |                  from .moc/moc_qsgvideonode_egl.cpp:9:
> | /mnt/a/zonit/build/tmp/work/aarch64-bec-linux/qtmultimedia/5.10.1+gitAUTOINC+038716bb1f-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:125:10: fatal error: X11/Xlib.h: No such file or directory
> |  #include <X11/Xlib.h>
> |           ^~~~~~~~~~~~
> | compilation terminated.
> | make[4]: *** [Makefile:461: .obj/moc_qsgvideonode_egl.o] Error 1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qt/qt5/qtmultimedia_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
> index 2cb1bd5..efe848f 100644
> --- a/recipes-qt/qt5/qtmultimedia_git.bb
> +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> @@ -25,6 +25,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
>  # Disable GStreamer if completely disabled
>  EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
>
> +CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DMESA_EGL_NO_X11_HEADERS=1', d)}"
>  # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.10
>  # 5.10.meta-qt5.2
>  SRC_URI += "\
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

