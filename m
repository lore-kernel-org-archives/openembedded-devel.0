Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D27E7E6FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:43:46 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e3so20947605edr.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y4/6aTMetcQpgT7zbQFOfvEW/XxIXkXVviivE1ZUaPc=;
	b=i9M02o2GWevxxUs/z9L1fmROQc9X//OtANfUhfzg9QFBkFW2lpAdWRzFsG1tfBroGA
	WAfD+ayaEJylGUkSbuW09EIJcbzn22zuNJV2frQARv07AbGHBjHE2Moz/X6eBztgJcn6
	UGc8fGfzAdlEWlRe9qzHfvpUDzf9TayrE8a5s6cAPNv3Ks+AxQE94BWBrbHYfaXBs4Zz
	zAHZksK73NSAU8Al5k4TqP1GKgnTOVXY2J/Apam8qu0iGvIXlFQScJk/otFGcMIU4Ptr
	oysDuR77/m8nwC7maCC5D4UI9EEbBRQH86SF9p2eWO7nzHv7xO58n4x+S+dtA0JiDwoz
	paIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y4/6aTMetcQpgT7zbQFOfvEW/XxIXkXVviivE1ZUaPc=;
	b=CZedL5PNaV+FWg5w/TTeEal8BUy4rLPQdfAp+W6b6a6Kj40VVvzqg7nh33rE/84Bxm
	JOBKg0echfzU3QWuNnBRleLUpSMQ1I8stOLiQtlJYZZUUqR2w62EuF2uituN6cCEShET
	F+PsI1FyNsFURCQq1Q24yyeENk82nxWMc9VCEUjODgAHCm3Fy13HD3xtLA0l02yxsYTK
	0+px1RumFYmRCrL43zcaCbjsNUn4C8CsODninLlCpP/X75sFLUp8UVwiiRdy1GrwZnCZ
	+73pGAOROf9dPJ31qri/Rmtwz39gHgvqBmbm8zew87bb9zJWHaWhhHzA93aq2Xrgbq1j
	ALWw==
X-Gm-Message-State: APjAAAWUcRZ0rZe+tTYEzn67iA2KJnvisOOqST1VylxhsLL2oj3ezSiE
	TBVpcm8UGG4B6oDg0yT8rzgCbDyaNEmZa6PrMmQ=
X-Google-Smtp-Source: APXvYqx0yE2EY764572C3LEFiD+lla6t0XhGidC+0JwtNJXJoFpJlFDMrp8OuD1eomm0zGy4t498Uu/qRpiltVXG+xo=
X-Received: by 2002:a17:906:9705:: with SMTP id
	k5mr65756386ejx.5.1560854627280; 
	Tue, 18 Jun 2019 03:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
	<20190523115505.18245-3-Martin.Jansa@gmail.com>
	<CAMKF1sraHDXnk1iL_vpZfZUngVvLXQ3fWRiCKTP1YW3e5vUkrQ@mail.gmail.com>
	<CA+chaQdUYmmJ8KZV_fc+-85LLZh7YCKLttaygD73Rx_9Qfd5yQ@mail.gmail.com>
	<CA+chaQf3J5=1A99rpmGkvOT5gFqzS+gKU5GNC-VYW1AJw_wCSw@mail.gmail.com>
In-Reply-To: <CA+chaQf3J5=1A99rpmGkvOT5gFqzS+gKU5GNC-VYW1AJw_wCSw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jun 2019 12:43:35 +0200
Message-ID: <CA+chaQckC5_m9yKCHStx_LesVfbjC0fkAPYHaiDnLFCvJs0iQw@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Jun 2019 10:43:46 -0000
Content-Type: text/plain; charset="UTF-8"

> It seems we need to bring in recipe for gmime for this to work. This is
already in master

sipe-mime.c shown in the error is built only with SIPE_MIME_GMIME

src/core/Makefile.am:
if SIPE_MIME_GMIME
noinst_LTLIBRARIES           += libsipe_core_mime.la
libsipe_core_mime_la_SOURCES  = sipe-mime.c
libsipe_core_mime_la_CFLAGS   = $(libsipe_core_la_CFLAGS) $(GMIME_CFLAGS)
endif

And that gets enabled only when pkg-config finds gmime-3.0 in gmime-2.6:
configure.ac:
dnl check for gmime
PKG_CHECK_MODULES(GMIME, [gmime-3.0 >= 3.0.0],
        [ac_have_gmime=yes],
        [PKG_CHECK_MODULES(GMIME, [gmime-2.6 >= 2.6.0],
                [ac_have_gmime=yes],
                [ac_have_gmime=no])
        ])
AM_CONDITIONAL(SIPE_MIME_GMIME, [test "x$ac_have_gmime" = xyes])
AS_IF([test "x$ac_have_gmime" = xyes],
        [AC_DEFINE(HAVE_GMIME, 1, [Define if gmime should be used in
sipe.])])

which it really shouldn't as there isn't anything which should pull it into
RSS.

There is some old gmime recipe in meta-guacamayo:
https://github.com/Guacamayo/meta-guacamayo/commit/cc3e1020cb696a6a4227b18009e99b137059b0a4#diff-2de762e26fa1d5e913b81b43a4b5c92c

but still this shouldn't be needed as long as you don't enable telepathy
PACKAGECONFIG in pidgin-sipe. I don't know how to reproduce this locally,
sipe-mime.c build isn't mentioned at all in my log.do_compile files (and
PKG_CHECK_MODULES seems to work correctly - not to detect gmime from the
host).

It would be great if you could share log.do_configure/config.log from the
build where it was failing.

Cheers,





On Tue, Jun 18, 2019 at 9:12 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> I've rebuilt it on 4 different hosts with qemux86-64/glibc.
>
> And also with musl locally (first gobject-introspection was failing
> because of qemu-native segfaults, so I've disabled that
> with DISTRO_FEATURES_remove = "gobject-introspection-data") and then
> pidgin-sipe built fine again.
>
> Is it always failing for you reliably or was is random failure just in one
> build?
>
> Cheers,
>
> On Fri, Jun 14, 2019 at 11:34 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> It builds fine for me with qemux86-64 with glibc.
>>
>> I'll check what's going on.
>>
>> Thanks
>>
>> On Fri, Jun 14, 2019 at 8:10 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> Hi Martin
>>>
>>> I noticed this error on qemux86-64
>>>
>>> https://errors.yoctoproject.org/Errors/Details/248480/
>>>
>>> It seems we need to bring in recipe for gmime for this to work. This
>>> is already in master
>>> so can you work on fixing this?
>>>
>>> On Thu, May 23, 2019 at 4:55 AM Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>> >
>>> > * import from luneos to make pidgin here in meta-oe a bit more useful
>>> >
>>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> > ---
>>> >  .../pidgin/funyahoo-plusplus_git.bb           | 25 ++++++++++++++
>>> >  meta-oe/recipes-support/pidgin/icyque_git.bb  | 27 +++++++++++++++
>>> >  .../pidgin/pidgin-sipe_1.24.0.bb              | 34
>>> +++++++++++++++++++
>>> >  .../pidgin/purple-skypeweb_git.bb             | 26 ++++++++++++++
>>> >  4 files changed, 112 insertions(+)
>>> >  create mode 100644 meta-oe/recipes-support/pidgin/
>>> funyahoo-plusplus_git.bb
>>> >  create mode 100644 meta-oe/recipes-support/pidgin/icyque_git.bb
>>> >  create mode 100644 meta-oe/recipes-support/pidgin/
>>> pidgin-sipe_1.24.0.bb
>>> >  create mode 100644 meta-oe/recipes-support/pidgin/
>>> purple-skypeweb_git.bb
>>> >
>>> > diff --git a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
>>> b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
>>> > new file mode 100644
>>> > index 0000000000..3a437659e7
>>> > --- /dev/null
>>> > +++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
>>> > @@ -0,0 +1,25 @@
>>> > +SUMMARY = "Protocol plugin for New Yahoo (2016) for Adium, Pidgin,
>>> Miranda and Telepathy IM Framework"
>>> > +SECTION = "webos/services"
>>> > +LICENSE = "GPLv3.0"
>>> > +LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
>>> > +
>>> > +DEPENDS = "pidgin json-glib glib-2.0"
>>> > +
>>> > +inherit pkgconfig
>>> > +
>>> > +SRC_URI = "git://
>>> github.com/EionRobb/funyahoo-plusplus;branch=master;protocol=git"
>>> > +SRCREV = "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
>>> > +
>>> > +S = "${WORKDIR}/git"
>>> > +
>>> > +do_compile() {
>>> > +    oe_runmake CC="${CC}" CXX="${CXX}"
>>> EXTRA_INCLUDES="${TARGET_CFLAGS}" AR="${AR}";
>>> > +}
>>> > +
>>> > +do_install() {
>>> > +    oe_runmake DESTDIR="${D}" install;
>>> > +}
>>> > +
>>> > +FILES_${PN} += " \
>>> > +    ${libdir} \
>>> > +"
>>> > diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb
>>> b/meta-oe/recipes-support/pidgin/icyque_git.bb
>>> > new file mode 100644
>>> > index 0000000000..0f32dc3a39
>>> > --- /dev/null
>>> > +++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
>>> > @@ -0,0 +1,27 @@
>>> > +SUMMARY = "WIM Protocol plugin for ICQ for Adium, Pidgin, Miranda and
>>> Telepathy IM Framework"
>>> > +SECTION = "webos/services"
>>> > +LICENSE = "GPLv3.0"
>>> > +LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
>>> > +
>>> > +DEPENDS = "pidgin json-glib"
>>> > +
>>> > +PV = "0.1+gitr${SRCPV}"
>>> > +
>>> > +inherit pkgconfig
>>> > +
>>> > +SRC_URI = "git://github.com/EionRobb/icyque"
>>> > +SRCREV = "513fc162d5d1a201c2b044e2b42941436d1069d5"
>>> > +
>>> > +S = "${WORKDIR}/git"
>>> > +
>>> > +do_compile() {
>>> > +    oe_runmake;
>>> > +}
>>> > +
>>> > +do_install() {
>>> > +    oe_runmake DESTDIR="${D}" install;
>>> > +}
>>> > +
>>> > +FILES_${PN} += " \
>>> > +    ${libdir} \
>>> > +"
>>> > diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
>>> b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
>>> > new file mode 100644
>>> > index 0000000000..beae281a30
>>> > --- /dev/null
>>> > +++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
>>> > @@ -0,0 +1,34 @@
>>> > +SUMMARY = "Protocol plugin for Office 365/Lync/OCS for Adium, Pidgin,
>>> Miranda and Telepathy IM Framework"
>>> > +SECTION = "webos/services"
>>> > +LICENSE = "GPLv2.0"
>>> > +LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>>> > +
>>> > +DEPENDS = "pidgin intltool-native glib-2.0-native"
>>> > +
>>> > +inherit pkgconfig
>>> > +inherit autotools
>>> > +
>>> > +SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
>>> > +"
>>> > +
>>> > +SRC_URI[md5sum] = "b91106d28c235b347a63dcb676f7b66a"
>>> > +SRC_URI[sha256sum] =
>>> "958803722b23d869131f76bd90df9da19116d4ca5a873e5253371479b7390f43"
>>> > +
>>> > +PACKAGECONFIG ??= "nss krb5"
>>> > +PACKAGECONFIG[nss] = "--enable-nss=yes,--enable-nss=no,nss"
>>> > +PACKAGECONFIG[openssl] =
>>> "--enable-openssl=yes,--enable-openssl=no,openssl"
>>> > +PACKAGECONFIG[krb5] = "--with-krb5=yes,--with-krb5=no,krb5"
>>> > +#PACKAGECONFIG[voice_and_video] = "--with-vv=yes,--with-vv=no,libnice
>>> gstreamer"
>>> > +PACKAGECONFIG[telepathy] =
>>> "--enable-telepathy=yes,--enable-telepathy=no,telepathy-glib gmime"
>>> > +#PACKAGECONFIG[gssapi_only] =
>>> "--enable-gssapi-only=yes,--enable-gssapi-only=no,krb5"
>>> > +PACKAGECONFIG[debug] = "--enable-debug=yes,--enable-debug=no,valgrind"
>>> > +
>>> > +FILES_${PN}-dev += " \
>>> > +    ${libdir}/purple-2/*.la \
>>> > +"
>>> > +
>>> > +FILES_${PN} += " \
>>> > +    ${libdir}/purple-2/libsipe.so \
>>> > +    ${datadir}/appdata \
>>> > +    ${datadir}/metainfo \
>>> > +"
>>> > diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
>>> b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
>>> > new file mode 100644
>>> > index 0000000000..092e6059b8
>>> > --- /dev/null
>>> > +++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
>>> > @@ -0,0 +1,26 @@
>>> > +SUMMARY = "Skype protocol plug-in for libpurple"
>>> > +SECTION = "webos/services"
>>> > +LICENSE = "GPLv3"
>>> > +LIC_FILES_CHKSUM =
>>> "file://skypeweb/gpl3.txt;md5=d90260d32cef39f3c8d6c0f05d3adb8e"
>>> > +
>>> > +DEPENDS = "pidgin json-glib glib-2.0 zlib"
>>> > +
>>> > +inherit pkgconfig
>>> > +
>>> > +SRC_URI = "git://
>>> github.com/EionRobb/skype4pidgin;branch=master;protocol=git"
>>> > +SRCREV = "14f1b69b6292bbdc98cca484b050ec8359394c4e"
>>> > +
>>> > +S = "${WORKDIR}/git"
>>> > +PV = "1.5+git${SRCPV}"
>>> > +
>>> > +do_compile() {
>>> > +    oe_runmake -C skypeweb;
>>> > +}
>>> > +
>>> > +do_install() {
>>> > +    oe_runmake -C skypeweb DESTDIR="${D}" install;
>>> > +}
>>> > +
>>> > +FILES_${PN} += " \
>>> > +    ${libdir} \
>>> > +"
>>> > --
>>> > 2.17.1
>>> >
>>> > --
>>> > _______________________________________________
>>> > Openembedded-devel mailing list
>>> > Openembedded-devel@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>

