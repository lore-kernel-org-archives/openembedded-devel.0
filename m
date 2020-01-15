Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id A85867F9C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 14:37:57 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id k6so15810466qki.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 06:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l4iX9iPt/Q6k5KmJt8MRy1K1U4kjoh1qX1GQj2QZWqk=;
	b=bOPXvo3L/W6Txfj5GnHc9DAqwKMGf1gNTESI/Q91VZ2gLvuzxneAUt7YXrZC8FMj3+
	735UWD8ll15GxQuWXfbVhu4vQcERsdFi+/D1pjEIBD2/RcLEQzMV/ZTlzsSpcoCbUW+d
	hCaUYHPVKt6dQ9CWGTqranMjQKzyghOqsydc8LUFBnzHoZFlQPtSQTi1nbVDN90psOaB
	IXkh9dvLng4tXC0qIqgWWKrANaymArfIJWrLI5HWudmP7LBAShFjnn/ITvOfGdEMnEyp
	J8sjN/839wEilQtZhafzJ74pZGfm5H86kSuPBBGOp3PPh9/W+SJ6YtN/zsJkp8TY9TQj
	vFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l4iX9iPt/Q6k5KmJt8MRy1K1U4kjoh1qX1GQj2QZWqk=;
	b=mT64BUqrME/sqV6sRXi8fw9UwluiSFNbASXAxWpmYJWom/p/ppeHtleLNAizLYspsx
	9cj9LQ2/t1a7HhXsT8GIEV4nOPJbXKiqF00re0eqN11hGIL3l71e9yJmeYaTAY63cuTS
	emFWKzKd4oF/CyCGIE4eeX3bEFO2lI3xfvAJcLSe2L2Pt2hSXFiny+wyo+i8wtSVMjf3
	iMvDcBii1rxwnWgob/wWLraIVFNtp/V23Sj6Zfl00uL9ELi8DTCCkJHthnLFUvnih6uN
	Amq6BnoRn6RbcLXRYLTWNn1AeCxArWf3CJrmQVQanuzTRImSCEpKTjE7GRDz77vQ8aXO
	Iwwg==
X-Gm-Message-State: APjAAAX/V/GpUusl3UD2os/R5SX5XID+Tu6nECsrs6RDNxJD1XxWdcUS
	Jax3Fz+mZReuHyxnI9ZAQJ6KIqOdbSKD0MlBrk0=
X-Google-Smtp-Source: APXvYqyEUivb4hnSHDfqVp+dS78J88HFFtL7inIvKSpwKT11qQ5rBWIs81z9S4c6UGc2p2pOKYRxNPWDW8/dhJYHu7Q=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr22342485qkg.71.1579099078087; 
	Wed, 15 Jan 2020 06:37:58 -0800 (PST)
MIME-Version: 1.0
References: <CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
	<20200113190102.22584-1-Martin.Jansa@gmail.com>
	<673df57a-3aa3-6c7b-eafc-6e17d491baf1@gmail.com>
	<CANNYZj8Ty0Ref3T54KhTtmRP=bSzcLw7ghDSea6WD18f9nUCCA@mail.gmail.com>
In-Reply-To: <CANNYZj8Ty0Ref3T54KhTtmRP=bSzcLw7ghDSea6WD18f9nUCCA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jan 2020 06:37:31 -0800
Message-ID: <CAMKF1soSUHvUukvffZ3eyQ+Eo9hOOqBz95XfT3bs7TvWsNPiXg@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Jan 2020 14:37:57 -0000
Content-Type: text/plain; charset="UTF-8"

there is another failure seen with clang

http://errors.yoctoproject.org/Errors/Details/306619/

variable environ should perhaps be renamed to avoid clash with system
headers definition

On Tue, Jan 14, 2020 at 4:01 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Thanks, I've just sent a patch for this.
>
> Alex
>
> On Tue, 14 Jan 2020 at 01:37, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On 1/13/20 11:01 AM, Martin Jansa wrote:
>> > From: Alexander Kanavin <alex.kanavin@gmail.com>
>> >
>> > Latest version (3.34) of sysprof have a hard dependency on polkit,
>> > which in turn requires mozjs, which pulls in a number of other
>> > meta-oe packages including python2. This makes it difficult
>> > to keep sysprof in oe-core, so for the time being it is moved to
>> > meta-oe.
>>
>>
>> it fails to build for arm
>> https://errors.yoctoproject.org/Errors/Details/306463/
>> https://errors.yoctoproject.org/Errors/Details/306361/
>>
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >   ...thing-in-help-as-it-requires-itstool.patch | 27 ++++++++++++++++
>> >   .../files/define-NT_GNU_BUILD_ID.patch        | 22 +++++++++++++
>> >   .../recipes-kernel/sysprof/sysprof_3.32.0.bb  | 32 +++++++++++++++++++
>> >   3 files changed, 81 insertions(+)
>> >   create mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
>> >   create mode 100644 meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
>> >   create mode 100644 meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
>> >
>> > diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
>> > new file mode 100644
>> > index 0000000000..ade51cf864
>> > --- /dev/null
>> > +++ b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
>> > @@ -0,0 +1,27 @@
>> > +From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
>> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
>> > +Date: Wed, 23 Aug 2017 18:38:26 +0300
>> > +Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
>> > +
>> > +Upstream-Status: Inappropriate [oe-core specific]
>> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > +
>> > +---
>> > + meson.build | 1 -
>> > + 1 file changed, 1 deletion(-)
>> > +
>> > +diff --git a/meson.build b/meson.build
>> > +index 3986273..ae2f65e 100644
>> > +--- a/meson.build
>> > ++++ b/meson.build
>> > +@@ -164,7 +164,6 @@ subdir('tools')
>> > + subdir('tests')
>> > +
>> > + subdir('data')
>> > +-subdir('help')
>> > + subdir('po')
>> > +
>> > + meson.add_install_script('build-aux/meson/post_install.sh')
>> > +--
>> > +2.7.4
>> > +
>> > diff --git a/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
>> > new file mode 100644
>> > index 0000000000..f75ddad43a
>> > --- /dev/null
>> > +++ b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
>> > @@ -0,0 +1,22 @@
>> > +On uclibc elf.h does not have GNU extentions but we need this define
>> > +so we define it locally if its not getting it from elf.h
>> > +
>> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > +
>> > +Upstream-Status: Pending
>> > +
>> > +Index: git/elfparser.h
>> > +===================================================================
>> > +--- git.orig/lib/util/elfparser.h    2011-07-16 18:57:41.000000000 -0700
>> > ++++ git/lib/util/elfparser.h 2011-07-16 20:28:54.733829895 -0700
>> > +@@ -17,6 +17,10 @@
>> > +  */
>> > + #include <glib.h>
>> > +
>> > ++#ifndef NT_GNU_BUILD_ID
>> > ++#define NT_GNU_BUILD_ID 3
>> > ++#endif
>> > ++
>> > + typedef struct ElfSym ElfSym;
>> > + typedef struct ElfParser ElfParser;
>> > +
>> > diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
>> > new file mode 100644
>> > index 0000000000..b92933806c
>> > --- /dev/null
>> > +++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
>> > @@ -0,0 +1,32 @@
>> > +SUMMARY = "System-wide Performance Profiler for Linux"
>> > +HOMEPAGE = "http://www.sysprof.com"
>> > +LICENSE = "GPLv3+"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>> > +                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
>> > +
>> > +GNOMEBASEBUILDCLASS = "meson"
>> > +inherit gnomebase gettext systemd upstream-version-is-even gsettings
>> > +
>> > +DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
>> > +
>> > +SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
>> > +SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
>> > +SRC_URI += " \
>> > +           file://define-NT_GNU_BUILD_ID.patch \
>> > +           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
>> > +           "
>> > +
>> > +PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
>> > +PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
>> > +PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
>> > +
>> > +SOLIBS = ".so"
>> > +FILES_SOLIBSDEV = ""
>> > +
>> > +SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
>> > +
>> > +FILES_${PN} += " \
>> > +               ${datadir}/dbus-1/system-services \
>> > +               ${datadir}/dbus-1/system.d \
>> > +               ${datadir}/metainfo \
>> > +               "
>> >
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

