Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1854671A00
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 08:56:17 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id l126so17739582vkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 00:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=+QOVxtwDDicHR9WKgqGIKPIutN9SXV9YMw0gHSVIDJE=;
	b=TAiPbsDRpuDn0sQVb3IFPM7eGPLCZoB9OVlBQzB4UJL6ttD+Rbqw9l2iJK/BYPNs5A
	q+9aXgumtkxaOSDnssoYa5keLC7MM3UrwFa69xvkMpLSVqhVaqDyOU8M4+95I7+wDjev
	WKwSpvqJ/TcuXv+7XcFXiOybaE11NMbdnydf6NKQfgkX82/5GCE+/0P14ePis4S4TQI+
	zIP6U8vFHn3KenN1kgh4UkLgw3Fz/vIFfQRJrsyMDv1tx0hPHqEzy2rkPUV3Md93K5VH
	pg2pxvnDhATEKl5dyAXlsJJRvLDBfevow8jo+2mLSflONXPj/kWUsrZ3wVqNtwX0AIiS
	KAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=+QOVxtwDDicHR9WKgqGIKPIutN9SXV9YMw0gHSVIDJE=;
	b=Nnmr9TBKBZdCghPXTGfmllP2cPNIYW+NeSFp8BeLkgBJDEcQWkZ5Gl9LUCtVeLVUoh
	ZTVOL35D2r0xDsJeeA0CA9IxxNsV37y6L28l+/1LSf2ewcgRY82nt/NIGlGOO5oPU7uB
	a98uQS54+SUfCysuh9si3jdikvQb9JDm0XPIf04FJ61SJhdrmBvY8Jlv7OfLAyVkBe5+
	TOUoyyDGC/QH5j3dKI2hZ2klK//X3iM86Apcci4K1LphdC5dCl7qnrOAKGfgH/tpKX2a
	HJN2wwz+BPvGOAJ1Rkjew/bYgGOxA86LmLxAH998stLvQO01JRJVxXTscYC/H5otCN2R
	rTPA==
X-Gm-Message-State: AKaTC02AeERKI0OSDJFpx4etbyFt1qW5lMZbU1uNyMEHVVaPFpgLrpSGBzozc47aUZYXKv57qIEL2KaS/dFDtw==
X-Received: by 10.31.242.74 with SMTP id q71mr23487994vkh.46.1481014579021;
	Tue, 06 Dec 2016 00:56:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 6 Dec 2016 00:56:18 -0800 (PST)
In-Reply-To: <20161206023625.12901-4-raj.khem@gmail.com>
References: <20161206023625.12901-1-raj.khem@gmail.com>
	<20161206023625.12901-4-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 6 Dec 2016 09:56:18 +0100
Message-ID: <CALbNGRQ2CH59VL51BeaXs3PP9up=C=aAfVWOccYQqRH8QLrRig@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 6/7] gthumb: Add missing dependency on gnome-common-native
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
X-List-Received-Date: Tue, 06 Dec 2016 08:56:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 6, 2016 at 3:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
> | ../gthumb-2.12.4/configure: line 17557: GNOME_MAINTAINER_MODE_DEFINES: command not found
> | ../gthumb-2.12.4/configure: line 17558: syntax error near unexpected token `maximum'
> | ../gthumb-2.12.4/configure: line 17558: `GNOME_COMPILE_WARNINGS(maximum)'
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
> index 5eee7f0..13c027c 100644
> --- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
> +++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
> @@ -2,7 +2,7 @@ SUMMARY = "gThumb is an image viewer and browser for the GNOME Desktop"
>  SECTION = "x11/gnome"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native"
> +DEPENDS = "gnome-common-native glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native"
>
>  PR = "r4"
>
> --
> 2.10.2
>
* Are there patches missing in this series (1/2 2/2)?
* What about gnome-menus3?

Andreas

