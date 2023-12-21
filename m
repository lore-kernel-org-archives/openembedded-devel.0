Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F93C46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 12:30:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.50348.1703161835333642366
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 04:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyM9IaIX;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-336746c7b6dso567084f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 04:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703161833; x=1703766633; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=By6G403Uv3+u2SDIJg1vf27v1ezSZM86fvv9jkQFmEM=;
        b=gyM9IaIX3LMjy0IqhhCGL5YyOMygg9cumjqyOlhsCAp55nXjKAVV2DNnYWA8mY66lF
         USKhEdRomwGbU6ypiB2q4HCcR82Cmjy3tOxaBqvuAfnKzbndqwmaJZPcejTEDqINo8pQ
         3iUbU8vz6Is3IXQt5BWRwNvJt2eyvMdV2wsK2/n+M3IuuQ6OEF3UuzanmOZq3u8J28Id
         M3mTk6XmFyq7CpjTpqwaHNk+3jR/SVj2nG+zM9RmucNXfOGe+j1oNajvn2yjZecoXY+5
         DY7T3TWcrK9uTVlKZENB/GRvsq2hts2nXteTKVGrko9m5xUWZh4DVELNHVn80XZYAQe7
         vCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703161833; x=1703766633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=By6G403Uv3+u2SDIJg1vf27v1ezSZM86fvv9jkQFmEM=;
        b=kxszrwb4guNJ/DDo2MH//HJPoE+CgRIdMaTKBH7lqfj1lGxcBEUY9cMEu9hLvUrvyh
         HjM8EfeMOiQMrYpkoOHAyR91tGv4uYcV1PsmBfYvq+HFEBJthLnHYYzS4Zm1KebQvCdJ
         N+n4TrK+kxx9SjC1XyMTV2Q+1jic+osIA93UzrAWKwP+86tqKCTZob4SPRiF/aoGQbig
         SN9rRRt6V/DSpf+CG8zwgLTJHlb/05YHERkzhXYw0ubSZqF4gSbAR5kTZZJLoTvdiGK5
         b+WzdAkFTgT6uVox+zCecFFoLc4gH/fOx1N4apPdSQyfnIh0GgW4vwtjpOpSDGIlzHpe
         OtHw==
X-Gm-Message-State: AOJu0YxEpQbBVAr+4iIMsn7by7pS5ywVWwR4zdxq1pQu6VDSh88s9Iv3
	qXgvXghWI8xZGcmY4g5iPL78EgejKqgs6Ovd4rE=
X-Google-Smtp-Source: AGHT+IGgHW2wHDDUs58vIRzuM/Mfq5n39NYX9sgC7GrnJ604+yU6xOMMqc2aSmGZupFDtaW4e5/dgv7KaTtJ/M/lYBk=
X-Received: by 2002:adf:f68a:0:b0:336:75e5:c6d6 with SMTP id
 v10-20020adff68a000000b0033675e5c6d6mr640743wrp.68.1703161833324; Thu, 21 Dec
 2023 04:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20231220062530.21888-1-alperyasinak1@gmail.com> <17A2D7603CB3C41A.24485@lists.openembedded.org>
In-Reply-To: <17A2D7603CB3C41A.24485@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Dec 2023 13:30:21 +0100
Message-ID: <CA+chaQeFh+4gYgjvc62Z5O61Y3xWv859G7BGf_-0UU60EjrGvA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wavpack: upgrade 5.1.0 -> 5.6.0
To: martin.jansa@gmail.com
Cc: Alper Ak <alperyasinak1@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000012051b060d0444bd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 12:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107711

--00000000000012051b060d0444bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding the dependency on target openssl allows the build to finish OK.

On Thu, Dec 21, 2023 at 1:06=E2=80=AFPM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Hi,
>
> it seems to be trying to link with native libcrypto in some builds:
>
> lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: file not
> recognized: file format not recognized
> collect2: error: ld returned 1 exit status
>
> have you tried to build it e.g. for aarch64 or arm on x86_64 build host?
>
> On Wed, Dec 20, 2023 at 7:25=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com=
> wrote:
>
>> License-Update: Copyright year changes
>>
>> Changelog:
>>
>> * added: AIFF file import/export support
>> * added: WATCOM compiler and OS/2 support
>> * added: cmake support for mingw, builds Cooledit + Winamp plugins
>> * added: --force-even-byte-depth option for rounding up bit depths
>> * fixed: detect and report PCM files having non-zero padding bits
>> * fixed: possible crash when displaying long channel assignments
>> * fixed: big-endian-sourced "raw" files gave big-endian "wav"s
>> * fixed: numerous minor issues
>> * fixed: CVE-2021-44269 (encoding crafted DSD file triggers OOB read
>> crash)
>> * fixed: very long filenames cause stack-overflow crash in all CLI
>> programs
>> * fixed: the length stored in WAV headers not always corrected when usin=
g
>> -i
>> * fixed: attempting to encode raw DSD audio from stdin sometimes causes
>> crash
>> * fixed: DSD to PCM decimation: small clicks between tracks and tiny DC
>> offset
>> * fixed: length update in library-generated WAV headers on big-endian
>> machines
>> * fixed: sanitize custom extensions read from WavPack files to be
>> alphanumeric
>> * added: accepting brace-delimited options in the wavpack executable
>> filename
>> * added: "--drop" option to Windows executables for multi-file
>> "drag-and-drop"
>> * added" "--raw-pcm" option to wvunpack executable (does DSD --> 24-bit
>> PCM)
>> * added: "--no-overwrite" option to wavpack executable (to resume
>> sessions)
>> * improved: build system clean-up including switch to non-recursive "mak=
e"
>> * fixed: potential security issue CVE-2020-35738
>> * fixed: disable A32 asm code when building for Apple silicon
>> * fixed: issues with Adobe-style floating-point WAV files
>> * added: -vv option to wvunpack to quickly verify using just
>>      block checksums (ideal for detecting corrupted files)
>> * added: --normalize-floats option to wvunpack for correctly
>>      exporting un-normalized floating-point files
>> * updated: Visual Studio 2019 for Windows builds
>> * dropped: WinXP support in official binaries
>> * fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448
>>       (no CVEs or vulnerabilities)
>> * fixed: trailing garbage characters on imported ID3v2 TXXX tags
>> * fixed: various minor undefined behavior and memory access issues
>> * fixed: sanitize tag extraction names for length and path inclusion
>> * improved: reformat wvunpack "help" and split into long + short version=
s
>> * added: regression testing to Travis CI for OSS-Fuzz crashers
>> * fixed: potential security issues including the following CVEs:
>>      CVE-2018-19840 CVE-2018-19841 CVE-2018-10536
>>      CVE-2018-10537 CVE-2018-10538 CVE-2018-10539
>>      CVE-2018-10540 CVE-2018-7254  CVE-2018-7253
>>      CVE-2018-6767
>> * added: support for CMake, Travis CI, and Google's OSS-fuzz
>> * fixed: use correction file for encode verify (pipe input, Windows)
>> * fixed: correct WAV header with actual length (pipe input, -i option)
>> * fixed: thumb interworking and not needing v6 architecture (ARM asm)
>> * added: handle more ID3v2.3 tag items and from all file types
>> * fixed: coredump on Sparc64 (changed MD5 implementation)
>> * fixed: handle invalid ID3v2.3 tags from sacd-ripper
>> * fixed: several corner-case memory leaks
>>
>> Signed-off-by: alperak <alperyasinak1@gmail.com>
>> ---
>>  .../wavpack/{wavpack_5.1.0.bb =3D> wavpack_5.6.0.bb}          | 6 +++--=
-
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>  rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.1.0.bb =3D>
>> wavpack_5.6.0.bb} (63%)
>>
>> diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
>> b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
>> similarity index 63%
>> rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
>> rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
>> index 909612393..80671896c 100644
>> --- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
>> +++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
>> @@ -1,9 +1,9 @@
>>  DESCRIPTION =3D "WavPack is a completely open audio compression format
>> providing lossless, high-quality lossy, and a unique hybrid compression
>> mode."
>>  LICENSE =3D "BSD-3-Clause"
>> -LIC_FILES_CHKSUM =3D
>> "file://license.txt;md5=3D8c1a910e5c2a8b30ec8ffb2ffa63d9b2"
>> +LIC_FILES_CHKSUM =3D
>> "file://license.txt;md5=3Dbb5d037e3ad41a3c84c9f2d8bb65a7b4"
>>
>>  SRC_URI =3D "git://
>> github.com/dbry/WavPack.git;branch=3Dmaster;protocol=3Dhttps"
>> -SRCREV =3D "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
>> +SRCREV =3D "e03e8e29dc618e08e7baba9636e57ba1254874ce"
>>  S =3D "${WORKDIR}/git"
>>
>> -inherit autotools lib_package
>> +inherit cmake pkgconfig
>> --
>> 2.25.1
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107708):
> https://lists.openembedded.org/g/openembedded-devel/message/107708
> Mute This Topic: https://lists.openembedded.org/mt/103277174/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000012051b060d0444bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Adding the dependency on target openssl allows the build t=
o finish OK.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Dec 21, 2023 at 1:06=E2=80=AFPM Martin Jansa via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;martin.j=
ansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>it seems to be tryi=
ng to link with native libcrypto in some builds:</div><div><br></div><div>l=
ib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: file not rec=
ognized: file format not recognized<br>collect2: error: ld returned 1 exit =
status<br></div><div><br></div><div>have you tried to build it e.g. for aar=
ch64 or arm on x86_64 build host?</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 20, 2023 at 7:25=E2=80=
=AFAM Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" target=3D"_bl=
ank">alperyasinak1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">License-Update: Copyright year changes<br>
<br>
Changelog:<br>
<br>
* added: AIFF file import/export support<br>
* added: WATCOM compiler and OS/2 support<br>
* added: cmake support for mingw, builds Cooledit + Winamp plugins<br>
* added: --force-even-byte-depth option for rounding up bit depths<br>
* fixed: detect and report PCM files having non-zero padding bits<br>
* fixed: possible crash when displaying long channel assignments<br>
* fixed: big-endian-sourced &quot;raw&quot; files gave big-endian &quot;wav=
&quot;s<br>
* fixed: numerous minor issues<br>
* fixed: CVE-2021-44269 (encoding crafted DSD file triggers OOB read crash)=
<br>
* fixed: very long filenames cause stack-overflow crash in all CLI programs=
<br>
* fixed: the length stored in WAV headers not always corrected when using -=
i<br>
* fixed: attempting to encode raw DSD audio from stdin sometimes causes cra=
sh<br>
* fixed: DSD to PCM decimation: small clicks between tracks and tiny DC off=
set<br>
* fixed: length update in library-generated WAV headers on big-endian machi=
nes<br>
* fixed: sanitize custom extensions read from WavPack files to be alphanume=
ric<br>
* added: accepting brace-delimited options in the wavpack executable filena=
me<br>
* added: &quot;--drop&quot; option to Windows executables for multi-file &q=
uot;drag-and-drop&quot;<br>
* added&quot; &quot;--raw-pcm&quot; option to wvunpack executable (does DSD=
 --&gt; 24-bit PCM)<br>
* added: &quot;--no-overwrite&quot; option to wavpack executable (to resume=
 sessions)<br>
* improved: build system clean-up including switch to non-recursive &quot;m=
ake&quot;<br>
* fixed: potential security issue CVE-2020-35738<br>
* fixed: disable A32 asm code when building for Apple silicon<br>
* fixed: issues with Adobe-style floating-point WAV files<br>
* added: -vv option to wvunpack to quickly verify using just<br>
=C2=A0 =C2=A0 =C2=A0block checksums (ideal for detecting corrupted files)<b=
r>
* added: --normalize-floats option to wvunpack for correctly<br>
=C2=A0 =C2=A0 =C2=A0exporting un-normalized floating-point files<br>
* updated: Visual Studio 2019 for Windows builds<br>
* dropped: WinXP support in official binaries<br>
* fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448<br>
=C2=A0 =C2=A0 =C2=A0 (no CVEs or vulnerabilities)<br>
* fixed: trailing garbage characters on imported ID3v2 TXXX tags<br>
* fixed: various minor undefined behavior and memory access issues<br>
* fixed: sanitize tag extraction names for length and path inclusion<br>
* improved: reformat wvunpack &quot;help&quot; and split into long + short =
versions<br>
* added: regression testing to Travis CI for OSS-Fuzz crashers<br>
* fixed: potential security issues including the following CVEs:<br>
=C2=A0 =C2=A0 =C2=A0CVE-2018-19840 CVE-2018-19841 CVE-2018-10536<br>
=C2=A0 =C2=A0 =C2=A0CVE-2018-10537 CVE-2018-10538 CVE-2018-10539<br>
=C2=A0 =C2=A0 =C2=A0CVE-2018-10540 CVE-2018-7254=C2=A0 CVE-2018-7253<br>
=C2=A0 =C2=A0 =C2=A0CVE-2018-6767<br>
* added: support for CMake, Travis CI, and Google&#39;s OSS-fuzz<br>
* fixed: use correction file for encode verify (pipe input, Windows)<br>
* fixed: correct WAV header with actual length (pipe input, -i option)<br>
* fixed: thumb interworking and not needing v6 architecture (ARM asm)<br>
* added: handle more ID3v2.3 tag items and from all file types<br>
* fixed: coredump on Sparc64 (changed MD5 implementation)<br>
* fixed: handle invalid ID3v2.3 tags from sacd-ripper<br>
* fixed: several corner-case memory leaks<br>
<br>
Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targe=
t=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../wavpack/{<a href=3D"http://wavpack_5.1.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">wavpack_5.1.0.bb</a> =3D&gt; <a href=3D"http://wavpack_5.6=
.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-oe/recipes-multimedia/wavpack/{<a href=3D"http://wavpack_=
5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.bb</a> =3D&gt;=
 <a href=3D"http://wavpack_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">w=
avpack_5.6.0.bb</a>} (63%)<br>
<br>
diff --git a/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.bb</a> b/meta-o=
e/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">wavpack_5.6.0.bb</a><br>
similarity index 63%<br>
rename from meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.bb</a><br>
rename to meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.6.=
0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a><br>
index 909612393..80671896c 100644<br>
--- a/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">wavpack_5.1.0.bb</a><br>
+++ b/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.6.0.bb=
" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a><br>
@@ -1,9 +1,9 @@<br>
=C2=A0DESCRIPTION =3D &quot;WavPack is a completely open audio compression =
format providing lossless, high-quality lossy, and a unique hybrid compress=
ion mode.&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://license.txt;md5=3D8c1a910e5c2a8b30ec8ffb=
2ffa63d9b2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://license.txt;md5=3Dbb5d037e3ad41a3c84c9f2=
d8bb65a7b4&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/dbry/WavPack.git=
;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/dbry/WavPack.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
-SRCREV =3D &quot;9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2&quot;<br>
+SRCREV =3D &quot;e03e8e29dc618e08e7baba9636e57ba1254874ce&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-inherit autotools lib_package<br>
+inherit cmake pkgconfig<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107708): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107708" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107708</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103277174/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103277174/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000012051b060d0444bd--

