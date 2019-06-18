Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id E1E877E959
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:54:07 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id s49so22512443edb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I6lxVJzx6Nl6UGpxKb11KD4ugqxcx+Utp52caYrOlSE=;
	b=l91HArHN3BTklY1M+oHmMc3TYB/ihK3gzV3KWUaWmrmSbNytQx27mHXtiG0X8viPQM
	4+py09bas2kUV9nO/dETkhvZY63Nm+C51o2UxYX5Sx0ya45whsTBcTPL/yj+yVvHgT92
	LOvTOenRg/JipOmU3XDpkm909IUjy98UJmON8hkZL20r95qZz7jW/a2uN3fOrabacsGh
	xvqrSK3f3ONP3TBOGZun56XU3EYkAi6NJmI2vtQEyBxpQmhSZCkgCKEC3Bzx1ds6m4Qj
	34XUQ56idSuqdkVNgscurM5CgEXBjIRWpgPcHXKhpxInM8VEMKPoNhu+Xru7TYU4E/+/
	KJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I6lxVJzx6Nl6UGpxKb11KD4ugqxcx+Utp52caYrOlSE=;
	b=lDNVOJAh3PGnOfr8RN1suKnosl853NadgouvqaoastBYPG0pa9IQM9dJYqKRjjOf3k
	szHvlF796ht26SrsN/kxiX+PSdcZpTQGe+iIz/vFhFzrFkNfngLIxNzf/tmonGfYVBAn
	UPbCyIgRyDgVSIoDdKSoosx0h69RXmujeCYCK7bk+sU6D9WHQqvPU+LdZLcGrfPb8R8q
	a1Uqs8n5rvRdMLICf3yGhm85GzF/IIjCevPHDvl24Ow0A5uPja15blVZJMRRoHjk0Lum
	TwTifmVSpBUmFlPy7BekzYsaLkQ3fbHwzHVp9n3lBN7zQyb+a6mNH2zPRivU3Uj2vxFE
	+5bg==
X-Gm-Message-State: APjAAAW+ne20GR9snC/HJtk1qny9ee51C/I+0xUKMskdTwRAHZjH+xC8
	1B+85hca/zfbQeCkBf1qrlz98/QosaoVb7ygOc0=
X-Google-Smtp-Source: APXvYqz9v97rcnVfHiH2/WNaSwFe3qglmP3mgWiC1ZnAUlSbBDpVI/lF1Mi1FpjSR6qmyDLW5Zk3EMgYbpEJ65UrN8A=
X-Received: by 2002:a17:906:1dcc:: with SMTP id
	v12mr33262515ejh.110.1560873248510; 
	Tue, 18 Jun 2019 08:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
	<20190523115505.18245-3-Martin.Jansa@gmail.com>
	<CAMKF1sraHDXnk1iL_vpZfZUngVvLXQ3fWRiCKTP1YW3e5vUkrQ@mail.gmail.com>
	<CA+chaQdUYmmJ8KZV_fc+-85LLZh7YCKLttaygD73Rx_9Qfd5yQ@mail.gmail.com>
	<CA+chaQf3J5=1A99rpmGkvOT5gFqzS+gKU5GNC-VYW1AJw_wCSw@mail.gmail.com>
	<CA+chaQckC5_m9yKCHStx_LesVfbjC0fkAPYHaiDnLFCvJs0iQw@mail.gmail.com>
	<CAMKF1spuMgbHJVRYDYdR1-ZEcS835pvHX5PcOH9B1kqUxsj7Dg@mail.gmail.com>
	<CA+chaQfgUqkMv9_b+7FsNqJd9jwTR0pdBqH7S-73Hae+Fx8uBA@mail.gmail.com>
	<CAMKF1sq8PnWw52PkCOPuQVFPOe7-ss9oFHvcTXZatyu8GEmRrQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq8PnWw52PkCOPuQVFPOe7-ss9oFHvcTXZatyu8GEmRrQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jun 2019 17:54:04 +0200
Message-ID: <CA+chaQcX=K039tJLm7_4XZWODXYTtutVpf-Ka5_rEp8iFmJ5uQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/8] funyahoo-plusplus, icyque, pidgin-sipe, purple-skypeweb: add couple plugins for pidgin
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
X-List-Received-Date: Tue, 18 Jun 2019 15:54:08 -0000
Content-Type: text/plain; charset="UTF-8"

> my env is a bit different then yours, I have not tried using glibc but

I was testing it with musl as well.

Lets see what your config.log will show.

On Tue, Jun 18, 2019 at 5:45 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jun 18, 2019 at 8:37 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > FWIW: Even with libgmime-2.6-0 libgmime-2.6-dev installed on Ubuntu
> 18-04 host
> >
> > $ pkg-config --cflags gmime-2.6
> > -D_LARGEFILE64_SOURCE -pthread -I/usr/include/gmime-2.6
> -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
> >
> > I still don't get gmime autodetected in pidgin-sipe:
> >
> > grep -i mime
> BUILD/work/core2-64-oe-linux-musl/pidgin-sipe/1.24.0-r0/temp/log.do_configure
> > checking for gmime-3.0 >= 3.0.0... no
> > checking for gmime-2.6 >= 2.6.0... no
>
> these are correct checks but the checks on my system are
>
> checking for gmime-3.0 >= 3.0.0... no
> checking for gmime-2.6 >= 2.6.0... yes
>
> and I have gmime-2.6 on build host installed. There is not much
> information in log files to indicate how it came to that conclusion
> but my
> guess is its calling pkg-config without sysroot in second call after
> 3.0 detection fails.
>
> my env is a bit different then yours, I have not tried using glibc but
> I will do that today.
>
> archlinux/clang/musl/qemux86_64
>
> >
> > and it still builds only sipe-mime-common.c not sipe-mime.c here.
> >
> > On Tue, Jun 18, 2019 at 3:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Tue, Jun 18, 2019 at 3:43 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> >
> >> > > It seems we need to bring in recipe for gmime for this to work.
> This is already in master
> >> >
> >> > sipe-mime.c shown in the error is built only with SIPE_MIME_GMIME
> >> >
> >> > src/core/Makefile.am:
> >> > if SIPE_MIME_GMIME
> >> > noinst_LTLIBRARIES           += libsipe_core_mime.la
> >> > libsipe_core_mime_la_SOURCES  = sipe-mime.c
> >> > libsipe_core_mime_la_CFLAGS   = $(libsipe_core_la_CFLAGS)
> $(GMIME_CFLAGS)
> >> > endif
> >> >
> >> > And that gets enabled only when pkg-config finds gmime-3.0 in
> gmime-2.6:
> >> > configure.ac:
> >> > dnl check for gmime
> >> > PKG_CHECK_MODULES(GMIME, [gmime-3.0 >= 3.0.0],
> >> >         [ac_have_gmime=yes],
> >> >         [PKG_CHECK_MODULES(GMIME, [gmime-2.6 >= 2.6.0],
> >> >                 [ac_have_gmime=yes],
> >> >                 [ac_have_gmime=no])
> >> >         ])
> >> > AM_CONDITIONAL(SIPE_MIME_GMIME, [test "x$ac_have_gmime" = xyes])
> >> > AS_IF([test "x$ac_have_gmime" = xyes],
> >> >         [AC_DEFINE(HAVE_GMIME, 1, [Define if gmime should be used in
> sipe.])])
> >> >
> >> > which it really shouldn't as there isn't anything which should pull
> it into RSS.
> >> >
> >> > There is some old gmime recipe in meta-guacamayo:
> >> >
> https://github.com/Guacamayo/meta-guacamayo/commit/cc3e1020cb696a6a4227b18009e99b137059b0a4#diff-2de762e26fa1d5e913b81b43a4b5c92c
> >>
> >> I have written an updated one for 3.x, will post soon,
> >> >
> >> > but still this shouldn't be needed as long as you don't enable
> telepathy PACKAGECONFIG in pidgin-sipe. I don't know how to reproduce this
> locally, sipe-mime.c build isn't mentioned at all in my log.do_compile
> files (and PKG_CHECK_MODULES seems to work correctly - not to detect gmime
> from the host).
> >> >
> >> > It would be great if you could share log.do_configure/config.log from
> the build where it was failing.
> >> >
> >>
> >> thanks for looking into it, so you need to have gmime-2.6 installed on
> >> your build host for this error to trigger
> >> it seems to be looking into build host's sysroot.
> >> > Cheers,
> >> >
> >> >
> >> >
> >> >
> >> >
> >> > On Tue, Jun 18, 2019 at 9:12 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> >>
> >> >> I've rebuilt it on 4 different hosts with qemux86-64/glibc.
> >> >>
> >> >> And also with musl locally (first gobject-introspection was failing
> because of qemu-native segfaults, so I've disabled that with
> DISTRO_FEATURES_remove = "gobject-introspection-data") and then pidgin-sipe
> built fine again.
> >> >>
> >> >> Is it always failing for you reliably or was is random failure just
> in one build?
> >> >>
> >> >> Cheers,
> >> >>
> >> >> On Fri, Jun 14, 2019 at 11:34 PM Martin Jansa <
> martin.jansa@gmail.com> wrote:
> >> >>>
> >> >>> It builds fine for me with qemux86-64 with glibc.
> >> >>>
> >> >>> I'll check what's going on.
> >> >>>
> >> >>> Thanks
> >> >>>
> >> >>> On Fri, Jun 14, 2019 at 8:10 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> >> >>>>
> >> >>>> Hi Martin
> >> >>>>
> >> >>>> I noticed this error on qemux86-64
> >> >>>>
> >> >>>> https://errors.yoctoproject.org/Errors/Details/248480/
> >> >>>>
> >> >>>> It seems we need to bring in recipe for gmime for this to work.
> This
> >> >>>> is already in master
> >> >>>> so can you work on fixing this?
> >> >>>>
> >> >>>> On Thu, May 23, 2019 at 4:55 AM Martin Jansa <
> martin.jansa@gmail.com> wrote:
> >> >>>> >
> >> >>>> > * import from luneos to make pidgin here in meta-oe a bit more
> useful
> >> >>>> >
> >> >>>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> >>>> > ---
> >> >>>> >  .../pidgin/funyahoo-plusplus_git.bb           | 25
> ++++++++++++++
> >> >>>> >  meta-oe/recipes-support/pidgin/icyque_git.bb  | 27
> +++++++++++++++
> >> >>>> >  .../pidgin/pidgin-sipe_1.24.0.bb              | 34
> +++++++++++++++++++
> >> >>>> >  .../pidgin/purple-skypeweb_git.bb             | 26
> ++++++++++++++
> >> >>>> >  4 files changed, 112 insertions(+)
> >> >>>> >  create mode 100644 meta-oe/recipes-support/pidgin/
> funyahoo-plusplus_git.bb
> >> >>>> >  create mode 100644 meta-oe/recipes-support/pidgin/icyque_git.bb
> >> >>>> >  create mode 100644 meta-oe/recipes-support/pidgin/
> pidgin-sipe_1.24.0.bb
> >> >>>> >  create mode 100644 meta-oe/recipes-support/pidgin/
> purple-skypeweb_git.bb
> >> >>>> >
> >> >>>> > diff --git a/meta-oe/recipes-support/pidgin/
> funyahoo-plusplus_git.bb b/meta-oe/recipes-support/pidgin/
> funyahoo-plusplus_git.bb
> >> >>>> > new file mode 100644
> >> >>>> > index 0000000000..3a437659e7
> >> >>>> > --- /dev/null
> >> >>>> > +++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> >> >>>> > @@ -0,0 +1,25 @@
> >> >>>> > +SUMMARY = "Protocol plugin for New Yahoo (2016) for Adium,
> Pidgin, Miranda and Telepathy IM Framework"
> >> >>>> > +SECTION = "webos/services"
> >> >>>> > +LICENSE = "GPLv3.0"
> >> >>>> > +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
> >> >>>> > +
> >> >>>> > +DEPENDS = "pidgin json-glib glib-2.0"
> >> >>>> > +
> >> >>>> > +inherit pkgconfig
> >> >>>> > +
> >> >>>> > +SRC_URI = "git://
> github.com/EionRobb/funyahoo-plusplus;branch=master;protocol=git"
> >> >>>> > +SRCREV = "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
> >> >>>> > +
> >> >>>> > +S = "${WORKDIR}/git"
> >> >>>> > +
> >> >>>> > +do_compile() {
> >> >>>> > +    oe_runmake CC="${CC}" CXX="${CXX}"
> EXTRA_INCLUDES="${TARGET_CFLAGS}" AR="${AR}";
> >> >>>> > +}
> >> >>>> > +
> >> >>>> > +do_install() {
> >> >>>> > +    oe_runmake DESTDIR="${D}" install;
> >> >>>> > +}
> >> >>>> > +
> >> >>>> > +FILES_${PN} += " \
> >> >>>> > +    ${libdir} \
> >> >>>> > +"
> >> >>>> > diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb
> b/meta-oe/recipes-support/pidgin/icyque_git.bb
> >> >>>> > new file mode 100644
> >> >>>> > index 0000000000..0f32dc3a39
> >> >>>> > --- /dev/null
> >> >>>> > +++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
> >> >>>> > @@ -0,0 +1,27 @@
> >> >>>> > +SUMMARY = "WIM Protocol plugin for ICQ for Adium, Pidgin,
> Miranda and Telepathy IM Framework"
> >> >>>> > +SECTION = "webos/services"
> >> >>>> > +LICENSE = "GPLv3.0"
> >> >>>> > +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
> >> >>>> > +
> >> >>>> > +DEPENDS = "pidgin json-glib"
> >> >>>> > +
> >> >>>> > +PV = "0.1+gitr${SRCPV}"
> >> >>>> > +
> >> >>>> > +inherit pkgconfig
> >> >>>> > +
> >> >>>> > +SRC_URI = "git://github.com/EionRobb/icyque"
> >> >>>> > +SRCREV = "513fc162d5d1a201c2b044e2b42941436d1069d5"
> >> >>>> > +
> >> >>>> > +S = "${WORKDIR}/git"
> >> >>>> > +
> >> >>>> > +do_compile() {
> >> >>>> > +    oe_runmake;
> >> >>>> > +}
> >> >>>> > +
> >> >>>> > +do_install() {
> >> >>>> > +    oe_runmake DESTDIR="${D}" install;
> >> >>>> > +}
> >> >>>> > +
> >> >>>> > +FILES_${PN} += " \
> >> >>>> > +    ${libdir} \
> >> >>>> > +"
> >> >>>> > diff --git a/meta-oe/recipes-support/pidgin/
> pidgin-sipe_1.24.0.bb b/meta-oe/recipes-support/pidgin/
> pidgin-sipe_1.24.0.bb
> >> >>>> > new file mode 100644
> >> >>>> > index 0000000000..beae281a30
> >> >>>> > --- /dev/null
> >> >>>> > +++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
> >> >>>> > @@ -0,0 +1,34 @@
> >> >>>> > +SUMMARY = "Protocol plugin for Office 365/Lync/OCS for Adium,
> Pidgin, Miranda and Telepathy IM Framework"
> >> >>>> > +SECTION = "webos/services"
> >> >>>> > +LICENSE = "GPLv2.0"
> >> >>>> > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> >> >>>> > +
> >> >>>> > +DEPENDS = "pidgin intltool-native glib-2.0-native"
> >> >>>> > +
> >> >>>> > +inherit pkgconfig
> >> >>>> > +inherit autotools
> >> >>>> > +
> >> >>>> > +SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
> >> >>>> > +"
> >> >>>> > +
> >> >>>> > +SRC_URI[md5sum] = "b91106d28c235b347a63dcb676f7b66a"
> >> >>>> > +SRC_URI[sha256sum] =
> "958803722b23d869131f76bd90df9da19116d4ca5a873e5253371479b7390f43"
> >> >>>> > +
> >> >>>> > +PACKAGECONFIG ??= "nss krb5"
> >> >>>> > +PACKAGECONFIG[nss] = "--enable-nss=yes,--enable-nss=no,nss"
> >> >>>> > +PACKAGECONFIG[openssl] =
> "--enable-openssl=yes,--enable-openssl=no,openssl"
> >> >>>> > +PACKAGECONFIG[krb5] = "--with-krb5=yes,--with-krb5=no,krb5"
> >> >>>> > +#PACKAGECONFIG[voice_and_video] =
> "--with-vv=yes,--with-vv=no,libnice gstreamer"
> >> >>>> > +PACKAGECONFIG[telepathy] =
> "--enable-telepathy=yes,--enable-telepathy=no,telepathy-glib gmime"
> >> >>>> > +#PACKAGECONFIG[gssapi_only] =
> "--enable-gssapi-only=yes,--enable-gssapi-only=no,krb5"
> >> >>>> > +PACKAGECONFIG[debug] =
> "--enable-debug=yes,--enable-debug=no,valgrind"
> >> >>>> > +
> >> >>>> > +FILES_${PN}-dev += " \
> >> >>>> > +    ${libdir}/purple-2/*.la \
> >> >>>> > +"
> >> >>>> > +
> >> >>>> > +FILES_${PN} += " \
> >> >>>> > +    ${libdir}/purple-2/libsipe.so \
> >> >>>> > +    ${datadir}/appdata \
> >> >>>> > +    ${datadir}/metainfo \
> >> >>>> > +"
> >> >>>> > diff --git a/meta-oe/recipes-support/pidgin/
> purple-skypeweb_git.bb b/meta-oe/recipes-support/pidgin/
> purple-skypeweb_git.bb
> >> >>>> > new file mode 100644
> >> >>>> > index 0000000000..092e6059b8
> >> >>>> > --- /dev/null
> >> >>>> > +++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> >> >>>> > @@ -0,0 +1,26 @@
> >> >>>> > +SUMMARY = "Skype protocol plug-in for libpurple"
> >> >>>> > +SECTION = "webos/services"
> >> >>>> > +LICENSE = "GPLv3"
> >> >>>> > +LIC_FILES_CHKSUM =
> "file://skypeweb/gpl3.txt;md5=d90260d32cef39f3c8d6c0f05d3adb8e"
> >> >>>> > +
> >> >>>> > +DEPENDS = "pidgin json-glib glib-2.0 zlib"
> >> >>>> > +
> >> >>>> > +inherit pkgconfig
> >> >>>> > +
> >> >>>> > +SRC_URI = "git://
> github.com/EionRobb/skype4pidgin;branch=master;protocol=git"
> >> >>>> > +SRCREV = "14f1b69b6292bbdc98cca484b050ec8359394c4e"
> >> >>>> > +
> >> >>>> > +S = "${WORKDIR}/git"
> >> >>>> > +PV = "1.5+git${SRCPV}"
> >> >>>> > +
> >> >>>> > +do_compile() {
> >> >>>> > +    oe_runmake -C skypeweb;
> >> >>>> > +}
> >> >>>> > +
> >> >>>> > +do_install() {
> >> >>>> > +    oe_runmake -C skypeweb DESTDIR="${D}" install;
> >> >>>> > +}
> >> >>>> > +
> >> >>>> > +FILES_${PN} += " \
> >> >>>> > +    ${libdir} \
> >> >>>> > +"
> >> >>>> > --
> >> >>>> > 2.17.1
> >> >>>> >
> >> >>>> > --
> >> >>>> > _______________________________________________
> >> >>>> > Openembedded-devel mailing list
> >> >>>> > Openembedded-devel@lists.openembedded.org
> >> >>>> >
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

