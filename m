Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5D07680B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 20:03:27 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so86657109ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=pmPceVCXJj1xl3kyXu1IiwEblNxL1R5AdbloTDaJpag=;
	b=pP2lxdxyyUX1hkyu8bT1MYFp3SI1IJKyeDSSnELtbv7qLZNN0xx4wlL5ZvE3yf7TjC
	rEsoBmCEZmWpYkCDRpIUVeOnNZk+jESjWWCFrJz+9ai/+pHKvj247Xs2J+kf+U09MtEx
	bs5VlJpNDdFSc+YkLJfsR7gzBIU0kHiwbyuhvn2M+mb/RdJ64HdwrbRGTuAK2sqjbQIj
	3f++QRmjiEYiQ4/mrrmyP5GeYfVSlYe4Y+XYEd2NL3KmM8UoW73MPMAQ8vUumOnEk48J
	XgNtX4KEa1lDp8KwgRqKCu/TMDY7GC2oC7RsR8bb32Mv/2aDxXIA1Sa7JchD4uGt83Fk
	KxWA==
X-Received: by 10.107.34.149 with SMTP id i143mr22259254ioi.195.1442693007570; 
	Sat, 19 Sep 2015 13:03:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Sat, 19 Sep 2015 13:02:58 -0700 (PDT)
In-Reply-To: <1442651315-18493-1-git-send-email-manuel.bachmann@iot.bzh>
References: <1442651315-18493-1-git-send-email-manuel.bachmann@iot.bzh>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2015 13:02:58 -0700
Message-ID: <CAMKF1so0dDq2Wxq25q+hRms8rUKc24RaZH6aZbVV1H75GqC+tg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] wayland-fits: Add recipe
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
X-List-Received-Date: Sat, 19 Sep 2015 20:03:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 19, 2015 at 1:28 AM, Manuel Bachmann
<manuel.bachmann@iot.bzh> wrote:
> wayland-fits is a functional integration test suite
> for Wayland and Weston.
>
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> ---
>  .../recipes-graphics/wayland/wayland-fits_git.bb   | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
>
> diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> new file mode 100644
> index 0000000..550e171
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Wayland-fits, the Wayland Functional Integration Test Suite"
> +DESCRIPTION = "Wayland-fits is a fully automated functional integration \
> +test suite. Its main purpose is to test the functionality and integration of \
> +client-side (i.e. toolkit) and server-side (compositor) implementations of \
> +the Wayland protocol."
> +HOMEPAGE = "https://github.com/01org/wayland-fits"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f8d34cadaf891753c0f00c6cd48f08f5 \
> +                    file://src/extensions/weston/weston-wfits.cpp;endline=21;md5=848c81e55cf3a30a9f6ed75f0dba7a97"
> +
> +SRC_URI = "git://github.com/01org/wayland-fits.git"
> +SRCREV = "f30dfa9fceb438d3687c5215093fffc21a7852fc"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "libcheck boost wayland weston"
> +RDEPENDS_${PN} = "weston"

may be better to use += here

> +
> +EXTRA_OECONF = "--enable-shared --disable-static \
> +                --disable-efl-tests --disable-gtk-tests \
> +                --with-boost-libdir=${STAGING_LIBDIR}"

We do have EFL and GTK support in OE, would it make sense to turn it
into some sort of PACKAGECONFIG ?

> +
> +do_install_append() {
> +       rm -f ${D}/${libdir}/weston/*.la
> +}
> +
> +FILES_${PN} = "${bindir}/wfits ${libdir}/weston/*.so"
> +FILES_${PN}-dbg = "${bindir}/.debug ${libdir}/weston/.debug ${prefix}/src"

this could be += as well.

> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

