Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E987C531FC
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 03:35:19 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31362.1771558510847924857
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 19:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GjFtWARI;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d4bd4db87aso1121642a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 19:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771558510; cv=none;
        d=google.com; s=arc-20240605;
        b=EeTCDDXsRUJhEM9vAQBO/aIvXy0SifO55X4lCc1Df7yt5lQ3DJD7U2qHlJcOeMmuEF
         +ynWPJjADBXSKIIWKo2JdJceE2Rd1WpRgUL2rr4m8nAyO1eOo8885cVxd9K6AarSZ5+c
         mMtliGjNcHDU5rMwFCcnHknpZloVyzXCeunlJEl2rinceWgy+38uUADzZ8h788K3Al4p
         PCzVtIOX1k5gQYlIWE7qkwSHbghCDUe+xWf3FsrJMk9g9H/LAAuubMQaoUiRkqUvI7mC
         3ISqOx/ZSGesOMini+Rq1MpW1pEI/zCWapIhO4QquBrqC6cXnRJI4gDXrk8KGnplye1v
         auJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=anlyW0WZpS1xx62JJtIU9gWYg7v5Yhl7auw1ktIz/Us=;
        fh=1F/KlRuiAPiAsKdrSnI65aEUZ1bE3uTgdbCP6boSjYc=;
        b=WemUfnC72gJGzse9sX0rcX4YHvtYTRVEKBXahvdwgQce5gIIp/Gg98WHLSvoDy7cUd
         uf4i73eRh3CSpskiG5pbr6lin4ySxi8Dx3FltY2VBSJzw/HzlXaMMq/b6zs84vy+AkyJ
         ZetNWmfzm4qbEEkIrnqPeC9ZbVEKQkVJbFOpYJ7RJRV98zMrNJidxfAOqKTLvsxsFuMZ
         FpHtPlW3D8Uzys2uRtg5ghnSZofSPl115miHVZNgrM5N2x9QsKKppySUbxBXBFmQl6Fj
         h59KnKzCNChh5SlE3URsRbKZL/PHXRdIPjaIOqAiZUu23I0DgWn6Y3VALptPKkbvbr4A
         8M9w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771558510; x=1772163310; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anlyW0WZpS1xx62JJtIU9gWYg7v5Yhl7auw1ktIz/Us=;
        b=GjFtWARIzhGpeprfA10riY2lfJXmo1KtDvmv0LtUouwXnIQYlQQireGm/FQlNCpf4h
         YiKbcgu//AxGb964haQvmwr8eompsUMrt436wyMbOf5oAMxiKXyGOWai7EuDgBH4n++9
         s3yFSvOTn97K1GZhTYThepOoAnuFw0KGMY5KWu09K47NwQ7nTq7AsSyLt0YJ7lQoITr/
         wssvbvl/688rM2yP2qN7Tjtg1u/4k42qY3b7aOaWI8n/nROhmiqxwO+QrmhXepdXxLUU
         vCXbK1nJ6aHaMcW/MbcuFg0wi8J518OmV/0s8jJ/oLuzOYaciP1mk/ulRYRLzFpHoC/Y
         gEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771558510; x=1772163310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=anlyW0WZpS1xx62JJtIU9gWYg7v5Yhl7auw1ktIz/Us=;
        b=edcGSxEYoSTsKwKBdLR3WtNmeqcdf13cPzcQs7hAkYURXiM7fFftlWx2nhQKQnppuh
         OTrqdlsYtAOU+NHk5p63UCwynR2EKhJGADn2Bu+F3leC8S7OFeAfViq6+8kG0cI6tiaV
         +PM7N3eM0L4FXcyT4374v9kkBHKbifVzN1yK58BUNP6FXPWe0KLyvaAI8DbHY9JLc2dq
         VF87KxiYRDYBAzI+FGv/Sj8pVY2t+drHcB1hdj/HwGhm+umTiGHWyuU1teOsyHD+r2IL
         F6mlb/WqyFH27H5z8Bt7iAvish3tFaEfPaJTljcEHI81Enkh/cOvMcxxocDz84RsvL7X
         gDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKvhMXa5VRycmHNqLwqb8yj5TRoQQhN9tUnCdpN70KaQLzFi0bQ/kPMIiI52gdwZYoNB0elBp/n2bw/Czvk+bBNtQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwN/ocWejNtsQcide2OWaDx+bW9/HpTMxBvhnDobHBl7ozMsT30
	EiKAZ7UMm7d/c0yT0oTfLW7PoxqwaCpXzdxeGuur2bWqa22ojRfzMaBYJ7OXE4ZiTOv5umnMIN1
	w4mn+SvcmrUh6qBiXy1TnXf7TcXBFZ+s=
X-Gm-Gg: AZuq6aJwNFXBtXcf9ufTAPu2x0hGM6XP2RQa+3BDsfhpd0pvtk9FECoZaMIXVC7aOmp
	eqx7HNj6YAw5XElvy1gEfaHTZ4WMFPWrSbtQmpl2lJOfwHpIUorgeITkOzt5SkZdG+L04XHMMVH
	gJkWG7LzI0swYyxZJ3thLhUPE6YTtWq9Qp4SFHFskf4sCP9HFJSHNI5J9dNtCWZbwxFcVNdUbRs
	U1mNEXWYjeH/spMc9h/hv5b/vCzd1wQ+4PMey9/xEIE7obsCkWANCuaI7JzJfcJ1zjFCjp267R4
	JJnBVxSD
X-Received: by 2002:a05:6820:2216:b0:676:aeb2:63f with SMTP id
 006d021491bc7-679a71e1c91mr4053071eaf.33.1771558509987; Thu, 19 Feb 2026
 19:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
 <20260211120025.4190831-8-ankur.tyagi85@gmail.com> <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
 <DGISHQI5DDPV.2BHEPKY23Q3VH@smile.fr>
In-Reply-To: <DGISHQI5DDPV.2BHEPKY23Q3VH@smile.fr>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 20 Feb 2026 16:34:59 +1300
X-Gm-Features: AaiRm52vWyZFv4rMxSRKmh6auEFNKowQR3cmPp59cTIuCUiTk-_kfRRdsoQ_EHM
Message-ID: <CADySD0FrCrza-8-Qvv8dWA9rXFkv=OkgNwO-Pof8efCrEWdXgg@mail.gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update SRC_URI
To: Yoann Congal <yoann.congal@smile.fr>
Cc: anuj.mittal@oss.qualcomm.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 03:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124520

On Thu, Feb 19, 2026 at 9:19=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> On Thu Feb 19, 2026 at 4:04 AM CET, Anuj Mittal via lists.openembedded.or=
g wrote:
> > On Wed, Feb 11, 2026 at 8:01=E2=80=AFPM Ankur Tyagi via lists.openembed=
ded.org
> > <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>
> >> The previous one became inaccessible.
> >>
> >> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> ---
> >>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.=
bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >> index f172168335..a90a33ada4 100644
> >> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >> @@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
> >>  HOMEPAGE =3D "http://tomoyo.sourceforge.jp/"
> >>  SECTION =3D "System Environment/Kernel"
> >>
> >> -SRC_URI =3D "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-202109=
10.tar.gz"
> >> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
> >
> > How do we know it's -20210910?
>
> Also, please put add a downloadfilename containing "${PV}". If not, it
> will break the mirroring test at the next upgrade.
>
> Thanks!

Thanks Anuj, Yoann.

Let's drop this patch for now as existing SRC_URI seems to be working again=
.
I will monitor the situation and send a new patch if needed.

cheers
Ankur

>
> >
> >>  SRC_URI[sha256sum] =3D "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd=
42fd311c4022b78010a"
> >>
> >> +PV .=3D "-20210910"
> >>  S =3D "${UNPACKDIR}/${BPN}"
> >>
> >>  LICENSE =3D "GPL-2.0-only"
> >>
> >>
> >>
>
>
> --
> Yoann Congal
> Smile ECS
>

