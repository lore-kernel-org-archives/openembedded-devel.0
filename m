Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE096C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 00:36:05 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.77559.1738542963050816223
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 16:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MGBqsjSl;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2addd5053c0so2002499fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 16:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738542962; x=1739147762; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAsPboYZSzQkyr4E5s5buKjOJJYzQVkB7oKPq1+23TA=;
        b=MGBqsjSl3tYznu/GVeLExWCRFE9CZZB6oUpRNEt7qDZt583gQkDWn9myKMgIN2kFj9
         NPX7k7Trk483+swRN9OXHH2lQc6V9V48SbqydXL1LyJY3TpEvtVoDRA5zoVIcX3qKGOs
         /7B8G1gzPHmWRCGEnX1YUP+RrQG7wnzvbogATiE+WzpK5kiiI4E2+L7oFwaT0IlG0n5h
         3wVsSPE3ve+L+fTkPk7rBj/rAU2PwJAit1irqYh/5/ucqtpTVsIU0xarnnj5z28xloei
         79AoMuX+M7OYEPgzkO5rd4E9PyHNBzbbOUup/f/D4+g+h8PMpfBMMNSNELkLxST/BF9a
         MIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738542962; x=1739147762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAsPboYZSzQkyr4E5s5buKjOJJYzQVkB7oKPq1+23TA=;
        b=FESw88AVSdTJ8z4Nt8bCOp5RPh+3aY/3U5uwbdgb/5AsFLewsoqYHYhZlYy0PuBWcQ
         Fch3uW/ymgU07ze2ZRYb+ahw+USVxBKFIXWriWDWaVR29AdEoAZgnCcIfb6wpXlqPc4A
         i49AF6Px4lsYjRXeJiytKP2PFFQ7hrEmKs8WIwjo9m8TPxWv5DwxeqVoSDayXHZoiqIL
         0YI5airLspMRZTz5JXNUPMHno9aHiXz/n3ys4ff/yX3ZvVRUNkV8j61mhWAtjM4cO6+U
         KOhlIIHrNc87u4hKjcDsKG1SvvrbGWjcsWU2Y4J1vtWJotbjGiyrThzgUhGgumcz+lhN
         C5FA==
X-Gm-Message-State: AOJu0YxZBntm6RTghf3o3NgJT69dxGY06Ign9S6r0sve3JSU3RG56F84
	w+iN+RZv40RtL4Rj2aBAWSRhpUH9v7swdal0JeIR855CpwdIQ3Wg62q+ecL/Z6GMCDyuhwFAUkA
	clbsCKGU1NmnZQX8BafsN3hTzZZw=
X-Gm-Gg: ASbGnctAyF2sHxT+DCeRvp9N31cTWiy7WYT9oY0k2CsMizZ1U03+50iRZAHW0u0vBLk
	zdnTXmJq6bcTsVh1WFKD0snc/tbc6PcCcXBDH2uesylKECITEUvOhJPSb4p1yJ2GQGCSq0rE=
X-Google-Smtp-Source: AGHT+IH2HZ8VjFqVjxGAG7SMZ/hDxbM+liKaNRWKP+RSx2c1apWehnUNRQD1xausxkt8P1UzXIvhkDApPWxTuYkei4c=
X-Received: by 2002:a05:6871:2101:b0:29e:5522:8eea with SMTP id
 586e51a60fabf-2b32f47781amr11504122fac.38.1738542962306; Sun, 02 Feb 2025
 16:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20250202213910.284312-1-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Feb 2025 16:35:36 -0800
X-Gm-Features: AWEUYZnRUgJrR5FP0fKyuCKTDrN4Bv2Tvv9dyIMWddq3s1_HPLSfpEKliye-JJQ
Message-ID: <CAMKF1srD+9NqL9ntuMrGDa3ys_Gn3YnqazO_7KWb8cTnwk1CHQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/8] protobuf: remove unneeded atomic linker flag
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 00:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115229

On Sun, Feb 2, 2025 at 1:40=E2=80=AFPM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> This is handled in protofuf cmake since 3.15:
> https://github.com/protocolbuffers/protobuf/commit/55ed1d427ccc0d20092774=
6329ac9b811dee77b9
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> index 89e1071b59..efd70d6474 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> @@ -115,9 +115,3 @@ RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('=
PACKAGECONFIG', 'python', 'py
>  MIPS_INSTRUCTION_SET =3D "mips"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> -
> -LDFLAGS:append:arm =3D " -latomic"
> -LDFLAGS:append:mips =3D " -latomic"
> -LDFLAGS:append:powerpc =3D " -latomic"
> -LDFLAGS:append:mipsel =3D " -latomic"
> -LDFLAGS:append:riscv32 =3D " -latomic"

They were needed with clang IIRC, does it work without it now ?

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115220): https://lists.openembedded.org/g/openembedde=
d-devel/message/115220
> Mute This Topic: https://lists.openembedded.org/mt/110959917/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

