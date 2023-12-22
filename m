Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194CFC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 14:10:26 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.23583.1703254225389147662
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 06:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BOMgDmRf;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33697e6fc4aso408123f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 06:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703254224; x=1703859024; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gc1NLwUXfjpfs02v5X40w2Yny4Ao3TeLgN7Z7IoPzMs=;
        b=BOMgDmRfJH8TUn1KjJEIrTkS6N+UAZcCylNgL6GnwAEOh60ik+UMGzTQcrgilmEzOV
         YEmN3JrQBb69FH1nKIDHRRXbSVzJwivlQNJg5xBt9cm4zxib4XfkjiLWxXmfLGiRXALM
         XCrDzNQvMjRHPx8CsR7U9iXLMnR6OiGklOSCELHhyUKRO/XFb3SYlVPjmVh95KihEy8z
         8Zz3SM8R0dmEaOtmxtn/zwhoOH7sVh1OJ+ArF4HxzFIBczm9bbM5CAUyfeH4OURB/X4A
         xMb12L+5dAbujpnQiEnmv1Tbv9unVgN5/OknBhKyvJ1M+0lO/t5lVen/rv75oXY271Hk
         kG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703254224; x=1703859024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gc1NLwUXfjpfs02v5X40w2Yny4Ao3TeLgN7Z7IoPzMs=;
        b=kjAqbH/W60taTapU/RzGuRvgZ5L+jNM65MjKSqGcc8yv1SX8S4VOvsuGXAtV16qQdn
         zW4sOCcprvUxeLlRGvNfkjhmlMy/mkPphQ/F6mccKvTvuJjt7XRaIsMljWWCS9C7z1xI
         9d8gc9Gs4Ap/vTgXfSRwRdUO3DIGFXCTbCcxA3mrRm9+35ZRo23/vhAtdn6Jj5TyZC1L
         jF5cPQX5firuR6HcEUF8sqE6sPEzsl4v7EnCSGuTnihQIy1p6Vjc4LnHlbDqlrsa4q63
         18XH0zklKzINGIf3J0cqV4EwzeWjRDmrSPU6MP/rv/LQFY4KouhE3X5lYzX8g+ZFTIXB
         2IIg==
X-Gm-Message-State: AOJu0YxwPxZGaV/6Fry+CZEj7wzLE+8tb8a8S4rMia6ruIgzbKqVlPHL
	6qUPUrUqKqSxy4QlHFKJsPwnO7FjCoPrr4eU6nkZlqpSPLA=
X-Google-Smtp-Source: AGHT+IHAvQfHH98fO6S4ETsOdHQ53zDkFHq/u79i9nnev7eKkj0jB6mLz8dnuU+vEpdIfe+8kkHCUcfNVcjMJZ7mPjE=
X-Received: by 2002:a05:6000:1f16:b0:336:9952:f258 with SMTP id
 bv22-20020a0560001f1600b003369952f258mr274694wrb.94.1703254223699; Fri, 22
 Dec 2023 06:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20231220062530.21888-1-alperyasinak1@gmail.com>
 <17A2D7603CB3C41A.24485@lists.openembedded.org> <CA+chaQeFh+4gYgjvc62Z5O61Y3xWv859G7BGf_-0UU60EjrGvA@mail.gmail.com>
 <CAGpma=57tR6-Fh63iBkiP_p-sMzaYDc_ciH7KPH+Z13BUnCMAw@mail.gmail.com>
In-Reply-To: <CAGpma=57tR6-Fh63iBkiP_p-sMzaYDc_ciH7KPH+Z13BUnCMAw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Dec 2023 15:10:11 +0100
Message-ID: <CA+chaQfTrDCwjxQ2jiSGw-O0+vT+ce8AgJSuaNf7WhhXjuVW9g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wavpack: upgrade 5.1.0 -> 5.6.0
To: alper ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f74188060d19c629"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 14:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107751

--000000000000f74188060d19c629
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for v2, I've sent additional fix for shared libraries, but there are
still some probably unexpected side-effects from using CMake and dropping
lib_package inherit (${PN}-bin removal) as buildhistory shows:

diff --git a/packages/cortexa57-oe-linux/wavpack/sysroot
b/packages/cortexa57-oe-linux/wavpack/sysroot
index e772d96dbb5..de2cfdb7b0f 100644
--- a/packages/cortexa57-oe-linux/wavpack/sysroot
+++ b/packages/cortexa57-oe-linux/wavpack/sysroot
@@ -7,10 +7,11 @@ drwxr-xr-x -          -                4096
./usr/include/wavpack
 drwxr-xr-x -          -                4096 ./usr/lib
 drwxr-xr-x -          -                4096 ./usr/lib/cmake
 drwxr-xr-x -          -                4096 ./usr/lib/cmake/WavPack
--rw-r--r-- -          -                4917
./usr/lib/cmake/WavPack/wavpack-config.cmake
--rw-r--r-- -          -                2470
./usr/lib/cmake/WavPack/wavpack-config-noconfig.cmake
+-rw-r--r-- -          -                4678
./usr/lib/cmake/WavPack/wavpack-config.cmake
+-rw-r--r-- -          -                2484
./usr/lib/cmake/WavPack/wavpack-config-noconfig.cmake
 -rw-r--r-- -          -                3675
./usr/lib/cmake/WavPack/wavpack-config-version.cmake
--rw-r--r-- -          -             1006290 ./usr/lib/libwavpack.a
+-rwxr-xr-x -          -              199048 ./usr/lib/libwavpack.so.5.6.0
+lrwxrwxrwx -          -                  19 ./usr/lib/libwavpack.so ->
libwavpack.so.5.6.0
 drwxr-xr-x -          -                4096 ./usr/lib/pkgconfig
 -rw-r--r-- -          -                 234 ./usr/lib/pkgconfig/wavpack.pc
 drwxr-xr-x -          -                4096 ./usr/share


diff --git a/packages/cortexa57-oe-linux/wavpack/wavpack/latest
b/packages/cortexa57-oe-linux/wavpack/wavpack/latest
index d1d7db3e993..4e8fd7e2f20 100644
--- a/packages/cortexa57-oe-linux/wavpack/wavpack/latest
+++ b/packages/cortexa57-oe-linux/wavpack/wavpack/latest
@@ -1,10 +1,9 @@
-PV =3D 5.1.0
+PV =3D 5.6.0
 PR =3D r0
-PKG =3D libwavpack1
-PKGR =3D r0.0
-RPROVIDES =3D wavpack (=3D5.1.0)
+PKGR =3D r0.2
+RPROVIDES =3D
 RDEPENDS =3D glibc (>=3D 2.38+git0+1e04dcec49)
 RRECOMMENDS =3D
-PKGSIZE =3D 199171
+PKGSIZE =3D 608176
 FILES =3D /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /etc /c=
om
/var /usr/bin/* /usr/sbin/* /usr/lib/*.so.* /lib/udev /usr/lib/udev
/usr/lib/udev /usr/lib/udev /usr/share/wavpack /usr/lib/wavpack/*
/usr/share/pixmaps /usr/shar
e/applications /usr/share/idl /usr/share/omf /usr/share/sounds
/usr/lib/bonobo/servers
-FILELIST =3D /usr/lib/libwavpack.so.1 /usr/lib/libwavpack.so.1.2.0
+FILELIST =3D /usr/bin/wavpack /usr/bin/wvgain /usr/bin/wvtag
/usr/bin/wvunpack /usr/lib/libwavpack.so.5.6.0

diff --git a/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest
b/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest
deleted file mode 100644
index 3a1b182efce..00000000000
--- a/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest
+++ /dev/null
@@ -1,10 +0,0 @@
-PV =3D 5.1.0
-PR =3D r0
-PKG =3D libwavpack-bin
-PKGR =3D r0.0
-RPROVIDES =3D wavpack-bin (=3D5.1.0)
-RDEPENDS =3D glibc (>=3D 2.38+git0+1e04dcec49) wavpack (>=3D 5.1.0)
-RRECOMMENDS =3D
-PKGSIZE =3D 408992
-FILES =3D /usr/bin/* /usr/sbin/*
-FILELIST =3D /usr/bin/wavpack /usr/bin/wvgain /usr/bin/wvtag
/usr/bin/wvunpack



On Thu, Dec 21, 2023 at 3:11=E2=80=AFPM alper ak <alperyasinak1@gmail.com> =
wrote:

> Added openssl as a depends and sent v2 patch, thank you.
>
> Martin Jansa <martin.jansa@gmail.com>, 21 Ara 2023 Per, 15:30
> tarihinde =C5=9Funu yazd=C4=B1:
> >
> > Adding the dependency on target openssl allows the build to finish OK.
> >
> > On Thu, Dec 21, 2023 at 1:06=E2=80=AFPM Martin Jansa via lists.openembe=
dded.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> Hi,
> >>
> >> it seems to be trying to link with native libcrypto in some builds:
> >>
> >> lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: file
> not recognized: file format not recognized
> >> collect2: error: ld returned 1 exit status
> >>
> >> have you tried to build it e.g. for aarch64 or arm on x86_64 build hos=
t?
> >>
> >> On Wed, Dec 20, 2023 at 7:25=E2=80=AFAM Alper Ak <alperyasinak1@gmail.=
com>
> wrote:
> >>>
> >>> License-Update: Copyright year changes
> >>>
> >>> Changelog:
> >>>
> >>> * added: AIFF file import/export support
> >>> * added: WATCOM compiler and OS/2 support
> >>> * added: cmake support for mingw, builds Cooledit + Winamp plugins
> >>> * added: --force-even-byte-depth option for rounding up bit depths
> >>> * fixed: detect and report PCM files having non-zero padding bits
> >>> * fixed: possible crash when displaying long channel assignments
> >>> * fixed: big-endian-sourced "raw" files gave big-endian "wav"s
> >>> * fixed: numerous minor issues
> >>> * fixed: CVE-2021-44269 (encoding crafted DSD file triggers OOB read
> crash)
> >>> * fixed: very long filenames cause stack-overflow crash in all CLI
> programs
> >>> * fixed: the length stored in WAV headers not always corrected when
> using -i
> >>> * fixed: attempting to encode raw DSD audio from stdin sometimes
> causes crash
> >>> * fixed: DSD to PCM decimation: small clicks between tracks and tiny
> DC offset
> >>> * fixed: length update in library-generated WAV headers on big-endian
> machines
> >>> * fixed: sanitize custom extensions read from WavPack files to be
> alphanumeric
> >>> * added: accepting brace-delimited options in the wavpack executable
> filename
> >>> * added: "--drop" option to Windows executables for multi-file
> "drag-and-drop"
> >>> * added" "--raw-pcm" option to wvunpack executable (does DSD -->
> 24-bit PCM)
> >>> * added: "--no-overwrite" option to wavpack executable (to resume
> sessions)
> >>> * improved: build system clean-up including switch to non-recursive
> "make"
> >>> * fixed: potential security issue CVE-2020-35738
> >>> * fixed: disable A32 asm code when building for Apple silicon
> >>> * fixed: issues with Adobe-style floating-point WAV files
> >>> * added: -vv option to wvunpack to quickly verify using just
> >>>      block checksums (ideal for detecting corrupted files)
> >>> * added: --normalize-floats option to wvunpack for correctly
> >>>      exporting un-normalized floating-point files
> >>> * updated: Visual Studio 2019 for Windows builds
> >>> * dropped: WinXP support in official binaries
> >>> * fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448
> >>>       (no CVEs or vulnerabilities)
> >>> * fixed: trailing garbage characters on imported ID3v2 TXXX tags
> >>> * fixed: various minor undefined behavior and memory access issues
> >>> * fixed: sanitize tag extraction names for length and path inclusion
> >>> * improved: reformat wvunpack "help" and split into long + short
> versions
> >>> * added: regression testing to Travis CI for OSS-Fuzz crashers
> >>> * fixed: potential security issues including the following CVEs:
> >>>      CVE-2018-19840 CVE-2018-19841 CVE-2018-10536
> >>>      CVE-2018-10537 CVE-2018-10538 CVE-2018-10539
> >>>      CVE-2018-10540 CVE-2018-7254  CVE-2018-7253
> >>>      CVE-2018-6767
> >>> * added: support for CMake, Travis CI, and Google's OSS-fuzz
> >>> * fixed: use correction file for encode verify (pipe input, Windows)
> >>> * fixed: correct WAV header with actual length (pipe input, -i option=
)
> >>> * fixed: thumb interworking and not needing v6 architecture (ARM asm)
> >>> * added: handle more ID3v2.3 tag items and from all file types
> >>> * fixed: coredump on Sparc64 (changed MD5 implementation)
> >>> * fixed: handle invalid ID3v2.3 tags from sacd-ripper
> >>> * fixed: several corner-case memory leaks
> >>>
> >>> Signed-off-by: alperak <alperyasinak1@gmail.com>
> >>> ---
> >>>  .../wavpack/{wavpack_5.1.0.bb =3D> wavpack_5.6.0.bb}          | 6
> +++---
> >>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>>  rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.1.0.bb =3D>
> wavpack_5.6.0.bb} (63%)
> >>>
> >>> diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
> b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> >>> similarity index 63%
> >>> rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
> >>> rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> >>> index 909612393..80671896c 100644
> >>> --- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
> >>> +++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> >>> @@ -1,9 +1,9 @@
> >>>  DESCRIPTION =3D "WavPack is a completely open audio compression form=
at
> providing lossless, high-quality lossy, and a unique hybrid compression
> mode."
> >>>  LICENSE =3D "BSD-3-Clause"
> >>> -LIC_FILES_CHKSUM =3D
> "file://license.txt;md5=3D8c1a910e5c2a8b30ec8ffb2ffa63d9b2"
> >>> +LIC_FILES_CHKSUM =3D
> "file://license.txt;md5=3Dbb5d037e3ad41a3c84c9f2d8bb65a7b4"
> >>>
> >>>  SRC_URI =3D "git://
> github.com/dbry/WavPack.git;branch=3Dmaster;protocol=3Dhttps"
> >>> -SRCREV =3D "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
> >>> +SRCREV =3D "e03e8e29dc618e08e7baba9636e57ba1254874ce"
> >>>  S =3D "${WORKDIR}/git"
> >>>
> >>> -inherit autotools lib_package
> >>> +inherit cmake pkgconfig
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >>>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#107708):
> https://lists.openembedded.org/g/openembedded-devel/message/107708
> >> Mute This Topic: https://lists.openembedded.org/mt/103277174/3617156
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [martin.jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000f74188060d19c629
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for v2, I&#39;ve sent additional fix for shared lib=
raries, but there are still some probably unexpected side-effects from usin=
g CMake and dropping lib_package inherit (${PN}-bin removal) as buildhistor=
y shows:<div><br></div><div>diff --git a/packages/cortexa57-oe-linux/wavpac=
k/sysroot b/packages/cortexa57-oe-linux/wavpack/sysroot<br>index e772d96dbb=
5..de2cfdb7b0f 100644<br>--- a/packages/cortexa57-oe-linux/wavpack/sysroot<=
br>+++ b/packages/cortexa57-oe-linux/wavpack/sysroot<br>@@ -7,10 +7,11 @@ d=
rwxr-xr-x - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./usr/include/wavpack<br>=C2=A0drwxr-xr-x =
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A04096 ./usr/lib<br>=C2=A0drwxr-xr-x - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04=
096 ./usr/lib/cmake<br>=C2=A0drwxr-xr-x - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./usr/lib/=
cmake/WavPack<br>--rw-r--r-- - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04917 ./usr/lib/cmake/WavPac=
k/wavpack-config.cmake<br>--rw-r--r-- - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02470 ./usr/lib/cmak=
e/WavPack/wavpack-config-noconfig.cmake<br>+-rw-r--r-- - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04=
678 ./usr/lib/cmake/WavPack/wavpack-config.cmake<br>+-rw-r--r-- - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A02484 ./usr/lib/cmake/WavPack/wavpack-config-noconfig.cmake<br>=C2=
=A0-rw-r--r-- - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03675 ./usr/lib/cmake/WavPack/wavpack-conf=
ig-version.cmake<br>--rw-r--r-- - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1006290 ./usr/lib/libwavpack.a<br>+-=
rwxr-xr-x - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0199048 ./usr/lib/libwavpack.so.5.6.0<br>+lrwxrwxrwx - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A019 ./usr/lib/libwavpack.so -&gt; libwavpack.so.5.6.=
0<br>=C2=A0drwxr-xr-x - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./usr/lib/pkgconfig<br>=C2=A0=
-rw-r--r-- - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 234 ./usr/lib/pkgconfig/wavpack.pc<br>=C2=
=A0drwxr-xr-x - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./usr/share<br></div><div><br></div>=
<div><br></div><div>diff --git a/packages/cortexa57-oe-linux/wavpack/wavpac=
k/latest b/packages/cortexa57-oe-linux/wavpack/wavpack/latest<br>index d1d7=
db3e993..4e8fd7e2f20 100644<br>--- a/packages/cortexa57-oe-linux/wavpack/wa=
vpack/latest<br>+++ b/packages/cortexa57-oe-linux/wavpack/wavpack/latest<br=
>@@ -1,10 +1,9 @@<br>-PV =3D 5.1.0<br>+PV =3D 5.6.0<br>=C2=A0PR =3D r0<br>-=
PKG =3D libwavpack1<br>-PKGR =3D r0.0<br>-RPROVIDES =3D wavpack (=3D5.1.0)<=
br>+PKGR =3D r0.2<br>+RPROVIDES =3D <br>=C2=A0RDEPENDS =3D glibc (&gt;=3D 2=
.38+git0+1e04dcec49)<br>=C2=A0RRECOMMENDS =3D <br>-PKGSIZE =3D 199171<br>+P=
KGSIZE =3D 608176<br>=C2=A0FILES =3D /usr/bin/* /usr/sbin/* /usr/libexec/* =
/usr/lib/lib*.so.* /etc /com /var /usr/bin/* /usr/sbin/* /usr/lib/*.so.* /l=
ib/udev /usr/lib/udev /usr/lib/udev /usr/lib/udev /usr/share/wavpack /usr/l=
ib/wavpack/* /usr/share/pixmaps /usr/shar<br>e/applications /usr/share/idl =
/usr/share/omf /usr/share/sounds /usr/lib/bonobo/servers<br>-FILELIST =3D /=
usr/lib/libwavpack.so.1 /usr/lib/libwavpack.so.1.2.0<br>+FILELIST =3D /usr/=
bin/wavpack /usr/bin/wvgain /usr/bin/wvtag /usr/bin/wvunpack /usr/lib/libwa=
vpack.so.5.6.0</div><div><br></div><div>diff --git a/packages/cortexa57-oe-=
linux/wavpack/wavpack-bin/latest b/packages/cortexa57-oe-linux/wavpack/wavp=
ack-bin/latest<br>deleted file mode 100644<br>index 3a1b182efce..0000000000=
0<br>--- a/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest<br>+++ /d=
ev/null<br>@@ -1,10 +0,0 @@<br>-PV =3D 5.1.0<br>-PR =3D r0<br>-PKG =3D libw=
avpack-bin<br>-PKGR =3D r0.0<br>-RPROVIDES =3D wavpack-bin (=3D5.1.0)<br>-R=
DEPENDS =3D glibc (&gt;=3D 2.38+git0+1e04dcec49) wavpack (&gt;=3D 5.1.0)<br=
>-RRECOMMENDS =3D <br>-PKGSIZE =3D 408992<br>-FILES =3D /usr/bin/* /usr/sbi=
n/*<br>-FILELIST =3D /usr/bin/wavpack /usr/bin/wvgain /usr/bin/wvtag /usr/b=
in/wvunpack<br><div><br></div><div><br></div></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 21, 2023 at =
3:11=E2=80=AFPM alper ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com">alp=
eryasinak1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Added openssl as a depends and sent v2 patch, thank you=
.<br>
<br>
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank=
">martin.jansa@gmail.com</a>&gt;, 21 Ara 2023 Per, 15:30<br>
tarihinde =C5=9Funu yazd=C4=B1:<br>
&gt;<br>
&gt; Adding the dependency on target openssl allows the build to finish OK.=
<br>
&gt;<br>
&gt; On Thu, Dec 21, 2023 at 1:06=E2=80=AFPM Martin Jansa via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; it seems to be trying to link with native libcrypto in some builds=
:<br>
&gt;&gt;<br>
&gt;&gt; lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: fi=
le not recognized: file format not recognized<br>
&gt;&gt; collect2: error: ld returned 1 exit status<br>
&gt;&gt;<br>
&gt;&gt; have you tried to build it e.g. for aarch64 or arm on x86_64 build=
 host?<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Dec 20, 2023 at 7:25=E2=80=AFAM Alper Ak &lt;<a href=3D"ma=
ilto:alperyasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; License-Update: Copyright year changes<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Changelog:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; * added: AIFF file import/export support<br>
&gt;&gt;&gt; * added: WATCOM compiler and OS/2 support<br>
&gt;&gt;&gt; * added: cmake support for mingw, builds Cooledit + Winamp plu=
gins<br>
&gt;&gt;&gt; * added: --force-even-byte-depth option for rounding up bit de=
pths<br>
&gt;&gt;&gt; * fixed: detect and report PCM files having non-zero padding b=
its<br>
&gt;&gt;&gt; * fixed: possible crash when displaying long channel assignmen=
ts<br>
&gt;&gt;&gt; * fixed: big-endian-sourced &quot;raw&quot; files gave big-end=
ian &quot;wav&quot;s<br>
&gt;&gt;&gt; * fixed: numerous minor issues<br>
&gt;&gt;&gt; * fixed: CVE-2021-44269 (encoding crafted DSD file triggers OO=
B read crash)<br>
&gt;&gt;&gt; * fixed: very long filenames cause stack-overflow crash in all=
 CLI programs<br>
&gt;&gt;&gt; * fixed: the length stored in WAV headers not always corrected=
 when using -i<br>
&gt;&gt;&gt; * fixed: attempting to encode raw DSD audio from stdin sometim=
es causes crash<br>
&gt;&gt;&gt; * fixed: DSD to PCM decimation: small clicks between tracks an=
d tiny DC offset<br>
&gt;&gt;&gt; * fixed: length update in library-generated WAV headers on big=
-endian machines<br>
&gt;&gt;&gt; * fixed: sanitize custom extensions read from WavPack files to=
 be alphanumeric<br>
&gt;&gt;&gt; * added: accepting brace-delimited options in the wavpack exec=
utable filename<br>
&gt;&gt;&gt; * added: &quot;--drop&quot; option to Windows executables for =
multi-file &quot;drag-and-drop&quot;<br>
&gt;&gt;&gt; * added&quot; &quot;--raw-pcm&quot; option to wvunpack executa=
ble (does DSD --&gt; 24-bit PCM)<br>
&gt;&gt;&gt; * added: &quot;--no-overwrite&quot; option to wavpack executab=
le (to resume sessions)<br>
&gt;&gt;&gt; * improved: build system clean-up including switch to non-recu=
rsive &quot;make&quot;<br>
&gt;&gt;&gt; * fixed: potential security issue CVE-2020-35738<br>
&gt;&gt;&gt; * fixed: disable A32 asm code when building for Apple silicon<=
br>
&gt;&gt;&gt; * fixed: issues with Adobe-style floating-point WAV files<br>
&gt;&gt;&gt; * added: -vv option to wvunpack to quickly verify using just<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 block checksums (ideal for detecting corru=
pted files)<br>
&gt;&gt;&gt; * added: --normalize-floats option to wvunpack for correctly<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 exporting un-normalized floating-point fil=
es<br>
&gt;&gt;&gt; * updated: Visual Studio 2019 for Windows builds<br>
&gt;&gt;&gt; * dropped: WinXP support in official binaries<br>
&gt;&gt;&gt; * fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(no CVEs or vulnerabilities)<br>
&gt;&gt;&gt; * fixed: trailing garbage characters on imported ID3v2 TXXX ta=
gs<br>
&gt;&gt;&gt; * fixed: various minor undefined behavior and memory access is=
sues<br>
&gt;&gt;&gt; * fixed: sanitize tag extraction names for length and path inc=
lusion<br>
&gt;&gt;&gt; * improved: reformat wvunpack &quot;help&quot; and split into =
long + short versions<br>
&gt;&gt;&gt; * added: regression testing to Travis CI for OSS-Fuzz crashers=
<br>
&gt;&gt;&gt; * fixed: potential security issues including the following CVE=
s:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CVE-2018-19840 CVE-2018-19841 CVE-2018-105=
36<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CVE-2018-10537 CVE-2018-10538 CVE-2018-105=
39<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CVE-2018-10540 CVE-2018-7254=C2=A0 CVE-201=
8-7253<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CVE-2018-6767<br>
&gt;&gt;&gt; * added: support for CMake, Travis CI, and Google&#39;s OSS-fu=
zz<br>
&gt;&gt;&gt; * fixed: use correction file for encode verify (pipe input, Wi=
ndows)<br>
&gt;&gt;&gt; * fixed: correct WAV header with actual length (pipe input, -i=
 option)<br>
&gt;&gt;&gt; * fixed: thumb interworking and not needing v6 architecture (A=
RM asm)<br>
&gt;&gt;&gt; * added: handle more ID3v2.3 tag items and from all file types=
<br>
&gt;&gt;&gt; * fixed: coredump on Sparc64 (changed MD5 implementation)<br>
&gt;&gt;&gt; * fixed: handle invalid ID3v2.3 tags from sacd-ripper<br>
&gt;&gt;&gt; * fixed: several corner-case memory leaks<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gma=
il.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 .../wavpack/{<a href=3D"http://wavpack_5.1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">wavpack_5.1.0.bb</a> =3D&gt; <a href=3D"http:=
//wavpack_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</=
a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
&gt;&gt;&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt;&gt;=C2=A0 rename meta-oe/recipes-multimedia/wavpack/{<a href=3D"ht=
tp://wavpack_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.b=
b</a> =3D&gt; <a href=3D"http://wavpack_5.6.0.bb" rel=3D"noreferrer" target=
=3D"_blank">wavpack_5.6.0.bb</a>} (63%)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta-oe/recipes-multimedia/wavpack/<a href=3D"htt=
p://wavpack_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.bb=
</a> b/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.6.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a><br>
&gt;&gt;&gt; similarity index 63%<br>
&gt;&gt;&gt; rename from meta-oe/recipes-multimedia/wavpack/<a href=3D"http=
://wavpack_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.bb<=
/a><br>
&gt;&gt;&gt; rename to meta-oe/recipes-multimedia/wavpack/<a href=3D"http:/=
/wavpack_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a=
><br>
&gt;&gt;&gt; index 909612393..80671896c 100644<br>
&gt;&gt;&gt; --- a/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wav=
pack_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.bb</a><br=
>
&gt;&gt;&gt; +++ b/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wav=
pack_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a><br=
>
&gt;&gt;&gt; @@ -1,9 +1,9 @@<br>
&gt;&gt;&gt;=C2=A0 DESCRIPTION =3D &quot;WavPack is a completely open audio=
 compression format providing lossless, high-quality lossy, and a unique hy=
brid compression mode.&quot;<br>
&gt;&gt;&gt;=C2=A0 LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://license.txt;md5=3D8c1a910e5=
c2a8b30ec8ffb2ffa63d9b2&quot;<br>
&gt;&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://license.txt;md5=3Dbb5d037e3=
ad41a3c84c9f2d8bb65a7b4&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/dbr=
y/WavPack.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/dbry/WavPack.git;branch=3Dmaster;protocol=3Dhttps</a=
>&quot;<br>
&gt;&gt;&gt; -SRCREV =3D &quot;9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2&quo=
t;<br>
&gt;&gt;&gt; +SRCREV =3D &quot;e03e8e29dc618e08e7baba9636e57ba1254874ce&quo=
t;<br>
&gt;&gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -inherit autotools lib_package<br>
&gt;&gt;&gt; +inherit cmake pkgconfig<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.25.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#107708): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/107708" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/107708</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1032=
77174/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/103277174/3617156</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gm=
ail.com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000f74188060d19c629--

