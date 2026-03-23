Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBDAF483ED
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 20:00:48 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4245.1774296039010759484
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 13:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MxtdgLCM;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d744d9acbeso1262463a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 13:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774296038; cv=none;
        d=google.com; s=arc-20240605;
        b=Gv31YtJEnQ5xfR7iZW0NQifuJF7/qzOEErBlug6+1jQeYNkhwskpzlLmBx44N4hjN+
         412gmiGE8bkZmuoVOvt4/1/O8wl2El2hynSpBJD3Vgpc0Dhn32MaYxaBWlj93Hf7asLq
         ZTldA574hWJIx5/Wv3eGu4Om5dlijmBcKbocG+7Hccf/FcoCjbvgaXgtEdGiiGUqkZ4I
         fwrsngU3AgvxeFJWwuXXPVazHxQF7Y+QVlbh6nuRypYlMpfNWAr6yqaBGO9qXZu5UKEr
         AUFVPxsDDg2VTwFFBMpxgHHFTHY2lRsiP4yaHFKoNuAYaIEo+SMBjI5YtZMCvDbXqb5w
         FHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qQ8copWglYcnUema9iBAEOcgIflx/g44hA8TLhWW+AM=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=RrrCQkqEb11kpsPx9WOZfUyqV1hr4QviK4qy87OBMeLXi0TDMXRIsnEPHYXaDrHVtD
         jvPlZ9WVC+ACwDestsk9enKmH4wYO31mA8HrnhPaS+j1IuKVrnsFZGbJfo6fh4nEV6qD
         OAR0uMx2JI6i1xT3b0B22j/M7ImxzUUJSxp0hJTFg0Co7UvLnEcDQCNrno0XhJ4Qac3J
         jRXgFiorVfCfC6GlEEMqvBo9JCTSIfa+yqNICBNMcSuFSGMlMpHQ1kKJTw01RrBcr/uB
         D1n6eYY3/AbcGX1I+CxomnUZAA0ZMZC5HIibqr5Ne0db2USjKjR0PlKm5xuGO7nEkJhm
         NO0w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774296038; x=1774900838; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQ8copWglYcnUema9iBAEOcgIflx/g44hA8TLhWW+AM=;
        b=MxtdgLCMGFaIt54601FAvgtc0Z7g5axXYHjdU+5SVlD7xlySj8Ix+CdmlCoT9MecX4
         cUEUPIQqgP4XIP1IzbMsBKQmQn6JSBrB8Wd/0LyBK3dI85OV4ta4KCvUMvSQUVOJ0Avm
         hGLKMR3p5euiHEr0mQfZsA9q2dg26XdJpnWgXsyitqJGJ1t6kedV6anf+7hMxr3spnJw
         AGyrJFet07HJ4htYY3RcXLEulY51AhZTqU3vAJfPxqbl7XNdKC9Hh2J25VUjXUD0Bb5D
         +tdUc4PSo0eDtry5HKdngtnOoCTxKkvfoJyJDfsBV7uuL7nV5R4/INhV6kNAKE3bwfL7
         pLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296038; x=1774900838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQ8copWglYcnUema9iBAEOcgIflx/g44hA8TLhWW+AM=;
        b=celxkc6Lf6kJM2AFynRQLuiPlBD1gnQZgJcwK7a9FuccTEQwLNOYfo14kzngh9VFbY
         BdvHRW9qZl/ffy2ks73AJoCNokDJuBXDqXAIMAqYEk1gJx2J+r8qurSPuq+bp47cidqb
         uj5HPQ8jQhthZ35qc5NwE1WwW6hOdBxln+T9XyJ/zrXxgfaq5SfEyZEyVwP/0lWfb5B5
         m0P/ED21SfDPITsH2atoeQU4VxBenFevu8/FmOM1qItOLdjRSAQkE4fy98jVMjA3/iTC
         G0UCfu5WG54YHZuSbxZioBGBmRgU2Y4c54/P5wORhDbb7dCA20kqxYc7TWNSWK8XTtEa
         SNMg==
X-Gm-Message-State: AOJu0YweZ6+WKzrWgjq/+vFyWL/TZHNakYCL4LrHvULbrkLfPfKu+2oc
	BNiwkW2BBej9usm0bo6yqdC0bzuzgM4gDd+AEeQXzx16Y57j3UJGuH/8gEjo25e79uUOpcQKbno
	I7xA+LslIWpK4p9gwh/STbsIYNu7q6G8=
X-Gm-Gg: ATEYQzxs8yyNM3zmHYM30aCQ4wJ3rlCt2xeXAYDk8tCSJFo2D47ur1oeJjWpK3gSG9U
	pxbCXMgPaBrlST6R/5K3pEvQ/KKzODncO2N++UEfb1lZhGt2hUhaie0YFcu0IOnbfe6LOjUemwU
	zefLRaO+zGa7cHrng9tXGazECRlCepg4ffz0Vs8KxAQzPVBuyAGRbYXqsZaJZfUWlcZ4KM+mxJC
	6zcZEGAdtvaAEI2SJpUhM7d0qCpeVqcd/9KjJr6GhWYCOns0aIPVAwKmFJiI0XvS9nkKawEMEcM
	QvQ9npdz
X-Received: by 2002:a4a:e847:0:b0:67b:dd09:bc5a with SMTP id
 006d021491bc7-67c22bd0bc9mr10395221eaf.8.1774296038134; Mon, 23 Mar 2026
 13:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260321185219.1746245-1-f_l_k@t-online.de> <20260321185219.1746245-2-f_l_k@t-online.de>
In-Reply-To: <20260321185219.1746245-2-f_l_k@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 24 Mar 2026 09:00:26 +1300
X-Gm-Features: AQROBzBeorksTilZNwwLq-LUcia4UEp5ngPxqNGYAHwdqulF8pXb997_YP_C0eA
Message-ID: <CADySD0H7V_wRJmWDb1=YGtrhXAgaeFwXNiXKsdP1eGfNDOC7hA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 2/2] libsdl3-mixer: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 20:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125529

On Sun, Mar 22, 2026 at 7:52=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> libsdl3-mixer has initially released
>
> - binaries in wavpack-bin are only needed at runtime but cmake checks
>   for them during compilation and fails because they are (presumably
>   intentionally) not present in the target sysroot. Workround this issue
>   by touching the necessary files to please cmake.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libsdl3/libsdl3-mixer_3.2.0.bb            | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.=
bb
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
> new file mode 100644
> index 0000000000..8540ec55fc
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Provides decoding of many popular audio file formats, mixin=
g, various DSP processing effects and positional audio"
> +LICENSE =3D "Zlib"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Ddf8f4d887d3997f6e9cf81bb7=
f43dbf7"
> +
> +DEPENDS =3D "libsdl3"
> +
> +SRC_URI =3D "git://github.com/libsdl-org/SDL_mixer.git;protocol=3Dhttps;=
branch=3Drelease-3.2.x"

can please also include tag=3Drelease-${PV} in the SRC_URI

> +SRCREV =3D "cedfeef30e93db35eee6b25759117da63f8e5a4f"
> +
> +inherit cmake pkgconfig
> +
> +PACKAGECONFIG ?=3D "flac opus wave vorbis"
> +PACKAGECONFIG[opus] =3D "-DSDLMIXER_OPUS=3DON -DSDLMIXER_OPUS_SHARED=3DO=
N, -DSDLMIXER_OPUS=3DOFF,opusfile"
> +PACKAGECONFIG[vorbis] =3D "-DSDLMIXER_VORBIS_VORBISFILE=3DON -DSDLMIXER_=
VORBIS_STB=3DOFF -DSDLMIXER_VORBIS_TREMOR=3DOFF, -DSDLMIXER_VORBIS_VORBISFI=
LE=3DOFF -DSDLMIXER_VORBIS_STB=3DOFF -DSDLMIXER_VORBIS_TREMOR=3DOFF,libvorb=
is"
> +PACKAGECONFIG[flac] =3D "-DSDLMIXER_FLAC_LIBFLAC=3DON -DSDLMIXER_FLAC_LI=
BFLAC_SHARED=3DON, -DSDLMIXER_FLAC_LIBFLAC=3DOFF,flac"
> +PACKAGECONFIG[xmp] =3D "-DSDLMIXER_MOD=3DON -DSDLMIXER_MOD_XMP=3DON -DSD=
LMIXER_MOD_XMP_SHARED=3DON, -DSDLMIXER_MOD=3DOFF,libxmp,libxmp"
> +PACKAGECONFIG[fluidsynth] =3D "-DSDLMIXER_MIDI=3DON -DSDLMIXER_MIDI_FLUI=
DSYNTH_ENABLED=3DON -DSDLMIXER_MIDI_FLUIDSYNTH_SHARED=3DON, -DSDLMIXER_MIDI=
=3DOFF,fluidsynth,fluidsynth-bin"
> +PACKAGECONFIG[wave] =3D "-DSDLMIXER_WAVE=3DON -DSDLMIXER_WAVPACK=3DON -D=
SDLMIXER_WAVPACK_SHARED=3DON, -DSDLMIXER_WAVE=3DOFF,wavpack,wavpack wavpack=
-bin"
> +PACKAGECONFIG[mpg123] =3D "-DSDLMIXER_MP3 -DSDLMIXER_MP3_MPG123_SHARED=
=3DON -DSDLMIXER_MP3_MPG123=3DON, -DSDLMIXER_MP3=3DOFF,mpg123"
> +
> +do_configure:prepend() {
> +       touch ${STAGING_BINDIR}/wavpack
> +       touch ${STAGING_BINDIR}/wvunpack
> +       touch ${STAGING_BINDIR}/wvgain
> +       touch ${STAGING_BINDIR}/wvtag
> +}
> +
> +FILES:${PN} +=3D "${datadir}/licenses"
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125466): https://lists.openembedded.org/g/openembedde=
d-devel/message/125466
> Mute This Topic: https://lists.openembedded.org/mt/118438276/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

