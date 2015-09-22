Return-Path: <mbc@koumoul.net>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 316197391A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 18:29:34 +0000 (UTC)
Received: by lagj9 with SMTP id j9so23718316lag.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=wa6kguaQR9hHHSlCGBglxh26MSxqe3sM7GqCrWQ6BQw=;
	b=YKt6Rwq+eG+4jmrCq/eNnIiZyX2PIxyVJ1PwZXHrKcoOBvdZ9Fz/eEvkO5wNTTw181
	8q1/RQWdBEh4gJ6JkeBT0j6PO2d2HxwWUrlMXPTJ70T2BBeLBdV/AQsW4uXOLCHFn2lg
	zrzIuYaF5izQ6pjMw6twdoVZF0r0Tev1ZWOWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wa6kguaQR9hHHSlCGBglxh26MSxqe3sM7GqCrWQ6BQw=;
	b=g7Je7h4+TasDaiQGB2rOfUU3jmZNduJp2i1mEC1sjVsG71njovEugrztjSq2L8i7gd
	O2Oxx71G+oj4XUO6KcvumIi1V2m5wgjw40hHt+nD6IrAUzPnOWSmIQMzQKzYA5JH+KxO
	GyRwouG8hI3qCDQWaQSclUsIkjWl2bfgJh90xj8fQl6Iqf6GnTI6UJ9r+mhw+cc2E4Lh
	58opzNtzBlWzuD79A8VM8mG4DNjdUsTKXw9GMO1VSdwEOy0Wpgw0Rtl04IV/txpSZzg+
	sx8e/QLLO98YuKKg81liD81nmpk9J2ge2zMd/6iWxufs40rT7Wn9OlerLHHOBi9Zoyes
	n3Qw==
X-Gm-Message-State: ALoCoQmbrHWx23QUQgGR4IALi6HVrcabrvtiu4oUUAq2RnlsFiFYFzhrOy4FBWxjDosMaXfSd3kE
MIME-Version: 1.0
X-Received: by 10.112.168.7 with SMTP id zs7mr10352425lbb.26.1442946574238;
	Tue, 22 Sep 2015 11:29:34 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.113.10.163 with HTTP; Tue, 22 Sep 2015 11:29:34 -0700 (PDT)
X-Originating-IP: [109.218.120.27]
In-Reply-To: <CAMKF1so0dDq2Wxq25q+hRms8rUKc24RaZH6aZbVV1H75GqC+tg@mail.gmail.com>
References: <1442651315-18493-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAMKF1so0dDq2Wxq25q+hRms8rUKc24RaZH6aZbVV1H75GqC+tg@mail.gmail.com>
Date: Tue, 22 Sep 2015 20:29:34 +0200
X-Google-Sender-Auth: oCqJZtql9YqdRDrluG1c3cGWLJ0
Message-ID: <CANTDXNdodvY6dq5rt2NRgRe_FNKtfzBmXxLfExHxyVm8ZYOmjQ@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 22 Sep 2015 18:29:36 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem, and thanks a lot for your feedback !

You are definitely right. For this purpose, though, we need Wayland + EGL
support in EFL itself (wayland-fits checks for them at configure time).

I just sent the corresponding patch to the mailing list, here it is :

http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103507.html

Feel free to give feedback. Once it is merged, I will promptly re-submit an
updated "wayland-fits" recipe which optionally depends on it.


2015-09-19 22:02 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> On Sat, Sep 19, 2015 at 1:28 AM, Manuel Bachmann
> <manuel.bachmann@iot.bzh> wrote:
> > wayland-fits is a functional integration test suite
> > for Wayland and Weston.
> >
> > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > ---
> >  .../recipes-graphics/wayland/wayland-fits_git.bb   | 30
> ++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> >
> > diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> > new file mode 100644
> > index 0000000..550e171
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> > @@ -0,0 +1,30 @@
> > +SUMMARY = "Wayland-fits, the Wayland Functional Integration Test Suite"
> > +DESCRIPTION = "Wayland-fits is a fully automated functional integration
> \
> > +test suite. Its main purpose is to test the functionality and
> integration of \
> > +client-side (i.e. toolkit) and server-side (compositor) implementations
> of \
> > +the Wayland protocol."
> > +HOMEPAGE = "https://github.com/01org/wayland-fits"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=f8d34cadaf891753c0f00c6cd48f08f5
> \
> > +
> file://src/extensions/weston/weston-wfits.cpp;endline=21;md5=848c81e55cf3a30a9f6ed75f0dba7a97"
> > +
> > +SRC_URI = "git://github.com/01org/wayland-fits.git"
> > +SRCREV = "f30dfa9fceb438d3687c5215093fffc21a7852fc"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > +
> > +DEPENDS = "libcheck boost wayland weston"
> > +RDEPENDS_${PN} = "weston"
>
> may be better to use += here
>
> > +
> > +EXTRA_OECONF = "--enable-shared --disable-static \
> > +                --disable-efl-tests --disable-gtk-tests \
> > +                --with-boost-libdir=${STAGING_LIBDIR}"
>
> We do have EFL and GTK support in OE, would it make sense to turn it
> into some sort of PACKAGECONFIG ?
>
> > +
> > +do_install_append() {
> > +       rm -f ${D}/${libdir}/weston/*.la
> > +}
> > +
> > +FILES_${PN} = "${bindir}/wfits ${libdir}/weston/*.so"
> > +FILES_${PN}-dbg = "${bindir}/.debug ${libdir}/weston/.debug
> ${prefix}/src"
>
> this could be += as well.
>
> > --
> > 1.8.3.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *

