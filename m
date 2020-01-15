Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7637F7B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 21:33:46 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id n8so8091926qvg.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 13:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2G5D/k1cWwUPx+ZzCsu005Cp5J2KR47Qr3RUhrUpRs0=;
	b=EaDNz6ltkxB532FUnPFRgxtACIeJP4cPothBqdPENEkeZfDe/EZPCOvjYOsgqOpJXz
	/Bay9qCf/5b7iluja/eGZE25WTyiXRp4/t3Xly5Zbwk5sIiM0+ltISp9jmaNrFeaZsus
	eLwSE1AoErxtOqWYMcmdNlrpXdpLMRUQAIzqi6nKCi/zRIx1AcpY/2a4HqgDcgVpAgvD
	seXRFX3JKvl2FxBRF9YB83NE9SNeHhtydVszzxM3yiulpBx5GKKsCjNSUk2JiZhz0KRm
	93QwYpkdiE+3O0OTTzBumfmnAS9ezMfyfSqDX74Mf/kNQC7Z9Cv8q7eIkinYOyZSknbe
	joiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2G5D/k1cWwUPx+ZzCsu005Cp5J2KR47Qr3RUhrUpRs0=;
	b=siBzrayZdxioUbRRUDdjcWlhoraLaIKPfAgXoZo0XQOcKdtdwM8ZC2stBCUfQGYTLE
	K36RRE6HQ2DGkh4LQHcQisiPkIx8D5E6iKU3R5GX47qniSDhcHz6oBK2QnXEOGGvMCnQ
	onmVGTiHZPuSCnRuB5zzHx2T7YMKqHA2RHuBVVUcoVHwlyBcLudUAdi6XknODCQLu9Ea
	FpSvUwBw3qiQT1xzCp4v9veLrWpJxf3x4xB+GyExYFpd37iBYj5ShEHd82aWVf/1NdO8
	aIXSwsbNNHVoZ7bribDWSHhWa4k+NrOPHHFvRgVJwID3vUbEwkg5quTunBPmPJ7dHbXD
	swKw==
X-Gm-Message-State: APjAAAX40UAWYstUZrasI+fkt7RCvA6uKUu3+CYM/r+MmtQ3SE0lXjEf
	/q4ylHKT+s0tiIsqQLYl67D+Bkm2lP1ZOw7LHdg=
X-Google-Smtp-Source: APXvYqwwr1W0J0TSB3d5fAKVdcsuH4L+0SHBTYmsoCbmCsqBjSUS9WZNxlFKmHXwZs7opu32eeh8XopR5kV8EqKMfOE=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr24501390qvy.185.1579124026634;
	Wed, 15 Jan 2020 13:33:46 -0800 (PST)
MIME-Version: 1.0
References: <CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
	<20200113190102.22584-1-Martin.Jansa@gmail.com>
	<673df57a-3aa3-6c7b-eafc-6e17d491baf1@gmail.com>
	<CANNYZj8Ty0Ref3T54KhTtmRP=bSzcLw7ghDSea6WD18f9nUCCA@mail.gmail.com>
	<CAMKF1soSUHvUukvffZ3eyQ+Eo9hOOqBz95XfT3bs7TvWsNPiXg@mail.gmail.com>
	<CANNYZj9zO1bMEOGYFOK6cOYLkTTQk0sXkdbBxPCoy2N3GXm0ig@mail.gmail.com>
	<CAMKF1soRY14wruD-CXkTHb0i91UrWJ76LtHpScL-nuT+Mg5v6Q@mail.gmail.com>
In-Reply-To: <CAMKF1soRY14wruD-CXkTHb0i91UrWJ76LtHpScL-nuT+Mg5v6Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jan 2020 13:33:20 -0800
Message-ID: <CAMKF1srfss6Qfw9+G6cGB1mLeWQQvY5-YLx5vip-SsrpYtqjrA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCHv2 1/2] sysprof: add a recipe from oe-core
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
X-List-Received-Date: Wed, 15 Jan 2020 21:33:46 -0000
Content-Type: text/plain; charset="UTF-8"

with distros with systemd I am seeing this error

ERROR: sysprof-3.34.1-r0 do_package: SYSTEMD_SERVICE_sysprof value
sysprof2.service does not exist


On Wed, Jan 15, 2020 at 7:33 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Jan 15, 2020 at 7:02 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I have to draw the line here: fixing issues with a non-standard compiler is on you.
> >
>
> I wondered why gcc can not find it, perhaps -Wshadow is not enabled,
> it's fine I do not expect either. It was merely for future reference
> if someone stumbles on this issue
>
> > Alex
> >
> > On Wed, 15 Jan 2020 at 15:37, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> there is another failure seen with clang
> >>
> >> http://errors.yoctoproject.org/Errors/Details/306619/
> >>
> >> variable environ should perhaps be renamed to avoid clash with system
> >> headers definition
> >>
> >> On Tue, Jan 14, 2020 at 4:01 AM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Thanks, I've just sent a patch for this.
> >> >
> >> > Alex
> >> >
> >> > On Tue, 14 Jan 2020 at 01:37, Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >> On 1/13/20 11:01 AM, Martin Jansa wrote:
> >> >> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> >> >
> >> >> > Latest version (3.34) of sysprof have a hard dependency on polkit,
> >> >> > which in turn requires mozjs, which pulls in a number of other
> >> >> > meta-oe packages including python2. This makes it difficult
> >> >> > to keep sysprof in oe-core, so for the time being it is moved to
> >> >> > meta-oe.
> >> >>
> >> >>
> >> >> it fails to build for arm
> >> >> https://errors.yoctoproject.org/Errors/Details/306463/
> >> >> https://errors.yoctoproject.org/Errors/Details/306361/
> >> >>
> >> >> >
> >> >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> >> > ---
> >> >> >   ...thing-in-help-as-it-requires-itstool.patch | 27 ++++++++++++++++
> >> >> >   .../files/define-NT_GNU_BUILD_ID.patch        | 22 +++++++++++++
> >> >> >   .../recipes-kernel/sysprof/sysprof_3.32.0.bb  | 32 +++++++++++++++++++
> >> >> >   3 files changed, 81 insertions(+)
> >> >> >   create mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> >> >> >   create mode 100644 meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> >> >> >   create mode 100644 meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> >> >> >
> >> >> > diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> >> >> > new file mode 100644
> >> >> > index 0000000000..ade51cf864
> >> >> > --- /dev/null
> >> >> > +++ b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> >> >> > @@ -0,0 +1,27 @@
> >> >> > +From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
> >> >> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> >> > +Date: Wed, 23 Aug 2017 18:38:26 +0300
> >> >> > +Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
> >> >> > +
> >> >> > +Upstream-Status: Inappropriate [oe-core specific]
> >> >> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> >> > +
> >> >> > +---
> >> >> > + meson.build | 1 -
> >> >> > + 1 file changed, 1 deletion(-)
> >> >> > +
> >> >> > +diff --git a/meson.build b/meson.build
> >> >> > +index 3986273..ae2f65e 100644
> >> >> > +--- a/meson.build
> >> >> > ++++ b/meson.build
> >> >> > +@@ -164,7 +164,6 @@ subdir('tools')
> >> >> > + subdir('tests')
> >> >> > +
> >> >> > + subdir('data')
> >> >> > +-subdir('help')
> >> >> > + subdir('po')
> >> >> > +
> >> >> > + meson.add_install_script('build-aux/meson/post_install.sh')
> >> >> > +--
> >> >> > +2.7.4
> >> >> > +
> >> >> > diff --git a/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> >> >> > new file mode 100644
> >> >> > index 0000000000..f75ddad43a
> >> >> > --- /dev/null
> >> >> > +++ b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> >> >> > @@ -0,0 +1,22 @@
> >> >> > +On uclibc elf.h does not have GNU extentions but we need this define
> >> >> > +so we define it locally if its not getting it from elf.h
> >> >> > +
> >> >> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> > +
> >> >> > +Upstream-Status: Pending
> >> >> > +
> >> >> > +Index: git/elfparser.h
> >> >> > +===================================================================
> >> >> > +--- git.orig/lib/util/elfparser.h    2011-07-16 18:57:41.000000000 -0700
> >> >> > ++++ git/lib/util/elfparser.h 2011-07-16 20:28:54.733829895 -0700
> >> >> > +@@ -17,6 +17,10 @@
> >> >> > +  */
> >> >> > + #include <glib.h>
> >> >> > +
> >> >> > ++#ifndef NT_GNU_BUILD_ID
> >> >> > ++#define NT_GNU_BUILD_ID 3
> >> >> > ++#endif
> >> >> > ++
> >> >> > + typedef struct ElfSym ElfSym;
> >> >> > + typedef struct ElfParser ElfParser;
> >> >> > +
> >> >> > diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> >> >> > new file mode 100644
> >> >> > index 0000000000..b92933806c
> >> >> > --- /dev/null
> >> >> > +++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> >> >> > @@ -0,0 +1,32 @@
> >> >> > +SUMMARY = "System-wide Performance Profiler for Linux"
> >> >> > +HOMEPAGE = "http://www.sysprof.com"
> >> >> > +LICENSE = "GPLv3+"
> >> >> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> >> >> > +                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
> >> >> > +
> >> >> > +GNOMEBASEBUILDCLASS = "meson"
> >> >> > +inherit gnomebase gettext systemd upstream-version-is-even gsettings
> >> >> > +
> >> >> > +DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
> >> >> > +
> >> >> > +SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
> >> >> > +SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
> >> >> > +SRC_URI += " \
> >> >> > +           file://define-NT_GNU_BUILD_ID.patch \
> >> >> > +           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
> >> >> > +           "
> >> >> > +
> >> >> > +PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
> >> >> > +PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
> >> >> > +PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
> >> >> > +
> >> >> > +SOLIBS = ".so"
> >> >> > +FILES_SOLIBSDEV = ""
> >> >> > +
> >> >> > +SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
> >> >> > +
> >> >> > +FILES_${PN} += " \
> >> >> > +               ${datadir}/dbus-1/system-services \
> >> >> > +               ${datadir}/dbus-1/system.d \
> >> >> > +               ${datadir}/metainfo \
> >> >> > +               "
> >> >> >
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-devel mailing list
> >> >> Openembedded-devel@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

