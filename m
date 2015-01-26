Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id AF3FE6AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 07:42:15 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id hy10so2245828vcb.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 23:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/WyrtVHyaBLxgGIo+yCie30ufey/ECeWyM8QPEerQtc=;
	b=G1RkdHDRHeUtICuvydnpihgVvfXWlbC0WzIQ4oGhmgavRgFLRLNetfbPSPHjW6XdNA
	n94EV+bIRcygtwI509GzVlTsJcCUA4/DuwJILj0pWsZqpkf9irYx/SOidL57Y2hpzUhe
	mrFFXi9HOK3FN2g5gWX7kAB2hyosHjsQNklbJlFPeFstmX0RPuZjUVFbIW9JCmtn2r7R
	h68FE/gEVszkjBX9K+yNm1R02UHOPGM0htBVIzGbI1ryWJ5UcXIu3lufulZuMiqwoUNR
	VTCAhxXvJUhPsGt4GT0BW3Gosa40+q5zTLHN3SKEkOlxO+Ngn0hwVuwINsMSLK+5DIg4
	AYLw==
MIME-Version: 1.0
X-Received: by 10.220.165.129 with SMTP id i1mr10370246vcy.50.1422258135843;
	Sun, 25 Jan 2015 23:42:15 -0800 (PST)
Received: by 10.52.183.71 with HTTP; Sun, 25 Jan 2015 23:42:15 -0800 (PST)
In-Reply-To: <CADO9-pf7FC6Qhh+K2HvZ2xBdYCY-qvMoGh9Xa5tE_XF9LRuuPA@mail.gmail.com>
References: <CADO9-pf7FC6Qhh+K2HvZ2xBdYCY-qvMoGh9Xa5tE_XF9LRuuPA@mail.gmail.com>
Date: Mon, 26 Jan 2015 08:42:15 +0100
Message-ID: <CALbNGRRh6aT=eUv08qUonR9ymux7jixt4rk_xt7Hr85qdDMkog@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Yong Li <sdliyong@gmail.com>
Subject: Re: [meta-xfce][PATCH]] Add XFCE iamge build file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Jan 2015 07:42:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 26, 2015 at 1:46 AM, Yong Li <sdliyong@gmail.com> wrote:
> From 44c7c064bd7d735e31c2fea0149fc293db78c536 Mon Sep 17 00:00:00 2001
> From: Yong Li <sdliyong@gmail.com>
> Date: Mon, 26 Jan 2015 08:39:37 +0800
> Subject: [PATCH] Add XFCE iamge build file
>
> Signed-off-by: Yong Li <sdliyong@gmail.com>
> ---
>  meta/recipes-graphics/images/core-image-xfce.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-graphics/images/core-image-xfce.bb
>
> diff --git a/meta/recipes-graphics/images/core-image-xfce.bb
> b/meta/recipes-graphics/images/core-image-xfce.bb
> new file mode 100644
> index 0000000..1d9bfdc
> --- /dev/null
> +++ b/meta/recipes-graphics/images/core-image-xfce.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "A very basic Wayland image with a terminal"
xfce and wayland ??
> +
> +IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"
> +
> +LICENSE = "MIT"
> +
> +inherit core-image distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +CORE_IMAGE_BASE_INSTALL += "xserver-xorg xserver-xf86-config xinit xauth
> xf86-input-evdev \
> +xserver-nodm-init mini-x-session  xorg-minimal-fonts \
> +xf86-video-fbdev xterm xclock xfwm4 xfce4-session xfdesktop xfce4-settings
> \
> +xfce4-panel xfce4-appfinder xfconf xfce4-terminal gtk-xfce-engine \
> +packagegroup-fonts-truetype packagegroup-xfce-base"
Most of these are included in packagegroup-xfce-base already
> --
> 1.9.1
> --
My personal opinion: This belongs to a distro (see angstrom - there
are already images available) and there is not much value this image
includes.

Andreas

