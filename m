Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2A3C4707B
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 20:10:57 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.2669.1705003854619200987
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 12:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KnNJr3Yl;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2046c724383so1836339fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 12:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705003854; x=1705608654; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ioGsIRT1OpKi4NVO1o/vXSKo6oJBxG3yj7JjfmmDEY=;
        b=KnNJr3YlZe1a6841fa8F5GqovoTA376MQOj0CsTKi3rk5JoE7g8TIe9KyC13Ievbfa
         oXnjAGPHm+X4hQPNig7E1izse+hU42Co2WW8qzp9+BSKtqqQyxY1pWyhKwpNUB+PbANg
         r8xePQ/vqoQmLCkLSMOAlL1Xf3Gqpz2P067Osebveey/JPt45Q/QZwCATuaa8kHo5mvs
         w1D8CqQ5HgUP6pX3E6DNe6v+AKQR7muNPlJdJtBcKKZtTVeBuASKUV/SQvczqAVA1ueu
         mWh5F0kU3Zx5CE5tiJnkrJW/odZOXlqeJxjZ/cQ1z/Rn8ZG65e30NeI2uMLpTO8b6nSJ
         pjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705003854; x=1705608654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ioGsIRT1OpKi4NVO1o/vXSKo6oJBxG3yj7JjfmmDEY=;
        b=Ti2WV8mruH758Ijt3/hb4NxFbEjThYwNnbkac3qW4AKin35C5NMzxcffR3WESdFp/n
         /6S/SDqj2UAQpSMQuR0wvRcc/dD2TwGgNPYFj47Q0ZTSw7dpWe0Ao1z4RQJ+hOeP6Vgy
         Fh68wvKK4pHd+e6J7XpZLILVmY3zGdsrNQbUkr09Hvcw1NzDGwFAo5LbutV64qZfoI72
         TQrwcTMWam+wzN8CMwh8CHUDoNt/DA+gHK4vGanIwV9DNmG74LB1mHwkK/vthVjEpPEJ
         a5fxanz4Ys6nqmp1/EkbM/dXFgb8tcH2mI0pqwHyo0wsNWsCWZqBGK2qSJiIud/zUhA3
         FSvg==
X-Gm-Message-State: AOJu0YybOkECvBCtkoD0qX9byn+vkrfVeQmAb6pnuQujew+105svvQUN
	Bh7HxnlA09Ke/PQRQONi1A1/CUKVgp9kGi5wPQU=
X-Google-Smtp-Source: AGHT+IFjkGjg7chnUIEPVujZEwn7pFGRUt76o4DoDBHd6aBtl2iR0Z7hvTtPoKUaq9gZxqi2+Vba+eHR908IbLIQhqQ=
X-Received: by 2002:a05:6870:4c15:b0:204:177d:bd32 with SMTP id
 pk21-20020a0568704c1500b00204177dbd32mr255841oab.38.1705003853527; Thu, 11
 Jan 2024 12:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20240111040734.112703-1-festevam@gmail.com> <CAMKF1sp=0T4Ow_F=DwOL7BxZU=j8D4z2eaP9qXa44kwOo9Ha1A@mail.gmail.com>
In-Reply-To: <CAMKF1sp=0T4Ow_F=DwOL7BxZU=j8D4z2eaP9qXa44kwOo9Ha1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jan 2024 12:10:27 -0800
Message-ID: <CAMKF1somcAJpnMW9822wNy0M2a3Yd5SFCgeouSVUg_0HW0HdFA@mail.gmail.com>
Subject: Re: [oe] [PATCH] v4l-utils: Update to 1.26.1
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 20:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108229

I meant to say without systemd ( using sysvinit )

On Thu, Jan 11, 2024 at 12:09=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> fails with systemd
>
> https://errors.yoctoproject.org/Errors/Details/749633/
>
> On Wed, Jan 10, 2024 at 8:07=E2=80=AFPM Fabio Estevam <festevam@gmail.com=
> wrote:
> >
> > From: Fabio Estevam <festevam@denx.de>
> >
> > Update to 1.26.1.
> >
> > Also remove the Makefile.am patches as they no longer apply due to
> > the swith to Meson.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> >  ...-Don-t-install-libmediactl-and-libv4.patch | 46 -------------------
> >  ...02-original-patch-mediactl-pkgconfig.patch | 23 ----------
> >  ...iginal-patch-export-mediactl-headers.patch | 26 -----------
> >  ...4l-utils_1.24.1.bb =3D> v4l-utils_1.26.1.bb} | 29 +++++-------
> >  4 files changed, 11 insertions(+), 113 deletions(-)
> >  delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-=
Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
> >  delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-=
original-patch-mediactl-pkgconfig.patch
> >  delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-=
original-patch-export-mediactl-headers.patch
> >  rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.24.1.bb =3D> v=
4l-utils_1.26.1.bb} (75%)
> >
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-=
media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-oe/recipes-multi=
media/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-an=
d-libv4.patch
> > deleted file mode 100644
> > index 52f0cd3388a6..000000000000
> > --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-c=
tl-Don-t-install-libmediactl-and-libv4.patch
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -From 0d5c0e9a75eca43667b0e29155b635e50622b66a Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Fri, 27 Feb 2015 21:55:36 +0000
> > -Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
> > -
> > - libv4l2subdev"
> > -
> > -This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > -Conflicts:
> > -       utils/media-ctl/Makefile.am
> > -
> > ----
> > -Upstream-Status: Pending
> > -
> > - utils/media-ctl/Makefile.am | 10 +++-------
> > - 1 file changed, 3 insertions(+), 7 deletions(-)
> > -
> > -diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
> > -index c48c8d6..e255e16 100644
> > ---- a/utils/media-ctl/Makefile.am
> > -+++ b/utils/media-ctl/Makefile.am
> > -@@ -1,8 +1,7 @@
> > --noinst_LTLIBRARIES =3D libmediactl.la libv4l2subdev.la
> > --
> > -+lib_LTLIBRARIES =3D libmediactl.la libv4l2subdev.la
> > - libmediactl_la_SOURCES =3D libmediactl.c mediactl-priv.h
> > --libmediactl_la_CFLAGS =3D -static $(LIBUDEV_CFLAGS)
> > --libmediactl_la_LDFLAGS =3D -static $(LIBUDEV_LIBS)
> > -+libmediactl_la_CFLAGS =3D $(LIBUDEV_CFLAGS)
> > -+libmediactl_la_LDFLAGS =3D $(LIBUDEV_LIBS)
> > -
> > - media-bus-format-names.h: ../../include/linux/media-bus-format.h
> > -       $(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /F=
IXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
> > -@@ -18,9 +17,6 @@ CLEANFILES =3D $(BUILT_SOURCES)
> > - nodist_libv4l2subdev_la_SOURCES =3D $(BUILT_SOURCES)
> > - libv4l2subdev_la_SOURCES =3D libv4l2subdev.c
> > - libv4l2subdev_la_LIBADD =3D libmediactl.la
> > --libv4l2subdev_la_CFLAGS =3D -static
> > --libv4l2subdev_la_LDFLAGS =3D -static
> > --
> > - mediactl_includedir=3D$(includedir)/mediactl
> > - noinst_HEADERS =3D mediactl.h v4l2subdev.h
> > -
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-origina=
l-patch-mediactl-pkgconfig.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-=
utils/0002-original-patch-mediactl-pkgconfig.patch
> > deleted file mode 100644
> > index d52475974f0a..000000000000
> > --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch=
-mediactl-pkgconfig.patch
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -From 320b8378ee30eb5e0fe83a8b397f822f2f88a4c1 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sun, 1 Mar 2015 22:25:07 +0000
> > -Subject: [PATCH] %% original patch: mediactl-pkgconfig.patch
> > -
> > ----
> > -Upstream-Status: Pending
> > -
> > - utils/media-ctl/Makefile.am | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
> > -index e255e16..ff7b417 100644
> > ---- a/utils/media-ctl/Makefile.am
> > -+++ b/utils/media-ctl/Makefile.am
> > -@@ -20,6 +20,7 @@ libv4l2subdev_la_LIBADD =3D libmediactl.la
> > - mediactl_includedir=3D$(includedir)/mediactl
> > - noinst_HEADERS =3D mediactl.h v4l2subdev.h
> > -
> > -+pkgconfig_DATA =3D libmediactl.pc
> > - bin_PROGRAMS =3D media-ctl
> > - media_ctl_SOURCES =3D media-ctl.c options.c options.h tools.h
> > - media_ctl_LDADD =3D libmediactl.la libv4l2subdev.la
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-origina=
l-patch-export-mediactl-headers.patch b/meta-oe/recipes-multimedia/v4l2apps=
/v4l-utils/0003-original-patch-export-mediactl-headers.patch
> > deleted file mode 100644
> > index f6fcee92eab1..000000000000
> > --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch=
-export-mediactl-headers.patch
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -From f7109d6b2fcb291824d795071c04a492d9fbc45b Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sun, 1 Mar 2015 22:25:07 +0000
> > -Subject: [PATCH] %% original patch: export-mediactl-headers.patch
> > -
> > ----
> > -Upstream-Status: Pending
> > -
> > - utils/media-ctl/Makefile.am | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
> > -index ff7b417..6ce656f 100644
> > ---- a/utils/media-ctl/Makefile.am
> > -+++ b/utils/media-ctl/Makefile.am
> > -@@ -17,8 +17,8 @@ CLEANFILES =3D $(BUILT_SOURCES)
> > - nodist_libv4l2subdev_la_SOURCES =3D $(BUILT_SOURCES)
> > - libv4l2subdev_la_SOURCES =3D libv4l2subdev.c
> > - libv4l2subdev_la_LIBADD =3D libmediactl.la
> > --mediactl_includedir=3D$(includedir)/mediactl
> > --noinst_HEADERS =3D mediactl.h v4l2subdev.h
> > -+otherincludedir =3D $(includedir)/mediactl
> > -+otherinclude_HEADERS =3D mediactl.h v4l2subdev.h
> > -
> > - pkgconfig_DATA =3D libmediactl.pc
> > - bin_PROGRAMS =3D media-ctl
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb b/=
meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > similarity index 75%
> > rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
> > rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > index f314d9b6aed5..a801368c1082 100644
> > --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
> > +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > @@ -18,34 +18,27 @@ LDFLAGS:append =3D " -pthread"
> >  # Needs further investigation
> >  GLIBC_64BIT_TIME_FLAGS =3D ""
> >
> > -inherit autotools gettext pkgconfig
> > +PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[qv4l2] =3D ",-Dqv4l2=3Ddisabled"
> > +PACKAGECONFIG[qvidcap] =3D ",-Dqvidcap=3Ddisabled"
> > +PACKAGECONFIG[v4l2-tracer] =3D ",-Dv4l2-tracer=3Ddisabled,json-c"
> >
> > -PACKAGECONFIG ??=3D "media-ctl"
> > -PACKAGECONFIG[media-ctl] =3D "--enable-v4l-utils,--disable-v4l-utils,,=
"
> > -PACKAGECONFIG[qv4l2] =3D ",--disable-qv4l2"
> > -PACKAGECONFIG[qvidcap] =3D ",--disable-qvidcap"
> > -PACKAGECONFIG[v4l2-tracer] =3D ",--disable-v4l2-tracer,json-c"
> > +inherit meson gettext pkgconfig
> >
> >  SRC_URI =3D "\
> > -    git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstab=
le-1.24 \
> > -    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.p=
atch \
> > -    file://0002-original-patch-mediactl-pkgconfig.patch \
> > -    file://0003-original-patch-export-mediactl-headers.patch \
> > +    git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstab=
le-1.26 \
> >      file://0004-Do-not-use-getsubopt.patch \
> >  "
> >
> > -SRCREV =3D "8799081b143627c9c09dea0c60ad3d1cc17cc848"
> > +SRCREV =3D "5fa4eb45ee2fd447c102b35da61c0b8920398b20"
> >
> >  PV .=3D "+git${SRCPV}"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -do_configure:prepend() {
> > -    cd ${S}; ./bootstrap.sh; cd -
> > -}
> > -
> > -EXTRA_OECONF =3D "--enable-shared --with-udevdir=3D${base_libdir}/udev=
 \
> > -                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
> > +# Disable the erroneous installation of gconv-modules that would break=
 glib
> > +# like it is done in Debian and ArchLinux.
> > +EXTRA_OEMESON =3D "-Dgconv=3Ddisabled"
> >
> >  VIRTUAL-RUNTIME_ir-keytable-keymaps ?=3D "rc-keymaps"
> >
> > @@ -72,7 +65,7 @@ RDEPENDS:qv4l2 +=3D "\
> >  RDEPENDS:qvidcap +=3D "\
> >      ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}=
"
> >
> > -FILES:rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
> > +FILES:rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc* ${syst=
emd_unitdir}/system/*"
> >
> >  FILES:${PN} =3D "${bindir} ${sbindir}"
> >
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108221): https://lists.openembedded.org/g/openembed=
ded-devel/message/108221
> > Mute This Topic: https://lists.openembedded.org/mt/103656727/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

