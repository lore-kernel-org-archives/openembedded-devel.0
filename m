Return-Path: <mbc@koumoul.net>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 101B87391A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 19:18:18 +0000 (UTC)
Received: by lahh2 with SMTP id h2so1109154lah.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 12:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=zZJi9lnv2rqpZeL/KJiUBUBzCd8XG9w9yNb69Ib7Z7Y=;
	b=IfFf+a0usC8GxKB0w5pp67EO0t3eQ0u/0c1HjjQMFWfjMYBtq7sfpuaanguHqimxYY
	5gj69tJeIadYrOGP2RYtyE59UCZE0pb1aiaHOXgiKZngEhGTmkKmd7gTzQ6mk03nc4H6
	LaSxNKZ+xKKVJ9Qe/35S0Jig5an/JjXBrW7eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zZJi9lnv2rqpZeL/KJiUBUBzCd8XG9w9yNb69Ib7Z7Y=;
	b=LibThblCHOh7eNtS3ikC9Owbgk0Vyt/LnIn4sO6Fyp1cmFwclTZz1uYg/h10aj2yu+
	utK6rdhQlOJ/lGFoLE4StedmschDELg4bxrqzQ6FW6Er0qQcEkngv5RU23QQlK4oe+nK
	SDNrta/l+k3ZlgNTfCwzjGOcWkZnMqVEiMXUdOz04+MUzXo69nrqW9+3LowEr05ER5V5
	K5qiB6ZiGAIH39aH2upvUFeJfYbGBjCzQX+xL7TrgtFlec2bTPC5i/oCh+tfg6x8uOVk
	bHGgwt4eDkxAXXttmXNAoASEe4Khquw9LOef3wl8o8DU89B4+ccnsJlvuUAQDYsydB0U
	rAHw==
X-Gm-Message-State: ALoCoQmi9FVtkKp/LURsDqvcXXsKHIS4D3UU7WMlnkQJkWnQICxu+LRVVDF8HPdY1Btl9Y0v3kIl
MIME-Version: 1.0
X-Received: by 10.25.16.35 with SMTP id f35mr3049997lfi.1.1442949498058; Tue,
	22 Sep 2015 12:18:18 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.113.10.163 with HTTP; Tue, 22 Sep 2015 12:18:17 -0700 (PDT)
X-Originating-IP: [109.218.120.27]
In-Reply-To: <20150922191049.GD2388@jama>
References: <1442651315-18493-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAMKF1so0dDq2Wxq25q+hRms8rUKc24RaZH6aZbVV1H75GqC+tg@mail.gmail.com>
	<CANTDXNdodvY6dq5rt2NRgRe_FNKtfzBmXxLfExHxyVm8ZYOmjQ@mail.gmail.com>
	<20150922191049.GD2388@jama>
Date: Tue, 22 Sep 2015 21:18:17 +0200
X-Google-Sender-Auth: ASiykPUa39cRVRuzwcD7tbGJd9g
Message-ID: <CANTDXNeuWHL5=Fhfg19Ct3okttQVbAHc9gtojgG1eX3VS7ngBw@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 Sep 2015 19:18:20 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

Thanks, sending it right now.

2015-09-22 21:10 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> On Tue, Sep 22, 2015 at 08:29:34PM +0200, Manuel Bachmann wrote:
> > Hi Khem, and thanks a lot for your feedback !
> >
> > You are definitely right. For this purpose, though, we need Wayland + EGL
> > support in EFL itself (wayland-fits checks for them at configure time).
> >
> > I just sent the corresponding patch to the mailing list, here it is :
> >
> >
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103507.html
> >
> > Feel free to give feedback. Once it is merged, I will promptly re-submit
> an
> > updated "wayland-fits" recipe which optionally depends on it.
>
> You can send PATCHv2 now, and I'll test them both together.
>
> Thanks
>
> > 2015-09-19 22:02 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> >
> > > On Sat, Sep 19, 2015 at 1:28 AM, Manuel Bachmann
> > > <manuel.bachmann@iot.bzh> wrote:
> > > > wayland-fits is a functional integration test suite
> > > > for Wayland and Weston.
> > > >
> > > > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > > > ---
> > > >  .../recipes-graphics/wayland/wayland-fits_git.bb   | 30
> > > ++++++++++++++++++++++
> > > >  1 file changed, 30 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-graphics/wayland/
> wayland-fits_git.bb
> > > >
> > > > diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> > > b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> > > > new file mode 100644
> > > > index 0000000..550e171
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
> > > > @@ -0,0 +1,30 @@
> > > > +SUMMARY = "Wayland-fits, the Wayland Functional Integration Test
> Suite"
> > > > +DESCRIPTION = "Wayland-fits is a fully automated functional
> integration
> > > \
> > > > +test suite. Its main purpose is to test the functionality and
> > > integration of \
> > > > +client-side (i.e. toolkit) and server-side (compositor)
> implementations
> > > of \
> > > > +the Wayland protocol."
> > > > +HOMEPAGE = "https://github.com/01org/wayland-fits"
> > > > +LICENSE = "MIT"
> > > > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=f8d34cadaf891753c0f00c6cd48f08f5
> > > \
> > > > +
> > >
> file://src/extensions/weston/weston-wfits.cpp;endline=21;md5=848c81e55cf3a30a9f6ed75f0dba7a97"
> > > > +
> > > > +SRC_URI = "git://github.com/01org/wayland-fits.git"
> > > > +SRCREV = "f30dfa9fceb438d3687c5215093fffc21a7852fc"
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +inherit autotools pkgconfig
> > > > +
> > > > +DEPENDS = "libcheck boost wayland weston"
> > > > +RDEPENDS_${PN} = "weston"
> > >
> > > may be better to use += here
> > >
> > > > +
> > > > +EXTRA_OECONF = "--enable-shared --disable-static \
> > > > +                --disable-efl-tests --disable-gtk-tests \
> > > > +                --with-boost-libdir=${STAGING_LIBDIR}"
> > >
> > > We do have EFL and GTK support in OE, would it make sense to turn it
> > > into some sort of PACKAGECONFIG ?
> > >
> > > > +
> > > > +do_install_append() {
> > > > +       rm -f ${D}/${libdir}/weston/*.la
> > > > +}
> > > > +
> > > > +FILES_${PN} = "${bindir}/wfits ${libdir}/weston/*.so"
> > > > +FILES_${PN}-dbg = "${bindir}/.debug ${libdir}/weston/.debug
> > > ${prefix}/src"
> > >
> > > this could be += as well.
> > >
> > > > --
> > > > 1.8.3.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> >
> >
> >
> > --
> > Regards,
> >
> > *Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *

