Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8226F8CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 08:46:20 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id lh14so6795579vcb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=3cMpBqcfpwqatxeHhciSKLmo+I4jxsjX+eXmaJC2iZY=;
	b=rv77DYcPuyObQWswOW9/MyjA6IBE0AmYv8rcmT90/R+o0II2LbsoFEqVa2YvUVvTD2
	oqdtNoY8IEv8p8oVOnBCkVOj52yPsjyTV2Zo/cbMuGPOdr5NyB03tHe0VU9EewBHiOdf
	QNY8esiA155QW5vHqubgD2I+lYzHONZ3EIizOHZee8PQPUp73m1aDlMzAdFx7j9tYahb
	MaKUNikzPLnSWAU0xVdAB0Xg48ZrNMBmxMWrzzqGuYiFu7W3MD6ZAiAjaX19ITtqE2y8
	iWhMALDB8sP5xPdS6SVgPSueCf5y3kCgZrTQL7wH3IuaORgJZBNdb4QjhxVWee+YYVl0
	ouLg==
MIME-Version: 1.0
X-Received: by 10.220.106.84 with SMTP id w20mr23920714vco.18.1395132381332;
	Tue, 18 Mar 2014 01:46:21 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Tue, 18 Mar 2014 01:46:21 -0700 (PDT)
In-Reply-To: <1395117284-22655-1-git-send-email-stephen.arnold42@gmail.com>
References: <1395117284-22655-1-git-send-email-stephen.arnold42@gmail.com>
Date: Tue, 18 Mar 2014 09:46:21 +0100
Message-ID: <CALbNGRTeZrrDcSLQ8fQ7YOp4kK=e0dp1oAQBRR7D-6MYRQDXYg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH v3] recipes-xfce/libxfce4ui: depends and autotools fixes
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
X-List-Received-Date: Tue, 18 Mar 2014 08:46:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 18, 2014 at 5:34 AM, Stephen Arnold
<stephen.arnold42@gmail.com> wrote:
> Note: this patch (v3) obseletes previous versions
>
> libxfce4ui_4.10.0.bb: Upstream changes required autotools and gettext (intl)
> fixes, as well as moving the autogen stuff to a separate task.  Full depends
> were also added (2 were converted to PACKAGECONFIG options) along with a
> vendor config option.
>
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
>
> ---
>  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> index cc63a9f..1e141c4 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> @@ -2,9 +2,9 @@ SUMMARY = "Xfce4 Widget library and X Window System interaction"
>  SECTION = "x11/libs"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
> -DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf glade3"
> +DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
>
> -inherit xfce
> +inherit autotools gettext xfce
>
>  SRC_URI = " \
>      git://git.xfce.org/xfce/libxfce4ui;protocol=git \
> @@ -15,9 +15,13 @@ SRCREV = "530b72f50fcbd8cb4b970fcc97be0321bf78183e"
>  PV = "4.10.0+git${SRCPV}"
>  S = "${WORKDIR}/git"
>
> -EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
> +EXTRA_OECONF += "--enable-maintainer-mode --disable-debug  --with-vendor-info=${DISTRO}"
>
> -do_configure_prepend() {
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
> +PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
> +
> +do_src_prepare() {
>         NOCONFIGURE=yes ./autogen.sh
>  }
>
> @@ -27,3 +31,5 @@ FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
>  PACKAGES += "${PN}-glade"
>  FILES_${PN}-glade = "${libdir}/glade3 \
>                       ${datadir}/glade3"
> +
> +addtask do_src_prepare before do_configure after do_patch
> --
I asked that for lxdm already - maybe I missed something: Why do you
create an extra task and do not use do_configure_prepend() ?

Andreas

