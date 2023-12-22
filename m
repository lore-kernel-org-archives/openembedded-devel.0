Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0735AC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:44:57 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.25953.1703259891678715946
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TyLHMQrS;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-204583e67dbso92839fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703259891; x=1703864691; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD668mPJiImCU4DkhYU9C5P+0enZcRnw+Wpva8GxNUk=;
        b=TyLHMQrSHqCbRPxkceScCz+ALUUEscRNbcsOxRentSlGlyTjQ45HRoewQsO1M0ciNh
         b47S1ZUDiK84DRF8R8EMMTIhkV4jZ2FlD4xO79IvZJXQhrXt69ZlkmJCsTAxdVmI5CTe
         R4bmyJwJO5Cdeup1baTtwT5ST6bJr/DwivTd+ZYrjThFT0R1Otl8jxY+hOS2Q6PBf8w7
         mCWWqUf0a72JH8MBg0iQ7hcC2DH9IS7ir7wpeBlT36F1BSc7mb2w2m3eKVuASEPg4JFS
         L17AklWaSkH4x1Q2zI750ayvoOEwE0eMI8Pz+eqMpxGVqBVzLBOHBNmq3Yu9MQ2iAOtV
         V2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703259891; x=1703864691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wD668mPJiImCU4DkhYU9C5P+0enZcRnw+Wpva8GxNUk=;
        b=JUk8E5/9ZzCQOQc3bwYAffinnpf9oA5ShZlqagaUOcvYtL1NgIy553gdz06qv3TIR7
         NgPLEgbuzcZE37qZ7MMMAM46NNdiPuEumVMrbedoWUl5Re1tJRJl1JGqU6l+UJbAJEYn
         hMDnr69hlaqcwZy3pd74GKH08dzyLskE8a+AEAfD10qMRZ9BOP8JEVd5EFGjY7wWSEqG
         JXyuJRe+hBw6CkQfWSjaXQ3TpxMCuTP5LrVlKetIYiAJc/+FNYEadcjV8SzZEQbeyAth
         PZuGDLb/auOdJ/Vlfbl1rVP6h/5Tubmo6xqA9W7JE4HLiSITQ0tft8DrCN2NbpzNaU0b
         rS8g==
X-Gm-Message-State: AOJu0YxXQqQp3SpTGtI+YUmP3acCHEwSasughJKH2QrODLEfFBsrScVZ
	iv5HaVCZLNpMT/9cggxL2bp4fGgZ1pifoLzvDlY=
X-Google-Smtp-Source: AGHT+IESWLuwBvN55BXx/uB6mYGcwExE1zz4r6Yg4au8D51hlEalNBEy7Hwq0+QDhnSt0c7vGsiAGvD04SUtmolP2Qg=
X-Received: by 2002:a05:6870:b61d:b0:203:fca4:43ab with SMTP id
 cm29-20020a056870b61d00b00203fca443abmr2026217oab.7.1703259890721; Fri, 22
 Dec 2023 07:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20231220062530.21888-1-alperyasinak1@gmail.com>
 <17A2D7603CB3C41A.24485@lists.openembedded.org> <CA+chaQeFh+4gYgjvc62Z5O61Y3xWv859G7BGf_-0UU60EjrGvA@mail.gmail.com>
 <CAGpma=57tR6-Fh63iBkiP_p-sMzaYDc_ciH7KPH+Z13BUnCMAw@mail.gmail.com>
 <CA+chaQfTrDCwjxQ2jiSGw-O0+vT+ce8AgJSuaNf7WhhXjuVW9g@mail.gmail.com>
 <CAMKF1soWo6BGz2YQKVQwe1raN3L+8=HyUAA4AJkhG-zAROrUzg@mail.gmail.com> <CA+chaQfXceQ-u9JgiERqn4Wnqcsm-1bcwLDffjMbvCTX9-ENNA@mail.gmail.com>
In-Reply-To: <CA+chaQfXceQ-u9JgiERqn4Wnqcsm-1bcwLDffjMbvCTX9-ENNA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Dec 2023 07:44:24 -0800
Message-ID: <CAMKF1srurBAM58tSq_17-bf=swGSY563U+MTu4-nQfMwrM1g1g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wavpack: upgrade 5.1.0 -> 5.6.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: alper ak <alperyasinak1@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107763

On Fri, Dec 22, 2023 at 7:41=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> It's active, without it it was building only the static library.
>
> But ${PN}-bin was removed, so the binaries are now packaged in ${PN} as w=
ell (which doesn't look as improvement) and causes the package name not to =
be renamed anymore with debian.bbclass.
>
> And in the .patch I've used PROJECT_VERSION as SOVERSION for CMake to bui=
ld versioned library, but that means that the .so now has 5.6.0 version whi=
le 5.1.0 was using 1.2.0, so it would be better to discuss with upstream to=
 see if the missing library version in CMake is intentional difference from=
 autotools or just overlook.

This is something we should look into in more detail since
synthesizing soversion looks wrong to me, as it can convey wrong ABI
change while there maybe none. So I agree getting some idea from
upstream about versioning policy for the shared object would be prudent.


>
> Regards,
>
> On Fri, Dec 22, 2023 at 3:39=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> perhaps shared libs option is not getting effective. when you send a
>> v3 please squash Martin's change into that as well.
>>
>> On Fri, Dec 22, 2023 at 6:10=E2=80=AFAM Martin Jansa <martin.jansa@gmail=
.com> wrote:
>> >
>> > Thanks for v2, I've sent additional fix for shared libraries, but ther=
e are still some probably unexpected side-effects from using CMake and drop=
ping lib_package inherit (${PN}-bin removal) as buildhistory shows:
>> >
>> > diff --git a/packages/cortexa57-oe-linux/wavpack/sysroot b/packages/co=
rtexa57-oe-linux/wavpack/sysroot
>> > index e772d96dbb5..de2cfdb7b0f 100644
>> > --- a/packages/cortexa57-oe-linux/wavpack/sysroot
>> > +++ b/packages/cortexa57-oe-linux/wavpack/sysroot
>> > @@ -7,10 +7,11 @@ drwxr-xr-x -          -                4096 ./usr/in=
clude/wavpack
>> >  drwxr-xr-x -          -                4096 ./usr/lib
>> >  drwxr-xr-x -          -                4096 ./usr/lib/cmake
>> >  drwxr-xr-x -          -                4096 ./usr/lib/cmake/WavPack
>> > --rw-r--r-- -          -                4917 ./usr/lib/cmake/WavPack/w=
avpack-config.cmake
>> > --rw-r--r-- -          -                2470 ./usr/lib/cmake/WavPack/w=
avpack-config-noconfig.cmake
>> > +-rw-r--r-- -          -                4678 ./usr/lib/cmake/WavPack/w=
avpack-config.cmake
>> > +-rw-r--r-- -          -                2484 ./usr/lib/cmake/WavPack/w=
avpack-config-noconfig.cmake
>> >  -rw-r--r-- -          -                3675 ./usr/lib/cmake/WavPack/w=
avpack-config-version.cmake
>> > --rw-r--r-- -          -             1006290 ./usr/lib/libwavpack.a
>> > +-rwxr-xr-x -          -              199048 ./usr/lib/libwavpack.so.5=
.6.0
>> > +lrwxrwxrwx -          -                  19 ./usr/lib/libwavpack.so -=
> libwavpack.so.5.6.0
>> >  drwxr-xr-x -          -                4096 ./usr/lib/pkgconfig
>> >  -rw-r--r-- -          -                 234 ./usr/lib/pkgconfig/wavpa=
ck.pc
>> >  drwxr-xr-x -          -                4096 ./usr/share
>> >
>> >
>> > diff --git a/packages/cortexa57-oe-linux/wavpack/wavpack/latest b/pack=
ages/cortexa57-oe-linux/wavpack/wavpack/latest
>> > index d1d7db3e993..4e8fd7e2f20 100644
>> > --- a/packages/cortexa57-oe-linux/wavpack/wavpack/latest
>> > +++ b/packages/cortexa57-oe-linux/wavpack/wavpack/latest
>> > @@ -1,10 +1,9 @@
>> > -PV =3D 5.1.0
>> > +PV =3D 5.6.0
>> >  PR =3D r0
>> > -PKG =3D libwavpack1
>> > -PKGR =3D r0.0
>> > -RPROVIDES =3D wavpack (=3D5.1.0)
>> > +PKGR =3D r0.2
>> > +RPROVIDES =3D
>> >  RDEPENDS =3D glibc (>=3D 2.38+git0+1e04dcec49)
>> >  RRECOMMENDS =3D
>> > -PKGSIZE =3D 199171
>> > +PKGSIZE =3D 608176
>> >  FILES =3D /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /e=
tc /com /var /usr/bin/* /usr/sbin/* /usr/lib/*.so.* /lib/udev /usr/lib/udev=
 /usr/lib/udev /usr/lib/udev /usr/share/wavpack /usr/lib/wavpack/* /usr/sha=
re/pixmaps /usr/shar
>> > e/applications /usr/share/idl /usr/share/omf /usr/share/sounds /usr/li=
b/bonobo/servers
>> > -FILELIST =3D /usr/lib/libwavpack.so.1 /usr/lib/libwavpack.so.1.2.0
>> > +FILELIST =3D /usr/bin/wavpack /usr/bin/wvgain /usr/bin/wvtag /usr/bin=
/wvunpack /usr/lib/libwavpack.so.5.6.0
>> >
>> > diff --git a/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest b/=
packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest
>> > deleted file mode 100644
>> > index 3a1b182efce..00000000000
>> > --- a/packages/cortexa57-oe-linux/wavpack/wavpack-bin/latest
>> > +++ /dev/null
>> > @@ -1,10 +0,0 @@
>> > -PV =3D 5.1.0
>> > -PR =3D r0
>> > -PKG =3D libwavpack-bin
>> > -PKGR =3D r0.0
>> > -RPROVIDES =3D wavpack-bin (=3D5.1.0)
>> > -RDEPENDS =3D glibc (>=3D 2.38+git0+1e04dcec49) wavpack (>=3D 5.1.0)
>> > -RRECOMMENDS =3D
>> > -PKGSIZE =3D 408992
>> > -FILES =3D /usr/bin/* /usr/sbin/*
>> > -FILELIST =3D /usr/bin/wavpack /usr/bin/wvgain /usr/bin/wvtag /usr/bin=
/wvunpack
>> >
>> >
>> >
>> > On Thu, Dec 21, 2023 at 3:11=E2=80=AFPM alper ak <alperyasinak1@gmail.=
com> wrote:
>> >>
>> >> Added openssl as a depends and sent v2 patch, thank you.
>> >>
>> >> Martin Jansa <martin.jansa@gmail.com>, 21 Ara 2023 Per, 15:30
>> >> tarihinde =C5=9Funu yazd=C4=B1:
>> >> >
>> >> > Adding the dependency on target openssl allows the build to finish =
OK.
>> >> >
>> >> > On Thu, Dec 21, 2023 at 1:06=E2=80=AFPM Martin Jansa via lists.open=
embedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>> >> >>
>> >> >> Hi,
>> >> >>
>> >> >> it seems to be trying to link with native libcrypto in some builds=
:
>> >> >>
>> >> >> lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: fi=
le not recognized: file format not recognized
>> >> >> collect2: error: ld returned 1 exit status
>> >> >>
>> >> >> have you tried to build it e.g. for aarch64 or arm on x86_64 build=
 host?
>> >> >>
>> >> >> On Wed, Dec 20, 2023 at 7:25=E2=80=AFAM Alper Ak <alperyasinak1@gm=
ail.com> wrote:
>> >> >>>
>> >> >>> License-Update: Copyright year changes
>> >> >>>
>> >> >>> Changelog:
>> >> >>>
>> >> >>> * added: AIFF file import/export support
>> >> >>> * added: WATCOM compiler and OS/2 support
>> >> >>> * added: cmake support for mingw, builds Cooledit + Winamp plugin=
s
>> >> >>> * added: --force-even-byte-depth option for rounding up bit depth=
s
>> >> >>> * fixed: detect and report PCM files having non-zero padding bits
>> >> >>> * fixed: possible crash when displaying long channel assignments
>> >> >>> * fixed: big-endian-sourced "raw" files gave big-endian "wav"s
>> >> >>> * fixed: numerous minor issues
>> >> >>> * fixed: CVE-2021-44269 (encoding crafted DSD file triggers OOB r=
ead crash)
>> >> >>> * fixed: very long filenames cause stack-overflow crash in all CL=
I programs
>> >> >>> * fixed: the length stored in WAV headers not always corrected wh=
en using -i
>> >> >>> * fixed: attempting to encode raw DSD audio from stdin sometimes =
causes crash
>> >> >>> * fixed: DSD to PCM decimation: small clicks between tracks and t=
iny DC offset
>> >> >>> * fixed: length update in library-generated WAV headers on big-en=
dian machines
>> >> >>> * fixed: sanitize custom extensions read from WavPack files to be=
 alphanumeric
>> >> >>> * added: accepting brace-delimited options in the wavpack executa=
ble filename
>> >> >>> * added: "--drop" option to Windows executables for multi-file "d=
rag-and-drop"
>> >> >>> * added" "--raw-pcm" option to wvunpack executable (does DSD --> =
24-bit PCM)
>> >> >>> * added: "--no-overwrite" option to wavpack executable (to resume=
 sessions)
>> >> >>> * improved: build system clean-up including switch to non-recursi=
ve "make"
>> >> >>> * fixed: potential security issue CVE-2020-35738
>> >> >>> * fixed: disable A32 asm code when building for Apple silicon
>> >> >>> * fixed: issues with Adobe-style floating-point WAV files
>> >> >>> * added: -vv option to wvunpack to quickly verify using just
>> >> >>>      block checksums (ideal for detecting corrupted files)
>> >> >>> * added: --normalize-floats option to wvunpack for correctly
>> >> >>>      exporting un-normalized floating-point files
>> >> >>> * updated: Visual Studio 2019 for Windows builds
>> >> >>> * dropped: WinXP support in official binaries
>> >> >>> * fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448
>> >> >>>       (no CVEs or vulnerabilities)
>> >> >>> * fixed: trailing garbage characters on imported ID3v2 TXXX tags
>> >> >>> * fixed: various minor undefined behavior and memory access issue=
s
>> >> >>> * fixed: sanitize tag extraction names for length and path inclus=
ion
>> >> >>> * improved: reformat wvunpack "help" and split into long + short =
versions
>> >> >>> * added: regression testing to Travis CI for OSS-Fuzz crashers
>> >> >>> * fixed: potential security issues including the following CVEs:
>> >> >>>      CVE-2018-19840 CVE-2018-19841 CVE-2018-10536
>> >> >>>      CVE-2018-10537 CVE-2018-10538 CVE-2018-10539
>> >> >>>      CVE-2018-10540 CVE-2018-7254  CVE-2018-7253
>> >> >>>      CVE-2018-6767
>> >> >>> * added: support for CMake, Travis CI, and Google's OSS-fuzz
>> >> >>> * fixed: use correction file for encode verify (pipe input, Windo=
ws)
>> >> >>> * fixed: correct WAV header with actual length (pipe input, -i op=
tion)
>> >> >>> * fixed: thumb interworking and not needing v6 architecture (ARM =
asm)
>> >> >>> * added: handle more ID3v2.3 tag items and from all file types
>> >> >>> * fixed: coredump on Sparc64 (changed MD5 implementation)
>> >> >>> * fixed: handle invalid ID3v2.3 tags from sacd-ripper
>> >> >>> * fixed: several corner-case memory leaks
>> >> >>>
>> >> >>> Signed-off-by: alperak <alperyasinak1@gmail.com>
>> >> >>> ---
>> >> >>>  .../wavpack/{wavpack_5.1.0.bb =3D> wavpack_5.6.0.bb}          | =
6 +++---
>> >> >>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> >> >>>  rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.1.0.bb =3D>=
 wavpack_5.6.0.bb} (63%)
>> >> >>>
>> >> >>> diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb =
b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
>> >> >>> similarity index 63%
>> >> >>> rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
>> >> >>> rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
>> >> >>> index 909612393..80671896c 100644
>> >> >>> --- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
>> >> >>> +++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
>> >> >>> @@ -1,9 +1,9 @@
>> >> >>>  DESCRIPTION =3D "WavPack is a completely open audio compression =
format providing lossless, high-quality lossy, and a unique hybrid compress=
ion mode."
>> >> >>>  LICENSE =3D "BSD-3-Clause"
>> >> >>> -LIC_FILES_CHKSUM =3D "file://license.txt;md5=3D8c1a910e5c2a8b30e=
c8ffb2ffa63d9b2"
>> >> >>> +LIC_FILES_CHKSUM =3D "file://license.txt;md5=3Dbb5d037e3ad41a3c8=
4c9f2d8bb65a7b4"
>> >> >>>
>> >> >>>  SRC_URI =3D "git://github.com/dbry/WavPack.git;branch=3Dmaster;p=
rotocol=3Dhttps"
>> >> >>> -SRCREV =3D "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
>> >> >>> +SRCREV =3D "e03e8e29dc618e08e7baba9636e57ba1254874ce"
>> >> >>>  S =3D "${WORKDIR}/git"
>> >> >>>
>> >> >>> -inherit autotools lib_package
>> >> >>> +inherit cmake pkgconfig
>> >> >>> --
>> >> >>> 2.25.1
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>
>> >> >>
>> >> >>
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#107751): https://lists.openembedded.org/g/openembe=
dded-devel/message/107751
>> > Mute This Topic: https://lists.openembedded.org/mt/103277174/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

