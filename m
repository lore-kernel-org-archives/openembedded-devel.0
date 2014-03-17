Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4078B6EBA4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 06:41:29 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id rl12so4995964iec.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 23:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vhyMWx2Pg7Pe97wGNQqBt6Kwom6v/NJZPHd3SGmFrts=;
	b=nNuBXzrfSalu7FsrhaaTwx+o+PPZ5pdPI024UVp1sQEQ0bQMFhaETzIegp+PafjRvF
	XIqW+yQuDMTXo7ggbhWj7DAplUHfpfcdjGk7OMfapBA1Xq2cW0TCXsMmVenFB2Qa+nvi
	5VlHg4oj1u71GXQPUgQzlgc9un20CGzvxHK7rGjp/FfU/mdMXu8K72clK/KqQwsO4V1i
	CdV+P7LZ8dCO1fcTT5vuba0mmWKiFwBQsWE4cj1wu/g6dmekX8VmSLPaftvGQ5VP+AQI
	0QKr65V0rFLsyy1ubzNS24ezzvLoSSDwHd8gieIW6geN6fZ1+1mCrUGlEz7sn7Qs0Wjb
	Td7w==
X-Received: by 10.50.43.170 with SMTP id x10mr11318054igl.20.1395038490110;
	Sun, 16 Mar 2014 23:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Sun, 16 Mar 2014 23:40:58 -0700 (PDT)
In-Reply-To: <1395010139-15359-2-git-send-email-stephen.arnold42@gmail.com>
References: <1395010139-15359-1-git-send-email-stephen.arnold42@gmail.com>
	<1395010139-15359-2-git-send-email-stephen.arnold42@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Mar 2014 23:40:58 -0700
Message-ID: <CAMKF1souFmT3qEbxiW3QT2=aamvqfo=AKZtT6q4VKTZie96dYw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] Fixed libxfce4ui recipe - updated depends, set SRCREV to 4.10.0 tag, added missing inherit and pre-config task.
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
X-List-Received-Date: Mon, 17 Mar 2014 06:41:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 16, 2014 at 3:48 PM, stephen.arnold42
<stephen.arnold42@gmail.com> wrote:
> ---
>  .../recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   | 23 ++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> index cc63a9f..b17ebc1 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> @@ -2,23 +2,28 @@ SUMMARY = "Xfce4 Widget library and X Window System interaction"
>  SECTION = "x11/libs"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
> -DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf glade3"
> +DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
>

should you just inherit perlnative ?

> -inherit xfce
> +inherit autotools gettext xfce
>
>  SRC_URI = " \
>      git://git.xfce.org/xfce/libxfce4ui;protocol=git \
>      file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
> -    file://0002-configure.ac.in-remove-optional-gtk3-support.patch \
>  "
> -SRCREV = "530b72f50fcbd8cb4b970fcc97be0321bf78183e"
> -PV = "4.10.0+git${SRCPV}"
> +
> +SRCREV = "cf85eac7804e09b24f3e8fb4165f60b1c9f8cf49"
> +PV = "4.10.0"
>  S = "${WORKDIR}/git"
>
> -EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
> +PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
> +
> +EXTRA_OECONF += "--enable-maintainer-mode --disable-debug --with-vendor-info=Poky"
>

Can --with-vendor be made tunable such that distro's can provide vendor ID
but hardcoding is not good here.

> -do_configure_prepend() {
> -       NOCONFIGURE=yes ./autogen.sh
> +do_patch_extra() {
> +    sed -i /GTK3/d ${S}/configure.ac.in
> +    NOCONFIGURE=yes ./autogen.sh
>  }
>
>  FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
> @@ -27,3 +32,5 @@ FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
>  PACKAGES += "${PN}-glade"
>  FILES_${PN}-glade = "${libdir}/glade3 \
>                       ${datadir}/glade3"
> +
> +addtask do_patch_extra before do_configure after do_patch
> --
> 1.8.5.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

