Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9B17E6E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 07:12:47 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id d4so20074161edr.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IWpcX+ocNkc08v20z0DdLhpJtKnXmGyiXaoUJy6mraQ=;
	b=G2/rTDfco0/UK0v+p2bVSUU9swDCm2YF+i2OJN6kT1QLcenhRGgOXZ3/cZhZB2R6le
	6QBMNi5d1oZF9LXXEUIRHc/yOLi4UkBHyE5/AI6flUiRD8BzxNyUbeFcibMES5qXXgEs
	siWoNKzD1cndGKKGWsgQcb3klx0ZsKKHOSYxwMPRXXfwibjfTxV0SdWmJUwgna2dBP+8
	a6LvHu8lv+7Rin3zcq4aYB6sLv7UFPB47LDberd94ras4UkH/j9ghfuX5EXKqWYX9t8r
	eQaz7Evmlldmfni4MDwjAuxjlJJUa1ghQ9WEnBIj5fvtJdE+ZHa6tZ9nf5TO0b9A7mq8
	ZcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IWpcX+ocNkc08v20z0DdLhpJtKnXmGyiXaoUJy6mraQ=;
	b=VE2z4T3v98S1K8G0P0fjB5G2QJBNYPE1viWhcMpbblqBGIe4GvzPJ7e0vc+JlG/Bsv
	r6F+JIXKFoMAvtCwgg8H9/QcWNqycPmb3fH/Nylk48gCElldYklfzWFbnWE6cYn+x47q
	zzkUEr2l1TIGhpB2K3ED83nD4ZB5wxDGMn3XUr3pIJDWFDdSBUK+CpqjLjlm4eslCAHy
	vpEMsTGvdokbdUW9q0v6/hlI4glunqBocwDJ+0+0Ytk+gnrC3XcB6pJeaA6DBhl1tDPE
	co4NzsHXR3FU0ZDWQmKDPiGUYBDA2fF8Ae9Ur3KRUvZDi7BcuUXEj0Kx2+7Ifz4NEVUB
	jTKg==
X-Gm-Message-State: APjAAAWujqVFXP2ZiE0g/PnZmza0p1qYmIwnKbNLnFJ3hfl7U+Viprse
	x/kXoqucuHFeTThz7N68ku581KXG+CxBVXO1dIY=
X-Google-Smtp-Source: APXvYqzJ9lguEREgS0Fx7fptqYq0nlN/Cm9KyHg+A++I1xGeOC0McAjawHGgQM25/8DG1AOeNxvql0To2neXH44u6U0=
X-Received: by 2002:a05:6402:6d0:: with SMTP id
	n16mr61073206edy.168.1560841967993; 
	Tue, 18 Jun 2019 00:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
	<20190523115505.18245-3-Martin.Jansa@gmail.com>
	<CAMKF1sraHDXnk1iL_vpZfZUngVvLXQ3fWRiCKTP1YW3e5vUkrQ@mail.gmail.com>
	<CA+chaQdUYmmJ8KZV_fc+-85LLZh7YCKLttaygD73Rx_9Qfd5yQ@mail.gmail.com>
In-Reply-To: <CA+chaQdUYmmJ8KZV_fc+-85LLZh7YCKLttaygD73Rx_9Qfd5yQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jun 2019 09:12:43 +0200
Message-ID: <CA+chaQf3J5=1A99rpmGkvOT5gFqzS+gKU5GNC-VYW1AJw_wCSw@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Jun 2019 07:12:47 -0000
Content-Type: text/plain; charset="UTF-8"

I've rebuilt it on 4 different hosts with qemux86-64/glibc.

And also with musl locally (first gobject-introspection was failing because
of qemu-native segfaults, so I've disabled that with DISTRO_FEATURES_remove
= "gobject-introspection-data") and then pidgin-sipe built fine again.

Is it always failing for you reliably or was is random failure just in one
build?

Cheers,

On Fri, Jun 14, 2019 at 11:34 PM Martin Jansa <martin.jansa@gmail.com>
wrote:

> It builds fine for me with qemux86-64 with glibc.
>
> I'll check what's going on.
>
> Thanks
>
> On Fri, Jun 14, 2019 at 8:10 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Hi Martin
>>
>> I noticed this error on qemux86-64
>>
>> https://errors.yoctoproject.org/Errors/Details/248480/
>>
>> It seems we need to bring in recipe for gmime for this to work. This
>> is already in master
>> so can you work on fixing this?
>>
>> On Thu, May 23, 2019 at 4:55 AM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> >
>> > * import from luneos to make pidgin here in meta-oe a bit more useful
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  .../pidgin/funyahoo-plusplus_git.bb           | 25 ++++++++++++++
>> >  meta-oe/recipes-support/pidgin/icyque_git.bb  | 27 +++++++++++++++
>> >  .../pidgin/pidgin-sipe_1.24.0.bb              | 34 +++++++++++++++++++
>> >  .../pidgin/purple-skypeweb_git.bb             | 26 ++++++++++++++
>> >  4 files changed, 112 insertions(+)
>> >  create mode 100644 meta-oe/recipes-support/pidgin/
>> funyahoo-plusplus_git.bb
>> >  create mode 100644 meta-oe/recipes-support/pidgin/icyque_git.bb
>> >  create mode 100644 meta-oe/recipes-support/pidgin/
>> pidgin-sipe_1.24.0.bb
>> >  create mode 100644 meta-oe/recipes-support/pidgin/
>> purple-skypeweb_git.bb
>> >
>> > diff --git a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
>> b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
>> > new file mode 100644
>> > index 0000000000..3a437659e7
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
>> > @@ -0,0 +1,25 @@
>> > +SUMMARY = "Protocol plugin for New Yahoo (2016) for Adium, Pidgin,
>> Miranda and Telepathy IM Framework"
>> > +SECTION = "webos/services"
>> > +LICENSE = "GPLv3.0"
>> > +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
>> > +
>> > +DEPENDS = "pidgin json-glib glib-2.0"
>> > +
>> > +inherit pkgconfig
>> > +
>> > +SRC_URI = "git://
>> github.com/EionRobb/funyahoo-plusplus;branch=master;protocol=git"
>> > +SRCREV = "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
>> > +
>> > +S = "${WORKDIR}/git"
>> > +
>> > +do_compile() {
>> > +    oe_runmake CC="${CC}" CXX="${CXX}"
>> EXTRA_INCLUDES="${TARGET_CFLAGS}" AR="${AR}";
>> > +}
>> > +
>> > +do_install() {
>> > +    oe_runmake DESTDIR="${D}" install;
>> > +}
>> > +
>> > +FILES_${PN} += " \
>> > +    ${libdir} \
>> > +"
>> > diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb
>> b/meta-oe/recipes-support/pidgin/icyque_git.bb
>> > new file mode 100644
>> > index 0000000000..0f32dc3a39
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
>> > @@ -0,0 +1,27 @@
>> > +SUMMARY = "WIM Protocol plugin for ICQ for Adium, Pidgin, Miranda and
>> Telepathy IM Framework"
>> > +SECTION = "webos/services"
>> > +LICENSE = "GPLv3.0"
>> > +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
>> > +
>> > +DEPENDS = "pidgin json-glib"
>> > +
>> > +PV = "0.1+gitr${SRCPV}"
>> > +
>> > +inherit pkgconfig
>> > +
>> > +SRC_URI = "git://github.com/EionRobb/icyque"
>> > +SRCREV = "513fc162d5d1a201c2b044e2b42941436d1069d5"
>> > +
>> > +S = "${WORKDIR}/git"
>> > +
>> > +do_compile() {
>> > +    oe_runmake;
>> > +}
>> > +
>> > +do_install() {
>> > +    oe_runmake DESTDIR="${D}" install;
>> > +}
>> > +
>> > +FILES_${PN} += " \
>> > +    ${libdir} \
>> > +"
>> > diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
>> b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
>> > new file mode 100644
>> > index 0000000000..beae281a30
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
>> > @@ -0,0 +1,34 @@
>> > +SUMMARY = "Protocol plugin for Office 365/Lync/OCS for Adium, Pidgin,
>> Miranda and Telepathy IM Framework"
>> > +SECTION = "webos/services"
>> > +LICENSE = "GPLv2.0"
>> > +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>> > +
>> > +DEPENDS = "pidgin intltool-native glib-2.0-native"
>> > +
>> > +inherit pkgconfig
>> > +inherit autotools
>> > +
>> > +SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
>> > +"
>> > +
>> > +SRC_URI[md5sum] = "b91106d28c235b347a63dcb676f7b66a"
>> > +SRC_URI[sha256sum] =
>> "958803722b23d869131f76bd90df9da19116d4ca5a873e5253371479b7390f43"
>> > +
>> > +PACKAGECONFIG ??= "nss krb5"
>> > +PACKAGECONFIG[nss] = "--enable-nss=yes,--enable-nss=no,nss"
>> > +PACKAGECONFIG[openssl] =
>> "--enable-openssl=yes,--enable-openssl=no,openssl"
>> > +PACKAGECONFIG[krb5] = "--with-krb5=yes,--with-krb5=no,krb5"
>> > +#PACKAGECONFIG[voice_and_video] = "--with-vv=yes,--with-vv=no,libnice
>> gstreamer"
>> > +PACKAGECONFIG[telepathy] =
>> "--enable-telepathy=yes,--enable-telepathy=no,telepathy-glib gmime"
>> > +#PACKAGECONFIG[gssapi_only] =
>> "--enable-gssapi-only=yes,--enable-gssapi-only=no,krb5"
>> > +PACKAGECONFIG[debug] = "--enable-debug=yes,--enable-debug=no,valgrind"
>> > +
>> > +FILES_${PN}-dev += " \
>> > +    ${libdir}/purple-2/*.la \
>> > +"
>> > +
>> > +FILES_${PN} += " \
>> > +    ${libdir}/purple-2/libsipe.so \
>> > +    ${datadir}/appdata \
>> > +    ${datadir}/metainfo \
>> > +"
>> > diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
>> b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
>> > new file mode 100644
>> > index 0000000000..092e6059b8
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
>> > @@ -0,0 +1,26 @@
>> > +SUMMARY = "Skype protocol plug-in for libpurple"
>> > +SECTION = "webos/services"
>> > +LICENSE = "GPLv3"
>> > +LIC_FILES_CHKSUM =
>> "file://skypeweb/gpl3.txt;md5=d90260d32cef39f3c8d6c0f05d3adb8e"
>> > +
>> > +DEPENDS = "pidgin json-glib glib-2.0 zlib"
>> > +
>> > +inherit pkgconfig
>> > +
>> > +SRC_URI = "git://
>> github.com/EionRobb/skype4pidgin;branch=master;protocol=git"
>> > +SRCREV = "14f1b69b6292bbdc98cca484b050ec8359394c4e"
>> > +
>> > +S = "${WORKDIR}/git"
>> > +PV = "1.5+git${SRCPV}"
>> > +
>> > +do_compile() {
>> > +    oe_runmake -C skypeweb;
>> > +}
>> > +
>> > +do_install() {
>> > +    oe_runmake -C skypeweb DESTDIR="${D}" install;
>> > +}
>> > +
>> > +FILES_${PN} += " \
>> > +    ${libdir} \
>> > +"
>> > --
>> > 2.17.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

