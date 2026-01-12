Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E4ED25056
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:40:22 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29056.1768207218071174804
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V7o2FskN;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-45a85a05a70so1049007b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 00:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768207217; x=1768812017; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOGAk7lXG2ZANmsCXZ4FtcERT+n3zaEa9sFblsCBGR8=;
        b=V7o2FskNCAjmtYdOwI6iKwni+KXsTGiBi2E7z8LYeZ6t2szzn0ATPqRna3WZt/SFtV
         xjEzdwG4AMTgH8fOxiTbn2Lyac19Ff0ob9r96u4u7rjthi6gka2g182JfRJQheUCgDZ5
         BpWaUwcwwlQY2cS+6PSeh6boeoR480222hTsepZ6nHha7KpuLwj79cWzDvu6/HxaMGg4
         lk297WELxqqHe/X7tMC0xJB6aM4dIUtXGMxhfmCG8I/1NvIeQ1Ch1Gp7Pf4FDo/9m68b
         Mzqw5rn74ok+w/1W/Jl3gF664rvLpkc/eA+vOopJjQLcem186nH0b/i5BkS6A5jip+eP
         vpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207217; x=1768812017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOGAk7lXG2ZANmsCXZ4FtcERT+n3zaEa9sFblsCBGR8=;
        b=gpNrylVOB4brCWPUBVXfd8T3K1UOf5RILlk9Xt87GF0uKwRPxfKfGJ2jBRgtXO2E16
         3lPTqT+xQ1UgAyCk5zzBz9+B9JNuRgxEbMd0Gijj0uljHt/z1ik8DS6R+bujB0BZNj3V
         0tvTOktN1nn7E0+nsaor83bi94VDdfu536Zr7xvWEqOr8HRwUf4ZXOJZQJglemGLA2w9
         vWhWOtbUg3gqJfLApuJUBXgVPPPl9k9Sb4VueWoXD+MsontvOoxURzRX4ETCNv83h4km
         rrVdoTWsRQcnaOPXn786u6OoJ4us3miOGvsZxZf14m4JxnvW9RAxgyspWGGkmMnrokzP
         muzg==
X-Gm-Message-State: AOJu0YyuPzbUmDCKrdQm1Wpvg8NEY9ScY6rQHjkNY8AGsRvBNboyZk7g
	MiBmai6eBxBcdPZBxgqKBj8+V4T3sNeMci6/y+JtGFLUBYezSbDSbGZke1Jk/JdhfIeZMuNFp6F
	MMc2VJ1MGF6w5uOyLC+Pc1Hgk/tVETlw=
X-Gm-Gg: AY/fxX71fHVgl0h+0MioKlE4D/lEYAqefarhI5f4EHEMs3XJB45uzOh+u/apebGObzM
	ATb1G4D26q0rCEwNup4zvZRTV3YIH+lCOrI4fEMVtrPLoKjhnuduJPWc9rhWzzCxGW+shRXg/Y9
	hHUN6+M/6emiIrkTpv98SxOgDWnnOtOEKa3VPo80L4Ox+3Okl8UlVH+riL5TscHPYUSqvBJIzuV
	rrg3QiPk0lJJyZ4+P/tOj/LRjq7VJlHbjqyrzVvpm48jV5vO9kGc6vjE20GTneGnhtHRb1j
X-Google-Smtp-Source: AGHT+IHkP96vN0ileiVtWgkMVl1QyHRs+cz+Qpe1H3SHHF85iDrzncwUo8+BCHF7Khc6NmI32ocHoOxy8v3TkeTGvVI=
X-Received: by 2002:a05:6808:169e:b0:450:c0ef:8092 with SMTP id
 5614622812f47-45a6bebf3admr8124820b6e.34.1768207217185; Mon, 12 Jan 2026
 00:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20260110103716.3470419-1-ankur.tyagi85@gmail.com> <7f535a1b-9fd8-4966-b521-d77790726916@gmail.com>
In-Reply-To: <7f535a1b-9fd8-4966-b521-d77790726916@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 12 Jan 2026 21:40:06 +1300
X-Gm-Features: AZwV_QhhcL4J-TJqCrRS5zUntqUuqSgQt6yq4lCbDb2Qo2OOQvfN0TXWdvhyRkU
Message-ID: <CADySD0Gmyv-+ho33kNzTaVnvq0wBAFp6mmRa1NZ9r+TBdVS66g@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/5] freerdp3: ignore CVE-2025-68118
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123369

On Mon, Jan 12, 2026 at 7:08=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> At this time this CVE is both ignored and patched[1] - I think the patch
> could be dropped.

Agree, thanks for sorting this out.

>
> [1]:
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Danujm/=
scarthgap&id=3D19d7eedf67ea1b8fe27790366d98a7e888cb839a
>
> On 1/10/26 11:37, Ankur Tyagi via lists.openembedded.org wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Only affects Windows and can be ignored.
> >
> > Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68118
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-o=
e/recipes-support/freerdp/freerdp3_3.4.0.bb
> > index b9ec75236b..6e27efb5ce 100644
> > --- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
> > +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
> > @@ -74,3 +74,5 @@ do_configure:append() {
> >  }
> >
> >  FILES:${PN} +=3D "${datadir}"
> > +
> > +CVE_STATUS[CVE-2025-68118] =3D "not-applicable-platform: only affects =
Windows"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#123320): https://lists.openembedded.org/g/openembed=
ded-devel/message/123320
> > Mute This Topic: https://lists.openembedded.org/mt/117189431/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

