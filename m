Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FD7C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:41:37 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.25636.1703259688027942828
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FVHp/Ptl;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33666fb9318so1739826f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703259686; x=1703864486; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0x1HemRIlZPg6uUXgFIpVjDGtU24ncKF4yR6OgDKp0=;
        b=FVHp/Ptlfsnu7mt7TM35vQiAh+/y4WK+Gk7R6LkCuvN4isGGejqYCw9cQIvFEqYatm
         hdFpbW0iKYc6/TRP2pyr2UDQ/O9zTVoVNjDDI8QqEjugXMp5E3eOPy2iN00uMkQSlila
         XGYej+IdQM/WW6Mo5fn6TKGMfkDilMGi3STFN+/2qXWUhJSy9Cj8YCtYXOJkOZCDTM6d
         iTagzMYSKrTM+r/0+54xfuWcQK9b/41/FOgfgPosEuE3CJYHsEJ0GvlWAStQRM78r7bz
         AMqXr1LYn4PqZN49DTvi9t1LP/XuA4g7p7E5dmqx46e+Y0kHGum8z3A5pBE8OWTYM3gh
         s53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703259686; x=1703864486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0x1HemRIlZPg6uUXgFIpVjDGtU24ncKF4yR6OgDKp0=;
        b=g2anmhiZZcfGfS4cccMBYfcs9EXECDZJiDa+b277il/5aeQwFUWCYFsupCg39QnBmo
         OAo6RuHPRr+KLqNXuDjSitvdiPZrCrGcIcjFTzwz+l9N4786qPe0L2hNfZ1RAwbFt9EJ
         57CbsW79UM4VFQ9zwTFNKMA6C6KCjS7fBXeGT+KWGIGRNJ4jsxNfVWLOu687EO1CSAym
         Ljh7CRZqu7aDsM++v5jXlF+K0BXVmF1nNv+Cy3X/RUAxtHyE/9mjxOqm+qjBWlvioFXp
         c9F0j8VtHdIRU8Hsborejfpgd5dB2+YfQhxtt/mX2nQYbRdKBvpixgCmX4msngTvQpfM
         q4Zw==
X-Gm-Message-State: AOJu0YylDXqCVaVDxIf9jhZJ1ZMm90fu8xDRetwrUaef/1iDVZI49n4U
	W7FzRwsfoBnr2PPAg8nQThrFz5n3PmrTPjDcbOY=
X-Google-Smtp-Source: AGHT+IG1IbF9Ff+vdfQw0I8/UqhApteqBSVeUvu7+RS7HVxikY2Q3z5S3IwBUyGDJebTSy6DFx1E1VvjM9OfN+S79f4=
X-Received: by 2002:adf:ef4e:0:b0:336:614b:5326 with SMTP id
 c14-20020adfef4e000000b00336614b5326mr703069wrp.82.1703259686068; Fri, 22 Dec
 2023 07:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20231220062530.21888-1-alperyasinak1@gmail.com>
 <17A2D7603CB3C41A.24485@lists.openembedded.org> <CA+chaQeFh+4gYgjvc62Z5O61Y3xWv859G7BGf_-0UU60EjrGvA@mail.gmail.com>
 <CAGpma=57tR6-Fh63iBkiP_p-sMzaYDc_ciH7KPH+Z13BUnCMAw@mail.gmail.com>
 <CA+chaQfTrDCwjxQ2jiSGw-O0+vT+ce8AgJSuaNf7WhhXjuVW9g@mail.gmail.com> <CAMKF1soWo6BGz2YQKVQwe1raN3L+8=HyUAA4AJkhG-zAROrUzg@mail.gmail.com>
In-Reply-To: <CAMKF1soWo6BGz2YQKVQwe1raN3L+8=HyUAA4AJkhG-zAROrUzg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Dec 2023 16:41:13 +0100
Message-ID: <CA+chaQfXceQ-u9JgiERqn4Wnqcsm-1bcwLDffjMbvCTX9-ENNA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wavpack: upgrade 5.1.0 -> 5.6.0
To: Khem Raj <raj.khem@gmail.com>
Cc: alper ak <alperyasinak1@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008c81f1060d1b0c04"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107762

--0000000000008c81f1060d1b0c04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's active, without it it was building only the static library.

But ${PN}-bin was removed, so the binaries are now packaged in ${PN} as
well (which doesn't look as improvement) and causes the package name not to
be renamed anymore with debian.bbclass.

And in the .patch I've used PROJECT_VERSION as SOVERSION for CMake to build
versioned library, but that means that the .so now has 5.6.0 version while
5.1.0 was using 1.2.0, so it would be better to discuss with upstream to
see if the missing library version in CMake is intentional difference from
autotools or just overlook.

Regards,

On Fri, Dec 22, 2023 at 3:39=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> perhaps shared libs option is not getting effective. when you send a
> v3 please squash Martin's change into that as well.
>
> On Fri, Dec 22, 2023 at 6:10=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
> >
> > Thanks for v2, I've sent additional fix for shared libraries, but there
> are still some probably unexpected side-effects from using CMake and
> dropping lib_package inherit (${PN}-bin removal) as buildhistory shows:
> >
> > diff --git a/packages/cortexa57-oe-linux/wavpack/sysroot
> b/packages/cortexa57-oe-linux/wavpack/sysroot
> > index e772d96dbb5..de2cfdb7b0f 100644
> > --- a/packages/cortexa57-oe-linux/wavpack/sysroot
> > +++ b/packages/cortexa57-oe-linux/wavpack/sysroot
> > @@ -7,10 +7,11 @@ drwxr-xr-x -          -                4096
> ./usr/include/wavpack
> >  drwxr-xr-x -          -                4096 ./usr/lib
> >  drwxr-xr-x -          -                4096 ./usr/lib/cmake
> >  drwxr-xr-x -          -                4096 ./usr/lib/cmake/WavPack
> > --rw-r--r-- -          -                4917
> ./usr/lib/cmake/WavPack/wavpack-config.cmake
> > --rw-r--r-- -          -                2470
> ./usr/lib/cmake/WavPack/wavpack-config-noconfig.cmake
> > +-rw-r--r-- -          -                4678
> ./usr/lib/cmake/WavPack/wavpack-config.cmake
> > +-rw-r--r-- -          -                2484
> ./usr/lib/cmake/WavPack/wavpack-config-noconfig.cmake
> >  -rw-r--r-- -          -                3675
> ./usr/lib/cmake/WavPack/wavpack-config-version.cmake
> > --rw-r--r-- -          -             1006290 ./usr/lib/libwavpack.a
> > +-rwxr-xr-x -          -              199048
> ./usr/lib/libwavpack.so.5.6.0
> > +lrwxrwxrwx -          -                  19 ./usr/lib/libwavpack.so ->
> libwavpack.so.5.6.0
> >  drwxr-xr-x -          -                4096 ./usr/lib/pkgconfig
> >  -rw-r--r-- -          -                 234
> ./usr/lib/pkgconfig/wavpack.pc
> >  drwxr-xr-x -          -                4096 ./usr/share
> >
> >
> > diff --git a/packages/cortexa57-oe-linux/wavpack/wavpack/latest
> b/packages/cortexa57-oe-linux/wavpack/wavpack/latest
> > index d1d7db3e993..4e8fd7e2f20 100644
> > --- a/packages/cortexa57-oe-linux/wavpack/wavpack/latest
> > +++ b/packages/cortexa57-oe-linux/wavpack/wavpack/latest
> > @@ -1,10 +1,9 @@
> > -PV =3D 5.1.0
> > +PV =3D 5.6.0
> >  PR =3D r0
> > -PKG =3D libwavpack1
> > -PKGR =3D r0.0
> > -RPROVIDES =3D wavpack (=3D5.1.0)
> > +PKGR =3D r0.2
> > +RPROVIDES =3D
> >  RDEPENDS =3D glibc (>=3D 2.38+git0+1e04dcec49)
> >  RRECOMMENDS =3D
> > -PKGSIZE =3D 199171
> > +PKGSIZE =3D 608176
> >  FILES =3D /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /et=
c
> /com /var /usr/bin/* /usr/sbin/* /usr/lib/*.so.* /lib/udev /usr/lib/udev
> /usr/lib/udev /usr/lib/udev /usr/share/wavpack /usr/lib/wavpack/*
> /usr/share/pixmaps /usr/shar
> > e/applications /usr/share/idl /usr/share/omf /usr/share/sounds
> /usr/lib/bonobo/servers
> > -FILELIST =3D /usr/lib/libwavpack.so.1 /usr/lib/libwavpack.so.1.2.0
> > +FILELIST =3D /usr/bin/wavpack /usr/bin/wvgain /usr/bin/wvtag
> /usr/bin/wvunpack /usr/lib/libwavpack.so.5.6.0
> >
> > diff --git a/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest
> b/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest
> > deleted file mode 100644
> > index 3a1b182efce..00000000000
> > --- a/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -PV =3D 5.1.0
> > -PR =3D r0
> > -PKG =3D libwavpack-bin
> > -PKGR =3D r0.0
> > -RPROVIDES =3D wavpack-bin (=3D5.1.0)
> > -RDEPENDS =3D glibc (>=3D 2.38+git0+1e04dcec49) wavpack (>=3D 5.1.0)
> > -RRECOMMENDS =3D
> > -PKGSIZE =3D 408992
> > -FILES =3D /usr/bin/* /usr/sbin/*
> > -FILELIST =3D /usr/bin/wavpack /usr/bin/wvgain /usr/bin/wvtag
> /usr/bin/wvunpack
> >
> >
> >
> > On Thu, Dec 21, 2023 at 3:11=E2=80=AFPM alper ak <alperyasinak1@gmail.c=
om>
> wrote:
> >>
> >> Added openssl as a depends and sent v2 patch, thank you.
> >>
> >> Martin Jansa <martin.jansa@gmail.com>, 21 Ara 2023 Per, 15:30
> >> tarihinde =C5=9Funu yazd=C4=B1:
> >> >
> >> > Adding the dependency on target openssl allows the build to finish O=
K.
> >> >
> >> > On Thu, Dec 21, 2023 at 1:06=E2=80=AFPM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >> >>
> >> >> Hi,
> >> >>
> >> >> it seems to be trying to link with native libcrypto in some builds:
> >> >>
> >> >> lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: fil=
e
> not recognized: file format not recognized
> >> >> collect2: error: ld returned 1 exit status
> >> >>
> >> >> have you tried to build it e.g. for aarch64 or arm on x86_64 build
> host?
> >> >>
> >> >> On Wed, Dec 20, 2023 at 7:25=E2=80=AFAM Alper Ak <alperyasinak1@gma=
il.com>
> wrote:
> >> >>>
> >> >>> License-Update: Copyright year changes
> >> >>>
> >> >>> Changelog:
> >> >>>
> >> >>> * added: AIFF file import/export support
> >> >>> * added: WATCOM compiler and OS/2 support
> >> >>> * added: cmake support for mingw, builds Cooledit + Winamp plugins
> >> >>> * added: --force-even-byte-depth option for rounding up bit depths
> >> >>> * fixed: detect and report PCM files having non-zero padding bits
> >> >>> * fixed: possible crash when displaying long channel assignments
> >> >>> * fixed: big-endian-sourced "raw" files gave big-endian "wav"s
> >> >>> * fixed: numerous minor issues
> >> >>> * fixed: CVE-2021-44269 (encoding crafted DSD file triggers OOB
> read crash)
> >> >>> * fixed: very long filenames cause stack-overflow crash in all CLI
> programs
> >> >>> * fixed: the length stored in WAV headers not always corrected whe=
n
> using -i
> >> >>> * fixed: attempting to encode raw DSD audio from stdin sometimes
> causes crash
> >> >>> * fixed: DSD to PCM decimation: small clicks between tracks and
> tiny DC offset
> >> >>> * fixed: length update in library-generated WAV headers on
> big-endian machines
> >> >>> * fixed: sanitize custom extensions read from WavPack files to be
> alphanumeric
> >> >>> * added: accepting brace-delimited options in the wavpack
> executable filename
> >> >>> * added: "--drop" option to Windows executables for multi-file
> "drag-and-drop"
> >> >>> * added" "--raw-pcm" option to wvunpack executable (does DSD -->
> 24-bit PCM)
> >> >>> * added: "--no-overwrite" option to wavpack executable (to resume
> sessions)
> >> >>> * improved: build system clean-up including switch to non-recursiv=
e
> "make"
> >> >>> * fixed: potential security issue CVE-2020-35738
> >> >>> * fixed: disable A32 asm code when building for Apple silicon
> >> >>> * fixed: issues with Adobe-style floating-point WAV files
> >> >>> * added: -vv option to wvunpack to quickly verify using just
> >> >>>      block checksums (ideal for detecting corrupted files)
> >> >>> * added: --normalize-floats option to wvunpack for correctly
> >> >>>      exporting un-normalized floating-point files
> >> >>> * updated: Visual Studio 2019 for Windows builds
> >> >>> * dropped: WinXP support in official binaries
> >> >>> * fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448
> >> >>>       (no CVEs or vulnerabilities)
> >> >>> * fixed: trailing garbage characters on imported ID3v2 TXXX tags
> >> >>> * fixed: various minor undefined behavior and memory access issues
> >> >>> * fixed: sanitize tag extraction names for length and path inclusi=
on
> >> >>> * improved: reformat wvunpack "help" and split into long + short
> versions
> >> >>> * added: regression testing to Travis CI for OSS-Fuzz crashers
> >> >>> * fixed: potential security issues including the following CVEs:
> >> >>>      CVE-2018-19840 CVE-2018-19841 CVE-2018-10536
> >> >>>      CVE-2018-10537 CVE-2018-10538 CVE-2018-10539
> >> >>>      CVE-2018-10540 CVE-2018-7254  CVE-2018-7253
> >> >>>      CVE-2018-6767
> >> >>> * added: support for CMake, Travis CI, and Google's OSS-fuzz
> >> >>> * fixed: use correction file for encode verify (pipe input, Window=
s)
> >> >>> * fixed: correct WAV header with actual length (pipe input, -i
> option)
> >> >>> * fixed: thumb interworking and not needing v6 architecture (ARM
> asm)
> >> >>> * added: handle more ID3v2.3 tag items and from all file types
> >> >>> * fixed: coredump on Sparc64 (changed MD5 implementation)
> >> >>> * fixed: handle invalid ID3v2.3 tags from sacd-ripper
> >> >>> * fixed: several corner-case memory leaks
> >> >>>
> >> >>> Signed-off-by: alperak <alperyasinak1@gmail.com>
> >> >>> ---
> >> >>>  .../wavpack/{wavpack_5.1.0.bb =3D> wavpack_5.6.0.bb}          | 6
> +++---
> >> >>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >> >>>  rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.1.0.bb =3D>
> wavpack_5.6.0.bb} (63%)
> >> >>>
> >> >>> diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
> b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> >> >>> similarity index 63%
> >> >>> rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
> >> >>> rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> >> >>> index 909612393..80671896c 100644
> >> >>> --- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
> >> >>> +++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> >> >>> @@ -1,9 +1,9 @@
> >> >>>  DESCRIPTION =3D "WavPack is a completely open audio compression
> format providing lossless, high-quality lossy, and a unique hybrid
> compression mode."
> >> >>>  LICENSE =3D "BSD-3-Clause"
> >> >>> -LIC_FILES_CHKSUM =3D
> "file://license.txt;md5=3D8c1a910e5c2a8b30ec8ffb2ffa63d9b2"
> >> >>> +LIC_FILES_CHKSUM =3D
> "file://license.txt;md5=3Dbb5d037e3ad41a3c84c9f2d8bb65a7b4"
> >> >>>
> >> >>>  SRC_URI =3D "git://
> github.com/dbry/WavPack.git;branch=3Dmaster;protocol=3Dhttps"
> >> >>> -SRCREV =3D "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
> >> >>> +SRCREV =3D "e03e8e29dc618e08e7baba9636e57ba1254874ce"
> >> >>>  S =3D "${WORKDIR}/git"
> >> >>>
> >> >>> -inherit autotools lib_package
> >> >>> +inherit cmake pkgconfig
> >> >>> --
> >> >>> 2.25.1
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >>
> >> >>
> >> >>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107751):
> https://lists.openembedded.org/g/openembedded-devel/message/107751
> > Mute This Topic: https://lists.openembedded.org/mt/103277174/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000008c81f1060d1b0c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It&#39;s active, without it it was building only the =
static library.</div><div><br></div><div>But ${PN}-bin was removed, so the =
binaries are now packaged in ${PN} as well (which doesn&#39;t look as impro=
vement) and causes the package name not to be renamed anymore with debian.b=
bclass.</div><div><br></div><div>And in the .patch I&#39;ve used PROJECT_VE=
RSION as SOVERSION for CMake to build versioned library, but that means tha=
t the .so now has 5.6.0 version while 5.1.0 was using 1.2.0, so it would be=
 better to discuss with upstream to see if the missing library version in C=
Make is intentional difference from autotools or just overlook.</div><div><=
br></div><div>Regards,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, Dec 22, 2023 at 3:39=E2=80=AFPM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">perhaps shared libs=
 option is not getting effective. when you send a<br>
v3 please squash Martin&#39;s change into that as well.<br>
<br>
On Fri, Dec 22, 2023 at 6:10=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Thanks for v2, I&#39;ve sent additional fix for shared libraries, but =
there are still some probably unexpected side-effects from using CMake and =
dropping lib_package inherit (${PN}-bin removal) as buildhistory shows:<br>
&gt;<br>
&gt; diff --git a/packages/cortexa57-oe-linux/wavpack/sysroot b/packages/co=
rtexa57-oe-linux/wavpack/sysroot<br>
&gt; index e772d96dbb5..de2cfdb7b0f 100644<br>
&gt; --- a/packages/cortexa57-oe-linux/wavpack/sysroot<br>
&gt; +++ b/packages/cortexa57-oe-linux/wavpack/sysroot<br>
&gt; @@ -7,10 +7,11 @@ drwxr-xr-x -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4096 ./usr/include/wav=
pack<br>
&gt;=C2=A0 drwxr-xr-x -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4096 ./usr/lib<br>
&gt;=C2=A0 drwxr-xr-x -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4096 ./usr/lib/cmake<br>
&gt;=C2=A0 drwxr-xr-x -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4096 ./usr/lib/cmake/WavPack<br>
&gt; --rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4917 ./usr/lib/cmake/WavPack/wavpack-con=
fig.cmake<br>
&gt; --rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2470 ./usr/lib/cmake/WavPack/wavpack-con=
fig-noconfig.cmake<br>
&gt; +-rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4678 ./usr/lib/cmake/WavPack/wavpack-con=
fig.cmake<br>
&gt; +-rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2484 ./usr/lib/cmake/WavPack/wavpack-con=
fig-noconfig.cmake<br>
&gt;=C2=A0 -rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3675 ./usr/lib/cmake/WavPack/wavp=
ack-config-version.cmake<br>
&gt; --rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A01006290 ./usr/lib/libwavpack.a<br>
&gt; +-rwxr-xr-x -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 199048 ./usr/lib/libwavpack.so.5.6.0<br>
&gt; +lrwxrwxrwx -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19 ./usr/lib/libwavpack.so -&gt; =
libwavpack.so.5.6.0<br>
&gt;=C2=A0 drwxr-xr-x -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4096 ./usr/lib/pkgconfig<br>
&gt;=C2=A0 -rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0234 ./usr/lib/pkgconfig/wav=
pack.pc<br>
&gt;=C2=A0 drwxr-xr-x -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4096 ./usr/share<br>
&gt;<br>
&gt;<br>
&gt; diff --git a/packages/cortexa57-oe-linux/wavpack/wavpack/latest b/pack=
ages/cortexa57-oe-linux/wavpack/wavpack/latest<br>
&gt; index d1d7db3e993..4e8fd7e2f20 100644<br>
&gt; --- a/packages/cortexa57-oe-linux/wavpack/wavpack/latest<br>
&gt; +++ b/packages/cortexa57-oe-linux/wavpack/wavpack/latest<br>
&gt; @@ -1,10 +1,9 @@<br>
&gt; -PV =3D 5.1.0<br>
&gt; +PV =3D 5.6.0<br>
&gt;=C2=A0 PR =3D r0<br>
&gt; -PKG =3D libwavpack1<br>
&gt; -PKGR =3D r0.0<br>
&gt; -RPROVIDES =3D wavpack (=3D5.1.0)<br>
&gt; +PKGR =3D r0.2<br>
&gt; +RPROVIDES =3D<br>
&gt;=C2=A0 RDEPENDS =3D glibc (&gt;=3D 2.38+git0+1e04dcec49)<br>
&gt;=C2=A0 RRECOMMENDS =3D<br>
&gt; -PKGSIZE =3D 199171<br>
&gt; +PKGSIZE =3D 608176<br>
&gt;=C2=A0 FILES =3D /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so=
.* /etc /com /var /usr/bin/* /usr/sbin/* /usr/lib/*.so.* /lib/udev /usr/lib=
/udev /usr/lib/udev /usr/lib/udev /usr/share/wavpack /usr/lib/wavpack/* /us=
r/share/pixmaps /usr/shar<br>
&gt; e/applications /usr/share/idl /usr/share/omf /usr/share/sounds /usr/li=
b/bonobo/servers<br>
&gt; -FILELIST =3D /usr/lib/libwavpack.so.1 /usr/lib/libwavpack.so.1.2.0<br=
>
&gt; +FILELIST =3D /usr/bin/wavpack /usr/bin/wvgain /usr/bin/wvtag /usr/bin=
/wvunpack /usr/lib/libwavpack.so.5.6.0<br>
&gt;<br>
&gt; diff --git a/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest b/=
packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest<br>
&gt; deleted file mode 100644<br>
&gt; index 3a1b182efce..00000000000<br>
&gt; --- a/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,10 +0,0 @@<br>
&gt; -PV =3D 5.1.0<br>
&gt; -PR =3D r0<br>
&gt; -PKG =3D libwavpack-bin<br>
&gt; -PKGR =3D r0.0<br>
&gt; -RPROVIDES =3D wavpack-bin (=3D5.1.0)<br>
&gt; -RDEPENDS =3D glibc (&gt;=3D 2.38+git0+1e04dcec49) wavpack (&gt;=3D 5.=
1.0)<br>
&gt; -RRECOMMENDS =3D<br>
&gt; -PKGSIZE =3D 408992<br>
&gt; -FILES =3D /usr/bin/* /usr/sbin/*<br>
&gt; -FILELIST =3D /usr/bin/wavpack /usr/bin/wvgain /usr/bin/wvtag /usr/bin=
/wvunpack<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Dec 21, 2023 at 3:11=E2=80=AFPM alper ak &lt;<a href=3D"mailto=
:alperyasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; Added openssl as a depends and sent v2 patch, thank you.<br>
&gt;&gt;<br>
&gt;&gt; Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt;, 21 Ara 2023 Per, 15:30<br>
&gt;&gt; tarihinde =C5=9Funu yazd=C4=B1:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Adding the dependency on target openssl allows the build to f=
inish OK.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, Dec 21, 2023 at 1:06=E2=80=AFPM Martin Jansa via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; it seems to be trying to link with native libcrypto in so=
me builds:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcryp=
to.so: file not recognized: file format not recognized<br>
&gt;&gt; &gt;&gt; collect2: error: ld returned 1 exit status<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; have you tried to build it e.g. for aarch64 or arm on x86=
_64 build host?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Wed, Dec 20, 2023 at 7:25=E2=80=AFAM Alper Ak &lt;<a h=
ref=3D"mailto:alperyasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmai=
l.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; License-Update: Copyright year changes<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Changelog:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; * added: AIFF file import/export support<br>
&gt;&gt; &gt;&gt;&gt; * added: WATCOM compiler and OS/2 support<br>
&gt;&gt; &gt;&gt;&gt; * added: cmake support for mingw, builds Cooledit + W=
inamp plugins<br>
&gt;&gt; &gt;&gt;&gt; * added: --force-even-byte-depth option for rounding =
up bit depths<br>
&gt;&gt; &gt;&gt;&gt; * fixed: detect and report PCM files having non-zero =
padding bits<br>
&gt;&gt; &gt;&gt;&gt; * fixed: possible crash when displaying long channel =
assignments<br>
&gt;&gt; &gt;&gt;&gt; * fixed: big-endian-sourced &quot;raw&quot; files gav=
e big-endian &quot;wav&quot;s<br>
&gt;&gt; &gt;&gt;&gt; * fixed: numerous minor issues<br>
&gt;&gt; &gt;&gt;&gt; * fixed: CVE-2021-44269 (encoding crafted DSD file tr=
iggers OOB read crash)<br>
&gt;&gt; &gt;&gt;&gt; * fixed: very long filenames cause stack-overflow cra=
sh in all CLI programs<br>
&gt;&gt; &gt;&gt;&gt; * fixed: the length stored in WAV headers not always =
corrected when using -i<br>
&gt;&gt; &gt;&gt;&gt; * fixed: attempting to encode raw DSD audio from stdi=
n sometimes causes crash<br>
&gt;&gt; &gt;&gt;&gt; * fixed: DSD to PCM decimation: small clicks between =
tracks and tiny DC offset<br>
&gt;&gt; &gt;&gt;&gt; * fixed: length update in library-generated WAV heade=
rs on big-endian machines<br>
&gt;&gt; &gt;&gt;&gt; * fixed: sanitize custom extensions read from WavPack=
 files to be alphanumeric<br>
&gt;&gt; &gt;&gt;&gt; * added: accepting brace-delimited options in the wav=
pack executable filename<br>
&gt;&gt; &gt;&gt;&gt; * added: &quot;--drop&quot; option to Windows executa=
bles for multi-file &quot;drag-and-drop&quot;<br>
&gt;&gt; &gt;&gt;&gt; * added&quot; &quot;--raw-pcm&quot; option to wvunpac=
k executable (does DSD --&gt; 24-bit PCM)<br>
&gt;&gt; &gt;&gt;&gt; * added: &quot;--no-overwrite&quot; option to wavpack=
 executable (to resume sessions)<br>
&gt;&gt; &gt;&gt;&gt; * improved: build system clean-up including switch to=
 non-recursive &quot;make&quot;<br>
&gt;&gt; &gt;&gt;&gt; * fixed: potential security issue CVE-2020-35738<br>
&gt;&gt; &gt;&gt;&gt; * fixed: disable A32 asm code when building for Apple=
 silicon<br>
&gt;&gt; &gt;&gt;&gt; * fixed: issues with Adobe-style floating-point WAV f=
iles<br>
&gt;&gt; &gt;&gt;&gt; * added: -vv option to wvunpack to quickly verify usi=
ng just<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 block checksums (ideal for detect=
ing corrupted files)<br>
&gt;&gt; &gt;&gt;&gt; * added: --normalize-floats option to wvunpack for co=
rrectly<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 exporting un-normalized floating-=
point files<br>
&gt;&gt; &gt;&gt;&gt; * updated: Visual Studio 2019 for Windows builds<br>
&gt;&gt; &gt;&gt;&gt; * dropped: WinXP support in official binaries<br>
&gt;&gt; &gt;&gt;&gt; * fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448<b=
r>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(no CVEs or vulnerabilities=
)<br>
&gt;&gt; &gt;&gt;&gt; * fixed: trailing garbage characters on imported ID3v=
2 TXXX tags<br>
&gt;&gt; &gt;&gt;&gt; * fixed: various minor undefined behavior and memory =
access issues<br>
&gt;&gt; &gt;&gt;&gt; * fixed: sanitize tag extraction names for length and=
 path inclusion<br>
&gt;&gt; &gt;&gt;&gt; * improved: reformat wvunpack &quot;help&quot; and sp=
lit into long + short versions<br>
&gt;&gt; &gt;&gt;&gt; * added: regression testing to Travis CI for OSS-Fuzz=
 crashers<br>
&gt;&gt; &gt;&gt;&gt; * fixed: potential security issues including the foll=
owing CVEs:<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CVE-2018-19840 CVE-2018-19841 CVE=
-2018-10536<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CVE-2018-10537 CVE-2018-10538 CVE=
-2018-10539<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CVE-2018-10540 CVE-2018-7254=C2=
=A0 CVE-2018-7253<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CVE-2018-6767<br>
&gt;&gt; &gt;&gt;&gt; * added: support for CMake, Travis CI, and Google&#39=
;s OSS-fuzz<br>
&gt;&gt; &gt;&gt;&gt; * fixed: use correction file for encode verify (pipe =
input, Windows)<br>
&gt;&gt; &gt;&gt;&gt; * fixed: correct WAV header with actual length (pipe =
input, -i option)<br>
&gt;&gt; &gt;&gt;&gt; * fixed: thumb interworking and not needing v6 archit=
ecture (ARM asm)<br>
&gt;&gt; &gt;&gt;&gt; * added: handle more ID3v2.3 tag items and from all f=
ile types<br>
&gt;&gt; &gt;&gt;&gt; * fixed: coredump on Sparc64 (changed MD5 implementat=
ion)<br>
&gt;&gt; &gt;&gt;&gt; * fixed: handle invalid ID3v2.3 tags from sacd-ripper=
<br>
&gt;&gt; &gt;&gt;&gt; * fixed: several corner-case memory leaks<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyas=
inak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt;&gt; ---<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 .../wavpack/{<a href=3D"http://wavpack_5.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.bb</a> =3D&gt; <a href=
=3D"http://wavpack_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5=
.6.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)=
<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 rename meta-oe/recipes-multimedia/wavpack/{<a h=
ref=3D"http://wavpack_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpac=
k_5.1.0.bb</a> =3D&gt; <a href=3D"http://wavpack_5.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">wavpack_5.6.0.bb</a>} (63%)<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; diff --git a/meta-oe/recipes-multimedia/wavpack/<a hr=
ef=3D"http://wavpack_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack=
_5.1.0.bb</a> b/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpac=
k_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a><br>
&gt;&gt; &gt;&gt;&gt; similarity index 63%<br>
&gt;&gt; &gt;&gt;&gt; rename from meta-oe/recipes-multimedia/wavpack/<a hre=
f=3D"http://wavpack_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_=
5.1.0.bb</a><br>
&gt;&gt; &gt;&gt;&gt; rename to meta-oe/recipes-multimedia/wavpack/<a href=
=3D"http://wavpack_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5=
.6.0.bb</a><br>
&gt;&gt; &gt;&gt;&gt; index 909612393..80671896c 100644<br>
&gt;&gt; &gt;&gt;&gt; --- a/meta-oe/recipes-multimedia/wavpack/<a href=3D"h=
ttp://wavpack_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.=
bb</a><br>
&gt;&gt; &gt;&gt;&gt; +++ b/meta-oe/recipes-multimedia/wavpack/<a href=3D"h=
ttp://wavpack_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.=
bb</a><br>
&gt;&gt; &gt;&gt;&gt; @@ -1,9 +1,9 @@<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 DESCRIPTION =3D &quot;WavPack is a completely o=
pen audio compression format providing lossless, high-quality lossy, and a =
unique hybrid compression mode.&quot;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;&gt; &gt;&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://license.txt;md5=3D=
8c1a910e5c2a8b30ec8ffb2ffa63d9b2&quot;<br>
&gt;&gt; &gt;&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://license.txt;md5=3D=
bb5d037e3ad41a3c84c9f2d8bb65a7b4&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://githu=
b.com/dbry/WavPack.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">github.com/dbry/WavPack.git;branch=3Dmaster;protocol=3Dh=
ttps</a>&quot;<br>
&gt;&gt; &gt;&gt;&gt; -SRCREV =3D &quot;9ccc3fe4a37d069137ceabe513a4dd9b0a0=
9c1c2&quot;<br>
&gt;&gt; &gt;&gt;&gt; +SRCREV =3D &quot;e03e8e29dc618e08e7baba9636e57ba1254=
874ce&quot;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; -inherit autotools lib_package<br>
&gt;&gt; &gt;&gt;&gt; +inherit cmake pkgconfig<br>
&gt;&gt; &gt;&gt;&gt; --<br>
&gt;&gt; &gt;&gt;&gt; 2.25.1<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#107751): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/107751" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/107751</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10327717=
4/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103277174/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000008c81f1060d1b0c04--

