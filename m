Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CD1C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 12:06:59 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.50025.1703160417034104655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 04:06:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bZMLRWmq;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3368ae75082so237225f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 04:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703160415; x=1703765215; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QG6PtOJshNDW2WcK9qEoTC9aH06WSXTCswPgmu8T21c=;
        b=bZMLRWmqX1FWzBQiBiyTiT5i11VvZofNENofOcuL3ffrnFA30AMbH2x8NNz19rpi5i
         RWhnI8NgupcyuBbJ9kCHAy7c+eR0gE58BPU5+BGePK8He2GiYovw3wLNbudzbrK9LSwJ
         WOoCF4441nzxROYJrSGhGjZbtHlEo//AFP4JGqAsxquGo7bj4x1xJm7GsNkb9MhW2zt8
         0t2+2MeF3Wtv0bBKZdhTYajKGPsHaE9C0/5Y9hv/IypegpRwnUEA5kUPmmfDRNtdEsRa
         VI+5GNnx2TFJ1idN3dAblWKY+qDUW/4J+dRR2+EnU6MrIcBpiXY7KQh4TFEaJCBHgD0Q
         vNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703160415; x=1703765215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QG6PtOJshNDW2WcK9qEoTC9aH06WSXTCswPgmu8T21c=;
        b=tn/vXZS92aSjpyD0IJylGL/a2r/vqPO0v45bA/9LfFXgSr+7PW1leShsB7QwKVZMJW
         rPCmmk2z7xsp1CymvjrfmLJotfqpJ21C1K1on7xbadUf3MX04KuCWGyaRgPkQrlTWARs
         Sgr91tc+U4Es0JF9k0psZ9R5eXAFSC6w5otG3Qxp2ivB7I3/LFpKClVWpIr4XPSfSDTB
         9jTfgaTCu+dNgkUIkC7GKWznnT8KvtdD0xN/3ZxQg/2DH9VEBOdbnpG83Ilewd11Jx8U
         KP5RPkdydUL6GRCPz26HBcl+ZtJ1XnFLreg8gLQU1/xhugrPRCbSdJBLhToOZZlji3p+
         1OzQ==
X-Gm-Message-State: AOJu0Yyvroz8IJviKPI/GrSTxi68nZ0SOcv3eVjGWw4toV2LDtA7ylNA
	aOHIj2evqokPZ0ft+49H+O9ZfzDAsZkhiQ/phNA=
X-Google-Smtp-Source: AGHT+IFy1u65hoETWuaqq6EHrb7YV7+FAhXJNbj2UQ9GFcc2c9DIYB+kJJtVbnxSy5OSmUvovatB05Fi5CpF0joDZrM=
X-Received: by 2002:a7b:ca5a:0:b0:40d:4051:24cf with SMTP id
 m26-20020a7bca5a000000b0040d405124cfmr313561wml.102.1703160414819; Thu, 21
 Dec 2023 04:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20231220062530.21888-1-alperyasinak1@gmail.com>
In-Reply-To: <20231220062530.21888-1-alperyasinak1@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Dec 2023 13:06:43 +0100
Message-ID: <CA+chaQcCy_UkwOJoZHAEqCOcWCa7Se2ZhoOC4s=gc+Yi5ovRJw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wavpack: upgrade 5.1.0 -> 5.6.0
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000855b16060d03efcf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 12:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107708

--000000000000855b16060d03efcf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

it seems to be trying to link with native libcrypto in some builds:

lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: file not
recognized: file format not recognized
collect2: error: ld returned 1 exit status

have you tried to build it e.g. for aarch64 or arm on x86_64 build host?

On Wed, Dec 20, 2023 at 7:25=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> =
wrote:

> License-Update: Copyright year changes
>
> Changelog:
>
> * added: AIFF file import/export support
> * added: WATCOM compiler and OS/2 support
> * added: cmake support for mingw, builds Cooledit + Winamp plugins
> * added: --force-even-byte-depth option for rounding up bit depths
> * fixed: detect and report PCM files having non-zero padding bits
> * fixed: possible crash when displaying long channel assignments
> * fixed: big-endian-sourced "raw" files gave big-endian "wav"s
> * fixed: numerous minor issues
> * fixed: CVE-2021-44269 (encoding crafted DSD file triggers OOB read cras=
h)
> * fixed: very long filenames cause stack-overflow crash in all CLI progra=
ms
> * fixed: the length stored in WAV headers not always corrected when using
> -i
> * fixed: attempting to encode raw DSD audio from stdin sometimes causes
> crash
> * fixed: DSD to PCM decimation: small clicks between tracks and tiny DC
> offset
> * fixed: length update in library-generated WAV headers on big-endian
> machines
> * fixed: sanitize custom extensions read from WavPack files to be
> alphanumeric
> * added: accepting brace-delimited options in the wavpack executable
> filename
> * added: "--drop" option to Windows executables for multi-file
> "drag-and-drop"
> * added" "--raw-pcm" option to wvunpack executable (does DSD --> 24-bit
> PCM)
> * added: "--no-overwrite" option to wavpack executable (to resume session=
s)
> * improved: build system clean-up including switch to non-recursive "make=
"
> * fixed: potential security issue CVE-2020-35738
> * fixed: disable A32 asm code when building for Apple silicon
> * fixed: issues with Adobe-style floating-point WAV files
> * added: -vv option to wvunpack to quickly verify using just
>      block checksums (ideal for detecting corrupted files)
> * added: --normalize-floats option to wvunpack for correctly
>      exporting un-normalized floating-point files
> * updated: Visual Studio 2019 for Windows builds
> * dropped: WinXP support in official binaries
> * fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448
>       (no CVEs or vulnerabilities)
> * fixed: trailing garbage characters on imported ID3v2 TXXX tags
> * fixed: various minor undefined behavior and memory access issues
> * fixed: sanitize tag extraction names for length and path inclusion
> * improved: reformat wvunpack "help" and split into long + short versions
> * added: regression testing to Travis CI for OSS-Fuzz crashers
> * fixed: potential security issues including the following CVEs:
>      CVE-2018-19840 CVE-2018-19841 CVE-2018-10536
>      CVE-2018-10537 CVE-2018-10538 CVE-2018-10539
>      CVE-2018-10540 CVE-2018-7254  CVE-2018-7253
>      CVE-2018-6767
> * added: support for CMake, Travis CI, and Google's OSS-fuzz
> * fixed: use correction file for encode verify (pipe input, Windows)
> * fixed: correct WAV header with actual length (pipe input, -i option)
> * fixed: thumb interworking and not needing v6 architecture (ARM asm)
> * added: handle more ID3v2.3 tag items and from all file types
> * fixed: coredump on Sparc64 (changed MD5 implementation)
> * fixed: handle invalid ID3v2.3 tags from sacd-ripper
> * fixed: several corner-case memory leaks
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../wavpack/{wavpack_5.1.0.bb =3D> wavpack_5.6.0.bb}          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.1.0.bb =3D>
> wavpack_5.6.0.bb} (63%)
>
> diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
> b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> similarity index 63%
> rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
> rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> index 909612393..80671896c 100644
> --- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
> +++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> @@ -1,9 +1,9 @@
>  DESCRIPTION =3D "WavPack is a completely open audio compression format
> providing lossless, high-quality lossy, and a unique hybrid compression
> mode."
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D
> "file://license.txt;md5=3D8c1a910e5c2a8b30ec8ffb2ffa63d9b2"
> +LIC_FILES_CHKSUM =3D
> "file://license.txt;md5=3Dbb5d037e3ad41a3c84c9f2d8bb65a7b4"
>
>  SRC_URI =3D "git://github.com/dbry/WavPack.git;branch=3Dmaster;protocol=
=3Dhttps
> "
> -SRCREV =3D "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
> +SRCREV =3D "e03e8e29dc618e08e7baba9636e57ba1254874ce"
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools lib_package
> +inherit cmake pkgconfig
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107643):
> https://lists.openembedded.org/g/openembedded-devel/message/107643
> Mute This Topic: https://lists.openembedded.org/mt/103277174/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000855b16060d03efcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>it seems to be trying to link with =
native libcrypto in some builds:</div><div><br></div><div>lib32-wavpack/5.6=
.0/recipe-sysroot-native/usr/lib/libcrypto.so: file not recognized: file fo=
rmat not recognized<br>collect2: error: ld returned 1 exit status<br></div>=
<div><br></div><div>have you tried to build it e.g. for aarch64 or arm on x=
86_64 build host?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Dec 20, 2023 at 7:25=E2=80=AFAM Alper Ak &lt=
;<a href=3D"mailto:alperyasinak1@gmail.com">alperyasinak1@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">License-=
Update: Copyright year changes<br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107643): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107643" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107643</a><br>
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

--000000000000855b16060d03efcf--

