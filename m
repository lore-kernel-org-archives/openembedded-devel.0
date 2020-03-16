Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 332BB601EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2020 06:18:42 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id h14so24239502qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 23:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YWb9w0N5kVgshAlrpe/7UsPF9h77PKJjuoic10bvg10=;
	b=iklNcWW8lLfamzbLy3A84o5YfCKjljtmoc6zU/VRByOi44CBcFRbDl5nWjye3nBOXT
	ih+AIDxNiSFDir3SuYWT13MxUOXgStdEvpG/ZNf6HKpoz2zLndI6tQWqaQdwwZNoSHRf
	hbFiHcZIg0t702bH3aBk05A9Jd32UpzMNvWPy9qr73N4nsGb4aI/NvcYTXNvd80Kv4Mg
	1NxJ9JW/g9eeWX6OnG7IpUWb4zSmctGvuS91QYPYxOkmxrKUEejtTEh84/PtQhapKXhl
	NL/Vim5aykRzEsTwEDgVQiZcfwVJ0ylRpeTpYaD2iTVc6mPRdDyKbJIze9pOe8CzbHyn
	gT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YWb9w0N5kVgshAlrpe/7UsPF9h77PKJjuoic10bvg10=;
	b=JN0TpTe+TKYZCDKAZI5b9SZlFaGRK0eYX3PwKV4jbfCMqfQ/+y5UQJTMfeVSCAVBfJ
	YDGMrIGlWloJjjXXlOnVlsXINg9Bef8uGSRABgBRI90kF73Jg1R7YNwp19HqeXkiJ4Ym
	edAtf1FsUk5BntFg74QbuLie4KFJuxs3czvK+3f44qBdRK87kgIiFxOrOP6tnLr/xF4/
	MkdoFeTAZ7YzlEMroV+9IF/NTI/t54ZFqD06iyKXw/pFplsn+9F8Nu+6PTdhaPkFmDHO
	dFyw+fUkGhauVOxWSsY5p1ByzcJjm7Jui1Zca4+E3OWY1VfYgC6iC0wMoMoK1+r9dPjf
	wQxw==
X-Gm-Message-State: ANhLgQ3QUAMs0d90LmxfB1mjdC2taEfBs6lqJXKiU8bSnYUXRp9Yo8Qx
	h24ujfYsgstwFr02nky8jvpKWiB8ctSWbFcEBho=
X-Google-Smtp-Source: ADFU+vvU/A6s/j+dXNVWk9bC2kzeY2qe2a3VlXiY4+oQ0p/RoFn0jJah0gvXLspeGvNxcpZ5JxbTOofFCiaOFlfNPWk=
X-Received: by 2002:a05:620a:22b:: with SMTP id
	u11mr24518156qkm.225.1584339522708; 
	Sun, 15 Mar 2020 23:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200314220440.5983-1-schnitzeltony@gmail.com>
	<CAMKF1sotjDeZvidnX=FDL8u1f2KJ_Y5X-FLM++07jfqV887wxg@mail.gmail.com>
	<CALbNGRQUKLFzvAUF2djkp2nuqnYD1CaHMT8fELiAPxNtkwTWbQ@mail.gmail.com>
In-Reply-To: <CALbNGRQUKLFzvAUF2djkp2nuqnYD1CaHMT8fELiAPxNtkwTWbQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Mar 2020 23:18:15 -0700
Message-ID: <CAMKF1srEewvC2_OVy3fH2JJbU_1ReN2C=n1+RO5Ok7R9g8WPKg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] pipewire: upgrade 0.2.7 -> 0.3.1
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
X-List-Received-Date: Mon, 16 Mar 2020 06:18:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2020 at 10:49 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Mon, Mar 16, 2020 at 12:35 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sat, Mar 14, 2020 at 3:05 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > * as long as we have not upgradeed mutter to 3.36 we have to keep pip=
ewire
> > >   0.2.7 as pipewire-0.2 - mutter 3.34 asks for pipewire 0.2
> > > * license was changed to MIT
> > > * additional PACKAGECONFIGs added. The defaults were chosen by DISTRO=
_FEATURES
> > >   or if not available by pipewire's defaults
> > > * vulkan was disabled for now
> > >

perhaps a packageconfig with disabled default explicitly

> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >  .../pipewire/pipewire-0.2_git.bb              | 65 +++++++++++++++++=
++
> > >  .../pipewire/pipewire_git.bb                  | 32 +++++----
> > >  2 files changed, 86 insertions(+), 11 deletions(-)
> > >  create mode 100644 meta-oe/recipes-multimedia/pipewire/pipewire-0.2_=
git.bb
> > >
> > > diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb =
b/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
> > > new file mode 100644
> > > index 000000000..bcb3015f8
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
> > > @@ -0,0 +1,65 @@
> > > +SUMMARY =3D "Multimedia processing server for Linux"
> > > +AUTHOR =3D "Wim Taymans <wtaymans@redhat.com>"
> > > +HOMEPAGE =3D "https://pipewire.org"
> > > +SECTION =3D "multimedia"
> > > +LICENSE =3D "LGPL-2.1"
> > > +LIC_FILES_CHKSUM =3D " \
> > > +    file://LICENSE;md5=3Dd8153c6e65986f862a0550ca74a3ed73 \
> > > +    file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> > > +"
> > > +DEPENDS =3D "alsa-lib dbus udev"
> > > +SRCREV =3D "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
> > > +PV =3D "0.2.7"
> > > +
> > > +SRC_URI =3D "git://github.com/PipeWire/pipewire"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit meson pkgconfig systemd manpages
> > > +
> > > +PACKAGECONFIG ??=3D "\
> > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > > +    gstreamer \
> > > +"
> > > +
> > > +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,syste=
md"
> > > +PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddi=
sabled,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> > > +PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxml-parse=
r-perl-native"
> > > +
> > > +PACKAGES =3D+ "\
> > > +    ${PN}-spa-plugins \
> > > +    ${PN}-alsa \
> > > +    ${PN}-config \
> > > +    gstreamer1.0-${PN} \
> > > +    lib${PN} \
> > > +    lib${PN}-modules \
> > > +"
> > > +
> > > +RDEPENDS_lib${PN} +=3D "lib${PN}-modules ${PN}-spa-plugins"
> > > +
> > > +FILES_${PN} =3D "\
> > > +    ${sysconfdir}/pipewire/pipewire.conf \
> > > +    ${bindir}/pipewire* \
> > > +    ${systemd_user_unitdir}/* \
> > > +"
> > > +FILES_lib${PN} =3D "\
> > > +    ${libdir}/libpipewire-*.so.* \
> > > +"
> > > +FILES_lib${PN}-modules =3D "\
> > > +    ${libdir}/pipewire-*/* \
> > > +"
> > > +FILES_${PN}-spa-plugins =3D "\
> > > +    ${bindir}/spa-* \
> > > +    ${libdir}/spa/* \
> > > +"
> > > +FILES_${PN}-alsa =3D "\
> > > +    ${libdir}/alsa-lib/* \
> > > +    ${datadir}/alsa/alsa.conf.d/50-pipewire.conf \
> > > +"
> > > +FILES_gstreamer1.0-${PN} =3D "\
> > > +    ${libdir}/gstreamer-1.0/* \
> > > +"
> > > +
> > > +CONFFILES_${PN} =3D "\
> > > +    ${sysconfdir}/pipewire/pipewire.conf \
> > > +"
> > > diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/me=
ta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > > index bcb3015f8..95da2df09 100644
> > > --- a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > > +++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > > @@ -2,14 +2,14 @@ SUMMARY =3D "Multimedia processing server for Linux=
"
> > >  AUTHOR =3D "Wim Taymans <wtaymans@redhat.com>"
> > >  HOMEPAGE =3D "https://pipewire.org"
> > >  SECTION =3D "multimedia"
> > > -LICENSE =3D "LGPL-2.1"
> > > +LICENSE =3D "MIT"
> > >  LIC_FILES_CHKSUM =3D " \
> > > -    file://LICENSE;md5=3Dd8153c6e65986f862a0550ca74a3ed73 \
> > > -    file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> > > +    file://LICENSE;md5=3De2c0b7d86d04e716a3c4c9ab34260e69 \
> > > +    file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \
> > >  "
> > >  DEPENDS =3D "alsa-lib dbus udev"
> > > -SRCREV =3D "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
> > > -PV =3D "0.2.7"
> > > +SRCREV =3D "74a1632f0720886d5b3b6c23ee8fcd6c03ca7aac"
> > > +PV =3D "0.3.1"
> > >
> > >  SRC_URI =3D "git://github.com/PipeWire/pipewire"
> > >
> > > @@ -18,13 +18,20 @@ S =3D "${WORKDIR}/git"
> > >  inherit meson pkgconfig systemd manpages
> > >
> > >  PACKAGECONFIG ??=3D "\
> > > -    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > > -    gstreamer \
> > > +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', ''=
, d)} \
> > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio systemd vulkan=
', d)} \
> >
> > Perhaps add vulkan as packageconfig too here. I am seeing
> >
> > WARNING: pipewire-0.3.1-r0 do_configure: QA Issue: pipewire: invalid
> > PACKAGECONFIG: vulkan [invalid-packageconfig]
>
> As you can see I played around with vulkan PACKAGECONFIG but forgot to
> remove it's usage. The reasons I decided to disable it by default are
>
> * I am not sure what to (r)depend it needs - there is no
> virtual/vulkan. Is it vulkan-loader as gstreamer1.0-plugins-bad does?
> * Have no machine to test
> * Would take me huge amount of build time - and for me it is just an
> optional dependency for mutter (that I never used yet)
>
> So what do you prefer:
>
> * keep disabled (as soon as sombody wants vulkan here he/she/it can take =
care)
> * add untested PACKAGECONFIG (with vulkan-loader in DEPENDS field?)
>
> Cheers
>
> Andreas

