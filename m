Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B12C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:11:40 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.52085.1703167899400713828
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dxQBsy4Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d4006b251aso7410995ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 06:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703167899; x=1703772699; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNTr43BnarFoK1z7+1EO/sJ4q0pC8RVSwc7buec8XVw=;
        b=dxQBsy4YhfOoeBFqkS1xiDRXvlbnxSpIV6Yifc029v2tFFfBn/c2d2ZVmPQsIMXgF9
         mxPXy78U3cnd8+/iN8PaPy72w7AdS/I7fzEADiQF++7qF577mw+Su5dkav5kQEry300D
         8QJdIDNMB/3Pgv81jEHoc353X1D6BmTlSjqHRO63VFh+DpWzJ9Pajg0aQid/l3EUJ69d
         0An4HVvATjEVb4qdM8EJ7mnsgr+YA645ltGiS/Rcx3RbFjf58NQ+q+epaIdmI2pJbg39
         yRWyc4DTpT6CBIBZVNqxS4V1cSd0nG37Pg9VQHs2OMb8X6BV1f90nlkxxtUQ7LKgloUm
         GvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703167899; x=1703772699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNTr43BnarFoK1z7+1EO/sJ4q0pC8RVSwc7buec8XVw=;
        b=VKp97MoSPIIdss+mc+Tu2N6ZhPffvSUh7eJEjJWXvJBMkkUSKyfda1LOl7D0STkFhv
         bolRE6SS8WngcQBF3vmo+hsnEBrMoCb3mN4/jnlykYCB6xTagV0vXWh4H8QqnIa9X8Ns
         EdiCoYM8PnxS9dtzeHtxrO3y2/jWsHmCEYkKN2F1zp+sy1fKKeV9CVGCn7HpKYxVfirN
         ieEpL8COqxiNCrdSbNYuOsaM3zfnZTIypjV9qgSwFYxQCv9Q6Bb12p3iSEo3iI0djROQ
         H1K5JNEplWPfuROQTobIhzmhcWfRdz1wswjM9FLWgIkYi0Nj8d8QtrkCM52GO+KNZzIf
         3Tjg==
X-Gm-Message-State: AOJu0Yws93cVAHEWqFy6tbBt4555V5vycS//uF87ncsm7COLIfaXx7dg
	m6O86LZuQBP48YC9M8JOCtPIJXnMcZ7pUJqn5Jo=
X-Google-Smtp-Source: AGHT+IE6nNPLHmeWpSdpJpPZsNPpqfXPB0Dy6zC/Dq+zXYacBF9fhh9zcvq0o0d8ZtReOu9VYomVDs6qO401jcvScgg=
X-Received: by 2002:a17:903:13c7:b0:1d4:829:fede with SMTP id
 kd7-20020a17090313c700b001d40829fedemr1191914plb.125.1703167898639; Thu, 21
 Dec 2023 06:11:38 -0800 (PST)
MIME-Version: 1.0
References: <20231220062530.21888-1-alperyasinak1@gmail.com>
 <17A2D7603CB3C41A.24485@lists.openembedded.org> <CA+chaQeFh+4gYgjvc62Z5O61Y3xWv859G7BGf_-0UU60EjrGvA@mail.gmail.com>
In-Reply-To: <CA+chaQeFh+4gYgjvc62Z5O61Y3xWv859G7BGf_-0UU60EjrGvA@mail.gmail.com>
From: alper ak <alperyasinak1@gmail.com>
Date: Thu, 21 Dec 2023 17:11:27 +0300
Message-ID: <CAGpma=57tR6-Fh63iBkiP_p-sMzaYDc_ciH7KPH+Z13BUnCMAw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wavpack: upgrade 5.1.0 -> 5.6.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 14:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107713

Added openssl as a depends and sent v2 patch, thank you.

Martin Jansa <martin.jansa@gmail.com>, 21 Ara 2023 Per, 15:30
tarihinde =C5=9Funu yazd=C4=B1:
>
> Adding the dependency on target openssl allows the build to finish OK.
>
> On Thu, Dec 21, 2023 at 1:06=E2=80=AFPM Martin Jansa via lists.openembedd=
ed.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Hi,
>>
>> it seems to be trying to link with native libcrypto in some builds:
>>
>> lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: file not=
 recognized: file format not recognized
>> collect2: error: ld returned 1 exit status
>>
>> have you tried to build it e.g. for aarch64 or arm on x86_64 build host?
>>
>> On Wed, Dec 20, 2023 at 7:25=E2=80=AFAM Alper Ak <alperyasinak1@gmail.co=
m> wrote:
>>>
>>> License-Update: Copyright year changes
>>>
>>> Changelog:
>>>
>>> * added: AIFF file import/export support
>>> * added: WATCOM compiler and OS/2 support
>>> * added: cmake support for mingw, builds Cooledit + Winamp plugins
>>> * added: --force-even-byte-depth option for rounding up bit depths
>>> * fixed: detect and report PCM files having non-zero padding bits
>>> * fixed: possible crash when displaying long channel assignments
>>> * fixed: big-endian-sourced "raw" files gave big-endian "wav"s
>>> * fixed: numerous minor issues
>>> * fixed: CVE-2021-44269 (encoding crafted DSD file triggers OOB read cr=
ash)
>>> * fixed: very long filenames cause stack-overflow crash in all CLI prog=
rams
>>> * fixed: the length stored in WAV headers not always corrected when usi=
ng -i
>>> * fixed: attempting to encode raw DSD audio from stdin sometimes causes=
 crash
>>> * fixed: DSD to PCM decimation: small clicks between tracks and tiny DC=
 offset
>>> * fixed: length update in library-generated WAV headers on big-endian m=
achines
>>> * fixed: sanitize custom extensions read from WavPack files to be alpha=
numeric
>>> * added: accepting brace-delimited options in the wavpack executable fi=
lename
>>> * added: "--drop" option to Windows executables for multi-file "drag-an=
d-drop"
>>> * added" "--raw-pcm" option to wvunpack executable (does DSD --> 24-bit=
 PCM)
>>> * added: "--no-overwrite" option to wavpack executable (to resume sessi=
ons)
>>> * improved: build system clean-up including switch to non-recursive "ma=
ke"
>>> * fixed: potential security issue CVE-2020-35738
>>> * fixed: disable A32 asm code when building for Apple silicon
>>> * fixed: issues with Adobe-style floating-point WAV files
>>> * added: -vv option to wvunpack to quickly verify using just
>>>      block checksums (ideal for detecting corrupted files)
>>> * added: --normalize-floats option to wvunpack for correctly
>>>      exporting un-normalized floating-point files
>>> * updated: Visual Studio 2019 for Windows builds
>>> * dropped: WinXP support in official binaries
>>> * fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448
>>>       (no CVEs or vulnerabilities)
>>> * fixed: trailing garbage characters on imported ID3v2 TXXX tags
>>> * fixed: various minor undefined behavior and memory access issues
>>> * fixed: sanitize tag extraction names for length and path inclusion
>>> * improved: reformat wvunpack "help" and split into long + short versio=
ns
>>> * added: regression testing to Travis CI for OSS-Fuzz crashers
>>> * fixed: potential security issues including the following CVEs:
>>>      CVE-2018-19840 CVE-2018-19841 CVE-2018-10536
>>>      CVE-2018-10537 CVE-2018-10538 CVE-2018-10539
>>>      CVE-2018-10540 CVE-2018-7254  CVE-2018-7253
>>>      CVE-2018-6767
>>> * added: support for CMake, Travis CI, and Google's OSS-fuzz
>>> * fixed: use correction file for encode verify (pipe input, Windows)
>>> * fixed: correct WAV header with actual length (pipe input, -i option)
>>> * fixed: thumb interworking and not needing v6 architecture (ARM asm)
>>> * added: handle more ID3v2.3 tag items and from all file types
>>> * fixed: coredump on Sparc64 (changed MD5 implementation)
>>> * fixed: handle invalid ID3v2.3 tags from sacd-ripper
>>> * fixed: several corner-case memory leaks
>>>
>>> Signed-off-by: alperak <alperyasinak1@gmail.com>
>>> ---
>>>  .../wavpack/{wavpack_5.1.0.bb =3D> wavpack_5.6.0.bb}          | 6 +++-=
--
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>  rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.1.0.bb =3D> wavpa=
ck_5.6.0.bb} (63%)
>>>
>>> diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb b/meta=
-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
>>> similarity index 63%
>>> rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
>>> rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
>>> index 909612393..80671896c 100644
>>> --- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
>>> +++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
>>> @@ -1,9 +1,9 @@
>>>  DESCRIPTION =3D "WavPack is a completely open audio compression format=
 providing lossless, high-quality lossy, and a unique hybrid compression mo=
de."
>>>  LICENSE =3D "BSD-3-Clause"
>>> -LIC_FILES_CHKSUM =3D "file://license.txt;md5=3D8c1a910e5c2a8b30ec8ffb2=
ffa63d9b2"
>>> +LIC_FILES_CHKSUM =3D "file://license.txt;md5=3Dbb5d037e3ad41a3c84c9f2d=
8bb65a7b4"
>>>
>>>  SRC_URI =3D "git://github.com/dbry/WavPack.git;branch=3Dmaster;protoco=
l=3Dhttps"
>>> -SRCREV =3D "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
>>> +SRCREV =3D "e03e8e29dc618e08e7baba9636e57ba1254874ce"
>>>  S =3D "${WORKDIR}/git"
>>>
>>> -inherit autotools lib_package
>>> +inherit cmake pkgconfig
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107708): https://lists.openembedded.org/g/openembedd=
ed-devel/message/107708
>> Mute This Topic: https://lists.openembedded.org/mt/103277174/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

