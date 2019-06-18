Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 95AD27E915
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 17:48:19 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j19so16399686qtr.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lep7jHC9/jMsYQ/te5bbHGWKrilcLdYFLCoHyYBZJFI=;
	b=Zc8gaUF3vmyikAc1NN+uTwOMBgvOzxZfjEcWadZShms90i2rAJPlobqsOuYt/MWJPK
	CHTDSq8ws4TUFnUzbZ5BtRRntme12wMw85cj9fI82rX7xbTfhlQxOZlwPbx/J5hbjrGD
	hVftsj830jtZYKWnZbOkIjNx+IAJmpdPz0wXjAf0pz34uszIJ7uhqTBiMmzzOEQT5BXK
	/kQBH1jq/nUAkLQIix+9cBlVByX5vUc3lPWSfHGRdOGqEjZ9z6g/8hpjau9t6vIhF2qn
	qJUdpfQKjrRHbASLkyvzDoBuDogvPRZg5QCX2ii1nolVfxpqHlThZ+0C3CPFCUeY949T
	6aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lep7jHC9/jMsYQ/te5bbHGWKrilcLdYFLCoHyYBZJFI=;
	b=TojpDTHn3Jvp893ZDTqJYT/lGdX+dsX8m3zPUtUy/+7Brqh9LJ9ZaMznsnNdFhxCur
	70LnrUAsdTIw+ajCTboTfrpIhLlWSITslvjJZMqI+CMndAkzNoCPAniGVhU2TX4wqB3+
	I8I7lgGSCMyJUkJgXMHpi7AEgojaQ4g45WCw4Yaj21XdDrxZfnDiUERrx1Te7MAQ3Rl3
	M4DSoh6ApqU8cWbmxxsNTBIVd3olpFW8T2ti6I9neXFe13bLSqlWQXwKQxFSPSac8/5L
	4HTOkaIafLFUrsDqSOaJj8wWQfo2diN+ov25PRz3Yf4T5oTiUOIowC551NjuxfNkzJcj
	DmnA==
X-Gm-Message-State: APjAAAVpnicT0trhtdnP4waGIC2RY62hoIiZGYnTnlYBeinIJoQ3cLCu
	hbOf4htjiWGMPgEarRNUN9F2I94xbRrbAvk1aI4=
X-Google-Smtp-Source: APXvYqw/zNs5uRf6cIte1Oo/vpnHwvkx2tVGeb8LNebiN+48Ii918vbnjr45M3TmMmJRNYEfwc2G1AgiSXLCF+AKvNQ=
X-Received: by 2002:a0c:89f3:: with SMTP id 48mr28817134qvs.68.1560880099995; 
	Tue, 18 Jun 2019 10:48:19 -0700 (PDT)
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
	<CA+chaQcX=K039tJLm7_4XZWODXYTtutVpf-Ka5_rEp8iFmJ5uQ@mail.gmail.com>
In-Reply-To: <CA+chaQcX=K039tJLm7_4XZWODXYTtutVpf-Ka5_rEp8iFmJ5uQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2019 10:47:53 -0700
Message-ID: <CAMKF1srZTRC7+tOMKtQ1oeY6OSJwFbfUF-VmYydb6u1e5W3zAg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Tue, 18 Jun 2019 17:48:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 8:54 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> > my env is a bit different then yours, I have not tried using glibc but
>
> I was testing it with musl as well.
>
> Lets see what your config.log will show.


configure:10372: checking for gmime-3.0 >=3D 3.0.0
configure:10379: $PKG_CONFIG --exists --print-errors "gmime-3.0 >=3D 3.0.0"
Package gmime-3.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `gmime-3.0.pc'
to the PKG_CONFIG_PATH environment variable
No package 'gmime-3.0' found
configure:10382: $? =3D 1
configure:10396: $PKG_CONFIG --exists --print-errors "gmime-3.0 >=3D 3.0.0"
Package gmime-3.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `gmime-3.0.pc'
to the PKG_CONFIG_PATH environment variable
No package 'gmime-3.0' found
configure:10399: $? =3D 1
configure:10413: result: no
No package 'gmime-3.0' found
configure:10431: checking for gmime-2.6 >=3D 2.6.0
configure:10438: $PKG_CONFIG --exists --print-errors "gmime-2.6 >=3D 2.6.0"
configure:10441: $? =3D 0
configure:10455: $PKG_CONFIG --exists --print-errors "gmime-2.6 >=3D 2.6.0"
configure:10458: $? =3D 0
configure:10496: result: yes



>
> On Tue, Jun 18, 2019 at 5:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Jun 18, 2019 at 8:37 AM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> >
>> > FWIW: Even with libgmime-2.6-0 libgmime-2.6-dev installed on Ubuntu 18=
-04 host
>> >
>> > $ pkg-config --cflags gmime-2.6
>> > -D_LARGEFILE64_SOURCE -pthread -I/usr/include/gmime-2.6 -I/usr/include=
/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
>> >
>> > I still don't get gmime autodetected in pidgin-sipe:
>> >
>> > grep -i mime BUILD/work/core2-64-oe-linux-musl/pidgin-sipe/1.24.0-r0/t=
emp/log.do_configure
>> > checking for gmime-3.0 >=3D 3.0.0... no
>> > checking for gmime-2.6 >=3D 2.6.0... no
>>
>> these are correct checks but the checks on my system are
>>
>> checking for gmime-3.0 >=3D 3.0.0... no
>> checking for gmime-2.6 >=3D 2.6.0... yes
>>
>> and I have gmime-2.6 on build host installed. There is not much
>> information in log files to indicate how it came to that conclusion
>> but my
>> guess is its calling pkg-config without sysroot in second call after
>> 3.0 detection fails.
>>
>> my env is a bit different then yours, I have not tried using glibc but
>> I will do that today.
>>
>> archlinux/clang/musl/qemux86_64
>>
>> >
>> > and it still builds only sipe-mime-common.c not sipe-mime.c here.
>> >
>> > On Tue, Jun 18, 2019 at 3:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Tue, Jun 18, 2019 at 3:43 AM Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>> >> >
>> >> > > It seems we need to bring in recipe for gmime for this to work. T=
his is already in master
>> >> >
>> >> > sipe-mime.c shown in the error is built only with SIPE_MIME_GMIME
>> >> >
>> >> > src/core/Makefile.am:
>> >> > if SIPE_MIME_GMIME
>> >> > noinst_LTLIBRARIES           +=3D libsipe_core_mime.la
>> >> > libsipe_core_mime_la_SOURCES  =3D sipe-mime.c
>> >> > libsipe_core_mime_la_CFLAGS   =3D $(libsipe_core_la_CFLAGS) $(GMIME=
_CFLAGS)
>> >> > endif
>> >> >
>> >> > And that gets enabled only when pkg-config finds gmime-3.0 in gmime=
-2.6:
>> >> > configure.ac:
>> >> > dnl check for gmime
>> >> > PKG_CHECK_MODULES(GMIME, [gmime-3.0 >=3D 3.0.0],
>> >> >         [ac_have_gmime=3Dyes],
>> >> >         [PKG_CHECK_MODULES(GMIME, [gmime-2.6 >=3D 2.6.0],
>> >> >                 [ac_have_gmime=3Dyes],
>> >> >                 [ac_have_gmime=3Dno])
>> >> >         ])
>> >> > AM_CONDITIONAL(SIPE_MIME_GMIME, [test "x$ac_have_gmime" =3D xyes])
>> >> > AS_IF([test "x$ac_have_gmime" =3D xyes],
>> >> >         [AC_DEFINE(HAVE_GMIME, 1, [Define if gmime should be used i=
n sipe.])])
>> >> >
>> >> > which it really shouldn't as there isn't anything which should pull=
 it into RSS.
>> >> >
>> >> > There is some old gmime recipe in meta-guacamayo:
>> >> > https://github.com/Guacamayo/meta-guacamayo/commit/cc3e1020cb696a6a=
4227b18009e99b137059b0a4#diff-2de762e26fa1d5e913b81b43a4b5c92c
>> >>
>> >> I have written an updated one for 3.x, will post soon,
>> >> >
>> >> > but still this shouldn't be needed as long as you don't enable tele=
pathy PACKAGECONFIG in pidgin-sipe. I don't know how to reproduce this loca=
lly, sipe-mime.c build isn't mentioned at all in my log.do_compile files (a=
nd PKG_CHECK_MODULES seems to work correctly - not to detect gmime from the=
 host).
>> >> >
>> >> > It would be great if you could share log.do_configure/config.log fr=
om the build where it was failing.
>> >> >
>> >>
>> >> thanks for looking into it, so you need to have gmime-2.6 installed o=
n
>> >> your build host for this error to trigger
>> >> it seems to be looking into build host's sysroot.
>> >> > Cheers,
>> >> >
>> >> >
>> >> >
>> >> >
>> >> >
>> >> > On Tue, Jun 18, 2019 at 9:12 AM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>> >> >>
>> >> >> I've rebuilt it on 4 different hosts with qemux86-64/glibc.
>> >> >>
>> >> >> And also with musl locally (first gobject-introspection was failin=
g because of qemu-native segfaults, so I've disabled that with DISTRO_FEATU=
RES_remove =3D "gobject-introspection-data") and then pidgin-sipe built fin=
e again.
>> >> >>
>> >> >> Is it always failing for you reliably or was is random failure jus=
t in one build?
>> >> >>
>> >> >> Cheers,
>> >> >>
>> >> >> On Fri, Jun 14, 2019 at 11:34 PM Martin Jansa <martin.jansa@gmail.=
com> wrote:
>> >> >>>
>> >> >>> It builds fine for me with qemux86-64 with glibc.
>> >> >>>
>> >> >>> I'll check what's going on.
>> >> >>>
>> >> >>> Thanks
>> >> >>>
>> >> >>> On Fri, Jun 14, 2019 at 8:10 PM Khem Raj <raj.khem@gmail.com> wro=
te:
>> >> >>>>
>> >> >>>> Hi Martin
>> >> >>>>
>> >> >>>> I noticed this error on qemux86-64
>> >> >>>>
>> >> >>>> https://errors.yoctoproject.org/Errors/Details/248480/
>> >> >>>>
>> >> >>>> It seems we need to bring in recipe for gmime for this to work. =
This
>> >> >>>> is already in master
>> >> >>>> so can you work on fixing this?
>> >> >>>>
>> >> >>>> On Thu, May 23, 2019 at 4:55 AM Martin Jansa <martin.jansa@gmail=
.com> wrote:
>> >> >>>> >
>> >> >>>> > * import from luneos to make pidgin here in meta-oe a bit more=
 useful
>> >> >>>> >
>> >> >>>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >> >>>> > ---
>> >> >>>> >  .../pidgin/funyahoo-plusplus_git.bb           | 25 ++++++++++=
++++
>> >> >>>> >  meta-oe/recipes-support/pidgin/icyque_git.bb  | 27 ++++++++++=
+++++
>> >> >>>> >  .../pidgin/pidgin-sipe_1.24.0.bb              | 34 ++++++++++=
+++++++++
>> >> >>>> >  .../pidgin/purple-skypeweb_git.bb             | 26 ++++++++++=
++++
>> >> >>>> >  4 files changed, 112 insertions(+)
>> >> >>>> >  create mode 100644 meta-oe/recipes-support/pidgin/funyahoo-pl=
usplus_git.bb
>> >> >>>> >  create mode 100644 meta-oe/recipes-support/pidgin/icyque_git.=
bb
>> >> >>>> >  create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe=
_1.24.0.bb
>> >> >>>> >  create mode 100644 meta-oe/recipes-support/pidgin/purple-skyp=
eweb_git.bb
>> >> >>>> >
>> >> >>>> > diff --git a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_=
git.bb b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
>> >> >>>> > new file mode 100644
>> >> >>>> > index 0000000000..3a437659e7
>> >> >>>> > --- /dev/null
>> >> >>>> > +++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
>> >> >>>> > @@ -0,0 +1,25 @@
>> >> >>>> > +SUMMARY =3D "Protocol plugin for New Yahoo (2016) for Adium, =
Pidgin, Miranda and Telepathy IM Framework"
>> >> >>>> > +SECTION =3D "webos/services"
>> >> >>>> > +LICENSE =3D "GPLv3.0"
>> >> >>>> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84dcc94da3adb52b53=
ae4fa38fe49e5d"
>> >> >>>> > +
>> >> >>>> > +DEPENDS =3D "pidgin json-glib glib-2.0"
>> >> >>>> > +
>> >> >>>> > +inherit pkgconfig
>> >> >>>> > +
>> >> >>>> > +SRC_URI =3D "git://github.com/EionRobb/funyahoo-plusplus;bran=
ch=3Dmaster;protocol=3Dgit"
>> >> >>>> > +SRCREV =3D "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
>> >> >>>> > +
>> >> >>>> > +S =3D "${WORKDIR}/git"
>> >> >>>> > +
>> >> >>>> > +do_compile() {
>> >> >>>> > +    oe_runmake CC=3D"${CC}" CXX=3D"${CXX}" EXTRA_INCLUDES=3D"=
${TARGET_CFLAGS}" AR=3D"${AR}";
>> >> >>>> > +}
>> >> >>>> > +
>> >> >>>> > +do_install() {
>> >> >>>> > +    oe_runmake DESTDIR=3D"${D}" install;
>> >> >>>> > +}
>> >> >>>> > +
>> >> >>>> > +FILES_${PN} +=3D " \
>> >> >>>> > +    ${libdir} \
>> >> >>>> > +"
>> >> >>>> > diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/me=
ta-oe/recipes-support/pidgin/icyque_git.bb
>> >> >>>> > new file mode 100644
>> >> >>>> > index 0000000000..0f32dc3a39
>> >> >>>> > --- /dev/null
>> >> >>>> > +++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
>> >> >>>> > @@ -0,0 +1,27 @@
>> >> >>>> > +SUMMARY =3D "WIM Protocol plugin for ICQ for Adium, Pidgin, M=
iranda and Telepathy IM Framework"
>> >> >>>> > +SECTION =3D "webos/services"
>> >> >>>> > +LICENSE =3D "GPLv3.0"
>> >> >>>> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af26da=
5dc08a4e440464"
>> >> >>>> > +
>> >> >>>> > +DEPENDS =3D "pidgin json-glib"
>> >> >>>> > +
>> >> >>>> > +PV =3D "0.1+gitr${SRCPV}"
>> >> >>>> > +
>> >> >>>> > +inherit pkgconfig
>> >> >>>> > +
>> >> >>>> > +SRC_URI =3D "git://github.com/EionRobb/icyque"
>> >> >>>> > +SRCREV =3D "513fc162d5d1a201c2b044e2b42941436d1069d5"
>> >> >>>> > +
>> >> >>>> > +S =3D "${WORKDIR}/git"
>> >> >>>> > +
>> >> >>>> > +do_compile() {
>> >> >>>> > +    oe_runmake;
>> >> >>>> > +}
>> >> >>>> > +
>> >> >>>> > +do_install() {
>> >> >>>> > +    oe_runmake DESTDIR=3D"${D}" install;
>> >> >>>> > +}
>> >> >>>> > +
>> >> >>>> > +FILES_${PN} +=3D " \
>> >> >>>> > +    ${libdir} \
>> >> >>>> > +"
>> >> >>>> > diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0=
.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
>> >> >>>> > new file mode 100644
>> >> >>>> > index 0000000000..beae281a30
>> >> >>>> > --- /dev/null
>> >> >>>> > +++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
>> >> >>>> > @@ -0,0 +1,34 @@
>> >> >>>> > +SUMMARY =3D "Protocol plugin for Office 365/Lync/OCS for Adiu=
m, Pidgin, Miranda and Telepathy IM Framework"
>> >> >>>> > +SECTION =3D "webos/services"
>> >> >>>> > +LICENSE =3D "GPLv2.0"
>> >> >>>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f=
7abaabaa882bbe"
>> >> >>>> > +
>> >> >>>> > +DEPENDS =3D "pidgin intltool-native glib-2.0-native"
>> >> >>>> > +
>> >> >>>> > +inherit pkgconfig
>> >> >>>> > +inherit autotools
>> >> >>>> > +
>> >> >>>> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar=
.xz \
>> >> >>>> > +"
>> >> >>>> > +
>> >> >>>> > +SRC_URI[md5sum] =3D "b91106d28c235b347a63dcb676f7b66a"
>> >> >>>> > +SRC_URI[sha256sum] =3D "958803722b23d869131f76bd90df9da19116d=
4ca5a873e5253371479b7390f43"
>> >> >>>> > +
>> >> >>>> > +PACKAGECONFIG ??=3D "nss krb5"
>> >> >>>> > +PACKAGECONFIG[nss] =3D "--enable-nss=3Dyes,--enable-nss=3Dno,=
nss"
>> >> >>>> > +PACKAGECONFIG[openssl] =3D "--enable-openssl=3Dyes,--enable-o=
penssl=3Dno,openssl"
>> >> >>>> > +PACKAGECONFIG[krb5] =3D "--with-krb5=3Dyes,--with-krb5=3Dno,k=
rb5"
>> >> >>>> > +#PACKAGECONFIG[voice_and_video] =3D "--with-vv=3Dyes,--with-v=
v=3Dno,libnice gstreamer"
>> >> >>>> > +PACKAGECONFIG[telepathy] =3D "--enable-telepathy=3Dyes,--enab=
le-telepathy=3Dno,telepathy-glib gmime"
>> >> >>>> > +#PACKAGECONFIG[gssapi_only] =3D "--enable-gssapi-only=3Dyes,-=
-enable-gssapi-only=3Dno,krb5"
>> >> >>>> > +PACKAGECONFIG[debug] =3D "--enable-debug=3Dyes,--enable-debug=
=3Dno,valgrind"
>> >> >>>> > +
>> >> >>>> > +FILES_${PN}-dev +=3D " \
>> >> >>>> > +    ${libdir}/purple-2/*.la \
>> >> >>>> > +"
>> >> >>>> > +
>> >> >>>> > +FILES_${PN} +=3D " \
>> >> >>>> > +    ${libdir}/purple-2/libsipe.so \
>> >> >>>> > +    ${datadir}/appdata \
>> >> >>>> > +    ${datadir}/metainfo \
>> >> >>>> > +"
>> >> >>>> > diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_gi=
t.bb b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
>> >> >>>> > new file mode 100644
>> >> >>>> > index 0000000000..092e6059b8
>> >> >>>> > --- /dev/null
>> >> >>>> > +++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
>> >> >>>> > @@ -0,0 +1,26 @@
>> >> >>>> > +SUMMARY =3D "Skype protocol plug-in for libpurple"
>> >> >>>> > +SECTION =3D "webos/services"
>> >> >>>> > +LICENSE =3D "GPLv3"
>> >> >>>> > +LIC_FILES_CHKSUM =3D "file://skypeweb/gpl3.txt;md5=3Dd90260d3=
2cef39f3c8d6c0f05d3adb8e"
>> >> >>>> > +
>> >> >>>> > +DEPENDS =3D "pidgin json-glib glib-2.0 zlib"
>> >> >>>> > +
>> >> >>>> > +inherit pkgconfig
>> >> >>>> > +
>> >> >>>> > +SRC_URI =3D "git://github.com/EionRobb/skype4pidgin;branch=3D=
master;protocol=3Dgit"
>> >> >>>> > +SRCREV =3D "14f1b69b6292bbdc98cca484b050ec8359394c4e"
>> >> >>>> > +
>> >> >>>> > +S =3D "${WORKDIR}/git"
>> >> >>>> > +PV =3D "1.5+git${SRCPV}"
>> >> >>>> > +
>> >> >>>> > +do_compile() {
>> >> >>>> > +    oe_runmake -C skypeweb;
>> >> >>>> > +}
>> >> >>>> > +
>> >> >>>> > +do_install() {
>> >> >>>> > +    oe_runmake -C skypeweb DESTDIR=3D"${D}" install;
>> >> >>>> > +}
>> >> >>>> > +
>> >> >>>> > +FILES_${PN} +=3D " \
>> >> >>>> > +    ${libdir} \
>> >> >>>> > +"
>> >> >>>> > --
>> >> >>>> > 2.17.1
>> >> >>>> >
>> >> >>>> > --
>> >> >>>> > _______________________________________________
>> >> >>>> > Openembedded-devel mailing list
>> >> >>>> > Openembedded-devel@lists.openembedded.org
>> >> >>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-de=
vel

