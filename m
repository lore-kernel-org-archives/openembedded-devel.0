Return-Path: <krussell7711@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id C7D6C7FCC1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 20:01:04 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id s3so1746224otk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 13:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=agiPZsvOgJQyv0rySxsGPGoYSQhnRCyhsbPcCaJjngk=;
	b=avBpkp11OySULSrBvPuigujcJ/zHYUAApMIbHH+JXMR3dhbgTdZYE/nCVhxqn/WnMe
	l+fM7qfPzWGcRbuJU2YZDWPH7slwIJckmmyHn1TmZVB1oQ5GGw7V9j8SKHA2iA19bQAZ
	3fWcMCRwiojiJk8hjHiA6bc5EwfkOU+lrI0KR3cdeQiw3PdVnJkc4dagAPTDnU3CzIT8
	j+rHZdoLzjSr6Q5OZovgZYb/hepuvQlOjQw9h5rZSQIaAGyUOdJ1sXAZQxMkp2DaiXOy
	YxOqZsCoH9rFuV7tR73R04e8DCTMujTmkcIbReN+2WsNVeLIVX2XH3qWUM11xknMOpmQ
	hlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=agiPZsvOgJQyv0rySxsGPGoYSQhnRCyhsbPcCaJjngk=;
	b=p8KDeVuh6fTR/RrHshBVGWJwN5nUYV+ov1lnx7nFg5alrjD5wtOZDrTKeETSa8zYUv
	pluvLhXGPxNlDfd1F0CDZrunNRiIiPw28ln9kQ9pKxxEGM8a1eS6PJVq3cnJsR1TXh3h
	VTB1+gBkwCa7lwFh1wwH9D6Jw2pdY2sTnaIT+Qfdm+JXZIYdVZouPwQWU1iRWjsgJ7Dz
	u1+R6+ofPlh6Aqs5WiIp1g/TzZaKFZL65Tq9i3D7WGyte7RIr6a77c3UTo9fucbNBAx+
	ReBMT5j+Unmr19NNARjjP2PYlg+446Emy0GJ+hGmWCgIlmsVYg2JEejYPEAmG++LO1Q/
	89tQ==
X-Gm-Message-State: APjAAAV64IrN6DJIsIgy9v9/geymuZwx3ErOJ1ne/FdRbScyrz45k3i3
	JN8jBlxBVsjEoXjKDIeJJKwhg7dPh4Ga6hiv0RcsUdmd
X-Google-Smtp-Source: APXvYqykBk6cvUUC488JqWr2500nJf9p7LUpMABIB9Jjfs1hLVRZXKSCrlMdDqWis0sCH3Qj7Szbor7wLocjZGAb7bw=
X-Received: by 2002:a9d:6c46:: with SMTP id g6mr6391405otq.203.1572638465302; 
	Fri, 01 Nov 2019 13:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190204220137.26744-1-bkylerussell@gmail.com>
In-Reply-To: <20190204220137.26744-1-bkylerussell@gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Fri, 1 Nov 2019 16:00:54 -0400
Message-ID: <CAFrQVPN7hstMH_LRvzGRW8HAd=a_m9wGWT9PYpidOKGqhSgqQQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, richard.leitner@skidata.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH] icedtea7-native: set default x11 PACKAGECONFIG from DISTRO_FEATURES
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
X-List-Received-Date: Fri, 01 Nov 2019 20:01:05 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Can you take a look at this patch I sent back in February?  I just ran into
a similar error during do_configure while trying to build icedtea7-native
from thud on a host without xorg-x11-proto-devel installed.  I think this
change should allow the X11 headers to build and be pulled from the
appropriate -native packages during bitbake instead of requiring the host
dependency.

Thank you,

Kyle

On Mon, Feb 4, 2019 at 5:01 PM Kyle Russell <bkylerussell@gmail.com> wrote:

> If x11 is specified in DISTRO_FEATURES, then make it a default
> PACKAGECONFIG option when building icedtea7-native; otherwise, the
> libx11-native dependency won't be satisfied.
>
> The recipe reads as though icedtea7-native can build completely without
> X11, but if the libx11-native headers are not installed on the host
> system, compile errors in multiple units because of a missing X11/Xlib.h.
>
> In file included from
> ../../../src/share/native/sun/awt/../java2d/pipe/Region.h:34:0,
>                  from
> ../../../src/share/native/sun/awt/../java2d/loops/GraphicsPrimitiveMgr.c:31:
> ../../../src/solaris/native/sun/awt/utility/rect.h:31:22: fatal error:
> X11/Xlib.h: No such file or directory
>
> In this example, it appears that GraphicsPrimitiveMgr.c is supposed to
> be compiled even in headless mode, so the dependency still seems to be
> needed.
>
> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/icedtea/icedtea7-native.inc
> b/recipes-core/icedtea/icedtea7-native.inc
> index 69f5d25..62dea78 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -11,7 +11,7 @@ DEPENDS = "virtual/javac-native virtual/java-native
> classpath-native \
>            unzip-native make-native util-linux-native\
>            "
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',
> '', d)}"
>  PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xorgproto-native
> libxt-native libxext-native libxrender-native"
>
>  OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG',
> 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
> --
> 2.20.1
>
>

