Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8B313719A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:07:31 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id n202so4000335oig.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=1oyEIWEgy3pdTj/YlgN4tm3o43Nh0rkok/zV4Z5V6DE=;
	b=w5AcCwOidi4/GEyeZDYDfDfeT/hiHtRNAQnUHhoBcraAhS3OarnqBVcMLHz6jN8L67
	KGifnu3/DktL3BF2NoVrbfdssipAMi2XgTKz042jEqA0cz/jcnXHptaENLsUZaH/vb/I
	/ibFY4Z57+1uNbswEn03WWhWFWztZEXPvn6xG7fgS6XtTi05RDZ01T1xd5C7P1VXt9m2
	EoOyTHtckoMEqLiBy+AM2swyvL/gRwxE65zq3W8dsjuv71Cp6MVBEyPCdu9WE4y1U7rm
	OFH6NYz6mACBcDuf4Lyz4KWl4ObaPfegMx+gGIbTtRDWDpg+fWJWO5G3II2Rvq8F8nxo
	DM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=1oyEIWEgy3pdTj/YlgN4tm3o43Nh0rkok/zV4Z5V6DE=;
	b=mDwYABZ8hM4XzIdTz5xwDM0js/wZCAdGgm137JYd2bE246CZVGNkTv8DF8k5Cz9871
	dTgn1M5W1XHQxj8ll77ROjqvK2WCs8hnhWW3fBpbYjVVZblc49ckFahx9+Pvdd+/01Zm
	nj3+ng6z9+l5LNHgrWjl3Fw2R0erKqoibj95d6TSjuuMZ5rqDpfZoKnkwnVPV72HCZCK
	jGxAvQG13EyvaS1W9e9wnZKkaZoCULH/LdcRGdiRPmzZt8JHBv9xOOJzf+3UvShE1pCL
	16TaFeUmZA59zCPdoVnUDEbBkhRcSC/cVT5bOYXnRgaLnZ4mvWzzfgZiIIcfT0LY1OQC
	0slQ==
X-Gm-Message-State: ABUngvdl5q0m8XbTqTnfS4NA/A0lgKSZaRE8spNV9EIQqs40Ml+nik4AmQiSg/YxJQnB9+ZzcNzfvAjFnsVrbw==
X-Received: by 10.157.58.35 with SMTP id j32mr10511542otc.166.1477667252012;
	Fri, 28 Oct 2016 08:07:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Fri, 28 Oct 2016 08:07:11 -0700 (PDT)
In-Reply-To: <1477649243-26613-1-git-send-email-ting.liu@nxp.com>
References: <1477649243-26613-1-git-send-email-ting.liu@nxp.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 28 Oct 2016 08:07:11 -0700
X-Google-Sender-Auth: TD5BmKYGPenZNAvyR4L5BK5L7WQ
Message-ID: <CABcZANnSmHOMkrKJ3M6CQN62+JHXCbRzXKZ3Ucx8PQ2_9cfmhQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] xterm: use ${libdir} to avoid installed-vs-shipped error on ppc64
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
X-List-Received-Date: Fri, 28 Oct 2016 15:07:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 28, 2016 at 3:07 AM, <ting.liu@nxp.com> wrote:

> xterm installs files into PREFIX/lib/X11/app-defaults by default.
> This leads to QA issue on ppc64 which defines libdir as /usr/lib64:
> ERROR: QA Issue: xterm: Files/directories were installed but not shipped
> in any package:
>   /usr/lib
>   /usr/lib/X11
>   /usr/lib/X11/app-defaults
>   /usr/lib/X11/app-defaults/UXTerm
>   /usr/lib/X11/app-defaults/KOI8RXTerm-color
>   /usr/lib/X11/app-defaults/XTerm-color
>   /usr/lib/X11/app-defaults/UXTerm-color
>   /usr/lib/X11/app-defaults/KOI8RXTerm
>   /usr/lib/X11/app-defaults/XTerm
>
> Fix it by passing --with-app-defaults=${libdir}/X11/app-defaults to
> configure.
>
> Signed-off-by: Ting Liu <ting.liu@nxp.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/xterm_325.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> index e0baf3c..48556c7 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> @@ -14,6 +14,7 @@ PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft
> fontconfig fre
>
>  EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
>                   --x-libraries=${STAGING_LIBDIR} \
> +                 --with-app-defaults=${libdir}/X11/app-defaults \
>                   FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config
> \
>                   --disable-imake \
>                   --disable-rpath-hack \
>

Are you sure this is correct? I highly doubt those files are actually
multilib specific. Would it not be better to just package these files in
their current location?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

